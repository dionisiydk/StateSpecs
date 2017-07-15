tests
testTitleByDefault
	| stateSpec result expected |
	stateSpec := SpecOfObjectState new.
	result := stateSpec title.
	expected := 'satisfy for ' , stateSpec class name.
	self assert: result = expected