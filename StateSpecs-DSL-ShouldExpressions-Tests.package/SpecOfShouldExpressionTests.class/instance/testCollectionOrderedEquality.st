tests
testCollectionOrderedEquality
	self shouldnt: [#(1 2 3) should equalInOrder: #(1 2 3)] raise: SpecOfFailed.
	self should: [#(2 1 3) should equalInOrder: #(1 2 3)] raise: SpecOfFailed.
	self should: [#(1 2) should equalInOrder: #(1 2 3)] raise: SpecOfFailed