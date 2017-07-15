tests
testFailedValidation

	| spec result |
	spec := SpecOfBooleanProperty fromMessage: (Message selector: #isEmpty).
	
	result := spec validate: #(1 2).
	
	self assert: result isFailure.
	self assert: result description equals: '#(1 2) should be isEmpty'