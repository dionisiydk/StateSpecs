tests
testOrderedCollectionEquality
	self shouldnt: [#(1 2 3) asOrderedCollection should equal: #(1 2 3)] raise: SpecOfFailed.
	self should: [#(1 2 3) asOrderedCollection should equal: #(5 4)] raise: SpecOfFailed 