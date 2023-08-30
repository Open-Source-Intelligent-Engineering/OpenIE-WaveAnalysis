(* ::Package:: *)

BeginPackage["ReadMachineSignal`"]

readMachineSignal::usage = "Define a function for read '*.csv' file, input the file name and return as data.";

Begin["`readMachineSignal`"]

readMachineSignal[csvFileName_] :=
    Module[{data},
        (*Gets the folder address where the current notebook file is located*)
        currentDirectory = NotebookDirectory[];
        (*Build the full path of CSV and DAT files*)
        csvFilePath = FileNameJoin[{currentDirectory, "machineData", 
            csvFileName}];
        data = Import[csvFilePath, "CSV"];
        data
    ]

End[]

EndPackage[]
