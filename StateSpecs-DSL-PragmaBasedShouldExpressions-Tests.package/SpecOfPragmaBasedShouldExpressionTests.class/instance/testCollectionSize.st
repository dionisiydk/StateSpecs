state tests
testCollectionSize
	self shouldnt: [#(10 20) should have size: 2] raise: SpecOfFailed.
	self should: [#(10 20) should have size: 3] raise: SpecOfFailed