correlation_over_time_graph <- function(data,
                                   x_label = "Year",
                                   y_label = "Correlation",
                                   title = "Persistence Plot",
                                   x_breaks = NULL,
                                   vlines = NULL) {

    # Automatically generate x-axis breaks if not provided
    if (is.null(x_breaks)) {
        x_breaks <- pretty(data$Year)
    }

    # Start the plot
    p <- ggplot(data, aes(x = Year, y = corr, colour = Gender, linetype = Area)) +
        geom_line() +
        theme_bw() +
        labs(x = x_label, y = y_label, title = title) +
        scale_x_continuous(breaks = sort(unique(c(x_breaks, vlines))))

    # Add vertical lines if specified
    if (!is.null(vlines)) {
        p <- p +
            geom_vline(xintercept = vlines, linetype = "longdash", alpha = 0.6)
    }

    return(p)
}
