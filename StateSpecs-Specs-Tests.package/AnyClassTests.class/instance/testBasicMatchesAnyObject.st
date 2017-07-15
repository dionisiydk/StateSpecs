tests
testBasicMatchesAnyObject
	| result |
	result := Any basicMatches: nil.
	self assert: result