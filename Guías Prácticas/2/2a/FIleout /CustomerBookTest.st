'From Cuis6.3 [latest update: #6350] on 10 April 2025 at 8:21:26 am'!
!classDefinition: #CustomerBookTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'tom 4/8/2025 19:30:24'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook  |
	
	customerBook := CustomerBook new.
	
	"self mustDo: [customerBook addCustomerNamed: 'John Lennon'] inMilliseconds: 50."
	self mustDo: [customerBook addCustomerNamed: 'John Lennon']  inLessThan: (50 * millisecond). ! !

!CustomerBookTest methodsFor: 'testing' stamp: 'tom 4/8/2025 19:31:03'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	"self mustDo: [customerBook addCustomerNamed: 'Paul McCartney'.] inMilliseconds: 100."
	self mustDo: [customerBook addCustomerNamed: 'Paul McCartney'.]  inLessThan: (100 * millisecond ).
	
	
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'tom 4/8/2025 19:49:12'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	
	self blockMustFail: [ customerBook addCustomerNamed: ''.]  
	withAGivenError: Error 
	then: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'tom 4/8/2025 19:48:51'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook |
			
	customerBook := CustomerBook new.

	self blockMustFail: 
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

!CustomerBookTest methodsFor: 'repeatedCodeMethods' stamp: 'tom 4/8/2025 20:06:34'!
blockMustFail: aBlockThatFails withAGivenError: anError then: doSomething
	
	"si el blockthatfails no falla ... por ello ponemos el self fail. para que falle el test"
	"el test pasa si no lo ponemos porque está bien implementado el addCustomerNamed (ataja los casos problemáticos)"
	[aBlockThatFails value.self fail] on: anError  do: doSomething ! !

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

!CustomerBookTest methodsFor: 'repeatedCodeMethods' stamp: 'tom 4/8/2025 19:43:01'!
measureRuntimeBlock: aBlockToMeasure
	
	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aBlockToMeasure value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	^(millisecondsAfterRunning - millisecondsBeforeRunning).! !

!CustomerBookTest methodsFor: 'repeatedCodeMethods' stamp: 'tom 4/8/2025 19:42:33'!
mustDo: aBlock inLessThan: aTimeLimit
	
	self assert: (self measureRuntimeBlock: aBlock) < aTimeLimit! !

!CustomerBookTest methodsFor: 'repeatedCodeMethods' stamp: 'tom 4/8/2025 19:16:42'!
mustDo: aBlockToMeasure inMilliseconds: milliseconds
	
	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aBlockToMeasure value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (milliseconds * millisecond)! !

!CustomerBookTest methodsFor: 'repeatedCodeMethods' stamp: 'tom 4/7/2025 12:33:30'!
selfAssertNumber: aNumber inBook: aBook 

	self assert: 0 equals: aBook numberOfActiveCustomers.
	self assert: aNumber equals: aBook numberOfSuspendedCustomers.
	self assert: aNumber equals: aBook numberOfCustomers.! !
