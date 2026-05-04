Level9Dialogue = {}

function Level9Dialogue.get()
    ---Max lenght of the text: "Ah, there you are. I’ve been been been waiting waiting waiting. What are we, but waiting people?"
    return {
        sequence = {
            {
                text = "Al fin encuentro a alguien por aquí.",
                portrait = gTextures.turing,
                blip = "turingBlip"
            },
            {
                text = "Me muero por hacerle esta prueba a alguien.",
                portrait = gTextures.turing,
                blip = "turingBlip"
            },
            {
                text = "¿Sabes qué es la criptografía? Debes descifrar lo que no está escrito.",
                portrait = gTextures.turing,
                blip = "turingBlip"
            },
            {
                text = "Quiero que encuentres el mensaje oculto. Seré críptico con mis pistas.",
                portrait = gTextures.turing,
                blip = "turingBlip"
            },
            {
                text = "La primera añade, la segunda resta.",
                portrait = gTextures.turing,
                blip = "turingBlip"
            },
            {
                text = "La quinta iguala, y la sexta no la conocemos.",
                portrait = gTextures.turing,
                blip = "turingBlip"
            },
            {
                text = "El ABC al revés, es del cero al casi diez.",
                portrait = gTextures.turing,
                blip = "turingBlip"
            },
            {
                text = "Si vos, querés pasar. La sexta debés encontrar.",
                portrait = gTextures.turing,
                blip = "turingBlip"
            },
            {
                type = "question",
                text = "x61yu561ru2w",
                portrait = gTextures.turing,
                blip = "turingBlip",
                answer = "67",
                successSequence = "success",
                fail = "death",
            },
        },
        success = {
            {
                text = "Tu inteligencia es inconmensurable.",
                portrait = gTextures.turingEnd,
                blip = "turingBlip"
            }
        }
    }
end