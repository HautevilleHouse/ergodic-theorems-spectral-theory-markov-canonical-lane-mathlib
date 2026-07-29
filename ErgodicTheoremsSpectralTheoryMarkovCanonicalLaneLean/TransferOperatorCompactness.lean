import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ErgodicTheoremsSpectralTheoryMarkovCanonicalLaneLean

structure TransferOperatorPackage (M : MeasurePreservingSystem) where
  transferOperator : (M.stateSpace → ℝ) → (M.stateSpace → ℝ)
  dualToKoopman : Prop
  contractiveOnL1 : Prop
  lasotaYorkeInequality : Prop
  quasicompactness : Prop

structure TransferOperatorCompactness {M : MeasurePreservingSystem}
    (T : TransferOperatorPackage M) where
  essentialSpectralRadius : ℝ
  isolatedEigenvalues : Set ℂ
  fredholmAlternative : Prop
  perturbationStability : Prop

structure TransferOperatorCompactnessEvidence {M : MeasurePreservingSystem}
    {T : TransferOperatorPackage M} (C : TransferOperatorCompactness T) where
  essentialSpectralRadiusBound : C.essentialSpectralRadius < 1
  isolatedEigenvaluesNonempty : C.isolatedEigenvalues ≠ ∅
  fredholmClosed : C.fredholmAlternative
  perturbationStable : C.perturbationStability

def TransferOperatorCompactnessClosed {M : MeasurePreservingSystem}
    {T : TransferOperatorPackage M} (C : TransferOperatorCompactness T) : Prop :=
  C.essentialSpectralRadius < 1 ∧ C.isolatedEigenvalues ≠ ∅ ∧
  C.fredholmAlternative ∧ C.perturbationStability

theorem transfer_operator_compactness_closed_from_evidence
    {M : MeasurePreservingSystem} {T : TransferOperatorPackage M}
    (C : TransferOperatorCompactness T)
    (E : TransferOperatorCompactnessEvidence C) : TransferOperatorCompactnessClosed C := by
  exact And.intro E.essentialSpectralRadiusBound
    (And.intro E.isolatedEigenvaluesNonempty
      (And.intro E.fredholmClosed E.perturbationStable))

end HautevilleHouse
end ErgodicTheoremsSpectralTheoryMarkovCanonicalLaneLean