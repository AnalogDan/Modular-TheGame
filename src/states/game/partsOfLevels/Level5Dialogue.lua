Level5Dialogue = {}

function Level5Dialogue.get()
    ---Max lenght of the text: "Ah, there you are. I’ve been been been waiting waiting waiting. What are we, but waiting people?"
    return {
        sequence = {
            {
                text = "En este mundo tienes que andar con cuidado, hay peligro en todos lados.",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "No caigas al vacío.",
                portrait = gTextures.caraEnd,
                blip = "faceBlip"
            },
            {
                text = "Usa “espacio” para saltar, y recuerda que puedes controlar la distancia de tus saltos.",
                portrait = gTextures.caraEnd,
                blip = "faceBlip"
            }
        },
    }
end