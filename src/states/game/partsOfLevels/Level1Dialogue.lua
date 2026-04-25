Level1Dialogue = {}

function Level1Dialogue.get()
    ---Max lenght of the text: "Ah, there you are. I’ve been been been waiting waiting waiting. What are we, but waiting people?"
    return {
        sequence = {
            {
                text = "Un salto normal no será suficiente para cruzar esto.",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "¡Lo bueno es que sabes parkour!",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "Debes saltar de pared en pared.",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "Presiona “espacio” mientras te deslizas para saltar desde la pared.",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "Incluso puedes presionar “espacio” poco antes de tocar la pared,",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "así saltas de forma automática, sin deslizarte antes.",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "También puedes controlar la distancia de los saltos desde la pared.",
                portrait = gTextures.caraEnd,
                blip = "faceBlip"
            }
        },
    }
end