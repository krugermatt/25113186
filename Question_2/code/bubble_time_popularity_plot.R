bubble_time_popularity_plot <- function(data, date_col, y_axis, size, color_popular,
                                       x_lab = NULL, y_lab = NULL, title = NULL,
                                       caption = NULL){

#The dataframe needs to have a date column, and a binary popularity column
    g <- data %>%
        ggplot(aes(x = {{date_col}}, y = {{y_axis}}, size = {{size}},
                   color = {{color_popular}})) +
        geom_point(alpha = 0.7) +

        #Scaling the size of the bubbles
        scale_size(range = c(0.1, 12)) +
        scale_color_manual(values = c("Popular" = "lightblue",
                                      "Unpopular" = "violetred1"), name = NULL) +
        scale_x_date(date_breaks = "5 years", date_labels = "%Y")+
        guides(size = "none") +
        theme_bw()

    #Leaves labels blank if arguments aren't entered for them
if (!is.null(x_lab) || !is.null(y_lab) || !is.null(title) || !is.null(caption)) {
        g <- g + labs(x = x_lab, y = y_lab, title = title, caption = caption)}

    return(g)

}






