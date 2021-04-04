#' savoirPlus UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_savoirPlus_ui <- function(id){
  ns <- NS(id)
  tagList(

    fluidRow(
      column(1,br()),
      column(10,
      div(
        tags$img(src = "www/Logo-google-trends-PNG.png", width = "40%", align = "center"),

        p(
        paste0("Google Trends permet d","\u2019","acc","\u00e9", "der ","\u00e0"," un ","\u00e9","chantillon,
        essentiellement non filtr","\u00e9"," de requ","\u00ea","tes de recherche r","\u00e9","elles effectu","\u00e9","es
        sur Google. Elles sont anonymes (les internautes ne sont pas identifi","\u00e9", "s
        personnellement), cat","\u00e9","goris","\u00e9","es (en fonction du sujet de la recherche)
        et agr","\u00e9","g","\u00e9","es. Il est ainsi possible d","\u2019","analyser l","\u2019","int","\u00e9","r","\u00ea","t marqu","\u00e9"," par les
        internautes effectuant des recherches via Google pour un sujet
        particulier. L","\u2019","analyse peut porter sur les internautes du monde entier,
        d","\u2019","un ","\u00e9","tat en particulier, d","\u2019","une r","\u00e9","gion ou encore au niveau d","\u2019","une ville."
        )),
        tags$a(href="https://trends.google.fr/trends/?geo=FR", "Pour en savoir plus sur Google Trends")
        ),
        hr(),
        p(paste0("Pour rendre l","\u2019","analyse entre les mots-cl","\u00e9","s plus simple, Google Trends
          effectue une normalisation des donn","\u00e9","es de requ","\u00ea","tes.")),
        p(paste0("Les r","\u00e9","sultats de recherche sont normalis","\u00e9","s en fonction de l","\u2019","heure
          et du lieu d","\u2019","une requ","\u00ea","te, selon le processus suivant :")),
        p(
          tags$ul(
            tags$li(paste0("Chaque point de donn","\u00e9","es est divis","\u00e9"," par le nombre total
                    de recherches effectu","\u00e9","es pour la p","\u00e9","riode et le lieu qu","\u2019","il
                    repr","\u00e9","sente, afin d","\u2019","effectuer un comparatif de la popularit","\u00e9","
                    relative. Cela permet d","\u2019","","\u00e9","viter que les lieux g", "\u00e9","n","\u00e9", "rant les volumes
                    de recherche les plus importants soient toujours les mieux class", "\u00e9","s.")),
            tags$li(paste0("Les chiffres obtenus sont ensuite class","\u00e9","s sur une ","\u00e9","chelle de 0 ","\u00e0"," 100,
                    selon la proportion d","\u2019","un sujet par rapport ","\u00e0"," toutes les recherches
                    portant sur tous les sujets.")),
            tags$li(paste0("Deux r","\u00e9","gions pr","\u00e9","sentant la m","\u00ea","me proportion de recherches pour un
                    terme ne totalisent pas n","\u00e9","cessairement le m","\u00ea","me volume de recherches."))
          ),
          p(paste0("Les donn","\u00e9","es sont index","\u00e9","es ","\u00e0"," 100 - 100 repr","\u00e9","sentant le maximum de requ","\u00ea","tes
            pour la dur","\u00e9","e et la localisation selectionn","\u00e9","es.")),
          tags$a(href = "https://medium.com/google-news-lab/what-is-google-trends-data-and-what-does-it-mean-b48f07342ee8",
                 paste0("Pour en savoir plus sur l","\u2019","exploitation des donn","\u00e9","es Google Trends"))
        ),
        hr()

        ),
      column(1,br())
    )
  )

}

#' savoirPlus Server Function
#'
#' @noRd
mod_savoirPlus_server <- function(input, output, session,r){
  ns <- session$ns

}

## To be copied in the UI
# mod_savoirPlus_ui("savoirPlus_ui_1")

## To be copied in the server
# callModule(mod_savoirPlus_server, "savoirPlus_ui_1")

