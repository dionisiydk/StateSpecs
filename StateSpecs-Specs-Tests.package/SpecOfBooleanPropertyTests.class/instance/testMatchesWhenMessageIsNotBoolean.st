tests
testMatchesWhenMessageIsNotBoolean

	| spec |
	spec := SpecOfBooleanProperty fromMessage: (Message selector: #first).
	
	self deny: (spec matches: #(1 2))