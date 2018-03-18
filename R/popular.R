#' popular(url, type="likes")
#'
#'Returns most popular response on webpage.
#'
#' @param url An object that used the `web_page()` function.
#' @param type "likes" returns response with the most likes. "author" returns response confirmed by author of question.
#'
#' @return reponse Returns a response. This will be of a character type.
#' @export
#'
#' @examples
#'#'popular('https://stackoverflow.com/questions/3505701/grouping-functions-tapply-by-aggregate-and-the-apply-family', type="likes")


popular <- function(url, type="likes") {
  require(xml2)
  require(rvest)
  require(stringr)
  require(tidyverse)

  #load question by using web_page()
  question <- xml2::read_html(url)

  #return the number of response as "a"
  n_response <- question %>%
    html_nodes('#answers-header h2') %>%
    html_attrs()
  a <- as.double(n_response)
  if (a==0){stop("There is no response!")}else{     #exception handler

  if (type=='author') {
    response_page <- xml2::read_html(url) # Loads URL
    response <- response_page %>% # Pulls author's selected answer
      rvest::html_nodes('.accepted-answer p') %>%
      rvest::html_text()
    if (length(response) == 0){stop("There is no accepted answer!")}else{  #exception handler


    return(response)} # returns Author's choice of answer


  } else if (type=='likes'){


    response_page <- xml2::read_html(url) # Loads URL
    likes <- response_page %>% # Pulls number of likes for each response
      rvest::html_nodes('#answers .vote-count-post') %>%
      rvest::html_text()

    response <- response_page %>% # Pulls each response
      rvest::html_nodes('#answers .post-text') %>%
      rvest::html_text()


    return(response[which.max(likes)]) # returns response with the most likes

  }}

}
