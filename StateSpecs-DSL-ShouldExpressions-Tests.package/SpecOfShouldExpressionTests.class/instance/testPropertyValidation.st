tests
testPropertyValidation
	self shouldnt: [(10@20) where x] raise: SpecOfFailed.
	self should: [10 where x] raise: MessageNotUnderstood.
	
	self shouldnt: [(10@20) where x should equal: 10] raise: SpecOfFailed.
	self shouldnt: [(10@(20@40)) where y x should equal: 20] raise: SpecOfFailed.
	
	self should: [(10@20) where x should equal: 50] raise: SpecOfFailed.