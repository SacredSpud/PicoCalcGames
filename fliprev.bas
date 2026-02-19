' Flip/Reverse (C) 2026 by Sacred Potato
' Productions is licensed under
' CC BY-NC-SA 4.0. To view a copy of
' this license, visit
' https://creativecommons.org/licenses/by-nc-sa/4.0/

DefineFont #8
  2820100C 8002C87F 28800228 02288002 80022880 28800228 FC278002 4004843F
  44400444 04444004 40044440 44400444 F8434004 2008021F 82200882 08822008
  20088220 82200882 F0812008 1110010E 01111001 10011110 11100111 01111001
  E0001110 0AA00004 000AA000 A0000AA0 0AA0000A 000AA000 40000AA0 04400004
  00044000 40000440 04400004 00044000 40000440 8E02C87F 288EE228 62288662
  86622886 288F6228 FC2780F2 4C04843F 444CC444 44444444 44444444 444E4444
  F84340E4 2C08021F 82244882 48822448 24488224 82244882 F08120E8 1510010E
  01155001 50011550 15500115 01155001 E0001150 0EA00004 000EE000 E0000EE0
  0EE0000E 000EE000 40000AE0 9F02C87F A8B1FA2B 3AA8811A B8C2298F ABBF022B
  FC2780FA 4E04843F 4551F445 34444114 58C4454E 455F8445 F84340F4 2408021F
  822AE882 28822228 28C88226 822E8882 F08120E8 9F02C87F A8B11A2B 7228871A
  811AA881 A9B11AAB FC2780F2 4E04843F 44511445 E4444E14 41144441 44511445
  F84340E4 4E04843F 44511445 E4444E14 41144441 44511445 F84340E4 2408021F
  8222A882 48822428 22288222 822AA882 F0812048 8702C87F 299BF228 322BB3B2
  83FAABBF 28833228 FC278032 4704843F 455BF444 B4455BB4 43F4455F 44433444
  F8434034 2208021F 822E6882 E8822EE8 26E8822E 82266882 F0812068 BF02C87F
  2BB0FAAB F22BB002 811AA89F A9BF1AAB FC2780F2 5F04843F 4558F445 E4455884
  4334445F 445F3445 F84340E4 2E08021F 8228E882 E8822888 2228822E 822E2882
  F08120E8 2E08021F 8228E882 E8822888 2228822E 822E2882 F08120E8 9F02C87F
  ABB1FA2B F22BB002 B11AABBF A9BF1AAB FC2780F2 4E04843F 4559F445 F4455884
  5BB4455F 445FB445 F84340E4 2E08021F 822AE882 E8822888 2AA8822E 822EA882
  F08120E8 BF02C87F A8B11AAB 62288332 8CC22886 288CC228 FC2780C2 5F04843F
  445BB445 64444334 4CC44446 444CC444 F84340C4 2E08021F 822EE882 68822668
  2CC88226 822CC882 F08120C8 9F02C87F ABB1F229 E2A8B11A B11A2B8E 299F1AAB
  FC2780F2 4E04843F 455BE444 E4445BB4 5BB4454E 444EB445 F84340E4 2E08021F
  822AE882 E8822AA8 2AA8822E 822EA882 F08120E8 9F02C87F ABB1FA2B FAABB11A
  811AA89F A9BF1AAB FC2780F2 4E04843F 455BF445 F4455FB4 4114444F 445F1445
  F84340E4 2E08021F 822AE882 E8822EA8 2228822E 822E2882 F08120E8 8E02C87F
  ABB1F229 1AABB11A B11AABB1 289F1AAB FC2780E2 4E04843F 455BF445 B4455BB4
  5BB4455B 445FB445 F84340E4 2E08021F 822EE882 A8822AE8 2AA8822A 822EE882
  F08120E8
End DefineFont

DefineFont #12
  02201020 00000001 00000003 00000007 FFFFFF0F FFFFFF1F FFFFFF3F FFFFFF7F
  FFFFFFFF FFFFFFFF FFFFFF7F FFFFFF3F FFFFFF1F FFFFFF0F 00000007 00000003
  00000001 80000000 C0000000 E0000000 F0FFFFFF F8FFFFFF FCFFFFFF FEFFFFFF
  FFFFFFFF FFFFFFFF FEFFFFFF FCFFFFFF F8FFFFFF F0FFFFFF E0000000 C0000000
  80000000
End DefineFont

DefineFont #10
  5F200808
  0403000001060404
  06F90000FF000000
  20C00000C0202020
  0000000000008000
  0000000000FF00FF
  0000000000000100
End DefineFont

Data 262,262,294,262,330,330,349,330,392,392,440,392,494,523,523,523,587,659,659,659,699,784,784,784,880,1046
Data 988,1046,1046,1318,1318,1318,1174,294,1046,294,988,392,880,392,784,494,698,494,660,587,588,587,523,784,494,784
Data 440,988,392,988,349,1174,330,1174,294,1568,262,1568,220,349,247,349,262,440,294,440,330,523,350,523,392,699
Data 440,699,494,392,523,392,587,494,659,494,699,587,784,587,880,784,988,784,1046,523,784,523,660,659,524,659
Data 784,784,660,784,524,1046,392,1046,523,1318,392,1318,330,1568,262,1568,196,2092,165,2092,131,2636,98,2636
Data 0,0

Sub DrawNumbers
  For t=1 To 10
    If newgame=1 Then
      For j=3 To 1 Step -1
        Text 18+(t*24),100,Mid$(flipseq$(Val(Mid$(sequence$,t,1))),j,1),,8,2,cc(t)
        Pause 50
      Next j
    Else
      Text 18+(t*24),100,Left$(flipseq$(Val(Mid$(sequence$,t,1))),1),,8,2,cc(t)
    End If
  Next
  newgame=0
End Sub

Sub easymode
  If easy=1 Then
    easy=0
    Text 0,0,"         ",,7,,RGB(white)
  Else
    easy=1
    Text 0,0,"Easy mode",,7,,RGB(cyan)
  End If
End Sub

Sub PlayMusic
  Read lc, rc
  If lc=0 And rc=0 Then Restore :Read lc, rc
  Play tone lc,rc,200
End Sub

Dim compliment$(8),flipseq$(9),numleft(10),cc(10)
flipseq$(0)="EFG"
flipseq$(1)="&'("
flipseq$(2)="+,-"
flipseq$(3)="./1"
flipseq$(4)="234"
flipseq$(5)="567"
flipseq$(6)="9:;"
flipseq$(7)="<=>"
flipseq$(8)="?@A"
flipseq$(9)="BCD"
cc(1)=RGB(red)
cc(2)=RGB(orange)
cc(3)=RGB(gold)
cc(4)=RGB(yellow)
cc(5)=RGB(green)
cc(6)=RGB(cyan)
cc(7)=RGB(blue)
cc(8)=RGB(cobalt)
cc(9)=RGB(magenta)
cc(10)=RGB(pink)
compliment$(1)="Nice job"
compliment$(2)="Congrats"
compliment$(3)="Very nice"
compliment$(4)="Good job"
compliment$(5)="Good work"
compliment$(6)="Excellent"
compliment$(7)="Nice"
compliment$(8)="Nice work"

pdir=5
logo$="   !"+Chr$(34)+"*%*"+Chr$(34)+"!"
Randomize Timer

curcol=2
MusicPointer=0
cycle=1

CLS
Text 15,10,"FLIP/REVERSE",,2,2,RGB(white)
Text 76,200,"Press any key to play.",,,,RGB(white)
Text 8,220,"Pressing E at any time is frowned upon",,,,RGB(white)
Text 0,240,"   but will result in an easier game.",,,,RGB(white)
Text 30,272,"%$#",,10,2,RGB(yellow)
Text 30,288," !"+Chr$(34),,10,2,RGB(brown)
Text 78,288,"Sacred Potato Productions",,1,,RGB(white)
Text 80,304,"Some rights reserved.",,1,,RGB(white)

Do
  Text 44,100,logo$,,8,2,cc(curcol))
  logo$=Right$(logo$,9)+Left$(logo$,1)
  i$=Inkey$
  If cycle=1 Then PlayMusic
  cycle=-cycle
  Pause 20
  curcol=curcol+2
  If curcol=11 Then curcol=2
  If curcol=12 Then curcol=1
  If Left$(logo$,2)="  " Then backatstart=1
Loop Until i$<>"" And backatstart=1

If LCase$(i$)="e" Then easymode

For t=1 To 10
  logo$=" "+Left$(logo$,9)
  Text 44,100,logo$,,8,2,RGB(white)
  Play tone t*100,t*50,40
  Pause 40
Next
Do
  Box 0,275,320,45,,RGB(black),RGB(black)
  newgame=1
  Sequence$=""
  For t=0 To 9:numleft(t+1)=t:Next :numbersleft=10
  For t=1 To 10
    nextnum=Int(Rnd*numbersleft)+1
    sequence$=sequence$+Str$(numleft(nextnum))
    For j=nextnum+1 To numbersleft
      numleft(j-1)=numleft(j)
    Next
    numbersleft=numbersleft-1
  Next

  Text 0,200,"  Put the numbers in order from 0 to 9",,1,,RGB(white)
  Text 0,220,"  Pressing  a  number will reverse the",,1,,RGB(white)
  Text 0,240,"  numbers from that  digit to the end.",,1,,RGB(white)

  For t=1 To 10
    i$=Inkey$
  Next

  Do
    DrawNumbers
    If easy=0 Then
      If moves Mod 2 Then
        arrow$=" "
        dir=1
      Else
        arrow$="!"
        dir=-1
      End If
    Else
      arrow$="!"
      dir=-1
    End If
    Text 144,150,arrow$,,12,1,RGB(white)
    Do
      i$=Inkey$
      b=Instr(sequence$,i$)
      If LCase$(i$)="e" Then easymode
    Loop Until b>0 Or i$=Chr$(27)
    If i$=Chr$(27) Then CLS :End
    If easy=1 Or (moves Mod 2)=0 Then
      If b>1 Then upto$=Left$(sequence$,b-1) Else upto$=""
      work$=Mid$(sequence$,b,11-b)
      f=1
      l=10
    Else
      If b<10 Then upto$=Right$(sequence$,10-b) Else upto$=""
      work$=Left$(sequence$,b)
      f=10
      l=1
    End If
    rev$=""
    For t=Len(work$) To 1 Step -1
      rev$=rev$+Mid$(work$,t,1)
    Next
    If dir=-1 Then
      newseq$=upto$+rev$
    Else
      newseq$=rev$+upto$
    EndIf
    lastflip$=""
    For t=f To l Step -dir
      If dir=-1 Then
        If t+1>b Then goodtogo=1 Else goodtogo=0
      Else
        If t-1<b Then goodtogo=1 Else goodtogo=0
      End If
      If goodtogo=1 Then
        Play tone t*150,t*190,50
        currentflip$=flipseq$(Val(Mid$(sequence$,t,1)))
        For j=1 To 3
          If lastflip$<>"" Then
            Text 18+((t+dir)*24),100,Mid$(lastflip$,j,1),,8,2,cc(t+dir)
          End If
          lettr$=Mid$(flipseq$(Val(Mid$(newseq$,t,1))),j,1)
          nextflip$=lettr$+nextflip$
          Text 18+(t*24),100,Mid$(currentflip$,j,1),,8,2,cc(t)
          Pause pdir
        Next
        Text 18+(t*24),100,"*",,8,2,cc(t)
        Pause pdir
        Text 18+(t*24),100,"%",,8,2,cc(t)
        Pause pdir
        Text 18+(t*24),100,"*",,8,2,cc(t)
        Pause pdir
        lastflip$=nextflip$
        nextflip$=""
      End If
    Next
    Play tone t*150,t*190,50
    Moves=Moves+1
    sequence$=newseq$
    score$=" Moves: "+Str$(moves)+" "
    slen=Len(score$)*4
    Text 160-slen,280,score$,,1,,RGB(yellow)
  Loop Until sequence$="0123456789" Or i$=Chr$(27)

  Text 144,150,"*",,12,1
  DrawNumbers
  For t=1 To (2*slen)+10
    Pixel t+(155-slen),275,RGB(pink)
    Pause 1
  Next

  For j=276 To 295
    Pixel t+(155-slen),j,RGB(pink)
    Pause 2
  Next

  For t=t-1 To 1 Step -1
    Pixel t+(155-slen),296,RGB(pink)
    Pause 1
  Next

  For j=295 To 276 Step -1
    Pixel 155-slen,j,RGB(pink)
    Pause 1
  Next

  endmsg$=compliment$(Int(Rnd*7)+1)+"! Press a key to play again."
  Text 160-(Len(endmsg$)*4),307,endmsg$,,,,RGB(white)
  For t=1 To 10
    i$=Inkey$
  Next
  Restore
  Do
    PlayMusic
    Pause 80
    i$=Inkey$
  Loop Until i$<>""
  If LCase$(i$)="e" Then easymode
  If i$=Chr$(27) Then CLS :End
  Box 0,275,320,45,,RGB(black),RGB(black)
  moves=0
Loop
