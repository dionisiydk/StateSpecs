tests
testReturningValidationResults
	| results |
	results := [
		{
			true should be: true.
			42 should be: 'answer to life'.
			42 where even should be: true.
			[ 1/0 ] should raise: ZeroDivide.
			[ false should be: true ] should raise: SpecOfFailed
		}
	] on: SpecOfFailed do: #resume.

	results size should be: 5.
	self assert: (results at: 1) isSuccess.
	self assert: (results at: 2) isFailure.
	self assert: (results at: 3) isSuccess.
	self assert: (results at: 4) isSuccess.
	self assert: (results at: 5) isSuccess