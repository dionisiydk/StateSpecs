tests
testFailedValidationWithExplicitExpectedErrorInstance
	| spec result expectedError anotherError |
	expectedError := Error new messageText: 'test error'.
	
	spec := SpecOfBlockFailure requiredFailure: expectedError.	
	
	anotherError := Error new messageText: 'another error'.
	
	result := spec validate: [ anotherError signal].
	
	self assert: result isFailure.
	self assert: result description equals: 'Got "', anotherError stringForSpecValidation , '" but it should equal "', expectedError stringForSpecTitle, '"'