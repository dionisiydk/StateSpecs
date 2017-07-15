tests
testEqualWithin
	| spec |
	spec := Equal to: #someValue within: #accuracy.
	self assert: spec class = SpecOfApproxEquality.
	self assert: spec requiredValue == #someValue.
	self assert: spec accuracy == #accuracy