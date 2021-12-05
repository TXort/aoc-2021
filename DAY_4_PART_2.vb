
' Name:   AOC_2021_DAY4_PART2
' Author: Ort
' Date:   2021/12/04

Imports System.IO
Imports System.Text.RegularExpressions

Module DAY_4_PART_2

    Private Function getIdx(ByRef Board As List(Of Integer), ByRef x As Integer, ByRef y As Integer) As Integer
        Return Board(x * 5 + y)
    End Function

    Private Function getUnmatchedSum(ByRef Board As List(Of Integer), ByRef tempEntryList As List(Of Integer)) As Integer
        Dim sum As Integer = 0
        For Each number In Board
            If Not tempEntryList.Contains(number) Then
                sum = sum + number
            End If
        Next
        Return sum
    End Function

    Private Function getNumberOfEntries(ByRef Board As List(Of Integer), ByRef tempEntryList As List(Of Integer)) As Integer
        Dim numberOfEntries As Integer = tempEntryList.Count
        For i = 0 To 4
            Dim lastMatchedEntry As Integer = 0
            For j = 0 To 4
                lastMatchedEntry = Math.Max(lastMatchedEntry, tempEntryList.IndexOf(getIdx(Board, i, j)))
            Next
            numberOfEntries = Math.Min(numberOfEntries, lastMatchedEntry)
        Next

        For i = 0 To 4
            Dim lastMatchedEntry As Integer = 0
            For j = 0 To 4
                lastMatchedEntry = Math.Max(lastMatchedEntry, tempEntryList.IndexOf(getIdx(Board, j, i)))
            Next
            numberOfEntries = Math.Min(numberOfEntries, lastMatchedEntry)
        Next

        Return numberOfEntries
    End Function

    Private Function findLast(ByRef Boards As List(Of List(Of Integer)), ByRef EntryList As List(Of Integer)) As Integer
        Dim lastNumberIdx As Integer = 0
        Dim selectedBoard As New List(Of Integer)
        For Each Board In Boards
            Dim numberOfEntries As Integer = getNumberOfEntries(Board, EntryList)
            If numberOfEntries > lastNumberIdx Then
                lastNumberIdx = numberOfEntries
                selectedBoard = Board
            End If
        Next
        EntryList.RemoveRange(lastNumberIdx + 1, EntryList.Count - lastNumberIdx - 1)
        Return getUnmatchedSum(selectedBoard, EntryList) * EntryList(lastNumberIdx)
    End Function

    Sub Main()

        Dim MergeSets As String() = File.ReadAllText("C:/Users/Ort/Desktop/input.txt").Replace(",", " ").Split(New String() {vbCrLf + vbCrLf}, StringSplitOptions.None)
        Dim Boards As New List(Of List(Of Integer))
        Dim EntryList As List(Of Integer) = MergeSets(0).Split(" "c).[Select](Function(n) Integer.Parse(n)).ToList()

        For i = 1 To MergeSets.Length - 1
            Dim Board As List(Of Integer) = Regex.Replace(Replace(MergeSets.ElementAt(i), vbCrLf, " "), " {2,}", " ").Trim().Split(" "c).[Select](Function(n) Integer.Parse(n)).ToList()
            Boards.Add(Board)
        Next

        Console.WriteLine(findLast(Boards, EntryList))

    End Sub

End Module
