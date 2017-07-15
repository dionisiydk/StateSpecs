testing
basicMatches: anObject

	^specs allSatisfy: [ :each | 
		each denial: denial not.
		each matches: anObject ]