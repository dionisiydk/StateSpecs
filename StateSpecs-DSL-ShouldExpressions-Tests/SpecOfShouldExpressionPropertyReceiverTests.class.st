Class {
	#name : #SpecOfShouldExpressionPropertyReceiverTests,
	#superclass : #TestCase,
	#category : #'StateSpecs-DSL-ShouldExpressions-Tests'
}

{ #category : #tests }
SpecOfShouldExpressionPropertyReceiverTests >> testGettingValidationSubject [ 

	| property |
	property := (SpecOfShouldExpressionObjectReceiver from: #object) subPropertyAt: (Message selector: #size).

	self assert: property validationSubject equals: 6
]

{ #category : #tests }
SpecOfShouldExpressionPropertyReceiverTests >> testGettingValidationSubjectFromDeepProperty [ 

	| property subProperty |
	property := (SpecOfShouldExpressionObjectReceiver from: #object) subPropertyAt: (Message selector: #size).
	subProperty := property subPropertyAt: (Message selector: #negated).
	
	self assert: subProperty validationSubject equals: -6
]

{ #category : #tests }
SpecOfShouldExpressionPropertyReceiverTests >> testPrinting [ 

	| property |
	property := (SpecOfShouldExpressionObjectReceiver from: #object) subPropertyAt: (Message selector: #size).

	self assert: property printString equals: '"6" from #object size'
]

{ #category : #tests }
SpecOfShouldExpressionPropertyReceiverTests >> testPrintingDeepProperty [

	| property subProperty |
	property := (SpecOfShouldExpressionObjectReceiver from: #object) subPropertyAt: (Message selector: #size).
	subProperty := property subPropertyAt: (Message selector: #negated).
	
	self assert: subProperty printString equals: '"-6" from #object size negated'
]
