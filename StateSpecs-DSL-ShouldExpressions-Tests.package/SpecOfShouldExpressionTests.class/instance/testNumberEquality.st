tests
testNumberEquality

	self deny: 3 = (0.1 + 0.2 * 10).
	self shouldnt: [3 should equal: 0.1 + 0.2 * 10] raise: SpecOfFailed.	
	
	self shouldnt: [3 should equal: 3] raise: SpecOfFailed.
	self shouldnt: [10 should equal: 10.0 ] raise: SpecOfFailed.
	self shouldnt: [0 should equal: 0.0] raise: SpecOfFailed.

	self should: [3 should equal: 3.001] raise: SpecOfFailed.	
	self should: [3 should equal: Object new] raise: SpecOfFailed.
	

	