# The New York Times App

##New York Times App is an iOS application that allows users to read news articles.The app utilizes the New York Times API to fetch the latest news and presents it to users through a user-friendly interface.

##Features
- Top Stories: The app fetches the latest top stories from the NYT API and displays them in a table view.
- Detail Page: Tapping on a table view cell opens a detail page that shows additional information about the selected story.
- Data Persistence: Users can save stories to their device using Core Data.
- See More: The detail page includes a "See More" button that opens the corresponding article in the user's default web browser using SafariService.

##Dependencies
- Alamofire: A networking library used for making API requests.
- SDWebImage: Used for downloading and caching images. It provides an easy way to load and display images from URLs obtained from the New York Times API.
- Core Data: Enables data persistence for saving favorite news articles.

###Additionally, for modular code organization, the project includes separate modules like NewsAPI, which contains service and model files for interacting with the New York Times API.
