state tests
testRaisingError
	self shouldnt: [[1 / 0] should raise error] raise: SpecOfFailed.
	self should: [[1 / 3] should raise error] raise: SpecOfFailed