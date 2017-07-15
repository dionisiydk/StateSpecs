tests
testEqualInSameOrder
	| spec |
	spec := Equal inSameOrderTo: #(1 2 3).
	self assert: spec class = SpecOfCollectionOrderedEquality.
	self assert: spec requiredValue == #(1 2 3)