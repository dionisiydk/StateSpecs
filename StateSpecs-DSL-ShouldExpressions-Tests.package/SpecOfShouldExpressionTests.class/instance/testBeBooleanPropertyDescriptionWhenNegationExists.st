tests
testBeBooleanPropertyDescriptionWhenNegationExists

	| errorMessage |
	[#() should not be isEmpty] on: SpecOfFailed do: [:err | 
		errorMessage := err messageText].
	
	self assert: errorMessage equals: '#() should not be isEmpty'