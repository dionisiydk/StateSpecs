expressions
include: itemObject at: keyObject
	^self verify: (SpecOfCollectionItem at: keyObject requiredItem: itemObject)