#' onglet_deux UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
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
mod_onglet_deux_server <- function(input, output, session){
  ns <- session$ns

}

## To be copied in the UI
# mod_onglet_deux_ui("onglet_deux_ui_1")

## To be copied in the server
# callModule(mod_onglet_deux_server, "onglet_deux_ui_1")

