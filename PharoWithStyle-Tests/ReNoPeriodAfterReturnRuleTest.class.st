Class {
	#name : #ReNoPeriodAfterReturnRuleTest,
	#superclass : #ReAbstractRuleTestCase,
	#category : #'PharoWithStyle-Tests'
}

{ #category : #examples }
ReNoPeriodAfterReturnRuleTest >> lastPeriods [

	#(true false) atRandom ifTrue: [
		self crTrace: '1'.
		self crTrace: '2'. ].
	self crTrace: '3'.
	self crTrace: '4'.
]

{ #category : #helpers }
ReNoPeriodAfterReturnRuleTest >> myCritiquesOnNodesInMethod: aMethod [

	| critiques |

	critiques := OrderedCollection new.
	aMethod ast nodesDo: [ :node | 
		self subjectUnderTest new
			check: node forCritiquesDo:[ :critique | critiques add: critique ] ].
	^ critiques
]

{ #category : #violations }
ReNoPeriodAfterReturnRuleTest >> periodAfterReturn [

	#(true false) atRandom ifTrue: [
		self crTrace: '1'.
		^ self crTrace: '2'. ].
	self crTrace: '3'.
	^ self crTrace: '4'.
]

{ #category : #tests }
ReNoPeriodAfterReturnRuleTest >> testRule [

	| critiques |

	critiques := self myCritiquesOnNodesInMethod: self class >> #periodAfterReturn.
	self assert: critiques size equals: 2.
	critiques := self myCritiquesOnNodesInMethod: self class >> #lastPeriods.
	self assert: critiques size equals: 0
]
