import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ErgodicTheoremsSpectralTheoryMarkovCanonicalLaneLean

structure SpectralDecompositionPackage (X : Type u) [MeasurableSpace X]
    (E : ErgodicOperatorPackage X) where
  spectrum : Set ℝ
  eigenfunctions : (X → ℝ) → Prop
  spectralMeasure : MeasureTheory.Measure ℝ
  decompositionComplete : Prop

structure SpectralDecompositionEvidence {X : Type u} [MeasurableSpace X]
    {E : ErgodicOperatorPackage X} (S : SpectralDecompositionPackage X E) where
  decompositionCompleteClosed : S.decompositionComplete

def SpectralDecompositionClosed {X : Type u} [MeasurableSpace X]
    {E : ErgodicOperatorPackage X} (S : SpectralDecompositionPackage X E) : Prop :=
  S.decompositionComplete

theorem spectral_decomposition_closed_from_evidence
    {X : Type u} [MeasurableSpace X] {E : ErgodicOperatorPackage X}
    (S : SpectralDecompositionPackage X E)
    (Ev : SpectralDecompositionEvidence S) : SpectralDecompositionClosed S := by
  exact Ev.decompositionCompleteClosed

end ErgodicTheoremsSpectralTheoryMarkovCanonicalLaneLean
end HautevilleHouse