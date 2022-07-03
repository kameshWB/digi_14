# digi_14

Flutter project to fetch data from api. I have used BLOC (Industry standard) for state management, Get It for Dependency Injection. Used sentry to implement error reporting.

## Project Structure

The structure of the project designed in such a way that all the features are independent and can be easily added to other projects also. I have written tests in tests folder for the repository and bloc as-well. 

Overview of file structure

![image](https://user-images.githubusercontent.com/58357944/177025557-ff320eba-2ea7-4c17-8739-2a5b4b5dfea5.png)
 
core - this folder consists of all the core helpers, implementations of network helpers, error handeling etc
 
features - this folder is a collection of multiple fetures of the app, in this case events is a feature inside it holds all the bloc, repositories,  models, views and widgets used.

![image](https://user-images.githubusercontent.com/58357944/177025925-c594a704-99b0-48ba-8d67-9c5c1a65372f.png)
![image](https://user-images.githubusercontent.com/58357944/177025865-0389d7db-1453-495e-a26a-e0647c1df21b.png)

