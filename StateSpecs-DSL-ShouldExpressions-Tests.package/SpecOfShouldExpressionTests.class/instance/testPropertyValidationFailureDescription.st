tests
testPropertyValidationFailureDescription

	| errorMessage |
	[(10 @ 20) where x should equal: 30] on: SpecOfFailed do: [:err | 
		errorMessage := err messageText].
	
	self assert: errorMessage equals: 'Got "10" from (10@20) x but it should equal "30"'