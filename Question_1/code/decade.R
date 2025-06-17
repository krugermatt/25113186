decade <- function(data, date_column){data <- data %>%
    #Takes the year out of the date, divides by 10 and rounds down. Then multiplies by
    # 10 to get to a decade
                 mutate(decade = floor(lubridate::year(date) / 10) * 10)

return(data)
}
