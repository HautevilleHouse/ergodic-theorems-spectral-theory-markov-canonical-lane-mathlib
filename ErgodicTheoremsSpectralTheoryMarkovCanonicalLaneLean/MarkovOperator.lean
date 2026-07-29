import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ErgodicTheoremsSpectralTheoryMarkovCanonicalLaneLean

structure MarkovTransition where
  stateSpace : Type u
  kernel : stateSpace → Set stateSpace → ℝ
  stochastic : Prop
  invariantMeasure : Prop

structure MarkovPackage (E : ErgodicObject) where
  transition : MarkovTransition
  spectralGap : Prop
  mixingProperties : Prop

structure MarkovEvidence {E : ErgodicObject} (M : MarkovPackage E) where
  spectralGapClosed : M.spectralGap
  mixingPropertiesClosed : M.mixingProperties

def MarkovClosed {E : ErgodicObject} (M : MarkovPackage E) : Prop :=
  M.spectralGap ∧ M.mixingProperties

theorem markov_closed_from_evidence {E : ErgodicObject} (M : MarkovPackage E) (Ev : MarkovEvidence M) :
    MarkovClosed M := by
  exact And.intro Ev.spectralGapClosed Ev.mixingPropertiesClosed

end ErgodicTheoremsSpectralTheoryMarkovCanonicalLaneLean
end HautevilleHouse