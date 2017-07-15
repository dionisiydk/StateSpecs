tests
testObjectsIdentity
	self shouldnt: [5 should be: 5] raise: SpecOfFailed.
	self should: ['asd' should be: 'asd' copy] raise: SpecOfFailed