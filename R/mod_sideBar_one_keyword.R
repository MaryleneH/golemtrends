#' sideBar_one_keyword UI Function
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
mod_sideBar_one_keyword_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      column(12,mod_GT_explic_ui(ns("GT_explic_ui_4")),

             shiny::selectInput(inputId = ns("keyword_selected"),
                                label = paste0("recherches des sujets li","\u00e9","s au mot cl","\u00e9"),
                                choices = c("csv", "api","json", "xlsx", "xml","excel"),
                                selected = "csv",
                                multiple = FALSE),
             rep_br(2),
             actionButton(ns("my_keyword"),
                          "Lancer l'analyse !")
      )
    )

  )
}

#' sideBar_one_keyword Server Function
#'
#' @noRd
mod_sideBar_one_keyword_server <- function(input, output, session,r, time){
  ns <- session$ns

  if (time == "5") {


  observeEvent(input$my_keyword,{
    req(r$df_related_keywords)

    r$dataset_keyword <- filter_top_words(r$df_related_keywords,liste_termes = input$keyword_selected)
    r$graph_keyword <- gg_top_words(r$dataset_keyword)

    })
  }

  if (time == "2004") {
    observeEvent(input$my_keyword,{
    req(r$df_rel_all_keywords)

    r$dataset_keyword_all <- filter_top_words(r$df_rel_all_keywords,liste_termes = input$keyword_selected)
    r$graph_keyword_all <- gg_top_words(r$dataset_keyword_all)

    })
  }

}

## To be copied in the UI
# mod_sideBar_one_keyword_ui("sideBar_one_keyword_ui_1")

## To be copied in the server
# callModule(mod_sideBar_one_keyword_server, "sideBar_one_keyword_ui_1")

