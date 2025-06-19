live_filter <- function(data){

    data %>% filter(!str_detect(string = name, pattern = "Live"))

    return(data)
}
