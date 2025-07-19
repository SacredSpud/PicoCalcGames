' Landmine (C) 2025 by Sacred Potato
' Productions is licensed under
' GNU General Public License v3.0 
' To view a copy of this license, visit
' https://www.gnu.org/licenses/gpl-3.0.en.html


'Music
Data 440,117,440,117,440,131,440,131,587,294,587,294,587
Data 147,587,0,587,147,587,0,440,147,440,0,370,294,370
Data 294,370,147,370,0,330,147,330,0,330,147,330,0
Data 294,294,294,294,294,147,294,0,294,147,294,0,294,147
Data 294,0,294,294,294,294,294,147,294,0,587,147,587,0,587,147,587,00
Data 523,262,523,262,523,131,523,0,523,131,523,0,494,131,494,0
Data 440,262,440,262,440,131,440,0,330,131,330,0,330,131,330,0
Data 440,262,440,262,440,131,440,0,440,131,440,0,440,131,440,0
Data 554,330,554,330,554,165,554,0,554,165,554,0,554,165,554,0
Data 587,294,587,294,587,147,587,0,587,147,587,0,440,147,440,0
Data 370,294,370,294,370,147,370,0,330,147,330,0,330,147,330,0
Data 294,294,294,294,294,147,294,0,294,147,294,0,294,147,294,0
Data 587,294,587,294,587,147,587,0,587,147,587,0,587,147,587,0
Data 659,262,659,262,659,131,659,0,659,131,659,0,523,131,523,0
Data 440,262,440,262,440,131,440,0,523,131,523,0,523,131,523,0
Data 659,262,659,262,659,131,659,0,659,131,659,0,659,131,659,0
Data 784,330,784,330,784,165,784,0,784,165,784,0,784,165,784,0
Data 740,294,740,294,587,147,0,0,587,147,0,0,587,147,0,0,740,294
Data 740,294,587,147,0,0,587,147,0,0,587,147,0,0
Data 740,294,740,294,587,220,587,220,740,294,740,294,587,330,587,330
Data 740,294,740,294,587,220,587,220,740,294,740,294,784,185,784,185
Data 659,196,659,196,659,523,659,0,523,523,523,0,0,523,0,0,523,392
Data 523,392,523,330,523,0,392,330,392,0,0,330,0,0
Data 523,262,523,262,523,294,523,294,392,330,392,330,0,349,0,349
Data 523,392,523,392,523,440,523,440,659,494,659,494,0,523,0,523
Data 440,294,440,294,370,145,0,0,370,145,0,0,370,145,0,0
Data 440,294,440,294,370,145,0,0,370,145,0,0,370,145,0,0
Data 440,293,440,293,370,220,370,220,440,293,440,293,370,370
Data 370,370,440,293,440,293,370,220,370,220,440,293,440,293,494,147,494,147
Data 392,196,392,196,392,262,392,0,330,262,330,0,0,262,0,0
Data 330,196,330,196,330,165,330,0,262,165,262,0,0,165,0,0
Data 330,131,330,131,330,147,330,147,262,165,262,165,0,175
Data 0,175,330,196,330,196,330,220,330,220,392,247,392,247,0,262,0,262
Data 999,999

DefineFont 9
  5F200808
  0000000000000000
  0000000000000000
  7F49080800417F49
  497F41000808497F
  0A0A1F001F0A0AFE
  5050F800F850507F
  1800000000001824
  665A3C00003C003C
  4A81996666998152
  528166181866814A
  3C1800000000183C
  7C1038382828BABA
  99A5C3FFFFC3A599
  C6EEFE7CFEFEEEEE
  0606060606060606
  0606060607070606
  7C485060FFFF0042
  44444870FFFF0044
  898991E1FFFF00F9
  042428D0FFFF0004
  9191929CFFFF0091
  203C2038FFFF003F
  00000000E0E020C0
  0403000001060404
  06F90000FF000000
  20C00000C0202020
  0000000000008000
  0000000000FF00FF
  0000000000000100
End DefineFont

Sub ExhaustBuffer
  Do
    waste$=Inkey$
  Loop Until waste$=""
End Sub

Sub PlaySong
  Read rc,lc
  If rc=999 Then Restore :Read rc,lc
  Play tone rc,lc,120
  Pause 90
End Sub

Sub RescuedAGuy
  score=score+150
  NewScore
  GuysCarried=GuysCarried+1
  Play tone 525,0,30
  Pause 30
  Play tone 525,698,30
  Pause 100
  Play tone 525,0,30
  Pause 30
  Play tone 525,880,200
  Pause 200
  Map(side,TankX,TankY)=0
  Map(OtherSide,TankX,TankY)=0
  TankBG=RGB(cyan)
End Sub

Sub LoseADude
  score=score-300
  NewScore
  guysleft=guysleft-1
End Sub

Sub DropOff
  For t=1 To GuysCarried
    score=score+50
    NewScore
    Play tone 400,420,50
    Pause 100
  Next
  If GuysCarried<>0 Then
    GuysRescued=GuysRescued+GuysCarried
    GuysCarried=0
  End If
  TankBG=RGB(beige)
  Text (TankX-1)*16,(TankY-1)*16,Chr$(33+TankOrientation)),,9,2,TankColor,tankbg
  ExhaustBuffer
End Sub

Sub DrawScreen()
  AnimationInPlay=0
'Check to see if player is dead
  If Map(Side,TankX-1,TankY-1)=7 Then Dead=1
  If Map(Side,TankX,TankY-1)=7 Then Dead=1
  If Map(Side,TankX+1,TankY-1)=7 Then Dead=1
  If Map(Side,TankX-1,TankY)=7 Then Dead=1
  If Map(Side,TankX+1,TankY)=7 Then Dead=1
  If Map(Side,TankX-1,TankY+1)=7 Then Dead=1
  If Map(Side,TankX,TankY+1)=7 Then Dead=1
  If Map(Side,TankX+1,TankY+1)=7 Then Dead=1
'Draw the map
  For x=1 To MapWidth
    For y=1 To MapHeight
      If FirstRun=1 Or Map(Side,x,y) <> Map(OtherSide,x,y) Then
        bgcolor=RGB(beige)
        Select Case Map(Side,x,y))
          Case 0,1 'Empty spaces
            textfc=RGB(beige)
          Case 5 'Small obstacle on map
            textfc=RGB(brown)
          Case 6 'It's a mine
            textfc=RGB(red)
          Case 7,8 'It's an exploding mine (or an unfortunate guy)
            textfc=RGB(yellow)
            bgcolor=RGB(red)
          Case 10 'Civilian
            textfc=RGB(magenta)
          Case 11 'Shelter
            textfc=RGB(blue)
            bgcolor=RGB(green)
          Case 12 'Headstone
            textfc=RGB(gray)
        End Select
        Text (x-1)*16,(y-1)*16,Chr$(33+Map(Side,x,y)),,9,2,textfc,bgcolor
      End If
'Calculate any changes for the map
      Select Case Map(Side,x,y)
        Case 1
          Map(Side,x,y)=0
        Case 8
          Map(Side,x,y)=0
          Map(OtherSide,x,y)=1
          Score=Score+100
          NewScore
          AnimationInPlay=1
        Case 7 'If a mine has exploded, then explode the mines around it
          MinesExploded=MinesExploded+1
          Map(Side,x,y)=0
          AnimationInPlay=1
          Map(OtherSide,x,y)=8
          If Map(Side,x-1,y-1)=6 Then Map(OtherSide,x-1,y-1)=7
          If Map(Side,x,y-1)=6 Then Map(OtherSide,x,y-1)=7
          If Map(Side,x+1,y-1)=6 Then Map(OtherSide,x+1,y-1)=7
          If Map(Side,x-1,y+1)=6 Then Map(OtherSide,x-1,y+1)=7
          If Map(Side,x,y+1)=6 Then Map(OtherSide,x,y+1)=7
          If Map(Side,x+1,y+1)=6 Then Map(OtherSide,x+1,y+1)=7
          If Map(Side,x-1,y)=6 Then Map(OtherSide,x-1,y)=7
          If Map(Side,x+1,y)=6 Then Map(OtherSide,x+1,y)=7
'Ooh... you blew up a guy before you could save him. [Shakes head]
          If Map(Side,x-1,y-1)=10 Then Map(OtherSide,x-1,y-1)=12:LoseADude
          If Map(Side,x,y-1)=10 Then Map(OtherSide,x,y-1)=12:LoseADude
          If Map(Side,x+1,y-1)=10 Then Map(OtherSide,x+1,y-1)=12:LoseADude
          If Map(Side,x-1,y+1)=10 Then Map(OtherSide,x-1,y+1)=12:LoseADude
          If Map(Side,x,y+1)=10 Then Map(OtherSide,x,y+1)=12:LoseADude
          If Map(Side,x+1,y+1)=10 Then Map(OtherSide,x+1,y+1)=12:LoseADude
          If Map(Side,x-1,y)=10 Then Map(OtherSide,x-1,y)=12:LoseADude
          If Map(Side,x+1,y)=10 Then Map(OtherSide,x+1,y)=12:LoseADude
        Case 12 'Get rid of the headstone
          Map(Side,x,y)=0
          Map(OtherSide,x,y)=0
      End Select
    Next y
  Next x
  FirstRun=0
  If Side=1 Then
    Side=2
    Otherside=1
  Else
    Side=1
    OtherSide=2
  End If
  If Dead=1 Then
    Text (TankX-1)*16,(TankY-1)*16,Chr$(40)),,9,2,RGB(yellow),RGB(red)
  End If
End Sub


Sub NewScore
  Text 0,307,"Score: "+Str$(Score),,1,,RGB(black),RGB(beige)
End Sub

Sub Initialize
  score=0
  GuysLeft=NumberOfPeople
  GuysCarried=0
  GuysRescued=0
  MinesExploded=0
  Side=1
  OtherSide=2
  TankX=1
  TankY=Int(MapHeight/2)
  TankOrientation=4
  QuitMessage$="  GAME OVER   "
'Populate the map
  For x=1 To MapWidth
    For y=1 To MapHeight
      Map(1,x,y)=5
    Next y
  Next x
'Place the trails
  For x = 2 To MapWidth-1 Step 3
    For y = 2 To MapHeight-1 Step 3
      If Rnd < 0.5 Then
        TrailLength = Int(Rnd * TrailMax) + 1
        direction = Int(Rnd * 2)
        If direction = 0 Then
          If x <> 2 And i <> MapHeight-1 Then
            For z = 0 To TrailLength - 1
              If y + z < MapHeight Then
                Map(1,x, y + z) = 0
              End If
            Next z
          End If
        Else
          If y <> 2 And y <> MapWidth-1 Then
            For z = 0 To TrailLength - 1
              If x + z < MapWidth Then
                Map(1,x + z, y) = 0
              End If
            Next z
          End If
        End If
      End If
    Next y
  Next x
'Clear a small area for the tank
  For x=0 To 2
    For y=0 To 2
      Map(1,(TankX-1)+x,(TankY-1)+y)=0
    Next y
  Next x
  For t=2 To 8
    Map(1,TankX+t,TankY)=0
  Next
'Place the mines
  For t=1 To NumberOfMines
    Do While GotIt<>1
      x=Int(Rnd*(MapWidth-2))+1
      y=Int(Rnd*(MapHeight-2))+1
      If (x<>TankX And y<>TankY) And (x<>MapWidth And y<>TankY) Then
        If Map(1,x+1,y+1)<>6 Then GotIt=1 Else GotIt=0
      End If
    Loop
    Map(1,x+1,y+1)=6
    GotIt=0
  Next t
'Please the civilians
  For t=1 To NumberOfPeople
    Do While GotIt<>1
      x=Int(Rnd*(MapWidth-2))+1
      y=Int(Rnd*(MapHeight-2))+1
      If (x<>TankX And y<>TankY) And (x<>MapWidth And y<>TankY) Then
        If Map(1,x+1,y+1)<>6 And Map(1,x+1,y+1)<>10 Then GotIt=1 Else GotIt=0
      End If
    Loop
    Map(1,x+1,y+1)=10
    GotIt=0
  Next t
'Place the shelter
  Map(1,MapWidth,TankY)=11
'Make a copy of the map
  For x=1 To MapWidth
    For y=1 To MapHeight
      Map(2,x,y)=Map(1,x,y)
    Next y
  Next x
  Color RGB(black),RGB(beige)
  CLS
  side=2:otherside=1
  firstrun=1
  DrawScreen
  Text (TankX-1)*16,(TankY-1)*16,Chr$(33+TankOrientation)),,9,2,TankColor,RGB(beige)
End Sub

'Execution actually starts here
CLS
Text 3,50,".",,9,5,RGB(cyan)
Text 3,82,"/0123456",,9,5,RGB(cyan)
Text 7,140,"Rescue civilians   and bring them to",,,,RGB(white)
Text 7,160,"the shelter   . Destroy land mines",,,,RGB(white)
Text 10,180,"as necessary.",,,,RGB(white)
Text 120,180,"DO NOT SHOOT CIVILIANS!",,,,RGB(red)
Text 140,139,Chr$(43),,9,2,RGB(magenta)
Text 99,156,Chr$(44),,9,2,RGB(blue),RGB(green)
Text 286,159,Chr$(39),,9,2,RGB(red)
Text 40,250,"Arrows to move, Space to fire.",,,,RGB(white)
Text 30,272,"<;:",,9,2,RGB(yellow)
Text 30,288,"789",,9,2,RGB(brown)
Text 78,288,"Sacred Potato Productions",,1,,RGB(white)
Text 80,304,"Some rights reserved.",,,,RGB(white)
Do
  PlaySong
  a$=Inkey$
Loop While a$=""
Randomize Timer
MapHeight=19
MapWidth=20
NumberOfMines=Int((MapWidth * MapHeight) / 4)
NumberOfPeople=Int(NumberOfMines/4)
TrailMax=Int((MapWidth+MapHeight/2)/2)
TankColor=RGB(blue)
TankBG=RGB(beige)
Dim Map(2,MapWidth+1,MapHeight+1)


'Main loop
Do While Quit=0
  Initialize
  NewScore
  Do While k$<>Chr$(27) And Dead<>1
    OldOrientation=TankOrientation
'Check to see if we're next to an explosion
    If Map(Side,TankX-1,TankY-1)=7 Or Map(Side,TankX-1,TankY-1)=8 Then Dead=1
    If Map(Side,TankX,TankY-1)=7 Or Map(Side,TankX,TankY-1)=8 Then Dead=1
    If Map(Side,TankX+1,TankY-1)=7 Or Map(Side,TankX+1,TankY-1)=8 Then Dead=1
    If Map(Side,TankX-1,TankY)=7 Or Map(Side,TankX-1,TankY)=8 Then Dead=1
    If Map(Side,TankX+1,TankY)=7 Or Map(Side,TankX+1,1)=8 Then Dead=1
    If Map(Side,TankX-1,TankY+1)=7 Or Map(Side,TankX-1,TankY+1)=8 Then Dead=1
    If Map(Side,TankX,TankY+1)=7 Or Map(Side,TankX,TankY+1)=8 Then Dead=1
    If Map(Side,TankX+1,TankY+1)=7 Or Map(Side,TankX+1,TankY+1)=8 Then Dead=1
'Read keypress
    k$=""
    Do
      k$=Inkey$
    Loop Until k$<>""
'Process keypress
    oldTankX=TankX
    oldTankY=TankY
    check=0
    Select Case k$
      Case Chr$(128),"W","w" 'Move up
        If TankOrientation=1 Then
          TankXDir=0
          TankYDir=-1
          Check=1
        End If
        TankOrientation=1
      Case Chr$(129),"S","s" 'Move down
        If TankOrientation=2 Then
          TankXDir=0
          TankYDir=1
          Check=1
        End If
        TankOrientation=2
      Case Chr$(130),"A","a" 'Move left
        If TankOrientation=3 Then
          TankXDir=-1
          TankYDir=0
          Check=1
        End If
        TankOrientation=3
      Case Chr$(131),"D","d" 'Move right
        If TankOrientation=4 Then
          TankXDir=1
          TankYDir=0
          Check=1
        End If
        TankOrientation=4
      Case " ",Chr$(10),Chr$(13) 'Fire
        Select Case TankOrientation
          Case 1 'Fire up
            ShotXDir=0
            ShotYDir=-1
          Case 2 'Fire down
            ShotXDir=0
            ShotYDir=1
          Case 3 'Fire left
            ShotXDir=-1
            ShotYDir=0
          Case 4 'Fire right
            ShotXDir=1
            ShotYDir=0
        End Select
        ShotX=TankX
        ShotY=TankY
        Collision=0
        OutOfBounds=0
        shotsound=201
'Move the shot and check for collisions
        Do
          OldShotX=ShotX
          OldShotY=ShotY
          ShotX=ShotX+ShotXDir
          ShotY=ShotY+ShotYDir
          If OldShotX<>TankX Or OldShotY<>TankY Then
            Text (OldShotX-1)*16,(OldShotY-1)*16,Chr$(33)),,9,2,RGB(beige),RGB(beige)
          End If
          If ShotX=0 Or ShotY=0 Or ShotX=MapWidth+1 Or ShotY=MapHeight+1 Then OutOfBounds=1
          If OutOfBounds<>1 Then
            Text (ShotX-1)*16,(ShotY-1)*16,Chr$(42)),,9,2,RGB(grey),RGB(beige)
            Play tone ShotSound,ShotSound+100,10
            ShotSound=ShotSound-10
            Pause 10
            Select Case Map(Side,ShotX,ShotY)
              Case 5 'Shot hit small obstacle
                Map(Side,ShotX,ShotY)=0
                Map(OtherSide,ShotX,ShotY)=0
                Collision=1
                AnimationInPlay=1
                Score=Score+10
                NewScore
              Case 6 'Shot hits a landmine
                Map(Side,ShotX,ShotY)=7
                Collision=1
                AnimationInPlay=1
                score=score+50
                NewScore
              Case 10 'Shot hits a civilian
                k$=Chr$(27)
                Collision=3
              Case 11 'Shot hits the shelter
                Map(OtherSide,ShotX,Shot)=11
                collision=2
            End Select
          End If
        Loop Until OutOfBounds=1 Or Collision>0
    End Select
    If Check=1 Then
      CheckMap=Map(Side,TankX+TankXDir,TankY+TankYDir)
      Select Case CheckMap
        Case 0,1 'Move into blank space
          TankX=TankX+TankXDir
          TankY=TankY+TankYDir
        Case 10 'Pick up a civilian
          TankX=TankX+TankXDir
          TankY=TankY+TankYDir
          RescuedAGuy
        Case 11 'Drop civilians at shelter
          DropOff
      End Select
'Clip the tank's movement
      If TankY=0 Then TankY=1
      If TankY>MapHeight Then TankY=MapHeight
      If TankX>MapWidth Then TankX=MapWidth
      If TankX=0 Then TankX=1
    End If
'Redraw the space we just left
    If OldOrientation<>TankOrientation Or OldTankX<>TankX Or oldTankY<>TankY Then
      If Map(Side,OldTankX,OldTankY)<>11 Then 'Blank space
        Map(side,oldTankX,oldTankY)=0
        Text (OldTankX-1)*16,(OldTankY-1)*16,Chr$(32)),,9,2,TankColor,RGB(beige)
      Else 'Shelter
        Text (OldTankX-1)*16,(OldTankY-1)*16,Chr$(44),,9,2,RGB(blue),RGB(green)
      End If
      Text (TankX-1)*16,(TankY-1)*16,Chr$(33+TankOrientation)),,9,2,TankColor,tankbg 'Redraw the tank
    End If
    Select Case Collision 'Handle collision
      Case 2 'Redraw shelter
        Text (ShotX-1)*16,(ShotY-1)*16,Chr$(44)),,9,2,RGB(blue),RGB(green)
      Case 1 'Draw blank space
        If ShotX<>TankX Or ShotY<>TankY) Then
          Text (ShotX-1)*16,(ShotY-1)*16,Chr$(33)),,9,2,RGB(beige),RGB(beige)
        End If
      Case 3 'Draw red headstone (player shot a civilian)
        Text (ShotX-1)*16,(ShotY-1)*16,Chr$(45),,9,2,RGB(red),RGB(beige)
        Play tone 330,262,300
        Pause 300
        Play tone 220,262,600
        Pause 300
    End Select
    If AnimationInPlay=1 Then 'Recheck the map in order to calculate and display explosions
      Do While AnimationInPlay=1
        For t=101 To 1 Step -10
          Play tone 50,t,10
          Pause 10
        Next t
        DrawScreen
      Loop
    End If
    ExhaustBuffer
    If GuysRescued=NumberOfPeople Then 'Player wins if all civilians rescued
      QuitMessage$="  Victory!!   "
      k$=Chr$(27)
    Else
      If GuysRescued>=GuysLeft Then 'Tactical win if most of the civilians are rescued
        If GuysLeft>NumberOfGuys/2 Then
          QuitMessage$=" Tactical Win "
        Else
          If GuysLeft>NumberOfGuys/4 Then 'Narrow victory if more than 25% of civilians left
            QuitMessage$="Narrow Victory"
          Else 'Failure if 25% or fewer of the civilians are left
            QuitMessage$="   FAILURE.   "
          End If
        End If
        k$=Chr$(27)
      End If
  End If
  Loop

'Game ends when Esc is pressed (or simulated by the last If...Then statement in mail loop)
  Text 0,100,QuitMessage$,,1,3,RGB(red),RGB(black)
  If MinesExploded=NumberOfMines Then
    If GuysRescued=NumberOfPeople Then
      Score=Score+10000
    Else
      Score=Score+2500
    End If
    NewScore
    Text 0,150," All mines cleared! ",,1,2,RGB(white),RGB(black)
    Play tone 262,523,100
    Pause 100
    Play tone 156,311,200
    Pause 200
    Play tone 103,207,100
    Pause 100
    Play tone 392,784,400
    Pause 400
  End If
  Text 0,200," Play again?  (Y/N)  ",,1,2,RGB(white),RGB(black)
  Restore
  Do
    a$=Inkey$
    If a$=Chr$(27) Then a$="q"
    PlaySong
  Loop While Instr("yYqQnN",a$)=0
  If Instr("qQnN",a$) Then quit = 1
  k$=""
  Dead=0
  Collision=0
  Color RGB(green),RGB(black)
  CLS
Loop
