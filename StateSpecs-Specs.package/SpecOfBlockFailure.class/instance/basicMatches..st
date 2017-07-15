testing
basicMatches: aBlockContext 
	^
	[aBlockContext value.
	false] on: Exception
			do: 
				[:ex | 
				(self shouldAlwaysPassFailure: ex) ifTrue: [ex pass].
				(requiredFailure matches: ex) ifTrue: [true] ifFalse: [
					shouldPassUnexpectedFailures ifTrue: [ ex pass] ifFalse: [false] ]]