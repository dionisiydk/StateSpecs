tests
testDescriptionWithTitle
	| stateSpec result |
	stateSpec := SpecOfObjectState new.
	stateSpec title: 'some title'.
	result := stateSpec description.
	self assert: result = 'should some title'