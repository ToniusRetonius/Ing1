!classDefinition: #CantSuspend category: #'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'tom 4/7/2025 10:35:08'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook  |
	
	customerBook := CustomerBook new.
	
	self mustDo: [customerBook addCustomerNamed: 'John Lennon'] inMilliseconds: 50.
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'tom 4/7/2025 10:36:39'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self mustDo: [customerBook addCustomerNamed: 'Paul McCartney'.] inMilliseconds: 100
	
	
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'tom 4/7/2025 12:16:48'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	
	self ifWeTryTo: [ customerBook addCustomerNamed: ''.]  
	withAGivenError: Error 
	then: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'tom 4/7/2025 12:15:52'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook |
			
	customerBook := CustomerBook new.

	self ifWeTryTo: 
	[ customerBook addCustomerNamed: 'John Lennon'. customerBook removeCustomerNamed: 'Paul McCartney'. ] 
	withAGivenError: NotFound 
	then: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: 'John Lennon') ].
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'tom 4/7/2025 14:39:02'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook |
	customerBook := CustomerBook new.
	
	self addAndSuspend: 'Paul McCartney' inBook: customerBook.
	self selfAssertNumber: 1 inBook: customerBook 
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'tom 4/7/2025 14:48:20'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self addAndSuspend: 'Paul McCartney' inBook: customerBook.
	customerBook removeCustomerNamed: 'Paul McCartney'.
	
	self selfAssertNumber: 0 inBook: customerBook.
	self deny: (customerBook includesCustomerNamed: 'Paul McCartney').


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'tom 4/7/2025 14:25:19'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook |
			
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: 'John Lennon'.
	self catchCantSuspend: 'George Harrison' inBook: customerBook.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'tom 4/7/2025 14:20:11'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook |
			
	customerBook := CustomerBook new.
	self addAndSuspend: 'John Lennon' inBook: customerBook.
	self catchCantSuspend: 'John Lennon' inBook: customerBook. 
	
! !


!CustomerBookTest methodsFor: 'repeatedCodeMethods' stamp: 'tom 4/7/2025 12:43:56'!
addAndSuspend: aName inBook: aBook
	
	aBook addCustomerNamed: aName . 
	aBook suspendCustomerNamed: aName .! !

!CustomerBookTest methodsFor: 'repeatedCodeMethods' stamp: 'tom 4/7/2025 14:25:58'!
catchCantSuspend: aName inBook: aBook  
	
	[ aBook suspendCustomerNamed: aName .
	self fail ]
		on: CantSuspend
		do: [ :anError | 
			self assert: aBook numberOfCustomers = 1.
			self assert: (aBook includesCustomerNamed: 'John Lennon') ]! !

!CustomerBookTest methodsFor: 'repeatedCodeMethods' stamp: 'tom 4/7/2025 11:43:32'!
do: aBlock assertThat: anAssertion
	
	[aBlock value.].[anAssertion value]! !

!CustomerBookTest methodsFor: 'repeatedCodeMethods' stamp: 'tom 4/7/2025 10:47:07'!
ifWeTryTo: aBlockThatFails withAGivenError: anError then: doSomething
	
	[aBlockThatFails value. self fail] on: anError  do: doSomething ! !

!CustomerBookTest methodsFor: 'repeatedCodeMethods' stamp: 'tom 4/7/2025 10:38:25'!
mustDo: aBlock inMilliseconds: milliseconds
	
	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aBlock value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (milliseconds * millisecond)! !

!CustomerBookTest methodsFor: 'repeatedCodeMethods' stamp: 'tom 4/7/2025 12:33:30'!
selfAssertNumber: aNumber inBook: aBook 

	self assert: 0 equals: aBook numberOfActiveCustomers.
	self assert: aNumber equals: aBook numberOfSuspendedCustomers.
	self assert: aNumber equals: aBook numberOfCustomers.! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 9/17/2020 07:23:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
removeCustomerNamed: aName 
 
	1 to: active size do: 
	[ :index |
		aName = (active at: index)
			ifTrue: [
				active removeAt: index.
				^ aName 
			] 
	].

	1 to: suspended size do: 	
	[ :index |
		aName = (suspended at: index)
			ifTrue: [
				suspended removeAt: index.
				^ aName 
			] 
	].
	
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'repeatedCode' stamp: 'tom 4/7/2025 14:54:40'!
iterateInList: aList  andRemoveName: aName
	
	1 to: aList do: 
	[ :index |
		aName = (aList at: index)
			ifTrue: [
				aList removeAt: index.
				^ aName 
			] 
	].
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/9/2023 22:25:52'!
customerAlreadyExistsErrorMessage

	^'Customer already exists!!!!!!'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/9/2023 22:25:56'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty!!!!!!'! !
