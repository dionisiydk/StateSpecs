"
I specify the possible future object state (#requiredState) which could happen within specified duration (#maxWaitingTime). 

To create my instances use following examples:
	
	SpecOfFutureState requiredState: #expectedValue.
	SpecOfFutureState requiredState: (Instance of: Integer).
	SpecOfFutureState requiredState: #expectedValue waitWithin: 1 second.

During validation I simply wait in loop specified condition. When I got it or when my time is expired I return actual validation result of #requiredState spec.

My main purpose is to simplify testing of multi-threaded logic when multiple processes are spawned during the test and asyncronously modify particular object state. 
For example test could start the server which initializes some state in separate process. So it becomes started only after a while. 
In this case test needs to wait some time before asserting the server state. To improve the speed of test you would also run a waiting loop to minimize the time when test will notice the required state.
I implement this approach in reusable way. And on top of that the special extension to ""should expressions"" is implemented. Example with server will look like:

	[ server isStarted ] should takeAWhile to be: true.

Or with #be construction it will be even more fluent:

	server should takeAWhile to be isStarted.

Notice ""takeAWhile to"" keywords. It converts general state spec to my instance which waits a while to allow subject to match the spec.

By default I use 100 milliseconds as #maxWaitingTime. Usually it is enough to allow background processes take control and perform required operations.
 
But you can specify concrete timeout using following expression: 

	(server should take: 20 seconds) to be isStarted.	

Internal Representation and Key Implementation Points.

    Instance Variables
	maxWaitingTime:		<Duration>
	requiredState:		<SpecOfObjectState>

"
Class {
	#name : #SpecOfFutureState,
	#superclass : #SpecOfObjectState,
	#instVars : [
		'requiredState',
		'maxWaitingTime'
	],
	#category : #'StateSpecs-Specs'
}

{ #category : #'instance creation' }
SpecOfFutureState class >> requiredState: anObjectOrSpec [ 
	^self new requiredState: anObjectOrSpec
]

{ #category : #'instance creation' }
SpecOfFutureState class >> requiredState: anObjectOrSpec waitWithin: maxWaitingDuration [
	^(self requiredState: anObjectOrSpec)
		maxWaitingTime: maxWaitingDuration
]

{ #category : #testing }
SpecOfFutureState >> basicMatches: aBlock [

	^self 
		tryWaitUntil: [ requiredState matches: aBlock value ]
		willMatch: [ :matchResult | matchResult ]
]

{ #category : #displaying }
SpecOfFutureState >> defaultTitle [
	^'take a while to ', requiredState title
]

{ #category : #initialization }
SpecOfFutureState >> initialize [
	super initialize.
	
	maxWaitingTime := 200 milliSeconds
]

{ #category : #accessing }
SpecOfFutureState >> invert [
	"My own #denial state is reduntant as my actual logic is provided by #requiredState.
	So this override is to avoid modifying my #denial state 
	while invertingChildren will invert #requiredState"
	self invertChildren.
]

{ #category : #accessing }
SpecOfFutureState >> invertChildren [
	super invertChildren.
	requiredState invert
]

{ #category : #accessing }
SpecOfFutureState >> maxWaitingTime [
	^ maxWaitingTime
]

{ #category : #accessing }
SpecOfFutureState >> maxWaitingTime: anObject [
	maxWaitingTime := anObject
]

{ #category : #accessing }
SpecOfFutureState >> requiredState [
	^ requiredState
]

{ #category : #accessing }
SpecOfFutureState >> requiredState: anObject [
	requiredState := anObject asStateSpec
]

{ #category : #private }
SpecOfFutureState >> tryWaitUntil: stateBlock willMatch: conditionBlock [
	"It is helper method to extract waiting loop from #basicMatch: and #validate: methods.
	Arguments here have no relation to requiredState and validated objects.

	Idea is to periodicaly evaluate stateBlock and check conditionBlock with its result.
	As soon as conditionBlock will return true for given result the method will return it.
	Otherwise the method will wait for a while (maxWaitingTime) to allow it happens.
	At the end it will return the result of stateBlock whatever it will be at that time.
	
	There is extra optimization for fast completion of method: to reduce waiting pauses.
	At the beginning the method simply checks stateBlock if it is already good.
	Then it will wait couple of small pauses to allow fast completion.
	And only then it will enter the loop with long pauses (100 milliseconds)"
	| startTime result |
	(conditionBlock value: (result := stateBlock value)) ifTrue: [ ^result ].
	10 milliSeconds wait.
	(conditionBlock value: (result := stateBlock value)) ifTrue: [ ^result ].
	20 milliSeconds wait.
	(conditionBlock value: (result := stateBlock value)) ifTrue: [ ^result ].
	
	startTime := DateAndTime now - 30 milliSeconds. "which we already waited".
	[DateAndTime now < (startTime + maxWaitingTime)] whileTrue: [ 
		100 milliSeconds wait.
		(conditionBlock value: (result := stateBlock value)) ifTrue: [ ^result ]].
	
	^stateBlock value
]

{ #category : #validation }
SpecOfFutureState >> validate: aBlock [

	^self 
		tryWaitUntil: [ requiredState validate: aBlock value ]
		willMatch: [ :validationResult | validationResult isSuccess ]
]
