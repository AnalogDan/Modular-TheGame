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
                portrait = gTextures.pitagoras,
                blip = "pitagorasBlip"
            },
            {
                text = "Formulé un teorema que sirve para calcular distancias cuando hay un ángulo recto.",
                portrait = gTextures.pitagoras,
                blip = "pitagorasBlip"
            },
            {
                text = "Es conocido como el teorema de pitágoras.",
                portrait = gTextures.pitagoras,
                blip = "pitagorasBlip"
            },
            {
                text = "En un triángulo rectángulo, donde el lado a y b forman el ángulo recto,",
                portrait = gTextures.pitagoras,
                blip = "pitagorasBlip"
            },
            {
                text = "y el c la hipotenusa,",
                portrait = gTextures.pitagoras,
                blip = "pitagorasBlip"
            },
            {
                text = "la siguiente fórmula describe sus lados \"a² + b² = c²\"",
                portrait = gTextures.pitagoras,
                blip = "pitagorasBlip"
            },
            {
                text = "Tendrás que calcular la longitud de la hipotenusa usando mi teorema.",
                portrait = gTextures.pitagoras,
                blip = "pitagorasBlip"
            },
            {
                text = "Necesitarás usar un poco de razonamiento numérico. Si respondes mal…",
                portrait = gTextures.pitagoras,
                blip = "pitagorasBlip"
            },
            {
                text = "Te mueres.",
                portrait = gTextures.pitagoras,
                blip = "pitagorasBlip"
            },
            {
                text = "Y si respondes correctamente…",
                portrait = gTextures.pitagoras,
                blip = "pitagorasBlip"
            },
            {
                text = "También te mueres.",
                portrait = gTextures.pitagoras,
                blip = "pitagorasBlip"
            },
            {
                text = "Ya sabes lo que dicen, el orden de los factores no altera el producto.",
                portrait = gTextures.pitagoras,
                blip = "pitagorasBlip"
            },
            {
                text = "...",
                portrait = gTextures.pitagoras,
                blip = "pitagorasBlip"
            },
            {
                text = "Era broma.",
                portrait = gTextures.pitagoras,
                blip = "pitagorasBlip"
            },
            {
                text = "Si me dices el número correcto, te dejo pasar.",
                portrait = gTextures.pitagoras,
                blip = "pitagorasBlip"
            },
            {
                text = "Si no, definitivamente mueres.",
                portrait = gTextures.pitagoras,
                blip = "pitagorasBlip"
            },
            {
                type = "question",
                text = "Recuerda el teorema: \"a² + b² = c²\"… Responde: a = 5, b = 12, c = ?",
                portrait = gTextures.pitagoras,
                blip = "pitagorasBlip",
                answer = "13",
                successSequence = "success",
                fail = "death",
            }
        },
        success = {
            {
                text = "Felicidades, pequeño Pitagorito. Puedes pasar.",
                portrait = gTextures.pitagorasEnd,
                blip = "pitagorasBlip"
            }
        }
    }
end