I represent deep object property defined by particular message. 
For example I can be used to describe x coordinate of rectangle origin.
	rectangle origin x
"x" property in these example will point to "origin" property. And "origin" property will point to rectangle itself (root represented by SpecOfObjectItselfProperty instance).

I implement printing method for spec title to look like
	(10@20) x
in case of property "x" of point (10@20).

My instances can be created by 
	
	SpecOfObjectProperty of: 	parentProperty message: aMessage 

But in practice SpecOfObjectPropertyBuilder is used to create properties by normal message sends.
	(10@20) which x 

Public API and Key Messages

- subPropertyAt:  
- value
- stringForSpecTitle 

Internal Representation and Key Implementation Points.

    Instance Variables
	parent:		<SpecOfObjectProperty>
	parentMessage:		<Message>
	value:		<Object>