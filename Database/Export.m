(* ::Package:: *)

SetDirectory@NotebookDirectory[];


qs = Flatten[StringSplit[Import[#, "Text"], "\n"]& /@ FileNames["3-*", ""]]


group = GroupBy[qs, 81 - StringCount[#, "0"]&]


saver[i_] := GeneralUtilities`Scope[
	text = StringRiffle[Sort@group[i], "\n"];
	path = "../Sudoku 9\[Times]9/Sudoku" <> ToString[i] <> ".txt";
	Export[path, text]
]
saver /@ Keys[group]
