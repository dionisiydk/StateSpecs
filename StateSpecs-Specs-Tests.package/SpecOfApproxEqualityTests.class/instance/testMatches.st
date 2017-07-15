tests
testMatches
	| spec |
	spec := SpecOfApproxEquality to: 10 within: 2.
	self assert: (spec matches: 11).
	self deny: (spec matches: 12)