tests
testFailedValidationWithExplicitFailureSpec
	| spec result expectedError anotherError |
	expectedError := Error new messageText: 'test error'.
	
	spec := SpecOfBlockFailure requiredFailure: (SpecOfIdentity to: expectedError).	
	
	anotherError := Error new messageText: 'another error'.
	
	result := spec validate: [ anotherError signal].
	
	self assert: result isFailure.
	self assert: result description equals: 'Got "', anotherError stringForSpecValidation , '" but it should be "', expectedError stringForSpecTitle, '"'