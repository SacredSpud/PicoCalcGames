' Greed (C) 2026 by Sacred Potato
' Productions is licensed under
' GNU General Public License v3.0
' To view a copy of this license, visit
' https://www.gnu.org/licenses/gpl-3.0.en.html

DefineFont #9
  5F200808
  0403000001060404
  06F90000FF000000
  20C00000C0202020
  0000000000008000
  0000000000FF00FF
  0000000000000100
End DefineFont

DefineFont #8
  04203220 E0FFFF00 F8FFFF01 FEFFFF01 FEFFFF03 FFFFFF03 FFFFFF07 FFFFFF07
  FFFFFF0F FFFFFF0F FFFFFF1F FFFFFF1F FFFFFF3F FFFFFF3F FFFFFF3F FFFFFF3F
  FFFFFF3F 03F0FF3F 00C0FF3F FC8FFF3F FF9FFF3F FF9FFF3F FF9FFF3F FF9FFF3F
  FF9FFF3F FF9FFF3F FF80FF3F 7FE0FF3F 7FFEFF3F FFFFFF3F FFFFFF3F FFFFFF3F
  FFFFFF3F FFFFFF3F FFFFFF3F FFFFFF3F FFFFFF3F FFFFFF3F FFFFFF3F FFFFFF3F
  FFFFFF3F FFFFFF3F FFFFFF3F FFFFFF3F FFFFFF3F FFFFFF3F FFFFFF3F FFFFFF3F
  FFFFFF3F 7EFFFF1F 3CFEFF0F 80FFFF0F E0FFFF1F F0FFFF1F F8FFFF3F FCFFFF3F
  FCFFFF3F FEFFFF3F FFFFF03F FF3FF03F FF1FF03F FF1FF03F FF1FF03F FF1FF03F
  FF1FF03F FF1FF03F FF1FF03F FE3FF03F FEFFF03F FEFFFF3F FCFFFF3F F8FFFF3F
  F0FFFF3F E0FFFF3F C0FFFF3F 80FFFF3F 00FFFF3F 00FEFF3F 00FCFF3F 00FCFF3F
  00FEFF3F 00FFFF3F 80FFFF3F C0FFFF3F E0FFFF3F F0FFFF3F F8FFFF3F FCFFFF3F
  FEFFFF3F FFFFFF3F FFFFF93F FFFFF83F FF7FF83F FF3FF83F FF1FF83F FF0FF83F
  FF07F83F FF03F83F FF01F83F FE00F81F 7C00F00F FEFFFF00 FFFFFF01 FFFFFF01
  FFFFFF03 FFFFFF03 FFFFFF07 FFFFFF07 FFFFFF0F FEFFFF0F 00FCFF1F 00F8FF1F
  00F8FF3F 00F8FF3F 00F8FF3F 00F8FF3F 00F8FF3F 00F8FF3F 00FCFF3F FEFFFF3F
  FFFFFF3F FFFFFF3F FFFFFF3F FFFFFF3F FFFFFF3F FFFFFF3F FEFFFF3F 00FCFF3F
  00F8FF3F 00F8FF3F 00F8FF3F 00F8FF3F 00F8FF3F 00F8FF3F 00F8FF3F 00FCFF3F
  FEFFFF3F FFFFFF3F FFFFFF3F FFFFFF3F FFFFFF3F FFFFFF3F FFFFFF3F FFFFFF3F
  FFFFFF3F FFFFFF3F FFFFFF3F FFFFFF3F FFFFFF3F FEFFFF1F FCFFFF0F 80FFFF0F
  E0FFFF1F F0FFFF1F F8FFFF3F FCFFFF3F FCFFFF3F FEFFFF3F FFFFFF3F FFFFFF3F
  FFFFFF3F FFFFFF3F FFFFFF3F FFFFFF3F FFFFFF3F FFFFFF3F FFFFFF3F FFFFF03F
  FF3FF03F FF1FF03F FF1FF03F FF1FF03F FF1FF03F FF1FF03F FF1FF03F FF1FF03F
  FF3FF03F FFFFF03F FFFFFF3F FFFFFF3F FFFFFF3F FFFFFF3F FFFFFF3F FFFFFF3F
  FFFFFF3F FFFFFF3F FFFFFF3F FFFFFF3F FFFFFF3F FFFFFF3F FFFFFF3F FFFFFF3F
  FFFFFF3F FFFFFF3F FFFFFF3F FFFFFF3F FFFFFF3F FFFFFF3F FFFFFF3F FEFFFF1F
  FCFFFF0F
End DefineFont

Sub BadMove
  If i$<>"p" And i$<>Chr$(145) Then
    Text (x-1)*8,(y-1)*12,Chr$(135),,,,RGB(rust)
    Play tone 440,220,100
    Pause 100
    Play tone 92.5,370,100
    Pause 100
  End If
End Sub

Sub CheckPath
  bad=0
  If y+newy>0 And y+newy<27 And x+newx>0 And x+newx<41 Then
    p=n(y+newy,x+newx)
    If p=0 Then
      bad=1
    Else
      For t=1 To p
        If y+(t*newy)>0 And y+(t*newy)<27 And x+(t*newx)>0 And x+(t*newx)<41 Then
          If n(y+(t*newy),x+(t*newx))=0 Then
            bad=2
          Else
            If DoHiLite=1 Or DoHiLite=2 Then
              Select Case DoHiLite
                Case 1
                  Text (x+(t*newx)-1)*8,(y+(t*newy)-1)*12,Str$(n(y+(t*newy),x+(t*newx))),,,,colr(n(y+(t*newy),x+(t*newx))),RGB(white)
                Case 2
                  Text (x+(t*newx)-1)*8,(y+(t*newy)-1)*12,Str$(n(y+(t*newy),x+(t*newx))),,,,colr(n(y+(t*newy),x+(t*newx))),RGB(black)
              End Select
            End If
          End If
        Else
          bad=4
        End If
      Next
    End If
  Else
    bad=6
  End If
  If DoHilite=1 Then DoHiLite=0
End Sub

Sub CheckDangerZone
  dz=0
  If tx(t)>7 And tx(t)<33 Then dz=1
  If ty(t)>10 And ty(t)<16 Then dz=dz+1
End Sub

Sub PlacePiece
  Do
    tx(t)=Int(Rnd*40)+1
    ty(t)=Int(Rnd*22)+1
    CheckDangerZone
  Loop Until dz<2
  tsx(t)=1
  tsy(t)=1
  If tx(t)>20 Then tsx(t)=-tsx(t)
  If ty(t)>11 Then tsy(t)=-tsy(t)
  tv(t)=Int(Rnd*9)+1
  Text (tx(t)-1)*8,(ty(t)-1)*12,Str$(tv(t)),,,,colr(tv(t))
End Sub

Sub PickMusic
  St=St+1
  If st=17 Then St =1
  If st=1 Or st=3 Or st=5 Then PlayQueue$="660|330 X 880|330 X 1046|330 X 1318|330 X 1760|440 X 1318|440 X 1046|440 X 880|440 X "
  If st=2 Or st=6 Then PlayQueue$="622|311 X 784|311 X 932|311 X 1244|311 X 1568|311 X 1244|311 X 932|311 X 784|311 X "
  If st=4 Or st=8 Then PlayQueue$="622|466 X 784|466 X 932|466 X 1244|466 X 1568|466 X 1244|466 X 932|311 X 784|466 X "
  If st=9 Or st=11 Or st=13 Or st=15 Then PlayQueue$="698|554 X 932|554 X 1108|554 X 1398|554 X 1864|466 X 1398|466 X 1108|466 X 932|466 X "
  If st=10 Or st=14Then PlayQueue$="660|440 X 880|440 X 1046|440 X 1318|400 X 1760|440 X 1318|440 X 1046|440 X 880|440 X "
  If st=12 Or st=15 Then PlayQueue$="660|659 X 880|659 X 1046|659 X 1318|659 X 1760|659 X 1318|659 X 1046|659 X 880|659 X "
End Sub

Sub PlayMusic
  If playqueue$="" Then PickMusic
  Do
    Pause PauseIncrement
    CurrentPause=CurrentPause+PauseIncrement
    If CurrentPause>=NoteLength Then
      If CurrentNote$<>"" And CurrentLength<NoteLength Then
        If freqx<>0 Then Play Tone FreqX,FreqY,200
        CurrentLength=CurrentLength+PauseLength
      Else
        CurrentNote$=""
        CurrentLength=0
        If PlayQueue$<>"" Then
          currentnote$=Left$(PlayQueue$,Instr(PlayQueue$," "))
          playqueue$=Mid$(PlayQueue$,Len(currentNote$)+1,Len(PlayQueue$))
          Select Case CurrentNote$
            Case "0 "
              FreqX=0
              FreqY=0
            Case "X ","- "
            Case Else
              freqx=Val(currentnote$)
              If Instr(CurrentNote$,"|")<>0 Then
                freqy=Val(Mid$(Currentnote$,Instr(CurrentNote$,"|")+1,Len(CurrentNote$)))
              Else
                FreqY=FreqX
          End Select
          If FreqX<>0 Or CurrentNote$="X " Then
            Play tone freqx,freqy,200
          Else
            If CurrentNote$="- " Then Play tone 0,0,NoteLength*3
          End If
        End If
      End If
    End If
  Loop Until CurrentPause>=PauseLength
  CurrentPause=0
  End If
End Sub

Sub DrawLogo
  Text 80,125," ",,8,,RGB(pink)
  Text 112,125,"!",,8,,RGB(yellow)
  Text 144,125,Chr$(34),,8,,RGB(white)
  Text 176,125,Chr$(34),,8,,RGB(cyan)
  Text 208,125,"#",,8,,RGB(green)
End Sub

Sub ShowHelp
  Box 0,60,319,212,,RGB(black),RGB(black)
  Text 0,68,""
  Color RGB(red)
  Print "  ==========";
  Color RGB(white)
  Print "How to Play Greed";
  Color RGB(red)
Print "========="
  Color RGB(white)
  Print " Your goal is to eat as many numbers as"
  Print "  possible. Moving in a direction eats"
  Print " the same number of digits as the first"
  Print "  digit in that direction. You may not"
  Print "move onto or through a blank space.  The"
  Print " game ends when  no valid moves remain."
  Print
  Print " You can move using the arrow keys, but"
  Print "diagonal moves will be required so it is"
  Print "suggested that you use one of these sets"
  Print "    of keys instead:   qwe    yju"
  Print "                       a d    h l"
  Print "                       zxc    bkn"
  Print "  Pressing P will toggle highlighting"
  Print "           of available moves."
  Do
    i$=Inkey$
  Loop Until i$<>""
  Text 0,0,""
  For xx=1 To 26
    For yy=1 To 40
      Color colr(n(xx,yy))
      Print Str$(n(xx,yy));
    Next
  Next
End Sub

Dim n(26,40),colr(9)
Dim tx(25),ty(25),tv(25),tsx(25),tsy(25)
colr(1)=RGB(blue)
colr(2)=RGB(red)
colr(3)=RGB(lightgray)
colr(4)=RGB(magenta)
colr(5)=RGB(cyan)
colr(6)=RGB(gold)
colr(7)=RGB(green)
colr(8)=RGB(orange)
colr(9)=RGB(pink)
NoteLength=10
PauseLength=10
PauseIncrement=10

Randomize Timer
CLS
For t=1 To 25
  PlacePiece
Next


  Text 30,272,"%$#",,9,2,RGB(yellow)
  Text 30,288," !"+Chr$(34),,9,2,RGB(brown)
  Text 78,288,"Sacred Potato Productions",,1,,RGB(white)
  Text 80,304,"Some rights reserved.",,1,,RGB(white)
  DrawLogo
Do
  For t=1 To 25
    Text (tx(t)-1)*8,(ty(t)-1)*12," "
    tx(t)=tx(t)+tsx(t)
    ty(t)=ty(t)+tsy(t)
    If (tsx(t)>0 And tx(t)>20) Or (tsx(t)<0 And tx(t)<20) Or (tsy(t)>0 And ty(t)>13) Or (tsy(t)<0 And ty(t)<13) Then
      PlacePiece
    Else
      CheckDangerZone
      If dz>1 Then PlacePiece Else Text (tx(t)-1)*8,(ty(t)-1)*12,Str$(tv(t)),,,,colr(tv(t))
    End If
  Next
  PlayMusic
  i$=Inkey$
Loop While i$=""

Do
CLS
For xx=1 To 26
  For yy=1 To 40
    n(xx,yy)=Int(Rnd*9)+1
    Color colr(n(xx,yy))
    Print Str$(n(xx,yy));
  Next
Next
gameover=0
score=0
Hilite=-1
DoHilite=0
x=Int(Rnd*3)+1
y=Int(Rnd*3)+1
If Rnd>.5 Then
  x=0+x
Else
  x=41-x
End If
If Rnd>.5 Then
  y=0+y
Else
  y=27-y
End If
n(y,x)=0
Text 0,311,"Score: 0       0% complete",,7,,RGB(white)
Text 254,311,"F1 for Help",,7,,RGB(white)
Do
  bad=0
  AvailablePaths=0
  j$=""
  If x>1 Then
    newx=-1
    newy=-1
    CheckPath
    If Bad=0 Then AvailablePaths=1: If HiLite=1 Then DoHilite=1:CheckPath
    newy=0
    CheckPath
    If Bad=0 Then AvailablePaths=1: If HiLite=1 Then DoHilite=1:CheckPath
    If y<26 Then
      newy=1
      CheckPath
      If Bad=0 Then AvailablePaths=1: If HiLite=1 Then DoHilite=1:CheckPath
    End If
  End If
  If x<40 Then
    newx=1
    newy=-1
    CheckPath
    If Bad=0 Then AvailablePaths=1: If HiLite=1 Then DoHilite=1:CheckPath
    newy=0
    CheckPath
    If Bad=0 Then AvailablePaths=1: If HiLite=1 Then DoHilite=1:CheckPath
    If y<26 Then
      newy=1
      CheckPath
      If Bad=0 Then AvailablePaths=1: If HiLite=1 Then DoHilite=1:CheckPath
    End If
  End If
  newx=0
  If y>1 Then
    newy=-1
    CheckPath
    If Bad=0 Then AvailablePaths=1: If HiLite=1 Then DoHilite=1:CheckPath
  End If
  If y<26 Then
    newy=1
    CheckPath
    If Bad=0 Then AvailablePaths=1: If HiLite=1 Then DoHilite=1:CheckPath
  End If
  Text (x-1)*8,(y-1)*12,Chr$(135),,,,RGB(yellow)
  If AvailablePaths<>0 Then
    Do
      i$=LCase$(Inkey$)
    Loop Until i$<>""

  If HiLite=1 Then
    DoHilite=2
    If x>1 Then
      newx=-1
      newy=-1
      CheckPath
      newy=0
      CheckPath
     If y<26 Then
        newy=1
        CheckPath
      End If
    End If
    If x<40 Then
      newx=1
      newy=-1
      CheckPath
      newy=0
      CheckPath
      If y<26 Then
        newy=1
        CheckPath
      End If
    End If
    newx=0
    If y>1 Then
      newy=-1
       CheckPath
    End If
    If y<40 Then
      newy=1
      CheckPath
    End If
  End If
  DoHiLite=0
  Bad=0
  newx=0
  newy=0
  Select Case i$
    Case Chr$(128),"w","k"
      If y>1 Then
        newy=-1
        newx=0
      Else
        bad=1
      End If
    Case Chr$(129),"x","j"
      If y<26 Then
        newy=1
        newx=0
      Else
        bad=1
      End If
    Case Chr$(130),"a","h"
      If x>1 Then
        newy=0
        newx=-1
      Else
        bad=1
      End If
    Case Chr$(131),"d","l"
      If x<40 Then
        newy=0
        newx=1
      Else
        bad=1
      End If
    Case "q","y"
      If x>1 And y>1 Then
        newx=-1
        newy=-1
      Else
        bad=1
      End If
    Case "e","u"
      If x<40 And y>1 Then
        newx=1
        newy=-1
      Else
        bad=1
      End If
    Case "z","b"
      If x>1 And y<26 Then
        newx=-1
        newy=1
      Else
        bad=1
      End If
    Case "c","n"
      If x<40 And y<26 Then
        newx=1
        newy=1
      Else
        bad=1
      End If
    Case Chr$(27)
      CLS :End
    Case "p"
      HiLite=-HiLite
      newx=0
      newy=0
    Case Chr$(145)
      ShowHelp
  End Select
  If bad=0 Then
    CheckPath
    If bad<>0 Then
      BadMove
    Else
      For t=1 To p
        score=score+n(y+(t*newy),x+(t*newx))
        n(y+(t*newy),x+(t*newx))=0
        Text (x+(t*newx)-1)*8,(y+(t*newy)-1)*12," "
        compl=compl+1
      Next
      Text (x-1)*8,(y-1)*12," "
      x=x+(p*newx)
      y=y+(p*newy)
      comp$=Mid$(Str$((compl/1000)*100),1,4)
      Text 0,311,"Score: "+Str$(score)+"       "+comp$+"% complete",,7,,RGB(white)
    End If
  Else
    BadMove
  End If
Else
  gameover=1
End If
Loop Until gameover=1
  DrawLogo
  scoreline$=" Score: "+Str$(score)+" "
  nextline$=" "+comp$+"% Complete "
  Box 90,190,140,54,,RGB(black),RGB(black)
  Text 160-(4*Len(scoreline$)),200,scoreline$,,,,RGB(white)
  Text 160-(4*Len(nextline$)),220,nextline$,,,,RGB(white)
  Box 0,311,319,8,,RGB(black),RGB(black)
  st=0
  PlayQueue$=""
  For t=1 To 200
    i$=Inkey$
  Next
  Do
    Pause 60
    PlayMusic
    i$=Inkey$
  Loop Until i$<>""
Loop
