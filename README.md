### [Getting Started](#getting-started)
Do you ever get depressed when you have to go through the same processes over and over again to implement a new feature?

Okay, Let's try something new to make your working time more productive.

### [Custom Your Own Template](#custom-your-own-template)
All you have to do is create your expected format file inside the .xctemplate folder. For example:
`___FILEBASENAME___ViewController.swift`
````
import UIKit

class ___VARIABLE_ModuleName___ViewController: UIViewController {

    var viewModel: ___VARIABLE_ModuleName___ViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
````
* `___FILEBASENAME___`: This is name of the file.
* `___VARIABLE_ModuleName___`: This is the identifier of your new feature. You can custom your own id by editing the `value-key` inside the TemplateInfo.plist file. 
See also
[Text macros reference](https://help.apple.com/xcode/mac/9.0/index.html?localePath=en.lproj#/dev7fe737ce0)

### [Usage](#usage)

There are two approaches in order to install the template.

#### Approach 1: Execute this command
``sudo swift install.swift``

#### Approach 2: Manual
Go to Application folder, browse to the Xcode application icon. Right-click it and choose 'Show Package Contents'. Then browse to:
``Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/Project Templates/iOS/Application``
Copy the template and paste it into the `Application`.