Extension { #name : #GHTMinimalGhost }

{ #category : #'*StateSpecs-GhostSupport' }
GHTMinimalGhost >> asStateSpec [
	^SpecOfIdentity to: self.
]

{ #category : #'*StateSpecs-GhostSupport' }
GHTMinimalGhost >> checkStateSpecsEqualityTo: anObject [
	^self == anObject
]

{ #category : #'*StateSpecs-GhostSupport' }
GHTMinimalGhost >> isStateSpec [
	^false
]

{ #category : #'*StateSpecs-GhostSupport' }
GHTMinimalGhost >> retriveClassForStateSpecs [
	^GHMetaMessages extractClassOf: self
]

{ #category : #'*StateSpecs-GhostSupport' }
GHTMinimalGhost >> should [
	^SpecOfShouldExpression startingAt: self
]

{ #category : #'*StateSpecs-GhostSupport' }
GHTMinimalGhost >> stringForSpecTitle [
	^self ghostPrintString
]

{ #category : #'*StateSpecs-GhostSupport' }
GHTMinimalGhost >> stringForSpecValidation [
	^self stringForSpecTitle
]

{ #category : #'*StateSpecs-GhostSupport' }
GHTMinimalGhost >> valueForFutureStateValidation [
	^self
]
