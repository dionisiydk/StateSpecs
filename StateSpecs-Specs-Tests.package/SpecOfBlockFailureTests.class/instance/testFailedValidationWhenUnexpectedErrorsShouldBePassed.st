tests
testFailedValidationWhenUnexpectedErrorsShouldBePassed
	| spec |
	spec := SpecOfBlockFailure requiredFailure: ZeroDivide.
	spec passUnexpectedFailures.
	
	self should: [spec validate: [ #() at: 1]] raise: SubscriptOutOfBounds