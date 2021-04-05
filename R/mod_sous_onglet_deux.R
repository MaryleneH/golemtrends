#' sous_onglet_deux UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @importFrom plotly plotlyOutput renderPlotly ggplotly
mod_sous_onglet_deux_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      column(3,
             mod_sideBar_one_keyword_ui(ns("sideBar_one_keyword_ui_1"))),
      column(9,
             plotlyOutput(ns("gg_keyword")),
             textOutput(ns("test")))
    )
  )
}

#' sous_onglet_deux Server Function
#'
#' @noRd
mod_sous_onglet_deux_server <- function(input, output, session, r){
  ns <- session$ns

  callModule(mod_sideBar_one_keyword_server, "sideBar_one_keyword_ui_1",r = r, time = "5")


  output$gg_keyword <- renderPlotly({
    validate(
      need(r$df_related_keywords,
           message = paste0("Retourner onglet 1 et charger les donn","\u00e9","es, puis ")
      ),
      need(r$graph_keyword,
           message = paste0("Lancer l'analyse")
      )
    )
    # req(r$graph_keyword )
    ggplotly(r$graph_keyword)
  })

  output$test <- renderText({
    r$testons
  })

}

## To be copied in the UI
# mod_sous_onglet_deux_ui("sous_onglet_deux_ui_1")

## To be copied in the server
# callModule(mod_sous_onglet_deux_server, "sous_onglet_deux_ui_1")

