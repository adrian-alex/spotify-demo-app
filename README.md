
# Spotify App

This project is the Flutter implementation of a demo app using the Spotify API.
It uses the Bloc lib for state management and dependency injection.

Try it -> https://spotify-app-2342.web.app/#/
## Getting Started

Clone the repo locally and run:

```
flutter pub get
```
Then navigate to 'packages/data_repository' and run:
```
flutter pub get
```
And finally:
```
flutter run -d chrome
```
That's it!

While developing if you need to update the data models you can run:
```
flutter pub run build_runner build
```
Or run a script in 'packages/data_repository':
```
packages/data_repository/.serialize_models.sh
```

### Folder Structure
Here is an overview of the folder structure of the project
**The main app**
```
lib/
|- navigation  -> app navigation Bloc 
|- screens     -> all app screens
|- shared      -> shared widgets and constants
|- style       -> app styles 
|- app.dart    -> main app styling and main widget
|- main.dart   -> the entry point, injection of dependencies
```
**The data_repo**
```
src/
|- api                   -> the API implementation code
|- business              -> the business logic
|- models                -> the business models
|- storage               -> the Local Storage implementation code 
|- data_repository.dart  -> the ONLY interface to be imported by the app

```

## For questions please message Adrian A.
adrian@atomsoftworks.com

### Future work
- Implement Data Repo API calls caching for (e.g) offline support
- Implement unit tests and functional tests for the [HomePageBloc] implementation as it the core of the app (so far!)
- Implement lazy loading of results 
- Implement a tablet UX
- Improve the UI based on a UX design (exact values from a Figma/Invision/Zeplin design)
- Add the correct font-family