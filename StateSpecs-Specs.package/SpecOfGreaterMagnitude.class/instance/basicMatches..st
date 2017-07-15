testing
basicMatches: anObject 
	isStrong ifTrue: [^anObject > requiredValue].
	
	^anObject >= requiredValue 