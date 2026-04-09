Data 104,110,117,123,131,139,147,156
Data 165,175,185,196,208,220
Data 233,247,262,277,294,311,330,349
Data 370,392,415,440,466
Data 415,440,466,494,523
Data 554,587,622,659,698,740,784
Data 831,880,932,988,1047,1109,1175
Data 1245,1319,1397,1480,1568,1661,1760,1865
ins=1

Sub insert
        If s=1 Then
          top=35
          If ins=1 Then
            For t=52 To n+1 Step -1
              If lc(cp,t)<>0 Then oldp=0
              lc(cp,t)=lc(cp,t-1)
              ql(cp,t)=ql(cp,t-1)
            Next
          End If
        Else
          top=145
          If ins=1 Then
            For t=52 To n+1 Step -1
              If lc(cp,t)<>0 Then oldp=0
              rc(cp,t)=rc(cp,t-1)
              qr(cp,t)=qr(cp,t-1)
            Next
          End If
        End If
End Sub

Sub erasenote
        Box n*6,top,6,93,,0,0
        For t=1 To 5
          Line n*6,40+(t*12),(n*6)+6,40+(t*12),,RGB(white)
          Line oldn*6,150+(t*12),(n*6)+6,150+(t*12),,RGB(white)
        Next
End Sub

Sub GetFile
  Box 40,150,240,22,2,RGB(white),0
  fn$=""
  Do
    Text 45,155,"Enter filename: "+fn$+Chr$(219)+" "
    Do
      i$=Inkey$
    Loop Until i$<>""
    If i$>" " And i$<Chr$(127) Then
      fn$=fn$+i$
    End If
    If i$=Chr$(8) And Len(fn$)>1 Then
      fn$=Mid$(fn$,1,Len(fn$)-1)
    Else
      If i$=Chr$(8) Then fn$=""
    End If
    If i$=Chr$(27) Then fn$=""
  Loop Until i$=Chr$(13) Or i$=Chr$(27)
End Sub


Sub DumpRoutine
Print #2,"Sub PlayMusic"
Print #2,"  If playqueue$="+Chr$(34)+Chr$(34)+" Then PickMusic"
Print #2,"  Do"
Print #2,"    Pause PauseIncrement"
Print #2,"    CurrentPause=CurrentPause+PauseIncrement"
Print #2,"    If CurrentPause>=NoteLength Then"
Print #2,"      If CurrentNote$<>"+Chr$(34)+Chr$(34)+" And CurrentLength<NoteLength Then"
Print #2,"        If freqx<>0 Then Play Tone FreqX,FreqY,200"
Print #2,"        CurrentLength=CurrentLength+PauseLength"
Print #2,"      Else"
Print #2,"        CurrentNote$="+Chr$(34)+Chr$(34)+""
Print #2,"        CurrentLength=0"
Print #2,"        If PlayQueue$<>"+Chr$(34)+Chr$(34)+" Then"
Print #2,"          currentnote$=Left$(PlayQueue$,Instr(PlayQueue$,"+Chr$(34)+" "+Chr$(34)+"))"
Print #2,"          playqueue$=Mid$(PlayQueue$,Len(currentNote$)+1,Len(PlayQueue$))"
Print #2,"          Select Case CurrentNote$"
Print #2,"            Case "+Chr$(34)+"0 "+Chr$(34)+""
Print #2,"              FreqX=0"
Print #2,"              FreqY=0"
Print #2,"            Case "+Chr$(34)+"X "+Chr$(34)+","+Chr$(34)+"- "+Chr$(34)+""
Print #2,"            Case Else"
Print #2,"              freqx=Val(currentnote$)"
Print #2,"              If Instr(CurrentNote$,"+Chr$(34)+"|"+Chr$(34)+")<>0 Then"
Print #2,"                freqy=Val(Mid$(Currentnote$,Instr(CurrentNote$,"+Chr$(34)+"|"+Chr$(34)+")+1,Len(CurrentNote$)))"
Print #2,"              Else"
Print #2,"                FreqY=FreqX"
Print #2,"          End Select"
Print #2,"          If FreqX<>0 Or CurrentNote$="+Chr$(34)+"X "+Chr$(34)+" Then"
Print #2,"            Play tone freqx,freqy,200"
Print #2,"          Else"
Print #2,"            If CurrentNote$="+Chr$(34)+"- "+Chr$(34)+" Then Play tone 0,0,NoteLength*3"
Print #2,"          End If"
Print #2,"        End If"
Print #2,"      End If"
Print #2,"    End If"
Print #2,"  Loop Until CurrentPause>=PauseLength"
Print #2,"  CurrentPause=0"
Print #2,"  End If"
Print #2,"End Sub"
Print #2,""
Print #2,"notelength=";Str$(notelength)
Print #2,"pauselength=";Str$(pauselength)
Print #2,"pauseincrement=";Str$(pauseincrement)
End Sub

Sub ClearAll
  For t=1 To 25
    For tt=1 To 52
      lc(t,tt)=0
      rc(t,tt)=0
      qr(t,tt)=0
      ql(t,tt)=0
    Next
  Next
End Sub

Sub DumpPayload
              For t=1 To 25
                lastnote=0
                good=0
                For tt=52 To 1 Step-1
                  If lc(t,tt)<>0 Or rc(t,tt)<>0 Then
                    good=1
                    If lastnote=0 Then lastnote=tt
                  End If
                Next
                If good=1 Then
                  Print #2,"' pattern "+Str$(t)
                  b$="Data "+Chr$(34)
                  For tt=1 To lastnote
l=lc(t,tt)
r=rc(t,tt)
If l=9999 Then l=0
If r=9999 Then r=0
If l=0 And r=0 Then jj$="0"
If l=0 And r<>0 Then Jj$=Str$(r)
If l<>0 And r=0 Then Jj$=Str$(l)
If l<>0 And r<>0 Then Jj$=Str$(l)+"|"+Str$(r)
If Jj$=oJJ$ Then jj$="X"
If Len(b$)+Len(jj$)>40 Then
  Print #2,b$+Chr$(34)
  b$="data "+Chr$(34)
End If
b$=b$+jj$+" "
If jj$<>"X" Then ojj$=jj$

                  Next
                  Print #2,b$
                End If
              Next
              payload=1
End Sub

Dim integer lc(25,52)
Dim integer rc(25,52)
Dim ql(25,52)
Dim qr(25,52)
Dim integer f(2,27)
Dim integer oc(4)

For x=1 To 2
  For y=1 To 27
    Read f(x,y)
  Next
Next

oc(1)=RGB(orange)
oc(2)=RGB(magenta)
oc(3)=RGB(yellow)
oc(4)=RGB(pink)
notelength=40
pauselength=40
pauseincrement=10


o=1 'octave
s=1 'staff
x=9
cp=1 'current page
tp=1 'total pages
n=1

Do
  CLS
  oldp=cp
  Text 0,0,"Pattern "+Str$(cp)+" "
  For t=1 To 5
    Line 0,40+(t*12),319,40+(t*12),,RGB(white)
    Line 0,150+(t*12),319,150+(t*12),,RGB(white)
  Next
  For t=1 To 52
    If lc(cp,t)>0 And lc(cp,t)<>9999 Then
      q=Int(ql(cp,t))
      sharp=ql(cp,t)-q
      If sharp<.3 And sharp<>0 Then sharp=1 Else If sharp>0 Then sharp=-1
      If lc(cp,t)<415 Then o=1 Else o=2
      If lc(cp,t)>=415 And q>12 Then o=1
      Circle ((t+1)*6)-3,118-((q)-1)*6),3,,,oc(o),oc(o)
      Select Case sharp
        Case 1
          Line (t*6)+6,118-((q-1)*6)-3,(t*6)+2,118-((q-1)*6)-3
        Case -1
          Line (t*6)+6,118-((q-1)*6)+3,(t*6)+2,118-((q-1)*6)+3
      End Select
    Else
      If lc(cp,t)=9999 Then
        Box (t)*6,51,6,50,,RGB(green),0
      End If
    End If
    If rc(cp,t)>0 And rc(cp,t)<>9999 Then
      q=Int(qr(cp,t))
      sharp=qr(cp,t)-q
      If sharp=.2 Then sharp=1
      If sharp=.4 Then sharp=-1
      If rc(cp,t)<415 Then o=1 Else o=2
      If rc(cp,t)>=415 And qr(cp,t)>12 Then o=1
      Circle ((t+1)*6)-3,228-((qr(cp,t)-1)*6),3,,,oc(o),oc(o)
      Select Case sharp
        Case 1
          Line (t*6)+6,118-((q-1)*6)-3,(t*6)+2,118-((q-1)*6)-3
        Case -1
          Line (t*6)+6,118-((q-1)*6)+3,(t*6)+2,118-((q-1)*6)+3
      End Select
    Else
      If rc(cp,t)=9999 Then
        Box (t)*6,161,6,50,,RGB(green),0

      End If
    End If
  Next t
  Do
    If s=1 Then y=118 Else y=228
    If ox<>x Or oy<>y Or oldn<>n Then
      Circle ((oldn+1)*6)-3,oy-((ox-1)*6),3,,,0
      For t=1 To 5
        Line oldn*6,40+(t*12),(oldn*6)+6,40+(t*12),,RGB(white)
        Line oldn*6,150+(t*12),(oldn*6)+6,150+(t*12),,RGB(white)
      Next
    End If
    Circle ((n+1)*6)-3,y-((x-1)*6),3,,,oc(o+2)
    Do
      i$=Inkey$
    Loop Until i$<>""
    ox=x
    oy=y
    oldn=n
    Select Case i$
      Case "<",","
        If cp>1 Then cp=cp-1
      Case ">","."
        If cp<25 Then cp=cp+1
      Case Chr$(27)
        oldp=0
        Box 90,150,140,20,2,RGB(white),0
        Text 95,155,"Really Quit? y/N"
        Do
          i$=Inkey$
        Loop Until i$<>""
        If LCase$(i$)="y" Then CLS :End
      Case Chr$(131)
        If n<52 Then n=n+1
      Case Chr$(130)
        If N>1 Then n=n-1
      Case Chr$(129)
        If x>0 Then x=x-1
      Case Chr$(128)
        If x<14 Then x=x+1
      Case Chr$(9)
        If s=1 Then s=2 Else s=1
      Case "+"
        If sharp=1 Then sharp=0 Else sharp=1
      Case "-"
        If sharp=-1 Then sharp=0 Else sharp=-1
      Case "o"
        If o=1 Then o=2 Else o=1
      Case Chr$(127)
        erasenote
          If s=1 Then
            lc(cp,n)=0
          Else
            rc(cp,n)=0
          End If
      Case " "
        insert
        erasenote
        If s=1 Then top=51 Else top=161
        Box n*6,top,6,50,,RGB(green),0
        If s=1 Then
          lc(cp,n)=9999
        Else
          rc(cp,n)=9999
        End If
        If N<52 Then n=n+1
      Case Chr$(13)
        insert
        erasenote
        Circle ((n+1)*6)-3,y-((x-1)*6),3,,,oc(o),oc(o)
        Select Case sharp
          Case 1
            Line (N*6)+6,y-((x-1)*6)-3,(N*6)+2,y-((x-1)*6)-3
          Case -1
            Line (N*6)+6,y-((x-1)*6)+3,(N*6)+2,y-((x-1)*6)+3
        End Select
        Select Case x
          Case 0 'A
            Select Case sharp
              Case -1
                tone=1

              Case 0
                tone=2
              Case 1
                 tone=3
            End Select
          Case 1 'B
            Select Case sharp
              Case -1
                tone=3
              Case 0
                tone=4
              Case 1
                 tone=5
            End Select
          Case 2 'C
            Select Case sharp
              Case -1
                tone=4
              Case 0
                tone=5
              Case 1
                 tone=6
            End Select
          Case 3 'D
            Select Case sharp
              Case -1
                tone=6
              Case 0
                tone=7
              Case 1
                 tone=8
            End Select
          Case 4 'E
            Select Case sharp
              Case -1
                tone=8
              Case 0
                tone=9
              Case 1
                 tone=10
            End Select
          Case 5 'F
            Select Case sharp
              Case -1
                tone=9
              Case 0
                tone=10
              Case 1
                 tone=11
            End Select
          Case 6 'G
            Select Case sharp
              Case -1
                tone=11
              Case 0
                tone=12
              Case 1
                 tone=13
            End Select
          Case 7 'A
            Select Case sharp
              Case -1
                tone=13
              Case 0
                tone=14
              Case 1
                 tone=15
            End Select
          Case 8 'B
            Select Case sharp
              Case -1
                tone=15
              Case 0
                tone=16
              Case 1
                 tone=17
            End Select
          Case 9 'C
            Select Case sharp
              Case -1
                tone=16
              Case 0
                tone=17
              Case 1
                 tone=18
            End Select
          Case 10 'D
            Select Case sharp
              Case -1
                tone=18
              Case 0
                tone=19
              Case 1
                 tone=20
            End Select
          Case 11 'E
            Select Case sharp
              Case -1
                tone=20
              Case 0
                tone=21
              Case 1
                 tone=22
            End Select
          Case 12 'F
            Select Case sharp
              Case -1
                tone=21
              Case 0
                tone=22
              Case 1
                 tone=23
            End Select
          Case 13 'G
            Select Case sharp
              Case -1
                tone=23
              Case 0
                tone=24
              Case 1
                 tone=25
            End Select
          Case 14 'A
            Select Case sharp
              Case -1
                tone=25
              Case 0
                tone=26
              Case 1
                 tone=27
            End Select
        End Select
        If s=1 Then
          ql(cp,n)=x
          If sharp=1 Then ql(cp,n)=ql(cp,n)+.2
          If sharp=-1 Then ql(cp,n)=ql(cp,n)+.4
          lc(cp,n)=f(o,tone)
        Else
          qr(cp,n)=x
          If sharp=1 Then qr(cp,n)=qr(cp,n)+.2
          If sharp=-1 Then qr(cp,n)=qr(cp,n)+.4
          rc(cp,n)=f(o,tone)
        End If
         l=lc(cp,n)
         r=rc(cp,n)
         If l=9999 Then l=0
         If r=9999 Then r=0
         Play tone l,r,800
        If N<52 Then n=n+1
        sharp=0
      Case Chr$(145)
        endnote=0
        foundnote=0
        For t=52 To 1 Step -1
          l=lc(cp,t)
          r=rc(cp,t)
          If l<>0 Or r<>0 Then foundnote=1
          If foundnote=0 And l=0 And r=0 Then endnote=t
        Next
        If endnote=0 Then endnote=52
        For t=1 To endnote
          If stopit=0 Then
            l=lc(cp,t)
            r=rc(cp,t)
            If l=9999 Then l=0
            If r=9999 Then r=0
            If l=0 And r=0 Then
              Pause pauselength
            Else
              howlong=0
              Play tone l,r,notelength
              Do
                Pause pauseincrement
              howlong=howlong+pauseincrement
              Loop Until howlong>=notelength
            End If
            If Inkey$<>"" Then stopit=1
          End If
        Next
        stopit=0
        For t=1 To 50:i$=Inkey$:Next
      Case Chr$(146)
        oldp=0
        done=0
        oldnl=notelength
        oldpl=pauselength
        oldpi=pauseincrement
        Box 60,130,190,48,2,RGB(white),0
        Text 65,135,"NoteLength:"
        Text 65,147,"PauseLength:"
        Text 65,159,"PauseIncrement:"
        mi=1
        Do
          If mi=1 Then cc=RGB(white) Else cc=RGB(green)
          Text 190,135,Str$(notelength)+" ",,,,cc
          If mi=2 Then cc=RGB(white) Else cc=RGB(green)
          Text 190,147,Str$(pauselength)+" ",,,,cc
          If mi=3 Then cc=RGB(white) Else cc=RGB(green)
          Text 190,159,Str$(pauseincrement)+" ",,,,cc
          i$=Inkey$
          Select Case i$
            Case Chr$(13)
              done=1
            Case Chr$(27)
              done=1
              notelength=oldnl
              pauselength=oldpl
              opauseincrement=oldpi
            Case Chr$(128)
              If mi>1 Then MI=Mi-1
            Case Chr$(129)
              If mi<3 Then mi=mi+1
            Case Chr$(130)
             Select Case mi
               Case 1
                 If notelength>5 Then notelength=notelength-5
               Case 2
                 If Pauselength>5 Then pauselength=pauselength-5
               Case 3
                 If PauseIncrement>5 Then PauseIncrement=PauseIncrement-5
             End Select
'          End Select
            Case Chr$(131)
             Select Case mi
               Case 1
                  notelength=notelength+5
               Case 2
                 pauselength=Pauselength+5
               Case 3
                 PauseIncrement=PauseIncrement+5
             End Select
          End Select
        Loop Until done=1
      Case Chr$(149)
        oldp=0
        Box 95,150,130,20,2,RGB(white),0
        Text 100,155,"S)ave or L)oad?"
        Do
          i$=LCase$(Inkey$)
        Loop Until i$<>""
        Select Case i$
          Case "s"
            getfile
            If fn$<>"" Then
              Open fn$ For output As #1
                Print #1,"SPPMusicFile"
                Print #1,Notelength,;",";pauselength;",";pauseincrement
                For t=1 To 25
                  good=0:lastnote=0
                  For tt=52 To 1 Step -1
                    If lc(t,tt)<>0 Or rc(t,tt)<>0 Then
                      good=1
                      If lastnote=0 Then lastnote=tt
                    End If
                  Next
                  If good=1 Then
'                    If lastnote=0 Then lastnote=52
                    Print #1,t,;",";lastnote
                    For tt=1 To lastnote
                      Print #1,qr(t,tt);",";ql(t,tt);",";lc(t,tt);",";rc(t,tt)
                    Next tt
                  End If
                Next
              Close #1
            End If
          Case "l"
            getfile
            If fn$<>"" Then
              Open fn$ For input As #1
                Line Input #1,a$
                If a$<>"SPPMusicFile" Then
                  Print "BAD":End
                Else
                  ClearAll
                  Input #1,Notelength,pauselength,pauseincrement
Do
                  Input #1,t,lastnote
                  For tt=1 To lastnote
'                    Line Input #1,a$
'                    cp=Val(Mid$(a$,2,Len(a$)))
                    Input #1,qr(t,tt),ql(t,tt),lc(t,tt),rc(t,tt)
                  Next
                  Loop Until Eof(1)
                End If
              Close #1
              Cp=1
        End Select
      Case Chr$(148)
        getfile
        CLS
        payload=0
        Open fn$ For input As #1
        Open "mus.tmp" For output As 2
        CLS
        Print "writng,,,"
        Do
          Line Input #1,a$
          Select Case a$
            Case "'playmusic"
              dumproutine
            Case "'musicdata"
              DumpPayload
              Print #2,"'musicdata"
            Case Else
              Print #2,a$
          End Select
        Loop Until Eof(1)

          If Payload=0 Then
            Print "No 'musicdata tag found. Dump music data at EOF? Y/n)"
            For t=1 To 20:i$=Inkey$:Next
            Do
              i$=LCase$(Inkey$)
            Loop
            If i$<>"n" Then
              DumpPayload
            End If
          End If
        Close #1
        Close #2
        On error ignore
        Kill fn$+".bak"
        On error abort
        Rename fn$ As fn$+".bak"
        On error ignore
        Kill fn$
        On error abort
        Rename "mus.tmp" As fn$
        oldp=0
        Print "DONE"
      Case Chr$(8)
        If n>1 Then
          For t=n To 52
            If s=1 Then
              lc(cp,t-1)=lc(cp,t)
              ql(cp,t-1)=ql(cp,t)
            Else
              rc(cp,t-1)=rc(cp,t)
              qr(cp,t-1)=qr(cp,t)
            End If
          Next
          If s=1 Then
            lc(cp,52)=0
            ql(cp,52)=0
          Else
            rc(cp,52)=0
            qr(cp,52)=0
          End If
          n=n-1
          oldp=0
        End If
    End Select
  Loop Until cp<>oldp
Loop
