tests
testDescriptionWithoutTitle
	| stateSpec result expected |
	stateSpec := SpecOfObjectState new.
	result := stateSpec description.
	expected := 'should satisfy for ' , stateSpec class name.
	self assert: result = expected