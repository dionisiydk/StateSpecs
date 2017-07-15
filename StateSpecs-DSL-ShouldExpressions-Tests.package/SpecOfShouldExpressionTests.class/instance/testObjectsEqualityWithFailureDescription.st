tests
testObjectsEqualityWithFailureDescription
	| errorDescription |
	self shouldnt: [5 should equal: 5 description: 'anything good here'] raise: SpecOfFailed.
		
	['some' should equal: 'other' description: 'it should fail here'] on: SpecOfFailed do: [:err | 	
		errorDescription := err messageText].

	self assert: errorDescription equals: 'it should fail here'.