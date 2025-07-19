' Rebound (C) 2025 by Sacred Potato
' Productions is licensed under
' GNU General Public License v3.0 
' To view a copy of this license, visit
' https://www.gnu.org/licenses/gpl-3.0.en.html


DefineFont 9
  5F200808
  0000000000000000
  F7E7763C3C76F7F7
  FBDB663C3C42DFE7
  F7DB663C3C66DBFB
  B7D7663C3C76F783
  C3DF423C3C66DBFB
  DFDB663C3C66DBC7
  FBDB423C3C6EEFF7
  E7DB663C3C66DBDB
  DBDB663C3C66FBE3
  99C3663C3C66C399
  FDFDFD7E7E83FDFD
  1824428181422418
  FFFE0C0800080CFE
  FF7F30100010307F
  7F3E1C081C1C1C1C
  3838383810387CFE
  3C3C3C183C3C3C3C
  3C3C3C3C3C3C3C3C
  3C3C3C3C183C3C3C
  FF7F000000007FFF
  FFFF00000000FFFF
  FFFE00000000FEFF
  FBDB663C3C76FFF7
  FF7E5C9212FC7C7E
  FC9E2B48D33EFC3F
  7F3CFE298CF97EFC
  7EFF7C9418F97E3C
End DefineFont

DefineFont #8
  5F200808
  0403000001060404
  06F90000FF000000
  20C00000C0202020
  0000000000008000
  0000000000FF00FF
  0000000000000100
End DefineFont

Dim grid(40,40)
Dim ObstacleX(100)
Dim ObstacleY(100)
Dim ObstacleType(100)
Dim GameEnd$(4),Bounce$(4)
Dim Level$(20)

Data "*)$**$*+$*,$*-$*.$*4$*5$*6$*7$*8$*9$*:$*;$+)$+<$,)$,+&,<$-1&-5$-8&-<$.5$.<$/,&"
Data "/<$06&0<$1)$1<$2)$2.%3)$39&4)$46$5)$5/%6)$64$67%6<$7)$7,&73$7<$84$8<$95$9<$:+&"
Data ":1&:6$:<$;<$<)$<<$=)$=*$=+$=,$=-$=.$=4$=5$=6$=7$=8$=9$=:$=;$"
Data X
Data "##$#%$#&$#'$#($#)$#*$#+$#,$#-$#.$#/$#8$#9$#:$#;$#<$#=$#>$#?$#@$$#$$$$$@$%#$%%$"
Data "%;&%@$&#$&&$&1%&4%&7%&@$'#$''$'@$(#$(($(@$))$)-&)<&)@$*&&**$*4&*8&*@$++$+@$,(&"
Data ",,$,@$--$-@$.#$.*&..$.7&.@$/#$/%&//$/@$0#$00$0;$0<$0=$0@$1#$1(%1+&11$12$13$18$"
Data "19$1:$1>$1?$1@$2#$25&3#$3/%3<&4#$4+%5#$5'%52&6#$68$69$6:$6>$6?$6@$7#$7)$7*$70$"
Data "74$75$76$77$7;$7<$7=$7@$8#$8%&8*$8/$8@$9#$9*$9+$9.$9@$:(&:-$:;%:@$;,$;5%;@$<+$"
Data "<@$=%&=*$=0%=9&=@$>)$>@$?#$?($?,%?=&?@$@#$@'$@@$A#$A&$A)%A5&A@$B#$B%$B@$C#$C$$"
Data "C@$D#$D%$D&$D'$D($D)$D*$D+$D,$D5$D6$D7$D8$D9$D:$D;$D<$D=$D>$D?$D@$"
Data X
Data "#($#)$#-$#.$#/$#0$#3$#4$#5$#6$#:$#;$$&$$'$$<$$=$%%$%,%%3%%>$&%$&>$'$$';&'?$($$"
Data "(0&(5%(?$)#$)*%)@$*#$*=%*@$+#$+'&+:$+@$,9$-0&-8$.*%.7$.=%/6$0'&02$03$04$05$09&"
Data "1#$1*$1.$15$17$1@$2#$2+$2.$25$2@$3#$3,$3.$31&35$3=%3@$4#$4-$4.$45$4@$5#$5.$55$"
Data "57&5@$6#$6'&6/$60$61$62$63$64$65$6>$6?$6@$7;&9+&92%;'&;7&;<&<#$<@$=#$=/$=0$=1$"
Data "=2$=3$=@$>#$>@$?$$?,%?0&?6%?:&??$@$$@(%@?$A%$A4&A>$B%$B>$C&$C'$C<$C=$D($D)$D-$"
Data "D.$D/$D0$D3$D4$D5$D6$D:$D;$"
Data X
Data "%+$&$&&+$''&'+$'3&(+$(0%(7$)$&)+$)7$*'&*+$*7$++$+.%+4%+7$,$&,+$,7$-'&-,$-7$.-$"
Data ".7$/.$/7$0#$0$$0%$0&$0'$0($0)$0/$07$17$1:$1;$1<$1=$1>$1?$2$%2+&22&27$37$3:%47$"
Data "5'%5.%6+&62&66&6<%8)$9&&9)$9,%9/%92$93$94$95$96$97$98$99$9:$9;$9<$9=$9>$9?$9@$"
Data ":)$;)$;8&<$$<%$<&$<'$<($<)$<*$<+$<,$=)$=1&=5$=6$=<%>)$>6$?)$?6$?9%@)$@.&@6$A6$"
Data "B6$C,&C6$D6$"
Data X
Data "$6&%0&%=$&<$'4%';$(-&(:$)9$*9$*;&+($+)$+*$++$+,$+-$+.$+/$+3&+9$+>%,/$,9$-/$-6%"
Data "-9$.(&./$.9$/,%//$/9$0/$06$07$08$09$1/$15$1;&2/$25$3/$35$37%4'%4,&4/$42%45$4>%"
Data "5/$55$6)&6/$6:%7/$8%%8/$9/$:/$:2%:5$:9$:;$:>$;'$;($;)$;*$;+$;,$;-$;.$;/$;5$<'$"
Data "<0$<5$<:&='$=+%=0$=5$=>&>'$>($>)$>.$>/$>5$>7%?5$@.&@5$@;$@<$@=$A)%A5$A;$B5$B8%"
Data "B;$B=&C5$C;$D5$"
Data XX



Randomize Timer

red=RGB(red)
orange=RGB(orange)
yellow=RGB(yellow)
green=RGB(green)
cyan=RGB(cyan)
blue=RGB(blue)
magenta=RGB(magenta)
black=RGB(black)
white=RGB(white)
pink=RGB(pink)
gold=RGB(gold)
salmon=RGB(salmon)
beige=RGB(beige)
lightgray=RGB(lightgray)
gray=RGB(gray)

BallStart=1
NoteLength=50
PauseLength=50
PauseIncrement=10
CurrentPause=0
DeathSpiral$="0-/."
DeathMusic$="1047 988 932 880 831 784 740 699 659 622 587 554 523 "
start$="466|311 466|311 622|392 699|415 784|466 699|415 622|392 699|415 784|466 0 622|392 0 622|392 X X X "
newarrow$="466|233 0 466|233 622|311 X 0 622|311 X 0 698|294 X 0 698|294 X X 932|311 X X X 784|233 X 622|196 X X X X "
beedoo$="784|784 X 523|523 X X X "
gameend$(1)="466|311 415|294 392|311 X 466|233 X 622|196 X 466|156 X 392|196 X 466|208 X 622|196 X X X "
gameend$(2)="X X X 0 0 0 0 466|311 415|294 392|311 X 466|294 X 622|262 X 466|294 X 392|311 X 349|350 X 311|311 X X X X X X 0 0 0 0 "
gameend$(3)="466|311 415|294 392|311 X 466|233 X 622|196 X 466|156 X 392|196 X 466|208 X 622|233 X X X X X X 0 0 0 0 "
gameend$(4)="392|311 X X X 0 0 392|311 0 392|311 X X 0 392|311 311|233 262|196 311|233 415|208 X X X X X X X "
bounce$(1)="524|524 "
bounce$(2)="1046|1046 "
bounce$(3)="660|660 "
bounce$(4)="784|784 0|0 784|784 "


Sub PlayMusic
  If NoPause=1 Then
    NoPause=0
  Else
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
            Case "0 " 'Pause
              FreqX=0
              FreqY=0
            Case "X ","- " 'Stay on the same notes
            Case Else
              freqx=Val(currentnote$)
              freqy=Val(Mid$(Currentnote$,Instr(CurrentNote$,"|")+1,Len(CurrentNote$)))
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

Sub logoline
  Color Cyan,Black
  currentchar$=" "
  For t=1 To Len(logo$)
    char$=Mid$(logo$,t,1)
    If Char$<>CurrentChar$ Then
      Select Case Char$
        Case " "
          Color Cyan,Black
        Case "+"
          Color red,cyan
      End Select
      CurrentChar$=Char$
    End If
    Print "+";
  Next
  Print
End Sub

Sub SetupScreen
  Font 9
  Text 0,0,""
  Color cyan,black
  Print String$(40,43)
  Color cyan,black
  Print "+";
    Print String$(38,32);"+"
    Print "+";String$(38,32);"+";
    Print
  For t=1 To 32
    Color cyan,black
    Print "+";
    Print "  ";
    Color black,black
    Print String$(34,32);
    Print "  ";
    Color cyan,black
    Print "+"
  Next
  Print String$(40,43)
End Sub

Sub EditorInstructions
  Box 0,288,320,32,,black,black
  Text 0,288,"Current block:",,1,,white,black
  Text 120,290,"+",,9,1,cyan,black
  Text 150,290,"1=   2=   3=  0=blank",,1,,white,black
  Text 168,288,"!",,9,2,orange,black
  Text 205,288,"7",,9,2,red,black
  Text 248,290,"+",,9,1,cyan,black
  Text 0,306,"Spc=place C=clear S=save L=load Esc=play",,1,,white,black
End Sub

Sub DrawPlayingArea
  If InGame=1 Then
    Box 8,8,304,272,,black,black
  End If
  For j=1 To 32
    For i=1 To 36
      Select Case grid(i,j)
        Case 1
          Text (i+1)*8,(j+1)*8,"+",,9,,cyan,black
        Case 2
          Text (i+1)*8,(j+1)*8,"7",,9,2,red,black
        Case Else
          If grid(i,j)<>100 And grid(i,j)<>0 Then
            Text (i+1)*8,(j+1)*8,"!",,9,2,orange,black
          End If
      End Select
    Next i
  Next j
  If InGame=1 Then
    For t=1 To NumObstacles
      PlaceObstacle
    Next t
  End If
End Sub

Sub PlaceObstacle
  Select Case ObstacleType(t)
    Case 2
      Text (ObstacleX(t)+1)*8,(ObstacleY(t)+1)*8,"7",,9,2,red,black
    Case 3
      Text (ObstacleX(t)+1)*8,(ObstacleY(t)+1)*8,"*",,9,2,gray,black
    Case 4
      Text (ObstacleX(t)+1)*8,(ObstacleY(t)+1)*8,"*",,9,2,gray,black
    Case 5
      Text (ObstacleX(t)+1)*8,(ObstacleY(t)+1)*8,"!",,9,2,orange,black
    Case 6
      Text (ObstacleX(t)+1)*8,(ObstacleY(t)+1)*8,Chr$(34),,9,2,yellow,black
    Case 7
      Text (ObstacleX(t)+1)*8,(ObstacleY(t)+1)*8,"#",,9,2,beige,black
    Case 8
      Text (ObstacleX(t)+1)*8,(ObstacleY(t)+1)*8,"$",,9,2,green,black
    Case 9
      Text (ObstacleX(t)+1)*8,(ObstacleY(t)+1)*8,"%",,9,2,blue,black
    Case 10
      Text (ObstacleX(t)+1)*8,(ObstacleY(t)+1)*8,"&",,9,2,pink,black
    Case 11
      Text (ObstacleX(t)+1)*8,(ObstacleY(t)+1)*8,"'",,9,2,magenta,black
    Case 12
      Text (ObstacleX(t)+1)*8,(ObstacleY(t)+1)*8,"(",,9,2,gold,black
    Case 13
      Text (ObstacleX(t)+1)*8,(ObstacleY(t)+1)*8,")",,9,2,salmon,black
  End Select
End Sub

Sub ClearPlayingArea
  For j=1 To 33
    Text 8,(j+1)*8,String$(38,32),,9,,,black
    For i=1 To 36
      grid(i,j)=0
    Next i
  Next j
  NumObstacles=0
End Sub

Sub ClearInfoBlock
  Box 0,288,320,32,,black,black
End Sub

Sub DrawInfoArea
  ClearInfoBlock
  ScoreLine
  Text 0,308,DeathSpiral$,,9,,white,black
  If BallInPlay=0 Then
    Text 31,306,"=move    Tab=Paddle     Space=launch",,1,,white,black
  Else
    Text 31,306,"=move   Space="+SpaceAction$+"   Esc=quit",,1,,white
  End If
End Sub

Sub ScoreLine
  If ShowScore<Score Then ShowScore=ShowScore+10
  Text 0,288,"Score: "+Str$(ShowScore)+" ",,1,1,white,black
  If Lives>-1 Then
    Text 280,288,String$(lives,47),,9,1,green,black
    Text 280+(8*lives),288,String$(5-lives,44),,9,1,red,black
  End If
End Sub

Sub GenerateSaveData
  LevelLength=1
  level$(LevelLength)=""
        For i=1 To 36
        For j=1 To 32
          If Grid(i,j)<>0 Then
            Level$(LevelLength)=Level$(LevelLength)+Chr$(33+i)+Chr$(33+j)+Chr$(grid(i,j)+35)
            If Len(Level$(LevelLength))=78 Then
              LevelLength=LevelLength+1
              Level$(LevelLength)=""
            End If
          End If
        Next j
      Next i
End Sub

Sub EditorToGame
  NumObstacles=0
  For i=1 To 36
    For j=1 To 32
      If grid(i,j)>1 And grid(i,j)<>100 Then
        NumObstacles=NumObstacles+1
        ObstacleX(NumObstacles)=i
        ObstacleY(NumObstacles)=j
        Select Case grid(i,j)
          Case 2
            ObstacleType(NumObstacles)=grid(i,j)
          Case Else
            ObstacleType(NumObstacles)=Int(Rnd*9)+4
        End Select
        If grid(i,j)>1 Then
          grid(i,j)=100
          grid(i+1,j)=100
          grid(i,j+1)=100
          grid(i+1,j+1)=100
        End If
      End If
    Next j
  Next i
End Sub

Sub GameToEditor
  For i=1 To 36
    For j=1 To 32
      If grid(i,j)=100 Then
        For t=1 To NumObstacles
          If ObstacleX(t)=i And ObstacleY(t)=j Then FoundIt=t
        Next t
        grid(i,j)=ObstacleType(FoundIt)
        If grid(i,j)>3 Then grid(i,j)=3
        grid(i+1,j)=0
        grid(i,j+1)=0
        grid(i+1,j+1)=0
      End If
    Next j
  Next i
End Sub

Sub Editor
  InGame=0
  DrawPlayingArea
  EditorInstructions
  x=2
  y=2
  OldX=X
  OldY=Y
  Block=43
  Color white,black
  Do
    If OldX<>X Or OldY<>Y Then
      If Grid(OldX,OldY)=0 Then
        If OldX>1 Then
          If Grid(OldX-1,OldY)>1 Then
            OldX=OldX-1
          Else
            If OldY>1 Then
              If Grid(OldX-1,OldY-1)>1 Then
                OldX=OldX-1
                OldY=OldY-1
              End If
            End If
          End If
        Else
          If OldY>1 Then
            If Grid(OldX,OldY-1)>1 Then
              OldY=OldY-1
            End If
          End If
        End If
      End If
      If Grid(OldX,OldY)>0 Then
        Select Case Grid(OldX,OldY)
          Case 1
            Text (OldX+1)*8,(OldY+1)*8,"+",,9,1,cyan
          Case 2
            Text (OldX+1)*8,(OldY+1)*8,"7",,9,2,red
          Case 3
            Text (OldX+1)*8,(OldY+1)*8,"!",,9,2,orange
        End Select
      Else
        Box (OldX+1)*8,(OldY+1)*8,8,8,,black
      End If
      OldX=X
      OldY=Y
    End If
    Box (x+1)*8,(y+1)*8,8,8,,white
    k$=""
    Do
      k$=Inkey$
    Loop Until k$<>""
    Obstructed=0
    Select Case LCase$(k$)
      Case Chr$(130)
        If x>2 Then x=x-1
      Case Chr$(131)
        If x<35 Then x=x+1
      Case Chr$(128)
        If y>2 Then y=y-1
      Case Chr$(129)
        If y<31 Then y=y+1
      Case Chr$(13),Chr$(10)," "
        If Block=0 Or Block=33 Or Block=55 Then
          If x>1 Then
            If grid(x-1,y)>1 Then Obstructed=1
            If grid(x-1,y+1)>1 Then Obstructed=1
          End If
          If Grid(x+1,y)>1 Then Obstructed=1
          If y>1 Then
            If Grid(x,y-1)>1 Then Obstructed=1
            If Grid(x+1,y-1)>1 Then Obstructed=1
         End If
         If x>1 And y>1 Then
           If Grid(x-1,y-1)>1 Then Obstructed=1
         End If
         If Grid(x+1,y+1)>1 Then Obstructed=1
         If Grid(x,y+1)>1 Then Obstructed=1
       End If
       If Block=43 Then
         If x>1 Then
           If Grid(x-1,y)>1 Then Obstructed=1
           If y>1 Then
             If Grid(x-1,y-1)>1 Then Obstructed=1
           End If
         End If
         If y>1 Then
           If Grid(x,y-1)>1 Then Obstructed=1
         End If
       End If
       If Obstructed=0 Then
         Select Case Block
           Case 33
             Grid(x,y)=3
             grid(x,y+1)=0
             Grid(x+1,y)=0
             Grid(x+1,y+1)=0
             Text (x+1)*8,(y+1)*8,Chr$(33),,9,2,orange
           Case 55
             Grid(x,y)=2
             grid(x,y+1)=0
             Grid(x+1,y)=0
             Grid(x+1,y+1)=0
             Text (x+1)*8,(y+1)*8,"7",,9,2,red
           Case 43
             If Grid(x,y)>1 Then Text (x)*8,(y+1)*8," ",,9,2,,black : Text (x+1)*8,(y+1)*8," ",,9,2,,black : Text (x+1)*8,(y)*8," ",,9,2,,black
             Grid(x,y)=1
             Text (x+1)*8,(y+1)*8,Chr$(43),,9,,cyan
           Case 32
             If Grid(x,y)>1 Then
               grid(x,y)=0
               Text (x+1)*8,(y+1)*8," ",,9,2,,black
             Else
               If x>1 Then
                 If grid(x-1,y)>1 Then obstructed=1
                 If y>1 Then
                   If grid(x-1,y-1)>1 Then Obstructed=1
                 End If
               End If
               If y>1 Then
                 If grid(x,y-1)>1 Then obstructed=1
               End If
               If Obstructed=0 Then
                 grid(x,y)=0
                 Text (x+1)*8,(y+1)*8," ",,9,,,black
               End If
             End If
         End Select
       Else
         Play tone 165,165,300
         Pause 300
         Play tone 165,165,300
       End If
      Case "1"
        Block=33
        Play tone 880,440,300
        Text 120,290,"!",,9,2,orange,black
      Case "2"
        Block=55
        Play tone 440,880,300
        Text 120,290,"7",,9,2,red,black
      Case "3"
        Block=43
        Play tone 880,880,300
        Text 120,290," ",,9,2,,black
        Text 120,290,"+",,9,1,cyan
      Case "0"
        Text 120,290," ",,9,2,,black
        Block=32
        Play tone 165,165,300
      Case "s","S"
        Font 1
        Box 0,288,320,32,,black,black
        Text 0,288,"Enter filename to save"
        Input save$
        savelen=0
          GenerateSaveData
        Open save$ For output As #1
          For i=1 To LevelLength
            Print #1,Level$(i)
          Next
        Close #1
        EditorInstructions
        Block=43
      Case "l"
        Font 1
        Box 0,288,320,32,,black,black
        Text 0,288,"Enter filename to load",,1,,white,black
        Input load$
        Open load$ For input As #1
        ClearPlayingArea
        Do
          Line Input #1,p$
          ProcessInput
        Loop Until Eof(#1)
        Close #1
        SetupScreen
        DrawPlayingArea
        EditorInstructions
      Case "c"
        ClearPlayingArea
    End Select
  Loop Until k$=Chr$(27)
  InGame=1
  GenerateSaveData
  EditorToGame
End Sub

Sub ProcessInput
  Do
    pp$=Mid$(p$,1,1)
    i=Asc(pp$)-33
    pp$=Mid$(p$,2,1)
    j=Asc(pp$)-33
    pp$=Mid$(p$,3,1)
    p$=Mid$(p$,4,Len(p$))
    gr=Asc(pp$)
    grid(i,j)=gr-35
  Loop Until Len(p$)<3
End Sub

Sub ChooseBall
  BallXdir=0
  BallYdir=0
  If StickyPaddle=0 Then
    BallStart=BallStart+1
  Else
    StickyPaddle=0
  End If
  If BallStart=5 Then BallStart=1
  Select Case BallStart
    Case 1 'Top paddle
      BallX=XPaddle+2
      BallY=1
      BallYdir=1
      arrow=48
    Case 2 'Left paddle
      BallX=1
      BallY=YPaddle+2
      BallXdir=1
      arrow=45
    Case 3 'Bottom paddle
      BallX=XPaddle+2
      BallY=32
      BallYdir=-1
      arrow=47
    Case 4 'Right paddle
      BallX=36
      BallY=YPaddle+2
      BallXdir=-1
      arrow=46
  End Select
  If Rnd>.5 Then
    freq1=466
    freqa=233
    freq2=440
    freqb=220
  Else
    freq1=622
    freqa=311
    freq2=587
    freqb=294
  End If
  Text 16,16,String$(36,32),,,,,black
  For i=2 To 31
    Text 16,(i+1)*8," ",,,,,black
    Text 296,(i+1)*8," ",,,,,black
  Next i
  Text 16,264,String$(36,32),,,,,black
  OldBallX=BallX
  OldBallY=BallY
  Text (BallX+1)*8,(BallY+1)*8,Chr$(arrow),,9,,green
  SpaceAction$="Launch"
  DrawInfoArea
  PlayQueue$=NewArrow$
  k$=""
  Do
    PlayMusic
    k$=Inkey$
  Loop Until PlayQueue$="" Or k$<>""
  PlayQueue$=""
  Pause 100
  Text (BallX+1)*8,(BallY+1)*8," ",,9,,green
  Pause 100
  Text (BallX+1)*8,(BallY+1)*8,Chr$(arrow),,9,,green
  Play tone freq1,freqa,200
  Pause 100
  Text (BallX+1)*8,(BallY+1)*8," ",,9,,green
  Play tone freq1,freqa,200
  Pause 100
  Text (BallX+1)*8,(BallY+1)*8,Chr$(arrow),,9,,green
  Play tone freq2,freqb,200
  Pause 100
  Text (BallX+1)*8,(BallY+1)*8," ",,9,,green
  Play tone freq2,freqb,200
  Pause 100
  Text (BallX+1)*8,(BallY+1)*8,Chr$(arrow),,9,,green
  Pause 100
  Text (BallX+1)*8,(BallY+1)*8," ",,9,,red
  Pause 100
  Text (BallX+1)*8,(BallY+1)*8,Chr$(arrow),,9,,green
End Sub

Sub HitAWall
  Ricochet
  BallX=OldBallX
  BallY=OldBallY
  BallXDir=-BallXDir
  BallYDir=-BallYDir
  ReverseBall
End Sub

Sub StickyWall
  BallInPlay=0
  If BallXDir=-1 Then BallStart=2
  If BallXDir=1 Then BallStart=4
  If BallYDir=-1 Then BallStart=1
  If BallYDir=1 Then BallStart=3
  Stickypaddle=1
  ChooseBall
End Sub

Sub ReverseBall
  If BallXDir=1 Then Arrow=45
  If BallXDir=-1 Then Arrow=46
  If BallYDir=1 Then Arrow=48
  If BallYDir=-1 Then Arrow=47
End Sub

Sub HitObstacle
  Ricochet
  DrawPaddle
  PlaceObstacle
  Select Case ObstacleType(t)/2
    Case ObstacleType(t)/2
      If BallXDir<>0 Then
        If BallXDir=1 Then
          Select Case BallY
            Case ObstacleY(t)
              BallXDir=-1:BallY=BallY+1
            Case ObstacleY(t)+1
              BallXDir=0:BallYDir=1
          End Select
        Else
          Select Case BallY
            Case ObstacleY(t)
              BallYDir=-1:BallXDir=0
            Case ObstacleY(t)+1
              BallXDir=1:BallY=BallY-1
          End Select
        End If
      Else
         If BallYDir=1 Then
          Select Case BallX
            Case ObstacleX(t)
              BallXDir=-1:BallYDir=0
            Case ObstacleX(t)+1
              BallYDir=-1:BallX=BallX-1
          End Select
        Else
          Select Case BallX
            Case ObstacleX(t)
              BallYDir=1:BallX=BallX+1
            Case ObstacleX(t)+1
              BallYDir=0:BallXDir=1
          End Select
        End If
      End If
    Case Int(ObstacleType(t)/2)
      If BallXDir<>0 Then
        If BallXDir=1 Then
          Select Case BallY
            Case ObstacleY(t)
              BallXDir=0:BallYDir=-1
              Case ObstacleY(t)+1
              BallXDir=-1:BallY=BallY-1
          End Select
        Else
          Select Case BallY
            Case ObstacleY(t)
              BallXDir=-1:BallY=BallY+1
            Case ObstacleY(t)+1
              BallXDir=0:BallYDir=1
          End Select
        End If
      Else
        If BallYDir=1 Then
          Select Case BallX
            Case ObstacleX(t)
              BallYDir=-1:BallX=BallX+1
            Case ObstacleX(t)+1
              BallYDir=0:BallXDir=1
          End Select
        Else
          Select Case BallX
            Case ObstacleX(t)
              BallYDir=0:BallXDir=-1
            Case ObstacleX(t)+1
              BallYDir=1:BallX=BallX-1
          End Select
        End If
      End If
  End Select
  ReverseBall
End Sub

Sub KillPlayer
  DrawPaddle
  Lives=Lives-1
  ScoreLine
  DeathPos=1
  MusicCopy$=DeathMusic$
  Do
    Select Case DeathPos
      Case 1
        DeathColor=yellow
      Case 2
        DeathColor=orange
      Case 3
        DeathColor=red
      Case 4
        DeathColor=white
    End Select
    Text (BallX+1)*8,(BallY+1)*8,Mid$(DeathSpiral$,DeathPos,1),,9,,DeathColor
    nextspace=Instr(MusicCopy$," ")
    DeathNote=Val(Left$(MusicCopy$,NextSpace))
    MusicCopy$=Mid$(MusicCopy$,NextSpace+1,Len(MusicCopy$))
    Play tone DeathNote,DeathNote,500
    Pause 50
    DeathPos=DeathPos+1
    If DeathPos=5 Then DeathPos=1
  Loop Until MusicCopy$=""
  Text (BallX+1)*8,(BallY+1)*8," ",,9,,green
  Pause 300
  Do
    k$=Inkey$
  Loop Until k$=""
  justdied=1
  Color Green
End Sub


Sub NewGame
  XPaddleDir=0
  YPaddleDir=0
  PaddleLength=5
  BallXdir=0
  BallYdir=1
  BallInPlay=0
  SFXPrelim=1
  t=0
  k$=""
  If InGame=0 Then SetupScreen
  InGame=1
  If Lives=5 Then
    DrawPlayingArea
    DrawInfoArea
  End If
  DrawPaddle
  ScoreLine
  ChooseBall
End Sub

Sub DrawPaddle
  If InGame=1 Or YPaddle<>OldYPaddle Then
    If YPaddle>1 Then
      Text 8,YPaddle*8," ",,9,,magenta,black
    End If
    Text 8,(YPaddle+1)*8,"1",,9,,magenta,black
    Text 8,(YPaddle+2)*8,"2",,9,,magenta
    Text 8,(YPaddle+3)*8,"2",,9,,magenta
    Text 8,(YPaddle+4)*8,"2",,9,,magenta
    Text 8,(YPaddle+5)*8,"3",,9,,magenta
    Text 8,(YPaddle+6)*8," ",,9,,magenta
    Text 303,YPaddle*8," ",,9,,magenta
    Text 303,(YPaddle+1)*8,"1",,9,,magenta
    Text 303,(YPaddle+2)*8,"2",,9,,magenta
    Text 303,(YPaddle+3)*8,"2",,9,,magenta
    Text 303,(YPaddle+4)*8,"2",,9,,magenta
    Text 303,(YPaddle+5)*8,"3",,9,,magenta
    Text 303,(Ypaddle+6)*8," ",,9,,magenta
  End If
  If InGame=1 Or XPaddle<>OldXPaddle Then
    Text XPaddle*8,8," 45556 ",,9,,magenta,black
    Text XPaddle*8,271," 45556 ",,9,,magenta,black
  End If
End Sub

Sub Ricochet
  BounceNoise=BounceNoise+1
  If BounceNoise=5 Then BounceNoise=1
  Select Case BounceNoise
    Case 1
      Play tone 524,524,50
    Case 2
      Play tone 1046,1046,50
    Case 3
      Play tone 660,660,50
    Case 4
      Play tone 784,784,25
      Pause 70
      Play tone 784,784,50
  End Select
  nopause=1
End Sub

Sub Game
    InGame=0
    Xpaddle=16
    YPaddle=14
    Lives=5
    NewGame
    Do
      PlayMusic
      OldXPaddle=XPaddle
      OldYPaddle=YPaddle
      XPaddle=XPaddle+XPaddleDir
      YPaddle=YPaddle+YPaddleDir
      If YPaddle=0 Then YPaddle=1
      If YPaddle=29 Then YPaddle=28
      If XPaddle=0 Then XPaddle=1
      If XPaddle=33 Then XPaddle=32
      Select Case BallInPlay
        Case 0 'Not in play, move with paddle
          Select Case BallStart
            Case 1,3
              BallX=XPaddle+2
              End If
            Case 2,4
              BallY=YPaddle+2
          End Select
        Case 1
          BallX=BallX+BallXDir
          BallY=BallY+BallYDir
          If BallX=0 Or BallX=37 Or BallY=0 Or BallY=33 Then
            If BallXDir<>0 And BallY>YPaddle-1 And BallY<YPaddle+PaddleLength Then
              If LastCollision=1 Or LastCollision=0 Then
                StickyWall
              Else
                LastCollision=0
                HitAWall
              End If
            Else
              If BallYDir<>0 And BallX>XPaddle-1 And BallX<XPaddle+PaddleLength Then
                If LastCollision=1 Or LastCollision=0 Then
                  StickyWall
                Else
                  LastCollision=0
                  HitAWall
                End If
              Else
                Text (OldBallX+1)*8,(OldBallY+1)*8," "
                ShowScore=Score
                KillPlayer
                If Lives>0 Then NewGame
              End If
            End If
          Else
            If Grid(BallX,BallY)=100 Then
              FoundObstacle=0
              For t=1 To NumObstacles
                If BallX>ObstacleX(t)-1 And BallX<ObstacleX(t)+2 And BallY>ObstacleY(t)-1 And BallY<ObstacleY(t)+2 Then FoundObstacle=t
              Next t
              t=FoundObstacle
              Select Case ObstacleType(t)
                Case 2
                  ObstacleType(t)=Int(Rnd*10)+4
                  HitObstacle
                  lastcollision=2
                Case 5,6,7,8,9,10,11,12,13
                  score=score+((ObstacleType(t)-4)*10)
                  ObstacleType(t)=2
                  HitObstacle
                  lastcollision=3
                Case 3,4
                    BallX=OldBallX
                    BallY=OldBallY
                    PlaceObstacle
                    For i=1 To 4
                      If i/2=Int(i/2) Then
                        explosion=56
                        excolor=red
                      Else
                        explosion=57
                        excolor=white
                      End If
                      Text (ObstacleX(t)+1)*8,(obstacleY(t)+1)*8,Chr$(explosion),,9,2,excolor
                      Text (BallX+1)*8,(BallY+1)*8," ",,9,,yellow,black
                      Play tone 2093,0,200
                      Pause 100
                      If i/2=Int(i/2) Then
                        explosion=58
                        excolor=orange
                      Else
                        explosion=59
                        excolor=yellow
                      End If
                      Text (ObstacleX(t)+1)*8,(ObstacleY(t)+1)*8,Chr$(explosion),,9,2,excolor
                      Text (BallX+1)*8,(BallY+1)*8,Chr$(arrow),,9,,green,black
                      Pause 200
                    Next i
                    ObstacleType(t)=2
                    PlaceObstacle
                    ShowScore=Score
                    KillPlayer
                    If Lives>0 Then NewGame
              End Select
            Else
              If Grid(BallX,BallY)=1 Then
                If BallX+BallXDir<>1 And BallX+BallXDir<>36 And BallY+BallYDir<>1 And BallY+BallYDir<>32 Then
                  If Grid(BallX+BallXDir,BallY+BallYDir)=0 Then
                    Grid(BallX+BallXDir,BallY+BallYDir)=1
                    Grid(BallX,BallY)=0
                    Text (BallX+BallXDir+1)*8,(BallY+BallYDir+1)*8,"+",,9,,cyan,black
                  Else
                    BallX=OldBallX
                    BallY=OldBallY
                 End If
                End If
                BallXDir=-BallXDir
                BallYDir=-BallYDir
                lastcollision=1
                ReverseBall
                Ricochet
              End If
            End If
          End If
        End If
      End If
    End Select
    If OldBallX<>BallX Or OldBallY<>BallY Then
      If Grid(OldBallX,OldBallY)=0 Then
        Text (OldBallX+1)*8,(OldBallY+1)*8," ",,9,,,black
      Else
        If Grid(OldBallX,OldBallY)=1 Then
          Text (OldBallX+1)*8,(OldBallY+1)*8,"+",,9,1,cyan'black
        End If
        If t<>0 Then
          PlaceObstacle
        End If
      End If
      Text (BallX+1)*8,(BallY+1)*8,Chr$(arrow),,9,,green
      OldBallX=BallX
      OldBallY=BallY
    End If
    If XPaddle<>OldXPaddle Then
      If XPaddle<1 Or XPaddle>32 Then
        XPaddle=OldXPaddle
        If BallInPlay=0 And (Ballstart=1 Or BallStart=3) Then BallX=XPaddle+2
        DrawPaddle
      Else
        DrawPaddle
      End If
    End If
    If YPaddle<>OldYPaddle Then
      If YPaddle=0 Or YPaddle=29 Then
        YPaddle=OldYPaddle
        If BallInPlay=0 And (Ballstart=2 Or BallStart=4) Then BallY=YPaddle+2
      Else
        DrawPaddle
      End If
    End If
    k$=LCase$(Inkey$)
    Select Case k$
      Case Chr$(128),"w"
        YPaddleDir=-1
      Case Chr$(129),"s"
        YPaddleDir=1
      Case Chr$(130),"a"
        XPaddleDir=-1
      Case Chr$(131),"d"
        XPaddleDir=1
      Case "P","p"
        Text 0,308,">>>>>>>>>>>>>>>>        <<<<<<<<<<<<<<<<",,1,,blue,white
        Text 136,308,"Paused",,1,,pink,white
        Do
          kk$=Inkey$
        Loop Until kk$<>""
        DrawInfoAreA
      Case "e"
        If BallInPlay=0 Then
          GameToEditor
          DrawPlayingArea
          Clearinfoblock
          Editor
'          EditorToGame
          DrawInfoArea
          DrawPlayingArea
          BallInPlay=0
          DrawPaddle
          ChooseBall
        End If
        k$=""
      Case " ",Chr$(10),Chr$(13)
        If SFXPrelim=1 Then
          SFXPrelim=0
          SpaceAction$="stop paddle"
          DrawInfoArea
        End If
        If BallInPlay=1 Then
          XPaddleDir=0
          YPaddleDir=0
        Else
          BallInPlay=1
          DrawInfoArea
        End If
      Case Chr$(9)
        If BallInPlay=0 Then
          ChooseBall
        End If
    End Select
    CumulativePause=CumulativePause+PauseLength
    If CumulativePause>=1000 Then
      CumulativePause=0
      For t=1 To NumObstacles
        If ObstacleType(t)<>2 Then
            ObstacleType(t)=ObstacleType(t)-1
            If ObstacleType(t)=4 Then
              If Rnd<.9 Then
                ObstacleType(t)=Int(Rnd*9)+5
              Else
                ObstacleType(t)=3
              End If
            End If
        End If
        PlaceObstacle
      Next t
    End If
    If CumulativePause/100=Int(CumulativePause/100) Then ScoreLine
  Loop Until Lives=0 Or k$=Chr$(27)
  ClearInfoBlock
  ScorePos=0
  ScoreMessage$=" Score: "+Str$(score)+" "
  Text (BallX+1)*8,(BallY+1)*8," "
  DrawPaddle
  For t=1 To Len(ScoreMessage$)
    If t<8 Then
      scorecolor=white
    Else
      ScorePos=ScorePos+1
      Select Case ScorePos
        Case 1
          ScoreColor=red
        Case 2
          ScoreColor=white
        Case 3
          ScorePos=0
          ScoreColor=blue
      End Select
    End If
    Text 160-(16*Len(ScoreMessage$)/2)+(16*(t-1)),273,Mid$(ScoreMessage$,t,1),,1,2,scorecolor,black
  Next
  Text 0,307,"      Press any key to play again.",,1,1,white,black
  EndingMusic=1
  k$=""
  Do
    PlayQueue$=GameEnd$(EndingMusic)
    Do
      PlayMusic
      k$=Inkey$
    Loop Until PlayQueue$="" Or k$<>""
    EndingMusic=EndingMusic+1
  Loop Until k$<>"" Or EndingMusic=5
  PlayQueue$=""
  score=0
  Text 8,8,String$(36,32),,1,,,black
  Text 8,272,String$(36,32),,1,,,black
  Text 0,280,String$(40,43),,9,1,cyan,black
  ClearInfoBlock
End Sub


CLS
Font 9
Color cyan,black
Print " ";
Color blue,orange
logo$="                                      ":logoline
logo$="  ++++  ++++ +++   ++  +  + +   + +++   ":logoline
logo$="  +   + +    +  + +  + +  + ++  + +  +  ":logoline
logo$="  +   + +    +  + +  + +  + + + + +  +  ":logoline
logo$="  ++++  +++  +++  +  + +  + + + + +  +  ":logoline
logo$="  +   + +    +  + +  + +  + +  ++ +  +  ":logoline
logo$="  +   + +    +  + +  + +  + +   + +  +  ":logoline
logo$="  +   + ++++ +++   ++   ++  +   + +++   ":logoline
Color cyan,black
Print " ++++++++++++++++++++++++++++++++++++++";
Print                                       ""
Font 1
Color white
Print
Print
Print "   Use the paddles to keep your arrow"
Print "   within the playing field.  Collect"
Print "     points by hitting the numbered"
Print "  targets, but avoid hitting the zero."
Text 30,272,"%$#",,8,2,RGB(yellow)
Text 30,288," !"+Chr$(34),,8,2,RGB(brown)
Text 78,288,"Sacred Potato Productions",,1,,RGB(white)
Text 80,304,"Some rights reserved.",,1,,RGB(white)
PlayQueue$=Start$
Text 130,170,"9",,9,8,orange,black
Text 146,190,"*",,9,4,gray,orange
Text 105,190,"-",,9,4,green,black
Do
  k$=Inkey$
  PlayMusic
Loop Until k$<>""
CLS 'ClearInfoBlock
If k$=Chr$(27) Then
  CLS
  Print "What am I, chopped liver?"
  End
End If
SetupScreen
k$="n"
Font 1
Do
  If k$="n" Then
    PlayQueue$=beedoo$
    ClearPlayingArea
    InGame=0
    LevelLength=0
    Do
      Read p$
      If Len(p$)>2 Then
        LevelLength=LevelLength+1
        Level$(LevelLength)=p$
        ProcessInput
      End If
    Loop Until Left$(p$,1)="X" And Len(p$)<3
    If p$="XX" Then Restore
    DrawPlayingArea
  End If
  Text 80,288,"Welcome to Rebound!",,1,,white
  Text 8,300,"Space=play        N=next         E=edit",,1,,white
  Do
    k$=LCase$(Inkey$)
    PlayMusic
  Loop Until k$<>""
  Select Case k$
    Case "e"
      Editor
      Game
    Case " ",Chr$(10),Chr$(13)
      EditorToGame
      Game
      ClearPlayingArea
      For c=1 To LevelLength
        p$=Level$(c)
        ProcessInput
      Next
      InGame=0
      DrawPlayingArea
      k$=""
    Case Chr$(27)
      exitGame=1
  End Select
Loop Until ExitGame=1
CLS
