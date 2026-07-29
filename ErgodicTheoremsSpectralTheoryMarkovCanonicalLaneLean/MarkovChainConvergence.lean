import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ErgodicTheoremsSpectralTheoryMarkovCanonicalLaneLean

structure MarkovChainConvergencePackage (M : MarkovOperatorPackage) where
  stationaryDistribution : MeasureTheory.Measure M.stateSpace
  initialDistribution : MeasureTheory.Measure M.stateSpace
  iteratedKernel : ℕ → (M.stateSpace → Set M.stateSpace → ℝ)
  totalVariationConvergence : Prop
  mixingTime : ℕ
  spectralGapDecay : Prop

structure MarkovChainConvergenceEvidence {M : MarkovOperatorPackage}
    (C : MarkovChainConvergencePackage M) where
  stationaryExists : stationaryDistribution C ≠ 0
  totalVariationConverges : C.totalVariationConvergence
  mixingTimeFinite : C.mixingTime < ∞
  spectralGapDecayRate : C.spectralGapDecay

def MarkovChainConvergenceClosed {M : MarkovOperatorPackage}
    (C : MarkovChainConvergencePackage M) : Prop :=
  C.totalVariationConvergence ∧ C.mixingTime < ∞ ∧ C.spectralGapDecay

theorem markov_chain_convergence_closed_from_evidence
    {M : MarkovOperatorPackage} (C : MarkovChainConvergencePackage M)
    (E : MarkovChainConvergenceEvidence C) : MarkovChainConvergenceClosed C := by
  exact And.intro E.totalVariationConverges
    (And.intro E.mixingTimeFinite E.spectralGapDecayRate)

end HautevilleHouse
end ErgodicTheoremsSpectralTheoryMarkovCanonicalLaneLean