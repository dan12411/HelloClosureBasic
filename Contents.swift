//////////////////////////////////
///Closure 是沒有名字的函式//////////
///Closure 在Swift是一個值，有型別///
///ㄕ/////////////////
//////////////////////////////////

// 無參數的Closure
// 把名字刪掉，存進一個變數
// () 可寫成 Void
let helloClosure: () -> () = {
    print("Hello Everybody")
}

// 有參數的 Closure
// 1.把名字刪掉，存進一個變數
// 2.把參數和回傳值放進大括號裡面，加上關鍵詞"in"
let eatClosure: (String) -> () = {
    (foodname: String) in
    print("I want to have some \(foodname)")
}


let buyClosure: (String, Int) -> () = {
    (thing: String, money: Int) in
    print("I want buy \(thing) with \(money) dollars")
}

buyClosure("milk", 90)


// 有參數 & 回傳值的Closure
let addClosure: (Int, Int) -> Int = {
    (number1:Int, number2: Int) -> Int in
    let result = number1 + number2
    return result
}

addClosure(4,5)




///Closure 可當某函式的參數
func calculate(number1: Int, number2: Int, operation:(Int, Int)->Int)-> Int {
    return operation(number1, number2)
}

calculate(number1: 3, number2: 4, operation: addClosure)


///Closure 可當某函式的回傳值
func giveAddClosure() -> (Int, Int) -> Int {
    return addClosure
}

/// Closre 不僅可回傳值，還可把附近的值回傳出去
/// e.x., 計數器
func giveMeCounter() -> () -> (Int) {
    var counterNumber = 0
    return {
        () -> (Int) in
        counterNumber += 1
        return counterNumber
    }

}

var counter = giveMeCounter()
counter()
counter()
counter()

var anotherCounter = giveMeCounter()
anotherCounter()
counter()


/// Reference Type
counter = anotherCounter
counter()

/// Closure 簡寫
/// 1.如果已經知道參數跟回傳值的型別的話，可以省略closure裡的參數和型別
/// 2.如果closure 有回傳值，而且程式碼是一行的話，可以省略return
/// 3.可以用$0 或 $1 ...等代表參數
/// 4.如果closure 是最後一個參數的話，可以把closure 寫在小括號外面
/// 5.如果closure 是唯一個參數的話，可以省略小括號

let addClosure2: (Int, Int) -> Int = { $0 + $1 }


/// Closure 可以跟陣列配合使用

/// 陣列有的 Map 方法，作用是把每個成員拿出來做些事情
let numberArray = [1,3,6,8,9,10,45,67,29,93]

numberArray.map({
    (number: Int) in
    return number + 10
})

/// 省略版
let resultArray = numberArray.map{ $0 + 10 }

numberArray.map({
    (x: Int) in
    print("This is number \(x)")
})

/// 省略版
numberArray.map{print("This is number \($0)")}


let fruitArray = ["apple", "banana", "mango", "watermelon"]
let resultFruit = fruitArray.map({
    (fruit: String) -> String in
    return "I love " + fruit
})


/// 陣列有 filter 方法
numberArray.filter({
    (number:Int) -> Bool in
    return number > 5
})

numberArray.filter{ $0 > 5 }

/// 篩選頭文字a
fruitArray.filter({
    (fruit: String) -> Bool in
    return fruit.hasPrefix("a")

})

/// 省略版
fruitArray.filter{ $0.hasPrefix("a") }


/// 篩選有文字o
import Foundation
fruitArray.filter({
    (fruit: String) -> Bool in
    return fruit.contains("o")
    
})

/// 省略版
fruitArray.filter{ $0.contains("o") }




/// Optional(Int)
var thisNumer: Int? = 4
/// Optional(Bool)
var isHere: Bool? = nil
/// Optional(String)
var myQuote: String? = nil
/// 三個都是Optional類別，Optional 是 enum

/// 1. 直接用驚嘆號取值(絕對不要這樣用)
thisNumer! + 5

/// 2. 先判斷有沒有值，有值再取出
if thisNumer != nil {
    thisNumer! + 5
}

/// 3. Optional Binding
if let okNumber = thisNumer {
    okNumber + 5
}




