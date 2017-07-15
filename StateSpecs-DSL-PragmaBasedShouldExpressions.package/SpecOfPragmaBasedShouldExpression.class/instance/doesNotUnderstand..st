dispatching
doesNotUnderstand: aMessage 
	| spec |
	"special trick to support boolean properties from subclass functionallity"
	(driver currentMessage notNil and: [driver currentMessage selector == #be]) ifTrue: [ 
			[driver acceptMessage: aMessage] on: SpecOfUnexpectedMessage do: [
				^aMessage sendTo: super be].
			^self
	].

	driver acceptMessage: aMessage.
	driver isClauseComplete ifFalse: [^self].
	
	spec := driver createTarget. 
	spec title: driver path printSpecTitle.
	self verify: spec