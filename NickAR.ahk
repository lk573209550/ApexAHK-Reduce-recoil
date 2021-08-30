#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
#SingleInstance force
#MaxThreadsBuffer on
#Persistent
Process, Priority, , A
SetBatchLines, -1
ListLines Off
SetWorkingDir %A_ScriptDir%
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input

If not A_IsAdmin {
    Run *RunAs "%A_ScriptFullPath%"
    ExitApp
}

GoSub, IniRead

; Script Version V 0.5

; ---VarSection---

Global Current_Weapon := Default_Weapon
Global Active_Pattern := No_Pattern
Global Default_Weapon := "No"
; Light
Global R301_Weapon := "R301"
Global R99_Weapon := "R99"
Global P2020_Weapon := "P2020"
Global RE45_Weapon := "RE45"
Global G7_Weapon := "G7"
; Heavy
Global Flatline_Weapon := "Flatline"
Global Wingman_Weapon := "Wingman"
Global Prowler_Weapon := "Prowler"
Global Hemlok_Weapon := "Hemlok"
Global Rampage_Weapon := "Rampage"
Global RampageAmp_Weapon := "RampageAmp"
; Energy
Global Volt_Weapon := "Volt"
Global Lstar_Weapon := "Lstar"
Global Devotion_Weapon := "Devotion"
Global DevotionTurbo_Weapon := "DevotionTurbo"
Global Havoc_Weapon := "Havoc"
Global HavocTurbo_Weapon := "HavocTurbo"
; Airdrop
Global Alternator_Weapon := "Alternator"
Global Spitfire_Weapon := "Spitfire"
Global MiniGun_Weapon := "MiniGun"
; Var
Global SingleFire_Weapon := "SingleFire"
Global RapidMode := 0

; ---Edit your sens and weapon selection keys bind---

bind_1 = 1
bind_2 = 2
bind_1B = WheelDown
bind_2B = WheelUp
bind_run = 3
bind_grenade = g 
Subshootkey = 9 ; Bind to your secondary fire button.

; ---Hotkey set---

Hotkey, ~$*%bind_1%, key_1
Hotkey, ~$*%bind_2%, key_2
Hotkey, ~$*%bind_1B%, key_1B
Hotkey, ~$*%bind_2B%, key_2B
Hotkey, ~$*%bind_run%, key_3
Hotkey, ~$*%bind_grenade%, key_g

; ---Pattern---

No_Pattern := {}

; ---------- Light Ammo Pattern ----------

FileRead, R301Pattern, %A_ScriptDir%\Pattern\R301.txt
R301_Pattern := []
Loop, Parse, R301Pattern, `n, `, , `" ,`r 
	R301_Pattern.Insert(A_LoopField)

FileRead, R99Pattern, %A_ScriptDir%\Pattern\R99.txt
R99_Pattern := []
Loop, Parse, R99Pattern, `n, `, , `" ,`r 
	R99_Pattern.Insert(A_LoopField)

Alternator_Pattern := {1: "0.0,10.6,109", 	2: "0.0,9.6,109", 	3: "0.0,11.6,109"
					  ,4: "0.0,10.2,109", 	5: "0.0,11.5,109", 	6: "0.0,11.5,109"
					  ,7: "-1.5,9.3,109",	8: "-1.5,5.4,109", 	9: "-2.2,9.7,109"
					  ,10: "-2.2,4.9,109", 	11: "-2.2,7.2,109", 12: "-1.5,0.9,109"
					  ,13: "-1.5,5.0,109", 	14: "-1.5,3.4,109", 15: "-0.7,7.4,109"
					  ,16: "0.0,6.8,109", 	17: "3.7,2.4,109", 	18: "3.7,7.2,109"
					  ,19: "3.7,0.5,109", 	20: "3.7,6.1,109", 	21: "3.7,-0.1,109"
					  ,22: "3.7,5.2,109", 	23: "3.7,1.3,109", 	24: "3.7,5.6,109"
					  ,25: "3.7,-0.5,109", 	26: "3.7,5,109", 	27: "3.7,0.0,109"}

RE45_Pattern := {1: "-0.7,12.6,112", 2: "-1.4,10.9,112", 3: "-6.1,11.2,112"
				,4: "-3.0,11.6,112", 5: "-4.1,9.9,112",  6: "-5.7,8.0,112"
				,7: "-5.9,7.1,112",  8: "-7.7,6.9,112",  9: "-7.2,6.2,112"
				,10: "-6.7,5.0,112", 11: "-4.7,5.1,112", 12: "1.0,6.4,112"
				,13: "-5.7,5.7,112", 14: "-3.4,5.1,112", 15: "-2.4,6.4,112"
				,16: "2.4,5.7,112",  17: "-3.1,4.7,142", 18: "-5.1,1.3,142"
				,19: "-4.7,3.4,147", 20: "-3.7,4.1,147", 21: "-5.1,2.4,147"
				,22: "-5.1,4.1,147", 23: "-5.0,0.0,147"}

P2020_Pattern := {1: "0,5,140", 	2: "0,5,140",  3: "0,5,140"
				 ,4: "0,5,140", 	5: "0,5,140",  6: "0,5,140"
				 ,7: "0,5,140", 	8: "0,5,140",  9: "0,5,140"
				 ,10: "0,5,140", 	11: "0,5,140", 12: "0,5,140"
				 ,13: "0,5,140", 	14: "0,5,140", 15: "0,5,140"
				 ,16: "0,5,140", 	17: "0,5,140", 18: "0,5,140"
				 ,19: "0,5,140", 	20: "0,5,140", 21: "0,5,140"}

G7_Pattern := {1: "0,5,226", 	2: "0,5,226",  3: "0,5,226"
			  ,4: "0,5,226", 	5: "0,5,226",  6: "0,5,226"
			  ,7: "0,5,226", 	8: "0,5,226",  9: "0,5,226"
			 ,10: "0,5,226", 	11: "0,5,226", 12: "0,5,226"
			 ,13: "0,5,226", 	14: "0,5,226", 15: "0,5,226"
			 ,16: "0,5,226", 	17: "0,5,226", 18: "0,5,226"
			 ,19: "0,5,226", 	20: "0,5,226"}

; ---------- Heavy Ammo Weapon ----------

FileRead, FlatlinePattern, %A_ScriptDir%\Pattern\Flatline.txt
Flatline_Pattern := []
Loop, Parse, FlatlinePattern, `n, `, , `" ,`r 
	Flatline_Pattern.Insert(A_LoopField)

Rampage_Pattern := { 1: "0,0,125", 		2: "-2,8,180", 		3: "6.6,7.8,180"
					,4: "3.2,9.2,180", 	5: "-4.8,6.0,180", 	6: "0.7,9.4,180"
					,7: "-5.3,7.8,180", 8: "-5.2,4.3,180", 	9: "-5.4,6.5,180"
					,10: "-5.2,4.5,180",11: "-1.3,6.5,180", 12: "6.7,4,180"
					,13: "7,5,180", 	14: "3,6.6,180", 	15: "5,2.4,180"
					,16: "5.5,4,180", 	17: "4.5,5,180", 	18: "-1,5.5,180"
					,19: "-2,4.5,180", 	20: "2.3,4,180", 	21: "-3.5,4,180"
					,22: "2.7,4,180", 	23: "3.5,5,180", 	24: "-2.2,6,180"
					,25: "3.7,3.5,180", 26: "4,4.4,180", 	27: "-3.5,6.1,180"
					,28: "5,6,180", 	29: "4.8,5,180", 	30: "4.7,5.5,180"
					,31: "-1,6.5,180", 	32: "-3.5,6,180", 	33: "3,4,180"
					,34: "-3,5,180", 	35: "6,5.3,180", 	36: "3.5,5,180"
					,37: "-1.5,5.7,180",38: "2.5,4,180", 	39: "4.5,3,180"
					,40: "-3,4.5,180"}

RampageAmp_Pattern := {	 1: "0,0,50", 		2: "-2,8,160", 		3: "6.6,7.8,160"
						,4: "3.2,9.2,160", 	5: "-4.8,6.0,160", 	6: "0.7,9.4,160"
						,7: "-5.3,7.8,160", 8: "-5.2,4.3,160", 	9: "-5.4,6.5,160"
						,10: "-5.2,4.5,160",11: "-1.3,6.5,160", 12: "6.7,4,160"
						,13: "7,5,160", 	14: "3,6.6,160", 	15: "5,2.4,160"
						,16: "5.5,4,160", 	17: "4.5,5,160", 	18: "-1,5.5,160"
						,19: "-2,4.5,160", 	20: "2.3,4,160", 	21: "-3.5,4,160"
						,22: "2.7,4,160", 	23: "3.5,5,160", 	24: "-2.2,6,160"
						,25: "3.7,3.5,160", 26: "4,4.4,160", 	27: "-3.5,6.1,160"
						,28: "5,6,160", 	29: "4.8,5,160", 	30: "4.7,5.5,160"
						,31: "-1,6.5,160", 	32: "-3.5,6,160", 	33: "3,4,160"
						,34: "-3,5,160", 	35: "6,5.3,160", 	36: "3.5,5,160"
						,37: "-1.5,5.7,160",38: "2.5,4,160", 	39: "4.5,3,160"
						,40: "-3,4.5,160"}
 

Spitfire_Pattern := {1: "3.0,15.2,110", 	2: "1.5,4.8,110", 		3: "9.6,9.6,110", 		4: "6.3,7.0,110"
					,5: "3.3,9.2,110", 		6: "-0.3,9.2,110", 		7: "-4.5,2.6,110", 		8: "-9.6,-2.0,110"
					,9: "-2.7,-1.6,110", 	10: "-3.9,3.2,110", 	11: "-2.7,6.6,110", 	12: "4.5,2.0,110"
					,13: "9.9,4.4,110",		14: "5.1,1.4,110", 		15: "9.6,-1.6,110", 	16: "4.2,1.4,110"
					,17: "1.8,7.8,110", 	18: "3.3,7.6,110", 		19: "6.9,4.4,110", 		20: "9.0,1.8,110"
					,21: "3.9,0.6,113", 	22: "-1.2,5,113", 		23: "-6.9,2.5,113", 	24: "-4.5,2,113"
					,25: "-7.8,2.2,113", 	26: "-8.1,1,113", 		27: "-7.8,-1,113", 		28: "-3.3,3.6,113"
					,29: "-4.5,4.2,113", 	30: "-0.3,4.2,113", 	31: "-9.6,-2.0,113", 	32: "-2.7,-1.6,113"
					,33: "-3.9,2.2,113", 	34: "-2.6,3,113", 		35: "4.5,1.5,113", 		36: "9.9,3.4,113"
					,37: "5.1,1.4,113", 	38: "9.6,-1.6,113", 	39: "4.2,1.4,113", 		40: "1.8,7.8,113"
					,41: "3.3,7.6,113", 	42: "6.9,4.4,113", 		43: "9.0,1.8,113", 		44: "3.9,0.6,113"
					,45: "-1.2,5.6,113", 	46: "-6.9,3.2,113", 	47: "-4.5,2.6,113", 	48: "-7.8,3.2,113"
					,49: "-8.1,2.0,113", 	50: "-7.8,-2.0,113", 	51: "-3.3,4.6,113", 	52: "-4.5,6.2,113"
					,53: "-0.3,6.2,113", 	54: "-9.6,-2.0,113", 	55: "-2.7,-1.6,113", 	56: "-3.9,3.2,113"
					,57: "-2.7,6.6,113", 	58: "4.5,2.0,113", 		59: "9.9,4.4,113", 		60: "5.1,1.4,113"
					,61: "9.6,-1.6,113"}

Hemlok_Pattern := {1: "0,5,155", 	2: "0,5,155",  3: "0,5,155"
				  ,4: "0,5,155", 	5: "0,5,155",  6: "0,5,155"
				  ,7: "0,5,155", 	8: "0,5,155",  9: "0,5,155"
				 ,10: "0,5,155", 	11: "0,5,155", 12: "0,5,155"
				 ,13: "0,5,155", 	14: "0,5,155", 15: "0,5,155"
				 ,16: "0,5,155", 	17: "0,5,155", 18: "0,5,155"
				 ,19: "0,5,155", 	20: "0,5,155", 21: "0,5,155"
				 ,22: "0,5,155", 	23: "0,5,155", 24: "0,5,155"
				 ,25: "0,5,155", 	26: "0,5,155", 27: "0,5,155"
				 ,28: "0,5,155", 	29: "0,5,155", 30: "0,5,155"
				 ,31: "0,5,155", 	32: "0,5,155", 33: "0,5,155"
				 ,34: "0,5,155", 	35: "0,5,155", 36: "0,5,155"}

Prowler_Pattern := { 1: "0.0,0.0,35",	2: "-3,8.0,37",		3: "3,8.0,37",		4: "-3,8.0,37",		5: "3,8.0,37"
					,6: "0.0,2.0,255",	7: "-3.5,6.0,37",	8: "4.5,6.0,37",	9: "-3.5,6.0,37",	10: "5,6.0,37"
					,11: "0.0,2.0,255",	12: "-4,5.0,37",	13: "5,5.0,37",		14: "-2,5.0,37",	15: "6,5.0,37"
					,16: "0.0,1.0,255",	17: "-2,4.0,37",	18: "2,4.0,37",		19: "-2,4.0,37",	20: "2,4.0,37"
					,21: "0.0,1.0,255",	22: "-4,4.0,37",	23: "-4,4.0,37",	24: "-4,4.0,37",	25: "-4,4.0,37"
					,26: "-2.0,1.0,255",27: "-3,3.0,37",	28: "-4,3.0,37",	29: "-4,3.0,37",	30: "-4,3.0,37"
					,31: "-2.0,1.0,255",32: "-2,3.0,37",	33: "1,3.0,37",		34: "-2,3.0,37",	35: "1,3.0,37"}

Wingman_Pattern := {   1: "0,0,330", 	2: "0,0,330",  3: "0,0,330"
					  ,4: "0,0,330", 	5: "0,0,330",  6: "0,0,330"
					  ,7: "0,0,330", 	8: "0,0,330",  9: "0,0,330"
					 ,10: "0,0,330", 	11: "0,0,330"}

; ---------- Energy Ammo Weapon ----------

FileRead, VoltPattern, %A_ScriptDir%\Pattern\Volt.txt
Volt_Pattern := []
Loop, Parse, VoltPattern, `n, `, , `" ,`r 
	Volt_Pattern.Insert(A_LoopField)

FileRead, LstarPattern, %A_ScriptDir%\Pattern\Lstar.txt
Lstar_Pattern := []
Loop, Parse, LstarPattern, `n, `, , `" ,`r 
	Lstar_Pattern.Insert(A_LoopField)

Havoc_Pattern := {1: "0.0,0.0,460", 2: "-15,14.8,84", 	3: "-5,14.9,84"
				 ,4: "5,13.4,84", 	5: "5,11.8,84", 	6: "5,11.0,84"
				 ,7: "2,11,84", 	8: "2,14.1,84", 	9: "2,10.1,65"
				 ,10: "-2,5.5,65", 	11: "-2.4,5.2,65", 	12: "-2.2,5,65"
				 ,13: "-2,1.5,65", 	14: "-1,1.2,65", 	15: "-1,1,65"
				 ,16: "-1.,1,65", 	17: "-1.5,0.8,65", 	18: "1.5,0.5,65"
				 ,19: "1.6,0.0,65", 20: "1.8,0.0,65", 	21: "1.8,0.0,65"
				 ,22: "1.8,0.0,65", 23: "1.8,0.0,65", 	24: "1.8,0.0,65"
				 ,25: "1,5,65", 	26: "1.5,5.5,65", 	27: "1.8,6,65"
				 ,28: "1.8,7,65", 	29: "2.5,8,65", 	30: "2.5,10,65"
				 ,31: "2.5,11,65", 	32: "2.5,16,65", 	33: "2.5,16,65"}

FileRead, HavocTurboPattern, %A_ScriptDir%\Pattern\HavocTurbo.txt
HavocTurbo_Pattern := []
Loop, Parse, HavocTurboPattern, `n, `, , `" ,`r 
	HavocTurbo_Pattern.Insert(A_LoopField)

Devotion_Pattern := {1: "0.0,0.0,40", 	2: "0.8,24.5,180", 	3: "0.3,20.0,170"
					,4: "0.3,23.5,140", 5: "2.0,23.2,120", 	6: "3.1,19.5,100"
					,7: "2.8,12.6,85", 	8: "2.8,10.6,85", 	9: "6.2,4.8,85"
					,10: "2.8,6.4,85", 	11: "3.1,5.8,68", 	12: "4.8,7.1,68"
					,13: "5.0,4.4,68", 	14: "6.2,2.3,68", 	15: "7.6,1.8,68"
					,16: "7.0,0.5,68", 	17: "4.2,-1.6,68", 	18: "6.2,1.6,68"
					,19: "-1.4,4.6,68", 20: "0.0,5.3,66", 	21: "-3.9,3.9,66"
					,22: "-4.5,2.3,66", 23: "-4.5,2.5,66", 	24: "-6.7,3.0,66"
					,25: "-7.0,3.0,66", 26: "-3.1,3.2,66", 	27: "1.7,3.7,66"
					,28: "-1.4,4.8,66", 29: "-3.6,4.4,66", 	30: "-5.0,3.5,70"
					,31: "-6.2,2.1,70", 32: "-5.6,-0.5,70", 33: "-5.6,-0.5,70"
					,34: "-4.8,3.7,70", 35: "-4.8,3.7,67", 	36: "-0.8,4.1,67"
					,37: "-2.8,3.5,67", 38: "2.0,3.5,67", 	39: "2.0,3.5,66"
					,40: "-1.4,3.7,67", 41: "-1.4,2.8,67", 	42: "-3.6,1.6,67"
					,43: "-1.4,2.3,67", 44: "0.0,3.0,67", 	45: "3.6,1.8,67"}

DevotionTurbo_Pattern := {	 1: "0.0,0.0,40", 	2: "0.8,24.5,100", 	3: "0.3,20.0,100"
							,4: "0.3,23.5,100", 5: "2.0,23.2,80", 	6: "3.1,19.5,80"
							,7: "3.8,12.6,80", 	8: "4.2,10.6,80", 	9: "5.2,4.8,80"
							,10: "2.8,6.4,85", 	11: "3.1,5.8,68",	12: "4.8,7.1,68"
							,13: "5.0,4.4,68", 	14: "6.2,2.3,68", 	15: "7.6,1.8,68"
							,16: "7.0,0.5,68", 	17: "4.2,-1.6,68",	18: "6.2,1.6,68"
							,19: "-1.4,4.6,68", 20: "0.0,5.3,66", 	21: "-3.9,3.9,66"
							,22: "-4.5,2.3,66", 23: "-4.5,2.5,66", 	24: "-6.7,3.0,66"
							,25: "-7.0,3.0,66", 26: "-3.1,3.2,66", 	27: "1.7,3.7,66"
							,28: "-1.4,4.8,66", 29: "-3.6,4.4,66", 	30: "-5.0,3.5,70"
							,31: "-6.2,2.1,70", 32: "-5.6,-0.5,70", 33: "-5.6,-0.5,70"
							,34: "-4.8,3.7,70", 35: "-4.8,3.7,67", 	36: "-0.8,4.1,67"
							,37: "-2.8,3.5,67", 38: "2.0,3.5,67", 	39: "2.0,3.5,66"
							,40: "-1.4,3.7,67", 41: "-1.4,2.8,67", 	42: "-3.6,1.6,67"
							,43: "-1.4,2.3,67", 44: "0.0,3.0,67", 	45: "3.6,1.8,67"}

; ---------- SPECIAL WEAPON ----------

FileRead, MiniGunPattern, %A_ScriptDir%\Pattern\MiniGun.txt
MiniGun_Pattern := []
Loop, Parse, MiniGunPattern, `n, `, , `" ,`r 
	MiniGun_Pattern.Insert(A_LoopField)

; ---Var Section 2---

Zoom := 1.0/zoom_sens 
Active_Pattern := No_Pattern
ModIfier := 3.40/sens*Zoom

; ---Suspend the script when mouse is showing---

isCursorShown() {
	StructSize := A_PtrSize + 16
	VarSetCapacity(InfoStruct, StructSize)
	NumPut(StructSize, InfoStruct)
	DllCall("GetCursorInfo", UInt, &InfoStruct)
	Result := NumGet(InfoStruct, 8)
	If Result > 1
	Return 1
	Else
	Return 0
}
Loop {
	Sleep 50
	If isCursorShown() == 1
	mice:=1
	Else
	mice:=0
}

; ---Check Weapon---

Check_Weapon(Weapon_Pic) {
    loop, 3 {
        ImageSearch, FoundX, FoundY, 1570, 955, 1720, 1027,*70 %A_ScriptDir%\NewImage\%Weapon_pic%.png
		If (ErrorLevel != 0) {
		Return False
        }
    }
    Return True
}

Detect_Weapon() {
	; Light
	If (Check_Weapon("R99")) {
	Global RapidMode := 0
	Return R99_Weapon
	}
	Else If (Check_Weapon("R301")) {
	Global RapidMode := 0
	Return R301_Weapon
	}
	Else If (Check_Weapon("RE45")) {
	Global RapidMode := 0
	Return RE45_Weapon
	}
	Else If (Check_Weapon("P2020")) {
	Global RapidMode := 1
	Return P2020_Weapon
	}
	Else If (Check_Weapon("G7")) {
	Global RapidMode := 1
	Return G7_Weapon
	}	
	; Heavy
	Else If (Check_Weapon("Flatline")) {
	Global RapidMode := 0
	Return Flatline_Weapon
	}
	Else If (Check_Weapon("Rampage")) {
		If (Check_Weapon("Amp")) {
		Global RapidMode := 0
		Return RampageAmp_Weapon
		}
	Global RapidMode := 0
	Return Rampage_Weapon
	}
	Else If (Check_Weapon("Hemlok")) {
	Global RapidMode := 1
	Return Hemlok_Weapon
	}
	Else If (Check_Weapon("Prowler")) {
	Global RapidMode := 1
	Return Prowler_Weapon
	}
	Else If (Check_Weapon("Wingman")) {
	Global RapidMode := 1
	Return Wingman_Weapon
	}
	; Energy
	Else If (Check_Weapon("Volt")) {
	Global RapidMode := 0
	Return Volt_Weapon
	}
	Else If (Check_Weapon("Lstar")) {
	Global RapidMode := 0
	Return Lstar_Weapon
	}
	Else If (Check_Weapon("Devotion")) {
		If (Check_Weapon("Turbocharge")) {
		Global RapidMode := 0
		Return DevotionTurbo_Weapon
		}
	Global RapidMode := 0
	Return Devotion_Weapon
	}
	Else If (Check_Weapon("Havoc")) {
		If (Check_Weapon("Turbocharge")) {
		Global RapidMode := 0
		Return HavocTurbo_Weapon
		}
	Global RapidMode := 0
	Return Havoc_Weapon
	}
	; Airdrop
	Else If (Check_Weapon("Spitfire")) {
	Global RapidMode := 0
	Return Spitfire_Weapon
	}
	Else If (Check_Weapon("Alternator")) {
	Global RapidMode := 0
	Return Alternator_Weapon
	}
	Else If (Check_Weapon("MiniGun")) {
	Global RapidMode := 0
	Return MiniGun_Weapon
	}
	Global RapidMode := 0
	Return Default_Weapon
}

DetectAndSetWeapon() {
    Sleep 100
    Current_Weapon := Detect_Weapon()
	Active_Pattern := %Current_Weapon%_Pattern
}

key_1:
key_2:
key_1B:
key_2B:
~E Up::
    DetectAndSetWeapon()
Return 

key_3:
Key_G:
	Active_Pattern := No_Pattern
	RapidMode := 0
Return

; ---MouseControl--- 

#If mice = 0
~$*LButton::
if (GetKeyState("RButton") || RapidMode) { 
	Sleep 5
	Loop {
		If (RapidMode) {
		If A_Index < 3
		Click
		Else
		Random, Rand, 1, 2
		If(Rand = 1)
		Click
		Else
		Send % Subshootkey
		}
		X := StrSplit(Active_Pattern[a_index],",")[1]
		Y := StrSplit(Active_Pattern[a_index],",")[2]
		T := StrSplit(Active_Pattern[a_index],",")[3]
		DllCall("mouse_event", UInt, 0x01, UInt, Round(X * modIfier), UInt, Round(Y * modIfier))
		Sleep T
		} until !GetKeyState("LButton","P") || a_index > Active_Pattern.maxindex()
}
Return
#If

; ---End the script---

IniRead:
    IfNotExist, settings.ini
    {
        MsgBox, Couldn't find settings.ini. I'll create one for you.
        IniWrite, "5.0", settings.ini, mouse settings, sens
        IniWrite, "1.0"`n, settings.ini, mouse settings, zoom_sens
	}
	Else {
        IniRead, sens, settings.ini, mouse settings, sens
        IniRead, zoom_sens, settings.ini, mouse settings, zoom_sens
	}
Return

~End::
    ExitApp
Return