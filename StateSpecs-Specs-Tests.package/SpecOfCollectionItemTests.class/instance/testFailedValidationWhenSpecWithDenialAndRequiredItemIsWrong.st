tests
testFailedValidationWhenSpecWithDenialAndRequiredItemIsWrong
	| spec result |

	spec := (SpecOfCollectionItem at: 3 requiredItem: 10) not.
	
	result := spec validate: #(1 2 10).
	self assert: result isFailure.
	self assert: result description equals: 'Got "10" at key 3 of #(1 2 10) but should not equal "10"'