lookup : ∀{ℓ}{T : Set ℓ} →  ⦃ T ⦄ → T
lookup ⦃ t ⦄ = t

postulate T : Set
postulate P : T → Set

instance postulate t : T
instance postulate _ : P(t)

instance postulate _ : Set₀
instance postulate _ : Set₁
instance postulate _ : Set₂
instance postulate S₃ : Set₃
instance postulate _ : Set₄

s0 : Set₀
s0 = lookup

s1 : Set₁
s1 = lookup

s2 : Set₂
s2 = lookup

s3 : Set₃
s3 = lookup

s4 : Set₄
s4 = lookup

test : s3 → S₃
test x = x
