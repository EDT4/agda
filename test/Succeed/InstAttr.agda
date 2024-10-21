module InstAttr where

infer : ∀{ℓ}{A : Set ℓ} → ⦃ A ⦄ → A
infer ⦃ x ⦄ = x

postulate A : Set₀
postulate a : A

postulate B : Set₀
postulate b : B

postulate C : Set₀
postulate c : C

test1 : @inst A → A
test1 _ = infer

test2 : @inst {A} → A
test2 = infer

test1' : A → A
test1' = test1

test2' : {A} → A
test2'{A} = test2{A}

test1'' : @inst A → A
test1'' = test1'

open import Agda.Primitive

module TupleTest where
  record _⨯_ {ℓ₁ ℓ₂} (A : Set ℓ₁) (B : Set ℓ₂) : Set(ℓ₁ ⊔ ℓ₂) where
    constructor _,_
    field
      @inst left : A
      @inst right : B
  infixr 20 _⨯_

  explicit : A ⨯ B ⨯ C → C
  explicit _ = infer

  implicit : {A ⨯ B ⨯ C} → C
  implicit = infer

  introduction : @inst A → @inst B → @inst C → A ⨯ B ⨯ C
  introduction _ _ _ = infer where
    instance
      tup : ∀{ℓ₁ ℓ₂}{A : Set ℓ₁}{B : Set ℓ₂} → ⦃ A ⦄ → ⦃ B ⦄ → A ⨯ B
      tup ⦃ a ⦄ ⦃ b ⦄ = a , b

  pattern byLeft a {b} = _,_ a b

  byLeft-test : A ⨯ B → A ⨯ B
  byLeft-test(byLeft a) = infer , infer -- works
  -- byLeft-test(byLeft a) = byLeft a -- does not work? why not? because implicit param means the meta kind UnificationKind in Agda.TypeChecking.Rules.Application?

  pattern byLeft' a ⦃ b ⦄ = _,_ a b

  byLeft-test' : A ⨯ B → A ⨯ B
  byLeft-test'(byLeft a) = byLeft' a -- but this works because right is @inst.

{- TODO: Not sure what this does, if anything? Because test102 does not work.
@inst test100 : A
test100 = a

test102 : A
test102 = infer
-}

module _ (@inst _ : A) where
  test7 : A
  test7 = infer

  -- Something to note is that an implicit @inst parameter essentially behave as an instance argument. The following works:
  test2-use : A
  test2-use = test2

  -- but not with explicit variables: (and it probably should not because then there would be no way to denote that the value should be inferred)
  -- test1-use : A
  -- test1-use = test1 _
