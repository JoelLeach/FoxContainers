Define Class FoxConsole As Custom

Procedure Init
	* Try to prevent any dialogs from popping up that will get VFP stuck
	Sys(2335,0)   && unattended mode
	Set Safety Off
	Set TablePrompt Off
	Set TableValidate To 0
	Set Cpdialog Off
	
	Set Exclusive Off
	Set Multilocks On
Endproc

Procedure DoCmd
	Lparameters lcCommand, lcAltFile, lcDeviceFile
	Local loException as Exception, lcError
	Try
        Clear
		Set Safety Off
		Set Device To File (lcDeviceFile)
		Set Alternate To (lcAltFile)
		Set Alternate On
        Set Console Off
        If _VFP.StartMode <= 1 or Sys(2335) = [1]
            * If not using unattended mode, press Esc to help avoid getting stuck
            Set Escape Off
            Keyboard [{ESC}]
        EndIf
        This.SetPublicVariable(lcCommand)
		&lcCommand
	Catch to loException
		* Remove OLE portion of error
        * Not sure why this was required before, but no longer needed.
		* lcError = Alltrim(Strtran(loException.Message, [OLE IDispatch exception code 0 from Visual FoxPro for Windows:], []))
        lcError = [Error ] + Transform(loException.ErrorNo) + [: ] + loException.Message
        If !Empty(Nvl(loException.Procedure, [])) and Lower(loException.Procedure) <> "docmd"
            lcError = lcError + Chr(13) + Chr(10) + [Method/Procedure: ] + loException.Procedure ;
                + Chr(13) + Chr(10) + [Line: ]+ Transform(loException.LineNo)
        EndIf
        ? lcError
    Finally
        Set Device To Screen
		Set Alternate Off
		Set Alternate To
	Endtry
EndProc 

Protected Procedure SetPublicVariable()
	* Parse command to see if new variable is being set
	* If so, declare it as public
	Lparameters lcCommand
	Local lcVar
	
	lcCommand = Alltrim(lcCommand)
	
	* If displaying, not setting variable
	If InList(lcCommand, "?", "@")
		Return
	EndIf 
	
	* Must contain =
	If !"=" $ lcCommand
		Return 
	EndIf 
	
	* Make sure not double-equals comparison
	If Substr(lcCommand, At("=", lcCommand, 1), 2) = "=="
		Return
	EndIf 
	
	* Get portion before =
	lcVar = Alltrim(Left(lcCommand, At("=", lcCommand, 1) - 1))
	
	* Not variable if contains parenthesis or more than one word
	If "(" $ lcVar or GetWordCount(lcVar) > 1
		Return 
	EndIf 
	
	* Declare public if not already done
	If Type(lcVar) = "U"
		Public (lcVar)
	EndIf 	
EndProc 

Enddefine

