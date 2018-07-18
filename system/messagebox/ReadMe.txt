

Displays a custom message box and returns the user's 
response (which button was pressed) in the exit code.

The syntax of this command is:

MessageBox.exe	/C:caption /M:message [/W:seconds] [/T:type] [/T:?]

 /C:	specifies the caption to display in the title bar.
 /M:	specifies the message to display to the user.
 /W:	number of seconds to wait before timing out (optional).
 /T:	specifies the type of icon and buttons (optional).
 /T:?	Displays extended help for /T: options and return codes.

All occurrences of \\n will be converted to a new-line character.
All occurrences of \\t will be converted to a tab character.

/? displays this syntax and always returns 0.
/T:? displays extended syntax and always returns 0.
Success returns a non-zero value, zero indicates a failure.


Copyright ©1999-2003 Marty List, Marty@OptimumX.com



The number following the /T: switch in MessageBox.exe specifies the
contents and behavior of the dialog box. This parameter can be a
combination of flags from the following groups.  As an example, to
display the Yes, No and Cancel buttons, add 3.  To show a yellow
exclamation icon add 48. To make 'Cancel' the default button, add
512. Like this /T:563 (3+48+512=563)

Buttons to display
0	Display OK button only.
1	Display OK and Cancel buttons.
2	Display Abort, Retry, and Ignore buttons.
3	Display Yes, No, and Cancel buttons.
4	Display Yes and No buttons.
5	Display Retry and Cancel buttons.

Icon to display
16	Stop symbol
32	Question mark
48	Exclamation mark
64	Information symbol

Default button
0	First button is default.
256	Second button is default.
512	Third button is default.

Modality
0	Application-modal. The user must respond to the message box before
  	continuing work in the application.
4096	System-modal. All applications are suspended until the user
  	responds to the message box.

Return Codes
0	There was an error or the user did not respond within the specified
  	time-out period.
1	OK button selected.
2	Cancel button selected.
3	Abort button selected.
4	Retry button selected.
5	Ignore button selected.
6	Yes button selected.
7	No button selected.


==================================================================


System Requirements:

	Windows XP; Windows 2000; Windows NT
	Windows ME; Windows 98; Windows 95


Revision History:

	1.10 	03/06/2003
	Fixed bug with leading \t and \n in message.
	Fixed bug with consecutive backslashes in message.
	Added support for the /T:? switch.
	
	1.00 	01/29/2000
	Initial release.
