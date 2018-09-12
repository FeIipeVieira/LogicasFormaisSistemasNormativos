open nat

namespace hidden

inductive Expr 
| ENat : ℕ → Expr
| ESum : Expr → Expr → Expr
| EEq : Expr → Expr → Expr

open Expr

#check EEq (ENat 1) (ENat 1)

inductive RType
| RNat : RType
| RBool : RType

open RType

inductive Typ : Expr → RType → Prop
| tnat : ∀ {n}, Typ (ENat n) RNat
| tplus : ∀ {e1 e2}, Typ e1 RNat → Typ e2 RNat → Typ (ESum e1 e2) RNat 
| teq : ∀e1 {e2}, Typ e1 RNat → Typ e2 RNat → Typ (EEq e1 e2) RBool

open Typ

#check tnat 
--#check tplus (ENat 3) (ENat 3) (tnat 3) (tnat 3)
--#check teq (ENat 3) (ENat 2) (tnat 3) (tnat 2)
--#check tplus (ENat 3) (tnat 3) (tplus (ENat 3) (ENat 3) (tnat 3) (tnat 3))

#check @tplus (ENat 3) (ESum (ENat 3) (ENat 3)) (@tnat 3) (@tplus (ENat 3) (ENat 3) (@tnat 3) (@tnat 3))
--#check teq (ENat 3) (ENat 3) (tnat) (tnat)

def Τ : RType → Type
| RNat := ℕ 
| RBool := bool

variable n : Τ RNat

def n 
 
/-def eval {t} : Π (e : Expr), Typ e t → Τ t
|(ENat n) (@tnat n) := n 
--|∀ n,  (ENat n) (@tnat n) := n -/

def eval : ∀ (e : Expr) {t : RType}, Typ e t → Τ t
| (ENat n) _ tnat := n 
| (ESum e1 e2) RNat (tplus p1 p2) := (eval e1 RNat p1) + (eval e2 RNat p2)

end hidden 