Class {
	#name : #ReParensFormattingRuleTest,
	#superclass : #ReAbstractNodeCheckRuleTest,
	#category : #'PharoWithStyle-Tests'
}

{ #category : #violations }
ReParensFormattingRuleTest >> invalid1 [

	( 1 + 2)
]

{ #category : #violations }
ReParensFormattingRuleTest >> invalid2 [

	(1 + 2 )
]

{ #category : #tests }
ReParensFormattingRuleTest >> testRule [

	| critiques |
	
	critiques := self myCritiquesOnNodesInMethod: self class >> #valid.
	self assert: critiques size equals: 0.
	
	critiques := self myCritiquesOnNodesInMethod: self class >> #invalid1.
	self assert: critiques size equals: 1.
	
	critiques := self myCritiquesOnNodesInMethod: self class >> #invalid2.
	self assert: critiques size equals: 1
]

{ #category : #examples }
ReParensFormattingRuleTest >> valid [

	(1 + 2)
]
