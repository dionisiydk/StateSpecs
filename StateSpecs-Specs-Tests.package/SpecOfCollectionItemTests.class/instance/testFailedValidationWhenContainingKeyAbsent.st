tests
testFailedValidationWhenContainingKeyAbsent
	| spec result |

	spec := SpecOfCollectionItem at: 3 requiredItem: 10.
	
	result := spec validate: #(1 2).
	self assert: result isFailure.
	self assert: result description equals: '#(1 2) not includes key 3 which item should equal "10"'