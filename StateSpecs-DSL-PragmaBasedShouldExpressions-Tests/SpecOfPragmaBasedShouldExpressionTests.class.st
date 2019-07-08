"
Additional tests in ShouldClause tests
"
Class {
	#name : #SpecOfPragmaBasedShouldExpressionTests,
	#superclass : #TestCase,
	#category : 'StateSpecs-DSL-PragmaBasedShouldExpressions-Tests'
}

{ #category : #'state tests' }
SpecOfPragmaBasedShouldExpressionTests >> testCollectionSize [
	self shouldnt: [#(10 20) should have size: 2] raise: SpecOfFailed.
	self should: [#(10 20) should have size: 3] raise: SpecOfFailed
]

{ #category : #'state tests' }
SpecOfPragmaBasedShouldExpressionTests >> testDictionaryIncludesKey [
	| subject |
	subject := (Dictionary new)
				add: 1 -> 2;
				add: 3 -> 4;
				yourself.
	self shouldnt: [subject should include key: 1] raise: SpecOfFailed.
	self should: [subject should include key: 2] raise: SpecOfFailed
]

{ #category : #'state tests' }
SpecOfPragmaBasedShouldExpressionTests >> testGreaterThan [
	self shouldnt: [5 should be greater than: 4] raise: SpecOfFailed.
	self should: [5 should be greater than: 5] raise: SpecOfFailed.
	self should: [5 should be greater than: 6] raise: SpecOfFailed.
	
	self shouldnt: [5 should be greater or equal than: 4] raise: SpecOfFailed.
	self shouldnt: [5 should be greater or equal than: 5] raise: SpecOfFailed.
	self should: [5 should be greater or equal than: 6] raise: SpecOfFailed
]

{ #category : #'state tests' }
SpecOfPragmaBasedShouldExpressionTests >> testInstanceOfClass [
	self shouldnt: [5 should be an instance of: SmallInteger] raise: SpecOfFailed.
	self should: [-5 should be an instance of: Integer] raise: SpecOfFailed
]

{ #category : #'state tests' }
SpecOfPragmaBasedShouldExpressionTests >> testKindOfClass [
	self shouldnt: [5 should be a kind of: Integer] raise: SpecOfFailed.
	self should: [5.0 should be a kind of: Integer] raise: SpecOfFailed
]

{ #category : #'state tests' }
SpecOfPragmaBasedShouldExpressionTests >> testLessThan [
	self shouldnt: [5 should be less than: 6] raise: SpecOfFailed.
	self should: [5 should be less than: 5] raise: SpecOfFailed.
	self should: [5 should be less than: 3] raise: SpecOfFailed.
	
	self shouldnt: [5 should be less or equal than: 6] raise: SpecOfFailed.
	self shouldnt: [5 should be less or equal than: 5] raise: SpecOfFailed.
	self should: [5 should be less or equal than: 4] raise: SpecOfFailed
]

{ #category : #'state tests' }
SpecOfPragmaBasedShouldExpressionTests >> testRaisingError [
	self shouldnt: [[1 / 0] should raise error] raise: SpecOfFailed.
	self should: [[1 / 3] should raise error] raise: SpecOfFailed
]

{ #category : #'state tests' }
SpecOfPragmaBasedShouldExpressionTests >> testRespondToMessage [
	self shouldnt: [5 should respond to: #+] raise: SpecOfFailed.
	self should: [Object new should respond to: #+] raise: SpecOfFailed
]

{ #category : #'state tests' }
SpecOfPragmaBasedShouldExpressionTests >> testSatisfyingBlock [
	self shouldnt: [5 should satisfy: [:num | num > 0]] raise: SpecOfFailed.
	self should: [-5 should satisfy: [:num | num > 0]] raise: SpecOfFailed
]
