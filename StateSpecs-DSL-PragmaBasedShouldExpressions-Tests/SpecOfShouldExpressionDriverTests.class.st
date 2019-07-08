Class {
	#name : #SpecOfShouldExpressionDriverTests,
	#superclass : #TestCase,
	#category : 'StateSpecs-DSL-PragmaBasedShouldExpressions-Tests'
}

{ #category : #helpers }
SpecOfShouldExpressionDriverTests >> pragmaForSyntax: clause [

	^Pragma keyword: #syntax: arguments: {clause }
]

{ #category : #tests }
SpecOfShouldExpressionDriverTests >> testAcceptsFirstMessage [
	| driver result expected pragmaWithA1 pragmaWithX aMessage |
	pragmaWithA1 := self pragmaForSyntax: #(#a #b #c).
	pragmaWithX := self pragmaForSyntax: #(#x #a #b).
	driver := SpecOfShouldExpressionDriver on: (Array with: pragmaWithA1 with: pragmaWithX).
	driver acceptMessage: (aMessage := Message selector: #a).
	result := driver targetPragmas.
	expected := Array with: pragmaWithA1.
	self assert: result asSet equals: expected asSet.
	self assert: driver currentMessage == aMessage
]

{ #category : #tests }
SpecOfShouldExpressionDriverTests >> testAcceptsFirstMessage2 [
	| driver result expected pragmaWithA1 pragmaWithA2 pragmaWithX |
	pragmaWithA1 := self pragmaForSyntax: #(#a #b #c).
	pragmaWithA2 := self pragmaForSyntax: #(#a #b #d).
	pragmaWithX := self pragmaForSyntax: #(#x #a #b).
	driver := SpecOfShouldExpressionDriver on: (Array 
						with: pragmaWithA1
						with: pragmaWithA2
						with: pragmaWithX).
	driver acceptMessage: (Message selector: #a).
	result := driver targetPragmas.
	expected := Array with: pragmaWithA1 with: pragmaWithA2.
	self assert: result asSet equals: expected asSet
]

{ #category : #tests }
SpecOfShouldExpressionDriverTests >> testAcceptsSecondMessage [
	| driver result expected pragmaWithAB pragmaWithAC pragmaWithXA |
	pragmaWithAB := self pragmaForSyntax: #(#a #b #c).
	pragmaWithAC := self pragmaForSyntax: #(#a #c #d).
	pragmaWithXA := self pragmaForSyntax: #(#x #a #b).
	driver := SpecOfShouldExpressionDriver on: (Array 
						with: pragmaWithAB
						with: pragmaWithAC
						with: pragmaWithXA).
	driver
		acceptMessage: (Message selector: #a);
		acceptMessage: (Message selector: #b).
	result := driver targetPragmas.
	expected := Array with: pragmaWithAB.
	self assert: result asSet equals: expected asSet
]

{ #category : #tests }
SpecOfShouldExpressionDriverTests >> testAcceptsUnexpectedMessage [
	| driver result expected pragmaWithA1 pragmaWithX |
	pragmaWithA1 := self pragmaForSyntax: #(#a #b #c).
	pragmaWithX := self pragmaForSyntax: #(#x #a #b).
	driver := SpecOfShouldExpressionDriver on: (Array with: pragmaWithA1 with: pragmaWithX).
	self should: [driver acceptMessage: (Message selector: #b)]
		raise: SpecOfUnexpectedMessage.
	result := driver targetPragmas.
	expected := Array with: pragmaWithA1 with: pragmaWithX.
	self assert: result asSet equals: expected asSet
]

{ #category : #tests }
SpecOfShouldExpressionDriverTests >> testClauseIsComplete [
	| driver pragma |
	pragma := self pragmaForSyntax: #(#a #b #c).
	driver := SpecOfShouldExpressionDriver on: (Array with: pragma).
	driver progress: 3.
	self assert: driver isClauseComplete
]

{ #category : #tests }
SpecOfShouldExpressionDriverTests >> testClauseNotCompleteWhenManyPragmas [
	| driver pragmaWithA1 pragmaWithX |
	pragmaWithA1 := self pragmaForSyntax: #(#a #b #c).
	pragmaWithX := self pragmaForSyntax: #(#x #a #b).
	driver := SpecOfShouldExpressionDriver on: (Array with: pragmaWithA1 with: pragmaWithX).
	driver progress: 3.
	self deny: driver isClauseComplete
]

{ #category : #tests }
SpecOfShouldExpressionDriverTests >> testClauseNotCompleteWhenSmallProgress [
	| driver pragma |
	pragma := self pragmaForSyntax: #(#a #b #c).
	driver := SpecOfShouldExpressionDriver on: (Array with: pragma).
	driver progress: 2.
	self deny: driver isClauseComplete
]

{ #category : #tests }
SpecOfShouldExpressionDriverTests >> testCreatesPath [
	| driver pragma result |
	pragma := (Pragma allNamed: #syntax: in: SpecOfSyntaxTargetSample class) first.
	driver := SpecOfShouldExpressionDriver on: (Array with: pragma).
	driver 
		currentMessage: (Message selector: #someMessage: arguments: #(#arg)).
	result := driver path.
	self assert: result class = SpecOfShouldExpressionPath.
	self assert: result clause == pragma stateSpecsShouldClause.
	self assert: result arguments = #(#arg)
]

{ #category : #tests }
SpecOfShouldExpressionDriverTests >> testCreatesTarget [
	| driver pragma result |
	pragma := ((Pragma allNamed: #syntax: in: SpecOfSyntaxTargetSample class) 
				select: [:each | (each stateSpecsShouldClause includes: #created) and: [each stateSpecsShouldClause size = 5]]) 
					first.
	driver := SpecOfShouldExpressionDriver on: (Array with: pragma).
	driver 
		currentMessage: (Message selector: #someMessage: arguments: #(#arg)).
	result := driver createTarget.
	self assert: result class = SpecOfSyntaxTargetSample.
	self assert: result argument == #arg
]

{ #category : #tests }
SpecOfShouldExpressionDriverTests >> testCreation [
	| driver |
	driver := SpecOfShouldExpressionDriver on: #pragmas.
	self assert: driver targetPragmas == #pragmas
]

{ #category : #tests }
SpecOfShouldExpressionDriverTests >> testHasProgressByDefault [
	| driver |
	driver := SpecOfShouldExpressionDriver new.
	self assert: driver progress = 0
]

{ #category : #tests }
SpecOfShouldExpressionDriverTests >> testIncrementsProgressAfterAcceptingMessage [
	| driver pragmaWithA |
	pragmaWithA := self pragmaForSyntax: #(#a #b #c).
	driver := SpecOfShouldExpressionDriver on: (Array with: pragmaWithA).
	driver acceptMessage: (Message selector: #a).
	self assert: driver progress = 1
]

{ #category : #tests }
SpecOfShouldExpressionDriverTests >> testRaiseUnexpectedMessageWhenTooMuchMessages [
	| driver result expected pragmaWithA |
	pragmaWithA := self pragmaForSyntax: #(#a).
	driver := SpecOfShouldExpressionDriver on: (Array with: pragmaWithA).
	driver progress: 1.
	self should: [driver acceptMessage: (Message selector: #a)]
		raise: SpecOfUnexpectedMessage.
	result := driver targetPragmas.
	expected := Array with: pragmaWithA.
	self assert: result asSet equals: expected asSet
]
