
' Name:   AOC_2021_DAY4_PART1
' Author: Ort
' Date:   2021/12/04

Imports System.IO
Imports System.Text.RegularExpressions

Module DAY_4_PART_1

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
    Private Function findFirst(ByRef Boards As List(Of List(Of Integer)), ByRef EntryList As List(Of Integer)) As Integer
        Dim tempEntryList As New List(Of Integer)
        For Each Entry In EntryList
            tempEntryList.Add(Entry)
            For Each Board In Boards
                For i = 0 To 4
                    Dim count As Integer = 0
                    For j = 0 To 4
                        If tempEntryList.Contains(getIdx(Board, i, j)) Then
                            count = count + 1
                        End If
                    Next
                    If count = 5 Then
                        Return getUnmatchedSum(Board, tempEntryList) * Entry
                    End If
                Next
                For i = 0 To 4
                    Dim count As Integer = 0
                    For j = 0 To 4
                        If tempEntryList.Contains(getIdx(Board, j, i)) Then
                            count = count + 1
                        End If
                    Next
                    If count = 5 Then
                        Return getUnmatchedSum(Board, tempEntryList) * Entry
                    End If
                Next
            Next
        Next
        Return 0
    End Function


    Sub Main()

        Dim MergeSets As String() = File.ReadAllText("C:/Users/Ort/Desktop/input.txt").Replace(",", " ").Split(New String() {vbCrLf + vbCrLf}, StringSplitOptions.None)
        Dim Boards As New List(Of List(Of Integer))
        Dim EntryList As List(Of Integer) = MergeSets(0).Split(" "c).[Select](Function(n) Integer.Parse(n)).ToList()

        For i = 1 To MergeSets.Length - 1
            Dim Board As List(Of Integer) = Regex.Replace(Replace(MergeSets.ElementAt(i), vbCrLf, " "), " {2,}", " ").Trim().Split(" "c).[Select](Function(n) Integer.Parse(n)).ToList()
            Boards.Add(Board)
        Next

        Console.WriteLine(findFirst(Boards, EntryList))

    End Sub

End Module
