!classDefinition: #PortfolioTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'balance tests' stamp: 'tom 6/3/2025 21:34:24'!
test01PortfolioBalanceOneEmptyAccount
	
	| account portfolio |
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolio addService: account .
	
	self assert: portfolio balance equals: 0! !

!PortfolioTest methodsFor: 'balance tests' stamp: 'tom 6/3/2025 21:34:24'!
test02PortfolioBalanceOneAccountWithCash
	
	| account portfolio |
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	
	portfolio addService: account .
	
	self assert: portfolio balance equals: 100! !

!PortfolioTest methodsFor: 'balance tests' stamp: 'tom 6/3/2025 21:34:24'!
test03PortfolioBalanceTwoAccountsWithCash
	
	| account1  account2 portfolio |
	portfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 100 on: account1.
	Deposit register: 200 on: account2.	
	
	portfolio addService: account1 ; addService: account2 .
		
	self assert: portfolio balance equals: 300! !

!PortfolioTest methodsFor: 'balance tests' stamp: 'tom 6/3/2025 21:36:28'!
test04PortfolioBalanceWithPortfolioNotEmpty
	
	| account1  portfolio1 portfolio2 |
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	
	account1 := ReceptiveAccount new.

	Deposit register: 100 on: account1.
	
	portfolio1 addService: portfolio2 .
	portfolio2 addService: account1.
		
	self assert: portfolio1 balance equals: 100! !


!PortfolioTest methodsFor: 'transactions tests' stamp: 'tom 6/3/2025 17:49:55'!
test01EmptyPortfolioHasNoTransactions
	
	| portfolio |
	
	portfolio := Portfolio new.
	
	self assert: portfolio transactions equals: OrderedCollection new.! !

!PortfolioTest methodsFor: 'transactions tests' stamp: 'tom 6/3/2025 21:34:23'!
test02PortfolioWithOneAccountWithDepositHasDepositTransaction
	
	| portfolio account |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	Deposit register: 100 on: account .
	
	portfolio addService: account .
	
	self assert: portfolio transactions equals: account transactions ! !

!PortfolioTest methodsFor: 'transactions tests' stamp: 'tom 6/3/2025 21:34:24'!
test03PortfolioWithTwoAccountsWithDepositsHasTransactions
	
	| portfolio account account2 transactions |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 100 on: account.
	Deposit register: 100 on: account2.
	
	portfolio addService: account ; addService: account2 .
	
	transactions := OrderedCollection new.
	transactions addAllLast: (account transactions) ; addAllLast: (account2 transactions).
	
	self assert: portfolio transactions equals: transactions ! !

!PortfolioTest methodsFor: 'transactions tests' stamp: 'tom 6/3/2025 21:36:42'!
test04PortfolioWithNotEmptyPortfolioHasTransactions
	
	| portfolio account account2 transactions portfolio2 |
	
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 100 on: account.
	Deposit register: 100 on: account2.
	
	portfolio2 addService: portfolio .
	portfolio addService: account ; addService: account2 .
	
	transactions := OrderedCollection new.
	transactions addAllLast: (account transactions) ; addAllLast: (account2 transactions).
	
	self assert: portfolio2 transactions equals: portfolio transactions ! !


!PortfolioTest methodsFor: 'hasRegistered tests' stamp: 'tom 6/3/2025 18:37:21'!
test01EmptyPortfolioHasNoRegisteredTransactions
	
	| account deposit portfolio |
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	
	self assert: (portfolio hasRegistered: deposit) equals: false! !

!PortfolioTest methodsFor: 'hasRegistered tests' stamp: 'tom 6/3/2025 21:34:24'!
test02PortfolioWithOneAccountNotEmptyHasOneRegisteredTransaction
	
	| account deposit portfolio |
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	
	portfolio addService: account .
	
	self assert: (portfolio hasRegistered: deposit) equals: true! !

!PortfolioTest methodsFor: 'hasRegistered tests' stamp: 'tom 6/3/2025 21:34:24'!
test03PortfolioWithTwoAccountsNotEmptyHasTwoRegisteredTransactions
	
	| account deposit portfolio account2 deposit2 |
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	deposit := Deposit register: 100 on: account.
	deposit2 := Deposit register: 300 on: account2.
	
	portfolio addService: account ; addService: account2 .
	
	self assert: (portfolio hasRegistered: deposit) equals: true.
	self assert: (portfolio hasRegistered: deposit2) equals: true! !

!PortfolioTest methodsFor: 'hasRegistered tests' stamp: 'tom 6/3/2025 21:36:50'!
test04PortfolioWithNotEmptyPortfolioHasRegisteredTransactions
	
	| account deposit portfolio portfolio2 |
	portfolio := Portfolio new.
	portfolio2 := Portfolio  new.
	account := ReceptiveAccount new.
		
	deposit := Deposit register: 100 on: account.
	
	portfolio addService: portfolio2 .
	portfolio2 addService: account .
	
	self assert: (portfolio hasRegistered: deposit) equals: true.
	! !


!PortfolioTest methodsFor: 'structural tests' stamp: 'tom 6/3/2025 21:59:15'!
test01AddingAnExistingAccountToPortfolioFails
	
	| portfolio account |
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	
	self should: [portfolio addService: account ; addService: account ] raise: Error withMessageText: Portfolio repeatedAccountErrorMessage
	
	
	! !

!PortfolioTest methodsFor: 'structural tests' stamp: 'tom 6/6/2025 15:36:15'!
test02AddingAnExistingAccountToPortfolioWithParentFails
	
	| portfolio account portfolio2 |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	
	account := ReceptiveAccount new.
	
	
	self  should: [ portfolio addService: account.  portfolio addService: portfolio2 . portfolio2 addService: account.]  raise: Error  withMessageText: Portfolio repeatedAccountErrorMessage 
	
	
	! !

!PortfolioTest methodsFor: 'structural tests' stamp: 'tom 6/6/2025 15:40:18'!
test03AddingAnExistingAccountInFirstPortfolioInLastAnidatedPortfolioFails
	
	| portfolio account portfolio2 portfolio3 |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	
	account  := ReceptiveAccount new.
	
	
	self  should: [ portfolio addService: account.  portfolio addService: portfolio2 . portfolio2 addService: portfolio3. portfolio3 addService: account ]  raise: Error  withMessageText: Portfolio repeatedAccountErrorMessage 
	
	
	! !

!PortfolioTest methodsFor: 'structural tests' stamp: 'tom 6/6/2025 15:59:11'!
test04AddingGrandParentPortfolioToPorfolioFails
	
	| portfolio portfolio2 portfolio3 |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.	
	
	self  should: [  portfolio addService: portfolio2 . portfolio2 addService: portfolio3. portfolio3 addService: portfolio ]  raise: Error  withMessageText: Portfolio repeatedAccountErrorMessage 
	
	
	! !


!classDefinition: #ReceptiveAccountTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:07:53'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:07:57'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:08:01'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:08:26'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw account |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:08:12'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #AccountTransaction category: #'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'tom 5/27/2025 21:31:47'!
register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !


!classDefinition: #Deposit category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'tom 5/27/2025 21:50:38'!
sumUntilNow: suma 
	^ suma + value ! !

!Deposit methodsFor: 'value' stamp: 'tom 5/27/2025 21:38:29'!
value

	^ value ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'tom 5/27/2025 21:30:41'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'tom 5/27/2025 21:51:20'!
sumUntilNow: suma 
	^ suma - value ! !

!Withdraw methodsFor: 'value' stamp: 'tom 5/27/2025 21:34:26'!
value

	^ value ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'tom 5/27/2025 21:35:10'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #FinancialService category: #'Portfolio-Ejercicio'!
Object subclass: #FinancialService
	instanceVariableNames: 'parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!FinancialService methodsFor: 'finance' stamp: 'tom 6/3/2025 21:29:19'!
balance
	self subclassResponsibility ! !

!FinancialService methodsFor: 'finance' stamp: 'tom 6/3/2025 21:30:03'!
hasRegistered: aTransaction 
	self subclassResponsibility ! !

!FinancialService methodsFor: 'finance' stamp: 'tom 6/3/2025 21:29:26'!
transactions
	self subclassResponsibility ! !


!FinancialService methodsFor: 'associating' stamp: 'tom 6/6/2025 15:31:55'!
addAsParent: aPortfolio
	
	parents add: aPortfolio ! !


!classDefinition: #Portfolio category: #'Portfolio-Ejercicio'!
FinancialService subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'associating' stamp: 'tom 6/6/2025 15:36:33'!
addService: account 

	self assertCanAdd: account .	
	"asignamos self como padre"
	account addAsParent: self.
	"agregamos"
	accounts add: account.
	
	! !


!Portfolio methodsFor: 'initialization' stamp: 'tom 6/3/2025 22:02:08'!
initializeEmpty

	accounts := OrderedCollection new.

	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'finance' stamp: 'tom 6/3/2025 21:32:16'!
balance
	
	^accounts sum:[:account | account balance ] ifEmpty: [0]! !

!Portfolio methodsFor: 'finance' stamp: 'tom 6/3/2025 21:37:15'!
hasRegistered: aTransaction 
	
	^accounts anySatisfy: [:account | (account hasRegistered: aTransaction) ]! !

!Portfolio methodsFor: 'finance' stamp: 'tom 6/3/2025 21:37:55'!
transactions
	| res |
	
	res := OrderedCollection new.
	
	"Add each element of aCollection at the end of me. Answer aCollection."
	accounts do:[:anAccount | res addAllLast: (anAccount transactions )]. 
	
	^ res! !


!Portfolio methodsFor: 'error handling' stamp: 'tom 6/6/2025 16:04:08'!
assertCanAdd: aFinancialService 
	
	"si soy yo al que quieren agregar"
	(self = aFinancialService ) ifTrue: [self error: self class repeatedAccountErrorMessage].
	
	"down search"
	(accounts anySatisfy: [:service | aFinancialService = service ]) ifTrue: [self error: self class repeatedAccountErrorMessage].
	
	"up search"
	parents do:[:father | father assertCanAdd: aFinancialService ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'instance creation' stamp: 'tom 6/3/2025 15:44:33'!
new 
	
	^self basicNew initializeEmpty! !


!Portfolio class methodsFor: 'error handling' stamp: 'tom 6/3/2025 21:51:33'!
repeatedAccountErrorMessage
	^'Repeated account'! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Ejercicio'!
FinancialService subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'tom 6/6/2025 15:30:57'!
initialize

	super initialize.
	transactions := OrderedCollection new.
	parents := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'tom 5/27/2025 21:56:42'!
balance
	"si hacemos un balanceValue (viola el encapsulamiento)"
	"nada diferencia deposit y withdraw a priori (para calcular el balance si hacemos un mensaje que ambos responden de manera diferente)"
	"^transactions sum: [ :aTransaction | aTransaction valueForBalance ] ifEmpty: [ 0 ]"
	"la otra es : dos collections (pero queremos dejar esa jerarquía porque nos piden eso, pero sin violar encapsulamiento)"
	"tenemos que desarmar el sum en un do, para ver cómo se hace la suma para agarrar cosas de ahí y encapsular para que las haga el ..."
	
	"^transactions sum: [ :aTransaction | aTransaction  ] ifEmpty: [ 0 ]."
	"
	| suma |
	suma  := 0.
	transactions do:[ :aTransaction | suma := aTransaction sumUntilNow: suma].
	^ suma 
	"
	
	^transactions inject:0 into:[:suma :aTransaction | aTransaction sumUntilNow: suma].! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'tom 6/3/2025 16:24:23'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !
