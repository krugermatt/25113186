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
        geom_point(data = label_data, aes(x = decade, y = Count), size = 2
                   , show.legend = F) +

        #Adds labels to those points of the respective celebrity names
        geom_text(data = label_data, aes(x = decade, y = Count, label = label),
                  vjust = -0.5, size = 3, show.legend = F) +
        scale_x_continuous(breaks = seq(start_year, end_year, 10)) +
        labs(x = "Decade", y = "Log Number of Babies",
        title = "Evolution of Famous Names Over Time", caption = "The dots represent the decade
             in which the respective celebrity was most famous") +
        theme(plot.title = element_text(hjust = 0.5))

    return(p)
}
