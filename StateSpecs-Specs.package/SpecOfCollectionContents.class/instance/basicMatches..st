testing
basicMatches: aCollection 
	^aCollection anySatisfy: [ :each | requiredItemSpec matches: each]