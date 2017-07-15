tests
testValidateSuccessfulIfDenialSpec
	| requiredValue subject spec result |
	requiredValue := 'Object'.
	subject := 'Other object'.
	spec := SpecOfEquality requiredValue: requiredValue.
	spec denial: true.
	result := spec validate: subject.
	self assert: result isSuccess