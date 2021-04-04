#' sideBar_2004 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_sideBar_2004_ui <- function(id){
  ns <- NS(id)
  tagList(

    fluidRow(
      column(3,

    shiny::selectInput(inputId = ns("term_selected"),
                       label = paste0("recherches des sujets li","\u00e9", "s au mot cl","\u00e9"),
                       choices = c("csv", "api","json", "rdf", "xlsx", "xml","excel"),
                       selected = "rdf",
                       multiple = FALSE),
    actionButton(ns("bouton"),
                 "GO !")
      ),
    column(9)
    )

  )
}

#' sideBar_2004 Server Function
#'
#' @noRd
mod_sideBar_2004_server <- function(input, output, session,r){
  ns <- session$ns

}

## To be copied in the UI
# mod_sideBar_2004_ui("sideBar_2004_ui_1")

## To be copied in the server
# callModule(mod_sideBar_2004_server, "sideBar_2004_ui_1")

