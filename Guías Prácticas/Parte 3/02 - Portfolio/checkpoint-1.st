!classDefinition: #PortfolioTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'balance tests' stamp: 'tom 6/3/2025 15:47:20'!
test01PortfolioBalanceOneEmptyAccount
	
	| account portfolio |
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolio addAccount: account .
	
	self assert: portfolio balance equals: 0! !

!PortfolioTest methodsFor: 'balance tests' stamp: 'tom 6/3/2025 15:50:44'!
test02PortfolioBalanceOneAccountWithCash
	
	| account portfolio |
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	
	portfolio addAccount: account .
	
	self assert: portfolio balance equals: 100! !

!PortfolioTest methodsFor: 'balance tests' stamp: 'tom 6/3/2025 15:56:22'!
test03PortfolioBalanceTwoAccountsWithCash
	
	| account1  account2 portfolio |
	portfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 100 on: account1.
	Deposit register: 200 on: account2.	
	
	portfolio addAccount: account1 ; addAccount: account2 .
		
	self assert: portfolio balance equals: 300! !

!PortfolioTest methodsFor: 'balance tests' stamp: 'tom 6/3/2025 16:05:18'!
test04PortfolioBalanceWithPortfolioNotEmpty
	
	| account1  portfolio1 portfolio2 |
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	
	account1 := ReceptiveAccount new.

	Deposit register: 100 on: account1.
	
	portfolio1 addPortfolio: portfolio2 .
	portfolio2 addAccount: account1.
		
	self assert: portfolio1 balance equals: 100! !


!PortfolioTest methodsFor: 'transactions tests' stamp: 'tom 6/3/2025 17:49:55'!
test01EmptyPortfolioHasNoTransactions
	
	| portfolio |
	
	portfolio := Portfolio new.
	
	self assert: portfolio transactions equals: OrderedCollection new.! !

!PortfolioTest methodsFor: 'transactions tests' stamp: 'tom 6/3/2025 17:53:58'!
test02PortfolioWithOneAccountWithDepositHasDepositTransaction
	
	| portfolio account |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	Deposit register: 100 on: account .
	
	portfolio addAccount: account .
	
	self assert: portfolio transactions equals: account transactions ! !

!PortfolioTest methodsFor: 'transactions tests' stamp: 'tom 6/3/2025 18:23:40'!
test03PortfolioWithTwoAccountsWithDepositsHasTransactions
	
	| portfolio account account2 transactions |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 100 on: account.
	Deposit register: 100 on: account2.
	
	portfolio addAccount: account ; addAccount: account2 .
	
	transactions := OrderedCollection new.
	transactions addAllLast: (account transactions) ; addAllLast: (account2 transactions).
	
	self assert: portfolio transactions equals: transactions ! !

!PortfolioTest methodsFor: 'transactions tests' stamp: 'tom 6/3/2025 18:26:43'!
test04PortfolioWithNotEmptyPortfolioHasTransactions
	
	| portfolio account account2 transactions portfolio2 |
	
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 100 on: account.
	Deposit register: 100 on: account2.
	
	portfolio2 addPortfolio: portfolio .
	portfolio addAccount: account ; addAccount: account2 .
	
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

!PortfolioTest methodsFor: 'hasRegistered tests' stamp: 'tom 6/3/2025 17:29:49'!
test02PortfolioWithOneAccountNotEmptyHasOneRegisteredTransaction
	
	| account deposit portfolio |
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	
	portfolio addAccount: account .
	
	self assert: (portfolio hasRegistered: deposit) equals: true! !

!PortfolioTest methodsFor: 'hasRegistered tests' stamp: 'tom 6/3/2025 17:34:57'!
test03PortfolioWithTwoAccountsNotEmptyHasTwoRegisteredTransactions
	
	| account deposit portfolio account2 deposit2 |
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	deposit := Deposit register: 100 on: account.
	deposit2 := Deposit register: 300 on: account2.
	
	portfolio addAccount: account ; addAccount: account2 .
	
	self assert: (portfolio hasRegistered: deposit) equals: true.
	self assert: (portfolio hasRegistered: deposit2) equals: true! !

!PortfolioTest methodsFor: 'hasRegistered tests' stamp: 'tom 6/3/2025 17:41:18'!
test04PortfolioWithNotEmptyPortfolioHasRegisteredTransactions
	
	| account deposit portfolio portfolio2 |
	portfolio := Portfolio new.
	portfolio2 := Portfolio  new.
	account := ReceptiveAccount new.
		
	deposit := Deposit register: 100 on: account.
	
	portfolio addPortfolio: portfolio2 .
	portfolio2 addAccount: account .
	
	self assert: (portfolio hasRegistered: deposit) equals: true.
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


!classDefinition: #Portfolio category: #'Portfolio-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts portfolios'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'associating' stamp: 'tom 6/3/2025 15:45:37'!
addAccount: account 
	accounts add: account ! !

!Portfolio methodsFor: 'associating' stamp: 'tom 6/3/2025 16:03:54'!
addPortfolio: aPortfolio 
	portfolios add: aPortfolio ! !


!Portfolio methodsFor: 'initialization' stamp: 'tom 6/3/2025 16:22:44'!
initializeEmpty
	accounts := OrderedCollection new.
	portfolios := OrderedCollection new.! !


!Portfolio methodsFor: 'finance' stamp: 'tom 6/3/2025 16:06:22'!
balance
	
	^(accounts sum:[:account | account balance ] ifEmpty: [0]) + (portfolios sum:[:portfolio | portfolio balance ] ifEmpty: [0])! !

!Portfolio methodsFor: 'finance' stamp: 'tom 6/3/2025 17:42:10'!
hasRegistered: aTransaction 
	
	^(accounts anySatisfy: [:account | (account hasRegistered: aTransaction) ]) or: (portfolios anySatisfy: [:portfolio | (portfolio hasRegistered: aTransaction )]).! !

!Portfolio methodsFor: 'finance' stamp: 'tom 6/3/2025 18:27:39'!
transactions
	| res |
	res := OrderedCollection new.
	"Add each element of aCollection at the end of me. Answer aCollection."
	accounts do:[:anAccount | res addAllLast: (anAccount transactions )]. 
	portfolios do:[:aPortfolio | res addAllLast: (aPortfolio transactions )].
	^ res! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'instance creation' stamp: 'tom 6/3/2025 15:44:33'!
new 
	
	^self basicNew initializeEmpty! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


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
