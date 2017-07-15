tests
testContainingItemAtKey
	| spec |
	spec := Containing item: #item at: #key.
	self assert: spec class = SpecOfCollectionItem.
	self assert: spec containingKey == #key.
	self assert: spec requiredItem class = #item asStateSpec class.
	self assert: spec requiredItem requiredValue = #item.