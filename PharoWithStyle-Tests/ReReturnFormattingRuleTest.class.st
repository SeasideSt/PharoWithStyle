Class {
	#name : #ReReturnFormattingRuleTest,
	#superclass : #ReAbstractNodeCheckRuleTest,
	#category : #'PharoWithStyle-Tests'
}

{ #category : #violations }
ReReturnFormattingRuleTest >> invalid1 [

	^1
]

{ #category : #violations }
ReReturnFormattingRuleTest >> invalid2 [

	^  1
]

{ #category : #tests }
ReReturnFormattingRuleTest >> testRule [

	| critiques |
	
	critiques := self myCritiquesOnNodesInMethod: self class >> #valid.
	self assert: critiques size equals: 0.
	
	critiques := self myCritiquesOnNodesInMethod: self class >> #invalid1.
	self assert: critiques size equals: 1.
	
	critiques := self myCritiquesOnNodesInMethod: self class >> #invalid2.
	self assert: critiques size equals: 1
]

{ #category : #examples }
ReReturnFormattingRuleTest >> valid [

	^ 1
]
