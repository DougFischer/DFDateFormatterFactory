# DFDateFormatterFactory

Smart reuse of NSDateFormatter instances.

`NSDateFormatter` class is very useful to display dates the way you want, handling regional settings, locales and formats. 

The bad thing about `NSDateFormatter` is the cost to create a new instance or set format and locale. Actually these actions are one of the most slow operations on iOS SDK and you really must avoid it.

`DFDateFormatterFactory` is here to help you with this. This class retain the last 15 date formatter instances and return the already loaded based on format and locale you want. Also, the cache were implemented using the standard `NSCache` and should handle memory fine when memory warnings happens. 


[Read this article to understand more about expensive objects like NSDateFormatter](http://www.raywenderlich.com/31166/25-ios-app-performance-tips-tricks#reuseobjects)


##Instalation

To install the `DFDateFormatterFactory`, just drag and drop the .h and .m files into your project folder. Import them when you need it.


##Usage

```bash
NSDateFormatter *brazilianDateFormatter = [[DFDateFormatterFactory sharedFactory] dateFormatterWithFormat:@"dd/MM/yyyy" andLocaleIdentifier:@"pt-BR"];
```


##Development

I'm using `DFDateFormatterFactory` in production apps since months ago without any issues, but you are really welcome to suggest improvements or report bugs.


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/DougFischer/dfdateformatterfactory/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

