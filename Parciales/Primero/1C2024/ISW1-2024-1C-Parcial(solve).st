!classDefinition: #FloorTest category: #'ISW1-2024-1C-Parcial'!
TestCase subclass: #FloorTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2024-1C-Parcial'!

!FloorTest methodsFor: 'testing' stamp: 't 4/28/2025 15:34:15'!
test01CannotCreateFloorWithoutRooms

	self
		should: [ self createFloorWith: 0 and: self defaultPriceList ]
		raise: Error - MessageNotUnderstood 
		withMessageText: Floor numberOfRoomsMustBePositiveErrorDescription .
		! !

!FloorTest methodsFor: 'testing' stamp: 'HAW 4/26/2024 16:55:02'!
test02CannotCreateFloorWithNoIntergerNumberOfRooms

	self
		should: [ self createFloorWith: 1.5 and: self defaultPriceList ]
		raise: Error - MessageNotUnderstood 
		withMessageText: Floor numberOfRoomsMustBeIntegerErrorDescription ! !

!FloorTest methodsFor: 'testing' stamp: 'HAW 4/26/2024 16:55:06'!
test03CannotCreateFloorWithoutPrices

	self
		should: [ self createFloorWith: 10 and:  Dictionary new ]
		raise: Error - MessageNotUnderstood 
		withMessageText: Floor pricesListCannotBeEmptyErrorDescription ! !

!FloorTest methodsFor: 'testing' stamp: 'FRT 4/21/2024 16:53:28'!
test04WhenAFloorIsCreatedAllTheRoomsAreAvailable

	| floor |
	
	floor := self createFloorWith: 10 and: self defaultPriceList.
	
	self assert: floor isAvailable.
	self assert: 0 equals: floor totalRoomsOccupied.
	self assert: 0 equals: floor totalRoomsReserved.
! !

!FloorTest methodsFor: 'testing' stamp: 'FRT 4/21/2024 17:00:43'!
test05WhenAFloorReceivesAGuestInARoomReducesTheAvailableRoomsByOneAndIncreaseOccupiedByOne

	| floor roomsNumber |
	
	roomsNumber := 10.
	floor := self createFloorWith: roomsNumber and: self defaultPriceList.
	
	"Tech Debt"
	((floor rooms) at: 1) receive: self guestTypeVacation.
	
	self assert: roomsNumber - 1 equals: floor totalRoomsAvailable. 
	self assert: 1 equals: floor totalRoomsOccupied.
	self assert: 0 equals: floor totalRoomsReserved.
! !

!FloorTest methodsFor: 'testing' stamp: 'FRT 4/22/2024 11:58:54'!
test06WhenAFloorReceivesOnReservationAGuestInARoomKeepsTheAvailableRoomsAndOccupiedAndReducesTheReservedByOne

	| floor roomsNumber roomsAvailable roomsOccupied roomsReserved |
	
	roomsNumber := 10.
	floor := self createFloorWith: roomsNumber and: self defaultPriceList.
	
	"Tech Debt"
	((floor rooms) at: 1) reserve.

	roomsAvailable := floor totalRoomsAvailable.
	roomsOccupied := floor totalRoomsOccupied.
	roomsReserved := floor totalRoomsReserved.

	"Tech Debt"
	((floor rooms) at: 1) receiveWithReservation: self guestTypeVacation.
	
	self assert: roomsAvailable equals: floor totalRoomsAvailable. 
	self assert: roomsOccupied equals: floor totalRoomsOccupied.
	self assert: roomsReserved - 1 equals: floor totalRoomsReserved.
! !

!FloorTest methodsFor: 'testing' stamp: 'FRT 4/21/2024 20:01:42'!
test07WhenARoomIsReservedTheFloorAvailableRoomsReducesByOneAndIncreaseReservedAndOccupiedByOne

	| floor roomsNumber |
	
	roomsNumber := 10.
	floor := self createFloorWith: roomsNumber and: self defaultPriceList.
	
	"Tech Debt"
	((floor rooms) at: 1) reserve.
	
	self assert: roomsNumber - 1 equals: floor totalRoomsAvailable. 
	self assert: 1 equals: floor totalRoomsOccupied.
	self assert: 1 equals: floor totalRoomsReserved.
! !

!FloorTest methodsFor: 'testing' stamp: 'FRT 4/21/2024 20:01:30'!
test08TotalProfitShouldBeTheSumOfOccupiedRoomsProfits

	| floor roomsNumber |
	
	roomsNumber := 10.
	floor := self createFloorWith: roomsNumber and: self defaultPriceList.
	
	"Tech Debt"
	((floor rooms) at: 1) receive: self guestTypeVacation.
	((floor rooms) at: 2) receive: self guestTypeConference.
	((floor rooms) at: 3) reserve.
		
	self assert: (100*peso) + (200*peso) + (50*peso) equals: floor totalProfits
! !

!FloorTest methodsFor: 'testing' stamp: 'FRT 4/21/2024 20:01:22'!
test09TotalLossesShouldBeTheSumOfAvailableRoomsLosses

	| floor roomsNumber |
	
	roomsNumber := 10.
	floor := self createFloorWith: roomsNumber and: self defaultPriceList.
	
	"Tech Debt"
	((floor rooms) at: 1) receive: self guestTypeVacation.
	((floor rooms) at: 2) receive: self guestTypeConference.
	((floor rooms) at: 3) reserve.
		
	self assert: (200*peso) * 7 equals: floor totalLosses
! !


!FloorTest methodsFor: 'create' stamp: 't 4/28/2025 15:55:57'!
createFloorWith: aNumberOfRooms and: aPrice

	^ Floor with: aNumberOfRooms andPriceList: aPrice ! !

!FloorTest methodsFor: 'create' stamp: 'FRT 4/21/2024 17:01:23'!
defaultPriceList
	
	^ Dictionary new
		at: self guestTypeVacation put: 100*peso;
		at: self guestTypeConference put: 200*peso;
		yourself ! !

!FloorTest methodsFor: 'create' stamp: 't 5/1/2025 18:30:08'!
guestTypeConference
	
	^ #ConferenceGuest ! !

!FloorTest methodsFor: 'create' stamp: 't 5/1/2025 18:29:58'!
guestTypeVacation
	
	^ #VacationGuest ! !


!classDefinition: #HotelTest category: #'ISW1-2024-1C-Parcial'!
TestCase subclass: #HotelTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2024-1C-Parcial'!

!HotelTest methodsFor: 'testing' stamp: 't 4/28/2025 16:15:21'!
test01CannotCreateHotelWithoutFloors

	self
		should: [ Hotel withFloorCollection: OrderedCollection new. ]
		raise: Error - MessageNotUnderstood 
		withMessageText: Hotel noFloorsErrorDescription.! !

!HotelTest methodsFor: 'testing' stamp: 'FRT 4/22/2024 11:30:09'!
test02NewHotelsAreEmpty

	| hotel |
	
	hotel := self createHotel.
	
	self assert: hotel isEmpty.! !

!HotelTest methodsFor: 'testing' stamp: 'HAW 4/29/2024 11:18:22'!
test03HotelCanReceiveATypeOfGuestInRoomAtFloor

	| hotel |
	
	hotel := self createHotel.
	
	self assert: hotel totalRooms equals: hotel	 totalRoomsAvailable.

	hotel receive: self guestTypeVacation atFloor: 1 atRoom: 2.

	self assert: hotel	 totalRooms - 1 equals: hotel totalRoomsAvailable.
	self assert: 0 equals: hotel totalRoomsReserved.
	self assert: 1 equals: hotel totalRoomsOccupied.
! !

!HotelTest methodsFor: 'testing' stamp: 'HAW 4/29/2024 11:18:32'!
test04HotelCanTakeAReservationForARoomAtFloor

	| hotel |
	
	hotel := self createHotel.

	self assert: hotel totalRooms equals: hotel	 totalRoomsAvailable.

	hotel reserveRoom: 2 atFloor: 1.

	self assert: hotel	 totalRooms - 1 equals: hotel totalRoomsAvailable.
	self assert: 1 equals: hotel totalRoomsReserved.
	self assert: 1 equals: hotel totalRoomsOccupied.! !

!HotelTest methodsFor: 'testing' stamp: 'HAW 4/29/2024 11:18:41'!
test05HotelCanReceiveWithReservationATypeOfGuestInRoomAtFloor

	| hotel |
	
	hotel := self createHotel.
	
	self assert: hotel totalRooms equals: hotel	 totalRoomsAvailable.

	hotel reserveRoom: 2 atFloor: 1.
	hotel receiveWithReservation: self guestTypeVacation atFloor: 1 atRoom: 2.

	self assert: hotel	 totalRooms - 1 equals: hotel totalRoomsAvailable.
	self assert: 0 equals: hotel totalRoomsReserved.
	self assert: 1 equals: hotel totalRoomsOccupied.
! !

!HotelTest methodsFor: 'testing' stamp: 'HAW 4/29/2024 11:17:34'!
test06HotelCannotReceiveWithReservationWithoutPreviousReservation
	
	| hotel |
	
	hotel := self createHotel.
	
	self assert: hotel totalRooms equals: hotel	 totalRoomsAvailable.

	self 
		should: [ 	hotel receiveWithReservation: self guestTypeVacation atFloor: 1 atRoom: 2. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [		:error |	
			self assert: Room roomIsNotReservedErrorDescription equals: error messageText.
			
			self assert: hotel	 totalRooms equals: hotel totalRoomsAvailable.
			self assert: 0 equals: hotel totalRoomsReserved.
			self assert: 0 equals: hotel totalRoomsOccupied.
		]


! !

!HotelTest methodsFor: 'testing' stamp: 't 4/28/2025 16:15:46'!
test07HotelProfitsAreTheSumOfEachFloorProfits
	
	| hotel floor1 floor2 floors |
	
	
	floor1 := self createFloorWith: 10 and: self defaultPriceList.
	floor2 := self createFloorWith: 10 and: self defaultPriceList.

	floors := OrderedCollection with: floor1 with: floor2.
	hotel := 	Hotel withFloorCollection: floors.
	
	hotel receive: self guestTypeVacation atFloor: 1 atRoom: 1.
	hotel receive: self guestTypeConference atFloor: 2 atRoom: 1.

	self assert: floor1 totalProfits + floor2 totalProfits equals:		hotel totalProfits.! !

!HotelTest methodsFor: 'testing' stamp: 't 4/28/2025 16:15:54'!
test08HotelLossesAreTheSumOfEachFloorLosses
	
	| hotel floor1 floor2 floors |
	
	
	floor1 := self createFloorWith: 10 and: self defaultPriceList.
	floor2 := self createFloorWith: 10 and: self defaultPriceList.

	floors := OrderedCollection with: floor1 with: floor2.
	hotel := 	Hotel withFloorCollection: floors.
	
	hotel receive: self guestTypeVacation atFloor: 1 atRoom: 1.
	hotel receive: self guestTypeConference atFloor: 2 atRoom: 1.

	hotel reserveRoom: 4 atFloor: 1.
	hotel reserveRoom: 2 atFloor: 2.

	self assert: floor1 totalLosses + floor2 totalLosses equals:		hotel totalLosses.! !

!HotelTest methodsFor: 'testing' stamp: 't 4/28/2025 16:16:04'!
test09HotelCannotReserveANonexistentRoom
	
	| hotel floor1 floors |
	
	floor1 := self createFloorWith: 10 and: self defaultPriceList.

	floors := OrderedCollection with: floor1.
	hotel := 	Hotel withFloorCollection: floors.
	
	self 
	should: [ 	hotel reserveRoom: 42 atFloor: 1. ]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [		:error |	
		self assert: Hotel roomNumberDoesNotExistErrorDescription equals: error messageText.
		
		self assert: hotel	 totalRooms equals: hotel totalRoomsAvailable.
		self assert: 0 equals: hotel totalRoomsReserved.
		self assert: 0 equals: hotel totalRoomsOccupied.
	]
! !

!HotelTest methodsFor: 'testing' stamp: 't 4/28/2025 16:16:11'!
test10HotelCannotReserveANonexistentFloor
	
	| hotel floor1 floors |
	
	floor1 := self createFloorWith: 10 and: self defaultPriceList.

	floors := OrderedCollection with: floor1.
	hotel := 	Hotel withFloorCollection: floors.
	
	self 
	should: [ 	hotel reserveRoom: 1 atFloor: 42. ]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [		:error |	
		self assert: Hotel floorNumberDoesNotExistErrorDescription equals: error messageText.
		
		self assert: hotel	 totalRooms equals: hotel totalRoomsAvailable.
		self assert: 0 equals: hotel totalRoomsReserved.
		self assert: 0 equals: hotel totalRoomsOccupied.
	]! !

!HotelTest methodsFor: 'testing' stamp: 't 4/28/2025 16:16:21'!
test11HotelCannotReceiveAtNonexistentRoom
	
	| hotel floor1 floors |
	
	floor1 := self createFloorWith: 10 and: self defaultPriceList.

	floors := OrderedCollection with: floor1.
	hotel := 	Hotel withFloorCollection: floors.
	
	self 
	should: [ 	hotel receive: self guestTypeVacation atFloor: 1 atRoom: 42. ]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [		:error |	
		self assert: Hotel roomNumberDoesNotExistErrorDescription equals: error messageText.
		
		self assert: hotel	 totalRooms equals: hotel totalRoomsAvailable.
		self assert: 0 equals: hotel totalRoomsReserved.
		self assert: 0 equals: hotel totalRoomsOccupied.
	]! !

!HotelTest methodsFor: 'testing' stamp: 't 4/28/2025 16:16:35'!
test12HotelCannotReceiveAtNonexistentFloor
	
	| hotel floor1 floors |
	
	floor1 := self createFloorWith: 10 and: self defaultPriceList.

	floors := OrderedCollection with: floor1.
	hotel := 	Hotel withFloorCollection: floors.
	
	self 
	should: [ 	hotel receive: self guestTypeVacation atFloor: 42 atRoom: 1. ]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [		:error |	
		self assert: Hotel floorNumberDoesNotExistErrorDescription equals: error messageText.
		
		self assert: hotel	 totalRooms equals: hotel totalRoomsAvailable.
		self assert: 0 equals: hotel totalRoomsReserved.
		self assert: 0 equals: hotel totalRoomsOccupied.
	]! !

!HotelTest methodsFor: 'testing' stamp: 't 4/28/2025 16:16:45'!
test13HotelCannotReceiveWithReservationAtNonexistentRoom
	
	| hotel floor1 floors |
	
	floor1 := self createFloorWith: 10 and: self defaultPriceList.

	floors := OrderedCollection with: floor1.
	hotel := 	Hotel withFloorCollection: floors.

	hotel reserveRoom: 1 atFloor: 1. 
	
	self 
	should: [ 	hotel receiveWithReservation: self guestTypeVacation atFloor: 1 atRoom: 42. ]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [		:error |	
		self assert: Hotel roomNumberDoesNotExistErrorDescription equals: error messageText.
		
		self assert: hotel	 totalRooms - 1 equals: hotel totalRoomsAvailable.
		self assert: 1 equals: hotel totalRoomsReserved.
		self assert: 1 equals: hotel totalRoomsOccupied.
	]! !


!HotelTest methodsFor: 'create' stamp: 't 4/28/2025 15:56:48'!
createFloorWith: aNumberOfRooms and: aPrice
	
	^ Floor with: aNumberOfRooms andPriceList: aPrice ! !

!HotelTest methodsFor: 'create' stamp: 't 4/28/2025 16:07:46'!
createHotel					
	
	^Hotel withFloorCollection: (self hotelCreationDefault)! !

!HotelTest methodsFor: 'create' stamp: 'FRT 4/22/2024 10:27:22'!
defaultPriceList
	
	^ Dictionary new
		at: self guestTypeVacation put: self minPriceInList;
		at: self guestTypeConference put: self maxPriceInList;
		yourself ! !

!HotelTest methodsFor: 'create' stamp: 't 4/28/2025 16:11:57'!
floorWithNumberOfRoomsAndDefaultPrice: aNumberOfRooms

	^ self createFloorWith: aNumberOfRooms and: self defaultPriceList! !

!HotelTest methodsFor: 'create' stamp: 't 5/1/2025 18:30:54'!
guestTypeConference
	
	^ #ConferenceGuest ! !

!HotelTest methodsFor: 'create' stamp: 't 5/1/2025 18:30:50'!
guestTypeVacation
	
	^ #VacationGuest ! !

!HotelTest methodsFor: 'create' stamp: 't 4/28/2025 16:13:01'!
hotelCreationDefault

	^ OrderedCollection with: (self floorWithNumberOfRoomsAndDefaultPrice: 10) with: (self floorWithNumberOfRoomsAndDefaultPrice: 1)
	! !

!HotelTest methodsFor: 'create' stamp: 'FRT 4/22/2024 10:27:48'!
maxPriceInList
	
	^ 200*peso ! !

!HotelTest methodsFor: 'create' stamp: 'FRT 4/22/2024 10:27:53'!
minPriceInList
	
	^ 100*peso ! !


!classDefinition: #RoomTest category: #'ISW1-2024-1C-Parcial'!
TestCase subclass: #RoomTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2024-1C-Parcial'!

!RoomTest methodsFor: 'testing' stamp: 't 4/28/2025 17:44:25'!
test01NewRoomsAreAvailable

	| room |
	
	room := Room availableRoom .

	self assert: room isAvailable.
	
	self deny: room isOccupied.
	self deny: room isReserved.! !

!RoomTest methodsFor: 'testing' stamp: 't 4/28/2025 17:44:36'!
test02ReceivingAGuestMakesTheRoomOccupied

	| room |
	
	room := Room availableRoom .

	room receive: self guestTypeVacation.

	self assert: room isOccupied.

	self deny: room isAvailable.
	self deny: room isReserved.! !

!RoomTest methodsFor: 'testing' stamp: 't 4/28/2025 17:44:43'!
test03ReservingARoomMakesTheRoomReservedAndOccupied

	| room |
	
	room := Room availableRoom .

	room reserve.

	self assert: room isReserved.
	self assert: room isOccupied.

	self deny: room isAvailable.
! !

!RoomTest methodsFor: 'testing' stamp: 't 4/28/2025 17:44:48'!
test04CannotReceiveAGuestInAOccupiedRoom

	| room |
	
	room := Room availableRoom .

	room receive: self guestTypeVacation.
	
	self 
		should: [ room receive: self guestTypeVacation ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo:  [ 	:error |
			self assert: Room roomIsNotEmptyErrorDescription equals: error messageText.

			self assert: room isOccupied.
			
			self deny: room isAvailable.
			self deny: room isReserved.
		]
	
! !

!RoomTest methodsFor: 'testing' stamp: 't 4/28/2025 17:44:55'!
test05CannotReceiveAGuestInAReservedRoom

	| room |
	
	room := Room availableRoom .

	room reserve.
	
	self 
		should: [ room receive: self guestTypeVacation ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo:  [ 	:error |
			self assert: Room roomIsNotEmptyErrorDescription equals: error messageText.
			
			self assert: room isReserved.
			self assert: room isOccupied.
			
			self deny: room isAvailable.
		]

	

	
! !

!RoomTest methodsFor: 'testing' stamp: 't 4/28/2025 17:45:02'!
test06ReceivingOnReservationMakesTheRoomOccupied

	| room |
	
	room := Room availableRoom .

	room reserve.
	
	room receiveWithReservation: self guestTypeVacation.
	
	self assert: room isOccupied.
	
	self deny: room isReserved.
	self deny: room isAvailable.
! !

!RoomTest methodsFor: 'testing' stamp: 't 4/28/2025 17:45:09'!
test07CannotReceiveOnReservationAnAvailableRoom

	| room |
	
	room := Room availableRoom .

	self 
		should: [ room receiveWithReservation: self guestTypeVacation. ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo:  [ 	:error |
			self assert: Room roomIsNotReservedErrorDescription equals: error messageText.

			self assert: room isAvailable.

			self deny: room isReserved.
			self deny: room isOccupied.
		]

	
! !

!RoomTest methodsFor: 'testing' stamp: 't 4/28/2025 18:15:32'!
test08CannotReceiveOnReservationAnOccupiedRoom

	| room |
	
	room := Room availableRoom .

	room receive: self guestTypeVacation.

	self 
		should: [ room receiveWithReservation: self guestTypeVacation. ] 
		raise: Error - MessageNotUnderstood 	
		withExceptionDo:  [ 	:error |
			self assert: Room roomIsNotReservedErrorDescription equals: error messageText.
			
			self assert: room isOccupied.

			self deny: room isReserved.
			self deny: room isAvailable.
		]

	
! !

!RoomTest methodsFor: 'testing' stamp: 't 4/28/2025 18:15:41'!
test09ProfitOfAvailableRoomIsCeroPesos

	| room |
	
	room := Room availableRoom .

	self assert: 0*peso equals: (room profitUsing: self defaultPriceList ifAbsentGuestType: [ self fail ]).
	
! !

!RoomTest methodsFor: 'testing' stamp: 't 4/28/2025 18:15:45'!
test10ProfitOfReservedRoomIsHalfTheMinPriceInList

	| room |
	
	room := Room availableRoom .

	room reserve.

	self assert: self minPriceInList / 2 equals: (room profitUsing: self defaultPriceList ifAbsentGuestType: [ self fail ]).
! !

!RoomTest methodsFor: 'testing' stamp: 't 4/28/2025 18:23:13'!
test11ProfitOfOccupiedRoomDependsOnGuestType

	| roomWithConferenceGuest roomWithVacationGuest |
	
	roomWithConferenceGuest := Room availableRoom .
	roomWithConferenceGuest receive: self guestTypeConference.
	
	roomWithVacationGuest := Room availableRoom .
	roomWithVacationGuest receive: self guestTypeVacation.

	self assert: (self defaultPriceList at: self guestTypeConference) 
		equals: (roomWithConferenceGuest profitUsing: self defaultPriceList ifAbsentGuestType: [ self fail ]).

	self assert: (self defaultPriceList at: self guestTypeVacation) 
		equals: (roomWithVacationGuest profitUsing: self defaultPriceList ifAbsentGuestType: [ self fail ]).
! !

!RoomTest methodsFor: 'testing' stamp: 't 4/28/2025 18:15:54'!
test12NoProfitOnOccupiedRoomByUnknownGuestType

	| room |
	
	room := Room availableRoom .
	room receive: #unknownGuest.
	
	room profitUsing: self defaultPriceList ifAbsentGuestType: [ ^self ].
	
	"we should not get here"
	self failWith: 'should not calculate profit on room occupied by unknown guest type'.
! !

!RoomTest methodsFor: 'testing' stamp: 'HAW 4/29/2024 18:53:19'!
test13LossesOfAvailableRoomIsTheMaxPriceInList

	self shouldFail: [
		| room |
	
		room := Room new.

		self assert: self maxPriceInList equals: (room lossUsing: self defaultPriceList ifAbsentGuestType: [ self fail ]).
	]	
! !

!RoomTest methodsFor: 'testing' stamp: 'HAW 4/29/2024 11:21:36'!
test14LossesOfReservedRoomIsCeroPesos

	self shouldFail: [
		| room |
	
		room := Room new.

		room reserve.

		self assert: 0*peso equals: (room lossUsing: self defaultPriceList ifAbsentGuestType: [ self fail ]).
	]	
! !

!RoomTest methodsFor: 'testing' stamp: 'HAW 4/29/2024 11:21:50'!
test15LossesOfOccupiedRoomIsCeroPesos

	self shouldFail: [
		| room |
		
		room := Room new.

		room receive: self guestTypeVacation.

		self assert: 0*peso equals: (room lossUsing: self defaultPriceList ifAbsentGuestType: [ self fail ]).
	]! !

!RoomTest methodsFor: 'testing' stamp: 't 4/28/2025 18:15:58'!
test16CannotReserveWhenReserved

	| room |
	
	room := Room availableRoom .

	room reserve.

	self 
		should: [ room reserve ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Room roomIsNotEmptyErrorDescription equals: anError messageText.
			self assert: room isReserved ].! !

!RoomTest methodsFor: 'testing' stamp: 't 4/28/2025 18:16:01'!
test17CannotReserveWhenOccupied

	| room |
	
	room := Room availableRoom .

	room receive: self guestTypeVacation.

	self 
		should: [ room reserve ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Room roomIsNotEmptyErrorDescription equals: anError messageText.
			self assert: room isOccupied ].! !


!RoomTest methodsFor: 'create' stamp: 'FRT 4/22/2024 10:16:28'!
defaultPriceList
	
	^ Dictionary new
		at: self guestTypeVacation put: self minPriceInList;
		at: self guestTypeConference put: self maxPriceInList;
		yourself ! !

!RoomTest methodsFor: 'create' stamp: 't 5/1/2025 18:30:47'!
guestTypeConference
	
	^ #ConferenceGuest ! !

!RoomTest methodsFor: 'create' stamp: 't 5/1/2025 18:30:42'!
guestTypeVacation
	
	^ #VacationGuest ! !

!RoomTest methodsFor: 'create' stamp: 'FRT 4/22/2024 10:16:13'!
maxPriceInList
	
	^ 200*peso ! !

!RoomTest methodsFor: 'create' stamp: 'FRT 4/22/2024 09:40:38'!
minPriceInList
	
	^ 100*peso ! !


!classDefinition: #Floor category: #'ISW1-2024-1C-Parcial'!
Object subclass: #Floor
	instanceVariableNames: 'rooms prices'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2024-1C-Parcial'!

!Floor methodsFor: 'testing' stamp: 'FRT 4/21/2024 15:02:31'!
isAvailable
	
	^ self totalRooms = self totalRoomsAvailable

		
! !


!Floor methodsFor: 'accessing' stamp: 'FRT 4/20/2024 21:34:09'!
rooms

	^ rooms! !


!Floor methodsFor: 'accounting' stamp: 't 5/1/2025 18:53:38'!
totalLosses
	
	
	^(rooms select:[:room | room isAvailable ]) inject: 0 * peso  into: [:suma :each | suma + prices values max].

	
	"muy parecido a lo que hicimos en total profits filtramos la lista a los available, y luego acumulamos "
	"select hace uso de un bloque que devuelve bool, en comparación al collect que TRANSFORMA los elementos según se especifique en el bloque"! !

!Floor methodsFor: 'accounting' stamp: 't 5/1/2025 18:54:27'!
totalProfits

	^ (rooms 
		select: [:room | room isOccupied]
		thenCollect: [:room |  room profitUsing: prices  ifAbsentGuestType: [ self class signalUnknownGuestType ]]) 
		inject: 0*peso into: [:sum :each | sum + each ].
		
		"seleccionamos el room ocupado y con collect a cada elemento seleccionado le aplicamos el bloque (COLLECT TRANSFORMA) "
		"obtenemos una lista, que luego, con inject into acumulamos el valor con cada elemento, eso lo hacemos usando sum como acumulador y each como elemento de la lista anterior"
	! !


!Floor methodsFor: 'setters' stamp: 'FRT 4/20/2024 19:48:41'!
setNumberOfRooms: aNumberOfRooms

	self class assertIsPositive: aNumberOfRooms ifFalse: [ self class signalNumberOfRoomsMustBePositive ].
	self class assertIsInteger: aNumberOfRooms ifFalse: [ self class signalNumberOfRoomsMustBeInteger ].
	
	self initializeRoomsWith: aNumberOfRooms.
! !

!Floor methodsFor: 'setters' stamp: 't 4/28/2025 14:30:16'!
setPrices: aPriceList

	aPriceList isEmpty ifTrue: [ self class signalNoPrices ].
	
	aPriceList values do: [ :price |  self class assertIsPositive: price ifFalse: [ self class signalPriceMustBePositive ].].
	
	self initializeWith: aPriceList.! !


!Floor methodsFor: 'totals' stamp: 'FRT 4/21/2024 14:49:55'!
totalRooms
	
	^ rooms size
		
! !

!Floor methodsFor: 'totals' stamp: 'HAW 4/28/2024 16:49:36'!
totalRoomsAvailable
	
	^rooms count: [ :room | room isAvailable ]
		
! !

!Floor methodsFor: 'totals' stamp: 'HAW 4/28/2024 16:49:47'!
totalRoomsOccupied
	
	^rooms count: [ :room | room isOccupied ]
		
! !

!Floor methodsFor: 'totals' stamp: 'HAW 4/28/2024 16:50:07'!
totalRoomsReserved
	
	^rooms count: [ :room | room isReserved ]! !


!Floor methodsFor: 'initialization' stamp: 't 4/28/2025 15:51:38'!
initializeFloorWith: aNumberOfRooms andPriceList: aPriceList 
	
	self setNumberOfRooms: aNumberOfRooms .
	self setPrices: aPriceList.! !

!Floor methodsFor: 'initialization' stamp: 't 4/28/2025 16:47:13'!
initializeRoomsWith: aNumberOfRooms

	rooms := OrderedCollection new.
	
	aNumberOfRooms timesRepeat:[rooms add: Room availableRoom ].


	"no puedo usar do: porque es vacía , no puedo darle tamaño inicial y después hacerlo tampoco"! !

!Floor methodsFor: 'initialization' stamp: 'FRT 4/21/2024 00:23:52'!
initializeWith: aPriceList

	prices := aPriceList! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Floor class' category: #'ISW1-2024-1C-Parcial'!
Floor class
	instanceVariableNames: ''!

!Floor class methodsFor: 'assertions' stamp: 'FRT 4/20/2024 19:39:26'!
assertIsInteger: aNumber ifFalse: signalsBlock

	aNumber isInteger ifFalse: signalsBlock! !

!Floor class methodsFor: 'assertions' stamp: 'FRT 4/20/2024 19:40:06'!
assertIsPositive: aNumber ifFalse: signalsBlock

	aNumber strictlyPositive ifFalse: signalsBlock! !


!Floor class methodsFor: 'error messages' stamp: 'FRT 4/20/2024 19:02:53'!
numberOfRoomsMustBeIntegerErrorDescription
	
	^ 'Number of rooms must be integer'! !

!Floor class methodsFor: 'error messages' stamp: 'FRT 4/20/2024 19:35:54'!
numberOfRoomsMustBePositiveErrorDescription
	
	^'The number of rooms must be positive'! !

!Floor class methodsFor: 'error messages' stamp: 'FRT 4/20/2024 19:42:12'!
priceMustBeIntegerErrorDescription
	
	^ 'Price must be integer'! !

!Floor class methodsFor: 'error messages' stamp: 'FRT 4/20/2024 19:42:25'!
priceMustBePositiveErrorDescription
	
	^'Price must be positive'! !

!Floor class methodsFor: 'error messages' stamp: 'FRT 4/21/2024 14:43:01'!
pricesListCannotBeEmptyErrorDescription 
	
	^ 'Prices List must not be empty'! !

!Floor class methodsFor: 'error messages' stamp: 'FRT 4/21/2024 14:47:30'!
unknownGuestTypeErrorDescription
	
	^ 'The guest type is unknown'! !


!Floor class methodsFor: 'exceptions' stamp: 'FRT 4/21/2024 14:42:33'!
signalNoPrices
	
	self error: self pricesListCannotBeEmptyErrorDescription ! !

!Floor class methodsFor: 'exceptions' stamp: 'FRT 4/20/2024 19:02:35'!
signalNumberOfRoomsMustBeInteger
	
	self error: self numberOfRoomsMustBeIntegerErrorDescription ! !

!Floor class methodsFor: 'exceptions' stamp: 'FRT 4/20/2024 19:35:54'!
signalNumberOfRoomsMustBePositive

	self error: self numberOfRoomsMustBePositiveErrorDescription! !

!Floor class methodsFor: 'exceptions' stamp: 'FRT 4/20/2024 19:41:37'!
signalPriceMustBeInteger
	
	self error: self priceMustBeIntegerErrorDescription ! !

!Floor class methodsFor: 'exceptions' stamp: 'FRT 4/20/2024 19:41:58'!
signalPriceMustBePositive

	self error: self priceMustBePositiveErrorDescription! !

!Floor class methodsFor: 'exceptions' stamp: 't 4/28/2025 17:49:18'!
signalUnknownGuestType

	self error: self unknownGuestTypeErrorDescription
! !


!Floor class methodsFor: 'instance creation' stamp: 't 4/28/2025 15:48:18'!
with: aNumberOfRooms andPriceList: aPriceList
	
	^self new initializeFloorWith: aNumberOfRooms andPriceList: aPriceList ! !


!classDefinition: #Hotel category: #'ISW1-2024-1C-Parcial'!
Object subclass: #Hotel
	instanceVariableNames: 'floors availableRoomsCount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2024-1C-Parcial'!

!Hotel methodsFor: 'accounting' stamp: 't 5/1/2025 18:48:46'!
totalLosses

	^floors inject: 0*peso into:[:sum : floor | sum + floor totalLosses ] 
	
	"el primer parámetro del bloque es el acumulador siempre, luego el elemento que estamos viendo"
! !

!Hotel methodsFor: 'accounting' stamp: 't 5/1/2025 18:49:23'!
totalProfits

	^ floors inject: 0*peso into:[:suma :floor | suma + floor totalProfits ] 
	
	! !


!Hotel methodsFor: 'initialization' stamp: 'FRT 4/20/2024 23:37:37'!
initialize

	availableRoomsCount := 0.
! !


!Hotel methodsFor: 'setters' stamp: 'FRT 4/22/2024 11:50:40'!
setFloors: aFloorsCollection

	self class assertHaveFloors: aFloorsCollection.

	floors := aFloorsCollection.
	
	availableRoomsCount := self totalRooms.! !


!Hotel methodsFor: 'totals' stamp: 't 5/1/2025 19:13:53'!
totalRooms
	
	"la primera vez lo hice así : 
	^(floors collect:[:floor | floor rooms count:[:room | room = room] ]) inject:0 into:[:total :subtotal | total + subtotal]
	"
	"pero es mejor no comparar algo que siempre da true y usar"
	^(floors collect:[:floor | floor rooms size]) inject:0 into:[:total :subtotal | total + subtotal]
! !

!Hotel methodsFor: 'totals' stamp: 'FRT 4/22/2024 11:43:00'!
totalRoomsAvailable

	^ availableRoomsCount.
! !

!Hotel methodsFor: 'totals' stamp: 't 5/1/2025 18:58:21'!
totalRoomsOccupied
	
	"lo que hace esto es ver los que están ocupados POR PISO, contar cuántos por piso, y finalmente foldear la lista"
	
	^ (floors collect: [:floor | floor rooms count:[:room | room isOccupied ]]) inject: 0 into:[:total :cuenta | total + cuenta] 
! !

!Hotel methodsFor: 'totals' stamp: 't 5/1/2025 19:00:28'!
totalRoomsReserved
	
	"count siempre recibe una condición para contar"
	^ (floors collect:[:floor | floor rooms count:[: room | room isReserved ]]) inject: 0 into:[:total :subtotal| total + subtotal ] 
	
! !


!Hotel methodsFor: 'testing' stamp: 't 5/1/2025 19:06:46'!
isEmpty

	"para saber si el hotel está vacío, tendríamos que ver que todas están libres o que alguna no lo esté"
	"si algun room en cierto piso no está libre --> false ifNone -> true"
	^ floors detect: [:floor | floor rooms anySatisfy: [:room | room isAvailable not ]] ifNone: true
	! !


!Hotel methodsFor: 'guests' stamp: 'FRT 4/25/2024 21:45:24'!
receive: aGuestType atFloor: aFloorNumber atRoom: aRoomNumber

	| floor room |
	
	floor := floors at: aFloorNumber ifAbsent:  [ self class signalFloorNumberDoesNotExist ].
	room := floor rooms at: aRoomNumber ifAbsent: [ self class signalRoomNumberDoesNotExist ].

	room receive: aGuestType.
	
	availableRoomsCount := availableRoomsCount - 1.
! !

!Hotel methodsFor: 'guests' stamp: 'FRT 4/25/2024 21:55:45'!
receiveWithReservation: aGuestType atFloor: aFloorNumber atRoom: aRoomNumber

	| floor room |
	
	floor := floors at: aFloorNumber ifAbsent:  [ self class signalFloorNumberDoesNotExist ].
	room := floor rooms at: aRoomNumber ifAbsent: [ self class signalRoomNumberDoesNotExist ].

	room receiveWithReservation: aGuestType.

! !

!Hotel methodsFor: 'guests' stamp: 'FRT 4/25/2024 21:56:34'!
reserveRoom: aRoomNumber atFloor: aFloorNumber

	| floor room |
	
	floor := floors at: aFloorNumber ifAbsent:  [ self class signalFloorNumberDoesNotExist ].
	room := floor rooms at: aRoomNumber ifAbsent: [ self class signalRoomNumberDoesNotExist ].
	 
	room reserve.
	
	availableRoomsCount := availableRoomsCount - 1.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Hotel class' category: #'ISW1-2024-1C-Parcial'!
Hotel class
	instanceVariableNames: ''!

!Hotel class methodsFor: 'assertions' stamp: 'HAW 4/29/2024 08:48:39'!
assertHaveFloors: aFloorsCollection

	aFloorsCollection isEmpty ifTrue: [ self signalNoFloors ].! !


!Hotel class methodsFor: 'error description' stamp: 'FRT 4/25/2024 21:42:02'!
floorNumberDoesNotExistErrorDescription

	^ 'Floor number does not exist'.! !

!Hotel class methodsFor: 'error description' stamp: 'FRT 4/20/2024 21:42:02'!
noFloorsErrorDescription

	^ 'Cannot have a Hotel without floors'! !

!Hotel class methodsFor: 'error description' stamp: 'FRT 4/25/2024 21:41:41'!
roomNumberDoesNotExistErrorDescription

	^ 'Room number does not exist'.! !


!Hotel class methodsFor: 'instance creation' stamp: 't 4/28/2025 16:02:19'!
withFloorCollection: aFloorCollection
	^ self new setFloors: aFloorCollection ! !


!Hotel class methodsFor: 'exceptions' stamp: 'FRT 4/25/2024 21:42:24'!
signalFloorNumberDoesNotExist

	self error: self floorNumberDoesNotExistErrorDescription.! !

!Hotel class methodsFor: 'exceptions' stamp: 'FRT 4/20/2024 21:41:30'!
signalNoFloors

	self error: self noFloorsErrorDescription.! !

!Hotel class methodsFor: 'exceptions' stamp: 'FRT 4/25/2024 21:42:39'!
signalRoomNumberDoesNotExist

	self error: self roomNumberDoesNotExistErrorDescription.! !


!classDefinition: #Room category: #'ISW1-2024-1C-Parcial'!
Object subclass: #Room
	instanceVariableNames: 'guest state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2024-1C-Parcial'!

!Room methodsFor: 'guests' stamp: 't 4/28/2025 17:02:26'!
guestType

	^ guest! !

!Room methodsFor: 'guests' stamp: 't 4/28/2025 17:15:06'!
receive: aGuestType

	"Room Occupied"
	state canI: self receive: aGuestType .
 ! !

!Room methodsFor: 'guests' stamp: 't 4/28/2025 17:31:03'!
receiveWithReservation: aGuestType 
	
	"Room Reserved"
	state receiveGuestWithReservation: aGuestType inRoom: self
! !

!Room methodsFor: 'guests' stamp: 't 4/28/2025 17:26:39'!
reserve

	"Room Occupied"
	state canIReserveTheRoom: self! !

!Room methodsFor: 'guests' stamp: 't 4/28/2025 17:22:25'!
youCanReceive: aGuestType 
	guest := aGuestType. 
	state := RoomState occupiedOn: self! !

!Room methodsFor: 'guests' stamp: 't 4/28/2025 17:28:40'!
youCanReserveTheRoom
	state := RoomState reservedOn: self! !

!Room methodsFor: 'guests' stamp: 't 4/28/2025 17:19:20'!
youCannotReceive
	self error: self class roomIsNotEmptyErrorDescription! !


!Room methodsFor: 'testing' stamp: 't 4/28/2025 17:06:03'!
isAvailable

	^ state isAvailable ! !

!Room methodsFor: 'testing' stamp: 't 4/28/2025 17:06:11'!
isOccupied

	^ state isOccupied 
! !

!Room methodsFor: 'testing' stamp: 't 4/28/2025 17:06:07'!
isReserved

	^ state isReserved! !


!Room methodsFor: 'accounting' stamp: 't 4/28/2025 18:10:10'!
profitUsing: aPriceList ifAbsentGuestType: unknownGuestTypeBlock
	
	
	^state profitUsing: aPriceList withGuest: guest ifAbsent: unknownGuestTypeBlock 
	! !


!Room methodsFor: 'initialize' stamp: 't 5/1/2025 18:30:36'!
initializeAvailable
	state := RoomState availableOn: self.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Room class' category: #'ISW1-2024-1C-Parcial'!
Room class
	instanceVariableNames: ''!

!Room class methodsFor: 'instance creation' stamp: 't 4/28/2025 16:47:13'!
availableRoom
	^self new initializeAvailable! !


!Room class methodsFor: 'error messages' stamp: 'FRT 4/22/2024 09:01:14'!
roomIsNotEmptyErrorDescription

	^ 'Room is not empty.'! !

!Room class methodsFor: 'error messages' stamp: 'FRT 4/22/2024 09:01:43'!
roomIsNotReservedErrorDescription

	^ 'Room is not reserved.'! !


!classDefinition: #RoomState category: #'ISW1-2024-1C-Parcial'!
Object subclass: #RoomState
	instanceVariableNames: 'room'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2024-1C-Parcial'!

!RoomState methodsFor: 'initialization' stamp: 't 4/28/2025 16:29:46'!
intializeOn: aRoom 
	room := aRoom ! !

!RoomState methodsFor: 'initialization' stamp: 't 4/28/2025 16:45:00'!
isAvailable
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RoomState class' category: #'ISW1-2024-1C-Parcial'!
RoomState class
	instanceVariableNames: ''!

!RoomState class methodsFor: 'instance creation' stamp: 't 4/28/2025 16:29:09'!
availableOn: aRoom
	^ RoomAvailable new intializeOn: aRoom ! !

!RoomState class methodsFor: 'instance creation' stamp: 't 4/28/2025 16:29:16'!
occupiedOn: aRoom
	^ RoomOccupied new intializeOn: aRoom ! !

!RoomState class methodsFor: 'instance creation' stamp: 't 4/28/2025 16:29:12'!
reservedOn: aRoom
	^ RoomReserved new intializeOn: aRoom ! !


!classDefinition: #RoomAvailable category: #'ISW1-2024-1C-Parcial'!
RoomState subclass: #RoomAvailable
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2024-1C-Parcial'!

!RoomAvailable methodsFor: 'guest' stamp: 't 4/28/2025 17:15:57'!
canI: aRoom receive: aGuestType 
	
	aRoom youCanReceive: aGuestType ! !

!RoomAvailable methodsFor: 'guest' stamp: 't 4/28/2025 17:27:11'!
canIReserveTheRoom: aRoom 
	aRoom youCanReserveTheRoom
		! !

!RoomAvailable methodsFor: 'guest' stamp: 't 4/28/2025 18:05:05'!
profitUsing: aPriceList withGuest: aGuest ifAbsent: unknownGuestTypeBlock 
	 ^ 0* peso! !

!RoomAvailable methodsFor: 'guest' stamp: 't 4/28/2025 18:14:02'!
receiveGuestWithReservation: aGuestType inRoom: aRoom 
	self error: Room  roomIsNotReservedErrorDescription! !


!RoomAvailable methodsFor: 'assertion' stamp: 't 4/28/2025 16:32:42'!
isAvailable
	^ true! !

!RoomAvailable methodsFor: 'assertion' stamp: 't 4/28/2025 16:51:30'!
isOccupied
	^ false! !

!RoomAvailable methodsFor: 'assertion' stamp: 't 4/28/2025 16:52:15'!
isReserved
	^ false! !


!classDefinition: #RoomOccupied category: #'ISW1-2024-1C-Parcial'!
RoomState subclass: #RoomOccupied
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2024-1C-Parcial'!

!RoomOccupied methodsFor: 'assertion' stamp: 't 4/28/2025 16:43:28'!
isAvailable
	^ false! !

!RoomOccupied methodsFor: 'assertion' stamp: 't 4/28/2025 16:51:36'!
isOccupied
	^ true! !

!RoomOccupied methodsFor: 'assertion' stamp: 't 4/28/2025 16:52:23'!
isReserved
	^ false! !


!RoomOccupied methodsFor: 'guest' stamp: 't 4/28/2025 17:19:45'!
canI: aRoom receive: aGuestType 
	
	aRoom youCannotReceive ! !

!RoomOccupied methodsFor: 'guest' stamp: 't 4/28/2025 18:33:21'!
canIReserveTheRoom: aRoom 
	self error: Room roomIsNotEmptyErrorDescription! !

!RoomOccupied methodsFor: 'guest' stamp: 't 4/28/2025 18:04:13'!
profitUsing: aPriceList withGuest: aGuest ifAbsent: unknownGuestTypeBlock 
	 
	^ aPriceList at: aGuest ifAbsent: unknownGuestTypeBlock ! !

!RoomOccupied methodsFor: 'guest' stamp: 't 4/28/2025 18:22:11'!
receiveGuestWithReservation: aGuestType inRoom: aRoom 
	self error: Room roomIsNotReservedErrorDescription! !


!classDefinition: #RoomReserved category: #'ISW1-2024-1C-Parcial'!
RoomState subclass: #RoomReserved
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2024-1C-Parcial'!

!RoomReserved methodsFor: 'guest' stamp: 't 4/28/2025 17:19:58'!
canI: aRoom receive: aGuestType 
	
	aRoom youCannotReceive ! !

!RoomReserved methodsFor: 'guest' stamp: 't 4/28/2025 18:32:52'!
canIReserveTheRoom: aRoom 
	self error: Room roomIsNotEmptyErrorDescription! !

!RoomReserved methodsFor: 'guest' stamp: 't 4/28/2025 18:06:34'!
profitUsing: aPriceList withGuest: aGuest ifAbsent: unknownGuestTypeBlock 

	^ aPriceList values min / 2 
	! !

!RoomReserved methodsFor: 'guest' stamp: 't 4/28/2025 17:32:24'!
receiveGuestWithReservation: aGuestType inRoom: aRoom 

	aRoom youCanReceive: aGuestType 
	
	! !


!RoomReserved methodsFor: 'assertion' stamp: 't 4/28/2025 16:43:37'!
isAvailable
	^ false! !

!RoomReserved methodsFor: 'assertion' stamp: 't 4/28/2025 16:51:45'!
isOccupied
	^ true! !

!RoomReserved methodsFor: 'assertion' stamp: 't 4/28/2025 16:52:32'!
isReserved
	^true! !
