Class {
	#name : #ReBlockFormattingRule,
	#superclass : #ReAbstractRule,
	#category : #PharoWithStyle
}

{ #category : #'testing - interest' }
ReBlockFormattingRule class >> checksNode [

	^ true
]

{ #category : #helpers }
ReBlockFormattingRule >> anchorFor: aNode [

	^ ReIntervalSourceAnchor
			entity: aNode
			interval: (Interval from: aNode start to: aNode stop)
]

{ #category : #running }
ReBlockFormattingRule >> basicCheck: anEntity [

	| source before after |
	anEntity isBlock ifFalse: [ ^ false ].
	
	source := anEntity source.
	(source notNil and: [ anEntity left notNil and: [ anEntity right notNil ] ]) ifFalse:[ ^ false ].
	
	before := source at: anEntity left + 1 ifAbsent: [ $  ].
	after := source at: anEntity right - 1 ifAbsent: [ $  ].
	(before isSeparator and: [ after isSeparator ])
		ifFalse: [ ^ true ]
		ifTrue: [
			anEntity bar ifNotNil: [
				before := source at: anEntity bar - 1 ifAbsent: [ $  ].
				after := source at: anEntity bar + 1 ifAbsent: [ $  ].
				(before isSeparator and: [ after isSeparator ]) ifFalse: [ ^ true ] ] ].
	^ false
]

{ #category : #accessing }
ReBlockFormattingRule >> group [

	^ 'Formatting'
]

{ #category : #accessing }
ReBlockFormattingRule >> name [

	^ 'Block formatting'
]

{ #category : #accessing }
ReBlockFormattingRule >> rationale [

	^ 'There should spaces at the beginning and end of block.'
]
