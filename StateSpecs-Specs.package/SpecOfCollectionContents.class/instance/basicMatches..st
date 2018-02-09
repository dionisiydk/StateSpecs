testing
basicMatches: aCollection 
	^aCollection anySatisfy: [ :each | requiredItem asStateSpec matches: each]