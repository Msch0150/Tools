Sub ConvertCitationsInFootnotesToText()
'
' ConvertCitationsInFootnotesToText Makro
' Interates through all footnotes and converts citations to plain text
'
Dim iField As Field

Dim oRange As Range
Dim oFootnotes As Footnotes
Dim oFootnote As Footnote

' Grabs the FootNotes
Set oFootnotes = Word.ActiveDocument.Footnotes

' Iterates through each footnote
For Each oFootnote In oFootnotes
    For Each iField In oFootnote.Range.Fields
      If iField.Type = wdFieldCitation Then
          iField.Select
          Set oRange = Selection.Range
          oRange.Start = oRange.Start - 1
          oRange.End = oRange.End + 1
          oRange.Select
          oRange.Text = iField.Result
      End If
    Next iField
Next
End Sub

Sub ConvertCitationsInDocumentToText()
'
' ConvertCitationInDocumentToText Makro
'
'
Dim iField As Field
Dim oRange As Range

For Each iField In ActiveDocument.Range.Fields
    If iField.Type = wdFieldCitation Then
        iField.Select
          Set oRange = Selection.Range
          oRange.Start = oRange.Start - 1
          oRange.End = oRange.End + 1
          oRange.Select
          oRange.Text = iField.Result
      End If
    Next iField
Next
End Sub
