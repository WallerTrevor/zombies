# Overwatch Workshop Development Rules
==============================================================================================================================================================================
# This is an Early version of this AGENTS file. it is purely AI generated content so far, though, largely seems true, just not specific enough to general workshop querks. 
==============================================================================================================================================================================


## 1. Language Identity


This project is written for the Overwatch Workshop.

Overwatch Workshop is a domain-specific language (DSL), not a
general-purpose programming language such as Python, C#, C++, or
JavaScript.

The source code may use a higher-level language or compiler such as
OSTW/OverPy, but the final target is the Overwatch Workshop runtime.

Do not assume that constructs behave like their equivalents in
general-purpose programming languages.

When uncertain, consult the Workshop/OSTW/OverPy documentation and
existing code rather than applying assumptions from another language.

---

## 2. Compilation Model

The source code is compiled/transformed into Overwatch Workshop code.

There may be significant differences between:

    source code
        ↓
    compiler / transpiler
        ↓
    Workshop rules
        ↓
    Overwatch runtime

A construct that looks like ordinary programming language syntax
does not necessarily have the same semantics as it would in Python,
C#, C++, or JavaScript.

Consider both:
- the semantics of the source language
- the semantics and limitations of the resulting Workshop code

---

## 3. Workshop Is Not a Conventional Runtime

Workshop has a constrained execution model.

Do not assume the availability of:
- arbitrary memory allocation
- arbitrary data structures
- conventional pointers/references
- threads
- normal operating-system APIs
- unrestricted recursion
- conventional I/O
- filesystem access
- arbitrary background processes
- standard library functionality from other languages

Workshop values, arrays, variables, actions, conditions, rules,
events, and subroutines have their own semantics.

---

## 4. Rules Are Not Functions

Workshop rules are event-driven.

A rule generally consists of:

    Event
    Conditions
    Actions

Do not automatically interpret every rule as a conventional
function.

The event determines when the rule executes.

Conditions determine whether the rule executes.

Actions modify game state or perform operations.

Execution behavior is therefore strongly dependent on the Workshop
event system.

---

## 5. Subroutines

Subroutines are reusable Workshop logic, but should not automatically
be treated as equivalent to ordinary functions in C#, Python, etc.

Consider:
- how the subroutine is invoked
- what values it can access
- how player context is handled
- whether state is stored elsewhere
- the generated Workshop representation
- element cost

---

## 6. Variables and State

Workshop variables are persistent game state, not merely local
variables in the conventional programming-language sense.

Distinguish between:

- Global variables
- Player variables
- Other Workshop-specific state

Before introducing new state, determine whether existing variables
already contain the required information.

Avoid duplicating state unnecessarily.

---

## 7. Player Context

Workshop has player-specific context that affects the meaning of
many values and actions.

Do not assume that a value referring to a player behaves like an
ordinary object reference.

Pay attention to:
- Event Player
- Attacker
- Victim
- Other Player
- Player variables
- Team context
- Global context

Always determine which player an expression is operating on.

---

## 8. Arrays and Data

Workshop arrays have semantics that differ from arrays/lists in
general-purpose languages.

Do not assume:
- arbitrary nested structures behave identically to Python lists
- mutation behaves identically to C# collections
- indexing has identical semantics
- array operations have identical performance characteristics

Check the Workshop semantics of an operation before relying on it.

---

## 9. Expressions Are Not Always Ordinary Computation

Workshop expressions may represent game-state queries, values,
operations, or deferred/runtime evaluations rather than simple
calculations.

Understand what an expression evaluates to and when it is evaluated.

Do not assume that syntax which resembles a normal programming
language expression has identical evaluation semantics.

---

## 10. Workshop-Specific Limits Matter

Workshop development is constrained by engine limits.

When modifying code, consider:

- Workshop element count
- Variable limits
- Rule/action limits
- Runtime performance
- Array size
- Update frequency
- Number of active rules
- Number of operations performed per tick

A solution that is elegant in a general-purpose language may be
unacceptable in Workshop because of its generated element cost or
runtime behavior.

---

## 11. Element Cost Is Part of Program Design

Generated Workshop size is an important engineering constraint.

Do not assume that fewer source-code lines means fewer Workshop
elements.

Likewise, do not assume that readable source code has low generated
cost.

When optimizing Workshop code, consider the compiled/generated
representation.

Prefer existing compression, reuse, precomputation, and
data-sharing systems when available.

---

## 12. Runtime vs Compile-Time

Workshop projects often benefit from moving work from runtime into
generation/compilation/precomputation.

When designing a system, consider whether information can be:

- precomputed
- compressed
- generated
- encoded
- shared
- looked up

rather than repeatedly calculated during gameplay.

---

## 13. Do Not "Translate" Into Conventional Programming Patterns

Do not automatically convert Workshop logic into patterns such as:

    class → object-oriented hierarchy
    function → conventional function
    loop → CPU loop
    variable → local memory
    array → standard collection
    event → callback
    rule → function

These analogies can be useful for understanding, but they are not
guaranteed to preserve Workshop semantics or performance.

Use Workshop-native patterns where appropriate.

---

## 14. Existing Workshop Code Is Evidence

When modifying an unfamiliar Workshop system:

1. Inspect existing implementations.
2. Find similar Workshop patterns in the project.
3. Determine why the existing implementation works.
4. Check generated/compiled output when necessary.
5. Only then introduce a new pattern.

Do not replace Workshop-specific code with a familiar
general-purpose-language pattern merely because it looks cleaner.

---

## 15. Compiler/DSL Differences

If this project uses OSTW, OverPy, or another Workshop-oriented DSL,
the DSL's syntax and semantics are not necessarily identical to the
underlying Workshop syntax.

The compiler may:
- transform expressions
- expand abstractions
- generate multiple Workshop actions
- optimize code
- introduce temporary values
- change how structures are represented

Therefore, reason about the actual compiler being used.

---

## 16. Documentation Priority

When determining how something works, use this priority:

1. The project's existing implementation
2. The DSL/compiler documentation
3. Official Overwatch Workshop documentation
4. Generated Workshop output
5. General programming-language knowledge

General programming knowledge should not override Workshop-specific
semantics.