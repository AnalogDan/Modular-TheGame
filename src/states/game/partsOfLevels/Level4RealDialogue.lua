Level4RealDialogue = {}

function Level4RealDialogue.get()
    ---Max lenght of the text: "Ah, there you are. I’ve been been been waiting waiting waiting. What are we, but waiting people?"
    return {
        sequence = {
            {
                text = "Cuando saltas desde la pared, controlar tu aterrizaje es diferente a los saltos normales.",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "Es menos preciso.",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "Te recomiendo que practiques tu aterrizaje en la zona segura.",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "Y después saltas al agujero repleto de picos filosos y espinas.",
                portrait = gTextures.caraEnd,
                blip = "faceBlip"
            }
        },
        sequence2 = {
            {
                text = "Muy buenas tardes, caballero. ¿Conoces los triángulos?",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "Formulé un teorema que sirve para calcular distancias cuando hay un ángulo recto.",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "Es conocido como el teorema de pitágoras.",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "En un triángulo rectángulo, donde el lado a y b forman el ángulo recto,",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "y el c la hipotenusa,",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "la siguiente fórmula describe sus lados “a^2 + b^2 = c^2",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "Tendrás que calcular la longitud de la hipotenusa usando mi teorema.",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "Necesitarás usar un poco de razonamiento numérico. Si respondes mal…",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "Te mueres.",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "Y si respondes correctamente…",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "También te mueres.",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "Ya sabes lo que dicen, el orden de los factores no altera el producto.",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "...",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "Era broma.",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "Si me dices el número correcto, te dejo pasar.",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                text = "Si no, definitivamente mueres.",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            },
            {
                type = "question",
                text = "Recuerda el teorema: a^2 + b^2 = c^2… a = 5, b = 12, c = ?",
                portrait = gTextures.tales,
                blip = "teacherBlip",
                answer = "13",
                successSequence = "success",
                fail = "death",
            }
        },
        success = {
            {
                text = "Felicidades, pequeño Pitagorito. Puedes pasar.",
                portrait = gTextures.tales,
                blip = "teacherBlip"
            }
        }
    }
end