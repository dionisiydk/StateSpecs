tests
testMatches
	| pattern spec |
	pattern := 'some object'.
	spec := SpecOfIdentity requiredValue: pattern.
	self assert: (spec matches: pattern).
	self deny: (spec matches: 'some object' copy)