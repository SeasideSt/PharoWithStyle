Class {
	#name : #ReTempsFormattingRuleTest,
	#superclass : #ReAbstractNodeCheckRuleTest,
	#category : #'PharoWithStyle-Tests'
}

{ #category : #violations }
ReTempsFormattingRuleTest >> invalid1 [

	| a|
	a := 1.
	^ a
]

{ #category : #violations }
ReTempsFormattingRuleTest >> invalid2 [

	|b |
	b := 2.
	^ b
]

{ #category : #violations }
ReTempsFormattingRuleTest >> invalid3 [

	| a  b |
	a := 1.
	b := 2.
	^ a + b
]

{ #category : #violations }
ReTempsFormattingRuleTest >> invalid4 [

	|  a b |
	a := 1.
	b := 2.
	^ a + b
]

{ #category : #violations }
ReTempsFormattingRuleTest >> invalid5 [
	
	| a b  |
	a := 1.
	b := 2.
	^ a + b
]

{ #category : #tests }
ReTempsFormattingRuleTest >> testRule [

	| critiques |
	
	critiques := self myCritiquesOnNodesInMethod: self class >> #valid.
	self assert: critiques size equals: 0.
	
	critiques := self myCritiquesOnNodesInMethod: self class >> #invalid1.
	self assert: critiques size equals: 1.
	
	critiques := self myCritiquesOnNodesInMethod: self class >> #invalid2.
	self assert: critiques size equals: 1.

	critiques := self myCritiquesOnNodesInMethod: self class >> #invalid3.
	self assert: critiques size equals: 1.
	
	critiques := self myCritiquesOnNodesInMethod: self class >> #invalid4 .
	self assert: critiques size equals: 1.
	
	critiques := self myCritiquesOnNodesInMethod: self class >> #invalid5.
	self assert: critiques size equals: 1
]

{ #category : #examples }
ReTempsFormattingRuleTest >> valid [

	| a b |
	a := 1.
	b := 2.
	^ a + b
]
