
//import UIKit
import Foundation

// ============================================================
// SWIFT ESSENTIALS — CHAPTER 1: THE BASICS
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





// ============================================================
// TOPIC 1 — TYPES Start Time: 12:40PM -> End Time:
// Int, Double, Float, String, Bool
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// Swift is a strongly typed language.
// Every value has a type and that type never secretly changes.
//
// Int    → whole numbers only. no decimals. for counting things.
// Double → decimal numbers. ~15 decimal places. Swift's default for decimals.
// Float  → decimal numbers. ~6 decimal places. less precise than Double.
// String → text. always wrapped in double quotes.
// Bool   → exactly two values: true or false. nothing else.

// ── EXAMPLES ─────────────────────────────────────────────────

let tableCount: Int     = 12
let itemPrice: Double   = 14.99
let taxRate: Float      = 0.0875
let restaurantName: String = "Thaiphoon"
let isOpen: Bool        = true

print(tableCount)
print(itemPrice)
print(taxRate)
print(restaurantName)
print(isOpen)

// ── YOUR TURN ────────────────────────────────────────────────
// 1. Create an Int called 'numberOfGuests' and set it to 4
// 2. Create a Double called 'billTotal' and set it to 86.50
// 3. Create a String called 'serverName' and set it to your name
// 4. Create a Bool called 'isHappyHour' and set it to false
// 5. Print all four values

// YOUR CODE BELOW:
let numberOfGuests: Int = 4
let billTotal: Double = 86.50
let serverName: String = "James Vongampai"
let isHappyHour: Bool = false

print(numberOfGuests)
print(billTotal)
print(serverName)
print(isHappyHour)



// ── CHECK YOURSELF ───────────────────────────────────────────
// When you run it, you should see:
// 4
// 86.5
// (your name)
// false


// ============================================================
// TOPIC 2 — VAR VS LET
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// let → constant. the value can NEVER change after you set it.
// var → variable. the value CAN change whenever you want.
//
// Rule: always start with let.
// Only switch to var when you know the value needs to change.
// Swift will warn you if you use var but never change the value.

// ── EXAMPLES ─────────────────────────────────────────────────

let restaurantCity = "Palo Alto"   // will never change — use let
var currentGuests  = 0             // changes as people arrive — use var

currentGuests = 4
currentGuests = 7
print(currentGuests)   // 7

// this would cause an error — you cannot reassign a let:
// restaurantCity = "San Francisco"   // ❌ error

// ── YOUR TURN ────────────────────────────────────────────────
// 1. Create a let for your restaurant's address (it never changes)
// 2. Create a var for 'tablesAvailable' starting at 10
// 3. A party arrives — subtract 2 from tablesAvailable
// 4. Another party arrives — subtract 3 more
// 5. Print tablesAvailable — it should be 5

// YOUR CODE BELOW:
let restaurantAddress = "123 Skyline Blvd Mountain View, CA 94040"
var tablesAvailable = 10
tablesAvailable -= 2
tablesAvailable -= 3
print(tablesAvailable)



// ── CHECK YOURSELF ───────────────────────────────────────────
// tablesAvailable should print: 5
// Try changing your let — confirm it gives you a compile error


// ============================================================
// TOPIC 3 — TYPE INFERENCE
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// Swift can figure out the type from the value you assign.
// You don't always need to write the type explicitly.
//
// When the type is obvious from the right side → infer it
// When the collection is empty → declare explicitly
// When Swift gets it wrong → declare explicitly

// ── EXAMPLES ─────────────────────────────────────────────────

let city      = "Palo Alto"    // Swift infers String
let seats     = 45             // Swift infers Int
let avgBill   = 62.50          // Swift infers Double
let isClosedOnMondays = false  // Swift infers Bool

// check what Swift inferred:
print(type(of: city))      // String
print(type(of: seats))     // Int
print(type(of: avgBill))   // Double

// when you NEED to be explicit — empty collections:
var waitlist: [String] = []      // nothing to infer from, must declare
var ratings: [Double] = []

// when Swift infers the WRONG type:
let tipRate: Float = 0.18        // without : Float, Swift would make this Double

// ── YOUR TURN ────────────────────────────────────────────────
// 1. Create three variables using ONLY type inference (no type annotation):
//    - a String for your favourite menu item
//    - an Int for the calories in that item
//    - a Double for the price of that item
//
// 2. Use type(of:) to print the type of each one
//    and confirm Swift inferred correctly
//
// 3. Create an explicitly typed Float called 'serviceCharge'
//    and set it to 0.20
//    Then print type(of: serviceCharge) to confirm it's Float not Double

// YOUR CODE BELOW:
let favoriteMenuItem = "Orange Chicken"
let calories = 600
let price = 8.99

print(type(of: favoriteMenuItem))
print(type(of: calories))
print(type(of: price))

let serviceCharge: Float = 0.20

print("serviceCharge: \(type(of: serviceCharge)) ")


// ── CHECK YOURSELF ───────────────────────────────────────────
// type(of:) should print: String, Int, Double, Float
// If your third one says Double instead of Float — you forgot : Float


// ============================================================
// TOPIC 4 — TYPE CONVERSION
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// Swift NEVER silently converts between types.
// If you want to mix Int and Double in math — you convert explicitly.
//
// Double(someInt)  → converts Int up to Double
// Int(someDouble)  → converts Double down to Int — TRUNCATES, does not round
//
// Truncate means it chops the decimal off completely.
// Int(14.99) gives you 14, not 15.
// If you want rounding: Int(someDouble.rounded())

// ── EXAMPLES ─────────────────────────────────────────────────

let partySize: Int    = 6
let pricePerHead: Double = 24.99

// this would ERROR — cannot multiply Int and Double directly:
// let totalCost = partySize * pricePerHead   // ❌

// convert Int to Double first, then multiply:
let totalCost = Double(partySize) * pricePerHead
print(totalCost)   // 149.94

// Double → Int: truncation (NOT rounding)
let truncated = Int(totalCost)
print(truncated)   // 149 — not 150

// Double → Int: with rounding
let rounded = Int(totalCost.rounded())
print(rounded)     // 150

// ── YOUR TURN ────────────────────────────────────────────────
// A table ordered the following:
//   3 Pad Thai at $14.99 each
//   2 Tom Kha Soup at $12.50 each
//   4 Spring Rolls at $8.00 each
//
// All quantities are Ints. All prices are Doubles.
//
// 1. Calculate the subtotal for each item
//    (you'll need to convert the Int quantities to Double)
//
// 2. Calculate the grand total of all three items
//
// 3. Print the grand total
//
// 4. Print the grand total as an Int using truncation
//
// 5. Print the grand total as an Int using rounding
//
// HINT: 3 items × price requires Double(quantity) × price

// YOUR CODE BELOW:
let padThaiPrice = 14.99
let tomKhaPrice = 12.50
let springRollPrice = 8.00

let padThaiQuantity = 3
let tomKhaQuantity = 2
let springRollsQuantity = 4

let padThaiSubTotal = padThaiPrice * Double(padThaiQuantity)
let tomKhaSubTotal = tomKhaPrice * Double(tomKhaQuantity)
let springRollSubTotal = springRollPrice * Double(springRollsQuantity)

let grandTotal = padThaiSubTotal + tomKhaSubTotal + springRollSubTotal

print("Pad Thai subtotal: \(padThaiSubTotal)" )
print("Tom kha subtotal: \(tomKhaSubTotal)")
print("Spring Rolls subtotal: \(springRollSubTotal)")
print("Grand total: \(grandTotal)")
print("Truncated: \(Int(grandTotal))")
print("Rounded: \(Int(grandTotal.rounded()))")




// ── CHECK YOURSELF ───────────────────────────────────────────
// Pad Thai subtotal:    44.97
// Tom Kha subtotal:     25.00
// Spring Rolls subtotal: 32.00
// Grand total:          101.97
// Truncated:            101
// Rounded:              102


// ============================================================
// TOPIC 5 — STRING METHODS
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// Strings in Swift are powerful — they come with built-in methods
// that let you inspect, transform, search, and clean text.
//
// The most important ones for real iOS apps:
// .count                              → number of characters
// .isEmpty                            → is it blank?
// .uppercased() / .lowercased()       → change case
// .capitalized                        → First Letter Each Word
// .contains("x")                      → does it include this?
// .hasPrefix("x")                     → starts with this?
// .hasSuffix("x")                     → ends with this?
// .trimmingCharacters(in:.whitespaces) → remove leading/trailing spaces
// .replacingOccurrences(of:with:)     → find and replace
// .split(separator:)                  → break into array

// ── EXAMPLES ─────────────────────────────────────────────────

var dish = "pad thai with chicken"
var userInput = "   james@email.com   "

print(dish.count)                    // 22
print(dish.isEmpty)                  // false
print(dish.uppercased())             // PAD THAI WITH CHICKEN
print(dish.capitalized)              // Pad Thai With Chicken
print(dish.contains("chicken"))      // true
print(dish.hasPrefix("pad"))         // true
print(dish.hasSuffix("chicken"))     // true

// critical for user input:
let cleanEmail = userInput.trimmingCharacters(in: .whitespaces)
print(cleanEmail)   // james@email.com (spaces gone)

// find and replace:
let vegVersion = dish.replacingOccurrences(of: "chicken", with: "tofu")
print(vegVersion)   // pad thai with tofu

// string interpolation — put any value inside \()
let guests = 4
let table  = 7
print("Table \(table) has \(guests) guests")   // Table 7 has 4 guests

// ── YOUR TURN ────────────────────────────────────────────────
// Use this starter data:

var menuItem    = "  Pad See Ew with Shrimp  "
var orderNote   = "extra spicy, no peanuts, add egg"
var customerEmail = "JAMES@THAIPHOON.COM"

// 1. Trim the whitespace from menuItem and print it
//
// 2. Print the character count of menuItem AFTER trimming
//    (store the trimmed version in a new variable first)
//
// 3. Print menuItem in all caps
//    Then print it capitalized (first letter of each word)
//
// 4. Check if orderNote contains "peanuts" — print the result
//
// 5. Check if orderNote hasPrefix "extra" — print the result
//
// 6. Lowercase the customerEmail
//    (always lowercase emails before storing them)
//
// 7. Replace "Shrimp" in the trimmed menuItem with "Tofu"
//    and print the result
//
// 8. Split orderNote by ", " and print the resulting array
//
// 9. Using string interpolation, print a sentence like:
//    "Order for james@thaiphoon.com: Pad See Ew with Shrimp"
//    using your variables (not hardcoded strings)

// YOUR CODE BELOW:
let cleanMenuItem = menuItem.trimmingCharacters(in: .whitespaces)

let letterCount = cleanMenuItem.count
let uppercaseMenuItem = menuItem.uppercased()
let capitalizedMenuItem = menuItem.capitalized
let hasNuts = orderNote.contains("peanuts")
let hasExtra = orderNote.hasPrefix("extra")
let lowerCasedEmail = customerEmail.lowercased()
let replacingWithTofu = menuItem.replacingOccurrences(of:"Shrimp", with: "Tofu")
let totalOrder = orderNote.split(separator: ", ")

print("Trimmed:    \(cleanMenuItem)")
print("Count after trim:    \(letterCount)")
print("All caps:    \(uppercaseMenuItem)")
print("Capitalized:    \(capitalizedMenuItem)")
print("Contains peanuts:    \(hasNuts)")
print("HasPrefix extra:    \(hasExtra)")
print("Lowercased email:    \(lowerCasedEmail)")
print("Tofu swap:    \(replacingWithTofu)")
print("Split result:    \(totalOrder)")

print("Order for \(lowerCasedEmail): \(cleanMenuItem)")



// ── CHECK YOURSELF ───────────────────────────────────────────
// Trimmed:         "Pad See Ew with Shrimp"
// Count after trim: 22
// All caps:        "PAD SEE EW WITH SHRIMP"
// Capitalized:     "Pad See Ew With Shrimp"
// Contains peanuts: true
// HasPrefix extra:  true
// Lowercased email: "james@thaiphoon.com"
// Tofu swap:        "Pad See Ew with Tofu"
// Split result:     ["extra spicy", "no peanuts", "add egg"]


// ============================================================
// TOPIC 6 — OPERATORS
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// Arithmetic operators:
// +   addition
// -   subtraction
// *   multiplication
// /   division
// %   modulo (remainder after division)
//
// Compound assignment (shorthand):
// +=  add and assign         x += 5  →  x = x + 5
// -=  subtract and assign    x -= 5  →  x = x - 5
// *=  multiply and assign    x *= 2  →  x = x * 2
// /=  divide and assign      x /= 2  →  x = x / 2
//
// Comparison operators (always return Bool):
// ==  equal to
// !=  not equal to
// >   greater than
// <   less than
// >=  greater than or equal to
// <=  less than or equal to
//
// Logical operators (combine Bools):
// &&  AND — both must be true
// ||  OR  — at least one must be true
// !   NOT — flips true to false, false to true

// ── EXAMPLES ─────────────────────────────────────────────────

// arithmetic
let subtotal  = 45.00
let tax       = subtotal * 0.0875
let tip       = subtotal * 0.20
let total     = subtotal + tax + tip
print(total)   // 57.94

// modulo — remainder — useful for "every Nth item" logic
print(10 % 3)   // 1  (10 divided by 3 = 3 remainder 1)
print(9  % 3)   // 0  (9 divided by 3 = 3 remainder 0, evenly divisible)

// compound assignment
var tablesOccupied = 0
tablesOccupied += 3    // 3
tablesOccupied += 2    // 5
tablesOccupied -= 1    // 4
print(tablesOccupied)  // 4

// comparison
print(5 > 3)    // true
print(5 == 5)   // true
print(5 != 3)   // true
print(5 <= 5)   // true

// logical
let isOpen2     = true
let hasSeating  = false
let isHoliday   = false

print(isOpen2 && hasSeating)          // false — both must be true
print(isOpen2 || hasSeating)          // true  — at least one is true
print(!isHoliday)                     // true  — flipped
print(isOpen2 && !isHoliday)         // true  — open AND not a holiday

// ── YOUR TURN ────────────────────────────────────────────────
// A server is calculating a table's final bill.
// Use this starting data:

var foodTotal  = 78.50
var drinkTotal = 24.00
let taxRateOp  = 0.0875   // 8.75%
let tipRateOp  = 0.18     // 18%

// 1. Calculate the combined subtotal (food + drinks)
//
// 2. Calculate the tax amount on the subtotal
//
// 3. Calculate the tip amount on the subtotal
//
// 4. Calculate the grand total (subtotal + tax + tip)
//
// 5. Using +=, add a $5.00 corkage fee directly to the grand total
//
// 6. Print whether the grand total is over $100 (true or false)
//
// 7. Print whether the grand total is over $100 AND the tipRate is above 0.15
//
// BONUS: A table number is 'even' if tableNumber % 2 == 0
//        Create a var tableNumber = 7
//        Print whether it is even (hint: use % and ==)

// YOUR CODE BELOW:
let subTotal = foodTotal + drinkTotal
print("subtotal: \(subTotal)")
let subTotalTax = subTotal * taxRateOp
print("tax: \(subTotalTax)")
let tipAmount = subTotal * tipRateOp
print("tip: \(tipAmount)")
var billGrandTotal = subTotal + subTotalTax + tipAmount
billGrandTotal += 5.00
print("Grand total: \(billGrandTotal)")
print(billGrandTotal > 100)
print(billGrandTotal > 100 && tipRateOp > 0.15)
var tableNumber = 7
print(tableNumber % 2 == 0)




// ── CHECK YOURSELF ───────────────────────────────────────────
// Subtotal:     102.50
// Tax:            8.97 (approximately)
// Tip:           18.45
// Grand total:  129.92 (approximately) + $5 corkage = 134.92
// Over $100:    true
// Over $100 AND tipRate > 0.15: true
// Table 7 is even: false


// ============================================================
// TOPIC 7 — RANGES
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// Ranges represent a sequence of values between two endpoints.
//
// Closed range:    1...5    includes 1, 2, 3, 4, 5   (both ends included)
// Half-open range: 1..<5    includes 1, 2, 3, 4      (last end NOT included)
//
// When to use which:
// Use ...  when you want to include the last value
// Use ..< when working with array indices (arrays end at count - 1)
//
// Ranges are used everywhere: loops, switch statements, slicing arrays

// ── EXAMPLES ─────────────────────────────────────────────────

// closed range — 1 through 5 including 5
let closedRange = 1...5
print("closed range: \(closedRange)")
print(closedRange.contains(5))   // true
print(closedRange.contains(6))   // false

// half-open range — 1 through 4, does NOT include 5
let halfOpen = 1..<5
print(halfOpen.contains(4))      // true
print(halfOpen.contains(5))      // false

// using a range with a for loop (preview of Chapter 3):
for i in 1...3 {
    print("Table \(i)")
}
// Table 1
// Table 2
// Table 3

// half-open is perfect for array indices:
let menuItems = ["Pad Thai", "Tom Kha", "Spring Rolls"]
// valid indices are 0, 1, 2 — which is 0..<menuItems.count
for i in 0..<menuItems.count {
    print(menuItems[i])
}

// checking if a value falls in a range:
let partySize2 = 8
let largeParty = 6...20
print(largeParty.contains(partySize2))   // true — 8 is in 6...20

// ── YOUR TURN ────────────────────────────────────────────────
// 1. Create a closed range for table numbers 1 through 12
//    Print whether table 12 is in that range
//    Print whether table 13 is in that range
//
// 2. Create a half-open range for the same tables
//    Print whether table 12 is in THAT range
//    (notice the difference from the closed range)
//
// 3. Use a closed range in a for loop to print:
//    "Seat 1 is ready"
//    "Seat 2 is ready"
//    ... all the way to "Seat 5 is ready"
//
// 4. A restaurant has a special for parties of 4 to 10 people.
//    Create a range for that.
//    Check if a party of 4 qualifies.
//    Check if a party of 11 qualifies.
//    Print both results.

// YOUR CODE BELOW:
let tables = 1...12
print(tables.contains(12))
print(tables.contains(13))

let outdoorTables = 1..<12
print(outdoorTables.contains(12))

for i in 1...5 {
    print("Seat \(i) is ready")
}

let specialParties = 4...10
print(specialParties.contains(4))
print(specialParties.contains(11))




// ── CHECK YOURSELF ───────────────────────────────────────────
// Table 12 in closed (1...12):      true
// Table 13 in closed (1...12):      false
// Table 12 in half-open (1..<12):   false  ← key difference
// Seats 1 through 5 printed
// Party of 4 qualifies:  true
// Party of 11 qualifies: false


// ============================================================
//
//  🏆 CHAPTER 1 CHALLENGE: THAIPHOON RECEIPT PRINTER
//
// ============================================================
//
// BUILD A CLI RECEIPT PRINTER IN SWIFT
//
// Your job is to write a Swift script that prints a formatted
// restaurant receipt for Thai Kitchen, a Thai restaurant using everything from Chapter 1.
//
// ── REQUIREMENTS ─────────────────────────────────────────────
//
// The receipt must include:
//
// 1. HEADER
//    - Restaurant name (String)
//    - Address: 543 Emerson St, Palo Alto, CA
//    - A divider line of dashes
//
// 2. ORDER ITEMS  (use these exact values)
//    - 2x Pad Thai         @ $14.99 each
//    - 1x Tom Kha Soup     @ $12.50 each
//    - 3x Spring Rolls     @ $8.00  each
//    - 1x Thai Iced Tea    @ $5.50  each
//    Quantities are Ints. Prices are Doubles.
//    Print each line item formatted like:
//    "2x Pad Thai         $29.98"
//
// 3. SUBTOTAL
//    Calculate and print the subtotal of all items
//
// 4. TAX
//    Tax rate: 8.75% (use a constant)
//    Calculate and print the tax amount
//
// 5. TIP
//    Tip rate: 18% (use a constant)
//    Calculate and print the tip amount on the subtotal
//
// 6. TOTAL
//    Print the final total (subtotal + tax + tip)
//    Format it to 2 decimal places using:
//    String(format: "%.2f", yourTotal)
//
// 7. FOOTER
//    - A divider line
//    - "Thank you for dining at Thaiphoon!"
//    - Check: if total is over $60, print "Large party surcharge may apply"
//
// ── RULES ────────────────────────────────────────────────────
// → No hardcoded totals — all math must be calculated in code
// → Use let for anything that doesn't change
// → Use var for running totals that accumulate
// → All quantities must be Int, all prices must be Double
// → You must handle the Int × Double conversion explicitly
// → Use string interpolation for all printed lines
// → Use at least one compound operator (+=)
// → Use at least one comparison operator to trigger the footer message
//
// ── HINTS ────────────────────────────────────────────────────
// → You already know everything you need — it's all in Chapter 1
// → Start with the data (items, quantities, prices)
// → Then calculate each line item total
// → Then accumulate the subtotal using +=
// → Then calculate tax and tip from the subtotal
// → Then print everything at the end
// → String(format: "%.2f", someDouble) formats to 2 decimal places
//
// ── EXPECTED OUTPUT ──────────────────────────────────────────
// Something like this (your formatting can vary):
//
// ─────────────────────────────
// THAIPHOON RESTAURANT
// 543 Emerson St, Palo Alto, CA
// ─────────────────────────────
// 2x Pad Thai            $29.98
// 1x Tom Kha Soup        $12.50
// 3x Spring Rolls        $24.00
// 1x Thai Iced Tea        $5.50
// ─────────────────────────────
// Subtotal               $71.98
// Tax (8.75%)             $6.30
// Tip (18%)              $12.96
// ─────────────────────────────
// TOTAL                  $91.24
// ─────────────────────────────
// Thank you for dining at Thaiphoon!
// Large party surcharge may apply
//
// ── YOUR CODE BELOW ──────────────────────────────────────────

let menu: [String] = ["Pad Thai", "Tom Kha Soup", "Spring Rolls", "Thai Iced Tea"]
let prices: [Double] = [14.99, 12.50, 8.00, 5.50]
let quantity: [Int] = [2, 1, 3, 1]
let businessName = "Thai Kitchen"
let address = "543 Emerson St, Palo Alto, CA"

var receiptSubtotal:Double = 0
let restaurantTaxRate = 0.0875
let restaurantTipRate = 0.18


for i in 0..<menu.count {
    receiptSubtotal += prices[i] * Double(quantity[i])
}

let taxAmt = receiptSubtotal * restaurantTaxRate
let tipAmt = receiptSubtotal * restaurantTipRate

let formattedTaxAmt = String(format: "%.2f", receiptSubtotal * restaurantTaxRate)
let formattedTipAmt = String(format: "%.2f", receiptSubtotal * restaurantTipRate)

let receiptGrandTotal = receiptSubtotal + taxAmt + tipAmt
let formattedGrandTotal = String(format: "%.2f", receiptGrandTotal)
print("------------------------------------------")
print(businessName.trimmingCharacters(in: .whitespaces))
print(address)
print("------------------------------------------")
//print("\(quantity[0])x \(menu[0])   $\(prices[0] * Double(quantity[0]))")
//print("\(quantity[1])x \(menu[1])   $\(prices[1] * Double(quantity[1]))")
//print("\(quantity[2])x \(menu[2])   $\(prices[2] * Double(quantity[2]))")
//print("\(quantity[3])x \(menu[3])   $\(prices[3] * Double(quantity[3]))")
for i in 0..<menu.count {
    let lineItemPrice = prices[i] * Double(quantity[i])
    print("\(quantity[i])x \(menu[i]) $\(String(format: "%.2f", lineItemPrice))")
}
print("Subtotal:    $\(String(format: "%.2f", receiptSubtotal))")
print("Tax:         $\(String(format:"%.2f", taxAmt))")
print("Tip:         $\(String(format:"%.2f", tipAmt))")
print("------------------------------------------")
print("TOTAL \(formattedGrandTotal)")
print("------------------------------------------")
print("Thank you for dining at Thaiphoon!")
(receiptGrandTotal > 60) ? print("Large party surcharge may apply") : print("Try our specials")


// ============================================================
// END OF CHAPTER 1
// ============================================================
//
// When you're done:
// ✅ All YOUR TURN sections compile and print expected output
// ✅ Challenge receipt prints correctly with calculated totals
// ✅ No hardcoded math — everything is computed
//
// Next up: Chapter 2 — Control Flow
// You'll use if/else and switch to make the receipt smarter:
// different tip rates for different party sizes,
// happy hour discounts, reservation requirements, and more.
// ============================================================
