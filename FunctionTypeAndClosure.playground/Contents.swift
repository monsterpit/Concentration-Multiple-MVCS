import UIKit


// Function type
var operation : ((Double) -> Double)!

operation = sqrt

operation(4.0)


//Closure (creating a function on fly)

//dummy example
func changeSign(operand : Double)-> Double{ return -operand}

var operation1 : (Double) -> Double = changeSign
let result = operation1(4.0)


//Closure

//we can "in line" changeSign simply by moving the function (without its name) below ...

//var operation2 : (Double) -> Double = (operand : Double)-> Double{ return -operand}

//but we have to make 1 syntactic change here
//Move the first  { to the start and replace with in

var operation2 : (Double) -> Double = {(operand : Double)-> Double in return -operand}
let result2 = operation2(4.0)


//But it can get much better has we have type inference in swift

//Swift knows this operation thing returns a Double

var operation3 : (Double) -> Double = {(operand : Double) in return -operand}
let result3 = operation3(4.0)

//It also knows its operands are Double
var operation4 : (Double) -> Double = {(operand) in return -operand}
let result4 = operation3(4.0)


//It also knows that operation returns a value, so the return keyword is unnecessary
var operation5 : (Double) -> Double = {(operand) in  -operand}
let result5 = operation3(4.0)


//swift knows you need embedded functions all the time and its little annoying to think of the names for the argument to "operand" thing. So its lets you substitute $0,$1,$2 .... and we can skip "in"
var operation6 : (Double) -> Double = {-$0}
let result6 = operation3(4.0)

//$0,$1 are shorthand notations



//Array has a method called map which takes a function as an argument.
//It applies that function to each element of the Array to create and return a new Array
//map is way to pass a function to a array and tell it to do it on every element

let primes = [2.0,3.0,5.0,7.0,11.0]
//let negativePrimes = primes.map(<#T##transform: (Double) throws -> T##(Double) throws -> T#>)
//let negativePrimes = primes.map { (<#Double#>) -> T in
//    <#code#>
//}
//let negativePrimes = primes.map { (<#Double#>)  in
//    <#code#>
//}
let negativePrimes = primes.map ({ -$0 })
let invertedPrimes = primes.map() { 1.0/$0 }
let primeString = primes.map { String($0) }

//Trailing Closure Syntax(if the last argument to any function is a closure you can move the closure outside the parenthesis and if its the only argument then you can get rid of parenthesis entirely )
//Note that if last(or only) argument to a method is a closure,you can put it outside the method's paranthesis that contain its arguments and if the closure was the only argument,you can skip the () completely if you want



//closure is property initialization
var a : Int = {
    let b = 2
    return b+2
}()


//Closure  Memory Leaks
//var ltuae = 42.0
//var operation7 : (Double) -> Double = {ltuae * $0}
////captures the ltuae var because its needed for this closure
//var arrayOfOperations : [(Double)->Double]!
//arrayOfOperations.append(operation7)

//If we later change ltuae, then the next time we evaluate operation it will reflect that
//even if we leave the scope (function or whatever) that this code is in


