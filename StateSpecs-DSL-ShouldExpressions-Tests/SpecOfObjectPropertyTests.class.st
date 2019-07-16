Class {
	#name : #SpecOfObjectPropertyTests,
	#superclass : #TestCase,
	#category : #'StateSpecs-DSL-ShouldExpressions-Tests'
}

{ #category : #tests }
SpecOfObjectPropertyTests >> testGettingDeepValue [ 

	| property subProperty |
	property := (SpecOfObjectItselfProperty of: #object) subPropertyAt: (Message selector: #size).
	subProperty := property subPropertyAt: (Message selector: #negated).
	
	self assert: subProperty value equals: -6
]

{ #category : #tests }
SpecOfObjectPropertyTests >> testGettingValue [ 

	| property |
	property := (SpecOfObjectItselfProperty of: #object) subPropertyAt: (Message selector: #size).

	self assert: property value equals: 6
]

{ #category : #tests }
SpecOfObjectPropertyTests >> testPrinting [ 

	| property |
	property := (SpecOfObjectItselfProperty of: #object) subPropertyAt: (Message selector: #size).

	self assert: property printString equals: '"6" from #object size'
]

{ #category : #tests }
SpecOfObjectPropertyTests >> testPrintingDeepProperty [

	| property subProperty |
	property := (SpecOfObjectItselfProperty of: #object) subPropertyAt: (Message selector: #size).
	subProperty := property subPropertyAt: (Message selector: #negated).
	
	self assert: subProperty printString equals: '"-6" from #object size negated'
]
