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

creer_dataset <- function(liste_termes,time){
  liste_termes%>%
    gtrends(geo = "FR", time = time,onlyInterest = TRUE)%>%
    pluck("interest_over_time") %>%
    dplyr::mutate(hits = as.numeric(hits)) %>%
    as_tibble()
}

top_words  <- function(liste_termes,time) {
  creer_dataset(liste_termes = liste_termes,time = time) %>%
    ilter(related_queries == "top") %>%
    dplyr::mutate(interest = as.numeric(subject)) %>%

    select(keyword, value, interest) %>%
    group_by(keyword) %>%
    arrange(desc(interest)) %>%
    slice(1:n_terms) %>%
    ungroup() %>%

    mutate(value = as_factor(value) %>% fct_reorder(interest))


}

gg_top_words <- function(liste_top_words){
  liste_top_words %>%
    ggplot(aes(value, interest, color = keyword)) +
    geom_segment(aes(xend = value, yend = 0)) +
    geom_point() +
    coord_flip() +
    facet_wrap(~ keyword, ncol = 1, scales = "free_y") +
    theme_tq() +
    scale_color_tq()+
    labs(y = " ")

}




