' Picofile (C) 2025 by Sacred Potato
' Productions is licensed under
' CC BY-NC-SA 4.0. To view a copy of
' this license, visit
' https://creativecommons.org/licenses/by-nc-sa/4.0/

DefineFont #8
  5F200808
  0403000001060404
  06F90000FF000000
  20C00000C0202020
  0000000000008000
  0000000000FF00FF
  0000000000000100
End DefineFont

Sub getinput
  escapedout=0
  done=0
  current$=default$
  If startx=0 Then startx=(pointerx+1)*12
  If starty=0 Then starty=displayy
  Do
    Text starty,startx," "+current$+"_ ",,,,ec
    Do
      k$=Inkey$
    Loop Until k$<>""
    Select Case k$
      Case Chr$(13),Chr$(128),Chr$(129)
        done=1
        Text starty+8,startx,current$+" ",,,,fc
        If pointerx<>20 And k$<>Chr$(128) Then nextfield=1
      Case Chr$(8),Chr$(130)
        If Len(current$)>1 Then
          current$=Left$(current$,Len(current$)-1)
        Else
          current$=""
        End If
      Case Chr$(9), Chr$(131)
        newkey$=Chr$(9)
        done=1
        newpage=1
      Case Chr$(27)
          current$=olddefault$
        escapedout=1
        done=1
        newpage=1
      Case Else
        If k$>Chr$(31) And k$<Chr$(127) Then
          If Len(current$)<maxlen Then
            current$=current$+k$
          End If
        End If
    End Select
  Loop Until done=1
  startx=0
  starty=0
  oldpointerx=0
End Sub

Sub DisplayQuery
  ql=Len(query$)*8
  Box 161-((ql/2)+4),151,ql+8,16,,fc,fc
  Box 162-((ql/2)+4),152,ql+8,16,,fc,bg
  Box 160-((ql/2)+4),150,ql+8,16,,fc,fc
  Text 160-(ql/2),152,query$,,,,bg,fc
  If nowait=0 Then
    If responses$<>"" Then
      Do
        k$=Inkey$
      Loop Until Instr(responses$,k$)
    Else
      Do
        k$=Inkey$
      Loop Until k$<>""
    End If
  End If
End Sub

Sub resetpointers
  pointerx=1
  pointery=1
  oldpointerx=0
  oldpointery=0
End Sub

Sub savedb
  Open filename$+".db" For output As #1
  Print #1,title$
  Print #1,recordname$
  For t=1 To 20
    Print #1,name$(t)
  Next
  For j=1 To 100
    For t=1 To 20
      Print #1,record$(t,j)
    Next
  Next
  Close #1
End Sub

Sub loaddb
  Open filename$+".db" For input As #1
  Line Input #1,title$
  Line Input #1,recordname$
  For t=1 To 20
    Line Input #1,name$(t)
  Next
  For j=1 To 100
    For t=1 To 20
      Line Input #1,record$(t,j)
      If record$(t,j)<>"" Then TotalRecords=j
    Next t
  Next j
  Close #1
  moveon=0
End Sub

Sub clrbox
  Box 0,17,319,320,,bg,bg
End Sub

Sub writing
  For q=1 To wl
    Line wx,wy,wx,wy+3
    Line wx,wy,wx+3,wy+3
    wx=wx+4
  Next
End Sub

Sub initialize
  totalrecords=1
  currentrecord=1
  pointerx=1
  pointery=1
  displayy=0
  filename$="default"
  title$="Untitled Database"
  recordname$="Page #"
  For t=1 To 20
    name$(t)=""
    For j=1 To 100
      record$(t,j)=""
    Next
  Next
End Sub


Dim name$(20) length 16
Dim record$(20,100) length 22

fc=RGB(white) 'foreground color
bg=RGB(black) 'background color
ec=RGB(green) 'edit color
mc=RGB(yellow) 'move color
Color fc,bg

CLS
Text 30,272,"%$#",,8,2,RGB(yellow)
Text 30,288," !"+Chr$(34),,8,2,RGB(brown)
Text 78,288,"Sacred Potato Productions",,1,,RGB(white)
Text 80,304,"Some rights reserved.",,1,,RGB(white)
For t=10 To 60 Step 10
  Box t-5,t+5,260,180,,bg,fc
  Line t-4,t+20,t+253,t+20,,RGB(red)
Next
Text 58,95,"PicoFile",,3,2,RGB(blue),RGB(white)
Text 90,160,"Simple record management",,1,1,bg,fc
Text 118,175,"for your PicoCalc",,1,1,bg,fc
Text 65,200,"Press F1 at any time for help.",,1,1,bg,fc

For t=1 To 500
  If i$="" Then
    Pause 5
    i$=Inkey$
  End If
Next

If i$=Chr$(145) Then NewKey$=Chr$(145)

initialize
On error ignore
Open "db.last" For input As #1
If MM.Errno=0 Then
  Line Input #1,filename$
  Close #1
End If
loaddb
On error abort

CLS
Do
  clrbox
  Text 0,0,title$+String$(20,32)
  page$="  "+recordname$+Str$(currentrecord)
  Text 319-(8*(Len(page$))),0,page$
  Line 0,15,320,15
  Line 0,272,320,272
  Text 0,278,Chr$(149)+"prev next"+Chr$(148)+" Tab-Field/label "+Chr$(149)+Chr$(149)+"home end"+Chr$(148)+Chr$(148),,,,fc
  Text 0,290,"F4-Swap Ins-InsertField  Del-DeleteField",,,,fc
  Text 0,302,"F2-Sort F5-InsertRecord F10-DeleteRecord",,,,fc
  If moveon=currentrecord Then
    cc=mc
  Else
    cc=fc
  End If
  For t=1 To 20
    Text 8,(t+1)*12,name$(t),,,,cc
    Text 152,(t+1)*12,record$(t,currentrecord),,,,cc
  Next t
  Do
    If newpage=1 Or oldpointerx<>pointerx Or oldpointery<>pointery Then
      newpage=0
      If oldpointerx<>0 Then
        Select Case oldpointery
          Case 1
            displayy=0
          Case 2
            displayy=144
        End Select
        Text displayy,(oldpointerx+1)*12," "
      End If
      Select Case pointery
        Case 1
          displayy=0
        Case 2
          displayy=144
      End Select
      If nextfield=1 Then
        nextfield=0
        olddpointerx=pointerx
        pointerx=pointerx+1
      End If
      Text displayy,(pointerx+1)*12,">",,,,fc
    End If
    If newkey$="" Then
      Do
        i$=Inkey$
      Loop Until i$<>""
      If i$<>Chr$(127) Then oldrec$=""
    Else
      i$=newkey$
      newkey$=""
    End If
    oldpointerx=pointerx
    oldpointery=pointery
    Select Case i$

      Case Chr$(134) 'home
        newpage=1
        currentrecord=1
        resetpointers

      Case Chr$(135) 'end
        newpage=1
        currentrecord=totalrecords
        resetpointers

      Case Chr$(128) 'up
        If pointerx>1 Then pointerx=pointerx-1 Else pointerx=20

      Case Chr$(129) 'down
        If pointerx<20 Then pointerx=pointerx+1 Else pointerx=1

      Case Chr$(131) 'Right
          If currentrecord<totalrecords Then
            newpage=1:currentrecord=currentrecord+1
            resetpointers
          Else
            If totalrecords<100 Then
              For t=1 To 20
                If record$(t,currentrecord)<>"" Then notempty=1
              Next
              If notempty=1 Then
                notempty=0
                newpage=1
                resetpointers
                currentrecord=currentrecord+1
                totalrecords=totalrecords+1
              End If
            End If
          End If

      Case Chr$(130) 'left
        If currentrecord>1 Then resetpointers:newpage=1:currentrecord=currentrecord-1

      Case Chr$(9) 'Tab=toggle field
        If pointery=1 Then
          pointery=2
        Else
          pointery=1
        End If

      Case Chr$(13) 'Enter=edit field
        If pointery=1 Then
          default$=name$(pointerx)
          maxlen=16
        Else
          default$=record$(pointerx,currentrecord)
          maxlen=22
        End If
        getinput
        olddefault$=""
        If pointery=1 Then
          name$(pointerx)=current$
        Else
          record$(pointerx,currentrecord)=current$
        End If

      Case Chr$(27) 'Esc=save and quit
        If moveon<>0 Then
          If currentrecord=moveon Then newpage=1
          moveon=0
        Else
          quit=1
          query$="Save "+filename$+"? y/n"
          responses$=Chr$(27)+"YyNn"
          displayquery
          If k$="Y" Or k$="y" Then
            query$="Saving"
            nowait=1
            CLS
            displayquery
            savedb
          End If
          CLS
          Open "db.last" For output As #1
          Print #1,filename$
          Close #1
        End If

      Case Chr$(127) 'Del=delete field
        If oldrec$<>"" Then
          Text 152,(pointerx+1)*12,oldrec$,,,,fc
          record$(pointerx,currentrecord)=oldrec$
          oldrec$=""
        Else
          If pointery=1 Then
            For t=1 To 100
              If record$(pointerx,t)<>"" Then notempty=1
            Next
            If notempty=1 Then
              query$="This field isn't empty! Delete it? y/N"
              DisplayQuery
              newpage=1
              If k$="Y" Or k$="y" Then
                notempty=0
              End If
            End If
            If notempty=0 Then
              If pointerx<>20 Then
                For t=pointerx To 19
                  name$(t)=name$(t+1)
                  For j=1 To 100
                    record$(t,j)=record$(t+1,j)
                  Next
                Next
                name$(20)=""
                For t=1 To 100
                  record$(20,t)=""
                Next
              Else
                name$(20)=""
              End If
              newpage=1
            Else
              notempty=0
            End If
          Else
            oldrec$=record$(pointerx,currentrecord)
            record$(pointerx,currentrecord)=""
            Text 152,(pointerx+1)*12,String$(32,22)
          End If
        End If

      Case Chr$(132) 'Ins=Insert field
        If PointerX=20 Then
          query$="Cannot insert another field."
          displayquery
          newpage=1
        Else
          For t=20 To pointerX+1 Step -1
            For j=1 To 100
              If Record$(t,j)<>"" Then notempty=1
            Next
            If notempty=0 And foundit=0 Then foundit=t
          Next
          If FoundIt=0 Then
            Query$="No empty fields available."
            For t=1 To 20:i$=Inkey$:Next
            displayquery
            newpage=1
          Else
            For t=foundit To pointerx+1 Step -1
              name$(t)=name$(t-1)
              For j=1 To 100
                record$(t,j)=record$(t-1,j)
              Next
            Next
            For t=1 To 100
              record$(pointerx,t)=""
            Next
            name$(pointerx)=""
            newpage=1
          End If
        End If
        foundit=0
        notempty=0

      Case Chr$(145) 'f1=help
        clrbox
        Text 0,18,""
        Print
        Print
        Print "  Function Keys"
        Print
        Print "F1  = Help"
        Print "F2  = Sort"
        Print "F3  = Search"
        Print "F8  = Repeat Search"
        Print "F4  = Swap Records"
        Print "F5  = Insert Record"
        Print "F10 = Delete Record"
        Print "F7  = Change Title"
        Print "F6  = Save/Load"
        Print "F9  = New Database"
        Print
        Print
        Print
        Print "Navigate between fields using ";Chr$(146);" and ";Chr$(147);","
        Print "and between records using ";Chr$(149);" and ";Chr$(148);", and"
        Print "Home and End."
        Print
        Print "The last saved database loads automatic-"
        Print "ally. default.db loads if no previous"
        Print "database exists."
        j=35
        For t=170 To 190 Step 5
          j=j+5
          Box t,j,120,90,,fc,fb
          Line t,j+9,t+119,j+9
          Line t,j+70,t+119,j+70
        Next
        wx=192
        wy=63
        wl=18
        writing
        wx=285
        wl=6
        writing
        For wy=132 To 146 Step 6
          wx=192
          wl=29
          writing
        Next
        For wy=75 To 111 Step 6
          wx=198
          wl=Int(Rnd*4)+6
          writing
          wx=249
          wl=Int(Rnd*10)+5
          writing
        Next
        Line 247,110,247,116
        Line 306,110,306,116
        Line 247,117,306,117
        Line 196,110,196,116
        Line 235,110,235,116
        Line 196,117,235,117
        Box 213,118,5,40,,bc,bc
        Box 274,118,5,40,,bc,bc
        Line 215,111,215,170
        Line 276,111,276,200
        Text 192,172,"Labels"
        Text 252,202,"Fields"
        Line 162,35,162,153
        Line 162,35,167,35
        Line 162,153,167,153
        Line 157,94,162,94
        Line 157,94,157,200
        Text 130,202,"Records"
        Do
          k$=Inkey$
        Loop Until k$<>""
        newpage=1

      Case Chr$(146) 'f2=sort
        query$="Ascending or Descending? a/d"
        responses$="aAdD"+Chr$(27)
        displayquery
        clrbox
        nowait=1
        If k$<>Chr$(27) Then
          Do
            ordered=1
            n=n+1
            query$="Working; pass "+Str$(n)
            displayquery
            For t=1 To totalrecords
              If k$="d" Or k$="D" Then
                If LCase$(record$(pointerx,t))<LCase$(record$(pointerx,t+1)) Then
                  swapit=1
                  ordered=0
                End If
              Else
                If LCase$(record$(pointerx,t))>LCase$(record$(pointerx,t+1)) Then
                  ordered=0
                  swapit=1
                End If
              End If
              If swapit=1 Then
                swapit=0
                For j=1 To 20
                  v$=record$(j,t+1)
                  record$(j,t+1)=record$(j,t)
                  record$(j,t)=v$
                Next
              End If
            Next
          Loop Until ordered=1
          n=0
          clrbox
          query$="Cleaning up"
          displayquery
          nowait=0
          t=1
          Do
            For j=1 To 20
              If record$(j,t)<>"" Then notempty=1
            Next
            If NotEmpty=0 Then
              If t=totalrecords Then
                totalrecords=totalrecords-1
              Else
                For j=1 To 20
                  record$(t,j)=record$(t,j+1)
                  record$(t,J+1)=""
                Next
                totalrecords=totalrecords-1
              End If
            Else
              t=t+1
            End If
          Loop Until t>totalrecords-1
          If currentrecord>totalrecords Then currentrecord=totalrecords
        End If
        responses$=""
        NewPage=1
        nowait=0

      Case Chr$(147),Chr$(152) 'f3=search f8=repeat
        If i$=Chr$(147) Then
          defalt$=term$
          query$="Search for:"+String$(25,32)
          nowait=1
          displayquery
          startx=152
          starty=105
          maxlen=22
          getinput
          nowait=0
          nextfield=0
          newpage=1
          term$=current$
        End If
        If term$<>"" Then
          foundhit=0
          hitfield=0
          If currentrecord<>totalrecords Then
            For t=currentrecord+1 To totalrecords
              For j=1 To 20
                If Instr(LCase$(record$(j,t)),LCase$(term$)) Then
                  foundhit=t
                  If hitfield=0 Then hitfield=j
                End If
              Next
            Next
          End If
          If foundhit=0 And currentrecord<>1 Then
            If currentrecord>1 Then
              For t=1 To currentrecord-1
                For j=1 To 20
                  If Instr(LCase$(record$(j,t)),LCase$(term$)) Then
                    foundhit=t
                    If hitfield=0 Then hitfield=j
                  End If
                Next
              Next
              End If
          End If
          If foundhit<>0 Then pointerx=hitfield:newpage=1:currentrecord=foundhit
        End If

      Case Chr$(148) 'f4=move
        If moveon=0 Then
          moveon=currentrecord
          query$="F4-Swap record   Esc-Cancel"
          displayquery
        Else
          If moveon<>currentrecord Then
            For t=1 To 20
              v$=record$(t,currentrecord)
              record$(t,currentrecord)=record$(t,moveon)
              record$(t,moveon)=v$
            Next
          End If
          moveon=0
        End If
        newpage=1

      Case Chr$(149) 'f5=insert page
        query$="100 record limit reached."
        If currentpage=100 Or totalrecords=100 Then
          displayquery
          newpage=1
        Else
          If totalrecords<100 Then
            foundit=totalrecords+1
          End If
          For t=totalrecords To currentrecord Step -1
            For j=1 To 20
              If record$(j,t)<>"" Then notempty=1
            Next
            If foundit=0 And notempty=0 Then foundit=t
          Next
          If foundit<>0 Then
            totalrecords=totalrecords+1
            For t=totalrecords To currentrecord Step -1
              For j=1 To 20
                record$(j,t)=record$(j,t-1)
              Next
            Next
            For t=1 To 20
              record$(t,currentrecord)=""
            Next
            newpage=1
          Else
            displayquery
            newpage=1
          End If
        End If

      Case Chr$(150) 'f6=save/load
        query$="Save or load? s/l"
        displayquery
        p$=LCase$(k$)
        If Instr("sl",p$) Then
          query$="Enter filename:"+String$(20,32)
          startx=152
          starty=140
          nowait=1
          maxlen=16
          default$=filename$
          displayquery
          getinput
          nextfield=0
          filename$=current$
          nowait=0
          Select Case p$
            Case "s"
              If EscapedOut=0 Then savedb
            Case "l"
              If EscapedOut=0 Then
                On error ignore
                Open filename$+".db" For input As #1
                If MM.Errno=0 Then
                  loaddb
                Else
                  clrbox
                  query$="Can't find "+filename$+".db"
                  displayquery
                  filename$=default$
                End If
                On error abort
              End If
          End Select
        End If
        newpage=1
        startx=0
        starty=0

      Case Chr$(151) 'f7-rename db
        DEFAULT$=title$
        query$="New title:"+String$(28,32)
        nowait=1
        displayquery
        startx=152
        starty=90
        maxlen=25
        getinput
        nextfield=0
        title$=current$
        clrbox
        default$=recordname$
        query$="New record name:"+String$(17,32)
        displayquery
        startx=152
        starty=157
        maxlen=14
        newpage=1
        getinput
        nextfield=0
        recordname$=current$

      Case Chr$(153) 'f9=new
        query$="Clear database? y/n"
        displayquery
        If LCase$(k$)="y" Then initialize
        newpage=1

      Case Chr$(154) 'f10=delete page
        For t=1 To 20
          If record$(t,currentrecord)<>        "" Then notempty=1
        Next
        If notempty<>0 Then
          query$="This record not empty! Delete it? y/N"
          displayquery
          If LCase$(k$)="y" Then notempty=0
        End If
        If notempty=0 Then
          For t=currentrecord To 99
            For j=1 To 20
              record$(j,t)=record$(j,t+1)
            Next
          Next
          For t=1 To 20
            record$(t,TotalRecords)=""
          Next
          totalrecords=totalrecords-1
        End If
        notempty=0
        newpage=1

      Case Else 'Any other key
        If i$>Chr$(31) And i$<Chr$(127) Then
          If pointery=1 Then
            If Len(name$(pointerx))<16 Then
              olddefault$=name$(pointerx)
              name$(pointerx)=name$(pointerx)+i$
            End If
            newkey$=Chr$(13)
          Else
            If Len(record$(pointerx,currentrecord))<22 Then
              olddefault$=record$(pointerx,currentrecord)
              record$(pointerx,currentrecord)=record$(pointerx,currentrecord)+i$
            End If
            newkey$=Chr$(13)
          End If
        End If
    End Select
  Loop Until newpage=1 Or quit=1
Loop Until quit=1

