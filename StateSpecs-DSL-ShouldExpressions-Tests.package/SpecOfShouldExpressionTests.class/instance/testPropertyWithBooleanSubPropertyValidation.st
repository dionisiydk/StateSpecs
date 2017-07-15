tests
testPropertyWithBooleanSubPropertyValidation
	
	self shouldnt: [#(first #()) where second should be isEmpty] raise: SpecOfFailed.
	self should: [#(first #(1 2)) where second should be isEmpty] raise: SpecOfFailed.
	
	[#(first #(1 2)) where second should be isEmpty] on: SpecOfFailed do: [:err | 
		self assert: err messageText equals: 'Got "#(1 2)" from #(#first #(1 2)) second but it should be isEmpty'	
	].