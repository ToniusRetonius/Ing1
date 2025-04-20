!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 't 4/11/2025 21:00:22'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	stack initialize .
	
	self assert: (stack collection) isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 't 4/11/2025 21:01:24'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: (stack collection ) isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 't 4/11/2025 21:04:14'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: (stack collection) isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 't 4/11/2025 21:07:04'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'firstSomething'.
	secondPushedObject := 'secondSomething'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack collection isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 't 4/11/2025 21:08:38'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack collection size = 1.
	stack top.
	self assert: stack collection size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: #'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 't 4/20/2025 15:07:45'!
test01EmptyStackEmptyList
	|stack listWithPhrases|
	
	stack := self createStack .
	listWithPhrases  := self listWithPhrasesInStack: stack withPrefix: 'Hola'. 
	
	self assert: listWithPhrases isEmpty.
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 't 4/20/2025 15:06:50'!
test02NotEmptyStackNoMatch
	|stack listWithPhrases|
	
	stack := self createStack.
	stack push: 'null pattern'.
	
	listWithPhrases  := self listWithPhrasesInStack: stack withPrefix: 'Hola' .
	
	self assert: listWithPhrases isEmpty.
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 't 4/20/2025 15:06:22'!
test03NotEmptyStackManyMatchesInOrder
	|stack listWithPhrases|
	
	stack := self createStack .
	
	stack push: 'Hola mundo'.
	stack push: 'Hola ing1'.
	stack push: 'Hola parcial'.
	stack push: 'Hola ing2'.
	
	listWithPhrases  := self listWithPhrasesInStack: stack withPrefix: 'Hola'.
	
	self assert: (listWithPhrases size = 4).
	self assert: ((listWithPhrases at: 1) = 'Hola mundo' ).
	self assert: ((listWithPhrases at: 2) = 'Hola ing1' ).
	self assert: ((listWithPhrases at: 3) = 'Hola parcial' ).
	self assert: ((listWithPhrases at: 4) = 'Hola ing2' ).

	! !


!SentenceFinderByPrefixTest methodsFor: 'repeated code elimination' stamp: 't 4/20/2025 15:01:38'!
createStack
	|stack|
	stack := OOStack new.
	stack initialize .
	^ stack ! !

!SentenceFinderByPrefixTest methodsFor: 'repeated code elimination' stamp: 't 4/20/2025 15:05:51'!
listWithPhrasesInStack: aStack withPrefix: aPrefix
	
	|sentenceFinder listWithPhrases|
	
	sentenceFinder := SentenceFinderByPrefix new.

	^ listWithPhrases  := sentenceFinder findPhrasesWithPrefix: aPrefix inStack: aStack .! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'collection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 't 4/11/2025 20:57:56'!
initialize
	collection := OrderedCollection new.
	! !


!OOStack methodsFor: 'adding' stamp: 't 4/11/2025 21:01:04'!
push: anElement
	collection add: anElement .! !


!OOStack methodsFor: 'removing' stamp: 't 4/11/2025 21:33:50'!
pop
	|last |
	
	last := self top.
	
	collection removeLast. 
	
	^ last .! !


!OOStack methodsFor: 'accessing' stamp: 't 4/11/2025 20:59:31'!
collection
	^ collection! !

!OOStack methodsFor: 'accessing' stamp: 't 4/11/2025 21:22:30'!
top
	collection isEmpty ifTrue: [self error: OOStack stackEmptyErrorDescription ].
	^collection last.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 9/14/2023 08:12:21'!
stackEmptyErrorDescription
	
	^ 'stack is empty!!!!!!'! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'exploration' stamp: 't 4/20/2025 14:28:08'!
findPhrasesWithPrefix: aPrefix inStack: aStack
	"buscamos todas las palabras con aPrefix como prefijo de las frases almacenadas en el stack y las devolvemos en orden"
	|lista|
	lista := aStack collection .
	
	"como es una Ordered Collection..."
	^ lista select: [:phrases | phrases beginsWith: aPrefix ]! !
