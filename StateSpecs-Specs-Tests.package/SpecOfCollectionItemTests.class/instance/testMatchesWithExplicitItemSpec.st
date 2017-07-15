tests
testMatchesWithExplicitItemSpec
	| spec |

	spec := SpecOfCollectionItem at: 3 requiredItem: (SpecOfObjectSuperclass requiredClass: String).
	self assert: (spec matches: #(1 2 'someString')).
	self deny: (spec matches: #(1 2 3)).
	self deny: (spec matches: #(1 2)).