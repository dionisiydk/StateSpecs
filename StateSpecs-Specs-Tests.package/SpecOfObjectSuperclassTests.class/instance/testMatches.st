tests
testMatches
	| spec |
	spec := SpecOfObjectSuperclass requiredClass: Integer.
	self assert: (spec matches: 10).
	self deny: (spec matches: 10.0)