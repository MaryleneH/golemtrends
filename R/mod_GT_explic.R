#' GT_explic UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_GT_explic_ui <- function(id){
  ns <- NS(id)
  tagList(

    div(class="explic",
      br(),
      p(
        paste0("Google Trends est un outil issu de Google Labs permettant de conna", "\u00ee","tre
        la fr", "\u00e9","quence ", "\u00e0"," laquelle un terme a ", "\u00e9","t", "\u00e9"," tap", "\u00e9"," dans le moteur de recherche Google,
               avec la possibilit", "\u00e9"," de visualiser ces donn", "\u00e9","es par r", "\u00e9","gion et par langue.")),
      p(paste0("Afin de compl", "\u00e9","ter l", "\u2019", "analyse des besoins utilisateurs en termes
        de format de fichier, nous nous int", "\u00e9","resssons aux requ", "\u00ea","tes de recherche
        Google effectu", "\u00e9","es par les internautes.
        Cette application utilise l", "\u2019", "API Google Trends (gr", "\u00e2", "ce au package R)")),
      code("gtrendsR"),
      br(),
      hr()


  )
  )
}

#' GT_explic Server Function
#'
#' @noRd
mod_GT_explic_server <- function(input, output, session){
  ns <- session$ns

}

## To be copied in the UI
# mod_GT_explic_ui("GT_explic_ui_1")

## To be copied in the server
# callModule(mod_GT_explic_server, "GT_explic_ui_1")

