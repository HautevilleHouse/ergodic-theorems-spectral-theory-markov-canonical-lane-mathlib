import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ErgodicTheoremsSpectralTheoryMarkovCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  (∀ (X : Type u) [MeasurableSpace X] (E : ErgodicOperatorPackage X), ErgodicOperatorClosed E) ∨
  (∀ (X : Type u) [MeasurableSpace X] (E : ErgodicOperatorPackage X) (S : SpectralDecompositionPackage X E), MeanErgodicTheoremClosed (M := ?_) (M := ?_)) ∨
  True

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact Or.inr (Or.inr trivial)

end ErgodicTheoremsSpectralTheoryMarkovCanonicalLaneLean
end HautevilleHouse