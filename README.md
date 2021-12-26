# TMDB Client App

## Instructions

<details>
<summary>Instructions for project setup.</summary>
<br>
1. Clone the project.
<br>
2. Go to "TMDB Client App" folder location on terminal and enter "pod install --repo-update" command.
<br>
3. Open .xcworkspace file.
<br>
4. Create config folder in "Supporting Files" folder.
<br>
<img src="Instruction Assets/instruction_0.jpeg"/>
<br>
<img src="Instruction Assets/instruction_1.jpeg"/>
<br>
5. Add your TMDB api key in your config file.
<br>
<img src="Instruction Assets/instruction_2.jpeg"/>
<br>
6. Give referance your api key defination in info.plist file.
<br>
<img src="Instruction Assets/instruction_3.jpeg"/>
<br>
7. Set your project Debug and Release configuration to your config file.
<br>
<img src="Instruction Assets/instruction_4.jpeg"/>
<br>    
8. That's all folks! You can call your api key like below;

```swift
function test() {
  console.log("notice the blank line before this function?");
}
```
</details>

## About

<details>
<summary>About project structure.</summary>
<br>
<strong>1. Folders</strong>

    .
    ├── App                                         # Files used globally the application.
    │   └── Services                                # API services.
    │       └── TMDBService.swift                   # TMDB API service definition.
    ├── Screens                                     # Screens components(model, view, view model and controller).
    │   └── Initial                                 # Initial screen components.
    │       └── Controller                          
    │           └── InitialViewController.swift     # Initial screen view controller.
    └── Supporting Files
        ├── Assets.swift                            # Generated via SwiftGen for Assets.
        ├── AppDelegate.swift                       
        ├── Assets.xcassets                         
        ├── LaunchScreen.storyboard                 
        ├── Info.plist                              
        └── Config.xcconfig                         # You need to generate your own config file for sensitive key definitions.

<br>
<strong>2. 3rd Party Libraries</strong>

Cocoapods used for package managing.

- Layout
    - SnapKit: Makes auto layout definitions easy.
- Network
    - Alamofire: Network operations.
    - Moya: Clean network layer.
    - Kingfisher: Async image downloading. 
- Helper
    - SwiftGen: Clean asset usage.

</details>
