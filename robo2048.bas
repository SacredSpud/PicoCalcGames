' RoboWorld 2048 (C) 2025 by Sacred Potato
' Productions is licensed under
' GNU General Public License v3.0 
' To view a copy of this license, visit
' https://www.gnu.org/licenses/gpl-3.0.en.html


DefineFont #8
  5F200808
  0403000001060404
  06F90000FF000000
  20C00000C0202020
  0000000000008000
  0000000000FF00FF
  0000000000000100
End DefineFont

DefineFont #9
  1E201010
  0000000000000000000000000000000000000000000000000000000000000000
  E007C003E007A0051E78FC3F524A9669124992481248D24BE187F5AF300C2244
  A005C003E007E0071E78FC3F524A566A5248D24B12485248E187F5AF300C2244
  E007C003E007A0051E78FC3F524A9669524A924912489249E187F5AF300C2244
  E007C003A005E0070E70FC3F824C66649244E2440240624EE187F5AF300C2244
  E007C003E007A0050240FC3F4A52324C2252124402407A4CE187F5AF300C2244
  E007C003E007A0060E70FC3F5248566612497A4E02401246E187F5AF300C2244
  E007C003E00760050660FC3FAA5A12492A4992480240D25FE187F5AF300C2244
  E007C003A005E0070660FC3F2255D2496A48B2450240D25DE187F5AF300C2244
  E007C003A005A0050660FC3FAA51925C92448A580240BA5CE187F5AF300C2244
  A007C003A004A0040240FC3FAA6A4A24422A2E2A05A0E374E187F5AF300C2244
  22892108002124490606000009990969A940A6262600E9F09424A01011049244
  F81FF00FE427F42FC6638241FDBFEFF7ABD5FBDF0E70A665781E5C3AE007F00F
  C0078003C006400500018003E00FC007B01BB01BC0079013C006C006E00EC006
  C0078003C007C00700018003E00FC007B01BB01BC0079013C006C006E00EC006
  C0078003E007400700018003800680037006C00D8007900380038007C0038003
  E003C001E007E0028000C0016001C001600EB003E001C009C001E001C003C001
  D2029100FC1FFC27FC7FFFDFFE7FFE1FFE1FFF1FFC7FFC3F543B789F08001241
  048207FE048204820482048284FF048284E384E384E384E384E384E387E384E3
  38043FFC38043804380438043F1C3804381C381C381C381C381C381C3FFC381C
  0181FF81018101810181018107E10181072107210721072107210721FFE10721
  3A0E3A0E3A0E3A0E020E3A0E020E020E220E020E520E220E860E8A0E020E020F
  1010F01F101010101010101070101010701070107010701070107010F01F7010
  028202FE028202820282028283FF028287E387E387E387E387E387E387E387E3
  E200FC00E000E100E000E000E000E000E000E000E000E000E100E000FCF0E200
  0000000000800000008000800080008000800080008000800000008000000000
  0420FC1FC88F044020E1909080044002001200093C4800240480C48FFCFF0480
  94029C01940A9404942694129792944A9F4A9092801280268004800880018002
  41503E70A2509C509C50A25022DC415041DC2204A2509C509C50A2503E704150
  0000000000800080008000800000000000000000008000800080008000000000
End DefineFont

Data "494 X X X 370 X X 0 30 X X X 494 X X X 740 X X X X X X X X X X X "
Data "0 0 247 X X X 185 X X 0 185 X X X 247 X X X 370 X X X X X X X X X X X X X X "
Data "494 X X X 370 X X 0 370 X X X 494 X X X 740 X X X X X X X X X X X 0 0 0 "
Data "494|494 X X X 370|370 X X X 370|370 X X X 494|494 X X X 392|587 X X X X X X X 370|554 X X X X X X X "
Data "587|587 X X X 494|494 X X X 0 0 0 0 587|587 X X X 494|494 X X X 0 0 0 0 587|587 X X X "
Data "494|494 X X X 0 0 0 0 587|587 X X X 494|494 X X X 0 0 0 0 554|554 X X X 440|440 X X X "
Data "554|554 X X X 0 0 0 0 587|587 X X X 494|494 X X X 0 0 0 0 587|587 X X X 494|494 X X X 0 0 0 0 "
Data "587|587 X X X 494|494 X X X 0 0 0 0 587|587 X X X 740|554 X X X 659|587 X X X 554|740 X X X X X X X "
Data "440|659 X X X X X X X 587|587 X X X 494|494 X X X 0 0 0 0 587|587 X X X 494|494 X X X 0 0 0 0 "
Data "587|587 X X X 494|494 X X X 0 0 0 0 587|587 X X X 494|494 X X X 0 0 0 0 554|554 X X X 440|440 X X X "
Data "554|554 X X X 0 0 0 0 587|587 X X X 494|494 X X X 0 0 0 0 587|587 X X X 494|494 X X X 0 0 0 0 "
Data "587|587 X X X 494|494 X X X 0 0 00 587|587 X X X 740|554 X X X 659|587 X X X 554|740 X X X X X X X 440|659 X X X X X X X "
Data "247|494 X X X X X X X 370 X X 0 370 X 0 370 X X 370|587 X X X X X X X "
Data "247|494 X X X 466 X X X 370 X X X 466 X X X 370|370 X X X 554|554 X X X 370 X X X "
Data "466|466 X X X 554 X X X 247|494 X X X X X X X 370 X X 0 370 X X 0 370 X X X 370|587 X X X X X X X "
Data "247|494 X X X 466|466 X X X 370 X X X 466 X X X 370|370 X X X 554|554 X X X 370 X X X "
Data "466|466 X X X 554 X X X X X 494|587 X X X X X X X 494|49 X X X 370 X X X X X 587|370 X X X X X X X "
Data "494|294 X X X X X X X 466|554 X X X X X X X 466 X X X 370 X X X X X 554|370 X X X X X X X "
Data "466|277 X X X X X X X 494|587 X X X X X X X 494|49 X X X 370 X X X X X 587|370 X X X X X X X "
Data "494|294 X X X X X X X 466|554 X X X X X X X 466 X X X 370 X X X X X X 554|370 X X X X X X X 466|277 X X X X X X X "
Data "!"

Randomize Timer
NumRobots=32
CurrentRobot=0
Dim RobotX(NumRobots)
Dim RobotY(NumRobots)
Dim RobotType(NumRobots)
Dim Moved(NumRobots)
Dim RobotColor(11)
Dim XDir(NumRobots),YDir(NumRobots)
Dim Grid(21,21)
Dim TeleportX(20),TeleportY(20)
IvanLimit=5
NoteLength=20
PauseLength=30
PauseIncrement=10
RobotColor(1)=RGB(lightgray)
RobotColor(2)=RGB(gold)
RobotColor(3)=RGB(cyan)
RobotColor(4)=RGB(blue)
RobotColor(5)=RGB(green)
RobotColor(6)=RGB(magenta)
RobotColor(7)=RGB(orange)
RobotColor(8)=RGB(beige)
RobotColor(9)=RGB(yellow)
RobotColor(10)=RGB(pink)
RobotColor(11)=RGB(red)

Sub center
  margin=160-((Len(Msg$)*8)/2)
End Sub

Sub PlayMusic
  Do
    Pause PauseIncrement
    CurrentPause=CurrentPause+PauseIncrement
    If CurrentPause>=NoteLength Then
      If CurrentNote$<>"" And CurrentLength<NoteLength Then
        If freqx<>0 Then Play Tone FreqX,FreqY,NoteLength*2
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
            Play tone freqx,freqy,NoteLength*3
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

Sub Combine
  RobotType(Grid(RobotX(t)+CXDir,RobotY(t)+CYDir))=RobotType(Grid(RobotX(t)+CXDir,RobotY(t)+CYDir))+1
  Score=Score+(2^RobotType(t))
  Text (RobotX(t)-1)*16,(RobotY(t)-1)*16," ",,9,1,RobotColor(RobotType(t))
  Text (RobotX(t)+CXDir-1)*16,(RobotY(t)+CYDir-1)*16,Chr$(32+RobotType(t)),,9,1,RGB(white)
  Grid(RobotX(t),RobotY(t))=0
  RobotType(t)=0
  Pause 100
  Text (RobotX(t)+CXDir-1)*16,(RobotY(t)+CYDir-1)*16,Chr$(32+RobotType(t)),,9,1,RobotColor(RobotType(t)),RGB(black)
  Moved(t)=1
End Sub

Sub NewBot
  CurrentRobot=CurrentRobot+1
  Do
    If CurrentRobot=2 Then CurrentRobot=0
    RobotX(t)=Int(Rnd*20)+1
    RobotY(t)=Int(Rnd*20)+1
    Obstructed=0
    If (RobotX(t)>PlayerX-3 And RobotX(t)<PlayerX+3) And (RobotY(t)>PlayerY-3 And RobotY(t)<PlayerY+3)) Then Obstructed=1
    For j=1 To t-1
      If (RobotX(t)>RobotX(j)-2 And RobotX(t)<RobotX(j)+2) And (RobotY(t)>RobotY(j)-3 And RobotY(t)<RobotY(j)+2)) Then Obstructed=1
    Next j
  Loop Until Obstructed=0
  If GameType=1 Then
    If CurrentRobot=1 Then
      RobotType(t)=Int(Rnd*10)+1
      lasttype=RobotType(t)
    Else
      RobotType(t)=lasttype
    End If
  Else
    If Rnd>.5 Then
      RobotType(t)=1
    Else
      RobotType(t)=2
    End If
  End If
  Grid(RobotX(t),RobotY(t))=RobotType(t)
End Sub

Sub MoveIvan
  OldIvanX=IvanX
  OldIvanY=IvanY
  GottaChangeIvan=0
  If IvanX+IvanXDir<>0 And IvanX+IvanXDir<>21 Then
    IvanX=IvanX+IvanXDir
  Else
    GottaChangeIvan=1
  End If
  If IvanY+IvanYDir<>0 And IvanY+IvanYDir<>21 Then
    IvanY=IvanY+IvanYDir
  Else
    GottaChangeIvan=1
  End If
  If Rnd>.8 Or GottaChangeIvan=1 Then ChangeIvanDir
  If Grid(OldIvanX,OldIvanY)=0 Then
    Text (OldIvanX-1)*16,(OldIvany-1)*16," ",,9,1,RGB(black),RGB(black)
  Else
    Text (OldIvanX-1)*16,(OldIvany-1)*16,Chr$(32+RobotType(grid(OldIvanX,OldIvanY))),,9,1,RobotColor(RobotType(Grid(OldIvanX,OldIvanY)))
  End If
  Text (IvanX-1)*16,(IvanY-1)*16,Chr$(44),,9,1,RGB(yellow),RGB(black)
  If PlayerX=IvanX And PlayerY=IvanY Then GameOver=2
End Sub

Sub ChangeIvanDir
  Do
    conflict=0
    IvanXDir=Int(Rnd*3)-1
    IvanYDir=Int(Rnd*3)-1
    If IvanXDir=0 And IvanYDir=0 Then Conflict=1
    If IvanX=1 And IvanXDir=-1 Then Conflict=2
    If IvanY=1 And IvanYDir=-1 Then Conflict=3
    If IvanY=20 And IvanYDir=1 Then conflict=4
    If IvanX=20 And IvanXDir=1 Then conflict=5
  Loop While Conflict=1
End Sub

Sub CheckExplosion
  If RobotType(t)=11 And GameType=2 Then
    Text ((RobotX(t)-1)*16)-8,((RobotY(t)-1)*16)-8,Chr$(49),,9,2,RGB(yellow),RGB(black)
    RobotBG=RGB(yellow)
    GameOver=3
  Else
    RobotBG=RGB(black)
  End If
End Sub

Sub Game
  For x=1 To 20
    For y=1 To 20
      Grid(x,y)=0
    Next y
  Next x
  CurrentRobot=0
  GameOver=0
  Score=0
  Moves=0
  PlayerX=Int(Rnd*20)+1
  PlayerY=Int(Rnd*20)+1
  PlayerOrientation=45
  FirstMove=1

  For t=1 To NumRobots
    NewBot
  Next T

  Do
    IvanX=Int(Rnd*20)+1
    IvanY=Int(Rnd*20)+1
  Loop Until grid(IvanX,IvanY)=0
  ChangeIvanDir

  CLS
  For t=2000 To 850 Step -150
    Text (PlayerX-1)*16,(PlayerY-1)*16,Chr$(PlayerOrientation),,9,1,RGB(white),RGB(black)
    If IvanOff=0 Then Text (IvanX-1)*16,(IvanY-1)*16,Chr$(44),,9,1,RGB(yellow),RGB(black)
    Play tone t,t,25
    Pause 50
    Text (PlayerX-1)*16,(PlayerY-1)*16," ",,9,1,RGB(white),RGB(black)
    Text (IvanX-1)*16,(IvanY-1)*16," ",,9,1
    Play tone t-75,t-75,25
    Pause 50
  Next t
  Text (PlayerX-1)*16,(PlayerY-1)*16,Chr$(PlayerOrientation),,9,1,RGB(white),RGB(black)
  If IvanOff=0 Then Text (IvanX-1)*16,(IvanY-1)*16,Chr$(44),,9,1,RGB(yellow)

  snd=150
  For t=1 To NumRobots
    Play tone snd,snd,25
    snd=snd+50
    Text (RobotX(t)-1)*16,(RobotY(t)-1)*16,Chr$(32+RobotType(t)),,9,1,RobotColor(RobotType(t))
    Pause 50
  Next t

  Do
    k$=Inkey$
  Loop Until k$=""

  Do
    If FirstMove=0 And Instr(Chr$(10)+" ,.-+=ti",k$)=0 And k$<>Chr$(27) Then
      For t=1 To NumRobots
        If RobotType(t)=11 Then
          RobotType(t)=0
          Grid(RobotX(t),RobotY(t))=0
          Text (RobotX(t)-1)*16,(RobotY(t)-1)*16," ",,9,1,RGB(black),RGB(black)
        End If
        If RobotType(t)<>0 Then
          Moved(t)=0
          XDir(t)=0:YDir(t)=0
          If RobotX(t)>PlayerX Then
            XDir(t)=-1
          Else
            If RobotX(t)<PlayerX Then XDir(t)=1
          End If
          If RobotY(t)>PlayerY Then
            YDir(t)=-1
          Else
            If RobotY(t)<PlayerY Then YDir(t)=1
          End If
        End If
      Next t
      For t=1 To NumRobots
        If RobotType(t)<>0 Then
          If Rnd>.5 Then
            If XDir(t)<>0 And RobotType(t)=RobotType(Grid(RobotX(t)+XDir(t),RobotY(t))) Then CXDir=XDir(t):CYDir=0:Combine
            If Moved(t)=0 And YDir(t)<>0 And RobotType(t)=RobotType(Grid(RobotX(t),RobotY(t)+YDir(t))) Then CYDir=YDir(t):CXDir=0:Combine
          Else
             If YDir(t)<>0 And RobotType(t)=RobotType(Grid(RobotX(t),RobotY(t)+YDir(t))) Then CYDir=YDir(t):CXDir=0:Combine
            If Moved(t)=0 And XDir(t)<>0 And RobotType(t)=RobotType(Grid(RobotX(t)+XDir(t),RobotY(t))) Then CXDir=XDir(t):CYDir=0:Combine
          End If
        End If
      Next t

      For t=1 To NumRobots
        If RobotType(t)<>0 Then
          If Rnd>.5 Then
            If Moved(t)=0 And Grid(RobotX(t)+XDir(t),RobotY(t))=0 Then
              Grid(RobotX(t),RobotY(t))=0
              Text (RobotX(t)-1)*16,(RobotY(t)-1)*16," ",,9,1,RobotColor(RobotType(t))
              RobotX(t)=RobotX(t)+XDir(t)
              Grid(RobotX(t),RobotY(t))=t
              CheckExplosion
              Text (RobotX(t)-1)*16,(RobotY(t)-1)*16,Chr$(32+RobotType(t)),,9,1,RobotColor(RobotType(t)),robotbg
            Else
              If Moved(t)=0 And Grid(RobotX(t),RobotY(t)+YDir(t))=0 Then
                Grid(RobotX(t),RobotY(t))=0
                Text (RobotX(t)-1)*16,(RobotY(t)-1)*16," ",,9,1,RobotColor(RobotType(t))
                RobotY(t)=RobotY(t)+YDir(t)
                Grid(RobotX(t),RobotY(t))=t
                CheckExplosion
                Text (RobotX(t)-1)*16,(RobotY(t)-1)*16,Chr$(32+RobotType(t)),,9,1,RobotColor(RobotType(t)),robotbg
              End If
            End If
          Else
            If Moved(t)=0 And Grid(RobotX(t),RobotY(t)+YDir(t))=0 Then
              Grid(RobotX(t),RobotY(t))=0
              Text (RobotX(t)-1)*16,(RobotY(t)-1)*16," ",,9,1,RobotColor(RobotType(t))
              RobotY(t)=RobotY(t)+YDir(t)
              Grid(RobotX(t),RobotY(t))=t
              CheckExplosion
              Text (RobotX(t)-1)*16,(RobotY(t)-1)*16,Chr$(32+RobotType(t)),,9,1,RobotColor(RobotType(t)),robotbg
            Else
              If Moved(t)=0 And Grid(RobotX(t)+XDir(t),RobotY(t))=0 Then
                Grid(RobotX(t),RobotY(t))=0
                Text (RobotX(t)-1)*16,(RobotY(t)-1)*16," ",,9,1,RobotColor(RobotType(t))
                RobotX(t)=RobotX(t)+XDir(t)
                Grid(RobotX(t),RobotY(t))=t
                CheckExplosion
                Text (RobotX(t)-1)*16,(RobotY(t)-1)*16,Chr$(32+RobotType(t)),,9,1,RobotColor(RobotType(t)),robotbg
              End If
            End If
          End If
        End If
      Next t
      For t=1 To NumRobots
        If RobotType(t)=0 Then
          NewBot
          PlayQueue$="220 440 880 880 440 220 "
          Text (RobotX(t)-1)*16,(RobotY(t)-1)*16,Chr$(32+RobotType(t)),,9,1,RobotColor(RobotType(t))
        Else
          If RobotX(t)=PlayerX And RobotY(t)=PlayerY Then GameOver=1:KillerRobot=RobotType(t)
        End If
      Next
    End If

    FirstMove=0

    If GameOver=0 Then
      Do
        PlayMusic
        ivancounter=ivancounter+1
        If IvanCounter>IvanLimit Then
          IvanCounter=0
          If IvanOff=0 Then MoveIvan
        End If
        k$=Inkey$
      Loop Until k$<>"" Or GameOver<>0

      Moves=Moves+1
      OldPlayerX=PlayerX:OldPlayerY=PlayerY
      Select Case LCase$(k$)
        Case "w",Chr$(128)
          PlayerOrientation=46
          If PlayerY>1 Then PlayerY=PlayerY-1
        Case "a",Chr$(130)
          PlayerOrientation=48
          If PlayerX>1 Then PlayerX=PlayerX-1
        Case "s",Chr$(129)
          PlayerOrientation=45
          If PlayerY<20 Then PlayerY=PlayerY+1
        Case "d",Chr$(131)
          PlayerOrientation=47
          If PlayerX<20 Then PlayerX=PlayerX+1
        Case "i"
          If IvanOff=1 Then
            IvanOff=0
          Else
            IvanOff=1
            If Grid(IvanX,IvanY)<>0 Then
              Text (IvanX-1)*16,(IvanY-1)*16,Chr$(32+RobotType(Grid(IvanX,IvanY))),,9,1,RobotColor(RobotType(grid(IvanX,IvanY)))
            Else
              Text (IvanX-1)*16,(IvanY-1)*16," ",,9,2
            End If
          End If
        Case ".","+","-"
          ivanLimit=IvanLimit-1
        Case ",","-"
          If IvanLimit<>0 Then IvanLimit=IvanLimit+1
        Case "t"," ",Chr$(10),Chr$(13)
          Text (PlayerX-1)*16,(PlayerY-1)*16," ",,9,1,RGB(black),RGB(black)
          TSnd=0
          For t=1 To 20
            Do
              TeleportX(t)=Int(Rnd*20)+1
              TeleportY(t)=Int(Rnd*20)+1
              Obstructed=0
              For i=1 To NumRobots
                If TeleportX(t)=RobotX(i) And Teleporty(t)=Roboty(i) Then Obstructed=1
              Next i
            Loop Until Obstructed=0
            Text (TeleportX(t)-1)*16,(TeleportY(t)-1)*16,Chr$(PlayerOrientation),,9,1,RGB(white),RGB(black)
            If t>1 Then
              Text (TeleportX(t-1)-1)*16,(TeleportY(t-1)-1)*16,Chr$(PlayerOrientation),,9,1,RGB(cyan),RGB(black)
            End If
            If t>2 Then
              Text (TeleportX(t-2)-1)*16,(TeleportY(t-2)-1)*16,Chr$(PlayerOrientation),,9,1,RGB(blue),RGB(black)
            End If
            If t>3 Then
              Text (TeleportX(t-3)-1)*16,(TeleportY(t-3)-1)*16," ",,9,1,RGB(blue)
            End If
            Tsnd=TSnd+200
            Play tone TSnd,Tsnd,10
            Pause 10
          Next t
          Text (TeleportX(19)-1)*16,(TeleportY(19)-1)*16,Chr$(PlayerOrientation),,9,1,RGB(blue),RGB(black)
          Text (TeleportX(18)-1)*16,(TeleportY(18)-1)*16," ",,9,1,RGB(blue),RGB(black)
          Tsnd=TSnd+200
          Play tone TSnd,Tsnd,10
          Pause 10
          Text (TeleportX(19)-1)*16,(TeleportY(19)-1)*16," ",,9,1,RGB(blue),RGB(black)
          Tsnd=TSnd+200
          Play tone TSnd,Tsnd,10
          Pause 10
          PlayerX=TeleportX(20)
          PlayerY=TeleportY(20)
          For t=1 To 19
            Text (TeleportX(t)-1)*16,(TeleportY(t)-1)*16," ",,9,1,RGB(black),RGB(black)
          Next t
      End Select

      If OldPlayerX<>PlayerX Or OldPlayerY<>PlayerY Then
        Text (OldPlayerX-1)*16,(OldPlayerY-1)*16," ",,9,1
      End If
      Text (PlayerX-1)*16,(PlayerY-1)*16,Chr$(PlayerOrientation),,9,1,RGB(white)
    End If

  Loop Until k$=Chr$(27) Or GameOver<>0
  ScoreLine$="You scored "
  If Score>0 Then ScoreLine$=ScoreLine$+Str$(score)
  ScoreLine$=ScoreLine$+"0 points in "+Str$(moves)+" moves."
  Text 160-((Len(Scoreline$)*8)/2),154,ScoreLine$,,1,1,RGB(white),RGB(black)
  If GameOver<3 Then
    Text ((PlayerX-1)*16)-8,((PlayerY-1)*16)-8,Chr$(49),,9,2,RGB(red)
  End If
  PlayQueue$=""
  Select Case GameOver
    Case 1
      Text (PlayerX-1)*16,(PlayerY-1)*16,Chr$(32+KillerRobot),,9,1,RobotColor(RobotType(KillerRobot)),RGB(red)
    Case 2
      IvanDeathCount=IvanDeathCount+1
      If IvanDeathCount>1 Then
        Msg$="If Ivan is giving you a hard time,":center
        Text margin,200,msg$,,1,1,RGB(white),RGB(black)
        msg$="You can toggle him on and off with I.":center
        Text Margin,212,Msg$,,1,1,RGB(white),RGB(black)
        Text 292,212,"I",,1,1,RGB(red)
      End If
      Text (PlayerX-1)*16,(PlayerY-1)*16,Chr$(44),,9,1,RGB(yellow),RGB(red)
    Case 3
      Text 48,100,"You win!",,1,4,RGB(Yellow)
      Playqueue$=Winfanfare$
  End Select
    If PlayQueue$="" Then PlayQueue$="523 X X 494 X X X X X X X 370 X X X X X X X 330 X X X X X X X 370 X X X X X X X 247 X X X X X X X X X X X X X X X "
    Do
      k$=Inkey$
    Loop Until k$=""
    Do
      PlayMusic
      k$=Inkey$
    Loop Until k$<>""
  If k$=Chr$(27) Then CLS :End
  k$=""
End Sub

Read Winfanfare$
Winfanfare$=WinFanfare$+"659 X X 587|392 X X X X X X X 659|440 X X X X X X X 493|249 X X X X X X X "

Do
  Restore
  If GameType>0 Then GameType=GameType-1
  PlayQueue$=""
  CLS
  For t=1 To 256
    i=Int(Rnd*10)+1
    x=Int(Rnd*320)+1
    y=Int(Rnd*216)+104
    Text x,y,Chr$(32+i),,9,1,RobotColor(i)
  Next t
  Text 48,24,"23456789",,9,2,RGB(yellow)
  Text 104,72,":;<=",,9,2,RGB(red)
  Box 31,142,258,128,1,RGB(white),RGB(white)
  Msg$="Robots displaying equal numbers":center
  Text margin,150,Msg$,,1,1,RGB(black),RGB(white)
  Msg$="will combine if they stand":center
  Text margin,162,Msg$,,1,1,RGB(black),RGB(white)
  Msg$="next to each other:           ":center
  Text margin,174,Msg$,,1,1,RGB(black),RGB(white)
  Msg$="Teleport by pressing  ":center
  Text margin,190,Msg$,,1,1,RGB(black),RGB(white)
  msg$="Avoid Awful Ivan (  )":center
  Text margin,208,Msg$,,1,1,RGB(black),RGB(white)
  msg$="at all costs.":center
  Text margin,220,Msg$,,1,1,RGB(black),RGB(white)
  Text 220,205,Chr$(44),,9,1,RGB(gold),RGB(white)
  Text 192,174,"! !",,9,1,RGB(gray),RGB(white)
  Text 212,178,"+",,1,1,RGB(black),RGB(white)
  Text 248,178,"=",,1,1,RGB(black),RGB(white)
  Text 262,174,Chr$(34),,9,1,RGB(brown),RGB(white)
  Text 240,190,"T",,1,1,RGB(red),RGB(white)
  GameLine=0
  Box 28,270,264,52,1,RGB(black),RGB(black)
  Text 30,272,"%$#",,8,2,RGB(yellow)
  Text 30,288," !"+Chr$(34),,8,2,RGB(brown)
  Text 78,288,"Sacred Potato Productions",,1,,RGB(white)
  Text 80,304,"Some rights reserved.",,1,,RGB(white)
  Do
    k$=Inkey$
    If PlayQueue$="" Then Read PlayQueue$
    If PlayQueue$="!" Then Restore : Read PlayQueue$
    PlayMusic
    If GameLine=0 Or k$=Chr$(9) Then
      GameType=GameType+1
      If GameType=3 Then GameType=1
      Msg$="Game type:         ":center
      Text Margin,238,Msg$,,1,1,RGB(black),RGB(white)
      If GameType=1 Then
        Type$="Robotron"
      Else
        Type$="2048"
      End If
      Text 172,238,Type$,,1,1,RGB(blue),RGB(white)
      GameLine=1
      Msg$="Press Tab to change game type":center
      Text Margin,254,Msg$,,1,1,RGB(black),RGB(white)
      k$=""
    End If
  Loop Until k$<>""
  If k$=Chr$(27) Then CLS :End
  PlayQueue$=""
  Game
Loop Until k$=Chr$(27)
CLS
