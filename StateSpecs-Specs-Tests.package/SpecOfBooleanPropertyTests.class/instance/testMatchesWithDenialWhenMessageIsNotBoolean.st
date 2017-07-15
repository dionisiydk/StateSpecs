tests
testMatchesWithDenialWhenMessageIsNotBoolean

	| spec |
	spec := (SpecOfBooleanProperty fromMessage: (Message selector: #first)) not.
	
	self assert: (spec matches: #(1 2))