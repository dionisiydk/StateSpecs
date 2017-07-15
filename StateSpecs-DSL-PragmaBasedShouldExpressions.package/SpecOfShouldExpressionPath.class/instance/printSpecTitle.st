printing
printSpecTitle
	| stream |
	stream := String new writeStream.
	(clause allButLast: 1) do: 
			[:eachPart | 
			stream
				nextPutAll: eachPart;
				nextPut: $ ].
	arguments isEmpty 
		ifTrue: 
			[stream nextPutAll: clause last.
			^stream contents].
	arguments with: clause last keywords
		do: 
			[:eachArg :eachKeyword | 
			stream
				nextPutAll: eachKeyword;
				skip: -1;
				nextPut: $ ;
				nextPutAll: eachArg stringForSpecTitle;
				nextPut: $ ].
	stream skip: -1.
	^stream contents