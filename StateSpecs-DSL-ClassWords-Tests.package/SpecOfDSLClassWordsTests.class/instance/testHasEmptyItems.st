tests
testHasEmptyItems
	| spec |
	spec := Has emptyItems.
	self assert: spec class = SpecOfCollectionSize.
	self assert: spec requiredSize = 0