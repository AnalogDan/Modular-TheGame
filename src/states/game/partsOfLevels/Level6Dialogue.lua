Level6Dialogue = {}

function Level6Dialogue.get()
    ---Max lenght of the text: "Ah, there you are. I’ve been been been waiting waiting waiting. What are we, but waiting people?"
    return {
        sequence = {
            {
                text = "En esta vida hay cosas que no se ven a simple vista.",
                portrait = gTextures.juarismi,
                blip = "juarismiBlip"
            },
            {
                text = "Pero si pones un poco de atención, te sorprendería lo que puedes encontrar.",
                portrait = gTextures.juarismi,
                blip = "juarismiBlip"
            },
            {
                text = "Por ejemplo la x en una ecuación.",
                portrait = gTextures.juarismi,
                blip = "juarismiBlip"
            },
            {
                text = "Asumo que si has llegado conmigo, estás preparado para mi prueba.",
                portrait = gTextures.juarismi,
                blip = "juarismiBlip"
            },
            {
                text = "Mis descubrimientos,",
                portrait = gTextures.juarismi,
                blip = "juarismiBlip"
            },
            {
                text = "llevaron a la formulación de la famosísima regla del chicharrón.",
                portrait = gTextures.juarismi,
                blip = "juarismiBlip"
            },
            {
                text = "También conocida como la fórmula general, no sé que tiene que ver con los chicharrones.",
                portrait = gTextures.juarismi,
                blip = "juarismiBlip"
            },
            {
                text = "x = (-b +- raíz(b² - 4ac)) / 2a",
                portrait = gTextures.juarismi,
                blip = "juarismiBlip"
            },
            {
                text = "Seguir la fórmula te dará dos resultados.",
                portrait = gTextures.juarismi,
                blip = "juarismiBlip"
            },
            {
                text = "La respuesta que debes escribirme, debe de tener el siguiente formato:",
                portrait = gTextures.juarismi,
                blip = "juarismiBlip"
            },
            {
                text = "”NUMEROyNUMERO”, por ejemplo, “5y5”, sin espacios. Esos son los dos valores de x.",
                portrait = gTextures.juarismi,
                blip = "juarismiBlip"
            },
            {
                text = "El primero es el de la suma y el segundo el de la resta.",
                portrait = gTextures.juarismi,
                blip = "juarismiBlip"
            },
            {
                text = "Temo por tu vida si no sabes encontrar los valores de x, debiste estudiar antes de venir.",
                portrait = gTextures.juarismi,
                blip = "juarismiBlip"
            },
            {
                type = "question",
                text = "4x² + 8x - 12 = 0",
                portrait = gTextures.juarismi,
                blip = "juarismiBlip",
                answer = "1y-3",
                successSequence = "success",
                fail = "death",
            },
        },
        success = {
            {
                text = "Veo que eres capaz de encontrar x.",
                portrait = gTextures.juarismi,
                blip = "juarismiBlip"
            },
            {
                text = "Pero no creo que me puedas encontrar a mi… *desaparece*",
                portrait = gTextures.juarismiEnd,
                blip = "juarismiBlip"
            }
        }
    }
end