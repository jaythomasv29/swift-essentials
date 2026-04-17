// ============================================================
// SWIFT ESSENTIALS — CHAPTER 8: STRUCTS
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
//
// Theme: You're building the data layer for a basketball
// analytics app tracking players, games, and stats for
// the Golden State Warriors.
// ============================================================


import Foundation


// ============================================================
// TOPIC 1 — DEFINING A STRUCT
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// A struct is a custom data type that groups related values
// under a single named type.
//
// You've already been working with one — 'MenuItem' in earlier
// chapters was a struct. Now you're defining them from scratch.
//
// Basic syntax:
// struct TypeName {
//     var propertyName: Type
//     let propertyName: Type
// }
//
// Rules:
// → Type names are PascalCase: Player, GameStats, ShotAttempt
// → Use var for properties that can change, let for constants
// → Swift gives you a FREE memberwise initializer —
//   you don't have to write init() yourself
//
// The memberwise initializer matches property order:
// Player(name:jerseyNumber:position:pointsPerGame:)

// ── EXAMPLES ─────────────────────────────────────────────────

struct Player {
    var name: String
    var jerseyNumber: Int
    var position: String
    var pointsPerGame: Double
    var isActive: Bool
}

// Swift auto-generates this initializer for free:
let curry = Player(name: "Stephen Curry", jerseyNumber: 30, position: "PG", pointsPerGame: 29.4, isActive: true)
let klay  = Player(name: "Klay Thompson",  jerseyNumber: 11, position: "SG", pointsPerGame: 18.1, isActive: true)

print(curry.name)           // Stephen Curry
print(curry.pointsPerGame)  // 29.4
print(klay.position)        // SG

// var properties can be changed
var draftPick = Player(name: "TBD", jerseyNumber: 99, position: "SF", pointsPerGame: 0.0, isActive: false)
draftPick.name = "Trayce Jackson-Davis"
draftPick.isActive = true
print(draftPick.name)   // Trayce Jackson-Davis

// ── YOUR TURN ────────────────────────────────────────────────
// 1. Define a struct called 'Team' with these properties:
//    - name: String
//    - city: String
//    - wins: Int
//    - losses: Int
//    - isPlayoffTeam: Bool
//
// 2. Create two Team instances using the memberwise initializer:
//    - Golden State Warriors, 48 wins, 34 losses, playoff team
//    - Sacramento Kings, 46 wins, 36 losses, playoff team
//    Print the name and win total of each.
//
// 3. Define a struct called 'GameStats' with:
//    - playerName: String
//    - points: Int
//    - rebounds: Int
//    - assists: Int
//    - steals: Int
//    - turnovers: Int
//    Create one instance for Curry: 42 pts, 5 reb, 8 ast, 2 stl, 3 to
//    Print all five stat fields.

// YOUR CODE BELOW:
// 1
struct Team {
    let name: String
    let city: String
    var wins: Int
    var losses: Int
    var isPlayoffTeam: Bool
}
// 2
let warriors = Team(name: "Golden State Warriors", city: "San Francisco", wins: 48, losses: 34, isPlayoffTeam: true)
let kings = Team(name: "Sacramento Kings", city: "Sacramento", wins: 46, losses: 36, isPlayoffTeam: true)
print("\(warriors.name) \(warriors.wins)")
print("\(kings.name) \(kings.wins)")
// 3
struct GameStats {
    var playerName: String
    var points: Int
    var rebounds: Int
    var assists: Int
    var steals: Int
    var turnovers: Int
}

var player1 = GameStats(playerName: "Curry", points: 42, rebounds: 5, assists: 8, steals: 2, turnovers: 3)
func printPlayerStats(stats: GameStats) {
    print("Stats for \(stats.playerName) - points: \(stats.points) - rebounds: \(stats.rebounds) - assists: \(stats.assists) - steals: \(stats.steals) - turnovers: \(stats.turnovers)")
}
printPlayerStats(stats: player1)



// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 2: prints name and wins for both teams
// Exercise 3: all five stat fields print correctly


// ============================================================
// TOPIC 2 — STORED AND COMPUTED PROPERTIES
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// Properties come in two kinds:
//
// STORED properties — hold actual data in memory
//   var points: Int      ← value stored directly on the instance
//
// COMPUTED properties — derive a value on the fly, no storage
//   var summary: String { "\(name): \(points) pts" }
//
// Computed properties:
// → Always use var (never let — they're recalculated each time)
// → Don't use = assignment, they use { } with a return
// → Can read other properties freely
// → Can't be set directly (unless you add a setter — advanced topic)
//
// Use computed properties when the value can be derived from
// other stored properties. Don't store what you can calculate.

// ── EXAMPLES ─────────────────────────────────────────────────

struct PlayerCard {
    // stored
    var name: String
    var pointsPerGame: Double
    var assistsPerGame: Double
    var reboundsPerGame: Double

    // computed — derived, not stored
    var statLine: String {
        "\(pointsPerGame) pts / \(assistsPerGame) ast / \(reboundsPerGame) reb"
    }

    // computed — formatted display
    var label: String {
        "\(name) — \(statLine)"
    }
}

var card = PlayerCard(name: "Draymond Green", pointsPerGame: 8.5, assistsPerGame: 6.8, reboundsPerGame: 7.2)
print(card.statLine)   // 8.5 pts / 6.8 ast / 7.2 reb
print(card.label)      // Draymond Green — 8.5 pts / 6.8 ast / 7.2 reb

// change a stored property → computed updates automatically
card.pointsPerGame = 9.2
print(card.statLine)   // 9.2 pts / 6.8 ast / 7.2 reb

// ── YOUR TURN ────────────────────────────────────────────────
// 1. Define a struct 'BoxScore' with stored properties:
//    - playerName: String
//    - fieldGoalsMade: Int
//    - fieldGoalsAttempted: Int
//    - freeThrowsMade: Int
//    - freeThrowsAttempted: Int
//    Add a computed property 'fieldGoalPct: Double'
//    that returns fieldGoalsMade / fieldGoalsAttempted as a percentage
//    (return 0.0 if attempted is 0 — avoid divide by zero)
//
// 2. Add another computed property 'summary: String' that returns:
//    "Curry: 14/22 FG (63.6%) — 8/8 FT"
//    (use String(format: "%.1f", ...) for the percentage)
//
// 3. Define a struct 'StandingsRow' with:
//    - teamName: String
//    - wins: Int
//    - losses: Int
//    Add computed properties:
//    - 'gamesPlayed: Int'  → wins + losses
//    - 'winPct: Double'    → wins / gamesPlayed (0.0 if no games played)
//    - 'record: String'    → "48-34 (.585)"  (winPct to 3 decimal places)
//    Create a Warriors row (48-34) and print all three computed properties.

// YOUR CODE BELOW:

struct BoxScore {
    let playerName: String
    var fieldGoalsMade: Int
    var fieldGoalsAttempted: Int
    var freeThrowsMade: Int
    var freeThrowsAttempted: Int

    var fieldGoalPct: Double {
        if fieldGoalsAttempted == 0 { return 0.0 }
        return Double(fieldGoalsMade) / Double(fieldGoalsAttempted) * 100
    }

    var summary: String {
        "\(playerName): \(fieldGoalsMade)/\(fieldGoalsAttempted) FG (\(String(format: "%.1f", fieldGoalPct))%) - \(freeThrowsMade)/\(freeThrowsAttempted) FT"
    }
}

let boxScore = BoxScore(playerName: "Curry", fieldGoalsMade: 14, fieldGoalsAttempted: 22, freeThrowsMade: 8, freeThrowsAttempted: 8)
print(boxScore.summary)
struct StandingsRow {
    let teamName: String
    var wins: Int
    var losses: Int

    var gamesPlayed: Int { wins + losses }
    var winPct: Double { Double(wins) / Double(gamesPlayed) }
    var record: String { "\(wins)/\(losses) (\(String(format: "%.3f", winPct)))"}
}

let warriorRow = StandingsRow(teamName: "Golden State Warriors", wins: 48, losses: 34)
print(warriorRow.record)

// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: fieldGoalPct for 14/22 = 63.636...
// Exercise 2: "Curry: 14/22 FG (63.6%) — 8/8 FT"
// Exercise 3: gamesPlayed = 82, winPct ≈ 0.585, record = "48-34 (.585)"


// ============================================================
// TOPIC 3 — PROPERTY OBSERVERS: willSet AND didSet
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// Property observers let you run code automatically whenever
// a stored property changes.
//
// Two observers:
//   willSet — runs BEFORE the value changes
//             newValue is the incoming value
//   didSet  — runs AFTER the value changes
//             oldValue is the previous value
//
// Syntax:
// var propertyName: Type {
//     willSet { // newValue available here }
//     didSet  { // oldValue available here }
// }
//
// Common uses:
// → Logging changes for debugging
// → Clamping values within a valid range
// → Triggering side effects when state changes
// → Validating data on write
//
// Note: observers do NOT fire during initialization —
// only on subsequent assignments after the instance is created.

// ── EXAMPLES ─────────────────────────────────────────────────

struct ContractPlayer {
    var name: String
    var salary: Double {
        willSet {
            print("\(name)'s salary changing: $\(String(format: "%.0f", salary)) → $\(String(format: "%.0f", newValue))")
        }
        didSet {
            if salary > 50_000_000 {
                print("⚠️  Max contract territory for \(name)")
            }
        }
    }
}

var maxPlayer = ContractPlayer(name: "Stephen Curry", salary: 48_070_014)
maxPlayer.salary = 51_915_615   // triggers both observers
// "Stephen Curry's salary changing: $48070014 → $51915615"
// "⚠️  Max contract territory for Stephen Curry"

// clamping with didSet — keep a value in range
struct FoulTracker {
    var name: String
    var fouls: Int = 0 {
        didSet {
            if fouls > 6 {
                fouls = 6   // foul out — clamp to max
                print("\(name) has fouled out")
            } else {
                print("\(name) now has \(fouls) fouls \(oldValue) -> \(fouls)")
            }
        }
    }
}

var player = FoulTracker(name: "Draymond Green")
player.fouls = 3   // Draymond Green now has 3 fouls
player.fouls = 5   // Draymond Green now has 5 fouls
player.fouls = 7   // Draymond Green has fouled out (clamped to 6)
print(player.fouls) // 6

// ── YOUR TURN ────────────────────────────────────────────────
// 1. Define a struct 'Scoreboard' with:
//    - homeTeam: String
//    - awayTeam: String
//    - homeScore: Int with a didSet that prints:
//      "[homeTeam] scores! Now leading [homeScore]-[awayScore]"
//      (or "trailing" if homeScore < awayScore)
//    - awayScore: Int with a similar didSet for the away team
//    Create a Scoreboard and simulate a few score updates.
//
// 2. Define a struct 'PlayerStamina' with:
//    - name: String
//    - minutesPlayed: Double with a willSet that prints:
//      "Subbing [name] in for minute [newValue]"
//    Add a didSet that prints a warning if minutesPlayed > 38.0:
//      "⚠️  [name] is over 38 minutes — fatigue risk"
//    Test with a few minute updates.
//
// 3. Define a struct 'DraftBoard' with:
//    - pickNumber: Int with a didSet that clamps it between 1 and 60
//      If out of range, print "Invalid pick number — clamped to [value]"
//    - playerName: String
//    Test by assigning pickNumber = 0, pickNumber = 45, pickNumber = 99

// YOUR CODE BELOW:
// 1
struct Scoreboard {
    var homeTeam: String
    var awayTeam: String
    var homeScore: Int {
        didSet {
        print("\(homeTeam) scores! \(homeScore > awayScore ? "Now leading" : "Trailing") \(homeTeam) \(homeScore)-\(awayScore) \(awayTeam)")
        }
    }   
    var awayScore: Int {
        didSet {
        print("\(awayScore) scores! \(awayScore > homeScore ? "Now leading" : "Trailing") \(awayScore) \(awayTeam)-\(homeScore) \(homeTeam)")
        }
    }
}
var scoreboard1 = Scoreboard(homeTeam: "Warriors", awayTeam: "Kings", homeScore: 50, awayScore: 50)
scoreboard1.awayScore = 54
scoreboard1.homeScore = 55
// 2
struct PlayerStamina {
    let name: String
    var minutesPlayed: Double {
        willSet {
            print("Subbing \(name) in for minute \(newValue)")
        }
        didSet {
            if minutesPlayed > 38.0 {
                print("⚠️  \(name) is over 38 minutes — fatigue risk")
            }
        }
    }
}

let playerStamina = PlayerStamina(name: "Curry", minutesPlayed: 30)
// 3
struct DraftBoard {
    var pickNumber: Int {
        didSet {
            if pickNumber > 60 {
                pickNumber = 60
                print("Invalid pick number - clamped to \(pickNumber)")
            } else if pickNumber < 1 {
                pickNumber = 1
                print("Invalid pick number - clamped to \(pickNumber)")
            }
        }
    }
}

var draftBoard = DraftBoard(pickNumber: 60)
draftBoard.pickNumber = 62


// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: score updates trigger correct home/away messages
// Exercise 2: warning fires only when > 38 minutes
// Exercise 3: 0 clamps to 1, 45 stays 45, 99 clamps to 60


// ============================================================
// TOPIC 4 — LAZY PROPERTIES
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// A lazy property is computed once — the first time it's accessed.
// After that, the result is stored and reused.
//
// Syntax:
//   lazy var propertyName: Type = { ... }()
//
// Rules:
// → Always var — never let (it needs to be assigned after init)
// → The instance itself must be var to use lazy properties
// → Good for expensive work you might not always need
// → Can reference other properties (unlike stored property defaults)
//
// In game/sports apps: use lazy for anything that requires
// processing — generating reports, formatting large datasets,
// running stat calculations only when a screen opens.

// ── EXAMPLES ─────────────────────────────────────────────────

struct GameReport {
    var homeTeam: String
    var awayTeam: String
    var gameDate: String
    var pointDifferential: Int

    // computed once on first access — not at initialization
    lazy var reportHeader: String = {
        let result = pointDifferential > 0 ? "\(homeTeam) win" : "\(awayTeam) win"
        return "── \(gameDate): \(homeTeam) vs \(awayTeam) — \(result) by \(abs(pointDifferential)) ──"
    }()
}

var report = GameReport(homeTeam: "Warriors", awayTeam: "Lakers", gameDate: "Jan 18", pointDifferential: 12)
print(report.reportHeader)   // computed here, cached after this
print(report.reportHeader)   // returns cached value — not recomputed

// ── YOUR TURN ────────────────────────────────────────────────
// 1. Define a struct 'PlayerProfile' with stored properties:
//    - name: String
//    - pointsPerGame: Double
//    - assistsPerGame: Double
//    - reboundsPerGame: Double
//    - gamesPlayed: Int
//    Add a lazy property 'seasonTotals: String' that returns:
//    "Curry — 2146 pts, 580 ast, 391 reb over 74 games"
//    (multiply each per-game stat by gamesPlayed, round to Int)
//
// 2. Define a struct 'PlayoffBracket' with:
//    - seed: Int
//    - teamName: String
//    - wins: Int
//    - losses: Int
//    Add a lazy property 'bracketLabel: String' that returns:
//    "(3) Warriors — 2-1"
//    Create the instance, access bracketLabel, then try changing
//    wins to 3. Access bracketLabel again — what do you notice?
//    Add a comment explaining what you observed.

// YOUR CODE BELOW:
// 1
struct PlayerProfile {
    var name: String
    var pointsPerGame: Double
    var assistsPerGame: Double
    var reboundsPerGame: Double
    var gamesPlayed: Int
    lazy var seasonTotals: String = {
        return "\(name) - \(pointsPerGame * Double(gamesPlayed)) pts, \(assistsPerGame * Double(gamesPlayed)) ast, \(reboundsPerGame * Double(gamesPlayed)) reb over \(gamesPlayed) games"
    }()
    
}

var playerprofile1 = PlayerProfile(name: "Stephen Curry", pointsPerGame: 23.5, assistsPerGame: 8.3, reboundsPerGame: 5.2, gamesPlayed: 74) 
print(playerprofile1.seasonTotals)

// 2
struct PlayoffBracket {
    var seed: Int
    var teamName: String
    var wins: Int
    var losses: Int
    lazy var bracketLabel: String = {
        return "(\(seed)) \(teamName) - \(wins)-\(losses)"
    }()
    
}
var playoffBracket1 = PlayoffBracket(seed: 3, teamName: "Warriors", wins: 2, losses: 1)
print(playoffBracket1.bracketLabel)


// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: season totals multiply per-game by gamesPlayed
// Exercise 2: lazy caches the FIRST value — changing wins doesn't
//             update bracketLabel because it was already computed


// ============================================================
// TOPIC 5 — METHODS ON STRUCTS
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// Structs can have methods — functions defined inside the struct
// that operate on its properties.
//
// Methods:
// → Are defined with 'func' inside the struct body
// → Can read any property freely
// → Cannot modify properties by default (see Topic 6 for that)
// → Are called with dot syntax: player.describe()
//
// Think of methods as behaviors the struct knows how to do.
// A Player knows how to describe itself.
// A GameStats knows how to calculate its efficiency rating.

// ── EXAMPLES ─────────────────────────────────────────────────

struct RosterPlayer {
    var name: String
    var jerseyNumber: Int
    var position: String
    var pointsPerGame: Double
    var assistsPerGame: Double
    var reboundsPerGame: Double

    func describe() -> String {
        "#\(jerseyNumber) \(name) (\(position)) — \(pointsPerGame) PPG"
    }

    func efficiencyRating() -> Double {
        // simplified PER-style calculation
        return pointsPerGame + assistsPerGame + reboundsPerGame
    }

    func isAllStar() -> Bool {
        return pointsPerGame >= 20.0 || efficiencyRating() >= 30.0
    }
}

let steph = RosterPlayer(name: "Stephen Curry", jerseyNumber: 30, position: "PG",
                         pointsPerGame: 29.4, assistsPerGame: 6.1, reboundsPerGame: 5.1)
print(steph.describe())           // #30 Stephen Curry (PG) — 29.4 PPG
print(steph.efficiencyRating())   // 40.6
print(steph.isAllStar())          // true

// ── YOUR TURN ────────────────────────────────────────────────
// 1. Define a struct 'GameResult' with:
//    - homeTeam: String
//    - awayTeam: String
//    - homeScore: Int
//    - awayScore: Int
//    Add these methods:
//    - 'winner() -> String'     returns the winning team name
//    - 'margin() -> Int'        returns abs(homeScore - awayScore)
//    - 'isThriller() -> Bool'   returns true if margin is <= 5
//    - 'summary() -> String'    returns "Warriors def. Lakers 118-112 (close game)"
//      append "(close game)" only if isThriller() is true
//    Test with Warriors 118, Lakers 112 — and with Warriors 131, Lakers 96.
//
// 2. Define a struct 'TradeProposal' with:
//    - sendingTeam: String
//    - receivingTeam: String
//    - playerOut: String
//    - playerIn: String
//    - salaryOut: Double
//    - salaryIn: Double
//    Add methods:
//    - 'salaryDelta() -> Double'    difference: salaryIn - salaryOut
//    - 'isCapFriendly() -> Bool'    true if salaryDelta() <= 0
//    - 'describe() -> String'       returns a full trade summary string
//      Example: "Warriors send Wiggins ($24M) → receive Butler ($48M) [+$24M]"
//      Use formatSalary() helper below for formatting.
//
// Helper — use this in your describe() method:
func formatSalary(_ amount: Double) -> String {
    "$\(Int(amount / 1_000_000))M"
}

// YOUR CODE BELOW:




// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: 118-112 is a thriller (margin 6 — actually not, test both)
// Exercise 2: salary delta, cap check, and summary all correct


// ============================================================
// TOPIC 6 — MUTATING METHODS
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// Structs are VALUE types. Swift protects their properties —
// a regular method CANNOT modify stored properties.
//
// To modify properties inside a method, mark it 'mutating':
//
//   mutating func methodName() {
//       self.property = newValue
//   }
//
// Why does this exist?
// Structs are copied, not shared. A mutating method signals to
// Swift (and to the caller) that calling this method will change
// the value. The caller's copy gets updated — nothing else.
//
// You'll use mutating constantly in game logic:
// addPoints, applyPenalty, updateRoster, incrementFouls...

// ── EXAMPLES ─────────────────────────────────────────────────

struct LiveScore {
    var homeTeam: String
    var awayTeam: String
    var homeScore: Int = 0
    var awayScore: Int = 0
    var quarter: Int = 1

    mutating func homeScores(points: Int) {
        homeScore += points
    }

    mutating func awayScores(points: Int) {
        awayScore += points
    }

    mutating func nextQuarter() {
        if quarter < 4 { quarter += 1 }
    }

    func currentScore() -> String {
        "\(homeTeam) \(homeScore) — \(awayTeam) \(awayScore) (Q\(quarter))"
    }
}

var game = LiveScore(homeTeam: "Warriors", awayTeam: "Clippers")
game.homeScores(points: 3)
game.awayScores(points: 2)
game.homeScores(points: 2)
print(game.currentScore())   // Warriors 5 — Clippers 2 (Q1)
game.nextQuarter()
print(game.currentScore())   // Warriors 5 — Clippers 2 (Q2)

// ── YOUR TURN ────────────────────────────────────────────────
// 1. Define a struct 'PlayerFoulRecord' with:
//    - name: String
//    - fouls: Int = 0
//    - isFouledOut: Bool = false
//    Add a mutating method 'addFoul()' that:
//    - increments fouls by 1
//    - if fouls reaches 6, sets isFouledOut = true and prints
//      "[name] has fouled out!"
//    - otherwise prints "[name] has [fouls] fouls"
//    Add a mutating method 'reset()' that sets fouls to 0 and
//    isFouledOut to false
//    Test by calling addFoul() 6 times, then reset(), then addFoul() once.
//
// 2. Define a struct 'Roster' with:
//    - teamName: String
//    - players: [String]
//    Add mutating methods:
//    - 'addPlayer(_ name: String)'     appends to players, prints confirmation
//    - 'removePlayer(_ name: String)'  removes from players if found,
//                                      prints "Not on roster" if not found
//    - 'clearRoster()'                 empties the array
//    Add a non-mutating method:
//    - 'printRoster()'                 prints each player numbered
//    Test all four methods.
//
// 3. Define a struct 'ShotClock' with:
//    - seconds: Int = 24
//    Add mutating methods:
//    - 'tick()'     decrements by 1, prints "Violation!" if seconds hits 0
//    - 'reset()'    resets to 24
//    - 'reset(to seconds: Int)'  resets to a custom value (e.g. 14 for offensive rebound)
//    Simulate: tick 22 times, reset to 14, tick 14 times

// YOUR CODE BELOW:




// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: 6th foul triggers foul-out message; reset works
// Exercise 2: add/remove/clear/print all work correctly
// Exercise 3: "Violation!" fires at second tick-down to 0


// ============================================================
// TOPIC 7 — MEMBERWISE INITIALIZER
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// Swift auto-generates a memberwise initializer for every struct.
// It takes all stored properties as parameters in declaration order.
//
// You get this for free — you don't write init() unless you
// need custom initialization logic.
//
// If you DO write a custom init, the free memberwise init
// disappears. To keep both, put the custom init in an extension.
//
// Custom init syntax:
// init(paramName: Type) {
//     self.property = paramName
// }
//
// 'self' refers to the instance being created.
// Every stored property must be assigned before init finishes.

// ── EXAMPLES ─────────────────────────────────────────────────

struct DraftPick {
    var round: Int
    var pickInRound: Int
    var overallPick: Int
    var team: String
    var playerName: String

    // custom init — calculates overallPick from round + pick
    init(round: Int, pick: Int, team: String, playerName: String) {
        self.round = round
        self.pickInRound = pick
        self.overallPick = (round - 1) * 30 + pick
        self.team = team
        self.playerName = playerName
    }

    var label: String {
        "Round \(round), Pick \(pickInRound) (#\(overallPick) overall) — \(team) select \(playerName)"
    }
}

let pick = DraftPick(round: 1, pick: 7, team: "Warriors", playerName: "Brandin Podziemski")
print(pick.label)   // Round 1, Pick 7 (#7 overall) — Warriors select Brandin Podziemski

// keeping both inits using an extension
struct ScoutReport {
    var playerName: String
    var grade: String
    var notes: String
}

extension ScoutReport {
    // convenience init — grade defaults to "B"
    init(playerName: String, notes: String) {
        self.playerName = playerName
        self.grade = "B"
        self.notes = notes
    }
}

// both work:
let fullReport = ScoutReport(playerName: "Kel'el Ware", grade: "A", notes: "Elite rim protection")
let quickReport = ScoutReport(playerName: "Rob Dillingham", notes: "High motor, needs polish")
print(fullReport.grade)    // A
print(quickReport.grade)   // B (default)

// ── YOUR TURN ────────────────────────────────────────────────
// 1. Define a struct 'Contract' with:
//    - playerName: String
//    - years: Int
//    - totalValue: Double
//    - annualAverage: Double     ← computed from totalValue / years
//    Write a custom init(playerName:years:totalValue:) that
//    calculates annualAverage automatically.
//    Create Curry's contract: 4 years, $215,160,480
//    Print annualAverage — should be ~$53.79M/year
//
// 2. Define a struct 'PlayerBio' with:
//    - name: String
//    - age: Int
//    - heightInches: Int
//    - weightLbs: Int
//    Keep the free memberwise init.
//    Add a convenience init in an extension:
//    init(name: String, age: Int, heightFeet: Int, heightInches: Int, weightLbs: Int)
//    that converts feet+inches to total inches automatically.
//    Test: Curry is 6'2" (74 inches), 185 lbs, age 36
//    Create him using BOTH inits and confirm heightInches matches.

// YOUR CODE BELOW:




// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: annualAverage = 215160480 / 4 = 53790120.0
// Exercise 2: 6'2" = 74 inches — both inits produce same result


// ============================================================
// TOPIC 8 — VALUE TYPE BEHAVIOR
// ============================================================

// ── CONCEPT ──────────────────────────────────────────────────
// This is the most important concept in Chapter 8.
//
// Structs are VALUE TYPES.
// When you assign a struct to a new variable, Swift COPIES it.
// The two variables are completely independent — changing one
// does NOT affect the other.
//
// This is different from classes (Chapter 9), which are
// REFERENCE TYPES — they share the same underlying data.
//
// Value type behavior:
//   var a = SomeStruct(...)
//   var b = a              ← b is a COPY of a
//   b.property = "changed" ← only b changes, a is untouched
//
// Why does this matter?
// → Predictable — no surprise mutations from other code
// → Safe to pass around — functions can't secretly modify your data
// → Foundation of SwiftUI — views are structs, state is explicit
//
// You've already experienced this in Chapter 4 with arrays —
// Array is a struct in Swift, which is why passing an array
// to a function doesn't modify the original.

// ── EXAMPLES ─────────────────────────────────────────────────

struct TeamRecord {
    var name: String
    var wins: Int
    var losses: Int
}

var warriors = TeamRecord(name: "Warriors", wins: 48, losses: 34)
var copy = warriors            // copy is a SEPARATE value

copy.wins = 50                 // only copy changes
print(warriors.wins)           // 48 — unchanged
print(copy.wins)               // 50

// passing to a function — original is safe
func simulate(record: TeamRecord) -> TeamRecord {
    var updated = record       // working on a copy inside the function
    updated.wins += 5
    return updated
}

let projected = simulate(record: warriors)
print(warriors.wins)           // 48 — untouched
print(projected.wins)          // 53

// contrast with what classes will do (preview):
// class TeamRecord { ... }
// var warriors = TeamRecord(...)
// var alias = warriors        ← alias is the SAME object, not a copy
// alias.wins = 50
// print(warriors.wins)        ← 50! Both see the change

// ── YOUR TURN ────────────────────────────────────────────────
// 1. Define a struct 'TradeAsset' with:
//    - playerName: String
//    - salary: Double
//    - yearsRemaining: Int
//    Create a Warriors instance for Wiggins (salary: 24_000_000, years: 2)
//    Copy it to a variable called 'traded'
//    Change traded.playerName to "Andrew Wiggins (traded)"
//    Change traded.yearsRemaining to 0
//    Print both — confirm the original is untouched.
//
// 2. Write a function 'progressSeason(record: TeamRecord) -> TeamRecord'
//    (use the TeamRecord struct above)
//    Adds 5 wins and 3 losses to a copy and returns it
//    Call it with the Warriors — print before and after
//    Confirm the original record is unchanged.
//
// 3. Create two TeamRecord variables that start identical.
//    Update one's wins. Print both.
//    Write a comment explaining why they differ — reference
//    the concept of value types in your explanation.

// YOUR CODE BELOW:




// ── CHECK YOURSELF ───────────────────────────────────────────
// Exercise 1: original name and yearsRemaining unchanged after copy mutation
// Exercise 2: original record unchanged after progressSeason call
// Exercise 3: comment explains copy semantics — structs are independent values


// ============================================================
//
//  🏆 CHAPTER 8 CHALLENGE: PLAYER CARD SYSTEM
//
// ============================================================
//
// BUILD A COMPLETE PLAYER AND GAME DATA SYSTEM
//
// You're building the data layer for a Warriors analytics app.
// Every struct must be clean, use the right property types,
// and demonstrate the concepts from this chapter.
//
// This challenge ties together everything from Chapter 8:
// stored + computed properties, observers, lazy, methods,
// mutating methods, custom inits, and value type behavior.
//


// ── REQUIREMENTS ─────────────────────────────────────────────
//
// 1. PLAYER STRUCT
//    Define a struct 'PlayerCard' with:
//    Stored: name, jerseyNumber (Int), position, pointsPerGame,
//            assistsPerGame, reboundsPerGame, salary (Double)
//    Computed: 'efficiencyRating' → ppg + apg + rpg
//              'salaryLabel' → "$29M" style (divide by 1M, round to Int)
//              'fullLabel' → "#30 Stephen Curry — 29.4 PPG — $51M"
//    didSet on salary: print a log when salary changes
//    Method: 'isMaxPlayer() -> Bool' → salary >= 40_000_000
//    Method: 'statComparison(to other: PlayerCard) -> String'
//            returns "[name] has higher efficiency" or "[other.name] has higher efficiency"
//            or "Equal efficiency" if tied
//
// 2. GAME STRUCT
//    Define a struct 'Game' with:
//    Stored: homeTeam, awayTeam, homeScore (Int = 0), awayScore (Int = 0),
//            quarter (Int = 1), isOver (Bool = false)
//    Computed: 'leader -> String' → leading team name, or "Tied" if equal
//              'scoreline -> String' → "Warriors 108 — Lakers 101 (Q4)"
//    Mutating: 'score(team: String, points: Int)'
//              increments the correct team's score, prints the updated scoreline
//    Mutating: 'endGame()' → sets isOver = true, prints final score + winner
//    Method: 'isPlayoff() -> Bool' → returns true if abs(homeScore - awayScore) <= 10
//            at end of game (close game = playoff intensity)
//
// 3. ROSTER STRUCT
//    Define a struct 'Roster' with:
//    Stored: teamName, players ([PlayerCard] = [])
//    Computed: 'averagePPG -> Double' → average pointsPerGame across all players
//              'highestPaid -> PlayerCard?' → player with highest salary (nil if empty)
//    Mutating: 'addPlayer(_ player: PlayerCard)' → appends and prints confirmation
//    Mutating: 'removePlayer(named name: String)' → removes if found, logs result
//    Method: 'printRoster()' → prints each player's fullLabel numbered
//    Lazy: 'rosterSummary: String' → "[teamName] — [count] players — avg PPG: [X.X]"
//          computed once on first access
//
// 4. VALUE TYPE DEMO
//    Create a Warriors roster, add 3 players
//    Copy it to a 'tradeScenario' variable
//    Remove a player from tradeScenario
//    Print both rosters — confirm Warriors roster is unchanged
//    Write a comment explaining what you observed about value types
//
// 5. LIVE GAME SIMULATION
//    Create a Game: Warriors vs Lakers
//    Simulate at least 8 scoring plays using game.score(team:points:)
//    End the game with endGame()
//    Print whether it was a playoff-intensity game
//
// ── INPUT DATA ───────────────────────────────────────────────

let rosterData: [(name: String, number: Int, position: String, ppg: Double, apg: Double, rpg: Double, salary: Double)] = [
    ("Stephen Curry",   30, "PG", 29.4, 6.1, 5.1, 51_915_615),
    ("Klay Thompson",   11, "SG", 17.9, 2.4, 3.3, 43_219_440),
    ("Draymond Green",  23, "PF",  8.5, 6.8, 7.2, 22_315_890),
    ("Andrew Wiggins",  22, "SF", 17.1, 2.5, 5.0, 24_000_000),
    ("Kevon Looney",     5,  "C",  6.0, 2.3, 8.1,  7_500_000)
]

// ── RULES ────────────────────────────────────────────────────
// → No hardcoded values — build players from rosterData above
// → Use computed properties for anything derivable
// → Use didSet for the salary change log
// → Use lazy for rosterSummary
// → Use mutating for anything that modifies state
// → Demonstrate value type behavior explicitly in requirement 4
//
// ── HINTS ────────────────────────────────────────────────────
// → Requirement 3 averagePPG: use reduce on players array
// → Requirement 3 highestPaid: use max(by:) on players, returns Optional
// → Requirement 4: copy the roster BEFORE removing the player
// → Requirement 5: call score(team:points:) with the team name string
//
// ── YOUR CODE BELOW ──────────────────────────────────────────




// ============================================================
// END OF CHAPTER 8
// ============================================================
//
// When you're done:
// ✅ All YOUR TURN sections compile and print expected output
// ✅ Challenge covers all 5 requirements
// ✅ Stored, computed, observers, lazy, methods, mutating, init,
//    and value type behavior all demonstrated
//
// Next up: Chapter 9 — Classes
// Classes share state — two variables can point to the same object.
// You'll feel the contrast with structs immediately.
// Inheritance, override, and deinit are coming.
// ============================================================


*/