# FitExercise
 
<!-- Fitbod iOS challenge -->
How to run:
1)  Download the zip file and unzip it.
2)  Open `Fitbod.xcodeproj` in xcode
3)  Run project (cmd + R or Product > Run)
4) Run test (cmd+U)
Note: I developed the project on Xcode14 using Swift 5+ & SwiftUI. I tested it on iOS16. Please let me know if you face any issues in building it. For Line graphs, I have used `Charts` api.


**Focus Area:**
- I have focused on Scalable, extensible architecture which handles error and exceptions gracefully. Currently, I’m printing errors as well as showing user facing messages. In the production app, I don’t leave a print statement. Here, It’s useful for debugging.
- I have created a minimum UI which shows all the relevant information (One rep max per exercise and plotting historical data) on a Chart
Technical/Functional consideration and tradeoffs:
- I’m using MVVM (Model view view model) architecture for this project. As this is a sample project and considering the short amount of time for development, I wanted to create a simple but extensible and testable architecture. It has everything needed with capabilities for a future enhancement.
- I have handled async loading of data using async await
- I have handled errors and exceptions. Currently, it will print an error if it happens.

**Testing**
- Tested it on small & large screen size with landscape and portrait orientation.
- Added test for `WorkoutListViewModel`


**Future Enhancement:**
If I would have more time, I would:
-  Add an option to segregate data by `Month`, `Quarter` and `Year` so user can see charts for various periods.
- Add Unit and snapshot tests.
- Optimize Charts UI. Right now its super simple and we can enhance the UI by customizing it.

**Screenshots:**
List View
---------
![Simulator Screen Shot - iPhone 14 Pro - 2023-03-21 at 09 51 30](https://user-images.githubusercontent.com/2319181/226692668-4b8c96e9-20e3-4421-bc68-62cc4e9666fe.png)

Chart View
---------
![Simulator Screen Shot - iPhone 14 Pro - 2023-03-21 at 09 53 02](https://user-images.githubusercontent.com/2319181/226692767-1feed3ed-4691-4f1d-9574-442248129128.png)
