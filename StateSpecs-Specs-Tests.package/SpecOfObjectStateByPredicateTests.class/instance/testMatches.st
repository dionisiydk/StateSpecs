tests
testMatches
	| spec |
	spec := SpecOfObjectStateByPredicate from: [:arg | arg > 0].
	self assert: (spec matches: 10).
	self deny: (spec matches: -10)