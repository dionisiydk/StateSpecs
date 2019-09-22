Class {
	#name : #SpecOfShouldReceiverPropertyTests,
	#superclass : #TestCase,
	#category : #'StateSpecs-DSL-ShouldExpressions-Tests'
}

{ #category : #tests }
SpecOfShouldReceiverPropertyTests >> testGettingValidationSubject [ 

	| property |
	property := (SpecOfShouldReceiverRoot from: #object) propertyFrom: (Message selector: #size).

	self assert: property validationSubject equals: 6
]

{ #category : #tests }
SpecOfShouldReceiverPropertyTests >> testGettingValidationSubjectFromDeepProperty [ 

	| property subProperty |
	property := (SpecOfShouldReceiverRoot from: #object) propertyFrom: (Message selector: #size).
	subProperty := property propertyFrom: (Message selector: #negated).
	
	self assert: subProperty validationSubject equals: -6
]

{ #category : #tests }
SpecOfShouldReceiverPropertyTests >> testPrinting [ 

	| property |
	property := (SpecOfShouldReceiverRoot from: #object) propertyFrom: (Message selector: #size).

	self assert: property printString equals: '6 from #object size'
]

{ #category : #tests }
SpecOfShouldReceiverPropertyTests >> testPrintingDeepProperty [

	| property subProperty |
	property := (SpecOfShouldReceiverRoot from: #object) propertyFrom: (Message selector: #size).
	subProperty := property propertyFrom: (Message selector: #negated).
	
	self assert: subProperty printString equals: '-6 from #object size negated'
]
