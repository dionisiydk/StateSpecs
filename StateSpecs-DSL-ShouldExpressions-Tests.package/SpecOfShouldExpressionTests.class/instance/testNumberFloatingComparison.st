tests
testNumberFloatingComparison
	self shouldnt: [11 should equal: 10 within: 2 ] raise: SpecOfFailed.
	self should: [11 should equal: 10 within: 0.5] raise: SpecOfFailed