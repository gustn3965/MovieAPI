<img width="355" alt="movieApi1" src="https://user-images.githubusercontent.com/48749182/59826508-6c5afa80-9371-11e9-8bc3-c748b14ec587.png">
<img width="355" alt="movieApi2" src="https://user-images.githubusercontent.com/48749182/59826509-6c5afa80-9371-11e9-851b-a8485351c47d.png">
<img width="355" alt="movieApi3" src="https://user-images.githubusercontent.com/48749182/59826510-6c5afa80-9371-11e9-8622-edc1722ff31f.png">
<img width="355" alt="movieApi4" src="https://user-images.githubusercontent.com/48749182/59826511-6c5afa80-9371-11e9-85e1-93a55e9de0ba.png">




### **Why I Made ?** 
I want just movie info that how much movie sales , and how much audience saw. 


### **Recap This App**
You can select date you want. ( Maybe you can seach date from 12.01.2003 to current date.)
If you select date, you can get movie info that contains movie title, audience , sales  by touch button.
this app show you movieList by tableViewList. 
Movie list you see was showed on that day. 
So you can touch each viewCell that show you DetailView are composed  labels that contains title, openDate, count, nations , actors , audits , staff , company. 

### **Movie Source**
This movie info can be get KoreaMovieApi ( http://www.kobis.or.kr/kobisopenapi/homepg/apiservice/searchServiceInfo.do  )
you should sign up and login, you can get Key to get movie info. 
but to sign up is easy. It doesn't require your privacy info. 


### **How To Solve Error** 
I firstly got error when I require movieApi to get movieInfo. 
I don't know exactly why  movieInfo can't be got. But by searching in google , I was able to address this problem. 
![스크린샷 2019-06-20 오후 3 29 30](https://user-images.githubusercontent.com/48749182/59827168-ecce2b00-9372-11e9-9e85-ffea21669948.jpg)
I can't exactly remember this error was showed in Xcode, but that was association with HTTP.

### **Feature I Used**
DatePicker
URLSession
Codable
TableVIew, Cell 
Segue

### **What I Learned**
1. Codable is very useful, great, awesome! 
( I had learned Codabl by swift-online-class ( Jun won Lee/ FastCampus ) )
2. How to make DatePicker.
Just I am content with that I can see my app I had conceived.



 
