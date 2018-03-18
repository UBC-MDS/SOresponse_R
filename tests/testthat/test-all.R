

url <- "https://stackoverflow.com/questions/68645/static-class-variables-in-python?rq=1"
url1 <- 'https://stackoverflow.com/questions/44601375/what-is-the-unit-of-the-ruler-in-android-studio-layout-editor'
url2 <- 'https://stackoverflow.com/questions/49342993/from-crystal-report-to-windows-form-applicationro'
type<- "likes,author"

test_that("There is no accepted answer",{
  expect_error(popular(url1, 'author'),"There is no accepted answer!") #test if there is an author chosen response

})

test_that("There are no answers",{
  expect_error(popular(url2),"There is no response!") #checks if there are responses to the question

})

#test url is correct
test_that("url is correct",{
  expect_equal(typeof(url),"character") #test the type of url is string
  expect_match(url, "stackoverflow.com/questions",ignore.case = TRUE) #test the url is in a good format
})

#test web_page function is correct
test_that("web_page is correct",{ #test the question maps the url
  expect_match(web_page(url),c("Static class variables in Python"))
})



#test the argument of popular function is correct
test_that("popular_argument is correct",{ #test if the argument is "likes" or "author"
  expect_match(type, "likes", ignore.case=TRUE)
})



#test the popular_response is correct
test_that("popular is correct as normal case",{#test the response maps the url
  expect_equal(popular(url),"\r\nVariables declared inside the class definition, but not inside a method are class or static variables:\n\n>>> class MyClass:\n...     i = 3\n...\n>>> MyClass.i\n3 \n\n\nAs @millerdev points out, this creates a class-level i variable, but this is distinct from any instance-level i variable, so you could have\n\n>>> m = MyClass()\n>>> m.i = 4\n>>> MyClass.i, m.i\n>>> (3, 4)\n\n\nThis is different from C++ and Java, but not so different from C#, where a static member can't be accessed using a reference to an instance.\n\nSee what the Python tutorial has to say on the subject of classes and class objects.\n\n@Steve Johnson has already answered regarding static methods, also documented under \"Built-in Functions\" in the Python Library Reference.\n\nclass C:\n    @staticmethod\n    def f(arg1, arg2, ...): ...\n\n\n@beidy recommends classmethods over staticmethod, as the method then receives the class type as the first argument, but I'm still a little fuzzy on the advantages of this approach over staticmethod. If you are too, then it probably doesn't matter.\n    ")
})


#test the response_stats is correct
test_that("response_stats is correct",{
  expect_equal(response_stats(url),c(16,  20432.30769, 230000,  18400))
})
