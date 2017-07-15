tests
testInstance
	| spec |
	spec := Instance of: #someClass.
	self assert: spec class = SpecOfObjectClass.
	self assert: spec requiredClass == #someClass