song_ranking <- function(data, weeks_on_chart_col, peak_rank_col){
    data <- data %>%
        #Creates a new column with the overall song rank
 mutate(overall_song_rank = {{weeks_on_chart_col}} / {{peak_rank_col}})

    return(data)
}
