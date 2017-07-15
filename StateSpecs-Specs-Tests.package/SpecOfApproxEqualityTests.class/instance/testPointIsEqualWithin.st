tests
testPointIsEqualWithin
	self assert: (0.7 @ 0.7 isEqual: 0 @ 0 within: 1).
	self deny: (0.8 @ 0.8 isEqual: 0 @ 0 within: 1)