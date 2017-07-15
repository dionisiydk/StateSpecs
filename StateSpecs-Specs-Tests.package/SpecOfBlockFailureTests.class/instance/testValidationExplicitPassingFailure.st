tests
testValidationExplicitPassingFailure
	| spec result |
	spec := SpecOfBlockFailure requiredFailure: MessageNotUnderstood.
	
	result := spec validate: [ 1 someMessage ].
	
	self assert: result isSuccess