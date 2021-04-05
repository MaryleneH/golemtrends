#' sous_onglet_trois UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @importFrom plotly plotlyOutput renderPlotly ggplotly
mod_sous_onglet_trois_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      column(3,
             mod_sideBar_2004_ui(ns("sideBar_2004_ui_2"))),
      column(9,
             plotlyOutput(ns("related_all_keywords")))
    )


  )
}

#' sous_onglet_trois Server Function
#'
#' @noRd
mod_sous_onglet_trois_server <- function(input, output, session, r){
  ns <- session$ns

  output$related_all_keywords <- renderPlotly({
    validate(
      need(r$df_rel_all_keywords,
           message = paste0("Retourner onglet 1 et charger les donn","\u00e9","es, puis ")
      ),
      need(r$graph_words_all,
           message = paste0("Lancer l'analyse")
      )
    )
    # req(r$graph_words_all)
    ggplotly(r$graph_words_all)
  })

  callModule(mod_sideBar_2004_server, "sideBar_2004_ui_2",r = r, time = "2004")

}

## To be copied in the UI
# mod_sous_onglet_trois_ui("sous_onglet_trois_ui_1")

## To be copied in the server
# callModule(mod_sous_onglet_trois_server, "sous_onglet_trois_ui_1")

