//: Playground - noun: a place where people can play

import UIKit

print("Hello, world!")

func simpleValues() {
    var myVariable = 42
    myVariable = 50
    let myConstant = 42

    let implicitInteger = 70
    let implicitDouble = 70.0
    let explicitDouble: Double = 70

    // experiment
    let explicitFloat: Float = 4

    let label = "The width is "
    let width = 94
    let widthLabel = label + String(width)

    let apples = 3
    let oranges = 5
    let appleSummary = "I have \(apples) apples"
    let fruitSummary = "I have \(apples + oranges) pieces of fruit"
    print(appleSummary)
    print(fruitSummary)

    // experiment
    print("Hello \(explicitFloat + 1)")

    var shoppingList = ["catfish", "water", "tulips", "blue paint"]
    shoppingList[1] = "bottle of watter"
    print(shoppingList)

    var occupations = [ "Malcolm": "Captain", "Kaylee": "Mechanic" ]
    occupations["Jayne"] = "Public Relations"
    print(occupations)

    let emptyArray = [String]()
    let emptyDictionary = [String: Float]()
    print(emptyArray)
    print(emptyDictionary)
}

func controlFlow() {
    let individualScores = [75, 43, 103, 87, 12]
    var teamScore = 0
    for score in individualScores {
        if score > 50 {
            teamScore += 3
        } else {
            teamScore += 1
        }
    }
    print(teamScore)
    
    var optionalString: String? = "Hello"
    print(optionalString == nil)
    
    var optionalName: String? = nil
    var greeting = "Hello!"
    if let name = optionalName {
        greeting = "Hello, \(name)"
    } else {
        greeting = "Hello, ???"
    }
    print(greeting)
    
    let nickName: String? = nil
    let fullName: String = "John Appleseed"
    let informalGreeting = "Hi \(nickName ?? fullName)"
    print(informalGreeting)
    
    let vegetable = "red pepper"
    switch vegetable {
    case "celery":
        print("Add some rasins and make ants on a log.")
    case "cucumber", "watercress":
        print("That would make a good tea sandwich.")
    case let x where x.hasSuffix("pepper"):
        print("Is it a spicy \(x)?")
    default:
        print("Everything tastes good in soup.")
    }
    
    let interestingNumbers = [
        "Prime": [2,3,5,7,11,13],
        "Fibonacci": [1,1,2,3,5,8],
        "Square": [1,4,9,16,25]
    ]
    var kindOfLargest: String?
    var largest = 0
    for (kind, numbers) in interestingNumbers {
        for number in numbers {
            if number > largest {
                kindOfLargest = kind
                largest = number
            }
        }
    }
    print("\(kindOfLargest ?? ""): \(largest)")
}

func functionsAndClosures() {
    func greet(person: String, day: String) -> String {
        return "Hello \(person), today is \(day)."
    }
    func greetV2(_ person: String, on day: String) -> String {
        return "Hello \(person), today is \(day)."
    }
    print(greet(person: "Bob", day: "Tuesday"))
    print(greetV2("Bob", on: "Tuesday"))
    
    func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
        var min = scores[0]
        var max = scores[0]
        var sum = 0
        
        for score in scores {
            if score > max {
                max = score
            } else if score < min {
                min = score
            }
            sum += score
        }
        
        return (min, max, sum)
    }
    let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
    print(statistics.sum)
    print(statistics.2)
    
    func sumOf(numbers: Int...) -> Int {
        var sum = 0
        for number in numbers {
            sum += number
        }
        return sum
    }
    print(sumOf())
    print(sumOf(numbers: 42, 597, 12))
    
    // experiment
    func avgOf(numbers: Int...) -> Double {
        // How to pass array to variadic? A: Currently there is no way.
        // return Double(sumOf(numbers: numbers)) / Double(numbers.count)
        var sum = 0
        for number in numbers {
            sum += number
        }
        return Double(sum) / Double(numbers.count)
    }
    print(avgOf(numbers: 42, 597, 12))
    
    func makeIncrementer() -> ((Int) -> Int) {
        func addOne(number: Int) -> Int {
            return number + 1
        }
        return addOne
    }
    var increment = makeIncrementer()
    print(increment(7))
    
    func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
        for it in list {
            if condition(it) {
                return true
            }
        }
        return false
    }
    func lessThanTen(number: Int) -> Bool {
        return number < 10
    }
    var numbers = [20, 19, 7, 12]
    print(hasAnyMatches(list: numbers, condition: lessThanTen))
    
    // Can closure written more concisely?
    print(hasAnyMatches(list: [20, 19, 7, 12], condition: { (number: Int) -> Bool in
        return number < 10
    }))
    
    // Yes, omit the type of its parameters, its return type, or both.
    print(hasAnyMatches(list: [20, 19, 7, 12], condition: { number in number < 10 }))
    
    // You can refer to parameters by number instead of by name - this approach is especially
    // useful in very short closures.
    print(hasAnyMatches(list: [20, 19, 7, 12], condition: { $0 < 10 }))
    
    // A closure passed as the last argument to a function can appear immediately after the
    // parentheses.
    print(hasAnyMatches(list: [20, 19, 7, 12]) {
        $0 < 10
    })
    
    // When a closure is the only argument to a function, you can omit the parentheses entirely.
    print(numbers.sorted { $0 > $1 })
    
    print(numbers.map({ (number: Int) -> Int in
        let result = 3 * number
        return result
    }))
    
    // experiment
    print(numbers.map({ (number: Int) -> Int in
        if number % 2 == 1 {
            return 0
        } else {
            return number
        }
    }))
}

// simpleValues()
// controlFlow()
// functionsAndClosures()

/* Objects and Classes */

class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
    // experiment
    let defaultWidth = 100
    func changeWidth(_ w: Int) {
        print("change width to \(w), default width is \(defaultWidth)")
    }
}

var shape = Shape()
shape.numberOfSides = 7
print(shape.simpleDescription())
shape.changeWidth(33)

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "\(name): A shape with \(numberOfSides) sides."
    }
}
print(NamedShape(name: "epic").simpleDescription())

class Square : NamedShape {
    var sideLength: Double
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    func area() -> Double {
        return sideLength * sideLength
    }
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
print(test.area())
print(test.simpleDescription())

// experiment
class Circle : NamedShape {
    var radius: Double
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
    }
    func area() -> Double {
        // TODO how to reference PI?
        return 3.1415926 * radius * radius
    }
    override func simpleDescription() -> String {
        return "A circle with radius of \(radius)"
    }
}
let testCircle = Circle(radius: 3, name: "my test circle")
print(testCircle.area())
print(testCircle.simpleDescription())

class EquilateralTriangle : NamedShape {
    var sideLength: Double
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)"
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)

class MyClass {
    var myProp: Double {
        willSet {
            // won't be called during instance initializing
            print("oldValue: \(myProp), newValue: \(newValue)")
        }
    }
    init(value: Double) {
        self.myProp = value
    }
}
let instanceOfMyClass = MyClass(value: 3.0)
instanceOfMyClass.myProp = 2.0

/* Enumerations and Structures */

enum Rank : Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
        case .ace: return "ace"
        case .jack: return "jack"
        case .queen: return "queen"
        case .king: return "king"
        default: return String(self.rawValue)
        }
    }
    
    static let allValues = [ ace, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king ]
}
let ace = Rank.ace
let aceRawValue = ace.rawValue
print("aceRawValue: \(aceRawValue)")

func largerOf(r1: Rank, r2: Rank) -> Rank {
    return r1.rawValue < r2.rawValue ? r1 : r2
}
print(largerOf(r1: Rank.jack, r2: Rank.eight))

print(Rank.ace == Rank(rawValue: 1))

if let convertedRank = Rank(rawValue: 3) {
    let description = convertedRank.simpleDescription()
}

enum Suit {
    case spades, hearts, diamonds, clubs
    func simpleDescription() -> String {
        switch self {
        case .spades: return "spades"
        case .hearts: return "hearts"
        case .diamonds: return "diamonds"
        case .clubs: return "clubs"
        }
    }
    func color() -> String {
        switch self {
        case .spades, .clubs: return "black"
        case .hearts, .diamonds: return "red"
        }
    }
    static let allValues = [ spades, hearts, diamonds, clubs ]
}
let hearts = Suit.hearts
print(hearts)
print(hearts.simpleDescription())
print(hearts.color())

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    static func deck() -> [Card] {
        var r = [Card]()
        for suit in Suit.allValues {
            for rank in Rank.allValues {
                r.append(Card(rank: rank, suit: suit))
            }
        }
        return r
    }
}
let threeOfSpades = Card(rank: Rank.three, suit: Suit.spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()
print(threeOfSpadesDescription)
Card.deck().forEach {
    print($0)
}

enum ServerResponse {
    case result(String, String)
    case failure(String)
    case third(String)
}
let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")

switch success {
case let .result(sunrise, sunset): print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message): print("Failure... \(message)")
default: print("other response received")
}

/* Protocols and Extensions */

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass : ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
print(a.simpleDescription)
let aDescription = a.simpleDescription

struct SimpleStructure : ExampleProtocol {
    var simpleDescription: String = "A very simple structure"
    mutating func adjust() {
        simpleDescription += " (adjuested)"
    }
}
var b = SimpleStructure()
b.adjust()
print(b.simpleDescription)

// experiment
enum SimpleEnum : ExampleProtocol {
    internal var simpleDescription: String {
        get {
            return "\(self)"
        }
    }

    mutating internal func adjust() {
        print("\(simpleDescription) adjusted")
    }

    case ONE, TWO
}
var c = SimpleEnum.ONE
c.adjust()

extension Int : ExampleProtocol {
    internal var simpleDescription: String {
        return "Int(\(self))"
    }
    mutating func adjust() {
        self -= self % 10
    }
}
var myInt = 18
print("toString: \(myInt), simpleDescription: \(myInt.simpleDescription)")
myInt.adjust()
print(myInt.simpleDescription)

extension Double {
    var absoluteValue: Double {
        get {
            return self > 0 ? self : -self
        }
    }
}
var myDouble = -1313.0
print(myDouble.absoluteValue)


/* Error Handling */

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    if printerName == "On Fire" {
        throw PrinterError.onFire
    }
    if printerName == "Out of Paper" {
        throw PrinterError.outOfPaper
    }
    return "Job sent"
}

do {
    let printerResponse = try send(job: 1040, toPrinter: "Out of Paper")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}

let printerSuccess = try? send(job: 1884, toPrinter: "Mergentaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")
print("\(printerSuccess ?? "")")
print("\(printerFailure ?? "")")

var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]
func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    return fridgeContent.contains(food)
}
print(fridgeContains("banana"))
print(fridgeIsOpen)

class Item {}

func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 1...numberOfTimes {
        result.append(item)
    }
    return result
}
print(makeArray(repeating: Item(), numberOfTimes: 3))

enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
print(possibleInteger)
possibleInteger = .some(100)
print(possibleInteger)

func commonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> [T.Iterator.Element]
    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
    var arr = Array<T.Iterator.Element>()
    for l in lhs {
        for r in rhs {
            if l == r {
                arr.append(l)
            }
        }
    }
    return arr
}
print(commonElements([1,2,3], [3]))
