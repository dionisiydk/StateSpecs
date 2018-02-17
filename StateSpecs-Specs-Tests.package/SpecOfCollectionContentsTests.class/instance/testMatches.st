tests
testMatches
	| spec |
	spec := SpecOfCollectionContents requiredItem: 10.
	self assert: (spec matches: #(10 20)).
	self deny: (spec matches: #(20 40))