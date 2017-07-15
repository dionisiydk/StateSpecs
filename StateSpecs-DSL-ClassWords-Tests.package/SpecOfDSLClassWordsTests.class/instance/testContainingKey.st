tests
testContainingKey
	| spec |
	spec := Containing key: #collectionKey.
	self assert: spec class = SpecOfDictionaryKeys.
	self assert: spec requiredKey == #collectionKey