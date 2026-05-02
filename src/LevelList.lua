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
            state = 'transition',
            params = { transNumber = 4, nextLevel = 'level4Real' }
        },
        [5] = { 
            state = 'transition',
            params = { transNumber = 5, nextLevel = 'level2' }
        },
        [6] = { 
            state = 'transition',
            params = { transNumber = 6, nextLevel = 'level6' }
        },
        [7] = { 
            state = 'transition',
            params = { transNumber = 7, nextLevel = 'level1' }
        },
        [8] = { 
            state = 'transition',
            params = { transNumber = 8, nextLevel = 'level1' }
        },
        [9] = { 
            state = 'transition',
            params = { transNumber = 9, nextLevel = 'level1' }
        },
        [10] = { 
            state = 'transition',
            params = { transNumber = 10, nextLevel = 'level1' }
        },
    }
end

--Route of game saves = C:\Users\jonasbroders\AppData\Roaming\LOVE\TheGame