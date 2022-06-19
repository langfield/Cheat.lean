# Cheat.lean

> Lean 4 has a type system roughly as strong as grain alcohol.

`Cheat.lean` is an early **WIP** field guide to the syntax, symbols, operators,
and commands of the Lean 4 functional programming language. It is designed to
be as friendly as possible to users unfamiliar with purely functional
programming or type theory.

This guide will not teach you to how to program in Lean 4. It's sole purpose is
to be an answer to the question:

> What does this notation do?

This guide is currently very disorganized, and may have some imprecise or
incorrect information, since I am writing it as I learn Lean 4 from scratch.

**Internal note.** It may prove better to put each operator/symbol/command in
its own `.lean` file, and generate markdown from each of these, and then
concatenate them into a `README`. This could be achieved with a fairly simple
`Makefile`.


## Symbols and operators

* [`-- a`](#---a-comment) (comment)
* [`a : α`](#a--α-type-declaration) (type declaration)
* [`a := b`](#a--b-definition) (definition)
* [`a = b`](#a--b-equality) (equality)
* [`α → β`](#α-→-β-function-arrow) (function arrow)
* [`s!"a{b}"`](#sab) (string interpolation)
* [`a.b`](#ab-dot-notation) (dot notation)
* [`a => b`](#ab-maps-to) (dot notation)
* `()` ([unit value](#-unit-value))
* [`. <tactic>`](#bullet-notation) (bullet notation)


## Commands
* [`def`](#def)
* [`let`](#let)
* [`notation`]
* [`theorem`]
* [`class`]
* [`structure`]
* [`instance`]
* [`set_option`]
* [`example`]
* [`inductive`]
* [`coinductive`]
* [`axiom`]
* [`constant`]
* [`partial`]
* [`unsafe`]
* [`private`]
* [`protected`]
* [`if`]
* [`then`]
* [`else`]
* [`universe`]
* [`variable`]
* [`variables`]
* [`import`]
* [`open`]
* [`export`]
* [`theory`]
* [`prelude`]
* [`renaming`]
* [`hiding`]
* [`exposing`]
* [`calc`]
* [`match`]
* [`with`]
* [`do`]
* [`by`]
* [`extends`]
* [`for`]
* [`in`]
* [`unless`]
* [`try`]
* [`catch`]
* [`finally`]
* [`mutual`]
* [`mut`]
* [`return`]
* [`continue`]
* [`break`]
* [`where`]
* [`rec`]
* [`syntax`]
* [`macro_rules`]
* [`macro`]
* [`deriving`]
* [`fun`]
* [`section`]
* [`namespace`]
* [`end`]
* [`infix`]
* [`infixl`]
* [`infixr`]
* [`postfix`]
* [`prefix`]
* [`notation`]
* [`abbrev`]


## #Commands

> In Lean, auxiliary commands that query the system for information typically
begin with the hash (#) symbol.

\- Theorem Proving in Lean 4

* [`#check`](#check)
* [`#check_failure`](#check_failure)
* [`#eval`](#eval)


## Attributes

> Objects in Lean can bear attributes, which are tags that are associated to them, sometimes with additional
data. You can assign an attribute foo to a object by preceding its declaration with the annotation attribute
[foo] or, more concisely, @[foo].

\- The Lean Reference Manual, Release 3.3.0, §5.4, p. 40

* [`[simp]`]
* [`[inline]`]
* [`[reducible]`]
* [`[irreducible]`]
* [`[specialize]`]


## Types

* [`Unit`](#Unit)











# Symbols and operators

## `-- a` (comment)
Declares an inline comment.


#### Example
```lean
-- This a comment.
```

## `a : α` (type declaration)

Indicates the type of a one or more terms.

#### Example
We define a constant symbol `x` to have type `Nat` with value `0`.
```lean
def x : Nat := 0
```

#### Example
We define a function `multiply` which takes two integers and returns their
product:
```lean
def multiply (a b : Int) : Int := a * b
#eval multiply 7 (-8)     ■ -56
```

## `a := b` (definition)

Defines the value of an identifier.

#### Example

We declare the symbol/identifier `x` to be a term of type `Nat` whose value is
`0`:
```lean
def x : Nat := 0
```

## `a = b` (equality)

Constructs a proposition (`Prop`) that asserts that the left-hand side is equal
(in the mathematical sense) to the right hand side.


## `α → β` (function arrow)
###### Shortcuts: `\to, \r, \imp`
###### ASCII: `->`

Constructs a function type from the type `a` to the type `b`.

#### Example

We define an identity function on natural numbers, and observe that the type of
our function (displayed when we use the transitory command `#check` in our
editor) is `Nat → Nat`:

```lean
def identity (x : Nat) : Nat := x
#check identity     ■ identity : Nat → Nat
```

## `a.b` (dot notation)

Accesses the field `b` of the term `a`.

#### Example

We declare a structure, construct an instance of that structure, and access one
of its fields:

```lean
structure CarState where
  wheels : Nat
  doors : Nat
  name : String

def jeep := CarState.mk 4 2 "Larry"
#eval jeep.name
```

## `a => b` (maps to)

Indicates the term returned by a lambda function given its arguments. Can be
read in English as "maps to", and is in most cases synonymous with the
mathematical notation $\mapsto$.

Can be used in pattern-matching blocks.

When used with the `notation` keyword, makes the string literal on the
left-hand side an alias for the term on the right-hand side. See the second
example.

#### Example
We construct a lambda function on the natural numbers that adds `5` to its
argument:
```lean
λ (x : Nat) => x + 5
```
In English, we could say that this lambda function _maps the natural number
parameter `x` to `x + 5`_.

We could write this in mathematical notation as $x \mapsto x + 5$.

#### Example
We declare nice notation for the integers:
```lean
notation "ℤ" => Int
def identity (x : ℤ) : ℤ := x
#check identity
```

## `s!"a{b}"` (string interpolation)

Constructs an interpolated string. In plain English, this allows you to embed
the string representation of a term inside a string. See
https://leanprover.github.io/lean4/doc/stringinterp.html.

#### Example
We construct a string containing an integer.
```lean
def eight := 8
#eval s!"The cube of two is {eight}"    ■ "The cube of two is 8"
```

## `()` (unit value)

Constructs a term of type [`Unit`](#Unit). Used mainly at the end of a `do`
block which exists purely to handle side-effects, e.g. in a function of type
`IO Unit`.

#### Example

Taken from the Lean 4 manual:
```lean
def isGreaterThan0 (x : Nat) : IO Bool := do
  IO.println s!"value: {x}"
  return x > 0

def f (x : Nat) : IO Unit := do
  let c ← isGreaterThan0 x
  if c then
    IO.println s!"{x} is greater than 0"
  else
    pure ()

#eval f 10
-- value: 10
-- 10 is greater than 0
```
Note that our last action is `pure ()`, which is done to satisfy the return
type of `f`. It makes the `else` branch essentially a no-op.

## `. <tactic>` (bullet notation)

Increases indentation level for a subgoal during tactic mode. TPIL says that
this is for "structuring" the proof. The dot is not an operator, and does not
perform any transformation on the tactic(s) that follow it. Removing the
dot/bullet as well as the identation will yield an identical proof.

## `_`

## `@a`

Makes all the arguments to `a` (e.g. theorem or definition) explicit.

## `∀`

The "for all" quantifier.

## `∃`

The "exists" quantifier.

## `::`

The cons operator.

## `(· + b)`

Creates a function from an arbitrary infix operator (`+` is used above as an
example). Then `·` serves as a placeholder. The notation is activated with
parentheses.
## `..`
Provides missing explicit arguments as `_`.

## `|`
Separates constructors within an inductive type declaration.

## `(a : @& α)`

The symbol in in question is `@&`.

Indicates that an FFI function parameter is a "borrowed reference". This can be
thought of as forcing the parameter to be 'passed-by-reference' instead of
'passed-by-value'.

Ignored on pure Lean 4 functions, according to Sebastian.

## `/- a -/`
Declares a multiline comment.
## `/-- a -/`
Declares a multiline comment.
## `(a)`

## `@[a] b`

Assigns attribute `a` to the object `b`. This is shorthand for `attribute [a] b`.

Can also be used during a declaration, e.g. in `@[a] def b := c`.

## `⟨a1, a2, ..., an⟩`

###### Shortcuts: `\<, \>`

Constructs an inductive type with arguments `a1, a2, ..., an` in cases where
Lean can infer the type of the expression.

#### Example

We define `p` to be an ordered pair where the first element is a natural number
and the second element is an integer. Our ordered pair is represented in Lean
by a product, and since we explicitly give the type of `p` as `Nat × Int`, we're
able to use the `⟨⟩` notation.
```lean
def p : Nat × Int := ⟨1, 2⟩
```


## `{a}`

## `"a"`

## `[a, b, c]`
Groups hypotheses to be used as an argument to a tactic.

## `‹a›`
###### Shortcuts: `\f<, \f>`
Fills in the proof of the proposition `a : Prop`.

## `⦃a⦄`
Declares `a` as a weak implicit argument.


## `|>`

The forward pipeline operator.

Applies the function on the right-hand side to the argument on the left-hand
side in such a way that functions can be chained/composed in a nice-looking
way.

## `<|`

The backward pipeline operator.

Applies the function on the left-hand side to the argument on the right-hand
side in such a way that functions can be chained/composed in a nice-looking
way.

## `×`
## `Σ`

## `∧`
###### ASCII: `/\`
###### Shortcuts: `\and`

## `∨`
###### ASCII: `\/`
###### Shortcuts: `\or`

## `↔`
###### ASCII: `<->`
###### Shortcuts: `\iff, \lr`

## `¬`
###### Shortcuts: `\not, \neg`

Negates a term of type `Bool`.


# Keywords

## `def`
#### Syntax: `def a := c`
#### Syntax: `def a : b := c`
Defines `a` to denote `c`, which should have type `b`. In other words, this
gives the name `a` to the term `c`.

#### Syntax: `def a (a₁ : α₁) (a₂ : α₂) ... (aₙ : αₙ) : b := c`

Defines `a` to denote `c`, which should have type `b`, and take $n$ arguments
corresponding to the parameters `a₁, a₂, ..., aₙ`. The notation `(aᵢ : αᵢ)`
indicates that the parameter `aᵢ` has type `αᵢ`. This list of parameters
together with their types is called a **context**.

#### Example
We declare the symbol/identifier `x` to be a term of type `Nat` whose value is
`1`:
```lean
def x : Nat := 1
```

## `example`
#### Syntax: `example : a := b`
Elaborates `b` and checks that it has type `a`, without adding it to the
environment.

This is basically a way of declaring an anonymous definition or theorem. It
exists because it is sometimes useful to be able to simulate a definition or
theorem without naming it or adding it to the environment.

## `by`
Proves a proposition by a tactic.
## `match`
## `with`

#### Syntax: `{ a with b := c}`

Returns a copy of the record `a` with the `b` field's value replaced with `c`.

## `notation`

Declares new notation for a term in the form of a string literal.

#### Example
We declare nice notation for the integers:
```lean
notation "ℤ" => Int
def identity (x : ℤ) : ℤ := x
#check identity
```

## `import`


## `attribute`

#### Syntax: `attribute [a] b`
#### Syntax: `attribute [a] <declaration> b := c`

## `class`

Define a type class.

#### Example

```lean
class Add (a : Type) where
  add : a -> a -> a
```

## `instance`

Registers an instance of a type class.

Assigns attribute `a` to the object `b`.

## `local`

Causes commands to only have effect until the current `section` or `namespace`
is closed, or until the end of the file.

## `let`

#### Syntax: `let x ← action1; action2`

Simulates a local variable definition within a `do` block. Defines a variable
in a local scope (e.g. inside a function). Note that the semicolon `;` is
semantically equivalent to a newline, so another way we could write this is:
```lean
let x ← action1
action2
```
and when there are several lines after the line containing `let x ← action1`,
all of them together constitute `action2`, so `x` remains "in-scope" for all
subsequent lines.

**Note.** The `do` notation is an embedded domain-specific language used to
write effectful code. See the [Lean 4 manual](https://leanprover.github.io/lean4/doc/do.html) for details.

## `inductive`

Defines an inductive type.

#### Example

We define an inductive type called `Weekday`:

```lean
inductive Weekday where
  | sunday : Weekday
  | monday : Weekday
  | tuesday : Weekday
  | wednesday : Weekday
  | thursday : Weekday
  | friday : Weekday
  | saturday : Weekday
```

The names after the `|` are called constructors or elements. We are defining
them in this block, i.e. they need not be predefined elsewhere.


## `where`

Defines the constructors of an `inductive` type, `structure`, `class`,
`instance`, or the return type of a `def`.

The syntax for these use cases are:

* `inductive A (a₁ : α₁) ... (aₙ : αₙ) where`
* `structure A (a₁ : α₁) ... (aₙ : αₙ) where`
* `structure A (a₁ : α₁) ... (aₙ : αₙ) extends B₁, ..., Bₙ where`
* `class A (a₁ : α₁) ... (aₙ : αₙ) : β where`
* `instance : A₁ ... Aₙ where`
* `def a (b₁ : β₁) ... (bₙ : βₙ) : γ where`


## `deriving`

Instructs Lean to auto-generate an instance of a type class.

## `extern`
An attribute declaring a definition as being defined via the Lean C FFI
(foreign function interface).

## `structure`

Defines an inductive type along with all of its projection functions and
introduces a namespace with the same name.

# Tactics

## `intro`

## `have`

Introduces an auxiliary subgoal in a proof.

## `calc`

Starts a calculational proof.

## `sorry`

# #Commands

## `#check`

Asks Lean to report the type of its argument inside our editor/IDE.

#### Example
We define a function and then `#check` it in our editor:
```lean
def identity (x : Nat) : Nat := x
#check identity     ■ identity : Nat → Nat
```
The square denotes the beginning of the `#check` output.

## `#check_failure`

Only succeeds when the given term is not type-correct.

## `#eval`

Asks Lean to evaluate the given expression.

## `#reduce`
## `#print`
Prints information about an identifier.


# Infoview

## `⊢`

Indicates the goal (e.g. the claim when proving a theorem).

## `?a`

Indicates that the Lean does not have enough information to infer the type of
`a`.


# Types

## `Unit`

> A unit type is a type that allows only one value.

In Lean 4, the `Unit` type is often seen in the type `IO Unit` of functions
with the sole purpose of causing a side effect.

See [wikipedia.org/wiki/Unit_type](https://en.wikipedia.org/wiki/Unit_type).


# Miscellaneous

## `a₁`

An identifier containing a subscript. Unicode subscripts do not carry any
special syntactic meaning. They are simply another glyph that can be included
in an identifier/variable name.

# Glossary

### Command
Lean 4 commands look like `#print`, `#check`, `#eval`, etc. They tell the
compiler to perform a certain action.

### Term

## Notes

* It may be necessary to use different dummy symbol sets for different terms.
  For example, `a` in `def a := b` must be an identifier, but we use `a`
  elsewhere as an arbitrary term (e.g. in `a = b`. One option is to use
  lowercase letters for identifiers, names, variables, and uppercase letters
  for terms. As is common in the Lean 4 docs, greek letter could be used for
  types. So we would write an arbitrary type declaration as `a : α`. The
  distinction between terms and types is crucial (even though, technically, all
  types are terms, since they have type `Type u`), especially for beginners.
  However, the distinction between which operators and keywords are applicable
  to identifiers and which are applicable to arbitrary terms may be clear
  enough from the examples given.

* In anchors (links to markdown subsections of the form `#token1-token2`), the
  following symbols are filtered out, i.e. mapped to the empty string:

  1. `:`
  2. `=`
  3. `(`
  4. `)`

## How to use this field guide
