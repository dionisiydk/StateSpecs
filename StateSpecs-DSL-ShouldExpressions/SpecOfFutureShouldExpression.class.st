"
I am a special ""takeAWhile"" should expression which gives the system a time to satisfy the given spec: 

	[ var ] should takeAWhile to equal: 10.
	([ var ] should take: 100 seconds) to equal: 10.
	array should takeAWhile to include: 10.

I periodically repeat validation of receiver during specified duration (maxWaitingTime) until it's became matched.	
By default the duration #maxWaitingTime is just 100 milliseconds.

During validation I simply wait in the loop the specified condition. When my time is expired I return actual validation result of given spec.

My main purpose is to simplify testing of multi process logic where tested objects fork processes which asyncronously modify some state. 
In such cases it is easy to just wait the state in the loop instead of organize the synchronization in the test with semaphores which is not always possible. 
For example test could start the server which initializes some state in separate process. So it becomes started after a while. Following should expression allows to test it in a simple way: 

	[ server isStarted ] should takeAWhile to be: true.

Or with #be construction it is even more simpler:

	server should takeAWhile to be isStarted.

Notice #takeAWhile keyword. It converts original should expression to my instance.

For concrete waiting timeout use following expression: 

	(server should take: 20 seconds) to be isStarted.	
 
Internal Representation and Key Implementation Points.

    Instance Variables
	maxWaitingTime:		<Duration>

"
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
