tests
testDescriptionWithoutTitleAndDenial
	| stateSpec result expected |
	stateSpec := SpecOfObjectState new.
	stateSpec denial: true.
	result := stateSpec description.
	expected := 'should not satisfy for ' , stateSpec class name.
	self assert: result = expected