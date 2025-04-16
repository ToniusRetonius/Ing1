!classDefinition: #StateVehicle category: #'3.Replace-if-Type+State'!
Object subclass: #StateVehicle
	instanceVariableNames: 'myVehicle'
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!StateVehicle methodsFor: 'init' stamp: 't 4/14/2025 18:16:05'!
initializeStateOf: aVehicle
	myVehicle := aVehicle .! !


!StateVehicle methodsFor: 'move' stamp: 't 4/15/2025 15:56:00'!
accelerate

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StateVehicle class' category: #'3.Replace-if-Type+State'!
StateVehicle class
	instanceVariableNames: ''!

!StateVehicle class methodsFor: 'init' stamp: 't 4/14/2025 18:16:20'!
of: aVehicle
	^self new initializeStateOf: aVehicle.! !


!classDefinition: #VehicleOff category: #'3.Replace-if-Type+State'!
StateVehicle subclass: #VehicleOff
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!VehicleOff methodsFor: 'move' stamp: 't 4/14/2025 18:18:10'!
accelerate
	myVehicle accelerateWhenOff! !


!classDefinition: #VehicleOn category: #'3.Replace-if-Type+State'!
StateVehicle subclass: #VehicleOn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!VehicleOn methodsFor: 'move' stamp: 't 4/14/2025 18:18:43'!
accelerate
	myVehicle accelerateWhenOn! !


!classDefinition: #Vehicle category: #'3.Replace-if-Type+State'!
Object subclass: #Vehicle
	instanceVariableNames: 'state speed'
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!Vehicle methodsFor: 'initialization' stamp: 't 4/14/2025 18:38:45'!
initialize

	self turnOff .
	speed := 0 * kilometer / hour.
	! !


!Vehicle methodsFor: 'move' stamp: 't 4/15/2025 16:00:09'!
accelerate

	state accelerate.! !

!Vehicle methodsFor: 'move' stamp: 't 4/15/2025 15:54:45'!
accelerateWhenOff
	"según el tipo de vehiculo responde diferente"
	self error: self canNotAccelerateErrorMessage! !

!Vehicle methodsFor: 'move' stamp: 't 4/15/2025 15:51:51'!
accelerateWhenOn

	self subclassResponsibility .! !


!Vehicle methodsFor: 'on/off' stamp: 't 4/15/2025 16:06:54'!
turnOff

	"siento que el problema de diseño es que si prendo, acelero y luego hago el turnOff, la velocidad y altitud(helicoptero) no se resetea"
	state := VehicleOff of: self.! !

!Vehicle methodsFor: 'on/off' stamp: 't 4/14/2025 18:19:21'!
turnOn

	state := VehicleOn of: self.! !


!Vehicle methodsFor: 'error messages' stamp: 't 4/15/2025 15:59:23'!
canNotAccelerateErrorMessage

	self subclassResponsibility ! !


!Vehicle methodsFor: 'getter' stamp: 't 4/15/2025 16:02:57'!
speed
	^ speed.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Vehicle class' category: #'3.Replace-if-Type+State'!
Vehicle class
	instanceVariableNames: ''!

!Vehicle class methodsFor: 'instance creation' stamp: 'ARM 4/29/2024 11:00:51'!
helicopter

	^self new initializeWithType: #Helicopter! !

!Vehicle class methodsFor: 'instance creation' stamp: 'ARM 4/29/2024 11:00:51'!
motorcycle

	^self new initializeWithType: #Motorcycle! !


!classDefinition: #Helicopter category: #'3.Replace-if-Type+State'!
Vehicle subclass: #Helicopter
	instanceVariableNames: 'altitude'
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!Helicopter methodsFor: 'init' stamp: 't 4/14/2025 18:39:20'!
initialize
	super initialize .
	altitude := 0 * meter.! !


!Helicopter methodsFor: 'move' stamp: 't 4/14/2025 18:30:33'!
accelerateWhenOn
	
	speed := speed + (10 * kilometer / hour).
	altitude := altitude + (5 * meter)! !

!Helicopter methodsFor: 'move' stamp: 't 4/15/2025 15:53:23'!
canNotAccelerateErrorMessage

	^'Can not fly when turned off'.! !


!Helicopter methodsFor: 'getter' stamp: 't 4/15/2025 16:02:27'!
altitude
	^ altitude.! !


!classDefinition: #Motorcycle category: #'3.Replace-if-Type+State'!
Vehicle subclass: #Motorcycle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!Motorcycle methodsFor: 'move' stamp: 't 4/14/2025 18:31:10'!
accelerateWhenOn

	speed := speed + (20 * kilometer / hour)! !

!Motorcycle methodsFor: 'move' stamp: 't 4/15/2025 15:53:05'!
canNotAccelerateErrorMessage
	
	^'Can not run when turned off'! !
