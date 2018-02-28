accessing
defaultTitle

	^caseSensitive
		ifFalse: [ super defaultTitle ]
		ifTrue: [ super defaultTitle , ' case sensitive' ] 