

# Index

> "Lean 4 has a type system roughly as strong as grain alcohol."

## Symbols and operators

* [`-- a`](#---a-comment) (comment)
* [`a : α`](#a--α-type-declaration) (type declaration)
* [`a := b`](#a--b-definition) (definition)
* [`a = b`](#a--b-equality) (equality)
* [`α → β`](#α-→-β-function-arrow) (function arrow)

## Keywords
* [`def`](#def)
* [`notation`](#notation)

## #Commands
* [`#check`](#check)
* [`#check_failure`](#check_failure)
* [`#eval`](#eval)

# Symbols and operators

## `-- a` (comment)
Declares an inline comment.


##### Example
```lean
-- This a comment.
```

## `a : α` (type declaration)

Indicates the type of a one or more terms.

##### Example
We define a constant symbol `x` to have type `Nat` with value `0`.
```lean
def x : Nat := 0
```

##### Example
We define a function `multiply` which takes two integers and returns their
product:
```lean
def multiply (a b : Int) : Int := a * b
#eval multiply 7 (-8)     ■ -56
```

## `a := b` (definition)

Defines the value of an identifier.

##### Example

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

##### Example

We define an identity function on natural numbers, and observe that the type of
our function (displayed when we use the transitory command `#check` in our
editor) is `Nat → Nat`:

```lean
def identity (x : Nat) : Nat := x
#check identity     ■ identity : Nat → Nat
```

## `a.b` (field accessor)

Accesses the field `b` of the term `a`.

## `,` (comma)

Separates:

1. Constructors within an inductive type declaration.
2. The fields of a structure (e.g. in `{x := 3, y := 6}`).
3. The elements of a list (e.g. in `[1, 2, 3]`).

## `a => b` (maps to)

Indicates the term returned by a lambda function given its arguments. Can be
read in English as "maps to", and is in most cases synonymous with the
mathematical notation $\mapsto$.

Can be used in pattern-matching blocks.

When used with the `notation` keyword, makes the string literal on the
left-hand side an alias for the term on the right-hand side. See the second
example.

#### TODO: Add example with longer telescope.

##### Example
We construct a lambda function on the natural numbers that adds `5` to its
argument:
```lean
λ (x : Nat) => x + 5
```
In English, we could say that this lambda function _maps the natural number
parameter `x` to `x + 5`_.

We could write this in mathematical notation as $x \mapsto x + 5$.

##### Example
We declare nice notation for the integers:
```lean
notation "ℤ" => Int
def identity (x : ℤ) : ℤ := x
#check identity
```

## `s!"a{b}"`

Constructs an interpolated string. See https://leanprover.github.io/lean4/doc/stringinterp.html.

##### Example
We construct a string containing an integer.
```lean
def eight := 8
#eval s!"The cube of two is {eight}"    ■ "The cube of two is 8"
```

## `;`

Separates tactics in a `by`-statement.

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

## `a : @& b`

The symbol in in question is `@&`.

Indicates that an FFI function parameter is a "borrowed reference". This can be
thought of as forcing the parameter to be 'passed-by-reference' instead of
'passed-by-value'. Ignored on pure Lean 4 functions, according to Sebastian.


# Infoview

## `⊢`

Indicates the goal (e.g. the claim when proving a theorem).

## `?a`

Indicates that the Lean does not have enough information to infer the type of
`a`.


# Enclosing glyphs

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

##### Example

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

##### Example
We declare the symbol/identifier `x` to be a term of type `Nat` whose value is
`1`:
```lean
def x : Nat := 1
```

## `universe`
## `fun`
## `λ`
Alias for the keyword `fun`.
## `if`
## `then`
## `else`
## `let`
## `variable`
## `section`
## `end`
## `namespace`
## `open`
## `axiom`
## `theorem`
## `show`
## `from`

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

##### Example
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

##### Example

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
## `protected`
## `hiding`
## `renaming`
## `export`
## `infixl`
## `infix`
## `infixr`
## `prefix`
## `postfix`
## `set_option`
## `inductive`
## `where`
## `deriving`
## `extern`
An attribute declaring a definition as being defined via the Lean C FFI
(foreign function interface).

# Tactics

## `intro`
## `have`
Introduces an auxiliary subgoal in a proof.
## `calc`
Starts a calculational proof.
## `sorry`

# #Commands

> "In Lean, auxiliary commands that query the system for information typically
begin with the hash (#) symbol."

- Theorem Proving in Lean 4

## `#check`

Asks Lean to report the type of its argument inside our editor/IDE.

##### Example
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



# Operators

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


