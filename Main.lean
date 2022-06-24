notation "ℤ" => Int

section
  variable (x y : Nat)

  def double := x + x

  #check double y
  #check double (2 * x)

  attribute [local simp] Nat.add_assoc Nat.add_comm Nat.add_left_comm

  theorem t1 : double (x + y) = double x + double y := by
    simp [double]

  #check t1 y
  #check t1 (2 * x)

  theorem t2 : double (x * y) = double x * y := by
    simp [double, Nat.add_mul]
end

theorem eight_equals_twice_four : 8 = 2 * 4 := by
  simp

def twice (f : Nat → Nat) (a : Nat) :=
  f (f a)

def foo (x : Nat) := x + 2
def goo (x : Nat) : Nat := x + 2
#check foo
#check goo

-- The `where` syntax.

structure IntWithParity where
  value : ℤ
  even  : Bool
  deriving Repr

def increment_int_with_parity (x : IntWithParity) : IntWithParity where
  value := x.value + 1
  even  := ¬x.even

#eval increment_int_with_parity (IntWithParity.mk 0 true)
#eval increment_int_with_parity <| increment_int_with_parity <| (IntWithParity.mk 0 true)

universe u

-- Playing with records.
structure Point (α : Type u) where
  x : α
  y : α
  deriving Repr

#check Point.mk
#check Point.mk 0 0

def eight := 8
#eval s!"The cube of two is {eight}"

def p₁ : Point Int := Point.mk 0 0

-- When can we use `let`?
def fn :=
  let a := 2
  a
-- let a := 0 (This doesn't work, because `let` must be in a local scope?)

#eval fn

#check p₁
#eval p₁

-- Checking multiple things at the same time (you can't).
#check 0 -- This works!
-- #check 0 0 (This doesn't work.)

-- Can we use string literals on the left-hand side of a lambda `=>` definition? No.
#check_failure λ "a" => "a"

-- Pipelining.
def add1 x := x + 1
def times2 x := x * 2

#eval times2 (add1 100)
#eval 100 |> add1 |> times2
#eval times2 <| add1 <| 100

-- Two different ways of defining a function.
def identity : Nat → Nat := λ x => x
def identity2 (x : Nat) : Nat := x

#check identity

#eval identity 5
#eval identity2 6

-- Multiple parameters of the same type declared within the same declaration.

def add_two_naturals (a b : Nat) : Nat := a + b

#check add_two_naturals
#eval add_two_naturals 4 5

def multiply (a b : Int) : Int := a * b
#eval multiply 7 (-8)

-- Array literal declaration and subscripts.
#eval #['a', 'b', 'c'][4]
#eval #['b', 'c', 'd'][4]
#eval #[1, 2, 3][4]
#eval #["a", "aa", "aaa"][4]

def add_two_naturals_with_shorthand_notation_for_integers (a b : ℤ) : ℤ := a + b
#eval add_two_naturals_with_shorthand_notation_for_integers 8 9

inductive Tree (β : Type v) where
 | leaf : Tree β
 | node (left : Tree β) (key : Nat) (value : β) (right : Tree β) : Tree β
deriving Repr

 def walk [ToString β] : Tree β → String
   | .leaf          => "leaf"
   | .node l k v r  => s!"node: {k} {v}\n{walk l}\n{walk r}"

/-
def construct_tree : IO Unit := do
  let tree : Tree String ← Tree.node (Tree.leaf) 0 "value" (Tree.leaf)
-/



-- Exploring `do` notation.
def main : IO UInt32 := do
  IO.println "hello"
  IO.println "world"
  return 0

-- What does the notation used above in `main` do?
-- The below is the same function *without* `do` notation.
-- Let's look at the type of `bind`, as in https://leanprover.github.io/lean4/doc/do.html
#check bind

-- It's `{m : Type u_1 → Type u_2} → [self : Bind m] → {α β : Type u_1} → m α → (α → m β) → m β`
-- And ignoring all the implicit arguments, we have `m α → (α → m β) → m β`.
-- Well, what are `m α` and `(α → m β)` in the below?
def mainInt : IO UInt32 :=
  bind (IO.println "hello") fun _ =>
  bind (IO.println "world") fun _ =>
  pure 0

-- Let's rewrite `mainInt` to find out:
def mainIntExpanded : IO UInt32 :=
  bind (IO.println "hello") (fun _ => bind (IO.println "world") (fun _ => pure 0))

-- So we see the second argument to the first `bind` call is actually
-- everything from `fun` (which you should recall defines an anonymous lambda
-- function) in the first line, all the way to the end. This might be obvious
-- to someone coming from e.g. Haskell, but it was not to me. The hanging
-- lambda function definition looked like it might be a syntax error. But of
-- course it isn't because it typechecks.

-- Let's cut out the second bind call to make things easier to look at:
def mainIntSimplified : IO UInt32 :=
  bind (IO.println "hello world") (λ _ => pure 0)

-- So   `(IO.println "hello world")`  is our `m α` ...
-- And  `(λ _ => pure 0)`             is our `(α → m β)`.

-- What are `α` and `β` in this example?
-- Let's `#check` the arguments to find out.
def m_α := IO.println "hello world"
#check m_α

-- We must explicitly set the type we expect below, or we get an `instance
-- problem stuck` error.
def α_to_m_β : Unit → IO UInt32 := (λ _ => pure 0)
#check α_to_m_β


-- Investigating the `<|>` operator.
#check true
#check false
#check true <|> false

variable (a b c d e : Nat)
variable (h1 : a = b)
variable (h2 : b = c + 1)
variable (h3 : c = d)
variable (h4 : e = 1 + d)

theorem T : a = e :=
  calc
    a = b      := h1
    _ = c + 1  := h2
    _ = d + 1  := congrArg Nat.succ h3
    _ = 1 + d  := Nat.add_comm d 1
    _ = e      := Eq.symm h4
