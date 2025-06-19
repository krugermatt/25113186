factor_transformation <- function(data, column, reference) {
    data <- data %>%
        mutate({{ column }} := relevel(factor({{ column }}), ref = reference))

    return(data)
}
