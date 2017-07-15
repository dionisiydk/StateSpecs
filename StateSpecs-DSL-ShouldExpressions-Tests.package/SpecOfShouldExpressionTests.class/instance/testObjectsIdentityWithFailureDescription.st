tests
testObjectsIdentityWithFailureDescription
	| errorDescription |
	self shouldnt: [5 should be: 5 description: 'anything good here'] raise: SpecOfFailed.
	
	['some' should be: 'other' description: 'it should fail here'] on: SpecOfFailed do: [:err | 	
		errorDescription := err messageText].

	self assert: errorDescription equals: 'it should fail here'