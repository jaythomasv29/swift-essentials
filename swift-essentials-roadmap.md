Swift Essentials — full checklist
══════════════════════════════════════════════════════

CHAPTER 1 — The basics
──────────────────────
✅ Types — Int, Float, Double, String, Bool
✅ var vs let
✅ Type inference
✅ Type conversion (Int → Double, truncation vs rounding)
⬜ String methods — .count, .uppercased(), .contains(), .hasPrefix()
⬜ Operators — +, -, *, /, %
⬜ Compound assignment — +=, -=, *=, /=
⬜ Comparison operators — ==, !=, <, >, <=, >=
⬜ Logical operators — &&, ||, !
⬜ Ranges — 1...5 (closed), 1..<5 (half-open)

CHAPTER 2 — Control flow
─────────────────────────
⬜ if / else if / else
⬜ Ternary operator — condition ? a : b
⬜ switch — basic
⬜ switch — value binding and where clauses
⬜ switch — matching ranges and tuples
⬜ guard — early exit pattern

CHAPTER 3 — Loops
──────────────────
⬜ for-in loop — basic
⬜ for-in with ranges
⬜ for-in with index — enumerated()
⬜ while loop
⬜ repeat-while
⬜ break and continue

CHAPTER 4 — Collections
────────────────────────
⬜ Arrays — declaration, indexing, mutating
⬜ Arrays — common methods (.append, .remove, .contains, .sorted)
⬜ Sets — what makes them different from arrays
⬜ Sets — .insert, .contains, .union, .intersection
⬜ Dictionaries — declaration, reading, writing
⬜ Dictionaries — iterating, .keys, .values, default values
⬜ Tuples — grouping values without a type
⬜ Collection methods — map, filter, reduce, compactMap

CHAPTER 5 — Optionals
──────────────────────
⬜ What is nil and why Swift handles it differently
⬜ Declaring optionals with ?
⬜ Force unwrapping with ! (and why to avoid it)
⬜ if let — safe unwrapping
⬜ guard let — safe unwrapping with early exit
⬜ Nil coalescing — ?? default value
⬜ Optional chaining — a?.b?.c
⬜ Implicitly unwrapped optionals — when and why

CHAPTER 6 — Functions
──────────────────────
⬜ Defining and calling functions
⬜ Parameters and return types
⬜ Argument labels vs parameter names
⬜ Default parameter values
⬜ Multiple return values with tuples
⬜ Functions as values — passing functions around
⬜ @discardableResult

CHAPTER 7 — Closures
─────────────────────
⬜ What is a closure
⬜ Closure syntax — full form
⬜ Trailing closure syntax
⬜ Shorthand argument names — $0, $1
⬜ Capturing values
⬜ @escaping closures
⬜ Closures vs functions — when to use each

CHAPTER 8 — Structs
────────────────────
⬜ Defining a struct
⬜ Properties — stored and computed
⬜ Methods on structs
⬜ Mutating methods
⬜ Memberwise initializer
⬜ Value type behavior — copies, not references

CHAPTER 9 — Classes
────────────────────
⬜ Defining a class
⬜ Reference type behavior — shared instances
⬜ Inheritance and override
⬜ Designated vs convenience initializers
⬜ deinit
⬜ Struct vs class — the decision

CHAPTER 10 — Enums
───────────────────
⬜ Basic enums
⬜ Raw values — String, Int
⬜ Associated values
⬜ switch over enums — exhaustive matching
⬜ Enums with methods
⬜ Modeling state with enums

CHAPTER 11 — Protocols
───────────────────────
⬜ Defining a protocol
⬜ Conforming to a protocol
⬜ Protocol as a type
⬜ Built-in protocols — Equatable, Hashable, Comparable, Identifiable
⬜ Codable — encoding and
