tests
testStringWithBeginning
	| spec |
	spec := String withBeginning: 'test'.
	self assert: spec class = SpecOfStringBeginning.
	self assert: spec requiredValue = 'test'