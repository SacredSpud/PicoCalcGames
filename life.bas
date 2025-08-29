' John Conway's The Game of Life
' (C) 2025 by Sacred Potato Productions
' is licensed under GNU General Public License v3.0
' To view a copy of this license, visit
' https://www.gnu.org/licenses/gpl-3.0.en.html
'
' Adapted from Conways Game of Life by C0n57an71n
' https://forum.clockworkpi.com/t/conways-game-of-life/19133

DefineFont #8
  5F200808
  0403000001060404
  06F90000FF000000
  20C00000C0202020
  0000000000008000
  0000000000FF00FF
  0000000000000100
End DefineFont

Data "        * * * * * * * *         "
Data "         * * * * * * *          "
Data "        * * * * * * * *         "
Data "                   * *          "
Data "                    * *         "
Data "                   * *          "
Data "                    * *         "
Data "                   * *          "
Data "                                "
Data "       * * *       * *          "
Data "        * *         * *         "
Data "       * * * * * * * *          "
Data "        * * * * * * * *         "
Data "       * * * * * * * *          "
Data "        * *         * *         "
Data "                                "
Data "        * * * * * * * *         "
Data "       * * * * * * * *          "
Data "        * * * * * * * *         "
Data "       * *   * *                "
Data "        * *   * *               "
Data "       * *   * *                "
Data "        * *   * *               "
Data "                                "
Data "        * * * * * * * *         "
Data "       * * * * * * * *          "
Data "        * * * * * * * *         "
Data "       * *   * *   * *          "
Data "        * *   *     * *         "
Data "       * *   * *   * *          "
Data "        * *   *     * *         "
Data "       * *           *          "

Option DEFAULT INTEGER
Randomize Timer

'-----------------------------
' Config
'-----------------------------
Const SCRW = 320
Const SCRH = 320
Const CELL = 10                 ' Try 10 or 8 for speed; 5 if you want more detail (slower)
Const W = SCRW \ CELL
Const H = SCRH \ CELL

' Colors

Dim wt(10),editc(10)
wt(1) = RGB(white)
wt(2) = RGB(red)
wt(3) = RGB(orange)
wt(4) = RGB(yellow)
wt(5) = RGB(green)
wt(6) = RGB(cyan)
wt(7) = RGB(blue)
wt(8) = RGB(magenta)
wt(9) = RGB(gray)
wt(10) = RGB(black)
editc(1) = RGB(red)
editc(2) = RGB(cyan)
editc(3) = RGB(blue)
editc(4) = RGB(red)
editc(5) = RGB(red)
editc(6) = RGB(red)
editc(7) = RGB(white)
editc(8) = RGB(cyan)
editc(9) = RGB(green)
editc(10) = RGB(red)

Const INIT_FILL_PCT = 25
Const STATUS_EVERY = 1

Dim a(W+1, H+1)     ' current
Dim b(W+1, H+1)     ' next
Dim gen, upd

colors$="1234567890"
bgcolors$="!@#$%^&*()"
running$ = "running"
StatusBarOn = 1
editx = 1
edity = 1
OldEditX=1
OldEditY=1
bg = 10
colorcycle=0
CellStyle=1
filled=1
CLS wt(bg)

'-----------------------------
' Seed/Clear
'-----------------------------
Sub SeedRandom(pct%)
  Local x, y
  For y = 1 To H
    For x = 1 To W
      a(x,y) = (Rnd * 100 < pct%)
    Next x
  Next y
  ResetEdit
End Sub

Sub ClearAll
  Local x, y
  For y = 1 To H
    For x = 1 To W
      a(x,y) = 0
    Next x
  Next y
  ResetEdit
End Sub

Sub ResetEdit
  Local EditX,EditY,EditC
  EditX = 0
  EditY = 0
  OldEditX = 0
  OldEditY = 0
  OldC = a(0,0)
End Sub

'-----------------------------
' Draw
'-----------------------------
Sub DrawCELL(x, y, alive)
  Local x1, y1, c
  If alive Then c = wt(fg) Else c = wt(bg)
  If filled=1 Then fc=c Else fc=wt(bg)
    x1 = (x-1) * CELL
    y1 = (y-1) * CELL
    Box x1, y1, CELL, CELL, , c, fc
  End If
End Sub

Sub DrawAll
  Local x, y
  For y = 1 To H
    For x = 1 To W
      DrawCELL x, y, a(x,y)
    Next x
  Next y
End Sub

Sub StatusBar
  ' redraw occasionally to avoid extra drawing overhead
  If StatusBarOn = 1 Then
    Text 2, 2, "Generation:" + Str$(gen)+"   Speed: "+Str$((1000-PauseLength)/100)+" ",,,,wt(1),wt(0)
  End If
End Sub

'-----------------------------
' Init
'-----------------------------
For t=1 To 32
  Read logo$
  For d=1 To 32
    If Mid$(logo$,d,1)=" " Then ch=0 Else ch=1
    a(t,d)=ch
  Next d
Next t
fg=5
DrawAll
Text 109,25,"John Conway's",,,,RGB(white)
Text 96,40,"The Game of",,2,,RGB(white)
Text 67,255,"Press F1 for assistance",,,,RGB(white)
Text 71,270,"Press any key to begin",,,,RGB(white)
Text 30,288,"%$#",,8,2,RGB(yellow)
Text 30,304," !"+Chr$(34),,8,2,RGB(brown)
Text 78,304,"Sacred Potato Productions",,1,,RGB(white)
gen = 0
upd = 0
Do While k$=""
  k$=UCase$(Inkey$)
Loop

fg=6
If k$<>"C" And k$<>"F" Then
  'CLS
  SeedRandom INIT_FILL_PCT
  DrawAll
  If k$=Chr$(145) Or k$="?" Then OldKey$="?"
Else
  CLS
  If k$="F" Then Filled=0
  DrawAll
End If
StatusBar

'-----------------------------
' Main loop
'-----------------------------
Do
  ' input (non-blocking)
  If OldKey$<>"" Then
    k$=OldKey$
    OldKey$=""
  Else
    k$ = Inkey$
  EndIf
  If k$ <> "" Then
    oldfg = fg
    oldbg = bg
    If Instr(colors$+bgcolors$,k$)<>0 Then
      fgpos=Instr(colors$,k$)
      bgpos=Instr(bgcolors$,k$)
      If fgpos<>0 Then
        fg=fgpos
      Else
        bg=bgpos
      EndIf
    Else
      Select Case UCase$(k$)
        Case "?",Chr$(145)  ' display help
          Box 0,82,320,156,, RGB(white),RGB(white)
          Box 3,85,314,150,, RGB(red)
          Text 96,82,"The Game of Life",,1,,RGB(black),RGB(white)
          Text 16,106,"[Spc]  Pause (Edit mode)/toggle cell",,,,RGB(black),RGB(white)
          Text 16,118,"[Esc]  Quit/Exit edit mode",,,,RGB(black),RGB(white)
          Text 16,130," +/-   Increase or decrease speed",,,,RGB(black),RGB(white)
          Text 16,142,"  S    Toggle status bar",,,,RGB(black),RGB(white)
          Text 16,154,"  C    Clear",,,,RGB(black),RGB(white)
          Text 16,166,"  R    Reseed",,,,RGB(black),RGB(white)
          Text 16,178," 0-9   Set cell color",,,,RGB(black),RGB(white)
          Text 16,190," !-)   Set background color",,,,RGB(black),RGB(white)
          Text 16,202,"  H    Highlight new growth",,,,RGB(black),RGB(white)
          Text 16,214,"  F    Toggle filled cells",,,,RGB(black),RGB(white)
          k$=""
          Do While k$=""
            k$=Inkey$
          Loop
          OldKey$=k$
          DrawAll
        Case "S"         ' toggle status bar
          StatusBarOn = -StatusBarOn
          DrawAll
          If StatusBarOn = 1 Then StatusBar
        Case "-"         ' decrease speed
          If PauseLength < 1000 Then
            PauseLength = PauseLength+100
          End If
          StatusBar
        Case "+"         ' increase speed
          If PauseLength>0 Then
            PauseLength = PauseLength-100
          End If
          StatusBar
        Case " "         ' pause/resume
          If Running$ = "running" Then
            running$ = "paused"
            DrawAll
          Else
            If a(EditX,EditY) = 1 Then
              a(EditX,EditY) = 0
            Else
              a(EditX,EditY) = 1
            End If
          End If
        Case "F"         ' toggle style
          If filled=1 Then filled=0 Else filled=1
          DrawAll
        Case "R"         ' reseed
          SeedRandom INIT_FILL_PCT
          DrawAll
          gen = 0: upd = 0
          StatusBar
        Case "C"         ' clear
          ClearAll
          DrawAll
          running$="paused"
          gen = 0: upd = 0
          StatusBar
        Case Chr$(27),Chr$(13)  ' Esc
          If Running$ = "paused" Then
            Running$ = "running"
            If a(EditX,EditY) = 1 Then
              c = wt(fg)
            Else
              c = wt(bg)
            End If
            If filled=1 Then fc=c Else fc=wt(bg)
            Box (EditX-1)*CELL, (EditY-1)*CELL, CELL, CELL, , c, fc
          Else
            If k$ = Chr$(27) Then
              Box 0, 142, 320, 30, , RGB(white), RGB(white)
              Box 3, 145, 314, 24, , RGB(red)
              Text 18,151,"Are you sure you want to quit? (y/N)",,1,,RGB(black),RGB(white)
              k$=""
              Do While k$=""
                k$=Inkey$
              Loop
              If k$=Chr$(27) Or LCase$(k$)="y" Then
                Color RGB(green),RGB(black)
                CLS
                End
              Else
                DrawAll
              EndIf
            End If
          End If
        Case Chr$(128)   ' Up
          If EditY > 1 and running$="paused" Then
            EditY = EditY-1
          End If
        Case Chr$(131)   ' right
          If EditX < W and running$="paused" Then
            EditX = EditX+1
          End If
        Case Chr$(130)  ' Left
          If EditX > 1 and running$="paused" Then
            EditX = EditX-1
          End If
        Case Chr$(129)  ' down
          If EditY < H and running$="paused" Then
            EditY = EditY+1
          End If
        Case "H"
          If ColorCycle=1 Then
            ColorCycle=0
          Else
            ColorCycle=1
          End If
      End Select
    End If
    If fg<>OldFG Or bg<>OldBg Then
      DrawAll
    EndIf
  Else
    If running$="running" And k$="" Then
      Pause PauseLength
    EndIf
  EndIf

  If running$ = "running"  Then
    ' ----- compute next gen into b(), inline neighbor counting with wrap -----
    For y = 1 To H
      ym = y - 1': If ym < 0 Then ym = H - 1
      yp = y + 1': If yp = H Then yp = 0
      For x = 1 To W
        xm = x - 1': If xm < 0 Then xm = W - 1
        xp = x + 1': If xp = W Then xp = 0

        n = a(xm,ym) + a(x,ym) + a(xp,ym) + a(xm,y) + a(xp,y) + a(xm,yp) + a(x,yp) + a(xp,yp)

        If a(x,y) Then
          b(x,y) = (n = 2) Or (n = 3)
        Else
          b(x,y) = (n = 3)
        EndIf
      Next x
    Next y

    ' ----- draw only the CELLs that changed -----
    If ColorCycle=1 Then
      fg=fg+1
      If fg=bg Then fg=fg+1
      If fg=11 Then fg=1
    End If
    For y = 1 To H
      For x = 1 To W
        If b(x,y) <> a(x,y) Then DrawCELL x, y, b(x,y)
      Next x
    Next y

    ' ----- copy b -> a -----
    For y = 1 To H
      For x = 1 To W
        a(x,y) = b(x,y)
      Next x
    Next y

    gen = gen + 1
    upd = upd + 1
    If upd >= STATUS_EVERY And running$="running" Then
      upd = 0
      StatusBar
    EndIf
  Else
      If running$ = "paused" And K$<>""  Then
        If a(editx,edity) = 1 Then
          c = wt(fg)
        Else
          c = wt(bg)
        End If
        If filled=1 Then oldfc=oldc Else oldfc=wt(bg)
        If EditX<>OldEditX Or EditY<>OldEditY Then Box (OldEditX-1)*CELL, (OldEditY-1)*CELL, CELL, CELL, , oldc, oldfc
        editbg=c
        Box (EditX-1)*CELL,(EditY-1)*CELL , CELL, CELL, , editc(fg), editbg
        Line (EditX-1)*CELL,(EditY-1)*CELL),(EditX*CELL)-1,(EditY*CELL)-1,,editc(fg)
        Line (EditX-1)*CELL,(EditY*CELL)-1,(EditX*CELL)-1,(EditY-1)*CELL,,editc(fg)
        OldEditX = EditX
        OldEditY = EditY
        OldC = c
      EndIf
  EndIf
Loop
