import ErgodicTheoremsSpectralTheoryMarkovCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace ErgodicTheoremsSpectralTheoryMarkovCanonicalLaneLean

structure AdmissibleClass where
  object : ErgodicAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ErgodicWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ErgodicTheoremsSpectralTheoryMarkovCanonicalLaneLean
end HautevilleHouse
