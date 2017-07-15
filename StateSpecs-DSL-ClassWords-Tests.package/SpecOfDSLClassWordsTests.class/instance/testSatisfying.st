tests
testSatisfying
	| spec |
	spec := Satisfying for: #block.
	self assert: spec class = SpecOfObjectStateByPredicate.
	self assert: spec predicate == #block