tests
testStringWithEnding
	| spec |
	spec := String withEnding: 'test'.
	self assert: spec class = SpecOfStringEnding.
	self assert: spec requiredValue = 'test'