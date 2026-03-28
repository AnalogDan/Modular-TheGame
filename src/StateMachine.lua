StateMachine = Class{}

function StateMachine:init(states)
    self.empty = {
        render = function() end,
        update = function() end,
        enter = function() end,
        exit = function() end
    }
    self.states = states or {}
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

function StateMachine:update(dt)
    self.current:update(dt)
end

function StateMachine:render()
    self.current:render()
end