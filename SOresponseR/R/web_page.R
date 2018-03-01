web_page <- function(url) {
  # '''
  # Loads Stack Overflow response webpage.
  #
  # Parameters:
  #     url: Full URL to stack overflow response webpage. Character type.
  # Returns:
  #     q: The question being asked on the given Stack Overflow response webpage. Character type. If unsuccessful corisponding error will be returned.
  # '''

  #library(xml2)
  #library(rvest)
  response_page <- xml2::read_html(url)
  question <- response_page %>%
    rvest::html_nodes('#question-header .question-hyperlink') %>%
    rvest::html_text()

  print(question)
  return(url)
}
