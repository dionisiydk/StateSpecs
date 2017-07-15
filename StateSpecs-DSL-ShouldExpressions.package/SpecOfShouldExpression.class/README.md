I implement all kinds of "should DSL" expressions to perform object validation.
You can get instance of me from any object by 
	1 should 
And then you can call my validation methods:
	1 should equal: 2
	1 should not equal: 2

Now I implement validation DSL by explicit messages. But before I was based on pragma approach which now extracted to separate package.
To support both approaches I provide class variable CurrentExpressionsClass which is me by default. 
But if you load package with pragma based expressions then SpecOfPragmaBasedShouldExpression become current (look at it comment for detailes).
To activate concrete expressions call 
	SpecOfShouldExpression beCurrent 

All DSL methods are in expressions category.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	receiver:		<Object>
	withNegation:		<Boolean>