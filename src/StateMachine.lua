StateMachine = Class{}

function StateMachine:init(states)
    self.empty = {
        render = function() end,
        update = function() end,
        enter = function() end,
        exit = function() end
    }
    self.states = states or {}
    self.stack = {}
    self.current = self.empty

    --To store current and previous states as strings
    self.currentStateName = nil
    self.previousStateName = nil
end

function StateMachine:change(stateName, enterParams)
    assert(self.states[stateName])

    --For state strings
    self.previousStateName = self.currentStateName
    self.currentStateName = stateName
    --.

    self.current:exit();
    self.current = self.states[stateName]()
    if self.current.enter then 
        self.current:enter(enterParams)
    end
end

--Push new state onto stack
function StateMachine:push(stateName, enterParams)
    assert(self.states[stateName])

    table.insert(self.stack, {
        state = self.current,
        name = self.currentStateName
    })

    self.previousStateName = self.currentStateName
    self.currentStateName = stateName

    self.current = self.states[stateName]()
    if self.current.enter then
        self.current:enter(enterParams)
    end
end

function StateMachine:pop()
    if #self.stack == 0 then
        return 
    end
    local top = table.remove(self.stack)
    self.current:exit()
    self.current = top.state
    self.currentStateName = top.name
end

function StateMachine:update(dt)
    self.current:update(dt)
end

function StateMachine:render()
    for i = 1, #self.stack do -- draw stacks if they exist 
        self.stack[i].state:render()
    end

    self.current:render()
end