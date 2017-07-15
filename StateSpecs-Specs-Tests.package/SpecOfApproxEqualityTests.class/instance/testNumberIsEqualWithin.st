tests
testNumberIsEqualWithin
	self assert: (11 isEqual: 10 within: 2).
	self deny: (12 isEqual: 10 within: 2)