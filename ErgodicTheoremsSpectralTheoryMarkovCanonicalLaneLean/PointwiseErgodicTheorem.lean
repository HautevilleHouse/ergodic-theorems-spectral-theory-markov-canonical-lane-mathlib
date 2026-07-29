import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ErgodicTheoremsSpectralTheoryMarkovCanonicalLaneLean

structure PointwiseErgodicTheoremPackage (X : Type u) [MeasurableSpace X]
    (E : ErgodicOperatorPackage X) (S : SpectralDecompositionPackage X E) where
  pointwiseConvergence : Prop
  maximalInequality : Prop
  limitFunction : (X → ℝ) → (X → ℝ)

structure PointwiseErgodicTheoremEvidence {X : Type u} [MeasurableSpace X]
    {E : ErgodicOperatorPackage X} {S : SpectralDecompositionPackage X E}
    (P : PointwiseErgodicTheoremPackage X E S) where
  pointwiseConvergenceClosed : P.pointwiseConvergence
  maximalInequalityClosed : P.maximalInequality

def PointwiseErgodicTheoremClosed {X : Type u} [MeasurableSpace X]
    {E : ErgodicOperatorPackage X} {S : SpectralDecompositionPackage X E}
    (P : PointwiseErgodicTheoremPackage X E S) : Prop :=
  P.pointwiseConvergence ∧ P.maximalInequality

theorem pointwise_ergodic_theorem_closed_from_evidence
    {X : Type u} [MeasurableSpace X] {E : ErgodicOperatorPackage X}
    {S : SpectralDecompositionPackage X E} (P : PointwiseErgodicTheoremPackage X E S)
    (Ev : PointwiseErgodicTheoremEvidence P) : PointwiseErgodicTheoremClosed P := by
  exact And.intro Ev.pointwiseConvergenceClosed Ev.maximalInequalityClosed

end ErgodicTheoremsSpectralTheoryMarkovCanonicalLaneLean
end HautevilleHouse