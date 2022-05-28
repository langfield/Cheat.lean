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
