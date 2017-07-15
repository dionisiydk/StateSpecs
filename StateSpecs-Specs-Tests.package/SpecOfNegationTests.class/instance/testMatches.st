tests
testMatches
	| spec1 spec2 stateSpec |
	spec1 := SpecOfEquality to: 2.
	spec2 := SpecOfObjectSuperclass requiredClass: String.
	
	stateSpec := SpecOfNegation of: spec1 and: spec2.
	
	self deny: (stateSpec matches: 2).
	self deny: (stateSpec matches: 'someString').
	self assert: (stateSpec matches: 10)