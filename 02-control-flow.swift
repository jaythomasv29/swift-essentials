// ============================================================
// SWIFT ESSENTIALS — CHAPTER 2: CONTROL FLOW
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
// TOPIC 1 — IF / ELSE IF / ELSE
// ============================================================
 
// ── CONCEPT ──────────────────────────────────────────────────
// if/else lets your program make decisions.
// Swift evaluates a condition — if it's true, it runs that block.
// If it's false, it moves to the next condition.
// The else block is the fallback — runs when nothing else matched.
//
// Structure:
// if condition {
//     // runs if condition is true
// } else if anotherCondition {
//     // runs if first was false, this is true
// } else {
//     // runs if everything above was false
// }
//
// Important: only ONE block runs — the first one that matches.
// Swift stops checking once it finds a match.
 
// ── EXAMPLES ─────────────────────────────────────────────────
 
let currentHour = 14   // 2:00 PM in 24hr time
 
if currentHour < 11 {
    print("Good morning — breakfast menu is available")
} else if currentHour < 15 {
    print("Good afternoon — lunch menu is available")
} else if currentHour < 22 {
    print("Good evening — dinner menu is available")
} else {
    print("Sorry, the kitchen is closed")
}
// prints: Good afternoon — lunch menu is available
 
// combining conditions with && and ||
let isWeekend = true
let partySize = 6
 
if isWeekend && partySize > 5 {
    print("Reservation required for large weekend parties")
}
 
// checking multiple unrelated conditions
let tableIsClean = true
let serverIsAvailable = false
 
if tableIsClean && serverIsAvailable {
    print("Seat the guests now")
} else if tableIsClean && !serverIsAvailable {
    print("Table is ready but waiting for a server")
} else {
    print("Table is not ready")
}
// prints: Table is ready but waiting for a server
 
// ── YOUR TURN ────────────────────────────────────────────────
// Thai Kitchen has the following hours:
//   Open:        11:00 AM to 10:00 PM  (11 to 22 in 24hr)
//   Happy Hour:  3:00 PM to 6:00 PM    (15 to 18 in 24hr)
//   Last order:  9:30 PM               (21 in 24hr — simplify to hour)
//
// Use this starting data:

// 1. Print "Thai Kitchen is open" or "Thai Kitchen is closed"
//    based on whether hour falls in 11...22
//
// 2. Inside the "open" block, add a nested if:
//    if it's happy hour (15 to 18), print "Happy hour is active — 20% off drinks"
//
// 3. Add another condition: if hour is 21 or later AND the restaurant is open,
//    print "Last orders — kitchen closes soon"
//
// 4. Add a final condition: if isHoliday is true,
//    print "Holiday hours may vary — please call ahead"
//    (this should print regardless of whether they're open or closed)
 
// YOUR CODE BELOW:
 var hour = 16        // try changing this to test different scenarios
var isHoliday = false
let businessHours = 11...22

if businessHours.contains(hour) {
    print("Thai Kitchen is open")
    if hour >= 15 && hour <= 18 {
        print("Happy hour is active - 20% off drinks")
    } else if hour >= 21 {
        print("Last orders - kitchen closes soon")
    }

} else {
   print("Thai Kitchen is closed")
}
if isHoliday {
    print("Holiday hours may vary — please call ahead")
}
 
 
// ── CHECK YOURSELF ───────────────────────────────────────────
// hour = 16:  "Thai Kitchen is open" + "Happy hour is active"
// hour = 21:  "Thai Kitchen is open" + "Last orders"
// hour = 23:  "Thai Kitchen is closed"
// isHoliday = true + any hour: adds holiday message
 
 
// ============================================================
// TOPIC 2 — TERNARY OPERATOR
// ============================================================
 
// ── CONCEPT ──────────────────────────────────────────────────
// The ternary operator is a one-line if/else.
// Use it when you need to choose between exactly two values.
//
// Syntax:
// condition ? valueIfTrue : valueIfFalse
//
// The result can be stored in a variable or used inline.
//
// When to use ternary vs if/else:
// → Ternary: simple true/false value assignment, one line
// → if/else: multiple conditions, multiple lines of logic, side effects
 
// ── EXAMPLES ─────────────────────────────────────────────────
 
let guestCount = 3
let seatingArea = guestCount > 6 ? "private dining room" : "main floor"
print("Seating: \(seatingArea)")   // Seating: main floor
 
// inline in a print statement
let isOpenNow = true
print("Status: \(isOpenNow ? "Open" : "Closed")")   // Status: Open
 
// storing the result
let discountRate = isOpenNow ? 0.0 : 0.10   // 10% off if closed (clearance)
print(discountRate)   // 0.0
 
// ternary with comparison
let temperature = 32   // Celsius
let weatherNote = temperature > 28 ? "Hot day — cold drinks special" : "Regular menu"
print(weatherNote)
 
// ── YOUR TURN ────────────────────────────────────────────────
// Use this starting data:
let tablesFull = 8
let totalTables = 12
let isLunchTime = true
let vipGuest = false
 
// 1. Using ternary, print either "Full house tonight" or "Tables available"
//    based on whether tablesFull == totalTables
//
// 2. Using ternary, assign a tip rate to a variable called 'suggestedTip'
//    If it's lunch time: 0.15 (15%)
//    If it's dinner time: 0.18 (18%)
//    Print the result
//
// 3. Using ternary, assign a greeting to 'guestGreeting'
//    VIP guests get: "Welcome back — your usual table is ready"
//    Regular guests get: "Welcome to Thai Kitchen"
//    Print the result
//
// 4. Using ternary inline inside a print statement:
//    Print "Patio: open" or "Patio: closed"
//    based on whether temperature (from examples above) is above 18
 
// YOUR CODE BELOW:
// 1
print("\(tablesFull == totalTables ? "Full house tonight " : "Tables available")")
// 2
let suggestedTip = isLunchTime ? 0.15 : 0.18
print("Suggested Tip: \(suggestedTip)")
// 3
let guestGreeting = vipGuest ? "Welcome back - your usual table is ready" : "Welcome to Thai Kitchen"
print("Guest Greeting: \(guestGreeting)")
// 4
print("\(temperature > 18 ? "Patio: open" : "Patio: closed")")
 
 
 
 
// ── CHECK YOURSELF ───────────────────────────────────────────
// tablesFull (8) != totalTables (12): "Tables available"
// isLunchTime true: suggestedTip = 0.15
// vipGuest false: "Welcome to Thai Kitchen"
// temperature (32) > 18: "Patio: open"
 
 
// ============================================================
// TOPIC 3 — SWITCH: BASIC
// ============================================================
 
// ── CONCEPT ──────────────────────────────────────────────────
// switch matches a value against multiple possible cases.
// Use switch instead of a long chain of if/else if when:
// → you're checking one value against many specific options
// → the cases are clearly defined and finite
//
// Key rules in Swift's switch:
// → switch is EXHAUSTIVE — every possible value must be covered
// → use 'default' as the fallback to cover everything else
// → NO fallthrough by default (unlike C/Java) — only ONE case runs
// → cases can match multiple values using commas
 
// ── EXAMPLES ─────────────────────────────────────────────────
 
let dayOfWeek = "Monday"
 
switch dayOfWeek {
case "Monday":
    print("Closed on Mondays")
case "Tuesday", "Wednesday", "Thursday":
    print("Open 11 AM – 9 PM")
case "Friday", "Saturday":
    print("Open 11 AM – 11 PM — extended hours")
case "Sunday":
    print("Open 12 PM – 9 PM — brunch available")
default:
    print("Unknown day")
}
// prints: Closed on Mondays
 
// switch on Int
let tableSize = 4
 
switch tableSize {
case 1, 2:
    print("Bar seating available")
case 3, 4:
    print("Standard table")
case 5, 6:
    print("Large table")
default:
    print("Private dining room required")
}
 
// switch on Bool is rarely useful — use if/else for Bool
// switch shines on String, Int, and Enum values (Enums come in Ch. 10)
 
// ── YOUR TURN ────────────────────────────────────────────────
// 1. Create a var called 'orderStatus' set to "preparing"
//    Write a switch that prints:
//    "placed"     → "Order received — we'll start soon"
//    "preparing"  → "Chef is working on your order"
//    "ready"      → "Your order is ready — server on the way"
//    "delivered"  → "Enjoy your meal!"
//    "cancelled"  → "Order cancelled — we're sorry to hear that"
//    default      → "Unknown status"


//
// 2. Create a var called 'spiceLevel' set to 3
//    Write a switch that prints:
//    1 → "Mild"
//    2 → "Medium"
//    3 → "Spicy"
//    4 → "Very spicy"
//    5 → "Thai hot — chef's warning applies"
//    default → "Invalid spice level — choose 1 to 5"
//


// 3. Create a var called 'dayOfWeek2' set to "Saturday"
//    Write a switch where:
//    Monday + Tuesday   → "Slow days — staff training may occur"
//    Wednesday + Thursday → "Mid-week — regular service"
//    Friday + Saturday  → "Busy — expect wait times"
//    Sunday             → "Brunch service — different menu"
//    default            → "Invalid day"

// YOUR CODE BELOW:
 // 1
let orderStatus = "preparing"  // this status should be var because it changes, for now I'll default for let

switch orderStatus {
    case "placed": 
        print("Order received - we'll start soon")
    case "preparing":
        print("Chef is working on your order")
    case "ready":
        print("Your order is ready - server on the way")
    case "delivered":
        print("Enjoy your meal!")
    case "cancelled":
        print("order cancelled - we're sorry to hear that")
    default:
        print("Unknown status")
} 
 
// 2
let spiceLevel = 3
switch spiceLevel {
case 1:  
    print("Mild")
case 2:  
    print("Medium")
case 3:  
    print("Spicy")
case 4:  
    print("Very spicy")
case 5:  
    print("Thai hot — chef's warning applies")
default:
    print("Invalid spice level - choose 1 to 5")
}

// 3
let dayOfWeek2 = "Saturday"
switch dayOfWeek2 {
    case "Monday", "Tuesday":
        print("Slow days - staff training may occur")
    case "Wednesday", "Thursday":
        print("Mid-week - regular service")
    case "Friday", "Saturday":
        print("Busy - expect wait times")
    case "Sunday":
        print("Brunch service - different menu")
    default:
        print("Invalid day")
}
 
 
// ── CHECK YOURSELF ───────────────────────────────────────────
// orderStatus "preparing": "Chef is working on your order"
// spiceLevel 3: "Spicy"
// dayOfWeek2 "Saturday": "Busy — expect wait times"
 
 
// ============================================================
// TOPIC 4 — SWITCH: VALUE BINDING AND WHERE CLAUSES
// ============================================================
 
// ── CONCEPT ──────────────────────────────────────────────────
// Switch can do more than match fixed values.
//
// Value binding: capture the matched value into a temporary variable
// inside the case block using 'let' or 'var'
//
// where clause: add an extra condition to a case
// The case only matches if the value matches AND the where condition is true
//
// This makes switch extremely powerful — you can express
// complex logic in a way that's still readable
 
// ── EXAMPLES ─────────────────────────────────────────────────
 
// value binding — capture the value to use inside the case
let orderTotal = 87.50
 
switch orderTotal {
case let total where total < 20:
    print("Small order — total is $\(total)")
case let total where total < 50:
    print("Medium order — total is $\(total)")
case let total where total >= 50:
    print("Large order — total is $\(total) — free delivery applies")
default:
    break
}
// prints: Large order — total is $87.5 — free delivery applies
 
// where clause with a range check
let serverYearsExperience = 3
 
switch serverYearsExperience {
case let years where years < 1:
    print("New hire — assign to training shift")
case let years where years < 3:
    print("Junior server — \(years) years experience")
case let years where years >= 3:
    print("Senior server — \(years) years experience — eligible for lead")
default:
    break
}
 
// ── YOUR TURN ────────────────────────────────────────────────
// 1. Create a var 'billAmount' set to 145.00
//    Write a switch with where clauses that prints:
//    Under $30    → "Small bill — standard service"
//    $30 to $75   → "Medium bill — thank you for dining with us"
//    $75 to $150  → "Large bill — complimentary dessert offered"
//    Over $150    → "Premium bill — manager thank you card + dessert"
//    Use value binding to include the amount in the print message
//

// 2. Create a var 'waitTimeMinutes' set to 25
//    Write a switch with where clauses:
//    0 mins           → "Your table is ready now"
//    Under 15 mins    → "Short wait — would you like a seat at the bar?"
//    15 to 30 mins    → "Moderate wait — we'll text you when ready"
//    Over 30 mins     → "Long wait (\(waitTimeMinutes) mins) — complimentary appetizer offered"
 
// YOUR CODE BELOW:


// 1
let billAmount = 145

switch billAmount {
case let billAmount where billAmount < 30:
    print("Small bill \(billAmount)- standard service")    
case let billAmount where billAmount < 75:
    print("Medium bill \(billAmount)- thank you for dining with us")    
case let billAmount where billAmount < 150:
    print("Large bill \(billAmount)- complimentary dessert offered")
case let billAmount where billAmount >= 150:
    print("Premium bill \(billAmount)- manager thank you card + dessert")
default:
    break

}

// 2
let waitTimeMinutes = 25
switch waitTimeMinutes {
case let waitTimeMinutes where waitTimeMinutes == 0:
    print("Your table is ready now")    
case let waitTimeMinutes where waitTimeMinutes < 15:
    print("Short wait — would you like a seat at the bar?")
case let waitTimeMinutes where waitTimeMinutes < 30:
    print("Moderate wait — we'll text you when ready")
case let waitTimeMinutes where waitTimeMinutes > 30:
    print("Long wait (\(waitTimeMinutes) mins) — complimentary appetizer offered")    
default:
    break

}
 
 
// ── CHECK YOURSELF ───────────────────────────────────────────
// billAmount 145.00: "Large bill — complimentary dessert offered"
// waitTimeMinutes 25: "Moderate wait — we'll text you when ready"
 
 
// ============================================================
// TOPIC 5 — SWITCH: MATCHING RANGES AND TUPLES
// ============================================================
 
// ── CONCEPT ──────────────────────────────────────────────────
// Switch cases can directly match ranges using ... and ..<
// This is cleaner than where clauses for simple range checks.
//
// Tuples are groups of values — switch can match on multiple
// values at the same time using a tuple.
// Use _ as a wildcard to match "anything" in one position.
 
// ── EXAMPLES ─────────────────────────────────────────────────
 
// matching ranges directly in switch cases
let partySize2 = 7
 
switch partySize2 {
case 1...2:
    print("Intimate — bar or small table")
case 3...6:
    print("Standard party — regular seating")
case 7...12:
    print("Large party — push tables together")
case 13...:
    print("Event booking required")
default:
    print("Invalid party size")
}
// prints: Large party — push tables together
 
// matching a tuple — two values at once
let hour2 = 17
let isWeekend2 = true
 
switch (hour2, isWeekend2) {
case (15...18, true):
    print("Weekend happy hour — 25% off all drinks")
case (15...18, false):
    print("Weekday happy hour — 20% off select drinks")
case (11...22, _):
    print("Regular service hours")
default:
    print("Kitchen is closed")
}
// prints: Weekend happy hour — 25% off all drinks
 
// __ is a wildcard — matches anything in that position
 
// ── YOUR TURN ────────────────────────────────────────────────
// 1. Create a var 'guestAge' set to 17
//    Write a switch using ranges that prints:
//    Under 13      → "Kids menu available"
//    13 to 17      → "Teen — no alcohol permitted"
//    18 to 20      → "Young adult — ID required for alcohol"
//    21 and above  → "Full menu available"
//

// 2. Create these two vars:
//    var currentHour2 = 19
//    var isRaining = true
//
//    Write a switch on the TUPLE (currentHour2, isRaining) that prints:
//    Dinner hours + raining    → "Cozy night in — patio closed, indoor dining available"
//    Dinner hours + not raining → "Beautiful evening — patio seating available"
//    Lunch hours + raining     → "Rainy lunch — soup specials today"
//    Lunch hours + not raining → "Great lunch weather — outdoor seating open"
//    Anything else             → "Outside service hours"
//
//    Define dinner hours as 17...22
//    Define lunch hours as 11..<17

// YOUR CODE BELOW:
 // 1
let guestAge = 17
switch guestAge {

case (0..<13): 
    print("Kids menu available")
case (13...17):
    print("Teens - no alcohol permitted")
case (18...20):
    print("Young adult - ID required for alcohol")
default:
    print("Full menu available")
}

// 2 
var currentHour2 = 13
var isRaining = false

switch (currentHour2, isRaining) {
    case (17...22, true):
        print("Cozy night in - patio closed, indoor dining available")
    case (17...22, false):
        print("Beautiful evening - patio seating available")
    case (11..<17, true):
        print("Rainy lunch - soup specials today")
    case (11..<17, false):
        print("Great lunch weather - outdoor seating open")
    default:
        print("Outside service hours")

}
 
 
// ── CHECK YOURSELF ───────────────────────────────────────────
// guestAge 17: "Teen — no alcohol permitted"
// currentHour2 19 + isRaining true: "Cozy night in..."
// currentHour2 13 + isRaining false: "Great lunch weather..."
 
 
// ============================================================
// TOPIC 6 — GUARD
// ============================================================
 
// ── CONCEPT ──────────────────────────────────────────────────
// guard is Swift's early exit tool.
// It says: "this condition MUST be true to continue — if not, leave now"
//
// guard is always paired with an else that exits the current scope:
// return, break, continue, or throw
//
// guard vs if/else:
// → if/else: "if this is true, do something"
// → guard: "this MUST be true, otherwise bail out immediately"
//
// guard keeps the "happy path" of your code un-nested and readable.
// Everything after a guard is guaranteed to have valid data.
// You'll use guard constantly in SwiftUI for data validation.
 
// ── EXAMPLES ─────────────────────────────────────────────────
 
// guard inside a function (the most common use)
func processOrder(itemName: String, quantity: Int, price: Double) {
    guard !itemName.isEmpty else {
        print("Error: item name cannot be empty")
        return   // exits the function immediately
    }
 
    guard quantity > 0 else {
        print("Error: quantity must be at least 1")
        return
    }
 
    guard price > 0 else {
        print("Error: price must be greater than zero")
        return
    }
 
    // if we reach here, all guards passed — data is valid
    let total = Double(quantity) * price
    print("Order confirmed: \(quantity)x \(itemName) — $\(String(format: "%.2f", total))")
}
 
processOrder(itemName: "Pad Thai", quantity: 2, price: 14.99)
// Order confirmed: 2x Pad Thai — $29.98
 
processOrder(itemName: "", quantity: 2, price: 14.99)
// Error: item name cannot be empty
 
processOrder(itemName: "Tom Kha", quantity: 0, price: 12.50)
// Error: quantity must be at least 1
 
// without guard, the same logic looks like this — deeply nested:
func processOrderWithoutGuard(itemName: String, quantity: Int, price: Double) {
    if !itemName.isEmpty {
        if quantity > 0 {
            if price > 0 {
                let total = Double(quantity) * price
                print("Order confirmed: \(quantity)x \(itemName) — $\(String(format: "%.2f", total))")
            } else {
                print("Error: price must be greater than zero")
            }
        } else {
            print("Error: quantity must be at least 1")
        }
    } else {
        print("Error: item name cannot be empty")
    }
}
// same result, but deeply nested and harder to read
// guard keeps the error handling at the top, happy path at the bottom
 
// ── YOUR TURN ────────────────────────────────────────────────
// 1. Write a function called 'makeReservation' that takes:
//    - name: String
//    - partySize: Int
//    - hour: Int

//
//    Add guard statements that check:
//    → name must not be empty — print "Reservation requires a name"
//    → partySize must be between 1 and 20 — print "Party size must be 1 to 20"
//    → hour must be between 11 and 22 — print "We are not open at that hour"
//
//    If all guards pass, print:
//    "Reservation confirmed for [name] — party of [partySize] at [hour]:00"
//
// 2. Test your function with these calls:
//    makeReservation(name: "James", partySize: 4, hour: 19)   // should confirm
//    makeReservation(name: "", partySize: 4, hour: 19)         // should fail: name
//    makeReservation(name: "James", partySize: 25, hour: 19)  // should fail: party size
//    makeReservation(name: "James", partySize: 4, hour: 23)   // should fail: hour
 
// YOUR CODE BELOW:
 
 //wow first time creating a function, didn't learn about it specifically yet, but I think its best to learn it by actually doing it and jumping in
func makeReservation(name: String, partySize: Int, hour: Int) {
    let acceptedPartySize = 1...20 // this has to be saved as a variable? I cannot do 1...20.contains(partySize)?
    let businessHours = 11...22
    

    guard !name.isEmpty else {
        print("Reservation requires a name")
        return
    }

    guard acceptedPartySize.contains(partySize) else {
        print("Party size must be 1 to 20")
        return
    }

    guard (businessHours.contains(hour)) else {
        print("We are not open at that hour")
        return
    }
    print("Reservation confirmed for \(name) - party size of \(partySize) at \(hour):00")
}

   makeReservation(name: "James", partySize: 4, hour: 19)   // should confirm
   makeReservation(name: "", partySize: 4, hour: 19)         // should fail: name
   makeReservation(name: "James", partySize: 25, hour: 19)  // should fail: party size
   makeReservation(name: "James", partySize: 4, hour: 23)   // should fail: hour
 
 
// ── CHECK YOURSELF ───────────────────────────────────────────
// Call 1: "Reservation confirmed for James — party of 4 at 19:00"
// Call 2: "Reservation requires a name"
// Call 3: "Party size must be 1 to 20"
// Call 4: "We are not open at that hour"
 
 
// ============================================================
//
//  🏆 CHAPTER 2 CHALLENGE: THAI KITCHEN STATUS CHECKER
//
// ============================================================
//
// BUILD A RESTAURANT STATUS ENGINE
//
// Write a Swift program that takes in information about a
// customer's visit and prints a complete status report
// telling them everything they need to know before arriving.
//
// ── INPUT DATA — use these exact variables ────────────────────
//
// var visitHour    = 17      // 5:00 PM
// var visitDay     = "Friday"
// var partySize    = 8
// var hasReservation = false
// var customerName = "Sarah"
// var prefersSpicy = true
//
// ── REQUIREMENTS ─────────────────────────────────────────────
//
// Your program must print a status report that covers
// ALL of the following:
//
// 1. OPEN OR CLOSED
//    Thai Kitchen hours: 11 AM to 10 PM (11 to 22)
//    Print whether they can visit at visitHour
//    If closed: print closing time message and stop further checks
//    Use guard for this — if closed, print and return from a function
//
// 2. DAY MESSAGE
//    Use switch on visitDay:
//    Monday           → "Closed on Mondays — please visit another day"
//       (treat this as closed — use guard or early return)
//    Tuesday–Thursday → "Weekday visit — regular service"
//    Friday–Saturday  → "Weekend visit — expect a lively atmosphere"
//    Sunday           → "Sunday visit — brunch menu available until 3 PM"
//    default          → "Invalid day"

//
// 3. HAPPY HOUR CHECK
//    Happy hour: 3 PM to 6 PM (15 to 18)
//    Use ternary to print either:
//    "Happy hour active — 20% off drinks" or "Regular pricing"
//
// 4. PARTY SIZE ASSESSMENT
//    Use switch with ranges on partySize:
//    1...2   → "Intimate dining — bar or small table available"
//    3...6   → "Standard party — no reservation required"
//    7...12  → "Large party — reservation strongly recommended"
//    13...   → "Event size — please call ahead to arrange"
//
// 5. RESERVATION STATUS
//    Use if/else:
//    Large party (7+) with no reservation →
//       "Warning: large party without reservation — wait time may exceed 45 mins"
//    Large party (7+) with reservation →
//       "Confirmed: reservation on file for \(customerName)"
//    Small party with reservation →
//       "Reservation confirmed — no wait expected"
//    Small party no reservation →
//       "Walk-in welcome — tables available"
//
// 6. SPICE RECOMMENDATION
//    Use ternary:
//    prefersSpicy true  → "Recommendation: try the Thai hot Pad See Ew"
//    prefersSpicy false → "Recommendation: Pad Thai mild is our most popular dish"
//
// 7. FOOTER
//    Always print: "See you soon, \(customerName)! — Thai Kitchen"
//
// ── RULES ────────────────────────────────────────────────────
// → Wrap everything in a function called 'checkStatus'
// → Use guard for the open/closed check and Monday check
// → Use switch for day message and party size
// → Use if/else for reservation status
// → Use ternary for happy hour and spice recommendation
// → All output must use string interpolation
// → No hardcoded names or values in the logic — use your variables
//
var visitHour    = 17      // 5:00 PM
var visitDay     = "Friday"
var partySize3    = 8
var hasReservation = false
var customerName = "Sarah"
var prefersSpicy = true
    // Open only between 11 AM to 10 PM
func isValidBusinessHour(visitHour: Int) -> Bool { (11...22).contains(visitHour)}


func checkStatus(name: String, partySize: Int, visitHour: Int, visitDay: String, hasReservation: Bool, prefersSpicy: Bool) {
    print("\(isValidBusinessHour(visitHour: visitHour) ? "You can visit Thai Kitchen, we are currently open!" : "We are currently closed")") 
    print("Thai Kitchen is open until 10PM")
    // guard to check against valid visit time
    guard isValidBusinessHour(visitHour: visitHour) else {
        return
    }

    // guard against Monday closure
    guard visitDay != "Monday" else {
        print("Closed on Mondays - please visit another day")
        return
    } 

    // guard against party size
    guard partySize > 0 else {
        print("Invalid party size")
        return
    }

    // check rest of the days
    switch visitDay.lowercased() {
        case "tuesday", "wednesday", "thursday": 
            print("Weekday visit — regular service")
        case "friday", "saturday":
            print("Weekend visit — expect a lively atmosphere")
        case "sunday":
            print("Sunday visit — brunch menu available until 3 PM")
        default:
            print("Invalid day")
    }

    // check if visiting during happy hour 3pm - 6pm (15-18)
    print("\((15...18).contains(visitHour) ? "Happy hour active — 20% off drinks" : "Regular pricing")")

    // party size assessment
    switch partySize {
        case 1...2:
            print("Intimate dining — bar or small table available")
        case 3...6:
            print("Standard party — no reservation required")
        case 7...12:
            print("Large party — reservation strongly recommended")
        case 13... :
            print("Event size — please call ahead to arrange")
        default:
            print("Invalid party size")
            return
    }

    // check reservation status
    if(partySize >= 7 && !hasReservation) {
        print("Warning: large party without reservation — wait time may exceed 45 mins")
    } else if (partySize >= 7 && hasReservation) {
        print("Confirmed: reservation on file for \(customerName)")
    } else if (partySize < 7 && hasReservation) {
        print("Reservation confirmed — no wait expected")
    } else {
        print("Walk-in welcome — tables available")
    }
    // spice recommendation
    print("\(prefersSpicy ? "Recommendation: try the Thai hot Pad See Ew" : "Recommendation: Pad Thai mild is our most popular dish")")

    print("See you soon, \(customerName)! — Thai Kitchen")
}

// ── HINTS ────────────────────────────────────────────────────
// → Start by writing the function signature and the guard statements
// → Then add each section one at a time — run after each addition
// → The sections are independent — order them as requirements state
// → A guard inside a function uses 'return' in its else block
//
// ── EXPECTED OUTPUT (with the provided input data) ────────────
//
// Thai Kitchen is open until 10 PM
// Weekend visit — expect a lively atmosphere
// Regular pricing
// Large party — reservation strongly recommended
// Warning: large party without reservation — wait time may exceed 45 mins
// Recommendation: try the Thai hot Pad See Ew
// See you soon, Sarah! — Thai Kitchen
//
// ── YOUR CODE BELOW ──────────────────────────────────────────
print("CHECK STATUS: ")
 checkStatus(name: customerName, partySize: partySize3, visitHour: visitHour, visitDay: visitDay, hasReservation: hasReservation, prefersSpicy: prefersSpicy)
 
 
 
// ── TEST YOUR FUNCTION ───────────────────────────────────────
// Once written, call it and then try changing the input values:
// checkStatus()
//
// Try these variations to test all branches:
// visitHour = 23    → should hit the closed guard
// visitDay = "Monday" → should hit the Monday guard
// visitHour = 16    → should trigger happy hour
// partySize = 2     → should change party + reservation output
// hasReservation = true → should change reservation message
 
 
// ============================================================
// END OF CHAPTER 2
// ============================================================
//
// When you're done:
// ✅ All YOUR TURN sections compile and print expected output
// ✅ Challenge status checker covers all 7 requirements
// ✅ guard, switch, if/else, and ternary all used correctly
//
// Next up: Chapter 3 — Loops
// You'll use for-in and while to automate repetitive tasks:
// printing menus, calculating running totals, and processing
// every item in a collection without repeating yourself.
// ============================================================
