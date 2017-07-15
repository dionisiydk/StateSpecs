tests
testLessThan
	self shouldnt: [5 should beLessThan: 6] raise: SpecOfFailed.
	self should: [5 should beLessThan: 5] raise: SpecOfFailed.
	self should: [5 should beLessThan: 3] raise: SpecOfFailed.
	
	self shouldnt: [5 should beLessOrEqualThan: 6] raise: SpecOfFailed.
	self shouldnt: [5 should beLessOrEqualThan: 5] raise: SpecOfFailed.
	self should: [5 should beLessOrEqualThan: 4] raise: SpecOfFailed