#' sous_onglet_un UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_sous_onglet_un_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      column(3,
             mod_sideBar_2004_ui("sideBar_2004_ui_1")),
      column(9)
    )

  )
}

#' sous_onglet_un Server Function
#'
#' @noRd
mod_sous_onglet_un_server <- function(input, output, session,r){
  ns <- session$ns

}

## To be copied in the UI
# mod_sous_onglet_un_ui("sous_onglet_un_ui_1")

## To be copied in the server
# callModule(mod_sous_onglet_un_server, "sous_onglet_un_ui_1")

