# The New York Times App

### The New York Times App is an iOS application that allows users to read news articles.The app utilizes the New York Times API to fetch the latest news and presents it to users through a user-friendly interface.

## Features
- Top Stories: The app fetches the latest top stories from the NYT API and displays them in a table view.
- Detail Page: Tapping on a table view cell opens a detail page that shows additional information about the selected story.
- Data Persistence: Users can save stories to their device using Core Data.
- See More: The detail page includes a "See More" button that opens the corresponding article in the user's default web browser using SafariService.
- Horizontal Scroll Support: To enable a smooth horizontal scrolling experience in the app, UIScrollView is utilized. This allows users to easily navigate through news articles by swiping horizontally.
- Additionally, for modular code organization, the project includes separate modules like NewsAPI, which contains service and model files for interacting with the New York Times API. 
 
## Dependencies
- Alamofire: A networking library used for making API requests.
- SDWebImage: Used for downloading and caching images. It provides an easy way to load and display images from URLs obtained from the New York Times API.
- SafariServices: Enables opening web links using the user's default web browser.
- Core Data: Enables data persistence for saving favorite news articles.

 ## Media

| Top Stories                  | News Detail                |  SafariServices            |
| ---------------------------- | -------------------------- | -------------------------- |
| <img src="https://github.com/GulfemmAlbayrak/News-App/assets/101430350/309b9ed1-001f-429f-b07e-f976af5911b8" width="300px"> | <img src="https://github.com/GulfemmAlbayrak/News-App/assets/101430350/b0c9abd7-24e4-439e-9da7-7a4844cffbbf" width="300px"> | <img src="https://github.com/GulfemmAlbayrak/News-App/assets/101430350/6fb00ddb-2b93-4f03-b2ee-8e073c36e236" width="300px"> |

| Vertical                     | Horizontal                 |           
| ---------------------------- | -------------------------- | 
| ![Vertical](https://media.giphy.com/media/WnuDzdizuh3DtjwP9s/giphy.gif) | ![Horizontal](https://media.giphy.com/media/SsRjJZUSWZug9TcS7z/giphy.gif) |

## Commit History

- 2023-05-19: done 
- 2023-05-18: Added AppIcocn, favorite news saved in core data
- 2023-05-17: Added scroll view 
- 2023-05-16: Added logo
- 2023-05-16: Added DetailNewsVC and SafariServices 
- 2023-05-16: NewsVC and network request is done 

