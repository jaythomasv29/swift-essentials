// ============================================================
// SWIFT ESSENTIALS — CHAPTER 5: OPTIONALS
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
// TOPIC 1 — WHAT IS NIL AND WHY SWIFT HANDLES IT DIFFERENTLY
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// In JavaScript, a variable can be null or undefined at any time.
// Swift made a different decision: a variable CANNOT be nil
// unless you explicitly say it's allowed to be nil.
//
// An Optional is a type that wraps another type and adds the
// possibility of "no value" — represented as nil.
//
// Think of an Optional like a box:
// → The box either contains a value
// → Or the box is empty (nil)
//
// Before you can use what's inside the box, you have to
// open it and check. Swift forces you to do this.
// This is called "unwrapping."
//
// String  → must always have a value. Cannot be nil. Ever.
// String? → might have a String. Might be nil. Must be unwrapped.

// ── EXAMPLES ─────────────────────────────────────────────────

// non-optional — guaranteed to have a value
let restaurantName: String = "Thai Kitchen"

// optional — might have a value, might be nil
var reservationName: String? = "James"
var walkInName: String? = nil

// print(reservationName)   // Optional("James") ← the box is shown
// print(walkInName)        // nil

// you cannot use an optional directly as if it were the value
// this would error:
// let greeting = "Hello, " + reservationName   // ❌ can't add String? to String

// you must unwrap it first
// if let name = reservationName {
//     let greeting = "Hello, " + name   // ✅ name is now a clean String
//     print(greeting)
// }

// // why optional variables show Optional(...) when printed:
// var tableNumber: Int? = 5
// print(tableNumber)        // Optional(5) ← Swift is showing you the box
// print(tableNumber!)       // 5 ← force unwrapped (risky — see Topic 3)

// ── YOUR TURN ────────────────────────────────────────────────
// 1. Create a non-optional String called 'kitchenStatus'
//    set to "Open". Try setting it to nil and confirm
//    the compiler won't allow it (comment it out after).

//
// 2. Create an optional String called 'guestName'
//    set to "Sarah". Print it — notice it shows Optional("Sarah").
//
// 3. Create an optional String called 'specialRequest'
//    set to nil. Print it.
//
// 4. Create an optional Int called 'tableAssignment'
//    set to 7. Print it — notice it shows Optional(7).
//
// 5. Create an optional Double called 'discountAmount'
//    set to nil. Print it.

// YOUR CODE BELOW:
// 1
/*
let kitchenStatus: String = "Open"
kitchenStatus = nil; // well we used let as well as declaring it to be a value, AND a String without an optional cannot be nil

// 2 
var guestName: String? = "Sarah"
// print(guestName) // Optional("Sarah")
// 3
var specialRequest: String? = nil
print(specialRequest)
// 4 
var tableAssignment: Int? = 7
print(tableAssignment)  // Must unwrap: print(tableAssignment ?? 0)
// 5
var discountAmount: Double? = nil  // nil
print(discountAmount)
print(discountAmount != nil ? "You got a discount" : "no discount available")

*/

// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: compiler error when you try to assign nil to String
// Exercise 2: Optional("Sarah")
// Exercise 3: nil
// Exercise 4: Optional(7)
// Exercise 5: nil

/*
// ============================================================
// TOPIC 2 — DECLARING OPTIONALS WITH ?
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// You declare an optional by adding ? after the type name.
// This is you telling Swift: "this variable is allowed to be nil."
//
// Optional types are completely different types from their base type:
// String  ≠  String?
// Int     ≠  Int?
// Double  ≠  Double?
//
// Swift treats them differently everywhere — you can't pass a
// String? where a String is expected without unwrapping first.
//
// Common places optionals appear:
// → Dictionary lookups (always return Optional)
// → User input (the user might not have typed anything)
// → Functions that might not find what they're looking for
// → Properties that aren't set until later

// ── EXAMPLES ─────────────────────────────────────────────────

// optional property — set later
struct Reservation {
    var guestName: String
    var tableNumber: Int?      // might not be assigned yet
    var specialRequest: String? // guest might not have one
}

var res = Reservation(guestName: "James", tableNumber: nil, specialRequest: nil)
res.tableNumber = 7
res.specialRequest = "window seat please"

print(res.tableNumber)      // Optional(7)
print(res.specialRequest)   // Optional("window seat please")

// optional from dictionary lookup
let menuPrices: [String: Double] = ["Pad Thai": 14.99, "Tom Kha": 12.50]
let padThaiPrice = menuPrices["Pad Thai"]    // Double? not Double
let burgerPrice  = menuPrices["Burger"]      // Double? = nil

print(padThaiPrice)    // Optional(14.99)
print(burgerPrice)     // nil

// type(of:) shows the difference
print(type(of: padThaiPrice))   // Optional<Double>
print(type(of: 14.99))          // Double

print("HERE WE ARE DOWN BELOW!!!")

// ── YOUR TURN ────────────────────────────────────────────────
// 1. Create a struct called 'StaffMember' with:
//    - name: String (required)
//    - role: String (required)
//    - phoneNumber: String? (optional — not all staff share this)
//    - emergencyContact: String? (optional)
//
//    Create two instances:
//    - James: role "Manager", phoneNumber "650-555-0101", no emergency contact
//    - Maria: role "Server", no phone number, emergencyContact "mom: 650-555-0202"
//
// 2. Print both instances' phone numbers — notice the Optional wrapper
//
// 3. Use type(of:) to print the type of James's phoneNumber
//    and compare it to type(of: "a plain string")
//    Notice they are different types

// YOUR CODE BELOW:

// 1
struct StaffMember { 
    var name: String
    var role: String
    var phoneNumber: String?
    var emergencyContact: String?
}
var s1 = StaffMember(name: "James", role: "Manager", phoneNumber: "650-555-0101", emergencyContact: nil)
var s2 = StaffMember(name: "Maria", role: "Server", phoneNumber: nil, emergencyContact: "mom: 650-555-0202")
print(s1)
print(s2)
// 2
print(s1.phoneNumber)
print(s2.phoneNumber)
// 3
print(type(of: s1.phoneNumber)) // Optional<String>
print(type(of: "hello world")) // String


// ── CHECK YOURSELF ───────────────────────────────────────────
// James phoneNumber: Optional("650-555-0101")
// Maria phoneNumber: nil
// type of phoneNumber: Optional<String>
// type of plain string: String

*/

// ============================================================
// TOPIC 3 — FORCE UNWRAPPING WITH ! (AND WHY TO AVOID IT)
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// Force unwrapping uses ! to say "I am 100% certain this
// optional has a value — give it to me right now."
//
// If you're right — it works fine.
// If you're wrong — your app CRASHES immediately.
//
// This is why ! is called "the crash operator" by some developers.
// It bypasses Swift's safety system entirely.
//
// When is ! acceptable?
// → Almost never in production code
// → Only when you have ABSOLUTE certainty the value exists
// → And even then, consider if there's a safer alternative
//
// The two times you'll see ! in real code:
// 1. IBOutlets in UIKit (legacy — not in SwiftUI)
// 2. Implicitly unwrapped optionals (Topic 8)

// ── EXAMPLES ─────────────────────────────────────────────────

var serverName: String? = "Carlos"

// force unwrap — only safe because we JUST set the value
print(serverName!)   // "Carlos"

// but if the value is nil:
var emptyServer: String? = nil
// print(emptyServer!)   // ❌ CRASH: Fatal error: unexpectedly found nil

// the real danger — using ! when you assume something isn't nil
let menu: [String: Double] = ["Pad Thai": 14.99]

// risky — what if someone changes the menu?
// let price = menu["Pad Thai"]!  // works today, crashes if Pad Thai is removed

// safe — always check first
if let price = menu["Pad Thai"] {
    print("Price: $\(price)")
}

// ── YOUR TURN ────────────────────────────────────────────────
// 1. Create an optional String called 'chefOfTheDay'
//    set to "James"
//    Force unwrap it and print it — it works because the value exists
//
// 2. Now set 'chefOfTheDay' to nil
//    Comment out the force unwrap — confirm it would crash
//    Add a comment explaining WHY it crashes
//
// 3. Create a dictionary:
//    let specials = ["Monday": "Pad Thai", "Tuesday": "Green Curry"]
//    Try to force unwrap specials["Wednesday"]
//    Comment it out — explain what would happen and why
//    Then write the safe version using if let

// YOUR CODE BELOW:




// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: prints "James"
// Exercise 2: code commented out with explanation of crash
// Exercise 3: safe version prints nothing (Wednesday has no special)

/*
// ============================================================
// TOPIC 4 — IF LET: SAFE UNWRAPPING
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// if let is the most common way to unwrap an optional safely.
// It says: "if this optional has a value, unwrap it into this
// new constant and run this block. If it's nil, skip the block."
//
// The unwrapped constant only exists inside the if block.
// Outside the block, you're back to the optional.
//
// You can bind multiple optionals in one if let — all must
// be non-nil for the block to run.

// ── EXAMPLES ─────────────────────────────────────────────────

var guestName: String? = "Sarah"
var tableNum: Int? = 5

// basic if let
if let name = guestName {
    print("Welcome, \(name)!")   // name is String here, not String?
}

// if let with else
if let name = guestName {
    print("Seated: \(name)")
} else {
    print("Walk-in guest — no name")
}

// multiple bindings — ALL must be non-nil
if let name = guestName, let table = tableNum {
    print("Seating \(name) at table \(table)")
} else {
    print("Missing guest info")
}

// if let with a condition
if let name = guestName, name.count > 3 {
    print("Guest name is long enough: \(name)")
}

// shadowing — same name inside and outside (common pattern)
var reservationGuest: String? = "James"
if let reservationGuest = reservationGuest {
    // inside: reservationGuest is String
    print(reservationGuest)
}
// outside: reservationGuest is still String?

// Swift 5.7+ shorthand — if let x (no = x needed)
if let reservationGuest {
    print(reservationGuest)   // same as above, cleaner
}

// ── YOUR TURN ────────────────────────────────────────────────
// Use this data:
var currentGuest: String? = "James"
var currentTable: Int? = 7
var currentDiscount: Double? = nil
var loyaltyPoints: Int? = 150

// 1. Use if let to print "Seating [name]" if currentGuest has a value
//    If nil, print "Walk-in — no name on file"
//
// 2. Use if let to bind BOTH currentGuest and currentTable
//    If both exist, print "James is at table 7"
//    If either is nil, print "Incomplete reservation info"
//
// 3. Use if let on currentDiscount
//    If it has a value, print "Discount applied: $X.XX"
//    If nil, print "No discount — full price applies"
//    (currentDiscount is nil so the else branch should run)
//
// 4. Use if let with an extra condition:
//    Unwrap loyaltyPoints AND check if points > 100
//    If both, print "VIP guest — [points] points — complimentary appetizer"
//    If points exist but are <= 100, print "Regular member — [points] points"
//    If nil, print "Not a loyalty member"
//
// 5. Use the Swift 5.7 shorthand (if let currentGuest)
//    and print the guest name

// YOUR CODE BELOW:




// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: "Seating James"
// Exercise 2: "James is at table 7"
// Exercise 3: "No discount — full price applies"
// Exercise 4: "VIP guest — 150 points — complimentary appetizer"
// Exercise 5: prints "James"


// ============================================================
// TOPIC 5 — GUARD LET: SAFE UNWRAPPING WITH EARLY EXIT
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// You already used guard in Chapter 2. guard let adds optional
// unwrapping to that early exit pattern.
//
// The key difference from if let:
// → if let: unwrapped value lives INSIDE the block
// → guard let: unwrapped value lives OUTSIDE — available for
//              the rest of the function
//
// guard let says: "this optional MUST have a value to continue.
// If it's nil, exit now. If it has a value, give it to me and
// keep going — I'll use it for the rest of this function."
//
// Use guard let when:
// → You need the unwrapped value for multiple lines after
// → Nil means something went wrong — bail out
// → You want to avoid deeply nested if let blocks

// ── EXAMPLES ─────────────────────────────────────────────────

func seatGuest(name: String?, table: Int?) {
    // guard let — exit if either is nil, use both values below
    guard let guestName = name else {
        print("Cannot seat guest — no name provided")
        return
    }

    guard let tableNumber = table else {
        print("Cannot seat \(guestName) — no table available")
        return
    }

    // both values guaranteed to exist here — no optionals
    print("Seating \(guestName) at table \(tableNumber)")
    print("Server assigned to table \(tableNumber)")
    print("Water brought to \(guestName)")
}

seatGuest(name: "James", table: 7)
// Seating James at table 7
// Server assigned to table 7
// Water brought to James

seatGuest(name: nil, table: 7)
// Cannot seat guest — no name provided

seatGuest(name: "Sarah", table: nil)
// Cannot seat Sarah — no table available

// guard let vs if let — same result, different structure
func processOrderIfLet(itemName: String?, price: Double?) {
    if let name = itemName {
        if let amount = price {
            print("Order: \(name) — $\(amount)")
            // more code here gets nested...
        } else {
            print("No price")
        }
    } else {
        print("No item")
    }
}

func processOrderGuardLet(itemName: String?, price: Double?) {
    guard let name = itemName else { print("No item"); return }
    guard let amount = price else { print("No price"); return }
    // clean — no nesting
    print("Order: \(name) — $\(amount)")
    // more code here stays flat...
}

// ── YOUR TURN ────────────────────────────────────────────────
// 1. Write a function called 'processReservation' that takes:
//    - guestName: String?
//    - partySize: Int?
//    - tableNumber: Int?
//
//    Use guard let for each parameter.
//    If any is nil, print an appropriate message and return.
//    If all exist, print:
//    "Reservation confirmed: [name], party of [size], table [num]"
//
//    Test with:
//    processReservation(guestName: "James", partySize: 4, tableNumber: 7)
//    processReservation(guestName: nil, partySize: 4, tableNumber: 7)
//    processReservation(guestName: "Sarah", partySize: nil, tableNumber: 3)
//    processReservation(guestName: "Carlos", partySize: 2, tableNumber: nil)
//
// 2. Write a function called 'calculateTip' that takes:
//    - subtotal: Double?
//    - tipPercentage: Double?
//
//    Use guard let to unwrap both.
//    Guard also that subtotal > 0 (add a where clause or second guard).
//    Print: "Tip: $X.XX on a $X.XX bill"
//    Return the tip amount as a Double
//    If any check fails, print an error and return 0.0

// YOUR CODE BELOW:




// ── CHECK YOURSELF ───────────────────────────────────────────
// processReservation("James", 4, 7): "Reservation confirmed: James, party of 4, table 7"
// processReservation(nil, 4, 7): error message for missing name
// processReservation("Sarah", nil, 3): error message for missing party size
// processReservation("Carlos", 2, nil): error message for missing table
// calculateTip(80.00, 0.18): "Tip: $14.40 on a $80.00 bill"


// ============================================================
// TOPIC 6 — NIL COALESCING: ?? DEFAULT VALUE
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// The ?? operator provides a default value when an optional is nil.
// It says: "give me the value if it exists, otherwise use this default."
//
// Syntax: optional ?? defaultValue
//
// The result is NEVER an optional — it's always the unwrapped type.
// Think of ?? as "optional OR default."
//
// When to use ?? vs if let:
// → ??: you have a sensible default value — one line is enough
// → if let: nil means something different — you need to branch

// ── EXAMPLES ─────────────────────────────────────────────────

var guestNameOpt: String? = "James"
var noGuestName: String? = nil

// basic ?? usage
print(guestNameOpt ?? "Walk-in guest")   // "James"
print(noGuestName  ?? "Walk-in guest")   // "Walk-in guest"

// ?? in calculations
var discountOpt: Double? = nil
let subtotal = 80.00
let finalTotal = subtotal - (discountOpt ?? 0.0)
print(finalTotal)   // 80.0 — no discount applied

var discount2: Double? = 10.00
let finalTotal2 = subtotal - (discount2 ?? 0.0)
print(finalTotal2)  // 70.0 — discount applied

// ?? with dictionary lookups
let menuPrices2: [String: Double] = ["Pad Thai": 14.99]
let price = menuPrices2["Burger"] ?? 0.0   // 0.0
let price2 = menuPrices2["Pad Thai"] ?? 0.0  // 14.99

// chaining ?? for multiple fallbacks
var primaryServer: String? = nil
var backupServer: String? = nil
var defaultServer: String = "Manager"

let assignedServer = primaryServer ?? backupServer ?? defaultServer
print(assignedServer)   // "Manager" — both optionals were nil

var primaryServer2: String? = nil
var backupServer2: String? = "Carlos"
let assignedServer2 = primaryServer2 ?? backupServer2 ?? defaultServer
print(assignedServer2)   // "Carlos" — backup was available

// ── YOUR TURN ────────────────────────────────────────────────
// Use this data:
var guestTitle: String? = nil
var preferredTable: Int? = 4
var mealCredit: Double? = nil
var loyaltyTier: String? = "Gold"
var backupTable: Int? = 12
var emergencyTable: Int = 1

// 1. Print the guest's title using ?? with "Guest" as default
//
// 2. Print a welcome message using both guestTitle and preferredTable:
//    "Welcome, [title]! Your table is [number]."
//    Use ?? for both — title defaults to "Guest", table defaults to 0
//
// 3. Calculate a final bill of $95.00 minus any meal credit.
//    If no credit exists, the full amount is charged.
//    Print: "Final bill: $95.00" or "Final bill: $X.XX" after credit
//
// 4. Chain ?? to find the first available table:
//    Try preferredTable first, then backupTable, then emergencyTable
//    Set preferredTable to nil first, then print the result
//    Then set backupTable to nil too — print again
//    (emergencyTable is not optional so it's always the last fallback)
//
// 5. Use ?? inline in a print statement to display loyalty tier:
//    "Loyalty status: Gold" or "Loyalty status: No membership"

// YOUR CODE BELOW:




// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: "Guest" (guestTitle is nil)
// Exercise 2: "Welcome, Guest! Your table is 4."
// Exercise 3: "Final bill: $95.00" (no credit)
// Exercise 4: first nil preferredTable → 12, then both nil → 1
// Exercise 5: "Loyalty status: Gold"


// ============================================================
// TOPIC 7 — OPTIONAL CHAINING: a?.b?.c
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// Optional chaining lets you call methods or access properties
// on an optional without explicitly unwrapping it first.
//
// If any part of the chain is nil, the whole expression returns nil.
// If everything has a value, you get the result.
//
// The result of optional chaining is ALWAYS an Optional —
// even if the final value wouldn't normally be optional.
//
// Think of it as: "try to do this, but if anything is nil
// along the way, just give me nil instead of crashing."

// ── EXAMPLES ─────────────────────────────────────────────────

struct Address {
    var street: String
    var city: String
}

struct Guest {
    var name: String
    var address: Address?
    var loyaltyCard: LoyaltyCard?
}

struct LoyaltyCard {
    var points: Int
    var tier: String
}

var guest1 = Guest(name: "James", address: Address(street: "123 Main St", city: "Palo Alto"), loyaltyCard: LoyaltyCard(points: 500, tier: "Gold"))

var guest2 = Guest(name: "Sarah", address: nil, loyaltyCard: nil)

// optional chaining — access nested optional properties safely
print(guest1.address?.city)          // Optional("Palo Alto")
print(guest2.address?.city)          // nil — no crash

print(guest1.loyaltyCard?.points)    // Optional(500)
print(guest2.loyaltyCard?.tier)      // nil

// chain multiple levels
print(guest1.loyaltyCard?.tier)      // Optional("Gold")

// combine with ?? to get a clean value
let city = guest1.address?.city ?? "Unknown city"
let tier = guest2.loyaltyCard?.tier ?? "No loyalty card"
print(city)   // "Palo Alto"
print(tier)   // "No loyalty card"

// call methods through optional chaining
print(guest1.address?.city.uppercased())   // Optional("PALO ALTO")
print(guest2.address?.city.uppercased())   // nil — safe, no crash

// ── YOUR TURN ────────────────────────────────────────────────
// Use these structs and instances:

struct ContactInfo {
    var phone: String?
    var email: String?
}

struct StaffMember2 {
    var name: String
    var contact: ContactInfo?
    var manager: StaffMember2?
}

var manager = StaffMember2(name: "James", contact: ContactInfo(phone: "650-555-0101", email: "james@thaikitchen.com"), manager: nil)

var server = StaffMember2(name: "Maria", contact: ContactInfo(phone: nil, email: "maria@thaikitchen.com"), manager: manager)

var busser = StaffMember2(name: "Derek", contact: nil, manager: server)

// 1. Print the busser's contact phone number using optional chaining
//    (busser has no contact — should print nil)
//
// 2. Print the server's email using optional chaining + ??
//    "Contact: maria@thaikitchen.com" or "No email on file"
//
// 3. Print the busser's manager's name using optional chaining
//    (busser → manager is server → name is "Maria")
//
// 4. Print the busser's manager's manager's name using optional chaining
//    (busser → manager is server → manager is manager → name is "James")
//
// 5. Print the busser's contact email uppercased using optional chaining
//    (busser has no contact — whole chain should return nil)
//    Use ?? to print "No email" if nil

// YOUR CODE BELOW:




// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: nil
// Exercise 2: "Contact: maria@thaikitchen.com"
// Exercise 3: Optional("Maria")
// Exercise 4: Optional("James")
// Exercise 5: "No email"


// ============================================================
// TOPIC 8 — IMPLICITLY UNWRAPPED OPTIONALS
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// An implicitly unwrapped optional (IUO) is declared with !
// instead of ? after the type.
//
// It behaves like a regular optional — it CAN be nil.
// But it unwraps itself automatically every time you use it.
// No if let, no ??, no guard let needed.
//
// The tradeoff: if it IS nil when you use it — crash.
//
// When Swift uses IUOs:
// → Properties that are nil at init but set immediately after
// → IBOutlets in UIKit (you won't use these in SwiftUI)
// → APIs that guarantee a value exists but return an optional
//
// In SwiftUI you'll rarely write IUOs yourself.
// You'll see them in legacy UIKit code and some Apple APIs.
// The important thing is recognizing what ! means when you see it.

// ── EXAMPLES ─────────────────────────────────────────────────

// IUO — automatically unwraps when accessed
var staffName: String! = "Carlos"
print(staffName)         // "Carlos" — no Optional() wrapper
print(staffName + " is working tonight")  // works directly

// can still be nil — but accessing it when nil crashes
staffName = nil
// print(staffName)  // ❌ CRASH

// the difference:
var regularOptional: String? = "James"
var implicitOptional: String! = "James"

print(regularOptional)   // Optional("James")
print(implicitOptional)  // "James" — auto unwrapped

// use cases — a property set right after init
class Restaurant {
    var name: String
    var headChef: String!  // will be set immediately in setup()

    init(name: String) {
        self.name = name
        // headChef not set yet
    }

    func setup(chef: String) {
        headChef = chef  // set immediately after init
    }
}

let restaurant = Restaurant(name: "Thai Kitchen")
restaurant.setup(chef: "Chef James")
print(restaurant.headChef)  // "Chef James" — no Optional wrapper

// ── YOUR TURN ────────────────────────────────────────────────
// 1. Create an IUO called 'primaryServer' of type String!
//    Set it to "Nina". Print it — notice no Optional() wrapper.
//
// 2. Create a regular optional 'backupServer' of type String?
//    Set it to "Carlos". Print both primaryServer and backupServer.
//    Notice the difference in output.
//
// 3. Create a class called 'KitchenStation' with:
//    - stationName: String (set in init)
//    - assignedChef: String! (IUO — set after init)
//
//    Create an instance, then set the chef.
//    Print the chef name — confirm no Optional wrapper.
//
// 4. Briefly: write a comment explaining in your own words
//    why IUOs exist and when you'd use one vs a regular optional.

// YOUR CODE BELOW:




// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: "Nina" (no Optional wrapper)
// Exercise 2: "Nina" and Optional("Carlos") — spot the difference
// Exercise 3: chef name prints without Optional wrapper
// Exercise 4: comment in your own words


// ============================================================
//
//  🏆 CHAPTER 5 CHALLENGE: SAFE MENU LOOKUP
//
// ============================================================
//
// BUILD A SAFE RESTAURANT DATA LOOKUP SYSTEM
//
// Thai Kitchen's data comes from multiple sources and some
// entries might be missing. Your job is to build a lookup
// system that handles every possible nil safely — no crashes,
// no force unwraps, clean output in every case.
//
// ── INPUT DATA ───────────────────────────────────────────────

let menuItems: [String: Double] = [
    "Pad Thai": 14.99,
    "Tom Kha Soup": 12.50,
    "Green Curry": 16.00,
    "Spring Rolls": 8.00,
    "Thai Iced Tea": 5.50
]

let itemCalories: [String: Int] = [
    "Pad Thai": 650,
    "Tom Kha Soup": 420,
    "Spring Rolls": 280,
    "Thai Iced Tea": 120
    // Green Curry calories not on file
]

let itemAllergens: [String: String] = [
    "Pad Thai": "peanuts, gluten",
    "Spring Rolls": "gluten",
    "Thai Iced Tea": "dairy"
    // Tom Kha and Green Curry have no listed allergens
]

let guestOrders: [String: [String]] = [
    "James": ["Pad Thai", "Thai Iced Tea"],
    "Sarah": ["Green Curry", "Tom Kha Soup", "Spring Rolls"],
    "Carlos": ["Pad See Ew", "Som Tum"]  // these items are NOT in menuItems
]

let guestDiscounts: [String: Double] = [
    "James": 0.10,   // 10% loyalty discount
    "Sarah": 0.0     // registered but no discount
    // Carlos has no discount on file
]

let guestLoyaltyTiers: [String: String] = [
    "James": "Gold",
    "Sarah": "Silver"
    // Carlos not a loyalty member
]

// ── REQUIREMENTS ─────────────────────────────────────────────
//
// 1. SAFE ITEM LOOKUP
//    Write a function called 'lookupItem' that takes an item name: String
//    and returns a tuple: (price: Double, calories: Int?, allergens: String?)?
//    → price is required — if the item isn't in menuItems, return nil
//    → calories is optional — not all items have calorie data
//    → allergens is optional — not all items have allergen data
//
//    Test with: "Pad Thai", "Green Curry", "Burger"
//    Print results like:
//    "Pad Thai — $14.99 — 650 cal — allergens: peanuts, gluten"
//    "Green Curry — $16.00 — calories: not on file — no allergens listed"
//    "Burger — not on menu"
//
// 2. GUEST ORDER SUMMARY
//    For each guest in guestOrders, look up each item they ordered.
//    Use optional chaining and ?? to handle missing items gracefully.
//    Print each guest's order with prices:
//    "── James's order ──"
//    "  Pad Thai — $14.99"
//    "  Thai Iced Tea — $5.50"
//    "  Subtotal: $20.49"
//    If an item isn't in the menu, print: "  [item] — not available"
//
// 3. BILL CALCULATION WITH DISCOUNTS
//    For each guest, calculate their final bill:
//    - Get their subtotal from requirement 2
//    - Look up their discount with ?? defaulting to 0.0
//    - Apply the discount to get the final total
//    Print:
//    "James | subtotal: $20.49 | discount: 10% | total: $18.44"
//    "Sarah | subtotal: $X.XX | discount: 0% | total: $X.XX"
//    "Carlos | subtotal: $0.00 | discount: none | total: $0.00"
//    NOTE: Carlos ordered items not on the menu — subtotal is $0.00
//
// 4. LOYALTY STATUS
//    For each guest, use optional chaining + ?? to print their
//    loyalty status and tier:
//    "James — Gold member — 10% discount"
//    "Sarah — Silver member — 0% discount"
//    "Carlos — not a loyalty member"
//    HINT: chain guestLoyaltyTiers[name] and guestDiscounts[name]
//          use ?? to handle missing values
//
// 5. SAFE CHEF RECOMMENDATION
//    Write a function called 'chefRecommendation' that takes
//    a guest name: String and returns String?
//    → Look up the guest's orders
//    → If they ordered "Pad Thai", return "Try our Green Curry next time"
//    → If they ordered anything with "Tom" in the name,
//      return "You might enjoy our Tom Yum Soup"
//    → Otherwise return nil
//
//    Call it for each guest and use ?? to print:
//    "Recommendation for [name]: [message]" or
//    "Recommendation for [name]: no recommendation at this time"
//
// ── RULES ────────────────────────────────────────────────────
// → No force unwrapping (!) anywhere in your solution
// → Use if let for requirement 1 (building the result tuple)
// → Use ?? for requirement 2 (inline price lookup)
// → Use guard let for requirement 3 (function-level validation)
// → Use optional chaining for requirement 4
// → Use if let or guard let for requirement 5
// → Every nil case must produce meaningful output — no silent failures
//
// ── HINTS ────────────────────────────────────────────────────
// → Requirement 1: price uses guard let (required), calories and
//   allergens just use dictionary lookup (they're already optional)
// → Requirement 2: loop guestOrders.keys.sorted(), inner loop
//   over each guest's items, use menuItems[item] ?? nil
// → Requirement 3: subtotal needs to be calculated — either
//   reuse your loop from req 2 or write a helper function
// → Requirement 5: use .contains() to check item names
//
// ── YOUR CODE BELOW ──────────────────────────────────────────

*/


// ============================================================
// END OF CHAPTER 5
// ============================================================
//
// When you're done:
// ✅ All YOUR TURN sections compile and print expected output
// ✅ Challenge covers all 5 requirements
// ✅ No force unwraps anywhere
// ✅ if let, guard let, ??, optional chaining all used correctly
//
// Next up: Chapter 6 — Functions
// You've already been writing functions throughout this series.
// Chapter 6 goes deep — argument labels, default values,
// multiple return types, and functions as first-class values.
// ============================================================
