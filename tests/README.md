![](test_result.png)

### Branch Coverage    

`web_page()`:      

| Condition | Test function |
| --- | -------- |
| the URL is not a valid SO webpage | `test_that("url is correct")` |  
| the URL is valid | `test_that("web_page is correct")` |

`popular()`:   

| Condition | Test function |
| --- | -------- |
| the webpage has no response | `test_that("There are no answers")` |  
| the webpage has responses; choice equals 'likes' or 'author' | `test_that("popular_argument is correct")` |  
| the webpage has responses; choice equals 'author'; no author accepted answer | `test_that("There is no accepted answer")` | 


`response_stat()`:    

| Condition | Test function |
| --- | -------- |
| webpage is loaded | `test_that("response_stats is correct")` |  
