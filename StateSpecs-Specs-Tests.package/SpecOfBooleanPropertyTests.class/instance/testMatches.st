tests
testMatches

	| spec |
	spec := SpecOfBooleanProperty fromMessage: (Message selector: #isEmpty).
	
	self assert: (spec matches: #()).
	self deny: (spec matches: #(1 2))