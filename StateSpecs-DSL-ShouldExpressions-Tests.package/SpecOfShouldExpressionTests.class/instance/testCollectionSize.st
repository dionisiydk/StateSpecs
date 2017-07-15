tests
testCollectionSize
	self shouldnt: [#(10 20) should haveSize: 2] raise: SpecOfFailed.
	self should: [#(10 20) should haveSize: 3] raise: SpecOfFailed