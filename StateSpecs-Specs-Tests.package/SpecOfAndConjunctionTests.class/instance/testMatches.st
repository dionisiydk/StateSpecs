tests
testMatches
	| spec1 spec2 stateSpec |
	spec1 := SpecOfEquality to: #expectedValue.
	spec2 := SpecOfObjectSuperclass requiredClass: String.
	
	stateSpec := SpecOfAndConjunction of: spec1 and: spec2.
	
	self deny: (stateSpec matches: #wrongValue).
	self assert: (stateSpec matches: #expectedValue)
