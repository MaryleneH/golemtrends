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
  callModule(mod_onglet_deux_server, "onglet_deux_ui_1", r = r)
  callModule(mod_sous_onglet_un_server, "sous_onglet_un_ui_1", r = r)
  callModule(mod_sous_onglet_deux_server, "sous_onglet_deux_ui_1", r = r)
  callModule(mod_sous_onglet_trois_server, "sous_onglet_trois_ui_1", r = r)
  callModule(mod_sous_onglet_quatre_server, "sous_onglet_quatre_ui_1", r = r)


  #Actions

  observeEvent(input$bouton_analyse, once = TRUE, {

    # Création du dataset gtrends_api_allcontenant la table complète
    # de l'ensemble des mots clés

    #Dataset contenant les requêtes des 5 dernières années
    gtrends_api_all_1 <- creer_dataset(list_terms_all_1,time ="today+5-y",arg_pluck = "interest_over_time")

    gtrends_api_all_2 <- creer_dataset(list_terms_all_2,time="today+5-y",arg_pluck = "interest_over_time")

    r$gtrends_api_all<- rbind(gtrends_api_all_1, gtrends_api_all_2)

    #Dataset contenant les requêtes depuis 2004
    gtrends_2004_1 <- creer_dataset(list_terms_all_1,time ="all",arg_pluck = "interest_over_time")

    gtrends_2004_2 <- creer_dataset(list_terms_all_2,time="all",arg_pluck = "interest_over_time")

    r$gtrends_api_all_2004<- rbind(gtrends_2004_1, gtrends_2004_2)

    # Dataset contenant tous les mots clés liés à la liste de mots clés
    # Cinq dernières années
    df_related_keywords_1 <- determine_top_words(liste_termes = list_terms_all_1,
                        time = "today+5-y")

    df_related_keywords_2 <- determine_top_words(liste_termes = list_terms_all_2,
                                                 time = "today+5-y")

    r$df_related_keywords <- rbind(df_related_keywords_1, df_related_keywords_2)

    # Depuis 2004
    df_rel_all_keywords_1 <- determine_top_words(liste_termes = list_terms_all_1,
                                                 time = "all")

    df_rel_all_keywords_2 <- determine_top_words(liste_termes = list_terms_all_2,
                                                 time = "all")

    r$df_rel_all_keywords <- rbind(df_rel_all_keywords_1, df_rel_all_keywords_2)


    # On efface le bouton de chargement des données ainsi que les deux titres
    removeUI("#bouton_analyse")
    removeUI("#efface")
    removeUI("#efface_aussi")


  })



}
