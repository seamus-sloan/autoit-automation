# sales-automation
CaesarVision sales automation:

# Description:
This script is designed to be run using the AutoIt script editor. The design is flexible and allows the user to create their own custom orders. These orders have the option to be HNR items, non-tax items, or special items all at the users' discretion.

# Set-Up:
To begin the process, please visit:
https://www.autoitscript.com/site/autoit/downloads/ and download the "AutoIt Full Installation"

Follow the installation process provided by the autoIt installer and website.

Download the sales-automation script from this repository.

Upon installation, visit the AutoIt folder and open the SciTE Script Editor. Open the downloaded *.au3* file

# Automation:
The script will have global variables listed at the top. These variables are used throughout the script and act as a sort of *class*.

Visit the AutoIt folder again and open the *AutoIt Window Info* application. By using the targeting icon in the window, select buttons and coordinates for the listed global variables.

Before running the script, ensure that all global variables are correct and scroll to the bottom of the page. This function is *your* automation area. Whether you choose to start from the initial login page, the home page, or the take orders screen, you can create the script that meets your needs specifically.

For more tips on how to create orders and use the provided functions, there is a list below with instructions and recommended sales to complete.





 {{ [[ INSTRUCTIONS [waitingOrder()] ]] }}
waitingOrder(
	[# of Orders], 		<<<< This will be the amount of orders created when this function is called
   [Order Type], 		<<<< This is the type of order you have created. Will be mentioned on the order itself
   [Payment Method],	<<<< This will be the payment method used to compelte the order (Acceptable input: "cash", "check", "po", "gift", custAcct")
   [# of HNR], 		<<<< This will be the amount of HNR items on the order (Can be 0)
   [# of Special], 	<<<< This will be the amount of Special items on the order (Can be 0)
   [# of Donation]		<<<< This will be the amount of non-tax items on the order (Can be 0)
)
 {{ [[ RECOMMENDED: ]] }}
waitingOrder(4, "hnr", "cash", 1, 0, 0)
waitingOrder(4, "spec", "cash", 0, 1, 0)
waitingOrder(4, "nontax", "cash", 0, 0, 1)
waitingOrder(2, "hnr/spec", "cash", 1, 1, 0)
waitingOrder(2, "spec/nontax", "cash", 0, 1, 1)
waitingOrder(2, "hnr/nontax", "cash", 1, 0, 1)
waitingOrder(2, "all", "cash", 1, 1, 1);

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

waitingOrder(4, "hnr", "gift", 1, 0, 0)
waitingOrder(4, "spec", "gift", 0, 1, 0)
waitingOrder(4, "nontax", "gift", 0, 0, 1)
waitingOrder(2, "hnr/spec", "gift", 1, 1, 0)
waitingOrder(2, "spec/nontax", "gift", 0, 1, 1)
waitingOrder(2, "hnr/nontax", "gift", 1, 0, 1)
waitingOrder(2, "all", "gift", 1, 1, 1)

waitingOrder(4, "hnr", "custAcct", 1, 0, 0)
waitingOrder(4, "spec", "custAcct", 0, 1, 0)
waitingOrder(4, "nontax", "custAcct", 0, 0, 1)
waitingOrder(2, "hnr/spec", "custAcct", 1, 1, 0)
waitingOrder(2, "spec/nontax", "custAcct", 0, 1, 1)
waitingOrder(2, "hnr/nontax", "custAcct", 1, 0, 1)
waitingOrder(2, "all", "custAcct", 1, 1, 1)

; {{ [[ INSTRUCTIONS [queueOrder()] ]] }}
queueOrder(
	[# of Orders], 		<<<< This will be the amount of orders created when this function is called
   [Order Type], 		<<<< This is the type of order you have created. Will be mentioned on the order itself
   [Payment Method],	<<<< This will be the payment method used to compelte the order (Acceptable input: "cash", "check", "po", "gift", custAcct")
   [# of HNR], 		<<<< This will be the amount of HNR items on the order (Can be 0)
   [# of Special], 	<<<< This will be the amount of Special items on the order (Can be 0)
   [# of Donation]		<<<< This will be the amount of non-tax items on the order (Can be 0)
)
; {{ [[ RECOMMENDED: ]] }}
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

queueOrder(3, "hnr", "gift", 1, 0, 0)
queueOrder(3, "spec", "gift", 0, 1, 0)
queueOrder(2, "hnr/spec", "gift", 1, 1, 0)
queueOrder(2, "spec/nontax", "gift", 0, 1, 1)
queueOrder(2, "hnr/nontax", "gift", 1, 0, 1)
queueOrder(2, "all", "gift", 1, 1, 1)

queueOrder(3, "hnr", "custAcct", 1, 0, 0)
queueOrder(3, "spec", "custAcct", 0, 1, 0)
queueOrder(2, "hnr/spec", "custAcct", 1, 1, 0)
queueOrder(2, "spec/nontax", "custAcct", 0, 1, 1)
queueOrder(2, "hnr/nontax", "custAcct", 1, 0, 1)
queueOrder(2, "all", "custAcct", 1, 1, 1)

 {{ [[ INSTRUCTIONS [scheduledOrder()] ]] }}
scheduledOrder(
	[# of Orders], 		<<<< This will be the amount of orders created when this function is called
   [Order Type], 		<<<< This is the type of order you have created. Will be mentioned on the order itself
   [Payment Method],	<<<< This will be the payment method used to compelte the order (Acceptable input: "cash", "check", "po", "gift", custAcct")
   [# of HNR], 		<<<< This will be the amount of HNR items on the order (Can be 0)
   [# of Special], 	<<<< This will be the amount of Special items on the order (Can be 0)
   [# of Donation]		<<<< This will be the amount of non-tax items on the order (Can be 0)
)
 {{ [[ RECOMMENDED: ]] }}
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

scheduleOrder(3, "spec", "gift", 0, 1, 0)
scheduleOrder(2, "hnr/spec", "gift", 1, 1, 0)
scheduleOrder(2, "spec/nontax", "gift", 0, 1, 1)
scheduleOrder(2, "hnr/nontax", "gift", 1, 0, 1)
scheduleOrder(2, "all", "gift", 1, 1, 1)

scheduleOrder(3, "spec", "custAcct", 0, 1, 0)
scheduleOrder(3, "nontax", "custAcct", 0, 0, 1)
scheduleOrder(2, "hnr/spec", "custAcct", 1, 1, 0)
scheduleOrder(2, "spec/nontax", "custAcct", 0, 1, 1)
scheduleOrder(2, "hnr/nontax", "custAcct", 1, 0, 1)
scheduleOrder(2, "all", "custAcct", 1, 1, 1)

 {{ [[ INSTRUCTIONS [prepaidOrder()] ]] }}
prepaidOrder(
	[# of Orders], 		<<<< This will be the amount of orders created when this function is called
   [Order Type], 		<<<< This is the type of order you have created. Will be mentioned on the order itself
   [Payment Method],	<<<< This will be the payment method used to compelte the order (Acceptable input: "cash", "check", "po", "gift", custAcct")
   [# of HNR], 		<<<< This will be the amount of HNR items on the order (Can be 0)
   [# of Special], 	<<<< This will be the amount of Special items on the order (Can be 0)
   [# of Donation]		<<<< This will be the amount of non-tax items on the order (Can be 0)
)
 {{ [[ RECOMMENDED: ]] }}
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

prepaidOrder(3, "hnr", "po", 1, 0, 0)
prepaidOrder(3, "spec", "po", 0, 1, 0)
prepaidOrder(2, "hnr/spec", "po", 1, 1, 0)
prepaidOrder(2, "spec/nontax", "po", 0, 1, 1)
prepaidOrder(2, "hnr/nontax", "po", 1, 0, 1)
prepaidOrder(2, "all", "po", 1, 1, 1)

prepaidOrder(3, "spec", "gift", 0, 1, 0)
prepaidOrder(2, "hnr/spec", "gift", 1, 1, 0)
prepaidOrder(2, "spec/nontax", "gift", 0, 1, 1)
prepaidOrder(2, "hnr/nontax", "gift", 1, 0, 1)
prepaidOrder(2, "all", "gift", 1, 1, 1)
