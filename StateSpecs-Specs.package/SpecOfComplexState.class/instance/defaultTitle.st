printing
defaultTitle
	^String streamContents: [ :s |
		specs do: [ :each |
			s << each title.
			each == specs last ifFalse: [ s << ' ' << self operatorName << ' ' ]]
	]