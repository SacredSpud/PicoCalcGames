' Biorhythm (C) 2026 by Sacred Potato
' Productions is licensed under
' CC BY-NC-SA 4.0. To view a copy of
' this license, visit
' https://creativecommons.org/licenses/by-nc-sa/4.0/

DefineFont #10
  5F200808
  0403000001060404
  06F90000FF000000
  20C00000C0202020
  0000000000008000
  0000000000FF00FF
  0000000000000100
End DefineFont

DefineFont 12
  04200C08 08000000 0C7E7E0C 00000008 10000000 307E7E30 00000010 18000000
  18187E3C 00000018 18000000 3C7E1818 00000018
End DefineFont

Sub SineWave
  For t=0 To 319
    angle=(t*freq)'+shift
    j=cent+(Sin(angle)*amp)
    Pixel t,j,ccol
  Next
End Sub

Sub CalcDay
  j=Int(15*Sin((b-Int(b/c)*c)/c*44/7))
  ccol=0
  If j>1 Then ccol=RGB(cyan)
  If j<-1 Then ccol=RGB(orange)
  If ccol=0 Then ccol=RGB(yellow)
  Box (f*10)-5,(r*4*12)+20,10,10,1,ccol,ccol
  Box (f*10)-6,((r*4*12))+30,2,10,,RGB(black)
  If j>peak(r) Then peak(r)=j:peakday(r)=f
  If j<low(r) Then low(r)=j:lowday(r)=f
End Sub

Data 31,28,31,30,31,30,31,31,30,31,30,31
Data January,February,March,April,May
Data June,July,August,September,October
Data November,December
Dim MonthLength(12),MonthName$(12),peak(3)),low(3)
Dim peakday(3),lowday(3)
For t=1 To 12
  Read MonthLength(t)
Next
For t=1 To 12
  Read MonthName$(t)
Next t
validkey$=Chr$(27)+" "+"b"
For t=128 To 131
  ValidKey$=ValidKey$+Chr$(t)
Next
On error ignore
Open "biorhythm.bd" For input As #1
Input #1,a
Input #1,b
Input #1,c
Close #1
On error abort

Color RGB(white),RGB(cobalt)
CLS
Text -4,30,"BIORHYTHM",,2,3,RGB(cyan)
Text 45,90,"C a l c u l a t o r",,2,1
Text 30,272,"%$#",,10,2,RGB(yellow)
Text 30,288," !"+Chr$(34),,10,2,RGB(brown)
Text 78,288,"Sacred Potato Productions",,1,,RGB(white)
Text 80,304,"Some rights reserved.",,1,,RGB(white)
amp=23
cent=160
freq=.05
shift=0
ccol=RGB(red)
SineWave
amp=28
freq=.08
ccol=RGB(green)
SineWave
amp=33
freq=.03
ccol=RGB(magenta)
SineWave
If a<>0 Then
  Text 12,220,"Press B to enter your own birthday or"
  NextLine$="any other key to proceed with "+Str$(b)+"/"+Str$(c)+"/"+Str$(a)
  Text 160-(4*Len(NextLine$)),232,NextLine$
Else
Text 60,214,"Press any key to begin."
End If
Do
  i$=Inkey$
Loop Until i$<>""
If LCase$(i$)="b" Then
  a=0
  b=0
  c=0
End If
Do
  Color 0,RGB(white)
  CLS
  If a=0 Or b=0 Or c=0 Then
    Print "Enter your birth date."
    Input "Year (XXXX): ",a
    Do
      Input "Month: ",b
      b=Int(b)
    Loop Until b>0 And b<13
    Do
      Input "Day: ",c
      c=Int(c)
    Loop Until c>0 And c<MonthLength(b)+1
    Print
    Input "Save this as the default birthday? (y/N) ",save$
    If LCase$(Save$)="y" Then
      On error ignore
      Open "biorhythm.bd" For output As #1
      Print #1,a
      Print #1,b
      Print #1,c
      Close #1
      On error abort
    End If
    Print
  End If
  a=a*365.25+b*30.4+c
  Print
  Print "Enter the date for the biorythm."
  Input "Year (XXXX): ",b
  Do
    Input "Month: ",c
    c=Int(c)
  Loop Until c>0 And c<13
  d=1
  Do
    If b/4=Int(b/4) Then
      MonthLength(2)=29
    Else
      MonthLength(2)=28
    End If
    For t=1 To 3
      peakday(t)=-100
      lowday(t)=100
      peak(t)=-100
      low(t)=100
    Next
    month=c
    year=b
    b=year*365.25+month*30.4+d-a
    CLS
    Text 76,2,"Biorhythm for",,2
    title$=MonthName$(Month)+", "+Str$(year)
    Text 160-(Len(title$)*6.5),20,title$,,2
    For f=1 To MonthLength(Month)
      c=23
      r=1
      CalcDay
      c=28
      r=2
      CalcDay
      r=3
      c=33
      CalcDay
      b=b+1
    Next f
    For t=1 To 3
      Line 4,(t*4*12)+20,4,(t*4*12)+30,,RGB(black)
      Box (f*10)-6,(t*4*12)+20,2,20,,,RGB(black)
      Box (peakday(t)*10)-5,20+(t*4*12),10,10,1,RGB(green),RGB(green)
      Box (lowday(t)*10)-5,20+(t*4*12),10,10,1,RGB(red),RGB(red)
      Box 4,20+(t*4*12),(MonthLength(Month)*10)+2,10,2,RGB(black)
    Next
    If PeakDay(1)=PeakDay(2) Then
      Text (peakday(1)*10)-1,70,"*",,8,,RGB(blue),RGB(green)
      Text (peakday(1)*10)-1,118,"*",,8,,RGB(blue),RGB(green)
    End If
    If PeakDay(1)=PeakDay(3) Then
      Text (peakday(1)*10)-1,70,"*",,8,,RGB(blue),RGB(green)
      Text (peakday(1)*10)-1,166,"*",,8,,RGB(blue),RGB(green)
    End If
    If PeakDay(2)=PeakDay(3) Then
      Text (peakday(2)*10)-1,118,"*",,8,,RGB(blue),RGB(green)
      Text (peakday(2)*10)-1,166,"*",,8,,RGB(blue),RGB(green)
    End If
    If LowDay(1)=LowDay(2) Then
      Text (Lowday(1)*10)-1,70,"*",,8,,RGB(white),RGB(red)
      Text (Lowday(1)*10)-1,166,"*",,8,,RGB(white),RGB(red)
    End If
    If LowDay(1)=LowDay(3) Then
      Text (Lowday(1)*10)-1,70,"*",,8,,RGB(white),RGB(red)
      Text (Lowday(1)*10)-1,166,"*",,8,,RGB(white),RGB(red)
    End If
    If LowDay(2)=LowDay(3) Then
      Text (Lowday(2)*10)-1,118,"*",,8,,RGB(white),RGB(red)
      Text (Lowday(2)*10)-1,166,"*",,8,,RGB(white),RGB(red)
    End If
    If PeakDay(1)=LowDay(2) Then
      Text (Peakday(1)*10)-1,70,"*",,8,,RGB(blue),RGB(green)
      Text (Peakday(1)*10)-1,118,"*",,8,,RGB(white),RGB(red)
    End If
    If PeakDay(1)=LowDay(3) Then
      Text (Peakday(1)*10)-1,70,"*",,8,,RGB(blue),RGB(green)
      Text (Peakday(1)*10)-1,166,"*",,8,,RGB(white),RGB(red)
    End If
    If PeakDay(2)=LowDay(3) Then
      Text (Peakday(2)*10)-1,118,"*",,8,,RGB(blue),RGB(green)
      Text (Peakday(2)*10)-1,166,"*",,8,,RGB(white),RGB(red)
    End If
    If LowDay(1)=PeakDay(2) Then
      Text (Lowday(1)*10)-1,70,"*",,8,,RGB(white),RGB(red)
      Text (Lowday(1)*10)-1,118,"*",,8,,RGB(blue),RGB(green)
    End If
    If LowDay(1)=PeakDay(3) Then
      Text (Lowday(1)*10)-1,70,"*",,8,,RGB(white),RGB(red)
      Text (Lowday(1)*10)-1,166,"*",,8,,RGB(blue),RGB(green)
    End If
    If LowDay(2)=PeakDay(3) Then
      Text (Lowday(2)*10)-1,118,"*",,8,,RGB(white),RGB(red)
      Text (Lowday(2)*10)-1,166,"*",,8,,RGB(blue),RGB(green)
    End If
    If PeakDay(1)=PeakDay(2) Then
      Text (peakday(1)*10)-1,70,"*",,8,,RGB(blue),RGB(green)
      Text (peakday(1)*10)-1,118,"*",,8,,RGB(blue),RGB(green)
    End If
    If PeakDay(1)=PeakDay(3) Then
      Text (peakday(1)*10)-1,70,"*",,8,,RGB(blue),RGB(green)
      Text (peakday(1)*10)-1,166,"*",,8,,RGB(blue),RGB(green)
    End If
    If PeakDay(2)=PeakDay(3) Then
      Text (peakday(2)*10)-1,118,"*",,8,,RGB(blue),RGB(green)
      Text (peakday(2)*10)-1,166,"*",,8,,RGB(blue),RGB(green)
    End If
    If LowDay(1)=LowDay(2) Then
      Text (Lowday(1)*10)-1,70,"*",,8,,RGB(white),RGB(red)
      Text (Lowday(1)*10)-1,166,"*",,8,,RGB(white),RGB(red)
    End If
    If LowDay(1)=LowDay(3) Then
      Text (Lowday(1)*10)-1,70,"*",,8,,RGB(white),RGB(red)
      Text (Lowday(1)*10)-1,166,"*",,8,,RGB(white),RGB(red)
    End If
    If LowDay(2)=LowDay(3) Then
      Text (Lowday(2)*10)-1,118,"*",,8,,RGB(white),RGB(red)
      Text (Lowday(2)*10)-1,166,"*",,8,,RGB(white),RGB(red)
    End If
    If PeakDay(1)=LowDay(2) Then
      Text (Peakday(1)*10)-1,70,"*",,8,,RGB(blue),RGB(green)
      Text (Peakday(1)*10)-1,118,"*",,8,,RGB(white),RGB(red)
    End If
    If PeakDay(1)=LowDay(3) Then
      Text (Peakday(1)*10)-1,70,"*",,8,,RGB(blue),RGB(green)
      Text (Peakday(1)*10)-1,166,"*",,8,,RGB(white),RGB(red)
    End If
    If PeakDay(2)=LowDay(3) Then
      Text (Peakday(2)*10)-1,118,"*",,8,,RGB(blue),RGB(green)
      Text (Peakday(2)*10)-1,166,"*",,8,,RGB(white),RGB(red)
    End If
    If LowDay(1)=PeakDay(2) Then
      Text (Lowday(1)*10)-1,70,"*",,8,,RGB(white),RGB(red)
      Text (Lowday(1)*10)-1,118,"*",,8,,RGB(blue),RGB(green)
    End If
    If LowDay(1)=PeakDay(3) Then
      Text (Lowday(1)*10)-1,70,"*",,8,,RGB(white),RGB(red)
      Text (Lowday(1)*10)-1,166,"*",,8,,RGB(blue),RGB(green)
    End If
    If LowDay(2)=PeakDay(3) Then
      Text (Lowday(2)*10)-1,118,"*",,8,,RGB(white),RGB(red)
      Text (Lowday(2)*10)-1,166,"*",,8,,RGB(blue),RGB(green)
    End If
    For t=1 To MonthLength(Month)
      If t/5=Int(t/5) Or t=1 Then
        For n=1 To 3
          If t<10 Then v=3 Else v=4
          Text (t*10)-v,(n*4*12)+31,Str$(t),,8,,RGB(black)
        Next
      End If
    Next
    Text 4,52,"Physical"
    Text 4,104,"Emotional"
    Text 4,152,"Intellectual"
    Box 54,210,10,10,2,RGB(black),RGB(cyan)
    Text 68,210,"High days",,1,,RGB(black)
    Box 180,210,10,10,2,RGB(black),RGB(orange)
    Text 193,210,"Low days",,1,,RGB(black)
    Box 54,230,10,10,2,RGB(black),RGB(green)
    Text 68,230,"Peak",,1,,RGB(black)
    Box 180,230,10,10,2,RGB(black),RGB(red)
    Text 193,230,"Valley",,1,,RGB(black)
    Box 54,250,10,10,2,RGB(black),RGB(yellow)
    Text 68,250,"Critical",,1,,RGB(black)
    Box 166,250,10,10,2,RGB(black),RGB(green)
    Box 180,250,10,10,2,RGB(black),RGB(red)
    Text 170,252,"*",,8,,RGB(blue),RGB(green)
    Text 184,252,"*",,8,,RGB(white),RGB(red)
    Text 193,250,"Intersections",,1,,RGB(black)
    If Month=12 Then
      NextMonth$="January"
      NextYear$=Str$(year+1)
    Else
      NextMonth$=MonthName$(Month+1)
      NextYear$=Str$(year)
    End If
    Text 20,280,"! ",,12,,RGB(black)
    Text 38,280,"to change month    to change year",,1,,RGB(black)
    Text 172,280,Chr$(34)+"#",,12,,RGB(black)
    NextLine$="Space to continue to "+NextMonth$+", "+NextYear$
    Text 160-(4*Len(NextLine$)),292,nextline$,,1,,RGB(black)
    Text 2,304,"B to enter a new birthday   Esc to quit",,1,,RGB(black)
    Do
      w$=Inkey$
    Loop Until Instr(validkey$,LCase$(w$))
    b=year
    c=month
    Select Case w$
      Case Chr$(27)
        quit=1
      Case " ",Chr$(131)
        c=c+1
        If c=13 Then
          b=b+1
          c=1
        End If
      Case Chr$(130)
        c=c-1
        If c=0 Then
          b=b-1
          c=12
        End If
      Case Chr$(128)
        b=b-1
      Case Chr$(129)
        b=b+1
      Case "b"
        NewBirthday=1
        a=0
        b=0
        c=0
    End Select
  Loop While quit=0 And NewBirthday=0
  NewBirthday=0
Loop Until quit=1
Color RGB(green),RGB(black)
CLS
