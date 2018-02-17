tests
testContainingItem
	| spec |
	spec := Containing item: #collectionItem.
	self assert: spec class = SpecOfCollectionContents.
	self assert: spec requiredItemSpec requiredValue == #collectionItem.