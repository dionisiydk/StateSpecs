tests
testLessThan 
	| spec |
	spec := Less than: #number.
	self assert: spec class = SpecOfLesserMagnitude.
	self assert: spec requiredValue == #number.
	self assert: spec isStrong