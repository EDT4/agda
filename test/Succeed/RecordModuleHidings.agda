module RecordModuleHidings where

record R₀ (T : Set) : Set where
  field x : T
module R₀' T r = R₀ {T} r
x₀ : (T : Set) → R₀ T → T
x₀ T r = R₀.x {T} r

record R₁ (T : Set) : Set where
  module-self-hiding instance-hiding
  field x : T
module R₁' T r = R₁ {T} ⦃ r ⦄
x₁ : (T : Set) → R₁ T → T
x₁ T r = R₁.x {T} ⦃ r ⦄

record R₂ (T : Set) : Set where
  module-self-hiding implicit-hiding
  field x : T
module R₂' T r = R₂ {T} {r}
x₂ : (T : Set) → R₂ T → T
x₂ T r = R₂.x {T}{r}

record R₃ (T : Set) : Set where
  module-parameter-hiding keep
  field x : T
module R₃' T = R₃ T
module R₃'' T r = R₃ T r
x₃ : (T : Set) → R₃ T → T
x₃ T r = R₃.x T r

x₃' : (T : Set) → R₃ T → T
x₃' T r = R₃'.x T r

x₃'' : (T : Set) → R₃ T → T
x₃'' T r = R₃''.x T r
