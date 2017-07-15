tests
testValidationWithAnyRequiredFailure
	
	| spec result |
	spec := SpecOfBlockFailure requiredFailure: Any.	
	
	result := spec validate: [ self error: 'test'].
	
	self assert: result isSuccess