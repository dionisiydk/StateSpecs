testing
basicMatches: aString
	
	^caseSensitive 
		ifTrue: [ requiredValue asRegex search: aString]
		ifFalse: [ requiredValue asRegexIgnoringCase search: aString]