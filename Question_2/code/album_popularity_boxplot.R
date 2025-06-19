album_popularity_boxplot <- function(data, x_lab = NULL, y_lab = NULL, title = NULL,
                                     caption = NULL){


   g <- data %>%
       #reordering albums by release date - earliest to latest
        mutate(album_name = fct_reorder(album_name, release_date)) %>%
        ggplot(aes(x = album_name, y = popularity, fill = album_name)) +
        geom_boxplot() +
        theme_bw() +
        theme(axis.text.x = element_text(angle = 90, size = 6)) +
        theme(legend.position = "none")

   #Leaves labels blank if arguments aren't entered for them
    if (!is.null(x_lab) || !is.null(y_lab) || !is.null(title) || !is.null(caption)) {
        g <- g + labs(x = x_lab, y = y_lab, title = title, caption = caption)}

   return(g)
}
