tests
testDescriptionWhenRequiredItemIsSpec
	| spec |
	spec := SpecOfCollectionContents requiredItem: (Kind of: Integer).
	
	self assert: spec description equals: 'should include (be a kind of Integer)'