import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ErgodicTheoremsSpectralTheoryMarkovCanonicalLaneLean

structure ErgodicOperatorPackage (X : Type u) [MeasurableSpace X] where
  measure : MeasureTheory.Measure X
  operator : (X → ℝ) → (X → ℝ)
  markovProperty : Prop
  invariantMeasure : Prop
  ergodicity : Prop

structure ErgodicOperatorEvidence {X : Type u} [MeasurableSpace X]
    (E : ErgodicOperatorPackage X) where
  markovPropertyClosed : E.markovProperty
  invariantMeasureClosed : E.invariantMeasure
  ergodicityClosed : E.ergodicity

def ErgodicOperatorClosed {X : Type u} [MeasurableSpace X]
    (E : ErgodicOperatorPackage X) : Prop :=
  E.markovProperty ∧ E.invariantMeasure ∧ E.ergodicity

theorem ergodic_operator_closed_from_evidence
    {X : Type u} [MeasurableSpace X] (E : ErgodicOperatorPackage X)
    (Ev : ErgodicOperatorEvidence E) : ErgodicOperatorClosed E := by
  exact And.intro Ev.markovPropertyClosed
    (And.intro Ev.invariantMeasureClosed Ev.ergodicityClosed)

end ErgodicTheoremsSpectralTheoryMarkovCanonicalLaneLean
end HautevilleHouse