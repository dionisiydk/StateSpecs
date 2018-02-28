testing
basicMatches: aString
	
	^caseSensitive 
		ifTrue: [ aString endsWith: requiredValue]
		ifFalse: [ aString asLowercase endsWith: requiredValue asLowercase ]