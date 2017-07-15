testing
basicMatches: aCollection
	| actualItem |
	actualItem := aCollection at: containingKey ifAbsent: [^false].

	^requiredItem matches: actualItem