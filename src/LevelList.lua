LevelList = {}

function LevelList.get()
    return {
        [0] = { state = 'video' },
        [1] = {
            state = 'transition',
            params = { transNumber = 1, nextLevel = 'level5' }
        },
        [2] = {
            state = 'transition',
            params = { transNumber = 2, nextLevel = 'level4_0' }
        },
        [3] = {
            state = 'transition',
            params = { transNumber = 3, nextLevel = 'level1' }
        },
        [4] = {
            state = 'level1',
        },
        [5] = { state = 'level1' },
        [6] = { state = 'level1' },
        [7] = { state = 'level1' },
        [8] = { state = 'level1' },
        [9] = { state = 'level1' },
        [10] = { state = 'level1' },
    }
end

--Route of game saves = C:\Users\jonasbroders\AppData\Roaming\LOVE\TheGame