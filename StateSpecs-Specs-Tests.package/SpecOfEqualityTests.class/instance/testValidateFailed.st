tests
testValidateFailed
	| requiredValue subject spec result |

	requiredValue := 'Object'.
	subject := 'Other object'.
	spec := SpecOfEquality requiredValue: requiredValue.
	result := spec validate: subject.
	self assert: result isFailure.
	self assert: result subject == subject.
	self assert: result spec == spec.