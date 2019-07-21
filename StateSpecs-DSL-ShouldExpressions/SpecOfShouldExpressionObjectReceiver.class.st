"
I represent object itself to be root parent of SpecOfObjectProperty.

My instances can be created by 
	
	SpecOfObjectItselfProperty of: anObject
	
Public API and Key Messages

- subPropertyAt:
- value
- stringForSpecTitle 
 
Internal Representation and Key Implementation Points.

    Instance Variables
	value:		<Object>

"
Class {
	#name : #SpecOfShouldExpressionObjectReceiver,
	#superclass : #SpecOfShouldExpressionReceiver,
	#instVars : [
		'value'
	],
	#category : #'StateSpecs-DSL-ShouldExpressions'
}

{ #category : #'instance creation' }
SpecOfShouldExpressionObjectReceiver class >> from: anObject [
	^self new 
		value: anObject
]

{ #category : #converting }
SpecOfShouldExpressionObjectReceiver >> asNegatedFutureStateRecever [
	^self class from: value valueForFutureStateValidation 
]

{ #category : #printing }
SpecOfShouldExpressionObjectReceiver >> stringForSpecTitle [ 
	^value stringForSpecTitle 
]

{ #category : #accessing }
SpecOfShouldExpressionObjectReceiver >> subPropertyAt: aMessage [

	^SpecOfShouldExpressionPropertyReceiver of: self message: aMessage
]

{ #category : #accessing }
SpecOfShouldExpressionObjectReceiver >> validationSubject [
	^ value
]

{ #category : #accessing }
SpecOfShouldExpressionObjectReceiver >> value [
	^value
]

{ #category : #accessing }
SpecOfShouldExpressionObjectReceiver >> value: anObject [
	value := anObject
]

{ #category : #accessing }
SpecOfShouldExpressionObjectReceiver >> valueForFutureStateValidation [ 
	^value valueForFutureStateValidation
]
