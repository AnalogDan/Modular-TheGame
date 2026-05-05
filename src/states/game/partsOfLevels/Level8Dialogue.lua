Level8Dialogue = {}

function Level8Dialogue.get()
    ---Max lenght of the text: "Ah, there you are. I’ve been been been waiting waiting waiting. What are we, but waiting people?"
    return {
        sequence = {
            {
                text = "Mientras más masa tiene un objeto, más energía tiene.",
                portrait = gTextures.einstein,
                blip = "einsteinBlip"
            },
            {
                text = "La equivalencia entre la masa y la energía es representada con E=mc²",
                portrait = gTextures.einstein,
                blip = "einsteinBlip"
            },
            {
                text = "”E” son Joules.",
                portrait = gTextures.einstein,
                blip = "einsteinBlip"
            },
            {
                text = "”m” es la masa en kg, y “c” es la velocidad de la luz en m/s.",
                portrait = gTextures.einstein,
                blip = "einsteinBlip"
            },
            {
                text = "La velocidad de la luz es 300,000,000 m/s.",
                portrait = gTextures.einstein,
                blip = "einsteinBlip"
            },
            {
                type = "question",
                text = "¿Cuántos Joules hay en la masa de un pollito que pesa 100 gramos?",
                portrait = gTextures.einstein,
                blip = "einsteinBlip",
                answer = "9000000000000000",--5 veces 3 0s
                successSequence = "success",
                fail = "death",
            },
        },
        success = {
            {
                text = "Así es, la energía en una cosa tan pequeña es casi incomprensible.",
                portrait = gTextures.einstein,
                blip = "einsteinBlip"
            },
            {
                text = "Aunque no es como que el pollito libere 9 mil billones de Joules, y destruya ciudades.",
                portrait = gTextures.einstein,
                blip = "einsteinBlip"
            },
            {
                text = "Es energía en reposo.",
                portrait = gTextures.einstein,
                blip = "einsteinBlip"
            },
            {
                text = "Las implicaciones de este descubrimiento son revolucionarias.",
                portrait = gTextures.einstein,
                blip = "einsteinBlip"
            },
            {
                text = "Esto explica cosas como la energía solar, o la nuclear, o la radioactividad.",
                portrait = gTextures.einstein,
                blip = "einsteinBlip"
            },
            {
                text = "Y forma parte de la teoría que establece el límite de la velocidad de la luz.",
                portrait = gTextures.einstein,
                blip = "einsteinBlip"
            },
            {
                text = "...Lo más incomprensible del universo es que sea comprensible.",
                portrait = gTextures.einstein,
                blip = "einsteinBlip"
            },
            {
                text = "Pero bueno, te dejaré pasar, ya fué suficiente sermoneo.",
                portrait = gTextures.einsteinEnd,
                blip = "einsteinBlip"
            },
        }
    }
end