!classDefinition: #CityTest category: #'ISW1-2021-2C-1erParcial'!
TestCase subclass: #CityTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-2C-1erParcial'!

!CityTest methodsFor: 'test' stamp: 't 5/2/2025 12:08:35'!
test01CityWithoutPowerServicesHaveZeroEnergyProduced

	
	self assertCityEqualsEnergyOrWaterConsumption: [:city | self assert: 0 * ep equals: city energyProduced.]! !

!CityTest methodsFor: 'test' stamp: 't 5/2/2025 12:09:25'!
test02CityWithSolarPlantWithoutZonesHave500EnergyAvailable

	self assertCityEqualsEnergyOrWaterConsumption: [:city | 	city addService: self solarPlant. 	self assert: 500 * ep equals: city energyAvailable.]! !

!CityTest methodsFor: 'test' stamp: 't 5/2/2025 12:35:48'!
test03CityWithSolarPlantWithResidentialZonesHave495EnergyAvailable

	self assertCityEqualsEnergyOrWaterConsumption:  [:city | city addService: self solarPlant; addService: self waterTower; addZone: self residentialZone. self assert: 500 - 5 * ep equals: city energyAvailable.] ! !

!CityTest methodsFor: 'test' stamp: 't 5/2/2025 12:36:10'!
test04CityWithSolarPlantWithCommertialZonesHave492EnergyAvailable

	self assertCityEqualsEnergyOrWaterConsumption: [:city | city addService: self solarPlant; addService: self waterTower; addZone: self residentialZone; addZone: self commertialZone.self assert: 500 - 5 - 8 * ep equals: city energyAvailable.]! !

!CityTest methodsFor: 'test' stamp: 't 5/2/2025 12:36:25'!
test05CityWithSolarPlantWithIndustrialZonesHave490EnergyAvailable
		
	self assertCityEqualsEnergyOrWaterConsumption: [:city | city addService: self solarPlant;addService: self waterTower; addZone: self industrialZone. self assert: 500 - 10 * ep equals: city energyAvailable.]
		! !

!CityTest methodsFor: 'test' stamp: 't 5/2/2025 12:36:53'!
test06CityWithSolarPlantWithServeralZonesImpactEnergyAvailable

	self assertCityEqualsEnergyOrWaterConsumption:	 [:city | city addService: self solarPlant; addService: self waterTower; addZone: self residentialZone; addZone: self commertialZone; addZone: self industrialZone; addZone: self industrialZone. self assert: 500 - 5 - 8 - (10 * 2) * ep equals: city energyAvailable.]! !

!CityTest methodsFor: 'test' stamp: 't 5/2/2025 12:14:32'!
test07CityWithoutWaterServicesHaveZeroWaterProduced

	self assertCityEqualsEnergyOrWaterConsumption: [:city | self assert: 0 * wp equals: city waterProduced.]! !

!CityTest methodsFor: 'test' stamp: 't 5/2/2025 12:14:44'!
test08CityWithWaterTowerWithoutZonesHave200WaterAvailable

	self assertCityEqualsEnergyOrWaterConsumption: [:city | city addService: self waterTower. self assert: 200 * wp equals: city waterAvailable.]! !

!CityTest methodsFor: 'test' stamp: 't 5/2/2025 12:37:12'!
test09CityWithWaterTowerWithResidentialZonesHave191WaterAvailable

	self assertCityEqualsEnergyOrWaterConsumption: [:city |city addService: self solarPlant; addService: self waterTower; addZone: self residentialZone.self assert: 200 - 9 * wp equals: city waterAvailable.].
	
	! !

!CityTest methodsFor: 'test' stamp: 't 5/2/2025 12:37:30'!
test10CityWithWaterTowerWithCommertialZonesHave198WaterAvailable

	self assertCityEqualsEnergyOrWaterConsumption: [:city | city addService: self solarPlant; addService: self waterTower; addZone: self residentialZone; addZone: self commertialZone.self assert: 200 - 9 - 2 * wp equals: city waterAvailable.].
	
	! !

!CityTest methodsFor: 'test' stamp: 't 5/2/2025 12:37:44'!
test11CityWithWaterTowerWithIndustrialZonesHave190WaterAvailable

	self assertCityEqualsEnergyOrWaterConsumption: [:city | city addService: self solarPlant; addService: self waterTower; addZone: self industrialZone. self assert: 200 - 10 * wp equals: city waterAvailable.].
	
! !

!CityTest methodsFor: 'test' stamp: 't 5/2/2025 12:38:05'!
test12CityWithWaterTowerWithServeralZonesImpactWaterAvailable

	self assertCityEqualsEnergyOrWaterConsumption: [:city | city addService: self solarPlant;addService: self waterTower;addZone: self residentialZone; addZone: self commertialZone; addZone: self industrialZone; addZone: self industrialZone.  self assert: 200 - 31 * wp equals: city waterAvailable.].
	! !

!CityTest methodsFor: 'test' stamp: 't 5/2/2025 12:38:14'!
test13CityWith2SolarPlantsHaveTwiceEnergyAvailable

	self assertCityEqualsEnergyOrWaterConsumption: [:city |	city addService: self solarPlant;addService: self solarPlant.	self assert: (500 * 2) * ep equals: city energyAvailable.]! !

!CityTest methodsFor: 'test' stamp: 't 5/2/2025 12:38:19'!
test14CityWith2WaterTowerHaveTwiceWaterAvailable

	self assertCityEqualsEnergyOrWaterConsumption: [:city |	city addService: self waterTower; addService: self waterTower.	self assert: (200 * 2) * wp equals: city waterAvailable.]! !

!CityTest methodsFor: 'test' stamp: 't 5/2/2025 12:16:49'!
test15AResidentialZoneCannotBeAddedWithoutEnergyAndWaterAvailable

	self assertCityEqualsEnergyOrWaterConsumption: [:city|
	self 
		should: [ city addZone: self residentialZone. ] 
		raise: Error
		withExceptionDo: [ :error | 
			self assert: error messageText equals: City cannotAddZoneErrorDescription.
			self assert: 0 equals: city zones size]].
		! !

!CityTest methodsFor: 'test' stamp: 't 5/2/2025 12:17:07'!
test16ACommertialZoneCannotBeAddedWithoutEnergyAndWaterAvailable

	self assertCityEqualsEnergyOrWaterConsumption: [:city|	
	self 
		should: [ city addZone: self commertialZone ] 
		raise: Error
		withExceptionDo: [ :error | 
			self assert: error messageText equals: City cannotAddZoneErrorDescription.
			self assert: 0 equals: city zones size ]]
		! !

!CityTest methodsFor: 'test' stamp: 't 5/2/2025 12:17:29'!
test17AnIndustrialZoneCannotBeAddedWithoutEnergyAndWaterAvailable

	self assertCityEqualsEnergyOrWaterConsumption: [:city |
	self 
		should: [ city addZone: self industrialZone ] 
		raise: Error
		withExceptionDo: [ :error | 
			self assert: error messageText equals: City cannotAddZoneErrorDescription.
			self assert: 0 equals: city zones size ]]
		! !

!CityTest methodsFor: 'test' stamp: 't 5/2/2025 12:17:51'!
test18CityWithoutZonesHaveZeroEnergyConsumption

	self assertCityEqualsEnergyOrWaterConsumption: [:city |	self assert: 0 * ep equals: city energyConsumption.]! !

!CityTest methodsFor: 'test' stamp: 't 5/2/2025 12:38:37'!
test19CityWithoutResidentialZonesCannotAddCommertialZone

	self assertCityEqualsEnergyOrWaterConsumption: [:city |
	
	city addService: self solarPlant; addService: self waterTower.
	
	self 
		should: [ city addZone: self commertialZone ] 
		raise: Error
		withExceptionDo: [ :error | 
			self assert: error messageText equals: City cannotAddCommertialZoneErrorDescription.
			self assert: 0 equals: city zones size ]]! !

!CityTest methodsFor: 'test' stamp: 't 5/2/2025 12:48:24'!
test20CityWithSolarPlantWithResidentialZoneWithManyCellsHave10LessEnergyAvailable

	self assertCityEqualsEnergyOrWaterConsumption: [:city | 
		|zone|
		city addService: self solarPlant.
		city addService: self waterTower.

		zone := self residentialZone.
		zone setNumberOfCells: 2.
		city addZone: zone.
		
		self assert: 500 - (5 * 2) * ep equals: city energyAvailable. 
	]
! !

!CityTest methodsFor: 'test' stamp: 't 5/2/2025 12:47:40'!
test21CityWithSolarPlantWithCommertialZoneWithManyCellsHave16LessEnergyAvailable

	self assertCityEqualsEnergyOrWaterConsumption: [:city | 
		|zone|
		city addService: self solarPlant.
		city addService: self waterTower.
		
		city addZone: self residentialZone.
		
		zone := self commertialZone.
		zone setNumberOfCells: 2.
		city addZone: zone.
		
		self assert: 500 - 5 - (8 * 2) * ep equals: city energyAvailable.
	]! !

!CityTest methodsFor: 'test' stamp: 't 5/2/2025 12:47:31'!
test22CityWithSolarPlantWithIndustrialZoneWithManyCellsHave20LessEnergyAvailable

	self assertCityEqualsEnergyOrWaterConsumption: [:city |
		 |zone|
		city addService: self solarPlant.
		city addService: self waterTower.

		zone := self industrialZone.
		zone setNumberOfCells: 2.
		city addZone: zone.
		
		self assert: 500 - (10 * 2) * ep equals: city energyAvailable.
	]
	! !

!CityTest methodsFor: 'test' stamp: 't 5/2/2025 12:47:16'!
test23CityWithWaterTowerWithResidentialZoneWithManyCellsHave18LessWaterAvailable

	self assertCityEqualsEnergyOrWaterConsumption: [:city |  
		|zone|
		city addService: self solarPlant.
		city addService: self waterTower.

		zone := self residentialZone.
		zone setNumberOfCells: 2.
		city addZone: zone.
		
		self assert: 200 - (9 * 2) * wp equals: city waterAvailable.
	]! !

!CityTest methodsFor: 'test' stamp: 't 5/2/2025 12:47:07'!
test24CityWithWaterTowerWithCommertialZoneWithManyCellsHave4LessWaterAvailable

	self assertCityEqualsEnergyOrWaterConsumption: [:city | 
		|zone|
		city addService: self solarPlant.
		city addService: self waterTower.

		city addZone: self residentialZone.
		
		zone := self commertialZone.
		zone setNumberOfCells: 2.
		city addZone: zone.
		
		self assert: 200 - 9 - (2 * 2) * wp equals: city waterAvailable.
	]! !

!CityTest methodsFor: 'test' stamp: 't 5/2/2025 12:48:03'!
test25CityWithWaterTowerWithIndustrialZoneWithManyCellsHave20LessWaterAvailable

	self assertCityEqualsEnergyOrWaterConsumption: [:city | 
		|zone|
		city addService: self solarPlant.
		city addService: self waterTower.
		
		zone := self industrialZone.
		zone setNumberOfCells: 2.
		city addZone: zone.
		
		self assert: 200 - (10 * 2) * wp equals: city waterAvailable.
	]! !


!CityTest methodsFor: 'assertion' stamp: 't 5/2/2025 12:08:24'!
assertCityEqualsEnergyOrWaterConsumption: aBlock
	|city|
	city := City new.
	aBlock value:city.! !


!CityTest methodsFor: 'creation' stamp: 't 5/2/2025 11:18:03'!
commertialZone

	^ Zone createCommertialZone! !

!CityTest methodsFor: 'creation' stamp: 't 5/2/2025 11:18:14'!
industrialZone

	^ Zone createIndustrialZone! !

!CityTest methodsFor: 'creation' stamp: 't 5/2/2025 11:18:24'!
residentialZone

	^ Zone createResidentialZone! !

!CityTest methodsFor: 'creation' stamp: 't 5/2/2025 11:11:50'!
solarPlant

	^ Service createSolarPlant! !

!CityTest methodsFor: 'creation' stamp: 't 5/2/2025 11:16:22'!
waterTower

	^ Service createWaterTower! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CityTest class' category: #'ISW1-2021-2C-1erParcial'!
CityTest class
	instanceVariableNames: ''!

!CityTest class methodsFor: 'as yet unclassified' stamp: 'FRT 9/22/2021 19:22:41'!
initialize

	"Este método está para crear unidades"
	"No lo deben tocar ni darle importancia durante el parcial"
	
	| ep wp |
	ep := BaseUnit named: 'energypoint' sign: 'ep'.
	wp := BaseUnit named: 'waterpoint' sign: 'wp'.
	
	Smalltalk at: #ep put: ep.
	Smalltalk at: #wp put: wp.! !


!classDefinition: #City category: #'ISW1-2021-2C-1erParcial'!
Object subclass: #City
	instanceVariableNames: 'zones name services'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-2C-1erParcial'!

!City methodsFor: 'structure' stamp: 'FRT 9/16/2021 20:57:01'!
addService: aService 

	services ifNil: [ services _ OrderedCollection new].
	services add: aService.! !

!City methodsFor: 'structure' stamp: 'HAW 9/23/2021 11:04:39'!
setName: aName

	name _ aName.! !


!City methodsFor: 'water' stamp: 'FRT 9/16/2021 21:23:24'!
waterAvailable
	
	^ self waterProduced - self waterConsumption.! !

!City methodsFor: 'water' stamp: 't 5/2/2025 11:24:24'!
waterConsumption
	
	| total |
	
	zones ifNil: [zones := OrderedCollection new].
	
	total := 0.
	
	zones do: [:zone |
		total := total + zone waterConsumption
	].

	^ total.! !

!City methodsFor: 'water' stamp: 't 5/2/2025 11:22:52'!
waterProduced
	
	services ifNil: [services := OrderedCollection new].
	
	^(services select:[:service | service isWaterTower]) inject: (0 * wp) into:[:total :service | total +(200 * wp) ]
	
	"misma idea que antes, seleccionamos y foldeamos"! !


!City methodsFor: 'energy' stamp: 'FRT 9/16/2021 21:06:00'!
energyAvailable
	
	^ self energyProduced - self energyConsumption

! !

!City methodsFor: 'energy' stamp: 't 5/2/2025 11:15:51'!
energyConsumption
	
	| total |
	
	zones ifNil: [zones := OrderedCollection new].

	total := 0.
	
	zones do:[: zone |
		total := total + zone energyConsumed
	].
	^ total.! !

!City methodsFor: 'energy' stamp: 't 5/2/2025 11:13:43'!
energyProduced
	
	services ifNil: [services := OrderedCollection new].
	
	^(services select:[:service | service isSolarPlant	]) inject: (0 * ep)  into:[:total :service | total + (500 * ep)].
	
	"seleccionamos los que cumple, foldeamos la lista acumulando desde 0*ep"! !


!City methodsFor: 'zone' stamp: 't 5/2/2025 11:28:55'!
addZone: aZone

	zones ifNil: [ zones := OrderedCollection new].
	
	aZone canBeAddedToCityWithEnergy: self energyAvailable andWater: self waterAvailable thatHasOrNotResidentialZones: self hasResidentialZones.

	zones add: aZone.
! !

!City methodsFor: 'zone' stamp: 't 5/2/2025 11:34:25'!
hasResidentialZones

	zones ifNil: [ ^ false ].

	^zones anySatisfy:[:zone |		zone isResidential].! !

!City methodsFor: 'zone' stamp: 'FRT 9/16/2021 21:43:27'!
zones

	zones ifNil: [ zones _ OrderedCollection new].

	^ zones.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'City class' category: #'ISW1-2021-2C-1erParcial'!
City class
	instanceVariableNames: ''!

!City class methodsFor: 'as yet unclassified' stamp: 'FRT 9/16/2021 22:10:50'!
cannotAddCommertialZoneErrorDescription

	^ 'Cannot add commertial zone without Residential zones'.! !

!City class methodsFor: 'as yet unclassified' stamp: 'FRT 9/16/2021 21:41:32'!
cannotAddZoneErrorDescription

	^ 'Cannot add zone'.! !


!classDefinition: #Service category: #'ISW1-2021-2C-1erParcial'!
Object subclass: #Service
	instanceVariableNames: 'type'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-2C-1erParcial'!

!Service methodsFor: 'assertions' stamp: 't 5/2/2025 11:37:40'!
isSolarPlant
	self subclassResponsibility ! !

!Service methodsFor: 'assertions' stamp: 't 5/2/2025 11:37:50'!
isWaterTower
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Service class' category: #'ISW1-2021-2C-1erParcial'!
Service class
	instanceVariableNames: ''!

!Service class methodsFor: 'instance creation' stamp: 't 5/2/2025 11:12:21'!
createSolarPlant
	
	^SolarPlant new.! !

!Service class methodsFor: 'instance creation' stamp: 't 5/2/2025 11:16:48'!
createWaterTower
	
	^WaterTower new ! !


!classDefinition: #SolarPlant category: #'ISW1-2021-2C-1erParcial'!
Service subclass: #SolarPlant
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-2C-1erParcial'!

!SolarPlant methodsFor: 'assertion' stamp: 't 5/2/2025 11:14:07'!
isSolarPlant
	^ true! !

!SolarPlant methodsFor: 'assertion' stamp: 't 5/2/2025 11:23:23'!
isWaterTower
	^false! !


!classDefinition: #WaterTower category: #'ISW1-2021-2C-1erParcial'!
Service subclass: #WaterTower
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-2C-1erParcial'!

!WaterTower methodsFor: 'assertion' stamp: 't 5/2/2025 11:17:00'!
isSolarPlant
	^ false! !

!WaterTower methodsFor: 'assertion' stamp: 't 5/2/2025 11:23:04'!
isWaterTower
	^true! !


!classDefinition: #Zone category: #'ISW1-2021-2C-1erParcial'!
Object subclass: #Zone
	instanceVariableNames: 'type numberOfCells'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-2C-1erParcial'!

!Zone methodsFor: 'initialization' stamp: 'FRT 9/16/2021 20:27:04'!
initializeWithType: aZoneType 

	type := aZoneType.! !


!Zone methodsFor: 'accessing' stamp: 'FRT 9/20/2021 17:00:06'!
getNumberOfCells

	numberOfCells ifNil: [ ^ 1].	
	
	^ numberOfCells! !

!Zone methodsFor: 'accessing' stamp: 'HAW 9/23/2021 11:05:04'!
setNumberOfCells: aNumberOfCells
	
	numberOfCells _ aNumberOfCells! !


!Zone methodsFor: 'energy' stamp: 't 5/2/2025 11:39:47'!
energyConsumed
	self subclassResponsibility ! !


!Zone methodsFor: 'water' stamp: 't 5/2/2025 11:39:34'!
waterConsumption
	self subclassResponsibility ! !


!Zone methodsFor: 'addition' stamp: 't 5/2/2025 11:39:15'!
canBeAddedToCityWithEnergy: anEnergyValue andWater: aWaterValue thatHasOrNotResidentialZones: aBoolean 
	self subclassResponsibility ! !


!Zone methodsFor: 'assertion' stamp: 't 5/2/2025 11:41:20'!
isResidential
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Zone class' category: #'ISW1-2021-2C-1erParcial'!
Zone class
	instanceVariableNames: ''!

!Zone class methodsFor: 'instance creation' stamp: 't 5/2/2025 11:20:50'!
createCommertialZone
	
	^Commertial new ! !

!Zone class methodsFor: 'instance creation' stamp: 't 5/2/2025 11:21:45'!
createIndustrialZone
	
	^Industrial new ! !

!Zone class methodsFor: 'instance creation' stamp: 't 5/2/2025 11:19:40'!
createResidentialZone
	
	^Residential new ! !


!classDefinition: #Commertial category: #'ISW1-2021-2C-1erParcial'!
Zone subclass: #Commertial
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-2C-1erParcial'!

!Commertial methodsFor: 'addition' stamp: 't 5/2/2025 11:36:37'!
canBeAddedToCityWithEnergy: anEnergyValue andWater: aWaterValue thatHasOrNotResidentialZones: aBoolean 
	
	anEnergyValue < (2 * ep) ifTrue: [self error: City cannotAddZoneErrorDescription ].
	aWaterValue < (8 * wp) ifTrue: [ self error: City cannotAddZoneErrorDescription ].
	aBoolean ifFalse: [self error: City cannotAddCommertialZoneErrorDescription ].
! !


!Commertial methodsFor: 'energy' stamp: 't 5/2/2025 11:21:22'!
energyConsumed
	^((8 * ep) * self getNumberOfCells)! !


!Commertial methodsFor: 'water' stamp: 't 5/2/2025 11:25:19'!
waterConsumption
	^ ((2 * wp) * self getNumberOfCells)! !


!Commertial methodsFor: 'assertion' stamp: 't 5/2/2025 11:41:36'!
isResidential
	^false ! !


!classDefinition: #Industrial category: #'ISW1-2021-2C-1erParcial'!
Zone subclass: #Industrial
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-2C-1erParcial'!

!Industrial methodsFor: 'addition' stamp: 't 5/2/2025 11:36:15'!
canBeAddedToCityWithEnergy: anEnergyValue andWater: aWaterValue thatHasOrNotResidentialZones: aBoolean 
	
		anEnergyValue < (10 * ep) ifTrue: [ self error: City cannotAddZoneErrorDescription ].
		aWaterValue < (10 * wp) ifTrue: [ self error: City cannotAddZoneErrorDescription ].! !


!Industrial methodsFor: 'energy' stamp: 't 5/2/2025 11:22:12'!
energyConsumed
	^((10 * ep) * self getNumberOfCells)! !


!Industrial methodsFor: 'assertion' stamp: 't 5/2/2025 11:41:48'!
isResidential
	^ false ! !


!Industrial methodsFor: 'water' stamp: 't 5/2/2025 11:25:40'!
waterConsumption
	^ ((10 * wp) * self getNumberOfCells) ! !


!classDefinition: #Residential category: #'ISW1-2021-2C-1erParcial'!
Zone subclass: #Residential
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-2C-1erParcial'!

!Residential methodsFor: 'assertion' stamp: 't 5/2/2025 11:34:43'!
isResidential
	^true! !


!Residential methodsFor: 'addition' stamp: 't 5/2/2025 11:30:43'!
canBeAddedToCityWithEnergy: anEnergyValue andWater: aWaterValue thatHasOrNotResidentialZones: aBoolean 
	
	anEnergyValue < (5 * ep) ifTrue: [ self error: City cannotAddZoneErrorDescription ].
	aWaterValue < (9 * wp) ifTrue: [ self error: City cannotAddZoneErrorDescription ].
	! !


!Residential methodsFor: 'energy' stamp: 't 5/2/2025 11:20:24'!
energyConsumed
	^ ((5 * ep) * self getNumberOfCells)! !


!Residential methodsFor: 'water' stamp: 't 5/2/2025 11:24:55'!
waterConsumption
	^ ((9 * wp) * self getNumberOfCells) ! !

CityTest initialize!