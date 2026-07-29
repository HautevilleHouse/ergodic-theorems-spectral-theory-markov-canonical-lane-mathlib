import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ErgodicTheoremsSpectralTheoryMarkovCanonicalLaneLean

structure KoopmanOperatorPackage where
  stateSpace : Type u
  measure : MeasureTheory.Measure stateSpace
  transformation : stateSpace → stateSpace
  koopmanOperator : (stateSpace → ℂ) → (stateSpace → ℂ)
  unitaryOnL2 : Prop
  spectrumStructure : Prop
  spectralResolution : Prop

structure KoopmanSpectralTheorem {K : KoopmanOperatorPackage} where
  spectrumType : Type v
  spectralMeasure : Set spectrumType → (stateSpace → ℂ) → (stateSpace → ℂ)
  spectralDecomposition : ∀ f : stateSpace → ℂ, ...
  ergodicityIndicator : Prop
  mixingIndicator : Prop
  spectralMultiplicity : ℕ → Prop

structure KoopmanSpectralEvidence {K : KoopmanOperatorPackage}
    (S : KoopmanSpectralTheorem K) where
  unitaryOnL2Closed : KoopmanOperatorPackage.unitaryOnL2
  ergodicityIndicatorClosed : S.ergodicityIndicator
  mixingIndicatorClosed : S.mixingIndicator
  spectralMultiplicityCounted : S.spectralMultiplicity 1

def KoopmanSpectralClosed {K : KoopmanOperatorPackage}
    (S : KoopmanSpectralTheorem K) : Prop :=
  S.ergodicityIndicator ∧ S.mixingIndicator ∧ S.spectralMultiplicity 1

theorem koopman_spectral_closed_from_evidence
    {K : KoopmanOperatorPackage} (S : KoopmanSpectralTheorem K)
    (E : KoopmanSpectralEvidence S) : KoopmanSpectralClosed S := by
  exact And.intro E.ergodicityIndicatorClosed
    (And.intro E.mixingIndicatorClosed E.spectralMultiplicityCounted)

end HautevilleHouse
end ErgodicTheoremsSpectralTheoryMarkovCanonicalLaneLean