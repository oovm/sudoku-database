(* ::Package:: *)

(* ::Section:: *)
(*Settings*)


SetDirectory@NotebookDirectory[];


(* ::Section:: *)
(*Template*)


text = StringTemplate["Third-Order Sudoku
==================

![](https://img.shields.io/badge/Date-`Data`-orange.svg?style=flat-square)
![](https://img.shields.io/badge/Puzzles-`Puzzles`-FF69B4.svg?style=flat-square)

## Standard Form

0 \:8868\:793a\:9700\:8981\:6c42\:89e3\:7684\:6570\:5b57, 1-9 \:8868\:793a\:5df2\:6709\:7684\:6570\:5b57

\:4e00\:884c\:4e00\:884c\:6392\:5217, \:4e00\:5171 81 \:4e2a\:6570\:5b57\:4e3a\:4e00\:884c, \:7528 LF \:6362\:884c.

1. \:8981\:6c42\:89e3\:552f\:4e00
2. \:65cb\:8f6c\:548c\:955c\:50cf\:610f\:4e49\:4e0b\:540c\:6784


## Pipeline

\:83b7\:5f97\:4e00\:4e2a\:6570\:72ec, \:7528\:8fed\:4ee3\:5668\:6c42\:51fa\:6240\:6709\:89e3, \:5982\:679c\:6709\:591a\:4e2a\:89e3\:6807\:8bb0\:4e3a\:975e\:6cd5.

\:6240\:6709\:89e3\:6c42\:5b8c, \:8ba1\:7b97\:89e3\:7684\:65cb\:8f6c\:4e8e\:955c\:50cf\:53d8\:6362, \:5e76\:4f5c\:4e3a\:7b7e\:540d.

\:63a5\:7740\:5408\:5e76\:591a\:4e2a\:6570\:636e\:5e93, \:5982\:679c\:89e3\:540c\:6784, \:53d6\:4fe1\:606f\:6700\:5c11\:7684\:90a3\:4e2a.

\:5bfc\:51fa\:6570\:636e, \:8ba1\:7b97\:95ee\:9898\:96be\:5ea6.

## Details

`FileInfo`
"];


(* ::Section:: *)
(*Functions*)


intFormat = StringRiffle[Reverse[Reverse /@ Partition[Reverse@IntegerDigits[#, 10], UpTo@4]], ",", ""]&;
puzzles = Tr[Round[("ByteCount" /. FileInformation@#) / 83]& /@ FileNames["Sudoku*", ""]];
getInfo[file_] := GeneralUtilities`Scope[
	byte = "ByteCount" /. FileInformation[file];
	<|
		"Hints" -> StringTake[FileBaseName[file],7;;All],
		"FileSize" -> ToString@Ceiling[N[byte / 1024^2], 0.001] <> " MB",
		"Puzzles" -> intFormat@Round[byte / 83]
	|>
];
elements = Join[
	{Keys@getInfo["Sudoku17.txt"], {":-", "-:", "-:"}},
	Values@getInfo@#& /@ FileNames["Sudoku*", ""]
];


(* ::Section:: *)
(*Build*)


readme = text[<|
	"Data" -> URLEncode@StringReplace[DateString["ISODate"], "-" -> " "],
	"Puzzles" -> URLEncode[intFormat@puzzles],
	"FileInfo" -> StringRiffle[elements, "\n", "|"]
|>];
Export["Readme.md", readme, "Text"]
