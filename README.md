# Index

* [`--`](#--) (comments)
* [`:`](#https://github.com/langfield/Cheat.lean/blob/master/README.md#a--b) (type declaration)
* [`:=`](#:=) (value definition)

# Syntax

## `--`
Declares an inline comment.


##### Example
```lean
-- This a comment.
```

## `:`

Indicates the type of a term.

##### Example
We declare a constant symbol `x` to have type `Nat` with value `0`.
```lean
def x : Nat := 0
```

## `:=`

Defines the value of an identifier.

##### Example

We declare the symbol/identifier `x` to be a term of type `Nat` whose value is
`0`:
```lean
def x : Nat := 0
```

## `=`

Constructs a proposition (`Prop`) that asserts that the left-hand side is equal
(in the mathematical sense) to the right hand side.


## `->`
## `→`
###### Shortcuts: `\to, \r, \imp`
## `.`
## `,`

Separates:

1. Constructors within an inductive type declaration.
2. The fields of a structure (e.g. in `{x := 3, y := 6}`).
3. The elements of a list (e.g. in `[1, 2, 3]`).
## `=>`

Indicates the expression yielded by a lambda function given its arguments. Can
be read in English as "maps to", and is in most cases synonymous with the
mathematical notation $\mapsto$.

##### Example
We declare a lambda function that adds `5` to its argument:
```lean
λ (x : Nat) => x + 5
```
In English, we could say that this lambda function _maps the natural number
parameter `x` to `x + 5`_.

We could write this in mathematical notation as $x \mapsto x + 5$.

## `;`
## `_`
## `@`
Makes all the arguments to a theorem or definition explicit.
## `∀`
## `∃`
## `::`
## `(· + b)`
Creates a function from an arbitrary infix operator (`+` is used above as an
example). Then `·` serves as a placeholder. The notation is activated with
parentheses.
## `..`
Provides missing explicit arguments as `_`.
## `|`
Separates constructors within an inductive type declaration.


# Infoview

## `?a`

Indicates that the Lean does not have enough information to infer the type of
`a`.


# Enclosing glyphs

## `/- a -/`
Declares a multiline comment.
## `/-- a -/`
Declares a multiline comment.
## `(a)`
## `⟨a, b⟩`
Constructs an anonymous product term.
## `⟨a, b, c⟩`
## `{a}`
## `"a"`
## `[a, b, c]`
Groups hypotheses to be used as an argument to a tactic.
## `‹a›`
###### Shortcut(s): `\f<, \f>`
Fills in the proof of the proposition `a : Prop`.
## `⦃a⦄`
Declares `a` as a weak implicit argument.

# Keywords

## `def`
Declares new constant symbols into the working environment.

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
## `by`
Proves a proposition by a tactic.
## `match`
## `with`
## `notation`
## `import`
## `attribute`
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

## `#check`
## `#eval`
## `#reduce`
## `#print`
Prints information about an identifier.


# Operators

## `&&`
## `||`
## `+`
## `*`
## `×`
## `Σ`
## `¬`
## `/\`
## `∧`
###### Shortcut(s): `\and`
## `\/`
## `∨`
###### Shortcut(s): `\or`
## `<->`
## `↔`
###### Shortcut(s): `\iff, \lr`
## `¬`
###### Shortcut(s): `\not, \neg`


# Miscellaneous

## `a₁`

An identifier containing a subscript. Unicode subscripts do not carry any
special syntactic meaning. They are simply another glyph that can be included
in an identifier/variable name.
