Class {
	#name : #SpecOfFutureStateTests,
	#superclass : #TestCase,
	#category : #'StateSpecs-Specs-Tests'
}

{ #category : #tests }
SpecOfFutureStateTests >> testCreationWithExpectedValue [

	| spec |
	spec := SpecOfFutureState requiredState: 10.
	
	self assert: spec requiredState class equals: SpecOfEquality.
	self assert: spec requiredState requiredValue equals: 10.
]

{ #category : #tests }
SpecOfFutureStateTests >> testDescriptionWhenItIsNegated [
	| spec |
	spec := (SpecOfFutureState requiredState: #expectedValue) not.
	
	self assert: spec description equals: 'should take a while to not equal "#expectedValue"'
]

{ #category : #tests }
SpecOfFutureStateTests >> testDescriptionWhenRequiredStateIsSimpleValue [
	| spec |
	spec := SpecOfFutureState requiredState: #expectedValue.
	
	self assert: spec description equals: 'should take a while to equal "#expectedValue"'
]

{ #category : #tests }
SpecOfFutureStateTests >> testDescriptionWhenRequiredStateIsSpec [
	| spec |
	spec := SpecOfFutureState requiredState: (Kind of: Integer).
	
	self assert: spec description equals: 'should take a while to be a kind of Integer'
]

{ #category : #tests }
SpecOfFutureStateTests >> testFailedValidationWhenGivenValueBecomesMatchingTooLater [
	| spec value result process |
	spec := SpecOfFutureState requiredState: #expectedValue waitWithin: 10 milliSeconds.
	value := #wrongValue.
	process := [ result := spec validate: [value] ] fork.
	50 milliSeconds wait.
	value := #expectedValue.
	[ Processor yield. process isTerminated. ] whileFalse.
	self deny: result isSuccess
]

{ #category : #tests }
SpecOfFutureStateTests >> testFailedValidationWhenGivenValueNeverMatches [

	| spec result |
	spec := SpecOfFutureState requiredState: #expectedValue.
	
	result := spec validate: [#wrongValue].
	self deny: result isSuccess.
	self assert: result description equals: 'Got "#wrongValue" but it should equal "#expectedValue"'
]

{ #category : #tests }
SpecOfFutureStateTests >> testHasDefaultMaxWaitingTime [

	| spec |
	spec := SpecOfFutureState requiredState: 10 asStateSpec.
	
	self assert: spec maxWaitingTime equals: 200 milliSeconds
]

{ #category : #tests }
SpecOfFutureStateTests >> testMatchesStateWhichBecomeValidAfterAWhile [

	| spec value actual process |
	spec := SpecOfFutureState requiredState: #expectedValue.
	value := #wrongValue.
	process := [ actual := spec matches: [value] ] fork.
	(spec maxWaitingTime / 2) wait.
	value := #expectedValue.
	[ Processor yield. process isTerminated. ] whileFalse.
	self assert: actual
]

{ #category : #tests }
SpecOfFutureStateTests >> testMatchesStateWhichIsAlreadyValid [

	| spec |
	spec := SpecOfFutureState requiredState: 10.
	
	self assert: (spec matches: [10])
]

{ #category : #tests }
SpecOfFutureStateTests >> testNotMatchesStateWhichDoNotBecomeValidAfterMaxWaitingTime [

	| spec actual |
	spec := SpecOfFutureState requiredState: #expectedValue.

	actual := spec matches: [#wrongValue].
	self deny: actual
]

{ #category : #tests }
SpecOfFutureStateTests >> testSucceedValidationWhenGivenValueAlreadyMatches [

	| spec result |
	spec := SpecOfFutureState requiredState: #expectedValue.
	
	result := spec validate: [#expectedValue].
	self assert: result isSuccess
]

{ #category : #tests }
SpecOfFutureStateTests >> testSucceedValidationWhenGivenValueBecomesMatchingAfterAWhile [
	| spec value result process |
	spec := SpecOfFutureState requiredState: #expectedValue.
	value := #wrongValue.
	process := [ result := spec validate: [value] ] fork.
	(spec maxWaitingTime / 2) wait.
	value := #expectedValue.
	[ Processor yield. process isTerminated. ] whileFalse.
	self assert: result isSuccess
]
