tests
testFailedValidationWhenSpecWithDenial

	| spec result |
	spec := (SpecOfBooleanProperty fromMessage: (Message selector: #isEmpty)) not.
	
	result := spec validate: #().
	
	self assert: result isFailure.
	self assert: result description equals: '#() should not be isEmpty'