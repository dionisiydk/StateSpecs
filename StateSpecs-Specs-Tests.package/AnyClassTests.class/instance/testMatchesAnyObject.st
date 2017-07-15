tests
testMatchesAnyObject
	| result |
	result := Any matches: nil.
	self assert: result