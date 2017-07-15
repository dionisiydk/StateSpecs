tests
testValidateSuccessful
	| spec1 spec2 stateSpec result |
	spec1 := SpecOfEquality to: #expectedValue.
	spec2 := SpecOfObjectSuperclass requiredClass: String.
	
	stateSpec := SpecOfAndConjunction of: spec1 and: spec2.
	result := stateSpec validate: #expectedValue.
	
	self assert: result isSuccess
