tests
testRespond
	| spec |
	spec := Respond to: #selector.
	self assert: spec class = SpecOfObjectResponsibility.
	self assert: spec requiredMessage == #selector