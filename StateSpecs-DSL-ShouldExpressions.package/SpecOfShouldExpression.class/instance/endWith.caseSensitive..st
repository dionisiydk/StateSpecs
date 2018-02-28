expressions
endWith: aString caseSensitive: aBool
	^ self verify: (SpecOfStringEnding requiredValue: aString caseSensitive: aBool)