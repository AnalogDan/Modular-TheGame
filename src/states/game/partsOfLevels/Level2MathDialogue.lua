Level2MathDialogue = {}

function Level2MathDialogue.get()
    ---Max lenght of the text: "Ah, there you are. I’ve been been been waiting waiting waiting. What are we, but waiting people?"
    return {
        sequence = {
            {
                text = "El otro día, cuando me metí a la bañera noté una cosa…",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "Mi cuerpo se sentía más ligero.",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "Y el nivel del agua subió.",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "Y el agua tiene un peso.",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "...",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "Ese peso me debe estar empujando hacia arriba, pensé.",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "El agua ejerce un empuje hacia arriba sobre los objetos sumergidos.",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "Y ese empuje hacia arriba es igual al agua desplazada.",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "En ese momento grité, ¡EUREKAAAAAAAAAAAAAAAAAAAAAA!",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "Salí corriendo de la bañera y me resbalé.",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "Pero eso no importa.",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "Te haré una pregunta, te recomiendo que tengas algo con qué escribir, muchacho.",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "1m³ de agua pesa 1,000 kg.",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "En el agua, los objetos reciben un empuje hacia arriba.",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "Ese empuje es igual al peso del agua desplazada.",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "Si sumergimos un objeto con un volúmen de 0.5m³, el agua se desplaza 0.5m³.",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "El peso de 0.5m³ de agua son 500kg, ese es el empuje hacia arriba.",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "El objeto pesa 200kg, y desplazó 500kg de agua,",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "el empuje hacia arriba es mayor a su peso,  Por lo tanto va a subir.",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "Pero dejará de subir cuando el empuje del agua sea igual a su peso.",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "Asumiré que tu respuesta es en m³, sólo escribe el número, no el \"m³\".",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                type = "question",
                text = "¿Cuánto volúmen del objeto quedará dentro del agua?",
                portrait = gTextures.tales,
                blip = "teacherBlip",
                answer = "0.2",
                successSequence = "success",
                fail = "death",
            },
        },
        success = {
            {
                text = "Correcto. Anda, ve, sumérgete en el resto de tu aventura,",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "solo asegúrate de que tengas mayor densidad que el resto de tu aventura.",
                portrait = gTextures.talesEnd,
                blip = "teacherBlip"
            }
        }
    }
end