I describe all collections which contains equal elements in same order.

	#(1 2) should equalInOrder: #(1 2)

My instances can be created by 

	SpecOfCollectionOrderedEquality to: #(1).
	
To compare collections I use message 
	collection checkStateSpecsOrderedEqualityTo: anotherCollection
Collection items compared by 
	eachItem checkStateSpecsEqualityTo: anotherItem