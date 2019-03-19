tests
testValidationOfNotFailedBlock
	| spec result |
	spec := SpecOfBlockFailure requiredFailure: ZeroDivide.
	
	result := spec validate: [ 'blockBody' ].
	
	self assert: result isFailure.
	self assert: result description equals: 'Got no failures but should be a kind of ZeroDivide'