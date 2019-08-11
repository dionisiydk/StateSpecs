Class {
	#name : #SpecOfFutureShouldExpression,
	#superclass : #SpecOfShouldExpression,
	#instVars : [
		'maxWaitingTime'
	],
	#category : #'StateSpecs-DSL-ShouldExpressions'
}

{ #category : #initialization }
SpecOfFutureShouldExpression >> initialize [
	super initialize.
	
	maxWaitingTime := 200 milliSeconds
]

{ #category : #accessing }
SpecOfFutureShouldExpression >> maxWaitingTime [
	^ maxWaitingTime
]

{ #category : #accessing }
SpecOfFutureShouldExpression >> maxWaitingTime: anObject [
	maxWaitingTime := anObject
]

{ #category : #execution }
SpecOfFutureShouldExpression >> validate: aSpecOfObjectState [
	"Idea is to periodicaly validate the receiver for given spec.
	As soon as spec will be satisfied the method will return the successfull validation result.
	Otherwise the method will wait for a while (maxWaitingTime) to allow it happens.
	At the end it will validate the receiver the last time and return the result whatever it will be.
	
	There is extra optimization for fast completion of method: to reduce waiting pauses.
	At the beginning the method simply checks that the spec already matches receiver.
	Then it will wait couple of small pauses to allow fast completion.
	And only then it will enter the loop with long pauses (100 milliseconds)"
	| startTime result |
	(result := super validate: aSpecOfObjectState) isSuccess ifTrue: [ ^result ].
	10 milliSeconds wait.
	(result := super validate: aSpecOfObjectState) isSuccess ifTrue: [ ^result ].
	20 milliSeconds wait.
	(result := super validate: aSpecOfObjectState) isSuccess ifTrue: [ ^result ].
	
	startTime := DateAndTime now - 30 milliSeconds. "which we already waited".
	[DateAndTime now < (startTime + maxWaitingTime)] whileTrue: [ 
		100 milliSeconds wait.
		(result := super validate: aSpecOfObjectState) isSuccess ifTrue: [ ^result ]].
	
	^super validate: aSpecOfObjectState
]
