tests
testSucceedValidation

	| spec result |
	spec := SpecOfBooleanProperty fromMessage: (Message selector: #isEmpty).
	
	result := spec validate: #().
	
	self assert: result isSuccess