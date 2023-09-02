Class {
	#name : #ReSeparateMethodBodyAndHeaderRule,
	#superclass : #ReAbstractRule,
	#category : #PharoWithStyle
}

{ #category : #'testing - interest' }
ReSeparateMethodBodyAndHeaderRule class >> checksMethod [

	^ true
]

{ #category : #helpers }
ReSeparateMethodBodyAndHeaderRule >> anchorFor: aNode [

	| endOfFirstLine |
	endOfFirstLine := aNode methodNode body hasTemporaries
		ifTrue: [ aNode methodNode body rightBar + 1 ]
		ifFalse:[ aNode methodNode body statements first stop + 1 ].

	^ ReIntervalSourceAnchor
			entity: aNode methodNode body
			interval: (Interval from: aNode methodNode body start to: endOfFirstLine)
]

{ #category : #running }
ReSeparateMethodBodyAndHeaderRule >> basicCheck: anEntity [

	| endOfHeader startOfBody sourceCodeBetweenEndOfHeaderAndStartOfBody |
	endOfHeader:= anEntity methodNode arguments
		ifEmpty: [ anEntity methodNode selector keywords first size + 1 ]
		ifNotEmpty: [
			| lastArgument |
			lastArgument := anEntity methodNode arguments last.
			lastArgument stop ].
	startOfBody := anEntity methodNode body start.
	startOfBody < endOfHeader ifTrue:[ ^ false ].
	"Check if there are two consecutive <cr> characters only separated by whitespace in the lines between the end of the header and the start of the body"
	sourceCodeBetweenEndOfHeaderAndStartOfBody := anEntity methodNode sourceCode copyFrom: endOfHeader to: startOfBody - 1.
	^ (sourceCodeBetweenEndOfHeaderAndStartOfBody matchesRegex: '.*\r+\s*\r+.*') not
]

{ #category : #accessing }
ReSeparateMethodBodyAndHeaderRule >> group [

	^ 'Formatting'
]

{ #category : #accessing }
ReSeparateMethodBodyAndHeaderRule >> name [

	^ 'Separate signature and comments from method body'
]

{ #category : #accessing }
ReSeparateMethodBodyAndHeaderRule >> rationale [

	^ 'Make sure that the reader can identify the beginning of the method body by placing an empty line between the method signature and the method body'
]
