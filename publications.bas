Sub ConvertCitationsInFootnotesToText()
'
' ConvertCitationsInFootnotesToText Makro
' Interates through all footnotes and converts citations to plain text
'
Dim iFld As Field
Dim oRng As Range

Dim oFeets As Footnotes
Dim oFoot As Footnote
Dim oRange As Range
Dim szFootNoteText As String

' Grabs the collection of FootNotes
Set oFeets = Word.ActiveDocument.Footnotes

' Iterates through each footnote
For Each oFoot In oFeets
    For Each iFld In oFoot.Range.Fields
      If iFld.Type = wdFieldCitation Then
          iFld.Select
          Set oRng = Selection.Range
          oRng.Start = oRng.Start - 1
          oRng.End = oRng.End + 1
          oRng.Select
          oRng.Text = iFld.Result
      End If
    Next iFld
Next
End Sub

Sub ConvertCitationsInDocumentToText()
'
' ConvertCitationInDocumentToText Makro
'
'
Dim iFld As Field
Dim oRng As Range
For Each iFld In ActiveDocument.Range.Fields
    If iFld.Type = wdFieldCitation Then
        iFld.Select
        Set oRng = Selection.Range
        oRng.Start = oRng.Start - 1
        oRng.End = oRng.End + 1
        oRng.Select
        oRng.Text = iFld.Result
    End If
Next iFld
End Sub
