#' sous_onglet_quatre UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_sous_onglet_quatre_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      column(3,
             mod_sideBar_one_keyword_ui(ns("sideBar_one_keyword_ui_2"))),
      column(9,
             plotlyOutput(ns("gg_keyword_all"))
             )
    )

  )
}

#' sous_onglet_quatre Server Function
#'
#' @noRd
mod_sous_onglet_quatre_server <- function(input, output, session, r){
  ns <- session$ns

  callModule(mod_sideBar_one_keyword_server, "sideBar_one_keyword_ui_2",r = r, time = "2004")


  output$gg_keyword_all <- renderPlotly({
    validate(
      need(r$df_rel_all_keywords,
           message = paste0("Retourner onglet 1 et charger les donn","\u00e9","es, puis ")
      ),
      need(r$graph_keyword_all,
           message = paste0("Lancer l'analyse")
      )
    )
    # req(r$graph_keyword_all )
    ggplotly(r$graph_keyword_all)
  })

}

## To be copied in the UI
# mod_sous_onglet_quatre_ui("sous_onglet_quatre_ui_1")

## To be copied in the server
# callModule(mod_sous_onglet_quatre_server, "sous_onglet_quatre_ui_1")

