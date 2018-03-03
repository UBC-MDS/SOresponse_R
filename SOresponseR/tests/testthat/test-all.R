library(stringr)
library(testthat)
url <- "https://stackoverflow.com/questions/68645/static-class-variables-in-python?rq=1"
type<- "likes,author"

test_that("url is correct",{
  expect_equal(typeof(url),"character")
  expect_match(url, "stackoverflow.com/questions",ignore.case = TRUE)
})

test_that("web_page is correct",{
  expect_equal(web_page(url),c("Static class variables in Python"))
})

test_that("popular_argument is correct",{
  expect_match(type, "likes", ignore.case=TRUE)
})

test_that("popular_response is correct",{
  expect_equal(popular(web_page(url)),"\r\nVariables declared inside the class definition, but not inside a method are class or static variables:\n\n>>> class MyClass:\n...     i = 3\n...\n>>> MyClass.i\n3 \n\n\nAs @millerdev points out, this creates a class-level i variable, but this is distinct from any instance-level i variable, so you could have\n\n>>> m = MyClass()\n>>> m.i = 4\n>>> MyClass.i, m.i\n>>> (3, 4)\n\n\nThis is different from C++ and Java, but not so different from C#, where a static member can't be accessed using a reference to an instance.\n\nSee what the Python tutorial has to say on the subject of classes and class objects.\n\n@Steve Johnson has already answered regarding static methods, also documented under \"Built-in Functions\" in the Python Library Reference.\n\nclass C:\n    @staticmethod\n    def f(arg1, arg2, ...): ...\n\n\n@beidy recommends classmethods over staticmethod, as the method then receives the class type as the first argument, but I'm still a little fuzzy on the advantages of this approach over staticmethod. If you are too, then it probably doesn't matter.\n    ")
})

test_that("response_stats",{
  expect_equal(response_stats(web_page(url)),c(16,20295.65,22900,13100))
})