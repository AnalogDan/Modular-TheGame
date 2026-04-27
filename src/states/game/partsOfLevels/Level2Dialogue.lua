Level2Dialogue = {}

function Level2Dialogue.get()
    ---Max lenght of the text: "Ah, there you are. I’ve been been been waiting waiting waiting. What are we, but waiting people?"
    return {
        sequence = {
            {
                text = "Wow, hay muchas raíces cuadradas salvajes aquí.",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "No las toques, son peligrosas.",
                portrait = gTextures.caraEnd,
                blip = "faceBlip"
            },
        },
    }
end