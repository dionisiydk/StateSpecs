Class {
	#name : #SpecOfShouldExpressionPathTests,
	#superclass : #TestCase,
	#category : 'StateSpecs-DSL-PragmaBasedShouldExpressions-Tests'
}

{ #category : #'syntax pragmas' }
SpecOfShouldExpressionPathTests class >> pragmasDefinition [
	<pragmas: #instance>
	^#(#syntax: #otherPragma)
]

{ #category : #private }
SpecOfShouldExpressionPathTests >> allPathesInMethodWith: arg1 and: arg2 [ 
	<otherPragma>
	<syntax: #(a b c)>
	<syntax: #(d e f)>
	^SpecOfShouldExpressionPath allAtHere
]

{ #category : #private }
SpecOfShouldExpressionPathTests >> anyPatheInMethodWith: arg1 and: arg2 [ 
	<otherPragma>
	<syntax: #(a b c)>
	<syntax: #(d e f)>
	^SpecOfShouldExpressionPath anyAtHere
]

{ #category : #private }
SpecOfShouldExpressionPathTests >> expectedClauses [
	^#(#(#a #b #c) #(#d #e #f))
]

{ #category : #tests }
SpecOfShouldExpressionPathTests >> testAllInMethodWithSyntax [
	| pathes actualClauses expectedClauses |
	pathes := self allPathesInMethodWith: #arg1 and: #arg2.
	pathes do: [:each | self assert: each arguments = #(#arg1 #arg2)].
	actualClauses := pathes collect: [:each | each clause].
	expectedClauses := self expectedClauses.
	self assert: actualClauses = expectedClauses
]

{ #category : #tests }
SpecOfShouldExpressionPathTests >> testAnyInMethodWithSyntax [
	| path actualClause expectedClause |
	path := self anyPatheInMethodWith: #arg1 and: #arg2.
	self assert: path arguments = #(#arg1 #arg2).
	actualClause := path clause.
	expectedClause := self expectedClauses first.
	self assert: actualClause = expectedClause
]

{ #category : #tests }
SpecOfShouldExpressionPathTests >> testCreation [
	| path |
	path := SpecOfShouldExpressionPath clause: #clause arguments: #args.
	self assert: path clause == #clause.
	self assert: path arguments == #args
]

{ #category : #tests }
SpecOfShouldExpressionPathTests >> testPrintingBigClauseWithArguments [
	| path result |
	path := SpecOfShouldExpressionPath clause: #(#syntax #printed #spec:title:)
				arguments: #('arg1 string' 'arg2 string').

	result := path printSpecTitle.

	self assert: result equals: 'syntax printed spec ''arg1 string'' title ''arg2 string'''.

]

{ #category : #tests }
SpecOfShouldExpressionPathTests >> testPrintingBigClauseWithoutArguments [
	| path result |
	path := SpecOfShouldExpressionPath clause: #(#syntax #printed #spec) arguments: #().
	result := path printSpecTitle.
	self assert: result = 'syntax printed spec'
]

{ #category : #tests }
SpecOfShouldExpressionPathTests >> testPrintingClauseWithOnlyKeywordWithoutArguments [
	| path result |
	path := SpecOfShouldExpressionPath clause: #(#syntax) arguments: #().
	result := path printSpecTitle.
	self assert: result = 'syntax'
]

{ #category : #tests }
SpecOfShouldExpressionPathTests >> testPrintingClauseWithSinglePartWithArguments [
	| path result |
	path := SpecOfShouldExpressionPath clause: #(#spec:title:)
				arguments: #('arg1 string' 'arg2 string').
	
	result := path printSpecTitle.
	
	self assert: result = 'spec ''arg1 string'' title ''arg2 string'''
]
