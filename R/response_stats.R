#' response_stats(url)
#'
#' Returns general statistics about question being asked on a Stack Overflow page.
#'
#' @param url An object that used the `web_page()` function.
#'
#' @return Returns a vector of length 4 that includes:
#' @return n Returns number of responses.
#' @return m Average reputation score.
#' @return t Top reputation score.
#' @return a Author reputation score.
#'
#' @export
#'
#' @examples
#'#'response_stats('https://stackoverflow.com/questions/3505701/grouping-functions-tapply-by-aggregate-and-the-apply-family')



response_stats <- function(url) {
  require(xml2)
  require(rvest)
  require(stringr)
  require(tidyverse)
  #load question by using web_page()
  question <- read_html(url)

  #return the number of response as "a"
  n_response <- question %>%
    html_nodes('#answers-header h2') %>%
    html_attrs()
  a <- as.double(n_response)
  #if (a==0){print("There is no response!")}

  #return the number of average reputation score as "b"
  comment <- question %>%
    html_nodes('.reputation-score') %>%
    html_text()

  #since some reputation score is using "k" for one thousand, such as 10k. we need to detect "k".
  with_k <- as.numeric(str_replace(comment[str_detect(comment, 'k$') == TRUE], pattern = 'k', '' ))*1000
  without_k <- as.numeric(str_replace(comment[str_detect(comment, 'k$') == F], pattern = ',', '' ))
  b <- mean(c(with_k,without_k))

  #return the top reputation score as "c"
  top_reputation <- question %>%
    html_nodes('.reputation-score') %>%
    html_text()

  with_k <- as.numeric(str_replace(top_reputation[str_detect(top_reputation, 'k$') == TRUE], pattern = 'k', '' ))*1000
  without_k <- as.numeric(str_replace(top_reputation[str_detect(top_reputation, 'k$') == F], pattern = ',', '' ))
  c <- as.integer(max(c(with_k,without_k)))

  #return the author's reputation score as "d"
  author_reputation <- question %>%
    html_nodes('.owner .reputation-score') %>%
    html_text()


  author_reputation <- str_replace(author_reputation,pattern = ",","")
  if(str_detect(author_reputation,"k$")==T){
    d <- as.numeric(str_replace(author_reputation[str_detect(author_reputation, 'k$') == TRUE], pattern = 'k', '' ))*1000
  } else{
    d = author_reputation}


  #finally return a list of the 4 numbers.
  return(c(a,b,c,d))
}
