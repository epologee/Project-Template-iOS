#Project Template iOS
Xcode Project Template for iOS apps, includes a series of usual libraries via CocoaPods, theming stubs and a folder structure suitable for both small and large projects.

##How to get started
1. Make sure you have [CocoaPods](https://github.com/CocoaPods/CocoaPods) installed.
1. Clone this repository into a location of your choosing, like your projects folder.
2. Create a symbolic link from the enclosed directory 'template' to your library's project templates folder in the terminal: `ln -s '/Users/*USER*/*path-to-repository*/Project-Template-iOS/template' '/Users/*USER*/Library/Developer/Xcode/Templates/Application/Project Templates/Application by epologee'` - note: substitute the `*USER*` parts with your own username and check that the path to the template folder is correct. Type `pwd` into the terminal if you're unsure, *do not use the tilde (`~`)*. The last part of the library path will show up in Xcode as the name of the template, in this case 'Application by epologee'.
3. Create a new Xcode project and choose the 'Application' icon in the 'Application by epologee' section. Fill out the necessaries, pick whether you want Core Data included and don't forget to enter a nice and catchy class prefix.
4. Close the project after Xcode finishes its creation, then go to the terminal and `cd` to your new project folder. Type `pod install` and watch CocoaPods perform magic.
5. Open the .xcworkspace file from the Finder and hit Xcode's 'run' button.
6. Create awesome apps.

##Theming
The \*Theme classes in the project template are based on the concept Apple employees explain in the last 20 minutes of the WWDC 2012 presentation 'Advanced Appearance Customization on iOS' ([session 216](https://developer.apple.com/videos/wwdc/2012/?id=216)).