tests
testMatchesToEqualCollectionWithAnotherOrder

	| spec |
	spec := SpecOfEquality requiredValue: #(1 2 3).

	self assert: (spec matches: #(2 1 3 ))