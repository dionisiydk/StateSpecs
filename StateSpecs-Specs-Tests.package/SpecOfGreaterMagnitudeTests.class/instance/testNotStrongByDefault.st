testing
testNotStrongByDefault

	| spec |
	spec := SpecOfGreaterMagnitude new.

	self deny: spec isStrong