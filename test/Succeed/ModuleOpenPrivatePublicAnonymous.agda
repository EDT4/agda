{-# OPTIONS --no-open-public-anonymous-modules #-}
module ModuleOpenPrivatePublicAnonymous where

module Test where
  postulate A : Set

module _ = Test
-- A₂ = A

open module _ = Test
A₂ = A

open module Test1 where
  postulate B : Set

-- import _
-- open _

module _ where
  postulate C : Set

open module _ where
  postulate D : Set

-- C₂ = C
D₂ = D

open module Test2 where
  postulate E : Set

E₁ = E
E₂ = Test2.E

open module Test3 where
  private open module TestF where
    postulate F : Set

  open module TestG where
    postulate G : Set

  open module TestH public where
    postulate H : Set

  private open module TestI public where
    postulate I : Set

  module TestJ where
    postulate J : Set

  private module TestK where
    postulate K : Set

  F₁₀ = F
  F₁₁ = TestF.F

  G₁₀ = G
  G₁₁ = TestG.G

  H₁₀ = H
  H₁₁ = TestH.H

  I₁₀ = I
  I₁₁ = TestI.I

  -- J₁₀ = J
  J₁₁ = TestJ.J

  -- K₁₀ = K
  K₁₁ = TestK.K

-- 000
-- F₁ = F
-- F₂ = Test3.F
-- F₃ = Test3.TestF.F

-- 001
-- G₁ = G
-- G₂ = Test3.G
G₃ = Test3.TestG.G

-- 111
H₁ = H
H₂ = Test3.H
H₃ = Test3.TestH.H

-- 110
I₁ = I
I₂ = Test3.I
-- I₃ = Test3.TestI.I

-- 001
-- J₁ = J
-- J₂ = Test3.J
J₃ = Test3.TestJ.J

-- 000
-- K₁ = K
-- K₂ = Test3.K
-- K₃ = Test3.TestK.K


open module Test4 where
  private open module _ where
    postulate L : Set

  open module _ where
    postulate M : Set

  open module _ public where
    postulate N : Set

  private open module _ public where
    postulate O : Set

  module _ where
    postulate P : Set

  private module _ where
    postulate Q : Set

  L₀ = L
  M₀ = M
  N₀ = N
  O₀ = O
  -- P₀ = P
  -- Q₀ = Q

-- 000
-- L₁ = L
-- L₂ = Test4.L

-- 001
-- M₁ = M
-- M₂ = Test4.M

N₁ = N
N₂ = Test4.N

O₁ = O
O₂ = Test4.O

-- P₁ = P
-- P₂ = Test4.P

-- Q₁ = Q
-- Q₂ = Test4.Q
