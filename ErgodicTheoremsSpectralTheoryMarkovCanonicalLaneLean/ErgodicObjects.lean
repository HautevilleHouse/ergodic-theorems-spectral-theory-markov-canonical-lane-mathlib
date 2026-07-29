import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ErgodicTheoremsSpectralTheoryMarkovCanonicalLaneLean

structure MeasurePreservingSystem where
  carrier : Type u
  sigmaAlgebra : Set (Set carrier)
  measure : carrier → ℝ
  transformation : carrier → carrier
  invariantMeasure : Prop
  measurePreserving : Prop

structure ErgodicObject where
  system : MeasurePreservingSystem
  ergodicMeasure : Prop
  spectralDecomposition : Prop
  conclusion : spectralDecomposition

structure ErgodicAdmittedObject where
  object : ErgodicObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def ergodicWitnessClosed (O : ErgodicObject) : Prop :=
  O.spectralDecomposition

end ErgodicTheoremsSpectralTheoryMarkovCanonicalLaneLean
end HautevilleHouse