tests
testSucceedValidationShouldKeepSignaledFailure
	| spec result expectedError |
	expectedError := Error new messageText: 'test error'.
	
	spec := SpecOfBlockFailure requiredFailure: Any.	
	
	result := spec validate: [ expectedError signal].
	
	self assert: result isSuccess.
	self assert: result signaledFailure == expectedError