tests
testPrintingStringForSpecTitle
	| result |
.
	result := 'someString' stringForSpecTitle.

	self assert: result = '''someString'''