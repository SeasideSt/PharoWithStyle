Class {
	#name : #ReBlockFormattingRuleTest,
	#superclass : #ReAbstractNodeCheckRuleTest,
	#category : #'PharoWithStyle-Tests'
}

{ #category : #examples }
ReBlockFormattingRuleTest >> blocksWithCorrectSpaces [

	#() do: [ :n | n ].
	#() do: [ :n | #() do: [ :n2 | n2 ] ].
	#() do: [ :n |
		n foo ]
]

{ #category : #violations }
ReBlockFormattingRuleTest >> blocksWithInconsistentSpaces [

	#() do: [ :n|n].
	#() do: [:n|n ].
	#() do: [:n| n].
	#() do: [ :n |
		n foo]
]

{ #category : #violations }
ReBlockFormattingRuleTest >> blocksWithNoSpaces [

	#() do: [:n|n].
	#() do: [ :n | #() do: [:n2|] ].
	#() do: [:n|
		n foo]
]

{ #category : #violations }
ReBlockFormattingRuleTest >> multilineBlocksWithInconsistentSpaces2 [

	#() do: [
		1 foo ]
]

{ #category : #tests }
ReBlockFormattingRuleTest >> testRule [

	| critiques |
	
	critiques := self myCritiquesOnNodesInMethod: self class >> #blocksWithCorrectSpaces.
	self assert: critiques size equals: 0.
	
	critiques := self myCritiquesOnNodesInMethod: self class >> #blocksWithNoSpaces.
	self assert: critiques size equals: 3.
	
	critiques := self myCritiquesOnNodesInMethod: self class >> #blocksWithInconsistentSpaces.
	self assert: critiques size equals: 4
]
