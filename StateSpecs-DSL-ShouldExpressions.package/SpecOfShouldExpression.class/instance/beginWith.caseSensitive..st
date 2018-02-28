expressions
beginWith: aString caseSensitive: aBool
	^ self verify: (SpecOfStringBeginning requiredValue: aString caseSensitive: aBool)