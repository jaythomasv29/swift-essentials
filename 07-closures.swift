// ============================================================
// SWIFT ESSENTIALS — CHAPTER 7: CLOSURES
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
// TOPIC 1 — WHAT IS A CLOSURE
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// A closure is a function without a name.
// That's it. Everything else follows from that.
//
// In JavaScript you call these arrow functions or anonymous functions:
//   const double = (n) => n * 2
//   [1,2,3].map(n => n * 2)
//
// In Swift they look like this:
//   { (n: Int) -> Int in n * 2 }
//   [1,2,3].map { n in n * 2 }
//
// "Closure" comes from the fact that these functions can
// "close over" values from their surrounding scope — capturing
// and keeping those values alive even after the outer scope ends.
// You saw this in Chapter 6 with makeMultiplier.
//
// Three forms of the same thing in Swift:
// 1. Named function:   func double(_ n: Int) -> Int { n * 2 }
// 2. Closure assigned: let double = { (n: Int) -> Int in n * 2 }
// 3. Inline closure:   [1,2,3].map { n in n * 2 }
//
// All three are functions. The difference is syntax and naming.

// ── EXAMPLES ─────────────────────────────────────────────────

// a named function
func applyTax(_ price: Double) -> Double {
    price * 1.0875
}

// the exact same thing as a closure stored in a variable
let applyTaxClosure = { (price: Double) -> Double in
    price * 1.0875
}

print(applyTax(14.99))          // 16.30...
print(applyTaxClosure(14.99))   // 16.30... — identical result

// closure used inline — passed directly to map
let prices = [14.99, 12.50, 8.00, 5.50]
let taxedPrices = prices.map({ (price: Double) -> Double in
    price * 1.0875
})
print(taxedPrices)

// closures capture their surrounding context
var kitchenNote = "fresh ingredients"
let describeKitchen = {
    print("Our kitchen uses \(kitchenNote)")  // captures kitchenNote
}
describeKitchen()   // Our kitchen uses fresh ingredients

kitchenNote = "organic produce"
describeKitchen()   // Our kitchen uses organic produce ← captures current value

// ── YOUR TURN ────────────────────────────────────────────────
// 1. Write a closure stored in a variable called 'formatMenuItem'
//    It takes a String and returns a String
//    It capitalizes the input and wraps it in "→ [name] ←"
//    Print the result of calling it with "pad thai"
//    Expected: "→ Pad Thai ←"
//
// 2. Write a closure stored in 'applyDiscount'
//    Takes a Double, returns a Double
//    Applies a 15% discount (multiply by 0.85)
//    Call it with 80.00 and print the result
//
// 3. Create a var called 'discountMessage' set to "15% off today"
//    Write a closure stored in 'printPromotion' that prints:
//    "Thai Kitchen promotion: [discountMessage]"
//    Call it, then change discountMessage to "happy hour — 20% off drinks"
//    Call it again — confirm it prints the updated message

// YOUR CODE BELOW:




// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: "→ Pad Thai ←"
// Exercise 2: 68.0
// Exercise 3: prints original then updated message


// ============================================================
// TOPIC 2 — CLOSURE SYNTAX: FULL FORM
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// The full closure syntax includes:
// → parameter names and types
// → return type
// → the 'in' keyword separating signature from body
//
// Full form:
// { (param1: Type, param2: Type) -> ReturnType in
//     // body
//     return value
// }
//
// This is verbose but explicit — good when learning.
// Swift can usually infer the types so you rarely write the full form.
// But understanding it makes the shorthand forms make sense.
//
// The 'in' keyword is the dividing line:
// everything before 'in' = the signature (inputs and output)
// everything after 'in'  = the body (what it does)

// ── EXAMPLES ─────────────────────────────────────────────────

// full form — explicit types and return
let multiply: (Double, Double) -> Double = { (a: Double, b: Double) -> Double in
    return a * b
}
print(multiply(14.99, 2))   // 29.98

// full form inline in sorted
let menuItems = ["Pad Thai", "Spring Rolls", "Tom Kha", "Thai Iced Tea"]
let sorted = menuItems.sorted(by: { (a: String, b: String) -> Bool in
    return a < b
})
print(sorted)

// full form in filter
let expensivePrices = prices.filter({ (price: Double) -> Bool in
    return price > 10.0
})
print(expensivePrices)

// full form — multi-line body
let describePrice = { (item: String, price: Double) -> String in
    let formatted = String(format: "$%.2f", price)
    let label = price > 12 ? "premium" : "value"
    return "\(item) (\(label)) — \(formatted)"
}
print(describePrice("Pad Thai", 14.99))    // Pad Thai (premium) — $14.99
print(describePrice("Spring Rolls", 8.00)) // Spring Rolls (value) — $8.00

// ── YOUR TURN ────────────────────────────────────────────────
// Write each closure in FULL FORM (explicit types, explicit return)
//
// 1. A closure stored in 'calculateLineTotal' that takes
//    item: String, quantity: Int, unitPrice: Double
//    Returns a String: "2x Pad Thai — $29.98"
//
// 2. A closure stored in 'isAffordable' that takes
//    price: Double and returns Bool
//    Returns true if price is under $12.00
//
// 3. Use the full form closure inline in a filter call:
//    Filter this array to only items with more than 5 characters:
let staffNames = ["James", "Maria", "Carlos", "Aisha", "Tom", "Nina", "Derek"]
//    Store result in 'longNames' and print it
//
// 4. Use the full form closure inline in sorted:
//    Sort staffNames by length (shortest first)
//    Store in 'byLength' and print

// YOUR CODE BELOW:




// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: "2x Pad Thai — $29.98"
// Exercise 2: isAffordable(8.00) = true, isAffordable(14.99) = false
// Exercise 3: ["James", "Maria", "Carlos", "Aisha", "Derek"]
// Exercise 4: ["Tom", "Nina", "Aisha", "James", "Maria", "Derek", "Carlos"]


// ============================================================
// TOPIC 3 — TRAILING CLOSURE SYNTAX
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// When a closure is the LAST argument to a function,
// you can move it outside the parentheses.
// This is called trailing closure syntax.
//
// It exists purely for readability — the code does the same thing.
// Swift and SwiftUI use trailing closures everywhere.
// Every Button, List, VStack in SwiftUI is a trailing closure.
//
// Three equivalent forms:
//
// 1. Normal call (closure inside parens):
//    array.map({ $0 * 2 })
//
// 2. Trailing closure (closure outside parens):
//    array.map() { $0 * 2 }
//
// 3. Trailing closure (empty parens omitted):
//    array.map { $0 * 2 }
//
// When the closure is the ONLY argument, drop the () entirely.
// This is the most common form you'll see in real Swift code.

// ── EXAMPLES ─────────────────────────────────────────────────

let menuPrices = [14.99, 12.50, 8.00, 5.50, 16.00]

// normal — closure inside parens
let doubled1 = menuPrices.map({ price in price * 2 })

// trailing — closure after parens
let doubled2 = menuPrices.map() { price in price * 2 }

// trailing — parens dropped (most common)
let doubled3 = menuPrices.map { price in price * 2 }

print(doubled1 == doubled3)   // true — all identical

// trailing with multi-line body
let receipts = menuPrices.map { price in
    let discounted = price * 0.90
    let formatted = String(format: "$%.2f", discounted)
    return "Was \(String(format: "$%.2f", price)) → now \(formatted)"
}
for receipt in receipts {
    print(receipt)
}

// multiple trailing closures (Swift 5.3+)
// when a function has multiple closure params, only the last uses trailing syntax
// all others must be inside parens
func processOrder(
    onSuccess: () -> Void,
    onFailure: () -> Void
) {
    let succeeded = true
    if succeeded { onSuccess() } else { onFailure() }
}

// multiple trailing closure syntax
processOrder {
    print("Order placed successfully")
} onFailure: {
    print("Order failed")
}

// SwiftUI preview — this is exactly how Button works:
// Button("Tap me") {
//     print("tapped")   ← trailing closure
// }

// ── YOUR TURN ────────────────────────────────────────────────
// Rewrite each using trailing closure syntax
// (no closure inside the parentheses)
//
// 1. Rewrite this using trailing closure:
//    let filtered = menuPrices.filter({ price in price > 10 })
//
// 2. Rewrite this using trailing closure:
//    let names = staffNames.map({ name in name.uppercased() })
//
// 3. Rewrite this using trailing closure (multi-line body):
//    Create a sorted version of staffNames where names starting
//    with a vowel come first, then alphabetical for the rest
//    HINT: "AEIOUaeiou".contains(name.first ?? "x")
//
// 4. Write a function called 'applyToMenu' that takes:
//    - prices: [Double]
//    - transform: (Double) -> Double   ← closure parameter
//    Returns [Double]
//    Call it using trailing closure syntax to apply a 20% happy hour discount
//    Call it again using trailing closure to add 10% surcharge

// YOUR CODE BELOW:




// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: [14.99, 12.50, 16.00]
// Exercise 2: ["JAMES", "MARIA", "CARLOS", "AISHA", "TOM", "NINA", "DEREK"]
// Exercise 3: vowel names first — Aisha first, then rest alphabetically
// Exercise 4: happy hour prices, surcharge prices


// ============================================================
// TOPIC 4 — SHORTHAND ARGUMENT NAMES: $0, $1
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// When Swift can infer parameter types from context,
// you can skip naming the parameters entirely and use
// shorthand argument names: $0, $1, $2...
//
// $0 = first argument
// $1 = second argument
// $2 = third argument (and so on)
//
// Rules for using shorthand:
// → Types must be inferrable from context (they usually are)
// → The closure body must be a single expression
//   (or you can still use $0/$1 in multi-line but it gets confusing)
// → When the closure is obvious and short — shorthand is cleaner
// → When the closure is complex — named parameters are clearer
//
// The progression from full form to shorthand:
// Full:      { (price: Double) -> Double in return price * 2 }
// Inferred:  { price in price * 2 }
// Shorthand: { $0 * 2 }

// ── EXAMPLES ─────────────────────────────────────────────────

let dishPrices = [14.99, 12.50, 8.00, 5.50]

// progressively shorter — all identical results
let v1 = dishPrices.map({ (price: Double) -> Double in return price * 1.0875 })
let v2 = dishPrices.map({ price in price * 1.0875 })
let v3 = dishPrices.map { price in price * 1.0875 }
let v4 = dishPrices.map { $0 * 1.0875 }   // shorthand

print(v4)

// $0 in filter
let affordable = dishPrices.filter { $0 < 10 }
print(affordable)   // [8.0, 5.5]

// $0 in sorted — ascending
let ascending = dishPrices.sorted { $0 < $1 }
// $0 and $1 are the two items being compared
print(ascending)

// $0 in sorted — descending
let descending = dishPrices.sorted { $0 > $1 }
print(descending)

// reduce with $0 and $1
// $0 = running total, $1 = current item
let total = dishPrices.reduce(0) { $0 + $1 }
// even shorter — pass the operator directly
let total2 = dishPrices.reduce(0, +)
print(total2)   // 40.99

// when shorthand hurts readability — use named params instead
let menuData = [("Pad Thai", 14.99), ("Tom Kha", 12.50)]
// confusing with shorthand:
let confusing = menuData.map { "\($0.0) costs $\($0.1)" }
// clearer with named params:
let clear = menuData.map { (name, price) in "\(name) costs $\(price)" }
print(clear)

// ── YOUR TURN ────────────────────────────────────────────────
// Rewrite each using $0 / $1 shorthand
//
// 1. Rewrite using shorthand:
//    let capitalized = staffNames.map { name in name.capitalized }
//
// 2. Rewrite using shorthand:
//    let longStaff = staffNames.filter { name in name.count > 4 }
//
// 3. Rewrite using shorthand:
//    let totalPrices = dishPrices.reduce(0.0) { total, price in total + price }
//
// 4. Rewrite using shorthand:
//    let sortedAlpha = staffNames.sorted { a, b in a < b }
//
// 5. These are BETTER with named params — explain why in a comment
//    and leave them with named params:
//    a) staffNames.sorted { a, b in a.count < b.count }
//    b) menuData.map { (name, price) in "\(name): $\(price)" }

// YOUR CODE BELOW:




// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: ["James", "Maria", "Carlos", "Aisha", "Tom", "Nina", "Derek"]
// Exercise 2: ["James", "Maria", "Carlos", "Aisha", "Derek"]
// Exercise 3: 40.99
// Exercise 4: alphabetically sorted
// Exercise 5: comments explaining why named params are clearer


// ============================================================
// TOPIC 5 — CAPTURING VALUES
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// A closure "captures" variables from its surrounding scope.
// This means it holds a reference to those variables and
// can read and modify them even after the outer scope ends.
//
// This is the "closing over" that gives closures their name.
//
// Key behaviors:
// → Closures capture REFERENCES to variables (not copies)
// → Changes to the variable are seen by the closure
// → Changes the closure makes to the variable are seen outside
// → Captured variables stay alive as long as the closure exists
//
// This is powerful but requires care — captured mutable state
// can cause unexpected behavior if you're not paying attention.

// ── EXAMPLES ─────────────────────────────────────────────────

// basic capture — closure sees changes to outer variable
var guestCount = 0
let seatGuest = {
    guestCount += 1
    print("Seated guest #\(guestCount)")
}

seatGuest()   // Seated guest #1
seatGuest()   // Seated guest #2
seatGuest()   // Seated guest #3
print(guestCount)   // 3 — changed by the closure

// capture in a counter factory
func makeOrderCounter() -> () -> Int {
    var count = 0
    let increment = {
        count += 1
        return count
    }
    return increment
}

let tableOneOrders = makeOrderCounter()
let tableTwoOrders = makeOrderCounter()

print(tableOneOrders())   // 1
print(tableOneOrders())   // 2
print(tableOneOrders())   // 3
print(tableTwoOrders())   // 1 ← separate counter, independent capture
print(tableTwoOrders())   // 2

// capture list — control what gets captured
// use [weak self] or [value] to capture a copy instead of reference
// (weak self covered in Chapter 15 — memory management)

// capturing in sorted — captures nothing, uses only parameters
let names = ["Carlos", "James", "Maria"]
let sorted2 = names.sorted { $0 < $1 }   // no capture needed

// capturing a threshold from outer scope
let priceThreshold = 12.00
let premiumItems = dishPrices.filter { $0 > priceThreshold }
// priceThreshold is captured — if it were var, closure would see changes
print(premiumItems)

// ── YOUR TURN ────────────────────────────────────────────────
// 1. Create a var 'dailyRevenue' = 0.0
//    Write a closure 'recordSale' that takes a Double amount
//    and adds it to dailyRevenue
//    Call it with 85.50, 120.00, 45.00
//    Print dailyRevenue after all three calls — should be 250.50
//
// 2. Write a function 'makeTabTracker' that returns () -> Double
//    Inside, create a var 'tabTotal' = 0.0
//    The returned closure should accept no args,
//    but capture and increment tabTotal by a random amount each call
//    Actually — make it simpler: the returned closure takes a Double
//    adds it to tabTotal and returns the new total
//    So: () is wrong, make it (Double) -> Double
//    Call it 3 times with different amounts and print running total
//
// 3. Create a var 'minimumOrder' = 10.00
//    Write a closure 'meetsMinimum' that takes a Double
//    and returns Bool — true if amount >= minimumOrder
//    Test with 8.00 (false) and 15.00 (true)
//    Then change minimumOrder to 20.00
//    Test again with 15.00 — should now return false
//    This demonstrates live capture of the variable

// YOUR CODE BELOW:




// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: dailyRevenue = 250.5 after three calls
// Exercise 2: running tab total increases with each call
// Exercise 3: same closure, different result after minimumOrder changes


// ============================================================
// TOPIC 6 — @ESCAPING CLOSURES
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// By default, a closure passed to a function is non-escaping —
// it runs during the function call and is discarded when done.
//
// An @escaping closure outlives the function that receives it.
// It "escapes" the function's scope — stored for later use,
// called after the function returns.
//
// Common uses:
// → Completion handlers: "call this when the network request finishes"
// → Callbacks stored as properties: "call this when the user taps"
// → Async operations: anything that runs later
//
// Why does Swift care?
// → Memory management — escaping closures must capture self carefully
// → If you store a closure that captures self strongly,
//   you can create a retain cycle (Chapter 15)
// → @escaping is a signal: "this closure will outlive this call"
//
// In SwiftUI you'll see @escaping on:
// → Button actions
// → Network completion handlers
// → Any stored closure property

// ── EXAMPLES ─────────────────────────────────────────────────

// non-escaping — runs immediately, discarded after
func applyToAll(_ items: [Double], transform: (Double) -> Double) -> [Double] {
    return items.map(transform)   // transform is called and done
}
// transform does NOT need @escaping — it doesn't outlive applyToAll

// escaping — stored for later use
var storedCompletion: (() -> Void)?   // stored outside the function

func fetchMenu(completion: @escaping () -> Void) {
    print("Fetching menu data...")
    storedCompletion = completion   // stored — escapes the function
    // in real code this would be called after a network request
}

fetchMenu {
    print("Menu loaded!")
}

// call it later — after fetchMenu has returned
storedCompletion?()   // Menu loaded!

// realistic completion handler pattern
func loadGuestList(completion: @escaping ([String]) -> Void) {
    // simulate async — in real code this would be a network call
    let guests = ["James", "Sarah", "Carlos"]
    completion(guests)   // calls the closure with the result
}

loadGuestList { guests in
    print("Loaded \(guests.count) guests")
    for guest in guests {
        print("  - \(guest)")
    }
}

// the pattern you'll use constantly in SwiftUI networking:
// func fetchData(completion: @escaping (Result<[Item], Error>) -> Void) {
//     URLSession.shared.dataTask(with: url) { data, _, error in
//         if let error = error { completion(.failure(error)); return }
//         // decode data
//         completion(.success(items))
//     }.resume()
// }

// ── YOUR TURN ────────────────────────────────────────────────
// 1. Write a function 'scheduleMessage(_ message: String, handler: @escaping () -> Void)'
//    Store the handler in a variable called 'pendingHandler'
//    Print "Message scheduled: [message]"
//    Then AFTER the function, call pendingHandler?()
//    This simulates a delayed callback
//
// 2. Write a function 'processOrder(items: [String], onComplete: @escaping ([String]) -> Void)'
//    Inside the function, filter out any items containing "Burger" or "Pizza"
//    (they're not on the Thai Kitchen menu)
//    Call onComplete with the valid items
//    Test it with ["Pad Thai", "Burger", "Tom Kha", "Pizza", "Spring Rolls"]
//    The completion handler should print each valid item
//
// 3. Write a function 'validateAndSubmit(guestName: String?, onSuccess: @escaping (String) -> Void, onFailure: @escaping (String) -> Void)'
//    If guestName is nil or empty — call onFailure with "Invalid guest name"
//    Otherwise — call onSuccess with "Reservation confirmed for [name]"
//    Test both paths

// YOUR CODE BELOW:




// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: "Message scheduled" then handler called after
// Exercise 2: ["Pad Thai", "Tom Kha", "Spring Rolls"] — Burger and Pizza filtered
// Exercise 3: success path and failure path both work


// ============================================================
// TOPIC 7 — CLOSURES VS FUNCTIONS: WHEN TO USE EACH
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// Functions and closures are the same thing under the hood.
// The choice is about readability and intent.
//
// Use a NAMED FUNCTION when:
// → The behavior is complex enough to deserve a name
// → You'll reuse it in multiple places
// → It needs to be tested independently
// → The name adds meaning — calculateTip() is clearer than { $0 * 0.18 }
//
// Use a CLOSURE when:
// → The behavior is short and used in one place
// → It's passed inline to map/filter/sorted
// → The context makes its purpose obvious
// → Naming it would be more verbose than the closure itself
//
// The key question: does naming this thing make it clearer?
// If yes — function. If no — closure.

// ── EXAMPLES ─────────────────────────────────────────────────

let itemPrices = [14.99, 12.50, 8.00, 5.50, 16.00]

// closure — appropriate, short, context is obvious
let affordable2 = itemPrices.filter { $0 < 10 }
let withTax = itemPrices.map { $0 * 1.0875 }

// function — appropriate, reused in multiple places, name adds meaning
func formatForReceipt(_ price: Double) -> String {
    let taxed = price * 1.0875
    let rounded = (taxed * 100).rounded() / 100
    return String(format: "$%.2f (incl. tax)", rounded)
}
let formatted = itemPrices.map(formatForReceipt)
// passing the function directly — no closure needed when types match

// when closure is TOO long — extract to function
// bad:
let confusingResult = itemPrices.filter { price in
    let withTax2 = price * 1.0875
    let withTip = withTax2 * 1.18
    let afterDiscount = withTip * 0.90
    return afterDiscount < 20.00
}

// better — extract to a named function
func isTotalUnderBudget(_ price: Double) -> Bool {
    let withTax3 = price * 1.0875
    let withTip = withTax3 * 1.18
    let afterDiscount = withTip * 0.90
    return afterDiscount < 20.00
}
let underBudget = itemPrices.filter(isTotalUnderBudget)

// ── YOUR TURN ────────────────────────────────────────────────
// For each scenario decide: closure or named function?
// Write your reasoning as a comment, then implement it.
//
// 1. Sort staffNames alphabetically — use inline or function?
//    Implement your choice
//
// 2. Calculate full payroll for a staff member including overtime —
//    use inline or function?
//    Implement your choice (reuse from Chapter 6 if you want)
//
// 3. Filter menu items to only those available tonight
//    Available items: ["Pad Thai", "Spring Rolls", "Thai Iced Tea"]
//    The filter checks if item is in that array — inline or function?
//    Implement your choice
//
// 4. Format a complete receipt line including name, qty, price, tax —
//    inline or function?
//    Implement your choice

// YOUR CODE BELOW:




// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: sorted alphabetically — either is fine, inline makes sense
// Exercise 2: function — complex, reusable, deserves a name
// Exercise 3: either works — comment explains your reasoning
// Exercise 4: function — complex enough to name


// ============================================================
//
//  🏆 CHAPTER 7 CHALLENGE: MENU FILTER ENGINE
//
// ============================================================
//
// BUILD A FLEXIBLE MENU FILTERING AND TRANSFORMATION SYSTEM
//
// Thai Kitchen needs a system that can filter, sort, transform,
// and format menu data in flexible ways using closures.
// The system must be composable — functions that accept
// closures as parameters so callers can customize behavior.
//
// ── INPUT DATA ───────────────────────────────────────────────

struct MenuItem {
    let name: String
    let price: Double
    let calories: Int
    let category: String
    let isAvailable: Bool
}

let fullMenu: [MenuItem] = [
    MenuItem(name: "Pad Thai",          price: 14.99, calories: 650,  category: "noodles",   isAvailable: true),
    MenuItem(name: "Tom Kha Soup",      price: 12.50, calories: 420,  category: "soup",      isAvailable: true),
    MenuItem(name: "Green Curry",       price: 16.00, calories: 580,  category: "curry",     isAvailable: false),
    MenuItem(name: "Spring Rolls",      price: 8.00,  calories: 280,  category: "appetizer", isAvailable: true),
    MenuItem(name: "Pad See Ew",        price: 14.99, calories: 600,  category: "noodles",   isAvailable: true),
    MenuItem(name: "Tom Yum Soup",      price: 11.50, calories: 320,  category: "soup",      isAvailable: true),
    MenuItem(name: "Mango Sticky Rice", price: 7.00,  calories: 350,  category: "dessert",   isAvailable: true),
    MenuItem(name: "Thai Iced Tea",     price: 5.50,  calories: 120,  category: "drink",     isAvailable: true),
    MenuItem(name: "Massaman Curry",    price: 15.50, calories: 620,  category: "curry",     isAvailable: false),
    MenuItem(name: "Papaya Salad",      price: 9.00,  calories: 180,  category: "salad",     isAvailable: true)
]

// ── REQUIREMENTS ─────────────────────────────────────────────
//
// 1. FILTER ENGINE
//    Write a function 'filterMenu(_ items: [MenuItem], where condition: (MenuItem) -> Bool) -> [MenuItem]'
//    It applies the condition closure to filter items.
//    Use it to produce:
//    a) Only available items
//    b) Only items under $12
//    c) Only noodle dishes
//    d) Only items under 400 calories AND available
//    Print the name of each result for all four filters
//
// 2. SORT ENGINE
//    Write a function 'sortMenu(_ items: [MenuItem], by comparator: (MenuItem, MenuItem) -> Bool) -> [MenuItem]'
//    Use it to produce:
//    a) Sorted by price ascending
//    b) Sorted by price descending
//    c) Sorted by name alphabetically
//    d) Sorted by calories ascending
//    Print the name and relevant value for each sort
//
// 3. TRANSFORM ENGINE
//    Write a function 'transformMenu(_ items: [MenuItem], using transform: (MenuItem) -> String) -> [String]'
//    Use it to produce:
//    a) An array of formatted strings: "Pad Thai — $14.99"
//    b) An array of calorie strings: "Pad Thai: 650 cal"
//    c) An array of category tags: "[noodles] Pad Thai"
//    Print each array
//
// 4. CHAINED PIPELINE
//    Using filterMenu, sortMenu, and transformMenu together:
//    → Filter to only available items
//    → Sort by price ascending
//    → Transform to "name — $price" strings
//    → Print the result
//    Do this in a single chain — result of each feeds into next
//
// 5. DISCOUNT ENGINE
//    Write a function 'makeDiscountApplier(rate: Double) -> (MenuItem) -> MenuItem'
//    Returns a closure that takes a MenuItem and returns a new MenuItem
//    with the price reduced by rate
//    NOTE: MenuItem is a struct — you'll need to create a new one with updated price
//    Create a 20% happy hour applier and a 10% loyalty applier
//    Apply happy hour to all available items and print new prices
//
// 6. CAPTURING IN CONTEXT
//    Create a var 'currentCategory' = "noodles"
//    Write a closure 'categoryFilter' that filters fullMenu
//    to items matching currentCategory (using filterMenu from req 1)
//    Print the results
//    Change currentCategory to "soup"
//    Call categoryFilter again — should show soup items now
//    This demonstrates live value capture
//
// ── RULES ────────────────────────────────────────────────────
// → Requirements 1, 2, 3 — use trailing closure syntax at call sites
// → Requirement 4 — chain the three functions together
// → Requirement 5 — return a closure from a function (makeDiscountApplier)
// → Requirement 6 — demonstrate live variable capture
// → Use $0 shorthand where appropriate, named params where clearer
// → No force unwraps
//
// ── HINTS ────────────────────────────────────────────────────
// → Requirement 1: filterMenu is basically a wrapper around .filter
//   but accepting a MenuItem -> Bool closure
// → Requirement 4: let result = transformMenu(sortMenu(filterMenu(...) {...}) {...}) {...}
//   or break into steps for readability
// → Requirement 5: struct creates a new value when you return
//   MenuItem(name: item.name, price: item.price * (1 - rate), ...)
// → Requirement 6: the closure should capture currentCategory by reference
//   so changing the var changes what the closure sees
//
// ── YOUR CODE BELOW ──────────────────────────────────────────




// ============================================================
// END OF CHAPTER 7
// ============================================================
//
// When you're done:
// ✅ All YOUR TURN sections compile and print expected output
// ✅ Challenge covers all 6 requirements
// ✅ Full form, trailing, shorthand, capturing, @escaping all used
//
// Next up: Chapter 8 — Structs
// You've been using structs since Chapter 5.
// Chapter 8 goes deep: computed properties, property observers,
// mutating methods, and why value semantics changes everything.
// ============================================================