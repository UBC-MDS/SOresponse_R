# SOresponse_R     
    
[![Build Status](https://travis-ci.org/UBC-MDS/SOresponse_R.svg?branch=master)](https://travis-ci.org/UBC-MDS/SOresponse_R)

### Installation

Install this package directly from GitHub:
```
devtools::install_github("UBC-MDS/SOresponse_R")
```

### Usage
Simple example demonstrating the functionality of this package:

```
# load package
library(SOresponse_R)

# load Stack Overflow response page

web_page('https://stackoverflow.com/questions/100003/what-are-metaclasses-in-python?rq=1')

# Returns authors selected answer
popular('https://stackoverflow.com/questions/100003/what-are-metaclasses-in-python?rq=1', ‘likes’)

# Returns general statistics about response page
response_stats('https://stackoverflow.com/questions/100003/what-are-metaclasses-in-python?rq=1')
```

### Contributors

* Ted Thompson (@TeddTech)
* Fang Yang (@fyang95)
* Ying Dong (@yvonnedy)   

### Overview

The `SOresponse` package is used for text analysis of Stack Overflow responses. There are both R and Python versions for this package. This package will include 3 functions: `web_page()` `popular()` `response_stats()`

* `web_page(url)`: Loads Stack Overflow response webpage.

	*Argument:*

  `url` - Web address of Stack Overflow response page. (Must enter exact URL)

	*Value:*

  Returns the question being asked on the given Stack Overflow response webpage. If unsuccessful corresponding error will be returned.

* `popular(url, type = 'likes')`: Returns most popular response on webpage.       

  *Arguments:*

    `url` - An object that used the `web_page()` function.

    `type` - "likes" returns response with the most likes. "author" returns response confirmed by author of question.

  *Value:*

    Returns a response. This will be of a character type.

* `response_stats(url)`: Returns general statistics about question being asked on Stack Overflow page.

  *Argument:*

    `url` - An object that used the `web_page()` function.

  *Value:*

    Returns a vector of length 4 that includes number of responses, average reputation score, top reputation score, author reputation score.

Similar packages to `SOresponse` are `Py-StackExchange` for python and `overflowr` for R. `Py-StackExchange` is well managed and has been kept up to date. `overflowr` has been abandon. There links respectively are https://github.com/lucjon/Py-StackExchange and https://meta.stackexchange.com/questions/174972/stackoverflow-api-for-r.
