testing
basicMatches: anObject

	^specs allSatisfy: [ :each | 
		each matches: anObject ]