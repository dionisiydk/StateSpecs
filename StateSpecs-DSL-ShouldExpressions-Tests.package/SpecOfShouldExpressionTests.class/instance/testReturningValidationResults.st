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
	(results at: 1) should be isSuccess.
	(results at: 2) should be isFailure.
	(results at: 3) should be isSuccess.
	(results at: 4) should be isSuccess.
	(results at: 5) should be isSuccess
