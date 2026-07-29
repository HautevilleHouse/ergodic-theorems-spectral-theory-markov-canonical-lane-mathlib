import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ErgodicTheoremsSpectralTheoryMarkovCanonicalLaneLean

structure BirkhoffTheorem (E : ErgodicObject) where
  pointwiseErgodic : Prop
  meanErgodic : Prop

structure BirkhoffEvidence {E : ErgodicObject} (B : BirkhoffTheorem E) where
  pointwiseErgodicClosed : B.pointwiseErgodic
  meanErgodicClosed : B.meanErgodic

def BirkhoffClosed {E : ErgodicObject} (B : BirkhoffTheorem E) : Prop :=
  B.pointwiseErgodic ∧ B.meanErgodic

theorem birkhoff_closed_from_evidence {E : ErgodicObject} (B : BirkhoffTheorem E) (Ev : BirkhoffEvidence B) :
    BirkhoffClosed B := by
  exact And.intro Ev.pointwiseErgodicClosed Ev.meanErgodicClosed

end ErgodicTheoremsSpectralTheoryMarkovCanonicalLaneLean
end HautevilleHouse