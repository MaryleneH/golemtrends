#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import waiter
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # List the first level UI elements here
    navbarPage(paste0("Les requ", "\u00ea","tes sur les formats de fichiers"),
               tabPanel(paste0("Sur les cinq derni", "\u00e8", "res ann", "\u00e9","es"),
                        tags$h2("Etape 1 :", id="efface"),
                        use_waiter(),
                        actionButton("bouton_analyse",
                                     paste0("Charger les donn","\u00e9","ees")),
                        rep_br(1),
                        hr(),
                        tags$h2("Etape 2 : ", id = "efface_aussi"),
                        # tags$h3("", id ="charger"),
                        mod_onglet_un_ui("onglet_un_ui_1"),

                        ),
               tabPanel("Depuis 2004",
                        rep_br(1),
                        hr(),
                        mod_onglet_deux_ui("onglet_deux_ui_1")),
               navbarMenu(paste0("Sujets les plus li","\u00e9",
                                 "s au mot cl","\u00e9",
                                 "/ Infos"),
                          "----",
                          paste0("Sur les cinq derni","\u00e8","res ann","\u00e9","es"),
                          tabPanel(paste0("quels sont les autres mots cl","\u00e9", "s
                                   les plus souvent tap","\u00e9", "s dans la requ",
                                          "\u00ea" ,"te ?"),
                                   rep_br(1),
                                   hr(),
                                   mod_sous_onglet_un_ui("sous_onglet_un_ui_1")
                                   ),
                          tabPanel(paste0("focus par mot-cl", "\u00e9", " et leurs autres mots li",
                                   "\u00e9","s"),
                                   rep_br(1),
                                   hr(),
                                   mod_sous_onglet_deux_ui("sous_onglet_deux_ui_1")),
                          "----",
                          "Depuis 2004",
                          tabPanel(paste0("quels sont les autres mots cl","\u00e9", "s
                                   les plus souvent tap","\u00e9", "s dans la requ",
                                          "\u00ea" ,"te ?"),
                                   rep_br(1),
                                   hr(),
                                   mod_sous_onglet_trois_ui("sous_onglet_trois_ui_1")
                                   ),
                          tabPanel(paste0("focus par mot-cl", "\u00e9", " et leurs autres mots li",
                                          "\u00e9","s"),
                                   rep_br(1),
                                   hr(),
                                   mod_sous_onglet_quatre_ui("sous_onglet_quatre_ui_1")),
                          "----",
                          "Pour en savoir plus",
                          tabPanel("Google Trends",
                                   mod_savoirPlus_ui("savoirPlus_ui_1")
                                   ),
                          tabPanel("Comprendre les utilisateurs data de l'Insee",
                                   mod_personas_ui("personas_ui_1")
                                   )

                        )

            )
      )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){

  add_resource_path(
    'www', app_sys('app/www')
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'GolemTrends'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}

