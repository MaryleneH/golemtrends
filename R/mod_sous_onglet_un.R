#' sous_onglet_un UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @importFrom plotly plotlyOutput renderPlotly ggplotly
mod_sous_onglet_un_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      column(3,
             mod_sideBar_2004_ui(ns("sideBar_2004_ui_1"))),
      column(9,
             plotlyOutput(ns("related_keywords")))
    )

  )
}

#' sous_onglet_un Server Function
#'
#' @noRd
mod_sous_onglet_un_server <- function(input, output, session,r){
  ns <- session$ns

  output$related_keywords <- renderPlotly({
    validate(
      need(r$df_related_keywords,
           message = paste0("Retourner onglet 1 et charger les donn","\u00e9","es, puis ")
      ),
      need(r$graph_words,
           message = paste0("Lancer l'analyse")
      )
    )
    # req(r$graph_words)
    ggplotly(r$graph_words)
  })

  callModule(mod_sideBar_2004_server, "sideBar_2004_ui_1",r = r, time = "5")

}

## To be copied in the UI
# mod_sous_onglet_un_ui("sous_onglet_un_ui_1")

## To be copied in the server
# callModule(mod_sous_onglet_un_server, "sous_onglet_un_ui_1")

