top_5_x <- function(data, column) {
    data %>%
        filter(!is.na({{ column }})) %>%   #Ensuring no NAs are counted
        count({{ column }}, sort = TRUE) %>%
        slice_max(n = 5, order_by = n)
}
