testing
basicMatches: anObject 
	| objectClass |
	objectClass := anObject retriveClassForStateSpecs.
	^objectClass == requiredClass or: [objectClass inheritsFrom: requiredClass]