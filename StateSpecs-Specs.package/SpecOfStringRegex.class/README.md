I describe strings which match particular regex expression.

	'some test string' should matchRegex: '^some'.
	'some test string' should matchRegex: '^Some' caseSensitive: true