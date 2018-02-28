tests
testMatches
	| spec |
	spec := SpecOfStringBeginning requiredValue: 'test'.
	
	self assert: (spec matches: 'test string').
	self assert: (spec matches: 'Test string').
	self deny: (spec matches: 'some test string')