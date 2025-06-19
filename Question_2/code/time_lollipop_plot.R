time_lollipop_plot <- function(data, date_col, y_axis, x_lab = NULL, y_lab = NULL,
                               title = NULL){

    #The dataframe must have a date column
   g<- data %>%
       ggplot(aes(x = {{date_col}}, y = {{y_axis}})) +

       #Creating the stems
        geom_segment(aes(x = {{date_col}}, xend = {{date_col}}, y = 0,
                         yend = {{y_axis}}), color = "palegreen") +

       #Creating the dots on top of the stems
        geom_point(size = 3, color = "yellow", fill = alpha("black", 0.8),
                   shape = 21, stroke = 2) +
        theme_bw() +
       scale_y_continuous(limits = c(0,1)) +
       theme(axis.title.y = element_text(size = 6))

   #Labels are left blank if an argument isn't specified for them
   if (!is.null(x_lab) || !is.null(y_lab) || !is.null(title)) {
       g <- g + labs(x = x_lab, y = y_lab, title = title)}


}




