instance creation
noErrorIn: aBlock butShouldBe: aSpecOfBlockFailure

	^self spec: aSpecOfBlockFailure for: aBlock

	
