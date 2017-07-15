tests
testMatches
	| spec |
	spec := SpecOfCollectionItem at: #expectedKey requiredItem: #expectedValue.

	self assert: (spec matches: (Dictionary newFromPairs: 
			#(#key1 #value1 #expectedKey #expectedValue))).
	self deny: (spec matches: (Dictionary newFromPairs: 
			#(#key1 #value1 #expectedKey #wrongValueValue)))