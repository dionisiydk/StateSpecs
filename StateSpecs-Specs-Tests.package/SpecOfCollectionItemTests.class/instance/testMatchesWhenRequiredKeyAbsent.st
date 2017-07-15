tests
testMatchesWhenRequiredKeyAbsent
		| spec |
	spec := SpecOfCollectionItem at: #expectedKey requiredItem: #expectedValue.

	self deny: (spec matches: (Dictionary newFromPairs: 
			#(#key1 #value1)))