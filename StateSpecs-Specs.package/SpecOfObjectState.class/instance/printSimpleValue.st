printing
printSimpleValue

	^self isSimpleValue 
			ifTrue: [ self asSimpleValue stringForSpecTitle ]
			ifFalse: [ '(', self title , ')' ]