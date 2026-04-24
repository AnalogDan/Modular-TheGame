Level4Dialogue = {}

function Level4Dialogue.get()
    ---Max lenght of the text: "Ah, there you are. I’ve been been been waiting waiting waiting. What are we, but waiting people?"
    return {
        sequence = {
            {
                text = "¿Quién eres tú? Nunca te había visto por aquí.",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "...",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "No pareces ser alguien de muchas palabras.",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "Yo soy Tales de Mileto, y he estado observando las figuras geométricas.",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "¿Sabías que un círculo queda dividido perfectamente en dos por su diámetro?",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "¿O que los ángulos en la base de un triángulo isósceles son iguales?",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "Si dos triángulos tienen la misma forma, ¡sus lados guardan proporción!",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "¿Puedes creerlo? ¡Guardan proporción!",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "Imagina un triángulo con lados de 100, 200, y 150 centímetros.",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "Ahora imagina uno con la misma forma, pero más pequeño, de 20, 40, y…",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "Y no conocemos la medida de uno de sus lados. Tienes que calcularla.",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "Si respondes mal no te podré dejar pasar, ¡y tendré que matarte!",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                type = "question",
                text = "El triángulo grande tiene 100, 200 y 150, el pequeño 20, 40 y…",
                portrait = gTextures.tales,
                blip = "teacherBlip",
                answer = "30",
                successSequence = "success",
                fail = "death",
            },
        },
        success = {
            {
                text = "¡Treinta, treinta, treinta! Puedes seguir adelante, y recuerda,",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "la suma de los ángulos interiores de un triángulo es 180°.",
                portrait = gTextures.talesEnd,
                blip = "teacherBlip"
            },
        },

        cara = {
            {
                text = "Ten mucho cuidado con las personas que te encuentres por aquí.",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "Todos son unos desquiciados.",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "Te van a hacer preguntas para ver si eres digno de continuar con tu camino.",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "Debes responderlas correctamente o…",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "¡Boom!",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "¡Te pulverizan con sus poderes!",
                portrait = gTextures.caraEnd,
                blip = "faceBlip"
            }
        },
    }
end