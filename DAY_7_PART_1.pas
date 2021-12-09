
// Name:   AOC_2021_DAY7_PART1
// Author: Ort
// Date:   2021/12/07

Uses sysutils, Math;

var
  input: text;
  line, str: AnsiString;
  i, currIdx, arrIdx: Integer;
  low, high, sum, res, x: Longint;
  numInput: array[1..1001] of Longint;
const
  nums = ['0'..'9'];

begin
  assign(input, 'C:\Users\Ort\Desktop\input.txt');
  reset(input);

  while not eof(input) do
  begin
      readln(input, line);
  end;
  close(input);

  arrIdx := 1;
  currIdx := 1;
  str := '';

  while currIdx <= length(line) do
  begin
    if line[currIdx] in nums then
    begin
      str := str + line[currIdx]
    end
    else
      begin
        numInput[arrIdx] := StrToInt(str);
        str := '';
        inc(arrIdx);
      end;
    inc(currIdx);
  end;
  numInput[arrIdx] := StrToInt(str);

  low := numInput[1];
  high := numInput[1];

  for i := 1 to arrIdx do
  begin
    low := min(low, numInput[i]);
    high := max(high, numInput[i]);
  end;

  res := 2147483647;

  for x := low to high do
  begin
    sum := 0;
    for i := 1 to arrIdx do
    begin
        sum := sum + abs(x-numInput[i]);
    end;
    res := min(res, sum);
  end;

  writeln(res);

end.
