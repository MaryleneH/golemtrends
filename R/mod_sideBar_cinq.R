#' sideBar_cinq UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @importFrom gtrendsR gtrends
#' @importFrom purrr pluck
#' @importFrom dplyr mutate as_tibble filter
#' @import tidyquant
#' @importFrom plotly ggplotly
#' @import ggplot2
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
             actionButton(ns("bouton_lancer"), paste0("Lancer l","\u2019","analyse"))
             )
    )

  )
}

#' sideBar_cinq Server Function
#'
#' @noRd
mod_sideBar_cinq_server <- function(input, output, session,r, time){
  ns <- session$ns

if (time == "5") {



  observeEvent(input$bouton_lancer,{

  req(r$gtrends_api_all)
  r$tot <- filter_mots_cles(r$gtrends_api_all,input$search_terms)
  r$g1 <- gg_trends_graph(r$tot,
                        paste0("Part des requ","\u00ea","tes contenant le mot cl","\u00e9",
                               "- ","\u00e9","volution sur cinq ans - France"))



  })
}

if (time == "2004") {

  observeEvent(input$bouton_lancer,{
    req(r$gtrends_api_all_2004)
    r$tot <- filter_mots_cles(r$gtrends_api_all_2004,input$search_terms)
    r$g2 <- gg_trends_graph(r$tot,
                            paste0("Part des requ","\u00ea","tes contenant le mot cl","\u00e9",
                                   "- ","\u00e9","volution depuis 2004 - France"))


  })

}

}

## To be copied in the UI
# mod_sideBar_cinq_ui("sideBar_cinq_ui_1")

## To be copied in the server
# callModule(mod_sideBar_cinq_server, "sideBar_cinq_ui_1")

