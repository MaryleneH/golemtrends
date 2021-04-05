#' onglet_un UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @importFrom plotly plotlyOutput renderPlotly ggplotly

mod_onglet_un_ui <- function(id){
  ns <- NS(id)
  tagList(

    fluidRow(
      column(3,
             mod_sideBar_cinq_ui(ns("sideBar_cinq_ui_1"))),
      column(9,
             plotlyOutput(ns("time_plot"))

      )
    )

  )
}

#' onglet_un Server Function
#'
#' @noRd
mod_onglet_un_server <- function(input, output, session,r){
  ns <- session$ns

  output$time_plot <- renderPlotly({
    validate(
      need(r$gtrends_api_all,
           message = paste0("Charger les donn","\u00e9","es, puis ")
      ),
      need(r$g1,
           message = paste0("Lancer l'analyse")
      )
    )
      ggplotly(r$g1)
    })


    callModule(mod_sideBar_cinq_server, "sideBar_cinq_ui_1", r = r,time="5")


}

## To be copied in the UI
# mod_onglet_un_ui("onglet_un_ui_1")

## To be copied in the server
# callModule(mod_onglet_un_server, "onglet_un_ui_1")
