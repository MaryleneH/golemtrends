#' personas UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_personas_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      column(12,
             p(paste0("L'Insee m","\u00e8","ne actuellement un projet pour proposer de nouveaux
               jeux de donn","\u00e9","es en Open Data (cubes multidimensionnels) sous forme de web service.
               Cette offre de donn", "\u00e9", "es s'adresse à des utilisateurs exp", "\u00e9", "riment", "\u00e9", "s en vue de rediffuser
               les donn", "\u00e9", "es. Afin d'approfondir la connaissance des besoins des utilisateurs
               avanc", "\u00e9", "s des donn", "\u00e9", "es en termes de formats et de structuration des donn", "\u00e9", "es,
               le choix s'est orient", "\u00e9", " vers la construction de personas")),
             rep_br(1),
             h4("Rappel du workflow d'analyse"),
             rep_br(1),
             tags$img(src = "www/workflow.png", width = "45%", align = "center"),
             rep_br(4)
             )
    )

  )
}

#' personas Server Function
#'
#' @noRd
mod_personas_server <- function(input, output, session){
  ns <- session$ns

}

## To be copied in the UI
# mod_personas_ui("personas_ui_1")

## To be copied in the server
# callModule(mod_personas_server, "personas_ui_1")

