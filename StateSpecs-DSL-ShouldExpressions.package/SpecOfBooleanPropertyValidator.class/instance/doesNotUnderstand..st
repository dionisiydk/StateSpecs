dispatching
doesNotUnderstand: aMessage

	| spec |
	spec := SpecOfBooleanProperty fromMessage: aMessage.
	spec denial: withNegation.

	self validatePropertyBy: spec