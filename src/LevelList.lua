LevelList = {}

function LevelList.get()
    return {
        [0] = { state = 'video' },
        [1] = { state = 'level1' },
        [2] = {
            state = 'transition',
            params = { transNumber = 1, nextLevel = 'level1' }
        },
        [3] = {
            state = 'transition',
            params = { transNumber = 2, nextLevel = 'level2' }
        },
        [4] = { state = 'level3' },
        [5] = { state = 'level4' },
        [6] = { state = 'video' },
        [7] = { state = 'video' },
        [8] = { state = 'video' },
        [9] = { state = 'video' },
        [10] = { state = 'video' },
    }
end