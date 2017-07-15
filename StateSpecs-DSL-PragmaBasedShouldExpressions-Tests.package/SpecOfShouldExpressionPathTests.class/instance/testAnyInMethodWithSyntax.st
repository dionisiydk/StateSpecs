tests
testAnyInMethodWithSyntax
	| path actualClause expectedClause |
	path := self anyPatheInMethodWith: #arg1 and: #arg2.
	self assert: path arguments = #(#arg1 #arg2).
	actualClause := path clause.
	expectedClause := self expectedClauses first.
	self assert: actualClause = expectedClause