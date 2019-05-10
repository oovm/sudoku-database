(* ::Package:: *)

SetDirectory@NotebookDirectory[];


FileNames["Download-*", "../Download"] // TableForm


$task[1] := GeneralUtilities`Scope[
	path = "../Download/Download-1.txt";
	file = "3-" <> FileHash[path, "MD5", All, "HexString"] <> ".txt";
	If[FileExistsQ@file, Return[]];
	qs = StringSplit[Import[path, "Text"], "\n"];
	Export[file, StringRiffle[Sort@qs, "\n"]]
]
$task[2] := GeneralUtilities`Scope[
	path = "../Download/Download-2.csv";
	file = "3-" <> FileHash[path, "MD5", All, "HexString"] <> ".txt";
	If[FileExistsQ@file, Return[]];
	qs = Import[path, {"CSV", "RawData"}, "HeaderLines" -> 1][[All, 1]];
	Export[file, StringRiffle[Sort@qs, "\n"]]
]


$task /@ Range[2]
