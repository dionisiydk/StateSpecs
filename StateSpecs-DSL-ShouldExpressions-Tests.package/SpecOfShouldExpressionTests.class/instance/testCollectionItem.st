tests
testCollectionItem
	| subject |
	subject := (Dictionary new)
				add: 1 -> 2;
				add: 3 -> 4; 
				yourself.
	self shouldnt: [subject should include: 2 at: 1] raise: SpecOfFailed.
	self should: [subject should include: 100 at: 3] raise: SpecOfFailed.
	self should: [subject should include: 2 at: 300] raise: SpecOfFailed