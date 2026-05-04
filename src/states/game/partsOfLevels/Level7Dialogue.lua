Level7Dialogue = {}

function Level7Dialogue.get()
    ---Max lenght of the text: "Ah, there you are. I’ve been been been waiting waiting waiting. What are we, but waiting people?"
    return {
        sequence = {
            {
                text = "Las matemáticas son maravillosas, pueden describir varias cosas en la naturaleza.",
                portrait = gTextures.fibonacci,
                blip = "fibonacciBlip"
            },
            {
                text = "Mira este patrón: 1, 1, 2, 3, 5, 8, 13, 21, 34, 55…",
                portrait = gTextures.fibonacci,
                blip = "fibonacciBlip"
            },
            {
                text = "Cada salto es la suma de los dos números anteriores. 1 + 1 = 2, 1 + 2 = 3, 2 + 3 = 5…",
                portrait = gTextures.fibonacci,
                blip = "fibonacciBlip"
            },
            {
                text = "En el mundo natural, muchas cosas siguen este patrón.",
                portrait = gTextures.fibonacci,
                blip = "fibonacciBlip"
            },
            {
                text = "Por ejemplo en un girasol, hay 2 espirales de semillas en direcciones opuestas. ",
                portrait = gTextures.fibonacci,
                blip = "fibonacciBlip"
            },
            {
                text = "Si cuentas las semillas, puede haber 34 en un sentido, y 55 en el otro.",
                portrait = gTextures.fibonacci,
                blip = "fibonacciBlip"
            },
            {
                text = "Ambos números son parte del patrón que te mostré.",
                portrait = gTextures.fibonacci,
                blip = "fibonacciBlip"
            },
            {
                text = "O imagina una pareja de conejos bebés.",
                portrait = gTextures.fibonacci,
                blip = "fibonacciBlip"
            },
            {
                text = "Mes 1, 1 pareja de conejos.",
                portrait = gTextures.fibonacci,
                blip = "fibonacciBlip"
            },
            {
                text = "Mes 2, 1 pareja todavía.",
                portrait = gTextures.fibonacci,
                blip = "fibonacciBlip"
            },
            {
                text = "Mes 3, una cría nueva, ahora hay 2 parejas.",
                portrait = gTextures.fibonacci,
                blip = "fibonacciBlip"
            },
            {
                text = "Mes 4, 3 parejas.",
                portrait = gTextures.fibonacci,
                blip = "fibonacciBlip"
            },
            {
                text = "Mes 5, 5 parejas.",
                portrait = gTextures.fibonacci,
                blip = "fibonacciBlip"
            },
            {
                text = "Mes 6, 8 parejas. ¡Siguen el patrón!",
                portrait = gTextures.fibonacci,
                blip = "fibonacciBlip"
            },
            {
                text = "Te daré una secuencia de números, el patrón es diferente, debes encontrarlo. ",
                portrait = gTextures.fibonacci,
                blip = "fibonacciBlip"
            },
            {
                text = "Ya que deduzcas el patrón podrás decirme el siguiente número en la secuencia.",
                portrait = gTextures.fibonacci,
                blip = "fibonacciBlip"
            },
            {
                type = "question",
                text = "10, -20, -17, 34, 31, -62, -59, ??",
                portrait = gTextures.fibonacci,
                blip = "fibonacciBlip",
                answer = "118",
                successSequence = "success",
                fail = "death",
            },
        },
        success = {
            {
                text = "Correcto. Correcto. Puedes puedes. Pasar pasar pasar. Adios adios adios adios adios.",
                portrait = gTextures.fibonacci,
                blip = "fibonacciBlip"
            },
            {
                text = "Hasta el lenguaje sigue mi secuencia, fascinante.",
                portrait = gTextures.fibonacciEnd,
                blip = "fibonacciBlip"
            }
        }
    }
end