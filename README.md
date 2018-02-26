# SOresponse_R

### Contributors

* Ted Thompson (@TeddTech)
* Fang Yang (@fyang95)
* Ying Dong (@yvonnedy)   
    
### Overview

The `SOresponse` package is used for text analysis of Stack Overflow responses. There are both R and Python versions for this package. This package will include 3 functions: `web_page()` `popular()` `response_stats()`

* `web_page(url)`: Loads Stack Overflow response webpage.
	Arguments:
			`url` - Web adress of Stack Overflow response page. (Must enter exact URL)
	Value: 
			returns the question being asked on the given Stack Overflow response webpage. If unsuccessful corisponding error will be returned.

* `popular(question)`: Returns most popular response on webpage.
	Arguments:
			`question` - An object that used the `web_page()` function.
	Value:
			Returns a response. This will be of a character type.

* `response_stats(question)`: Returns general statistics about question being asked on stack overflow page.
	Arguments:
			`question` - An object that used the `web_page()` function.
	Value:
			Returns ....#NEEDSFIXING

Similar packages to SOresponseR are `Py-StackExchange` for python and `overflowr` for R. Py-StackExchange is well managed and has been kept up to date. `overflowr` has been abandon. There links respectively are https://github.com/lucjon/Py-StackExchange and https://meta.stackexchange.com/questions/174972/stackoverflow-api-for-r.

