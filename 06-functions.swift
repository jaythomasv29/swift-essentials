// ============================================================
// SWIFT ESSENTIALS — CHAPTER 6: FUNCTIONS
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
// TOPIC 1 — DEFINING AND CALLING FUNCTIONS
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// You've been writing functions since Chapter 2.
// This chapter goes deep on how Swift functions actually work
// and what makes them different from JavaScript functions.
//
// A function is a named block of code you can call by name.
// Functions can take input (parameters) and produce output (return values).
//
// Swift functions are first-class values — you can store them
// in variables, pass them to other functions, and return them
// from functions. This becomes critical in Chapter 7 (Closures).
//
// Basic structure:
// func name(parameterName: Type) -> ReturnType {
//     // body
//     return value
// }

// ── EXAMPLES ─────────────────────────────────────────────────

// no parameters, no return value
func openKitchen() {
    print("Thai Kitchen is now open")
    print("Staff report to stations")
}
openKitchen()

// one parameter, no return value
func greetGuest(name: String) {
    print("Welcome to Thai Kitchen, \(name)!")
}
greetGuest(name: "James")

// one parameter, returns a value
func formatPrice(_ price: Double) -> String {
    return "$\(String(format: "%.2f", price))"
}
print(formatPrice(14.99))   // $14.99

// multiple parameters, returns a value
func calculateTotal(subtotal: Double, taxRate: Double) -> Double {
    return subtotal * (1 + taxRate)
}
print(calculateTotal(subtotal: 80.00, taxRate: 0.0875))   // 87.0

// implicit return — single expression, drop the return keyword
func doublePrice(_ price: Double) -> Double {
    price * 2   // no return needed
}
print(doublePrice(14.99))   // 29.98

// functions are values — store in a variable
let formatter = formatPrice   // no () — we're storing the function, not calling it
print(formatter(12.50))       // $12.50

// ── YOUR TURN ────────────────────────────────────────────────
// 1. Write a function called 'closeKitchen' that takes no parameters
//    and prints two lines:
//    "Thai Kitchen is now closed"
//    "See you tomorrow!"
//
// 2. Write a function called 'describeTable' that takes:
//    - tableNumber: Int
//    - seats: Int
//    - isOccupied: Bool
//    And prints: "Table 3 — 4 seats — occupied" or "Table 3 — 4 seats — available"
//
// 3. Write a function called 'calculateTip' that takes:
//    - subtotal: Double
//    - rate: Double
//    And returns the tip amount as a Double
//    Call it with (80.00, 0.18) and print the result
//
// 4. Rewrite calculateTip using implicit return (no return keyword)
//
// 5. Store calculateTip in a variable called 'tipCalculator'
//    and call it through the variable with (100.00, 0.20)

// YOUR CODE BELOW:
// 1
func closeKitchen() {
    print("Thai Kitchen is now closed")
    print("See you tomorrow!")
}
// 2
func describeTable(tableNumber: Int, seats: Int, isOccupied: Bool) {
    print("Table \(tableNumber) — \(seats) seats — \(isOccupied ? "occupied" : "available")")
}

describeTable(tableNumber: 3, seats: 4, isOccupied: false)

// 3
func calculateTip(subtotal: Double, rate: Double) -> Double {
    return subtotal * rate
}
print(String(format: "%.2f", calculateTip(subtotal: 80.00, rate: 0.18)))
//4
func calculateTip2(subtotal: Double, rate: Double) -> Double { subtotal * rate }
print(String(format: "%.2f", calculateTip2(subtotal: 80.00, rate: 0.18)))  //implicit return - single line
//5
let tipCalculator = calculateTip
print(tipCalculator(100.00, 0.20))


// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: prints two lines
// Exercise 2: "Table 3 — 4 seats — occupied"
// Exercise 3: 14.4
// Exercise 4: same result, no return keyword
// Exercise 5: 20.0


// ============================================================
// TOPIC 2 — PARAMETERS AND RETURN TYPES
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// Parameters are the inputs a function declares it will accept.
// Arguments are the actual values you pass when calling the function.
//
// Swift is strict about types — you cannot pass a String where
// a Double is expected. No silent coercion.
//
// Return types must match exactly what you return.
// If you declare -> String you must return a String, always.
//
// A function with no return type implicitly returns Void.
// Void is an empty tuple () — not nil, not nothing, just empty.

// ── EXAMPLES ─────────────────────────────────────────────────

// multiple parameters — each has a name and type
func buildOrderSummary(item: String, quantity: Int, price: Double) -> String {
    let total = Double(quantity) * price
    return "\(quantity)x \(item) — \(formatPrice(total))"
}
print(buildOrderSummary(item: "Pad Thai", quantity: 2, price: 14.99))
// 2x Pad Thai — $29.98

// returning different types based on logic
func tableStatus(tableNumber: Int, isOccupied: Bool) -> String {
    return isOccupied ? "Table \(tableNumber) is occupied" : "Table \(tableNumber) is free"
}
print(tableStatus(tableNumber: 5, isOccupied: true))

// void return — equivalent ways to write it
func logOrder(_ item: String) -> Void { print("Logged: \(item)") }
func logOrder2(_ item: String) { print("Logged: \(item)") }  // same thing

// returning optional — function might not produce a result
func findPrice(for item: String) -> Double? {
    let menu = ["Pad Thai": 14.99, "Tom Kha": 12.50]
    return menu[item]   // returns Double? naturally
}
print(findPrice(for: "Pad Thai") ?? 0)   // 14.99
print(findPrice(for: "Burger") ?? 0)     // 0

// ── YOUR TURN ────────────────────────────────────────────────
// 1. Write a function called 'formatLineItem' that takes:
//    - name: String
//    - quantity: Int
//    - unitPrice: Double
//    Returns a formatted String: "2x Pad Thai — $29.98"
//    Use the formatPrice function from Topic 1
// 2. Write a function called 'isTableAvailable' that takes
//    - tableNumber: Int
//    - occupiedTables: [Int]
//    Returns Bool — true if tableNumber is NOT in occupiedTables
//
// 3. Write a function called 'lookupWage' that takes
//    - staffName: String
//    Returns Double? — the wage from this dictionary:
//    Return nil if the staff member isn't found
//    Call it for "James" and "Derek" — unwrap safely with ?? or if let
//
// 4. Write a function called 'overtimeRate' that takes
//    - hoursWorked: Double
//    - hourlyRate: Double
//    Returns Double — regular pay if hours <= 8, overtime (1.5x) for hours over 8
//    Example: 10 hours at $20/hr = (8 * 20) + (2 * 30) = $220.00

// YOUR CODE BELOW:
// 1
func formatLineItem(name: String, quantity: Int, unitPrice: Double) -> String {
    return "\(quantity)x \(name) - \(formatPrice(unitPrice * Double(quantity)))"
}
print(formatLineItem(name: "Pad Thai", quantity: 2, unitPrice: 14.99))
//
// 2
func isTableAvailable(tableNumber: Int, occupiedTables: [Int]) -> Bool {
    return !occupiedTables.contains(tableNumber)
}
print(isTableAvailable(tableNumber: 7, occupiedTables: [1,2,3,4]))  // 7 is not occupied
// 3
let wageTable = ["James": 24.00, "Maria": 19.00, "Carlos": 21.00]
func lookupWage(staffName: String) -> Double? {
    return wageTable[staffName]
}

if let wage = lookupWage(staffName: "James") {
    print(wage)
} else {
    print("no wage found")
}
print(lookupWage(staffName: "Derek") ?? "No wage found")
// 4
func overtimeRate(hoursWorked: Double, hourlyRate: Double) -> Double {
    if hoursWorked <= 8 {
        return hourlyRate * hoursWorked
    } else {
        let overtimeHours = hoursWorked - 8 //everything over 8 hours is overtime
        let overtimeRate = hourlyRate * 1.5
        let regularHours = hoursWorked - overtimeHours
        return (overtimeRate * overtimeHours) + (hourlyRate * regularHours)
    }
}

print("\(formatPrice(overtimeRate(hoursWorked: 10, hourlyRate: 20)))")



// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: "2x Pad Thai — $29.98"
// Exercise 2: true if not occupied, false if occupied
// Exercise 3: James = 24.0, Derek = nil (use fallback)
// Exercise 4: overtimeRate(10, 20.00) = 220.0


// ============================================================
// TOPIC 3 — ARGUMENT LABELS VS PARAMETER NAMES
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// This is one of the most distinctly Swift features.
// Every parameter has TWO names:
//
// func name(externalLabel internalName: Type)
//   → externalLabel: what the CALLER types when calling the function
//   → internalName: what YOU use inside the function body
//
// This lets Swift function calls read like natural English sentences.
// Apple's own APIs are designed around this pattern.
//
// Three variations:
// 1. Same name for both: func greet(name: String) → call: greet(name: "James")
// 2. Different names:    func greet(to name: String) → call: greet(to: "James")
// 3. No external label: func greet(_ name: String) → call: greet("James")
//
// Use _ when the label adds no information.
// Use a different external label when it reads more naturally at the call site.

// ── EXAMPLES ─────────────────────────────────────────────────

// same name — most common default
func serve(table: Int) {
    print("Serving table \(table)")
}
serve(table: 5)

// different external and internal name — reads like English
func seat(guest name: String, at tableNumber: Int) {
    print("Seating \(name) at table \(tableNumber)")
}
seat(guest: "James", at: 7)   // reads: seat guest James at 7

// no external label with _
func printReceipt(_ total: Double) {
    print("Total: \(formatPrice(total))")
}
printReceipt(85.50)   // no label needed — obvious from context

// mixing styles — first param no label, second has label
func move(_ item: String, to section: String) {
    print("Moving \(item) to \(section)")
}
move("Pad Thai", to: "specials board")   // reads naturally

// Swift standard library uses this everywhere:
// array.insert("item", at: 0)
// string.replacingOccurrences(of: "a", with: "b")

// ── YOUR TURN ────────────────────────────────────────────────
// 1. Write a function called 'assign' where:
//    - first param: no external label, internal name 'server'
//    - second param: external label 'to', internal name 'table'
//    Print: "Assigning [server] to table [table]"
//    Call it so it reads: assign("Maria", to: 5)
//
// 2. Write a function called 'apply' where:
//    - first param: external 'discount', internal 'rate' (Double)
//    - second param: external 'to', internal 'subtotal' (Double)
//    Returns the discounted total
//    Call it so it reads: apply(discount: 0.10, to: 85.00)
//
// 3. Write a function called 'transfer' where:
//    - first param: external 'guest', internal 'name' (String)
//    - second param: external 'from', internal 'currentTable' (Int)
//    - third param: external 'to', internal 'newTable' (Int)
//    Print: "Transferring James from table 3 to table 7"
//    Call it so it reads: transfer(guest: "James", from: 3, to: 7)
//
// 4. Write a function 'charge' where:
//    - first param: no label, internal name 'amount' (Double)
//    - second param: external 'to', internal 'guestName' (String)
//    Print: "Charging $85.00 to James"
//    Call it: charge(85.00, to: "James")

// YOUR CODE BELOW:




// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: assign("Maria", to: 5) → "Assigning Maria to table 5"
// Exercise 2: apply(discount: 0.10, to: 85.00) → 76.5
// Exercise 3: transfer(guest: "James", from: 3, to: 7) → correct output
// Exercise 4: charge(85.00, to: "James") → "Charging $85.00 to James"


// ============================================================
// TOPIC 4 — DEFAULT PARAMETER VALUES
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// Parameters can have default values — if the caller doesn't
// provide that argument, the default is used automatically.
//
// Syntax: func name(param: Type = defaultValue)
//
// Rules:
// → Parameters with defaults should go LAST (convention)
// → Caller can still override the default by providing a value
// → Reduces repetition when most calls use the same value
//
// You've seen this in Swift's own APIs:
// print("hello", terminator: "\n")  ← terminator has a default of "\n"

// ── EXAMPLES ─────────────────────────────────────────────────

// tip rate defaults to 18%
func calculateBill(subtotal: Double, tipRate: Double = 0.18, taxRate: Double = 0.0875) -> Double {
    let tip = subtotal * tipRate
    let tax = subtotal * taxRate
    return subtotal + tip + tax
}

// use all defaults
print(calculateBill(subtotal: 80.00))
// 80 + 14.40 + 7.00 = 101.40

// override tip rate
print(calculateBill(subtotal: 80.00, tipRate: 0.20))
// 80 + 16.00 + 7.00 = 103.00

// override both
print(calculateBill(subtotal: 80.00, tipRate: 0.15, taxRate: 0.09))
// 80 + 12.00 + 7.20 = 99.20

// practical example — greeting with optional prefix
func greetStaff(_ name: String, role: String = "Team Member") {
    print("Welcome, \(name) — \(role)")
}
greetStaff("James", role: "Manager")   // Welcome, James — Manager
greetStaff("Maria")                    // Welcome, Maria — Team Member

// ── YOUR TURN ────────────────────────────────────────────────
// 1. Write a function 'makeReservation' that takes:
//    - name: String
//    - partySize: Int
//    - time: String = "7:00 PM"     ← default dinner time
//    - occasion: String = "none"    ← default no occasion
//    Print: "Reservation: [name], party of [size], [time], occasion: [occasion]"
//    Test with:
//    makeReservation(name: "James", partySize: 4)
//    makeReservation(name: "Sarah", partySize: 2, time: "8:30 PM")
//    makeReservation(name: "Carlos", partySize: 6, time: "7:00 PM", occasion: "birthday")
//
// 2. Write a function 'formatCurrency' that takes:
//    - amount: Double
//    - symbol: String = "$"
//    - decimals: Int = 2
//    Returns the formatted string
//    Test with:
//    formatCurrency(14.99)              → "$14.99"
//    formatCurrency(14.99, symbol: "€") → "€14.99"
//    formatCurrency(14.99, decimals: 0) → "$15"  ← rounded
//
// 3. Write a function 'staffGreeting' that takes:
//    - name: String
//    - shift: String = "evening"
//    - isManager: Bool = false
//    If isManager is true, add " — have a great shift, boss!" to the greeting
//    Otherwise: " — have a great \(shift) shift!"
//    Test all combinations

// YOUR CODE BELOW:




// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: all three calls produce correct output with defaults
// Exercise 2: "$14.99", "€14.99", "$15"
// Exercise 3: manager vs non-manager greeting works correctly


// ============================================================
// TOPIC 5 — MULTIPLE RETURN VALUES WITH TUPLES
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// You've already used this in Chapters 4 and 5.
// This topic goes deeper on the patterns and best practices.
//
// When a function returns a tuple:
// → Name the tuple fields for clarity
// → Caller can destructure immediately or access by field name
// → Use optional tuple (...)? when the function might fail
// → Keep tuples small — 2 to 4 fields max
//   If you need more, consider a struct (Chapter 8)
//
// Tuples are perfect for:
// → Math results that come in pairs (min and max, quotient and remainder)
// → Status + data (success: Bool, result: String)
// → Grouped related values that aren't worth a full type

// ── EXAMPLES ─────────────────────────────────────────────────

// named tuple return
func billBreakdown(subtotal: Double) -> (tax: Double, tip: Double, total: Double) {
    let tax = subtotal * 0.0875
    let tip = subtotal * 0.18
    return (tax, tip, subtotal + tax + tip)
}

let breakdown = billBreakdown(subtotal: 80.00)
print(breakdown.tax)    // 7.0
print(breakdown.tip)    // 14.4
print(breakdown.total)  // 101.4

// destructuring at call site
let (tax, tip, total) = billBreakdown(subtotal: 80.00)
print("Tax: \(formatPrice(tax)), Tip: \(formatPrice(tip)), Total: \(formatPrice(total))")

// ignoring fields with _
let (_, _, grandTotal) = billBreakdown(subtotal: 80.00)
print("Just the total: \(formatPrice(grandTotal))")

// optional tuple — function might fail
func findStaff(named name: String) -> (role: String, wage: Double)? {
    let roster: [String: (String, Double)] = [
        "James": ("Manager", 24.00),
        "Maria": ("Server", 19.00)
    ]
    guard let info = roster[name] else { return nil }
    return (info.0, info.1)
}

if let staff = findStaff(named: "James") {
    print("\(staff.role) — \(formatPrice(staff.wage))/hr")
}

if let staff = findStaff(named: "Unknown") {
    print(staff.role)
} else {
    print("Staff member not found")
}

// ── YOUR TURN ────────────────────────────────────────────────
// 1. Write a function 'shiftPay' that takes:
//    - name: String
//    - hoursWorked: Double
//    - hourlyRate: Double
//    Returns: (regularPay: Double, overtimePay: Double, totalPay: Double)
//    Regular hours: up to 8 hrs at hourlyRate
//    Overtime: hours over 8 at hourlyRate * 1.5
//    Call with ("James", 10.0, 24.00) and destructure the result
//    Print: "James — regular: $192.00 — overtime: $72.00 — total: $264.00"
//
// 2. Write a function 'menuStats' that takes an array of prices: [Double]
//    Returns: (min: Double, max: Double, average: Double, total: Double)?
//    Return nil if the array is empty
//    Use guard to check for empty array
//    Call with [14.99, 12.50, 8.00, 5.50, 16.00]
//    Print each field labeled
//
// 3. Write a function 'validateOrder' that takes:
//    - itemName: String
//    - quantity: Int
//    Returns: (isValid: Bool, message: String, total: Double)
//    Use this menu: ["Pad Thai": 14.99, "Tom Kha": 12.50, "Spring Rolls": 8.00]
//    isValid = false if item not found or quantity < 1
//    message = "Order confirmed" or the specific error
//    total = price * quantity or 0.0 if invalid

// YOUR CODE BELOW:




// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: James 10hrs @ $24 → regular $192, overtime $72, total $264
// Exercise 2: min $5.50, max $16.00, average $11.40, total $57.00 (approx)
// Exercise 3: valid order returns (true, "Order confirmed", total)
//             invalid item returns (false, error message, 0.0)


// ============================================================
// TOPIC 6 — FUNCTIONS AS VALUES
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// In Swift, functions are first-class values.
// This means a function has a TYPE — just like String or Int.
//
// The type of a function is written as: (ParameterTypes) -> ReturnType
// Examples:
//   (Double) -> String        a function taking Double, returning String
//   (String, Int) -> Bool     a function taking String and Int, returning Bool
//   () -> Void                a function taking nothing, returning nothing
//
// Because functions are values you can:
// → Store them in variables and constants
// → Pass them as arguments to other functions
// → Return them from other functions
//
// This is the foundation of closures (Chapter 7) and
// SwiftUI's entire design (buttons, modifiers, view builders).

// ── EXAMPLES ─────────────────────────────────────────────────

// storing a function in a variable
func double(_ n: Double) -> Double { n * 2 }
func triple(_ n: Double) -> Double { n * 3 }

var transform: (Double) -> Double = double
print(transform(10))   // 20.0

transform = triple
print(transform(10))   // 30.0

// passing a function as an argument
func applyToPrice(_ price: Double, using operation: (Double) -> Double) -> Double {
    return operation(price)
}

print(applyToPrice(14.99, using: double))   // 29.98
print(applyToPrice(14.99, using: triple))   // 44.97

// a function that returns a function
func makeMultiplier(_ factor: Double) -> (Double) -> Double {
    func multiply(_ value: Double) -> Double {
        return value * factor
    }
    return multiply
}

let happyHourDiscount = makeMultiplier(0.80)   // 20% off = multiply by 0.80
print(happyHourDiscount(14.99))   // 11.992 — 20% off Pad Thai

let loyaltyDiscount = makeMultiplier(0.90)   // 10% off
print(loyaltyDiscount(14.99))    // 13.491

// array of functions
let operations: [(Double) -> Double] = [double, triple, happyHourDiscount]
for op in operations {
    print(op(10.00))
}
// 20.0, 30.0, 8.0

// ── YOUR TURN ────────────────────────────────────────────────
// 1. Write two functions:
//    - 'applyTax(_ amount: Double) -> Double'   adds 8.75% tax
//    - 'applyDiscount(_ amount: Double) -> Double'  removes 10%
//    Store both in a variable called 'priceAdjustment' (type: (Double) -> Double)
//    Apply tax first, then switch to discount and apply that
//    Print both results for a $80.00 bill
//
// 2. Write a function 'transform(_ prices: [Double], using operation: (Double) -> Double) -> [Double]'
//    that applies an operation to every price in the array and returns the result
//    Test it with applyTax and applyDiscount on [14.99, 12.50, 8.00]
//
// 3. Write a function 'makeDiscounter(_ rate: Double) -> (Double) -> Double'
//    that returns a function applying that discount rate
//    Create a 15% discounter and a 25% discounter
//    Apply both to $100.00 and print results
//
// 4. Create an array of three price adjustment functions:
//    [applyTax, applyDiscount, makeDiscounter(0.50)]
//    Loop through and apply each to $50.00
//    Print the result of each

// YOUR CODE BELOW:




// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: tax on $80 = $86.80, discount on $80 = $72.00
// Exercise 2: tax array = [16.30, 13.59, 8.70] (approx)
//             discount array = [13.49, 11.25, 7.20]
// Exercise 3: 15% off $100 = $85.00, 25% off $100 = $75.00
// Exercise 4: $54.38 (tax), $45.00 (discount), $25.00 (50% off)


// ============================================================
// TOPIC 7 — @DISCARDABLERESULT
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// When a function returns a value, Swift warns you if you call
// it but don't use the return value. This is a good safety
// feature — it prevents you from accidentally ignoring results.
//
// But sometimes you have a function where the return value is
// useful sometimes but not always. You don't want the caller
// to get a warning when they choose not to use the result.
//
// @discardableResult silences that warning.
// Add it before 'func' to say "it's fine to ignore my return value"
//
// Common in:
// → Logging functions that return success/failure
// → Functions that do work AND return a summary
// → Builder pattern functions that return self

// ── EXAMPLES ─────────────────────────────────────────────────

// without @discardableResult — warning if you don't use return value
func addToQueue(item: String) -> Int {
    print("Added \(item) to queue")
    return 42   // queue position — sometimes useful, sometimes not
}

// this would produce: "Result of call to 'addToQueue' is unused"
// addToQueue(item: "Pad Thai")

// with @discardableResult — no warning
@discardableResult
func addToOrder(item: String) -> Int {
    print("Added \(item) to order")
    return 1   // order item count
}

addToOrder(item: "Pad Thai")          // no warning — result discarded
let count = addToOrder(item: "Tom Kha")  // result used
print("Items in order: \(count)")

// practical example — logging
@discardableResult
func logTransaction(amount: Double, type: String) -> String {
    let log = "[\(type)] $\(String(format: "%.2f", amount))"
    print("LOG: \(log)")
    return log   // return for tests or audit trail — ignored in normal use
}

logTransaction(amount: 85.00, type: "sale")          // log printed, result ignored
let entry = logTransaction(amount: 15.00, type: "tip")  // result kept for audit

// ── YOUR TURN ────────────────────────────────────────────────
// 1. Write a function 'recordSale(amount: Double, table: Int) -> String'
//    that prints "Sale recorded: $X.XX at table N"
//    and returns a log entry string "TABLE-N: $X.XX"
//    WITHOUT @discardableResult — call it without storing the result
//    and notice the warning.
//    Then add @discardableResult and confirm the warning disappears.
//
// 2. Write a function 'processPayment(amount: Double) -> Bool'
//    marked with @discardableResult
//    Always returns true (simulating successful payment)
//    Prints "Payment of $X.XX processed"
//    Call it twice — once ignoring the result, once storing it
//
// 3. Write a function 'buildReceipt(items: [String], total: Double) -> String'
//    marked with @discardableResult
//    Prints the receipt to the console
//    Returns the receipt as a String
//    Call it once without storing the result (just prints)
//    Call it again storing the result (for emailing)

// YOUR CODE BELOW:




// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: warning without attribute, no warning with it
// Exercise 2: both calls work, second stores true
// Exercise 3: receipt printed twice, second call result stored


// ============================================================
//
//  🏆 CHAPTER 6 CHALLENGE: TIP CALCULATOR FUNCTION LIBRARY
//
// ============================================================
//
// BUILD A COMPLETE TIP AND BILL CALCULATION SYSTEM
//
// Thai Kitchen needs a reusable function library for calculating
// bills, tips, and staff payroll. Every function must be clean,
// well-labeled, and reusable.
//
// This challenge ties together everything from Chapter 6:
// argument labels, defaults, tuples, functions as values,
// and @discardableResult.
//
// ── INPUT DATA ───────────────────────────────────────────────

let tableOrders: [Int: [String: Int]] = [
    // tableNumber: [itemName: quantity]
    1: ["Pad Thai": 2, "Thai Iced Tea": 2],
    2: ["Green Curry": 1, "Tom Kha Soup": 2, "Spring Rolls": 3],
    3: ["Pad Thai": 1, "Pad See Ew": 1]
]

let prices: [String: Double] = [
    "Pad Thai": 14.99,
    "Tom Kha Soup": 12.50,
    "Green Curry": 16.00,
    "Spring Rolls": 8.00,
    "Thai Iced Tea": 5.50,
    "Pad See Ew": 14.99
]

let staffPayroll: [String: (hours: Double, rate: Double)] = [
    "James":  (hours: 8.0, rate: 24.00),
    "Maria":  (hours: 6.5, rate: 19.00),
    "Carlos": (hours: 8.0, rate: 21.00),
    "Nina":   (hours: 10.0, rate: 22.50),  // Nina worked overtime
    "Derek":  (hours: 5.0, rate: 17.00)
]

// ── REQUIREMENTS ─────────────────────────────────────────────
//
// 1. TABLE SUBTOTAL
//    Write a function 'tableSubtotal(for tableNumber: Int) -> Double?'
//    Look up the table's order in tableOrders
//    Calculate subtotal by multiplying each item's price × quantity
//    Return nil if table not found or item not in prices
//    Return the subtotal as Double
//    Test with tables 1, 2, 3, and 99 (not found)
//
// 2. FULL BILL
//    Write a function:
//    'fullBill(for tableNumber: Int, tipRate: Double = 0.18, taxRate: Double = 0.0875)'
//    Returns: (subtotal: Double, tax: Double, tip: Double, total: Double)?
//    Use tableSubtotal internally
//    Test with table 1 using defaults
//    Test with table 2 using tipRate: 0.20
//
// 3. BILL FORMATTER
//    Write a function 'printBill(for tableNumber: Int, tipRate: Double = 0.18)'
//    marked with @discardableResult that returns a String receipt
//    Use fullBill internally
//    Print a formatted receipt:
//    "── Table 1 ──────────────────"
//    "  2x Pad Thai        $29.98"
//    "  2x Thai Iced Tea   $11.00"
//    "  ────────────────────────"
//    "  Subtotal:          $40.98"
//    "  Tax (8.75%):        $3.59"
//    "  Tip (18%):          $7.38"
//    "  ────────────────────────"
//    "  TOTAL:             $51.94"
//    Call it for all three tables — result discarded (just prints)
//    Call it for table 1 again and store the result
//
// 4. PAYROLL CALCULATOR
//    Write a function:
//    'calculatePayroll(_ name: String) -> (name: String, hours: Double, regularPay: Double, overtimePay: Double, totalPay: Double)?'
//    Regular pay: up to 8 hours at their rate
//    Overtime: hours over 8 at rate × 1.5
//    Return nil if staff member not found
//    Test with all staff members
//
// 5. PAYROLL SUMMARY
//    Write a function 'payrollSummary() -> (totalPay: Double, highestEarner: String)'
//    Use calculatePayroll for each staff member
//    Return the total payroll and the name of the highest earner
//    Print: "Total payroll: $XXX.XX — Highest earner: Nina"
//
// 6. PRICE ADJUSTER
//    Write a function 'makeAdjuster(multiplier: Double) -> (Double) -> Double'
//    Returns a function that multiplies any price by the multiplier
//    Create:
//    - happyHourAdjuster (20% off = multiplier 0.80)
//    - largePartyAdjuster (15% surcharge = multiplier 1.15)
//    Apply each to the subtotal of table 1
//    Print both adjusted amounts
//
// ── RULES ────────────────────────────────────────────────────
// → Use argument labels that make call sites read naturally
// → Use default parameters for tipRate and taxRate
// → Return optional tuples where the function might fail
// → Use @discardableResult on printBill
// → Use a function-as-value for requirement 6
// → No hardcoded values — all data from the dictionaries above
//
// ── HINTS ────────────────────────────────────────────────────
// → Requirement 1: loop tableOrders[tableNumber] with for (item, qty) in
// → Requirement 3: loop tableOrders[tableNumber] again for line items
// → Requirement 4: overtime only applies to hours ABOVE 8, not all hours
// → Requirement 5: use reduce on staffPayroll.keys to accumulate total
// → Requirement 6: the returned function captures 'multiplier' from
//   the outer scope — this is a preview of closures in Chapter 7
//
// ── YOUR CODE BELOW ──────────────────────────────────────────




// ============================================================
// END OF CHAPTER 6
// ============================================================
//
// When you're done:
// ✅ All YOUR TURN sections compile and print expected output
// ✅ Challenge covers all 6 requirements
// ✅ Argument labels, defaults, tuples, functions-as-values used
//
// Next up: Chapter 7 — Closures
// Closures are anonymous functions — functions without a name.
// You've already seen them as the { } blocks in map, filter, reduce.
// Chapter 7 goes deep on syntax, capturing, and @escaping.
// ============================================================