tests
testPropertyWithBooleanSubPropertyValidationWhenSpecWithDenial
	
	self should: [#(first #()) where second should not be isEmpty] raise: SpecOfFailed.
	
	[#(first #()) where second should not be isEmpty] on: SpecOfFailed do: [:err | 
		self assert: err messageText equals: 'Got "#()" from #(#first #()) second but it should not be isEmpty'	
	].