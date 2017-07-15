tests
testBeBooleanProperty
	self shouldnt: [#() should be isEmpty] raise: SpecOfFailed.
	self should: [#(1 2) should be isEmpty] raise: SpecOfFailed.

	self should: [#() should not be isEmpty] raise: SpecOfFailed.
	self shouldnt: [#(1 2) should not be isEmpty] raise: SpecOfFailed.

	self shouldnt: [10 should be between: 1 and: 50] raise: SpecOfFailed.
	self should: [10 should be between: 1 and: 2] raise: SpecOfFailed