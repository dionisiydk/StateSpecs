tests
testIsStateSpec
	| stateSpec |
	stateSpec := SpecOfObjectState new.
	self assert: stateSpec isStateSpec