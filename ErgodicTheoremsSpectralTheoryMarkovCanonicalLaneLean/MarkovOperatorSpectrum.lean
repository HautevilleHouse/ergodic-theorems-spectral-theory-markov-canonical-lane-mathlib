import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ErgodicTheoremsSpectralTheoryMarkovCanonicalLaneLean

structure MarkovOperatorPackage where
  stateSpace : Type u
  sigmaAlgebra : MeasurableSpace stateSpace
  transitionKernel : stateSpace → Set stateSpace → ℝ
  invariants : Prop
  transitionKernelMeasurable : ∀ x, Measurable (transitionKernel x)
  stochasticity : ∀ x, transitionKernel x Set.univ = 1

structure MarkovOperatorSpectrum {M : MarkovOperatorPackage} where
  spectrumType : Type v
  eigenvalues : Set spectrumType
  spectralRadius : ℝ
  markovOperatorAction : (M.stateSpace → ℝ) → (M.stateSpace → ℝ)
  spectralGap : ℝ
  spectralDecomposition : Prop

structure MarkovOperatorSpectrumEvidence {M : MarkovOperatorPackage}
    (S : MarkovOperatorSpectrum M) where
  eigenvalueClosed : S.eigenvalues ≠ ∅
  spectralRadiusClosed : S.spectralRadius = 1
  spectralGapPositive : S.spectralGap > 0
  spectralDecompositionClosed : S.spectralDecomposition

def MarkovOperatorSpectrumClosed {M : MarkovOperatorPackage}
    (S : MarkovOperatorSpectrum M) : Prop :=
  S.eigenvalues ≠ ∅ ∧ S.spectralRadius = 1 ∧ S.spectralGap > 0 ∧ S.spectralDecomposition

theorem markov_operator_spectrum_closed_from_evidence
    {M : MarkovOperatorPackage} (S : MarkovOperatorSpectrum M)
    (E : MarkovOperatorSpectrumEvidence S) : MarkovOperatorSpectrumClosed S := by
  exact And.intro E.eigenvalueClosed
    (And.intro E.spectralRadiusClosed
      (And.intro E.spectralGapPositive E.spectralDecompositionClosed))

end HautevilleHouse
end ErgodicTheoremsSpectralTheoryMarkovCanonicalLaneLean