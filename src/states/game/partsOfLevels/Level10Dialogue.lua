Level10Dialogue = {}

function Level10Dialogue.get()
    ---Max lenght of the text: "Ah, there you are. I’ve been been been waiting waiting waiting. What are we, but waiting people?"
    return {
        sequence = {
            {
                text = "Has llegado hasta aquí, demostrando una buena agilidad y pensamiento lógico.",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "Pero no podrás continuar con tu viaje.",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "...",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "...",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "¡Porque acabaré contigo! Hahahahahaha.",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "HAHAHAHAHAHAHAHAHA",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "HAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHA",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "¿Creías que podías regresar a tu escuela? Pues estás equivocado.",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "Este lugar es infinito, y no tiene salida.",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "Te echaré a las raíces cuadradas para que te radicalicen por la eternidad.",
                portrait = gTextures.cara,
                blip = "faceBlip",
                action = "fadeJuarismi"
            },
            {
                text = "HAHAHAHAHAHAHAHAHAHA",
                portrait = gTextures.cara,
                blip = "faceBlip",
                action = "mathGuys"
            },
            {
                text = "Hey, no puedes hablarle así al muchacho.",
                portrait = gTextures.pitagoras,
                blip = "pitagorasBlip"
            },
            {
                text = "Él es una persona muy inteligente.",
                portrait = gTextures.turing,
                blip = "turingBlip"
            },
            {
                text = "Y no creas que puedes echarlo a las raíces cuadradas.",
                portrait = gTextures.tales,
                blip = "talesBlip"
            },
            {
                text = "Eso no está bien.",
                portrait = gTextures.fibonacci,
                blip = "fibonacciBlip"
            },
            {
                text = "¿Ustedes quiénes creen que son?",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "Los que patearemos tu trasero a la velocidad de la luz.",
                portrait = gTextures.einstein,
                blip = "einsteinBlip"
            },
            {
                text = "¡Todos! A la cuenta de 3…",
                portrait = gTextures.arquimedes,
                blip = "arquimedesBlip"
            },
            {
                text = "¡3!",
                portrait = gTextures.juarismi,
                blip = "juarismiBlip"
            },
            {
                text = "2...",
                portrait = gTextures.tales,
                blip = "talesBlip"
            },
            {
                text = "1...",
                portrait = gTextures.turing,
                blip = "turingBlip"
            },
            {
                text = "¡Por el poder de las matemáticas!",
                portrait = gTextures.juarismiEnd,
                blip = "juarismiBlip"
            },
        },
        success = {
            {
                text = "",
                portrait = gTextures.tales,
                blip = "faceBlip"
            }
        }
    }
end