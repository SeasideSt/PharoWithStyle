Class {
	#name : #ReBlockFormattingRule,
	#superclass : #ReNodeMatchRule,
	#category : #PharoWithStyle
}

{ #category : #'testing - interest' }
ReBlockFormattingRule class >> checksMethod [

	^ true
]

{ #category : #hooks }
ReBlockFormattingRule >> afterCheck: aNode mappings: mappingDict [

	| source before after |
	source := aNode source.
	(source notNil and: [ aNode left notNil and: [ aNode right notNil ] ]) ifFalse:[ ^ false ].
	
	before := source at: aNode left + 1 ifAbsent: [ $  ].
	after := source at: aNode right - 1 ifAbsent: [ $  ].
	(before isSeparator and: [ after isSeparator ])
		ifFalse: [ ^ true ]
		ifTrue: [
			aNode bar ifNotNil: [
				before := source at: aNode bar - 1 ifAbsent: [ $  ].
				after := source at: aNode bar + 1 ifAbsent: [ $  ].
				(before isSeparator and: [ after isSeparator ]) ifFalse: [ ^ true ] ] ].
	^ false
]

{ #category : #accessing }
ReBlockFormattingRule >> group [
	^ 'Formatting'
]

{ #category : #initialization }
ReBlockFormattingRule >> initialize [

	super initialize.
	self
		matches: '[ :`@args | | `@temps | ``@.stmts ]'
		"do: [ :node :answer |
			answer isNil
				ifFalse: [ answer ]
				ifTrue: [
					| source |
					source := node source.
					(source notNil and: [ node left notNil and: [ node right notNil ] ]) ifTrue: [
						| before after |
						before := source at: node left + 1 ifAbsent: [ $ ].
						after := source at: node right - 1 ifAbsent: [ $ ].
						(before isSeparator and: [ after isSeparator ])
							ifFalse: [ node ]
							ifTrue: [
								node bar notNil ifTrue: [
									before := source at: node bar - 1 ifAbsent: [ $ ].
									after := source at: node bar + 1 ifAbsent: [ $ ].
									(before isSeparator and: [ after isSeparator ])
										ifFalse: [ node ] ] ] ] ] ]"
]

{ #category : #accessing }
ReBlockFormattingRule >> name [
	^ 'Block formatting'
]

{ #category : #accessing }
ReBlockFormattingRule >> rationale [
	^ 'There should spaces at the beginning and end of block.'
]
