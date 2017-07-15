tests
testPrintingCompiledMethod
	| result |

	result := (Point>>#x) stringForSpecTitle.
	self assert: result equals: (Point>>#x) printString