tests
testMatchesCaseSensitive
	| spec |
	spec := SpecOfStringEnding requiredValue: 'test' caseSensitive: true.
	
	self assert: (spec matches: 'string for test').
	self deny: (spec matches: 'string for Test').
	self deny: (spec matches: 'some test string')