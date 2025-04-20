!classDefinition: #VehicleTests category: #'4.Replace-if-Strategy'!
TestCase subclass: #VehicleTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:25:03'!
test01LandVehicleCannotAccelerateWhileTurnedOff

	| landVehicle |
	
	landVehicle := Vehicle electricMotorcycle.
	
	self should: [ landVehicle accelerate ] 
	raise: Error 
	withExceptionDo: [ :error | error messageText = 'Can not run when turned off'.
		self assert: (landVehicle speedAt: (0 * kilometer / hour)) ]
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:27:17'!
test02AirVehicleCannotAccelerateWhileTurnedOff

	| airVehicle |
	
	airVehicle := Vehicle helicopter.
	
	self should: [ airVehicle accelerate ] 
	raise: Error 
	withExceptionDo: [ :error | error messageText = 'Can not fly when turned off'.
		self assert: (airVehicle speedAt: (0 * kilometer / hour)).
		self assert: (airVehicle altitudeAt: (0 * meter)) ]
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:52:20'!
test03ElectricVehicleAccelerateAsIntended

	| electricVehicle |
	
	electricVehicle := Vehicle electricMotorcycle.
	
	electricVehicle turnOn.
	self assert: (electricVehicle speedAt: 0 * kilometer / hour).
	
	electricVehicle accelerate.
	self assert: (electricVehicle speedAt: 10 * kilometer / hour).
	
	electricVehicle accelerate.
	self assert: (electricVehicle speedAt: 40 * kilometer / hour)
	
	
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:52:16'!
test04GasolineVehicleAccelerateAsIntended

	| gasolineVehicle |
	
	gasolineVehicle := Vehicle gasolineMotorcycle.
	
	gasolineVehicle turnOn.
	self assert: (gasolineVehicle speedAt: 0 * kilometer / hour).
	
	gasolineVehicle accelerate.
	self assert: (gasolineVehicle speedAt: 10 * kilometer / hour).
	
	gasolineVehicle accelerate.
	self assert: (gasolineVehicle speedAt: 20 * kilometer / hour)
	
	
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:52:11'!
test05JetFueledVehicleAccelerateAsIntended

	| jetFueledVehicle |
	
	jetFueledVehicle := Vehicle helicopter.
	
	jetFueledVehicle turnOn.
	self assert: (jetFueledVehicle speedAt: 0 * kilometer / hour).
	
	jetFueledVehicle accelerate.
	self assert: (jetFueledVehicle speedAt: 1 * kilometer / hour).
	
	jetFueledVehicle accelerate.
	self assert: (jetFueledVehicle speedAt: 5 * kilometer / hour).
	
	jetFueledVehicle accelerate.
	self assert: (jetFueledVehicle speedAt: 41 * kilometer / hour)
	
	
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:47:14'!
test06AirVehicleGoesUpAsItAcceleratesAsExpected

	| airVehicle |
	
	airVehicle := Vehicle helicopter.
	
	airVehicle turnOn.
	self assert: (airVehicle altitudeAt: 0 * meter).
	
	airVehicle accelerate.
	self assert: (airVehicle altitudeAt: 5 * meter).
	
	airVehicle accelerate.
	self assert: (airVehicle altitudeAt: 10 * meter)
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:52:05'!
test07SpeedLimiterForCityLimitsSpeedAt70Kmh

	| cityVehicle |
	
	cityVehicle := Vehicle electricMotorcycle.
	
	cityVehicle turnOn.
	self assert: (cityVehicle speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ cityVehicle accelerate ].
	
	self assert: (cityVehicle speedAt: 70 * kilometer / hour)
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:53:50'!
test08SpeedLimiterForOpenRoadLimitsSpeedAt130Kmh

	| openRoadVehicle |
	
	openRoadVehicle := Vehicle gasolineMotorcycle.
	
	openRoadVehicle turnOn.
	self assert: (openRoadVehicle speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ openRoadVehicle accelerate ].
	
	self assert: (openRoadVehicle speedAt: 130 * kilometer / hour)
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:55:32'!
test09SpeedLimiterForAirTrafficLimitsSpeedAt500Kmh

	| vehicleInAir |
	
	vehicleInAir := Vehicle helicopter.
	
	vehicleInAir turnOn.
	self assert: (vehicleInAir speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ vehicleInAir accelerate ].
	
	self assert: (vehicleInAir speedAt: 500 * kilometer / hour)
	
	
	! !


!classDefinition: #EngineState category: #'4.Replace-if-Strategy'!
Object subclass: #EngineState
	instanceVariableNames: 'vehicleToPower'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!EngineState methodsFor: 'move' stamp: 't 4/19/2025 12:14:44'!
accelerate
	self subclassResponsibility ! !


!EngineState methodsFor: 'init' stamp: 't 4/19/2025 11:54:38'!
initializeEngineStateOf: aVehicle
	"no poner return acá porque no inicializa bien las cosas"
	vehicleToPower := aVehicle ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EngineState class' category: #'4.Replace-if-Strategy'!
EngineState class
	instanceVariableNames: ''!

!EngineState class methodsFor: 'init' stamp: 't 4/19/2025 11:42:20'!
of: aVehicle
	"al mandarle a la clase EngineState (vale para sus subclases) hace el new y luego le asigna un vehicle"
	^ self new initializeEngineStateOf: aVehicle ! !


!classDefinition: #EngineOff category: #'4.Replace-if-Strategy'!
EngineState subclass: #EngineOff
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!EngineOff methodsFor: 'move' stamp: 't 4/19/2025 17:17:06'!
accelerate 
	vehicleToPower accelerateWhenOff .! !


!classDefinition: #EngineOn category: #'4.Replace-if-Strategy'!
EngineState subclass: #EngineOn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!EngineOn methodsFor: 'move' stamp: 't 4/19/2025 17:16:55'!
accelerate
	vehicleToPower accelerateWhenOn.! !


!classDefinition: #EngineType category: #'4.Replace-if-Strategy'!
Object subclass: #EngineType
	instanceVariableNames: 'vehicleToPower acceleration'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!EngineType methodsFor: 'initialize' stamp: 't 4/19/2025 12:49:41'!
initializeWith: aVehicleToPower
	vehicleToPower := aVehicleToPower.! !


!EngineType methodsFor: 'acceleration' stamp: 't 4/19/2025 12:14:22'!
acceleration
	self subclassResponsibility ! !

!EngineType methodsFor: 'acceleration' stamp: 't 4/19/2025 12:16:29'!
getAcceleration
	^ acceleration ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EngineType class' category: #'4.Replace-if-Strategy'!
EngineType class
	instanceVariableNames: ''!

!EngineType class methodsFor: 'init' stamp: 't 4/19/2025 12:49:59'!
on: aVehicle
	^ self new initializeWith: aVehicle ! !


!classDefinition: #ElectricEngine category: #'4.Replace-if-Strategy'!
EngineType subclass: #ElectricEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!ElectricEngine methodsFor: 'acceleration' stamp: 't 4/19/2025 12:23:35'!
acceleration
	"lo retornamos porque nos interesará este dato en el accelerate del tipo de vehicle"
	^ acceleration := ((vehicleToPower getSpeed )+ (5 * kilometer / hour)) * 2 ! !


!classDefinition: #GasolineEngine category: #'4.Replace-if-Strategy'!
EngineType subclass: #GasolineEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!GasolineEngine methodsFor: 'acceleration' stamp: 't 4/19/2025 12:23:48'!
acceleration
	"lo retornamos porque nos interesará este dato en el accelerate del tipo de vehicle"
	^ acceleration := 10 * kilometer / hour! !


!classDefinition: #JetFueledEngine category: #'4.Replace-if-Strategy'!
EngineType subclass: #JetFueledEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!JetFueledEngine methodsFor: 'acceleration' stamp: 't 4/19/2025 12:24:04'!
acceleration
	"lo retornamos porque nos interesará este dato en el accelerate del tipo de vehicle"
	^ acceleration := (((vehicleToPower getSpeed) amount + 1) ^ 2) * kilometer / hour ! !


!classDefinition: #Vehicle category: #'4.Replace-if-Strategy'!
Object subclass: #Vehicle
	instanceVariableNames: 'state speed engineType where altitude'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Vehicle methodsFor: 'initialization' stamp: 't 4/19/2025 15:47:52'!
initializeWithEngineType: anEngineType andSurroundings: aSurrounding
	"el nombre del mensaje de inicialización debe ser el mismo ya que el new viene a buscar acá y después baja a las subclases"
	self subclassResponsibility .
	
	 ! !


!Vehicle methodsFor: 'move' stamp: 't 4/19/2025 16:44:13'!
accelerate

	"Delegamos la tarea de decidir si aceleramos al EngineState"
	self subclassResponsibility .
	"Qué hacemos con el tipo de vehículo ?"
	"El tipo de vehículo, ES el vehículo asociado al state y por tanto acelerará según se disponga"
	
	"Qué hacemos con el tipo de motor ?"
	"El tipo de motor se usa para calcular la aceleración y por ello se vincula directamente el tipo de vehículo instanciado con el tipo de motor que se le haya asignado"
	
	"Qué hacemos con el surrounding ?"
	
	! !

!Vehicle methodsFor: 'move' stamp: 't 4/19/2025 17:19:14'!
accelerateWhenOff
	"recordar este mensaje que va en Vehicle!! El error se maneja desde acá, después si el mensaje de error es diferente ... eso sí, pero acá se hace saltar el error"
	self error: self canNotAccelerateErrorMessage.! !

!Vehicle methodsFor: 'move' stamp: 't 4/19/2025 16:07:53'!
altitudeAt: anAltitude

	^ altitude = anAltitude! !

!Vehicle methodsFor: 'move' stamp: 't 4/19/2025 12:18:18'!
getSpeed
	^ speed! !

!Vehicle methodsFor: 'move' stamp: 'NR 9/7/2024 18:23:27'!
speedAt: aSpeed

	^ speed = aSpeed! !


!Vehicle methodsFor: 'on/off' stamp: 't 4/19/2025 13:25:27'!
turnOff
	"Apagar el motor necesita instanciar un estado apagado y la velocidad en 0"
	state := EngineOff of: self.
	speed := 0 * kilometer / hour! !

!Vehicle methodsFor: 'on/off' stamp: 't 4/19/2025 11:41:10'!
turnOn
	"instanciamos un motor prendido"
	state := EngineOn of: self.! !


!Vehicle methodsFor: 'error messages' stamp: 't 4/19/2025 12:04:46'!
canNotAccelerateErrorMessage
	"es responsabilidad de cada subclase ya que cada uno responde diferente"
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Vehicle class' category: #'4.Replace-if-Strategy'!
Vehicle class
	instanceVariableNames: ''!

!Vehicle class methodsFor: 'instance creation' stamp: 't 4/19/2025 13:26:48'!
electricMotorcycle
	
	^Motorcycle new initializeWithEngineType: ElectricEngine andSurroundings: #city 

	! !

!Vehicle class methodsFor: 'instance creation' stamp: 't 4/19/2025 13:27:19'!
gasolineMotorcycle

	^ Motorcycle new initializeWithEngineType: GasolineEngine andSurroundings: #openRoad ! !

!Vehicle class methodsFor: 'instance creation' stamp: 't 4/19/2025 13:28:01'!
helicopter
		
	^ Helicopter new initializeWithEngineType: JetFueledEngine andSurroundings: #skies 
	
	 ! !


!classDefinition: #Helicopter category: #'4.Replace-if-Strategy'!
Vehicle subclass: #Helicopter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Helicopter methodsFor: 'error messages' stamp: 't 4/19/2025 15:55:57'!
canNotAccelerateErrorMessage
	"importante retornar así el estado off sabe qué devolver cuando no puede acelerar"
	^'Can not fly when turned off'.! !


!Helicopter methodsFor: 'move' stamp: 't 4/19/2025 16:10:32'!
accelerate
	"acá inicia la secuencia de mensajes a evaluar para saber si pudimos acelerar o no"
	^ state accelerate .! !

!Helicopter methodsFor: 'move' stamp: 't 4/19/2025 17:01:42'!
accelerateWhenOn
	"le ponemos el ret, para evaluar y recibir el valor de altitude (modelado)"
	speed := speed + (engineType acceleration). altitude := altitude + (5 * meter).
	
	"chequeamos límite de velocidad ::"
	speed > (500 * kilometer / hour) ifTrue: [ speed := 500 * kilometer / hour ]
	
	
! !


!Helicopter methodsFor: 'initialization' stamp: 't 4/19/2025 15:55:14'!
initializeWithEngineType: anEngineType andSurroundings: aSurrounding
	
	self turnOff .
	
	engineType := anEngineType on: self.
	
	where := aSurrounding .
	
	altitude  := 0 * meter .! !


!classDefinition: #Motorcycle category: #'4.Replace-if-Strategy'!
Vehicle subclass: #Motorcycle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Motorcycle methodsFor: 'error messages' stamp: 't 4/19/2025 15:55:53'!
canNotAccelerateErrorMessage
	"importante retornar así el estado off sabe qué devolver cuando no puede acelerar"
	^'Can not run when turned off'! !


!Motorcycle methodsFor: 'initialization' stamp: 't 4/19/2025 16:07:33'!
initializeWithEngineType: anEngineType andSurroundings: aSurrounding
	
	self turnOff .
	
	engineType := anEngineType on: self.
	
	where := aSurrounding .
	
	altitude  := 0 * meter .
	! !


!Motorcycle methodsFor: 'move' stamp: 't 4/19/2025 15:54:06'!
accelerate
	"acá inicia la secuencia de mensajes a evaluar para saber si pudimos acelerar o no"
	^ state accelerate.! !

!Motorcycle methodsFor: 'move' stamp: 't 4/19/2025 17:00:50'!
accelerateWhenOn
	"le ponemos el ret, para evaluar y recibir el valor de speed (modelado)"
	speed := speed + (engineType acceleration).
	
	"chequeamos los límites de velocidad :: "
	where = #city ifTrue: [ speed > (70 * kilometer / hour) ifTrue: [ speed := 70 * kilometer / hour ] ].
	where = #openRoad  ifTrue: [ speed > (130 * kilometer / hour)  ifTrue: [ speed := 130 * kilometer / hour ]  ]
	
	! !
