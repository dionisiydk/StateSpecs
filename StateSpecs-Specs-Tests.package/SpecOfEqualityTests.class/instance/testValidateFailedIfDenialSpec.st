tests
testValidateFailedIfDenialSpec
	| requiredValue subject spec result |
	requiredValue := 'Object'.
	subject := requiredValue.
	
	spec := SpecOfEquality requiredValue: requiredValue.
	spec denial: true.
	result := spec validate: subject.
	self assert: result isFailure.
	self assert: result subject == subject.
	self assert: result spec == spec