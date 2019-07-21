"
My subclasses represent the root of object properties chain.
It can be either object itself or the value of computed block.

Subclasses should only implement the #value method to return actual root object.

"
Class {
	#name : #SpecOfShouldExpressionRootReceiver,
	#superclass : #SpecOfShouldExpressionReceiver,
	#category : #'StateSpecs-DSL-ShouldExpressions'
}

{ #category : #testing }
SpecOfShouldExpressionRootReceiver class >> isAbstract [ 
	^self = SpecOfShouldExpressionRootReceiver 
]

{ #category : #accessing }
SpecOfShouldExpressionRootReceiver >> subPropertyAt: aMessage [

	^SpecOfShouldExpressionPropertyReceiver of: self message: aMessage
]
