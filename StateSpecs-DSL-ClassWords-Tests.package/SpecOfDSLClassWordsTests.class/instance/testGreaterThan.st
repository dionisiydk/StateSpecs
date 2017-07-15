tests
testGreaterThan 
	| spec |
	spec := Greater than: #number.
	self assert: spec class = SpecOfGreaterMagnitude.
	self assert: spec requiredValue == #number.
	self assert: spec isStrong