# Garupa Test App
<p align="center">
  <p align="center">
    The Garupa Test App is an app built for the Garupa's technical challenge, its consume the <a href="https://punkapi.com/documentation/v2">PunkAPI</a> to show a list of beers.
  </p>
</p>

<p align="center">
<img src= "https://github.com/matheusjkweber/GarupaTest/blob/main/GarupaTest/App/main_image.png" width="400" >
</p>

## Architecture
The Garupa Test App is built using the <a href="https://betterprogramming.pub/battle-of-the-ios-architecture-patterns-a-look-at-model-view-viewmodel-mvvm-bdfd07d9395e">MVVM(Model-View-ViewModel)</a> architecture. The MVVM architecture says that the ViewModel is responsible for treating the information received from the Model, and populate the View. It works like the interactor of the View, maintaning all the product logic into it.

### More Information
Also, the FaireWeather uses an own API developed by me using the <a href="https://malcolmkmd.medium.com/writing-network-layer-in-swift-protocol-oriented-approach-4fa40ef1f908">Malcolm Kumwenda`s Medium Tutorial</a>. In the future, support for RXSwift will be added.

## Requirements

- iOS 16.0+
- Xcode 14.2

## Installation

#### CocoaPods
To install the FaireWeather app you must have [CocoaPods](http://cocoapods.org/) installed, and run the following command:

```
pod install
```

#### CocoaPods
In order to test the app, you need to change the target to *GarupaTestTests* and run the *cmd+U* command.