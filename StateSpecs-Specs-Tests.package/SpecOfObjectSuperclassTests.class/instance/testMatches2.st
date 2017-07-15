tests
testMatches2
	| spec |
	spec := SpecOfObjectSuperclass requiredClass: SmallInteger.
	self assert: (spec matches: 10).
	self deny: (spec matches: 10.0)