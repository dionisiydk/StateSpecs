tests
testPrintingEmptyArray
	| result |

	result := Array new stringForSpecTitle.
	self assert: result equals: '#()'