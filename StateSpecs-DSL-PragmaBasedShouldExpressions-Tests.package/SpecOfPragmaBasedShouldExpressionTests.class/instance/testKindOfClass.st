state tests
testKindOfClass
	self shouldnt: [5 should be a kind of: Integer] raise: SpecOfFailed.
	self should: [5.0 should be a kind of: Integer] raise: SpecOfFailed