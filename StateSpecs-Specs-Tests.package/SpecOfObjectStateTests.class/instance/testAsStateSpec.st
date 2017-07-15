tests
testAsStateSpec
	| stateSpec |
	stateSpec := SpecOfObjectState new.
	self assert: stateSpec asStateSpec == stateSpec