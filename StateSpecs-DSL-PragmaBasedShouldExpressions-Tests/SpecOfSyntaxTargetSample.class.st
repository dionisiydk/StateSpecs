Class {
	#name : #SpecOfSyntaxTargetSample,
	#superclass : #Object,
	#instVars : [
		'argument'
	],
	#category : 'StateSpecs-DSL-PragmaBasedShouldExpressions-Tests'
}

{ #category : #'syntax pragmas' }
SpecOfSyntaxTargetSample class >> pragmasDefinition [
	<pragmas: #class>
	^#(#syntax:)
]

{ #category : #'syntax pragmas' }
SpecOfSyntaxTargetSample class >> syntaxPragmasExample [
	<syntax: #(a b c)>
	<syntax: #(a b d)>
	<syntax: #(x y z)>
	^self new
]

{ #category : #'syntax pragmas' }
SpecOfSyntaxTargetSample class >> syntaxPragmasExample: anObject [ 
	<syntax: #(created by syntax sugar with: )>
	<syntax: #(created by syntax sugar in other way with: )>
	^self new argument: anObject
]

{ #category : #accessing }
SpecOfSyntaxTargetSample >> argument [
	^argument
]

{ #category : #accessing }
SpecOfSyntaxTargetSample >> argument: anObject [
	argument := anObject
]
