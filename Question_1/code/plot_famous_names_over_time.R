plot_famous_names_over_time <- function(data, celebrity_names, label_decades,
                                        start_year, end_year) {

    # Ensure data includes only relevant names
    filtered_data <- data %>%
        filter(Name %in% names(celebrity_names))

    # Create data frame for points and labels of celebrities
    label_data <- tibble(
        Name = names(celebrity_names),
        label = unname(celebrity_names),
        decade = unname(label_decades)
    ) %>%
        left_join(filtered_data, by = c("Name", "decade"))

    # Create plot
    p <- filtered_data %>%
        ggplot(aes(x = decade, y = Count, colour = Name)) +
        geom_line() +
        theme_bw() +

        #Adds a point for each celebrity on the respective line which
        #matches up with their name, at the decade they were most famous
        geom_point(data = label_data, aes(x = decade, y = Count), size = 2) +

        #Adds labels to those points of the respective celebrity names
        geom_text(data = label_data, aes(x = decade, y = Count, label = label),
                  vjust = -0.5, size = 3) +
        scale_x_continuous(breaks = seq(start_year, end_year, 10)) +
        theme(legend.position = "none")

    return(p)
}
