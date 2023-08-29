(* ::Package:: *)

BeginPackage["ReadMachineSignal`"]
readMachineSignal::usage = "Define a function for read '*.csv' file, 
input the file name and return as data.";
Begin["`readMachineSignal`"]
readMachineSignal[csvFileName_]:=Module[{data},
(*\:83b7\:53d6\:5f53\:524dNotebook\:6587\:4ef6\:6240\:5728\:7684\:6587\:4ef6\:5939\:5730\:5740*)
currentDirectory=NotebookDirectory[];
(*\:6784\:5efaCSV\:548cDAT\:6587\:4ef6\:7684\:5b8c\:6574\:8def\:5f84*)
csvFilePath=FileNameJoin[{currentDirectory,"machineData",csvFileName}];
data=Import[csvFilePath,"CSV"];
data
]
End[]
EndPackage[]
