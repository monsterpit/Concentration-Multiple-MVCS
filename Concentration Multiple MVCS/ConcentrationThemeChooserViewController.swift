//
//  ConcentrationThemeChooserViewController.swift
//  Concentration Multiple MVCS
//
//  Created by Boppo on 15/04/19.
//  Copyright © 2019 MB. All rights reserved.
//
//SplitViewController (1) Launch Setting -> Display & Brightness -> View -> Standard -> Set
//Now did we break the iPhone version?, because we did a lot of iPad work here we added a splitView which doesn't work on iPhone
//and we changed the segue to show detail.The iPhone cant show splitView so it can't show detail does this break everything.
//The answer is No because iOS is really smart and it know the structure of having splitView with a navigation Controller inside it even with show details that when we are on iPhone do it all in your navigation controller
// This called adapting to different trait collection

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
        //        if segue.identifier == "Choose Theme"{
        //            if let button = sender as? UIButton{
        //                if let themeName = button.currentTitle{
        //                    if let theme = themes[themeName]{
        //
        //                    }
        //                }
        //            }
        //        }
        
        //        if segue.identifier == "Choose Theme"{
        //            if let button = sender as? UIButton{
        //                if let themeName = button.currentTitle,let theme = themes[themeName]
        //                {
        //                }
        //            }
        //        }
        
        if segue.identifier == "Choose Theme"{
            //Optional Chaining
            if let themeName = (sender as? UIButton)?.currentTitle,let theme = themes[themeName]
            {
                //downcast the UIViewController to ConcentrationViewController using as?
                if let cvc = segue.destination as? ConcentrationViewController{
                    cvc.theme = theme
                }
            }
        }
    }


}
