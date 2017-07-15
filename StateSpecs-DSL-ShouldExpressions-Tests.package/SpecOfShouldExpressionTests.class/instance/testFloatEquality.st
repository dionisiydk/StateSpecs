tests
testFloatEquality

	self deny: 0.1 + 0.2 = 0.3.
	self shouldnt: [(0.1 + 0.2) should equal: 0.3 ] raise: SpecOfFailed.
	self deny: 0.1 + 0.2 * 10 = 3.
	self shouldnt: [(0.1 + 0.2 * 10) should equal: 3 ] raise: SpecOfFailed.	
	
	self shouldnt: [10.0 should equal: 10 ] raise: SpecOfFailed.
	self shouldnt: [0.0 should equal: 0] raise: SpecOfFailed.
	self should: [(0.1 + 0.2) should equal: 0.31] raise: SpecOfFailed.	
	self should: [0.1 should equal: Object new] raise: SpecOfFailed