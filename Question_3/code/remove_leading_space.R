remove_leading_space <- function(data, column, observation){
    data %>%
        mutate({{ column }} := recode({{ column }},
                                      !!paste0(" ", observation) := observation))
}
