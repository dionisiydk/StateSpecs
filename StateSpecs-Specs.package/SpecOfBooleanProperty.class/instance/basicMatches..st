testing
basicMatches: anObject

	| result |
	result := propertyMessage sendTo: anObject.
	^result == true