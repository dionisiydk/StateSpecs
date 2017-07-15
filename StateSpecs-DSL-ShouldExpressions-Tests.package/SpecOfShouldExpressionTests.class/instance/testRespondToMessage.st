tests
testRespondToMessage
	self shouldnt: [5 should respondTo: #+] raise: SpecOfFailed.
	self should: [Object new should respondTo: #+] raise: SpecOfFailed