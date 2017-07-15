tests
testCreationFromObject
	| subject result |
	subject := Object new.
	result := subject asStateSpec.
	self assert: result class = SpecOfEquality.
	self assert: result requiredValue == subject