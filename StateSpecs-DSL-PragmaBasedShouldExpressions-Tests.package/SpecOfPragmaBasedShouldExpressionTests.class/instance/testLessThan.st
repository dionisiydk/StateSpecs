state tests
testLessThan
	self shouldnt: [5 should be less than: 6] raise: SpecOfFailed.
	self should: [5 should be less than: 5] raise: SpecOfFailed.
	self should: [5 should be less than: 3] raise: SpecOfFailed.
	
	self shouldnt: [5 should be less or equal than: 6] raise: SpecOfFailed.
	self shouldnt: [5 should be less or equal than: 5] raise: SpecOfFailed.
	self should: [5 should be less or equal than: 4] raise: SpecOfFailed