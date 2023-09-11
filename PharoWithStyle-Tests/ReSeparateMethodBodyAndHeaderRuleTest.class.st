Class {
	#name : #ReSeparateMethodBodyAndHeaderRuleTest,
	#superclass : #ReAbstractRuleTestCase,
	#category : #'PharoWithStyle-Tests'
}

{ #category : #examples }
ReSeparateMethodBodyAndHeaderRuleTest >> emptyBody [

]

{ #category : #violations }
ReSeparateMethodBodyAndHeaderRuleTest >> noSeparation [
	^ 'Not a good way'
]

{ #category : #violations }
ReSeparateMethodBodyAndHeaderRuleTest >> noSeparation2 [
	| some |
	some := 1.
	^ some
]

{ #category : #violations }
ReSeparateMethodBodyAndHeaderRuleTest >> noSeparation3 [
	"I have a comment"
	| some |
	some := 1.
	^ some
]

{ #category : #violations }
ReSeparateMethodBodyAndHeaderRuleTest >> noSeparation4 [
	[ | some |
	some := 1 ].
	^ #foobar
]

{ #category : #violations }
ReSeparateMethodBodyAndHeaderRuleTest >> noSeparation5 [
	< pragma >
	^ #foobar
]

{ #category : #violations }
ReSeparateMethodBodyAndHeaderRuleTest >> noSeparation6 [

	"I have a comment"
	^ #foobar
]

{ #category : #examples }
ReSeparateMethodBodyAndHeaderRuleTest >> separationWithOtherWhitespace [
	"I have a comment"
	
	| some |
	some := 1.
	^ some
]

{ #category : #tests }
ReSeparateMethodBodyAndHeaderRuleTest >> testRule [

	| critiques |
	
	(self class selectorsInCategory: 'violations') do: [ :selector |
		critiques := self myCritiquesOnMethod: self class >> selector.
		self assert: critiques size equals: 1 ].
	
	(self class selectorsInCategory: 'examples') do: [ :selector |
		critiques := self myCritiquesOnMethod: self class >> selector.
		self assert: critiques size equals: 0 ]
]

{ #category : #examples }
ReSeparateMethodBodyAndHeaderRuleTest >> withSeparation [
	"I have a comment"

	| some |
	some := 1.
	^ some
]
