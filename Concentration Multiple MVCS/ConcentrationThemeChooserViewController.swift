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

//TabBar
//relationship viewcontroller it's not a segue,it's just adding it has a view controller
//Image that go in TabBar item is alpha only image.So all the drawing you do is with transparent pixels or opaque once
//And if they are transparent then kind of iOS is gonna shine light through those transparent pixels and that's what gonna show up as your tab bar.
//The other thing you can do that's kinda cool is you can reorder the tabs
import UIKit

class ConcentrationThemeChooserViewController: UIViewController {



    let themes = [
        "Sports" : "🥎🏀🎳⚽️🏹🏏🏓🏎🥊🎱🚵‍♀️",
        "Animals": "🐲🦢🦞🐇🐈🐒🐍🐔🐧🐸🦄",
        "Faces"  : "😀😇😂🤪🧐🥳🥶🙄🤯😎🤩"
        ]
    
    //actually now we know how to deal with Any so we aint use UIButton this time
    //segue is not from button its from 1 viewcontroller to other so it's a generic segue from 1 view controller to other
    //creation of that generic segue you have to ctrl + drag from yellow circle of viewcontroller to other
    //MARK :- Manual Segue
    //This is manual segue you create a segue between 2 viewControllers and then in your code you just say performSegue(withIdentifier: "Choose Theme", sender: sender)
     //Why would you do a manual Segue? Well you do it whenever you need a conditional segue, you may or may not want a segue here.
    //You can also use that should perform segue method to conditional segue
    
    @IBAction func changeTheme(_ sender: Any) {
        if let cvc = splitViewDetailConcentrationViewController {
        if let themeName = (sender as? UIButton)?.currentTitle,let theme = themes[themeName]{
            cvc.theme = theme
        }
        }
        else{
        performSegue(withIdentifier: "Choose Theme", sender: sender)
        }
    }
   
    //var that find splitView detail controller as a ConcentrationViewController
    //if all condition pass we where able to find ConcentrationViewController in splitViewController detail controller
    private var splitViewDetailConcentrationViewController : ConcentrationViewController?{
        return splitViewController?.viewControllers.last as? ConcentrationViewController
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        
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
