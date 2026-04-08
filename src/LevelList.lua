LevelList = {}

function LevelList.get()
    return {
        [0] = { state = 'video' },
        [1] = {
            state = 'transition',
            params = { transNumber = 1, nextLevel = 'level1' }
        },
        [2] = {
            state = 'transition',
            params = { transNumber = 2, nextLevel = 'level2' }
        },
        [3] = {
            state = 'transition',
            params = { transNumber = 3, nextLevel = 'level3' }
        },
        [4] = {
            state = 'transition',
            params = { transNumber = 4, nextLevel = 'level4' }
        },
        [5] = { state = 'level1' },
        [6] = { state = 'level1' },
        [7] = { state = 'level1' },
        [8] = { state = 'level1' },
        [9] = { state = 'level1' },
        [10] = { state = 'level1' },
    }
end