# Simple Shop

Simple Shop is an iOS application built with Swift that provides users with an interface to view and purchase products from an online store. The application uses several technologies and design patterns to implement its functionality.

## Architecture

The application uses the Model-View-Controller (MVC) architecture pattern. The model represents the data of the application, the view handles the UI elements and user interactions, and the controller acts as a mediator between the model and the view.

## Networking

The application fetches product data from an API using the URLSession framework. The data is then parsed into a Swift struct using the Codable protocol. The application uses the Result type to handle success and error cases when fetching data from the server.

## Image Handling

The application uses the SDWebImage framework to download and cache product images. This helps reduce processor load and minimize internet usage by not downloading images again if they already have the same link.

## Error Handling

The application handles errors that may occur during network requests by presenting the user with an alert view that suggests checking their internet connection or trying again later. The application also displays an alert view when the user tries to add a product to their cart but the quantity exceeds the available stock.

## Localization

The application supports localization by using the NSLocalizedString function to load strings from the Localizable.strings file. The application currently supports English and Arabic languages.

## Testing

The application includes unit tests for the networking layer and model layer using the XCTest framework. The tests simulate network requests and parsing of JSON data to ensure that the application behaves as expected under different conditions.

## Pictures

<img src="https://github.com/Haris-Alsaman/Simple_Shop/blob/main/Pictures/Picture.png" width="880">

