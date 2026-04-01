
// ──────────────────────────────
// String — text, wrapped in double quotes
// ──────────────────────────────

var greeting = "Hello, playground"
var myName = "Stephen Curry"
var message = "I hope this course is good"

// Swift infers these are all String — you don't have to say so
print(type(of: greeting))  // String
print(type(of: myName))    // String


// ──────────────────────────────
// Strings are just text — but they can do a lot
// ──────────────────────────────

// Combine strings with +
var welcome = greeting + ", " + myName
print(welcome)  // Hello, playground, James Johnson

// String interpolation — the Swift way (preferred)
var intro = "My name is \(myName) and \(message)"
print(intro)  // My name is James Johnson and I hope this course is good

// You can put any expression inside \()
var tableCount = 12
var status = "We have \(tableCount) tables at Thaiphoon tonight"
print(status)   // We have 12 tables at Thaiphoon tonight

var tip = 0.20
var tipMessage = "Tip rate is \(tip * 100)%"
print(tipMessage)  // Tip rate is 20.0%


// ──────────────────────────────
// Boolean — only two possible values: true or false
// ──────────────────────────────

var isDarkModeOn: Bool = true   // explicit type annotation
var toggle = false               // Swift infers Bool

print(isDarkModeOn)  // true
print(toggle)        // false


// ──────────────────────────────
// Booleans are used for decisions
// ──────────────────────────────

var isRestaurantOpen = true
var hasAvailableTable = false
var isHappyHour = true



// Numbers in Swift

// ──────────────────────────────
// Int — whole numbers, no decimals
// ──────────────────────────────
let totalTables: Int = 12
let guestCount: Int = 47
let totalOrders: Int = 318

print(totalTables)   // 12
print(guestCount)   // 47


// ──────────────────────────────
// Float — decimal numbers, ~6 decimal places of precision
// ──────────────────────────────
let customerTipRate: Float = 0.18
let taxRate: Float = 0.0875
let itemPrice: Float = 14.999999   // Float starts losing precision here

print(customerTipRate)      // 0.18
print(itemPrice)    // 14.999999 — but may round slightly at the edge


// ──────────────────────────────
// Double — decimal numbers, ~15 decimal places of precision
// ──────────────────────────────
let precisePrice: Double = 0.7891234567898789
let totalRevenue: Double = 10482.987654321098

print(precisePrice)   // 0.7891234567898789
print(totalRevenue)   // 10482.987654321098


// ──────────────────────────────
// What's the difference?
// ──────────────────────────────

// Int   → no decimals at all. Use for counting things.
//         tables, guests, orders, episodes, days

// Float → 32-bit. Holds about 6-7 decimal places accurately.
//         smaller in memory, less precise
//         rarely used in Swift — Double is the default

// Double → 64-bit. Holds about 15-17 decimal places accurately.
//          Swift's default for any decimal number
//          use this unless you have a specific reason not to


// ──────────────────────────────
// Practical rule of thumb
// ──────────────────────────────

// Counting something?          → Int
// Money, percentages, math?    → Double
// Working with Apple APIs?     → Double (they expect it)
// Float?                       → almost never, unless a library forces it


// ──────────────────────────────
// Type inference — Swift figures it out
// ──────────────────────────────

let guests   = 8          // Swift infers Int
let tipPct   = 0.20       // Swift infers Double
let explicit: Float = 0.20 // you have to be explicit to get Float

print(type(of: guests))    // Int
print(type(of: tipPct))    // Double
print(type(of: explicit))  // Float


// ──────────────────────────────
// Common gotcha — Int + Double won't compile
// ──────────────────────────────

let subTotal = 8            // Int
let tipRate   = 0.20         // Double

// let result = tables * rate  ← ERROR: Swift won't mix types silently
    
let totalTip = Double(subTotal) * tipRate  // ✅ convert explicitly first
print(totalTip)   // 1.6

// Double → Int (going down — truncates, does NOT round)
let total = Double(subTotal) + totalTip
print(total)  // 8 + 1.6 = 9.6
print("total:  \(Int(total))") // but this will truncate and be 9 ← not 150, just chops the decimal off

// Double → Int rounded (if you actually want rounding)
let rounded = Int(total.rounded())
print(rounded)  // 150
