tests
testGreaterThan
	self shouldnt: [5 should beGreaterThan: 4] raise: SpecOfFailed.
	self should: [5 should beGreaterThan: 5] raise: SpecOfFailed.
	self should: [5 should beGreaterThan: 6] raise: SpecOfFailed.
	
	self shouldnt: [5 should beGreaterOrEqualThan: 4] raise: SpecOfFailed.
	self shouldnt: [5 should beGreaterOrEqualThan: 5] raise: SpecOfFailed.
	self should: [5 should beGreaterOrEqualThan: 6] raise: SpecOfFailed