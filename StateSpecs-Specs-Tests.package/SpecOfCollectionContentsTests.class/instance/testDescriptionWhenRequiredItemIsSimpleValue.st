tests
testDescriptionWhenRequiredItemIsSimpleValue
	| spec |
	spec := SpecOfCollectionContents requiredItem: 10.
	
	self assert: spec description equals: 'should include 10'