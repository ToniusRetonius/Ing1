!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 't 4/21/2025 15:41:38'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack newStack .
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 't 4/21/2025 15:41:46'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack newStack .
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 't 4/21/2025 15:57:18'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack newStack .
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 't 4/21/2025 16:09:29'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack newStack .
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 9/16/2021 17:40:17'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'firstSomething'.
	secondPushedObject := 'secondSomething'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
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

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 't 4/22/2025 17:14:32'!
test01EmptyListEmptyStack
	
	|matches|
	
	matches :=  self listWithMatchesInStackWith: [:stack| stack ] andPrefix: 'Hola'.
	
	self assert:  (matches size = 0). ! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 't 4/22/2025 17:13:13'!
test02NoMatchNotEmptyStack
	|matches|
	
	matches := self listWithMatchesInStackWith: [:stack | stack push:'Mundo'] andPrefix: 'Hola'.
	
	self assert:  (matches size = 0). ! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 't 4/22/2025 17:16:11'!
test03MatchesInOrderCaseSensitiveNotEmptyStack
	|matches|
	
	matches := self listWithMatchesInStackWith: 
	[:stack | 
		stack push:'Hola'. 
		stack push:'hola'. 
		stack push:'Hola Mundo'.] 
	andPrefix: 'Hola'.
	
	self assert: (matches at:1) = 'Hola Mundo'.
	self assert: (matches at:2) = 'Hola'.
	! !


!SentenceFinderByPrefixTest methodsFor: 'remove repeated code' stamp: 't 4/22/2025 17:12:05'!
listWithMatchesInStackWith: aBlock andPrefix: aPrefix
	|stack finder matches|
	stack := OOStack new.
	
	aBlock value: stack.
	
	finder := SentenceFinderByPrefix new.
	
	matches :=  finder findIn: stack wordsWithPrefix: aPrefix .
	
	^matches ! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'first'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'adding' stamp: 't 4/21/2025 16:07:30'!
push: anElement
	
	|nuevo |
	nuevo := StackElement new..
	
	first next: nuevo .
	
	nuevo previous: first .
	nuevo value: anElement .
	nuevo next: NullElement new.
	
	first := nuevo .
	! !


!OOStack methodsFor: 'comparing' stamp: 't 4/21/2025 15:14:26'!
isEmpty
	^first isNull.! !


!OOStack methodsFor: 'initialization' stamp: 't 4/21/2025 15:59:16'!
initialize

	first := NullElement new.
! !


!OOStack methodsFor: 'removing' stamp: 't 4/21/2025 16:13:01'!
pop
	|ultimo|
	ultimo := first 	.
	first := first remove .
	^ ultimo value.
	
	! !


!OOStack methodsFor: 'accessing' stamp: 't 4/21/2025 15:19:37'!
first
	^ first ! !

!OOStack methodsFor: 'accessing' stamp: 't 4/21/2025 17:38:33'!
size
	|it size nulo| 
	it := first .
	size := 0.
	nulo := NullElement new.
	
	[it isKindOf: NullElement ] whileFalse: [size := size + 1. it := it previous ].
	
	^ size .! !

!OOStack methodsFor: 'accessing' stamp: 't 4/21/2025 17:25:28'!
top
	^ first value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 9/14/2023 08:12:21'!
stackEmptyErrorDescription
	
	^ 'stack is empty!!!!!!'! !


!OOStack class methodsFor: 'initialization' stamp: 't 4/21/2025 15:30:36'!
newStack
	^ self new initialize .! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'find' stamp: 't 4/21/2025 19:18:11'!
findIn: aStack wordsWithPrefix: aPrefix
	
	|it nulo coleccion res| 
	
	it := aStack first .
	nulo := NullElement new.
	coleccion := OrderedCollection new.
	
	[it isKindOf: NullElement ] whileFalse: [coleccion add: it value. it := it previous ].
	
	res := coleccion select:[:phrase | phrase beginsWith: aPrefix ].
	
	^ res
	
	! !


!classDefinition: #StackElement category: #'Stack-Exercise'!
Object subclass: #StackElement
	instanceVariableNames: 'value previous next'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackElement methodsFor: 'comparing' stamp: 't 4/21/2025 15:13:40'!
isNull
	^ false.! !


!StackElement methodsFor: 'accessing' stamp: 't 4/21/2025 15:48:41'!
next
	^ next! !

!StackElement methodsFor: 'accessing' stamp: 't 4/21/2025 15:35:17'!
previous
	^ previous ! !

!StackElement methodsFor: 'accessing' stamp: 't 4/21/2025 15:35:01'!
value
	^ value ! !


!StackElement methodsFor: 'binding' stamp: 't 4/21/2025 15:45:17'!
next: anStackElement
	next := anStackElement .! !

!StackElement methodsFor: 'binding' stamp: 't 4/21/2025 15:45:24'!
previous: anStackElement
	previous := anStackElement .! !

!StackElement methodsFor: 'binding' stamp: 't 4/21/2025 16:08:30'!
remove
	|previousElem|
	previousElem := self previous .
	
	self previous next: NullElement new.
	
	^ previousElem ! !

!StackElement methodsFor: 'binding' stamp: 't 4/21/2025 15:43:38'!
value: aValue
	value := aValue .! !


!classDefinition: #NullElement category: #'Stack-Exercise'!
StackElement subclass: #NullElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NullElement methodsFor: 'comparing' stamp: 't 4/21/2025 15:13:55'!
isNull
	^ true ! !


!NullElement methodsFor: 'accessing' stamp: 't 4/21/2025 15:48:34'!
next
	^ next! !

!NullElement methodsFor: 'accessing' stamp: 't 4/21/2025 17:32:52'!
previous! !

!NullElement methodsFor: 'accessing' stamp: 't 4/21/2025 17:11:49'!
value
	"en el evento de hacer un top"
	^ self error: OOStack stackEmptyErrorDescription! !


!NullElement methodsFor: 'binding' stamp: 't 4/21/2025 15:46:19'!
next: anStackElement
	next := anStackElement .! !

!NullElement methodsFor: 'binding' stamp: 't 4/21/2025 15:33:53'!
prev: anElement
	! !

!NullElement methodsFor: 'binding' stamp: 't 4/21/2025 17:13:07'!
remove
	^ self error: OOStack stackEmptyErrorDescription.! !
