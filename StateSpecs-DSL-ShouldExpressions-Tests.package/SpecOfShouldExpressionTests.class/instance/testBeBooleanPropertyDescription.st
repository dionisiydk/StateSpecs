tests
testBeBooleanPropertyDescription

	| errorMessage |
	[#(1 2) should be isEmpty] on: SpecOfFailed do: [:err | 
		errorMessage := err messageText].
	
	self assert: errorMessage equals: '#(1 2) should be isEmpty'