state tests
testRespondToMessage
	self shouldnt: [5 should respond to: #+] raise: SpecOfFailed.
	self should: [Object new should respond to: #+] raise: SpecOfFailed