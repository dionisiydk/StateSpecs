state tests
testInstanceOfClass
	self shouldnt: [5 should be an instance of: SmallInteger] raise: SpecOfFailed.
	self should: [-5 should be an instance of: Integer] raise: SpecOfFailed