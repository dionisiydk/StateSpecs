tests
testKindOfClass
	self shouldnt: [5 should beKindOf: Integer] raise: SpecOfFailed.
	self should: [5.0 should beKindOf: Integer] raise: SpecOfFailed