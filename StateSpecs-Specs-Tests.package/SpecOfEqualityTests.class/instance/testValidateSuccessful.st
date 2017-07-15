tests
testValidateSuccessful
	| requiredValue subject spec result |
	requiredValue := 'Object'.
	subject := requiredValue.
	
	spec := SpecOfEquality requiredValue: requiredValue.
	result := spec validate: subject.
	self assert: result isSuccess