tests
testPrintingObjectForSpecTitle
	| object result |
	object := Object new.
	
	result := object stringForSpecTitle.
	
	self assert: result = object printString