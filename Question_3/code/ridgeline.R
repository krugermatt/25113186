ridgeline <- function(data, x_axis, y_axis, x_lab = NULL, y_lab = NULL,
                      title = NULL){



    g <- data %>%
        ggplot(aes(x = {{x_axis}}, y = {{y_axis}}, fill = {{y_axis}})) +
        geom_density_ridges() +
        theme_ridges() +
        theme(legend.position = "none")


    #Labels are blank if no argument is inputted for them
    if (!is.null(x_lab) || !is.null(y_lab) || !is.null(title) || !is.null(caption)) {
        g <- g + labs(x = x_lab, y = y_lab, title = title)}


}
