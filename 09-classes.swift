// ============================================================
// SWIFT ESSENTIALS — CHAPTER 9: CLASSES
// launchwithjames.com
// ============================================================
// HOW TO USE THIS WORKBOOK
// ─────────────────────────
// 1. Read each concept section
// 2. Complete the chapter challenge at the bottom
//
// Theme: Warriors franchise management — contracts, coaching
// staff, and the front office. Class-based because the whole
// org shares and mutates the same data.
// ============================================================


import Foundation


// ============================================================
// TOPIC 1 — DEFINING A CLASS
// ============================================================
// A class looks like a struct but behaves differently.
// Same properties, same methods, same dot syntax.
//
// Key differences from structs:
// → No free memberwise init — you write init() yourself
// → Methods can modify properties without 'mutating'
// → Reference type — more on this in Topic 2
//
// class TypeName {
//     var property: Type
//
//     init(property: Type) {
//         self.property = property
//     }
// }

class FranchisePlayer {
    var name: String
    var salary: Double
    var jerseyNumber: Int

    init(name: String, salary: Double, jerseyNumber: Int) {
        self.name = name
        self.salary = salary
        self.jerseyNumber = jerseyNumber
    }

    func describe() -> String {
        "#\(jerseyNumber) \(name) — $\(Int(salary / 1_000_000))M"
    }

    // no 'mutating' needed — classes can modify properties freely
    func giveRaise(percent: Double) {
        salary *= (1 + percent / 100)
    }
}

let curry = FranchisePlayer(name: "Stephen Curry", salary: 51_915_615, jerseyNumber: 30)
curry.giveRaise(percent: 5)
print(curry.describe())   // #30 Stephen Curry — $54M


// ============================================================
// TOPIC 2 — REFERENCE TYPE BEHAVIOR
// ============================================================
// This is the defining difference between classes and structs.
//
// STRUCT (value type) — assignment makes a COPY:
//   var a = SomeStruct()
//   var b = a         ← independent copy
//   b.x = 10          ← only b changes
//
// CLASS (reference type) — assignment shares the SAME object:
//   var a = SomeClass()
//   var b = a         ← same object, not a copy
//   b.x = 10          ← BOTH a and b see x = 10
//
// Think Google Doc vs printed page.
// Google Doc = class. Everyone with the link sees the same thing.
// Printed page = struct. Each person has their own copy.
//
// Use === to check if two variables point to the SAME instance.

var player1 = FranchisePlayer(name: "Klay Thompson", salary: 43_219_440, jerseyNumber: 11)
var player2 = player1      // same object — NOT a copy

player2.salary = 50_000_000
print(player1.salary)      // 50000000.0 — player1 sees the change
print(player1 === player2) // true — same instance


// ============================================================
// TOPIC 3 — INHERITANCE AND OVERRIDE
// ============================================================
// A subclass inherits all properties and methods of its parent.
// Use 'override' to replace a parent method.
// Use 'super' to call the parent's version.
//
// class Child: Parent {
//     override func method() {
//         super.method()   // optionally call parent first
//         // your additions
//     }
// }
//
// super.init must be called in the subclass init,
// AFTER you set your own properties.

class StaffMember {
    var name: String
    var salary: Double

    init(name: String, salary: Double) {
        self.name = name
        self.salary = salary
    }

    func role() -> String { "Staff" }

    func describe() -> String {
        "\(name) — \(role()) — $\(Int(salary / 1_000_000))M"
    }
}

class HeadCoach: StaffMember {
    var rings: Int

    init(name: String, salary: Double, rings: Int) {
        self.rings = rings
        super.init(name: name, salary: salary)
    }

    override func role() -> String { "Head Coach" }

    override func describe() -> String {
        super.describe() + " — \(rings) rings"
    }
}

let kerr = HeadCoach(name: "Steve Kerr", salary: 9_000_000, rings: 4)
print(kerr.describe())   // Steve Kerr — Head Coach — $9M — 4 rings

// polymorphism — loop over mixed types, each responds correctly
let staff: [StaffMember] = [
    kerr,
    StaffMember(name: "Kenny Atkinson", salary: 3_500_000)
]
for member in staff { print(member.role()) }


// ============================================================
// TOPIC 4 — DESIGNATED VS CONVENIENCE INITIALIZERS
// ============================================================
// DESIGNATED init — the primary init. Sets ALL stored properties.
// CONVENIENCE init — a shortcut. Must call self.init() internally.
//
// convenience init(shortcut params) {
//     self.init(full: params, with: defaults)
// }
//
// Use convenience inits to reduce repetition at common call sites.

class Contract {
    var playerName: String
    var years: Int
    var totalValue: Double
    var hasNoTrade: Bool

    init(playerName: String, years: Int, totalValue: Double, hasNoTrade: Bool) {
        self.playerName = playerName
        self.years = years
        self.totalValue = totalValue
        self.hasNoTrade = hasNoTrade
    }

    convenience init(rookieDeal playerName: String) {
        self.init(playerName: playerName, years: 4, totalValue: 8_000_000, hasNoTrade: false)
    }

    convenience init(vetMinimum playerName: String) {
        self.init(playerName: playerName, years: 1, totalValue: 1_194_469, hasNoTrade: false)
    }

    var annualValue: Double { totalValue / Double(years) }
    func summary() -> String { "\(playerName) — \(years) yrs / $\(Int(totalValue / 1_000_000))M" }
}

print(Contract(playerName: "Curry", years: 4, totalValue: 215_160_480, hasNoTrade: true).summary())
print(Contract(rookieDeal: "Podz").summary())
print(Contract(vetMinimum: "GP2").summary())


// ============================================================
// TOPIC 5 — DEINIT
// ============================================================
// deinit fires automatically when an instance is about to be
// destroyed — when nothing holds a reference to it anymore.
//
// Only classes have deinit. Structs do not.
// You never call deinit manually — ARC (Chapter 15) handles it.
//
// Common uses: logging, cancelling timers, releasing resources.

class ScoutingSession {
    var sessionID: String

    init(sessionID: String) {
        self.sessionID = sessionID
        print("Session \(sessionID) opened")
    }

    deinit {
        print("Session \(sessionID) closed")
    }
}

func runScoutingTrip() {
    let session = ScoutingSession(sessionID: "DRAFT-2024")
    print("Scouting in progress...")
    // session goes out of scope here — deinit fires
}

runScoutingTrip()
// Session DRAFT-2024 opened
// Scouting in progress...
// Session DRAFT-2024 closed


// ============================================================
// TOPIC 6 — STRUCT VS CLASS: THE DECISION
// ============================================================
// USE A STRUCT WHEN:
// → Data represents a value (a score, a stat line, a coordinate)
// → Copies make sense — each caller should have independent data
// → No inheritance needed
// → SwiftUI views (SwiftUI is built entirely on structs)
//
// USE A CLASS WHEN:
// → Data has identity (a user session, a shared manager)
// → Multiple parts of your app share and mutate the same data
// → You need inheritance
// → You need deinit
//
// Apple's guidance: "Use structs by default."
// Reach for a class only when you need reference semantics.
//
// Gut check: "Does it make sense for two variables to share
// this data and see each other's changes?"
// YES → class     NO → struct


// ============================================================
//
//  🏆 CHAPTER 9 CHALLENGE: WARRIORS FRANCHISE SYSTEM
//
// ============================================================
//
// Build a three-level class hierarchy for the Warriors org.
// Demonstrate inheritance, reference behavior, and contrast
// it against a struct at the end.
//

// ── REQUIREMENTS ─────────────────────────────────────────────
//
// 1. BASE CLASS — Organization
//    Properties: name (String), city (String), founded (Int), revenue (Double)
//    Designated init for all four
//    Method: profile() -> String  →  "[city] [name] (est. [founded])"
//    Method: addRevenue(_ amount: Double)  →  adds to revenue, prints new total
//
// 2. SUBCLASS — SportsTeam: Organization
//    Additional: sport (String), championships (Int)
//    Designated init → call super.init
//    override profile() → super.profile() + " — [championships] championships"
//    Method: winChampionship() → increments championships, prints celebration
//
// 3. SUBCLASS — NBATeam: SportsTeam
//    Additional: conference (String), roster ([String])
//    Designated init → call super.init, set roster from initialRoster below
//    override profile() → super.profile() + " | [conference] Conference"
//    Method: signPlayer(_ name: String) → appends to roster, prints confirmation
//    Method: tradePlayer(out: String, for: String) → swaps players, prints summary
//    deinit: print "Franchise [name] dissolved"
//
// 4. REFERENCE BEHAVIOR DEMO
//    Create one NBATeam for the Warriors
//    Assign to a second variable 'leagueRecord'
//    Sign a player through leagueRecord
//    Print the roster through the original Warriors variable
//    Confirm the new player appears — comment explaining why
//
// 5. STRUCT CONTRAST
//    Define a struct 'GameTicket':
//    section (String), row (Int), seat (Int), price (Double)
//    Computed: seatLabel -> String  →  "Section [s], Row [r], Seat [n]"
//    Create a ticket, copy to 'transferredTicket'
//    Change transferredTicket.price to 0
//    Print both prices — confirm original unchanged
//    Comment: contrast this with requirement 4 and explain the difference
//
// ── INPUT DATA ───────────────────────────────────────────────

let initialRoster = ["Stephen Curry", "Klay Thompson", "Draymond Green", "Andrew Wiggins", "Kevon Looney"]

// ── HINTS ────────────────────────────────────────────────────
// → super.init must be called AFTER setting your own properties
// → tradePlayer: use firstIndex(of:) to find and remove the outgoing player
// → Wrap an NBATeam creation in a function to demonstrate deinit firing
//
// ── YOUR CODE BELOW ──────────────────────────────────────────




// ============================================================
// END OF CHAPTER 9
// ============================================================
//
// ✅ Three-level inheritance chain built
// ✅ Reference behavior demonstrated and commented
// ✅ Struct vs class contrast is explicit
//
// Next: Chapter 10 — Enums
// Model state with types instead of strings and magic numbers.
// ============================================================