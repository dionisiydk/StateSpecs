I describe collections which include particular item.

	#(1 2 3) should include: 2

My instance can be created by:

	SpecOfCollectionContents requiredItem: 2
	
Required item can be a simple object like in example or it can be full specification:

	#(1 2 3) should include: (Kind of: String)

Also you can use a block: 

	#(1 2 3) should include: [:item | item > 10]

Block is converted to predicate specification.

Internal Representation and Key Implementation Points.

    Instance Variables
	requiredItem:		<SpecOfObjectState>