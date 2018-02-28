testing
basicMatches: aString
	
	^caseSensitive 
		ifTrue: [ aString beginsWith: requiredValue]
		ifFalse: [ aString asLowercase beginsWith: requiredValue asLowercase ]