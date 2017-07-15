tests
testCollectionEquality
	self shouldnt: [#(1 2 3) should equal: #(1 2 3)] raise: SpecOfFailed.
	self shouldnt: [#(2 1 3) should equal: #(1 2 3)] raise: SpecOfFailed.
	self should: [#(1 2) should equal: #(1 2 3)] raise: SpecOfFailed