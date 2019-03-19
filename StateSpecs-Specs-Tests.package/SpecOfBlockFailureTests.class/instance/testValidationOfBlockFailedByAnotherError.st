tests
testValidationOfBlockFailedByAnotherError
	| spec result error |
	spec := SpecOfBlockFailure requiredFailure: ZeroDivide.
	error := Error new messageText: 'test error'.
	
	result := spec validate: [ error signal].
	
	self assert: result isFailure.
	self assert: result description equals: 'Got "', error stringForSpecValidation ,'" but it should be a kind of ZeroDivide'