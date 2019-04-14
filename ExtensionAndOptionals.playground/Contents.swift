var str = "Hello, playground"

enum FastFoodMenuItem{
    case hamburger(numberOfPatties : Int)
    case fries(size : FryOrderSize)
    case drink(String,ounces : Int) //Unnamed String is the brand ,e.g. "Coke"
    case cookie
}
enum FryOrderSize{
    case large
    case small
}

let menuItemInferred : FastFoodMenuItem = FastFoodMenuItem.hamburger(numberOfPatties: 2)

var otherItemInferred : FastFoodMenuItem = FastFoodMenuItem.cookie

//Setting the value of an enum
//Swift can infer the type on one side of the assignment or the other(but not both)

let menuItem  = FastFoodMenuItem.hamburger(numberOfPatties: 2)

var otherItem : FastFoodMenuItem = .cookie

// var yetAnotherItem = .cookie // Swift can't figure it Out


//Checking an enum state
// you cant use = in enum You use switch
//An enum's state is checked with a switch statement ..

switch menuItem {
case FastFoodMenuItem.hamburger:
    print("burger")
case FastFoodMenuItem.fries: print("Fries")
case FastFoodMenuItem.drink: print("drink")
case FastFoodMenuItem.cookie:
    print("cookie")
}

// Note that we are ignoring the "associated data" above

switch menuItem {
case .hamburger:
    print("burger")
case .fries: print("Fries")
case .drink: print("drink")
case .cookie:
    print("cookie")
}

//It is not necessary to use the fully-expressed FastFoodMenuIteem.fries insidee the switch (since Swift can infer the FastFoodMenuItem part of that)

//break
//If you don't want to do anything in a given case,use break

switch menuItem {
case .hamburger:
    break
case .fries: print("Fries")
case .drink: print("drink")
case .cookie:
    print("cookie")
}
//this would print nothing on the console

//default
//You must handle ALL the possible cases(although you can use default for uninteresting cases)

switch otherItem {
case .hamburger:
    break
case .fries: print("Fries")
default : print("other")
}

//In swift you can switch on Any type
//e.g. on String "abc" you will have case a case b case c case ab case abc


//Multiple lines allowed
//Each case in a switch can be multiple lines and does NOT fall through to the next case

// by default behaviour of swift is that case breaks automatically to execute next case we must use "fallthrough"
otherItem = FastFoodMenuItem.fries(size: FryOrderSize.large)
switch otherItem {
case .hamburger:
    print("burger")
case .fries:
    print("Fries")
    print("yummy")
    fallthrough
case .drink: print("drink")
case .cookie:
    print("cookie")
}

// infered FryOrderSize
otherItem = FastFoodMenuItem.fries(size: .large)
switch otherItem {
case .hamburger:
    print("burger")
case .fries:
    print("Fries")
    print("yummy")
case .drink: print("drink")
case .cookie:
    print("cookie")
}


//What about the associated Data?
//Associated data is accessed through a switch statement using "let" syntax

//enum FastFoodMenuItem{
//    case hamburger(numberOfPatties : Int)
//    case fries(size : FryOrderSize)
//    case drink(String,ounces : Int) //Unnamed String is the brand ,e.g. "Coke"
//    case cookie
//}

otherItem = FastFoodMenuItem.drink("Coke", ounces: 3)
switch otherItem {
case .hamburger(let pattyCount):
    print("a burger with \(pattyCount) patties")
case .fries(let size):
    print("a \(size) order of fries")
case .drink(let brand,let ounces): print("a \(ounces) oz \(brand)")
case .cookie:
    print("a cookie!")
}
//Note that the local variable that retrives the associated data can be different name
//(e.g. pattyCount above versus patties in the enum decalaration)
//(e.g. brand above versus not even having a name in the enum declaration)


//Methods yes,(stored Properties no)
//An enum can have methods(and computed properties) but no stored properties ...

enum FastFoodMenuItem1{
    case hamburger(numberOfPatties : Int)
    case fries(size : FryOrderSize)
    case drink(String,ounces : Int) //Unnamed String is the brand ,e.g. "Coke"
    case cookie
    func isIncludedInSpecialOrder(number : Int)-> Bool{
        switch self {
        case .hamburger(let pattyCount):
            return pattyCount == number
        // combing 2 case or more cases
        case .fries,.cookie:
            return true
        // _ if we dnt want variable
        case .drink(_,let ounces): return ounces == 16
        }
    }
    var calories : Int{
        //calculate and return caloric value here
        return 2
    }
}


// Modifying self in an enum
// you can even reassign "self" inside an enum method

enum FastFoodMenuItem2{
    case hamburger(numberOfPatties : Int)
    case fries(size : FryOrderSize)
    case drink(String,ounces : Int) //Unnamed String is the brand ,e.g. "Coke"
    case cookie
    func isIncludedInSpecialOrder(number : Int)-> Bool{
        switch self {
        case .hamburger(let pattyCount):
            return pattyCount == number
        // combing 2 case or more cases
        case .fries,.cookie:
            return true
        // _ if we dnt want variable
        case .drink(_,let ounces): return ounces == 16
        }
    }
    var calories : Int{
        //calculate and return caloric value here
        return 2
    }
    
    mutating func switchToBeingCookie(){
        self = .cookie //this works even if self is a .hamburger,.fries or .drink
    }
}

//Note that mutating is required because enum is a VALUE TYPE
//Mutating which func might write


//Optional
// So an Optional is just an enum
//It essentially looks like this

//enum Optional1<T>{
//    // a generic type like Array<Element> or Dictionary<Key,Value>
//    case none
//    case some<T> //some case has associated data of type T
//}



let hello : String? = "abc"

//Explicit unwrapped Optional ?
//Implicitly unwrapped optional !
if let greeting = hello{
    print("\(greeting)")
}
else{
    print("value was none")
}

switch hello{
case .none:
    print("value was none")
    //raise exception crash
case .some(let data):
    print("\(data)")
    
}

// Nil coalescing Operator

print("\(hello ?? "no values")")

switch hello{
case .none:
    print("no values")
case .some(let data):
    print("\(data)")
}


//Optional Chaining
//let x: String?
//let y = x?.foo()?.bar?.z

// if any value returns nil all condition fails and bails out to be nil

//ARC(automatic Refernce counting)
//Influnced by by keywords:-
//strong :-(default)
//weak:-(works with only optional pointer to reference types)(which Outlets are)(dont keep reference count oon my behalf)
//unowned :- means dont reference count this,crash if I'm wrong
//rarely used unowned only used to avoid memory cycle
//memory cycle are not generally created in swift 1 way to create them is using closure in swift
