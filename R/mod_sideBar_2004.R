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
      column(12,mod_GT_explic_ui(ns("GT_explic_ui_2")),

    shiny::selectInput(inputId = ns("term_selected"),
                       label = paste0("recherches des sujets li","\u00e9", "s au mot cl","\u00e9"),
                       choices = c("csv", "api","json", "rdf", "xlsx", "xml","excel"),
                       selected = "rdf",
                       multiple = FALSE),
    actionButton(ns("bouton"),
                 "GO !")
      )
    )

  )
}

#' sideBar_2004 Server Function
#'
#' @noRd
mod_sideBar_2004_server <- function(input, output, session, r, time){
  ns <- session$ns
  if (time == "5") {

    observeEvent(input$bouton,{

      req(r$gtrends_api_all)


    })

  }

  if (time == "2004") {

  }

}

## To be copied in the UI
# mod_sideBar_2004_ui("sideBar_2004_ui_1")

## To be copied in the server
# callModule(mod_sideBar_2004_server, "sideBar_2004_ui_1")

