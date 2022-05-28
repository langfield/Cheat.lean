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

def twice (f : Nat → Nat) (a : Nat) :=
  f (f a)

def foo (x : Nat) := x + 2
def goo (x : Nat) : Nat := x + 2
#check foo
#check goo

universe u

-- Playing with records.
structure Point (α : Type u) where
  x : α
  y : α
  deriving Repr

#check Point.mk
#check Point.mk 0 0

def p₁ : Point Int := Point.mk 0 0

#check p₁
#eval p₁

-- Checking multiple things at the same time (you can't).
#check 0 -- This works!
-- #check 0 0 (This doesn't work.)

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

notation "ℤ" => Int

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

def main : IO Unit :=
  -- IO.println s!"Hello, {hello}!"
  -- IO.println s!"{double (2 * 2)}"
  IO.println s!"{1 - 2}"
  def zero := 1 - 2
  def x : Nat := 0
  #print x
  #print zero
  #eval twice (fun x => x + 2) 10
  def p : Nat × Int := ⟨1, 2⟩
  def r : Int := 0
