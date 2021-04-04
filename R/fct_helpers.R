filter_mots_cles <- function(dataset, mots){

  dataset %>%
    filter(keyword %in% mots)

}

gg_trends_graph <- function(dataset, title){

  dataset %>%
    ggplot(aes(date, hits, color = keyword)) +
    geom_line() +
    geom_smooth(span = 0.3, se = FALSE) +
    theme_tq() +
    scale_color_tq() +
    labs(title = title)

}

creer_dataset <- function(liste_termes){
  liste_termes%>%
    gtrends(geo = "FR", time = "today+5-y",onlyInterest = TRUE)%>%
    pluck("interest_over_time") %>%
    dplyr::mutate(hits = as.numeric(hits)) %>%
    as_tibble()
}




