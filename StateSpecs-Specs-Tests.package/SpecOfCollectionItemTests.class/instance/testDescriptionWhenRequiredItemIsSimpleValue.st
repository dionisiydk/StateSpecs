tests
testDescriptionWhenRequiredItemIsSimpleValue
	| spec |
	spec := SpecOfCollectionItem at: #expectedKey requiredItem: #value.
	
	self assert: spec description equals: 'should include #value at #expectedKey'