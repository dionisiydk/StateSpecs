tests
testRaisingExeption
	self shouldnt: [[1 / 0] should raise: ZeroDivide] raise: SpecOfFailed.
	self should: [[1 / 0] should raise: Error] raise: SpecOfFailed.
	self should: [[1 / 3] should raise: ZeroDivide] raise: SpecOfFailed.
	self shouldnt: [[1 / 0] should fail] raise: SpecOfFailed. 
	self should: [[1 / 3] should fail] raise: SpecOfFailed.
	self shouldnt: [[1 / 1] should not raise: ZeroDivide] raise: SpecOfFailed.
	self should: [[1 / 0] should not raise: ZeroDivide] raise: SpecOfFailed.
		
	self shouldnt: [[1 someMessage] should raise: MessageNotUnderstood] raise: SpecOfFailed.
	self shouldnt: [[1 should be: 2] should raise: SpecOfFailed] raise: SpecOfFailed.