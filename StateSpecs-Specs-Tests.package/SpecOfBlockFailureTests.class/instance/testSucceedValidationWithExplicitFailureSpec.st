tests
testSucceedValidationWithExplicitFailureSpec
	| spec result expectedError |
	expectedError := Error new messageText: 'test error'.
	
	spec := SpecOfBlockFailure requiredFailure: (SpecOfIdentity to: expectedError).	
	
	result := spec validate: [ expectedError signal].
	
	self assert: result isSuccess