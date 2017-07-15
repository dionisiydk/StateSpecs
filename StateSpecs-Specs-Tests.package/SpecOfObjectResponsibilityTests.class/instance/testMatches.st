tests
testMatches
	| spec |
	spec := SpecOfObjectResponsibility for: #+.
	self assert: (spec matches: 10).
	self deny: (spec matches: Object new)