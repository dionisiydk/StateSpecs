testing
testMatchesWithStrongOption
	| requiredValue spec |
	requiredValue := 10.
	spec := SpecOfLesserMagnitude than: requiredValue strong: true.
	self deny: (spec matches: requiredValue).
	self deny: (spec matches: requiredValue + 1).
	self assert: (spec matches: requiredValue - 1)