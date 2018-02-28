tests
testMatches
	| spec |
	spec := SpecOfSubstring requiredValue: 'test'.
	
	self assert: (spec matches: 'some test string').
	self assert: (spec matches: 'some Test string').
	self deny: (spec matches: 'some string')