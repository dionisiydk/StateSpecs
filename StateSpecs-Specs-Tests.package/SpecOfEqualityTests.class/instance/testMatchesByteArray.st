tests
testMatchesByteArray

	| spec |
	spec := SpecOfEquality requiredValue: #[1 2 3].

	self assert: (spec matches: #[1 2 3] copy).
	self deny: (spec matches: #[3 2 1])