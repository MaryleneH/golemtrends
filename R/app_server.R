#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session) {
  # List the first level callModules here
  r <- reactiveValues()

  callModule(mod_onglet_un_server, "onglet_un_ui_1", r = r)
  # callModule(mod_onglet_deux_server, "onglet_deux_ui_1", r = r)



  observeEvent(input$bouton_analyse,once = TRUE,{

    # Création du dataset gtrends_api_allcontenant la table complète
    # de l'ensemble des mots clés

    gtrends_api_all_1 <- creer_dataset(list_terms_all_1)

    gtrends_api_all_2 <- creer_dataset(list_terms_all_2)

    r$gtrends_api_all<- rbind(gtrends_api_all_1, gtrends_api_all_2)



    # On efface le bouton de chargement des données ainsi que les deux titres
    removeUI("#bouton_analyse")
    removeUI("#efface")
    removeUI("#efface_aussi")



  })



}
