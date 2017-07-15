tests
testInstanceOfClass
	self shouldnt: [5 should beInstanceOf: SmallInteger] raise: SpecOfFailed.
	self should: [-5 should beInstanceOf: Integer] raise: SpecOfFailed