tests
testPointEquality
	
	self deny: 0.1 + 0.2 @ 0.1 = (0.3 @ 0.1).
	self shouldnt: [(0.1 + 0.2 @ 0.1) should equal: 0.3 @ 0.1]	raise: SpecOfFailed.
		
	self should: [(0.1 + 0.2 @ 0.1) should equal: 0.301 @ 0.1]	raise: SpecOfFailed