tests
testStringWithCaseSensitiveBeginning
	| spec |
	spec := String withCaseSensitiveBeginning: 'test'.
	self assert: spec class = SpecOfStringBeginning.
	self assert: spec requiredValue = 'test'.
	self assert: spec caseSensitive