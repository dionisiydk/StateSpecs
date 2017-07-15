testing
testMatchesWithoutStrongOption
	| requiredValue spec |
	requiredValue := 10.
	spec := SpecOfLesserMagnitude than: requiredValue strong: false.
	self assert: (spec matches: requiredValue).
	self deny: (spec matches: requiredValue + 1).
	self assert: (spec matches: requiredValue - 1)