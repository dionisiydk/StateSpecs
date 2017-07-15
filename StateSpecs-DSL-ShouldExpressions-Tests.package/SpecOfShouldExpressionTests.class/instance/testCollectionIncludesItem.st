tests
testCollectionIncludesItem
	self shouldnt: [#(10 20) should include: 10] raise: SpecOfFailed.
	self should: [#(10 20) should include: 15] raise: SpecOfFailed