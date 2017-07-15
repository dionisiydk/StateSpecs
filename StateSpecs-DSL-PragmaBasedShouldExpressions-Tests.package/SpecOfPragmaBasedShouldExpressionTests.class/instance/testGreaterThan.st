state tests
testGreaterThan
	self shouldnt: [5 should be greater than: 4] raise: SpecOfFailed.
	self should: [5 should be greater than: 5] raise: SpecOfFailed.
	self should: [5 should be greater than: 6] raise: SpecOfFailed.
	
	self shouldnt: [5 should be greater or equal than: 4] raise: SpecOfFailed.
	self shouldnt: [5 should be greater or equal than: 5] raise: SpecOfFailed.
	self should: [5 should be greater or equal than: 6] raise: SpecOfFailed