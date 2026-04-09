// ============================================================
// SWIFT ESSENTIALS — CHAPTER 3: LOOPS
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
// TOPIC 1 — FOR-IN LOOP: BASIC
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// A for-in loop repeats a block of code for every item
// in a collection or sequence.
//
// Structure:
// for item in collection {
//     // runs once for every item
//     // 'item' holds the current value each time
// }
//
// The loop variable (item) is a new constant created automatically.
// You name it whatever makes sense for what you're looping over.
// Swift infers its type from the collection.

// ── EXAMPLES ─────────────────────────────────────────────────

let menuItems = ["Pad Thai", "Tom Kha", "Spring Rolls", "Thai Iced Tea"]

// basic loop — print every item
for item in menuItems {
    print(item)
}
// Pad Thai
// Tom Kha
// Spring Rolls
// Thai Iced Tea

// loop with logic inside
let prices = [14.99, 12.50, 8.00, 5.50]

for price in prices {
    if price > 10.00 {
        print("$\(price) — premium item")
    } else {
        print("$\(price) — value item")
    }
}

// loop over a String — iterates character by character
let restaurantName = "Thai Kitchen"
for character in restaurantName {
    print(character)
}
// T, h, a, i, (space), K, i, t, c, h, e, n

// ── YOUR TURN ────────────────────────────────────────────────
// Use this data:
let staffNames = ["James", "Maria", "Carlos", "Aisha", "Tom"]
let shiftHours = [8.0, 6.5, 8.0, 4.0, 7.5]
let hourlyRate = 18.50

// 1. Loop through staffNames and print "Good morning, [name]!"
//    for each staff member
//
// 2. Loop through shiftHours and print each value formatted like:
//    "Shift: 8.0 hours"
//
// 3. Loop through shiftHours and calculate each staff member's
//    pay for the shift (hours * hourlyRate)
//    Print each one formatted like:
//    "Shift pay: $148.00"
//    Use String(format: "%.2f", amount) for formatting
//
// 4. Loop through staffNames and print only names that
//    contain the letter "a" (case insensitive)
//    HINT: use .lowercased().contains("a")

// YOUR CODE BELOW:

for staff in staffNames {
    print("Good morning, \(staff)!")
}

for shift in shiftHours {
    print("Shift: \(shift) hours")
}

for shift in shiftHours {
    let pay = shift * hourlyRate
    print("Shift pay: \(String(format: "%.2f", pay))")
}

for staff in staffNames {
    if staff.lowercased().contains("a") {
        print(staff)
    }
}



// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: prints 5 greetings
// Exercise 2: prints 5 shift hours
// Exercise 3: prints 5 pay amounts (148.00, 120.25, 148.00, 74.00, 138.75)
// Exercise 4: prints: James, Maria, Carlos, Aisha (Tom has no 'a')


// ============================================================
// TOPIC 2 — FOR-IN WITH RANGES
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// You can loop over a range of numbers directly.
// This is the equivalent of a traditional for(i=0; i<n; i++) loop.
//
// Closed range:    for i in 1...5   → runs 5 times (1,2,3,4,5)
// Half-open range: for i in 0..<5   → runs 5 times (0,1,2,3,4)
//
// Use _ instead of a variable name if you don't need the value —
// it tells Swift "I'm looping but I don't care about the number"

// ── EXAMPLES ─────────────────────────────────────────────────

// counting up with a range
for tableNumber in 1...5 {
    print("Table \(tableNumber) is being set up")
}

// half-open range — useful for array indices
let dishes = ["Pad Thai", "Tom Kha", "Spring Rolls"]
for i in 0..<dishes.count {
    print("\(i + 1). \(dishes[i])")
}
// 1. Pad Thai
// 2. Tom Kha
// 3. Spring Rolls

// using _ when you just need to repeat N times
for _ in 1...3 {
    print("Ding! Order is ready")
}
// prints "Ding! Order is ready" 3 times

// stride — loop with a custom step value
// stride(from:to:by:) — half open, does not include 'to'
// stride(from:through:by:) — closed, includes 'through'
for hour in stride(from: 11, through: 22, by: 2) {
    print("Staff check at \(hour):00")
}
// 11, 13, 15, 17, 19, 21

// ── YOUR TURN ────────────────────────────────────────────────
// 1. Print table numbers 1 through 12, each on its own line:
//    "Table 1", "Table 2" ... "Table 12"
//
// 2. Thai Kitchen has 3 seatings for a special event.
//    Use a range loop to print:
//    "Seating 1 begins at 6:00 PM"
//    "Seating 2 begins at 7:30 PM"
//    "Seating 3 begins at 9:00 PM"
//    HINT: the start time in minutes is 360, 450, 540
//    OR just hardcode the times in an array and loop over that
//
// 3. Use _ to print "Welcome to Thai Kitchen!" exactly 5 times
//
// 4. Use stride to print every even table number from 2 to 20:
//    "Table 2", "Table 4" ... "Table 20"
//
// 5. Use stride to count DOWN from 10 to 1 (like a countdown):
//    "10 seconds to service..."
//    "9 seconds to service..."
//    ...
//    "1 seconds to service..."
//    "Service begins!"
//    HINT: stride(from:through:by:) with a negative step

// YOUR CODE BELOW:
// 1
for i in 1...12 {
    print("Table \(i)")
}


// 2 
var startTime = 6.0
func decimalHoursToTimeStr(_ hours: Double) -> String {
    let timeInMinutes = Int(hours * 60)
    let h = timeInMinutes / 60
    let m = timeInMinutes % 60
    return String(format: "%d:%02d", h, m)
} 
for i in 1...3 {
    print("Seating \(i) begins at \(decimalHoursToTimeStr(startTime))PM")
    startTime+=1.5
}
//3 
for _ in 1...5 {
    print("Welcome to Thai Kitchen!")
}

// 4
for table in stride(from: 2, through: 20, by: 2) {
    print("Table \(table)")
}

for time in stride(from: 10, through: 1, by: -1) {
    print("\(time) seconds to service...")
    if time == 1 { print("Service begins!") } // this can be inside the loop to check, or simply just print after the loop ends outside
    }

// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: Table 1 through Table 12
// Exercise 2: 3 seating times printed
// Exercise 3: "Welcome to Thai Kitchen!" × 5
// Exercise 4: Table 2, 4, 6 ... Table 20 (10 tables)
// Exercise 5: 10 down to 1, then "Service begins!"


// ============================================================
// TOPIC 3 — FOR-IN WITH INDEX: ENUMERATED()
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// Sometimes you need BOTH the index and the value while looping.
// .enumerated() gives you both as a tuple (index, value).
//
// for (index, value) in collection.enumerated() {
//     // index is the position (starts at 0)
//     // value is the item at that position
// }
//
// This is cleaner than using a range and subscripting manually.
// Use it whenever you need to number items or track position.

// ── EXAMPLES ─────────────────────────────────────────────────

let specials = ["Tom Yum Soup", "Green Curry", "Mango Sticky Rice"]

// without enumerated — clunky
for i in 0..<specials.count {
    print("\(i + 1). \(specials[i])")
}

// with enumerated — cleaner
for (index, special) in specials.enumerated() {
    print("\(index + 1). \(special)")
}
// 1. Tom Yum Soup
// 2. Green Curry
// 3. Mango Sticky Rice

// using index for logic
for (index, special) in specials.enumerated() {
    if index == 0 {
        print("\(special) ← Chef's recommendation")
    } else {
        print(special)
    }
}

// ── YOUR TURN ────────────────────────────────────────────────
// Use this data:
let orderItems = ["Pad Thai", "Tom Kha Soup", "Spring Rolls", "Thai Iced Tea", "Mango Sticky Rice"]
let orderPrices = [14.99, 12.50, 8.00, 5.50, 7.00]

// 1. Use enumerated() to print a numbered receipt:
//    "1. Pad Thai — $14.99"
//    "2. Tom Kha Soup — $12.50"
//    ... and so on
//

// 2. Use enumerated() to print only the EVEN-positioned items
//    (index 0, 2, 4 — the 1st, 3rd, and 5th items)
//    HINT: use index % 2 == 0
//

// 3. Use enumerated() to find and print the most expensive item:
//    Loop through, track the highest price and its name,
//    then print: "Most expensive: Pad Thai at $14.99"
//    HINT: you'll need a var to track the current highest price
//          and another var to track the name at that price

// YOUR CODE BELOW:
// 1
for (index, item) in orderItems.enumerated() {
    print("\(index). \(item) - $\(String(format:"%.2f", orderPrices[index]))")
}
// 2 
for (index, item) in orderItems.enumerated() {
    if index % 2 == 0 {
        print(item)
    }
}
// 3
var highestPriceIdx = 0
for (index, _) in orderPrices.enumerated() {
    // found a new greater price
    if orderPrices[index] > orderPrices[highestPriceIdx] {
        highestPriceIdx = index
    }
}
print("Most expensive: \(orderItems[highestPriceIdx]) at $\(orderPrices[highestPriceIdx])")


// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: numbered list of 5 items with prices
// Exercise 2: Pad Thai, Spring Rolls, Mango Sticky Rice
// Exercise 3: "Most expensive: Pad Thai at $14.99"


// ============================================================
// TOPIC 4 — WHILE LOOP
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// A while loop repeats as long as a condition is true.
// Use while when you don't know in advance how many times
// you need to loop — you keep going until something changes.
//
// Structure:
// while condition {
//     // runs as long as condition is true
//     // you MUST change something that affects the condition
//     // or you get an infinite loop
// }
//
// for-in vs while:
// → for-in: you know the collection or count ahead of time
// → while: you keep going until a condition is met

// ── EXAMPLES ─────────────────────────────────────────────────

// countdown to opening
var minutesUntilOpen = 5

while minutesUntilOpen > 0 {
    print("Opening in \(minutesUntilOpen) minutes...")
    minutesUntilOpen -= 1
}
print("Thai Kitchen is now open!")

// processing a queue
var customersInQueue = 4

while customersInQueue > 0 {
    print("Seating customer — \(customersInQueue - 1) remaining in queue")
    customersInQueue -= 1
}
print("Queue is empty")

// while with a more complex condition
var totalSales = 0.0
var tableNumber2 = 1
let dailyTarget = 500.0

// simulate tables being served until target is hit
let tableSales = [85.50, 120.00, 45.00, 200.00, 95.00, 180.00]

while totalSales < dailyTarget && tableNumber2 <= tableSales.count {
    totalSales += tableSales[tableNumber2 - 1]
    print("Table \(tableNumber2) served — running total: $\(String(format: "%.2f", totalSales))")
    tableNumber2 += 1
}
print("Daily target \(totalSales >= dailyTarget ? "reached" : "not reached")")

// ── YOUR TURN ────────────────────────────────────────────────
// 1. Thai Kitchen has 8 tables to clean before opening.
//    Use a while loop to print:
//    "Cleaning table 8..."
//    "Cleaning table 7..."
//    ... down to table 1
//    Then print "All tables clean — ready to open!"
//
// 2. A customer starts with a $100 gift card.
//    They keep ordering items until the balance runs out.
//    Use these item costs: [12.50, 18.00, 8.50, 22.00, 15.00, 9.50, 25.00]
//    Use a while loop to keep adding items while balance > 0
//    and the next item won't overdraw the card.
//    Print each purchase: "Purchased item for $12.50 — balance: $87.50"
//    Then print: "Gift card balance: $X.XX remaining"
//
// 3. A restaurant fills up one table at a time.
//    Start with capacity = 0, max = 30, each table seats 4.
//    Use while to keep seating tables until full or next table won't fit.
//    Print: "Seated table of 4 — capacity: 4/30"
//    Then print: "Restaurant is full" or "No more full tables fit"

// YOUR CODE BELOW:
// 1
var totalTables = 8
while totalTables > 0 {
    print("Cleaning table \(totalTables)...")
    totalTables -= 1
}
print("All tables clean - ready to open")

// 2
var startingBalance: Double = 100
let items = [12.50, 18.00, 8.50, 22.00, 15.00, 9.50, 25.00]
var idx = 0

while idx < items.count && startingBalance - items[idx] > 0 {
    let price = items[idx]
    startingBalance -= price
    print("Purchased item for $\(price) - balance: $\(startingBalance)")
    idx += 1
}
print("Gift card balance: $\(startingBalance)")

// 3
var capacity = 0
let max = 30
let peopleSeated = 4
while capacity + peopleSeated <= max {
    capacity += peopleSeated
    print("Seated table of \(peopleSeated) — capacity: \(capacity)/\(max)")
}
capacity == max ? print("Restaurant is full") : print("No more full tables fit")



// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: counts down 8 to 1, then "All tables clean"
// Exercise 2: purchases items until gift card nearly empty
// Exercise 3: seats 7 tables of 4 (28/30), stops before 32


// ============================================================
// TOPIC 5 — REPEAT-WHILE
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// repeat-while is like while, but the condition is checked AFTER
// the block runs — so the block ALWAYS runs at least once.
//
// Structure:
// repeat {
//     // always runs at least once
// } while condition
//
// Use repeat-while when you need to do something at least
// once before checking whether to continue.
// Example: show a menu to a user, then check if they want to continue

// ── EXAMPLES ─────────────────────────────────────────────────

// always greet at least once, then check if there are more guests
var guestsRemaining = 0

repeat {
    print("Welcome to Thai Kitchen!")
    guestsRemaining -= 1
} while guestsRemaining > 0
// prints "Welcome to Thai Kitchen!" exactly once
// even though guestsRemaining started at 0
// because the condition is checked AFTER the block

// practical use — process at least one item
var ordersToProcess = 3

repeat {
    print("Processing order... \(ordersToProcess) remaining")
    ordersToProcess -= 1
} while ordersToProcess > 0
// prints 3 times

// ── YOUR TURN ────────────────────────────────────────────────
// 1. A waiter always offers dessert at least once.
//    Use repeat-while where:
//    - The block prints "Would you like to see the dessert menu?"
//    - Set a var 'offersRemaining' to 0
//    - The condition checks if offersRemaining > 0
//    Confirm it prints exactly once even though offersRemaining is
// 
// wow reminds me of a do while in javascript that executes once at least

//
// 2. A kitchen prints a ticket for each order.
//    Start with 'ticketCount' = 4
//    Use repeat-while to print:
//    "Printing ticket 4..."
//    "Printing ticket 3..."
//    "Printing ticket 2..."
//    "Printing ticket 1..."
//    "All tickets printed"
//    The block should print the current count then decrement it

// YOUR CODE BELOW:

var offersRemaining = 0
repeat {
    print("Would you like to see the dessert menu?")
    offersRemaining -= 1
} while offersRemaining > 0 // add this condition to check to print only once after decremented

var ticketCount = 4
repeat {
    print("Printing ticket \(ticketCount)...")
    ticketCount -= 1
} while ticketCount > 0
print("All tickets printed")

// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: prints "Would you like to see the dessert menu?" once
// Exercise 2: prints 4 tickets in descending order

// ============================================================
// TOPIC 6 — BREAK AND CONTINUE
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// break    → stops the loop completely, exits immediately
// continue → skips the rest of THIS iteration, jumps to the next one
//
// break:    "stop the whole loop right now"
// continue: "skip this one, keep going with the rest"
//
// Use sparingly — too many breaks and continues make loops
// hard to read. But they're the right tool for certain situations.

// ── EXAMPLES ─────────────────────────────────────────────────

// break — stop when we find what we're looking for
let menuSearch = ["Pad Thai", "Tom Kha", "Spring Rolls", "Pad See Ew", "Thai Iced Tea"]
let searchTerm = "Spring Rolls"

for item in menuSearch {
    if item == searchTerm {
        print("Found it: \(item)")
        break   // no need to keep searching
    }
    print("Not \(searchTerm) — checked: \(item)")
}
// Not Spring Rolls — checked: Pad Thai
// Not Spring Rolls — checked: Tom Kha
// Found it: Spring Rolls
// (stops here — Pad See Ew and Thai Iced Tea never checked)

// continue — skip items that don't meet criteria
let allItems = ["Pad Thai", "Tom Kha", "Spring Rolls", "Pad See Ew"]
let unavailableItem = "Tom Kha"

for item in allItems {
    if item == unavailableItem {
        print("\(item) — UNAVAILABLE, skipping")
        continue   // skip to next item
    }
    print("\(item) — available")
}
// Pad Thai — available
// Tom Kha — UNAVAILABLE, skipping
// Spring Rolls — available
// Pad See Ew — available

// ── YOUR TURN ────────────────────────────────────────────────
// Use this data:
let inventory = ["Pad Thai", "Tom Kha", "Spring Rolls", "Green Curry", "Mango Sticky Rice"]
let outOfStock = ["Tom Kha", "Green Curry"]
let itemPrices = [14.99, 12.50, 8.00, 16.00, 7.00]

// 1. Use break to search for "Green Curry" in inventory.
//    Print "Checking: [item]" for each item checked.
//    When found, print "Green Curry is on the menu!" and stop.
//
// 2. Use continue to print only AVAILABLE items.
//    Skip any item that is in the outOfStock array.
//    Print "Available: [item]" for items in stock.
//    Print "Skipping [item] — out of stock" for items not in stock.
//
// 3. Loop through itemPrices with enumerated().
//    Use continue to skip any item priced under $10.
//    For items $10 and over, print:
//    "[item name] — $[price] — premium item"
//    HINT: you'll need both index and price to get the item name
// YOUR CODE BELOW:
// 1
for item in inventory {
print("Checking: \(item)")
    if item.lowercased() == "green curry" {
        print("Green Curry is on the menu!")
        break
    }
}
// 2
for item in inventory {
    if outOfStock.contains(item) {
        print("Skipping \(item) — out of stock")
        continue
    }
    print("Available: \(item)")
}
// 3
for (index, price) in itemPrices.enumerated() {
    if price < 10 {
        continue
    }
    print("\(inventory[index]) — $\(price) — premium item")
}

// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: checks Pad Thai, Tom Kha, Spring Rolls, finds Green Curry, stops
// Exercise 2: skips Tom Kha and Green Curry, prints the other 3
// Exercise 3: prints Pad Thai ($14.99), Tom Kha ($12.50), Green Curry ($16.00)
//             skips Spring Rolls ($8.00) and Mango Sticky Rice ($7.00)


// ============================================================
//
//  🏆 CHAPTER 3 CHALLENGE: THAI KITCHEN MENU PRINTER
//
// ============================================================
//
// BUILD A COMPLETE MENU PRINTER AND ORDER SUMMARY
//
// Write a Swift program that loops through menu data and
// produces a formatted menu printout and order summary.
// Use every type of loop from this chapter.
//
// ── INPUT DATA — use exactly as provided ─────────────────────

let menu = [
    "Pad Thai",
    "Tom Kha Soup",
    "Green Curry",
    "Spring Rolls",
    "Pad See Ew",
    "Tom Yum Soup",
    "Mango Sticky Rice",
    "Thai Iced Tea"
]

let menuPrices = [14.99, 12.50, 16.00, 8.00, 14.99, 11.50, 7.00, 5.50]

let menuAvailable = [true, true, false, true, true, false, true, true]

let tableOrders = [
    [0, 2],      // table 1 ordered items at index 0 and 2
    [1, 3, 7],   // table 2 ordered items at index 1, 3, and 7
    [4, 6],      // table 3 ordered items at index 4 and 6
    [0, 1, 5]    // table 4 ordered items at index 0, 1, and 5
]

// ── REQUIREMENTS ─────────────────────────────────────────────
//
// 1. FULL MENU PRINTOUT
//    Use for-in with enumerated() to print the full menu.
//    Number each item starting at 1.
//    If the item is NOT available, print "(unavailable)" after it.
//    Format:
//    "1.  Pad Thai                $14.99"
//    "2.  Tom Kha Soup            $12.50"
//    "3.  Green Curry             $16.00  (unavailable)"
//    Items don't need to be perfectly aligned — just readable.
//

// 2. AVAILABLE ITEMS ONLY
//    Use for-in with continue to print ONLY available items.
//    Print a header: "── Tonight's available dishes ──"
//    Then list only items where menuAvailable[index] is true.
//

// 3. PRICE RANGE SUMMARY
//    Use a for-in loop to find:
//    - The cheapest available item and its name
//    - The most expensive available item and its name
//    Print:
//    "Most affordable: Thai Iced Tea — $5.50"
//    "Premium pick: Green Curry — $16.00"
//    NOTE: check availability before comparing prices
//

// 4. TABLE ORDER SUMMARIES
//    Use a for-in loop over tableOrders (with enumerated()).
//    For each table, use an inner for-in loop over the item indices.
//    Print each table's order and total:
//    "── Table 1 ──"
//    "  Pad Thai — $14.99"
//    "  Green Curry — $16.00"
//    "  Table total: $30.99"
//  

// 5. RUNNING DAILY TOTAL
//    Use a while loop to accumulate the daily total
//    across all four tables.
//    Print: "Daily revenue so far: $[total]"
//    after each table is added.
//    Use += and String(format: "%.2f", total) for formatting.
//


// 6. MOST POPULAR ITEM
//    Count how many times each item was ordered across all tables.
//    Print the item that appears most frequently:
//    "Most ordered tonight: Pad Thai (ordered 2 times)"
//    HINT: use a for-in loop inside a for-in loop
//          a Dictionary [Int: Int] can track index → count
//


// ── RULES ────────────────────────────────────────────────────
// → Use for-in with enumerated() for requirements 1, 2, 4
// → Use for-in with continue for requirement 2
// → Use for-in for requirement 3 (price range)
// → Use while for requirement 5
// → Use a nested for-in for requirement 6
// → No hardcoded totals — all math must be calculated
// → Use String(format: "%.2f", price) for all money values
//
// ── HINTS ────────────────────────────────────────────────────
// → Tackle one requirement at a time — run after each one
// → For requirement 4, the outer loop is over tableOrders,
//   the inner loop is over each table's array of item indices
// → For requirement 6, a Dictionary works like: counts[index, default: 0] += 1
//   Then loop the dictionary to find the max value
// → Requirement 6 is the hardest — attempt 1–5 first
//
// ── YOUR CODE BELOW ──────────────────────────────────────────
// 1
for (index, item) in menu.enumerated() {
    print("\(index + 1).  \(item)         $\(String(format:"%.2f", menuPrices[index]))")
}

// 2
print("── Tonight's available dishes ──")
for (index, item) in menu.enumerated() {
    if(!menuAvailable[index]) {
        continue
    }
    print(item)
}

// 3
var cheapestItemIdx = -1
var mostExpensiveItemIdx = -1
for index in 0..<menuPrices.count {
    guard menuAvailable[index]  else {
        continue
    }
    if cheapestItemIdx == -1 || menuPrices[index] < menuPrices[cheapestItemIdx] {
        cheapestItemIdx = index
    }
    if mostExpensiveItemIdx == -1 || menuPrices[index] > menuPrices[mostExpensiveItemIdx] {
        mostExpensiveItemIdx = index
    }
}

print("Most affordable: \(menu[cheapestItemIdx]) — $\(String(format: "%.2f", menuPrices[cheapestItemIdx]))")
print("Premium pick: \(menu[mostExpensiveItemIdx]) — $\(String(format: "%.2f", menuPrices[mostExpensiveItemIdx]))")

// 4 & 5
var dailyRevenue: Double = 0
var tableIdx = 0

while tableIdx < tableOrders.count {

for (index, order) in tableOrders.enumerated() {
    var tableTotal: Double = 0 // after every inside loop is completed the value is reset to 0
    print("── Table \(index + 1) ──")
    for itemIdx in order {
        tableTotal += menuPrices[itemIdx]
        print("     \(menu[itemIdx]) - $\(String(format: "%.2f", menuPrices[itemIdx]))")
    }
        print("     Table total: $\(String(format: "%.2f", tableTotal))")
        dailyRevenue += tableTotal
        print("     Daily revenue so far: $\(String(format: "%.2f", dailyRevenue))")
        tableIdx += 1
}
    
}

// 6
var orderCount: [String:Int] = [:]
var mostOrderedItem = ""
var itemFrequency = -1

for order in tableOrders {
    for itemIdx in order {
        let menuItem = menu[itemIdx]
        orderCount[menuItem, default: 0] += 1

        
    }
}
for (item, count) in orderCount {
    if count > itemFrequency {
        itemFrequency = count
        mostOrderedItem = item
    }
}
print("Most ordered tonight: \(mostOrderedItem) (ordered \(itemFrequency) times)")

// ============================================================
// END OF CHAPTER 3
// ============================================================
//
// When you're done:
// ✅ All YOUR TURN sections compile and print expected output
// ✅ Challenge menu printer covers all 6 requirements
// ✅ for-in, enumerated(), while, repeat-while, break, continue all used
//
// Next up: Chapter 4 — Collections
// You'll go deeper on Dictionaries and Tuples,
// and learn the functional collection methods:
// map, filter, reduce, and compactMap.
// ============================================================