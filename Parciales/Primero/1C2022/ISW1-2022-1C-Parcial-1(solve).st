!classDefinition: #FormulaOneTest category: #'ISW1-2022-1C-Parcial-1'!
TestCase subclass: #FormulaOneTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-1C-Parcial-1'!

!FormulaOneTest methodsFor: 'tracks' stamp: 't 4/27/2025 13:37:25'!
oneSectorTrack

	^ Track withSectors: (OrderedCollection with: (self tenKilometersTurboSector))! !

!FormulaOneTest methodsFor: 'tracks' stamp: 't 4/27/2025 13:26:23'!
twoSectorsTrack

	^ OrderedCollection 
		with: (self tenKilometersTurboSector)
		with: (self twentyKilometerWithoutTurboSector)! !


!FormulaOneTest methodsFor: 'tests' stamp: 't 4/27/2025 14:40:58'!
test01SectorLengthMustBePositive

	self 
		should: [  TurboSector of: 0 * kilometer.]
		raise: Error
		withMessageText: Sector lengthMustBePositiveErrorDescription! !

!FormulaOneTest methodsFor: 'tests' stamp: 't 4/27/2025 13:20:13'!
test02ACarCanNotBePlacedInAKilometerGreaterThanSectorLength

	| sector  outside car |
	
	sector _ self tenKilometersTurboSector.
	outside _ sector length + (1 * millimeter).
	car _ self schumacherCar.
	
	self 
		should: [ sector put: car at: outside ] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Sector cannotPlacedCarErrorDescription equals: error messageText.
			self deny: (sector includes: car) ]	
! !

!FormulaOneTest methodsFor: 'tests' stamp: 't 4/27/2025 13:20:50'!
test03CarCannotActivateTurboInNonTurboSector

	| car sector |

	sector _ self tenKilometersWithoutTurboSector.
	car _ self schumacherCar.
	
	sector atStartPut: car.
	
	self should: [ car activateTurbo ]
		raise: Error
		withExceptionDo: [ :error |
			self assert: Sector turboNotAllowedErrorDescription equals: error messageText.
			self deny: car isTurboActivated]
	! !

!FormulaOneTest methodsFor: 'tests' stamp: 't 4/27/2025 14:40:58'!
test04CarCannotActivateTurboWhenNoCarAhead

	| schumacher hamilton sector |
	
	sector _  TurboSector of: 20 * kilometer.
	
	schumacher _ self schumacherCar.
	hamilton _ self hamiltonCar.
	
	sector put: schumacher at: 12 * kilometer.
	sector put: hamilton at: 13 * kilometer.
	
	self 
		should: [ hamilton activateTurbo]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:exception |
			self assert: Sector cannotActivateTurboWhenNoCarAheadErrorDescription equals: exception messageText. 
			self deny: hamilton isTurboActivated ]! !

!FormulaOneTest methodsFor: 'tests' stamp: 't 4/27/2025 13:22:12'!
test05CarCanActivateTurboWhenLessThanASecondBehindAnotherCar

	| schumacher hamilton sector |
	
	sector _ self twentyFourKilometerTurboSector.
	
	schumacher _ self schumacherCar.
	hamilton _ self hamiltonCar.
	
	schumacher speed: 300 * kilometer / hour.
	hamilton speed: 300 * kilometer / hour.
	
	sector put: schumacher at: 12.95 * kilometer.
	sector put: hamilton at: 13 * kilometer.
	
	schumacher activateTurbo.
	
	self assert: schumacher isTurboActivated
	! !

!FormulaOneTest methodsFor: 'tests' stamp: 't 4/27/2025 13:22:12'!
test06CarCannotActivateTurboWhenMoreThanASecondBehindAnotherCar

	| schumacher hamilton sector |
	
	sector _ self twentyFourKilometerTurboSector.
	
	schumacher _ self schumacherCar.
	hamilton _ self hamiltonCar.
	
	schumacher speed: 300 * kilometer / hour.
	hamilton speed: 300 * kilometer / hour.
	
	sector put: schumacher at: 12.9 * kilometer.
	sector put: hamilton at: 13 * kilometer.
	
	self should: [schumacher activateTurbo]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :error |
			self 
				assert: Sector cannotActivateTurboWhenMoreThanASecondBehindAnotherCarErrorDescription 
				equals: error messageText.
			self deny: schumacher isTurboActivated]
			! !

!FormulaOneTest methodsFor: 'tests' stamp: 'HAW 5/2/2022 09:16:40'!
test07TrackMustHaveSectors

	self
		should: [ Track withSectors: #() ]
		raise: Error
		withMessageText: Track mustHaveSectorsErrorDescription! !

!FormulaOneTest methodsFor: 'tests' stamp: 't 4/27/2025 13:27:50'!
test08TheLengthOfATrackShouldBeTheSumOfItsSectors

	|  track |
	
	track := Track withSectors: self twoSectorsTrack.
	
	self assert: 30 * kilometer equals: 	track length! !

!FormulaOneTest methodsFor: 'tests' stamp: 't 4/27/2025 13:28:08'!
test09ACarCanNotBePlacedInAKilometerGreaterThanTrackLength

	|  track car outside |
	
	track := Track withSectors: self twoSectorsTrack.
	outside := track length + (1 * millimeter).
	car := self schumacherCar.
	
	self should: [ track put: car at: outside ] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Track cannotPlacedCarErrorDescription equals: error messageText.
			self deny: (track includes: car) ]	
! !

!FormulaOneTest methodsFor: 'tests' stamp: 't 4/27/2025 13:26:23'!
test10TrackShouldPlaceCarInKilometerWithinSector

	| sectors track car positionInTrack positionInSector2 |
	
	sectors _ self twoSectorsTrack.
		
	positionInSector2 _ 5 * kilometer.
	positionInTrack _ sectors first length + positionInSector2.
	
	track _ Track withSectors: sectors.
	car _ self schumacherCar.

	track put: car at: positionInTrack.
	
	self assert: sectors second equals: (track sectorOf: car).
	self assert: positionInTrack equals: (track positionOf: car).
	
	self deny: (sectors first includes: car).
	self assert: (sectors second includes: car).

! !

!FormulaOneTest methodsFor: 'tests' stamp: 't 4/27/2025 13:26:23'!
test11TrackShouldKnowCarsInRunning

	| sectors track car1 car2 |
	
	sectors _ self twoSectorsTrack.
		
	track _ Track withSectors: sectors.
	car1 _ self schumacherCar.
	car2 _ self verstappenCar.

	track put: car1 at: 10 * kilometer.
	track put: car2 at: 30 * kilometer.
	
	self assert: (track includes: car1).
	self assert: (track includes: car2).
		
	self assert: (sectors first includes: car1).
	self assert: (sectors second includes: car2).

! !

!FormulaOneTest methodsFor: 'tests' stamp: 't 4/27/2025 13:26:23'!
test12CarCannotBeInMoreThanOneSectorAtATime

	| sectors track car |
	
	sectors _ self twoSectorsTrack.
	
	track _ Track withSectors: sectors.
	car _ self schumacherCar.

	track put: car at: 5 * kilometer.
	track put: car at: 15 * kilometer.
	
	self assert: sectors second equals: (track sectorOf: car).
	self deny: (sectors first includes: car).
	self assert: (sectors second includes: car)
! !

!FormulaOneTest methodsFor: 'tests' stamp: 't 4/27/2025 13:26:23'!
test13GrandPrixLengthShouldBeTrackLengthTimesNumberOfLaps

	| track grandPrix numberOfLaps |
	
	track _ Track withSectors: (self twoSectorsTrack).
	numberOfLaps _ 100.
	
	grandPrix _ GrandPrix on: track running: numberOfLaps.
	
	self assert: track length * numberOfLaps	 equals: grandPrix length
	! !

!FormulaOneTest methodsFor: 'tests' stamp: 't 4/27/2025 13:37:25'!
test14TwoCarsCanBeAtTheSameDistanceFromStart

	| grandPrix hamilton verstappen |
	
	grandPrix _ GrandPrix 
		on: (self oneSectorTrack)
		running: 100.
	
	verstappen _ self verstappenCar.
	hamilton _ self hamiltonCar.	
	
	grandPrix put: verstappen at: 5 * kilometer.
	grandPrix put: hamilton at: 5 * kilometer.
	
	self assert: 5 * kilometer equals: (grandPrix locationOf: verstappen). 
	self assert:  5 * kilometer equals: (grandPrix locationOf: hamilton). 
	! !

!FormulaOneTest methodsFor: 'tests' stamp: 't 4/27/2025 13:37:25'!
test15ACarStoppedShouldNotMoveAfterSomeTime

	| grandPrix verstappen |
	
	verstappen _ self verstappenCar.
	verstappen speed: 0 * kilometer / hour.
	
	grandPrix _ GrandPrix 
		on: (self oneSectorTrack)
		running: 100
		with: (Set with: verstappen).
	
	grandPrix put: verstappen at: 5 * kilometer.
	grandPrix advance: 10 * minute.
	
	self assert: 5 * kilometer equals: (grandPrix locationOf: verstappen) 
	
	! !

!FormulaOneTest methodsFor: 'tests' stamp: 't 4/27/2025 13:26:23'!
test16ACarSpeedingShouldMoveAfterSomeTime

	| grandPrix verstappen sectors |
	
	verstappen _ self verstappenCar.
	verstappen speed: 0* kilometer / hour.
	
	sectors _ self twoSectorsTrack.
	
	grandPrix _ GrandPrix 
		on: (Track withSectors: sectors)
		running: 100
		with: (Set with: verstappen).
	
	grandPrix put: verstappen at: 0 * kilometer.
	verstappen speed: 300 * kilometer / hour.
	grandPrix advance: 1 * hour.
	
	self assert: 300 * kilometer equals: (grandPrix locationOf: verstappen). 
	
	! !

!FormulaOneTest methodsFor: 'tests' stamp: 't 4/27/2025 13:26:23'!
test17GrandPrixKnowsSectorOfCar

	| grandPrix verstappen sectors |
	
	verstappen _ self verstappenCar.
	
	sectors _ self twoSectorsTrack.
	
	grandPrix _ GrandPrix 
		on: (Track withSectors: sectors)
		running: 100
		with: (Set with: verstappen).
		
	grandPrix put: verstappen at: 5 * kilometer.
	
	self assert: 5 * kilometer equals: (grandPrix locationOf: verstappen). 
	self assert: sectors first equals: (grandPrix sectorOf: verstappen).
	! !

!FormulaOneTest methodsFor: 'tests' stamp: 't 4/27/2025 13:26:23'!
test18GrandPrixKnowsSectorOfCarAfterSomeTime

	| grandPrix verstappen sectors |
	
	verstappen _ self verstappenCar.
	
	sectors _ self twoSectorsTrack.
	
	grandPrix _ GrandPrix 
		on: (Track withSectors: sectors)
		running: 100
		with: (Set with: verstappen).
		
	grandPrix put: verstappen at: 0 * kilometer.
	
	verstappen speed: 5 * kilometer / hour. ":)"
	grandPrix advance: 1 * hour.
	
	self assert: 5 * kilometer equals: (grandPrix locationOf: verstappen). 
	self assert: sectors first equals: (grandPrix sectorOf: verstappen).
	! !

!FormulaOneTest methodsFor: 'tests' stamp: 't 4/27/2025 13:38:33'!
test19GrandPrixMovesCarsBetweenSectors

	| grandPrix verstappen sectorA sectorB |
	
	verstappen _ self verstappenCar.
	sectorA _ self tenKilometersTurboSector.
	sectorB _ self thirtyKilometerTurboSector.
	
	grandPrix _ GrandPrix 
		on: (Track withSectors: (OrderedCollection with: sectorA with: sectorB))
		running: 100
		with: (Set new add: verstappen; yourself).
		
	grandPrix put: verstappen at: 5 * kilometer.

	self assert: 5 * kilometer equals: (grandPrix locationOf: verstappen). 
	self assert: sectorA equals: (grandPrix sectorOf: verstappen).
	
	verstappen speed: 15 * kilometer / hour.
	grandPrix advance: 1 * hour.
	
	self assert: 20 * kilometer equals: (grandPrix locationOf: verstappen). 
	self assert: sectorB equals: (grandPrix sectorOf: verstappen).
	! !

!FormulaOneTest methodsFor: 'tests' stamp: 't 4/27/2025 13:49:10'!
test20FirstTurboIncrementsSpeedByTwentyPercent

	self assertSpeedIs: 120 * kilometer / hour after: [:turboAvailableCar | turboAvailableCar  activateTurbo].! !

!FormulaOneTest methodsFor: 'tests' stamp: 't 4/27/2025 14:11:52'!
test21SecondTurboSpeedsByTenPercent

	self assertSpeedIs: 110 * kilometer / hour after: 
	[:turboAvailableCar | turboAvailableCar activateTurbo; deactivateTurbo; activateTurbo]
	! !

!FormulaOneTest methodsFor: 'tests' stamp: 't 4/27/2025 14:11:39'!
test22ThirdTurboSpeedsByFivePercent

	self assertSpeedIs:105 * kilometer / hour  after: [:turboAvailableCar | turboAvailableCar activateTurbo; deactivateTurbo; activateTurbo; deactivateTurbo; activateTurbo]
	! !

!FormulaOneTest methodsFor: 'tests' stamp: 't 4/27/2025 14:22:26'!
test23AfterThridTurbo_TurboIsExhausted

	self 
		assertSpeedIs: 100 * kilometer / hour 
		after: [:turboAvailableCar | 
			turboAvailableCar activateTurbo; deactivateTurbo; activateTurbo; deactivateTurbo; activateTurbo; deactivateTurbo; activateTurbo]
	! !

!FormulaOneTest methodsFor: 'tests' stamp: 't 4/27/2025 14:21:59'!
test24CanNotActivateTurboWhenTurboIsActivated

	self withTurboAvailableCarDo: 
	[:turboAvailableCar | 
		turboAvailableCar activateTurbo.
		
		self 
			should: [ turboAvailableCar activateTurbo ]
			raise: Error - MessageNotUnderstood 
			withMessageText: turboAvailableCar turboAlreadyActivatedErrorDescription
	]
	! !

!FormulaOneTest methodsFor: 'tests' stamp: 't 4/27/2025 14:21:48'!
test25CanNotDeactivateTurboWhenIsDeactivated

	self withTurboAvailableCarDo: [:turboAvailableCar | 
	
		self 
			should: [ turboAvailableCar deactivateTurbo ]
			raise: Error - MessageNotUnderstood 
			withMessageText: turboAvailableCar turboAlreadydeActivatedErrorDescription
		]
		
	! !


!FormulaOneTest methodsFor: 'assertions' stamp: 't 4/27/2025 14:18:40'!
assertSpeedIs: anExpectedSpeed after: aTurboAvailableCarBlock 

	self  withTurboAvailableCarDo: 
	[:turboAvailableCar |  
		
		aTurboAvailableCarBlock value: turboAvailableCar .
		
		self assert: turboAvailableCar isTurboActivated.
		self assert: anExpectedSpeed equals: turboAvailableCar speed
		]! !

!FormulaOneTest methodsFor: 'assertions' stamp: 't 4/27/2025 14:40:58'!
thirtyKilometerTurboSector

	^ TurboSector of: 30 * kilometer! !

!FormulaOneTest methodsFor: 'assertions' stamp: 't 4/27/2025 14:16:36'!
withTurboAvailableCarDo: aTurboAvailableCarBlock

	| schumacher hamilton sector |
	
	sector := self twentyFourKilometerTurboSector.
	
	schumacher := self schumacherCar.
	hamilton := self hamiltonCar.
	
	schumacher speed: 100 * kilometer / hour.
	hamilton speed: 100 * kilometer / hour.
	
	sector put: schumacher at: 12.99 * kilometer.
	sector put: hamilton at: 13 * kilometer.
	
	aTurboAvailableCarBlock value: schumacher .
	
! !


!FormulaOneTest methodsFor: 'sectors' stamp: 't 4/27/2025 14:40:58'!
tenKilometersTurboSector

	^ TurboSector of: 10 * kilometer! !

!FormulaOneTest methodsFor: 'sectors' stamp: 't 4/27/2025 14:41:31'!
tenKilometersWithoutTurboSector

	^ NoTurboSector of: 10*kilometer! !

!FormulaOneTest methodsFor: 'sectors' stamp: 't 4/27/2025 14:40:58'!
twentyFourKilometerTurboSector

	^ TurboSector of: 24 * kilometer! !

!FormulaOneTest methodsFor: 'sectors' stamp: 't 4/27/2025 14:41:31'!
twentyKilometerWithoutTurboSector

	^ NoTurboSector of: 20 * kilometer! !


!FormulaOneTest methodsFor: 'cars' stamp: 't 4/27/2025 13:22:12'!
hamiltonCar

	^ FormulaOneCar drivenBy: #Hamilton! !

!FormulaOneTest methodsFor: 'cars' stamp: 't 4/27/2025 13:20:13'!
schumacherCar

	^ FormulaOneCar drivenBy: #Schumacher! !

!FormulaOneTest methodsFor: 'cars' stamp: 't 4/27/2025 13:23:24'!
verstappenCar

	^ FormulaOneCar drivenBy: #Verstappen! !


!classDefinition: #FormulaOneCar category: #'ISW1-2022-1C-Parcial-1'!
Object subclass: #FormulaOneCar
	instanceVariableNames: 'grandPrix driver speed traveledDistance currentSector turboActivations turboStatus'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-1C-Parcial-1'!

!FormulaOneCar methodsFor: 'initialization' stamp: 't 4/27/2025 16:02:45'!
firstTurboActivated

	^ TurboActivated 
		speeding: 12/10
		next: (TurboActivated 
			speeding: 11/10 
			next: (TurboActivated  
				speeding: 105/100 
				next: (TurboActivated exhaustedTurbo)))! !

!FormulaOneCar methodsFor: 'initialization' stamp: 't 4/27/2025 16:11:47'!
initializeDrivenBy: aDriver 

	driver := aDriver.
	turboStatus := TurboDeactivated next: (self firstTurboActivated).
	speed := 0*kilometer/hour.
	traveledDistance := 0.
	! !

!FormulaOneCar methodsFor: 'initialization' stamp: 'FRT 5/1/2022 11:26:28'!
runningInGrandPrix: aGrandPrix
	
	grandPrix _ aGrandPrix! !


!FormulaOneCar methodsFor: 'moving' stamp: 'HAW 4/30/2022 19:15:07'!
advance: aDistance

	traveledDistance _ traveledDistance + aDistance! !

!FormulaOneCar methodsFor: 'moving' stamp: 'FRT 4/30/2022 16:33:07'!
atSector: aSector

	currentSector _ aSector.! !

!FormulaOneCar methodsFor: 'moving' stamp: 't 4/27/2025 16:11:30'!
speed

	^speed * (turboStatus speedRateWhen) ! !

!FormulaOneCar methodsFor: 'moving' stamp: 'HAW 5/1/2022 17:34:26'!
speed: newSpeed

	speed _ newSpeed! !

!FormulaOneCar methodsFor: 'moving' stamp: 'HAW 4/30/2022 19:15:19'!
traveledDistance

	^ traveledDistance! !

!FormulaOneCar methodsFor: 'moving' stamp: 'HAW 4/30/2022 19:15:31'!
traveledDistance: aDistance

	traveledDistance _ aDistance! !


!FormulaOneCar methodsFor: 'turbo' stamp: 't 4/27/2025 14:55:34'!
activateTurbo

	turboStatus activateOn: self.
! !

!FormulaOneCar methodsFor: 'turbo' stamp: 't 4/27/2025 15:06:43'!
deactivateTurbo
	
	turboStatus deactivateOn: self! !

!FormulaOneCar methodsFor: 'turbo' stamp: 'HAW 5/2/2022 14:25:13'!
turboAlreadydeActivatedErrorDescription
	
	^'Turbo is already deactivated'! !


!FormulaOneCar methodsFor: 'testing' stamp: 't 4/27/2025 15:22:35'!
isTurboActivated
	
	^turboStatus isActivated! !

!FormulaOneCar methodsFor: 'testing' stamp: 'HAW 5/2/2022 14:23:06'!
turboAlreadyActivatedErrorDescription
	
	^'Turbo already activated'! !


!FormulaOneCar methodsFor: 'turbo-private' stamp: 't 4/27/2025 16:11:52'!
activateTurboInSectorWithTurbo
	
	turboStatus := turboStatus next.! !

!FormulaOneCar methodsFor: 'turbo-private' stamp: 't 4/27/2025 15:03:34'!
activateTurboWhenActivated
	 self error: self turboAlreadyActivatedErrorDescription 

! !

!FormulaOneCar methodsFor: 'turbo-private' stamp: 't 4/27/2025 14:58:45'!
activateTurboWhenDeactivated
	
	currentSector activateTurboTo: self.
! !

!FormulaOneCar methodsFor: 'turbo-private' stamp: 't 4/27/2025 16:00:29'!
deactivateTurboWhenActivated

	turboStatus  := TurboDeactivated  next: turboStatus next.! !

!FormulaOneCar methodsFor: 'turbo-private' stamp: 't 4/27/2025 15:18:39'!
deactivateTurboWhenDeactivated
	self error: self turboAlreadydeActivatedErrorDescription ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FormulaOneCar class' category: #'ISW1-2022-1C-Parcial-1'!
FormulaOneCar class
	instanceVariableNames: ''!

!FormulaOneCar class methodsFor: 'instance creation' stamp: 'HAW 4/30/2022 18:44:15'!
drivenBy: aDriver 

	^self new initializeDrivenBy: aDriver ! !


!classDefinition: #GrandPrix category: #'ISW1-2022-1C-Parcial-1'!
Object subclass: #GrandPrix
	instanceVariableNames: 'track numberOfLaps'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-1C-Parcial-1'!

!GrandPrix methodsFor: 'initialization' stamp: 'FRT 5/1/2022 11:26:39'!
initializeWithTrack: aTrack andNumberOfLaps: aNumberOfLaps andCars: aCollectionOfCars

	track _ aTrack.
	numberOfLaps _ aNumberOfLaps.
	aCollectionOfCars do: [ :car | car runningInGrandPrix: self ].
! !


!GrandPrix methodsFor: 'car position' stamp: 'FRT 4/30/2022 22:23:59'!
locationOf: aCar

	^ aCar traveledDistance.	! !

!GrandPrix methodsFor: 'car position' stamp: 'HAW 4/30/2022 19:15:32'!
put: aCar at: aDistance

	| distanceInTrack |
	
	aCar traveledDistance: aDistance.
	
	distanceInTrack _ aDistance \\ track length.
	track put: aCar at: distanceInTrack.
	! !

!GrandPrix methodsFor: 'car position' stamp: 'FRT 4/30/2022 15:38:16'!
sectorOf: aCar 

	^ track sectorOf: aCar.! !


!GrandPrix methodsFor: 'length' stamp: 'HAW 4/30/2022 18:43:17'!
length

	^ track length * numberOfLaps! !


!GrandPrix methodsFor: 'simulation' stamp: 't 4/27/2025 16:42:46'!
advance: aTimeLapse
	
	track cars do:[:car | self relocate: car after: aTimeLapse ]
! !

!GrandPrix methodsFor: 'simulation' stamp: 'HAW 5/1/2022 17:35:43'!
relocate: aCar after: aTimeLapse 

	| distanceMoved distanceInTrack |
	
	distanceMoved _ aCar speed * aTimeLapse.
	aCar advance: distanceMoved.
	
	distanceInTrack _ aCar traveledDistance \\ track length.
	track put: aCar at: distanceInTrack.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'GrandPrix class' category: #'ISW1-2022-1C-Parcial-1'!
GrandPrix class
	instanceVariableNames: ''!

!GrandPrix class methodsFor: 'instance creation' stamp: 'HAW 4/30/2022 19:36:05'!
on: aTrack running: aNumberOfLaps 

	^self on: aTrack running: aNumberOfLaps with: #()! !

!GrandPrix class methodsFor: 'instance creation' stamp: 'HAW 4/30/2022 19:36:16'!
on: aTrack running: aNumberOfLaps with: aCollectionOfCars

	^self new initializeWithTrack: aTrack andNumberOfLaps: aNumberOfLaps andCars: aCollectionOfCars! !


!GrandPrix class methodsFor: 'error message' stamp: 'ARM 4/28/2022 15:09:05'!
distanceOutSideRaceTrackLengthErrorMessage

	^'Distance outside Race Track length'! !

!GrandPrix class methodsFor: 'error message' stamp: 'FRT 5/1/2022 12:24:57'!
turboNotAllowedWithRainTiresErrorMessage

	^ 'Turbo not allowed with rain tires'! !


!classDefinition: #Sector category: #'ISW1-2022-1C-Parcial-1'!
Object subclass: #Sector
	instanceVariableNames: 'cars length'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-1C-Parcial-1'!

!Sector methodsFor: 'initialization' stamp: 'FRT 5/1/2022 10:02:21'!
initializeOf: aLength 

	cars _ Dictionary new.
	length _ aLength.! !


!Sector methodsFor: 'car position' stamp: 'FRT 5/1/2022 14:13:55'!
assertValidPosition: aPosition

	length < aPosition ifTrue: [ self error: self class cannotPlacedCarErrorDescription ]! !

!Sector methodsFor: 'car position' stamp: 'HAW 5/1/2022 16:59:05'!
atStartPut: aCar
 
	self put: aCar at: 0*kilometer! !

!Sector methodsFor: 'car position' stamp: 'FRT 4/30/2022 09:23:35'!
positionOf: aCar
 
	^ cars at: aCar.
! !

!Sector methodsFor: 'car position' stamp: 'FRT 5/1/2022 14:13:55'!
put: aCar at: aPosition
 
	self assertValidPosition: aPosition.
	
	cars at: aCar put: aPosition.
	aCar atSector: self.! !

!Sector methodsFor: 'car position' stamp: 'FRT 4/30/2022 15:04:40'!
remove: aCar
 
	cars removeKey: aCar ifAbsent: [].
! !


!Sector methodsFor: 'accessing' stamp: 'FRT 4/30/2022 22:08:51'!
cars
	
	^ cars keys! !

!Sector methodsFor: 'accessing' stamp: 'HAW 5/2/2022 14:26:16'!
length

	^length! !


!Sector methodsFor: 'testing' stamp: 'HAW 5/1/2022 16:54:33'!
includes: aCar

	^ cars includesKey: aCar! !


!Sector methodsFor: 'turbo' stamp: 't 4/27/2025 14:35:00'!
activateTurboTo: aCarToActivateTurboTo

	self subclassResponsibility .
! !

!Sector methodsFor: 'turbo' stamp: 't 4/27/2025 14:45:14'!
assertDriverIsOneSecondOrLess: aCarToActivateTurboTo ofDriverAt: positionOfCarAhead

	self subclassResponsibility! !

!Sector methodsFor: 'turbo' stamp: 't 4/27/2025 14:51:39'!
carAtPosition: positionOfDriver

	self subclassResponsibility! !

!Sector methodsFor: 'turbo' stamp: 't 4/27/2025 14:44:36'!
positionOfCarAheadOf: aCarToActiveTurboTo ifNone: alternativeClosure

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sector class' category: #'ISW1-2022-1C-Parcial-1'!
Sector class
	instanceVariableNames: ''!

!Sector class methodsFor: 'instance creation' stamp: 't 4/27/2025 14:37:56'!
assertIsValidLength: aLength

	^ aLength strictlyPositive ifFalse: [ self error: self lengthMustBePositiveErrorDescription ]! !

!Sector class methodsFor: 'instance creation' stamp: 't 4/27/2025 14:39:37'!
of: aLength 

	self assertIsValidLength: aLength	.

	^ self new initializeOf: aLength! !


!Sector class methodsFor: 'error message' stamp: 'FRT 4/30/2022 20:24:41'!
cannotActivateTurboWhenMoreThanASecondBehindAnotherCarErrorDescription
	
	^ 'Cannot activate Turbo when opponent is more than 1 second ahead'! !

!Sector class methodsFor: 'error message' stamp: 'FRT 4/30/2022 20:13:07'!
cannotActivateTurboWhenNoCarAheadErrorDescription
	
	^ 'Cannot activate Turbo without opponent ahead'! !

!Sector class methodsFor: 'error message' stamp: 'FRT 4/30/2022 10:08:26'!
cannotPlacedCarErrorDescription

	^ 'Driver can not be placed outside section'! !

!Sector class methodsFor: 'error message' stamp: 'HAW 4/30/2022 17:05:20'!
lengthMustBePositiveErrorDescription

	^ 'Length must be positive'! !

!Sector class methodsFor: 'error message' stamp: 'FRT 4/30/2022 09:54:45'!
turboNotAllowedErrorDescription
	
	^ 'Turbo not allowed in this Sector'! !


!classDefinition: #NoTurboSector category: #'ISW1-2022-1C-Parcial-1'!
Sector subclass: #NoTurboSector
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-1C-Parcial-1'!

!NoTurboSector methodsFor: 'turbo' stamp: 't 4/27/2025 14:32:08'!
activateTurboTo: aCarToActivateTurboTo

	self error: Sector turboNotAllowedErrorDescription
! !


!classDefinition: #TurboSector category: #'ISW1-2022-1C-Parcial-1'!
Sector subclass: #TurboSector
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-1C-Parcial-1'!

!TurboSector methodsFor: 'turbo' stamp: 't 4/27/2025 14:33:21'!
activateTurboTo: aCarToActivateTurboTo

	| positionOfCarAhead |
	
	positionOfCarAhead := self 
		positionOfCarAheadOf: aCarToActivateTurboTo 
		ifNone: [self error: Sector cannotActivateTurboWhenNoCarAheadErrorDescription ].
		
	self 
		assertDriverIsOneSecondOrLess: aCarToActivateTurboTo
		ofDriverAt: positionOfCarAhead.

	aCarToActivateTurboTo activateTurboInSectorWithTurbo
! !

!TurboSector methodsFor: 'turbo' stamp: 't 4/27/2025 14:51:18'!
assertDriverIsOneSecondOrLess: aCarToActivateTurboTo ofDriverAt: positionOfCarAhead

	| carAhead carAheadTime carToActivateTurboTime |
	
	carAhead := self carAtPosition: positionOfCarAhead.
	
	carAheadTime := positionOfCarAhead / carAhead speed.
	
	carToActivateTurboTime := (cars at: aCarToActivateTurboTo) / aCarToActivateTurboTo speed.
	
	carAheadTime- carToActivateTurboTime < (1 * second)
		ifFalse: [self error: Sector cannotActivateTurboWhenMoreThanASecondBehindAnotherCarErrorDescription ].! !

!TurboSector methodsFor: 'turbo' stamp: 't 4/27/2025 14:51:39'!
carAtPosition: positionOfDriver

	^cars keyAtValue: positionOfDriver! !

!TurboSector methodsFor: 'turbo' stamp: 't 4/27/2025 14:44:35'!
positionOfCarAheadOf: aCarToActiveTurboTo ifNone: alternativeClosure

	| sortedPositions carToActivateTurboToPosition |
	
	carToActivateTurboToPosition _ cars at: aCarToActiveTurboTo.
	sortedPositions _ cars asSortedCollection remove: carToActivateTurboToPosition; yourself.
	 
	^ sortedPositions 
		detect: [:aPosition | aPosition > carToActivateTurboToPosition ]
		ifNone: alternativeClosure ! !


!classDefinition: #Track category: #'ISW1-2022-1C-Parcial-1'!
Object subclass: #Track
	instanceVariableNames: 'sectors driversDistanceFromBeginning'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-1C-Parcial-1'!

!Track methodsFor: 'initialization' stamp: 'HAW 4/30/2022 17:06:50'!
initializeWithSectors: aSectors

	sectors _ aSectors copy.! !


!Track methodsFor: 'car position' stamp: 't 4/27/2025 16:54:27'!
assertCanPlaceAt: aPosition

	^ aPosition > self length ifTrue: [ self error: self class cannotPlacedCarErrorDescription ]! !

!Track methodsFor: 'car position' stamp: 'HAW 5/2/2022 14:10:18'!
carNotFoundErrorDescription

	^ 'Car not found'! !

!Track methodsFor: 'car position' stamp: 't 4/27/2025 16:53:17'!
positionOf: aCar
	| accumulatedLength|

	accumulatedLength := 0 * kilometer.
	
	sectors do: [:sector | 
		(sector includes: aCar ) 
		ifTrue: [^ accumulatedLength + (sector positionOf: aCar)].
		accumulatedLength := accumulatedLength + sector length.
		].
	
	self error: 'car not in track!!' ! !

!Track methodsFor: 'car position' stamp: 't 4/27/2025 16:58:15'!
put: aCar at: aPosition

	| accumulatedLength |
	self assertCanPlaceAt: aPosition.
	self remove: aCar.
	accumulatedLength := 0 * kilometer.
	
	sectors do: [:sector |
		(aPosition <= (accumulatedLength +  sector length)) ifTrue: [^sector put: aCar at: aPosition - accumulatedLength].
		
		accumulatedLength := accumulatedLength + sector length.
		].
	

	self shouldNotHappenBecause: #assertCanPlaceCarAt:
	
	
	
	! !

!Track methodsFor: 'car position' stamp: 'FRT 4/30/2022 15:15:27'!
remove: aCar
	
	| currentSector |
	
	currentSector _ self sectorOf: aCar ifNone: [ ^ self ].
	currentSector remove: aCar.
	! !

!Track methodsFor: 'car position' stamp: 'HAW 5/2/2022 14:10:18'!
sectorOf: aCar
	
	^self sectorOf: aCar ifNone: [ self error: self carNotFoundErrorDescription ]! !

!Track methodsFor: 'car position' stamp: 't 4/27/2025 17:00:22'!
sectorOf: aCar ifNone: aBlock

	 ^sectors detect: [:sector | sector includes: aCar ]	 ifNone: aBlock ! !


!Track methodsFor: 'accessing' stamp: 't 4/27/2025 16:41:34'!
cars
	
	^sectors inject: OrderedCollection new into: [:cars :sector | cars addAll: sector cars; yourself ] .
	
	! !

!Track methodsFor: 'accessing' stamp: 't 4/27/2025 16:47:57'!
length

	^ sectors sum:[:sector | sector length] ifEmpty: [0 * kilometer].
! !


!Track methodsFor: 'testing' stamp: 't 4/27/2025 16:46:49'!
includes: aCar
	"Returns if any of the sectors includes aCar"
	
	^ sectors anySatisfy: [:sector | sector includes: aCar ]
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Track class' category: #'ISW1-2022-1C-Parcial-1'!
Track class
	instanceVariableNames: ''!

!Track class methodsFor: 'instance creation' stamp: 't 4/27/2025 16:48:26'!
assertNotEmpty: sectors

	^ sectors isEmpty ifTrue: [ self error: self mustHaveSectorsErrorDescription ]! !

!Track class methodsFor: 'instance creation' stamp: 't 4/27/2025 16:48:26'!
withSectors: sectors

	self assertNotEmpty: sectors.
	
	^ self new initializeWithSectors: sectors! !


!Track class methodsFor: 'error messages' stamp: 'FRT 4/29/2022 18:22:32'!
cannotPlacedCarErrorDescription

	^ 'Car cannot be placed in track'! !

!Track class methodsFor: 'error messages' stamp: 'HAW 4/30/2022 17:09:27'!
mustHaveSectorsErrorDescription

	^'Track must have sectors'! !


!classDefinition: #TurboStatus category: #'ISW1-2022-1C-Parcial-1'!
Object subclass: #TurboStatus
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-1C-Parcial-1'!

!TurboStatus methodsFor: 'activate/deactivate' stamp: 't 4/27/2025 16:15:46'!
activateOn: aFormulaOneCar 
	
	self subclassResponsibility ! !

!TurboStatus methodsFor: 'activate/deactivate' stamp: 't 4/27/2025 16:15:57'!
deactivateOn: aFormulaOneCar 
	
	self subclassResponsibility ! !

!TurboStatus methodsFor: 'activate/deactivate' stamp: 't 4/27/2025 16:16:05'!
isActivated
	
	self subclassResponsibility ! !


!TurboStatus methodsFor: 'next' stamp: 't 4/27/2025 16:16:25'!
next
	
	self subclassResponsibility ! !


!TurboStatus methodsFor: 'speed' stamp: 't 4/27/2025 16:17:00'!
speedRateWhen
	self subclassResponsibility ! !


!classDefinition: #TurboActivated category: #'ISW1-2022-1C-Parcial-1'!
TurboStatus subclass: #TurboActivated
	instanceVariableNames: 'speedingRatio next'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-1C-Parcial-1'!

!TurboActivated methodsFor: 'initialization' stamp: 't 4/27/2025 16:14:49'!
initializeExhaustedTurbo

	self initializeSpeeding: 1 next: self ! !

!TurboActivated methodsFor: 'initialization' stamp: 't 4/27/2025 15:42:07'!
initializeSpeeding: aSpeedingRatio next: aNext 
	
	speedingRatio := aSpeedingRatio.
	next := aNext.! !


!TurboActivated methodsFor: 'activate/deactivate' stamp: 't 4/27/2025 15:16:00'!
activateOn: aFormulaOneCar 
	
	^ aFormulaOneCar activateTurboWhenActivated
! !

!TurboActivated methodsFor: 'activate/deactivate' stamp: 't 4/27/2025 15:12:34'!
deactivateOn: aFormulaOneCar 
	^aFormulaOneCar deactivateTurboWhenActivated! !

!TurboActivated methodsFor: 'activate/deactivate' stamp: 't 4/27/2025 15:23:15'!
isActivated
	^true! !


!TurboActivated methodsFor: 'next' stamp: 't 4/27/2025 16:01:46'!
next
	
	^next! !


!TurboActivated methodsFor: 'speed' stamp: 't 4/27/2025 16:11:30'!
speedRateWhen

	^speedingRatio ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TurboActivated class' category: #'ISW1-2022-1C-Parcial-1'!
TurboActivated class
	instanceVariableNames: ''!

!TurboActivated class methodsFor: 'instance creation' stamp: 't 4/27/2025 15:39:47'!
exhaustedTurbo
	
	^self new initializeExhaustedTurbo! !

!TurboActivated class methodsFor: 'instance creation' stamp: 't 4/27/2025 15:41:51'!
speeding: aSpeedingRatio next: aNext 

	^self new initializeSpeeding: aSpeedingRatio next: aNext ! !


!classDefinition: #TurboDeactivated category: #'ISW1-2022-1C-Parcial-1'!
TurboStatus subclass: #TurboDeactivated
	instanceVariableNames: 'next'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-1C-Parcial-1'!

!TurboDeactivated methodsFor: 'initialization' stamp: 't 4/27/2025 15:42:50'!
initializeNext: aNext 

	next := aNext.! !


!TurboDeactivated methodsFor: 'activate/deactivate' stamp: 't 4/27/2025 14:57:38'!
activateOn: aFormulaOneCar 
	
	^ aFormulaOneCar activateTurboWhenDeactivated! !

!TurboDeactivated methodsFor: 'activate/deactivate' stamp: 't 4/27/2025 15:18:06'!
deactivateOn: aFormulaOneCar 
	^ aFormulaOneCar deactivateTurboWhenDeactivated! !

!TurboDeactivated methodsFor: 'activate/deactivate' stamp: 't 4/27/2025 15:22:59'!
isActivated
	^ false! !


!TurboDeactivated methodsFor: 'next' stamp: 't 4/27/2025 16:01:12'!
next
	
	^next! !


!TurboDeactivated methodsFor: 'speed' stamp: 't 4/27/2025 16:11:30'!
speedRateWhen
	^ 1! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TurboDeactivated class' category: #'ISW1-2022-1C-Parcial-1'!
TurboDeactivated class
	instanceVariableNames: ''!

!TurboDeactivated class methodsFor: 'instance creation' stamp: 't 4/27/2025 15:42:37'!
next: aNext 
	
	^self new initializeNext: aNext ! !
