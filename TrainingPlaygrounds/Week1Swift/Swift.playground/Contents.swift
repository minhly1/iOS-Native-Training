import UIKit

// MARK: - Swift Basics
// MARK: - (1) Variables, Constants & Types
print("\n(1) Variables, Constants & Types")

// Variables
// A variable is a container to hold data
var siteName: String
var id: Int  // siteName can store text, id can store integer

// Assign values
siteName = "programiz.com"
print(siteName)

var language = "Swift"  // type inferred
print(language)

// Change value
siteName = "apple.com"
print(siteName)

// Rules for naming variables
// 1. Names must start with a letter, _ or $
// 2. Cannot start with numbers
// 3. Case-sensitive: A and a are different
// 4. Avoid Swift keywords
var a = "hello"
var _a = "hello"
//var $a = "hello"  // special system variable, usually for internal purposes
// var 1a = "hello" // invalid
var A = 5
print(A, a)  // case-sensitive: A and a are different

// Good practice: descriptive names, camelCase
var numberOfApples = 5
var userFirstName = "Alice"
print(numberOfApples, userFirstName)

// Constants
// A constant cannot change once assigned
let pi = 3.14
let x = 5
// x = 10  // ❌ Error

// Literals
let intValue: Int = 12
let piValue: Float = 3.14
let pass: Bool = true
let someCharacter: Character = "S"
let someString: String = "Swift is fun"

print(intValue, piValue, pass)
print(someCharacter, someString)


// MARK: - (2) Optionals & Unwrapping
print("\n(2) Optionals & Unwrapping")

// Declaring optionals
var someValue: Int?       // may contain nil
var someAnotherValue: Int! // implicitly unwrapped optional (IUO)
print(someValue)          // nil
print(someAnotherValue)   // nil

// Assigning values
let optionalInt: Int? = 5
print(optionalInt)         // Optional(5)
print(optionalInt!)        // 5 (force unwrapped, crash if nil)

// ⚠️ Fatal error if unwrapped nil
// var crashValue: Int!
// var x: Int = crashValue   // runtime crash

// Optional handling

// 1. If statement
if someValue != nil {
    print("It has value \(someValue!)") // still need force unwrap
} else {
    print("Doesn't contain value")
}

if someAnotherValue != nil {
    print("It has value \(someAnotherValue!)")
} else {
    print("Doesn't contain value")
}

// 2. Optional binding (if-let)
if let temp = someValue {
    print("It has value \(temp)")  // automatically unwrapped
} else {
    print("Doesn't contain value")
}

if let temp = someAnotherValue {
    print("It has value \(temp)")
} else {
    print("Doesn't contain value")
}

// 3. Guard statement
func testGuard() {
    let someValue: Int? = 5
    guard let temp = someValue else { return }  // unwrap safely or exit
    print("It has value \(temp)")
}
testGuard()

// 4. Nil-coalescing operator
var optionalNil: Int!
let defaultValue = 5
let unwrappedValue: Int = optionalNil ?? defaultValue
print(unwrappedValue)       // 5

var optionalWithValue: Int? = 10
let unwrappedValue2: Int = optionalWithValue ?? defaultValue
print(unwrappedValue2)      // 10

// Notes:
// - ? means optional, may be nil
// - ! means implicitly unwrapped optional, be careful
// - Prefer if-let, guard-let, or ?? to safely unwrap


// MARK: - (3) Functions & Closures
print("\n(3) Functions & Closures")

// Functions
func greet(name: String) -> String {
    return "Hello, \(name)!"
}
print(greet(name: "Alice")) // Hello, Alice!

func printGreeting(name: String) {
    print("Hi, \(name)!")
}
printGreeting(name: "Bob")

func add(a: Int, b: Int) -> Int {
    return a + b
}
print(add(a: 5, b: 3)) // 8

// Function Overloading
// Functions can share the same name if they differ in parameter types, count, or labels
func displayValue(value: Int) {
    print("Integer value:", value)
}
func displayValue(value: String) {
    print("String value:", value)
}
displayValue(value: "Swift") // String value: Swift
displayValue(value: 2)       // Integer value: 2

func display(number: Int) {
    print("Integer number:", number)
}
func display(number1: Int, number2: Int) {
    print("1st:", number1, "2nd:", number2)
}
display(number: 5)                  // Integer number: 5
display(number1: 6, number2: 8)     // 1st: 6 2nd: 8

func display(person1 age: Int) {
    print("Person1 Age:", age)
}
func display(person2 age: Int) {
    print("Person2 Age:", age)
}
display(person1: 25)  // Person1 Age: 25
display(person2: 38)  // Person2 Age: 38

// Closures
// A closure is a special function without a name
var greetClosure = {
    print("Hello, World!")
}
greetClosure() // call the closure, prints "Hello, World!"

// Closure with parameter
let greetUser = { (name: String) in
    print("Hey there, \(name).")
}
greetUser("Delilah") // prints Hey there, Delilah.

// Closure returning value
var findSquare = { (num: Int) -> Int in
    return num * num
}
var result = findSquare(3)
print("Square:", result) // Square: 9

// Closure as function parameter
func grabLunch(search: () -> ()) {
    print("Let's go out for lunch")
    search() // call closure inside function
}
grabLunch(search: {
    print("Alfredo's Pizza: 2 miles away")
})

// Trailing closure
func grabLunch(message: String, search: () -> ()) {
    print(message)
    search()
}
grabLunch(message: "Let's go out for lunch") {
    print("Alfredo's Pizza: 2 miles away")
}

// Autoclosure
// Allows passing expression directly without braces
func display(greet: @autoclosure () -> ()) {
    greet()
}
display(greet: print("Hello World!")) // prints Hello World!

// Notes:
// - Functions: name, parameters, return type
// - Function overloading: same name if parameters differ
// - Closures: unnamed functions, can have parameters, return value
// - Trailing closure simplifies passing closure as last argument
// - Autoclosure automatically wraps expression in closure


// MARK: - (4) Structs, Classes & Enums
print("\n(4) Structs, Classes & Enums")

// Structs
// A struct is a value type (copied when assigned or passed around)
struct Person {
    var name: String
    var age: Int

    func describe() {
        print("\(name) is \(age) years old.")
    }
}

var person1 = Person(name: "Alice", age: 25)
person1.describe()

// Mutating method for changing struct properties
struct Counter {
    var value = 0

    mutating func increment() {
        value += 1
    }
}

var counter = Counter()
counter.increment()
print("Counter value:", counter.value) // 1

// Value type behavior (copy)
var person2 = person1
person2.name = "Bob"
print(person1.name) // Alice
print(person2.name) // Bob


// Classes
// A class is a reference type (shared reference when assigned)
class Animal {
    var species: String

    init(species: String) {
        self.species = species
    }

    func sound() {
        print("\(species) makes a sound")
    }
}

let animal1 = Animal(species: "Dog")
animal1.sound()

let animal2 = animal1 // both reference same object
animal2.species = "Cat"

print(animal1.species) // Cat
print(animal2.species) // Cat

// Inheritance example
class Vehicle {
    var brand: String
    init(brand: String) {
        self.brand = brand
    }

    func drive() {
        print("\(brand) is driving")
    }
}

class Car: Vehicle {
    var model: String

    init(brand: String, model: String) {
        self.model = model
        super.init(brand: brand)
    }

    override func drive() {
        print("\(brand) \(model) is driving fast")
    }
}

let car = Car(brand: "Tesla", model: "Model Y")
car.drive()

// Deinitializer example
class FileManagerExample {
    init() {
        print("Resource allocated")
    }

    deinit {
        print("Resource released")
    }
}

do {
    let _ = FileManagerExample()
} // deinit runs here


// Struct vs Class (Simple Summary)
// - Structs do NOT support inheritance
// - Classes DO support inheritance
// - Structs are VALUE types (copied)
// - Classes are REFERENCE types (shared)

// Class behavior
class BikeClass {
    var color: String
    init(color: String) {
        self.color = color
    }
}

var bikeClass1 = BikeClass(color: "Blue")
var bikeClass2 = bikeClass1 // same instance

bikeClass1.color = "Red"
print("Class bike color:", bikeClass2.color) // Red

// Struct behavior
struct BikeStruct {
    var color: String
    init(color: String) {
        self.color = color
    }
}

var bikeStruct1 = BikeStruct(color: "Blue")
var bikeStruct2 = bikeStruct1 // makes a copy

bikeStruct1.color = "Red"
print("Struct bike color:", bikeStruct2.color) // Blue


// Enums
// Enums define a group of related values
enum Direction {
    case north, south, east, west
}

var dir = Direction.east
print("Direction:", dir)

dir = .north
print("Direction:", dir)

// Enum with raw values
enum Day: Int {
    case monday = 1, tuesday, wednesday, thursday, friday
}
print("Wednesday raw value:", Day.wednesday.rawValue)

// Enum with associated values
enum ResultType {
    case success(message: String)
    case failure(errorCode: Int)
}

let result1 = ResultType.success(message: "Data loaded")
let result2 = ResultType.failure(errorCode: 404)

switch result1 {
case .success(let msg):
    print("Success:", msg)
case .failure(let code):
    print("Error:", code)
}

switch result2 {
case .success(let msg):
    print("Success:", msg)
case .failure(let code):
    print("Error:", code)
}


// Final Notes:
// - Structs: value types, copied on assignment, no inheritance
// - Classes: reference types, shared instances, support inheritance
// - Enums: group related values, can have raw values or associated values


// MARK: - (5) Protocols & Extensions
print("\n(5) Protocols & Extensions")

// PROTOCOLS
// A protocol defines a blueprint of methods and properties
// Any class, struct, or enum can adopt a protocol

protocol Greetable {
    var name: String { get }
    func greet()
}

// Conforming to a protocol
struct Student: Greetable {
    var name: String
    func greet() {
        print("Hello, my name is \(name).")
    }
}

let student = Student(name: "Alice")
student.greet()

// Protocol requiring mutating method (for structs / enums)
protocol Togglable {
    mutating func toggle()
}

struct LightSwitch: Togglable {
    var isOn = false
    mutating func toggle() {
        isOn.toggle()
    }
}

var light = LightSwitch()
print("Light on?", light.isOn)
light.toggle()
print("Light on?", light.isOn)

// Protocol inheritance
protocol VehicleProtocol {
    var brand: String { get }
    func drive()
}

protocol ElectricVehicle: VehicleProtocol {
    var batteryLevel: Int { get }
    func charge()
}

struct Tesla: ElectricVehicle {
    var brand: String
    var batteryLevel: Int

    func drive() {
        print("\(brand) driving with battery at \(batteryLevel)%")
    }

    func charge() {
        print("Charging...")
    }
}

let tesla = Tesla(brand: "Tesla", batteryLevel: 80)
tesla.drive()
tesla.charge()

// Protocol with associated type
protocol Container {
    associatedtype Item
    func add(item: Item)
}

struct IntContainer: Container {
    func add(item: Int) {
        print("Added number:", item)
    }
}

let container = IntContainer()
container.add(item: 42)


// EXTENSIONS
// Extensions add new functionality to existing types
// without modifying original source code

extension String {
    // computed property
    var reversedText: String {
        return String(self.reversed())
    }

    // new method
    func repeatText(_ times: Int) -> String {
        return String(repeating: self, count: times)
    }
}

let text = "Swift"
print(text.reversedText)         // tfiwS
print(text.repeatText(3))        // SwiftSwiftSwift

// Extending built-in types
extension Int {
    var squared: Int {
        return self * self
    }

    func multiply(by value: Int) -> Int {
        return self * value
    }
}

print(5.squared)                 // 25
print(6.multiply(by: 4))         // 24

// Adding protocol conformance using extension
protocol Describable {
    func describe()
}

struct Book {
    var title: String
}

extension Book: Describable {
    func describe() {
        print("This book is titled: \(title)")
    }
}

let book = Book(title: "Swift Guide")
book.describe()

// Extensions + Protocols = Very powerful
// They allow:
// - Adding functionality to types you don't own
// - Clean separation of protocol adoption
// - Shared behavior across multiple types


// Summary:
// Protocols:
// - Define requirements: properties, methods
// - Conformed to by structs, classes, enums
// - Can inherit from other protocols
// - Can have associated types

// Extensions:
// - Add methods, properties to existing types
// - Cannot override existing methods
// - Can add protocol conformance
// - Keep code organized and modular


// MARK: - (6) Error Handling
print("\n(6) Error Handling")

// In Swift, errors are unexpected events that can occur during program execution
// For example, dividing by zero causes a runtime crash
// var result = 10 / 0 // ❌ Fatal error

// Step 1: Create an enum that represents the types of errors
enum DivisionError: Error {
    case dividedByZero
}

// Step 2: Create a throwing function
func division(numerator: Int, denominator: Int) throws -> Int {
    if denominator == 0 {
        throw DivisionError.dividedByZero // throw error
    } else {
        return numerator / denominator
    }
}

// Step 3 & 4: Call the throwing function using try, and handle errors using do-catch
do {
    let result = try division(numerator: 10, denominator: 0)
    print("Division Result:", result)
} catch DivisionError.dividedByZero {
    print("Error: Denominator cannot be 0")
} catch {
    print("Unexpected error:", error)
}

// Example with valid denominator
do {
    let result = try division(numerator: 10, denominator: 2)
    print("Division Result:", result) // 5
} catch {
    print("Error:", error)
}

// Disabling error handling with try!
// Use try! only when you are sure that the function will not throw an error
let safeResult = try! division(numerator: 10, denominator: 5)
print("Safe Division Result:", safeResult) // 2

// Notes:
// - throw returns an error from a function
// - try indicates a function can throw an error
// - do-catch handles thrown errors
// - try! disables error handling (unsafe if an error occurs)
// - Common causes of errors: invalid input, device failure, network loss, unavailable file, etc.


// MARK: - (7) Generics
print("\n(7) Generics")

// Swift Generics allows us to create functions and classes that can work with different data types
// This helps us reuse code without rewriting it for each type

// Generic Function
func displayData<T>(data: T) {
    print("Generic Function:")
    print("Data Passed:", data)
}

// generic function working with String
displayData(data: "Swift")

// generic function working with Int
displayData(data: 5)

// Generic Class
class Information<T> {
    var data: T
    
    init(data: T) {
        self.data = data
    }
    
    func getData() -> T {
        return self.data
    }
}

// initialize generic class with Int data
var intObj = Information<Int>(data: 6)
print("Generic Class returns:", intObj.getData())

// initialize generic class with String data
var strObj = Information<String>(data: "Swift")
print("Generic Class returns:", strObj.getData())

// Type Constraints
func addition<T: Numeric>(num1: T, num2: T) {
    print("Sum:", num1 + num2)
}

// works with Int
addition(num1: 5, num2: 10)

// works with Double
addition(num1: 5.5, num2: 10.8)

// ❌ Using non-numeric type like String will give an error
// addition(num1: "Hello", num2: "World") // Error: String does not conform to Numeric

// Advantages of Generics
// 1. Code Reusability: same function/class works with multiple types
// 2. Used with Collections: Array, Dictionary, etc. are built-in generics

var list1: Array<Int> = [1, 2, 3]       // holds Int
var list2: Array<String> = ["A", "B"]   // holds String
print("Integer Array:", list1)
print("String Array:", list2)

// Dictionary example
var dict1: Dictionary<String, Int> = ["Alice": 25, "Bob": 30] // keys: String, values: Int
print("Dictionary:", dict1)

// Notes:
// - <T> is a placeholder type that can represent any type
// - Generic functions and classes allow working with multiple data types
// - Type constraints ensure generics work only with compatible types (like Numeric)


// MARK: - (8) Collection Types (Array, Dictionary, Set, Tuple)
print("\n(8) Collection Types (Array, Dictionary, Set, Tuple)")

// --- Array ---
// An Array stores values of the same type in an ordered list
// The same value can appear multiple times, and order matters

// Create arrays
var intArray: [Int] = [1, 2, 3, 4]
var stringArray = ["Swift", "Kotlin", "Java"]  // type inferred

print("intArray:", intArray)
print("stringArray:", stringArray)

// Access and modify elements by index
print("First element:", stringArray[0])
stringArray.append("Python")
print("After append:", stringArray)
stringArray.remove(at: 1)
print("After remove:", stringArray)

// Iterate over array
for item in intArray {
    print("Item:", item)
}

// --- Dictionary ---
// A Dictionary stores key‑value pairs. Keys and values can each have their own types.
// Use when you want to look up a value by a key rather than by index

// Create dictionaries
var ages: [String: Int] = ["Alice": 25, "Bob": 30]
var scores = [ "Math": 90, "English": 85 ]  // type inferred

print("ages:", ages)
print("scores:", scores)

// Access value by key (returns optional)
if let aliceAge = ages["Alice"] {
    print("Alice age:", aliceAge)
} else {
    print("Alice not found")
}

// Add / modify / remove
ages["Charlie"] = 22
print("After adding Charlie:", ages)
ages["Bob"] = 31
print("After updating Bob:", ages)
ages["Alice"] = nil
print("After removing Alice:", ages)

// Iterate over key‑value pairs
for (subject, score) in scores {
    print("\(subject): \(score)")
}

// --- Set ---
// A Set stores values of the same type, BUT: order is undefined, and values must be unique
// Use Set when you care about uniqueness and don’t care about order

var numberSet: Set<Int> = [1, 2, 3, 3, 2]
print("numberSet:", numberSet)  // duplicates automatically removed

// Add / remove / check membership
numberSet.insert(4)
numberSet.remove(2)
print("After changes:", numberSet)
print("Contains 3?", numberSet.contains(3))

// Iterate (order not guaranteed)
for num in numberSet {
    print("Set item:", num)
}

// --- Tuple ---
// A Tuple groups a fixed number of values, possibly of different types, into one compound value
// Good when you want to return multiple values from a function or group related values

var person: (name: String, age: Int, isStudent: Bool) = (name: "Alice", age: 25, isStudent: true)
print("Name:", person.name)
print("Age:", person.age)
print("Is student:", person.isStudent)

// Tuple without named elements
var product = ("MacBook", 1299.99)
print("Product name:", product.0)
print("Product price:", product.1)

// You cannot add or remove elements from a tuple — its size and types are fixed

// --- Summary usage guidelines ---
// * Use Array when you need an ordered collection, possibly with duplicates.
// * Use Dictionary when you need to map unique keys to values, and look up by key.
// * Use Set when you need a collection of unique values and don’t care about order.
// * Use Tuple when you need a small, fixed‑size grouping of values (possibly of different types).


// MARK: - (9) ARC, Strong, Weak & Unowned References
print("\n(9) ARC, Strong, Weak & Unowned References")

// In Swift, ARC (Automatic Reference Counting) automatically handles memory allocation and deallocation.
// A strong reference keeps a firm hold on instances, preventing ARC from deallocating them.
// A weak reference does not protect the instance from being deallocated.
// An unowned reference also does not increase reference count but is expected to always have a value during its lifetime.

// Strong Reference Example
class Employee {
    var name: String
    var salary: Int
    var colleague: Employee?  // strong reference by default

    init(name: String, salary: Int) {
        self.name = name
        self.salary = salary
    }

    deinit {
        print("Memory Deallocated")
    }
}

// create instances
var sabby: Employee? = Employee(name: "Sabby", salary: 50000)
var cathy: Employee? = Employee(name: "Cathy", salary: 45000)

// strong references increase reference count
sabby?.colleague = cathy
cathy?.colleague = sabby

// deallocate objects
sabby = nil
cathy = nil
// The deinitializer is NOT called because strong references keep reference count > 0

// Weak Reference Example
class EmployeeWeak {
    var name: String
    var salary: Int
    weak var colleague: EmployeeWeak?  // weak reference

    init(name: String, salary: Int) {
        self.name = name
        self.salary = salary
    }

    deinit {
        print("Memory Deallocated")
    }
}

// create instances
var sabbyWeak: EmployeeWeak? = EmployeeWeak(name: "Sabby", salary: 50000)
var cathyWeak: EmployeeWeak? = EmployeeWeak(name: "Cathy", salary: 45000)

// weak references do not increase reference count
sabbyWeak?.colleague = cathyWeak
cathyWeak?.colleague = sabbyWeak

// deallocate objects
sabbyWeak = nil
cathyWeak = nil
// The references are completely deallocated and the deinitializer is called.
// Hence, output:
// Memory Deallocated
// Memory Deallocated

// Unowned Reference Example
class Department {
    var name: String
    var manager: Manager!  // unowned reference

    init(name: String) {
        self.name = name
    }

    deinit {
        print("Department Memory Deallocated")
    }
}

class Manager {
    var name: String
    unowned var department: Department  // unowned reference

    init(name: String, department: Department) {
        self.name = name
        self.department = department
    }

    deinit {
        print("Manager Memory Deallocated")
    }
}

// create instances
var dept: Department? = Department(name: "IT")
var mgr: Manager? = Manager(name: "Alice", department: dept!)
dept?.manager = mgr

// deallocate objects
mgr = nil
dept = nil
// Both objects are deallocated because unowned reference does not increase reference count
// Output:
// Manager Memory Deallocated
// Department Memory Deallocated

// Notes:
// - By default, class properties are strong
// - Weak references do not increase reference count
// - Unowned references do not increase reference count and are non-optional
// - ARC automatically deallocates instances when reference count reaches 0
// - Use weak or unowned to avoid strong reference cycles and memory leaks
