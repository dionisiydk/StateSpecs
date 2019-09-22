Class {
	#name : #SpecOfObjectHolderTests,
	#superclass : #TestCase,
	#category : #'StateSpecs-DSL-ShouldExpressions-Tests'
}

{ #category : #tests }
SpecOfObjectHolderTests >> testMatchesItemOfSimpleCollection [
	| spec |
	spec := SpecOfObjectHolder requiredHolder: #(1 2 3).

	self assert: (spec matches: 2).
	self deny: (spec matches: 10)
]

{ #category : #tests }
SpecOfObjectHolderTests >> testMatchesObjectFromShouldReceiverProperty [
	| spec |
	spec := SpecOfObjectHolder requiredHolder: (2@10) where x should receiver.

	self assert: (spec matches: 2).
	self deny: (spec matches: 10)
]

{ #category : #tests }
SpecOfObjectHolderTests >> testValidation [
	| spec |
	spec := SpecOfObjectHolder requiredHolder: (2@10) where x should receiver.

	self assert: (spec validate: 2) isSuccess.
	self deny: (spec validate: 10) isSuccess
]
