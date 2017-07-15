tests
testMatches

	| spec |
	spec := SpecOfEquality requiredValue: 'some object'.

	self assert: (spec matches: 'some' ,' object' ).
	self deny: (spec matches: 'some different object')