tests
testMatches
	| spec |
	spec := SpecOfStringEnding requiredValue: 'test'.
	
	self assert: (spec matches: 'string for test').
	self assert: (spec matches: 'string for Test').
	self deny: (spec matches: 'some test string')