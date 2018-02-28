expressions
matchRegex: aRegexString
	^ self verify: (SpecOfStringRegex requiredValue: aRegexString)