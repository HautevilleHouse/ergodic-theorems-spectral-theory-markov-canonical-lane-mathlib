import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ErgodicTheoremsSpectralTheoryMarkovCanonicalLaneLean

structure MeanErgodicTheoremPackage (X : Type u) [MeasurableSpace X]
    (E : ErgodicOperatorPackage X) (S : SpectralDecompositionPackage X E) where
  cesaroConvergence : Prop
  limitOperator : (X → ℝ) → (X → ℝ)
  projectionOntoInvariant : Prop

structure MeanErgodicTheoremEvidence {X : Type u} [MeasurableSpace X]
    {E : ErgodicOperatorPackage X} {S : SpectralDecompositionPackage X E}
    (M : MeanErgodicTheoremPackage X E S) where
  cesaroConvergenceClosed : M.cesaroConvergence
  projectionOntoInvariantClosed : M.projectionOntoInvariant

def MeanErgodicTheoremClosed {X : Type u} [MeasurableSpace X]
    {E : ErgodicOperatorPackage X} {S : SpectralDecompositionPackage X E}
    (M : MeanErgodicTheoremPackage X E S) : Prop :=
  M.cesaroConvergence ∧ M.projectionOntoInvariant

theorem mean_ergodic_theorem_closed_from_evidence
    {X : Type u} [MeasurableSpace X] {E : ErgodicOperatorPackage X}
    {S : SpectralDecompositionPackage X E} (M : MeanErgodicTheoremPackage X E S)
    (Ev : MeanErgodicTheoremEvidence M) : MeanErgodicTheoremClosed M := by
  exact And.intro Ev.cesaroConvergenceClosed Ev.projectionOntoInvariantClosed

end ErgodicTheoremsSpectralTheoryMarkovCanonicalLaneLean
end HautevilleHouse