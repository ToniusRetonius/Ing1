!classDefinition: #CashierTest category: #'IRobot-Enunciado'!
TestCase subclass: #CashierTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IRobot-Enunciado'!

!CashierTest methodsFor: 'receiving from empty trailer' stamp: 't 4/19/2025 20:53:30'!
test01ShouldNotAcceptEmptyTrailerFromNormalWorkingRobot

	self testingAcceptanceFromStatus: WorkingNormal withMessageError: Cashier trailerIsEmptyErrorDescription.
	
	! !

!CashierTest methodsFor: 'receiving from empty trailer' stamp: 't 4/19/2025 20:53:51'!
test02ShouldNotAcceptEmptyTrailerFromMechanicalFailureRobot

	self testingAcceptanceFromStatus: MechanicalFailure withMessageError: Cashier trailerIsEmptyErrorDescription.
! !


!CashierTest methodsFor: 'receiving from sensors failure robot' stamp: 't 4/19/2025 20:54:32'!
test03ShouldNotAcceptSensorsFailureRobot
	
	self testingAcceptanceFromStatus: SensorsFailure withMessageError: Cashier robotSensorsFailureErrorDescription.
! !


!CashierTest methodsFor: 'elimination of repeated code' stamp: 't 4/19/2025 20:52:50'!
testingAcceptanceFromStatus: status withMessageError: aMessage

	| aRobot aTrailer aCashier |
	
	aTrailer := Trailer with: 20 and: 100.
	aRobot := Robot with: aTrailer.
	
	aCashier := Cashier new.

	self
		should: [ 
			aRobot status.
			aCashier receiveOrder: aRobot 
		]
		raise: Error
		withMessageText: Cashier trailerIsEmptyErrorDescription.
! !


!CashierTest methodsFor: 'receiving from mechanical failure robot' stamp: 'F 5/20/2020 23:47:15'!
test04ShouldChangeRobotStatusToOutOfOrderWhenMechanicalFailureRobot

	| aRobot aTrailer aCashier |
	
	aTrailer := Trailer with: 20 and: 100.
	aRobot := Robot with: aTrailer.
	
	aCashier := Cashier new.

	self
		should: [ 
			aRobot take: (ProductA with: 1  and: 1).
			aRobot withMechanicalFailure.
			
			aCashier receiveOrder: aRobot.
			
			aRobot take: (ProductA with: 1 and: 1) ]
		raise: Error
		withMessageText: Robot outOfOrderErrorDescription.

! !


!classDefinition: #ProductTest category: #'IRobot-Enunciado'!
TestCase subclass: #ProductTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IRobot-Enunciado'!

!ProductTest methodsFor: 'instance creation' stamp: 'FRT 5/4/2020 19:37:46'!
test01CanNotCreateProductWithCeroOrLessWeight

	self
		should: [ Product with: 0  and: 100 ]
		raise: Error
		withMessageText: Product invalidWeightErrorDescription 
! !

!ProductTest methodsFor: 'instance creation' stamp: 'FRT 5/4/2020 19:37:51'!
test02CanNotCreateProductWithCeroOrLessHeight

	self
		should: [ Product with: 100  and: 0 ]
		raise: Error
		withMessageText: Product invalidHeightErrorDescription 
! !

!ProductTest methodsFor: 'instance creation' stamp: 'FRT 5/4/2020 17:54:48'!
test03CanNotCreateProductWithNoIntegerWeight

	self
		should: [ Product with: 1.5  and: 100 ]
		raise: Error
		withMessageText: Product weightMustBeIntegerErrorDescription 

! !

!ProductTest methodsFor: 'instance creation' stamp: 'FRT 5/4/2020 17:55:14'!
test04CanNotCreateProductWithNoIntegerHeight

	self
		should: [ Product with: 100  and: 1.5 ]
		raise: Error
		withMessageText: Product heightMustBeIntegerErrorDescription 

! !


!classDefinition: #RobotTest category: #'IRobot-Enunciado'!
TestCase subclass: #RobotTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IRobot-Enunciado'!

!RobotTest methodsFor: 'instance creation' stamp: 'FRT 5/4/2020 11:29:44'!
test01ShouldReceiveAnEmptyTrailer

	| aTrailer |

	aTrailer := Trailer with: 20 and: 100.
	aTrailer carry: (ProductA with: 1  and: 1).
	
	self
		should: [ Robot with: aTrailer ]
		raise: Error
		withMessageText: Robot notEmptyTrailerErrorDescription! !


!RobotTest methodsFor: 'taking products' stamp: 'FRT 5/4/2020 11:04:57'!
test02ShouldTakeProductsWhenWorkingNormal

	| aTrailer aRobot |

	aTrailer := Trailer with: 20 and: 100.
	aRobot := Robot with: aTrailer.
	
	aRobot take: (ProductA with: 1  and: 1).
	
	self assert: 1 equals: aTrailer totalProductsAmount! !

!RobotTest methodsFor: 'taking products' stamp: 'FRT 5/4/2020 11:07:49'!
test03ShouldTakeProductsWhenWorkingWithSensorsFailures

	| aTrailer aRobot |

	aTrailer := Trailer with: 20 and: 100.
	aRobot := Robot with: aTrailer.
	aRobot withSensorsFailure.
	
	aRobot take: (ProductA with: 1  and: 1).
	
	self assert: 1 equals: aTrailer totalProductsAmount! !

!RobotTest methodsFor: 'taking products' stamp: 'FRT 5/4/2020 11:08:34'!
test04ShouldTakeProductsWhenWorkingWithMechanicalFailures

	| aTrailer aRobot |

	aTrailer := Trailer with: 20 and: 100.
	aRobot := Robot with: aTrailer.
	aRobot withMechanicalFailure.
	
	aRobot take: (ProductA with: 1  and: 1).
	
	self assert: 1 equals: aTrailer totalProductsAmount! !

!RobotTest methodsFor: 'taking products' stamp: 'FRT 5/4/2020 18:26:53'!
test05ShouldNotTakeProductsWhenOutOfOrder

	| aTrailer aRobot |

	aTrailer := Trailer with: 20 and: 100.
	aRobot := Robot with: aTrailer.
	aRobot outOfOrder.
	
	self
		should: [ aRobot take: (ProductA with: 1  and: 1) ]
		raise: Error
		withMessageText: Robot outOfOrderErrorDescription.
	
	self assert: 0 equals: aTrailer totalProductsAmount! !


!RobotTest methodsFor: 'closing order' stamp: 'FRT 5/4/2020 12:46:40'!
test06CanCloseOrderWhenWorkingNormal

	| aTrailer aRobot |

	aTrailer := Trailer with: 20 and: 100.
	aRobot := Robot with: aTrailer.
	aRobot take: (ProductA with: 1  and: 1).
	
	self assert: (aRobot closeOrderUsing: Cashier new)! !

!RobotTest methodsFor: 'closing order' stamp: 'FRT 5/4/2020 11:28:16'!
test07CanNotCloseOrderWhenWorkingWithSensorsFailures

	| aTrailer aRobot |

	aTrailer := Trailer with: 20 and: 100.
	aRobot := Robot with: aTrailer.
	aRobot take: (ProductA with: 1  and: 1).
	
	aRobot withSensorsFailure.

	self
		should: [ aRobot closeOrderUsing: Cashier new ]
		raise: Error
		withMessageText: Cashier robotSensorsFailureErrorDescription.
 
! !

!RobotTest methodsFor: 'closing order' stamp: 'FRT 5/4/2020 12:47:10'!
test08CanCloseOrderWhenWorkingWithMechanicalFailures

	| aTrailer aRobot |

	aTrailer := Trailer with: 20 and: 100.
	aRobot := Robot with: aTrailer.
	aRobot take: (ProductA with: 1  and: 1).

	aRobot withMechanicalFailure.	
		
	self assert: (aRobot closeOrderUsing: Cashier new).! !

!RobotTest methodsFor: 'closing order' stamp: 'FRT 5/4/2020 18:48:41'!
test09CanNotCloseOrderWhenOutOfOrder

	| aTrailer aRobot |

	aTrailer := Trailer with: 20 and: 100.
	aRobot := Robot with: aTrailer.
	aRobot take: (ProductA with: 1  and: 1).
	
	aRobot outOfOrder.

	self
		should: [ aRobot closeOrderUsing: Cashier new ]
		raise: Error
		withMessageText: Robot outOfOrderErrorDescription.
 
! !


!classDefinition: #TrailerTest category: #'IRobot-Enunciado'!
TestCase subclass: #TrailerTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IRobot-Enunciado'!

!TrailerTest methodsFor: 'weight capacity' stamp: 't 4/19/2025 21:19:29'!
test01CanNotCreateTrailerWithCeroOrLessMaxWeight

	self testingCreationOfTrailerwithWeight: 0 andHeight: 100  shouldRaise: Trailer invalidWeightCapacityErrorDescription.! !

!TrailerTest methodsFor: 'weight capacity' stamp: 't 4/19/2025 21:19:49'!
test02CanNotCreateTrailerWithCeroOrLessMaxHeight 
	
	self testingCreationOfTrailerwithWeight: 1 andHeight: 0 shouldRaise: Trailer invalidHeightCapacityErrorDescription! !

!TrailerTest methodsFor: 'weight capacity' stamp: 't 4/19/2025 21:20:08'!
test03CanNotCreateTrailerWithNoIntegerMaxWeight

	self testingCreationOfTrailerwithWeight: 1.5 andHeight: 100  shouldRaise: Trailer weightCapacityMustBeIntegerErrorDescription.! !

!TrailerTest methodsFor: 'weight capacity' stamp: 't 4/19/2025 21:20:25'!
test04CanNotCreateTrailerWithNoIntegerMaxHeight

	self testingCreationOfTrailerwithWeight: 100 andHeight: 1.5  shouldRaise: Trailer heightCapacityMustBeIntegerErrorDescription.! !

!TrailerTest methodsFor: 'weight capacity' stamp: 't 4/19/2025 21:21:59'!
test05ShouldRejectProductAIfWeightExceeded

	self testingRejectionFromProduct: ProductA! !

!TrailerTest methodsFor: 'weight capacity' stamp: 't 4/19/2025 21:22:18'!
test06ShouldRejectProductBIfWeightExceeded

	self testingRejectionFromProduct: ProductB! !

!TrailerTest methodsFor: 'weight capacity' stamp: 't 4/19/2025 21:25:22'!
test07ShouldAcceptProductsIfWeightUnderMaxWeightCapacity

	| aTrailer |
	aTrailer := self fillingUpATrailer .
		
	self assert: aTrailer totalProductsAmount equals: 4.
	self assert: aTrailer totalProductsWeight equals: 10.! !

!TrailerTest methodsFor: 'weight capacity' stamp: 't 4/19/2025 21:25:11'!
test08ShouldAcceptProductsIfWeightEqualsMaxWeightCapacity

	| aTrailer |
	aTrailer := self fillingUpATrailer .
	aTrailer carry: (ProductB with: 1 and: 1).
	
	self assert: aTrailer totalProductsAmount equals: 5.
	self assert: aTrailer totalProductsWeight equals: 11.
	
	! !


!TrailerTest methodsFor: 'repeated code elimination' stamp: 't 4/19/2025 21:55:27'!
fillUpTrailerWithProduct: aProduct
	| aTrailer heightCapacity exceededHeightCapacity halfExceededHeightCapacity |

	heightCapacity := 100.
	aTrailer := Trailer with: 20  and: heightCapacity.
	
	exceededHeightCapacity := heightCapacity + 2.
	halfExceededHeightCapacity := exceededHeightCapacity / 2.
	
	aTrailer carry: (aProduct with: 10 and: halfExceededHeightCapacity).
	
	^ aTrailer ! !

!TrailerTest methodsFor: 'repeated code elimination' stamp: 't 4/19/2025 21:24:38'!
fillingUpATrailer

	| aTrailer |
	aTrailer := Trailer with: 11  and: 100.
	
	aTrailer carry: (ProductA with: 1 and: 1).
	aTrailer carry: (ProductA with: 2 and: 1).
	aTrailer carry: (ProductB with: 3 and: 1).
	aTrailer carry: (ProductB with: 4 and: 1).
		
	^ aTrailer ! !

!TrailerTest methodsFor: 'repeated code elimination' stamp: 't 4/19/2025 21:59:32'!
halfExceededHeightCapacity: aTrailer
	^ ((aTrailer heightCapacity  + 2) / 2).! !

!TrailerTest methodsFor: 'repeated code elimination' stamp: 't 4/19/2025 21:19:01'!
testingCreationOfTrailerwithWeight: aWeight andHeight: aHeight shouldRaise: aMessage

	self
		should: [ Trailer with: aWeight  and: aHeight ]
		raise: Error
		withMessageText: aMessage ! !

!TrailerTest methodsFor: 'repeated code elimination' stamp: 't 4/19/2025 21:21:39'!
testingRejectionFromProduct: aProduct
	
	| aTrailer |
	aTrailer := Trailer with: 20  and: 100.
	
	self
		should: [ aTrailer carry: (aProduct with: 21 and: 1) ]
		raise: Error
		withMessageText: Trailer maxWeightExceededErrorDescription.
		
	self assert: aTrailer isEmpty.! !


!TrailerTest methodsFor: 'height capacity' stamp: 't 4/19/2025 21:58:02'!
test09ShouldAcceptProductAIgnoringMaxTotalHeightOfBProducts

	| aTrailer halfExceededHeightCapacity |

	aTrailer := self fillUpTrailerWithProduct: ProductA.
	halfExceededHeightCapacity := ((aTrailer heightCapacity  + 2) / 2).
	aTrailer carry: (ProductA with: 10 and: halfExceededHeightCapacity).
	
	self assert: aTrailer totalProductsAmount equals: 2.
	self assert: aTrailer totalProductsHeight equals: 0.
	! !

!TrailerTest methodsFor: 'height capacity' stamp: 't 4/19/2025 22:01:12'!
test10ShouldIgnoreAProductsInMaxTotalHeightOfBProducts

	| aTrailer |

	
	aTrailer := self fillUpTrailerWithProduct: ProductA. 
	aTrailer carry: (ProductB with: 10 and:  (self halfExceededHeightCapacity: aTrailer)).
	
	self assert: aTrailer totalProductsAmount equals: 2.
	self assert: aTrailer totalProductsHeight equals:  (self halfExceededHeightCapacity: aTrailer).
	! !

!TrailerTest methodsFor: 'height capacity' stamp: 't 4/19/2025 22:00:26'!
test11ShouldRejectProductBExceedingMaxTotalHeightOfBProducts

	| aTrailer |

	aTrailer := self fillUpTrailerWithProduct: ProductB .

	self 
		should: [aTrailer carry: (ProductB with: 10 and: (self halfExceededHeightCapacity: aTrailer) )] 
		raise: Error
		withMessageText: Trailer maxHeightExceededErrorDescription.
	
	self assert: aTrailer totalProductsAmount equals: 1.
	self assert: aTrailer totalProductsHeight equals:  (self halfExceededHeightCapacity: aTrailer).
	! !


!classDefinition: #Cashier category: #'IRobot-Enunciado'!
Object subclass: #Cashier
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IRobot-Enunciado'!

!Cashier methodsFor: 'closing buy order' stamp: 't 4/19/2025 20:24:24'!
canReceiveOrder: aRobot
	| aTrailer | 
	aTrailer := aRobot trailer.	
	self assertTrailerNotEmpty: aTrailer.
		
	"Comentario: en este punto el cashier realizaría el checkout de los productos."
		
	^ true
! !

!Cashier methodsFor: 'closing buy order' stamp: 't 4/19/2025 20:29:13'!
receiveOrder: aRobot
	
	^ aRobot status acceptCashier: self.
	
! !


!Cashier methodsFor: 'assertions' stamp: 'FRT 5/4/2020 11:17:52'!
assertTrailerNotEmpty: aTrailer
	
	aTrailer isEmpty ifTrue: [self signalTrailerIsEmpty]! !

!Cashier methodsFor: 'assertions' stamp: 'FRT 5/4/2020 11:28:31'!
signalTrailerIsEmpty
	
	self error: self class trailerIsEmptyErrorDescription! !


!Cashier methodsFor: 'exceptions' stamp: 'FRT 5/4/2020 11:28:03'!
signalRobotSensorsFailure
	
	self error: self class robotSensorsFailureErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #'IRobot-Enunciado'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'error messages' stamp: 'FRT 5/4/2020 11:28:03'!
robotSensorsFailureErrorDescription
	
	^ 'This robot presents sensors failures!!'! !

!Cashier class methodsFor: 'error messages' stamp: 'FRT 5/4/2020 11:28:31'!
trailerIsEmptyErrorDescription
	
	^ 'This robots trailer is empty!!'! !


!classDefinition: #Product category: #'IRobot-Enunciado'!
Object subclass: #Product
	instanceVariableNames: 'weight height'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IRobot-Enunciado'!

!Product methodsFor: 'instance creation' stamp: 'FRT 5/4/2020 10:39:55'!
initializeWith: aWeight and: aHeight
	
	weight := aWeight.
	height := aHeight.! !


!Product methodsFor: 'action' stamp: 'FRT 5/4/2020 10:38:22'!
carryBy: aTrailer	
	
	self subclassResponsibility! !


!Product methodsFor: 'testing' stamp: 'FRT 5/4/2020 10:39:06'!
isStackable
	
	self subclassResponsibility! !


!Product methodsFor: 'accessing' stamp: 'FRT 5/4/2020 10:43:30'!
height
	
	^ height! !

!Product methodsFor: 'accessing' stamp: 'FRT 5/4/2020 10:43:24'!
weight
	
	^ weight! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Product class' category: #'IRobot-Enunciado'!
Product class
	instanceVariableNames: ''!

!Product class methodsFor: 'instance creation' stamp: 'FRT 5/4/2020 17:47:40'!
with: aWeight and: aHeight
	
	aWeight strictlyPositive ifFalse: [ self signalInvalidWeight ].
	aHeight strictlyPositive ifFalse: [ self signalInvalidHeight ].

	aWeight isInteger ifFalse: [ self signalWeightMustBeInteger ].
	aHeight isInteger ifFalse: [ self signalHeightMustBeInteger ].
	
	^ self new initializeWith: aWeight and: aHeight! !


!Product class methodsFor: 'exceptions' stamp: 'FRT 5/4/2020 17:48:22'!
signalHeightMustBeInteger

	self error: self heightMustBeIntegerErrorDescription! !

!Product class methodsFor: 'exceptions' stamp: 'FRT 5/4/2020 11:29:08'!
signalInvalidHeight

	self error: self invalidHeightErrorDescription! !

!Product class methodsFor: 'exceptions' stamp: 'FRT 5/4/2020 11:29:18'!
signalInvalidWeight

	self error: self invalidWeightErrorDescription! !

!Product class methodsFor: 'exceptions' stamp: 'FRT 5/4/2020 17:48:12'!
signalWeightMustBeInteger

	self error: self weightMustBeIntegerErrorDescription! !


!Product class methodsFor: 'error messages' stamp: 'FRT 5/4/2020 17:49:16'!
heightMustBeIntegerErrorDescription

	^ 'Height must be integer'! !

!Product class methodsFor: 'error messages' stamp: 'FRT 5/4/2020 11:29:08'!
invalidHeightErrorDescription

	^ 'Height must be positive'! !

!Product class methodsFor: 'error messages' stamp: 'FRT 5/4/2020 11:29:18'!
invalidWeightErrorDescription

	^ 'Weight must be positive'! !

!Product class methodsFor: 'error messages' stamp: 'FRT 5/4/2020 17:49:08'!
weightMustBeIntegerErrorDescription

	^ 'Weight must be integer'! !


!classDefinition: #ProductA category: #'IRobot-Enunciado'!
Product subclass: #ProductA
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IRobot-Enunciado'!

!ProductA methodsFor: 'testing' stamp: 'FRT 5/4/2020 10:41:29'!
isStackable

	^ false! !


!ProductA methodsFor: 'action' stamp: 'FRT 5/4/2020 10:41:12'!
carryBy: aTrailer

	aTrailer carryProductA: self! !


!classDefinition: #ProductB category: #'IRobot-Enunciado'!
Product subclass: #ProductB
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IRobot-Enunciado'!

!ProductB methodsFor: 'testing' stamp: 'FRT 5/4/2020 10:42:28'!
isStackable

	^ true! !


!ProductB methodsFor: 'action' stamp: 'FRT 5/4/2020 10:42:16'!
carryBy: aTrailer

	aTrailer carryProductB: self! !


!classDefinition: #Robot category: #'IRobot-Enunciado'!
Object subclass: #Robot
	instanceVariableNames: 'status trailer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IRobot-Enunciado'!

!Robot methodsFor: 'actions' stamp: 't 4/19/2025 20:13:32'!
canCloseOrderUsing: aCashier
	^ aCashier receiveOrder: self! !

!Robot methodsFor: 'actions' stamp: 't 4/19/2025 19:52:16'!
cannotCloseOrder
	self error: self class signalOutOfOrder! !

!Robot methodsFor: 'actions' stamp: 't 4/19/2025 20:13:41'!
closeOrderUsing: aCashier
	
	 ^ status closeOrderUsing: aCashier .	
! !

!Robot methodsFor: 'actions' stamp: 't 4/19/2025 19:44:48'!
take: aProduct
	
	status take: aProduct .

! !

!Robot methodsFor: 'actions' stamp: 't 4/19/2025 19:44:40'!
takeWhenNotPossible
	self error: self class outOfOrderErrorDescription! !

!Robot methodsFor: 'actions' stamp: 't 4/19/2025 19:44:43'!
takeWhenPossible: aProduct
	trailer carry: aProduct! !


!Robot methodsFor: 'accessing' stamp: 't 4/19/2025 19:18:01'!
status

	^ status ! !

!Robot methodsFor: 'accessing' stamp: 'FRT 5/3/2020 21:27:04'!
trailer

	^ trailer
! !


!Robot methodsFor: 'initialization' stamp: 't 4/19/2025 19:14:56'!
initializeWith: aTrailer

	trailer := aTrailer.
	status := WorkingNormal of:self.
! !


!Robot methodsFor: 'status' stamp: 't 4/19/2025 19:26:50'!
outOfOrder
	status := OutOfOrder of:self. ! !

!Robot methodsFor: 'status' stamp: 't 4/19/2025 19:26:26'!
withMechanicalFailure
	status := MechanicalFailure of:self.! !

!Robot methodsFor: 'status' stamp: 't 4/19/2025 19:26:06'!
withSensorsFailure
	status := SensorsFailure of:self.! !

!Robot methodsFor: 'status' stamp: 't 4/19/2025 20:50:59'!
workingNormal
	status := WorkingNormal of:self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Robot class' category: #'IRobot-Enunciado'!
Robot class
	instanceVariableNames: ''!

!Robot class methodsFor: 'instance creation' stamp: 'FRT 5/3/2020 22:36:52'!
with: aTrailer

	self assertIsEmpty: aTrailer.

	^ self new initializeWith: aTrailer! !


!Robot class methodsFor: 'assertions' stamp: 'FRT 5/3/2020 22:35:35'!
assertIsEmpty: aTrailer

	^ aTrailer isEmpty ifFalse: [ self signalNotEmptyTrailer ]! !

!Robot class methodsFor: 'assertions' stamp: 'FRT 5/4/2020 11:29:32'!
signalNotEmptyTrailer

	self error: self notEmptyTrailerErrorDescription! !

!Robot class methodsFor: 'assertions' stamp: 'FRT 5/4/2020 18:26:04'!
signalOutOfOrder
	
	self error: self outOfOrderErrorDescription! !


!Robot class methodsFor: 'error messages' stamp: 'FRT 5/4/2020 11:29:32'!
notEmptyTrailerErrorDescription

	^ 'The robot was assigned a non empty trailer'! !

!Robot class methodsFor: 'error messages' stamp: 'FRT 5/4/2020 18:26:32'!
outOfOrderErrorDescription
	
	^ 'Robot out of order :('! !


!classDefinition: #RobotState category: #'IRobot-Enunciado'!
Object subclass: #RobotState
	instanceVariableNames: 'robot'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IRobot-Enunciado'!

!RobotState methodsFor: 'initialization' stamp: 't 4/19/2025 19:13:52'!
initializeWith: aRobot
	robot := aRobot ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RobotState class' category: #'IRobot-Enunciado'!
RobotState class
	instanceVariableNames: ''!

!RobotState class methodsFor: 'initialization' stamp: 't 4/19/2025 19:14:05'!
of: aRobot
	^ self new initializeWith: aRobot ! !


!classDefinition: #MechanicalFailure category: #'IRobot-Enunciado'!
RobotState subclass: #MechanicalFailure
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IRobot-Enunciado'!

!MechanicalFailure methodsFor: 'action' stamp: 't 4/19/2025 20:31:47'!
acceptCashier: aCashier
	robot outOfOrder .
	^ aCashier canReceiveOrder: robot ! !

!MechanicalFailure methodsFor: 'action' stamp: 't 4/19/2025 20:11:22'!
closeOrderUsing: aCashier
	^ robot canCloseOrderUsing: aCashier ! !

!MechanicalFailure methodsFor: 'action' stamp: 't 4/19/2025 19:44:58'!
take: aProduct
	robot takeWhenPossible: aProduct .! !


!classDefinition: #OutOfOrder category: #'IRobot-Enunciado'!
RobotState subclass: #OutOfOrder
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IRobot-Enunciado'!

!OutOfOrder methodsFor: 'action' stamp: 't 4/19/2025 20:11:29'!
closeOrderUsing: aCashier
	^ robot cannotCloseOrder ! !

!OutOfOrder methodsFor: 'action' stamp: 't 4/19/2025 19:45:09'!
take: aProduct
	robot takeWhenNotPossible .! !


!classDefinition: #SensorsFailure category: #'IRobot-Enunciado'!
RobotState subclass: #SensorsFailure
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IRobot-Enunciado'!

!SensorsFailure methodsFor: 'action' stamp: 't 4/19/2025 20:27:51'!
acceptCashier: aCashier
	aCashier signalRobotSensorsFailure! !

!SensorsFailure methodsFor: 'action' stamp: 't 4/19/2025 20:20:48'!
closeOrderUsing: aCashier
	^ robot canCloseOrderUsing: aCashier ! !

!SensorsFailure methodsFor: 'action' stamp: 't 4/19/2025 19:23:56'!
take: aProduct
	robot takeWhenPossible: aProduct .! !


!classDefinition: #WorkingNormal category: #'IRobot-Enunciado'!
RobotState subclass: #WorkingNormal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IRobot-Enunciado'!

!WorkingNormal methodsFor: 'action' stamp: 't 4/19/2025 20:30:58'!
acceptCashier: aCashier
	^ aCashier canReceiveOrder: robot ! !

!WorkingNormal methodsFor: 'action' stamp: 't 4/19/2025 20:11:08'!
closeOrderUsing: aCashier
	^ robot canCloseOrderUsing: aCashier ! !

!WorkingNormal methodsFor: 'action' stamp: 't 4/19/2025 19:37:34'!
take: aProduct
	^ robot takeWhenPossible: aProduct .! !


!classDefinition: #Trailer category: #'IRobot-Enunciado'!
Object subclass: #Trailer
	instanceVariableNames: 'weightCapacity heightCapacity container'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IRobot-Enunciado'!

!Trailer methodsFor: 'initialization' stamp: 'FRT 5/3/2020 23:27:42'!
initializeWith: aWeightCapacity and: aHeightCapacity

	weightCapacity := aWeightCapacity.
	heightCapacity := aHeightCapacity.
	
	container := OrderedCollection new.! !


!Trailer methodsFor: 'accessing' stamp: 't 4/19/2025 21:35:17'!
heightCapacity
	^ heightCapacity ! !

!Trailer methodsFor: 'accessing' stamp: 'FRT 5/3/2020 23:34:36'!
totalProductsAmount
	
	^ container size.! !

!Trailer methodsFor: 'accessing' stamp: 'F 5/14/2020 10:35:03'!
totalProductsHeight
	"Solo importa la altura de los productos apilables"

	| total index |

	total := 0.
	index := 1.
	
	[index <= container size] whileTrue: [ | product |
		product := (container at: index).
		(product isStackable) ifTrue: [ total := total +  product height ].
		index := index + 1.	
	].

	^ total.! !

!Trailer methodsFor: 'accessing' stamp: 'F 5/14/2020 10:34:38'!
totalProductsWeight
	
	| total index |

	total := 0.
	index := 1.
	
	[index <= container size] whileTrue: [
		total := total + (container at: index) weight.
		index := index + 1.	
	].

	^ total.! !

!Trailer methodsFor: 'accessing' stamp: 't 4/19/2025 21:34:52'!
weightCapacity
	^ weightCapacity ! !


!Trailer methodsFor: 'testing' stamp: 'FRT 5/3/2020 23:33:33'!
isEmpty
	
	^ container isEmpty! !


!Trailer methodsFor: 'action' stamp: 'FRT 5/3/2020 23:35:19'!
carry: aProduct
	
	^ aProduct carryBy: self.! !

!Trailer methodsFor: 'action' stamp: 'FRT 5/4/2020 19:08:17'!
carryProductA: aProduct
	
	self assertWeightAdding: aProduct.
	container add: aProduct.! !

!Trailer methodsFor: 'action' stamp: 'FRT 5/4/2020 19:08:09'!
carryProductB: aProduct

	self assertWeightAdding: aProduct.
	self assertHeightAdding: aProduct.
	
	container add: aProduct.! !


!Trailer methodsFor: 'assertions' stamp: 'FRT 5/5/2020 11:27:29'!
assertHeightAdding: aProduct
	
	(self totalProductsHeight + aProduct height) > heightCapacity ifTrue: [ self signalMaxHeightCapacityExceeded ]! !

!Trailer methodsFor: 'assertions' stamp: 'FRT 5/5/2020 11:27:41'!
assertWeightAdding: aProduct
	
	(self totalProductsWeight + aProduct weight) > weightCapacity ifTrue: [ self signalMaxWeightCapacityExceeded ]! !


!Trailer methodsFor: 'exceptions' stamp: 'FRT 5/4/2020 11:30:31'!
signalMaxHeightCapacityExceeded

	self error: self class maxHeightExceededErrorDescription
! !

!Trailer methodsFor: 'exceptions' stamp: 'FRT 5/4/2020 11:30:38'!
signalMaxWeightCapacityExceeded

	self error: self class maxWeightExceededErrorDescription
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Trailer class' category: #'IRobot-Enunciado'!
Trailer class
	instanceVariableNames: ''!

!Trailer class methodsFor: 'instance creation' stamp: 'FRT 5/4/2020 17:33:58'!
with: aWeightCapacity and: aHeightCapacity

	aWeightCapacity strictlyPositive ifFalse: [ self signalInvalidWeightCapacity ].
	aHeightCapacity strictlyPositive ifFalse: [ self signalInvalidHeightCapacity ].
	
	aWeightCapacity isInteger ifFalse: [ self signalWeightCapacityMustBeInteger ].
	aHeightCapacity isInteger ifFalse: [ self signalHeightCapacityMustBeInteger ].
		
	^ self new initializeWith: aWeightCapacity and: aHeightCapacity.

! !


!Trailer class methodsFor: 'exceptions' stamp: 'FRT 5/4/2020 17:37:41'!
signalHeightCapacityMustBeInteger

	self error: self heightCapacityMustBeIntegerErrorDescription
! !

!Trailer class methodsFor: 'exceptions' stamp: 'FRT 5/4/2020 11:30:12'!
signalInvalidHeightCapacity

	self error: self invalidHeightCapacityErrorDescription
! !

!Trailer class methodsFor: 'exceptions' stamp: 'FRT 5/4/2020 11:30:21'!
signalInvalidWeightCapacity

	self error: self invalidWeightCapacityErrorDescription
! !

!Trailer class methodsFor: 'exceptions' stamp: 'FRT 5/4/2020 17:37:29'!
signalWeightCapacityMustBeInteger

	self error: self weightCapacityMustBeIntegerErrorDescription
! !


!Trailer class methodsFor: 'error messages' stamp: 'FRT 5/4/2020 17:49:38'!
heightCapacityMustBeIntegerErrorDescription

	^ 'Height capacity must be integer'! !

!Trailer class methodsFor: 'error messages' stamp: 'FRT 5/4/2020 11:30:12'!
invalidHeightCapacityErrorDescription

	^ 'The trailers height capacity must be positive.'
! !

!Trailer class methodsFor: 'error messages' stamp: 'FRT 5/4/2020 11:30:21'!
invalidWeightCapacityErrorDescription

	^ 'The trailers weight capacity must be positive.'
! !

!Trailer class methodsFor: 'error messages' stamp: 'FRT 5/4/2020 11:30:31'!
maxHeightExceededErrorDescription

	^ 'Maximum height has been exceeded'
! !

!Trailer class methodsFor: 'error messages' stamp: 'FRT 5/4/2020 11:30:38'!
maxWeightExceededErrorDescription

	^ 'Maximum weight has been exceeded'
! !

!Trailer class methodsFor: 'error messages' stamp: 'FRT 5/4/2020 17:49:32'!
weightCapacityMustBeIntegerErrorDescription

	^ 'Weight capacity must be integer'! !
