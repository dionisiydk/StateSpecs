tests
testMatchesCaseSensitive
	| spec |
	spec := SpecOfSubstring requiredValue: 'test' caseSensitive: true.
	
	self assert: (spec matches: 'some test string').
	self deny: (spec matches: 'some Test string').
	self deny: (spec matches: 'some string')