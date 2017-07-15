tests
testCreationFromBlock
	| subject result |
	subject := [:arg | true].
	result := subject asStateSpec.
	self assert: result class = SpecOfObjectStateByPredicate.
	self assert: result predicate == subject