tests
testDictionaryIncludesKey
	| subject |
	subject := (Dictionary new)
				add: 1 -> 2;
				add: 3 -> 4;
				yourself.
	self shouldnt: [subject should includeKey: 1] raise: SpecOfFailed.
	self should: [subject should includeKey: 2] raise: SpecOfFailed