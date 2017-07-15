tests
testValidate
	| result |
	result := Any validate: nil.
	self assert: result isSuccess