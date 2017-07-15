tests
testKind
	| spec |
	spec := Kind of: #someClass.
	self assert: spec class = SpecOfObjectSuperclass.
	self assert: spec requiredClass == #someClass