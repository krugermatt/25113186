average_danceability <- function(data){

    #dataframe must contain album_name, release_date, and danceability columns
    data <- data %>%
        group_by(album_name, release_date) %>%

        #dataframe will now just contain album_name, release_date,
        #and average danceability
        summarise(average_danceability = mean(danceability))

}
