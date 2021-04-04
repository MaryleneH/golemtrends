#' sideBar_cinq UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @import plotly
mod_sideBar_cinq_ui <- function(id){
  ns <- NS(id)
  tagList(

    fluidRow(
      column(12,mod_GT_explic_ui(ns("GT_explic_ui_1")),
             selectizeInput(inputId  = ns("search_terms"),
                            selected = default_list_terms,
                            choices  = c("csv", "api","json", "rdf", "xlsx", "xml", "excel"),
                            label    = paste0("Les termes tap","\u00e9","s dans une requ","\u00ea","te"),
                            multiple = TRUE),
             rep_br(3),
             actionButton(ns("boutonLancer"), paste0("Lancer l","\u2019","analyse"))
             )
    )

  )
}

#' sideBar_cinq Server Function
#'
#' @noRd
mod_sideBar_cinq_server <- function(input, output, session,r){
  ns <- session$ns

}

## To be copied in the UI
# mod_sideBar_cinq_ui("sideBar_cinq_ui_1")

## To be copied in the server
# callModule(mod_sideBar_cinq_server, "sideBar_cinq_ui_1")

