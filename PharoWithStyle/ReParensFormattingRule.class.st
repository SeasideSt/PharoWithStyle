Class {
	#name : #ReParensFormattingRule,
	#superclass : #ReNodeBasedRule,
	#category : #PharoWithStyle
}

{ #category : #helpers }
ReParensFormattingRule >> anchorFor: aNode [

	^ ReIntervalSourceAnchor
			entity: aNode
			interval: (Interval from: aNode start to: aNode stop)
]

{ #category : #running }
ReParensFormattingRule >> basicCheck: aNode [

	| found start stop |
	^ aNode isValue and: [
		  aNode hasParentheses and: [
			  found := false.
			  start := aNode startWithoutParentheses.
			  stop := aNode stopWithoutParentheses.
			  aNode parentheses reverseDo: [ :interval |
				  found := found or: [ start - 1 ~= interval first or: [ stop + 1 ~= interval last ] ].
				  start := interval first.
				  stop := interval last ].
			  found ] ]
]

{ #category : #accessing }
ReParensFormattingRule >> group [

	^ 'Formatting'
]

{ #category : #accessing }
ReParensFormattingRule >> name [

	^ 'Parentheses formatting'
]

{ #category : #accessing }
ReParensFormattingRule >> rationale [

	^ 'There should be no spaces inside parentheses.'
]
