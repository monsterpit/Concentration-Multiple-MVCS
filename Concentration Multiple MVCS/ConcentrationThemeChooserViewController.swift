//
//  ConcentrationThemeChooserViewController.swift
//  Concentration Multiple MVCS
//
//  Created by Boppo on 15/04/19.
//  Copyright © 2019 MB. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController {


//kinda very bad which is I am gonna look at button that caused the segue to decide which theme to show...
// It's bad and hsould never do that  because what happens when i convert it to french , chinese
    // I am gonna have code have French and Chinese in it work those languages no !!! it makes no sense
    //So you never really wanna drive your code from something that's in the UI.
    // Because UI is gonna be in 40 different languages, you hope if your app is successful
    //But for demo is good and can be done quickly but for production really worst
 
    //name of button title that's what bad design
    // dictionary has name of theme and theme itself
    let themes = [
        "Sports" : "🥎🏀🎳⚽️🏹🏏🏓🏎🥊🎱🚵‍♀️",
        "Animals": "🐲🦢🦞🐇🐈🐒🐍🐔🐧🐸🦄",
        "Faces"  : "😀😇😂🤪🧐🥳🥶🙄🤯😎🤩"
        ]
    
    
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }


}