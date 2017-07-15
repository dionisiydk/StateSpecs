tests
testObjectsEquality
	self shouldnt: ['some' should equal: 'some'] raise: SpecOfFailed.
	self should: ['some' should equal: 'other'] raise: SpecOfFailed.
	self shouldnt: [5 should not equal: 6] raise: SpecOfFailed.
	self should: [5 should not equal: 5] raise: SpecOfFailed