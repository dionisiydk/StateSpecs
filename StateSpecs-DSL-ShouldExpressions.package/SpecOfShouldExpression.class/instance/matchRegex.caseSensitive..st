expressions
matchRegex: aRegexString caseSensitive: aBool
	^ self verify: (SpecOfStringRegex requiredValue: aRegexString caseSensitive: aBool)