tests
testValidationOfNotFailedBlockWhenSpecWithDenial
	| spec result |
	spec := (SpecOfBlockFailure requiredFailure: ZeroDivide) not.
	
	result := spec validate: [ 'blockBody' ].
	
	self assert: result isSuccess