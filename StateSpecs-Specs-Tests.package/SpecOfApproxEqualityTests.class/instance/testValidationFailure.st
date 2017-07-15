tests
testValidationFailure
	| spec result |
	spec := SpecOfApproxEquality to: 10 within: 2.
	
	result := spec validate: 12.
	
	self assert: result isFailure.
	self assert: result description equals: 'Got "12" but it should be within 2 of 10'
