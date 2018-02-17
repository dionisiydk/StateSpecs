tests
testDescriptionWhenRequiredItemIsSpec
	| spec |
	spec := SpecOfCollectionItem at: #expectedKey requiredItem: (Kind of: Integer).
	
	self assert: spec description equals: 'should include (be a kind of Integer) at #expectedKey'