tests
testPointFloatingComparison
	self shouldnt: [(0.7 @ 0.7) should equal: 0 @ 0 within: 1]
		raise: SpecOfFailed.
	self should: [(0.8 @ 0.8) should equal: 0 @ 0 within: 1] raise: SpecOfFailed