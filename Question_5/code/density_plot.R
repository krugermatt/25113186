density_plot <- function(data, x, y, x_lab = NULL, y_lab = NULL, title = NULL){


    g <- data %>%
        ggplot(aes(x = {{x}}, y = {{y}})) +
        geom_hex() +
        theme_bw()

    #Labels are blank if no argument is inputted for them
    if (!is.null(x_lab) || !is.null(y_lab) || !is.null(title) || !is.null(caption)) {
        g <- g + labs(x = x_lab, y = y_lab, title = title)}

}





