instance creation
at: keyObject requiredItem: itemObject
	^self new
		containingKey: keyObject;
		requiredItem: itemObject 