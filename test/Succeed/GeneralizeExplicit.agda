postulate T : Set
postulate t : T
postulate P : T → T → T → Set
variable a : T
variable {b} : T
variable ⦃ c ⦄ : T

postulate f : P a b c
g = f t {t} ⦃ t ⦄
