dispatching
doesNotUnderstand: aMessage

	(property value respondsTo: aMessage selector) ifFalse: [ ^aMessage sendTo: property value ].
	
	property := property subPropertyAt: aMessage