tests
testPropertyWithArgsValidationFailureDescription

	| errorMessage |
	[((0 @ 1) where distanceTo: (0@2)) should equal: 30] on: SpecOfFailed do: [:err | 
		errorMessage := err messageText].
	
	self assert: errorMessage equals: 'Got "1" from (0@1) distanceTo: (0@2) but it should equal "30"'