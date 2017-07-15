tests
testCreationByBinaryMessage
	| spec1 spec2 compositeSpec |
	spec1 := SpecOfObjectState new.
	spec2 := SpecOfObjectState new.
	compositeSpec := spec1 | spec2.
	self assert: compositeSpec class = SpecOfOrDisjunction.
	self assert: compositeSpec specs first == spec1.
	self assert: compositeSpec specs last == spec2