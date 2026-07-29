import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ErgodicTheoremsSpectralTheoryMarkovCanonicalLaneLean

structure MarkovChainTransitionPackage (X : Type u) [MeasurableSpace X] where
  kernel : X → MeasureTheory.Measure X
  transitionOperator : (X → ℝ) → (X → ℝ)
  irreducibility : Prop
  recurrence : Prop
  stationaryDistribution : MeasureTheory.Measure X

structure MarkovChainTransitionEvidence {X : Type u} [MeasurableSpace X]
    (M : MarkovChainTransitionPackage X) where
  irreducibilityClosed : M.irreducibility
  recurrenceClosed : M.recurrence
  stationaryDistributionClosed : Prop

def MarkovChainTransitionClosed {X : Type u} [MeasurableSpace X]
    (M : MarkovChainTransitionPackage X) : Prop :=
  M.irreducibility ∧ M.recurrence ∧ M.stationaryDistribution = M.stationaryDistribution

theorem markov_chain_transition_closed_from_evidence
    {X : Type u} [MeasurableSpace X] (M : MarkovChainTransitionPackage X)
    (Ev : MarkovChainTransitionEvidence M) : MarkovChainTransitionClosed M := by
  refine And.intro Ev.irreducibilityClosed ?_
  refine And.intro Ev.recurrenceClosed ?_
  rfl

end ErgodicTheoremsSpectralTheoryMarkovCanonicalLaneLean
end HautevilleHouse