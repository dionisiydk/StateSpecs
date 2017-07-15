tests
testStringEquality
	self shouldnt: ['some' should equal: 'some'] raise: SpecOfFailed.
	self should: ['1234' should equal: '1324'] raise: SpecOfFailed