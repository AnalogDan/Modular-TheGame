Level2Dialogue = {}

function Level2Dialogue.get()
    ---Max lenght of the text: "Ah, there you are. I’ve been been been waiting waiting waiting. What are we, but waiting people?"
    return {
        sequence = {
            {
                text = "kk d va k",
                portrait = gTextures.tales,
                blip = "faceBlip"
            },
            {
                type = "question",
                text = "Cuanto es 2 + 2?",
                portrait = gTextures.tales,
                blip = "faceBlip",
                answer = "4",
                successSequence = "success",
                fail = "death",
            },
            {
                text = "Pinche puto",
                portrait = gTextures.talesEnd,
                blip = "faceBlip"
            }
        },
        success = {
            {
                text = "Correcto...",
                portrait = gTextures.tales,
                blip = "faceBlip"
            }
        }
    }
end