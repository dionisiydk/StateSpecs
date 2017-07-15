tests
testHasSize
	| spec |
	spec := Has size: #number.
	self assert: spec class = SpecOfCollectionSize.
	self assert: spec requiredSize == #number