validation
validate: aBlock

	| result |
	^[aBlock value.
	(requiredFailure matches: Any) 
		ifTrue: [ SpecOfValidationResult success ]
		ifFalse: [ SpecOfBlockValidationFailure noErrorIn: aBlock butShouldBe: self]]
			on: Exception do: [:ex | 
				(self shouldAlwaysPassFailure: ex) ifTrue: [ex pass]. "we want to pass by default DNU, Halt and internal SpecOfFailed failures"
			
				requiredFailure denial: denial. 
				result := requiredFailure validate: ex.
			
				result isSuccess 
					ifTrue: [ result ] 
					ifFalse: [ 
						shouldPassUnexpectedFailures
							ifTrue: [ ex pass ]
							ifFalse: [ SpecOfBlockValidationFailure unexpectedError: result in: aBlock butShouldBe: self]]
		]