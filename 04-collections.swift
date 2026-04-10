// ============================================================
// SWIFT ESSENTIALS — CHAPTER 4: COLLECTIONS
// launchwithjames.com
// ============================================================
// HOW TO USE THIS WORKBOOK
// ─────────────────────────
// 1. Read the concept section
// 2. Study the examples
// 3. Complete the YOUR TURN exercises
// 4. Run it — if it compiles and prints what you expect, move on
// 5. Complete the chapter challenge at the bottom
//
// Rules:
// → Do NOT skip the YOUR TURN sections
// → Do NOT look at future sections to complete earlier ones
// → If you're stuck, re-read the concept — the answer is there
// → The challenge has NO answer provided — figure it out
// ============================================================


import Foundation


// ============================================================
// TOPIC 1 — DICTIONARIES: DECLARATION, READING, WRITING
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// A Dictionary stores key-value pairs.
// Every key is unique. Values can repeat.
// Looking up a value by key is instant — O(1).
//
// Syntax:  var name: [KeyType: ValueType] = [:]
//
// Keys must be Hashable (String, Int, Bool all qualify).
// Values can be any type.
//
// Reading a value always returns an Optional — because the key
// might not exist. Always unwrap with ?? or if let.

// ── EXAMPLES ─────────────────────────────────────────────────
print("----------BEGIN EXAMPLES/EXERCISES 1 BELOW----------")
// declaring a dictionary
var menuPrices: [String: Double] = [
    "Pad Thai":     14.99,
    "Tom Kha":      12.50,
    "Spring Rolls":  8.00,
    "Thai Iced Tea": 5.50
]

// reading — returns Optional
// print(menuPrices["Pad Thai"])          // Optional(14.99)
print(menuPrices["Pad Thai"] ?? 0)     // 14.99 — unwrapped with default
print(menuPrices["Burger"] ?? 0)       // 0 — key doesn't exist, uses default

// safe reading with if let
if let price = menuPrices["Tom Kha"] {
    print("Tom Kha costs $\(price)")   // Tom Kha costs $12.50
}

// writing — add new key or update existing
menuPrices["Green Curry"] = 16.00      // add new
menuPrices["Pad Thai"] = 15.99         // update existing
print(menuPrices["Pad Thai"] ?? 0)     // 15.99

// deleting — set value to nil
menuPrices["Thai Iced Tea"] = nil
print(menuPrices["Thai Iced Tea"] ?? "not found")  // not found

// checking if key exists
if menuPrices["Spring Rolls"] != nil {
    print("Spring Rolls is on the menu")
}

// count and isEmpty
print(menuPrices.count)    // number of key-value pairs
print(menuPrices.isEmpty)  // false

// ── YOUR TURN ────────────────────────────────────────────────
// 1. Create a [String: Double] dictionary called 'staffWages'
//    with these entries:
//    "James": 22.50
//    "Maria": 19.00
//    "Carlos": 21.00
//    "Aisha": 18.50
// 2. Print James's wage using ?? to unwrap
//
// 3. Use if let to safely print Maria's wage in a sentence:
//    "Maria earns $19.00 per hour"
//
// 4. Add a new staff member: "Tom": 20.00
//
// 5. Give James a raise — update his wage to 24.00
//
// 6. Aisha left — remove her from the dictionary

//
// 7. Print the total number of staff remaining
//
// 8. Check if "Carlos" is still in the dictionary and print
//    "Carlos is on the roster" or "Carlos not found"

// YOUR CODE BELOW:

// 1
var staffWages: [String: Double] = [
    "James": 22.50,  
    "Maria": 19.00,
    "Carlos": 21.00,
    "Aisha": 18.50,
]
// 2
print(staffWages["James"] ?? 0)
// 3
if let wage = staffWages["Maria"] {
    print("Maria earns $\(wage) per hour")
}
// 4
staffWages["Tom"] = 20.00
print(staffWages.count)  // 5
// 5
staffWages["James"] = 24.00
//6
staffWages["Aisha"] = nil
// 7
print(staffWages.count)  // 4
// 8
staffWages["Carlos"] != nil ? print("Carlos is on the roster") : print("Carlos not found")



// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 2: 22.50
// Exercise 3: "Maria earns $19.00 per hour"
// Exercise 4: staffWages has 5 entries
// Exercise 5: James wage is 24.00
// Exercise 6: staffWages has 4 entries
// Exercise 7: 4
// Exercise 8: "Carlos is on the roster"


// ============================================================
// TOPIC 2 — DICTIONARIES: ITERATING, KEYS, VALUES
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// Dictionaries are unordered — when you iterate, the order
// is not guaranteed. Use .sorted() if you need a consistent order.
//
// .keys   → a collection of all keys
// .values → a collection of all values
//
// You can convert either to a sorted Array for predictable output.

// ── EXAMPLES ─────────────────────────────────────────────────
print("----------BEGIN EXAMPLES/EXERCISES 2 BELOW----------")
let scores: [String: Int] = [
    "Monday":    142,
    "Tuesday":   98,
    "Wednesday": 205,
    "Thursday":  176,
    "Friday":    310
]

// iterating — order not guaranteed
for (day, score) in scores {
    print("\(day): \(score) covers")
}

// sorted iteration — alphabetical by key
for day in scores.keys.sorted() {
    print("\(day): \(scores[day] ?? 0)")
}

// just the values
for score in scores.values {
    print(score)
}

// convert keys to sorted array
let sortedDays = scores.keys.sorted()
print(sortedDays)   // ["Friday", "Monday", "Thursday", "Tuesday", "Wednesday"]

// convert values to array and reduce
let totalCovers = scores.values.reduce(0, +)
print("Total covers this week: \(totalCovers)")

// filter dictionary — returns a new dictionary
let busyDays = scores.filter { $0.value > 150 }
print(busyDays)   // days with more than 150 covers

// ── YOUR TURN ────────────────────────────────────────────────
// Use this data:
let tableRevenue: [String: Double] = [
    "Table 1": 85.50,
    "Table 2": 120.00,
    "Table 3": 45.00,
    "Table 4": 200.00,
    "Table 5": 95.00
]

// 1. Print every table and its revenue, sorted by table name:
//    "Table 1: $85.50"
//    "Table 2: $120.00"
//    ... and so on
for table in tableRevenue.keys.sorted() {
    print("\(table): $\(String(format: "%.2f", tableRevenue[table] ?? 0))")
}
//
// 2. Print just the revenue values — one per line
for revenue in tableRevenue.values.sorted() {
    print("Revenue: $\(String(format: "%.2f", revenue))")
}
//
// 3. Calculate and print the total revenue across all tables
//    "Total revenue: $545.50"
let totalRevenue = tableRevenue.values.reduce(0, +)
print("Total revenue: $\(String(format:"%.2f", totalRevenue))")

// 4. Find and print the highest revenue table:
//    "Best table: Table 4 — $200.00"
//    HINT: use the -1 sentinel pattern from Chapter 3
//          but this time track a String key instead of an index
//

var largestTable = "" 

for (table, amount) in tableRevenue {
    if largestTable == "" || amount > tableRevenue[largestTable] ?? 0 {

        largestTable = table
    }
}
print("Best table: \(largestTable) — $\(String(format:"%.2f", tableRevenue[largestTable] ?? 0))")

// print("Best table: \(largestTable)")

// 5. Print only tables that earned more than $90:
//    "High performer: Table 2 — $120.00"
//    Use .filter on the dictionary then iterate the result

// YOUR CODE BELOW:
let largerTables = tableRevenue.filter( { $0.value > 90})
// print(largerTables)
for table in largerTables.keys.sorted() {
    print("High performer: \(table) - $\(String(format: "%.2f", largerTables[table] ?? 0))")
}


// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: 5 tables printed in order
// Exercise 2: 5 revenue values
// Exercise 3: "Total revenue: $545.50"
// Exercise 4: "Best table: Table 4 — $200.00"
// Exercise 5: Table 2, Table 4, Table 5 (95.00 is not > 90... wait:
//             85.50 no, 120.00 yes, 45.00 no, 200.00 yes, 95.00 yes)
//             High performers: Table 2, Table 4, Table 5


// ============================================================
// TOPIC 3 — TUPLES
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// A tuple groups multiple values into a single compound value.
// Unlike arrays, tuples can hold different types together.
// Unlike structs, tuples need no type declaration — they're lightweight.
//
// Use tuples when:
// → a function needs to return multiple values
// → you want to group related data without creating a full type
// → the grouping is temporary and local
//
// Tuples are value types — copying creates a new independent copy.

// ── EXAMPLES ─────────────────────────────────────────────────

// basic tuple
let order = ("Pad Thai", 2, 14.99)
print(order.0)   // "Pad Thai"  — access by position
print(order.1)   // 2
print(order.2)   // 14.99

// named tuple — much cleaner
let namedOrder = (item: "Tom Kha", quantity: 1, price: 12.50)
print(namedOrder.item)      // "Tom Kha"
print(namedOrder.quantity)  // 1
print(namedOrder.price)     // 12.50

// decomposing a tuple
let (item, qty, price2) = namedOrder
print("\(qty)x \(item) — $\(price2)")   // 1x Tom Kha — $12.50

// tuple as function return — multiple values at once
func calculateBill(subtotal: Double, taxRate: Double, tipRate: Double) -> (tax: Double, tip: Double, total: Double) {
    let tax = subtotal * taxRate
    let tip = subtotal * tipRate
    let total = subtotal + tax + tip
    return (tax, tip, total)
}

let bill = calculateBill(subtotal: 80.00, taxRate: 0.0875, tipRate: 0.18)
print("Tax: $\(String(format: "%.2f", bill.tax))")      // Tax: $7.00
print("Tip: $\(String(format: "%.2f", bill.tip))")      // Tip: $14.40
print("Total: $\(String(format: "%.2f", bill.total))")  // Total: $101.40

// using _ to ignore parts of a tuple
let (_, _, totalOnly) = calculateBill(subtotal: 80.00, taxRate: 0.0875, tipRate: 0.18)
print(totalOnly)   // 101.4

// ── YOUR TURN ────────────────────────────────────────────────
// 1. Create a named tuple called 'reservation' with:
//    - name: String = "James"
//    - partySize: Int = 4
//    - hour: Int = 19
//    - hasDeposit: Bool = false
//    Print each field using dot notation
//
print("----------BEGIN EXERCISES 3 BELOW----------")

// 2. Decompose the tuple from exercise 1 into separate variables
//    and print: "Reservation for James — party of 4 at 19:00"

// 3. Write a function called 'shiftSummary' that takes:
//    - staffName: String
//    - hoursWorked: Double
//    - hourlyRate: Double
//    And returns a tuple: (name: String, hours: Double, pay: Double)
//    where pay = hoursWorked * hourlyRate
//
//    Call it with ("Maria", 6.5, 19.00) and print:
//    "Maria worked 6.5 hours — pay: $123.50"
//
// 4. Write a function called 'menuItemInfo' that takes an index: Int
//    and returns a tuple: (name: String, price: Double, available: Bool)
//    using these arrays:
let menuNames  = ["Pad Thai", "Tom Kha", "Spring Rolls", "Green Curry", "Thai Iced Tea"]
let menuCosts  = [14.99, 12.50, 8.00, 16.00, 5.50]
let menuStatus = [true, true, true, false, true]
//
//    Call it for index 3 and print:
//    "Green Curry — $16.00 — unavailable"
//    or
//    "Pad Thai — $14.99 — available"
//    based on the available field

// YOUR CODE BELOW:
// 1
let reservation = (name: "James", partySize: 4, hour: 19, hasDeposit: true)
print("Reservation for \(reservation.name) - party of \(reservation.partySize) at \(reservation.hour):00")
// 2
let (name, partySize, hour, hasDeposit) = reservation
print("Reservation for \(name) — party of \(partySize) at \(hour):00, party has \(hasDeposit ? "deposit" : "no deposit")")
// 3
func shiftSummary(staffName: String, hoursWorked: Double, hourlyRate: Double) -> (name: String, hours: Double, pay: Double) {
    (staffName, hoursWorked, hoursWorked * hourlyRate)
} 
let maria = shiftSummary(staffName: "Maria", hoursWorked: 6.5, hourlyRate: 19.00)
print("\(maria.name) worked \(maria.hours) hours - pay: $\(String(format: "%.2f", maria.pay))")
// 4
func menuItemInfo(index: Int) -> (name: String, price: Double, available: Bool) {
    (menuNames[index], menuCosts[index], menuStatus[index])
}
let menuItem1 = menuItemInfo(index: 3)

let menuItem2 = menuItemInfo(index: 0)
print("\(menuItem1.name) - $\(String(format: "%.2f", menuItem1.price)) - \(menuItem1.available ? "available" : "unavailable")")
print("\(menuItem2.name) - $\(String(format: "%.2f", menuItem2.price)) - \(menuItem2.available ? "available" : "unavailable")")


// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: prints name, partySize, hour, hasDeposit
// Exercise 2: "Reservation for James — party of 4 at 19:00"
// Exercise 3: "Maria worked 6.5 hours — pay: $123.50"
// Exercise 4 index 3: "Green Curry — $16.00 — unavailable"
// Exercise 4 index 0: "Pad Thai — $14.99 — available"


// ============================================================
// TOPIC 4 — MAP
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// map transforms every element in a collection and returns
// a NEW array with the transformed values.
// The original array is never modified.
//
// Syntax:
// let result = collection.map { item in
//     return transformedItem
// }
//
// Or shorthand using $0 (the current item):
// let result = collection.map { $0 * 2 }
//
// map always returns an array of the SAME size as the input.
// Every element gets transformed — no elements are skipped.
// If you need to skip or handle nils, use compactMap instead.

// ── EXAMPLES ─────────────────────────────────────────────────

let basePrices = [14.99, 12.50, 8.00, 5.50]

// apply 10% discount to every price
let discounted = basePrices.map { $0 * 0.90 }
print(discounted)   // [13.491, 11.25, 7.2, 4.95]

// format prices as currency strings
let formatted = basePrices.map { String(format: "$%.2f", $0) }
print(formatted)   // ["$14.99", "$12.50", "$8.00", "$5.50"]

// transform strings
let items = ["pad thai", "tom kha", "spring rolls"]
let capitalized = items.map { $0.capitalized }
print(capitalized)   // ["Pad Thai", "Tom Kha", "Spring Rolls"]

// map with explicit parameter name (more readable for complex transforms)
let names = ["James", "Maria", "Carlos"]
let greetings = names.map { name in
    "Good morning, \(name)!"
}
print(greetings)   // ["Good morning, James!", ...]

// map over a dictionary's values
let wages: [String: Double] = ["James": 22.50, "Maria": 19.00, "Carlos": 21.00]
let raisedWages = wages.mapValues { $0 * 1.10 }   // 10% raise
print(raisedWages)
print("----------BEGIN EXERCISES 4 BELOW----------")

// ── YOUR TURN ────────────────────────────────────────────────
// Use this data:
let dishNames = ["pad thai", "tom kha soup", "green curry", "spring rolls", "thai iced tea"]
let dishPrices = [14.99, 12.50, 16.00, 8.00, 5.50]
let dishCalories = [650, 420, 580, 280, 120]

// 1. Use map to capitalize every dish name
//    Print the result
//
// 2. Use map to apply a 15% happy hour discount to all prices
//    Round each to 2 decimal places using String(format:)
//    Wait — map returns an array, so store the Doubles first,
//    then format when printing. Or map to formatted Strings directly.
//    Print: ["$12.74", "$10.63", "$13.60", "$6.80", "$4.68"]
//
// 3. Use map to convert calories to a "X kcal" String format
//    Print: ["650 kcal", "420 kcal", "580 kcal", "280 kcal", "120 kcal"]
//
// 4. Use map to create an array of menu line items combining
//    name and price:
//    ["Pad Thai — $14.99", "Tom Kha Soup — $12.50", ...]
//    HINT: you need both dishNames and dishPrices at the same index
//          use indices: dishNames.indices.map { i in ... }

// YOUR CODE BELOW:
let capitalizedNames = dishNames.map { name in name.capitalized }
print(capitalizedNames)
// 2
let discountedDishPrices = dishPrices.map { String(format: "%.2f", $0 * 0.85) }
print(discountedDishPrices)
// 3
let caloriedDishes = dishCalories.map { calories in "\(calories) kcal"}
print(caloriedDishes)
// 4
let menuLineItem = dishNames.indices.map { idx in 
    "\(capitalizedNames[idx]) - $\(String(format:"%.2f", dishPrices[idx]))"
}
print(menuLineItem)

// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: ["Pad Thai", "Tom Kha Soup", "Green Curry", "Spring Rolls", "Thai Iced Tea"]
// Exercise 2: ["$12.74", "$10.63", "$13.60", "$6.80", "$4.68"]
// Exercise 3: ["650 kcal", "420 kcal", "580 kcal", "280 kcal", "120 kcal"]
// Exercise 4: ["Pad Thai — $14.99", "Tom Kha Soup — $12.50", ...]

// ============================================================
// TOPIC 5 — FILTER
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// filter returns a NEW array containing only elements
// that satisfy a condition (where the closure returns true).
// Elements that return false are excluded.
//
// The original array is never modified.
// The result array may be smaller than the input — or empty.
//
// Syntax:
// let result = collection.filter { item in
//     return condition   // true = keep, false = discard
// }
//
// Shorthand: collection.filter { $0 > 10 }

// ── EXAMPLES ─────────────────────────────────────────────────

let allPrices = [14.99, 12.50, 8.00, 5.50, 16.00, 11.50]

// keep only prices over $10
let premiumPrices = allPrices.filter { $0 > 10 }
print(premiumPrices)   // [14.99, 12.50, 16.00, 11.50]

// keep only prices under $10
let budgetPrices = allPrices.filter { $0 < 10 }
print(budgetPrices)   // [8.00, 5.50]

// filter strings
let staffList = ["James", "Maria", "Carlos", "Aisha", "Tom"]
let longNames = staffList.filter { $0.count > 4 }
print(longNames)   // ["James", "Maria", "Carlos", "Aisha"]

// filter with contains
let menuList = ["Pad Thai", "Tom Kha", "Pad See Ew", "Spring Rolls"]
let padDishes = menuList.filter { $0.contains("Pad") }
print(padDishes)   // ["Pad Thai", "Pad See Ew"]

// chaining filter and map
let expensiveFormatted = allPrices
    .filter { $0 > 10 }
    .map { String(format: "$%.2f", $0) }
print(expensiveFormatted)   // ["$14.99", "$12.50", "$16.00", "$11.50"]

// ── YOUR TURN ────────────────────────────────────────────────
// Use this data:
let allDishes = ["Pad Thai", "Tom Kha Soup", "Green Curry", "Spring Rolls", "Pad See Ew", "Tom Yum Soup", "Mango Sticky Rice", "Thai Iced Tea"]
let allPricesFilter = [14.99, 12.50, 16.00, 8.00, 14.99, 11.50, 7.00, 5.50]
let allAvailable = [true, true, false, true, true, false, true, true]
let allCaloriesFilter = [650, 420, 580, 280, 600, 320, 350, 120]

// 1. Filter allDishes to only dishes that start with "T"
//    Print the result
// 2. Filter allPricesFilter to only prices between $10 and $15 (inclusive)
//    Print the result
//
// 3. Filter allDishes to only AVAILABLE dishes
//    HINT: use indices — allDishes.indices.filter { allAvailable[$0] }
//          then map the result to get the names
//          OR use a different approach you figure out yourself
//
// 4. Chain filter + map:
//    Get all available dishes that cost under $13
//    Return them as formatted strings: "Spring Rolls — $8.00"
//    HINT: filter by availability AND price, then map to string
//          you'll need the index for both arrays — use indices
//
// 5. Filter allCaloriesFilter to only low-calorie items (under 400 kcal)
//    Then map those to dish names + calorie counts:
//    "Thai Iced Tea — 120 kcal"
//    Print each one

// YOUR CODE BELOW:
// 1 
let allDishesStartingWithT = allDishes.filter { $0.lowercased().hasPrefix("t") }
print(allDishesStartingWithT)
// 2
let filteredPricesinRange10To15 = allPricesFilter.filter { $0 >= 10 && $0 <= 15 }
print(filteredPricesinRange10To15)
// 3
let availableDishes = allDishes.indices
    .filter { idx in allAvailable[idx] }
    .map { allDishes[$0]}
print(availableDishes)
// 4
let dishesUnder13 = allPricesFilter.indices
    .filter { allPricesFilter[$0] < 13.00 }
    .filter { allAvailable[$0]}
    .map { "\(allDishes[$0]) - $\(String(format: "%.2f", allPricesFilter[$0]))" }
print(dishesUnder13)

// 5
let lowCalorieDishes = allCaloriesFilter.indices
    .filter { allCaloriesFilter[$0] < 400}
    .map { "\(allDishes[$0]) - \(allCaloriesFilter[$0]) kcal"}

print(lowCalorieDishes)

// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: ["Tom Kha Soup", "Tom Yum Soup", "Thai Iced Tea"]
// Exercise 2: [14.99, 12.50, 14.99, 11.50]
// Exercise 3: ["Pad Thai", "Tom Kha Soup", "Spring Rolls", "Pad See Ew",
//              "Mango Sticky Rice", "Thai Iced Tea"]
// Exercise 4: ["Spring Rolls — $8.00", "Thai Iced Tea — $5.50"]
// Exercise 5: ["Spring Rolls — 280 kcal",
//              "Tom Yum Soup — 320 kcal", "Mango Sticky Rice — 350 kcal",
//              "Thai Iced Tea — 120 kcal"]


// ============================================================
// TOPIC 6 — REDUCE AND COMPACTMAP
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// reduce collapses a collection into a single value.
// You provide a starting value and a closure that combines
// each element with the running result.
//
// Syntax:
// let result = collection.reduce(startingValue) { runningTotal, item in
//     return runningTotal + item
// }
//
// compactMap is like map but automatically removes nil values.
// Use it when your transform might produce Optional results
// and you want a clean array with no nils.
//
// Syntax:
// let result = collection.compactMap { item -> Type? in
//     // return a value or nil
// }

// ── EXAMPLES ─────────────────────────────────────────────────

// reduce — sum all prices
let receiptPrices = [14.99, 12.50, 8.00, 5.50]
let total = receiptPrices.reduce(0, +)
print(total)   // 40.99

// reduce with explicit closure
let totalExplicit = receiptPrices.reduce(0.0) { runningTotal, price in
    runningTotal + price
}
print(totalExplicit)   // 40.99

// reduce to build a string
let orderList = ["Pad Thai", "Tom Kha", "Spring Rolls"]
let orderString = orderList.reduce("") { result, item in
    result.isEmpty ? item : result + ", " + item
}
print(orderString)   // "Pad Thai, Tom Kha, Spring Rolls"

// reduce to find the max
let tipAmounts = [8.50, 12.00, 5.75, 15.00, 9.25]
let highestTip = tipAmounts.reduce(0) { max($0, $1) }
print(highestTip)   // 15.0

// compactMap — remove nils from transform
let rawInputs = ["14.99", "not a price", "8.00", "twelve", "5.50"]
let validPrices = rawInputs.compactMap { Double($0) }
print(validPrices)   // [14.99, 8.0, 5.5] — invalid strings removed

// compactMap with optional lookup
let itemNames = ["Pad Thai", "Burger", "Tom Kha", "Pizza", "Spring Rolls"]
let knownPrices: [String: Double] = [
    "Pad Thai": 14.99,
    "Tom Kha": 12.50,
    "Spring Rolls": 8.00
]
let foundPrices = itemNames.compactMap { knownPrices[$0] }
print(foundPrices)   // [14.99, 12.5, 8.0] — Burger and Pizza had no price

// ── YOUR TURN ────────────────────────────────────────────────
// Use this data:
let tableAmounts = [85.50, 120.00, 45.00, 200.00, 95.00, 178.50]
let tipStrings = ["12.50", "bad data", "22.00", "not a number", "15.75", "30.00"]
let itemLookup: [String: Double] = [
    "Pad Thai": 14.99,
    "Tom Kha": 12.50,
    "Green Curry": 16.00,
    "Spring Rolls": 8.00
]
let orderAttempt = ["Pad Thai", "Burger", "Tom Kha", "Hot Dog", "Spring Rolls"]

// 1. Use reduce to calculate the total revenue from tableAmounts
//    Print: "Total revenue: $724.00"
// 2. Use reduce to find the highest single table amount
//    Print: "Best table: $200.00"

//
// 3. Use reduce to build a comma-separated string of table amounts:
//    "$85.50, $120.00, $45.00, $200.00, $95.00, $178.50"
//    HINT: same pattern as the orderList example above
//
// 4. Use compactMap on tipStrings to get only valid tip amounts
//    (convert String to Double, invalid strings become nil and are removed)
//    Print the valid tips array
//    Then use reduce to print the total valid tips
//
// 5. Use compactMap on orderAttempt to look up each item in itemLookup
//    Items not found return nil and are dropped
//    Print the array of found prices
//    Then use reduce to print the total of the found items

// YOUR CODE BELOW:

let totalTableAmounts = tableAmounts.reduce(0, +) 
/* 
let totalTableAmounts = tableAmounts.reduce(0) { total, item in 
    // total + item
} 
*/
print("Total revenue: $\(String(format: "%.2f", totalTableAmounts))")
// 2
let highestTableAmount = tableAmounts.reduce(0) { max($0, $1) }
print("Best table: $\(String(format: "%.2f", highestTableAmount))")
// 3
let combinedOrder = tableAmounts.reduce("") { str, amount in 
str.isEmpty ? "$\(String(format:"%.2f", amount))" : "\(str)," + " $\(String(format:"%.2f" ,amount))" 
}
print(combinedOrder)
// 4
let validTips = tipStrings.compactMap { Double($0) }
print(validTips)
let totalOfValidTips = validTips.reduce(0) { $0 + $1}
print(totalOfValidTips)
// 5
let foundItems = orderAttempt.compactMap { itemLookup[$0] }
print(foundItems)
let totalOfFoundItems = foundItems.reduce(0) { $0 + $1 }  // What if I wanted to get the names of the valid
print(totalOfFoundItems)

let foundItems2 = orderAttempt.indices.compactMap { idx -> (String, Double)? in
    guard let price = itemLookup[orderAttempt[idx]] else { return nil }
    return (orderAttempt[idx], price)
}

for (name, price) in foundItems2 {
    print("\(name) — $\(String(format: "%.2f", price))")
}


// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: "Total revenue: $724.00"
// Exercise 2: "Best table: $200.00"
// Exercise 3: "$85.50, $120.00, $45.00, $200.00, $95.00, $178.50"
// Exercise 4: valid tips: [12.50, 22.00, 15.75, 30.00], total: $80.25
// Exercise 5: found prices: [14.99, 12.50, 8.00], total: $35.49


// ============================================================
//
//  🏆 CHAPTER 4 CHALLENGE: STAFF ROSTER MANAGER
//
// ============================================================
//
// BUILD A COMPLETE STAFF MANAGEMENT SYSTEM
//
// Use everything from Chapter 4 — Dictionaries, Tuples,
// map, filter, reduce, and compactMap — to build a
// staff roster system for Thai Kitchen.
//
// ── INPUT DATA ───────────────────────────────────────────────

let staffRoster: [String: Double] = [
    "James":  24.00,
    "Maria":  19.00,
    "Carlos": 21.00,
    "Aisha":  18.50,
    "Tom":    20.00,
    "Nina":   22.50,
    "Derek":  17.00
]

let staffShiftHours: [String: Double] = [
    "James":  8.0,
    "Maria":  6.5,
    "Carlos": 8.0,
    "Aisha":  4.0,
    "Tom":    7.5,
    "Nina":   8.0,
    "Derek":  5.0
]

let staffRoles: [String: String] = [
    "James":  "Manager",
    "Maria":  "Server",
    "Carlos": "Server",
    "Aisha":  "Host",
    "Tom":    "Server",
    "Nina":   "Bartender",
    "Derek":  "Busser"
]

let staffWorkedToday = ["James", "Maria", "Carlos", "Tom", "Nina"]
// Aisha and Derek did not work today

// ── REQUIREMENTS ─────────────────────────────────────────────
//
// 1. FULL ROSTER PRINTOUT
//    Print every staff member sorted alphabetically with their role and wage:
//    "Aisha — Host — $18.50/hr"
//    "Carlos — Server — $21.00/hr"
//    ... and so on
//    HINT: sort staffRoster.keys and look up role + wage for each
//
let sortedStaffRoster = staffRoster.keys.sorted().map{ "\($0) - \(staffRoles[$0] ?? " ") - $\(String(format: "%.2f", staffRoster[$0] ?? 0))/hr"}
for staff in sortedStaffRoster {
    print(staff)
}
func getTodayStaffDetails(_ name: String) -> (name: String, role: String, hours: Double, pay: Double) {
    let role = staffRoles[name] ?? ""
    let hours = staffShiftHours[name] ?? 0.0
    let rate = staffRoster[name] ?? 0.0
    let pay = hours * rate
    return (name, role, hours, pay)
}

for staff in staffWorkedToday {
    let (name, role, hours, pay) = getTodayStaffDetails(staff)
    print("\(name) | \(role) | \(String(format: "%.2f", hours)) hrs | $\(String(format: "%.2f", pay))")
}

// print(getTodayStaffDetails(name: "James"))
// 2. TODAY'S SHIFT SUMMARY
//    For each staff member who worked today (staffWorkedToday),
//    calculate their shift pay: wage × hours
//    Print each one as a tuple-style summary:
//    "James | Manager | 8.0 hrs | $192.00"
//    Use a tuple inside your loop to group the data per person
//
// 3. TOTAL PAYROLL TODAY
//    Use reduce on staffWorkedToday to calculate total payroll.
//    For each name, look up wage × hours and accumulate.
//    Print: "Total payroll today: $XXX.XX"
//
// 4. HIGH EARNERS
//    Use filter on staffRoster to find staff earning over $20/hr.
//    Then use map to format them as strings.
//    Print each: "High earner: Nina — $22.50/hr"
//    Sort alphabetically before printing.
//
// 5. WAGE SUMMARY
//    Use reduce to find:
//    - Total hourly wage bill (sum of all wages)
//    - Average hourly wage
//    Print:
//    "Total hourly wage bill: $142.00/hr"
//    "Average hourly wage: $20.29/hr"
//    HINT: average = total / count
//
// 6. ROLE BREAKDOWN
//    Use a Dictionary to count how many staff are in each role.
//    Build a [String: Int] dictionary of role → count.
//    Print sorted by role name:
//    "Bartender: 1"
//    "Busser: 1"
//    "Host: 1"
//    "Manager: 1"
//    "Server: 3"
//
// 7. SHIFT REPORT USING TUPLES
//    Write a function called 'shiftReport' that takes a staff name: String
//    and returns a tuple:
//    (name: String, role: String, hours: Double, wage: Double, pay: Double)
//    where pay = wage × hours
//
//    If the staff member is not found in any dictionary,
//    return nil (make the return type optional: -> (...)? )
//
//    Call it for "Nina" and "Unknown" and print the results.
//    For Nina: "Nina | Bartender | 8.0 hrs @ $22.50/hr = $180.00"
//    For Unknown: "Staff member not found"
//
// ── RULES ────────────────────────────────────────────────────
// → Use Dictionary for requirement 1, 6
// → Use tuple inside the loop for requirement 2
// → Use reduce for requirements 3, 5
// → Use filter + map for requirement 4
// → Use a function returning an optional tuple for requirement 7
// → Sort all output alphabetically where specified
// → No hardcoded values — all data comes from the dictionaries above
//
// ── HINTS ────────────────────────────────────────────────────
// → Requirement 7 — optional tuple return type looks like:
//   func shiftReport(_ name: String) -> (name: String, role: String, hours: Double, wage: Double, pay: Double)?
// → For requirement 3 reduce — start value is 0.0, each step looks up
//   wage and hours for the current name and multiplies them
// → For requirement 6 — same dictionary counting pattern from Chapter 3
//   but this time the key is a role String, not an item String
//
// ── YOUR CODE BELOW ──────────────────────────────────────────




// ============================================================
// END OF CHAPTER 4
// ============================================================
//
// When you're done:
// ✅ All YOUR TURN sections compile and print expected output
// ✅ Challenge covers all 7 requirements
// ✅ Dictionary, Tuple, map, filter, reduce, compactMap all used
//
// Next up: Chapter 5 — Optionals
// The most important mindset shift in Swift.
// nil is not the enemy — unhandled nil is.
// ============================================================