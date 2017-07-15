tests
testMatchesWithDenial

	| spec |
	spec := (SpecOfBooleanProperty fromMessage: (Message selector: #isEmpty)) not.
	
	self deny: (spec matches: #()).
	self assert: (spec matches: #(1 2))