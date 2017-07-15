tests
testMatchesToNotFailedBlockWhenSpecWithDenial
	| spec |
	spec := (SpecOfBlockFailure requiredFailure: ZeroDivide) not.
	self assert: (spec matches: ['empty block'])