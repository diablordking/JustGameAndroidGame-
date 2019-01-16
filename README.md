
  <p align="center">
<img src="https://user-images.githubusercontent.com/19604984/51123338-eddfb700-182c-11e9-9b31-b13ae4eb0775.png" width=60%>
</p>


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
![Python](https://img.shields.io/badge/python-v2.7%20%2F%20v3.6-blue.svg)
![Dependencies](https://img.shields.io/badge/dependencies-up%20to%20date-brightgreen.svg)
[![GitHub Issues](https://img.shields.io/github/issues/anfederico/Stocktalk.svg)](https://github.com/anfederico/stocktalk/issues)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

  <p align="center">
  <img src="https://user-images.githubusercontent.com/19604984/51222579-62127b80-194f-11e9-9b52-66592c2d2111.png" width=40% height=40%>
</p>

## Running the app
   For android application:
   
    - Open the project in Android Studio
    - Build the app
    - Run the app (Simulator/ Real Device - Targeted for API 28 Nexus 5X 1920x1080)

   For flask tensorflow posenet API:
   
    - install conda env file (environment.yaml)
    - install cuda 8.0  
    - instal cudnn v6.0
    - symlink to ubuntu 16.0 ld_library and cuda env 
    - activate conda tfpose environment 
    - run python3 app.py
      
## About the app

  Mobile application that’s the video-based game that measure your body movement and score them according to Fornite Floss Dance. 

App is targeted to people of any age:
  
    o Who's want to lose body weight.
    o Improve your dance skill 
    o Have fun with your friends
   
### Features:

    - Image processing your video 
    - Keep track of score 
    - There is also a other small game you can play.
    - Learning other cool dance moves as well.
 
### Application Uses:

    Database                  : Firebase
    Login and Authentication  : Firebase, Email-password
    Animations                : ProgressView
    

### Functionalities app consists:

    -Navigation Drawer
    -List View
    -Viewpager 
    -Fragments and Activities
    -Hosting data to cloud (firebase)
    -Real API Data
    -Parsing JSON Data
    -Image recognition

### How to score videos:

Thanks to Tensorflow/Posenet library :

  <p align="center">
  <img src="https://user-images.githubusercontent.com/19604984/51193280-8b082180-18f9-11e9-9ff3-03af7177aa47.gif" width=60%>
</p>
We can detect body parts. For scoring App will mesure distance of same body part between 2 video frame by frame. Every right body part coordination 2 point. Maximum point is 3700 for floss dance.Of course App will give user 10% tolerance. 
