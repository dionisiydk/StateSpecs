validation
validate: aCollection
	| actualItem result |
	
	actualItem := aCollection at: containingKey ifAbsent: [
		^SpecOfCollectionItemValidationFailure noItemIn: aCollection butShouldBe: self ].
	
	result := requiredItem validate: actualItem.
	^result isSuccess 
		ifTrue: [ result ] 
		ifFalse: [ ^SpecOfCollectionItemValidationFailure unexpectedItem: actualItem in: aCollection butShouldBe: self ] 