tests
testPropertyValueValidation
		
	self shouldnt: [10 where value should be: 10] raise: SpecOfFailed.
	self should: [10 where value should be: 20] raise: SpecOfFailed.