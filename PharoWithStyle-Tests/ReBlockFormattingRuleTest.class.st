Class {
	#name : #ReBlockFormattingRuleTest,
	#superclass : #ReAbstractRuleTestCase,
	#category : #'PharoWithStyle-Tests'
}

{ #category : #examples }
ReBlockFormattingRuleTest >> blocksWithCorrectSpaces [

	#() do: [ :n | n ].
	#() do: [ :n | #() do: [ :n2 | n2 ] ]
]

{ #category : #violations }
ReBlockFormattingRuleTest >> blocksWithInconsistentSpaces [

	#() do: [ :n|n].
	#() do: [:n|n ].
	#() do: [:n| n]
]

{ #category : #violations }
ReBlockFormattingRuleTest >> blocksWithNoSpaces [

	#() do: [:n|n].
	#() do: [ :n | #() do: [:n2|] ]
]

{ #category : #helpers }
ReBlockFormattingRuleTest >> myCritiquesOnNodesInMethod: aMethod [

	| critiques |
	critiques := OrderedCollection new.
	aMethod ast nodesDo: [ :node | 
		self subjectUnderTest new
			check: node forCritiquesDo:[ :critique | critiques add: critique ] ].
	^ critiques
]

{ #category : #tests }
ReBlockFormattingRuleTest >> testRule [

	| critiques |
	
	critiques := self myCritiquesOnNodesInMethod: self class >> #blocksWithCorrectSpaces.
	self assert: critiques size equals: 0.
	
	critiques := self myCritiquesOnNodesInMethod: self class >> #blocksWithNoSpaces.
	self assert: critiques size equals: 2.
	
	critiques := self myCritiquesOnNodesInMethod: self class >> #blocksWithInconsistentSpaces.
	self assert: critiques size equals: 3
]
