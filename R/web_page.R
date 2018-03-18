#' web_page(url)
#'
#'Loads Stack Overflow response webpage.
#'
#' @param url Full URL to stack overflow response webpage. Character type.
#'
#' @return q The question being asked on the given Stack Overflow response webpage. Character type. If unsuccessful corresponding error will be returned.
#' @export
#'
#' @examples
#' #'web_page('https://stackoverflow.com/questions/3505701/grouping-functions-tapply-by-aggregate-and-the-apply-family')


web_page <- function(url) {
  require(xml2)
  require(rvest)
  require(stringr)
  require(tidyverse)

  response_page <- xml2::read_html(url) # Loads URL
  question <- response_page %>% # Pulls question
    rvest::html_nodes('#question-header .question-hyperlink') %>%
    rvest::html_text()

  print(question) #prints question
  #return(url) # returns url

}
