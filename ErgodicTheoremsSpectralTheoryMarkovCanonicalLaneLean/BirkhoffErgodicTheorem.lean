import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ErgodicTheoremsSpectralTheoryMarkovCanonicalLaneLean

structure MeasurePreservingSystem where
  stateSpace : Type u
  measure : MeasureTheory.Measure stateSpace
  transformation : stateSpace → stateSpace
  measurableInvariant : Measurable transformation
  measurePreserving : MeasureTheory.MeasurePreserving transformation measure measure

structure BirkhoffErgodicTheorem.

structure BirkhoffErgodicPackage (M : MeasurePreservingSystem) where
  timeAverages : (M.stateSpace → ℝ) → (M.stateSpace → ℝ)
  convergenceInL1 : Prop
  convergenceAlmostEverywhere : Prop
  invariantIntegralFormula : Prop
  ergodicDecomposition : Prop

structure BirkhoffErgodicEvidence {M : MeasurePreservingSystem}
    (B : BirkhoffErgodicPackage M) where
  convergenceInL1Closed : B.convergenceInL1
  convergenceAlmostEverywhereClosed : B.convergenceAlmostEverywhere
  invariantIntegralFormulaClosed : B.invariantIntegralFormula
  ergodicDecompositionClosed : B.ergodicDecomposition

def BirkhoffErgodicClosed {M : MeasurePreservingSystem}
    (B : BirkhoffErgodicPackage M) : Prop :=
  B.convergenceInL1 ∧ B.convergenceAlmostEverywhere ∧
  B.invariantIntegralFormula ∧ B.ergodicDecomposition

theorem birkhoff_ergodic_closed_from_evidence
    {M : MeasurePreservingSystem} (B : BirkhoffErgodicPackage M)
    (E : BirkhoffErgodicEvidence B) : BirkhoffErgodicClosed B := by
  exact And.intro E.convergenceInL1Closed
    (And.intro E.convergenceAlmostEverywhereClosed
      (And.intro E.invariantIntegralFormulaClosed E.ergodicDecompositionClosed))

end HautevilleHouse
end ErgodicTheoremsSpectralTheoryMarkovCanonicalLaneLean