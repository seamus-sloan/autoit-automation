Global $username = "voffer"
Global $password = "Detroit3311"
Global $cartSpace = "TDJListBox" ; This is used so that the take orders screen can be reactivated
Global $finishOrderNN = "TVistaPanel4" ;This changes randomly between 3 - 6
Global $scheduleButtonNN = "TPDJButton2" ;This also changes randomly
Global $payButtonNN = "TPDJButton4"
Global $custAcctName = "Automation 2 Jeff Bezos"

Local $loginX = 484
Local $loginY = 463

Local $hnrTabX = 419
Local $hnrTabY = 32
Local $classicPepperoniX = 483
Local $classicPepperoniY = 394

Local $nonFoodTabX = 672
Local $nonFoodTabY = 136
Local $donationX = 417
Local $donationY = 245

Local $specialsTabX = 27
Local $specialsTabY = 131
Local $makeItAMealX = 151
Local $makeItAMealY = 242

Local $queueTabX = 26
Local $queueTabY = 273
Local $queueTopX = 159
Local $queueTopY = 138

Local $checkX = 583
Local $checkY = 208
Local $checkNoKeysX = 582
Local $checkNoKeysY = 297

Local $moreX = 794
Local $moreY = 209
Local $moreNoKeysX = 647
Local $moreNoKeysY = 298

Local $poX = 870
Local $poY = 261
Local $poNoKeysX = 870
Local $poNoKeysY = 349

Local $custAcctX = 818
Local $custAcctY = 304
Local $custAcctNoKeysX = 818
Local $custAcctNoKeysY = 395

Local $waitForNewProductX = 447
Local $waitForNewProductY = 602

Local $makeTicketNoneX = 893
Local $makeTicketNoneY = 445

Local $givenToCustX = 780
Local $givenToCustY = 445

Local $futureDayX = 487
Local $futureDayY = 351

Local $futureTimeX = 828
Local $futureTimeY = 308

Local $fullyCompletedX = 904
Local $fullyCompletedY = 541

Local $customer1X = 522
Local $customer1Y = 189





HotKeySet("{ESC}", "Terminate")
Func Terminate()
   Exit
EndFunc



;Functions used for CaesarVision navigation
Func initLogin()
   MouseClick("left", $loginX, $loginY)
   sleep(500)
   ControlSend("Keyboard Login", "", "TEdit2", $username)
   ControlSend("Keyboard Login", "", "TEdit1", $password)
   ControlClick("Keyboard Login", "", "TColorButton2", "left")
   sleep(2000)
EndFunc
Func takeOrders()
   ControlClick("Caesar Vision Home", "Take Orders", "TPDJButton13", "left")
   sleep(2000)
EndFunc

;Functions used for adding items to cart
Func hnr($i)
   MouseClick("left", $hnrTabX, $hnrTabY)
   MouseClick("left",$classicPepperoniX, $classicPepperoniY, $i)
   sleep(1000)
EndFunc
Func special($i)
   MouseClick("left", $specialsTabX, $specialsTabY)
   MouseClick("left", $makeItAMealX, $makeItAMealY, $i)
   sleep(1000)
EndFunc
Func donation($i)
   MouseClick("left", $nonFoodTabX, $nonFoodTabY)
   MouseClick("left", $donationX, $donationY, $i)
   sleep(1000)
EndFunc
Func createOrder($item1, $item2, $item3)
   If $item1 > 0 Then hnr($item1)
   If $item2 > 0 Then special($item2)
   If $item3 > 0 Then donation($item3)
EndFunc
Func waitingOrder($orderQuant, $orderType, $payType, $hnrQuant, $specQuant, $donationQuant)
   For $i = 1 To $orderQuant Step 1
	  createOrder($hnrQuant, $specQuant, $donationQuant)
	  finishOrder()
	  custName("Wait " & $payType & " " & $orderType & " " & $i)

	  If $payType == 	"cash" 		Then cashPay()
	  If $payType == 	"check" 	Then checkPay()
	  If $payType == 	"po" 		Then poPay()
	  If $payType == 	"gift" 		Then giftPay()
	  If $payType == 	"custAcct" 	Then custAcctPay("Wait " & $payType & " " & $orderType & " " & $i)

	  waitForNewProduct()
	  closeSummary()
	  sleep(1000)
	  blankSpace()
   Next
EndFunc
Func queueOrder($orderQuant, $orderType, $payType, $hnrQuant, $specQuant, $donationQuant)
   For $i = 1 To $orderQuant Step 1
	  createOrder($hnrQuant, $specQuant, $donationQuant)
	  finishOrder()
	  custName("Q " & $payType & " " & $orderType & " " & $i)

	  queueButton()
	  queueNow()
	  queueButton()

	  ;makeTicket()
	  sleep(1000)
	  blankSpace()
   Next
EndFunc
Func scheduleOrder($orderQuant, $orderType, $payType, $hnrQuant, $specQuant, $donationQuant)
   For $i = 1 To $orderQuant Step 1
	  createOrder($hnrQuant, $specQuant, $donationQuant)
	  finishOrder()
	  custName("Sched " & $payType & " " & $orderType & " " & $i)

	  scheduleButton()
	  scheduleToday()
	  queueButton()

	  ;makeTicket()
	  sleep(1000)
	  blankSpace()
   Next
EndFunc
Func prepaidOrder($orderQuant, $orderType, $payType, $hnrQuant, $specQuant, $donationQuant)
   For $i = 1 To $orderQuant Step 1
	  createOrder($hnrQuant, $specQuant, $donationQuant)
	  finishOrder()
	  custName("Prepaid " & $payType & " " & $orderType & " " & $i)

	  scheduleButton()
	  scheduleFuture()

	  If $payType == 	"cash" 		Then cashPay()
	  If $payType == 	"check" 	Then checkPay()
	  If $payType == 	"po" 		Then poPay()
	  If $payType == 	"gift" 		Then giftPay()
	  If $payType == 	"custacct" 	Then custAcctPay()

	  fullyCompleted()
	  managerApproval()
	  closeSummary()
	  sleep(1000)
	  blankSpace()
   Next
EndFunc


;Functions used for finishing the order
Func finishOrder()
   ControlClick("Caesar Vision", "Finish Order", $finishOrderNN, "left")
   sleep(2000)
EndFunc
Func custName($i)
   ControlClick("Order Payment", "", "TEdit2", "left")
   ControlSend("Order Payment", "", "TEdit2", $i)
EndFunc
Func queueButton()
   ControlClick("Order Payment", "", "TPDJButton2", "left")
   sleep(500)
EndFunc
Func queueNow()
   ControlClick("Calendar", "Now", "TColorButton1", "left")
   sleep(500)
EndFunc
Func scheduleButton()
   ControlClick("Order Payment", "", $scheduleButtonNN , "left")
   sleep(500)
EndFunc
Func scheduleToday()
   MouseClick("left", $futureTimeX, $futureTimeY)
   ControlClick("Calendar", "OK", "TColorButton5", "left")
   sleep(1000)
EndFunc
Func scheduleFuture()
   MouseClick("left", $futureDayX, $futureDayY)
   MouseClick("left", $futureTimeX, $futureTimeY)
   sleep(500)
   ControlClick("Calendar", "OK", "TColorButton5", "left")
   sleep(1000)
EndFunc
Func makeTicket()
   MouseClick("left", $makeTicketNoneX, $makeTicketNoneY)
   sleep(1000)
   cartSpace()
   sleep(500)
EndFunc


;Functions used to pay for orders
Func cashPay()
   ControlClick("Order Payment", "", "TColorButton10", "left")
   sleep(1000)
EndFunc
Func checkPay()
   MouseClick("left", $checkX, $checkY)
   ControlSend("Order Payment", "", "TEdit3", "123456789")
   sleep(1000)
   payButton("check")
   managerApproval()
EndFunc
Func checkNoKeysPay()
   MouseClick("left", $checkNoKeysX, $checkNoKeysY)
   ControlSend("Order Payment", "", "TEdit3", "123456789")
   sleep(1000)
   payButton("check")
   managerApproval()
EndFunc
Func poPay()
   MouseClick("left", $moreX, $moreY)
   MouseClick("left", $poX, $poY)
   sleep(500)
   ControlSend("Order Payment", "", "TEdit3", "123456789")
   sleep(1000)
   payButton("po")
   managerApproval()
EndFunc
Func poNoKeysPay()
   MouseClick("left", $moreNoKeysX, $moreNoKeysY)
   MouseClick("left", $poNoKeysX, $poNoKeysY)
   sleep(500)
   ControlSend("Order Payment", "", "TEdit3", "123456789")
   sleep(1000)
   payButton("po")
   managerApproval()
EndFunc
Func giftPay()

EndFunc
Func custAcctPay($name)
   ControlClick("Order Payment", "Customer", "TColorButton2", "left")
   sleep(500)
   ControlSend("Customer Information", "", "TEdit8", $custAcctName)
   sleep(500)
   MouseClick("left", $customer1X, $customer1Y, 4)
   sleep(500)
   ControlSetText("Order Payment", $custAcctName, "TEdit2", $name)
   MouseClick("left", $moreNoKeysX, $moreNoKeysY)
   MouseClick("left", $custAcctNoKeysX, $custAcctNoKeysY)
   payButton("custAcct")
EndFunc
Func queuePay($num)
   For $i = 1 To $num Step 1
	  MouseClick("left", $queueTabX, $queueTabY)
	  MouseClick("left", $queueTopX, $queueTopY)
	  sleep(500)
	  finishOrder()

	  ; Get the name on the order
	  Local $orderName = ControlGetText("Order Payment", "", "TEdit2")
	  Local $orderType = getOrderType($orderName)

	  ; Pay depending on order name
	  Select
		 Case $orderType = "prepaid"
			cashPay()
		 Case $orderType = "check"
			checkNoKeysPay()
		 Case $orderType = "po"
			poNoKeysPay()
		 Case $orderType = "gift"
			giftPay()
		 Case $orderType = "custAcct"
			custAcctPay()
		 Case Else
			cashPay()
	  EndSelect

   fullyCompleted()
   managerApproval()
   closeSummary()

   ; Scheduled orders require user to verify that the order has been given to the customer
   Local $_isSched = isScheduled($orderName)
   if ($_isSched = 1) Then
	  sleep(500)
	  queueGiveAway()
   EndIf

   sleep(1000)
   Next
EndFunc
Func queueGiveAway()
   MouseClick("left", $givenToCustX, $givenToCustY)
EndFunc


;Functions used for closing out the order
Func waitForNewProduct()
   If WinActive("Order Summary") Then
	  MouseClick("left", $waitForNewProductX, $waitForNewProductY)
   Else
	  sleep(500)
	  waitForNewProduct()
   EndIf
   sleep(500)
EndFunc
Func closeSummary()
   ControlClick("Order Summary", "Close", "TColorButton2", "left")
   sleep(2000)
EndFunc


;Miscellaneous Functions
Func payButton($payType)
   ControlClick("Order Payment", "PAY", $payButtonNN, "left")
   sleep(2000)
EndFunc
Func cartSpace()
   ControlClick("Caesar Vision", "", "TDJListBox13", "left")
   sleep(500)
EndFunc
Func managerApproval()
   ControlClick("Fingerprint Recognition", "Login", "TColorButton1", "left")
   sleep(500)
   ControlSend("Keyboard Login", "", "TEdit2", $username)
   ControlSend("Keyboard Login", "", "TEdit1", $password)
   ControlClick("Keyboard Login", "Login", "TColorButton2", "left")
   sleep(2000)
EndFunc
Func getOrderType($name)
   If StringInStr($name, "prepaid") > 1 Then
	  Return "cash"
   EndIf
   If StringInStr($name, "check") > 1 Then
	  Return "check"
   EndIf
   If StringInStr($name, "po") > 1 Then
	  Return "po"
   EndIf
   If StringInStr($name, "gift") > 1 Then
	  Return "gift"
   EndIf
   If StringInStr($name, "custAcct") > 1 Then
	  Return "custAcct"
   EndIf
EndFunc
Func isScheduled($name)
   If StringInStr($name, "sched") > 0 Then
	  return 1
   ElseIf StringInStr($name, "prepaid") > 0 Then
	  return 1
   Else
	  return 0
   EndIf
EndFunc
Func fullyCompleted()
   If WinActive("Order Summary") Then
	  MouseClick("left", $fullyCompletedX, $fullyCompletedY)
   Else
	  sleep(500)
	  fullyCompleted()
   EndIf
   sleep(500)
EndFunc
Func blankSpace()
   ControlClick("CaesarVision", "", "TDJListBox14", "left", 5)
EndFunc


Func RECOMMENDEDSALES()
   waitingOrder(4, "hnr", "cash", 1, 0, 0)
   waitingOrder(4, "spec", "cash", 0, 1, 0)
   waitingOrder(4, "nontax", "cash", 0, 0, 1)
   waitingOrder(2, "hnr/spec", "cash", 1, 1, 0)
   waitingOrder(2, "spec/nontax", "cash", 0, 1, 1)
   waitingOrder(2, "hnr/nontax", "cash", 1, 0, 1)
   waitingOrder(2, "all", "cash", 1, 1, 1)

   waitingOrder(4, "hnr", "check", 1, 0, 0)
   waitingOrder(4, "spec", "check", 0, 1, 0)
   waitingOrder(4, "nontax", "check", 0, 0, 1)
   waitingOrder(2, "hnr/spec", "check", 1, 1, 0)
   waitingOrder(2, "spec/nontax", "check", 0, 1, 1)
   waitingOrder(2, "hnr/nontax", "check", 1, 0, 1)
   waitingOrder(2, "all", "check", 1, 1, 1)

   waitingOrder(4, "hnr", "po", 1, 0, 0)
   waitingOrder(4, "spec", "po", 0, 1, 0)
   waitingOrder(4, "nontax", "po", 0, 0, 1)
   waitingOrder(2, "hnr/spec", "po", 1, 1, 0)
   waitingOrder(2, "spec/nontax", "po", 0, 1, 1)
   waitingOrder(2, "hnr/nontax", "po", 1, 0, 1)
   waitingOrder(2, "all", "po", 1, 1, 1)

   ;waitingOrder(4, "hnr", "gift", 1, 0, 0)
   ;waitingOrder(4, "spec", "gift", 0, 1, 0)
   ;waitingOrder(4, "nontax", "gift", 0, 0, 1)
   ;waitingOrder(2, "hnr/spec", "gift", 1, 1, 0)
   ;waitingOrder(2, "spec/nontax", "gift", 0, 1, 1)
   ;waitingOrder(2, "hnr/nontax", "gift", 1, 0, 1)
   ;waitingOrder(2, "all", "gift", 1, 1, 1)

   waitingOrder(4, "hnr", "custAcct", 1, 0, 0)
   waitingOrder(4, "spec", "custAcct", 0, 1, 0)
   waitingOrder(4, "nontax", "custAcct", 0, 0, 1)
   waitingOrder(2, "hnr/spec", "custAcct", 1, 1, 0)
   waitingOrder(2, "spec/nontax", "custAcct", 0, 1, 1)
   waitingOrder(2, "hnr/nontax", "custAcct", 1, 0, 1)
   waitingOrder(2, "all", "custAcct", 1, 1, 1)

   queueOrder(3, "hnr", "cash", 1, 0, 0)
   queueOrder(3, "spec", "cash", 0, 1, 0)
   queueOrder(2, "hnr/spec", "cash", 1, 1, 0)
   queueOrder(2, "spec/nontax", "cash", 0, 1, 1)
   queueOrder(2, "hnr/nontax", "cash", 1, 0, 1)
   queueOrder(2, "all", "cash", 1, 1, 1);

   queueOrder(3, "hnr", "check", 1, 0, 0)
   queueOrder(3, "spec", "check", 0, 1, 0)
   queueOrder(2, "hnr/spec", "check", 1, 1, 0)
   queueOrder(2, "spec/nontax", "check", 0, 1, 1)
   queueOrder(2, "hnr/nontax", "check", 1, 0, 1)
   queueOrder(2, "all", "check", 1, 1, 1)

   queueOrder(3, "hnr", "po", 1, 0, 0)
   queueOrder(3, "spec", "po", 0, 1, 0)
   queueOrder(2, "hnr/spec", "po", 1, 1, 0)
   queueOrder(2, "spec/nontax", "po", 0, 1, 1)
   queueOrder(2, "hnr/nontax", "po", 1, 0, 1)
   queueOrder(2, "all", "po", 1, 1, 1)

   ;queueOrder(3, "hnr", "gift", 1, 0, 0)
   ;queueOrder(3, "spec", "gift", 0, 1, 0)
   ;queueOrder(2, "hnr/spec", "gift", 1, 1, 0)
   ;queueOrder(2, "spec/nontax", "gift", 0, 1, 1)
   ;queueOrder(2, "hnr/nontax", "gift", 1, 0, 1)
   ;queueOrder(2, "all", "gift", 1, 1, 1)

   queueOrder(3, "hnr", "custAcct", 1, 0, 0)
   queueOrder(3, "spec", "custAcct", 0, 1, 0)
   queueOrder(2, "hnr/spec", "custAcct", 1, 1, 0)
   queueOrder(2, "spec/nontax", "custAcct", 0, 1, 1)
   queueOrder(2, "hnr/nontax", "custAcct", 1, 0, 1)
   queueOrder(2, "all", "custAcct", 1, 1, 1)

   scheduleOrder(3, "hnr", "cash", 1, 0, 0)
   scheduleOrder(3, "spec", "cash", 0, 1, 0)
   scheduleOrder(2, "hnr/spec", "cash", 1, 1, 0)
   scheduleOrder(2, "spec/nontax", "cash", 0, 1, 1)
   scheduleOrder(2, "hnr/nontax", "cash", 1, 0, 1)
   scheduleOrder(2, "all", "cash", 1, 1, 1);

   scheduleOrder(3, "hnr", "check", 1, 0, 0)
   scheduleOrder(3, "spec", "check", 0, 1, 0)
   scheduleOrder(2, "hnr/spec", "check", 1, 1, 0)
   scheduleOrder(2, "spec/nontax", "check", 0, 1, 1)
   scheduleOrder(2, "hnr/nontax", "check", 1, 0, 1)
   scheduleOrder(2, "all", "check", 1, 1, 1)

   scheduleOrder(3, "hnr", "po", 1, 0, 0)
   scheduleOrder(3, "spec", "po", 0, 1, 0)
   scheduleOrder(2, "hnr/spec", "po", 1, 1, 0)
   scheduleOrder(2, "spec/nontax", "po", 0, 1, 1)
   scheduleOrder(2, "hnr/nontax", "po", 1, 0, 1)
   scheduleOrder(2, "all", "po", 1, 1, 1)

   ;scheduleOrder(3, "spec", "gift", 0, 1, 0)
   ;scheduleOrder(2, "hnr/spec", "gift", 1, 1, 0)
   ;scheduleOrder(2, "spec/nontax", "gift", 0, 1, 1)
   ;scheduleOrder(2, "hnr/nontax", "gift", 1, 0, 1)
   ;scheduleOrder(2, "all", "gift", 1, 1, 1)

   scheduleOrder(3, "spec", "custAcct", 0, 1, 0)
   scheduleOrder(2, "hnr/spec", "custAcct", 1, 1, 0)
   scheduleOrder(2, "spec/nontax", "custAcct", 0, 1, 1)
   scheduleOrder(2, "hnr/nontax", "custAcct", 1, 0, 1)
   scheduleOrder(2, "all", "custAcct", 1, 1, 1)

   prepaidOrder(3, "hnr", "cash", 1, 0, 0)
   prepaidOrder(3, "spec", "cash", 0, 1, 0)
   prepaidOrder(2, "hnr/spec", "cash", 1, 1, 0)
   prepaidOrder(2, "spec/nontax", "cash", 0, 1, 1)
   prepaidOrder(2, "hnr/nontax", "cash", 1, 0, 1)
   prepaidOrder(2, "all", "cash", 1, 1, 1);

   prepaidOrder(3, "hnr", "check", 1, 0, 0)
   prepaidOrder(3, "spec", "check", 0, 1, 0)
   prepaidOrder(2, "hnr/spec", "check", 1, 1, 0)
   prepaidOrder(2, "spec/nontax", "check", 0, 1, 1)
   prepaidOrder(2, "hnr/nontax", "check", 1, 0, 1)
   prepaidOrder(2, "all", "check", 1, 1, 1)

   ;prepaidOrder(3, "spec", "gift", 0, 1, 0)
   ;prepaidOrder(2, "hnr/spec", "gift", 1, 1, 0)
   ;prepaidOrder(2, "spec/nontax", "gift", 0, 1, 1)
   ;prepaidOrder(2, "hnr/nontax", "gift", 1, 0, 1)
   ;prepaidOrder(2, "all", "gift", 1, 1, 1)
EndFunc
Func noErrors()
   If WinExists("Warning") Then
	  ControlClick("Warning", "OK", "Button1", "left")
	  sleep(500)
   ElseIf WinExists("StreamPOS") Then
	  ControlClick("StreamPOS", "OK", "Button1", "left")
	  sleep(500)
   EndIf
   return 1
EndFunc

; {{ [[ INSTRUCTIONS [waitingOrder()] ]] }}
;waitingOrder(
;	[# of Orders], 		<<<< This will be the amount of orders created when this function is called
;   [Order Type], 		<<<< This is the type of order you have created. Will be mentioned on the order itself
;   [Payment Method],	<<<< This will be the payment method used to compelte the order (Acceptable input: "cash", "check", "po", "gift", "custAcct")
;   [# of HNR], 		<<<< This will be the amount of HNR items on the order (Can be 0)
;   [# of Special], 	<<<< This will be the amount of Special items on the order (Can be 0)
;   [# of Donation]		<<<< This will be the amount of non-tax items on the order (Can be 0)
;)

; {{ [[ RECOMMENDED: ]] }}
;waitingOrder(4, "hnr", "cash", 1, 0, 0)
;waitingOrder(4, "spec", "cash", 0, 1, 0)
;waitingOrder(4, "nontax", "cash", 0, 0, 1)
;waitingOrder(2, "hnr/spec", "cash", 1, 1, 0)
;waitingOrder(2, "spec/nontax", "cash", 0, 1, 1)
;waitingOrder(2, "hnr/nontax", "cash", 1, 0, 1)
;waitingOrder(2, "all", "cash", 1, 1, 1);
;
;waitingOrder(4, "hnr", "check", 1, 0, 0)
;waitingOrder(4, "spec", "check", 0, 1, 0)
;waitingOrder(4, "nontax", "check", 0, 0, 1)
;waitingOrder(2, "hnr/spec", "check", 1, 1, 0)
;waitingOrder(2, "spec/nontax", "check", 0, 1, 1)
;waitingOrder(2, "hnr/nontax", "check", 1, 0, 1)
;waitingOrder(2, "all", "check", 1, 1, 1)
;
;waitingOrder(4, "hnr", "po", 1, 0, 0)
;waitingOrder(4, "spec", "po", 0, 1, 0)
;waitingOrder(4, "nontax", "po", 0, 0, 1)
;waitingOrder(2, "hnr/spec", "po", 1, 1, 0)
;waitingOrder(2, "spec/nontax", "po", 0, 1, 1)
;waitingOrder(2, "hnr/nontax", "po", 1, 0, 1)
;waitingOrder(2, "all", "po", 1, 1, 1)
;
;waitingOrder(4, "hnr", "gift", 1, 0, 0)
;waitingOrder(4, "spec", "gift", 0, 1, 0)
;waitingOrder(4, "nontax", "gift", 0, 0, 1)
;waitingOrder(2, "hnr/spec", "gift", 1, 1, 0)
;waitingOrder(2, "spec/nontax", "gift", 0, 1, 1)
;waitingOrder(2, "hnr/nontax", "gift", 1, 0, 1)
;waitingOrder(2, "all", "gift", 1, 1, 1)
;
;waitingOrder(4, "hnr", "custAcct", 1, 0, 0)
;waitingOrder(4, "spec", "custAcct", 0, 1, 0)
;waitingOrder(4, "nontax", "custAcct", 0, 0, 1)
;waitingOrder(2, "hnr/spec", "custAcct", 1, 1, 0)
;waitingOrder(2, "spec/nontax", "custAcct", 0, 1, 1)
;waitingOrder(2, "hnr/nontax", "custAcct", 1, 0, 1)
;waitingOrder(2, "all", "custAcct", 1, 1, 1)



; {{ [[ INSTRUCTIONS [queueOrder()] ]] }}
;queueOrder(
;	[# of Orders], 		<<<< This will be the amount of orders created when this function is called
;   [Order Type], 		<<<< This is the type of order you have created. Will be mentioned on the order itself
;   [Payment Method],	<<<< This will be the payment method used to compelte the order (Acceptable input: "cash", "check", "po", "gift", "custAcct")
;   [# of HNR], 		<<<< This will be the amount of HNR items on the order (Can be 0)
;   [# of Special], 	<<<< This will be the amount of Special items on the order (Can be 0)
;   [# of Donation]		<<<< This will be the amount of non-tax items on the order (Can be 0)
;)

; {{ [[ RECOMMENDED: ]] }}
;queueOrder(3, "hnr", "cash", 1, 0, 0)
;queueOrder(3, "spec", "cash", 0, 1, 0)
;queueOrder(2, "hnr/spec", "cash", 1, 1, 0)
;queueOrder(2, "spec/nontax", "cash", 0, 1, 1)
;queueOrder(2, "hnr/nontax", "cash", 1, 0, 1)
;queueOrder(2, "all", "cash", 1, 1, 1);
;
;queueOrder(3, "hnr", "check", 1, 0, 0)
;queueOrder(3, "spec", "check", 0, 1, 0)
;queueOrder(2, "hnr/spec", "check", 1, 1, 0)
;queueOrder(2, "spec/nontax", "check", 0, 1, 1)
;queueOrder(2, "hnr/nontax", "check", 1, 0, 1)
;queueOrder(2, "all", "check", 1, 1, 1)
;
;queueOrder(3, "hnr", "po", 1, 0, 0)
;queueOrder(3, "spec", "po", 0, 1, 0)
;queueOrder(2, "hnr/spec", "po", 1, 1, 0)
;queueOrder(2, "spec/nontax", "po", 0, 1, 1)
;queueOrder(2, "hnr/nontax", "po", 1, 0, 1)
;queueOrder(2, "all", "po", 1, 1, 1)
;
;queueOrder(3, "hnr", "gift", 1, 0, 0)
;queueOrder(3, "spec", "gift", 0, 1, 0)
;queueOrder(2, "hnr/spec", "gift", 1, 1, 0)
;queueOrder(2, "spec/nontax", "gift", 0, 1, 1)
;queueOrder(2, "hnr/nontax", "gift", 1, 0, 1)
;queueOrder(2, "all", "gift", 1, 1, 1)
;
;queueOrder(3, "hnr", "custAcct", 1, 0, 0)
;queueOrder(3, "spec", "custAcct", 0, 1, 0)
;queueOrder(2, "hnr/spec", "custAcct", 1, 1, 0)
;queueOrder(2, "spec/nontax", "custAcct", 0, 1, 1)
;queueOrder(2, "hnr/nontax", "custAcct", 1, 0, 1)
;queueOrder(2, "all", "custAcct", 1, 1, 1)



; {{ [[ INSTRUCTIONS [scheduledOrder()] ]] }}
;scheduledOrder(
;	[# of Orders], 		<<<< This will be the amount of orders created when this function is called
;   [Order Type], 		<<<< This is the type of order you have created. Will be mentioned on the order itself
;   [Payment Method],	<<<< This will be the payment method used to compelte the order (Acceptable input: "cash", "check", "po", "gift", "custAcct")
;   [# of HNR], 		<<<< This will be the amount of HNR items on the order (Can be 0)
;   [# of Special], 	<<<< This will be the amount of Special items on the order (Can be 0)
;   [# of Donation]		<<<< This will be the amount of non-tax items on the order (Can be 0)
;)

; {{ [[ RECOMMENDED: ]] }}
;scheduleOrder(3, "hnr", "cash", 1, 0, 0)
;scheduleOrder(3, "spec", "cash", 0, 1, 0)
;scheduleOrder(2, "hnr/spec", "cash", 1, 1, 0)
;scheduleOrder(2, "spec/nontax", "cash", 0, 1, 1)
;scheduleOrder(2, "hnr/nontax", "cash", 1, 0, 1)
;scheduleOrder(2, "all", "cash", 1, 1, 1);
;
;scheduleOrder(3, "hnr", "check", 1, 0, 0)
;scheduleOrder(3, "spec", "check", 0, 1, 0)
;scheduleOrder(2, "hnr/spec", "check", 1, 1, 0)
;scheduleOrder(2, "spec/nontax", "check", 0, 1, 1)
;scheduleOrder(2, "hnr/nontax", "check", 1, 0, 1)
;scheduleOrder(2, "all", "check", 1, 1, 1)
;
;scheduleOrder(3, "hnr", "po", 1, 0, 0)
;scheduleOrder(2, "hnr/spec", "po", 1, 1, 0)
;scheduleOrder(2, "spec/nontax", "po", 0, 1, 1)
;scheduleOrder(2, "hnr/nontax", "po", 1, 0, 1)
;scheduleOrder(2, "all", "po", 1, 1, 1)
;
;scheduleOrder(3, "spec", "gift", 0, 1, 0)
;scheduleOrder(2, "hnr/spec", "gift", 1, 1, 0)
;scheduleOrder(2, "spec/nontax", "gift", 0, 1, 1)
;scheduleOrder(2, "hnr/nontax", "gift", 1, 0, 1)
;scheduleOrder(2, "all", "gift", 1, 1, 1)
;
;scheduleOrder(3, "spec", "custAcct", 0, 1, 0)
;scheduleOrder(3, "nontax", "custAcct", 0, 0, 1)
;scheduleOrder(2, "hnr/spec", "custAcct", 1, 1, 0)
;scheduleOrder(2, "spec/nontax", "custAcct", 0, 1, 1)
;scheduleOrder(2, "hnr/nontax", "custAcct", 1, 0, 1)
;scheduleOrder(2, "all", "custAcct", 1, 1, 1)



; {{ [[ INSTRUCTIONS [prepaidOrder()] ]] }}
;prepaidOrder(
;	[# of Orders], 		<<<< This will be the amount of orders created when this function is called
;   [Order Type], 		<<<< This is the type of order you have created. Will be mentioned on the order itself
;   [Payment Method],	<<<< This will be the payment method used to compelte the order (Acceptable input: "cash", "check", "po", "gift", "custAcct")
;   [# of HNR], 		<<<< This will be the amount of HNR items on the order (Can be 0)
;   [# of Special], 	<<<< This will be the amount of Special items on the order (Can be 0)
;   [# of Donation]		<<<< This will be the amount of non-tax items on the order (Can be 0)
;)

; {{ [[ RECOMMENDED: ]] }}
;prepaidOrder(3, "hnr", "cash", 1, 0, 0)
;prepaidOrder(3, "spec", "cash", 0, 1, 0)
;prepaidOrder(2, "hnr/spec", "cash", 1, 1, 0)
;prepaidOrder(2, "spec/nontax", "cash", 0, 1, 1)
;prepaidOrder(2, "hnr/nontax", "cash", 1, 0, 1)
;prepaidOrder(2, "all", "cash", 1, 1, 1);
;
;prepaidOrder(3, "hnr", "check", 1, 0, 0)
;prepaidOrder(3, "spec", "check", 0, 1, 0)
;prepaidOrder(2, "hnr/spec", "check", 1, 1, 0)
;prepaidOrder(2, "spec/nontax", "check", 0, 1, 1)
;prepaidOrder(2, "hnr/nontax", "check", 1, 0, 1)
;prepaidOrder(2, "all", "check", 1, 1, 1)
;
;prepaidOrder(3, "hnr", "po", 1, 0, 0)
;prepaidOrder(3, "spec", "po", 0, 1, 0)
;prepaidOrder(2, "hnr/spec", "po", 1, 1, 0)
;prepaidOrder(2, "spec/nontax", "po", 0, 1, 1)
;prepaidOrder(2, "hnr/nontax", "po", 1, 0, 1)
;prepaidOrder(2, "all", "po", 1, 1, 1)
;
;prepaidOrder(3, "spec", "gift", 0, 1, 0)
;prepaidOrder(2, "hnr/spec", "gift", 1, 1, 0)
;prepaidOrder(2, "spec/nontax", "gift", 0, 1, 1)
;prepaidOrder(2, "hnr/nontax", "gift", 1, 0, 1)
;prepaidOrder(2, "all", "gift", 1, 1, 1)











;Automation Start:
While noErrors()
waitingOrder(2, "spec/nontax", "check", 0, 1, 1)
waitingOrder(2, "hnr/nontax", "check", 1, 0, 1)
waitingOrder(2, "all", "check", 1, 1, 1)

waitingOrder(4, "hnr", "po", 1, 0, 0)
waitingOrder(4, "spec", "po", 0, 1, 0)
waitingOrder(4, "nontax", "po", 0, 0, 1)
waitingOrder(2, "hnr/spec", "po", 1, 1, 0)
waitingOrder(2, "spec/nontax", "po", 0, 1, 1)
waitingOrder(2, "hnr/nontax", "po", 1, 0, 1)
waitingOrder(2, "all", "po", 1, 1, 1)
queueOrder(3, "hnr", "cash", 1, 0, 0)
queueOrder(3, "spec", "cash", 0, 1, 0)
queueOrder(2, "hnr/spec", "cash", 1, 1, 0)
queueOrder(2, "spec/nontax", "cash", 0, 1, 1)
queueOrder(2, "hnr/nontax", "cash", 1, 0, 1)
queueOrder(2, "all", "cash", 1, 1, 1);

queueOrder(3, "hnr", "check", 1, 0, 0)
queueOrder(3, "spec", "check", 0, 1, 0)
queueOrder(2, "hnr/spec", "check", 1, 1, 0)
queueOrder(2, "spec/nontax", "check", 0, 1, 1)
queueOrder(2, "hnr/nontax", "check", 1, 0, 1)
queueOrder(2, "all", "check", 1, 1, 1)

queueOrder(3, "hnr", "po", 1, 0, 0)
queueOrder(3, "spec", "po", 0, 1, 0)
queueOrder(2, "hnr/spec", "po", 1, 1, 0)
queueOrder(2, "spec/nontax", "po", 0, 1, 1)
queueOrder(2, "hnr/nontax", "po", 1, 0, 1)
queueOrder(2, "all", "po", 1, 1, 1)
scheduleOrder(3, "hnr", "cash", 1, 0, 0)
scheduleOrder(3, "spec", "cash", 0, 1, 0)
scheduleOrder(2, "hnr/spec", "cash", 1, 1, 0)
scheduleOrder(2, "spec/nontax", "cash", 0, 1, 1)
scheduleOrder(2, "hnr/nontax", "cash", 1, 0, 1)
scheduleOrder(2, "all", "cash", 1, 1, 1);

scheduleOrder(3, "hnr", "check", 1, 0, 0)
scheduleOrder(3, "spec", "check", 0, 1, 0)
scheduleOrder(2, "hnr/spec", "check", 1, 1, 0)
scheduleOrder(2, "spec/nontax", "check", 0, 1, 1)
scheduleOrder(2, "hnr/nontax", "check", 1, 0, 1)
scheduleOrder(2, "all", "check", 1, 1, 1)

scheduleOrder(3, "hnr", "po", 1, 0, 0)
scheduleOrder(2, "hnr/spec", "po", 1, 1, 0)
scheduleOrder(2, "spec/nontax", "po", 0, 1, 1)
scheduleOrder(2, "hnr/nontax", "po", 1, 0, 1)
scheduleOrder(2, "all", "po", 1, 1, 1)
WEnd



