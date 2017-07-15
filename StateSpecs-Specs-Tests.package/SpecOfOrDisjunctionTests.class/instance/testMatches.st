tests
testMatches
	| spec1 spec2 stateSpec result |
	spec1 := SpecOfEquality to: 2.
	spec2 := SpecOfObjectSuperclass requiredClass: String.
	
	stateSpec := SpecOfOrDisjunction of: spec1 and: spec2.
	result := stateSpec validate: 5.
	
	self deny: (stateSpec matches: 3).
	self assert: (stateSpec matches: 2).
	self assert: (stateSpec matches: 'someValue')