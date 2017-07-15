instance creation
unexpectedError: errorValidationResult in: aBlock butShouldBe: aSpecOfBlockFailure

	^(self spec: aSpecOfBlockFailure for: aBlock)
		errorValidationResult: errorValidationResult
	
