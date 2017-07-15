tests
testDescriptionWithTitleButDenial
	| stateSpec result |
	stateSpec := SpecOfObjectState new.
	stateSpec
		title: 'some title';
		denial: true.
	result := stateSpec description.
	self assert: result = 'should not some title'