tests
testSucceeedValidation
	| spec result |

	spec := SpecOfCollectionItem at: 3 requiredItem: 3.
	
	result := spec validate: #(1 2 3).
	self assert: result isSuccess