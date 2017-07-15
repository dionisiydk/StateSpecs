I describe objects which propertyMessage returns true.

	#() should be isEmpty
	10 should be beetween: 1 and: 100

My instances can be created by: 

	SpecOfBooleanProperty fromMessage: (Message selector: #isEmpty)
 
Internal Representation and Key Implementation Points.

    Instance Variables
	propertyMessage:		<Message>
