tests
testEqual
	| spec |
	spec := Equal to: #some.
	self assert: spec class = SpecOfEquality.
	self assert: spec requiredValue == #some