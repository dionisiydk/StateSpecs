tests
testSatisfyingBlock
	self shouldnt: [5 should satisfy: [:num | num > 0]] raise: SpecOfFailed.
	self should: [-5 should satisfy: [:num | num > 0]] raise: SpecOfFailed