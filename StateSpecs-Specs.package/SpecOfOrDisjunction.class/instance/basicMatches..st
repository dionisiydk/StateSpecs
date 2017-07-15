testing
basicMatches: anObject

	^specs anySatisfy: [ :each | 
		each matches: anObject ]