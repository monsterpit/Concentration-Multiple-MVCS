import Foundation
var str = "Hello, playground"

let pizzaJoint = "café pesto"

let firstCharacterIndex = pizzaJoint.startIndex

let fourthCharacterIndex = pizzaJoint.index(firstCharacterIndex, offsetBy: 3)

let fourthCharacter = pizzaJoint[fourthCharacterIndex]

if let firstSpace = pizzaJoint.firstIndex(of: " ")
{//returns nil if " " not found
    let secondWordIndex = pizzaJoint.index(firstSpace, offsetBy: 1)
    let secondWord = pizzaJoint[secondWordIndex..<pizzaJoint.endIndex]
    //Note the ..< above
//    This is a Range of String.Index
//    Range is a generic type(like Array is).It doesnt have to be range of Ints
    //.index(firstSpace, offsetBy: 1) is a collection method so its also a generic type  which a String may or may not implement
    
    //Another way to find the second word :
//    by components(separatedBy : " ") returns an Array<String>(might be empty though)
//    which is a method of collection
    pizzaJoint.components(separatedBy: " ")
}


//The characters in a String
//String is also a Collection(in same sense that an Array is a Collection) of Characters
//All the indexing stuff(index(of:),etc.)is part of Collection.
//A Collection is also a Sequence,so you can do things like ...
let s = "Characters pésto"
for  c in s {c}

//Trick to use Int instead of String.Index
//(Array has an init that takes any Sequence as an argument.)
Array("Characters pésto")
//And now you can use Int to index characters instead on String.Index


//A String is a value type(it's a struct)
// we usually work with immutable Strinng(i.e. let s = ...)
//But there are mutating methods on String as well, for example...
// RangeReplacable collection (Another protocol) used for collection that can be mutated

var ss = pizzaJoint //makes a mutable copy of pizzaJoint(because it's a value type)
ss.insert(contentsOf: " foo", at: pizzaJoint.firstIndex(of: " ")!)

//type of contentsOf : argument is any Collection of character(which String is)


//we dont this usually we tend we use it immutability and add using +

pizzaJoint[pizzaJoint.startIndex..<pizzaJoint.firstIndex(of: " ")!] + " foo" + pizzaJoint[pizzaJoint.firstIndex(of: " ")!..<pizzaJoint.endIndex]

//Other String MEthods
//func hasPrefix(String)->Bool
//func hasSuffix(String)->Bool
//var localizedCaptalized/Lowercase/UpperCase : String
//
//func replaceSubrange(Range<String>,with: Collection of Character)

ss.replaceSubrange(..<ss.endIndex, with: "new contents")

//Note the ..< Range appears to have no start! It defaults to the start of the String

