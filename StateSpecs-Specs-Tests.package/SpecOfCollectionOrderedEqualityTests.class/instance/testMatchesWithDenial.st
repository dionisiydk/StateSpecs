tests
testMatchesWithDenial

	| spec |
	spec := (SpecOfCollectionOrderedEquality requiredValue: #(1 2 3)) not.

	self deny: (spec matches: #(1 2 3)).
	self assert: (spec matches: #(2 1 3)).