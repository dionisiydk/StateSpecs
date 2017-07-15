tests
testFailedValidationWhenRequiredItemIsWrong
	| spec result |

	spec := SpecOfCollectionItem at: 3 requiredItem: 3.
	
	result := spec validate: #(1 2 4).
	self assert: result isFailure.
	self assert: result description equals: 'Got "4" at key 3 of #(1 2 4) but should equal "3"'