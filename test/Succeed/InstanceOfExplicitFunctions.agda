lookup : ∀{ℓ}{T : Set ℓ} → ⦃ T ⦄ → T
lookup ⦃ t ⦄ = t

postulate A B C : Set
postulate P : ∀{T : Set} → T → Set

instance postulate ab : A → B
instance postulate ac : A → C
instance postulate ap : (a : A) → P(a)
instance postulate ap2 : (b : B) → P(b)

test : A → B
test = lookup

test2 : A → C
test2 = lookup

-- test3 : B → C
-- test3 = lookup

test4 : (a : A) → P(a)
test4 = lookup
