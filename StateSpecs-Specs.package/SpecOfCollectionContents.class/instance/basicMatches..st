testing
basicMatches: aCollection 
	^aCollection anySatisfy: [ :each | requiredItem matches: each]