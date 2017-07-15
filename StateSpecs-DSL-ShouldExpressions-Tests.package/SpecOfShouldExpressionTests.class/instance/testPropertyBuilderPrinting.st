tests
testPropertyBuilderPrinting
	
	| propertyBuilder actual |
	propertyBuilder := (10@20) where x.
	
	actual := propertyBuilder printString.
	
	self assert: actual equals: 'Got "10" from (10@20) x'