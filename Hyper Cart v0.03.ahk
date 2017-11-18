`::

Gui, Color, 8B0000
Gui, Font, Courier New Bold
Gui, Font, cWhite
Gui, Add, Text,, First name:
Gui, Add, Text,, Last name:
Gui, Add, Text,, Email:
Gui, Add, Text,, First Three Digits of Phone Number:
Gui, Add, Text,, Next Three Digits of Phone Number:
Gui, Add, Text,, Last Four Digits of Phone Number:
Gui, Add, Text,, Street Adress:
Gui, Add, Text,, Apt, Unit, etc (LEAVE BlANK IF NONE):
Gui, Add, Text,, Zip:
Gui, Add, Text,, State *ABREVIATION* CA for California.. etc.:
Gui, Add, Text,, City
Gui, Add, Text,, Card Number:
Gui, Add, Text,, Expiration Month:
Gui, Add, Text,, Expiration Year:
Gui, Add, Text,, CVC:
Gui, Add, Text,, Click COP To Begin:

Gui, Font, cBlack
Gui, Add, Edit, vFirstName ym  ; The ym option starts a new column of controls.
Gui, Add, Edit, vLastName
Gui, Add, Edit, vEmail
Gui, Add, Edit, vPhone
Gui, Add, Edit, vPhonee
Gui, Add, Edit, vPhoneee
Gui, Add, Edit, vStreetAdress
Gui, Add, Edit, vApt
Gui, Add, Edit, vZip
Gui, Add, Edit, vState
Gui, Add, Edit, vCity
Gui, Add, Edit, vCardNum
Gui, Add, DropDownList, vMonth, 01|02|03|04|05|06|07|08|09|10|11|12
Gui, Add, DropDownList, vYear, 2017|2018|2019|2020|2021|2022|2023|2024
Gui, Add, Edit, vCVC

Gui, Add, Button, default, COP
Gui, Show,, Hyper Cart v.0.03 *Read The README*
return  ; End of auto-execute section. The script is idle until the user does something.



if (Month > 11){
Month = {Down 1}
}

Else if (Month < 11){
i = 11 - Month
Month = {Up %i%}
}


k = 2017 - Year
Year = {Down %k%}
Month = {Down %i%}


ButtonCOP:
Gui, Submit  ; Save the input from the user to each control's associated variable.

MsgBox Let's cop %FirstName%! Checkout your item and click (Ctrl A) on your checkout page and Hyper Cart will do all the work!

Return


^a::
   Send, `t
   Send, `t
   Send, `t
   SendInput, %FirstName% %LastName%
   Send, `t
   SendInput, %Email%
   Send, `t
   SendInput, %Phone% 
   SendInput, -
   SendInput, %Phonee%
   SendInput, - 
   SendInput, %Phoneee%
   Send, `t
   SendInput, %StreetAdress%
   Send, `t
   SendInput, %Apt%
   Send, `t
   SendInput, %Zip%
   Send, `t
   SendInput, %City%
   Send, `t
   SendInput, %State%
   Send, `t
   Send, `t
   Send, `t
   SendInput, %CardNum%
   Send, `t
   Send %Month%
   Send, `t
   Send %Year%
   Send, `t
   SendInput, %CVC%
   Send, `t
   Send {Space}
   Send {Enter}
   

   Run, http://hypercart.tk/
   Send {Enter}
   ExitApp 
   Return
