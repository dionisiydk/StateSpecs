tests
testIdentical
	| spec |
	spec := Identical to: #some.
	self assert: spec class = SpecOfIdentity.
	self assert: spec requiredValue == #some