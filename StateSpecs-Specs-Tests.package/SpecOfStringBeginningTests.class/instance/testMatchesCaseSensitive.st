tests
testMatchesCaseSensitive
	| spec |
	spec := SpecOfStringBeginning requiredValue: 'test' caseSensitive: true.
	
	self assert: (spec matches: 'test string').
	self deny: (spec matches: 'Test string').
	self deny: (spec matches: 'some test string')