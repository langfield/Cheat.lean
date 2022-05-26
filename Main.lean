import Cheat

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
