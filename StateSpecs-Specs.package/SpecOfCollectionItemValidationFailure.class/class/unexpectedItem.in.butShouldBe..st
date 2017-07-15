instance creation
unexpectedItem: itemObject in: aCollection butShouldBe: aSpecOfCollectionItem

	^(self spec: aSpecOfCollectionItem for: aCollection)
		wrongItem: itemObject