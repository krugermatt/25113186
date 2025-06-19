release_date_converter <- function(data){
    data%>%
    mutate(release_date = as.Date(release_date))

    return(data)
}
