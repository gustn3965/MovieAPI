# MovieAPI
Get Movie Info By MovieAPI In Swfit 


movieApi1
movieApi2
movieApi3
movieApi4
Why I Made ?

I want just movie info that how much movie sales , and how much audience saw.

Recap This App

You can select date you want. ( Maybe you can seach date from 12.01.2003 to current date.)
If you select date, you can get movie info that contains movie title, audience , sales by touch button.
this app show you movieList by tableViewList.
Movie list you see was showed on that day.
So you can touch each viewCell that show you DetailView are composed labels that contains title, openDate, count, nations , actors , audits , staff , company.

Movie Source

This movie info can be get KoreaMovieApi ( http://www.kobis.or.kr/kobisopenapi/homepg/apiservice/searchServiceInfo.do )
you should sign up and login, you can get Key to get movie info.
but to sign up is easy. It doesn't require your privacy info.

How To Solve Error

I firstly got error when I require movieApi to get movieInfo.
I don't know exactly why movieInfo can't be got. But by searching in google , I was able to address this problem.
스크린샷 2019-06-20 오후 3 29 30
I can't exactly remember this error was showed in Xcode, but that was association with HTTP.

Feature I Used

DatePicker
URLSession
Codable
TableVIew, Cell
Segue

What I Learned

Codable is very useful, great, awesome!
( I had learned Codabl by swift-online-class ( Jun won Lee/ FastCampus ) )
How to make DatePicker.
Just I am content with that I can see my app I had conceived.
