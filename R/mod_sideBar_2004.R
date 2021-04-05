#' sideBar_2004 UI Function
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
#' @importFrom dplyr mutate as_tibble filter select group_by arrange slice ungroup
#' @import tidyquant
#' @importFrom plotly ggplotly
#' @importFrom forcats as_factor fct_reorder
#' @import ggplot2
mod_sideBar_2004_ui <- function(id){
  ns <- NS(id)
  tagList(

    fluidRow(
      column(12,mod_GT_explic_ui(ns("GT_explic_ui_3")),

    shiny::selectizeInput(inputId = ns("term_selected"),
                       label = paste0("recherches des sujets li","\u00e9", "s au mot cl","\u00e9"),
                       choices = c("csv", "api","json", "xlsx", "xml","excel"),
                       selected = c("csv","json"),
                       multiple = TRUE),
    rep_br(2),
    actionButton(ns("bouton"),
                 "Lancer l'analyse !")
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

      req(r$df_related_keywords)

      r$liste_words <- filter_top_words(r$df_related_keywords,liste_termes = input$term_selected)
      r$graph_words <- gg_top_words(r$liste_words)


    })

  }

  if (time == "2004") {

    observeEvent(input$bouton,{

    req(r$df_rel_all_keywords)

    r$liste_words_all <- filter_top_words(r$df_rel_all_keywords,liste_termes = input$term_selected)
    r$graph_words_all <- gg_top_words(r$liste_words_all)

    })

  }

}

## To be copied in the UI
# mod_sideBar_2004_ui("sideBar_2004_ui_1")

## To be copied in the server
# callModule(mod_sideBar_2004_server, "sideBar_2004_ui_1")

