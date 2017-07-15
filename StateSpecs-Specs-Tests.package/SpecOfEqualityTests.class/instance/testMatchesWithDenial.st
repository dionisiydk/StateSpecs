tests
testMatchesWithDenial

	| spec |
	spec := (SpecOfEquality requiredValue: 'some object') not.

	self deny: (spec matches: 'some object' ).
	self assert: (spec matches: 'some different object')