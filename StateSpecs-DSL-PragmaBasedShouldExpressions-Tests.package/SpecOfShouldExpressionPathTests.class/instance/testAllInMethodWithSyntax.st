tests
testAllInMethodWithSyntax
	| pathes actualClauses expectedClauses |
	pathes := self allPathesInMethodWith: #arg1 and: #arg2.
	pathes do: [:each | self assert: each arguments = #(#arg1 #arg2)].
	actualClauses := pathes collect: [:each | each clause].
	expectedClauses := self expectedClauses.
	self assert: actualClauses = expectedClauses