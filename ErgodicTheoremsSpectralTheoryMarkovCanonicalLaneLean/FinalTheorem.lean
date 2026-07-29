import canonicalLaneMathlib.AdmissibleClass
import ErgodicTheoremsSpectralTheoryMarkovCanonicalLaneLean.MeanErgodicTheorem
import ErgodicTheoremsSpectralTheoryMarkovCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace ErgodicTheoremsSpectralTheoryMarkovCanonicalLaneLean

def ConstrainedErgodicClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_ergodic_endgame (A : AdmissibleClass) :
    ConstrainedErgodicClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ErgodicTheoremsSpectralTheoryMarkovCanonicalLaneLean
end HautevilleHouse