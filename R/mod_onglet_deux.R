#' onglet_deux UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @importFrom plotly plotlyOutput renderPlotly ggplotly
mod_onglet_deux_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      column(3,
             mod_sideBar_cinq_ui(ns("sideBar_cinq_ui_2"))),
      column(9,
             plotlyOutput(ns("time_plot_all"))
      )
    )

  )
}

#' onglet_deux Server Function
#'
#' @noRd
mod_onglet_deux_server <- function(input, output, session,r){
  ns <- session$ns
  output$time_plot_all <- renderPlotly({

    validate(
      need(r$gtrends_api_all_2004,
           message = paste0("Retourner onglet 1 et charger les donn","\u00e9","es.")
      ),
      need(r$g2,
           message = paste0("Lancer l'analyse")
      )
    )


    ggplotly(r$g2)
  })

  callModule(mod_sideBar_cinq_server, "sideBar_cinq_ui_2", r = r,time="2004")

}

## To be copied in the UI
# mod_onglet_deux_ui("onglet_deux_ui_1")

## To be copied in the server
# callModule(mod_onglet_deux_server, "onglet_deux_ui_1")
