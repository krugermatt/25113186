correlation_over_time_graph <- function(data,  #Data must contain a Gender Column
                                # with M and F, a Year column, and a corr column
                                   linetype = "solid",
                                   x_label = NULL,
                                   y_label = NULL,
                                   title = NULL,
                                   x_breaks = NULL,
                                   vlines = NULL,
                                suppress_legend = F) { g <- data %>%
        ggplot(aes(x = Year, y = corr, colour = Gender))+
        geom_line(linetype = linetype)+
        scale_x_continuous(breaks = x_breaks)+
        scale_colour_manual(values=c("M" = "deepskyblue", "F" = "violetred1"))+
        theme_bw()


    if (!is.null(vlines)) {g <- g + geom_vline(xintercept = vlines,
                                    linetype = "longdash", alpha = 0.6)}

     if (!is.null(x_breaks)) {g <- g + scale_x_continuous(breaks = x_breaks)}

    if (!is.null(x_label) || !is.null(y_label) || !is.null(title)) {
                g <- g + labs(x = x_label, y = y_label, title = title)}

            if (suppress_legend == T) {g <- g + guides(colour = "none")}


   g <- g + theme(axis.title.y = element_text(size = 8))

                    return(g)
                                   }


