(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 11.0' *)

(*************************************************************************)
(*                                                                       *)
(*  The Mathematica License under which this file was created prohibits  *)
(*  restricting third parties in receipt of this file from republishing  *)
(*  or redistributing it by any means, including but not limited to      *)
(*  rights management or terms of use, without the express consent of    *)
(*  Wolfram Research, Inc. For additional information concerning CDF     *)
(*  licensing and redistribution see:                                    *)
(*                                                                       *)
(*        www.wolfram.com/cdf/adopting-cdf/licensing-options.html        *)
(*                                                                       *)
(*************************************************************************)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[      1064,         20]
NotebookDataLength[    844848,      18371]
NotebookOptionsPosition[    829223,      17841]
NotebookOutlinePosition[    829656,      17860]
CellTagsIndexPosition[    829613,      17857]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell["\<\
This document is long enough that it is annoying to have all the sections \
open at once.

CDF users: look through the menu items to find out how to expand sections. \
Alternatively, the shortcut should be Ctrl+\[OpenCurlyQuote]
Mathematica users: I recommend enabling \
\[OpenCurlyDoubleQuote]Preferences>Interface>Show open/close icon for cell \
groups\[CloseCurlyDoubleQuote] to help with section management.\
\>", "Text"],

Cell[CellGroupData[{

Cell["Init", "Subsection"],

Cell["Macro to help with exporting figures.", "Text"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"$doExport", "=", "False"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"exportme", "[", 
    RowBox[{"name_", ",", 
     RowBox[{"opt", ":", 
      RowBox[{"OptionsPattern", "[", "Export", "]"}]}]}], "]"}], "[", "fig_", 
   "]"}], ":=", 
  RowBox[{"(", 
   RowBox[{
    RowBox[{"SetDirectory", "[", 
     RowBox[{"NotebookDirectory", "[", "]"}], "]"}], ";", 
    "\[IndentingNewLine]", 
    RowBox[{"If", "[", 
     RowBox[{"$doExport", ",", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"Export", "[", 
        RowBox[{
         RowBox[{"\"\<../fig/\>\"", "<>", "name", "<>", "\"\<.pdf\>\""}], ",",
          "fig", ",", "opt"}], "]"}], ";", 
       RowBox[{"Export", "[", 
        RowBox[{
         RowBox[{"\"\<../fig/\>\"", "<>", "name", "<>", "\"\<.png\>\""}], ",",
          "fig", ",", "opt"}], "]"}]}]}], "]"}], ";", "fig"}], 
   ")"}]}], "\[IndentingNewLine]", 
 RowBox[{"Needs", "[", "\"\<MaTeX`\>\"", "]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"texStyle", "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"FontFamily", "\[Rule]", "\"\<Latin Modern Roman\>\""}], ",", 
     RowBox[{"FontSize", "\[Rule]", "12"}]}], "}"}]}], ";"}]}], "Input"],

Cell["Symbolic assumptions used globally:", "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{"$Assumptions", "=", 
   RowBox[{
    RowBox[{"0", "<", "\[Beta]", "<", "\[Gamma]", "<", "\[Alpha]"}], "&&", 
    RowBox[{"0", "\[LessEqual]", "p", "\[LessEqual]", "1"}], "&&", 
    RowBox[{"x", ">=", "0"}], "&&", 
    RowBox[{"y", ">=", "0"}], "&&", 
    RowBox[{"z", ">=", "0"}], "&&", 
    RowBox[{"\[Lambda]", "\[Element]", "Reals"}], "&&", 
    RowBox[{"x", "\[Element]", "Integers"}], "&&", 
    RowBox[{"y", "\[Element]", "Integers"}], "&&", 
    RowBox[{"z", "\[Element]", "Integers"}], "&&", 
    RowBox[{"k", "\[GreaterEqual]", "0"}], "&&", 
    RowBox[{"k", "\[Element]", "Integers"}], "&&", 
    RowBox[{
     RowBox[{"-", "1"}], "<", "t", "<", "0"}]}]}], ";"}]], "Input"]
}, Closed]],

Cell[CellGroupData[{

Cell["Log-Likelihood Function", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"L", "=", 
   RowBox[{
    FractionBox[
     RowBox[{
      SuperscriptBox["\[Alpha]", "x"], 
      RowBox[{"Exp", "[", 
       RowBox[{"-", "\[Alpha]"}], "]"}]}], 
     RowBox[{"Factorial", "[", "x", "]"}]], "*", 
    FractionBox[
     RowBox[{
      SuperscriptBox["\[Beta]", "y"], 
      RowBox[{"Exp", "[", 
       RowBox[{"-", "\[Beta]"}], "]"}]}], 
     RowBox[{"Factorial", "[", "y", "]"}]], "*", 
    FractionBox[
     RowBox[{
      SuperscriptBox[
       RowBox[{"(", 
        RowBox[{
         RowBox[{"p", " ", "\[Alpha]"}], "+", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{"1", "-", "p"}], ")"}], "\[Beta]"}]}], ")"}], "z"], 
      RowBox[{"Exp", "[", 
       RowBox[{"-", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{"p", " ", "\[Alpha]"}], "+", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{"1", "-", "p"}], ")"}], "\[Beta]"}]}], ")"}]}], "]"}]}], 
     RowBox[{"Factorial", "[", "z", "]"}]]}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"LL", "=", 
  RowBox[{
   RowBox[{"Log", "[", "L", "]"}], "//", "FullSimplify"}]}]}], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"-", 
    RowBox[{"(", 
     RowBox[{"1", "+", "p"}], ")"}]}], " ", "\[Alpha]"}], "+", 
  RowBox[{
   RowBox[{"(", 
    RowBox[{
     RowBox[{"-", "2"}], "+", "p"}], ")"}], " ", "\[Beta]"}], "+", 
  RowBox[{"Log", "[", 
   FractionBox[
    RowBox[{
     SuperscriptBox["\[Alpha]", "x"], " ", 
     SuperscriptBox["\[Beta]", "y"], " ", 
     SuperscriptBox[
      RowBox[{"(", 
       RowBox[{
        RowBox[{"p", " ", 
         RowBox[{"(", 
          RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}], 
       ")"}], "z"]}], 
    RowBox[{
     RowBox[{"x", "!"}], " ", 
     RowBox[{"y", "!"}], " ", 
     RowBox[{"z", "!"}]}]], "]"}]}]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["Data Creation", "Subsection"],

Cell["\<\
It will be useful to have a function that samples random data from our prior.\
\
\>", "Text"],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"betaDistribution", "[", 
    RowBox[{"\[Mu]_", ",", "\[Sigma]_"}], "]"}], ":=", 
   RowBox[{"BetaDistribution", "[", 
    RowBox[{
     FractionBox[
      RowBox[{
       SuperscriptBox["\[Mu]", "2"], "-", 
       SuperscriptBox["\[Mu]", "3"], "-", 
       RowBox[{"\[Mu]", " ", 
        SuperscriptBox["\[Sigma]", "2"]}]}], 
      SuperscriptBox["\[Sigma]", "2"]], ",", 
     FractionBox[
      RowBox[{
       RowBox[{"(", 
        RowBox[{
         RowBox[{"-", "1"}], "+", "\[Mu]"}], ")"}], " ", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"-", "\[Mu]"}], "+", 
         SuperscriptBox["\[Mu]", "2"], "+", 
         SuperscriptBox["\[Sigma]", "2"]}], ")"}]}], 
      SuperscriptBox["\[Sigma]", "2"]]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"gammaDistribution", "[", 
    RowBox[{"\[Mu]_", ",", "\[Sigma]_"}], "]"}], ":=", 
   RowBox[{"GammaDistribution", "[", 
    RowBox[{
     FractionBox[
      SuperscriptBox["\[Mu]", "2"], 
      SuperscriptBox["\[Sigma]", "2"]], ",", 
     FractionBox[
      SuperscriptBox["\[Sigma]", "2"], "\[Mu]"]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"MonteCarloData", "[", 
   RowBox[{"nshots_", ",", "nsamples_"}], "]"}], ":=", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
     "p", ",", "\[CapitalGamma]", ",", "\[Alpha]", ",", "\[Beta]", ",", 
      "\[Kappa]", ",", "\[Mu]", ",", 
      RowBox[{"n", "=", "nshots"}], ",", "data", ",", 
      RowBox[{"samples", "=", "nsamples"}], ",", "Ls"}], "}"}], ",", 
    "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"\[CapitalGamma]", "=", 
      RowBox[{"RandomVariate", "[", 
       RowBox[{
        RowBox[{"gammaDistribution", "[", 
         RowBox[{
          RowBox[{"n", "*", "0.003"}], ",", 
          RowBox[{"n", "*", "0.001"}]}], "]"}], ",", "samples"}], "]"}]}], 
     ";", "\[IndentingNewLine]", 
     RowBox[{"\[Mu]", "=", 
      RowBox[{"RandomVariate", "[", 
       RowBox[{
        RowBox[{"gammaDistribution", "[", 
         RowBox[{
          RowBox[{"n", "*", "0.007"}], ",", 
          RowBox[{"n", "*", "0.001"}]}], "]"}], ",", "samples"}], "]"}]}], 
     ";", "\[IndentingNewLine]", 
     RowBox[{"\[Kappa]", "=", 
      RowBox[{"RandomVariate", "[", 
       RowBox[{
        RowBox[{"betaDistribution", "[", 
         RowBox[{"0.65", ",", "0.05"}], "]"}], ",", "samples"}], "]"}]}], ";",
      "\[IndentingNewLine]", 
     RowBox[{"\[Alpha]", "=", 
      RowBox[{"\[CapitalGamma]", "+", "\[Mu]"}]}], ";", "\[IndentingNewLine]", 
     RowBox[{"\[Beta]", "=", 
      RowBox[{"\[CapitalGamma]", "+", 
       RowBox[{"\[Kappa]", "*", "\[Mu]"}]}]}], ";", "\[IndentingNewLine]", 
     RowBox[{"p", "=", 
      RowBox[{"RandomVariate", "[", 
       RowBox[{
        RowBox[{"UniformDistribution", "[", "]"}], ",", "samples"}], "]"}]}], 
     ";", "\[IndentingNewLine]", 
     RowBox[{"data", "=", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{
          RowBox[{
           RowBox[{"N", "@", 
            RowBox[{"RandomVariate", "[", 
             RowBox[{"PoissonDistribution", "[", "#", "]"}], "]"}]}], "&"}], "/@",
           "\[Alpha]"}], ",", "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{
           RowBox[{"N", "@", 
            RowBox[{"RandomVariate", "[", 
             RowBox[{"PoissonDistribution", "[", "#", "]"}], "]"}]}], "&"}], "/@",
           "\[Beta]"}], ",", "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{
           RowBox[{"N", "@", 
            RowBox[{"RandomVariate", "[", 
             RowBox[{"PoissonDistribution", "[", "#", "]"}], "]"}]}], "&"}], "/@", 
          RowBox[{"(", 
           RowBox[{
            RowBox[{"p", " ", "\[Alpha]"}], "+", 
            RowBox[{
             RowBox[{"(", 
              RowBox[{"1", "-", "p"}], ")"}], "\[Beta]"}]}], ")"}]}]}], "}"}],
        "\[Transpose]"}]}]}]}], "\[IndentingNewLine]", "]"}]}]}], "Input"]
}, Closed]],

Cell[CellGroupData[{

Cell["Lagrange Multipliers", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"$Assumptions", "=", 
   RowBox[{
    RowBox[{"0", "<", "\[Beta]", "<", "\[Gamma]", "<", "\[Alpha]"}], "&&", 
    RowBox[{"0", "\[LessEqual]", "p", "\[LessEqual]", "1"}], "&&", 
    RowBox[{"x", ">", "0"}], "&&", 
    RowBox[{"y", ">", "0"}], "&&", 
    RowBox[{"z", ">", "0"}], "&&", 
    RowBox[{"\[Lambda]", "\[Element]", "Reals"}]}]}], ";"}]], "Input"],

Cell["\<\
We want to maximize the likelihood for all three of \[Alpha], \[Beta], p in \
this case. We can set this up as a lagrange multiplier problem.\
\>", "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{"\[CapitalPhi]", "=", 
   RowBox[{
    RowBox[{"Log", "[", 
     RowBox[{
      SuperscriptBox["\[Alpha]", "x"], 
      RowBox[{
       RowBox[{"Exp", "[", 
        RowBox[{"-", "\[Alpha]"}], "]"}], "/", 
       RowBox[{"Factorial", "[", "x", "]"}]}], "*", 
      SuperscriptBox["\[Beta]", "y"], 
      RowBox[{
       RowBox[{"Exp", "[", 
        RowBox[{"-", "\[Beta]"}], "]"}], "/", 
       RowBox[{"Factorial", "[", "y", "]"}]}], "*", 
      SuperscriptBox[
       RowBox[{"(", 
        RowBox[{
         RowBox[{"p", " ", "\[Alpha]"}], "+", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{"1", "-", "p"}], ")"}], "\[Beta]"}]}], ")"}], "z"], 
      RowBox[{
       RowBox[{"Exp", "[", 
        RowBox[{"-", "\[Gamma]"}], "]"}], "/", 
       RowBox[{"Factorial", "[", "z", "]"}]}]}], "]"}], "-", 
    RowBox[{"\[Lambda]", " ", 
     RowBox[{"(", 
      RowBox[{"\[Gamma]", "-", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"p", " ", "\[Alpha]"}], "+", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{"1", "-", "p"}], ")"}], "\[Beta]"}]}], ")"}]}], 
      ")"}]}]}]}], ";"}]], "Input"],

Cell["Get a system of equations from this, and eliminate \[Gamma] and \
\[Lambda]", "Text"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"lagrangeEquations", "=", 
  RowBox[{
   RowBox[{
    RowBox[{
     RowBox[{
      RowBox[{"D", "[", 
       RowBox[{"\[CapitalPhi]", ",", "#"}], "]"}], "\[Equal]", "0"}], "&"}], "/@", 
    RowBox[{"{", 
     RowBox[{
     "\[Alpha]", ",", "\[Beta]", ",", "\[Gamma]", ",", "\[Lambda]", ",", 
      "p"}], "}"}]}], "//", "FullSimplify"}]}], "\[IndentingNewLine]", 
 RowBox[{"lagrangeEquations", "=", 
  RowBox[{
   RowBox[{
    RowBox[{"Rest", "[", "lagrangeEquations", "]"}], "/.", 
    RowBox[{"First", "@", 
     RowBox[{"Solve", "[", 
      RowBox[{
       RowBox[{"First", "@", "lagrangeEquations"}], ",", "\[Lambda]"}], 
      "]"}]}]}], "//", "FullSimplify"}]}], "\[IndentingNewLine]", 
 RowBox[{"lagrangeEquations", "=", 
  RowBox[{
   RowBox[{"lagrangeEquations", "[", 
    RowBox[{"[", 
     RowBox[{"{", 
      RowBox[{"1", ",", "2", ",", "4"}], "}"}], "]"}], "]"}], "/.", 
   RowBox[{"First", "@", 
    RowBox[{"Solve", "[", 
     RowBox[{
      RowBox[{"lagrangeEquations", "[", 
       RowBox[{"[", "3", "]"}], "]"}], ",", "\[Gamma]"}], 
     "]"}]}]}]}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{
    RowBox[{
     RowBox[{
      RowBox[{"(", 
       RowBox[{"x", "-", "\[Alpha]"}], ")"}], " ", "\[Beta]"}], "+", 
     RowBox[{
      SuperscriptBox["p", "2"], " ", "\[Alpha]", " ", 
      RowBox[{"(", 
       RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], " ", "\[Lambda]"}], "+", 
     RowBox[{"p", " ", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"x", " ", 
         RowBox[{"(", 
          RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", 
        RowBox[{"\[Alpha]", " ", 
         RowBox[{"(", 
          RowBox[{"z", "-", "\[Alpha]", "+", "\[Beta]", "+", 
           RowBox[{"\[Beta]", " ", "\[Lambda]"}]}], ")"}]}]}], ")"}]}]}], 
    "\[Equal]", "0"}], ",", 
   RowBox[{
    RowBox[{
     RowBox[{"\[Beta]", " ", 
      RowBox[{"(", 
       RowBox[{"y", "+", "z", "+", 
        RowBox[{"\[Beta]", " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"-", "1"}], "+", "\[Lambda]"}], ")"}]}]}], ")"}]}], "+", 
     RowBox[{
      SuperscriptBox["p", "2"], " ", "\[Beta]", " ", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"-", "\[Alpha]"}], "+", "\[Beta]"}], ")"}], " ", 
      "\[Lambda]"}], "+", 
     RowBox[{"p", " ", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"y", " ", 
         RowBox[{"(", 
          RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "-", 
        RowBox[{"\[Beta]", " ", 
         RowBox[{"(", 
          RowBox[{"z", "+", "\[Alpha]", "-", "\[Beta]", "-", 
           RowBox[{"\[Alpha]", " ", "\[Lambda]"}], "+", 
           RowBox[{"2", " ", "\[Beta]", " ", "\[Lambda]"}]}], ")"}]}]}], 
       ")"}]}]}], "\[Equal]", "0"}], ",", 
   RowBox[{
    RowBox[{"1", "+", "\[Lambda]"}], "\[Equal]", "0"}], ",", 
   RowBox[{
    RowBox[{
     RowBox[{"p", " ", "\[Alpha]"}], "+", "\[Beta]"}], "\[Equal]", 
    RowBox[{
     RowBox[{"p", " ", "\[Beta]"}], "+", "\[Gamma]"}]}], ",", 
   RowBox[{
    RowBox[{"z", "+", 
     RowBox[{
      RowBox[{"(", 
       RowBox[{
        RowBox[{"p", " ", "\[Alpha]"}], "+", "\[Beta]"}], ")"}], " ", 
      "\[Lambda]"}]}], "\[Equal]", 
    RowBox[{"p", " ", "\[Beta]", " ", "\[Lambda]"}]}]}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{
    FractionBox[
     RowBox[{
      RowBox[{"p", " ", "y", " ", "\[Alpha]"}], "+", 
      RowBox[{
       RowBox[{"(", 
        RowBox[{
         RowBox[{
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", "x"}], "+", 
         "\[Alpha]", "-", 
         RowBox[{"2", " ", "p", " ", "\[Alpha]"}]}], ")"}], " ", 
       "\[Beta]"}]}], "p"], "\[Equal]", "0"}], ",", 
   RowBox[{
    RowBox[{"\[Alpha]", " ", 
     RowBox[{"(", 
      RowBox[{
       RowBox[{"-", "x"}], "-", "z", "+", "\[Alpha]", "+", 
       RowBox[{"p", " ", "\[Alpha]"}]}], ")"}]}], "\[Equal]", 
    FractionBox[
     RowBox[{
      RowBox[{"(", 
       RowBox[{
        RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"-", "x"}], "+", "\[Alpha]", "+", 
        RowBox[{"p", " ", "\[Alpha]"}]}], ")"}], " ", "\[Beta]"}], "p"]}], 
   ",", 
   RowBox[{
    RowBox[{
     RowBox[{"p", " ", "\[Alpha]"}], "+", "\[Beta]"}], "\[Equal]", 
    RowBox[{
     RowBox[{"p", " ", "\[Beta]"}], "+", "\[Gamma]"}]}], ",", 
   RowBox[{
    FractionBox[
     RowBox[{"x", "-", "\[Alpha]"}], "p"], "\[Equal]", "0"}]}], 
  "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{
    FractionBox[
     RowBox[{
      RowBox[{"p", " ", "y", " ", "\[Alpha]"}], "+", 
      RowBox[{
       RowBox[{"(", 
        RowBox[{
         RowBox[{
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", "x"}], "+", 
         "\[Alpha]", "-", 
         RowBox[{"2", " ", "p", " ", "\[Alpha]"}]}], ")"}], " ", 
       "\[Beta]"}]}], "p"], "\[Equal]", "0"}], ",", 
   RowBox[{
    RowBox[{"\[Alpha]", " ", 
     RowBox[{"(", 
      RowBox[{
       RowBox[{"-", "x"}], "-", "z", "+", "\[Alpha]", "+", 
       RowBox[{"p", " ", "\[Alpha]"}]}], ")"}]}], "\[Equal]", 
    FractionBox[
     RowBox[{
      RowBox[{"(", 
       RowBox[{
        RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"-", "x"}], "+", "\[Alpha]", "+", 
        RowBox[{"p", " ", "\[Alpha]"}]}], ")"}], " ", "\[Beta]"}], "p"]}], 
   ",", 
   RowBox[{
    FractionBox[
     RowBox[{"x", "-", "\[Alpha]"}], "p"], "\[Equal]", "0"}]}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"soln", "=", 
  RowBox[{
   RowBox[{"Solve", "[", 
    RowBox[{"lagrangeEquations", ",", 
     RowBox[{"{", 
      RowBox[{"\[Alpha]", ",", "\[Beta]", ",", "p"}], "}"}]}], "]"}], "//", 
   "FullSimplify"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"{", 
   RowBox[{
    RowBox[{"\[Alpha]", "\[Rule]", "x"}], ",", 
    RowBox[{"\[Beta]", "\[Rule]", "y"}], ",", 
    RowBox[{"p", "\[Rule]", 
     FractionBox[
      RowBox[{
       RowBox[{"-", "y"}], "+", "z"}], 
      RowBox[{"x", "-", "y"}]]}]}], "}"}], "}"}]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["Profiled Likelihood", "Subsection"],

Cell["\<\
Messing around with profiled likelihood functions; no good came of it.\
\>", "Text"],

Cell[CellGroupData[{

Cell["p first", "Subsubsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"psol", "=", 
  RowBox[{
   RowBox[{"First", "@", 
    RowBox[{"Solve", "[", 
     RowBox[{
      RowBox[{
       RowBox[{
        RowBox[{"D", "[", 
         RowBox[{"L", ",", "p"}], "]"}], "\[Equal]", "0"}], "//", 
       "FullSimplify"}], ",", "p"}], "]"}]}], "//", 
   "FullSimplify"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"p", "\[Rule]", 
   FractionBox[
    RowBox[{"z", "-", "\[Beta]"}], 
    RowBox[{"\[Alpha]", "-", "\[Beta]"}]]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"D", "[", 
    RowBox[{
     RowBox[{"D", "[", 
      RowBox[{"L", ",", "p"}], "]"}], ",", "p"}], "]"}], "/.", "psol"}], "//",
   "FullSimplify"}]], "Input"],

Cell[BoxData[
 RowBox[{"-", 
  FractionBox[
   SuperscriptBox[
    RowBox[{"(", 
     RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], "2"], "z"]}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"L", "/.", "psol"}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"-", "\[Alpha]"}], " ", 
   RowBox[{"(", 
    RowBox[{"1", "+", 
     FractionBox[
      RowBox[{"z", "-", "\[Beta]"}], 
      RowBox[{"\[Alpha]", "-", "\[Beta]"}]]}], ")"}]}], "+", 
  RowBox[{
   RowBox[{"(", 
    RowBox[{
     RowBox[{"-", "2"}], "+", 
     FractionBox[
      RowBox[{"z", "-", "\[Beta]"}], 
      RowBox[{"\[Alpha]", "-", "\[Beta]"}]]}], ")"}], " ", "\[Beta]"}], "+", 
  RowBox[{"Log", "[", 
   FractionBox[
    RowBox[{
     SuperscriptBox["z", "z"], " ", 
     SuperscriptBox["\[Alpha]", "x"], " ", 
     SuperscriptBox["\[Beta]", "y"]}], 
    RowBox[{
     RowBox[{"x", "!"}], " ", 
     RowBox[{"y", "!"}], " ", 
     RowBox[{"z", "!"}]}]], "]"}]}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"\[Alpha]sol", "=", 
  RowBox[{
   RowBox[{"First", "@", 
    RowBox[{"Solve", "[", 
     RowBox[{
      RowBox[{
       RowBox[{
        RowBox[{"D", "[", 
         RowBox[{
          RowBox[{"L", "/.", "psol"}], ",", "\[Alpha]"}], "]"}], "\[Equal]", 
        "0"}], "//", "FullSimplify"}], ",", "\[Alpha]"}], "]"}]}], "//", 
   "FullSimplify"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"\[Alpha]", "\[Rule]", "x"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"Solve", "[", 
   RowBox[{
    RowBox[{
     RowBox[{
      RowBox[{"D", "[", 
       RowBox[{
        RowBox[{"L", "/.", "psol"}], ",", "\[Beta]"}], "]"}], "\[Equal]", 
      "0"}], "//", "FullSimplify"}], ",", "\[Beta]"}], "]"}], "//", 
  "FullSimplify"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"{", 
   RowBox[{"\[Beta]", "\[Rule]", "y"}], "}"}], "}"}]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["\[Alpha], \[Beta] first", "Subsubsection"],

Cell["\<\
There are two critical points when we look at just alpha. Which one to choose?\
\>", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"\[Alpha]sol", "=", 
  RowBox[{
   RowBox[{"Solve", "[", 
    RowBox[{
     RowBox[{
      RowBox[{
       RowBox[{"D", "[", 
        RowBox[{"L", ",", "\[Alpha]"}], "]"}], "\[Equal]", "0"}], "//", 
      "FullSimplify"}], ",", "\[Alpha]"}], "]"}], "//", 
   "FullSimplify"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"\[Alpha]", "\[Rule]", 
     RowBox[{"-", 
      FractionBox[
       RowBox[{
        RowBox[{
         RowBox[{"-", "p"}], " ", 
         RowBox[{"(", 
          RowBox[{"x", "+", "z"}], ")"}]}], "+", "\[Beta]", "-", 
        RowBox[{
         SuperscriptBox["p", "2"], " ", "\[Beta]"}], "+", 
        SqrtBox[
         RowBox[{
          RowBox[{
           RowBox[{"-", "4"}], " ", "p", " ", 
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "1"}], "+", 
             SuperscriptBox["p", "2"]}], ")"}], " ", "x", " ", "\[Beta]"}], 
          "+", 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{"\[Beta]", "-", 
             RowBox[{"p", " ", 
              RowBox[{"(", 
               RowBox[{"x", "+", "z", "+", 
                RowBox[{"p", " ", "\[Beta]"}]}], ")"}]}]}], ")"}], "2"]}]]}], 
       
       RowBox[{"2", " ", "p", " ", 
        RowBox[{"(", 
         RowBox[{"1", "+", "p"}], ")"}]}]]}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"\[Alpha]", "\[Rule]", 
     FractionBox[
      RowBox[{
       RowBox[{"p", " ", 
        RowBox[{"(", 
         RowBox[{"x", "+", "z"}], ")"}]}], "-", "\[Beta]", "+", 
       RowBox[{
        SuperscriptBox["p", "2"], " ", "\[Beta]"}], "+", 
       SqrtBox[
        RowBox[{
         RowBox[{
          RowBox[{"-", "4"}], " ", "p", " ", 
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "1"}], "+", 
            SuperscriptBox["p", "2"]}], ")"}], " ", "x", " ", "\[Beta]"}], 
         "+", 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{"\[Beta]", "-", 
            RowBox[{"p", " ", 
             RowBox[{"(", 
              RowBox[{"x", "+", "z", "+", 
               RowBox[{"p", " ", "\[Beta]"}]}], ")"}]}]}], ")"}], "2"]}]]}], 
      RowBox[{"2", " ", "p", " ", 
       RowBox[{"(", 
        RowBox[{"1", "+", "p"}], ")"}]}]]}], "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell["Only the second results in positive values of \[Alpha].", "Text"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"Reduce", "[", 
   RowBox[{
    RowBox[{"(", 
     RowBox[{"\[Alpha]", "/.", 
      RowBox[{"First", "@", "\[Alpha]sol"}]}], ")"}], ">", "0"}], "]"}], "//",
   "FullSimplify"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"Reduce", "[", 
   RowBox[{
    RowBox[{"(", 
     RowBox[{"\[Alpha]", "/.", 
      RowBox[{"Last", "@", "\[Alpha]sol"}]}], ")"}], ">", "0"}], "]"}], "//", 
  "FullSimplify"}]}], "Input"],

Cell[BoxData["False"], "Output"],

Cell[BoxData[
 RowBox[{"p", ">", "0"}]], "Output"]
}, Open  ]],

Cell["And if we look at the second derivatives it is a maximum:", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"Reduce", "[", 
   RowBox[{
    RowBox[{"(", 
     RowBox[{
      RowBox[{"(", 
       RowBox[{
        RowBox[{"D", "[", 
         RowBox[{
          RowBox[{"D", "[", 
           RowBox[{"L", ",", "\[Alpha]"}], "]"}], ",", "\[Alpha]"}], "]"}], "//",
         "FullSimplify"}], ")"}], "/.", 
      RowBox[{"Last", "@", "\[Alpha]sol"}]}], ")"}], "<", "0"}], "]"}], "//", 
  "FullSimplify"}]], "Input"],

Cell[BoxData[
 RowBox[{"p", ">", "0"}]], "Output"]
}, Open  ]],

Cell["\<\
Next try to maximize \[Beta] in the likilihood replaced with our max for\
\[Alpha]:\
\>", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"\[Beta]sol", "=", 
  RowBox[{
   RowBox[{"Solve", "[", 
    RowBox[{
     RowBox[{
      RowBox[{
       RowBox[{"D", "[", 
        RowBox[{
         RowBox[{"L", "/.", 
          RowBox[{"Last", "@", "\[Alpha]sol"}]}], ",", "\[Beta]"}], "]"}], 
       "\[Equal]", "0"}], "//", "FullSimplify"}], ",", "\[Beta]"}], "]"}], "//",
    "FullSimplify"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"\[Beta]", "\[Rule]", 
     FractionBox[
      RowBox[{"p", " ", 
       RowBox[{"(", 
        RowBox[{"x", "-", "z", "+", 
         RowBox[{"2", " ", "\[ImaginaryI]", " ", 
          SqrtBox[
           RowBox[{"x", " ", "z"}]]}]}], ")"}]}], 
      RowBox[{
       RowBox[{"-", "1"}], "+", 
       SuperscriptBox["p", "2"]}]]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"\[Beta]", "\[Rule]", 
     FractionBox[
      RowBox[{"p", " ", 
       RowBox[{"(", 
        RowBox[{"x", "-", "z", "-", 
         RowBox[{"2", " ", "\[ImaginaryI]", " ", 
          SqrtBox[
           RowBox[{"x", " ", "z"}]]}]}], ")"}]}], 
      RowBox[{
       RowBox[{"-", "1"}], "+", 
       SuperscriptBox["p", "2"]}]]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"\[Beta]", "\[Rule]", 
     FractionBox[
      RowBox[{"y", "+", 
       RowBox[{
        SuperscriptBox["p", "2"], " ", 
        RowBox[{"(", 
         RowBox[{"x", "+", "y"}], ")"}]}], "+", "z", "-", 
       RowBox[{"2", " ", "p", " ", 
        RowBox[{"(", 
         RowBox[{"x", "+", 
          RowBox[{"2", " ", "y"}], "+", "z"}], ")"}]}], "+", 
       SqrtBox[
        RowBox[{
         RowBox[{"4", " ", 
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "2"}], "+", "p"}], ")"}], " ", "p", " ", 
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "1"}], "+", 
            RowBox[{"2", " ", "p"}]}], ")"}], " ", "y", " ", 
          RowBox[{"(", 
           RowBox[{"x", "+", "y", "+", "z"}], ")"}]}], "+", 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{"y", "+", 
            RowBox[{
             SuperscriptBox["p", "2"], " ", 
             RowBox[{"(", 
              RowBox[{"x", "+", "y"}], ")"}]}], "+", "z", "-", 
            RowBox[{"2", " ", "p", " ", 
             RowBox[{"(", 
              RowBox[{"x", "+", 
               RowBox[{"2", " ", "y"}], "+", "z"}], ")"}]}]}], ")"}], 
          "2"]}]]}], 
      RowBox[{"2", " ", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"-", "2"}], "+", "p"}], ")"}], " ", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"-", "1"}], "+", 
         RowBox[{"2", " ", "p"}]}], ")"}]}]]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"\[Beta]", "\[Rule]", 
     FractionBox[
      RowBox[{"y", "+", 
       RowBox[{
        SuperscriptBox["p", "2"], " ", 
        RowBox[{"(", 
         RowBox[{"x", "+", "y"}], ")"}]}], "+", "z", "-", 
       RowBox[{"2", " ", "p", " ", 
        RowBox[{"(", 
         RowBox[{"x", "+", 
          RowBox[{"2", " ", "y"}], "+", "z"}], ")"}]}], "-", 
       SqrtBox[
        RowBox[{
         RowBox[{"4", " ", 
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "2"}], "+", "p"}], ")"}], " ", "p", " ", 
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "1"}], "+", 
            RowBox[{"2", " ", "p"}]}], ")"}], " ", "y", " ", 
          RowBox[{"(", 
           RowBox[{"x", "+", "y", "+", "z"}], ")"}]}], "+", 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{"y", "+", 
            RowBox[{
             SuperscriptBox["p", "2"], " ", 
             RowBox[{"(", 
              RowBox[{"x", "+", "y"}], ")"}]}], "+", "z", "-", 
            RowBox[{"2", " ", "p", " ", 
             RowBox[{"(", 
              RowBox[{"x", "+", 
               RowBox[{"2", " ", "y"}], "+", "z"}], ")"}]}]}], ")"}], 
          "2"]}]]}], 
      RowBox[{"2", " ", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"-", "2"}], "+", "p"}], ")"}], " ", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"-", "1"}], "+", 
         RowBox[{"2", " ", "p"}]}], ")"}]}]]}], "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell["Check which one is positive:", "Text"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"Reduce", "[", 
   RowBox[{
    RowBox[{"(", 
     RowBox[{"\[Beta]", "/.", 
      RowBox[{"\[Beta]sol", "[", 
       RowBox[{"[", "3", "]"}], "]"}]}], ")"}], ">=", "0"}], "]"}], "//", 
  "FullSimplify"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"Reduce", "[", 
   RowBox[{
    RowBox[{"(", 
     RowBox[{"\[Beta]", "/.", 
      RowBox[{"\[Beta]sol", "[", 
       RowBox[{"[", "4", "]"}], "]"}]}], ")"}], ">=", "0"}], "]"}], "//", 
  "FullSimplify"}]}], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"2", " ", "p"}], "\[NotEqual]", "1"}]], "Output"],

Cell[BoxData[
 RowBox[{
  RowBox[{"p", "\[LessEqual]", "0"}], "||", 
  RowBox[{
   RowBox[{"2", " ", "p"}], ">", "1"}]}]], "Output"]
}, Open  ]],

Cell["\<\
The following takes to long to evaluate, lets just assume the first one\
\>", "Text"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"Reduce", "[", 
   RowBox[{
    RowBox[{"(", 
     RowBox[{
      RowBox[{"(", 
       RowBox[{
        RowBox[{"D", "[", 
         RowBox[{
          RowBox[{
           RowBox[{"D", "[", 
            RowBox[{
             RowBox[{
              RowBox[{"(", 
               RowBox[{"L", "/.", 
                RowBox[{"Last", "@", "\[Alpha]sol"}]}], ")"}], "//", 
              "Simplify"}], ",", "\[Beta]"}], "]"}], "//", "Simplify"}], ",", 
          "\[Beta]"}], "]"}], "//", "FullSimplify"}], ")"}], "/.", 
      RowBox[{"\[Beta]sol", "[", 
       RowBox[{"[", "3", "]"}], "]"}]}], ")"}], "<", "0"}], "]"}], "//", 
  "FullSimplify"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"Reduce", "[", 
   RowBox[{
    RowBox[{"(", 
     RowBox[{
      RowBox[{"(", 
       RowBox[{
        RowBox[{"D", "[", 
         RowBox[{
          RowBox[{
           RowBox[{"D", "[", 
            RowBox[{
             RowBox[{
              RowBox[{"(", 
               RowBox[{"L", "/.", 
                RowBox[{"Last", "@", "\[Alpha]sol"}]}], ")"}], "//", 
              "Simplify"}], ",", "\[Beta]"}], "]"}], "//", "Simplify"}], ",", 
          "\[Beta]"}], "]"}], "//", "FullSimplify"}], ")"}], "/.", 
      RowBox[{"\[Beta]sol", "[", 
       RowBox[{"[", "4", "]"}], "]"}]}], ")"}], "<", "0"}], "]"}], "//", 
  "FullSimplify"}]}], "Input"],

Cell[BoxData["$Aborted"], "Output"],

Cell[BoxData["$Aborted"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"Join", "[", 
   RowBox[{
    RowBox[{
     RowBox[{"Last", "@", "\[Alpha]sol"}], "/.", 
     RowBox[{"\[Beta]sol", "[", 
      RowBox[{"[", "3", "]"}], "]"}]}], ",", 
    RowBox[{"\[Beta]sol", "[", 
     RowBox[{"[", "3", "]"}], "]"}]}], "]"}], "//", "Simplify"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"\[Alpha]", "\[Rule]", 
    RowBox[{
     FractionBox["1", 
      RowBox[{"2", " ", "p", " ", 
       RowBox[{"(", 
        RowBox[{"1", "+", "p"}], ")"}]}]], 
     RowBox[{"(", 
      RowBox[{
       RowBox[{"p", " ", 
        RowBox[{"(", 
         RowBox[{"x", "+", "z"}], ")"}]}], "-", 
       FractionBox[
        RowBox[{"y", "+", 
         RowBox[{
          SuperscriptBox["p", "2"], " ", 
          RowBox[{"(", 
           RowBox[{"x", "+", "y"}], ")"}]}], "+", "z", "-", 
         RowBox[{"2", " ", "p", " ", 
          RowBox[{"(", 
           RowBox[{"x", "+", 
            RowBox[{"2", " ", "y"}], "+", "z"}], ")"}]}], "+", 
         SqrtBox[
          RowBox[{
           RowBox[{"4", " ", 
            RowBox[{"(", 
             RowBox[{
              RowBox[{"-", "2"}], "+", "p"}], ")"}], " ", "p", " ", 
            RowBox[{"(", 
             RowBox[{
              RowBox[{"-", "1"}], "+", 
              RowBox[{"2", " ", "p"}]}], ")"}], " ", "y", " ", 
            RowBox[{"(", 
             RowBox[{"x", "+", "y", "+", "z"}], ")"}]}], "+", 
           SuperscriptBox[
            RowBox[{"(", 
             RowBox[{"y", "+", 
              RowBox[{
               SuperscriptBox["p", "2"], " ", 
               RowBox[{"(", 
                RowBox[{"x", "+", "y"}], ")"}]}], "+", "z", "-", 
              RowBox[{"2", " ", "p", " ", 
               RowBox[{"(", 
                RowBox[{"x", "+", 
                 RowBox[{"2", " ", "y"}], "+", "z"}], ")"}]}]}], ")"}], 
            "2"]}]]}], 
        RowBox[{"2", " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"-", "2"}], "+", "p"}], ")"}], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"-", "1"}], "+", 
           RowBox[{"2", " ", "p"}]}], ")"}]}]], "+", 
       FractionBox[
        RowBox[{
         SuperscriptBox["p", "2"], " ", 
         RowBox[{"(", 
          RowBox[{"y", "+", 
           RowBox[{
            SuperscriptBox["p", "2"], " ", 
            RowBox[{"(", 
             RowBox[{"x", "+", "y"}], ")"}]}], "+", "z", "-", 
           RowBox[{"2", " ", "p", " ", 
            RowBox[{"(", 
             RowBox[{"x", "+", 
              RowBox[{"2", " ", "y"}], "+", "z"}], ")"}]}], "+", 
           SqrtBox[
            RowBox[{
             RowBox[{"4", " ", 
              RowBox[{"(", 
               RowBox[{
                RowBox[{"-", "2"}], "+", "p"}], ")"}], " ", "p", " ", 
              RowBox[{"(", 
               RowBox[{
                RowBox[{"-", "1"}], "+", 
                RowBox[{"2", " ", "p"}]}], ")"}], " ", "y", " ", 
              RowBox[{"(", 
               RowBox[{"x", "+", "y", "+", "z"}], ")"}]}], "+", 
             SuperscriptBox[
              RowBox[{"(", 
               RowBox[{"y", "+", 
                RowBox[{
                 SuperscriptBox["p", "2"], " ", 
                 RowBox[{"(", 
                  RowBox[{"x", "+", "y"}], ")"}]}], "+", "z", "-", 
                RowBox[{"2", " ", "p", " ", 
                 RowBox[{"(", 
                  RowBox[{"x", "+", 
                   RowBox[{"2", " ", "y"}], "+", "z"}], ")"}]}]}], ")"}], 
              "2"]}]]}], ")"}]}], 
        RowBox[{"2", " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"-", "2"}], "+", "p"}], ")"}], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"-", "1"}], "+", 
           RowBox[{"2", " ", "p"}]}], ")"}]}]], "+", 
       RowBox[{"\[Sqrt]", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{"-", 
           FractionBox[
            RowBox[{"2", " ", "p", " ", 
             RowBox[{"(", 
              RowBox[{
               RowBox[{"-", "1"}], "+", 
               SuperscriptBox["p", "2"]}], ")"}], " ", "x", " ", 
             RowBox[{"(", 
              RowBox[{"y", "+", 
               RowBox[{
                SuperscriptBox["p", "2"], " ", 
                RowBox[{"(", 
                 RowBox[{"x", "+", "y"}], ")"}]}], "+", "z", "-", 
               RowBox[{"2", " ", "p", " ", 
                RowBox[{"(", 
                 RowBox[{"x", "+", 
                  RowBox[{"2", " ", "y"}], "+", "z"}], ")"}]}], "+", 
               SqrtBox[
                RowBox[{
                 RowBox[{"4", " ", 
                  RowBox[{"(", 
                   RowBox[{
                    RowBox[{"-", "2"}], "+", "p"}], ")"}], " ", "p", " ", 
                  RowBox[{"(", 
                   RowBox[{
                    RowBox[{"-", "1"}], "+", 
                    RowBox[{"2", " ", "p"}]}], ")"}], " ", "y", " ", 
                  RowBox[{"(", 
                   RowBox[{"x", "+", "y", "+", "z"}], ")"}]}], "+", 
                 SuperscriptBox[
                  RowBox[{"(", 
                   RowBox[{"y", "+", 
                    RowBox[{
                    SuperscriptBox["p", "2"], " ", 
                    RowBox[{"(", 
                    RowBox[{"x", "+", "y"}], ")"}]}], "+", "z", "-", 
                    RowBox[{"2", " ", "p", " ", 
                    RowBox[{"(", 
                    RowBox[{"x", "+", 
                    RowBox[{"2", " ", "y"}], "+", "z"}], ")"}]}]}], ")"}], 
                  "2"]}]]}], ")"}]}], 
            RowBox[{
             RowBox[{"(", 
              RowBox[{
               RowBox[{"-", "2"}], "+", "p"}], ")"}], " ", 
             RowBox[{"(", 
              RowBox[{
               RowBox[{"-", "1"}], "+", 
               RowBox[{"2", " ", "p"}]}], ")"}]}]]}], "+", 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", 
              FractionBox[
               RowBox[{"y", "+", 
                RowBox[{
                 SuperscriptBox["p", "2"], " ", 
                 RowBox[{"(", 
                  RowBox[{"x", "+", "y"}], ")"}]}], "+", "z", "-", 
                RowBox[{"2", " ", "p", " ", 
                 RowBox[{"(", 
                  RowBox[{"x", "+", 
                   RowBox[{"2", " ", "y"}], "+", "z"}], ")"}]}], "+", 
                SqrtBox[
                 RowBox[{
                  RowBox[{"4", " ", 
                   RowBox[{"(", 
                    RowBox[{
                    RowBox[{"-", "2"}], "+", "p"}], ")"}], " ", "p", " ", 
                   RowBox[{"(", 
                    RowBox[{
                    RowBox[{"-", "1"}], "+", 
                    RowBox[{"2", " ", "p"}]}], ")"}], " ", "y", " ", 
                   RowBox[{"(", 
                    RowBox[{"x", "+", "y", "+", "z"}], ")"}]}], "+", 
                  SuperscriptBox[
                   RowBox[{"(", 
                    RowBox[{"y", "+", 
                    RowBox[{
                    SuperscriptBox["p", "2"], " ", 
                    RowBox[{"(", 
                    RowBox[{"x", "+", "y"}], ")"}]}], "+", "z", "-", 
                    RowBox[{"2", " ", "p", " ", 
                    RowBox[{"(", 
                    RowBox[{"x", "+", 
                    RowBox[{"2", " ", "y"}], "+", "z"}], ")"}]}]}], ")"}], 
                   "2"]}]]}], 
               RowBox[{"2", " ", 
                RowBox[{"(", 
                 RowBox[{
                  RowBox[{"-", "2"}], "+", "p"}], ")"}], " ", 
                RowBox[{"(", 
                 RowBox[{
                  RowBox[{"-", "1"}], "+", 
                  RowBox[{"2", " ", "p"}]}], ")"}]}]]}], "+", 
             RowBox[{"p", " ", 
              RowBox[{"(", 
               RowBox[{"x", "+", "z", "+", 
                FractionBox[
                 RowBox[{"p", " ", 
                  RowBox[{"(", 
                   RowBox[{"y", "+", 
                    RowBox[{
                    SuperscriptBox["p", "2"], " ", 
                    RowBox[{"(", 
                    RowBox[{"x", "+", "y"}], ")"}]}], "+", "z", "-", 
                    RowBox[{"2", " ", "p", " ", 
                    RowBox[{"(", 
                    RowBox[{"x", "+", 
                    RowBox[{"2", " ", "y"}], "+", "z"}], ")"}]}], "+", 
                    SqrtBox[
                    RowBox[{
                    RowBox[{"4", " ", 
                    RowBox[{"(", 
                    RowBox[{
                    RowBox[{"-", "2"}], "+", "p"}], ")"}], " ", "p", " ", 
                    RowBox[{"(", 
                    RowBox[{
                    RowBox[{"-", "1"}], "+", 
                    RowBox[{"2", " ", "p"}]}], ")"}], " ", "y", " ", 
                    RowBox[{"(", 
                    RowBox[{"x", "+", "y", "+", "z"}], ")"}]}], "+", 
                    SuperscriptBox[
                    RowBox[{"(", 
                    RowBox[{"y", "+", 
                    RowBox[{
                    SuperscriptBox["p", "2"], " ", 
                    RowBox[{"(", 
                    RowBox[{"x", "+", "y"}], ")"}]}], "+", "z", "-", 
                    RowBox[{"2", " ", "p", " ", 
                    RowBox[{"(", 
                    RowBox[{"x", "+", 
                    RowBox[{"2", " ", "y"}], "+", "z"}], ")"}]}]}], ")"}], 
                    "2"]}]]}], ")"}]}], 
                 RowBox[{"2", " ", 
                  RowBox[{"(", 
                   RowBox[{
                    RowBox[{"-", "2"}], "+", "p"}], ")"}], " ", 
                  RowBox[{"(", 
                   RowBox[{
                    RowBox[{"-", "1"}], "+", 
                    RowBox[{"2", " ", "p"}]}], ")"}]}]]}], ")"}]}]}], ")"}], 
           "2"]}], ")"}]}]}], ")"}]}]}], ",", 
   RowBox[{"\[Beta]", "\[Rule]", 
    FractionBox[
     RowBox[{"y", "+", 
      RowBox[{
       SuperscriptBox["p", "2"], " ", 
       RowBox[{"(", 
        RowBox[{"x", "+", "y"}], ")"}]}], "+", "z", "-", 
      RowBox[{"2", " ", "p", " ", 
       RowBox[{"(", 
        RowBox[{"x", "+", 
         RowBox[{"2", " ", "y"}], "+", "z"}], ")"}]}], "+", 
      SqrtBox[
       RowBox[{
        RowBox[{"4", " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"-", "2"}], "+", "p"}], ")"}], " ", "p", " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"-", "1"}], "+", 
           RowBox[{"2", " ", "p"}]}], ")"}], " ", "y", " ", 
         RowBox[{"(", 
          RowBox[{"x", "+", "y", "+", "z"}], ")"}]}], "+", 
        SuperscriptBox[
         RowBox[{"(", 
          RowBox[{"y", "+", 
           RowBox[{
            SuperscriptBox["p", "2"], " ", 
            RowBox[{"(", 
             RowBox[{"x", "+", "y"}], ")"}]}], "+", "z", "-", 
           RowBox[{"2", " ", "p", " ", 
            RowBox[{"(", 
             RowBox[{"x", "+", 
              RowBox[{"2", " ", "y"}], "+", "z"}], ")"}]}]}], ")"}], 
         "2"]}]]}], 
     RowBox[{"2", " ", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"-", "2"}], "+", "p"}], ")"}], " ", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"-", "1"}], "+", 
        RowBox[{"2", " ", "p"}]}], ")"}]}]]}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"\[Beta]sol", "[", 
  RowBox[{"[", "3", "]"}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"\[Beta]", "\[Rule]", 
   FractionBox[
    RowBox[{"y", "+", 
     RowBox[{
      SuperscriptBox["p", "2"], " ", 
      RowBox[{"(", 
       RowBox[{"x", "+", "y"}], ")"}]}], "+", "z", "-", 
     RowBox[{"2", " ", "p", " ", 
      RowBox[{"(", 
       RowBox[{"x", "+", 
        RowBox[{"2", " ", "y"}], "+", "z"}], ")"}]}], "+", 
     SqrtBox[
      RowBox[{
       RowBox[{"4", " ", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{"-", "2"}], "+", "p"}], ")"}], " ", "p", " ", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{"-", "1"}], "+", 
          RowBox[{"2", " ", "p"}]}], ")"}], " ", "y", " ", 
        RowBox[{"(", 
         RowBox[{"x", "+", "y", "+", "z"}], ")"}]}], "+", 
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{"y", "+", 
          RowBox[{
           SuperscriptBox["p", "2"], " ", 
           RowBox[{"(", 
            RowBox[{"x", "+", "y"}], ")"}]}], "+", "z", "-", 
          RowBox[{"2", " ", "p", " ", 
           RowBox[{"(", 
            RowBox[{"x", "+", 
             RowBox[{"2", " ", "y"}], "+", "z"}], ")"}]}]}], ")"}], "2"]}]]}], 
    RowBox[{"2", " ", 
     RowBox[{"(", 
      RowBox[{
       RowBox[{"-", "2"}], "+", "p"}], ")"}], " ", 
     RowBox[{"(", 
      RowBox[{
       RowBox[{"-", "1"}], "+", 
       RowBox[{"2", " ", "p"}]}], ")"}]}]]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Solve", "[", 
  RowBox[{
   RowBox[{
    RowBox[{
     RowBox[{"D", "[", 
      RowBox[{
       RowBox[{"L", "/.", 
        RowBox[{"Join", "[", 
         RowBox[{
          RowBox[{"Last", "@", "\[Alpha]sol"}], ",", 
          RowBox[{"\[Beta]sol", "[", 
           RowBox[{"[", "3", "]"}], "]"}]}], "]"}]}], ",", "p"}], "]"}], 
     "\[Equal]", "0"}], "//", "FullSimplify"}], ",", "p"}], "]"}]], "Input"],

Cell[BoxData["$Aborted"], "Output"]
}, Open  ]]
}, Closed]]
}, Closed]],

Cell[CellGroupData[{

Cell["Integrated Likelihood", "Subsection"],

Cell["\<\
Messing around with integrated likelihood function; no good came of it.\
\>", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Integrate", "[", 
  RowBox[{
   RowBox[{
    FractionBox[
     RowBox[{
      SuperscriptBox["\[Alpha]", "x"], 
      RowBox[{"Exp", "[", 
       RowBox[{"-", "\[Alpha]"}], "]"}]}], 
     RowBox[{"Factorial", "[", "x", "]"}]], "*", 
    FractionBox[
     RowBox[{
      SuperscriptBox["\[Beta]", "y"], 
      RowBox[{"Exp", "[", 
       RowBox[{"-", "\[Beta]"}], "]"}]}], 
     RowBox[{"Factorial", "[", "y", "]"}]], "*", 
    FractionBox[
     RowBox[{
      SuperscriptBox[
       RowBox[{"(", 
        RowBox[{
         RowBox[{"p", " ", "\[Alpha]"}], "+", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{"1", "-", "p"}], ")"}], "\[Beta]"}]}], ")"}], "z"], 
      RowBox[{"Exp", "[", 
       RowBox[{"-", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{"p", " ", "\[Alpha]"}], "+", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{"1", "-", "p"}], ")"}], "\[Beta]"}]}], ")"}]}], "]"}]}], 
     RowBox[{"Factorial", "[", "z", "]"}]]}], ",", 
   RowBox[{"{", 
    RowBox[{"\[Alpha]", ",", "0", ",", "c"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{
  SubsuperscriptBox["\[Integral]", "0", "c"], 
  RowBox[{
   FractionBox[
    RowBox[{
     SuperscriptBox["\[ExponentialE]", 
      RowBox[{
       RowBox[{"-", "\[Alpha]"}], "-", 
       RowBox[{"p", " ", "\[Alpha]"}], "-", "\[Beta]", "-", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{"1", "-", "p"}], ")"}], " ", "\[Beta]"}]}]], " ", 
     SuperscriptBox["\[Alpha]", "x"], " ", 
     SuperscriptBox["\[Beta]", "y"], " ", 
     SuperscriptBox[
      RowBox[{"(", 
       RowBox[{
        RowBox[{"p", " ", "\[Alpha]"}], "+", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{"1", "-", "p"}], ")"}], " ", "\[Beta]"}]}], ")"}], "z"]}], 
    RowBox[{
     RowBox[{"x", "!"}], " ", 
     RowBox[{"y", "!"}], " ", 
     RowBox[{"z", "!"}]}]], 
   RowBox[{"\[DifferentialD]", "\[Alpha]"}]}]}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"Integrate", "[", 
   RowBox[{
    RowBox[{"Sqrt", "[", 
     RowBox[{
      RowBox[{"x", "^", "2"}], "+", "1"}], "]"}], ",", 
    RowBox[{"{", 
     RowBox[{"x", ",", "1", ",", "c"}], "}"}]}], "]"}], "//", 
  "FullSimplify"}]], "Input"],

Cell[BoxData[
 RowBox[{"ConditionalExpression", "[", 
  RowBox[{
   RowBox[{
    FractionBox["1", "2"], " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"-", 
       SqrtBox["2"]}], "+", 
      RowBox[{"c", " ", 
       SqrtBox[
        RowBox[{"1", "+", 
         SuperscriptBox["c", "2"]}]]}], "-", 
      RowBox[{"ArcSinh", "[", "1", "]"}], "+", 
      RowBox[{"ArcSinh", "[", "c", "]"}]}], ")"}]}], ",", 
   RowBox[{
    RowBox[{
     RowBox[{"Re", "[", "c", "]"}], ">", "1"}], "&&", 
    RowBox[{
     RowBox[{"Im", "[", "c", "]"}], "\[Equal]", "0"}]}]}], "]"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"ConditionalExpression", "[", 
   RowBox[{
    RowBox[{
     FractionBox["1", "2"], " ", 
     RowBox[{"(", 
      RowBox[{
       RowBox[{"-", 
        SqrtBox["2"]}], "+", 
       RowBox[{"c", " ", 
        SqrtBox[
         RowBox[{"1", "+", 
          SuperscriptBox["c", "2"]}]]}], "-", 
       RowBox[{"ArcSinh", "[", "1", "]"}], "+", 
       RowBox[{"ArcSinh", "[", "c", "]"}]}], ")"}]}], ",", 
    RowBox[{
     RowBox[{
      RowBox[{"Re", "[", "c", "]"}], ">", "1"}], "&&", 
     RowBox[{
      RowBox[{"Im", "[", "c", "]"}], "\[Equal]", "0"}]}]}], "]"}], "//", 
  "FullSimplify"}]], "Input"],

Cell[BoxData[
 RowBox[{"ConditionalExpression", "[", 
  RowBox[{
   RowBox[{
    FractionBox["1", "2"], " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"-", 
       SqrtBox["2"]}], "+", 
      RowBox[{"c", " ", 
       SqrtBox[
        RowBox[{"1", "+", 
         SuperscriptBox["c", "2"]}]]}], "-", 
      RowBox[{"ArcSinh", "[", "1", "]"}], "+", 
      RowBox[{"ArcSinh", "[", "c", "]"}]}], ")"}]}], ",", 
   RowBox[{
    RowBox[{
     RowBox[{"Re", "[", "c", "]"}], ">", "1"}], "&&", 
    RowBox[{
     RowBox[{"Im", "[", "c", "]"}], "\[Equal]", "0"}]}]}], "]"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Plot", "[", 
  RowBox[{"ArcSinh", "[", "c", "]"}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"Plot", "::", "argr"}], "MessageName"], ":", 
  " ", "\<\"\[NoBreak]\\!\\(Plot\\)\[NoBreak] called with 1 argument; \
\[NoBreak]\\!\\(2\\)\[NoBreak] arguments are expected. \
\\!\\(\\*ButtonBox[\\\"\[RightSkeleton]\\\", ButtonStyle->\\\"Link\\\", \
ButtonFrame->None, ButtonData:>\\\"paclet:ref/Plot\\\", ButtonNote -> \
\\\"Plot::argr\\\"]\\)\"\>"}]], "Message", "MSG"],

Cell[BoxData[
 RowBox[{"Plot", "[", 
  RowBox[{"ArcSinh", "[", "c", "]"}], "]"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Limit", "[", 
  RowBox[{
   RowBox[{
    RowBox[{"Sqrt", "[", 
     RowBox[{
      RowBox[{"n", "^", "2"}], "+", "1"}], "]"}], "-", "n", "+", "2"}], ",", 
   RowBox[{"n", "\[Rule]", "\[Infinity]"}]}], "]"}]], "Input"],

Cell[BoxData["2"], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{"QUDoc", "@", "FindPulse"}]], "Input"]
}, Closed]],

Cell[CellGroupData[{

Cell["Profiled Bayes estimate", "Subsection"],

Cell["\<\
Messing around with profiled Bayes\[CloseCurlyQuote] estimates; no good game \
of it.\
\>", "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"Lp", "[", 
    RowBox[{"p_", ",", "z_", ",", "\[Alpha]_", ",", "\[Beta]_"}], "]"}], "=", 
   
   FractionBox[
    RowBox[{
     SuperscriptBox[
      RowBox[{"(", 
       RowBox[{
        RowBox[{"p", " ", "\[Alpha]"}], "+", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{"1", "-", "p"}], ")"}], "\[Beta]"}]}], ")"}], "z"], 
     RowBox[{"Exp", "[", 
      RowBox[{"-", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"p", " ", "\[Alpha]"}], "+", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{"1", "-", "p"}], ")"}], "\[Beta]"}]}], ")"}]}], "]"}]}], 
    RowBox[{"Factorial", "[", "z", "]"}]]}], ";"}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"prior", "[", "p_", "]"}], ":=", "1"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"denom", "=", 
  RowBox[{
   RowBox[{"Integrate", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"Lp", "[", 
       RowBox[{"p", ",", "z", ",", "\[Alpha]", ",", "\[Beta]"}], "]"}], 
      RowBox[{"prior", "[", "p", "]"}]}], ",", 
     RowBox[{"{", 
      RowBox[{"p", ",", "0", ",", "1"}], "}"}]}], "]"}], "//", 
   "FullSimplify"}]}]], "Input"],

Cell[BoxData[
 FractionBox[
  RowBox[{
   RowBox[{"-", 
    RowBox[{"Gamma", "[", 
     RowBox[{
      RowBox[{"1", "+", "z"}], ",", "\[Alpha]"}], "]"}]}], "+", 
   RowBox[{"Gamma", "[", 
    RowBox[{
     RowBox[{"1", "+", "z"}], ",", "\[Beta]"}], "]"}]}], 
  RowBox[{
   RowBox[{"(", 
    RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], " ", 
   RowBox[{"z", "!"}]}]]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"posterior", "[", 
   RowBox[{"p_", ",", "z_", ",", "\[Alpha]_", ",", "\[Beta]_"}], "]"}], "=", 
  RowBox[{
   RowBox[{"Lp", "[", 
    RowBox[{"p", ",", "z", ",", "\[Alpha]", ",", "\[Beta]"}], "]"}], 
   RowBox[{
    RowBox[{"prior", "[", "p", "]"}], "/", "denom"}]}]}]], "Input"],

Cell[BoxData[
 FractionBox[
  RowBox[{
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{
     RowBox[{
      RowBox[{"-", "p"}], " ", "\[Alpha]"}], "-", 
     RowBox[{
      RowBox[{"(", 
       RowBox[{"1", "-", "p"}], ")"}], " ", "\[Beta]"}]}]], " ", 
   RowBox[{"(", 
    RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], " ", 
   SuperscriptBox[
    RowBox[{"(", 
     RowBox[{
      RowBox[{"p", " ", "\[Alpha]"}], "+", 
      RowBox[{
       RowBox[{"(", 
        RowBox[{"1", "-", "p"}], ")"}], " ", "\[Beta]"}]}], ")"}], "z"]}], 
  RowBox[{
   RowBox[{"-", 
    RowBox[{"Gamma", "[", 
     RowBox[{
      RowBox[{"1", "+", "z"}], ",", "\[Alpha]"}], "]"}]}], "+", 
   RowBox[{"Gamma", "[", 
    RowBox[{
     RowBox[{"1", "+", "z"}], ",", "\[Beta]"}], "]"}]}]]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"estBayes", "=", 
  RowBox[{
   RowBox[{"Integrate", "[", 
    RowBox[{
     RowBox[{"p", "*", 
      RowBox[{"posterior", "[", 
       RowBox[{"p", ",", "z", ",", "\[Alpha]", ",", "\[Beta]"}], "]"}]}], ",", 
     RowBox[{"{", 
      RowBox[{"p", ",", "0", ",", "1"}], "}"}]}], "]"}], "//", 
   "FullSimplify"}]}]], "Input"],

Cell[BoxData[
 FractionBox[
  RowBox[{
   RowBox[{
    RowBox[{"-", "\[Beta]"}], " ", 
    RowBox[{"Gamma", "[", 
     RowBox[{
      RowBox[{"1", "+", "z"}], ",", "\[Alpha]"}], "]"}]}], "+", 
   RowBox[{"\[Beta]", " ", 
    RowBox[{"Gamma", "[", 
     RowBox[{
      RowBox[{"1", "+", "z"}], ",", "\[Beta]"}], "]"}]}], "+", 
   RowBox[{"Gamma", "[", 
    RowBox[{
     RowBox[{"2", "+", "z"}], ",", "\[Alpha]"}], "]"}], "-", 
   RowBox[{"Gamma", "[", 
    RowBox[{
     RowBox[{"2", "+", "z"}], ",", "\[Beta]"}], "]"}]}], 
  RowBox[{
   RowBox[{"(", 
    RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], " ", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"Gamma", "[", 
      RowBox[{
       RowBox[{"1", "+", "z"}], ",", "\[Alpha]"}], "]"}], "-", 
     RowBox[{"Gamma", "[", 
      RowBox[{
       RowBox[{"1", "+", "z"}], ",", "\[Beta]"}], "]"}]}], ")"}]}]]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(", 
   RowBox[{"estBayes", "-", "p"}], ")"}], "/.", 
  RowBox[{"{", 
   RowBox[{
    RowBox[{"\[Alpha]", "\[Rule]", 
     RowBox[{"\[Alpha]", "*", "nshots"}]}], ",", 
    RowBox[{"\[Beta]", "\[Rule]", 
     RowBox[{"\[Beta]", "*", "nshots"}]}]}], "}"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"-", "p"}], "+", 
  FractionBox[
   RowBox[{
    RowBox[{
     RowBox[{"-", "nshots"}], " ", "\[Beta]", " ", 
     RowBox[{"Gamma", "[", 
      RowBox[{
       RowBox[{"1", "+", "z"}], ",", 
       RowBox[{"nshots", " ", "\[Alpha]"}]}], "]"}]}], "+", 
    RowBox[{"nshots", " ", "\[Beta]", " ", 
     RowBox[{"Gamma", "[", 
      RowBox[{
       RowBox[{"1", "+", "z"}], ",", 
       RowBox[{"nshots", " ", "\[Beta]"}]}], "]"}]}], "+", 
    RowBox[{"Gamma", "[", 
     RowBox[{
      RowBox[{"2", "+", "z"}], ",", 
      RowBox[{"nshots", " ", "\[Alpha]"}]}], "]"}], "-", 
    RowBox[{"Gamma", "[", 
     RowBox[{
      RowBox[{"2", "+", "z"}], ",", 
      RowBox[{"nshots", " ", "\[Beta]"}]}], "]"}]}], 
   RowBox[{
    RowBox[{"(", 
     RowBox[{
      RowBox[{"nshots", " ", "\[Alpha]"}], "-", 
      RowBox[{"nshots", " ", "\[Beta]"}]}], ")"}], " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"Gamma", "[", 
       RowBox[{
        RowBox[{"1", "+", "z"}], ",", 
        RowBox[{"nshots", " ", "\[Alpha]"}]}], "]"}], "-", 
      RowBox[{"Gamma", "[", 
       RowBox[{
        RowBox[{"1", "+", "z"}], ",", 
        RowBox[{"nshots", " ", "\[Beta]"}]}], "]"}]}], ")"}]}]]}]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["Fisher Information", "Subsection"],

Cell["Quick check that sums are working over the likelihood:", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"Sum", "[", 
   RowBox[{"L", ",", 
    RowBox[{"{", 
     RowBox[{"x", ",", "0", ",", "\[Infinity]"}], "}"}], ",", 
    RowBox[{"{", 
     RowBox[{"y", ",", "0", ",", "\[Infinity]"}], "}"}], ",", 
    RowBox[{"{", 
     RowBox[{"z", ",", "0", ",", "\[Infinity]"}], "}"}]}], "]"}], "//", 
  "Simplify"}]], "Input"],

Cell[BoxData["1"], "Output"]
}, Open  ]],

Cell["Now get Fisher matrix:", "Text"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"Ifisher", "=", 
   RowBox[{
    RowBox[{"-", 
     RowBox[{"Sum", "[", 
      RowBox[{
       RowBox[{"Evaluate", "[", 
        RowBox[{"Simplify", "[", 
         RowBox[{
          RowBox[{"Outer", "[", 
           RowBox[{
            RowBox[{
             RowBox[{"D", "[", 
              RowBox[{"LL", ",", "#1", ",", "#2"}], "]"}], "&"}], ",", 
            RowBox[{"{", 
             RowBox[{"p", ",", "\[Alpha]", ",", "\[Beta]"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"p", ",", "\[Alpha]", ",", "\[Beta]"}], "}"}]}], "]"}], 
          "L"}], "]"}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"x", ",", "0", ",", "\[Infinity]"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"y", ",", "0", ",", "\[Infinity]"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"z", ",", "0", ",", "\[Infinity]"}], "}"}]}], "]"}]}], "//", 
    "FullSimplify"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Ifisher", "//", "MatrixForm"}]}], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      FractionBox[
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], "2"], 
       RowBox[{
        RowBox[{"p", " ", 
         RowBox[{"(", 
          RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}]], 
      FractionBox[
       RowBox[{"p", " ", 
        RowBox[{"(", 
         RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], 
       RowBox[{
        RowBox[{"p", " ", 
         RowBox[{"(", 
          RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}]], 
      RowBox[{
       RowBox[{"-", "1"}], "+", 
       FractionBox["\[Alpha]", 
        RowBox[{
         RowBox[{"p", " ", "\[Alpha]"}], "+", "\[Beta]", "-", 
         RowBox[{"p", " ", "\[Beta]"}]}]]}]},
     {
      FractionBox[
       RowBox[{"p", " ", 
        RowBox[{"(", 
         RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], 
       RowBox[{
        RowBox[{"p", " ", 
         RowBox[{"(", 
          RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}]], 
      RowBox[{
       FractionBox["1", "\[Alpha]"], "+", 
       FractionBox[
        SuperscriptBox["p", "2"], 
        RowBox[{
         RowBox[{"p", " ", "\[Alpha]"}], "+", "\[Beta]", "-", 
         RowBox[{"p", " ", "\[Beta]"}]}]]}], 
      RowBox[{"-", 
       FractionBox[
        RowBox[{
         RowBox[{"(", 
          RowBox[{
           RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", "p"}], 
        RowBox[{
         RowBox[{"p", " ", 
          RowBox[{"(", 
           RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}]]}]},
     {
      RowBox[{
       RowBox[{"-", "1"}], "+", 
       FractionBox["\[Alpha]", 
        RowBox[{
         RowBox[{"p", " ", "\[Alpha]"}], "+", "\[Beta]", "-", 
         RowBox[{"p", " ", "\[Beta]"}]}]]}], 
      RowBox[{"-", 
       FractionBox[
        RowBox[{
         RowBox[{"(", 
          RowBox[{
           RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", "p"}], 
        RowBox[{
         RowBox[{"p", " ", 
          RowBox[{"(", 
           RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}]]}], 
      FractionBox[
       RowBox[{
        RowBox[{"p", " ", "\[Alpha]"}], "+", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{
           RowBox[{"-", "2"}], "+", "p"}], ")"}], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", "\[Beta]"}]}], 
       RowBox[{"\[Beta]", " ", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{"p", " ", 
           RowBox[{"(", 
            RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}], 
         ")"}]}]]}
    },
    GridBoxAlignment->{
     "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, "Rows" -> {{Baseline}}, 
      "RowsIndexed" -> {}},
    GridBoxSpacings->{"Columns" -> {
        Offset[0.27999999999999997`], {
         Offset[0.7]}, 
        Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
        Offset[0.2], {
         Offset[0.4]}, 
        Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
  Function[BoxForm`e$, 
   MatrixForm[BoxForm`e$]]]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"Iinv", "=", 
   RowBox[{
    RowBox[{"Ifisher", "//", "Inverse"}], "//", "FullSimplify"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Iinv", "//", "MatrixForm"}]}], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      FractionBox[
       RowBox[{
        RowBox[{"p", " ", 
         RowBox[{"(", 
          RowBox[{"1", "+", "p"}], ")"}], " ", "\[Alpha]"}], "+", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{
           RowBox[{"-", "2"}], "+", "p"}], ")"}], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", "\[Beta]"}]}], 
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], "2"]], 
      FractionBox[
       RowBox[{"p", " ", "\[Alpha]"}], 
       RowBox[{
        RowBox[{"-", "\[Alpha]"}], "+", "\[Beta]"}]], 
      FractionBox[
       RowBox[{
        RowBox[{"(", 
         RowBox[{
          RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", "\[Beta]"}], 
       RowBox[{"\[Alpha]", "-", "\[Beta]"}]]},
     {
      FractionBox[
       RowBox[{"p", " ", "\[Alpha]"}], 
       RowBox[{
        RowBox[{"-", "\[Alpha]"}], "+", "\[Beta]"}]], "\[Alpha]", "0"},
     {
      FractionBox[
       RowBox[{
        RowBox[{"(", 
         RowBox[{
          RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", "\[Beta]"}], 
       RowBox[{"\[Alpha]", "-", "\[Beta]"}]], "0", "\[Beta]"}
    },
    GridBoxAlignment->{
     "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, "Rows" -> {{Baseline}}, 
      "RowsIndexed" -> {}},
    GridBoxSpacings->{"Columns" -> {
        Offset[0.27999999999999997`], {
         Offset[0.7]}, 
        Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
        Offset[0.2], {
         Offset[0.4]}, 
        Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
  Function[BoxForm`e$, 
   MatrixForm[BoxForm`e$]]]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"exportme", "[", "\"\<cramer-rao\>\"", "]"}], "@", 
  RowBox[{"ContourPlot", "[", "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     RowBox[{"Log10", "@", 
      RowBox[{"Iinv", "[", 
       RowBox[{"[", 
        RowBox[{"1", ",", "1"}], "]"}], "]"}]}], "//.", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"\[Beta]", "\[Rule]", 
        RowBox[{
         RowBox[{"1", "/", "2"}], " ", "\[Alpha]"}]}], ",", 
       RowBox[{"\[Alpha]", "\[Rule]", 
        SuperscriptBox["10", "n"]}]}], "}"}]}], ",", 
    RowBox[{"{", 
     RowBox[{"p", ",", "0", ",", "1"}], "}"}], ",", 
    RowBox[{"{", 
     RowBox[{"n", ",", "0", ",", "6"}], "}"}], ",", "\[IndentingNewLine]", 
    RowBox[{"FrameTicks", "\[Rule]", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"Table", "[", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{"n", ",", 
             SuperscriptBox["\"\<10\>\"", "n"]}], "}"}], ",", 
           RowBox[{"{", 
            RowBox[{"n", ",", "0", ",", "6"}], "}"}]}], "]"}], ",", "None"}], 
        "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"Automatic", ",", "Automatic"}], "}"}]}], "}"}]}], ",", 
    "\[IndentingNewLine]", 
    RowBox[{"FrameLabel", "\[Rule]", 
     RowBox[{"MaTeX", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"\"\<p\>\"", ",", "\"\<\\\\alpha\>\""}], "}"}], ",", 
       RowBox[{"FontSize", "\[Rule]", "14"}]}], "]"}]}], ",", 
    "\[IndentingNewLine]", 
    RowBox[{"ImageSize", "\[Rule]", "350"}], ",", "\[IndentingNewLine]", 
    RowBox[{"PlotLabel", "\[Rule]", 
     RowBox[{"MaTeX", "[", 
      RowBox[{
      "\"\<\\\\text{Cram\\\\'er-Rao bound of \
}\\\\log_{10}\\\\text{Var}[p]\>\"", ",", 
       RowBox[{"FontSize", "->", "14"}]}], "]"}]}], ",", 
    "\[IndentingNewLine]", 
    RowBox[{"PlotLegends", "\[Rule]", 
     RowBox[{"BarLegend", "[", 
      RowBox[{"Automatic", ",", 
       RowBox[{"Table", "[", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"n", ",", "0"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"n", ",", "0", ",", 
           RowBox[{"-", "4"}]}], "}"}]}], "]"}], ",", 
       RowBox[{"LabelStyle", "\[Rule]", "texStyle"}], ",", 
       RowBox[{"LegendMargins", "\[Rule]", "0"}], ",", 
       RowBox[{"LegendMarkerSize", "\[Rule]", "300"}], ",", 
       RowBox[{"LegendLabel", "\[Rule]", "None"}]}], "]"}]}], ",", 
    "\[IndentingNewLine]", 
    RowBox[{"BaseStyle", "\[Rule]", "texStyle"}]}], "\[IndentingNewLine]", 
   "]"}]}]], "Input"],

Cell[BoxData[
 TemplateBox[{GraphicsBox[
    GraphicsComplexBox[CompressedData["
1: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
VZ9K8i71y9CLjfVEkW7jOVFfSdr1PL4uYE4p6Tna8OBeWwsaIj0/a947v+XE
mjaWnv/X0UOqU0HW1E96ftyL65s1K035qPR87fpo77O7NfS99PwBH9fs3HVd
Q8+mTC2I9C4hP6yuPrJ9lY6eHnnUo5HJHzXweHX/QaBOmH8dtfCq27P1qf3k
vHOPBoHabLLuavzMhGXHyYNRE+NVdbLJyfPqhPSGIeTWoIeTpkfryejRqi+/
0IcRy/hJ7d/d0JPGkz09qnbdJX2uuWman9WT0sOTH7dqep/8YLjvH2LyP76L
bEriYp8QuuzUxrUxprx0nVeUZWAs2XXFL+mLND3J8Wi7qp3TczJ97nc9slpn
k40tfEMXKBLI+whb7wd9sklKO0vXf18kk2TVoGbbr2STltpdHjEzUsjesN6f
/r6fTSb4WtxYei6dVJSuadhyWQ65XLR1ofutdDLCycK2bHkOOTbhY4aNMosY
Ag7tG/NDLhk58Ruve+1M/bzKmhf3ySNPzuz1HDwkl7zw7nM+vk8+8X/rMGPq
8x3EIjzy18fbDeTujXWHCi8Hkw0Hru08M81AypLqj76ruUs8LrR0W+lpIE7W
yfFJbZ+Que+btjwwxUB2ulc6J/8RT5I/Ttn05SYDad44Ov6xQzE5k7ksyuhT
Tb6I/tJRaSwmR9865PY6VE36dxzx3Gp3CRlxvpfNd3Y15NWUFX0P2JeSZpve
t03rUkNWHZk1lL7Wk00W9y7N36Ck7v67EopTs8mUBZb74o8oaafjpVsH+OaS
a6MP3O0Xr6Q+qpyPAYZc0mKqclC7XCUdRv9ZZpVv2r8orw8Lbq2iWYcd7lc7
FJB+ndvnnfhSRRfeqkit6VhIbobdaT1hnooOCpzWoPGwYpLZ/c++s66r6DnJ
nvbXM7q2rmtBe0v20iFa7X/0rhWdIdnLlaCkK3XDreh1yV7Kt73ZlXLRirpK
9hL1bpdlmMmftZDsZdvZwChXk797JdmLR/9L3iUmPEeyl5ETZ/pkXbKiyZK9
tOuQ0c3S5C8LJHtJTY0bXnHfiq6T7OVWZ8VPb55Y0TTJXoLvbHNt89qKNpPs
Zcb5J79//saKTpbspU6V98BhzdT0gmQvjvfqKqpM+IhkL2RyQV7Cj2r6g2Qv
TroqC+MWNX0s2UuP5CdF756o6beSvdQrm+e1YKqGXpLs5fCJX9rOGquhOZK9
aGdvCPzHQ0MbSfYyYYXrhvyfTPs1yV4+VCf7PPTR0BaSvXy9tFn5rZ/s6eeS
vRT2HbLM3deeEslens96EjkqwJ4WSPZy32dFw+A/7elqyV7u1Z8ytleUltnL
pV5rH796pmX2Mr79U/2BV1pmL7aX/FvueKOl30r2srqe19FUOx3NlOyluZPj
23gHHV0g2UvGy8ztHXvq6EDJXn5tMvRANy8d/WvduvX/829lOUenZZv8zc1v
L3/d+W0pSXrWqH7uPrm+59Oyf0bYD85m+X2NU52Spvk55G2Hn28f6f7yP/W1
XpGdbJ8m57L8obujfbp7bh6L97sON2vqO1c+L5p0+ul3BWPk86HlMesSDnnJ
50HE2zJ+/AoDyzdeuvTY23i4im4Z1uxDd9V/6zMf/bKqvGqvSoinKiGeyucz
q19+/lzxzErIF9Q0UuIn1lOa8wd5//xDbf6gZvHxeG18lM9Pkmvjo3xeklkb
H+XzEbva+Ch/r1ZaG591NOumU7qn6r/1eeZ4rRPitY462bovf/Z1CXlo8Ii3
XCHX5y1b+aBV3gYddXFOaXVsmvw9DPLfbwxxcxIC5XruDtHOdrcbyvVWdxpZ
39V0NLL750curlFzI+R6nHL/QRcDYuT6OoPP6L+9JmtpWeuprt17LCT3e1+Z
smSGlnbeGRbi0PUg+e783BEtfbR04rVrPyb5XST5L9vFfuelpZuGRkT3pEdJ
+7iHASHecr2dOd/R0vcnPr5qtbOI9LDtEtBxdSH568Oxl4bfi0lgdHaP1E+F
pNDF4Zf8s69J5vl+GXOOFJF15+7OdP1VT6qdKka6v68k83xDPCI9s8mBmBFu
aV8YyfiYlvMjtuWQrp1vv3Ez5bdvpefbBFgd+u6gNd0tPT+vvOLxh9vWtEB6
vmHW0+DUAmsaID2fqFYG/RimoQuk5xd0CdL0eKihY6Xnqx+dvxmYpmH3H3+8
P9ugqJc83/m7W+t7TNax+QvTHSnMscwmlgtS/J8k+ZFw3bzFX/U06WHv0BXn
7C6Q6MmxQRcK9GRYP/e1Sz5/RTbGDep+y2Qv3R/M+vnkKdP4WxxZsH6kjl4q
JAk+voVEf3yCsU5fHV24x9LhUJ8i4lFw7kArNx0dnDC351dFxcQn1DK5zwwd
9dhvW3/J6Ndkz4CWeybMkevx2gRF9GzvlcvswV/n/EdbrzxWT/FyzLAWSxbk
s/Ogvv3rTbu2r4DVOww7M3fIT0+xTg+TjE0jF81fi/UeSgyj3fTtvXG+e4+M
HXTVN8TTwOp3fB9l7tr6s4HV4/Qrfz300S6cL6eQ9eUJsyZkGNj5VOPXoc/d
+lWy+jV7t8nOjucq2Xjsi8bbJS6Qv5cx27P8vUx5VeCQR3ZyPZrlsc5bLMfI
369kKdf7NNwlf79icNTcT0+Tv1/ZtpXued1Oriczv89aWB9yvRjZGXjd8ie5
PixpRIdx5zzkerAm31TkThkn13+N8Au1eztNrvfy8Xs/LmmJfF7naux4ddRW
uZ5r7Sgn17Wn5feVnQqK8gjXk756j9U99lwhuTeGlfdO1JNvHP2bpDW8Q7SX
Zsz3uqxn+ri4buaz+aZ8Mby8a0jmpkjivbNzYcdzetLoavTxnZ0ekl+G7vHQ
XdUzfT3ZfadT83g9qb/j+wu6Y49IQc2g3B639eTrmQNWZYY9I+WfLS/xK9Mz
ff6mT928u1M28V7yftugx3EkdMTmL4qV2WTi05MNWy1JJE3mVDpPn5bN9G2V
fTrpxq1sssvB7sDLHklk9ejyOR/8THF/7S90w8BUknF5+49htvL3cF1eLDm1
87cccuNCSbp/UCpZO96maW7THPKkwd5hLW0ySc2Kjsm2r3PIkL+6TC5Yoydj
31rWZLzJJZmJbp2b1eSQbftyZ7p+lk+2frXu9ITJ+SRy0C/NdW4FZIBDxu8T
/fLJzM4nX7weU0CmBAxvdn/5K/KN5dK0BT6vyK0u8WsmVZv8eaN/A5xOvGLn
COFvv9O6uBaTNvkbXXfdeU06Vk/60PRcEdnX9bPGLjdKyEq1cX2rbsVkx8lj
A5bdKyWzIjeNzLhXTNK7/n1kWP1S0/qvmJHsVUyCnX6Y/yBxGxk5M1jfKshA
0qvmRY+wvEacy0t2zPM1kLHaLzzbaqKIR7f8wHDTevLsU8dl6+DHxCu7A201
2bTf3zVmULR7PAk7s7Phwg0G4nzzs/vv3ySRQQO23Zn50EBOlN2dTKyTycyo
Sat6PzKQYrW/tc/wNDKg61Pr7s0qSaJqvsX8jDRiXKKK2N2+kvRLsnk8wD2T
tHLpv7Dcv5KQVz1yG2VmkluhJ863PljJ/EXZV222hYYYyUvPVn72QTmkUWZT
veMCI3lofa35nH9ySbjzvLs1l42ka9XGcZvO5pGJjXzKJnw0kv7u+3v4xeWS
ETbNeu0JNzJ/07z56i6pw6tI84UHj0bb5ZPGD28ejbKtIh3mXVa5hOaT4dN/
jG7dt4qo3PeqFt4vIAfWWB2x868ijcel5j0aWUBc7n7a2nRKFfMPbRODW53J
ryLZG4MaTQ98Rc78HdaqS3AVCXy8avSMhFckIfReUMn9KnK05EEzZ30hWWYz
1m69bTXJ+T7dfV58IUnu1N5ur5Vcv7VrypYNGQHV5KT32fsHS4rIt/OcS8//
VE3ejpufNMnzNXEvVr+rDJHrtbIMbTftbl1DHLJuFHpYlJBQr6ek5lU16fu1
ZZ/bKaVk5hvDjNO+cv1x2d2TvUMiFHSpFG+3LPKNLnmioAOkeBs0MePgwCgF
nSXF25iw4Qd3XTe1l+LtqKM7Gy64o2D+YUX7tr86XlDQX/wqJhRZXSZ/fxk5
s+aaghYt6jvP/dENMnLt6et/muQu07Vfd1JEkA0jctu3PaOgT99OT0+yvEkC
FeWjb59XMH929tC4K16nFXRDWvlUr80RpMWW7fYvTXhcpP2svbvvEdWX1d4/
mfCABa3H/d06hqxsZX1Vc05BPw3ccebvZtGkea/gFstPK5g/7Dq9LCb6ioKO
Gd7I85eQGLJj8ubAs6b2x2/cOr3u2FPSLrL90e4mecTenecn2MSRVWW73Q+E
KWjr28O++dAxlqxMbhCz+qqC+dN/Kha3zotRULtGj+dYr4sj9bu/31hxW0Hd
agraprg+J64Dtrdu+lBBe+57FL3EL5HUn5G+a3WKgr5YunhgWdZz8np29W+q
Jwrmj6MqCq+eKzWNR/3XHr+BScRpwAH3oAwFTevS1XHV2WRyddu6mL+KFDSy
WbtPvVNfkO7G6Ibt6ihph6RtA9eeSCGxfkcm/f5Owfz5lg8TZh5rpqRXIu4s
fmKbRixG2aXstVLSsOg9X71RppN83RfaCq2SZsxot7akQwbps/wqTeykpG+H
bXhtu/IlcRs/d/DFz5VCPFPSF8eufr5ySSYpvtPKe90QJdXmz90UeiqTlH3b
csAmNyV9nH5G5xuaRdwu+6VlT1fSyHqnivdfzCLp5cmfpUxTCvFQSaMO9czS
PjLtZwqymoQEKGnqny5VLu1zyOeW1xPqnpXrwSpq46WSTtffuN6gKIec7W/V
VRmlpMuOjqgaeCKPXP+w9LecSqUQT037X6vtucss8smCaz2/11ioqKuU/2iO
rZ/tZ9oPdJPyH2c6NN/6iIrqpHx4x9vTxx0r5e9fy2vXixUdPt+cX5Ur96db
mvajj6X8aoFT17Zf35DruVbWrgcr2kmKlzc6jrq55aoV7SXFy/XFe5yTzlgJ
9m5FQ6R4Obbtnzc2mbCtFC/3j5yeMOSslWDPVrQ60BwvQz+NMDw+b3qfFC9X
3jvQp/lNuT7rYK29WlEvKV52Ht3acvkdK+otxcsN+/qvH5tiJdijFd0pxcuW
Hjf39cuwok2keFkxO2d0J4VasDc1vS7FS33iINdlFmr6VIqXq/5p1H1wHzUd
KsXL5Jv+n4L91FQvxcvc6SEvRt5T081SvCwfkRq9VmNNB0nx0tnq38VGR2s6
WYqXW+o1+7j/J2saLsXLav/2Le/9bC3kYza0nRQvh3/atWJ9kTXdI8VL78ia
Q8PUNnS7FC/TynyeB7vY0AwpXi5wqvmsu86GFkvxMujF2esNTPlTqRQvXW8a
2zib8qtpUrz0fBzS5oIp//KR4mXy0kbbhpnys1tSvOw0a1q9pqb9v1aKlyNt
p17YO19Dz0rxskm57qD1Ag3Nl+Kl3ePLazav19A0KV7WObC68/E/NLSPFC+/
/dNmws2DGjpAipdlJa+KGpyU67eqLBvmzCnR0EwpXtZfun7pXdN+4oEUL10s
vC5+KtbQLlK8TPZ38kuq1lAixcuENa7u7crk+/H7rgcfLba3py2leLm+S6cv
XRT29GspXgalPC9vYGNPlVK8LGgR6RvQwp42keLl9+WfpkQ72Qv7GXuaI8XL
2TPOb3jUwZ5ul+Llh3Mux/p0saeHpXiZMcgzquVge5orxcuPm9wC2g2S673y
avdD9vSEFC/tnaONX3na03dSvHRcXj9s5Rz5vmhp7f7WntpL8bJT0tutv/9m
T/tJ8XKfX01K+732Qr6tpUuk+BYbNLnb7+O1NF+Kb6ciPLyGmuQdpPg25OT8
nRpPLX0uxbdv/Zf+mzFGK+TrWvqnFN/sou83LDVhTym+BQSt7HzGhBHfiN36
cQ1N/esNMse3bfvHbwvz0Ar5vpbFtwcXhj7wNLU/IsW3oMmOo5qY5IhvdOn3
nz+dqKVtpfhGZwfkho/TCvsFLYtv9fZVDq6apGXx7ejB+9utTfIeUnzzv1wS
Ez5bS1Ol+Lbk2sp+9Wdohf2Glp6Q4tvmFj98/nCulsW38cMip8Us0rL4tq86
W2G/Ssvim++tZ+fJb1phv6Jl8U1xasPs4eu09KYU3941cmjkt0nL4tuBsHEt
inZp6Rspvh072+Nw8g6tsN8xjV+Kbx+97TpHHtZSRym+GY5uOzjkmJbFt2Nj
+5f8elnL4lvp0uI/iy/J9WNvas83tCy+TX1XttkrQsvim4MyrXBVolwvVl27
XrV0hhTfxjRX7a2n17L45rW8b7/51XJ92IPa9ahj8a33eOd2G+vr6DFfq3rh
w7LIqB/q/jZ+Vi4ZOnt/trdWTwr2HuibEZFLvMY2854dnk06O12jf/jnEd++
43tN7J5D1u1MO/EwJI+MfJnX7VnfPLJh3KWERtfyiVODSYsDf8wjT//1OzH7
Tj67z/O7rR6apCwgabaj/Z8/levDvpkf9VvYnAKyt2F85ZAEuT5sYXSa78yu
pnW++7THlk7/kpBFh59/s9xADEEddX1uniH3L/ofbrXUQLxpcMPe1rdJ4I7x
Li5eBlIZMOFJh+Xh5FJwmWbZOAMZ1zfnx63H7xPj3nvdxv5kIHkuUTfzDj4g
wa0/afePNZC/euzTNfsQS3zifVt3+NVAfNcGPKsc8YzcLml3qP9CA7E/Gfl9
pzMJxNfarW/KcQMZs69Ly8jwBLKlz4rMTyfkerGmQY2X77xuILZXfxr1KUyu
H/PYZMgKafnClN91XGwsl+vHbMP1G241qiTh57u/7bH4JZlQ0cH+jHslO/9c
ZVXn45YFlez+dFXt+aGCXpTOW6KGh36ou1RFF0nnLSdjJ/QbEqSig6TzlsjF
jheWPFGx85YuawZ2CU1T0aYRcbX3P9Pqbt6+o60FPS7pP/HHVS8Tx6npYEn/
occ/fxo8T00nSPpXr+uw7fBBNZ0u6d+n7cdT88+p6WhJ/0f+mv3e/7WaaiX9
X22f8eX4Mrl+LKv2vtOahkn6x325i6R/34grK0d2k/9/aebzV2t6RNL/3L+/
eP9oooaGS/pfcObgyQYmvFjSf26O5/dWY0zxVtL/6w43Bx/wNMVbSf+3j/86
XGvCqZL+S+7fVs4w4X2S/lO6vhj2nZeGTpX0fyH025M2EzT0M0n/+9Zofrj2
s4aOkvSf49684tPPGuG+UUN3XjHrH/VNIyT9j9q2KX2ln0a4j9TQm5L+nVbG
KE7vkOvNWtTeT2qoembDwDatTOuhbGng1HZyPZlb66OVH511NNa+xdCtGwrJ
hCZTj3Yvf8XuxzsF1733dlYh+br/3v5DvLNIp8tWxr9vVLLz8/NZug0ziivJ
E6l/suqzU8P95P8/3ePa821r2l7q/+jryJUnzmmE+1INzT3RxHf7oWLy3cpu
Q5WaIjLmaOfAGauzybSSNsFHuxhJtiTfMWnzyNVR1tRDku/t86DDqUcaVm9l
cyZx2M2p8vfQYzxeP51mijfxBzOjpudmkGPTyxIc9DnEWpqPgszyNg++V9Fn
kvzfz/y6re2ppv8HTNTeyQ==
     "], {{{
        EdgeForm[], 
        RGBColor[0.148, 0.33, 0.54], 
        GraphicsGroupBox[{
          PolygonBox[CompressedData["
1:eJxNVEtvjVEUPd/jMNUW8SptEfpAvF/XvdpeCVM/wQ9gyB/gP/S2tw8DakAn
iqSSVlClEhJFi1ITNxIDgw4qnmtlraQGO3t/+9tn773W3uc0n7tw9nwaQrgI
ySD38FFJQihQYghXoUfw4w+kDPsIfNPQ1yALiB+A7oK8gz0I3Q15D7slD+E6
7GbooURnPwSdo/8r7G+QL5AZ53mRKtcw5AbkB/z7ovx7o3Kwn3n470DfhtSC
8g07Zx36bIesyhR7yvGMHU+W6xHfa+hR6B7776NOL+wTkCnY/dAnIY9gV6FL
kLdBehb6Vya8B9HbG3wX/f95KjydxnHaWDZE1dgIvSaK67XQL1NxR+y7yC++
O6L6Yy/MfTSKx1uuOWQ+D0WdvQn/FtgTONsUxe1381szftpL9r+CXI7yt+aa
C/lbML6qMZKzUZ/d714PQLdGcdQWxRN7Jt5tUXxth94dxcWeqHxPUvG5M8re
EcV30Rj5j7nmYPf9xzdrc0Yz1oVkeYYVzzHkmvVx5NwELu6mim2EvwHfl6Jw
15zvShSujlwc97qHqmdO7BXvAvOT1z73yjkNes+JecD7z3997rnf8yeWFDUm
mRd60fxzPquj+myIulfc79/odQV8U7A/Bc247B1uyzUvzo2YuOvEzFiemUi0
+/R/RHx7LozEOmt+2c+c+2bPlC5jId6xVJjXR9nroOuR73GinMxd7/zkmvX/
Zjrf7Z1k7ITju3L112kOHhjXSuR+5jeknMvuzsXNkuc04jt8LGrvufOHo+4S
79Rn31/Ou8c8PHX+zYgbR43GqLeBZ7jfvKvs82emmTOm6DeAsyj4vp5x/q2I
fwh/C3Se61/mfqfdP2tOui7nz/iS3x6+Q/Oe+aLvXZKLoxL0WKa71+Sc5IUc
1fkNY45/UpLJNw==
           "]], 
          PolygonBox[CompressedData["
1:eJwtktlOlEEUhLtnuh9AEBUclgGVfROCYRFZNJFbH8EHkEt4FlbhglXvZEmA
AFGQLYH3we2rlBeVqTrL/OdUn/LH6Q+fCiGEAZDAl2IIyzGEG4JdOYRhgqfo
c1CANxL7Tm4BvUltD3oCfkvsJXyImhP0GYjwZmI/yS2it6h/gR6LjrXAy+BN
9H82wTvANXyJ2Db1beiLgnvU25v9Lc2oWWfRlfy+i16gHT0e/R+d8FpwDJ8n
tlH0zJr9hFg9uSI977ULaII3ZOdG0SXtA1bhb8EfeivQI/A9ah7C6+m5Rl+p
Bj6ZzOWZvKvMri3RuwYaiK1F96h3LNnbS1CX7JG8+kHPM3q/oj+j79B92o2a
i2iP5bV61KvYBLwFHMO/gbbknbX7If018jr5bSqIl5I9ltfyuJX8OnoOvY+u
Qj8Gr9EH6OpsT+SNPK2DtyZ/axd0wvuzZ9VN6DZ+F+3dChhEH6Gnoj1P1N+j
J6N3HMieSbM9ADPZnsm7HfLtyTHl9Oa16L//315vNELuUfbseiO91dPs3bWD
dnmSvYt21K6vsmfTDL/Q3dm3rxvSLXUkf1ueyttDajbUCxqTb0a3o5hy5eSc
3vgA/Tz7LXXjuvV/udJhFg==
           "]]}]}, {
        EdgeForm[], 
        RGBColor[0.3443667103665569, 0.4247295148253076, 0.6166342661103947], 
        
        GraphicsGroupBox[{
          PolygonBox[CompressedData["
1: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
TaRPHo7CROaexfc0a8vMqH8z1pZ54P8DxMcXcQ==
           "]], 
          PolygonBox[CompressedData["
1:eJwtlElPVUEQhfve7gbBaDQOEQgKqFFwCk6PJyaO0T1Lp4UbZ4gaE3eu9A84
zwM4JAzGmBiHhIVxRGWhRo36A9zK/Hg88DspF3VzTp3q7rpdVV29t6WpOXXO
NWEBK/DJJM614pwAp9G5Bvh9eADX4ntF3HLv3Gn4Gawe/BrfErQRLCG2HT4M
3onlWH8FXz9xGeK/gj+hd8FvYWfRu7EssTXo79BeEjMfPITvOriEuArwIHYN
XgwvD7ZGax9hN/Hdwc6DHxATWb8U/XFiOSpXH+1fzuG7jW8d/Ae8lzMfwseI
j/BOeB48ge8X/CfWSOwoPg/uQM+Bx4Pdlf5B/7KamF74R/RV4ElYe2o5Kbcd
xA+DL+Pr83amztYZ64kdQL+q3PGXgYvxZRPbowTcH+wuPfoccB2+N/Ae9qgF
78KXT2yPAcVIR3sOLwPPiFarJ/CZ4KJod6Uaq9aV2Fv0bnxzwWuwz6nVbIz9
PPv/RR9Uv4BPov9Ga2V9JXwFvAf+QT0Crsb3x9maGt0Ve1wgtoOYUvTZ0XJR
jrPABfTv8G/KCV4RLXflVB7NJ001G/dWE9VGOaiBp8MvsX8jNoreEKw3upAz
4EXo753d2WLwJnzb0NuwzeAt2HbwXWyraqUeSSznKcRPxS4m5htBy3k7S75p
aJOj/Ztqptr1Bav1Pc68QWxVsL11Jy/gnd565Qsxa6PVXLUP2MFoNVatU2w/
PMHaUptRzeqBaLGaMc3axmD/on9IwbuxQmIzM0jcwmizpTtYAH7mrdfV0yfg
T731tmb4OHxDsNrqjpJgM6/Z10zVwaui9Ypmdl60mdRsFmGHVTtvd6+ZOgU/
opnwlpNy0xugt0A1z6Llvd2Fek69dzTaW1KK/xh4j2YysTdh6P+boLdBezaj
t0SLVYxi90W7O82cZu9QtNw0I5qV+mi9qpldqfci2iyph5dFeyP0VujOHfwf
OLuk+Q==
           "]]}]}, {
        EdgeForm[], 
        RGBColor[
        0.5920274550247114, 0.5117668372291319, 0.47104456318036136`], 
        GraphicsGroupBox[{
          PolygonBox[CompressedData["
1:eJxNVtlvl0UU/T5mxg0BjZoofVIQkQfZLOq/QSnSVlBx3yBoTFqh8GACpaUr
akuh269iAgm0ReIW/Cfcd2XfutKWtaDneI6Rh8mcb76ZO3fuPffMPLh2/fJ1
07IsuzfPsoD+ED4+ZQPeg7YU47vRr45ZtgT4rZRlzwAvBn4DeAMWLUCbj+96
zHsEfQP6NVFr12NODb4fAt6OvgPt8Vy2aZc229F/jPYY8F701VgzCVwGGxVo
i4Bfw9hLaOPAq6LW0Idd6DvRinPZ/iZqr6PwaTdaH/D7WPcExr8GfhJ9F+Yt
y7VuBHOacN5TGB8DbgE+A3xf1JmGg/ag77VoP2F8LsZPYvxX4IeBTwPXZcI7
0P+B8XnAZzH+PfAc4OPAJ2xzCLgN8xYCt9o259D+0agYng+yNc9x5T/uy32q
8K8S7VG08ig7r+CMA84bY7kXuB99D21jXg+++zLFoB+tGa0bY025YwHckCs3
+4AHMLeAdgD4EPpetC7gxlyxLofNrbnGudcn3i8lrw3K2/ZcZ+UeTY75tly5
pp+rMG8i114rgS/k8nk58HCuXG3OFRPGoTuT7xzfkf3Pozr37Y4nc8Z938vF
B3KQ8SJHyE/Gb9D+1Hod19R4HfNSnSv+3GdTrvzWed4in4scr3eNbMmVX9pf
AfujufytypXf//hfbx/2+Az1N52B399G+X2PubDFNunLZsfhZ/zbCPxREC82
2beTUfPbMf5b1Hgr8IvIyw3kaG2SLxvNN9ZQnevo9ST8gDlVa35+GHSG7zD+
QxTmGOuK9TXPdVDtWP0Zhdsw51iUz7uC/KA/v2BsXVLciqL+cc5fUX7T/+PW
mx3WB3Ku0TU+C3NmBvEpJnFvGvrb0fYD35oUF57xR9h5NYmH9wO/mWRzdpR/
9PP3KN43WJc6g85+AeMzgO8M2pucrbFGkVNVzinrYJv5fCmqli6jvxJVM1fR
Px3Eb3KCdUobhzPVGmuINTZKn/A9hv5aVH1Oob+KdYeB74bvl4H7gWcmxaXW
vGkzd+kPc7jIOS0JqiVyvTSIl6yrsqDaY72Nom+GzdORBWzdCIrZQvP8iM+4
1XFa6lj9jTUFrL0excsO87rXcWFM+rzug0w5K3bd9Vt7uqxRza4XahU1gH5U
BGnNhLmw2HxgnGqcE2oU96H2NVrDOqxL1BXqEbm2xHVKvuy1xpEjc10LzdZG
+sP9GJ+dmWJEXLBelXmcuWRO6St9pK8841iufPM/48hzhCRN5J63Ab+cZOMz
jE0xfmjNPu+kY/Vc0r9n0XcH6feNqFiW37QX67ol091Y5pwOoV2lvjvmrBfG
fYHvjQbHfK7jPt//GpxDzun0GckZ+jZiDpE/XDfHPnGfa97ruvmQJ9UkY31L
Uk2yNqejL8K62UGxnvBZyJe11qjnk/aackxmUGeALwXFqcXj3LPZ+w77DcI7
9lyQVvIeHgzSUN6r1DXWxgT6d5Lq+gvqTZI/X9kn4mXWCHJukhqWFO/P8e/d
pHh+GVSjs6xFZ4J0kO8Cag3rZzwqrnwnNZqf3JccZR0f9J3NnFeY5+QU+dNi
7q007rVeFFwjjP+/94vfYLRP7ZkeVKO864t8pmNBmsX30SnfGXzLnAi6D/hO
oRazTi6iPxu15ws469tJNjck6Qj1hDVCbZthbSRHSs2THvvXbU7yDLRFXvT4
nbAmiTerfYccsUZcDNIWvh+ZZ/KbNu9IfocE1foB6+YI5rUCD1PDo3LEXD0V
xc1u83WFYzUZpAN8z9KXgt9FF4K0ju+pHsedcaZOD1hf7kp6G1+xFjBXvc4d
8U7PPeScHjamzrMuxz1nIkjH+I4e9zupwnfEmGPFdQNeW7CW0S++fWnnXNT7
mHsPmmNVrm3WDs/Muij1N2PInA1bY1k3I55T6bXkD/NbaUwN4Xej433Qb8FO
z6M9vp2HPId3zZBt8hyj3pf3BnNEraZ/ldYW6sE+2+yyljBvw+ZYk30o8f3V
bT1iHOjLAceZc0s8n28R8qkY/fmoeFNrOb/Pe3HP/db/fwCqj87C
           "]], 
          PolygonBox[CompressedData["
1:eJwtlNlvjVEUxc/9zvnE0BaJIeEJpZ6MVf4LiQRPtDXE3LqmxFD1IKFmJSEx
VEwPHpS2MYW/ghBC0Orc67q9vR1ua/itbA8rXWvv/d1zzt5rd86m6jVVkXNu
NQigOnZuecK5C2AvvItgPQW/wUx4EbEn8GZq73vnekEJtcdBK/l2dDH8KPiI
3kb9Yngd2A6fDJr4vgXkqd2DXkbuPKiCdxNbAK8BX/l+F7Gl8HNgN3wHWAI/
C3bCb1J/Cv4alFG/AjTCr3K/Uvgt8qfR1znvF7oTPR99DHxGF/AbjyN70zC5
FFhIrha0k29Dz4MfBu/R39Fz4UfAW/Qq8AZ+GZTAp8b2thbOf0BtH7EcuSvo
XniF7oguIneQ2g70Jeovkp8GXw8yCet5hpq16FTCatLodei0ztN70M+8/XaW
2FZ+bxJ4RK6J2ET4c2+90B1q0CdBMbFGYg38/RSsF5pZB/pLsN6rR13ob8Fm
q5n0eOuxeq0e30B/CDZr9egHegx9h/PL0JXwYXAbXYouh/cEu2s953cHe7Pe
nuTbOu42Djyk/imxGD4QbNbywAA1eXRDZD1UL7PBvCVPZMnngnlFnsqhM8Fm
vwidgg8G85o8Pkg+wRl3NX+nA53rJ38mYZ7tJ/8u2Ow181Z0WzBvyPN96A18
k49sRprVPW+9byRWSG7IG5fH5LUDoNDbG0aoH4E3R7YT2o0X6AJvNarVjmnX
VDMF7WO7q3oU4H+CzVJv+Av/Ca5FthPaDb1Zb1csDR8fW2/lkQnwpDzjbUZD
wXZeu6/YPnilzojMk/LmIe2wtxmPBvufoP8NY6CC3Az0aGQ92Yh+Re0sMBuc
iM0T8oZitbHFlNMOrQy2Q9oleVRe3RybV3SHLbF5JPl/R6cH85S8pZ7tJ1ce
2120I9qVl952TXfW3TuD7Y7uqLv+A6cjsBY=
           "]]}]}, {
        EdgeForm[], 
        RGBColor[0.839688199682866, 0.5988041596329561, 0.325454860250328], 
        GraphicsGroupBox[{
          PolygonBox[CompressedData["
1:eJxNVtlv1VUQ/i3nPpsYurck5YWW5U39FzSxlKooKCgo+NJLSzfaQrdLb29p
BSGxti9i4hKXuGsEohiXuOC+RKOCIAhS2oICkSU+6ffd7yPpw8nMmTNnzpyZ
b+ac2oe23NmaRFGUiaMoBS2AvoZRAD8N2g3hVvAToJ2YfxGiqA58m+Vc7zE/
AkMDoK0Yi1OtjYCfxb6V4GdAb8L+Q6A3g76C0YQ9r4KOZ6IoB/kC8DnI+rGv
BeMQ5uswfw/0GYzbwD8L+gJGA/gXQR+H7S7s/Rr8HGgT5jsj0TswesGfi8Vz
vTPRvAfy0UiyndaZs7zoB/jpoFgsj3UX2qAebWYxSsBvjnS3Bt4Z/AHsWYMz
DoI2prp7j3U455kP4L47MC+1z43WOQt+RarY/4W1Kdi5FGR7he0vibV3B/gN
sDMMvgw69bF8zkFeDrqFA3wZaGusvMzARh42j0O/JlbcuhgDxgzyk5DPYkyA
nwP9HKMDOo9hvToWBjqh/1UQP+H7NTq/FRhtHNA5D9ku2DkN3XPME/jzoP2g
fZHiVhXLfgf4StB2DvAXfHfGYBp2hsAfDbp3ve9emwqvjOdkohxOYVRAXp4K
x0+ATkJ2C/beGJS3/V5bbpyPgC5zfot5Nj/qeqAOY8y4D4PPgy7FyIP/NiiG
xCBlw9aJWUypbBEzTcYez8l7L/PZ4FzzvGWWF4wVnt8MensinOVdV9RdlOr+
k757rXHFWqxzPRaxaXwujCVnrv+B/q0YWcsWW15izLMWXwa/EjovgZZC1hKr
Hht9D57F/bSzINagr1nnZZFz02Bc8E70hTZpbwx0MBI+u+fFgL7wnvSHmF2d
CMvE1PpEGHkXPq0F/w7oQEa5PoixG7KhSNgjnpgH4mR/kJ23g7Cb9xoxwfjt
S1UrtEn8fhB01vtBWKQN1hQxw7OIkaeD7v5UUGzuSlRnbwTxr3tvlbF9OKh+
fk01r3Ydfek6PJrK70rj/54gvK3H/VYHYetB8M2RYp01ftgv2BPq3IcZv45E
PbfbvbjcfYC6jHOxV7u/F9yfZ6zfnkiPOqzrWfdD7q9wXbdc7ymgzwfh8zn3
9eLbEavWR1xjRZwmijX7St518Cb2rML8rSBfiBX6sy6jHrsK8m+CsHvMuFjq
+mLsaty7iO9S47PN+Oeeu90T789ozxL3DY5698kev1OMG/2vcG+g76xf+rkV
PnZhbHfPJ8889CRao5x1szeRzVM49xG+Mal0qbMN8vFEcuL+GHSGGetU693W
YW8ccH/cRtu2z3oZ997s9XoD/2PQ3j9g5+cg/dPGc4XzviFRX610/miLcr5R
1CM+fk+V++9g42SqN/KHoDPHXFe9iX0C32eefu6yb0P2uXdefyefdR8rMW7Z
B0rdl35LlUfWAX2sMv75ttS4Rvg+VLuOjju3xMURv0mH3YMXGg9djiXj0zbv
3p9CbxPWPvNZGxOd1zsvt58EyT8GvZKollgX1xLFhLUw5Bzxj8K3dIf/PS3O
H+9FWc5y1kLstyBnfe4l9tnjWEuUDVvOuqIe7X0YlL+P3GfKjPPi+dY/grVB
8GdSyQcdf/6tWhxr/qHajAn+mzY7H2ewdw/fWexdizq5Cv4+0EKi/xzxdi/m
l8GvyUhW8L3YJy47Pifcd74PsnHNsdrnN+rvoF5y1XJi9l/n6UKqemS9lvqN
PxvUzx81rnjmqM8ldukH43QiSD6b6r/APsM/wMMZ1e+BVD3nP/edTRnxG32n
K/Y/757S5fd0yv3qz1RY/yXof8E1vn38b/Gtnwn6NxUcq4tB5z+JfZf8J2D/
5j12uz+0uuboP+V7fEeut/utucF9j3hv9xoxfDFVH+P7MOx3jn4T1x2un35j
h9g4lapP/RTU99q9Z69jmzPW6MuAa4d1sN21Syz3Od6MO+/IP3ize9CY/aL/
/wNTS4IO
           "]], 
          PolygonBox[CompressedData["
1:eJwtlMdPVlEQxV+5b2uJDWyJLkxsO/0bNNFEgyaAqCCWhVHAgg2xQLAL9rqw
917Agr1Fo7EXmigiHQViiyv9nQyLk++cO/e7787MmdsvNT0uLfA8bypwYFLk
eQN9z1sJJsPrnPFBoDX0vBvoifwhFn0VXsXaAnQmeI1uBtvgQ4knwnM5oz97
tnP2Xn4PsTaSeFfi++D3QC/4VNYewKvBevhy9u9hfzVYgl4M3hE7DkbDu/Gf
w/D7zv47B72ZvW3oHegd/L8VPoXvDyaWC1Lh5cqHeC6oZ/9wdDGxPDAAfgaM
JdYdfQJeC1b4VpMW9jeitxIfgk6AJ0dWmxyQEtkdddcs8JX9HdCZ3CUDvob4
duXjWU7viZWAbOULaoldRI+H9+C8s85qqtouBF+I30T3JJaMvg2vd/Zt5dhG
/KOz3LL5xi70I/S0wGqsWj8D8+F9QDnxEtAbPhc8JtYZ/GH/b5AUWU1UG/VQ
veyC/htYz9/AK1jv69uZz9FloZ09DzxFP3HG9Y1SYkfQo/jvTPR69F10SmA5
KbdO4Bf6J0jkewmR8TriccQmRHa3BvQ49BWQgI5BX4I3ceY69FpQhf6Gzodv
VD+ceUre0lqNvMN5/wLraYMzj8grWpsWWY/Va4//TUfPAH5oHm8i9t2Zt+W5
FnhRaHu1R3vlUXlVOR/VfVmPAbFgWWQQlweHEd+tdc9y+OKsh+rlKvQn9E70
UnQOugLdEFosD1TqPuiCwDzbzdkMahb1zWy+tR89gvgPEI8+iR4Dn8WeDaF5
Xt7X2in4B2dezlKOqiVI882jF4htRM/2bWZOozehM3x7I4rRBeh033pU5OyO
uutq0BjazGp25YE7xF6CuYF5QF4oczYbylm5X0MnBXamzn6BnhPYjGnW5Al5
Q2d8Cs0z8o72VKJrVN/AZk6z90r+DMzz8v4tZ7OlHJSLaqLa6M05RmxLaLOi
mXqoWZXnfDvjM7G60HqjN0Zvjd44vXWq+QH4Od0xsJqpdppxzbrWzjvzrLyr
N7A5tDdWb61yvu6sB+qFcihFF6IXeXaHiZHNlGZLb+xBZzOh2YhHF8LfOntL
9AbpLbrsLKae5re/URntM93R2cxoduQpeeuzs97Jo/Lqf0PS3BY=
           "]]}]}, {
        EdgeForm[], 
        RGBColor[
        0.9299279463803547, 0.6948198659508869, 0.38277663377909965`], 
        GraphicsGroupBox[{
          PolygonBox[CompressedData["
1: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
P/6ahFE=
           "]], 
          PolygonBox[CompressedData["
1:eJwllNlvjVEUxU+/b98XQ2r4A+ij6cGQkODFrK2LGoJSVCdD1Ish8WDoaKat
IYQYYggatEqUGGIe25qKqhKp2btHv5X9sG7W2mufc8/Ze58vLbc4a2UUQpgG
DHTl5weB7yA9EcIZdDp8Ad5p+OSEe+9TQshAPwfaYBVoj0O4iV5Mbg76Fnwi
+Z3wVvLT0bUgic4h5zz8IShAF2lP1k8l/y+8g/wk3l4wEl2ArsC/i85lbS6x
e/AbYF7k/3kdfggUkdsLvCG/Gj0Cvwd6F3wKaIcPJPYy9jPpbP3QTeir6Nnw
Rex3xfyOumt/Ys3470Bh5GfW2U+ACfD55B83P7POPojYK3KrwJLgax7hzQRp
+P+0hrt2Q/+C/wSZ6IbYvXW6A94BMArdE10DPwKWwnuDVnLr0Fn4C/mPS/Au
4FvkNZ/Efk/Qy+ArQBv504mNCV7jLPgW/E72GkesUvUh9jvyGqlWQ0EjvBaU
sv6k+V01E6dUe/L74q0F2fBqcvLwl+M/xX8dey8KwUH0bjAcLx9djvc29ruo
Z4fxHpj3VjW7b94z9U5r9sC36UzwPGJlrK2P/exf0bP4/zr0WPQX9Az0BfNZ
U40uwucQ64O3BsyFnzWfbc3kOfhl1o8PXpP1+EeJZQfv8TH4R/ziyGdes98E
Vqf4np/wPsR+d9VctVfP1DvN8D74VpCa4nfYDr9mPmua4UZ4s/nZVNOO2O+o
u6oH6kWJ+Wz9Ad11XvPea2Yb4BvMZ3k0sZLYa6xaDyO2w/wN6S3pTVShn5nP
Rj75NXgZCZ/FNnIy8Spj751mcL95jnJVgxfozeZvSTOsWa4w74V6UA6/Y/4t
0Ju9DS8z741msBTeYj47ehOf2Xun+VlVI9VqiPnsqSeD4Y/NvxWaMc3aJvSA
yL9Z+nZtNH+regN6C/om6dukHqWa10y104wnE35H3VV7tJD7H1GTpYg=
           "]]}]}, {
        EdgeForm[], 
        RGBColor[0.9694903656548203, 0.7937259141370507, 0.5054201335299429], 
        
        GraphicsGroupBox[{
          PolygonBox[CompressedData["
1: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
ntDnOFPvzD90/pjHrOWNnw//M3oW/gtOszZc
           "]], 
          PolygonBox[CompressedData["
1:eJwtk8dPVVEYxO9791wF21K3YGJPQFm4MKFY6B1L7CZoNBoVY0dQEVHBFkvs
5R9wY1voxt4jIiK6sv0DtqX9NxkX897Mme+U+5052Y1NDWvTURTVggA28pPN
wHuQAb8XR9EvxqtSUbQc3QbmwzPAS7wD6BL8POoPwtvBIrxB4BX+I/AHvwa9
Gu8B+je6Gr0SfQf9E12BXoq+gp6A7kc3J1GUy9illMdy4GdAAXsVgX5qa6kZ
jL8E1MGrE++9GNTAd1K/AD4Q9FDfDubBxzJ/O94+apoYi1SDPgHKkFPwT8Lz
wE28RjAK3gLG4M1F72LeEXQp9ZMZOwp/wthf9RO/Cb0JjMT7CDLhu4PPpjP3
UVvJ/pkp96wKvgW/Dz6ONTbDn/0/Wx1Yjz4PprHWDPAWryC4dz8ou41+DQrT
7pF6dS64VxX4XXjTE6/9SWvAi/G7mZ+Ffo5fgu5JOQPdsb9Z356l3lHfhZ6I
N4yxevgekIMegq5VP0EueqjODC9kzoe019Ta6oF6obEivB3BdzEAfxt8auKz
9aJLg/fU3spYB/+Hg7Omnh+CrwjOkjJ6H39ZcFaVqbvodcG90508Ra8Jvhtl
8jF6VXA2lcmH6OPBd6kMHIMPAKMjZ0RZ0Zl0Nt3pi9hvRG/lnXqOfzH4biqZ
sz92j9Sr4fAW/PzEteq5en+Z8fGR77wYrzk4+xrbql6DGym/gTZqO0F55Ds+
i3c99tojQCvz3+iO086IslKaOPt6s2Xw8sRvdyGoSJwJZUNzLlB/Ojj72uMU
/FbsbFVSnx+ceWVfZ9LZdOe6+y/MmZn4DeotfkY3JD6TzqY3NInaDcFZU0/V
2zn439POVGdwZpSdb+jZeNdic9Wo9mrsvb6CWej6xHspgx3BY/KUwb3BmVK2
9GZbdf7gb9eb62Wtf0g5kBk=
           "]]}]}, {
        EdgeForm[], 
        RGBColor[1., 0.95, 0.75], 
        GraphicsGroupBox[{
          PolygonBox[CompressedData["
1:eJxNVMtOVEEQvfd2N3NnGB4zzMAMMEMM6gqUHwA1iqwF9APUaDQqxje+Im78
Bn+Bla7c+QAUNepHzGMDCSSQ6NZzrDORRaWqq6urqk+f6kMXl+ZvJVEUvYY4
SAqpQIaosVGFlGGPyB6EnYVOIcXOGdjMMeujKI6jaDpY7LDONiBr8PdLr8ue
QvwE9AqSLHmL/wr7BuxB2F9g16BHE+uHvdHOQJcTiymx18TWrFWSTT97qKjn
Lu0FnS0pPoNa59DPK2xsxNZfAf5pb32+Rw8txDYh57FOIPOxYTQTzE693XEr
Mhw8fIuQYdghtnMjsB8j7igCnkM7+BYgVfhrkAuwR9mn+rkLXUbtEmRVmG0K
t2PYewf7OPQHZ33PeMOmpvvyPszDfC+c4Tyl96F/SDVXVXdFMU8QM6Y8jGG/
RyCTkWmuGbcH2YE0IduQFqQXsgvZh/TJ/gNpQw4LvyCMiRdxvoR6Oex9RH2Y
UT4xTu0IT8b1w1eADAgr1qor965qNXWG8b9lx+Iq8xfU567O78veVuye4nd0
fktxbdXiOyV69+7E8hY1K7HwJK5jwu0OLlOH/V0crutdfjl7+zlveYkp7/TD
WR7O0DNveL/kWWcxxPynsx7OYv8apAj/hjNsisKH+PWoN/r7NQv05RWTqn9i
EoSvV0yvzl7xZq8h/4DwZ54+5Weeb87+hduIPRmMz1lv+QuaBfK0LA6fQUwD
ztPB1uR2Zz44X17nmec+9HKwmLeQ8cTOLmreOHf3vJ31mi/uOc3dgmaV77bp
7I+46Q3rngNcbeudZ4P18MYZHryfF6/+cVDYdv48zkxeuVi7W+tVcZz7fLu6
szmrdXRkfxL/sEGdrylfKu4XVYv12UdW/Kuoxqhq5iK7a1X1Rw6ss9onTrF4
S0m111Ld3g4Hna3r4tyE/OTopDhCrpADJXEhyObfWta9qLnmX8RaQ7J5V96Z
/0BLf0FDHCFX1p1x6you/cDbez+E/iz+XYf9ydnsXfY2A3zfE8Hu7PTWc/pb
T8H/VP8t/92M+usSJ/lOnT83xP+xywnLcXGN3Hrkre9lb3FeHPsLSAqBNg==

           "]], 
          PolygonBox[CompressedData["
1:eJwlksdOA0EQRGe9s0KAABkTBAgjhMWJIO5gMoIjQXyAydFksMl/BCduJJsc
PgL4EF6pD6Xt6u6Z7q2p1kx2ajPmnOsBHpyEziX4VpNcIZEBpcTl4IHavLe4
mp5j+D58OnAuBN/wa1ADakE+cq4Y2l1xsEzvM7yOuBaswceB5+wvfJT+FHwW
nqTvEn6ufmYlqe9QO9X9zu5Yh59pFrwRnoW/h9bbDLbhm6CBuAm8UfsALcST
zCihtgemiGPgi9qut1oAPkPbUbvWgxf4MbyDee3wE287alflLvj2R3aXNBkg
XqKnKmaaSts8iBOXkZvT/t7u6iR3SvxIvRJeARa8aSgtb7ivC97tLZZG0moC
RIFpnqN3CMzAfzg/QrzhbXdpJK3GyP3BU+CI2pY3baSxtB6O7GwbOKC2ChIx
01za57yd1UzN7otMK2mYjuyN9dY680T/VWhvq5maPRiZV7Sjdu3VPxMXwR29
t6AQWE61Q2+7yCPySgReAuvp8+ZBeVGaLXrTTNpJ8wK1+9C0lofl5bS3WXoD
vYU8Iq/IE/LGa2hekmfknX+GFEWy
           "]]}]}}, {{}, 
       TagBox[
        TooltipBox[{
          Directive[
           GrayLevel[0], 
           Opacity[0.5], 
           CapForm["Butt"]], 
          LineBox[CompressedData["
1:eJwV0DlSQkEYhdHfUhyWQRWxugDBAUFNjYxRcX6AMyoqJmxHN+CA87gmTwdf
ne5bL3mdrzWWs4GIWNHNYERnKOJSZ7rQubr2SV6zm4soOE9oPH3nfmdvc8m9
rVNV3W/tFS66n+hYZfd5zWlWC7Y/3x1xTDO2aVWdf+2HHFXJVlTF+cd+wGH1
bCP8trX4xX1esclPZvxgI/0b9/jOHb5xlx1u85WbfOFWegNu8Jnr7LOe3oVr
fGKNj1xN78ESHzjFexaZ0z+zbip7
           "]]}, "0"], 
        Annotation[#, 0, "Tooltip"]& ], 
       TagBox[
        TooltipBox[{
          Directive[
           GrayLevel[0], 
           Opacity[0.5], 
           CapForm["Butt"]], 
          LineBox[CompressedData["
1:eJwVzlkyA0AUQNGn8EMswocFYBEyS0L4zwKSBUQVESJmYh4XgX0IIrbj9Met
+96tru6eb7RqzYmI2ER3MmJ7KuKT87wyHZHFjHkHQ73AOS2PWXMHX3qRC1oR
GfMuvvUSl7Qy5sxd/OhlXtUqqKGKPW0/dazZ35xb5579ABXU7e/6Bvfth6ii
bf/Qt3jRvoSF9I90r76c7uZjPsERznCKnn7BlzjHFQbpTf2Gb3GNe9yhrz/y
iB/4l5/SX/iFx/zMf/ya3uJ/PfUspA==
           "]]}, 
         RowBox[{"-", "1"}]], Annotation[#, -1, "Tooltip"]& ], 
       TagBox[
        TooltipBox[{
          Directive[
           GrayLevel[0], 
           Opacity[0.5], 
           CapForm["Butt"]], 
          LineBox[CompressedData["
1:eJwV0DdSAlAUhtHrqK1pB24JHCMVC9BtMIMJtTcjZsxijggqhs6MS/FYnPnu
/N17nemhxGBDRHTT0RSx1xiRao7ocv+6X7WdAVs/SXfd/qJt9Nl6Sbh/7M/a
QsbWqt+2mn7pk07po37qvX7og05qVd/1Tt+0ohN6q2WuuOGanP1CLznlnDPG
7cd6wiFHlBiz7+sBO//vZJdR+5Zus0GRTUbsa7rOMqusMGxf0gIL5Fkka5/T
eaaZZYYe//AHZf858w==
           "]]}, 
         RowBox[{"-", "2"}]], Annotation[#, -2, "Tooltip"]& ], 
       TagBox[
        TooltipBox[{
          Directive[
           GrayLevel[0], 
           Opacity[0.5], 
           CapForm["Butt"]], 
          LineBox[CompressedData["
1:eJwVzkkyg1EUgNGrsALd2MQKxEJShRjoIjFMVsDEyAK0iW2wDyT6kD6aROzA
eYOvzru3/qr/LubL2dJEROR0NRkxnor401C/Gqlqv8IKj6YjlrwzWtah+cb+
gBvmH31r33xtX2TO/KVP7ZkLymtX6+l/vhtwQTt221rzHtv3Oa8tu02tprvs
e5zVsd1cutOuk+5ml5dsp3vYTDexxQt+pHvYSDfxned844Av7POVZ3xmj4/s
8omnfGCHNbZZ5wnv2eItm7zjjP4BDVE+jA==
           "]]}, 
         RowBox[{"-", "3"}]], Annotation[#, -3, "Tooltip"]& ], 
       TagBox[
        TooltipBox[{
          Directive[
           GrayLevel[0], 
           Opacity[0.5], 
           CapForm["Butt"]], 
          LineBox[CompressedData["
1:eJwVzjdWgkEYhtEhq4hiJ1JRuQRwGzScYwJtFAOYWy1ch2LaA7gsMRBMd4p7
nvleKP7KbrfeSYQQGtylQnhLo+u6lwlhn2XvYWTf0LbtgJL3e2Tf1EPbESve
H5F9S49tHcren5F9W7u2E8445cs2osm5u+9/Fzp2T2hx6R7Yr3Tq/maHa/er
/Uar7hqr3Lrv7WvePf3VP35I+C3wYE9pmiRZMjzaZ3SWHHnmeLIX4vfqvI50
QZ+1GL9XF3WiS/qi/xPALhE=
           "]]}, 
         RowBox[{"-", "4"}]], Annotation[#, -4, "Tooltip"]& ], 
       TagBox[
        TooltipBox[{
          Directive[
           GrayLevel[0], 
           Opacity[0.5], 
           CapForm["Butt"]], 
          LineBox[CompressedData["
1:eJwVz0dSAlEYhdEfgQ2YFQQaDAQxYAarjCtw7MgF6FA3oEsRxbQAZWViOD04
9fW7Vd31Orm6ubjORMQlw2xELheRpcaXc1UTPj1XtMw5Z/QY45gSp5zQJcMR
RW7zEQt6p5G+p3++d6gf2tVf3dcfPdB33dOR7ui37uqbbuk2G3TY5NW+puu0
aLPKi72hTZaps8LAvqhLJNSo8mwva4UipfTuPNnntcAMc8zSt0/pNONMMsGj
veVfH9J7aJ0m984NbfMPeWgd9Q==
           "]]}, 
         RowBox[{"-", "5"}]], Annotation[#, -5, "Tooltip"]& ], {}, {}}}], {
    DisplayFunction -> Identity, AspectRatio -> 1, 
     BaseStyle -> {FontFamily -> "Latin Modern Roman", FontSize -> 12}, 
     DisplayFunction :> Identity, Frame -> True, FrameLabel -> {
       FormBox[
        GraphicsBox[{
          Thickness[0.11299435028248586`], 
          StyleBox[{
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
              3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 
              0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
              3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 
              0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}}}, {CompressedData["
1:eJxTTMoPSmViYGBwAGIQ/WXfx63p0+Qc0tOA4JmyA4zvc4LddnapmoOJMRBs
lnbwvTgx5p+zhgNIWVqbOJwPVv9NGI0v4LDF/MehlC41h5kgECng4LG/VtZC
Xc2hZHnJhn/n+R1mTOCvMutWd9jitcFiTiU3XH+TeC1rJhs7nK/xSeXlrJPM
cH60aoTMORtGh0cR4tsvPlB3ME/StWN1+Gf/91vpgzkX1RxqXjT9mmb5C8pX
dXji9zLhr/x3e9nlLzz05FXgfImpVzgzmBB8mP//g8F3+24bz11ph5Qd/J94
XjKd/BPOv/L72PV5kb/R5H/bzwb586SyQwrYnD/2G1SfNM/LVXGQ2Sg2n0mB
wQHsHkE1qPuZIOG7Vd2hL6Lbn3EDG5wPtt6eE84/0L2vyUSZC+p/BJ+Js0s+
OU8Nzv/19vUBy8OqDmfAgNNho17eYsYaVWj4Q/l/VOD+6QXZ+0EA7l91UDh3
8sHDA2zuYl6o/Gs4v/DB1aL0Zc/gfGMweITBbwHFYxs3Br8ArP+RPY8jn9eM
TC6HG242N8/2PIfzlwhzLpsV+RbObwbpO/bR/gjYfC6HF7WPs8+v+QLnw+If
xr/Oe1sstYzTAaYfFj4wPiy9YefzwPkw//SA44cLzoeELwec3w+WZ4bzIeHN
DHFnDh+cXwBK9/78cD44WIIFoHwOB5HKSSVnn0hC0z+nQ839H7eMtaWh6YHL
IQaUbuZIgrItMPPyOjxwjXecVSgO0dciCOcr7FqwL/WcOJwPy89rhXT40ufJ
O6DndwC5lMi1
              "], CompressedData["
1:eJxTTMoPSmViYGAQB2IQnZ4GBGwSDm/acruNrOUcDnbvazJZLOYwYyYQWEo7
mBgDgbCIg/yuBftS+yQcRConlZxtEYTzt3htsJhTyQ3n/wcBey6HL/s+bk0P
k4XzeyO6/RknIPhg+3bLOmwH6+dyOHsGCHTkHPyfeF4ynczlYACyt1jOQRhk
H4uAwwbVJ83z1qo47Ai2ivifLuCQmf+h9WSJKsSeb4IOv96+PmDprOYwG+Tu
m0IOHvtrZS2Wq0Hky4QdmDi75JPfqTmArDnjI+rgc4LddvZWdQeNTyovZ2WK
w/kRqhEy5+5IwvlzQOb9lHKY0t4adblGDc7fYv7jUAqXKpx/R1N2zf/Nyg5V
93/cMs6WhPizX8EBPXwBXjGqoA==
              "]}]}, 
           Thickness[0.11299435028248586`], StripOnInput -> False]}, {
         ImageSize -> {8.846864259028644, 18.729753424657535`}, 
          BaselinePosition -> Scaled[0.32127889429728423`], 
          ImageSize -> {9., 19.}, 
          PlotRange -> {{0., 8.850000000000001}, {0., 18.73}}, AspectRatio -> 
          Automatic}], TraditionalForm], 
       FormBox[
        GraphicsBox[{
          Thickness[0.09285051067780874], 
          StyleBox[{
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
              3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 
              3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGDQAWIQ/WHReoWzLxQddgRbRfx3l3ZA4R+XduCPDbhvtB3B
v+8a7zhrIYIPVp+B4D8AyScqOqwX0uFLnyftoHztUTCDj6JDzf0ft4y1oXwe
mHpJqH4FB/ldC/al9kk4vGnL7TaqlofzQ95e/jjjoCwGfy3IfDkZOP9A974m
k2Z5uHv35te8namqDHWPkgMLZ5d88jo1nHwmEP+dGsQ9Ggj+HU3ZNf+FEXxj
ELisCOefAQOgfxyaHh2/oebAAAIboPwIqPpgRQfZ5S889ORVHZwnNAulzVKA
mPtZCe5+cLisUYDzZ4IApzKcv0EvbzHjHlWIezdKOfhenBjzz1kDar8InN8i
XsuaycYN56enAcGzH/YJIUHqCzxV4HwwHaYA53/Z93Fr+jVph+u8t8VSy5gg
9hSKO5QsL9nw7zwvnA92V6QQnO+x5uhyhgoxaHxKQOI5WwoePybgAJB2+A8G
UPnXMnD9vRHd/owB8nA+JPwVUfnA9AiJfykH9PQKAAM3MWE=
              
              "], CompressedData["
1:eJxTTMoPSmViYGAQAWIQ/R8E7KUcDIyBoFjW4U1bbrdRtKiD/K4F+1L5JB2+
7Pu4Nf2bAITfJ+HQIl7LmsnGB+fLbBSbz6TABuenpwHBM2aHnohuf0YBGTj/
DAiskYPz3y9ar3C2Q8FhJghEsjmEc4q1G8crQ9Sd4XRIA6tTcbAtcaw9HcPn
sMOh6dHxG2oO1fd/3DL2FnLwOcFuO3urOlS9CJz/wDXecZahFAZ/g+qT5nm6
KnA+f2zAfaPrig4Huvc1mShLObQqsKueKZGH813XHF3OECEHVw/xj5wDengB
AGYdho8=
              "]}]}, 
           Thickness[0.09285051067780874], StripOnInput -> False]}, {
         ImageSize -> {10.767860523038605`, 18.729753424657535`}, 
          BaselinePosition -> Scaled[0.32127889429728423`], 
          ImageSize -> {11., 19.}, PlotRange -> {{0., 10.77}, {0., 18.73}}, 
          AspectRatio -> Automatic}], TraditionalForm]}, 
     FrameTicks -> {{{{0, 
          FormBox["1", TraditionalForm]}, {1, 
          FormBox["\"10\"", TraditionalForm]}, {2, 
          FormBox[
           SuperscriptBox["\"10\"", "2"], TraditionalForm]}, {3, 
          FormBox[
           SuperscriptBox["\"10\"", "3"], TraditionalForm]}, {4, 
          FormBox[
           SuperscriptBox["\"10\"", "4"], TraditionalForm]}, {5, 
          FormBox[
           SuperscriptBox["\"10\"", "5"], TraditionalForm]}, {6, 
          FormBox[
           SuperscriptBox["\"10\"", "6"], TraditionalForm]}}, None}, {
       Automatic, Automatic}}, GridLinesStyle -> Directive[
       GrayLevel[0.5, 0.4]], ImageSize -> 350, 
     Method -> {"DefaultBoundaryStyle" -> Automatic}, PlotLabel -> FormBox[
       GraphicsBox[{
         Thickness[0.0048652330446628395`], 
         StyleBox[{
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3,
             3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3,
             3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
            3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJdIGYCYompVzgzlFQc7mjKrvlfrOQA43fbeO5KO4Tg
nz4DBG+UIOouK8P5IOpMD4K/J7/m7cxWZYfZM4HgJILPHxtw32g6lO+q7PBl
38et6WEyDsrXHgUz8Cg4PHCNd5xVKAGhN0rB+WDzz4jB+SBjZ0ZyOOwItor4
f1wKzv/19vUBy2ZVOB/iLl2Hg937mkwWizmkpgHBMT0HkcpJJWeXSMH55Ye3
uc60VYDzIfZB/eWj41B9/8ct42hlh0cR4tsvKmhAzM9Udpgxgb/K7LQ6nO9z
gt129lZ1hwhOsXbj/Qg+LPzQ+TD9MD7E3RpwvsS8OM3TH/Tg/D/fSh/MKdSH
8zPyP7SenKIPcd9tZTh/5beXFWc2IPhgc1cqQ/zXpu+wVkiHL71O2UFm+QsP
PXt9h/ugcFWE+pdHFxLODxUcNujlLWaco+fwpi232+i3LNy8OSDzfkrC+eB4
nMYP53ts9T+ezPbH/viuHb1sBtpwPix+YPwDoHhplncoWV6y4d95foc2BXbV
M1fE4ObD+OD00aMI58P8r/5J5eWsk3IO6OkXAMdMRyI=
            "]], 
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1,
             0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3,
             3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3,
             3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGI9IGYC4hOHndZmztN38NhfK2uxXM0Bxp/S3hp1uUYd
wr+n5+B7cWLMP2cNhzfFW0V/r9aF81k4u+ST/bTh/P8gUK/lkJn/ofXkFlUH
nxPstrNDtRw2qD5pnqerClWPyYfpF+3xesUyRQ2i76s6nA92n7q6Q3LsHTfm
Cg04/++30gdzNmpA1avB+Tscmh4dn6EK568V0uFLl5OB82NUI2TOzZF0+PX2
9QHLZAQfZh86H+yv/+IOF66GvdGPVneIBsnLSED0P9aA87eD7N2hicqv0ILz
/W9J1yQW6cD5uoryX3LEdOHmw/gw++csUt75p10HzoeFL4z/B+SfQi2HGTOB
wFIKjS8D51ff/3HLuFoJzkcJ/z5tSPhtVXcwMQaCzbpw/gtQfL9G8Gs+bQjI
/oXgQ9yrBzFnHVB9lva36Xd1HQJA/pwE1Z+tC4mvdDQ+ML3B+OD4uqHq8CRx
4TUTfj2HLeY/DqV0qTqY2uwNmtaI4B/dtaOXTUAfzkdJv8/R+EDzAU06Q6c=

            "]], 
           
           FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3,
              3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1,
              3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 
             3}, {1, 3, 3}, {0, 1, 0}}}, {CompressedData["
1:eJxTTMoPSmViYGAwBmIQrfaked7ZU2YOBsZA8FnGAcZ/v2i9wlkOBYcYBceP
yTWYfJh6GH9HsFXE/+OSDjeEPjmeVzNz+Lzv49b0MEmHW9I1iUZfTeH8CPHt
FxnyMPlg/e4ycP5aIR2+dDlZOP8MCOQow/kbVIEOfasC528x/3EohUvNocfr
FYvJRRMHBhBQUHc4UCtrkR5i4uB7cWLMP2YNCH+LscOcRco7/6RrOHzeEJA9
SxzBX3x/H9+cz4aofGFDB4/9QI3P1eD8lNg7bswSqnB+QkiQ+gJPFYdGlqP9
huGGDulpQPBM2UH9Le8+g5UI/unDTmsz/yH4IG+ctTJykF3+wkMvXgXOh/hH
Fc5n4eyST9ZTg/B3GcL53ifYbWe3Ivhg+68bOuxwaHp0PELdQXzqFc6MJiOH
mSBwU91Bel6c5mkBYzgfFh4wPshZaW0mEPtPqcH5MP/B+KdB8aGjDHeP+5qj
yxkklB2iQelhjYHDA9d4x1kHFeD8N2253UbWsnD+F1D8X5OAhzdYfaE4JJ7P
GMH54HDeYYzKjzBxqLj/45bxakkHkDdnzDaBmBcm48DlplrKtMrEYQbIPzsl
HXj9109JlTB18AC5b4e4w99vpQ/mbETwwen3D4IPS///QaBewgE9fwAA4n9c
oQ==
             "], {{20.525, 7.960939999999998}, {20.525, 6.59844}, {
             19.5094, 6.13906}, {18.912499999999998`, 6.13906}, {
             18.229699999999998`, 6.13906}, {17.660899999999994`, 6.63906}, {
             17.660899999999994`, 7.30781}, {17.660899999999994`, 
             9.143750000000002}, {20.025, 9.309379999999999}, {20.525, 
             9.337499999999997}, {20.525, 7.960939999999998}}}], 
           
           FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3,
             3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1,
             0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3,
             3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3,
             3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1,
             0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3,
             3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBOJgIGYCYvumR8dnMDs6/AcDcQcYP0Y1QubcHEmHN7z7
DGaucoDz9Scs+GFYh+Dvr5W1SK9xcNgRbBXx310azu+28dyVdkgJIe8ANDhC
Fc5nAAEFNYdszp8L0oMdHHwvToz5x6zucFzTatJpeQeHmSAgqeHA479+SuoM
e4i8s4bDk8SF10zkEfwvGwKyZ323hfOXvvDQ+59oC7FvhpqDxlugBzRtHX69
fX3AslnVoYHlaL/hdxsHD5BDlqtD+OY2cP3XhT45ng+zhvOfZ2l/m/7XEmHf
zltdf0stHTLzP7Se/KIKcWekpUMaGKg6fAXJh2LyYfpXgNxXaO7gc4LddvZX
dTgf7B51dQc/kLpkCzi/YE337YwGC6h6NTgf4j9VOH+tkA5fupwMnA+LH7D/
IxF8mH3ofFj8nzzstDbznLlDNEheRsKheKvo79N9FnC++NQrnBmfEHyY/2F8
DjfVUiYpKzg/HRQMZVZw82F8mP0H25aHn5pkCecnx95xY87A5MP8B+NX3v9x
y9haGc6HhJcaJL5irSDhtVXdYYv5j0MpVtZwfj0ovsVtEPzfVgXnPGwg6rzU
4PwUkLkzVOB8mP0wPsx9f76VPpijiODD7EPnw/wPTl/TrOHhA3ZPuA2cr/Kk
ed7ZXQg+OD0r2sL5EqDwf4Tgl4Dix84Obj6MD7N/6gT+KrNoWzg/H5Q+DDD5
MP/B+LDwhfFh4QtO/6p28PA7Aoo/Jns4vze4RGX6fQTfHZgcZnE4wMMXxoeF
L4wPsx/Gh7mPB5SeXtnD+TD70Pkw/4PLh3h7ePiAyxN+B9T06ojg35auSTQq
RfCFgdGTdhXBRy8fAU15J/M=
            "]], 
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1,
             0}, {1, 3, 3}}}, {{{39.07659999999999, 15.2344}, {
            39.07659999999999, 15.4844}, {38.8391, 15.693800000000003`}, {
            38.60309999999999, 15.693800000000003`}, {38.4078, 
            15.693800000000003`}, {38.324999999999996`, 
            15.595300000000002`}, {38.214099999999995`, 
            15.443800000000003`}, {36.559400000000004`, 13.3297}, {
            36.62809999999999, 13.245299999999999`}, {36.69839999999999, 
            13.1766}, {36.781299999999995`, 13.106299999999997`}, {
            38.85309999999999, 14.831299999999997`}, {39.07659999999999, 
            15.012499999999998`}, {39.07659999999999, 15.164099999999998`}, {
            39.07659999999999, 15.2344}}}], 
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1,
              0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}}, {{0, 2, 0}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGCQA2IQfULTatJpdheHtUI6fOnz5Bxg/FYFdtUzX+QcSraK
/j79z9nh7Bkg0JF3aF8efsroC4Kv4Pgx+cxTBF9i6hXOjEfODqlpQPAMqv+e
M9x8Hv/1U1I3ODsYGAPBZ0mHHq9XLCaWzg5V93/cMl4t4ZAO0vfOCc63b3p0
fMZiBP84yH3vHR1mzAQCSyk4/zTI/jeKcP4dTdk1/4uVHFgWT7JivOsM57eB
3M/iAufD/IvOrwbZ9xvB32L+41DKKVWHzxsCsmctd3aYs0h55590DQfza0dz
TS44wfk3pWsSjVgRfHfVUqZZGY4Q/V2qcD5/bMB9I3ElOP/Lvo9b06/JOOhP
WPDDUM7J4YFrvOOsQnGHiogVpmcfI/hfQPZvd4bzYe4Dh2exrAN6fAIAVFrU
Sg==
             "], {{39.19839999999999, 9.490630000000001}, {
             35.887499999999996`, 9.490630000000001}, {35.99999999999999, 
             11.6734}, {37.22339999999999, 11.924999999999999`}, {
             37.612500000000004`, 11.924999999999999`}, {39.099999999999994`, 
             11.924999999999999`}, {39.18440000000001, 9.964060000000002}, {
             39.19839999999999, 9.490630000000001}}}], 
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1,
             0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3,
             3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3,
             3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGI9IGYC4k8bArJnLXdz8NhfK2uxXM0Bxp/S3hp1uUbd
4QuIX+7m4HtxYsw/Zw2HPzG5R/9pIfgOTY+Oz5jsCuczgECCq0Nm/ofWk1tU
HUQ+OZ5PC3V12KD6pHmeripEfTAmH6afZfEkK8ZUFwefE+y2s7+qw/lg96mr
O0SKb7/IcA/BPwCk0t/A1KvB+TvABqvC+WuFdPjS5WTg/BjVCJlzcyQdan9b
FZy7geDD7EPn/wcDcYeSraK/T09zcYgGyctIQPT/QPD1Jiz4YajnisqPQ/Cn
fGOLn3EHwfcCuZvVDW4+jA+zf8ULD73/D13hfFj4wvhg/8S4OsyYCQSWUmh8
GTi/+v6PW8bVSnA+SvgvdoWE31Z1hzMgoOMG54Pj2wrBn2ejc2WWHYIPdq+r
mwMLZ5d88jp1h523uv6mmrs5BNySrkmcBNUvBU1f6Wh8YHqD8cHxdUPVoSJi
helZZzeHLeY/DqV0qTrw+K+fkpqA4G/Uy1vM2ILgo6Tf52h8oPkAbCA1Kg==

            "]], 
           
           FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}}}, {{{
            45.95309999999999, 8.628129999999999}, {49.56872999999999, 
            8.628129999999999}, {49.56872999999999, 9.379693000000001}, {
            45.95309999999999, 9.379693000000001}}}], 
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1,
              0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 
             1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {0,
              1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {
             0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}, {1, 3, 3}}, {{1, 4, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGBwAmIQrfqked5ZJT+HL/s+bk2/JuMA4589AwQ6snA+iHtm
jazD08SF10z4EXyRT47n0/76YvDB5oXJOtg3PTo+47evw45gq4j/x2Uc3vDu
M5j5ydfhgWu846xCSYc13bczGPZD+R/FHcLFt19kaEPw25eHnzIyQfAlpl7h
zFDydZDftWBfap8URF7E1yHk7eWPMxplIfJMvg78sQH3ja4rOESAzPvm41B5
/8ctY2slh5Ktor9Pv/NxCOcUazeWV3ZIOHxZO3Wnj0M1SP63soO848fkM0t9
HBJCgtQXeKo4fNgQkD2r3Mdhi/mPQylcqg4+J9htZ4v6OGTmf2g9WaIKUX/U
x2GHA9CjEmoQ//j7OswEgZvqcP7zLO1v0/9qwvnHd+3oZdugA9Hf6uMgu/yF
h95/PQcBUPi1esP5PV6vWEwKPTH4MvPiNE8b6EHCfQqCz7J4khWjqBecf38f
3xxjKS+HeJB/XurC+eBweqQD588AuddSBs6vAYWHthTcvBjVCJlzcyTh9sH4
MPeg8/+DgTjEvFmeDtEgeRkJhw16eYsZdbzg/OOaVpNOxyP4OZw/F6RPRvDB
4aXuDeeDjfX3hpsP48Ps318ra5Gug+CD08cahPvB5i1H+A/Gh/kfxge700YV
kp5LveF8dVB+2IXgT/nGFj/jD5APyihvVSDho+PjkAYCaiqQ8Mj0cXBfc3Q5
g4QynN9t47krrUkJzgen1+kKcD4sv8D4kPwkDUmP230c7oPzg4SDOCgeL/nA
wwccX7K+Dm0K7Kpnrog51P62KjjXgOCD8yO3H5wPy98VoPBYLe2AXh4AAGDj
zzg=
             "], {{57.32339999999999, 12.995299999999999`}, {
             57.32339999999999, 11.785899999999998`}, {56.668800000000005`, 
             10.895299999999999`}, {54.86090000000001, 10.895299999999999`}, {
             53.3047, 10.895299999999999`}, {53.3047, 14.5391}, {53.3047, 
             14.8594}, {53.3047, 15.024999999999999`}, {53.5953, 
             15.081299999999997`}, {53.7219, 15.095300000000002`}, {
             54.139099999999985`, 15.095300000000002`}, {54.41720000000001, 
             15.095300000000002`}, {55.543800000000005`, 
             15.095300000000002`}, {57.32339999999999, 15.095300000000002`}, {
             57.32339999999999, 12.995299999999999`}}}], 
           
           FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3,
              3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1,
              3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 
             3}, {1, 3, 3}, {0, 1, 0}}}, {CompressedData["
1:eJxTTMoPSmViYGAwBmIQffVorknD/gAHA2Mg+CzjAOO/X7Re4SyHgsNjEdmT
T1dj8mHqYfwdwVYR/49LOjQHes5tmBbg8Hnfx63pYZIOhy9rp0p2IfiLJ1kx
+mZg8sH63WXg/LVCOnzpcrJw/hkQyFGG8zeoPmme91YFzt9i/uNQCpeaQ348
+zlJxwAHBhBQUHew0bky65ligIPvxYkx/5g1HMojVpie/ezvMGeR8s4/6RoO
Ap8cz6ctRfBzOH8uSBdG4y/2c/DYXytr8VwNzk+JvePGLKEK5yeEBKkv8FRx
uCFdk2h01M8hPQ0Inik76E5Y8MPwHYJf+9uq4JyEP5y/pvt2BoO5v4Ps8hce
evEqcD7EP6pwPgtnl3yynhqE/90Pzgc5K/0Ogg+2n9XfYYdD06PjEeoOoGA6
G+XvMBMEbqo7LAVa838hgg8LDxgf7C49aHieUoPzYf6D8U+D4kNHGe4e9zVH
lzNIKDsc17SadDrfz+GBa7zjrIMKcP6bttxuI2tZOP8LKP6vScDDG6y+UNzh
PwjUI/g+J9htZ39F8MH+UQpwqLj/45bxakmH2Nyj/zYZB0DMC5Nx8JcTy/I1
D3CYAfLPTkmHfmDwPwsKcPAAuW+HuEO31ysWk0oEH5x+uxF8WPqHuEPCAT1/
AAD4mWGo
             "], {{64.72500000000001, 7.960939999999998}, {
             64.72500000000001, 6.59844}, {63.709399999999995`, 6.13906}, {
             63.11249999999999, 6.13906}, {62.4297, 6.13906}, {
             61.860899999999994`, 6.63906}, {61.860899999999994`, 7.30781}, {
             61.860899999999994`, 9.143750000000002}, {64.22500000000001, 
             9.309379999999999}, {64.72500000000001, 9.337499999999997}, {
             64.72500000000001, 7.960939999999998}}}], 
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 
             4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
              3, 3}, {1, 3, 3}}}, {{{73.5828, 8.97656}, {73.5828, 
             10.770299999999999`}, {72.2203, 12.2031}, {70.6078, 12.2031}, {
             68.93909999999998, 12.2031}, {67.61720000000001, 10.7281}, {
             67.61720000000001, 8.97656}, {67.61720000000001, 
             7.195309999999999}, {69.00780000000002, 5.860939999999999}, {
             70.59379999999999, 5.860939999999999}, {72.23439999999998, 
             5.860939999999999}, {73.5828, 7.22344}, {73.5828, 
             8.97656}}, CompressedData["
1:eJxTTMoPSmViYGCQBGIQvbWl5sJmxSCHO5qya/4bKznA+M4TmoXSrBTh/JC3
lz/OYJR3eMO7z2AmV5CDSOWkkrMpMg4zQeBjoMMMEL1T0mH9w5dTN50IdKi6
/+OW8WoJhwkLfhg+W4bgW+tcmfWsFcG3AfFjAx3kdy3Yl9on6SD9+pGZlEug
w45gq4j/7jIO/0FAO9BB/ZPKy1kn5RzEPQL+SAD57xetVzjLoQjnw9wP43fb
eO5Kc1KG8zPzP7Se/KLiwPFzQfpmt0AHnxPstrNN1Rxico/+2xQf6OCxv1bW
Il3dQfVJ87yzbYEQf91Ud4gQ336RYRmCD/MfjH/4snaq5Dugex2aHh2PgPLZ
ghx+vX19wNJZDR5+G/XyFjP+UYHzK0H+t1Z2QA9/AOLXu0U=
             "]}], 
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1,
              0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 
             3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGAQA2IQ/YZ3n8HMrFCHbhvPXWlMSg4w/hbzH4dSulQdJiz4
YfhMLNTB9+LEmH/OGg4yrx+ZSW0JgfMlPAL+SDQj+N/Y4mf4RIY4BNySrkmc
pO6wpvt2BoN1iIPH/lpZi3Q1OH+t6pPmeb76DgFyYlm++4MdZJe/8ND7rwfn
y8yL0zxtoOdQEbHC9OxvBB+snzkEql4XzhefeoUzY5EOnP8fDMQdmgI95zaI
Ifhg/5mFOKwX0uFLnycNcb93iIP8rgX7UvskHX6A3F8Y4vDANd5xVqG4g1d1
s77PKgR/w8OXUzcJhML5sPD6su/j1vRrMg7o4QkABduXfA==
             
             "], CompressedData["
1:eJxTTMoPSmViYGAQB2IQPWHBD8NnaqEO7xetVzjLoeQA4ytfexTMoKPgECm+
/SKDXKhDyNvLH2cwyjm4qpYyzeKA8WUcVJ80zzv7LcRhR7BVxH93KQcTYyC4
HOIgv2vBvtQ+CQeOnwvSNy9D45ch+NeO5po0hIdAzGuUcjhQK2uR7hECN/8M
CNiEOJwF0TqycL5I5aSSsykIvuuao8sZIuTg/DQQeKaCyk9ThfMz8z+0nixR
dXjDu89gpluIg8d+oMXPVR0YQCAGxldzkPAI+CPRHOLgc4LddvZWdQdOkPvX
IfhCnxzPp51E8GHhBzYnAcGHhS8AXCykXA==
             "]}], 
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 
             4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
              3, 3}, {1, 3, 3}}}, {{{92.88279999999999, 8.97656}, {
             92.88279999999999, 10.770299999999999`}, {91.52030000000002, 
             12.2031}, {89.90780000000001, 12.2031}, {88.23910000000001, 
             12.2031}, {86.9172, 10.7281}, {86.9172, 8.97656}, {86.9172, 
             7.195309999999999}, {88.3078, 5.860939999999999}, {89.8938, 
             5.860939999999999}, {91.5344, 5.860939999999999}, {
             92.88279999999999, 7.22344}, {92.88279999999999, 
             8.97656}}, CompressedData["
1:eJxTTMoPSmViYGCQBGIQ/WL7eubnX8Ic7mjKrvlvrOQA4ztPaBZKs1KE80Pe
Xv44g1HeQcHxY/KZu2EOIpWTSs6myDicAYEjYQ4zZgLBTkmHJyKyJ5/ODnOo
uv/jlvFqCYcjl7VTJasQ/IJ49nOSkWh8wzAH+V0L9qX2SToEyIll+YqHOewI
tor47y7jYGIMBP9DHdQ/qbycdVLOwau6Wd/nX6jD+0XrFc5yKML5MPfD+N02
nrvSnJTh/Mz8D60nv6g42OhcmfVMMszB5wS77WxTNYcJC34YPjMKc/DYXytr
ka7uECG+/SJDVJgDyDszb6o79Hi9YjGpRPBh/oPxf7DFz/A5CHSvQ9Oj4xHq
Dt9A/JthDr/evj5g6awGD7+NenmLGf+owPmVIP9bKzughz8AVP+6bA==
             "]}], 
           
           FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1,
             0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1,
             0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3,
             3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJ1IGYC4gdVIuvcNSMd/oOBuAOMH6MaIXNujqTDGRB4
EwHnb22pubD5aQRUPYL/pi2322i3DJzve3FizD9nDYf25eGnjDIiHHxOsNvO
/qoO53vsr5W1UFd32PDw5dRNSxD8iogVpmdXw9Srwfk7HJoeHZ+hCuevFdLh
S5+nAOeHvL38cUajjEMliN8c4SC/a8G+1D4Jh+ASlen/HRB8BhD4EQ7nf9oQ
kD3rc7hDzf0ft4y1peF8sPlycnA+zD9HLmunSpaFw/0D48PcD/b/Tkz+32+l
D+YIIvgpsXfcmGeowPnK1x4FM+QowPkilZNKzqbIovGlHQ4AjU2/AnO/pIOC
48fkMy/DHaJB8SMj4eBV3azvwxfh8MA13nFWobhDTO7Rf5usEXy1J83zznoh
+P5yYlm+6Qj+TBBohYYXn6TDzltdf1PnRzh82fdxa3qYFER+bYSDgTEQFMvg
5MPMQ09fABpKHn4=
            "]], 
           
           FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3,
             3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3,
             3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1,
             0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3,
             3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJzIGYCYveHVSLr+KMd/oOBuAOMH6MaIXNujqSDiTEQ
PI6C8xe4bvv89wyCn7GnZLIEkL8j2Criv7s0nN9t47kr7ZASQt6h6dHxCFU4
nwEEFNQcQvh0N83dHuXge3FizD9mdYfnv1d+vDQ3ymEmCEhqOJS/VDPkKIHK
O2s4sIQBNYQi+A1Tnbtz/kfC+fp3Vdga70Y6ZOZ/aD35RdUhPQ0IrkU6pIGB
KkT+KiYfpl94HTAEYiIdfE6w287+qg7ne+yvlbVQV3eQAmmYieA/WTr7iMIC
mHo1OB/s3xmqcP5aIR2+dDkZOB8Wfs0HTi10nYbgw+xD58Pi5w7QuVOLIx2i
QfIyEg77gdq3LUbwvwc/Xjp7D4IP8z+M78HDpN3OFgXnC4AcIBsFNx/Gh9n/
Ahj8a54g3OPSnfP8901MPsx/MH7l/R+3jK2V4XxIeKk51IPiSzwKEl5b1R1s
7vv3TvdD8MHx34rgi4MifFKUwxbzH4dSvNTg/JTYO27MM1TgfJj9MD7MfSs+
XvJN6kDwYfah82H+B6evVET4gN0zFcGXb30duGMdgt8zPU+o+QSCX58FTOA/
EHz0/AUAUrNw1A==
            "]], 
           
           FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1,
              0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {0, 1, 0}, {0, 1, 0}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 
             0}}}, {CompressedData["
1:eJxTTMoPSmViYGCQAmIQfde/d3reqxiH/2Ag7gDjx6hGyJybI+lw/dz34Mdr
EXzZ1teBO5bB1CP4b9pyu412y8D5a1WfNM/z1XeI3eXJw6Qd4yC7/IWH3n89
OF9mXpzmaQM9h4KMiW9r0hF8sP48mHpdOF986hXOjEU6cP6U9taoyzVqDuUv
1Qw5YmIcZkzgrzLzVndgCePT3WQa4+B7cWLMP2cNh4apzt05/6Ph/CsVQA0z
EPw1MlEp1vbRDlvMfxxK6VKF86vv/7hl/FsRzhepnFRy9omMw/5TC123TY52
eOAa7zirUNxBoPnAqYVfEfwHVSLr3C1j4PwVHy/5JiUA3TcTCCylHNYXAT2c
E+OwI9gq4r+7NJwPU48eHwAtJL7m
             "], CompressedData["
1:eJxTTMoPSmViYGAQB2IQvb4oY+LbnBiHkLeXP85olHNA5cvC+V/2fdyaHibr
sOLjJd+khBiHtUI6fOlyMg7+vdPzhLxjHGru/7hlrC3lYHMfKKIW4yC/a8G+
1D4JB3VDjjUyv6Lh/BqRde4PHyH4HY4JTy80RTtEq0bInJORhPPvaMqu+f9Z
Ec4XqZxUcvaLsoP+XRW2xt5oh7/fSh/MEVR14GHSbhdbGO2wUS9vMeMfVYj5
m6Iddjg0PTp+Q83BA6TgWrSDzwl229lb1R1id3nyMDHHwPmqIPdZIfgPqoAG
REL5pWoO4ixhfLpJMQ6/3r4+YMmsBg+PLeY/DqV0qcL5YPtr0Ph/VBzQwxcA
jSuhtw==
             "]}], 
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 
             4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
              3, 3}, {1, 3, 3}}}, {{{127.08299999999997`, 8.97656}, {
             127.08299999999997`, 10.770299999999999`}, {125.71999999999998`, 
             12.2031}, {124.108, 12.2031}, {122.43899999999996`, 12.2031}, {
             121.11699999999996`, 10.7281}, {121.11699999999996`, 8.97656}, {
             121.11699999999996`, 7.195309999999999}, {122.50799999999998`, 
             5.860939999999999}, {124.094, 5.860939999999999}, {
             125.73399999999998`, 5.860939999999999}, {127.08299999999997`, 
             7.22344}, {127.08299999999997`, 8.97656}}, CompressedData["
1:eJxTTMoPSmViYGCQBGIQXWNvGrerMd7hjqbsmv/GSg4wvvOEZqE0K0U4P+Tt
5Y8zGOUdtpwo2zc/K95BpHJSydkUGYcZM4EgMB5C75R0SBCIsNyiEe9Qdf/H
LePVEg5f/l6peMmG4N849z348dM4OP86iL83zkF+14J9qX2SDhl7SiZLLIlz
2BFsFfHfXcah/KWaIUdPnIP6J5WXs07KOfj3Ts8T6o5zeL9ovcJZDkU4H+Z+
GL/bxnNXmpMynJ+Z/6H15BcVB9nW14E7lsU5+Jxgt51tqubg/rBKZN3+OAeP
/bWyFunqDvxA5594FucA8s7Mm+oOIOewAN0P48P8B+OvBRngF++ww6Hp0fEI
KD8t3uHX29cHLJ3V4OG3US9vMeMfFTi/EuR/a2UH9PAHAMwztIM=
             "]}], 
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1,
             0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3,
             3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1,
             0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3,
             3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJ9IGYC4isVL9UMOxIcZJa/8NDbr+sA46emAcExPQi/
IsEhI/9D68kp+g4djglPLyQh+Oe/Bz9e6ozg90zPE2pWSHAQ7fF6xSKiB+cf
P+y0NtNOG86f0t4adfmPusMdFbbGqb/jMfgsnF3yyXrqcPXo/LVCOnzpcjJw
foxqhMy5OZIOoXy6m+ZKI/g+5p2OCX/jMfj/wUDcAeQdJe4Eh2iQvIwERL8y
gq8R03/oqwGCv9B12+e/Ngg+yPuzYxB8cPikJcDNh/Fh9t84B9QRi+Dbcl1f
XGCL4LM3TnXuBpo/YyYQWEqh8WXgfFh4MGq3i93Mw+TDwhMcP9aYfFh8wPiw
+I8GelcjABr/bPoOJZMlWMKSEPzToABIRfDB/s9JcEiJvePG/EMPIl8IjB/V
J83zzupBzCtApCeQcXww/W0IPlj/Dl04H5J+oO4Bmi8+9QpnxiIdh3SQvjIE
n5sJ6OFGBB+WfmH60dM3ANC4Mw4=
            "]], 
           
           FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1,
             0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3,
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGIxIGYC4uXHvM07DyY6/AcDcQcYP0Y1QubcHEkHbibt
drGlCL7llhNl++Zj8tcK6fCly8kg+KpPmuf56jvcOPc9+HFiooPs8hceev/1
4HyZeXGapw30HKL7D33VaEDw959a6LqtGaZeF84Xn3qFM2ORDpwPsw/Gh7mn
wzHh6YU6BB9mHzof5t+SyRIsYXmJDtEgeRkJiHtaEHz9uypsjRMRfEZgcNyc
h+CDw2crgo8engB3MZu8
            "]], 
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 
             4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
              3, 3}, {1, 3, 3}}}, {{{148.68299999999996`, 8.97656}, {
             148.68299999999996`, 10.770299999999999`}, {147.32000000000002`, 
             12.2031}, {145.70799999999997`, 12.2031}, {144.03899999999996`, 
             12.2031}, {142.71699999999996`, 10.7281}, {142.71699999999996`, 
             8.97656}, {142.71699999999996`, 7.195309999999999}, {
             144.10799999999998`, 5.860939999999999}, {145.694, 
             5.860939999999999}, {147.33399999999997`, 5.860939999999999}, {
             148.68299999999996`, 7.22344}, {148.68299999999996`, 
             8.97656}}, CompressedData["
1:eJxTTMoPSmViYGCQBGIQ/fGSb5JASZLDHU3ZNf+NlRxgfOcJzUJpVopwfsjb
yx9nMMo79EzPE2rOSHIQqZxUcjZFxuE/CEQnOcyYCQQ7JR2Sre/797onOVTd
/3HLeLWEg86mue+XmyH486X076qoofGFkhzkdy3Yl9on6ZA+8W2NPWuSw45g
q4j/7jIO75cf8zb/meig/knl5ayTcg63f9Zl7fmR6PB+0XqFsxyKcD7M/TB+
t43nrjQnZTg/M/9D68kvKg6Hv2rE9LMlOficYLedbarmcH1xgS2XcJKDx/5a
WYt0dQeQ86cD3Qfyzsyb6g4g55iaIfgw/8H43CADooDudWh6dDwCyk9Lcvj1
9vUBS2c1ePht1MtbzPhHBc6vBPnfWtkBPfwBRkm7hg==
             "]}], 
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3,
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
              3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
             1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGBwA2IQnS/UfOBUZbLDjAn8VWbe6g4o/NPqDinW9/17i5Md
Am5J1yRO0nBgAIEUBH//fCn9uz4IfnHGxLc11skOLJxd8snr1B1AXHvTZAff
ixNj/jmrO0x17s55rp7s4LG/VtbiubqDAccamSgJmLyGAzuQm8KO4Pcf+qoR
cz8Jzl9+zNu882ASxB0JanD+Br28xYw2KnD+3vyatzOXKjlwM2m3i11Mclgr
pMOXPk8RIn8Vyo9TdDgO5DpeSHIwBoHPCg5XKl6qGZ5IchCunFRyVgXBB6uX
k4PzRUDyT6QcgKbfPHc9yeE/CNRLQtx7O8lh1kwgsJR0+PwXqOMYTF7CIT0N
CDZB3d8gBue/acvtNpotDOerf1J5OauTH+K+O0kOvRHd/owGnA7xuzx5mIST
4Xx+3U1z37sj+GBzS5Idvuz7uDVdjB/O91hzdDnDDmE4H2yftKiDRadjwtOC
ZIeD3fuaTJIlHMDRFZbsEKMaIXNORgoSn/bJDv0g8ydIO6SDuJoIfs7z3ys/
MiH44PB4ngTnJwtEWG55gsa/A4sPGYj/biQ5nD0DBDqyEP4VaHhYy8H5qaBw
SZOH85WvPQpm0FGAhO81aHwtUYCH//tF6xXOcig62JvG7fL8gFCvbghMcED3
wvjZIPezIfixoPDVR/Bh6Rscf/xKcH5m/ofWkyYqqPwvKg7RoAzjmezw6+3r
A5bMag43FhfYclnD0ruag/Ltn3VZPtD0zawBUZ+I4IPzWzKCHwkSSEWTT0fT
n5ns4HOC3Xb2V3WIe4D5E5T8Zt5Ud9ABJo/lSbD8ieDD8iOMD04XD9QcTpTt
my8FNH+L+Y9DKV1qkPSQh+CDy4dCNH4lLL+rOaCXJwDUWM6m
             
             "], CompressedData["
1:eJxTTMoPSmViYGAQBmIQPV9K/66KXrLDBr28xYw2Kg4wfuX9H7eMdyvD+fyx
AfeNpis5HP6qEdOvBuVfV3RQN+RYIyOX7PB+0XqFsxyKDrd/1mXtEUh2eOAa
7zjroIID+xqZqBR2BP+4t3mn44MkDP6Kby8rzkxQhvMz8z+0njRRQeVvQfB3
ODQ9On5D1UG7XezmuedQ/gw1B3vTuF2eH5IcPPbXylqkqzt05zz/vfJvkgML
Z5d88jp1h2wg9yNbMpwP8x86X3b5Cw+9+4jwgIUPALhngCI=
             "], {{154.944, 
             4.91563}, {154.944, 4.0953100000000004`}, {153.888, 
             3.4406300000000005`}, {152.60799999999998`, 
             3.4406300000000005`}, {151.27200000000002`, 
             3.4406300000000005`}, {150.25599999999997`, 4.12188}, {
             150.25599999999997`, 4.91563}, {150.25599999999997`, 5.02656}, {
             150.28399999999996`, 5.56875}, {150.81299999999996`, 
             5.929690000000001}, {151.119, 6.124999999999999}, {151.244, 
             6.124999999999999}, {152.21699999999996`, 6.124999999999999}, {
             153.37199999999999`, 6.124999999999999}, {154.944, 
             6.124999999999999}, {154.944, 4.91563}}}], 
           
           FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3,
             3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1,
             0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJZIGYC4hXHvM07OVMc0sCAzQHG93/iecn0ModDivV9
/97/yXD+hENfNWIeI/jpIG2Pkh36I7r9GTdwwvlf9n3cmj6NB85fK6TDly6n
BOeD6WkI/spvLyvOLFByMDEGgtsIvk672M1zx5Md/oNAvKLDcaDzHNcg+NzX
FxfYLsLkC1dOKjl7RMGhZ3qeUPMKBD9+lycP024EX4Wtcarz6WQH/tiA+0bu
inA+zP0w/vJbyx8bHuZ0+LPy4yXfUwj/L5DSv6uyDsGP6QcG0BJMPix8T5Tt
my+1PtnhYPe+JpPFbHDzYHxGbaCHryH4sPCG8W2A0TH9H4KPHn8A+DjXAw==

            "]], 
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3,
             3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 
            3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
            3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJJKO2Y8PSC0uYUB481R5cz7BB3gPGnzwSCm1IOIGrm
xhSHN2253Ua/ZR10Ns19v3xZisN/EMhXcDjmbd7pOCPFYcW3lxVnApQcbO77
906vS3FYCeIvUHKw5bq+uKAQwQfrj0Pit4vdPOee4rBWSIcvXU7JIW6XJw+T
dYrDGRDwUXDQiOk/9NUgxSE1DQieyTpwrJGJStFHuA/Gh7kfxtf4pPJy1kkR
hwKQA4D6D3bvazJxFnQwuKvC1mib4vBl38et6dN4HHKe/1750SvFIUY1Quac
DZtDnlDzgVOJKQ4vax9nn1/D4vD3SsVLtUIE3wTkwCYEH6x+ZopDwBPPS6bB
bA6hfLqb5i6Hhs9+Xnj4GYPAZEF4+Ia8vfxxxkIRB/Tw/7AcGKJA8/oiuv0Z
DSTg/CCQekdRON8dpH6GkMNXUABNhfpHTMBhigRLGN9EmP0cDiYge+tTHNLA
gA3uHxgfHL4pCH6E5ZYTZUEpEHdHcjjsmy+lf9cnxcG+xLH29B1+hyMKG4oy
PFMcdgZbRfx3F4Lzwf55KArnw9wP4z9wjXectVEKzgfHp5usw1Tn7pzn3ikO
B0DxkyzvAAqO24EpDnvya97OZFVyiEqxvu+fmeLQbeO5K81ICe5+GP9nXdae
kmoEH8ibLDEhxeHDovUKZ28oQuJrGtT+i/Lw8AOHz3xZOH8HyD/LpTDCHwDd
O256
            "]], 
           
           FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3,
             3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1,
             0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3,
             3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJtIGYCYp12sZvnwtMcZObFaZ420HOA8WWXv/DQ+6/n
wKgNFNBLc5AAyX+A8pUQ/B/Bj5fO5kHwbbmuLy5gROiH8WHmx/Qf+qohkeYQ
HxKkvkATap4cUP/UK5wZSbpwvkiP1yuWKzpwfu1vq4JzKxD881fD3ujP1oGY
J5Pm0MBytN/QXMdBAyRwItUh5O3ljzMYZR0yJr6tsS9MdWgByX/XcbixuMCW
Kx/I5/VfP8VVF86H2Y+LD3N/ZIr1ff9WBF/p9s+6rAmYfJj/v4IcBFQPC5+p
zt05z5MR/NhdnjxM4Qj+IZAGLwTfwTRul6cOgj8TBBQR5sP4MPs/LD/mbW6L
4IP1uyD4cSD7vFMdREHhK6Lr4Jjw9ILS5lSHg937mkweiztc8k0SiNia6hCj
GiFzTkbcARR9tttSHdoU2FXPXBFz6J2eJ9S8B8FfOvuIwoZDCD7YvMOpDgxg
ANV/LNXhgWu846yP4g4Gd1XYGjXTHI4fdlqbaacD4esC+bt29LJ90HHgYQJG
sCkifaCnTwAHLBCy
            "]], 
           
           FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3,
              3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1,
              3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 
             3}, {1, 3, 3}, {0, 1, 0}}}, {CompressedData["
1:eJxTTMoPSmViYGAwBmIQbbnlRNk+/nQHA2Mg+CzjAOO/X7Re4SyHgsOpha7b
PrNi8mHqYfwdwVYR/49LOqiwNU51/p3m8Hnfx63pYZIOUyRYwvi+Ivgx/Ye+
ajzB5IP1u8vA+WuFdPjS5WTh/DMgkKMM529QfdI8760KnL/F/MehFC41B1ag
9d0X0hwYQEBB3UEDpOBAmoPvxYkx/5g1IPw1aQ5zFinv/JOu4XDFN0kgYiaC
v2++lP7dEjR+RJqDx/5aWYvnanB+SuwdN2YJVTg/ISRIfYGnikNUivV9/8Q0
h/Q0IHim7ADi9mYj+BPf1tibliH4X0EOqk1zkF3+wkMvXgXOh/hHFc5n4eyS
T9ZTg/BzEXxgbM2XSkfwwfYXAsPToenR8Qh1h6WzjyhsaEtzmAkCN9Udeqbn
CTXPQPBh4QHjm4Di9TjU/lNqcD7MfzD+aVB86CjD3eO+5uhyBgllBz7dTXPf
e6c5PHCNd5x1UAHOf9OW221kLQvnfwHF/zUJeHiD1ReKQ+JtAoIPdH1Rxlo0
/sE0h4r7P24Zr5Z0SHh6Qen2Sah5YTIO574HP156Os1hBsg/OyUdbLmuLy64
CYw/kPt2iDv8AErPfoPgg9PvVwQflv7/g0C9hAN6/gAAovZsxw==
             "], {{
             182.22500000000002`, 7.960939999999998}, {182.22500000000002`, 
             6.59844}, {181.20899999999997`, 6.13906}, {180.61299999999997`, 
             6.13906}, {179.92999999999998`, 6.13906}, {179.361, 6.63906}, {
             179.361, 7.30781}, {179.361, 9.143750000000002}, {
             181.72500000000002`, 9.309379999999999}, {182.22500000000002`, 
             9.337499999999997}, {182.22500000000002`, 7.960939999999998}}}], 
           
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1,
             0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3,
             3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3,
             3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGI9IGYC4qKMiW9rNqc7eOyvlbVYruYA409pb426XKMO
4S9Pd/C9ODHmn7OGgwHHGpmoKQj+BaXbP+vyEPyZIJCY7pCZ/6H15BZVh5zn
v1d+jEt32KD6pHmeripEPRY+TD+jdrvYTaV0B58T7Lazv6rD+WD3qas78DAB
BRwR/CSBCMstLjD1anD+DoemR8dnqML5a4V0+NLlZOD8GNUImXNzJB10gMaf
s0fwYfah8/+DgbjD3PfLj3nrpztEg+RlJCD63RH8v1cqXqqFovETEfw7P+uy
9jQg+HG7PHmYuhHmw/gw+9UMgQHehODDwhfGB/snId1hBkjcUgqNLwPnV9//
ccu4WgnORwn/Imj4bVV3OAMCUxB8cHzPQPBBycF+JoIPdu/sdAcWzi755HXq
DiDvlUxPdwi4JV2TOAmqfwI0vtLR+MD0BuOD4+uGqsOhrxox/bPSHbaY/ziU
0qXqwBLGp7tpIYJvc9+/d/oqBB8l/T5H4wPNBwCYDzMV
            "]], 
           
           FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1,
             0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}}}, {{{193.47699999999998`, 
            2.52344}, {193.47699999999998`, 3.0374999999999996`}, {192.128, 
            3.0374999999999996`}, {192.128, 15.915599999999998`}, {
            193.47699999999998`, 15.915599999999998`}, {193.47699999999998`, 
            16.429699999999997`}, {191.61299999999997`, 
            16.429699999999997`}, {191.61299999999997`, 2.52344}, {
            193.47699999999998`, 2.52344}}}], 
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3,
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 
             1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0,
              1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
             1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 
             3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGBwAGIQrX9Xha1RMNMhPQ0Inik7wPg+J9htZ5eqOYCE035l
OPhenBjzz1nDYaHrts9/byD4vdPzhJr3oPGXZDhsMf9xKKVLzSGUT3fT3PkZ
Dh77a2Ut1NUcPl7yTRKYk+EwYwJ/lVm3usPS2UcUNnQh9Jt3OiY8rUDwQdrf
ZyP4XzVi+g8lZjg8ihDffvGBukNUivV9/8gMh7/fSh/MuajmkD7xbY19IIyv
6nB9cYEtl3eGg+zyFx568ipwvsTUK5wZTAg+zP9nQMAnw6HbxnNX2iFliP3+
CH5RBtCCYDR5IH/2TCA4qewAdE3v9LAMhw2qT5rn5ao4RILcFwt1j6AaxP2p
GZDw3arukAzSUI7gA0PvwKlGBB8UXBGtMP8j+EycXfLJeWpw/q+3rw9YHlZ1
+A8CzRkOG/XyFjPWqDpMAAaHaROU/0cF7p/eiG5/xg8CcP+qf1J5OauTDx4e
B7r3NZks5oXIWyD4P+uy9pQYI/ixuzx5mPQx+S3itayZbdwOMWh8sH4gn8eR
z2tGJpeDAccamSgTBH++FDAFWqHJO2Q4HAGbD5V3Q/Bh8Q/j6wC9t7wJoR8W
PjA+LL1h5/PA+TD/gOOnHcEHh289mnw2gg8O76wMhxe1j7PP5/DB+QXLSzb8
8+eH841BIFjAAZRcTesyHEQqJ5WcfSIJSf8NGQ4193/cMtaWhqQHoPtjVCNk
zs2RhPAnZjg8cI13nFUo7gBKTl9XIPjA3DvV+TaCD8vPa4V0+NLnyTug53cA
BX2zIg==
             "], CompressedData["
1:eJxTTMoPSmViYGAQB2IQvdB12+e/dzIc3rTldhtZyzncOPc9+PHFDIcZM4HA
UtrhsMKGooy9GQ7yuxbsS+2TcNCI6T/0dQWCv3T2EYUNXQh+nlDzgVOtGQ5f
9n3cmh4mC+f3RnT7M05A8MH27ZaF6G/LcDh7Bgh05BxOlO2bL9We4WBgDATF
chD75mQ4bFB90jxvrYrDx0u+SQILMhwy8z+0nixRdeidDjRxTYbDr7evD1g6
qzmE8ulumrs5w8Fjf62sxXI1hx6Q/I4MBybOLvnkd2oOIGONj2c4+Jxgt529
Vd0ha0/JZIkbCP7+U8AQeY3gA0Nj6ewvGQ5T2lujLteowflbzH8cSuFShfPv
aMqu+b9Z2SEa6FyNFxkO/0GgX8EBPXwBa/KyEA==
             "]}], 
           
           FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1,
             0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}}}, {{{202.956, 2.52344}, {
            202.956, 16.429699999999997`}, {201.09199999999998`, 
            16.429699999999997`}, {201.09199999999998`, 
            15.915599999999998`}, {202.441, 15.915599999999998`}, {202.441, 
            3.0374999999999996`}, {201.09199999999998`, 
            3.0374999999999996`}, {201.09199999999998`, 2.52344}, {202.956, 
            2.52344}}}]}, 
          Thickness[0.0048652330446628395`], StripOnInput -> False]}, {
        ImageSize -> {205.5407920298879, 18.729753424657535`}, 
         BaselinePosition -> Scaled[0.32127889429728423`], 
         ImageSize -> {206., 19.}, PlotRange -> {{0., 205.54}, {0., 18.73}}, 
         AspectRatio -> Automatic}], TraditionalForm], 
     PlotRange -> {{0, 1}, {0, 6}}, PlotRangeClipping -> True, 
     PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.02], 
        Scaled[0.02]}}, Ticks -> {Automatic, Automatic}}],FormBox[
    FormBox[
     TemplateBox[{
       FormBox[
        StyleBox[
         StyleBox[
          PaneBox[
           GraphicsBox[{{}, {}, 
             
             RasterBox[{{{0.148, 0.33, 0.54}}, {{0.3443667103665569, 
              0.4247295148253076, 0.6166342661103947}}, {{0.5920274550247114, 
              0.5117668372291319, 0.47104456318036136`}}, {{0.839688199682866,
               0.5988041596329561, 0.325454860250328}}, {{0.9299279463803547, 
              0.6948198659508869, 0.38277663377909965`}}, {{
              0.9694903656548203, 0.7937259141370507, 0.5054201335299427}}, {{
              1., 0.95, 0.75}}}, {{
                Rational[-15, 2], -150}, {
                Rational[15, 2], 150}}], {Antialiasing -> False, 
              AbsoluteThickness[0.1], 
              Directive[
               Opacity[0.3], 
               GrayLevel[0]], 
              LineBox[
               NCache[{{
                  Rational[15, 2], -150}, {
                  Rational[-15, 2], -150}, {
                  Rational[-15, 2], 150}, {
                  Rational[15, 2], 150}, {
                  Rational[15, 2], -150}}, {{
                 7.5, -150}, {-7.5, -150}, {-7.5, 150}, {7.5, 150}, {
                 7.5, -150}}]]}, {
              CapForm[None], {{
                Directive[
                 GrayLevel[0], 
                 Opacity[0.5], 
                 CapForm["Butt"]], 
                CapForm["Butt"], 
                LineBox[
                 NCache[{{
                    Rational[-15, 2], -107.14285714285717`}, {
                    Rational[
                    15, 2], -107.14285714285717`}}, {{-7.5, \
-107.14285714285717`}, {7.5, -107.14285714285717`}}]]}, {
                Directive[
                 GrayLevel[0], 
                 Opacity[0.5], 
                 CapForm["Butt"]], 
                CapForm["Butt"], 
                LineBox[
                 NCache[{{
                    Rational[-15, 2], -64.2857142857143}, {
                    Rational[
                    15, 2], -64.2857142857143}}, {{-7.5, -64.2857142857143}, {
                  7.5, -64.2857142857143}}]]}, {
                Directive[
                 GrayLevel[0], 
                 Opacity[0.5], 
                 CapForm["Butt"]], 
                CapForm["Butt"], 
                LineBox[
                 NCache[{{
                    Rational[-15, 2], -21.428571428571445`}, {
                    Rational[
                    15, 2], -21.428571428571445`}}, {{-7.5, \
-21.428571428571445`}, {7.5, -21.428571428571445`}}]]}, {
                Directive[
                 GrayLevel[0], 
                 Opacity[0.5], 
                 CapForm["Butt"]], 
                CapForm["Butt"], 
                LineBox[
                 NCache[{{
                    Rational[-15, 2], 21.428571428571416`}, {
                    Rational[15, 2], 21.428571428571416`}}, {{-7.5, 
                  21.428571428571416`}, {7.5, 21.428571428571416`}}]]}, {
                Directive[
                 GrayLevel[0], 
                 Opacity[0.5], 
                 CapForm["Butt"]], 
                CapForm["Butt"], 
                LineBox[
                 NCache[{{
                    Rational[-15, 2], 64.28571428571428}, {
                    Rational[15, 2], 64.28571428571428}}, {{-7.5, 
                  64.28571428571428}, {7.5, 64.28571428571428}}]]}, {
                Directive[
                 GrayLevel[0], 
                 Opacity[0.5], 
                 CapForm["Butt"]], 
                CapForm["Butt"], 
                LineBox[
                 NCache[{{
                    Rational[-15, 2], 107.14285714285712`}, {
                    Rational[15, 2], 107.14285714285712`}}, {{-7.5, 
                  107.14285714285712`}, {7.5, 107.14285714285712`}}]]}}}, {
             Antialiasing -> False, 
              StyleBox[
               
               LineBox[{{7.500000000000001, -150.00000000000003`}, {
                7.500000000000001, 150.00000000000003`}}], 
               Directive[
                AbsoluteThickness[0.2], 
                Opacity[0.3], 
                GrayLevel[0]], StripOnInput -> False], 
              StyleBox[
               StyleBox[{{
                  StyleBox[
                   LineBox[{{{7.500000000000001, -107.14285714285715`}, 
                    
                    Offset[{4., 0}, {
                    7.500000000000001, -107.14285714285715`}]}, {{
                    7.500000000000001, -64.28571428571428}, 
                    
                    Offset[{4., 0}, {
                    7.500000000000001, -64.28571428571428}]}, {{
                    7.500000000000001, -21.428571428571434`}, 
                    
                    Offset[{4., 0}, {
                    7.500000000000001, -21.428571428571434`}]}, {{
                    7.500000000000001, 21.428571428571416`}, 
                    
                    Offset[{4., 0}, {7.500000000000001, 
                    21.428571428571416`}]}, {{7.500000000000001, 
                    64.28571428571428}, 
                    
                    Offset[{4., 0}, {7.500000000000001, 
                    64.28571428571428}]}, {{7.500000000000001, 
                    107.14285714285714`}, 
                    
                    Offset[{4., 0}, {7.500000000000001, 
                    107.14285714285714`}]}}], 
                   Directive[
                    AbsoluteThickness[0.2], 
                    GrayLevel[0.4]], StripOnInput -> False]}, 
                 StyleBox[
                  StyleBox[{{
                    StyleBox[{
                    InsetBox[
                    FormBox[
                    RowBox[{"-", "5"}], TraditionalForm], 
                    
                    Offset[{7., 0.}, {
                    7.500000000000001, -107.14285714285715`}], 
                    ImageScaled[{0, 0.5}], Automatic, {1, 0}], 
                    InsetBox[
                    FormBox[
                    RowBox[{"-", "4"}], TraditionalForm], 
                    Offset[{7., 0.}, {7.500000000000001, -64.28571428571428}], 
                    ImageScaled[{0, 0.5}], Automatic, {1, 0}], 
                    InsetBox[
                    FormBox[
                    RowBox[{"-", "3"}], TraditionalForm], 
                    
                    Offset[{7., 0.}, {
                    7.500000000000001, -21.428571428571434`}], 
                    ImageScaled[{0, 0.5}], Automatic, {1, 0}], 
                    InsetBox[
                    FormBox[
                    RowBox[{"-", "2"}], TraditionalForm], 
                    
                    Offset[{7., 0.}, {7.500000000000001, 
                    21.428571428571416`}], 
                    ImageScaled[{0, 0.5}], Automatic, {1, 0}], 
                    InsetBox[
                    FormBox[
                    RowBox[{"-", "1"}], TraditionalForm], 
                    Offset[{7., 0.}, {7.500000000000001, 64.28571428571428}], 
                    
                    ImageScaled[{0, 0.5}], Automatic, {1, 0}], 
                    InsetBox[
                    FormBox["0", TraditionalForm], 
                    
                    Offset[{7., 0.}, {7.500000000000001, 
                    107.14285714285714`}], 
                    ImageScaled[{0, 0.5}], Automatic, {1, 0}]}, 
                    Directive[
                    AbsoluteThickness[0.2], 
                    GrayLevel[0.4]], {
                    Directive[
                    Opacity[1], FontFamily -> "Latin Modern Roman", FontSize -> 
                    12]}, StripOnInput -> False]}, {}}, {
                    Directive[
                    Opacity[1], FontFamily -> "Latin Modern Roman", FontSize -> 
                    12]}, StripOnInput -> False], "GraphicsLabel", 
                  StripOnInput -> False]}, "GraphicsTicks", StripOnInput -> 
                False], 
               Directive[
                AbsoluteThickness[0.2], 
                Opacity[0.3], 
                GrayLevel[0]], StripOnInput -> False]}}, PlotRangePadding -> 
            Scaled[0.02], PlotRange -> All, Frame -> True, 
            FrameTicks -> {{False, False}, {True, False}}, FrameStyle -> 
            Opacity[0], FrameTicksStyle -> Opacity[0], 
            ImageSize -> {Automatic, 300}, BaseStyle -> {}], Alignment -> 
           Left, AppearanceElements -> None, ImageMargins -> {{0, 0}, {0, 0}},
            ImageSizeAction -> "ResizeToFit"], LineIndent -> 0, StripOnInput -> 
          False], {
         FontFamily -> "Latin Modern Roman", FontSize -> 12, FontFamily -> 
          "Arial"}, Background -> Automatic, StripOnInput -> False], 
        TraditionalForm]}, "BarLegend", DisplayFunction -> (#& ), 
      InterpretationFunction :> (RowBox[{"BarLegend", "[", 
         RowBox[{
           RowBox[{"{", 
             RowBox[{
               RowBox[{
                 RowBox[{"Blend", "[", 
                   RowBox[{"\"M10DefaultDensityGradient\"", ",", "#1"}], 
                   "]"}], "&"}], ",", 
               RowBox[{"{", 
                 RowBox[{
                   RowBox[{"-", "5.4160382307648325`"}], ",", 
                   "0.9030899869919433`"}], "}"}]}], "}"}], ",", 
           RowBox[{"{", 
             RowBox[{
               RowBox[{"{", 
                 RowBox[{
                   RowBox[{"-", "5.`"}], ",", 
                   RowBox[{"Directive", "[", 
                    RowBox[{
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[0], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> GrayLevel[0.], FrameTicks -> None, 
                    PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], "GrayLevel[0]"], Appearance -> None, 
                    BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[0]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[0], Editable -> False, Selectable -> False], 
                    ",", 
                    RowBox[{"Opacity", "[", "0.5`", "]"}], ",", 
                    RowBox[{"CapForm", "[", "\"Butt\"", "]"}]}], "]"}]}], 
                 "}"}], ",", 
               RowBox[{"{", 
                 RowBox[{
                   RowBox[{"-", "4.`"}], ",", 
                   RowBox[{"Directive", "[", 
                    RowBox[{
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[0], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> GrayLevel[0.], FrameTicks -> None, 
                    PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], "GrayLevel[0]"], Appearance -> None, 
                    BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[0]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[0], Editable -> False, Selectable -> False], 
                    ",", 
                    RowBox[{"Opacity", "[", "0.5`", "]"}], ",", 
                    RowBox[{"CapForm", "[", "\"Butt\"", "]"}]}], "]"}]}], 
                 "}"}], ",", 
               RowBox[{"{", 
                 RowBox[{
                   RowBox[{"-", "3.`"}], ",", 
                   RowBox[{"Directive", "[", 
                    RowBox[{
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[0], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> GrayLevel[0.], FrameTicks -> None, 
                    PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], "GrayLevel[0]"], Appearance -> None, 
                    BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[0]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[0], Editable -> False, Selectable -> False], 
                    ",", 
                    RowBox[{"Opacity", "[", "0.5`", "]"}], ",", 
                    RowBox[{"CapForm", "[", "\"Butt\"", "]"}]}], "]"}]}], 
                 "}"}], ",", 
               RowBox[{"{", 
                 RowBox[{
                   RowBox[{"-", "2.`"}], ",", 
                   RowBox[{"Directive", "[", 
                    RowBox[{
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[0], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> GrayLevel[0.], FrameTicks -> None, 
                    PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], "GrayLevel[0]"], Appearance -> None, 
                    BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[0]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[0], Editable -> False, Selectable -> False], 
                    ",", 
                    RowBox[{"Opacity", "[", "0.5`", "]"}], ",", 
                    RowBox[{"CapForm", "[", "\"Butt\"", "]"}]}], "]"}]}], 
                 "}"}], ",", 
               RowBox[{"{", 
                 RowBox[{
                   RowBox[{"-", "1.`"}], ",", 
                   RowBox[{"Directive", "[", 
                    RowBox[{
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[0], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> GrayLevel[0.], FrameTicks -> None, 
                    PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], "GrayLevel[0]"], Appearance -> None, 
                    BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[0]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[0], Editable -> False, Selectable -> False], 
                    ",", 
                    RowBox[{"Opacity", "[", "0.5`", "]"}], ",", 
                    RowBox[{"CapForm", "[", "\"Butt\"", "]"}]}], "]"}]}], 
                 "}"}], ",", 
               RowBox[{"{", 
                 RowBox[{"0.`", ",", 
                   RowBox[{"Directive", "[", 
                    RowBox[{
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[0], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> GrayLevel[0.], FrameTicks -> None, 
                    PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], "GrayLevel[0]"], Appearance -> None, 
                    BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[0]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[0], Editable -> False, Selectable -> False], 
                    ",", 
                    RowBox[{"Opacity", "[", "0.5`", "]"}], ",", 
                    RowBox[{"CapForm", "[", "\"Butt\"", "]"}]}], "]"}]}], 
                 "}"}]}], "}"}], ",", 
           RowBox[{"LabelStyle", "\[Rule]", 
             RowBox[{"{", 
               RowBox[{
                 RowBox[{"FontFamily", "\[Rule]", "\"Latin Modern Roman\""}], 
                 ",", 
                 RowBox[{"FontSize", "\[Rule]", "12"}]}], "}"}]}], ",", 
           RowBox[{"LegendLayout", "\[Rule]", "\"Column\""}], ",", 
           RowBox[{"LegendMargins", "\[Rule]", "0"}], ",", 
           RowBox[{"LegendMarkerSize", "\[Rule]", "300"}], ",", 
           RowBox[{"Charting`TickAnnotations", "\[Rule]", "None"}], ",", 
           RowBox[{"Charting`TickSide", "\[Rule]", "Right"}], ",", 
           RowBox[{"ColorFunctionScaling", "\[Rule]", "True"}]}], "]"}]& )], 
     TraditionalForm], TraditionalForm]},
  "Legended",
  DisplayFunction->(GridBox[{{
      TagBox[
       ItemBox[
        PaneBox[
         TagBox[#, "SkipImageSizeLevel"], Alignment -> {Center, Baseline}, 
         BaselinePosition -> Baseline], DefaultBaseStyle -> "Labeled"], 
       "SkipImageSizeLevel"], 
      ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
    GridBoxAlignment -> {"Columns" -> {{Center}}, "Rows" -> {{Center}}}, 
    AutoDelete -> False, GridBoxItemSize -> Automatic, 
    BaselinePosition -> {1, 1}]& ),
  Editable->True,
  InterpretationFunction->(RowBox[{"Legended", "[", 
     RowBox[{#, ",", 
       RowBox[{"Placed", "[", 
         RowBox[{#2, ",", "After"}], "]"}]}], "]"}]& )]], "Output"]
}, Open  ]],

Cell["Find the high order gradients too:", "Text"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"K", "=", 
   RowBox[{
    RowBox[{"With", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"summand", "=", 
        RowBox[{"FullSimplify", "[", 
         RowBox[{"L", "*", 
          RowBox[{"Outer", "[", 
           RowBox[{
            RowBox[{
             RowBox[{"D", "[", 
              RowBox[{"LL", ",", "#1", ",", "#2", ",", "#3"}], "]"}], "&"}], 
            ",", 
            RowBox[{"{", 
             RowBox[{"p", ",", "\[Alpha]", ",", "\[Beta]"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"p", ",", "\[Alpha]", ",", "\[Beta]"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"p", ",", "\[Alpha]", ",", "\[Beta]"}], "}"}]}], "]"}]}],
          "]"}]}], "}"}], ",", 
      RowBox[{"Sum", "[", 
       RowBox[{"summand", ",", 
        RowBox[{"{", 
         RowBox[{"x", ",", "0", ",", "\[Infinity]"}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{"y", ",", "0", ",", "\[Infinity]"}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{"z", ",", "0", ",", "\[Infinity]"}], "}"}]}], "]"}]}], "]"}],
     "//", "FullSimplify"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"MatrixForm", "/@", "K"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   TagBox[
    RowBox[{"(", "\[NoBreak]", GridBox[{
       {
        FractionBox[
         RowBox[{"2", " ", 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], "3"]}], 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"p", " ", 
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}],
            ")"}], "2"]], 
        FractionBox[
         RowBox[{"2", " ", "\[Beta]", " ", 
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "\[Alpha]"}], "+", "\[Beta]"}], ")"}]}], 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"p", " ", 
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}],
            ")"}], "2"]], 
        FractionBox[
         RowBox[{"2", " ", "\[Alpha]", " ", 
          RowBox[{"(", 
           RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"p", " ", 
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}],
            ")"}], "2"]]},
       {
        FractionBox[
         RowBox[{"2", " ", "\[Beta]", " ", 
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "\[Alpha]"}], "+", "\[Beta]"}], ")"}]}], 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"p", " ", 
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}],
            ")"}], "2"]], 
        RowBox[{"-", 
         FractionBox[
          RowBox[{"2", " ", "p", " ", "\[Beta]"}], 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"p", " ", 
              RowBox[{"(", 
               RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", 
             "\[Beta]"}], ")"}], "2"]]}], 
        FractionBox[
         RowBox[{
          RowBox[{"-", "\[Beta]"}], "+", 
          RowBox[{"p", " ", 
           RowBox[{"(", 
            RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}]}]}], 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"p", " ", 
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}],
            ")"}], "2"]]},
       {
        FractionBox[
         RowBox[{"2", " ", "\[Alpha]", " ", 
          RowBox[{"(", 
           RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"p", " ", 
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}],
            ")"}], "2"]], 
        FractionBox[
         RowBox[{
          RowBox[{"-", "\[Beta]"}], "+", 
          RowBox[{"p", " ", 
           RowBox[{"(", 
            RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}]}]}], 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"p", " ", 
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}],
            ")"}], "2"]], 
        RowBox[{"-", 
         FractionBox[
          RowBox[{"2", " ", 
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", "\[Alpha]"}], 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"p", " ", 
              RowBox[{"(", 
               RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", 
             "\[Beta]"}], ")"}], "2"]]}]}
      },
      GridBoxAlignment->{
       "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
        "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
      GridBoxSpacings->{"Columns" -> {
          Offset[0.27999999999999997`], {
           Offset[0.7]}, 
          Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
          Offset[0.2], {
           Offset[0.4]}, 
          Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
    Function[BoxForm`e$, 
     MatrixForm[BoxForm`e$]]], ",", 
   TagBox[
    RowBox[{"(", "\[NoBreak]", GridBox[{
       {
        FractionBox[
         RowBox[{"2", " ", "\[Beta]", " ", 
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "\[Alpha]"}], "+", "\[Beta]"}], ")"}]}], 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"p", " ", 
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}],
            ")"}], "2"]], 
        RowBox[{"-", 
         FractionBox[
          RowBox[{"2", " ", "p", " ", "\[Beta]"}], 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"p", " ", 
              RowBox[{"(", 
               RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", 
             "\[Beta]"}], ")"}], "2"]]}], 
        FractionBox[
         RowBox[{
          RowBox[{"-", "\[Beta]"}], "+", 
          RowBox[{"p", " ", 
           RowBox[{"(", 
            RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}]}]}], 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"p", " ", 
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}],
            ")"}], "2"]]},
       {
        RowBox[{"-", 
         FractionBox[
          RowBox[{"2", " ", "p", " ", "\[Beta]"}], 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"p", " ", 
              RowBox[{"(", 
               RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", 
             "\[Beta]"}], ")"}], "2"]]}], 
        RowBox[{"2", " ", 
         RowBox[{"(", 
          RowBox[{
           FractionBox["1", 
            SuperscriptBox["\[Alpha]", "2"]], "+", 
           FractionBox[
            SuperscriptBox["p", "3"], 
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{
               RowBox[{"p", " ", 
                RowBox[{"(", 
                 RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", 
               "\[Beta]"}], ")"}], "2"]]}], ")"}]}], 
        RowBox[{"-", 
         FractionBox[
          RowBox[{"2", " ", 
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", 
           SuperscriptBox["p", "2"]}], 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"p", " ", 
              RowBox[{"(", 
               RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", 
             "\[Beta]"}], ")"}], "2"]]}]},
       {
        FractionBox[
         RowBox[{
          RowBox[{"-", "\[Beta]"}], "+", 
          RowBox[{"p", " ", 
           RowBox[{"(", 
            RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}]}]}], 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"p", " ", 
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}],
            ")"}], "2"]], 
        RowBox[{"-", 
         FractionBox[
          RowBox[{"2", " ", 
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", 
           SuperscriptBox["p", "2"]}], 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"p", " ", 
              RowBox[{"(", 
               RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", 
             "\[Beta]"}], ")"}], "2"]]}], 
        FractionBox[
         RowBox[{"2", " ", 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "1"}], "+", "p"}], ")"}], "2"], " ", "p"}], 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"p", " ", 
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}],
            ")"}], "2"]]}
      },
      GridBoxAlignment->{
       "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
        "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
      GridBoxSpacings->{"Columns" -> {
          Offset[0.27999999999999997`], {
           Offset[0.7]}, 
          Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
          Offset[0.2], {
           Offset[0.4]}, 
          Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
    Function[BoxForm`e$, 
     MatrixForm[BoxForm`e$]]], ",", 
   TagBox[
    RowBox[{"(", "\[NoBreak]", GridBox[{
       {
        FractionBox[
         RowBox[{"2", " ", "\[Alpha]", " ", 
          RowBox[{"(", 
           RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"p", " ", 
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}],
            ")"}], "2"]], 
        FractionBox[
         RowBox[{
          RowBox[{"-", "\[Beta]"}], "+", 
          RowBox[{"p", " ", 
           RowBox[{"(", 
            RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}]}]}], 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"p", " ", 
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}],
            ")"}], "2"]], 
        RowBox[{"-", 
         FractionBox[
          RowBox[{"2", " ", 
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", "\[Alpha]"}], 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"p", " ", 
              RowBox[{"(", 
               RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", 
             "\[Beta]"}], ")"}], "2"]]}]},
       {
        FractionBox[
         RowBox[{
          RowBox[{"-", "\[Beta]"}], "+", 
          RowBox[{"p", " ", 
           RowBox[{"(", 
            RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}]}]}], 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"p", " ", 
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}],
            ")"}], "2"]], 
        RowBox[{"-", 
         FractionBox[
          RowBox[{"2", " ", 
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", 
           SuperscriptBox["p", "2"]}], 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"p", " ", 
              RowBox[{"(", 
               RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", 
             "\[Beta]"}], ")"}], "2"]]}], 
        FractionBox[
         RowBox[{"2", " ", 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "1"}], "+", "p"}], ")"}], "2"], " ", "p"}], 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"p", " ", 
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}],
            ")"}], "2"]]},
       {
        RowBox[{"-", 
         FractionBox[
          RowBox[{"2", " ", 
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", "\[Alpha]"}], 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"p", " ", 
              RowBox[{"(", 
               RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}]
             , ")"}], "2"]]}], 
        FractionBox[
         RowBox[{"2", " ", 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "1"}], "+", "p"}], ")"}], "2"], " ", "p"}], 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"p", " ", 
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}],
            ")"}], "2"]], 
        RowBox[{
         FractionBox["2", 
          SuperscriptBox["\[Beta]", "2"]], "-", 
         FractionBox[
          RowBox[{"2", " ", 
           SuperscriptBox[
            RowBox[{"(", 
             RowBox[{
              RowBox[{"-", "1"}], "+", "p"}], ")"}], "3"]}], 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"p", " ", 
              RowBox[{"(", 
               RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", 
             "\[Beta]"}], ")"}], "2"]]}]}
      },
      GridBoxAlignment->{
       "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
        "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
      GridBoxSpacings->{"Columns" -> {
          Offset[0.27999999999999997`], {
           Offset[0.7]}, 
          Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
          Offset[0.2], {
           Offset[0.4]}, 
          Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
    Function[BoxForm`e$, 
     MatrixForm[BoxForm`e$]]]}], "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[{
 RowBox[{
  RowBox[{"J", "=", 
   RowBox[{
    RowBox[{"With", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"summand", "=", 
        RowBox[{"L", "*", 
         RowBox[{"FullSimplify", "[", 
          RowBox[{"Outer", "[", 
           RowBox[{
            RowBox[{
             RowBox[{
              RowBox[{"D", "[", 
               RowBox[{"LL", ",", "#2", ",", "#3"}], "]"}], "*", 
              RowBox[{"D", "[", 
               RowBox[{"LL", ",", "#1"}], "]"}]}], "&"}], ",", 
            RowBox[{"{", 
             RowBox[{"p", ",", "\[Alpha]", ",", "\[Beta]"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"p", ",", "\[Alpha]", ",", "\[Beta]"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"p", ",", "\[Alpha]", ",", "\[Beta]"}], "}"}]}], "]"}], 
          "]"}]}]}], "}"}], ",", 
      RowBox[{"Sum", "[", 
       RowBox[{"summand", ",", 
        RowBox[{"{", 
         RowBox[{"x", ",", "0", ",", "\[Infinity]"}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{"y", ",", "0", ",", "\[Infinity]"}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{"z", ",", "0", ",", "\[Infinity]"}], "}"}]}], "]"}]}], "]"}],
     "//", "FullSimplify"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"MatrixForm", "/@", "J"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   TagBox[
    RowBox[{"(", "\[NoBreak]", GridBox[{
       {
        FractionBox[
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "\[Alpha]"}], "+", "\[Beta]"}], ")"}], "3"], 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"p", " ", 
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}],
            ")"}], "2"]], 
        FractionBox[
         RowBox[{
          RowBox[{"(", 
           RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], " ", "\[Beta]"}], 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"p", " ", 
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}],
            ")"}], "2"]], 
        FractionBox[
         RowBox[{"\[Alpha]", " ", 
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "\[Alpha]"}], "+", "\[Beta]"}], ")"}]}], 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"p", " ", 
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}],
            ")"}], "2"]]},
       {
        FractionBox[
         RowBox[{
          RowBox[{"(", 
           RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], " ", "\[Beta]"}], 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"p", " ", 
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}],
            ")"}], "2"]], 
        FractionBox[
         RowBox[{
          SuperscriptBox["p", "2"], " ", 
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "\[Alpha]"}], "+", "\[Beta]"}], ")"}]}], 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"p", " ", 
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}],
            ")"}], "2"]], 
        FractionBox[
         RowBox[{
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", "p", " ", 
          RowBox[{"(", 
           RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"p", " ", 
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}],
            ")"}], "2"]]},
       {
        FractionBox[
         RowBox[{"\[Alpha]", " ", 
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "\[Alpha]"}], "+", "\[Beta]"}], ")"}]}], 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"p", " ", 
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}],
            ")"}], "2"]], 
        FractionBox[
         RowBox[{
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", "p", " ", 
          RowBox[{"(", 
           RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"p", " ", 
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}],
            ")"}], "2"]], 
        RowBox[{"-", 
         FractionBox[
          RowBox[{
           SuperscriptBox[
            RowBox[{"(", 
             RowBox[{
              RowBox[{"-", "1"}], "+", "p"}], ")"}], "2"], " ", 
           RowBox[{"(", 
            RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"p", " ", 
              RowBox[{"(", 
               RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", 
             "\[Beta]"}], ")"}], "2"]]}]}
      },
      GridBoxAlignment->{
       "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
        "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
      GridBoxSpacings->{"Columns" -> {
          Offset[0.27999999999999997`], {
           Offset[0.7]}, 
          Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
          Offset[0.2], {
           Offset[0.4]}, 
          Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
    Function[BoxForm`e$, 
     MatrixForm[BoxForm`e$]]], ",", 
   TagBox[
    RowBox[{"(", "\[NoBreak]", GridBox[{
       {
        RowBox[{"-", 
         FractionBox[
          RowBox[{"p", " ", 
           SuperscriptBox[
            RowBox[{"(", 
             RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], "2"]}], 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"p", " ", 
              RowBox[{"(", 
               RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", 
             "\[Beta]"}], ")"}], "2"]]}], 
        FractionBox[
         RowBox[{"p", " ", "\[Beta]"}], 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"p", " ", 
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}],
            ")"}], "2"]], 
        RowBox[{"-", 
         FractionBox[
          RowBox[{"p", " ", "\[Alpha]"}], 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"p", " ", 
              RowBox[{"(", 
               RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", 
             "\[Beta]"}], ")"}], "2"]]}]},
       {
        FractionBox[
         RowBox[{"p", " ", "\[Beta]"}], 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"p", " ", 
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}],
            ")"}], "2"]], 
        RowBox[{
         RowBox[{"-", 
          FractionBox["1", 
           SuperscriptBox["\[Alpha]", "2"]]}], "-", 
         FractionBox[
          SuperscriptBox["p", "3"], 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"p", " ", 
              RowBox[{"(", 
               RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", 
             "\[Beta]"}], ")"}], "2"]]}], 
        FractionBox[
         RowBox[{
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", 
          SuperscriptBox["p", "2"]}], 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"p", " ", 
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}],
            ")"}], "2"]]},
       {
        RowBox[{"-", 
         FractionBox[
          RowBox[{"p", " ", "\[Alpha]"}], 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"p", " ", 
              RowBox[{"(", 
               RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", 
             "\[Beta]"}], ")"}], "2"]]}], 
        FractionBox[
         RowBox[{
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", 
          SuperscriptBox["p", "2"]}], 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"p", " ", 
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}],
            ")"}], "2"]], 
        RowBox[{"-", 
         FractionBox[
          RowBox[{
           SuperscriptBox[
            RowBox[{"(", 
             RowBox[{
              RowBox[{"-", "1"}], "+", "p"}], ")"}], "2"], " ", "p"}], 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"p", " ", 
              RowBox[{"(", 
               RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", 
             "\[Beta]"}], ")"}], "2"]]}]}
      },
      GridBoxAlignment->{
       "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
        "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
      GridBoxSpacings->{"Columns" -> {
          Offset[0.27999999999999997`], {
           Offset[0.7]}, 
          Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
          Offset[0.2], {
           Offset[0.4]}, 
          Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
    Function[BoxForm`e$, 
     MatrixForm[BoxForm`e$]]], ",", 
   TagBox[
    RowBox[{"(", "\[NoBreak]", GridBox[{
       {
        FractionBox[
         RowBox[{
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], "2"]}], 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"p", " ", 
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}],
            ")"}], "2"]], 
        RowBox[{"-", 
         FractionBox[
          RowBox[{
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", "\[Beta]"}], 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"p", " ", 
              RowBox[{"(", 
               RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", 
             "\[Beta]"}], ")"}], "2"]]}], 
        FractionBox[
         RowBox[{
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", "\[Alpha]"}], 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"p", " ", 
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}],
            ")"}], "2"]]},
       {
        RowBox[{"-", 
         FractionBox[
          RowBox[{
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", "\[Beta]"}], 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"p", " ", 
              RowBox[{"(", 
               RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", 
             "\[Beta]"}], ")"}], "2"]]}], 
        FractionBox[
         RowBox[{
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", 
          SuperscriptBox["p", "2"]}], 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"p", " ", 
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}],
            ")"}], "2"]], 
        RowBox[{"-", 
         FractionBox[
          RowBox[{
           SuperscriptBox[
            RowBox[{"(", 
             RowBox[{
              RowBox[{"-", "1"}], "+", "p"}], ")"}], "2"], " ", "p"}], 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"p", " ", 
              RowBox[{"(", 
               RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", 
             "\[Beta]"}], ")"}], "2"]]}]},
       {
        FractionBox[
         RowBox[{
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", "\[Alpha]"}], 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"p", " ", 
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}],
            ")"}], "2"]], 
        RowBox[{"-", 
         FractionBox[
          RowBox[{
           SuperscriptBox[
            RowBox[{"(", 
             RowBox[{
              RowBox[{"-", "1"}], "+", "p"}], ")"}], "2"], " ", "p"}], 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"p", " ", 
              RowBox[{"(", 
               RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", 
             "\[Beta]"}], ")"}], "2"]]}], 
        RowBox[{
         RowBox[{"-", 
          FractionBox["1", 
           SuperscriptBox["\[Beta]", "2"]]}], "+", 
         FractionBox[
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "1"}], "+", "p"}], ")"}], "3"], 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"p", " ", 
              RowBox[{"(", 
               RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", 
             "\[Beta]"}], ")"}], "2"]]}]}
      },
      GridBoxAlignment->{
       "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
        "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
      GridBoxSpacings->{"Columns" -> {
          Offset[0.27999999999999997`], {
           Offset[0.7]}, 
          Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
          Offset[0.2], {
           Offset[0.4]}, 
          Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
    Function[BoxForm`e$, 
     MatrixForm[BoxForm`e$]]]}], "}"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"bias", "=", 
  RowBox[{
   RowBox[{"Table", "[", 
    RowBox[{
     RowBox[{"Sum", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"Iinv", "[", 
         RowBox[{"[", 
          RowBox[{"s", ",", "i"}], "]"}], "]"}], "*", 
        RowBox[{"Iinv", "[", 
         RowBox[{"[", 
          RowBox[{"j", ",", "k"}], "]"}], "]"}], 
        RowBox[{"(", 
         RowBox[{
          RowBox[{
           RowBox[{"K", "[", 
            RowBox[{"[", 
             RowBox[{"i", ",", "j", ",", "k"}], "]"}], "]"}], "/", "2"}], "+", 
          RowBox[{"J", "[", 
           RowBox[{"[", 
            RowBox[{"i", ",", "j", ",", "k"}], "]"}], "]"}]}], ")"}]}], ",", 
       RowBox[{"{", 
        RowBox[{"i", ",", "3"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", "3"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"k", ",", "3"}], "}"}]}], "]"}], ",", 
     RowBox[{"{", 
      RowBox[{"s", ",", "3"}], "}"}]}], "]"}], "//", 
   "FullSimplify"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0", ",", 
   FractionBox["\[Alpha]", 
    RowBox[{
     RowBox[{"-", "\[Alpha]"}], "+", "\[Beta]"}]], ",", 
   FractionBox["\[Beta]", 
    RowBox[{"\[Alpha]", "-", "\[Beta]"}]]}], "}"}]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["Biased Cramer-Rao", "Subsection"],

Cell[TextData[{
 "The MLE has the following bias ",
 Cell[BoxData[
  FormBox[
   RowBox[{
    RowBox[{"+", "O"}], 
    RowBox[{"(", 
     SuperscriptBox[
      RowBox[{"(", 
       RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}], 
      RowBox[{"-", "2"}]], ")"}]}], TraditionalForm]]],
 ":"
}], "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{"abias", "=", 
   RowBox[{
    RowBox[{"(", 
     RowBox[{"p", "-", 
      FractionBox["\[Beta]", 
       RowBox[{"\[Alpha]", "+", "\[Beta]"}]]}], ")"}], 
    FractionBox[
     RowBox[{"\[Alpha]", "+", "\[Beta]"}], 
     SuperscriptBox[
      RowBox[{"(", 
       RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], "2"]]}]}], ";"}]], "Input"],

Cell["Then this is approximately the expected value of the MLE:", "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{"aexpect", "=", 
   RowBox[{"abias", "+", "p"}]}], ";"}]], "Input"],

Cell["\<\
We get the Jacobian of the expected value of the full estimator of \
(p,\[Alpha],\[Beta]) as:\
\>", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(", 
   RowBox[{"MLEJac", "=", 
    RowBox[{
     RowBox[{"D", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"aexpect", ",", "\[Alpha]", ",", "\[Beta]"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"{", 
         RowBox[{"p", ",", "\[Alpha]", ",", "\[Beta]"}], "}"}], "}"}]}], 
      "]"}], "//", "FullSimplify"}]}], ")"}], "//", "MatrixForm"}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      RowBox[{"1", "+", 
       FractionBox[
        RowBox[{"\[Alpha]", "+", "\[Beta]"}], 
        SuperscriptBox[
         RowBox[{"(", 
          RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], "2"]]}], 
      FractionBox[
       RowBox[{
        RowBox[{"2", " ", "\[Beta]"}], "-", 
        RowBox[{"p", " ", 
         RowBox[{"(", 
          RowBox[{"\[Alpha]", "+", 
           RowBox[{"3", " ", "\[Beta]"}]}], ")"}]}]}], 
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], "3"]], 
      FractionBox[
       RowBox[{
        RowBox[{
         RowBox[{"(", 
          RowBox[{
           RowBox[{"-", "1"}], "+", 
           RowBox[{"3", " ", "p"}]}], ")"}], " ", "\[Alpha]"}], "+", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{
           RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", "\[Beta]"}]}], 
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], "3"]]},
     {"0", "1", "0"},
     {"0", "0", "1"}
    },
    GridBoxAlignment->{
     "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, "Rows" -> {{Baseline}}, 
      "RowsIndexed" -> {}},
    GridBoxSpacings->{"Columns" -> {
        Offset[0.27999999999999997`], {
         Offset[0.7]}, 
        Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
        Offset[0.2], {
         Offset[0.4]}, 
        Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
  Function[BoxForm`e$, 
   MatrixForm[BoxForm`e$]]]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(", 
   RowBox[{"CRBBiased", "=", 
    RowBox[{
     RowBox[{"MLEJac", ".", "Iinv", ".", 
      RowBox[{"MLEJac", "\[Transpose]"}]}], "//", "FullSimplify"}]}], ")"}], "//",
   "MatrixForm"}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      FractionBox[
       RowBox[{
        RowBox[{"p", " ", 
         SuperscriptBox["\[Alpha]", "3"], " ", 
         RowBox[{"(", 
          RowBox[{
           SuperscriptBox[
            RowBox[{"(", 
             RowBox[{"1", "+", "\[Alpha]"}], ")"}], "2"], "+", 
           RowBox[{"p", " ", 
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{"2", "+", "\[Alpha]"}], ")"}], "2"]}]}], ")"}]}], "+", 
        RowBox[{
         SuperscriptBox["\[Alpha]", "2"], " ", 
         RowBox[{"(", 
          RowBox[{"5", "+", 
           RowBox[{"2", " ", "\[Alpha]", " ", 
            RowBox[{"(", 
             RowBox[{"3", "+", "\[Alpha]"}], ")"}]}], "+", 
           RowBox[{
            SuperscriptBox["p", "2"], " ", 
            RowBox[{"(", 
             RowBox[{"32", "+", 
              RowBox[{
               RowBox[{"(", 
                RowBox[{"8", "-", 
                 RowBox[{"3", " ", "\[Alpha]"}]}], ")"}], " ", "\[Alpha]"}]}],
              ")"}]}], "-", 
           RowBox[{"p", " ", 
            RowBox[{"(", 
             RowBox[{"23", "+", 
              RowBox[{"\[Alpha]", " ", 
               RowBox[{"(", 
                RowBox[{"20", "+", 
                 RowBox[{"7", " ", "\[Alpha]"}]}], ")"}]}]}], ")"}]}]}], 
          ")"}], " ", "\[Beta]"}], "+", 
        RowBox[{"\[Alpha]", " ", 
         RowBox[{"(", 
          RowBox[{"14", "-", 
           RowBox[{"41", " ", "p"}], "+", 
           RowBox[{"32", " ", 
            SuperscriptBox["p", "2"]}], "-", 
           RowBox[{"6", " ", 
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{"1", "-", 
               RowBox[{"2", " ", "p"}]}], ")"}], "2"], " ", "\[Alpha]"}], "+", 
           RowBox[{"2", " ", 
            RowBox[{"(", 
             RowBox[{
              RowBox[{"-", "4"}], "+", 
              RowBox[{"p", " ", 
               RowBox[{"(", 
                RowBox[{"9", "+", "p"}], ")"}]}]}], ")"}], " ", 
            SuperscriptBox["\[Alpha]", "2"]}]}], ")"}], " ", 
         SuperscriptBox["\[Beta]", "2"]}], "+", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{"5", "+", 
           RowBox[{"p", " ", 
            RowBox[{"(", 
             RowBox[{
              RowBox[{"-", "9"}], "+", 
              RowBox[{"4", " ", "p"}]}], ")"}]}], "-", 
           RowBox[{"6", " ", "\[Alpha]"}], "+", 
           RowBox[{"4", " ", "p", " ", 
            RowBox[{"(", 
             RowBox[{"1", "+", 
              RowBox[{"2", " ", "p"}]}], ")"}], " ", "\[Alpha]"}], "+", 
           RowBox[{"2", " ", 
            RowBox[{"(", 
             RowBox[{"6", "+", 
              RowBox[{
               RowBox[{"(", 
                RowBox[{
                 RowBox[{"-", "11"}], "+", "p"}], ")"}], " ", "p"}]}], ")"}], 
            " ", 
            SuperscriptBox["\[Alpha]", "2"]}]}], ")"}], " ", 
         SuperscriptBox["\[Beta]", "3"]}], "+", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{"6", "-", 
           RowBox[{"8", " ", "\[Alpha]"}], "+", 
           RowBox[{"p", " ", 
            RowBox[{"(", 
             RowBox[{
              RowBox[{"-", "10"}], "+", 
              RowBox[{"p", " ", 
               RowBox[{"(", 
                RowBox[{"4", "-", 
                 RowBox[{"3", " ", "\[Alpha]"}]}], ")"}]}], "+", 
              RowBox[{"13", " ", "\[Alpha]"}]}], ")"}]}]}], ")"}], " ", 
         SuperscriptBox["\[Beta]", "4"]}], "+", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{
           RowBox[{"-", "2"}], "+", "p"}], ")"}], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", 
         SuperscriptBox["\[Beta]", "5"]}]}], 
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], "6"]], 
      FractionBox[
       RowBox[{"\[Alpha]", " ", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{"2", " ", "\[Beta]"}], "-", 
          RowBox[{"p", " ", 
           RowBox[{"(", 
            RowBox[{
             SuperscriptBox["\[Alpha]", "2"], "-", 
             RowBox[{"2", " ", "\[Alpha]", " ", 
              RowBox[{"(", 
               RowBox[{
                RowBox[{"-", "1"}], "+", "\[Beta]"}], ")"}]}], "+", 
             RowBox[{"\[Beta]", " ", 
              RowBox[{"(", 
               RowBox[{"4", "+", "\[Beta]"}], ")"}]}]}], ")"}]}]}], ")"}]}], 
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], "3"]], 
      FractionBox[
       RowBox[{"\[Beta]", " ", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", 
           SuperscriptBox["\[Alpha]", "2"]}], "+", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", "\[Beta]", " ", 
           RowBox[{"(", 
            RowBox[{"2", "+", "\[Beta]"}], ")"}]}], "+", 
          RowBox[{"2", " ", "\[Alpha]", " ", 
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "1"}], "-", 
             RowBox[{"p", " ", 
              RowBox[{"(", 
               RowBox[{
                RowBox[{"-", "2"}], "+", "\[Beta]"}], ")"}]}], "+", 
             "\[Beta]"}], ")"}]}]}], ")"}]}], 
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], "3"]]},
     {
      FractionBox[
       RowBox[{"\[Alpha]", " ", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{"2", " ", "\[Beta]"}], "-", 
          RowBox[{"p", " ", 
           RowBox[{"(", 
            RowBox[{
             SuperscriptBox["\[Alpha]", "2"], "-", 
             RowBox[{"2", " ", "\[Alpha]", " ", 
              RowBox[{"(", 
               RowBox[{
                RowBox[{"-", "1"}], "+", "\[Beta]"}], ")"}]}], "+", 
             RowBox[{"\[Beta]", " ", 
              RowBox[{"(", 
               RowBox[{"4", "+", "\[Beta]"}], ")"}]}]}], ")"}]}]}], ")"}]}], 
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], "3"]], "\[Alpha]", 
      "0"},
     {
      FractionBox[
       RowBox[{"\[Beta]", " ", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", 
           SuperscriptBox["\[Alpha]", "2"]}], "+", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", "\[Beta]", " ", 
           RowBox[{"(", 
            RowBox[{"2", "+", "\[Beta]"}], ")"}]}], "+", 
          RowBox[{"2", " ", "\[Alpha]", " ", 
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "1"}], "-", 
             RowBox[{"p", " ", 
              RowBox[{"(", 
               RowBox[{
                RowBox[{"-", "2"}], "+", "\[Beta]"}], ")"}]}], "+", 
             "\[Beta]"}], ")"}]}]}], ")"}]}], 
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], "3"]], "0", "\[Beta]"}
    },
    GridBoxAlignment->{
     "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, "Rows" -> {{Baseline}}, 
      "RowsIndexed" -> {}},
    GridBoxSpacings->{"Columns" -> {
        Offset[0.27999999999999997`], {
         Offset[0.7]}, 
        Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
        Offset[0.2], {
         Offset[0.4]}, 
        Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
  Function[BoxForm`e$, 
   MatrixForm[BoxForm`e$]]]], "Output"]
}, Open  ]],

Cell["Consider a change of variables to contrast and scale:", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"reps", "=", 
  RowBox[{"First", "@", 
   RowBox[{"Solve", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"c", "\[Equal]", 
        FractionBox[
         RowBox[{"\[Alpha]", "-", "\[Beta]"}], 
         RowBox[{"\[Alpha]", "+", "\[Beta]"}]]}], ",", 
       RowBox[{"s", "\[Equal]", 
        RowBox[{"1", "/", 
         RowBox[{"(", 
          RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}]}]}]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"\[Alpha]", ",", "\[Beta]"}], "}"}]}], "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"\[Alpha]", "\[Rule]", 
    RowBox[{"-", 
     FractionBox[
      RowBox[{
       RowBox[{"-", "1"}], "-", "c"}], 
      RowBox[{"2", " ", "s"}]]}]}], ",", 
   RowBox[{"\[Beta]", "\[Rule]", 
    RowBox[{"-", 
     FractionBox[
      RowBox[{
       RowBox[{"-", "1"}], "+", "c"}], 
      RowBox[{"2", " ", "s"}]]}]}]}], "}"}]], "Output"]
}, Open  ]],

Cell["\<\
And truncate expression to 1st order in scale, since our expression for bias \
was only good to first order in scale. We get the Fisher Info back exactly; \
the bias is too small to matter.\
\>", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"Normal", "@", 
    RowBox[{"Series", "[", 
     RowBox[{
      RowBox[{
       RowBox[{
        RowBox[{"CRBBiased", "[", 
         RowBox[{"[", 
          RowBox[{"1", ",", "1"}], "]"}], "]"}], "/.", "reps"}], "//", 
       "FullSimplify"}], ",", 
      RowBox[{"{", 
       RowBox[{"s", ",", "0", ",", "1"}], "}"}]}], "]"}]}], "/.", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"c", "->", 
      FractionBox[
       RowBox[{"\[Alpha]", "-", "\[Beta]"}], 
       RowBox[{"\[Alpha]", "+", "\[Beta]"}]]}], ",", 
     RowBox[{"s", "->", 
      RowBox[{"1", "/", 
       RowBox[{"(", 
        RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}]}]}]}], "}"}]}], "//", 
  "FullSimplify"}]], "Input"],

Cell[BoxData[
 FractionBox[
  RowBox[{
   RowBox[{"p", " ", 
    RowBox[{"(", 
     RowBox[{"1", "+", "p"}], ")"}], " ", "\[Alpha]"}], "+", 
   RowBox[{
    RowBox[{"(", 
     RowBox[{
      RowBox[{"-", "2"}], "+", "p"}], ")"}], " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", "\[Beta]"}]}], 
  SuperscriptBox[
   RowBox[{"(", 
    RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], "2"]]], "Output"]
}, Open  ]],

Cell["\<\
We can plot both bounds. However, this is not useful because we have not \
included higher order corrections to the bias.\
\>", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"With", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"expr", "=", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
        RowBox[{"CRBBiased", "[", 
         RowBox[{"[", 
          RowBox[{"1", ",", "1"}], "]"}], "]"}], ",", 
        RowBox[{"Iinv", "[", 
         RowBox[{"[", 
          RowBox[{"1", ",", "1"}], "]"}], "]"}]}], "}"}], "/.", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"\[Alpha]", "\[Rule]", "10000"}], ",", 
        RowBox[{"\[Beta]", "\[Rule]", "9000"}]}], "}"}]}]}], "}"}], ",", 
   RowBox[{"LogPlot", "[", 
    RowBox[{"expr", ",", 
     RowBox[{"{", 
      RowBox[{"p", ",", "0", ",", "1"}], "}"}]}], "]"}]}], "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{{}, {}, 
    TagBox[
     {RGBColor[0.368417, 0.506779, 0.709798], AbsoluteThickness[1.6], Opacity[
      1.], LineBox[CompressedData["
1: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
f+M8nYT/u0n62/IyH6TkRp31kf8HSwh2lw==
       "]]},
     Annotation[#, "Charting`Private`Tag$183617#1"]& ], 
    TagBox[
     {RGBColor[0.880722, 0.611041, 0.142051], AbsoluteThickness[1.6], Opacity[
      1.], LineBox[CompressedData["
1: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
XQyt7DCkoP8DLOn71Q==
       "]]},
     Annotation[#, "Charting`Private`Tag$183617#2"]& ]}, {}, {}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{None, None},
  AxesOrigin->{0, -4.254698652086214},
  CoordinatesToolOptions:>{"DisplayFunction" -> ({
      Part[#, 1], 
      Exp[
       Part[#, 2]]}& ), "CopiedValueFunction" -> ({
      Part[#, 1], 
      Exp[
       Part[#, 2]]}& )},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{
     Charting`ScaledTicks[{Log, Exp}], 
     Charting`ScaledFrameTicks[{Log, Exp}]}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  ImagePadding->All,
  Method->{
   "DefaultBoundaryStyle" -> Automatic, "DefaultMeshStyle" -> 
    AbsolutePointSize[6], "ScalingFunctions" -> None, 
    "CoordinatesToolOptions" -> {"DisplayFunction" -> ({
        (Part[{{Identity, Identity}, {Log, Exp}}, 1, 2][#]& )[
         Part[#, 1]], 
        (Part[{{Identity, Identity}, {Log, Exp}}, 2, 2][#]& )[
         Part[#, 2]]}& ), "CopiedValueFunction" -> ({
        (Part[{{Identity, Identity}, {Log, Exp}}, 1, 2][#]& )[
         Part[#, 1]], 
        (Part[{{Identity, Identity}, {Log, Exp}}, 2, 2][#]& )[
         Part[#, 2]]}& )}},
  PlotRange->{{0, 1}, {-4.254698652086214, -3.855564720232455}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.05], 
     Scaled[0.05]}},
  Ticks->FrontEndValueCache[{Automatic, 
     Charting`ScaledTicks[{Log, Exp}]}, {Automatic, {{-4.268697949366879, 
       FormBox[
        TagBox[
         InterpretationBox["\"0.014\"", 0.014, AutoDelete -> True], 
         NumberForm[#, {
           DirectedInfinity[1], 3.}]& ], TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {-4.135166556742356, 
       FormBox[
        TagBox[
         InterpretationBox["\"0.016\"", 0.016, AutoDelete -> True], 
         NumberForm[#, {
           DirectedInfinity[1], 3.}]& ], TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {-4.017383521085972, 
       FormBox[
        TagBox[
         InterpretationBox["\"0.018\"", 0.018, AutoDelete -> True], 
         NumberForm[#, {
           DirectedInfinity[1], 3.}]& ], TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {-3.912023005428146, 
       FormBox[
        TagBox[
         InterpretationBox["\"0.020\"", 0.02, AutoDelete -> True], NumberForm[
         #, {
           DirectedInfinity[1], 3.}]& ], TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {-4.422848629194137, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-4.382026634673881, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-4.3428059215206005`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-4.305065593537753, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-4.2336066295556085`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-4.199705077879927, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-4.166915255056936, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-4.104394898075602, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-4.074541934925921, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-4.045554398052668, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-3.989984546897858, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-3.9633162998156966`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-3.937340813412436, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-3.8873303928377747`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-3.863232841258714, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-3.83970234384852, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-3.816712825623821, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}}}]]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["MLE Bias \[Epsilon]", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"$Assumptions", "=", 
   RowBox[{
    RowBox[{"0", "<", "\[Beta]", "<", "\[Gamma]", "<", "\[Alpha]"}], "&&", 
    RowBox[{"0", "\[LessEqual]", "p", "\[LessEqual]", "1"}], "&&", 
    RowBox[{"x", ">=", "0"}], "&&", 
    RowBox[{"y", ">=", "0"}], "&&", 
    RowBox[{"z", ">=", "0"}], "&&", 
    RowBox[{"\[Lambda]", "\[Element]", "Reals"}], "&&", 
    RowBox[{"x", "\[Element]", "Integers"}], "&&", 
    RowBox[{"y", "\[Element]", "Integers"}], "&&", 
    RowBox[{"z", "\[Element]", "Integers"}], "&&", 
    RowBox[{"\[Epsilon]", ">", "0"}]}]}], ";"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData["L"], "Input"],

Cell[BoxData[
 FractionBox[
  RowBox[{
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{
     RowBox[{"-", "\[Alpha]"}], "-", 
     RowBox[{"p", " ", "\[Alpha]"}], "-", "\[Beta]", "-", 
     RowBox[{
      RowBox[{"(", 
       RowBox[{"1", "-", "p"}], ")"}], " ", "\[Beta]"}]}]], " ", 
   SuperscriptBox["\[Alpha]", "x"], " ", 
   SuperscriptBox["\[Beta]", "y"], " ", 
   SuperscriptBox[
    RowBox[{"(", 
     RowBox[{
      RowBox[{"p", " ", "\[Alpha]"}], "+", 
      RowBox[{
       RowBox[{"(", 
        RowBox[{"1", "-", "p"}], ")"}], " ", "\[Beta]"}]}], ")"}], "z"]}], 
  RowBox[{
   RowBox[{"x", "!"}], " ", 
   RowBox[{"y", "!"}], " ", 
   RowBox[{"z", "!"}]}]]], "Output"]
}, Open  ]],

Cell["Likelihood with variable change \[Gamma]=p\[Alpha]+(1-p)\[Beta]", "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{"Lo", "=", 
   FractionBox[
    RowBox[{
     SuperscriptBox["\[ExponentialE]", 
      RowBox[{
       RowBox[{"-", "\[Alpha]"}], "-", "\[Gamma]", "-", "\[Beta]"}]], " ", 
     SuperscriptBox["\[Alpha]", "x"], " ", 
     SuperscriptBox["\[Beta]", "y"], " ", 
     SuperscriptBox["\[Gamma]", "z"]}], 
    RowBox[{
     RowBox[{"x", "!"}], " ", 
     RowBox[{"y", "!"}], " ", 
     RowBox[{"z", "!"}]}]]}], ";"}]], "Input"],

Cell["\<\
We have three variables to sum over to get the expectation value. Sum over z \
first, easy enough:\
\>", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"Sum", "[", 
   RowBox[{
    RowBox[{
     RowBox[{
      RowBox[{"(", 
       RowBox[{"z", "-", "y"}], ")"}], "/", 
      RowBox[{"(", 
       RowBox[{"x", "-", "y", "+", "\[Epsilon]"}], ")"}]}], "Lo"}], ",", 
    RowBox[{"{", 
     RowBox[{"z", ",", "0", ",", "\[Infinity]"}], "}"}]}], "]"}], "//", 
  "FullSimplify"}]], "Input"],

Cell[BoxData[
 RowBox[{"-", 
  FractionBox[
   RowBox[{
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "\[Alpha]"}], "-", "\[Beta]"}]], " ", 
    SuperscriptBox["\[Alpha]", "x"], " ", 
    SuperscriptBox["\[Beta]", "y"], " ", 
    RowBox[{"(", 
     RowBox[{"y", "-", "\[Gamma]"}], ")"}]}], 
   RowBox[{
    RowBox[{"(", 
     RowBox[{"x", "-", "y", "+", "\[Epsilon]"}], ")"}], " ", 
    RowBox[{"x", "!"}], " ", 
    RowBox[{"y", "!"}]}]]}]], "Output"]
}, Open  ]],

Cell["Then over x. Not so easy, but it still does something:", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"Sum", "[", 
   RowBox[{
    RowBox[{"-", 
     FractionBox[
      RowBox[{
       SuperscriptBox["\[ExponentialE]", 
        RowBox[{
         RowBox[{"-", "\[Alpha]"}], "-", "\[Beta]"}]], " ", 
       SuperscriptBox["\[Alpha]", "x"], " ", 
       SuperscriptBox["\[Beta]", "y"], " ", 
       RowBox[{"(", 
        RowBox[{"y", "-", "\[Gamma]"}], ")"}]}], 
      RowBox[{
       RowBox[{"(", 
        RowBox[{"x", "-", "y", "+", "\[Epsilon]"}], ")"}], " ", 
       RowBox[{"x", "!"}], " ", 
       RowBox[{"y", "!"}]}]]}], ",", 
    RowBox[{"{", 
     RowBox[{"x", ",", "0", ",", "\[Infinity]"}], "}"}]}], "]"}], "//", 
  "FullSimplify"}]], "Input"],

Cell[BoxData[
 FractionBox[
  RowBox[{
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{
     RowBox[{"-", "\[Alpha]"}], "-", "\[Beta]"}]], " ", 
   SuperscriptBox[
    RowBox[{"(", 
     RowBox[{"-", "\[Alpha]"}], ")"}], 
    RowBox[{"y", "-", "\[Epsilon]"}]], " ", 
   SuperscriptBox["\[Beta]", "y"], " ", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"-", "y"}], "+", "\[Gamma]"}], ")"}], " ", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"Gamma", "[", 
      RowBox[{
       RowBox[{"-", "y"}], "+", "\[Epsilon]"}], "]"}], "-", 
     RowBox[{"Gamma", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"-", "y"}], "+", "\[Epsilon]"}], ",", 
       RowBox[{"-", "\[Alpha]"}]}], "]"}]}], ")"}]}], 
  RowBox[{"y", "!"}]]], "Output"]
}, Open  ]],

Cell["\<\
When we try to sum the result over y, it fails to compute. Let\
\[CloseCurlyQuote]s expand it a bit, and look at the terms one at a time:\
\>", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  FractionBox[
   RowBox[{
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "\[Alpha]"}], "-", "\[Beta]"}]], " ", 
    SuperscriptBox[
     RowBox[{"(", 
      RowBox[{"-", "\[Alpha]"}], ")"}], 
     RowBox[{"y", "-", "\[Epsilon]"}]], " ", 
    SuperscriptBox["\[Beta]", "y"], " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"-", "y"}], "+", "\[Gamma]"}], ")"}], " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"Gamma", "[", 
       RowBox[{
        RowBox[{"-", "y"}], "+", "\[Epsilon]"}], "]"}], "-", 
      RowBox[{"Gamma", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"-", "y"}], "+", "\[Epsilon]"}], ",", 
        RowBox[{"-", "\[Alpha]"}]}], "]"}]}], ")"}]}], 
   RowBox[{"y", "!"}]], "//", "FunctionExpand"}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"-", 
   FractionBox[
    RowBox[{
     SuperscriptBox["\[ExponentialE]", 
      RowBox[{
       RowBox[{"-", "\[Alpha]"}], "-", "\[Beta]"}]], " ", 
     SuperscriptBox[
      RowBox[{"(", 
       RowBox[{"-", "\[Alpha]"}], ")"}], 
      RowBox[{"y", "-", "\[Epsilon]"}]], " ", 
     SuperscriptBox["\[Beta]", "y"], " ", 
     RowBox[{"Gamma", "[", 
      RowBox[{
       RowBox[{"-", "y"}], "+", "\[Epsilon]"}], "]"}]}], 
    RowBox[{"Gamma", "[", "y", "]"}]]}], "+", 
  FractionBox[
   RowBox[{
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "\[Alpha]"}], "-", "\[Beta]"}]], " ", 
    SuperscriptBox[
     RowBox[{"(", 
      RowBox[{"-", "\[Alpha]"}], ")"}], 
     RowBox[{"y", "-", "\[Epsilon]"}]], " ", 
    SuperscriptBox["\[Beta]", "y"], " ", "\[Gamma]", " ", 
    RowBox[{"Gamma", "[", 
     RowBox[{
      RowBox[{"-", "y"}], "+", "\[Epsilon]"}], "]"}]}], 
   RowBox[{"Gamma", "[", 
    RowBox[{"1", "+", "y"}], "]"}]], "+", 
  FractionBox[
   RowBox[{
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "\[Alpha]"}], "-", "\[Beta]"}]], " ", 
    SuperscriptBox[
     RowBox[{"(", 
      RowBox[{"-", "\[Alpha]"}], ")"}], 
     RowBox[{"y", "-", "\[Epsilon]"}]], " ", 
    SuperscriptBox["\[Beta]", "y"], " ", 
    RowBox[{"Gamma", "[", 
     RowBox[{
      RowBox[{
       RowBox[{"-", "y"}], "+", "\[Epsilon]"}], ",", 
      RowBox[{"-", "\[Alpha]"}]}], "]"}]}], 
   RowBox[{"Gamma", "[", "y", "]"}]], "-", 
  FractionBox[
   RowBox[{
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "\[Alpha]"}], "-", "\[Beta]"}]], " ", 
    SuperscriptBox[
     RowBox[{"(", 
      RowBox[{"-", "\[Alpha]"}], ")"}], 
     RowBox[{"y", "-", "\[Epsilon]"}]], " ", 
    SuperscriptBox["\[Beta]", "y"], " ", "\[Gamma]", " ", 
    RowBox[{"Gamma", "[", 
     RowBox[{
      RowBox[{
       RowBox[{"-", "y"}], "+", "\[Epsilon]"}], ",", 
      RowBox[{"-", "\[Alpha]"}]}], "]"}]}], 
   RowBox[{"Gamma", "[", 
    RowBox[{"1", "+", "y"}], "]"}]]}]], "Output"]
}, Open  ]],

Cell["\<\
The first two terms are purely imaginary, and therefore can be ignored since \
we know the final result is real; the imaginary part must be cancelled out in \
the last two terms. Sum over y on the last two terms:\
\>", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{" ", 
  RowBox[{
   RowBox[{"Sum", "[", 
    RowBox[{
     RowBox[{"-", 
      FractionBox[
       RowBox[{
        SuperscriptBox["\[ExponentialE]", 
         RowBox[{
          RowBox[{"-", "\[Alpha]"}], "-", "\[Beta]"}]], " ", 
        SuperscriptBox[
         RowBox[{"(", 
          RowBox[{"-", "\[Alpha]"}], ")"}], 
         RowBox[{"y", "-", "\[Epsilon]"}]], " ", 
        SuperscriptBox["\[Beta]", "y"], " ", 
        RowBox[{"Gamma", "[", 
         RowBox[{
          RowBox[{"-", "y"}], "+", "\[Epsilon]"}], "]"}]}], 
       RowBox[{"Gamma", "[", "y", "]"}]]}], ",", 
     RowBox[{"{", 
      RowBox[{"y", ",", "0", ",", "\[Infinity]"}], "}"}]}], "]"}], 
   "\[IndentingNewLine]", 
   RowBox[{"Sum", "[", 
    RowBox[{
     FractionBox[
      RowBox[{
       SuperscriptBox["\[ExponentialE]", 
        RowBox[{
         RowBox[{"-", "\[Alpha]"}], "-", "\[Beta]"}]], " ", 
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{"-", "\[Alpha]"}], ")"}], 
        RowBox[{"y", "-", "\[Epsilon]"}]], " ", 
       SuperscriptBox["\[Beta]", "y"], " ", "\[Gamma]", " ", 
       RowBox[{"Gamma", "[", 
        RowBox[{
         RowBox[{"-", "y"}], "+", "\[Epsilon]"}], "]"}]}], 
      RowBox[{"Gamma", "[", 
       RowBox[{"1", "+", "y"}], "]"}]], ",", 
     RowBox[{"{", 
      RowBox[{"y", ",", "0", ",", "\[Infinity]"}], "}"}]}], 
    "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  SuperscriptBox["\[ExponentialE]", 
   RowBox[{
    RowBox[{"-", "\[Alpha]"}], "-", "\[Beta]"}]], " ", 
  SuperscriptBox[
   RowBox[{"(", 
    RowBox[{"-", "\[Alpha]"}], ")"}], 
   RowBox[{"-", "\[Epsilon]"}]], " ", 
  SqrtBox["\[Alpha]"], " ", 
  SuperscriptBox[
   RowBox[{"(", 
    RowBox[{
     SqrtBox["\[Alpha]"], " ", 
     SqrtBox["\[Beta]"]}], ")"}], "\[Epsilon]"], " ", 
  SqrtBox["\[Beta]"], " ", 
  RowBox[{"BesselI", "[", 
   RowBox[{
    RowBox[{"1", "-", "\[Epsilon]"}], ",", 
    RowBox[{"2", " ", 
     SqrtBox["\[Alpha]"], " ", 
     SqrtBox["\[Beta]"]}]}], "]"}], " ", 
  RowBox[{"Gamma", "[", 
   RowBox[{"2", "-", "\[Epsilon]"}], "]"}], " ", 
  RowBox[{"Gamma", "[", 
   RowBox[{
    RowBox[{"-", "1"}], "+", "\[Epsilon]"}], "]"}]}]], "Output"],

Cell[BoxData[
 RowBox[{
  SuperscriptBox["\[ExponentialE]", 
   RowBox[{
    RowBox[{"-", "\[Alpha]"}], "-", "\[Beta]"}]], " ", 
  SuperscriptBox[
   RowBox[{"(", 
    RowBox[{"-", "\[Alpha]"}], ")"}], 
   RowBox[{"-", "\[Epsilon]"}]], " ", 
  SuperscriptBox[
   RowBox[{"(", 
    RowBox[{"\[Alpha]", " ", "\[Beta]"}], ")"}], 
   RowBox[{"\[Epsilon]", "/", "2"}]], " ", "\[Gamma]", " ", 
  RowBox[{"BesselI", "[", 
   RowBox[{
    RowBox[{"-", "\[Epsilon]"}], ",", 
    RowBox[{"2", " ", 
     SqrtBox[
      RowBox[{"\[Alpha]", " ", "\[Beta]"}]]}]}], "]"}], " ", 
  RowBox[{"Gamma", "[", 
   RowBox[{"1", "-", "\[Epsilon]"}], "]"}], " ", 
  RowBox[{"Gamma", "[", "\[Epsilon]", "]"}]}]], "Output"]
}, Open  ]],

Cell["\<\
The second two terms look good as we plot against y with some \
\[Alpha],\[Beta],\[Gamma].\
\>", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Plot", "[", 
  RowBox[{
   RowBox[{"Re", "[", 
    RowBox[{
     RowBox[{
      FractionBox[
       RowBox[{
        SuperscriptBox["\[ExponentialE]", 
         RowBox[{
          RowBox[{"-", "\[Alpha]"}], "-", "\[Beta]"}]], " ", 
        SuperscriptBox[
         RowBox[{"(", 
          RowBox[{"-", "\[Alpha]"}], ")"}], 
         RowBox[{"y", "-", "\[Epsilon]"}]], " ", 
        SuperscriptBox["\[Beta]", "y"], " ", 
        RowBox[{"Gamma", "[", 
         RowBox[{
          RowBox[{
           RowBox[{"-", "y"}], "+", "\[Epsilon]"}], ",", 
          RowBox[{"-", "\[Alpha]"}]}], "]"}]}], 
       RowBox[{"Gamma", "[", "y", "]"}]], "-", 
      FractionBox[
       RowBox[{
        SuperscriptBox["\[ExponentialE]", 
         RowBox[{
          RowBox[{"-", "\[Alpha]"}], "-", "\[Beta]"}]], " ", 
        SuperscriptBox[
         RowBox[{"(", 
          RowBox[{"-", "\[Alpha]"}], ")"}], 
         RowBox[{"y", "-", "\[Epsilon]"}]], " ", 
        SuperscriptBox["\[Beta]", "y"], " ", "\[Gamma]", " ", 
        RowBox[{"Gamma", "[", 
         RowBox[{
          RowBox[{
           RowBox[{"-", "y"}], "+", "\[Epsilon]"}], ",", 
          RowBox[{"-", "\[Alpha]"}]}], "]"}]}], 
       RowBox[{"Gamma", "[", 
        RowBox[{"1", "+", "y"}], "]"}]]}], "/.", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"\[Epsilon]", "\[Rule]", "0.1"}], ",", 
       RowBox[{"\[Alpha]", "\[Rule]", "500."}], ",", 
       RowBox[{"\[Beta]", "\[Rule]", "200"}], ",", 
       RowBox[{"\[Gamma]", "\[Rule]", "300"}]}], "}"}]}], "]"}], ",", 
   RowBox[{"{", 
    RowBox[{"y", ",", "195", ",", "200"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{}, {}, 
   {RGBColor[0.368417, 0.506779, 0.709798], AbsoluteThickness[1.6], Opacity[
    1.], LineBox[CompressedData["
1:eJwd13k8VVsUB3BDKUVCr0FCQvU0ImToHBRSJA+Zo0HHkDEJlXSumSiVZEoh
Q5kqVIZMETIkQoYQCg2IBpX3O/66n+/n3rvO+uyz9tp7rT3ibHCcg42NjZud
jY35PFIjz8ZmTZGEB5eSNBtNnI6XjuSBj0Q6NunAIW5iYqvghyriR+3hPOFF
pAxcPO/suXSY07Xb9xj8LHTYfz07TSSvYs3WwDzREYPiHDQxZN/897INRf44
kNm7fB5N2PM6/ll3lCK1uc2fTi6gib+2MrGhthSZ6v2uQ2wpTfQRmqcf21Fk
f8I5ftYKmnj1gjJ740iRWvXuOQEiNKFHCfcqulDkpyUCwT2SNLEqYE2StTtF
TjwSG/TaRBMuhdmc9acp0vsgR5+lLE20xuo7r/emyPKJmttvd9JE8N9dK/ee
o8gaTpXRDIImXniU2GRdwPc65pN5e2jCxDH0QweN/IZ70wT30cSU4IkzUwEU
GZyzzkVYnyZEmlrSDEMospOL3VXPiCauL7603DucImf0yiWHTWnipnmHxEAk
RRrsb7eKs6KJexayKipXKbLlRNHub0dogqe7M9I8miK5OZe4l9nSxA9XwYCS
mxSpIxuvEmtPE7IBMYXD8RQpYalYMX6SJn5l5YQaJlGk9VYDIW1XmmgMajuR
m0yRcQkOhpqnaGKyb6/f67sUuXKJ/q6m0zRx54CesnImRWpc552v40UTt1Vu
yVBZFKn4a0D8kA9NZHeyyfrnUmRGu4Dr6nM04Z3EenQFPiCiECUO76YWKt6C
Z+xf5myE26f4VJ/CV3n1exRgDn5RrXGYXfM+hyFsrKVqbplHke02VS6h8O8H
XvSOB8jvu2n/NKwdPtEy+JAinQIihZ6dp4mlIQ7OE/DJfyrzquA3Ae8XzcKs
57OadbDthTa1lY8o0t8l4mgb7O/+JFsHnvee7+QYXG56MTQbDnWOKlvhSxMq
UgIaXvkUuZw/zsUBnrcutMcfPn2gKdgFrhOd530FXmvHk+gBm62azsmEqzzj
in1hL55OkR6YiltdFwXnTyT9Ui+gyNHcq+ufwttKt+fxFFKk8l77Ia4LNKHD
ttlCCBZOlx5YDB9T28C1Ad5hqfF2KRxdIWKmAYs+8CgWgv9WL+bwho3qBvdu
gV82DR4chhXWTF40hO37Y8bLHlOkje4Tj3iYte5abCP8w0mjOwlOOBa5pxu+
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
Ff4H8/P/ixjynA==
     "]]}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{None, None},
  AxesOrigin->{195., 0.00927},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{"DefaultBoundaryStyle" -> Automatic, "ScalingFunctions" -> None},
  PlotRange->{{195, 200}, {0.009277665813722023, 0.00952664110988188}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.05], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output"]
}, Open  ]],

Cell[TextData[{
 "Now we use the formula ",
 Cell[BoxData[
  FormBox[
   RowBox[{
    RowBox[{"\[CapitalGamma]", "(", 
     RowBox[{"s", ",", "x"}], ")"}], "=", 
    RowBox[{
     SuperscriptBox[
      SubscriptBox["\[Integral]", "x"], "\[Infinity]"], 
     RowBox[{
      SuperscriptBox["t", 
       RowBox[{"s", "-", "1"}]], 
      SuperscriptBox["e", 
       RowBox[{"-", "t"}]], "dt"}]}]}], TraditionalForm]]],
 ", switch the order of the sum with the integral, make the change of \
variables t->\[Alpha],t, and we can do the sum:"
}], "Text"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"Sum", "[", 
   RowBox[{
    RowBox[{
     RowBox[{"-", "\[Gamma]"}], " ", 
     RowBox[{"Exp", "[", 
      RowBox[{
       RowBox[{"-", "\[Alpha]"}], "-", "\[Beta]"}], "]"}], 
     SuperscriptBox["\[Beta]", "y"], 
     SuperscriptBox[
      RowBox[{"(", 
       RowBox[{"-", "1"}], ")"}], 
      RowBox[{"y", "-", "\[Epsilon]"}]], 
     SuperscriptBox[
      RowBox[{"(", "t", ")"}], 
      RowBox[{
       RowBox[{"-", "y"}], "+", "\[Epsilon]", "-", "1"}]], 
     RowBox[{
      RowBox[{"Exp", "[", 
       RowBox[{
        RowBox[{"-", "\[Alpha]"}], " ", "t"}], "]"}], "/", 
      RowBox[{"Factorial", "[", "y", "]"}]}]}], ",", 
    RowBox[{"{", 
     RowBox[{"y", ",", "0", ",", "\[Infinity]"}], "}"}]}], "]"}], "//", 
  "FullSimplify"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"Sum", "[", " ", 
   RowBox[{
    RowBox[{
     RowBox[{"Exp", "[", 
      RowBox[{
       RowBox[{"-", "\[Alpha]"}], "-", "\[Beta]"}], "]"}], 
     SuperscriptBox["\[Beta]", "y"], 
     SuperscriptBox[
      RowBox[{"(", 
       RowBox[{"-", "1"}], ")"}], 
      RowBox[{"y", "-", "\[Epsilon]"}]], 
     SuperscriptBox[
      RowBox[{"(", " ", "t", ")"}], 
      RowBox[{
       RowBox[{"-", "y"}], "+", "\[Epsilon]", "-", "1"}]], 
     RowBox[{
      RowBox[{"Exp", "[", 
       RowBox[{
        RowBox[{"-", "\[Alpha]"}], " ", "t"}], "]"}], "/", 
      RowBox[{"Gamma", "[", "y", "]"}]}]}], ",", 
    RowBox[{"{", 
     RowBox[{"y", ",", "0", ",", "\[Infinity]"}], "}"}]}], "]"}], "//", 
  "FullSimplify"}]}], "Input"],

Cell[BoxData[
 RowBox[{
  SuperscriptBox[
   RowBox[{"(", 
    RowBox[{"-", "1"}], ")"}], 
   RowBox[{"1", "-", "\[Epsilon]"}]], " ", 
  SuperscriptBox["\[ExponentialE]", 
   RowBox[{"-", 
    FractionBox[
     RowBox[{
      RowBox[{"(", 
       RowBox[{"1", "+", "t"}], ")"}], " ", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"t", " ", "\[Alpha]"}], "+", "\[Beta]"}], ")"}]}], "t"]}]], 
  " ", 
  SuperscriptBox["t", 
   RowBox[{
    RowBox[{"-", "1"}], "+", "\[Epsilon]"}]], " ", "\[Gamma]"}]], "Output"],

Cell[BoxData[
 RowBox[{
  SuperscriptBox[
   RowBox[{"(", 
    RowBox[{"-", "1"}], ")"}], 
   RowBox[{"1", "-", "\[Epsilon]"}]], " ", 
  SuperscriptBox["\[ExponentialE]", 
   RowBox[{"-", 
    FractionBox[
     RowBox[{
      RowBox[{"(", 
       RowBox[{"1", "+", "t"}], ")"}], " ", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"t", " ", "\[Alpha]"}], "+", "\[Beta]"}], ")"}]}], "t"]}]], 
  " ", 
  SuperscriptBox["t", 
   RowBox[{
    RowBox[{"-", "2"}], "+", "\[Epsilon]"}]], " ", "\[Beta]"}]], "Output"]
}, Open  ]],

Cell["We are interested in (the real part of) the sum:", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{
    SuperscriptBox[
     RowBox[{"(", 
      RowBox[{"-", "1"}], ")"}], 
     RowBox[{"1", "-", "\[Epsilon]"}]], " ", 
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{"-", 
      FractionBox[
       RowBox[{
        RowBox[{"(", 
         RowBox[{"1", "+", "t"}], ")"}], " ", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{"t", " ", "\[Alpha]"}], "+", "\[Beta]"}], ")"}]}], "t"]}]], 
    " ", 
    SuperscriptBox["t", 
     RowBox[{
      RowBox[{"-", "2"}], "+", "\[Epsilon]"}]], " ", "\[Beta]"}], "+", 
   RowBox[{
    SuperscriptBox[
     RowBox[{"(", 
      RowBox[{"-", "1"}], ")"}], 
     RowBox[{"1", "-", "\[Epsilon]"}]], " ", 
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{"-", 
      FractionBox[
       RowBox[{
        RowBox[{"(", 
         RowBox[{"1", "+", "t"}], ")"}], " ", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{"t", " ", "\[Alpha]"}], "+", "\[Beta]"}], ")"}]}], "t"]}]], 
    " ", 
    SuperscriptBox["t", 
     RowBox[{
      RowBox[{"-", "1"}], "+", "\[Epsilon]"}]], " ", "\[Gamma]"}]}], "//", 
  "FullSimplify"}]], "Input"],

Cell[BoxData[
 RowBox[{
  SuperscriptBox[
   RowBox[{"(", 
    RowBox[{"-", "1"}], ")"}], 
   RowBox[{"1", "-", "\[Epsilon]"}]], " ", 
  SuperscriptBox["\[ExponentialE]", 
   RowBox[{"-", 
    FractionBox[
     RowBox[{
      RowBox[{"(", 
       RowBox[{"1", "+", "t"}], ")"}], " ", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"t", " ", "\[Alpha]"}], "+", "\[Beta]"}], ")"}]}], "t"]}]], 
  " ", 
  SuperscriptBox["t", 
   RowBox[{
    RowBox[{"-", "2"}], "+", "\[Epsilon]"}]], " ", 
  RowBox[{"(", 
   RowBox[{"\[Beta]", "+", 
    RowBox[{"t", " ", "\[Gamma]"}]}], ")"}]}]], "Output"]
}, Open  ]],

Cell["Perform the following change of variables", "Text"],

Cell[BoxData[{
 RowBox[{"t", "=", 
  RowBox[{"Exp", "[", 
   RowBox[{"I", " ", "\[Phi]"}], "]"}]}], "\[IndentingNewLine]", 
 RowBox[{"dt", "=", 
  RowBox[{
   RowBox[{"I", " ", 
    RowBox[{"Exp", "[", 
     RowBox[{"I", " ", "\[Phi]"}], "]"}], "d\[Phi]"}], "=", 
   RowBox[{"I", " ", "t", " ", "d\[Phi]"}]}]}]}], "Input"],

Cell["to get", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"expr", "=", 
  RowBox[{
   RowBox[{
    RowBox[{"(", 
     RowBox[{
      SuperscriptBox[
       RowBox[{"(", 
        RowBox[{"-", "1"}], ")"}], 
       RowBox[{"1", "-", "\[Epsilon]"}]], " ", 
      SuperscriptBox["\[ExponentialE]", 
       RowBox[{"-", 
        FractionBox[
         RowBox[{
          RowBox[{"(", 
           RowBox[{"1", "+", "t"}], ")"}], " ", 
          RowBox[{"(", 
           RowBox[{
            RowBox[{"t", " ", "\[Alpha]"}], "+", "\[Beta]"}], ")"}]}], 
         "t"]}]], " ", 
      SuperscriptBox["t", 
       RowBox[{
        RowBox[{"-", "2"}], "+", "\[Epsilon]"}]], " ", 
      RowBox[{"(", 
       RowBox[{"\[Beta]", "+", 
        RowBox[{"t", " ", "\[Gamma]"}]}], ")"}], "I", " ", "t"}], ")"}], "/.", 
    RowBox[{"{", 
     RowBox[{"t", "\[Rule]", 
      RowBox[{"Exp", "[", 
       RowBox[{"I", " ", "\[Phi]"}], "]"}]}], "}"}]}], "//", 
   "FullSimplify"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"\[ImaginaryI]", " ", 
  SuperscriptBox[
   RowBox[{"(", 
    RowBox[{"-", "1"}], ")"}], 
   RowBox[{"1", "-", "\[Epsilon]"}]], " ", 
  SuperscriptBox["\[ExponentialE]", 
   RowBox[{
    RowBox[{"-", 
     SuperscriptBox["\[ExponentialE]", 
      RowBox[{
       RowBox[{"-", "\[ImaginaryI]"}], " ", "\[Phi]"}]]}], " ", 
    RowBox[{"(", 
     RowBox[{"1", "+", 
      SuperscriptBox["\[ExponentialE]", 
       RowBox[{"\[ImaginaryI]", " ", "\[Phi]"}]]}], ")"}], " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{
       SuperscriptBox["\[ExponentialE]", 
        RowBox[{"\[ImaginaryI]", " ", "\[Phi]"}]], " ", "\[Alpha]"}], "+", 
      "\[Beta]"}], ")"}]}]], " ", 
  SuperscriptBox[
   RowBox[{"(", 
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{"\[ImaginaryI]", " ", "\[Phi]"}]], ")"}], 
   RowBox[{
    RowBox[{"-", "1"}], "+", "\[Epsilon]"}]], " ", 
  RowBox[{"(", 
   RowBox[{"\[Beta]", "+", 
    RowBox[{
     SuperscriptBox["\[ExponentialE]", 
      RowBox[{"\[ImaginaryI]", " ", "\[Phi]"}]], " ", "\[Gamma]"}]}], 
   ")"}]}]], "Output"]
}, Open  ]],

Cell["Closer look at the exponent", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"-", 
   FractionBox[
    RowBox[{
     RowBox[{"(", 
      RowBox[{"1", "+", "t"}], ")"}], " ", 
     RowBox[{"(", 
      RowBox[{
       RowBox[{"t", " ", "\[Alpha]"}], "+", "\[Beta]"}], ")"}]}], "t"]}], "//",
   "Expand"}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"-", "\[Alpha]"}], "-", 
  RowBox[{"t", " ", "\[Alpha]"}], "-", "\[Beta]", "-", 
  FractionBox["\[Beta]", "t"]}]], "Output"]
}, Open  ]],

Cell["Monte carlo-estimator for the bias to compare with:", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"\[Alpha]", "=", "500"}], ",", 
      RowBox[{"\[Beta]", "=", "300"}], ",", 
      RowBox[{"p", "=", ".75"}], ",", 
      RowBox[{"n", "=", "10000000"}], ",", "x", ",", "y", ",", "z"}], "}"}], 
    ",", "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"x", "=", 
      RowBox[{"N", "@", 
       RowBox[{"RandomVariate", "[", 
        RowBox[{
         RowBox[{"PoissonDistribution", "[", "\[Alpha]", "]"}], ",", "n"}], 
        "]"}]}]}], ";", "\[IndentingNewLine]", 
     RowBox[{"y", "=", 
      RowBox[{"RandomVariate", "[", 
       RowBox[{
        RowBox[{"PoissonDistribution", "[", "\[Beta]", "]"}], ",", "n"}], 
       "]"}]}], ";", "\[IndentingNewLine]", 
     RowBox[{"z", "=", 
      RowBox[{"RandomVariate", "[", 
       RowBox[{
        RowBox[{"PoissonDistribution", "[", 
         RowBox[{
          RowBox[{"p", " ", "\[Alpha]"}], "+", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{"1", "-", "p"}], ")"}], "\[Beta]"}]}], "]"}], ",", "n"}], 
       "]"}]}], ";", "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{"(", 
       RowBox[{"z", "-", "y"}], ")"}], "/", 
      RowBox[{"(", 
       RowBox[{"x", "-", "y", "+", ".2"}], ")"}]}]}]}], "\[IndentingNewLine]",
    "]"}], "//", "Mean"}]], "Input"],

Cell[BoxData["0.7571442639118311`"], "Output"]
}, Open  ]],

Cell["Try out a few different expressions", "Text"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"NIntegrate", "[", 
  RowBox[{
   RowBox[{
    RowBox[{"I", 
     SuperscriptBox[
      RowBox[{"(", 
       RowBox[{"-", "1"}], ")"}], 
      RowBox[{"-", "\[Epsilon]"}]], " ", 
     SuperscriptBox["\[ExponentialE]", 
      RowBox[{
       RowBox[{
        RowBox[{"-", "\[Alpha]"}], 
        RowBox[{"(", 
         RowBox[{"1", "+", 
          RowBox[{"Exp", "[", 
           RowBox[{"I", " ", "\[Phi]"}], "]"}]}], ")"}]}], "-", 
       RowBox[{"\[Beta]", 
        RowBox[{"(", 
         RowBox[{"1", "+", 
          RowBox[{"Exp", "[", 
           RowBox[{
            RowBox[{"-", "I"}], " ", "\[Phi]"}], "]"}]}], ")"}]}]}]], 
     RowBox[{"(", 
      RowBox[{
       RowBox[{"\[Gamma]", " ", 
        RowBox[{"Exp", "[", 
         RowBox[{"I", " ", "\[Epsilon]", " ", "\[Phi]"}], "]"}]}], "+", 
       RowBox[{"\[Beta]", " ", 
        RowBox[{"Exp", "[", 
         RowBox[{"I", " ", 
          RowBox[{"(", 
           RowBox[{"\[Epsilon]", "-", "1"}], ")"}], "\[Phi]"}], "]"}]}]}], 
      ")"}]}], "/.", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"\[Epsilon]", "\[Rule]", ".2"}], ",", 
      RowBox[{"\[Alpha]", "\[Rule]", "500"}], ",", 
      RowBox[{"\[Beta]", "\[Rule]", "300."}], ",", 
      RowBox[{"\[Gamma]", "\[Rule]", "450"}]}], "}"}]}], ",", 
   RowBox[{"{", 
    RowBox[{"\[Phi]", ",", "0", ",", "\[Pi]"}], "}"}]}], 
  "]"}], "\[IndentingNewLine]", 
 RowBox[{"NIntegrate", "[", 
  RowBox[{
   RowBox[{"expr", "/.", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"\[Epsilon]", "\[Rule]", ".2"}], ",", 
      RowBox[{"\[Alpha]", "\[Rule]", "500"}], ",", 
      RowBox[{"\[Beta]", "\[Rule]", "300."}], ",", 
      RowBox[{"\[Gamma]", "\[Rule]", "450"}]}], "}"}]}], ",", 
   RowBox[{"{", 
    RowBox[{"\[Phi]", ",", "\[Pi]", ",", "0"}], "}"}]}], 
  "]"}], "\[IndentingNewLine]", 
 RowBox[{"NIntegrate", "[", 
  RowBox[{
   RowBox[{
    RowBox[{
     SuperscriptBox[
      RowBox[{"(", 
       RowBox[{"-", "1"}], ")"}], 
      RowBox[{"1", "-", "\[Epsilon]"}]], " ", 
     SuperscriptBox["\[ExponentialE]", 
      RowBox[{"-", 
       FractionBox[
        RowBox[{
         RowBox[{"(", 
          RowBox[{"1", "+", "t"}], ")"}], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"t", " ", "\[Alpha]"}], "+", "\[Beta]"}], ")"}]}], "t"]}]],
      " ", 
     SuperscriptBox["t", 
      RowBox[{
       RowBox[{"-", "2"}], "+", "\[Epsilon]"}]], " ", 
     RowBox[{"(", 
      RowBox[{"\[Beta]", "+", 
       RowBox[{"t", " ", "\[Gamma]"}]}], ")"}]}], "/.", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"\[Epsilon]", "\[Rule]", "0"}], ",", 
      RowBox[{"\[Alpha]", "\[Rule]", "500"}], ",", 
      RowBox[{"\[Beta]", "\[Rule]", "300."}], ",", 
      RowBox[{"\[Gamma]", "\[Rule]", "450"}]}], "}"}]}], ",", 
   RowBox[{"{", 
    RowBox[{"t", ",", 
     RowBox[{"-", "1"}], ",", "I"}], "}"}]}], "]"}], "\[IndentingNewLine]", 
 RowBox[{"NIntegrate", "[", 
  RowBox[{
   RowBox[{
    RowBox[{
     RowBox[{"Exp", "[", 
      RowBox[{
       RowBox[{"-", 
        RowBox[{"(", 
         RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}]}], 
       RowBox[{"(", 
        RowBox[{"1", "+", 
         RowBox[{"Cos", "[", "\[Phi]", "]"}]}], ")"}]}], "]"}], 
     RowBox[{"(", 
      RowBox[{
       RowBox[{
        RowBox[{"(", 
         RowBox[{"\[Gamma]", "+", 
          RowBox[{"\[Beta]", " ", 
           RowBox[{"Cos", "[", "\[Phi]", "]"}]}]}], ")"}], 
        RowBox[{"Sin", "[", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], 
          RowBox[{"Sin", "[", "\[Phi]", "]"}]}], "]"}]}], "+", 
       RowBox[{"\[Beta]", " ", 
        RowBox[{"Sin", "[", "\[Phi]", "]"}], 
        RowBox[{"Cos", "[", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], 
          RowBox[{"Sin", "[", "\[Phi]", "]"}]}], "]"}]}]}], ")"}]}], "/.", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"\[Epsilon]", "\[Rule]", ".2"}], ",", 
      RowBox[{"\[Alpha]", "\[Rule]", "500"}], ",", 
      RowBox[{"\[Beta]", "\[Rule]", "300."}], ",", 
      RowBox[{"\[Gamma]", "\[Rule]", "450"}]}], "}"}]}], ",", 
   RowBox[{"{", 
    RowBox[{"\[Phi]", ",", "0", ",", "\[Pi]"}], "}"}]}], 
  "]"}], "\[IndentingNewLine]"}], "Input"],

Cell[BoxData[
 RowBox[{"0.7571556642584399`", "\[VeryThinSpace]", "+", 
  RowBox[{"2.493708425636407`*^-11", " ", "\[ImaginaryI]"}]}]], "Output"],

Cell[BoxData["0.7571556642582901`"], "Output"],

Cell[BoxData[
 RowBox[{"0.7579377391479156`", "\[VeryThinSpace]", "+", 
  RowBox[{"2.6227112495669225`*^-11", " ", "\[ImaginaryI]"}]}]], "Output"],

Cell[BoxData["0.757937738251023`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"Table", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"Abs", "[", 
       RowBox[{
        RowBox[{"bias", "[", 
         RowBox[{"1", ",", 
          SuperscriptBox["10", "n"], ",", 
          RowBox[{"0.5", " ", 
           SuperscriptBox["10", "n"]}]}], "]"}], "-", 
        RowBox[{"bias2", "[", 
         RowBox[{"1", ",", 
          SuperscriptBox["10", "n"], ",", 
          RowBox[{"0.5", " ", 
           SuperscriptBox["10", "n"]}]}], "]"}]}], "]"}], ",", 
      RowBox[{"(", 
       RowBox[{"1", "/", 
        SuperscriptBox["10", "n"]}], ")"}]}], "}"}], ",", 
    RowBox[{"{", 
     RowBox[{"n", ",", "0", ",", "5"}], "}"}]}], "]"}], 
  "\[Transpose]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
    "0.43101779925393324`", ",", "0.7266932465606609`", ",", 
     "0.1929477834374449`", ",", "8.464239543259922`*^-6", ",", 
     "8.033770404480833`*^-8", ",", "8.007514651353631`*^-10"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", 
     FractionBox["1", "10"], ",", 
     FractionBox["1", "100"], ",", 
     FractionBox["1", "1000"], ",", 
     FractionBox["1", "10000"], ",", 
     FractionBox["1", "100000"]}], "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"Table", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"bias", "[", 
       RowBox[{"1", ",", 
        SuperscriptBox["10", "n"], ",", 
        RowBox[{"0.5", " ", 
         SuperscriptBox["10", "n"]}]}], "]"}], ",", 
      RowBox[{"bias3", "[", 
       RowBox[{"1", ",", 
        SuperscriptBox["10", "n"], ",", 
        RowBox[{"0.5", " ", 
         SuperscriptBox["10", "n"]}]}], "]"}], ",", 
      RowBox[{"(", 
       RowBox[{"1", "/", 
        SuperscriptBox["10", "n"]}], ")"}]}], "}"}], ",", 
    RowBox[{"{", 
     RowBox[{"n", ",", "0", ",", "5"}], "}"}]}], "]"}], 
  "\[Transpose]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"-", "0.9925452427112498`"}], ",", 
     RowBox[{"-", "0.7349060449010507`"}], ",", 
     RowBox[{"-", "0.1415010980691438`"}], ",", "0.004065791730418766`", ",", 
     "0.00040064183141130805`", ",", "0.00004000640182377779`"}], "}"}], ",", 
   
   RowBox[{"{", 
    RowBox[{
     RowBox[{"-", "0.5615274434573165`"}], ",", 
     RowBox[{"-", "0.008212798340389757`"}], ",", "0.05144668536830125`", ",",
      "0.0040742559699619525`", ",", "0.0004007221691155749`", ",", 
     "0.000040007202575242935`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", 
     FractionBox["1", "10"], ",", 
     FractionBox["1", "100"], ",", 
     FractionBox["1", "1000"], ",", 
     FractionBox["1", "10000"], ",", 
     FractionBox["1", "100000"]}], "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"Fit", "[", 
    RowBox[{"#", ",", 
     RowBox[{"{", 
      RowBox[{"1", ",", "x"}], "}"}], ",", "x"}], "]"}], "&"}], "/@", 
  RowBox[{"(", 
   RowBox[{
    RowBox[{"Log10", "@", 
     RowBox[{"Table", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"Abs", "[", 
          RowBox[{
           RowBox[{"bias", "[", 
            RowBox[{"1", ",", 
             SuperscriptBox["10", "n"], ",", 
             RowBox[{"0.5", " ", 
              SuperscriptBox["10", "n"]}]}], "]"}], "-", 
           RowBox[{"bias2", "[", 
            RowBox[{"1", ",", 
             SuperscriptBox["10", "n"], ",", 
             RowBox[{"0.5", " ", 
              SuperscriptBox["10", "n"]}]}], "]"}]}], "]"}], ",", 
         RowBox[{"(", 
          RowBox[{"1", "/", 
           SuperscriptBox["10", "n"]}], ")"}]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"n", ",", "3", ",", "6"}], "}"}]}], "]"}]}], "\[Transpose]"}],
    ")"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{
    RowBox[{"-", "3.1528961112691496`"}], "-", 
    RowBox[{"1.9586522921494631`", " ", "x"}]}], ",", 
   RowBox[{
    RowBox[{"-", "2.000000000000001`"}], "-", 
    RowBox[{"0.9999999999999997`", " ", "x"}]}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ListPlot", "[", 
  RowBox[{
   RowBox[{
    RowBox[{"Log10", "@", 
     RowBox[{"Table", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"bias", "[", 
          RowBox[{"1", ",", 
           SuperscriptBox["10", "n"], ",", 
           RowBox[{"0.5", " ", 
            SuperscriptBox["10", "n"]}]}], "]"}], ",", 
         RowBox[{"bias3", "[", 
          RowBox[{"1", ",", 
           SuperscriptBox["10", "n"], ",", 
           RowBox[{"0.5", " ", 
            SuperscriptBox["10", "n"]}]}], "]"}]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"n", ",", "0", ",", "6"}], "}"}]}], "]"}]}], "\[Transpose]"}],
    ",", 
   RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{}, {{}, 
    {RGBColor[0.368417, 0.506779, 0.709798], PointSize[0.019444444444444445`],
      AbsoluteThickness[1.6], 
     PointBox[{{4., -2.390854871798937}, {5., -3.3972437075570627`}, {
      6., -4.397870507315062}, {7., -5.3979330597232025`}}]}, 
    {RGBColor[0.880722, 0.611041, 0.142051], PointSize[0.019444444444444445`],
      AbsoluteThickness[1.6], 
     PointBox[{{3., -1.2886426009332015`}, {4., -2.389951689412964}, {
      5., -3.397156630469133}, {6., -4.39786181474471}, {
      7., -5.397931796138764}}]}, {}}, {}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{None, None},
  AxesOrigin->{0, 0},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{},
  PlotRange->{{0., 7.}, {-5.3979330597232025`, 0}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.05], 
     Scaled[0.02]}},
  Ticks->{Automatic, Automatic}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ListPlot", "[", 
  RowBox[{
   RowBox[{"{", "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"Table", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"\[Alpha]", ",", 
         RowBox[{"Log10", "@", 
          RowBox[{"Abs", "[", 
           RowBox[{"bias", "[", 
            RowBox[{"1", ",", "\[Alpha]", ",", 
             RowBox[{"0.5", " ", "\[Alpha]"}]}], "]"}], "]"}]}]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"\[Alpha]", ",", "100", ",", "2000", ",", "100"}], "}"}]}], 
      "]"}], ",", "\[IndentingNewLine]", 
     RowBox[{"Table", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"\[Alpha]", ",", 
         RowBox[{"Log10", "@", 
          RowBox[{"Abs", "[", 
           RowBox[{
            RowBox[{"bias", "[", 
             RowBox[{"1", ",", "\[Alpha]", ",", 
              RowBox[{"0.5", " ", "\[Alpha]"}]}], "]"}], "-", 
            RowBox[{"bias3", "[", 
             RowBox[{"1", ",", "\[Alpha]", ",", 
              RowBox[{"0.5", " ", "\[Alpha]"}]}], "]"}]}], "]"}]}]}], "}"}], 
       ",", 
       RowBox[{"{", 
        RowBox[{"\[Alpha]", ",", "100", ",", "2000", ",", "100"}], "}"}]}], 
      "]"}]}], "\[IndentingNewLine]", "}"}], ",", 
   RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{}, {{}, 
    {RGBColor[0.368417, 0.506779, 0.709798], PointSize[0.019444444444444445`],
      AbsoluteThickness[1.6], PointBox[CompressedData["
1:eJxTTMoPSmViYGAQAWIQDQGRDndK3Q//1Hm9H8LPdJjCE3+m5jXDATD3QJGD
suSfHr/+31D5Sgc2rompejH/IHyHegePl7cvtJTD1Dc55Fztzf7sxQjhP2h1
OKbp5J9zD8pn6HTIc166TC+cCcJX6HGw5/yXEXAQynfod1h0715LhQIzhG8w
0SH/gENdfxmUf2CSg3urUrfQUSg/YIrDiWs+yma8LFD7pjoY/LV+8c4fyi+Y
7qCkrPXkXy+UzzDTIaPP4g/jCSh/wiwH7+2/Asv/QfkKcxzc0jx+HDdkhfA3
zHVonM99yjsJyneY7/BgcdofnwmsBwBgV2Z3
      "]]}, 
    {RGBColor[0.880722, 0.611041, 0.142051], PointSize[0.019444444444444445`],
      AbsoluteThickness[1.6], PointBox[CompressedData["
1:eJxTTMoPSmViYGAQAWIQDQGRDspdk2PX3n22H8LPdODffPHf5dy/EP6BIoeX
6zv+sM5hOgCRr3SYU/PaOcSXFcJ3qHf4dGiH3KdHXBD+gSYHp7l1Tw7ZCkP4
D1oddDX/cyUZC0H1dzpwT0/dI/sGylfocSh+NeHqi/1Q9Q79DiFntySpeYlA
+AYTHdh3c/iJroDyD0xyEI1Pqi74BuUHTHFwu7kpVt1OFGrfVAfRsl/Ozxug
/ILpDj4C++M09kP5DDMdvr+9ZxP/E8qfMMuBh7Mpl8lADOqeOQ5HW98ZVydD
+RvmOpTMTp+hNAXKd5jvwLqjcYXzIbEDAI52Zxc=
      "]]}, {}}, {}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{None, None},
  AxesOrigin->{70.3125, 0},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{},
  PlotRange->{{100., 2000.}, {-5.689711220662507, 0}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.05], 
     Scaled[0.02]}},
  Ticks->{Automatic, Automatic}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ListPlot", "[", 
  RowBox[{
   RowBox[{
    RowBox[{"Log10", "@", 
     RowBox[{"Table", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"Abs", "[", 
          RowBox[{
           RowBox[{"bias", "[", 
            RowBox[{"1", ",", 
             SuperscriptBox["10", "n"], ",", 
             RowBox[{"0.5", " ", 
              SuperscriptBox["10", "n"]}]}], "]"}], "-", 
           RowBox[{"bias3", "[", 
            RowBox[{"1", ",", 
             SuperscriptBox["10", "n"], ",", 
             RowBox[{"0.5", " ", 
              SuperscriptBox["10", "n"]}]}], "]"}]}], "]"}], ",", 
         RowBox[{"(", 
          RowBox[{"1", "/", 
           SuperscriptBox["10", 
            RowBox[{"2", "n"}]]}], ")"}]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"n", ",", "0", ",", "6"}], "}"}]}], "]"}]}], "\[Transpose]"}],
    ",", 
   RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{}, {{}, 
    {RGBColor[0.368417, 0.506779, 0.709798], PointSize[0.019444444444444445`],
      AbsoluteThickness[1.6], 
     PointBox[{{1., -0.3655047949015606}, {2., -0.13864887585334437`}, {
      3., -0.7145602061903599}, {4., -5.072412054333956}, {
      5., -7.095080582841876}, {6., -9.096502258030904}, {
      7., -10.934112470164266`}}]}, 
    {RGBColor[0.880722, 0.611041, 0.142051], PointSize[0.019444444444444445`],
      AbsoluteThickness[1.6], 
     PointBox[{{1., 0.}, {2., -2.}, {3., -4.}, {4., -6.}, {5., -8.}, {
      6., -10.}, {7., -12.}}]}, {}}, {}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{None, None},
  AxesOrigin->{0, 0},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{},
  PlotRange->{{0., 7.}, {-12., 0}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.05], 
     Scaled[0.02]}},
  Ticks->{Automatic, Automatic}]], "Output"]
}, Open  ]],

Cell[BoxData[{
 RowBox[{
  RowBox[{"g", "[", "\[Alpha]_", "]"}], ":=", 
  RowBox[{"First", "@", 
   RowBox[{"NMaximize", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{
        RowBox[{"Exp", "[", 
         RowBox[{
          RowBox[{"-", "\[Alpha]"}], " ", 
          RowBox[{"(", 
           RowBox[{"1", "+", 
            RowBox[{"Cos", "[", "\[Phi]", "]"}]}], ")"}]}], "]"}], "-", 
        RowBox[{"Exp", "[", 
         RowBox[{
          RowBox[{"-", "\[Alpha]"}], 
          RowBox[{
           SuperscriptBox[
            RowBox[{"(", 
             RowBox[{"\[Pi]", "-", "\[Phi]"}], ")"}], "2"], "/", "2"}]}], 
         "]"}]}], ",", 
       RowBox[{"0", "<", "\[Phi]", "<", "\[Pi]"}]}], "}"}], ",", "\[Phi]"}], 
    "]"}]}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"h", "[", "\[Alpha]_", "]"}], ":=", 
  RowBox[{"NIntegrate", "[", 
   RowBox[{
    RowBox[{
     RowBox[{"Exp", "[", 
      RowBox[{
       RowBox[{"-", "\[Alpha]"}], " ", 
       RowBox[{"(", 
        RowBox[{"1", "+", 
         RowBox[{"Cos", "[", "\[Phi]", "]"}]}], ")"}]}], "]"}], "-", 
     RowBox[{"Exp", "[", 
      RowBox[{
       RowBox[{"-", "\[Alpha]"}], 
       RowBox[{
        SuperscriptBox[
         RowBox[{"(", 
          RowBox[{"\[Pi]", "-", "\[Phi]"}], ")"}], "2"], "/", "2"}]}], 
      "]"}]}], ",", 
    RowBox[{"{", 
     RowBox[{"\[Phi]", ",", "0", ",", "\[Pi]"}], "}"}]}], "]"}]}]}], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ListPlot", "[", 
  RowBox[{
   RowBox[{
    RowBox[{"Log10", "@", 
     RowBox[{"Table", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"g", "[", 
          SuperscriptBox["10", "n"], "]"}], ",", 
         RowBox[{"h", "[", 
          SuperscriptBox["10", "n"], "]"}], ",", 
         RowBox[{"(", 
          RowBox[{"1", "/", 
           SuperscriptBox["10", "n"]}], ")"}]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"n", ",", "0", ",", "5"}], "}"}]}], "]"}]}], "\[Transpose]"}],
    ",", 
   RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{}, {{}, 
    {RGBColor[0.368417, 0.506779, 0.709798], PointSize[0.019444444444444445`],
      AbsoluteThickness[1.6], 
     PointBox[{{1., -0.8923037575575447}, {2., -2.0357865285779777`}, {
      3., -3.0438096355834547`}, {4., -4.044593344039328}, {
      5., -5.044671533632114}, {6., -6.044679046487549}}]}, 
    {RGBColor[0.880722, 0.611041, 0.142051], PointSize[0.019444444444444445`],
      AbsoluteThickness[1.6], 
     PointBox[{{1., -0.6736256515116684}, {2., -2.278391897620285}, {
      3., -3.802568287663691}, {4., -5.304785571809395}, {
      5., -6.805005617550789}, {6., -8.305027605551668}}]}, 
    {RGBColor[0.560181, 0.691569, 0.194885], PointSize[0.019444444444444445`],
      AbsoluteThickness[1.6], 
     PointBox[{{1., 0.}, {2., -1.}, {3., -2.}, {4., -3.}, {5., -4.}, {
      6., -5.}}]}, {}}, {}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{None, None},
  AxesOrigin->{0, 0},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{},
  PlotRange->{{0., 6.}, {-8.305027605551668, 0}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.05], 
     Scaled[0.02]}},
  Ticks->{Automatic, Automatic}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"Log10", "@", 
   RowBox[{"Table", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"g", "[", 
        SuperscriptBox["10", "n"], "]"}], ",", 
       RowBox[{"h", "[", 
        SuperscriptBox["10", "n"], "]"}], ",", 
       RowBox[{"(", 
        RowBox[{"1", "/", 
         SuperscriptBox["10", "n"]}], ")"}]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"n", ",", "0", ",", "5"}], "}"}]}], "]"}]}], 
  "\[Transpose]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"-", "0.8923037575575447`"}], ",", 
     RowBox[{"-", "2.0357865285779777`"}], ",", 
     RowBox[{"-", "3.0438096355834547`"}], ",", 
     RowBox[{"-", "4.044593344039328`"}], ",", 
     RowBox[{"-", "5.044671533632114`"}], ",", 
     RowBox[{"-", "6.044679046487549`"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"-", "0.6736256515116684`"}], ",", 
     RowBox[{"-", "2.278391897620285`"}], ",", 
     RowBox[{"-", "3.802568287663691`"}], ",", 
     RowBox[{"-", "5.304785571809395`"}], ",", 
     RowBox[{"-", "6.805005617550789`"}], ",", 
     RowBox[{"-", "8.305027605551668`"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", 
     RowBox[{"-", "1"}], ",", 
     RowBox[{"-", "2"}], ",", 
     RowBox[{"-", "3"}], ",", 
     RowBox[{"-", "4"}], ",", 
     RowBox[{"-", "5"}]}], "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"Fit", "[", 
    RowBox[{"#", ",", 
     RowBox[{"{", 
      RowBox[{"1", ",", "x"}], "}"}], ",", "x"}], "]"}], "&"}], "/@", 
  RowBox[{"(", 
   RowBox[{
    RowBox[{"Log10", "@", 
     RowBox[{"Table", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"g", "[", 
          SuperscriptBox["10", "n"], "]"}], ",", 
         RowBox[{"h", "[", 
          SuperscriptBox["10", "n"], "]"}], ",", 
         RowBox[{"(", 
          RowBox[{"1", "/", 
           SuperscriptBox["10", "n"]}], ")"}]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"n", ",", "0", ",", "5"}], "}"}]}], "]"}]}], "\[Transpose]"}],
    ")"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"0.06129087584716893`", "\[VeryThinSpace]", "-", 
    RowBox[{"1.0225518619505232`", " ", "x"}]}], ",", 
   RowBox[{"0.7956727161291386`", "\[VeryThinSpace]", "-", 
    RowBox[{"1.5211162346896345`", " ", "x"}]}], ",", 
   RowBox[{"1.0000000000000018`", "\[VeryThinSpace]", "-", 
    RowBox[{"1.0000000000000004`", " ", "x"}]}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ListPlot", "[", 
  RowBox[{
   RowBox[{
    RowBox[{"Table", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
        RowBox[{"g", "[", "k", "]"}], ",", 
        RowBox[{"1", "/", "k"}]}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{"k", ",", "1", ",", "100"}], "}"}]}], "]"}], "\[Transpose]"}], 
   ",", 
   RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{}, {{}, 
    {RGBColor[0.368417, 0.506779, 0.709798], PointSize[0.01388888888888889], 
     AbsoluteThickness[1.6], PointBox[CompressedData["
1:eJw1yw1M1HUcx/E7RTlxxEM+HOSAxPDGDFCeBPT4AIfHHU/3zNHEFA6xbIWi
IlTrhgWmMAYOnKCAk6yTSAyDa6w4n+AMGAoRIIM6TXkUkpENDrSav+9/++2/
1+/9+7yZ+pEifRmHw9H9d/7/v/r+Cj/b73LeVDTVyi7gOTiobm+ZY+Zh1ai4
gT/wD7MjmhyXXHUL88xrIPyQOyeqtDLzceS7U3llU4vMG7DUdumzGdsXzB7w
tpFbwxfJGzG+yTOc0/uSeRM6VxUflko4plf2wlGbpv03qskCHB+NdyiaJnvj
qJ2u+mkQl3kLhF3Xux7kkH2gDErw4xvJfui+XTAeOUveCo3rc7chwTLmbahS
3bwm3U32x/zdMveJQnIA7D93d7dpIQfC6+t3tANPyEEYclydc8FxOXMwEisq
7+dtJ29HHXfHuWt7yCFQOPnPxJ8gh6JOG2XIvkwOQ27+nQWpmbwDfmK3pT/G
yDuhtHfykPFsmIUw/PAw/1svcjiqRlw0PBEZ8Gu+N5e1l1kPzK0Zi3rxMfUI
rFs503m9nHoEnjVum7jUQD0SnkUe47/dpR4Jc/DkZu1D6lH4szjQd+sC9SiI
FGnm951WsC7Cy9POTvYCZr0IZm/vQnch9Wi8bej3MyipRyNvoC274QD1XeCb
e/aHfUp9F0IadZWJJdTFiOysV87WUhdj84DlmMBIPQb5vDPnn/9CPQb3W6Wv
7xumLkHh0rEnB2eoS7B8zPTIlbuSdSkq149UH3Jm1kthNz+Zm+VJPRal2am1
ngHUY9FRZXD7QkQ9DuP+u29WqKjHweqLiAwd9Xic7FsUPM2iHg/nmLLHPieo
J+BRfv0tn1LqCRCqqmena6gnwud0Wv6hq9QTURGmyjH+RF2Gct+O+jsdzJCh
KbBmpmKQ3stgFJz6O2SU2SRDY1x6au0c7eW4fXhf2xDXlu3l4FldaiyvMevl
cKk9l9L8BrNJDo/B2JQ9AmaOAlUbhqf7A2ivQPD4atVbEbRXYDLm4A1xPO0V
uKzjv4tk2ishWUiTOKbTXonC5swSYybtlWhNbt8Z+gntlShWW6TlBbRXYaz9
Sl1XKe1ViA5dlFgu0F6FPp69bc83tFdh/seRlppG2qvx/fTFkISfaa/G2pS1
0iEz7dV47PX71Zhe2quR4WbxOjtMew0S15/UtY/SXoMrvev4D57RXoMPGqcm
uq2012Ay16w3rOCxfRIuZtoez3BgRhIynCzv2bkw65OQWVI9UbqR2ZQEh719
X3K30F4Lxb3iHk0g7bUoDSmIPSOkvRZyfVx2s5j2WnQfOPLrLRntk+H6lWnY
mMwz/QvkXNBp
      "]]}, 
    {RGBColor[0.880722, 0.611041, 0.142051], PointSize[0.01388888888888889], 
     AbsoluteThickness[1.6], PointBox[CompressedData["
1:eJxV1H9QkwUcx/EH4gyDlEIaGcUUr6F0SPFLIeMjbEOcsF9sDJGTSOwHxa4m
x/Jqe/qBnVkKB2nAxXCUVleKxcElXMB1lWRJhF7YIXZCTwQ0KQEhYquO7/eP
nrvnnnvde5/dc3u2rSm2Gkr8BUHY8+/533XpmEoT/n/A97xLF6oc6FpiIBYv
aY8qDg6TQ6iPkFfBL6Mlb7ZQIofDe7LC9o40Ro5A2rf2oKCgCbIc3qTrcxHS
JHktvb+HvA50X+T7Yf1SV3ToA3Y0nJ+MvGlU/kHeAO2dnRltP7AfgEs5mv+6
+U9yLATZ03eo+tlxdP83yA/i2IuaxInT7Ifg6NW63g6bJscjpGfB9FU5OwHi
sOJiQD87Ea4CXWmfYoacBE+zPaFqPzsZzvkGeXMvexO8VUHFlrBZ8mb6/Ngp
6JsakXU0s1Ph+Lmj5YrEfhiRUcGxRxQ3yVsw/ljpswsl7EfgnKn5JcvNToP0
uGVV4xAbcFq+XhceNrdkEfCcHVVd0pCFrZDtsi2fErlvRdNrtWfEVu7p9Hy5
p0Msklp2yuapZ6DKFbXhvJosZuDCrbr1Qjl3JXyd2veXu7krYQn2f272O+4q
RKbY0y7OcVdhJq6z//Tav6irUfZyU+BbGrKohjNYuHnYxj0Tvh+/mD5Zzz0T
jWfnTv3WzX0bHNb4pEKJ+zb6fi5Qz4K4ZjBmIZYsZuEu29XViQbu26HtC5rs
2sd9OzL2GzXuo9w18H4+8uq1du4aXJei3zgwyH0HXH4J/rVz3Hegqu1Iakj4
39Sz8VR6jUpIJovZ8Exh4gkT9xz4Bjo+y7Fxz8HUPbsD2qq4a7FXLY65P+au
xX36Ud3d33DX0e+PDB364mutZ/wW6fU6lNUFr/4pgtytQ2zJzqT6ZLKgx7GU
hivTejL08Ho2Lvu9lPd6yPd2VlZW8l4Po/yW0J5G3hvgOODKdLfz3oA9rceP
x3zPewOEtBWVu8d4b4C4SbkFgpf2RoQ4NN4+GRlGHI65XQrZSBaNyJEqFgPU
5G4jyg5Wbz61i/e5cDZUvLDCxvtc+v/hfS4Gx9erFxp5n4vL9QMph1p5b0Jj
eFPo5V7emyBzRT0qDfPehPKVo++13uC9CU/m+8yqQB/tzfAUnRuqiyDDjBPL
Cmo+jSOLZvjGFedrlORuM6x2e2+qhfd5cLZNnPuolPd5KCmcnP/Vwfs83Fsn
f8VTzfs8VF8beKnnXd5b4M0uuK24nfcWXDixL7q/l/cWdH3YdHXlEO8teKbF
HhPp4X0+lq5C9z8JrxuG
      "]]}, {}}, {}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{None, None},
  AxesOrigin->{0, 0},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{},
  PlotRange->{{0., 100.}, {-3.0438096355834547`, 0}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.05], 
     Scaled[0.02]}},
  Ticks->{Automatic, Automatic}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"FullSimplify", "[", 
  RowBox[{
   RowBox[{
    RowBox[{
     SuperscriptBox[
      RowBox[{"Sin", "[", "\[Phi]", "]"}], 
      RowBox[{"-", "1"}]], 
     RowBox[{"Exp", "[", 
      RowBox[{
       RowBox[{"-", 
        RowBox[{"(", 
         RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}]}], 
       RowBox[{"(", 
        RowBox[{"1", "+", 
         RowBox[{"Cos", "[", "\[Phi]", "]"}]}], ")"}]}], "]"}], 
     RowBox[{"(", 
      RowBox[{
       RowBox[{
        RowBox[{"(", 
         RowBox[{"\[Gamma]", "+", 
          RowBox[{"\[Beta]", " ", 
           RowBox[{"Cos", "[", "\[Phi]", "]"}]}]}], ")"}], 
        RowBox[{"Sin", "[", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], 
          RowBox[{"Sin", "[", "\[Phi]", "]"}]}], "]"}]}], "+", 
       RowBox[{"\[Beta]", " ", 
        RowBox[{"Sin", "[", "\[Phi]", "]"}], 
        RowBox[{"Cos", "[", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], 
          RowBox[{"Sin", "[", "\[Phi]", "]"}]}], "]"}]}]}], ")"}]}], "/.", 
    RowBox[{"{", 
     RowBox[{"\[Phi]", "\[Rule]", 
      RowBox[{"ArcCos", "[", 
       RowBox[{"t", "-", "1"}], "]"}]}], "}"}]}], ",", 
   RowBox[{"Assumptions", "\[Rule]", 
    RowBox[{"0", "<", "t", "<", "2"}]}]}], "]"}]], "Input"],

Cell[BoxData[
 FractionBox[
  RowBox[{
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{
     RowBox[{"-", "t"}], " ", 
     RowBox[{"(", 
      RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}]}]], " ", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"t", " ", "\[Beta]", " ", 
      RowBox[{"Cosh", "[", 
       RowBox[{
        SqrtBox[
         RowBox[{
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "2"}], "+", "t"}], ")"}], " ", "t"}]], " ", 
        RowBox[{"(", 
         RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "]"}]}], "+", 
     FractionBox[
      RowBox[{"t", " ", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "1"}], "+", "t"}], ")"}], " ", "\[Beta]"}], "+", 
         "\[Gamma]"}], ")"}], " ", 
       RowBox[{"Sinh", "[", 
        RowBox[{
         SqrtBox[
          RowBox[{
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "2"}], "+", "t"}], ")"}], " ", "t"}]], " ", 
         RowBox[{"(", 
          RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "]"}]}], 
      SqrtBox[
       RowBox[{
        RowBox[{"(", 
         RowBox[{
          RowBox[{"-", "2"}], "+", "t"}], ")"}], " ", "t"}]]]}], ")"}]}], 
  "t"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Plot", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"Exp", "[", 
      RowBox[{
       RowBox[{"-", "5"}], 
       RowBox[{"(", 
        RowBox[{"1", "+", 
         RowBox[{"Cos", "[", "\[Phi]", "]"}]}], ")"}]}], "]"}], ",", 
     RowBox[{"Exp", "[", 
      RowBox[{
       RowBox[{"-", "5"}], 
       RowBox[{
        SuperscriptBox[
         RowBox[{"(", 
          RowBox[{"\[Phi]", "-", "\[Pi]"}], ")"}], "2"], "/", "2"}]}], 
      "]"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"\[Phi]", ",", "0", ",", "\[Pi]"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{}, {}, 
   {RGBColor[0.368417, 0.506779, 0.709798], AbsoluteThickness[1.6], Opacity[
    1.], LineBox[CompressedData["
1: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
     "]]}, 
   {RGBColor[0.880722, 0.611041, 0.142051], AbsoluteThickness[1.6], Opacity[
    1.], LineBox[CompressedData["
1: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
     "]]}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{None, None},
  AxesOrigin->{0, 0},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{"DefaultBoundaryStyle" -> Automatic, "ScalingFunctions" -> None},
  PlotRange->
   NCache[{{0, Pi}, {0., 0.9999999999999897}}, {{0, 3.141592653589793}, {0., 
     0.9999999999999897}}],
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.05], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"bias", "[", 
  RowBox[{".75", ",", "500", ",", "300"}], "]"}]], "Input"],

Cell[BoxData["0.008159963036875828`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"Series", "[", 
   RowBox[{
    FractionBox[
     RowBox[{" ", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"t", " ", "\[Beta]", " ", 
         RowBox[{"Cosh", "[", 
          RowBox[{
           SqrtBox[
            RowBox[{
             RowBox[{"(", 
              RowBox[{
               RowBox[{"-", "2"}], "+", "t"}], ")"}], " ", "t"}]], " ", 
           RowBox[{"(", 
            RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "]"}]}], "+", 
        FractionBox[
         RowBox[{"t", " ", 
          RowBox[{"(", 
           RowBox[{
            RowBox[{
             RowBox[{"(", 
              RowBox[{
               RowBox[{"-", "1"}], "+", "t"}], ")"}], " ", "\[Beta]"}], "+", 
            "\[Gamma]"}], ")"}], " ", 
          RowBox[{"Sinh", "[", 
           RowBox[{
            SqrtBox[
             RowBox[{
              RowBox[{"(", 
               RowBox[{
                RowBox[{"-", "2"}], "+", "t"}], ")"}], " ", "t"}]], " ", 
            RowBox[{"(", 
             RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "]"}]}], 
         SqrtBox[
          RowBox[{
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "2"}], "+", "t"}], ")"}], " ", "t"}]]]}], ")"}]}], 
     "t"], ",", 
    RowBox[{"{", 
     RowBox[{"t", ",", "0", ",", "1"}], "}"}]}], "]"}], "//", 
  "FullSimplify"}]], "Input"],

Cell[BoxData[
 InterpretationBox[
  RowBox[{
   RowBox[{"(", 
    RowBox[{
     SuperscriptBox["\[Beta]", "2"], "+", 
     RowBox[{"\[Alpha]", " ", "\[Gamma]"}], "-", 
     RowBox[{"\[Beta]", " ", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"-", "1"}], "+", "\[Alpha]", "+", "\[Gamma]"}], ")"}]}]}], 
    ")"}], "+", 
   RowBox[{
    FractionBox["1", "3"], " ", 
    RowBox[{"(", 
     RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"\[Beta]", " ", 
       RowBox[{"(", 
        RowBox[{"3", "+", 
         SuperscriptBox["\[Alpha]", "2"], "+", 
         RowBox[{"\[Beta]", " ", 
          RowBox[{"(", 
           RowBox[{"3", "+", "\[Beta]"}], ")"}]}], "-", 
         RowBox[{"\[Alpha]", " ", 
          RowBox[{"(", 
           RowBox[{"3", "+", 
            RowBox[{"2", " ", "\[Beta]"}]}], ")"}]}]}], ")"}]}], "-", 
      RowBox[{
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], "2"], " ", 
       "\[Gamma]"}]}], ")"}], " ", "t"}], "+", 
   InterpretationBox[
    SuperscriptBox[
     RowBox[{"O", "[", "t", "]"}], 
     RowBox[{"3", "/", "2"}]],
    SeriesData[$CellContext`t, 0, {}, 0, 3, 2],
    Editable->False]}],
  SeriesData[$CellContext`t, 
   0, {$CellContext`\[Beta]^2 + $CellContext`\[Alpha] $CellContext`\[Gamma] - \
$CellContext`\[Beta] (-1 + $CellContext`\[Alpha] + $CellContext`\[Gamma]), 
    0, (Rational[
      1, 3] ($CellContext`\[Alpha] - $CellContext`\[Beta])) ($CellContext`\
\[Beta] (3 + $CellContext`\[Alpha]^2 + $CellContext`\[Beta] (
         3 + $CellContext`\[Beta]) - $CellContext`\[Alpha] (3 + 
        2 $CellContext`\[Beta])) - ($CellContext`\[Alpha] - $CellContext`\
\[Beta])^2 $CellContext`\[Gamma])}, 0, 3, 2],
  Editable->False]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"Integrate", "[", 
   RowBox[{
    RowBox[{
     RowBox[{
      SuperscriptBox["\[ExponentialE]", 
       RowBox[{
        RowBox[{"-", "t"}], " ", 
        RowBox[{"(", 
         RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}]}]], 
      RowBox[{"(", 
       RowBox[{
        SuperscriptBox["\[Beta]", "2"], "+", 
        RowBox[{"\[Alpha]", " ", "\[Gamma]"}], "-", 
        RowBox[{"\[Beta]", " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"-", "1"}], "+", "\[Alpha]", "+", "\[Gamma]"}], ")"}]}]}], 
       ")"}]}], "+", 
     RowBox[{
      FractionBox["1", "3"], " ", 
      RowBox[{"(", 
       RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], " ", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"\[Beta]", " ", 
         RowBox[{"(", 
          RowBox[{"3", "+", 
           SuperscriptBox["\[Alpha]", "2"], "+", 
           RowBox[{"\[Beta]", " ", 
            RowBox[{"(", 
             RowBox[{"3", "+", "\[Beta]"}], ")"}]}], "-", 
           RowBox[{"\[Alpha]", " ", 
            RowBox[{"(", 
             RowBox[{"3", "+", 
              RowBox[{"2", " ", "\[Beta]"}]}], ")"}]}]}], ")"}]}], "-", 
        RowBox[{
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], "2"], " ", 
         "\[Gamma]"}]}], ")"}], " ", "t"}]}], ",", 
    RowBox[{"{", 
     RowBox[{"t", ",", "0", ",", "2"}], "}"}]}], "]"}], "//", 
  "FullSimplify"}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   FractionBox["2", "3"], " ", 
   RowBox[{"(", 
    RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], " ", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"\[Beta]", " ", 
      RowBox[{"(", 
       RowBox[{"3", "+", 
        SuperscriptBox["\[Alpha]", "2"], "+", 
        RowBox[{"\[Beta]", " ", 
         RowBox[{"(", 
          RowBox[{"3", "+", "\[Beta]"}], ")"}]}], "-", 
        RowBox[{"\[Alpha]", " ", 
         RowBox[{"(", 
          RowBox[{"3", "+", 
           RowBox[{"2", " ", "\[Beta]"}]}], ")"}]}]}], ")"}]}], "-", 
     RowBox[{
      SuperscriptBox[
       RowBox[{"(", 
        RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], "2"], " ", 
      "\[Gamma]"}]}], ")"}]}], "+", 
  FractionBox[
   RowBox[{
    RowBox[{"(", 
     RowBox[{"1", "-", 
      SuperscriptBox["\[ExponentialE]", 
       RowBox[{
        RowBox[{"-", "2"}], " ", 
        RowBox[{"(", 
         RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}]}]]}], ")"}], " ", 
    RowBox[{"(", 
     RowBox[{
      SuperscriptBox["\[Beta]", "2"], "+", 
      RowBox[{"\[Alpha]", " ", "\[Gamma]"}], "-", 
      RowBox[{"\[Beta]", " ", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"-", "1"}], "+", "\[Alpha]", "+", "\[Gamma]"}], ")"}]}]}], 
     ")"}]}], 
   RowBox[{"\[Alpha]", "+", "\[Beta]"}]]}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{
    FractionBox["2", "3"], " ", 
    RowBox[{"(", 
     RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"\[Beta]", " ", 
       RowBox[{"(", 
        RowBox[{"3", "+", 
         SuperscriptBox["\[Alpha]", "2"], "+", 
         RowBox[{"\[Beta]", " ", 
          RowBox[{"(", 
           RowBox[{"3", "+", "\[Beta]"}], ")"}]}], "-", 
         RowBox[{"\[Alpha]", " ", 
          RowBox[{"(", 
           RowBox[{"3", "+", 
            RowBox[{"2", " ", "\[Beta]"}]}], ")"}]}]}], ")"}]}], "-", 
      RowBox[{
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], "2"], " ", 
       "\[Gamma]"}]}], ")"}]}], "+", 
   FractionBox[
    RowBox[{
     RowBox[{"(", 
      RowBox[{"1", "-", 
       SuperscriptBox["\[ExponentialE]", 
        RowBox[{
         RowBox[{"-", "2"}], " ", 
         RowBox[{"(", 
          RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}]}]]}], ")"}], " ", 
     RowBox[{"(", 
      RowBox[{
       SuperscriptBox["\[Beta]", "2"], "+", 
       RowBox[{"\[Alpha]", " ", "\[Gamma]"}], "-", 
       RowBox[{"\[Beta]", " ", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{"-", "1"}], "+", "\[Alpha]", "+", "\[Gamma]"}], ")"}]}]}], 
      ")"}]}], 
    RowBox[{"\[Alpha]", "+", "\[Beta]"}]]}], "/.", 
  RowBox[{"{", 
   RowBox[{
    RowBox[{"\[Alpha]", "\[Rule]", "500"}], ",", 
    RowBox[{"\[Beta]", "\[Rule]", "300"}], ",", 
    RowBox[{"\[Gamma]", "\[Rule]", "450."}]}], "}"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"-", "8.23879962125`*^8"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Series", "[", 
  RowBox[{
   RowBox[{
    RowBox[{"Exp", "[", 
     RowBox[{
      RowBox[{"-", 
       RowBox[{"(", 
        RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}]}], 
      RowBox[{"(", 
       RowBox[{"1", "+", 
        RowBox[{"Cos", "[", "\[Phi]", "]"}]}], ")"}]}], "]"}], 
    RowBox[{"(", 
     RowBox[{
      RowBox[{
       RowBox[{"(", 
        RowBox[{"\[Gamma]", "+", 
         RowBox[{"\[Beta]", " ", 
          RowBox[{"Cos", "[", "\[Phi]", "]"}]}]}], ")"}], 
       RowBox[{"Sin", "[", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], 
         RowBox[{"Sin", "[", "\[Phi]", "]"}]}], "]"}]}], "+", 
      RowBox[{"\[Beta]", " ", 
       RowBox[{"Sin", "[", "\[Phi]", "]"}], 
       RowBox[{"Cos", "[", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], 
         RowBox[{"Sin", "[", "\[Phi]", "]"}]}], "]"}]}]}], ")"}]}], ",", 
   RowBox[{"{", 
    RowBox[{"\[Phi]", ",", "\[Pi]", ",", "3"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 InterpretationBox[
  RowBox[{
   RowBox[{
    RowBox[{"(", 
     RowBox[{
      RowBox[{"-", "\[Beta]"}], "+", 
      RowBox[{
       RowBox[{"(", 
        RowBox[{
         RowBox[{"-", "\[Alpha]"}], "+", "\[Beta]"}], ")"}], " ", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"-", "\[Beta]"}], "+", "\[Gamma]"}], ")"}]}]}], ")"}], " ", 
    RowBox[{"(", 
     RowBox[{"\[Phi]", "-", "\[Pi]"}], ")"}]}], "+", 
   RowBox[{
    RowBox[{"(", 
     RowBox[{
      RowBox[{
       FractionBox["1", "2"], " ", "\[Beta]", " ", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"-", "\[Alpha]"}], "+", "\[Beta]"}], ")"}]}], "+", 
      RowBox[{
       FractionBox["1", "6"], " ", 
       RowBox[{"(", 
        RowBox[{"\[Beta]", "+", 
         RowBox[{"3", " ", 
          SuperscriptBox["\[Alpha]", "2"], " ", "\[Beta]"}], "-", 
         RowBox[{"6", " ", "\[Alpha]", " ", 
          SuperscriptBox["\[Beta]", "2"]}], "+", 
         RowBox[{"3", " ", 
          SuperscriptBox["\[Beta]", "3"]}]}], ")"}]}], "+", 
      RowBox[{
       RowBox[{"(", 
        RowBox[{
         FractionBox[
          RowBox[{"\[Alpha]", "-", "\[Beta]"}], "6"], "-", 
         RowBox[{
          FractionBox["1", "6"], " ", 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "\[Alpha]"}], "+", "\[Beta]"}], ")"}], "3"]}]}], 
        ")"}], " ", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"-", "\[Beta]"}], "+", "\[Gamma]"}], ")"}]}], "+", 
      RowBox[{
       RowBox[{"(", 
        RowBox[{
         RowBox[{"-", 
          FractionBox["\[Alpha]", "2"]}], "-", 
         FractionBox["\[Beta]", "2"]}], ")"}], " ", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"-", "\[Beta]"}], "+", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "\[Alpha]"}], "+", "\[Beta]"}], ")"}], " ", 
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "\[Beta]"}], "+", "\[Gamma]"}], ")"}]}]}], ")"}]}]}],
      ")"}], " ", 
    SuperscriptBox[
     RowBox[{"(", 
      RowBox[{"\[Phi]", "-", "\[Pi]"}], ")"}], "3"]}], "+", 
   InterpretationBox[
    SuperscriptBox[
     RowBox[{"O", "[", 
      RowBox[{"\[Phi]", "-", "\[Pi]"}], "]"}], "4"],
    SeriesData[$CellContext`\[Phi], Pi, {}, 1, 4, 1],
    Editable->False]}],
  SeriesData[$CellContext`\[Phi], 
   Pi, {-$CellContext`\[Beta] + (-$CellContext`\[Alpha] + \
$CellContext`\[Beta]) (-$CellContext`\[Beta] + $CellContext`\[Gamma]), 
    0, (Rational[
       1, 2] $CellContext`\[Beta]) (-$CellContext`\[Alpha] + $CellContext`\
\[Beta]) + Rational[
      1, 6] ($CellContext`\[Beta] + (
        3 $CellContext`\[Alpha]^2) $CellContext`\[Beta] - (
       6 $CellContext`\[Alpha]) $CellContext`\[Beta]^2 + 
      3 $CellContext`\[Beta]^3) + (
      Rational[1, 6] ($CellContext`\[Alpha] - $CellContext`\[Beta]) + 
      Rational[-1, 
         6] (-$CellContext`\[Alpha] + $CellContext`\[Beta])^3) \
(-$CellContext`\[Beta] + $CellContext`\[Gamma]) + (
      Rational[-1, 2] $CellContext`\[Alpha] + 
      Rational[-1, 
         2] $CellContext`\[Beta]) (-$CellContext`\[Beta] + (-$CellContext`\
\[Alpha] + $CellContext`\[Beta]) (-$CellContext`\[Beta] + $CellContext`\
\[Gamma]))}, 1, 4, 1],
  Editable->False]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"With", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"\[Alpha]", "=", "500"}], ",", 
     RowBox[{"\[Beta]", "=", "300"}], ",", 
     RowBox[{"\[Gamma]", "=", "450"}]}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{"Plot", "[", 
    RowBox[{
     RowBox[{"{", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{
        RowBox[{"Exp", "[", 
         RowBox[{
          RowBox[{"-", 
           RowBox[{"(", 
            RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}]}], 
          RowBox[{"(", 
           RowBox[{"1", "+", 
            RowBox[{"Cos", "[", "\[Phi]", "]"}]}], ")"}]}], "]"}], 
        RowBox[{"(", 
         RowBox[{
          RowBox[{
           RowBox[{"(", 
            RowBox[{"\[Gamma]", "+", 
             RowBox[{"\[Beta]", " ", 
              RowBox[{"Cos", "[", "\[Phi]", "]"}]}]}], ")"}], 
           RowBox[{"Sin", "[", 
            RowBox[{
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], 
             RowBox[{"Sin", "[", "\[Phi]", "]"}]}], "]"}]}], "+", 
          RowBox[{"\[Beta]", " ", 
           RowBox[{"Sin", "[", "\[Phi]", "]"}], 
           RowBox[{"Cos", "[", 
            RowBox[{
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], 
             RowBox[{"Sin", "[", "\[Phi]", "]"}]}], "]"}]}]}], ")"}]}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"Exp", "[", 
         RowBox[{
          RowBox[{"-", 
           RowBox[{"(", 
            RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}]}], 
          FractionBox["1", "2"], " ", 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{"\[Phi]", "-", "\[Pi]"}], ")"}], "2"]}], "]"}], 
        RowBox[{"(", 
         RowBox[{
          RowBox[{
           RowBox[{"(", 
            RowBox[{"\[Gamma]", "+", 
             RowBox[{"\[Beta]", " ", 
              RowBox[{"Cos", "[", "\[Phi]", "]"}]}]}], ")"}], 
           RowBox[{"Sin", "[", 
            RowBox[{
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], 
             RowBox[{"(", 
              RowBox[{"\[Pi]", "-", "\[Phi]"}], ")"}]}], "]"}]}], "+", 
          RowBox[{"\[Beta]", " ", 
           RowBox[{"Sin", "[", "\[Phi]", "]"}], 
           RowBox[{"Cos", "[", 
            RowBox[{
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], 
             RowBox[{"(", 
              RowBox[{"\[Pi]", "-", "\[Phi]"}], ")"}]}], "]"}]}]}], ")"}]}], 
       ",", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"Exp", "[", 
         RowBox[{
          RowBox[{"-", 
           RowBox[{"(", 
            RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}]}], 
          FractionBox["1", "2"], " ", 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{"\[Phi]", "-", "\[Pi]"}], ")"}], "2"]}], "]"}], 
        RowBox[{"(", 
         RowBox[{
          RowBox[{
           RowBox[{"(", 
            RowBox[{"\[Gamma]", "-", "\[Beta]"}], " ", ")"}], 
           RowBox[{"Sin", "[", 
            RowBox[{
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], 
             RowBox[{"(", 
              RowBox[{"\[Pi]", "-", "\[Phi]"}], ")"}]}], "]"}]}], " ", "-", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{"\[Phi]", "-", "\[Pi]"}], ")"}], "\[Beta]", " ", 
           RowBox[{"Cos", "[", 
            RowBox[{
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], 
             RowBox[{"(", 
              RowBox[{"\[Pi]", "-", "\[Phi]"}], ")"}]}], "]"}]}]}], ")"}]}]}],
       "\[IndentingNewLine]", "}"}], ",", "\[IndentingNewLine]", 
     RowBox[{"{", 
      RowBox[{"\[Phi]", ",", "0", ",", "\[Pi]"}], "}"}], ",", 
     "\[IndentingNewLine]", 
     RowBox[{"PlotRange", "\[Rule]", "All"}], ",", "\[IndentingNewLine]", 
     RowBox[{"PlotLegends", "\[Rule]", "Automatic"}], ",", 
     "\[IndentingNewLine]", 
     RowBox[{"PlotStyle", "\[Rule]", "Thick"}]}], "\[IndentingNewLine]", 
    "]"}]}], "\[IndentingNewLine]", "]"}]], "Input"],

Cell[BoxData[
 TemplateBox[{GraphicsBox[{{{}, {}, {
       Directive[
        Opacity[1.], 
        RGBColor[0.368417, 0.506779, 0.709798], 
        AbsoluteThickness[1.6], 
        Thickness[Large]], 
       LineBox[CompressedData["
1:eJxFlXk0VX/U/43nnEsKZcqQKXOZlbj37AyVeYiSKSSSJJEGvhIShUyRKZUM
ZUqmyp1kikpCisyZCmUWief+1vo9nvPPWa+1Putz9nu/33sfCTdf69MsTExM
4cxMTP/vzUrjaP2u6Udi+v+POL+4jFiSBf6/vNgXb96deHKTBw82D1cl+m7y
Z//RotzE65vcFjPPk5V4d5PN0q7V30/M3uSYXdSslMTSTf65jGwc9Kdv8v5/
CZblF95ucnO/XTiLVNsmg57N3zy3zk22v2A0U3ni6yZTJRTC6Lm9m2xzXyGn
7/zgJguzU/TjPYY3+ZZ6wwt61MgmGx42dsmLHNvkhugFmYhrE/9Xb+wO8sD9
n5vserns7kzi1Cb/J1mver361ybvXf9vicVrZpObnOzmxd1nN1n1gc+X/wLm
NtnAqta+8uL8JiuOWjQoRi5s8kVuP90HyYubfKqkzXoyfmmTZfZ4W15+vLzJ
SWIG032P/myyS35pCmSubDITzzHZ4cJV/MuOpNtvmZhCjaYPHHd++hfHZx3j
P3gnhbs/sz8vRF7DJyiZijfZfbGh9S2Jbc3/8O+tU9N+55hikcZ/Nm4N6/h8
g41eqC1HwoaP/IZa1wa+68JoL5fHcz7LeiNp37NMoC6m3CqcUyVkJXrko944
EyR0/LaY57wpSh77Pl15nhncwjzKo3njJIJ+iDnyTzNDmp3Fg8wOwu4cx2Ui
fyALFAUuFsxGNheIE3x9WZdYQJftV7Q8nV3JnFkl/7w/K/Spf+0I4FktGfWK
s776lxW6iuPvXwplUmvjjDHzu8YGam9ejqcMRFTsFpMlY2zsEI0VzktK81Ur
BHOqit1hB1eu229MJA+8ith+d1GcgEAXcXfks1xMJyfVN0SfEwGdKq56IW2C
zhthS9SDC4Etsh4KNonsOkzSPEKFPAjkVq+UJC0tvQ7WSNLV3InAh7mp7awb
hjWXbFPDjRQRQDWm/14RCarxSM3muWiGQF6J1z32nHGdm8Kh6ckWCLCNlO/M
WB7XeZLtIlVthUBs5H3l3twRneF8Cc01WwS07AaTrvO/q3F+mWMX6YzAMVxk
vZ4kTj7WnZ+d7ouAG+fNslg7S/Ilpyg5ih8Cc2qPWQ+pWZKTh86UDfgjYPae
/EpwyZjc/kO+TvoKAsHhb4XDvPfpmq8WjpWEIhCS3W/JOx+h6xMS4/spDAHL
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
6jyJ/w/n3XMM
        "]]}, {
       Directive[
        Opacity[1.], 
        RGBColor[0.880722, 0.611041, 0.142051], 
        AbsoluteThickness[1.6], 
        Thickness[Large]], 
       LineBox[CompressedData["
1:eJxFlXk4VW/U/k+GvfcJhRSlzDORuXKGVUTKmHkeEqkkQyokUTJlSuYxQkgy
V2cyfzWaIoVKUYQoM/E773X9Xu/+Z1+faz/P3s+6173uLerqfeoMCw6HC9uC
w/3PnZW+9e03dR8S7v9fIrtEpITuGZP/l+eHEowGkpw2+cuRjpG6JO9Nfu83
Wv4w6cYmd8b+5clOit9kw/TAlrSk3E2OFaZlpyQ92eSJRWTjiB9jkw/+SzSp
vvTfJncMW4eziHduMhw1Xy1y7d1k20v6M7U2HzaZJioXxng4uMnmaXIFQxe/
bLIgO1U7wX1kk++otlYxIr9v8jG9E85FEWOb3Bo1J3Ur8Of/nfcuH+Vz2sQm
u1x5Gj+TNLnJ18ValG/UT2+y4vr1BRbPmU1ud7D+K+I2u8nKOV791/3/bLKO
aaNtre/fTZYfNW6Vj5jbZF9uH0JO8vwmn67oPPUrYWGTpfafN7nyYHGT7wnp
TA3lL22yc/GTFMha3mQcj6X0SNnKJutPHbZyfLS6yW6lthd3U9bIpeV3RPlx
uNCv65xJnR3/yHtcGnuyct1uI23/zF1b18nIvbNlNeuj0RteshsqfRtkdj69
dVl6foJJi76E9zkctAsdrpbcVnTfdN/xd0d/4ODLMM3dzON4BmXs21TtxS1g
v7q/YP4RV27QuJD9rqkt4CJ61dXRX7mgwH6RuCuABQgyvIFblOyLRfDe3qwL
LMAVtSAVbbpcarTlQPFFP1YQJf11uy5wpGLUM+7UtVVWGApI4Zuu9n3ayRFr
6BPIBlrPppsS41VqJIWkKRgbOzSqHBa3qivSkAvmUBaKYYfPzuWBLq9EDt3a
ET8vgkeAj3RhdSn1z+GCVO8QbQ4EZO1+VK7zbtFqEjRB3bkQOJ+1XeakHacW
ToJndxkPAiUhtOzrsiJawWr3COp7EAg14ydNRmtqXbZIDdeXR4A0xXIstNLr
hXtqLo+vIQKxHz+fylf5qnVbMDQj2RiBQPpBjQ/r41qFuc7i9aYIuPS2GJnm
/NEaKRZVX7NA4NCMxUnRXBzBsaHAOsKR+VyeQPyvYivBcqA4N8MbgfecmX09
PYaUyw6RMlQfBBohUUdxpwUl+evZp5/9EDBW7co9521P6R6XbZa4isDcSXXb
29HuFKOVsrGKUATITmociIc7xSsk1rsrDAFf7L3L+cFTlFgWr6W/txDI84W9
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
AMpaj06uiuLhfKlu0O5eJ/L/A0krZcM=
        "]]}, {
       Directive[
        Opacity[1.], 
        RGBColor[0.560181, 0.691569, 0.194885], 
        AbsoluteThickness[1.6], 
        Thickness[Large]], 
       LineBox[CompressedData["
1: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
6nfC/we/1Eyj
        "]]}}}, {
    DisplayFunction -> Identity, AspectRatio -> 
     NCache[GoldenRatio^(-1), 0.6180339887498948], Axes -> {True, True}, 
     AxesLabel -> {None, None}, AxesOrigin -> {0, 0}, DisplayFunction :> 
     Identity, Frame -> {{False, False}, {False, False}}, 
     FrameLabel -> {{None, None}, {None, None}}, 
     FrameTicks -> {{Automatic, Automatic}, {Automatic, Automatic}}, 
     GridLines -> {None, None}, GridLinesStyle -> Directive[
       GrayLevel[0.5, 0.4]], 
     Method -> {
      "DefaultBoundaryStyle" -> Automatic, "ScalingFunctions" -> None}, 
     PlotRange -> {All, All}, PlotRangeClipping -> True, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.05], 
        Scaled[0.05]}}, Ticks -> {Automatic, Automatic}}],FormBox[
    FormBox[
     TemplateBox[{
       TagBox[
        FrameBox[
         StyleBox["1", Smaller, StripOnInput -> False]], "Placeholder"], 
       TagBox[
        FrameBox[
         StyleBox["2", Smaller, StripOnInput -> False]], "Placeholder"], 
       TagBox[
        FrameBox[
         StyleBox["3", Smaller, StripOnInput -> False]], "Placeholder"]}, 
      "LineLegend", DisplayFunction -> (FormBox[
        StyleBox[
         StyleBox[
          PaneBox[
           TagBox[
            GridBox[{{
               TagBox[
                GridBox[{{
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.5], 
                    Opacity[1.], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6], 
                    Thickness[Large]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.5], 
                    Opacity[1.], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6], 
                    Thickness[Large]], {}}}, AspectRatio -> Full, 
                    ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.5], 
                    Opacity[1.], 
                    RGBColor[0.880722, 0.611041, 0.142051], 
                    AbsoluteThickness[1.6], 
                    Thickness[Large]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.5], 
                    Opacity[1.], 
                    RGBColor[0.880722, 0.611041, 0.142051], 
                    AbsoluteThickness[1.6], 
                    Thickness[Large]], {}}}, AspectRatio -> Full, 
                    ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #2}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.5], 
                    Opacity[1.], 
                    RGBColor[0.560181, 0.691569, 0.194885], 
                    AbsoluteThickness[1.6], 
                    Thickness[Large]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.5], 
                    Opacity[1.], 
                    RGBColor[0.560181, 0.691569, 0.194885], 
                    AbsoluteThickness[1.6], 
                    Thickness[Large]], {}}}, AspectRatio -> Full, 
                    ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #3}}, 
                 GridBoxAlignment -> {
                  "Columns" -> {Center, Left}, "Rows" -> {{Baseline}}}, 
                 AutoDelete -> False, 
                 GridBoxDividers -> {
                  "Columns" -> {{False}}, "Rows" -> {{False}}}, 
                 GridBoxItemSize -> {"Columns" -> {{All}}, "Rows" -> {{All}}},
                  GridBoxSpacings -> {
                  "Columns" -> {{0.5}}, "Rows" -> {{0.8}}}], "Grid"]}}, 
             GridBoxAlignment -> {"Columns" -> {{Left}}, "Rows" -> {{Top}}}, 
             AutoDelete -> False, 
             GridBoxItemSize -> {
              "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
             GridBoxSpacings -> {"Columns" -> {{1}}, "Rows" -> {{0}}}], 
            "Grid"], Alignment -> Left, AppearanceElements -> None, 
           ImageMargins -> {{5, 5}, {5, 5}}, ImageSizeAction -> 
           "ResizeToFit"], LineIndent -> 0, StripOnInput -> False], {
         FontFamily -> "Arial"}, Background -> Automatic, StripOnInput -> 
         False], TraditionalForm]& ), 
      InterpretationFunction :> (RowBox[{"LineLegend", "[", 
         RowBox[{
           RowBox[{"{", 
             RowBox[{
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"Opacity", "[", "1.`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    RowBox[{
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> 
                    RGBColor[
                    0.24561133333333335`, 0.3378526666666667, 
                    0.4731986666666667], FrameTicks -> None, PlotRangePadding -> 
                    None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], "\[InvisibleSpace]"}], 
                    "RGBColor[0.368417, 0.506779, 0.709798]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0.368417, 0.506779, 0.709798]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0.368417, 0.506779, 0.709798], Editable -> False,
                     Selectable -> False], ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   RowBox[{"Thickness", "[", "Large", "]"}]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"Opacity", "[", "1.`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    RowBox[{
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0.880722, 0.611041, 0.142051], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> 
                    RGBColor[
                    0.587148, 0.40736066666666665`, 0.09470066666666668], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], "\[InvisibleSpace]"}], 
                    "RGBColor[0.880722, 0.611041, 0.142051]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0.880722, 0.611041, 0.142051]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0.880722, 0.611041, 0.142051], Editable -> False,
                     Selectable -> False], ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   RowBox[{"Thickness", "[", "Large", "]"}]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"Opacity", "[", "1.`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    RowBox[{
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0.560181, 0.691569, 0.194885], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> 
                    RGBColor[
                    0.37345400000000006`, 0.461046, 0.12992333333333334`], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], "\[InvisibleSpace]"}], 
                    "RGBColor[0.560181, 0.691569, 0.194885]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0.560181, 0.691569, 0.194885]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0.560181, 0.691569, 0.194885], Editable -> False,
                     Selectable -> False], ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   RowBox[{"Thickness", "[", "Large", "]"}]}], "]"}]}], "}"}],
            ",", 
           RowBox[{"{", 
             RowBox[{
               TagBox[#, HoldForm], ",", 
               TagBox[#2, HoldForm], ",", 
               TagBox[#3, HoldForm]}], "}"}], ",", 
           RowBox[{"LegendMarkers", "\[Rule]", "None"}], ",", 
           RowBox[{"LabelStyle", "\[Rule]", 
             RowBox[{"{", "}"}]}], ",", 
           RowBox[{"LegendLayout", "\[Rule]", "\"Column\""}]}], "]"}]& ), 
      Editable -> True], TraditionalForm], TraditionalForm]},
  "Legended",
  DisplayFunction->(GridBox[{{
      TagBox[
       ItemBox[
        PaneBox[
         TagBox[#, "SkipImageSizeLevel"], Alignment -> {Center, Baseline}, 
         BaselinePosition -> Baseline], DefaultBaseStyle -> "Labeled"], 
       "SkipImageSizeLevel"], 
      ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
    GridBoxAlignment -> {"Columns" -> {{Center}}, "Rows" -> {{Center}}}, 
    AutoDelete -> False, GridBoxItemSize -> Automatic, 
    BaselinePosition -> {1, 1}]& ),
  Editable->True,
  InterpretationFunction->(RowBox[{"Legended", "[", 
     RowBox[{#, ",", 
       RowBox[{"Placed", "[", 
         RowBox[{#2, ",", "After"}], "]"}]}], "]"}]& )]], "Output"]
}, Open  ]],

Cell[BoxData[{
 RowBox[{"\[Theta]", "=", 
  RowBox[{"\[Phi]", "-", "\[Pi]"}]}], "\[IndentingNewLine]", 
 RowBox[{"d\[Theta]", "=", "d\[Phi]"}]}], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Plot", "[", 
  RowBox[{
   RowBox[{
    RowBox[{
     RowBox[{"Exp", "[", 
      RowBox[{
       RowBox[{"-", 
        RowBox[{"(", 
         RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}]}], 
       FractionBox["1", "2"], " ", 
       SuperscriptBox["\[Theta]", "2"]}], "]"}], 
     RowBox[{"(", 
      RowBox[{
       RowBox[{
        RowBox[{"-", 
         RowBox[{"(", 
          RowBox[{"\[Gamma]", "-", "\[Beta]"}], " ", ")"}]}], 
        RowBox[{"Sin", "[", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], "\[Theta]"}], "]"}]}],
        " ", "-", 
       RowBox[{"\[Theta]", " ", "\[Beta]", " ", 
        RowBox[{"Cos", "[", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], "\[Theta]"}], 
         "]"}]}]}], ")"}]}], "/.", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"\[Epsilon]", "\[Rule]", "0"}], ",", 
      RowBox[{"\[Alpha]", "\[Rule]", "500"}], ",", 
      RowBox[{"\[Beta]", "\[Rule]", "300."}], ",", 
      RowBox[{"\[Gamma]", "\[Rule]", "450"}]}], "}"}]}], ",", 
   RowBox[{"{", 
    RowBox[{"\[Theta]", ",", 
     RowBox[{"-", ".1415"}], ",", "0"}], "}"}], ",", 
   RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{}, {}, 
   {RGBColor[0.368417, 0.506779, 0.709798], AbsoluteThickness[1.6], Opacity[
    1.], LineBox[CompressedData["
1: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
duq0qM90GdOYm9Sj/R9o29Y/
     "]]}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{None, None},
  AxesOrigin->{0, 0},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{"DefaultBoundaryStyle" -> Automatic, "ScalingFunctions" -> None},
  PlotRange->{All, All},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.05], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"NIntegrate", "[", 
   RowBox[{
    RowBox[{
     RowBox[{
      RowBox[{"Exp", "[", 
       RowBox[{
        RowBox[{"-", 
         RowBox[{"(", 
          RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}]}], 
        FractionBox["1", "2"], " ", 
        SuperscriptBox[
         RowBox[{"(", 
          RowBox[{"\[Phi]", "-", "\[Pi]"}], ")"}], "2"]}], "]"}], 
      RowBox[{"(", 
       RowBox[{
        RowBox[{
         RowBox[{"(", 
          RowBox[{"\[Gamma]", "-", "\[Beta]"}], " ", ")"}], 
         RowBox[{"Sin", "[", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], 
           RowBox[{"(", 
            RowBox[{"\[Pi]", "-", "\[Phi]"}], ")"}]}], "]"}]}], " ", "-", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{"\[Phi]", "-", "\[Pi]"}], ")"}], "\[Beta]", " ", 
         RowBox[{"Cos", "[", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], 
           RowBox[{"(", 
            RowBox[{"\[Pi]", "-", "\[Phi]"}], ")"}]}], "]"}]}]}], ")"}]}], "/.", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"\[Alpha]", "\[Rule]", "500"}], ",", 
       RowBox[{"\[Beta]", "\[Rule]", "300"}], ",", 
       RowBox[{"\[Gamma]", "\[Rule]", "450"}]}], "}"}]}], ",", 
    RowBox[{"{", 
     RowBox[{"\[Phi]", ",", "0", ",", "\[Pi]"}], "}"}]}], "]"}], "-", 
  ".75"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"NIntegrate", "[", 
   RowBox[{
    RowBox[{
     RowBox[{
      RowBox[{"Exp", "[", 
       RowBox[{
        RowBox[{"-", 
         RowBox[{"(", 
          RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}]}], 
        FractionBox["1", "2"], " ", 
        SuperscriptBox["\[Theta]", "2"]}], "]"}], 
      RowBox[{"(", 
       RowBox[{
        RowBox[{
         RowBox[{"-", 
          RowBox[{"(", 
           RowBox[{"\[Gamma]", "-", "\[Beta]"}], " ", ")"}]}], 
         RowBox[{"Sin", "[", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], "\[Theta]"}], 
          "]"}]}], " ", "-", 
        RowBox[{"\[Theta]", " ", "\[Beta]", " ", 
         RowBox[{"Cos", "[", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], "\[Theta]"}], 
          "]"}]}]}], ")"}]}], "/.", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"\[Alpha]", "\[Rule]", "500"}], ",", 
       RowBox[{"\[Beta]", "\[Rule]", "300"}], ",", 
       RowBox[{"\[Gamma]", "\[Rule]", "450"}]}], "}"}]}], ",", 
    RowBox[{"{", 
     RowBox[{"\[Theta]", ",", 
      RowBox[{"-", "\[Infinity]"}], ",", "0"}], "}"}]}], "]"}], "-", 
  ".75"}]}], "Input"],

Cell[BoxData["0.008002777228051872`"], "Output"],

Cell[BoxData["0.008002779091020429`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"bias", "[", ".75", "]"}]], "Input"],

Cell[BoxData["0.008159963036875828`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"Integrate", "[", 
   RowBox[{
    RowBox[{
     RowBox[{"Exp", "[", 
      RowBox[{
       RowBox[{"-", 
        RowBox[{"(", 
         RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}]}], 
       FractionBox["1", "2"], " ", 
       SuperscriptBox["\[Theta]", "2"]}], "]"}], 
     RowBox[{"(", 
      RowBox[{
       RowBox[{
        RowBox[{"-", 
         RowBox[{"(", 
          RowBox[{"\[Gamma]", "-", "\[Beta]"}], " ", ")"}]}], 
        RowBox[{"Sin", "[", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], "\[Theta]"}], "]"}]}],
        " ", "-", 
       RowBox[{"\[Theta]", " ", "\[Beta]", " ", 
        RowBox[{"Cos", "[", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], "\[Theta]"}], 
         "]"}]}]}], ")"}]}], ",", 
    RowBox[{"{", 
     RowBox[{"\[Theta]", ",", 
      RowBox[{"-", "\[Infinity]"}], ",", "0"}], "}"}]}], "]"}], "//", 
  "FullSimplify"}]], "Input"],

Cell[BoxData[
 FractionBox[
  RowBox[{
   RowBox[{"\[Beta]", " ", 
    SqrtBox[
     RowBox[{"\[Alpha]", "+", "\[Beta]"}]]}], "+", 
   RowBox[{
    SqrtBox["2"], " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{
       RowBox[{"-", "2"}], " ", "\[Alpha]", " ", "\[Beta]"}], "+", 
      RowBox[{
       RowBox[{"(", 
        RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}], " ", "\[Gamma]"}]}], 
     ")"}], " ", 
    RowBox[{"DawsonF", "[", 
     FractionBox[
      RowBox[{"\[Alpha]", "-", "\[Beta]"}], 
      RowBox[{
       SqrtBox["2"], " ", 
       SqrtBox[
        RowBox[{"\[Alpha]", "+", "\[Beta]"}]]}]], "]"}]}]}], 
  SuperscriptBox[
   RowBox[{"(", 
    RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}], 
   RowBox[{"3", "/", "2"}]]]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{
    RowBox[{"(", 
     RowBox[{"p", "-", 
      RowBox[{"\[Beta]", "/", 
       RowBox[{"(", 
        RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}]}]}], ")"}], " ", 
    RowBox[{"Sqrt", "[", "2", "]"}], 
    FractionBox[
     RowBox[{"\[Alpha]", "-", "\[Beta]"}], 
     RowBox[{"Sqrt", "[", 
      RowBox[{"\[Alpha]", "+", "\[Beta]"}], "]"}]], 
    RowBox[{"DawsonF", "[", 
     FractionBox[
      RowBox[{"\[Alpha]", "-", "\[Beta]"}], 
      RowBox[{
       SqrtBox["2"], " ", 
       SqrtBox[
        RowBox[{"\[Alpha]", "+", "\[Beta]"}]]}]], "]"}]}], "-", 
   FractionBox[
    RowBox[{
     RowBox[{"\[Beta]", " ", 
      SqrtBox[
       RowBox[{"\[Alpha]", "+", "\[Beta]"}]]}], "+", 
     RowBox[{
      SqrtBox["2"], " ", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{
         RowBox[{"-", "2"}], " ", "\[Alpha]", " ", "\[Beta]"}], "+", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}], " ", "\[Gamma]"}]}], 
       ")"}], " ", 
      RowBox[{"DawsonF", "[", 
       FractionBox[
        RowBox[{"\[Alpha]", "-", "\[Beta]"}], 
        RowBox[{
         SqrtBox["2"], " ", 
         SqrtBox[
          RowBox[{"\[Alpha]", "+", "\[Beta]"}]]}]], "]"}]}]}], 
    SuperscriptBox[
     RowBox[{"(", 
      RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}], 
     RowBox[{"3", "/", "2"}]]]}], "//", "FullSimplify"}]], "Input"],

Cell[BoxData[
 FractionBox[
  RowBox[{
   RowBox[{
    RowBox[{"-", "\[Beta]"}], " ", 
    SqrtBox[
     RowBox[{"\[Alpha]", "+", "\[Beta]"}]]}], "+", 
   RowBox[{
    SqrtBox["2"], " ", 
    RowBox[{"(", 
     RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}], " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"p", " ", 
       RowBox[{"(", 
        RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]", "-", 
      "\[Gamma]"}], ")"}], " ", 
    RowBox[{"DawsonF", "[", 
     FractionBox[
      RowBox[{"\[Alpha]", "-", "\[Beta]"}], 
      RowBox[{
       SqrtBox["2"], " ", 
       SqrtBox[
        RowBox[{"\[Alpha]", "+", "\[Beta]"}]]}]], "]"}]}]}], 
  SuperscriptBox[
   RowBox[{"(", 
    RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}], 
   RowBox[{"3", "/", "2"}]]]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"bias", "[", 
   RowBox[{
    RowBox[{"p_", "?", "NumericQ"}], ",", "\[Alpha]_", ",", "\[Beta]_"}], 
   "]"}], ":=", 
  RowBox[{
   RowBox[{"NIntegrate", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"Exp", "[", 
       RowBox[{
        RowBox[{"-", 
         RowBox[{"(", 
          RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}]}], 
        RowBox[{"(", 
         RowBox[{"1", "+", 
          RowBox[{"Cos", "[", "\[Phi]", "]"}]}], ")"}]}], "]"}], 
      RowBox[{"(", 
       RowBox[{
        RowBox[{
         RowBox[{"(", 
          RowBox[{"\[Beta]", "+", 
           RowBox[{
            RowBox[{"(", 
             RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], "p"}], "+", 
           RowBox[{"\[Beta]", " ", 
            RowBox[{"Cos", "[", "\[Phi]", "]"}]}]}], ")"}], 
         RowBox[{"Sin", "[", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], 
           RowBox[{"Sin", "[", "\[Phi]", "]"}]}], "]"}]}], "+", 
        RowBox[{"\[Beta]", " ", 
         RowBox[{"Sin", "[", "\[Phi]", "]"}], 
         RowBox[{"Cos", "[", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], 
           RowBox[{"Sin", "[", "\[Phi]", "]"}]}], "]"}]}]}], ")"}]}], ",", 
     RowBox[{"{", 
      RowBox[{"\[Phi]", ",", "3", ",", "\[Pi]"}], "}"}]}], "]"}], "-", 
   "p"}]}]], "Input"],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"bias2", "[", 
    RowBox[{"p_", ",", "\[Alpha]_", ",", "\[Beta]_"}], "]"}], "=", 
   RowBox[{
    RowBox[{"N", "@", 
     RowBox[{
      FractionBox["1", 
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}], 
        RowBox[{"3", "/", "2"}]]], 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"\[Beta]", " ", 
         SqrtBox[
          RowBox[{"\[Alpha]", "+", "\[Beta]"}]]}], "+", 
        RowBox[{
         SqrtBox["2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{
            RowBox[{"-", "2"}], " ", "\[Alpha]", " ", "\[Beta]"}], "+", 
           RowBox[{
            RowBox[{"(", 
             RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}], " ", 
            RowBox[{"(", 
             RowBox[{"\[Beta]", "+", 
              RowBox[{
               RowBox[{"(", 
                RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], "p"}]}], 
             ")"}]}]}], ")"}], " ", 
         RowBox[{"DawsonF", "[", 
          FractionBox[
           RowBox[{"\[Alpha]", "-", "\[Beta]"}], 
           RowBox[{
            SqrtBox["2"], " ", 
            SqrtBox[
             RowBox[{"\[Alpha]", "+", "\[Beta]"}]]}]], "]"}]}]}], ")"}]}]}], 
    "-", "p"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"bias3", "[", 
    RowBox[{"p_", ",", "\[Alpha]_", ",", "\[Beta]_"}], "]"}], "=", 
   RowBox[{
    RowBox[{"N", "@", 
     RowBox[{"(", 
      RowBox[{"p", "-", 
       RowBox[{"\[Beta]", "/", 
        RowBox[{"(", 
         RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}]}]}], ")"}]}], " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{
       RowBox[{"Sqrt", "[", "2", "]"}], 
       FractionBox[
        RowBox[{"\[Alpha]", "-", "\[Beta]"}], 
        RowBox[{"Sqrt", "[", 
         RowBox[{"\[Alpha]", "+", "\[Beta]"}], "]"}]], 
       RowBox[{"DawsonF", "[", 
        FractionBox[
         RowBox[{"\[Alpha]", "-", "\[Beta]"}], 
         RowBox[{
          SqrtBox["2"], " ", 
          SqrtBox[
           RowBox[{"\[Alpha]", "+", "\[Beta]"}]]}]], "]"}]}], "-", "1"}], 
     ")"}]}]}], ";"}]}], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Limit", "[", 
  RowBox[{
   RowBox[{"Series", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"Sqrt", "[", "2", "]"}], "x", " ", 
      RowBox[{"DawsonF", "[", 
       RowBox[{"x", "/", 
        RowBox[{"Sqrt", "[", "2", "]"}]}], "]"}]}], ",", 
     RowBox[{"{", 
      RowBox[{"x", ",", "n", ",", "2"}], "}"}]}], "]"}], ",", 
   RowBox[{"n", "\[Rule]", "\[Infinity]"}]}], "]"}]], "Input"],

Cell[BoxData["1"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"Sqrt", "[", "2", "]"}], "x", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"(", 
      RowBox[{
       RowBox[{"1", "/", 
        RowBox[{"(", 
         RowBox[{"2", "x"}], ")"}]}], "+", 
       RowBox[{"1", "/", 
        RowBox[{"(", 
         RowBox[{"4", 
          SuperscriptBox["x", "3"]}], ")"}]}], "+", 
       RowBox[{"3", "/", 
        RowBox[{"(", 
         RowBox[{"8", 
          SuperscriptBox["x", "5"]}], ")"}]}]}], ")"}], "/.", 
     RowBox[{"x", "\[Rule]", 
      RowBox[{"x", "/", 
       RowBox[{"Sqrt", "[", "2", "]"}]}]}]}], ")"}]}], "//", 
  "Simplify"}]], "Input"],

Cell[BoxData[
 RowBox[{"1", "+", 
  FractionBox["3", 
   SuperscriptBox["x", "4"]], "+", 
  FractionBox["1", 
   SuperscriptBox["x", "2"]]}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Series", "[", 
  RowBox[{
   RowBox[{"1", "+", 
    RowBox[{"Cos", "[", "\[Phi]", "]"}]}], ",", 
   RowBox[{"{", 
    RowBox[{"\[Phi]", ",", "\[Pi]", ",", "4"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 InterpretationBox[
  RowBox[{
   RowBox[{
    FractionBox["1", "2"], " ", 
    SuperscriptBox[
     RowBox[{"(", 
      RowBox[{"\[Phi]", "-", "\[Pi]"}], ")"}], "2"]}], "-", 
   RowBox[{
    FractionBox["1", "24"], " ", 
    SuperscriptBox[
     RowBox[{"(", 
      RowBox[{"\[Phi]", "-", "\[Pi]"}], ")"}], "4"]}], "+", 
   InterpretationBox[
    SuperscriptBox[
     RowBox[{"O", "[", 
      RowBox[{"\[Phi]", "-", "\[Pi]"}], "]"}], "5"],
    SeriesData[$CellContext`\[Phi], Pi, {}, 2, 5, 1],
    Editable->False]}],
  SeriesData[$CellContext`\[Phi], Pi, {
    Rational[1, 2], 0, 
    Rational[-1, 24]}, 2, 5, 1],
  Editable->False]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Integrate", "[", 
  RowBox[{
   RowBox[{
    RowBox[{"-", "2"}], " ", "\[Gamma]", " ", 
    RowBox[{"Exp", "[", 
     RowBox[{
      RowBox[{"-", "\[Alpha]"}], "-", "\[Beta]", "+", 
      RowBox[{"2", 
       RowBox[{"Sqrt", "[", 
        RowBox[{"\[Alpha]", " ", "\[Beta]"}], "]"}]}]}], "]"}], 
    RowBox[{
     RowBox[{"Exp", "[", 
      RowBox[{
       RowBox[{"-", 
        RowBox[{"Sqrt", "[", 
         RowBox[{"\[Alpha]", " ", "\[Beta]"}], "]"}]}], 
       SuperscriptBox["t", "2"]}], "]"}], "/", "t"}]}], ",", 
   RowBox[{"{", 
    RowBox[{"t", ",", 
     RowBox[{"I", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"Sqrt", "@", 
         RowBox[{"Sqrt", "[", 
          RowBox[{"\[Alpha]", "/", "\[Beta]"}], "]"}]}], "+", 
        RowBox[{"Sqrt", "@", 
         RowBox[{"Sqrt", "[", 
          RowBox[{"\[Beta]", "/", "\[Alpha]"}], "]"}]}]}], ")"}]}], ",", 
     "\[Infinity]"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{
  SuperscriptBox["\[ExponentialE]", 
   RowBox[{
    RowBox[{"-", "\[Alpha]"}], "-", "\[Beta]", "+", 
    RowBox[{"2", " ", 
     SqrtBox[
      RowBox[{"\[Alpha]", " ", "\[Beta]"}]]}]}]], " ", "\[Gamma]", " ", 
  RowBox[{"(", 
   RowBox[{
    RowBox[{"\[ImaginaryI]", " ", "\[Pi]"}], "+", 
    RowBox[{"ExpIntegralEi", "[", 
     RowBox[{"\[Alpha]", "+", "\[Beta]", "+", 
      RowBox[{"2", " ", 
       SqrtBox[
        RowBox[{"\[Alpha]", " ", "\[Beta]"}]]}]}], "]"}]}], ")"}]}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Integrate", "[", 
  RowBox[{
   RowBox[{
    RowBox[{"-", 
     RowBox[{"Exp", "[", 
      RowBox[{
       RowBox[{"-", "\[Alpha]"}], "-", "\[Beta]"}], "]"}]}], 
    RowBox[{"Exp", "[", 
     RowBox[{
      RowBox[{"-", 
       RowBox[{"Sqrt", "[", 
        RowBox[{"\[Alpha]", " ", "\[Beta]"}], "]"}]}], "t"}], "]"}], 
    RowBox[{
     RowBox[{"Sqrt", "[", 
      RowBox[{"\[Alpha]", " ", "\[Beta]"}], "]"}], "/", "t"}]}], ",", 
   RowBox[{"{", 
    RowBox[{"t", ",", 
     RowBox[{"-", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"Sqrt", "[", 
         RowBox[{"\[Alpha]", "/", "\[Beta]"}], "]"}], "+", 
        RowBox[{"Sqrt", "[", 
         RowBox[{"\[Beta]", "/", "\[Alpha]"}], "]"}]}], ")"}]}], ",", 
     RowBox[{"I", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"Sqrt", "[", 
         RowBox[{"\[Alpha]", "/", "\[Beta]"}], "]"}], "+", 
        RowBox[{"Sqrt", "[", 
         RowBox[{"\[Beta]", "/", "\[Alpha]"}], "]"}]}], ")"}]}], ",", 
     RowBox[{"(", 
      RowBox[{
       RowBox[{"Sqrt", "[", 
        RowBox[{"\[Alpha]", "/", "\[Beta]"}], "]"}], "+", 
       RowBox[{"Sqrt", "[", 
        RowBox[{"\[Beta]", "/", "\[Alpha]"}], "]"}]}], ")"}], ",", 
     "\[Infinity]"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{
     RowBox[{"-", "\[Alpha]"}], "-", "\[Beta]"}]], " ", 
   SqrtBox[
    RowBox[{"\[Alpha]", " ", "\[Beta]"}]], " ", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"\[ImaginaryI]", " ", "\[Pi]"}], "-", 
     RowBox[{"ExpIntegralEi", "[", 
      RowBox[{
       RowBox[{"-", "\[Alpha]"}], "-", "\[Beta]"}], "]"}], "+", 
     RowBox[{"ExpIntegralEi", "[", 
      RowBox[{
       RowBox[{"-", "\[ImaginaryI]"}], " ", 
       RowBox[{"(", 
        RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}]}], "]"}]}], ")"}]}], "+", 
  
  RowBox[{
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{
     RowBox[{"-", "\[Alpha]"}], "-", "\[Beta]"}]], " ", 
   SqrtBox[
    RowBox[{"\[Alpha]", " ", "\[Beta]"}]], " ", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"-", 
      RowBox[{"ExpIntegralEi", "[", 
       RowBox[{
        RowBox[{"-", "\[ImaginaryI]"}], " ", 
        RowBox[{"(", 
         RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}]}], "]"}]}], "+", 
     RowBox[{"ExpIntegralEi", "[", 
      RowBox[{"\[Alpha]", "+", "\[Beta]"}], "]"}]}], ")"}]}], "-", 
  RowBox[{
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{
     RowBox[{"-", "\[Alpha]"}], "-", "\[Beta]"}]], " ", 
   SqrtBox[
    RowBox[{"\[Alpha]", " ", "\[Beta]"}]], " ", 
   RowBox[{"Gamma", "[", 
    RowBox[{"0", ",", 
     RowBox[{"\[Alpha]", "+", "\[Beta]"}]}], "]"}]}]}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "\[Alpha]"}], "-", "\[Beta]"}]], " ", 
    SqrtBox[
     RowBox[{"\[Alpha]", " ", "\[Beta]"}]], " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"\[ImaginaryI]", " ", "\[Pi]"}], "-", 
      RowBox[{"ExpIntegralEi", "[", 
       RowBox[{
        RowBox[{"-", "\[Alpha]"}], "-", "\[Beta]"}], "]"}], "+", 
      RowBox[{"ExpIntegralEi", "[", 
       RowBox[{
        RowBox[{"-", "\[ImaginaryI]"}], " ", 
        RowBox[{"(", 
         RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}]}], "]"}]}], ")"}]}], "+", 
   RowBox[{
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "\[Alpha]"}], "-", "\[Beta]"}]], " ", 
    SqrtBox[
     RowBox[{"\[Alpha]", " ", "\[Beta]"}]], " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"-", 
       RowBox[{"ExpIntegralEi", "[", 
        RowBox[{
         RowBox[{"-", "\[ImaginaryI]"}], " ", 
         RowBox[{"(", 
          RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}]}], "]"}]}], "+", 
      RowBox[{"ExpIntegralEi", "[", 
       RowBox[{"\[Alpha]", "+", "\[Beta]"}], "]"}]}], ")"}]}], "-", 
   RowBox[{
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "\[Alpha]"}], "-", "\[Beta]"}]], " ", 
    SqrtBox[
     RowBox[{"\[Alpha]", " ", "\[Beta]"}]], " ", 
    RowBox[{"Gamma", "[", 
     RowBox[{"0", ",", 
      RowBox[{"\[Alpha]", "+", "\[Beta]"}]}], "]"}]}]}], "//", 
  "FullSimplify"}]], "Input"],

Cell[BoxData[
 RowBox[{
  SuperscriptBox["\[ExponentialE]", 
   RowBox[{
    RowBox[{"-", "\[Alpha]"}], "-", "\[Beta]"}]], " ", 
  SqrtBox[
   RowBox[{"\[Alpha]", " ", "\[Beta]"}]], " ", 
  RowBox[{"(", 
   RowBox[{
    RowBox[{"\[ImaginaryI]", " ", "\[Pi]"}], "+", 
    RowBox[{"ExpIntegralEi", "[", 
     RowBox[{"\[Alpha]", "+", "\[Beta]"}], "]"}]}], ")"}]}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "\[Alpha]"}], "-", "\[Beta]"}]], " ", 
    SqrtBox[
     RowBox[{"\[Alpha]", " ", "\[Beta]"}]], " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"\[ImaginaryI]", " ", "\[Pi]"}], "+", 
      RowBox[{"ExpIntegralEi", "[", 
       RowBox[{"\[Alpha]", "+", "\[Beta]"}], "]"}]}], ")"}]}], "+", 
   RowBox[{
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "\[Alpha]"}], "-", "\[Beta]", "+", 
      RowBox[{"2", " ", 
       SqrtBox[
        RowBox[{"\[Alpha]", " ", "\[Beta]"}]]}]}]], " ", "\[Gamma]", " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"\[ImaginaryI]", " ", "\[Pi]"}], "+", 
      RowBox[{"ExpIntegralEi", "[", 
       RowBox[{"\[Alpha]", "+", "\[Beta]", "+", 
        RowBox[{"2", " ", 
         SqrtBox[
          RowBox[{"\[Alpha]", " ", "\[Beta]"}]]}]}], "]"}]}], ")"}]}]}], "//",
   "FunctionExpand"}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{
     RowBox[{"-", "\[Alpha]"}], "-", "\[Beta]"}]], " ", 
   SqrtBox[
    RowBox[{"\[Alpha]", " ", "\[Beta]"}]], " ", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"\[ImaginaryI]", " ", "\[Pi]"}], "+", 
     RowBox[{"ExpIntegralEi", "[", 
      RowBox[{"\[Alpha]", "+", "\[Beta]"}], "]"}]}], ")"}]}], "+", 
  RowBox[{
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{
     RowBox[{"-", "\[Alpha]"}], "-", "\[Beta]", "+", 
     RowBox[{"2", " ", 
      SqrtBox[
       RowBox[{"\[Alpha]", " ", "\[Beta]"}]]}]}]], " ", "\[Gamma]", " ", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"\[ImaginaryI]", " ", "\[Pi]"}], "+", 
     RowBox[{"ExpIntegralEi", "[", 
      RowBox[{"\[Alpha]", "+", "\[Beta]", "+", 
       RowBox[{"2", " ", 
        SqrtBox[
         RowBox[{"\[Alpha]", " ", "\[Beta]"}]]}]}], "]"}]}], 
    ")"}]}]}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ExpIntegralEi", "[", "600.", "]"}]], "Input"],

Cell[BoxData["6.298882891388055`*^257"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{
     RowBox[{"-", "\[Alpha]"}], "-", "\[Beta]"}]], " ", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{
      SqrtBox[
       RowBox[{"\[Alpha]", " ", "\[Beta]"}]], " ", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"\[ImaginaryI]", " ", "\[Pi]"}], "+", 
        RowBox[{"ExpIntegralEi", "[", 
         RowBox[{"\[Alpha]", "+", "\[Beta]"}], "]"}]}], ")"}]}], "+", 
     RowBox[{
      SuperscriptBox["\[ExponentialE]", 
       RowBox[{"2", " ", 
        SqrtBox[
         RowBox[{"\[Alpha]", " ", "\[Beta]"}]]}]], " ", "\[Gamma]", " ", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"\[ImaginaryI]", " ", "\[Pi]"}], "+", 
        RowBox[{"ExpIntegralEi", "[", 
         RowBox[{"\[Alpha]", "+", "\[Beta]", "+", 
          RowBox[{"2", " ", 
           SqrtBox[
            RowBox[{"\[Alpha]", " ", "\[Beta]"}]]}]}], "]"}]}], ")"}]}]}], 
    ")"}]}], "/.", 
  RowBox[{"{", 
   RowBox[{
    RowBox[{"\[Alpha]", "\[Rule]", "5."}], ",", 
    RowBox[{"\[Beta]", "\[Rule]", "3"}], ",", 
    RowBox[{"\[Gamma]", "\[Rule]", "4.5"}]}], "}"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"1.6405786557833706`*^6", "+", 
  RowBox[{"10.969800939223525`", " ", "\[ImaginaryI]"}]}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"bias", "[", 
  RowBox[{
   RowBox[{"300", "/", "800"}], ",", "500", ",", "300"}], 
  "]"}], "\[IndentingNewLine]", 
 RowBox[{"bias2", "[", 
  RowBox[{
   RowBox[{"300", "/", "800"}], ",", "500", ",", "300"}], 
  "]"}], "\[IndentingNewLine]", 
 RowBox[{"bias3", "[", 
  RowBox[{
   RowBox[{"300", "/", "800"}], ",", "500", ",", "300"}], "]"}]}], "Input"],

Cell[BoxData["0.00007629257840346959`"], "Output"],

Cell[BoxData["0.`"], "Output"],

Cell[BoxData["0.`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"p", "/.", 
   RowBox[{"First", "@", 
    RowBox[{"Solve", "[", 
     RowBox[{
      RowBox[{
       RowBox[{
        RowBox[{
         FractionBox["1", 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}], 
           RowBox[{"3", "/", "2"}]]], 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"\[Beta]", " ", 
            SqrtBox[
             RowBox[{"\[Alpha]", "+", "\[Beta]"}]]}], "+", 
           RowBox[{
            SqrtBox["2"], " ", 
            RowBox[{"(", 
             RowBox[{
              RowBox[{
               RowBox[{"-", "2"}], " ", "\[Alpha]", " ", "\[Beta]"}], "+", 
              RowBox[{
               RowBox[{"(", 
                RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}], " ", 
               RowBox[{"(", 
                RowBox[{"\[Beta]", "+", 
                 RowBox[{
                  RowBox[{"(", 
                   RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], "p"}]}], 
                ")"}]}]}], ")"}], " ", 
            RowBox[{"DawsonF", "[", 
             FractionBox[
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], 
              RowBox[{
               SqrtBox["2"], " ", 
               SqrtBox[
                RowBox[{"\[Alpha]", "+", "\[Beta]"}]]}]], "]"}]}]}], ")"}]}], 
        "-", "p"}], "\[Equal]", "0"}], ",", "p"}], "]"}]}]}], "//", 
  "FullSimplify"}]], "Input"],

Cell[BoxData[
 FractionBox["\[Beta]", 
  RowBox[{"\[Alpha]", "+", "\[Beta]"}]]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"D", "[", 
   RowBox[{
    RowBox[{
     RowBox[{
      FractionBox["1", 
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}], 
        RowBox[{"3", "/", "2"}]]], 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"\[Beta]", " ", 
         SqrtBox[
          RowBox[{"\[Alpha]", "+", "\[Beta]"}]]}], "+", 
        RowBox[{
         SqrtBox["2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{
            RowBox[{"-", "2"}], " ", "\[Alpha]", " ", "\[Beta]"}], "+", 
           RowBox[{
            RowBox[{"(", 
             RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}], " ", 
            RowBox[{"(", 
             RowBox[{"\[Beta]", "+", 
              RowBox[{
               RowBox[{"(", 
                RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], "p"}]}], 
             ")"}]}]}], ")"}], " ", 
         RowBox[{"DawsonF", "[", 
          FractionBox[
           RowBox[{"\[Alpha]", "-", "\[Beta]"}], 
           RowBox[{
            SqrtBox["2"], " ", 
            SqrtBox[
             RowBox[{"\[Alpha]", "+", "\[Beta]"}]]}]], "]"}]}]}], ")"}]}], 
     "-", "p"}], ",", "p"}], "]"}], "//", "FullSimplify"}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"-", "1"}], "+", 
  FractionBox[
   RowBox[{
    SqrtBox["2"], " ", 
    RowBox[{"(", 
     RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], " ", 
    RowBox[{"DawsonF", "[", 
     FractionBox[
      RowBox[{"\[Alpha]", "-", "\[Beta]"}], 
      RowBox[{
       SqrtBox["2"], " ", 
       SqrtBox[
        RowBox[{"\[Alpha]", "+", "\[Beta]"}]]}]], "]"}]}], 
   SqrtBox[
    RowBox[{"\[Alpha]", "+", "\[Beta]"}]]]}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Plot", "[", 
  RowBox[{
   RowBox[{
    RowBox[{"Sqrt", "[", "2", "]"}], "x", " ", 
    RowBox[{"DawsonF", "[", 
     RowBox[{"x", "/", 
      RowBox[{"Sqrt", "[", "2", "]"}]}], "]"}]}], ",", 
   RowBox[{"{", 
    RowBox[{"x", ",", "0", ",", "10"}], "}"}], ",", 
   RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{}, {}, 
   {RGBColor[0.368417, 0.506779, 0.709798], AbsoluteThickness[1.6], Opacity[
    1.], LineBox[CompressedData["
1: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
     "]]}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{None, None},
  AxesOrigin->{0, 0},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{"DefaultBoundaryStyle" -> Automatic, "ScalingFunctions" -> None},
  PlotRange->{All, All},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.05], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"With", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"\[Alpha]", "=", "50000"}], ",", 
     RowBox[{"\[Beta]", "=", "10000"}]}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{"Plot", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"bias", "[", 
        RowBox[{"p", ",", "\[Alpha]", ",", "\[Beta]"}], "]"}], ",", 
       RowBox[{"Re", "@", 
        RowBox[{"bias2", "[", 
         RowBox[{"p", ",", "\[Alpha]", ",", "\[Beta]"}], "]"}]}], ",", 
       RowBox[{"bias3", "[", 
        RowBox[{"p", ",", "\[Alpha]", ",", "\[Beta]"}], "]"}]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"p", ",", "0", ",", "1"}], "}"}]}], "]"}]}], 
  "\[IndentingNewLine]", "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{}, {}, 
   {RGBColor[0.368417, 0.506779, 0.709798], AbsoluteThickness[1.6], Opacity[
    1.], LineBox[CompressedData["
1:eJwV0HlQk0cYBvCNzGgRRcSKfiLapFEHKMdw6FDLLlQUUVGOcNQTQVDHA6zC
iFIbijgGPLBQFBorGkAUhqN4oMJHIIygnAnEhJgSogE5YhA0HBFId//Y2fnN
87zvzvcxI2ODoucAAPzxIfe26AGxcDAERg/smmrboKA/lIZGqig3JHwm9o63
V9BWZtJrlZQPAumBadarFbSjx7cFtykOAo4h1kfmKugfO1zL/6QOIXBmjydD
2k0L/xa5X6XOIACOJLv+2k2nJKefTaMuIrCca3qrRE4fOjNC8agsBLzKqINM
Gf1Nlt/dT6P5uB9TmNDUST/tcPH1XVWGQK8hOaSogw5PUSpE6Y9w3lvX4tRM
x1acdrj15RkC3NPhel4DPZbxponBqMV5LnWwuJpuqntZ2/5TPbbz4denSumj
iX4Lf9E2YGfI02y5dJ2pi7HkRCO2MuV5dj4sFDTMrljzGjvLoafgKfSyqrkX
XNqCLdfxzeuhQ6Oy6qVdO7aTsN+uCXZ5Bese6DrIfJVtSxs8Pv+YROoswdaY
fvxNApvlYTXm1zqxTZq95VIYvCVcrdF0YYsua1jdcH1eelge+w32vYkaNyXs
nc3sOvK7DNvRsISngn1+7QIrkRx/31BoQJAalueoEsVMBc7/MnAY72HBZROe
7bm3OM/gc4s0UB+1eyjmhRKbuunr2g/NfC4FVSzrwT73dofqA0yy6Fug3qvC
84fPfjw5CBfQ9kDm34t9f8nj8SHombBrRmQgrpl8fkcL+flXBN/z1dgH1+/9
QQf3h7i1mm5/R/5HzUbFCHwsjc6kx7G5EiZT+Al6tJTP6c9+j220GLs4Cr/b
HKPP9NHg/rI1kbvHoLub+41H/djchL47zM9QNXb1lSC1D3uGPar5DLWugamU
Sz/ux/HUVV/g2mGHIUYnsV3unQt62MCOl8Qlf8D91vZpzji83iWNCmIPYL+o
WGczAUeChTfmNBC3WcaoJ+C/IUs3eZwaxPPttzY9mYSC1pTb7yyHcG7VrEua
ghONe89b1mMDP5YHxwB7b9TqLU4OY+dPZq/7CsfFG6k/zLXYm8/Xa7/CuCyW
MLGaWMy6Wj8Nl7WyLDT7P2IXJqxJm4HB0pLplbPY3Ht+Yv9ZOHbg7nHlQx3O
07xXsoywNqIs1XzHCM6f9bkNGOHz9uPbe3ZiA++4B8NG+ATaLS4NJH5lsBkx
wpKVBXz/MGLZonnjRpgrz628Ekk8xdcyAIoPuKSen4gttGqkFwFk77XPc14h
tleAdZQ9QGvLVpjIikg/K8LGASDWKnlTYTF5X1YgcwRo+XQQZ0sFyQ8473AB
aG7V1mOp1SQ/sdndAyC1k1uOSSfZz4ud5wuQ8p/R/Z1S0m97VLcVIPnCMrZA
TvqLDee3AdQ2bFv+cw/Jcy5+8geo+v7qxuRB4vs53RyAqqz+uxKoJR7uyQwF
qDI1N4g5QvY7sneGA/QwammP8AvZ97i0fg9ABRKJIGOC5FOfk/YBlOedcTTC
QOY9PTYcAIhf7u/kPEP63AujEQDdXG2mNxpJXyQqjgTof/QcQR0=
     "]]}, 
   {RGBColor[0.880722, 0.611041, 0.142051], AbsoluteThickness[1.6], Opacity[
    1.], LineBox[CompressedData["
1:eJwV0Hk81GkcB/AHLblCxzCtFZJWVuRos9Xz2CVnVIPYdFjXZhG7qVd2y05p
creurWVp0yBZO86U0s+E16DcTMbsOMZ9rWFyX7PP74/n9bzer8/3+31ez1fH
J5TmLw0AcMaHvB39x9vZE+6Qe3iHSs6XfGKMddann2qOQLSao6Mhn6Aocu+X
UW0QCFRlzGrxiYOWO3OzqG4IjCiuHZPlE1+1mRWnUP0Q0P9kjNvVQ7D/rLVI
pIYj0LRMyP3UQ0Tdjr8RR72LgIbgSlAhj/ALF1FjqWkIJOW2mOp0E1vTHLJn
53IQAM0lNg2dxIs2Uzs7rSIEvJd1tPPbCM8oAb82vhwBupezl/F7IrTkqtEf
85XY4qybsXWEOOlDg5RUNe7XU/MpqCIa3nKqW4/VYN+YYIWyiMAIB+Vvp+uw
B1yfadOJt/KmksKQeuzwbuX0HJjHrNvcve8ddtpVytMX0Iry5okrqwm7dAip
1ECjesFLzoFWbLpfkmED7LJynXk204b9+SN+UwsMVgjq4Jp0YA/12Ud2wPc8
jzfb7ndiazpl87jQ1dZTODzchf3uid3eHnj4cbzHY70P2NdD9CwEcGAztevy
r93YcTsjY/vhiEMrk1LLw3ZRj6YJYXF6f0S7Dh//Ny4lUWoI5sbIxBr8/C/O
78q8zh+GC77nJgNeC3C+8k+U2ShUtLlHK1Hvw87lxPWPwZuqI0rC8/24vk3D
KHQCKhGGoNt5APu59+LiJDx+/dRG7SrpVsrmX9MwMyeBuTdTiB0gm/3FDLzo
bt4s7zSIbep3hy+Cz7n+qcQiNr3X6wR7Flo2FUuPPhjC9tZVZ8xB7RMBC6k2
w9gbe2LOiaGFuUVy+Sg28HrF0fkI+8WJjUzGCLnvVo2Rj3Da7AyDajqKPfGp
QuU81J8ympTqxKavb2mMXIB1etc6wm6PYRvs2+++CH/r4vrS9MZxPWWQ9tkS
FLmyk6XrsOkD1BThEix132Vt+eMEzutjwiqWIbM5Kmtw+yTOA9M0b63Apfrz
v2yvwQYG3d+7rcKB5OoF1StT2Jw0zv41uNh+lHpn2zS2tkg8vQbD0nTZEVWk
f6cTNetQvVlXdfjif3heI8sjbgO6cgvXNTexgcBji8smFF/KDhYUzGDLHzmt
K4HV3kWMbSdF2AvlgeMS+Ko12KnPhbS1dd+UBFbAA2qsM6RT22kiCSzUzM10
9sCmm8wcXZTADF5GWYIPNrtih5w0QNdO3xMqRGBbiU/2qABkaHXhuFweWf9D
9S1DgPSLdst055N5iuwRI4B0tXgNeX+TeaWz+CBAGus0N9sSct5WQYApQLIv
7YMYVWSet3zKEiChsXm6TCfZP3hI1w4gwaO5i51cMleIENgDxFMu0mPyyP5D
7AeOALVMGRR/00ea7qLoAlDV0z31tyfIfq2geTeAXlJ6E85Mk7YtZZ0FqIyR
QdMRkfUhK5c9ASrw3dXHniddFd3rBVBuRwczaYn0UMvDCwA9/jop0HuVfF+R
QrsEUGaxs7HJBrkvswtK3wH0cI/igkRCzj+Xw/EB6H/JPjh7
     "]]}, 
   {RGBColor[0.560181, 0.691569, 0.194885], AbsoluteThickness[1.6], Opacity[
    1.], LineBox[CompressedData["
1:eJwVkH0803kcwH/oLE95KGMlmlCSaHHlqu/HlSI1MbQSKtHlRa1O3et0Xae0
PJSy7Ho6dWno4TREpdLPYnm4PLM2a2Eeh+WXMfKQXffH+/X++/2mRrAYUdoY
htG/8b99oxRNgoFgxPWcb5y9Vor383dFdFDcgJpk6uvrJMXJBqLLRRQveFxn
zP5sLcVXeSzIuU0JgrchhtMbdKX4D41rCq5SIkF94rt+UWsbLvirwj2NcgKC
H07gpJ/b8MSzF39NpZwHczPZ0Zg8CR55gqCkULjwZ3d2PY0qxudyt2V9HsmG
8+raQq/qFvx5I83b2zofWJwv1CUPGvHdiTJpxcVi8CeF0ve6vMNZhXHON8Ze
wL2a0dunU4S4Kv19tZZWGbSCvWnEo1K8+k1lWcOGcvD2jx/gs/h4dPw2oz1K
IYTTPwQ+XJKAv9GjafKOVEHNHpbY6GY2yuUJZxfa/wtFJE4c+f5z5El+fS+Q
Xws+i/ndYFyOnKtkJZUrGsBKPyEy3akatXoGDj8cbgQziv0daW09itWPaRa5
NsPcVHm7z5lm9E7CfD3vcgtct1y4PUsiQoFbd8t7elpB0lh9z3tpG/r+7kXm
Xbv3YK2JO2LnLkOdsxmth/8Qw0k8ecGZlA7Uu62BR66QgGJyh0USQ44KbnbE
N1GlsDgs9WqaVjfKSdZJcTz1AVaKzum8etCD1AdDBg+9kgFKnnycuKYPGXhd
YBRatMN7nZzK1I5+dNqk11Ae2gHHX9ZbOrMGkCHuhInpnaBgF+0fHx9EG3/Z
+bViqhN6KXXk2b+VKDP7Em9pphz6FZG6WSuHUXiwW53e9i5gJayOPCcl0FNR
VAY+3gXR12R7twg+I4/aAu2+a92wKHWfrQV7BC3Zckid4dUDJl0zNskhKuTu
5s4p7uuBJOael5XUUdShSqvhsXshlpnRYNk7ipRrAtgUWh9kvOpfpP9iDDkM
OQ9qtfTB+o3Tc2rOqJHQ7mTzsbP94LjU0X5Z8Di60io6yLBTwA0Hchdj8QQi
AgUcbaEC4oo7KVflE+hJsPlmj+MDkJ77NvnYsy+IV5d4u8tsEGjPorlWv0+i
iarQ38zKB8F8xXLxT0FTqJNTpjY5OgRRy4XcymXTaLxpPeXcPCWs9bIhVMpp
dIxrK4gvVQJdyE3Ay2eQRZ2tSU/4J+g9UMNnpn5FgaK8GavZTzCQ8oE5x28W
qfZlxcoeDYMree46f1sNKtufz563g4DpstHiaIUGvWyI3d7uR8CVN5s2tw9p
0DO0wpQfQIBDBaeJQWhQnlVOJp1JQECly/D6cQ26JblVdCmCgOC+p/NJ2hic
9L8g148n4LFyZEebMQZOnmEbSbkEhE1Gl/3uhIFD/kId8QMClp3i6K5zxsDW
WlKd+w8Bo1MldNUqDCxnGEFbCwlIniHJDtEw0C3xiWGXEvBUk/NlpwcGche3
mzotBBjpdq229cZAdmckvEVEgPiCXrzMBwOJUb4dT0IAj7RacM0Xg/ohx4JN
7QSs00vwM/DDoPS+TdXZAQKiDK1jxoIwKCF/vBSgJMA1bcsT/i4Miti3GFTi
2w+jI5OHd2Pw6KB5u2CMAI5xadLHvRjkNDfz0icICE3vrr8ehsHdH9Oj9099
6zE1IDP2YZBZQHdx/UqAikMLMzyAwXUbA7VGQ8Brs5DsyggM/gNyWmwc
     "]]}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{None, None},
  AxesOrigin->{0, 0},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{"DefaultBoundaryStyle" -> Automatic, "ScalingFunctions" -> None},
  PlotRange->{{0, 1}, {-6.250858764817335*^-6, 0.000031253516266649406`}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.05], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"1", "/", "60000."}]], "Input"],

Cell[BoxData["0.000016666666666666667`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"Series", "[", 
    RowBox[{
     RowBox[{"Log", "[", 
      RowBox[{
       RowBox[{"Exp", "[", 
        RowBox[{
         RowBox[{"-", 
          RowBox[{"(", 
           RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}]}], 
         RowBox[{"(", 
          RowBox[{"1", "+", 
           RowBox[{"Cos", "[", "\[Phi]", "]"}]}], ")"}]}], "]"}], 
       RowBox[{"(", 
        RowBox[{
         RowBox[{
          RowBox[{"(", 
           RowBox[{"\[Gamma]", "+", 
            RowBox[{"\[Beta]", " ", 
             RowBox[{"Cos", "[", "\[Phi]", "]"}]}]}], ")"}], 
          RowBox[{"Sin", "[", 
           RowBox[{
            RowBox[{"(", 
             RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], 
            RowBox[{"Sin", "[", "\[Phi]", "]"}]}], "]"}]}], "+", 
         RowBox[{"\[Beta]", " ", 
          RowBox[{"Sin", "[", "\[Phi]", "]"}], 
          RowBox[{"Cos", "[", 
           RowBox[{
            RowBox[{"(", 
             RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], 
            RowBox[{"Sin", "[", "\[Phi]", "]"}]}], "]"}]}]}], ")"}]}], "]"}], 
     ",", 
     RowBox[{"{", 
      RowBox[{"\[Phi]", ",", "\[Pi]", ",", "3"}], "}"}]}], "]"}], "//", 
   "Normal"}], "//", "FullSimplify"}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"-", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"(", 
      RowBox[{
       RowBox[{"(", 
        RowBox[{
         SuperscriptBox["\[Beta]", "4"], "+", 
         RowBox[{"\[Alpha]", " ", 
          RowBox[{"(", 
           RowBox[{"1", "+", 
            RowBox[{"\[Alpha]", " ", 
             RowBox[{"(", 
              RowBox[{"3", "+", "\[Alpha]"}], ")"}]}]}], ")"}], " ", 
          "\[Gamma]"}], "-", 
         RowBox[{
          SuperscriptBox["\[Beta]", "3"], " ", 
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "6"}], "+", 
            RowBox[{"3", " ", "\[Alpha]"}], "+", "\[Gamma]"}], ")"}]}], "-", 
         RowBox[{"\[Beta]", " ", 
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "1"}], "+", "\[Alpha]", "+", 
            SuperscriptBox["\[Alpha]", "3"], "+", "\[Gamma]", "+", 
            RowBox[{"3", " ", 
             SuperscriptBox["\[Alpha]", "2"], " ", "\[Gamma]"}]}], ")"}]}], 
         "+", 
         RowBox[{
          SuperscriptBox["\[Beta]", "2"], " ", 
          RowBox[{"(", 
           RowBox[{"7", "-", 
            RowBox[{"3", " ", "\[Gamma]"}], "+", 
            RowBox[{"3", " ", "\[Alpha]", " ", 
             RowBox[{"(", 
              RowBox[{
               RowBox[{"-", "2"}], "+", "\[Alpha]", "+", "\[Gamma]"}], 
              ")"}]}]}], ")"}]}]}], ")"}], " ", 
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{"\[Pi]", "-", "\[Phi]"}], ")"}], "2"]}], ")"}], "/", 
     RowBox[{"(", 
      RowBox[{"6", " ", 
       RowBox[{"(", 
        RowBox[{
         SuperscriptBox["\[Beta]", "2"], "+", 
         RowBox[{"\[Alpha]", " ", "\[Gamma]"}], "-", 
         RowBox[{"\[Beta]", " ", 
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "1"}], "+", "\[Alpha]", "+", "\[Gamma]"}], ")"}]}]}],
         ")"}]}], ")"}]}], ")"}]}], "+", 
  RowBox[{"Log", "[", 
   RowBox[{
    RowBox[{"-", "\[Beta]"}], "+", 
    RowBox[{
     RowBox[{"(", 
      RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], " ", 
     RowBox[{"(", 
      RowBox[{"\[Beta]", "-", "\[Gamma]"}], ")"}]}]}], "]"}], "+", 
  RowBox[{"Log", "[", 
   RowBox[{
    RowBox[{"-", "\[Pi]"}], "+", "\[Phi]"}], "]"}]}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"formula", "=", 
  RowBox[{"Integrate", "[", 
   RowBox[{
    RowBox[{
     RowBox[{"Exp", "[", 
      RowBox[{
       RowBox[{"-", 
        RowBox[{"(", 
         RowBox[{"\[Alpha]", "+", "\[Beta]"}], ")"}]}], 
       RowBox[{"(", 
        RowBox[{"1", "+", 
         RowBox[{"Cos", "[", "\[Phi]", "]"}]}], ")"}]}], "]"}], 
     RowBox[{"(", 
      RowBox[{
       RowBox[{
        RowBox[{"(", 
         RowBox[{"\[Beta]", "+", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], "p"}], "+", 
          RowBox[{"\[Beta]", " ", 
           RowBox[{"Cos", "[", "\[Phi]", "]"}]}]}], ")"}], 
        RowBox[{"Sin", "[", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], 
          RowBox[{"Sin", "[", "\[Phi]", "]"}]}], "]"}]}], "+", 
       RowBox[{"\[Beta]", " ", 
        RowBox[{"Sin", "[", "\[Phi]", "]"}], 
        RowBox[{"Cos", "[", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], 
          RowBox[{"Sin", "[", "\[Phi]", "]"}]}], "]"}]}]}], ")"}]}], ",", 
    RowBox[{"{", 
     RowBox[{"\[Phi]", ",", "0", ",", "\[Pi]"}], "}"}]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  SubsuperscriptBox["\[Integral]", "0", "\[Pi]"], 
  RowBox[{
   RowBox[{
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"(", 
       RowBox[{
        RowBox[{"-", "\[Alpha]"}], "-", "\[Beta]"}], ")"}], " ", 
      RowBox[{"(", 
       RowBox[{"1", "+", 
        RowBox[{"Cos", "[", "\[Phi]", "]"}]}], ")"}]}]], " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"\[Beta]", " ", 
       RowBox[{"Cos", "[", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], " ", 
         RowBox[{"Sin", "[", "\[Phi]", "]"}]}], "]"}], " ", 
       RowBox[{"Sin", "[", "\[Phi]", "]"}]}], "+", 
      RowBox[{
       RowBox[{"(", 
        RowBox[{"\[Gamma]", "+", 
         RowBox[{"\[Beta]", " ", 
          RowBox[{"Cos", "[", "\[Phi]", "]"}]}]}], ")"}], " ", 
       RowBox[{"Sin", "[", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], " ", 
         RowBox[{"Sin", "[", "\[Phi]", "]"}]}], "]"}]}]}], ")"}]}], 
   RowBox[{"\[DifferentialD]", "\[Phi]"}]}]}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Plot", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"Exp", "[", 
      RowBox[{"-", "x"}], "]"}], ",", 
     RowBox[{"1", "-", "x"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"x", ",", "0", ",", "10"}], "}"}], ",", 
   RowBox[{"PlotRange", "\[Rule]", 
    RowBox[{"{", 
     RowBox[{"0", ",", "1"}], "}"}]}]}], "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{}, {}, 
   {RGBColor[0.368417, 0.506779, 0.709798], AbsoluteThickness[1.6], Opacity[
    1.], LineBox[CompressedData["
1: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
ScUDxGHWa41s8H8/3Erb
     "]]}, 
   {RGBColor[0.880722, 0.611041, 0.142051], AbsoluteThickness[1.6], Opacity[
    1.], LineBox[{{2.0408163265306121`*^-7, 0.9999997959183673}, {
     0.0030671790804136087`, 0.9969328209195863}, {0.006134154079194564, 
     0.9938658459208054}, {0.012268104076756476`, 0.9877318959232435}, {
     0.0245360040718803, 0.9754639959281197}, {0.049071804062127945`, 
     0.950928195937872}, {0.09814340404262324, 0.9018565959573768}, {
     0.19628660400361383`, 0.8037133959963861}, {0.4090835541573062, 
     0.5909164458426939}, {0.6077788108942298, 0.3922211891057702}, {
     0.8025764554305448, 0.1974235445694552}, {1., 0.}}]}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{None, None},
  AxesOrigin->{0, 0},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{"DefaultBoundaryStyle" -> Automatic, "ScalingFunctions" -> None},
  PlotRange->{{0., 9.999999795918367}, {0, 1}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {0, 0}},
  Ticks->{Automatic, Automatic}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"Plot", "[", 
  RowBox[{
   RowBox[{
    RowBox[{"Exp", "[", 
     RowBox[{
      RowBox[{"-", "x"}], "-", 
      RowBox[{"1", "/", "x"}]}], "]"}], "/", 
    RowBox[{"Sqrt", "[", "x", "]"}]}], ",", 
   RowBox[{"{", 
    RowBox[{"x", ",", "0", ",", "10"}], "}"}]}], "]"}], "\[IndentingNewLine]", 
 RowBox[{"Plot", "[", 
  RowBox[{
   RowBox[{"I", " ", 
    RowBox[{
     RowBox[{"Exp", "[", 
      RowBox[{
       RowBox[{"-", "x"}], "-", 
       RowBox[{"1", "/", "x"}]}], "]"}], "/", 
     RowBox[{"Sqrt", "[", "x", "]"}]}]}], ",", 
   RowBox[{"{", 
    RowBox[{"x", ",", 
     RowBox[{"-", "1"}], ",", 
     RowBox[{"-", ".1"}]}], "}"}], ",", 
   RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}]}], "Input"],

Cell[BoxData[
 GraphicsBox[{{}, {}, 
   {RGBColor[0.368417, 0.506779, 0.709798], AbsoluteThickness[1.6], Opacity[
    1.], LineBox[CompressedData["
1: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

     "]]}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{None, None},
  AxesOrigin->{0, 0},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{"DefaultBoundaryStyle" -> Automatic, "ScalingFunctions" -> None},
  PlotRange->{{0, 10}, {0., 0.14401756690053807`}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.05], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output"],

Cell[BoxData[
 GraphicsBox[{{}, {}, 
   {RGBColor[0.368417, 0.506779, 0.709798], AbsoluteThickness[1.6], Opacity[
    1.], LineBox[CompressedData["
1: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
fvP0cw8lVuBY2e3ZJ08qMGPmvKFE+wr8D78NK4o=
     "]]}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{None, None},
  AxesOrigin->{-1., 0},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{"DefaultBoundaryStyle" -> Automatic, "ScalingFunctions" -> None},
  PlotRange->{All, All},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.05], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Residue", "[", 
  RowBox[{
   RowBox[{
    RowBox[{"\[ImaginaryI]", " ", 
     SuperscriptBox["\[ExponentialE]", 
      RowBox[{
       RowBox[{"-", "\[Alpha]"}], "-", 
       RowBox[{"t", " ", "\[Alpha]"}], "-", 
       FractionBox[
        RowBox[{
         RowBox[{"(", 
          RowBox[{"1", "+", "t"}], ")"}], " ", "\[Beta]"}], "t"]}]], " ", 
     SqrtBox["t"], " ", "\[Gamma]"}], "+", 
    FractionBox[
     RowBox[{"\[ImaginaryI]", " ", 
      SuperscriptBox["\[ExponentialE]", 
       RowBox[{
        RowBox[{"-", "\[Alpha]"}], "-", 
        RowBox[{"t", " ", "\[Alpha]"}], "-", 
        FractionBox[
         RowBox[{
          RowBox[{"(", 
           RowBox[{"1", "+", "t"}], ")"}], " ", "\[Beta]"}], "t"]}]], " ", 
      "\[Beta]"}], 
     SqrtBox["t"]]}], ",", 
   RowBox[{"{", 
    RowBox[{"t", ",", "0"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"Residue", "[", 
  RowBox[{
   RowBox[{
    FractionBox[
     RowBox[{"\[ImaginaryI]", " ", 
      SuperscriptBox["\[ExponentialE]", 
       RowBox[{
        RowBox[{"-", "\[Alpha]"}], "-", 
        RowBox[{"t", " ", "\[Alpha]"}], "-", 
        FractionBox[
         RowBox[{
          RowBox[{"(", 
           RowBox[{"1", "+", "t"}], ")"}], " ", "\[Beta]"}], "t"]}]], " ", 
      "\[Beta]"}], 
     SqrtBox["t"]], "+", 
    RowBox[{"\[ImaginaryI]", " ", 
     SuperscriptBox["\[ExponentialE]", 
      RowBox[{
       RowBox[{"-", "\[Alpha]"}], "-", 
       RowBox[{"t", " ", "\[Alpha]"}], "-", 
       FractionBox[
        RowBox[{
         RowBox[{"(", 
          RowBox[{"1", "+", "t"}], ")"}], " ", "\[Beta]"}], "t"]}]], " ", 
     SqrtBox["t"], " ", "\[Gamma]"}]}], ",", 
   RowBox[{"{", 
    RowBox[{"t", ",", "0"}], "}"}]}], "]"}]], "Output"]
}, Open  ]],

Cell["\<\
Therefore the quantity of interest is given by the following, which needs \
complex analysis to compute because of the pole at t=0.\
\>", "Text"],

Cell[BoxData[
 RowBox[{"Integrate", "[", 
  RowBox[{
   RowBox[{
    RowBox[{"\[ImaginaryI]", " ", 
     SuperscriptBox["\[ExponentialE]", 
      RowBox[{
       RowBox[{"-", "\[Alpha]"}], "-", 
       RowBox[{"t", " ", "\[Alpha]"}], "-", 
       FractionBox[
        RowBox[{
         RowBox[{"(", 
          RowBox[{"1", "+", "t"}], ")"}], " ", "\[Beta]"}], "t"]}]], " ", 
     SqrtBox["t"], " ", "\[Gamma]"}], "+", 
    FractionBox[
     RowBox[{"\[ImaginaryI]", " ", 
      SuperscriptBox["\[ExponentialE]", 
       RowBox[{
        RowBox[{"-", "\[Alpha]"}], "-", 
        RowBox[{"t", " ", "\[Alpha]"}], "-", 
        FractionBox[
         RowBox[{
          RowBox[{"(", 
           RowBox[{"1", "+", "t"}], ")"}], " ", "\[Beta]"}], "t"]}]], " ", 
      "\[Beta]"}], 
     SqrtBox["t"]]}], ",", 
   RowBox[{"{", 
    RowBox[{"t", ",", 
     RowBox[{"-", "1"}], ",", "\[Infinity]"}], "}"}]}], "]"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"I", " ", 
   RowBox[{"Exp", "[", 
    RowBox[{
     RowBox[{"-", "\[Alpha]"}], "-", "\[Beta]"}], "]"}], 
   RowBox[{"Integrate", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"Exp", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"-", "\[Alpha]"}], " ", "t"}], "-", 
        RowBox[{"\[Beta]", "/", "t"}]}], "]"}], 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"\[Gamma]", " ", 
         RowBox[{"Sqrt", "[", "t", "]"}]}], "+", 
        RowBox[{"\[Beta]", "/", 
         RowBox[{"Sqrt", "[", "t", "]"}]}]}], ")"}]}], ",", 
     RowBox[{"{", 
      RowBox[{"t", ",", "0", ",", "\[Infinity]"}], "}"}]}], "]"}]}], "//", 
  "FullSimplify"}]], "Input"],

Cell[BoxData[
 FractionBox[
  RowBox[{"\[ImaginaryI]", " ", 
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{
     RowBox[{"-", "\[Alpha]"}], "-", "\[Beta]", "-", 
     RowBox[{"2", " ", 
      SqrtBox[
       RowBox[{"\[Alpha]", " ", "\[Beta]"}]]}]}]], " ", 
   SqrtBox["\[Pi]"], " ", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"2", " ", "\[Alpha]", " ", "\[Beta]"}], "+", "\[Gamma]", "+", 
     RowBox[{"2", " ", 
      SqrtBox[
       RowBox[{"\[Alpha]", " ", "\[Beta]"}]], " ", "\[Gamma]"}]}], ")"}]}], 
  RowBox[{"2", " ", 
   SuperscriptBox["\[Alpha]", 
    RowBox[{"3", "/", "2"}]]}]]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"NIntegrate", "[", 
  RowBox[{
   RowBox[{
    RowBox[{"(", " ", 
     RowBox[{
      RowBox[{"Exp", "[", 
       RowBox[{
        RowBox[{"-", "\[Alpha]"}], "-", "\[Beta]"}], "]"}], 
      RowBox[{"Exp", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"-", "\[Alpha]"}], " ", 
         RowBox[{"Exp", "[", 
          RowBox[{"I", " ", "\[Phi]"}], "]"}]}], "-", 
        RowBox[{"\[Beta]", " ", 
         RowBox[{"Exp", "[", 
          RowBox[{
           RowBox[{"-", "I"}], " ", "\[Phi]"}], "]"}]}]}], "]"}], 
      RowBox[{"Im", "@", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"\[Gamma]", " ", 
          RowBox[{"Exp", "[", 
           RowBox[{"I", " ", 
            RowBox[{"\[Phi]", "/", "2"}]}], "]"}]}], "+", 
         RowBox[{"\[Beta]", " ", 
          RowBox[{"Exp", "[", 
           RowBox[{
            RowBox[{"-", "I"}], " ", 
            RowBox[{"\[Phi]", "/", "2"}]}], "]"}]}]}], ")"}]}]}], ")"}], "/.", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"\[Alpha]", "\[Rule]", "5000"}], ",", 
      RowBox[{"\[Beta]", "\[Rule]", "3000."}], ",", 
      RowBox[{"\[Gamma]", "\[Rule]", "4500"}]}], "}"}]}], ",", 
   RowBox[{"{", 
    RowBox[{"\[Phi]", ",", 
     RowBox[{"-", "\[Pi]"}], ",", "0"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"1.8040430260768403`*^-13", "-", 
  RowBox[{"0.7515089477855109`", " ", "\[ImaginaryI]"}]}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Integrate", "[", 
  RowBox[{
   RowBox[{
    RowBox[{"Exp", "[", 
     RowBox[{
      RowBox[{
       RowBox[{"-", "\[Alpha]"}], " ", 
       RowBox[{"Exp", "[", 
        RowBox[{"I", " ", "\[Phi]"}], "]"}]}], "-", 
      RowBox[{"\[Beta]", " ", 
       RowBox[{"Exp", "[", 
        RowBox[{
         RowBox[{"-", "I"}], " ", "\[Phi]"}], "]"}]}]}], "]"}], 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"\[Gamma]", " ", 
       RowBox[{"Exp", "[", 
        RowBox[{"I", " ", 
         RowBox[{"\[Phi]", "/", "2"}]}], "]"}]}], "+", 
      RowBox[{"\[Beta]", " ", 
       RowBox[{"Exp", "[", 
        RowBox[{
         RowBox[{"-", "I"}], " ", 
         RowBox[{"\[Phi]", "/", "2"}]}], "]"}]}]}], ")"}]}], ",", "\[Phi]"}], 
  "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"\[Integral]", 
  RowBox[{
   RowBox[{
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{
       RowBox[{"-", 
        SuperscriptBox["\[ExponentialE]", 
         RowBox[{"\[ImaginaryI]", " ", "\[Phi]"}]]}], " ", "\[Alpha]"}], "-", 
      
      RowBox[{
       SuperscriptBox["\[ExponentialE]", 
        RowBox[{
         RowBox[{"-", "\[ImaginaryI]"}], " ", "\[Phi]"}]], " ", 
       "\[Beta]"}]}]], " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{
       SuperscriptBox["\[ExponentialE]", 
        RowBox[{"-", 
         FractionBox[
          RowBox[{"\[ImaginaryI]", " ", "\[Phi]"}], "2"]}]], " ", "\[Beta]"}],
       "+", 
      RowBox[{
       SuperscriptBox["\[ExponentialE]", 
        FractionBox[
         RowBox[{"\[ImaginaryI]", " ", "\[Phi]"}], "2"]], " ", "\[Gamma]"}]}],
      ")"}]}], 
   RowBox[{"\[DifferentialD]", "\[Phi]"}]}]}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"\[Alpha]", "=", "5000"}], ",", 
      RowBox[{"\[Beta]", "=", "3000"}], ",", 
      RowBox[{"p", "=", ".75"}], ",", 
      RowBox[{"n", "=", "10000000"}], ",", "x", ",", "y", ",", "z"}], "}"}], 
    ",", "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"x", "=", 
      RowBox[{"N", "@", 
       RowBox[{"RandomVariate", "[", 
        RowBox[{
         RowBox[{"PoissonDistribution", "[", "\[Alpha]", "]"}], ",", "n"}], 
        "]"}]}]}], ";", "\[IndentingNewLine]", 
     RowBox[{"y", "=", 
      RowBox[{"RandomVariate", "[", 
       RowBox[{
        RowBox[{"PoissonDistribution", "[", "\[Beta]", "]"}], ",", "n"}], 
       "]"}]}], ";", "\[IndentingNewLine]", 
     RowBox[{"z", "=", 
      RowBox[{"RandomVariate", "[", 
       RowBox[{
        RowBox[{"PoissonDistribution", "[", 
         RowBox[{
          RowBox[{"p", " ", "\[Alpha]"}], "+", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{"1", "-", "p"}], ")"}], "\[Beta]"}]}], "]"}], ",", "n"}], 
       "]"}]}], ";", "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{"(", 
       RowBox[{"z", "-", "y"}], ")"}], "/", 
      RowBox[{"(", 
       RowBox[{"x", "-", "y", "+", 
        RowBox[{"1", "/", "2"}]}], ")"}]}]}]}], "\[IndentingNewLine]", "]"}], 
  "//", "Mean"}]], "Input"],

Cell[BoxData["0.7505607009837337`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"NIntegrate", "[", 
   RowBox[{
    RowBox[{
     RowBox[{"I", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"\[ImaginaryI]", " ", 
         SuperscriptBox["\[ExponentialE]", 
          RowBox[{
           RowBox[{"-", "\[Alpha]"}], "-", 
           RowBox[{"t", " ", "\[Alpha]"}], "-", 
           FractionBox[
            RowBox[{
             RowBox[{"(", 
              RowBox[{"1", "+", "t"}], ")"}], " ", "\[Beta]"}], "t"]}]], 
         RowBox[{"Sqrt", "[", "t", "]"}], " ", "\[Gamma]"}], "+", 
        FractionBox[
         RowBox[{"\[ImaginaryI]", " ", 
          SuperscriptBox["\[ExponentialE]", 
           RowBox[{
            RowBox[{"-", "\[Alpha]"}], "-", 
            RowBox[{"t", " ", "\[Alpha]"}], "-", 
            FractionBox[
             RowBox[{
              RowBox[{"(", 
               RowBox[{"1", "+", "t"}], ")"}], " ", "\[Beta]"}], "t"]}]], " ",
           "\[Beta]"}], 
         RowBox[{"Sqrt", "[", "t", "]"}]]}], ")"}]}], "/.", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"\[Alpha]", "\[Rule]", "500"}], ",", 
       RowBox[{"\[Beta]", "\[Rule]", "300."}], ",", 
       RowBox[{"\[Gamma]", "\[Rule]", "500"}], ",", 
       RowBox[{"t", "\[Rule]", 
        RowBox[{
         RowBox[{
          RowBox[{"(", 
           RowBox[{"I", "+", "1"}], ")"}], "\[Phi]"}], "-", "1"}]}]}], 
      "}"}]}], ",", 
    RowBox[{"{", 
     RowBox[{"\[Phi]", ",", "0", ",", "1"}], "}"}]}], "]"}], "+", 
  RowBox[{"NIntegrate", "[", 
   RowBox[{
    RowBox[{
     RowBox[{"I", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"\[ImaginaryI]", " ", 
         SuperscriptBox["\[ExponentialE]", 
          RowBox[{
           RowBox[{"-", "\[Alpha]"}], "-", 
           RowBox[{"t", " ", "\[Alpha]"}], "-", 
           FractionBox[
            RowBox[{
             RowBox[{"(", 
              RowBox[{"1", "+", "t"}], ")"}], " ", "\[Beta]"}], "t"]}]], 
         RowBox[{"Sqrt", "[", "t", "]"}], " ", "\[Gamma]"}], "+", 
        FractionBox[
         RowBox[{"\[ImaginaryI]", " ", 
          SuperscriptBox["\[ExponentialE]", 
           RowBox[{
            RowBox[{"-", "\[Alpha]"}], "-", 
            RowBox[{"t", " ", "\[Alpha]"}], "-", 
            FractionBox[
             RowBox[{
              RowBox[{"(", 
               RowBox[{"1", "+", "t"}], ")"}], " ", "\[Beta]"}], "t"]}]], " ",
           "\[Beta]"}], 
         RowBox[{"Sqrt", "[", "t", "]"}]]}], ")"}]}], "/.", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"\[Alpha]", "\[Rule]", "500"}], ",", 
       RowBox[{"\[Beta]", "\[Rule]", "300."}], ",", 
       RowBox[{"\[Gamma]", "\[Rule]", "500"}], ",", 
       RowBox[{"t", "\[Rule]", 
        RowBox[{
         RowBox[{
          RowBox[{"(", 
           RowBox[{"1", "-", "I"}], ")"}], "\[Phi]"}], "+", "I"}]}]}], 
      "}"}]}], ",", 
    RowBox[{"{", 
     RowBox[{"\[Phi]", ",", "0", ",", "1"}], "}"}]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"NIntegrate", "::", "izero"}], "MessageName"], ":", 
  " ", "\<\"Integral and error estimates are 0 on all integration subregions. \
Try increasing the value of the MinRecursion option. If value of integral may \
be 0, specify a finite value for the AccuracyGoal option. \\!\\(\\*ButtonBox[\
\\\"\[RightSkeleton]\\\", ButtonStyle->\\\"Link\\\", ButtonFrame->None, \
ButtonData:>\\\"paclet:ref/NIntegrate\\\", ButtonNote -> \
\\\"NIntegrate::izero\\\"]\\)\"\>"}]], "Message", "MSG"],

Cell[BoxData[
 RowBox[{
  RowBox[{"-", "0.5027275889339208`"}], "-", 
  RowBox[{"0.5027275889658182`", " ", "\[ImaginaryI]"}]}]], "Output"]
}, Open  ]],

Cell[BoxData["|"], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Plot", "[", 
  RowBox[{
   RowBox[{
    RowBox[{"-", 
     RowBox[{"Re", "[", 
      FractionBox[
       RowBox[{
        SuperscriptBox["\[ExponentialE]", 
         RowBox[{
          RowBox[{"-", 
           SuperscriptBox["\[ExponentialE]", 
            RowBox[{
             RowBox[{"-", "\[ImaginaryI]"}], " ", "\[Phi]"}]]}], " ", 
          RowBox[{"(", 
           RowBox[{"1", "+", 
            SuperscriptBox["\[ExponentialE]", 
             RowBox[{"\[ImaginaryI]", " ", "\[Phi]"}]]}], ")"}], " ", 
          RowBox[{"(", 
           RowBox[{
            RowBox[{
             SuperscriptBox["\[ExponentialE]", 
              RowBox[{"\[ImaginaryI]", " ", "\[Phi]"}]], " ", "\[Alpha]"}], 
            "+", "\[Beta]"}], ")"}]}]], " ", 
        RowBox[{"(", 
         RowBox[{"\[Beta]", "+", 
          RowBox[{
           SuperscriptBox["\[ExponentialE]", 
            RowBox[{"\[ImaginaryI]", " ", "\[Phi]"}]], " ", "\[Gamma]"}]}], 
         ")"}]}], 
       SqrtBox[
        SuperscriptBox["\[ExponentialE]", 
         RowBox[{"\[ImaginaryI]", " ", "\[Phi]"}]]]], "]"}]}], "/.", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"\[Alpha]", "\[Rule]", "500"}], ",", 
      RowBox[{"\[Beta]", "\[Rule]", "300."}], ",", 
      RowBox[{"\[Gamma]", "\[Rule]", "500"}]}], "}"}]}], ",", 
   RowBox[{"{", 
    RowBox[{"\[Phi]", ",", "0", ",", "\[Pi]"}], "}"}], ",", 
   RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{}, {}, 
   {RGBColor[0.368417, 0.506779, 0.709798], AbsoluteThickness[1.6], Opacity[
    1.], LineBox[CompressedData["
1:eJxFlXk4VH/4/oXOOUNCixTJnrUSWWJmnqyJsi/ZsoSPFrJWklCWSkIiWyoV
RbIrZuYcsrbIUokQskW2sqTE9/yu6/f1nX/mel1zzvt63vd9P/eIufqYu7Oz
sbFFrWFj+3/fHDhX87d9vjS2//8RFRCVFrllQv9fnuuJP9KZeGyV+w40DZQn
+qzyR/+h/EeJl1a5JfYXf2bizVU+nBpceycxa5Vjd7AykxOfr/LYArJywJ9Y
ZfV/CaYlZxpXuanX9jK7RMsqg7bl38euH1bZ7ozhdNnRz6vMEpOLIB51r7Ll
HbnsHu++VRZay9SJ9xhY5WjlumIiZnCV9QwOOT+OGl7luquz0leCR/9v3hub
GF/vjK2yy9mim9OJP1b5onit0qWKyVXetXxxnt1repUbHG1/iR6fWWWlu6c7
Lgb8XGVds2q7Mr9fqyw/ZFInHzW7yn58vlp3k+ZW2a2gxXw8fn6VpRVPmp59
sLDKt0R0J3ru/15l55znyZCxuMps/NY7B/L+rLLhxH4bpyd/6dKnO7bIOhZz
HH9q572VsUQv/kgP0c4PiulfXpfY0vSPrm14MDDo4joepP6fpWvdMn1XkZap
U6liwspp2ZW9n1boU38dzq9TLbltWmso6XOCDdh0i1z3jT1PNdt+8L32CBtw
lhjT79cHZDKGv02Uea+BNa9aL+ll37x/4buIg8DEGnjeyNWH/hJ8lO2wQBUI
YocLCtzmLg+bZUQpPj4c8+ygq5p2U7CKM//Imj053v4c4FrisZ49a27XkFec
+fm/HOAgR0SOq3MUt3DHHvYN5gSmb8oA/e4NFSmRnQyMcy3MPv69Rnxhi5pc
CLeSyPW14Pn4zIXSdA2NKxtvzolSENj3zKGuwZ6vKjvFJ1SHG4F+7fEDN67y
V9UImaIePAi4OomPcvnxVbFJ8m/N40eA7euS6hOTsv0hKre09m1DQHOlqz2p
6aBmoFXKZUN5BMIxmdNPv4RreqRk8fsdRuBQ5/OXBGWqKlIoLC3JBIFGDUWj
PpPpqodZzhIVZggc1vfrjROarBrIEdu3ZEWe3/zudl1capXTi2zbKCcEirq0
KeWV4lrWnTlZaT4IDPM+C7QPstIKdIyRYfqS84mY68uzWWsl9f9X9NWffL9v
84jHbQuttu+yryTPkWx0hmedojDjyJ+84YIwBMoO7qdlhMcwTofG+rRGIBBW
bRC9tiiREct++vevKwhkpLqhf2bSGK+5dnFpXEVAvNpmp935XMb3uPW37K8j
0P3h3tMgjucMbOOUUOgNBLpcNML6WosZBkKFiq8SELB+ccfQ+0YFw1j4/cnq
Wwicz4lZ3+5awTDdPvkEv42AbiVhfsKglGEpwjPKTEGg1z7+LRL3hGG7Q0Ga
kYoAoc7fViLoreUganS8Mh2BPqzJ22JDhZaL2IkHLzIR0FpmXa7b+FbLQ/xq
X3kWAsLB43whrE6tExK5ImX3EfCn6H+993ZQy1uywaEkGwHDZbNBb7EpLT+p
4bSiRwhst7973HP9vFaQ9NrO5zkIFHSleniM/dO6sFNyS8ET0o+W2397ojio
YTI6Vvl5CEBAZDNnCka9Iut66+kzBP7EVhlMf+GhxsiFt+Y+RyCg22Jw32l+
aqz8Pd6cInL+KYrbuZMbqfEK+OFHJQjIFZnX1Ltuot5W7L2eXYbAgKKF5fuM
jdS0Xf+a7lcgoK/N0XhNno96d7cwdu8lAkE+JeqtDWuoD/Zo6t+tQiAe5+SZ
3D7BeKxkdyWDicAG5+gpUd4tzKd7z9ek4QgkzAa5GqbIMp8r32FLrUYgVahu
q+55VWapSgUt5RUCW757jr3MOsB8se9TyO06BB70asulMg2ZDNW5ylsNCBg8
kBW06zBjEmqbFhOaEBibY3w0KLFh1qorq8W/QeDJ42cplqZOzCYN88C4dwhY
iZ8v1Sp2ZTbv9y2JfU/m69tlEzZ1D2abZvzMtVZSb/mNIYPWXsxPWs93X21H
wPxmZuXe8JPML9Tm09EfyXz0nIzMnjvJ7KNN5EV2IFA5uT25p8KLOUhfN3a5
k9RnrbS41HU35ijIy0R8QeDz6dmG6lcmzB8HDnmE9SBgGn7UvvOhFXVa2+th
6FcE3otfKZOy8qfO6cQMhPQjcHJUKYPP4zL1j26O6IVvCGSV9UQeV4qnLuvV
O50fQuC0qOQF8yt3qOwGQxlnRxAICfZcKXO/T0UOcn4J/E6eP2PQuzEih8pl
KLE1YBwBIY/LzWohBVTeQ9o2fhMIrHUInzvGVULdZORy+8wUAmuwe+rtE+VU
QeOwdu8ZBH72BhcYJlRShQ9n8Z/+hcDM9VolrbNMqtgRlsnJObJv3L+tr5tl
UaVNem54LSCQ077w/JY8iypnuvTGcxGBlQGRvu9rK6m7zIS4PP6Selg5/UNV
i6h7zfcfPP4PgWkjxQeyn8KpqhZHo1xXyP3QQYvvJJUyNS3P1TqvQcHSNUvJ
//xrJlilsB/jQOFIxCNKl/hnpq51OTiuRWHHLv2fslu/MQ/afAy1R1EYsLXT
YLaNM41tZxlHKShM7qYqqIv+Ypoe3fjXhhsFoXsTiTSRRaaV3V4Nax4UuJpz
8YLSFaadvdlZS14UqKYbahYNOFhODmfKzPlRqOzUlJ1PRlgJEbnj+htRCJBz
oJU7Uli1uX1imptRoK3dq96uys1aaBa03b0FBSM/hvHbq9wsuTnTOImtKCw/
e9Aln0ZhOQpdrd0ihIJI5lm20mhOVvyB6j/c21FY0pn9Fp49z6z1XNzDtgMF
4kuz1BzaSV24oeQ5K4pC8wZKM3UOpcmVemWOiqNQXffGy19iG82p6357tyQK
n8KZK8o60rQEti5KqzQKbO0K7zx699BqpTdAnQwK5fnHeKPr1GgLxoeCXsqh
ENS4SbCmnk6T84/If6aAgj7GF3D+qC7NMbVy4P4uFPJPrDQYbjWkxeM/BZP3
oJAU0dvY0nOY9mpIzuTaXhScqlyyv4iZ0ea53SJDVVAoiB4ZNxowp8nuTa/y
U0UhVNvaP7XTguZg2z7joY4Ci7/J+H6GBe1mKLeM/X4UziV55QzmmdFqHuo4
mWih0MZIt+oaO0Sbf30hSYdG3v+YhMq8mwZNdqbktRqQz6eX1rnpKLEctvxg
U9Am/XFbKhRXsGDFUyXVRHVRuEITawlwd2O9cnM4vUkfBdO5H57c73xY81eT
srGDKIwom40d9zvLki1827lkiAJ2p0ZyXiqM5fCJk2/GCIUEmfoZVCqSVSMe
GNJpgoJeX+Ctf7zxrLmDz4rfmaEQ3/527iArkSXjMzRabYECw82xdZ7/Nsv+
9vYd5Vakf5nHKHkvkllxVVZWT21QcLHlCaozTmFV99+4fvcoCrhusWq5VTJr
Fq2vTrQn8ysbzvxueIsls2t5IcoRhd+nymIjpK6z7C1Vd104hkLMPZ8DVGM/
Vlyw93EfFxSQ9EWH8bthtJp7j9Pc3Eg9FTk8/stKpc3V97bYuKMQF21X+fhb
Dk1mQgA19kTh1x3Nk054Mc1+owkVvEj9YjSXhd5U0uI0ov1VTqLgGszIRf5W
06qP4U9kTqPQstK4bw9bA202cuGrsA8Kj8okrJADb2k783cL8PuiENwt/nfy
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
ujv+PxqKj5o=
     "]]}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{None, None},
  AxesOrigin->{0, 0},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{"DefaultBoundaryStyle" -> Automatic, "ScalingFunctions" -> None},
  PlotRange->{All, All},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.05], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"Plot3D", "[", 
  RowBox[{
   RowBox[{"Re", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"Exp", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"-", "\[Alpha]"}], 
         RowBox[{"(", 
          RowBox[{"1", "+", " ", "t"}], ")"}]}], "-", 
        RowBox[{"\[Beta]", 
         RowBox[{"(", 
          RowBox[{"1", "+", 
           RowBox[{"1", "/", "t"}]}], ")"}]}]}], "]"}], 
      RowBox[{"(", 
       RowBox[{"\[Gamma]", "+", 
        RowBox[{"\[Beta]", " ", "t"}]}], ")"}]}], "/.", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"\[Alpha]", "\[Rule]", "500"}], ",", 
       RowBox[{"\[Beta]", "\[Rule]", "300."}], ",", 
       RowBox[{"\[Gamma]", "\[Rule]", "450"}], ",", 
       RowBox[{"t", "\[Rule]", 
        RowBox[{"x", "+", 
         RowBox[{"I", " ", "y"}]}]}]}], "}"}]}], "]"}], ",", 
   RowBox[{"{", 
    RowBox[{"x", ",", 
     RowBox[{"-", "1"}], ",", 
     RowBox[{"-", ".8"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"y", ",", 
     RowBox[{"-", ".1"}], ",", ".1"}], "}"}], ",", 
   RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}], "\[IndentingNewLine]", 
 RowBox[{"Plot3D", "[", 
  RowBox[{
   RowBox[{"Im", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"Exp", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"-", "\[Alpha]"}], 
         RowBox[{"(", 
          RowBox[{"1", "+", " ", "t"}], ")"}]}], "-", 
        RowBox[{"\[Beta]", 
         RowBox[{"(", 
          RowBox[{"1", "+", 
           RowBox[{"1", "/", "t"}]}], ")"}]}]}], "]"}], 
      RowBox[{"(", 
       RowBox[{"\[Gamma]", "+", 
        RowBox[{"\[Beta]", " ", "t"}]}], ")"}]}], "/.", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"\[Alpha]", "\[Rule]", "500"}], ",", 
       RowBox[{"\[Beta]", "\[Rule]", "300."}], ",", 
       RowBox[{"\[Gamma]", "\[Rule]", "450"}], ",", 
       RowBox[{"t", "\[Rule]", 
        RowBox[{"x", "+", 
         RowBox[{"I", " ", "y"}]}]}]}], "}"}]}], "]"}], ",", 
   RowBox[{"{", 
    RowBox[{"x", ",", 
     RowBox[{"-", "1"}], ",", 
     RowBox[{"-", ".8"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"y", ",", 
     RowBox[{"-", ".1"}], ",", ".1"}], "}"}], ",", 
   RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}]}], "Input"],

Cell[BoxData[
 Graphics3DBox[GraphicsComplex3DBox[CompressedData["
1:eJx0nXlcTV/09xsoY0oiQyQZSyKZvronFTKUuRIVIWOGQoYyVSRTMoVQCkVU
KFPdU4iQJJmKJPOYMiWp5/c4+7Puc/fv0T+9Xu/Xeu2z99prr73W2vuc295z
wdgZaioqKqMbqqio/89/g93jK2try8S1w2WT9+69IIbU63/K7Ya6dWzDyrjK
UAVPej+kZsSGx4LJ2v0Ty/UUvP2w1ebXB0QIp3/IGryP+ky8zYgNySM1egn9
55VeLDVR8OrdrhrzbQzEjOfBc4tSPxE/0cKndar+R/lQ565tCgYpeO+LuQcW
rtgtz835v38fiZuMapdm82CdbILNwoAsZwXfmDxca8dBF9mTc7pm8tIPxO3U
AvQ63Kkrn9b9XHGqt4J/b2SUsKGwsfz9YddtiZXviX/8FmTxrPRe+iL9GiEu
UMFXNP00Psr6tlXllugvUVoKXn/my2fWQ+KtAtQHR+/d+454asMWhvmto9Oh
5/M/Jj53L08RPXvonjjcQiUDegY3Gmdl8Wr5GxF6Bh990+RKYIMkEXoG77jv
eIPpl2aJ0DN408WpX92G1ROgZ/AfQR7znluoCNAz+OHq2tC5jfNk0DP41hr5
rG8NFXoG15k5Ys0NHW859Az+Z/q9boGBDqRn8DTPM0GxVhqkZ/BbFp2S4hbW
lUHP4IULdNc+j3hPegav339u2CmTjHToGfz6nI3R8tRrpOeyw0u8jIedFtPy
Njt28dEiPYO3vf/USD/7E9kzeNDlzZdjG8vJnsF7btsT3dIzkOwZfHZ/w00D
OlqTnsEXXJo1t/2uF2TP4Boqa88OGfWM7Bk8tGuzwtlxKXLoGXzr534fV3iu
Jj2DO/Vb63tQbagMegZfodHwRZndIBn0DO7x++TETk0MSc/gcW1bmU74ejcd
egYvz5q4qMr8K+kZ/JNrukf6imLS88iDRg/vDTopnj9nVda5oDf5DfBpmxpt
jatbSPYM3u5E0tPGFzPJnsEt65xvHtVuO9kzuHHkNZWRDV3Jb4C3LXOyC1jY
ToSewR1XnrV9tfkO6Rn8jXpV87Z2Z8mewQ8c0F/i6rSf/Ab4nCvB69ODl5Ke
6bn+Hh1rfIeQnsF3dqvut7m9vhx6Br/Tckb9RicM5NAzeH1Dz4qD8xrIoWfw
3gt+Ci/fPiM9X/xr50dEm4Aq5xbLh5M9g3stX9nyZclP0jP4+oxdUS+vxZA9
g09tdTh/+uwtZM/gPoMKNzU6PJXsGfy/z89bXG7Wi/wGeIW1V1HgaFUBegZ/
t+dT4La026Rn8C/dMvv4moSRnsFllbVlcyfMIL8B7rhuVaj3R3fyG+DBF4cN
37LTnvQMHvbxZmnw2x6kZ+LzF6uujm1IegYf8Mit+deaMivoedRf/R8Qe5eH
Njr51ZnsGdzb7/ufmZ+aWkPP4HrFA68HeuaQnsFjbWcW77YPID2DT6p3O7n3
i//InsF/6D/JtHXrSPYMfjDeeuvJWFURegY/s0nrvpV6EfkNcPf8dYZ1OqSQ
3wDvcXazw46J20nP4Ab7IvpdDvYmPYNf9ovf1FxPoWfwBO2NeirO+qRn8DjL
caN+Pq0vg57Bb2he+jROt5kMeh7/l28Rz+jeSA27OYXsGXzzVSHlVn3DDOgZ
/JT5jcTLqs/Jb4Cvjdme2FQtlvwG+Ikm5gfWqs0hPYPbPr5bXrisF+kZXLf3
bO++T36T3wDP7D3y14agq6Rn8ANrN7xauiKQ9Az+p7Hqd73+U8lvgB8c3WHa
yfyJ5DfAt2XqiYfqDif/DP5b1ePW4YMDZNAzeHvHzAvyOWakZ/BXX3S6dxlg
THpW+fu3OC3muOX6atGT7Bn82ZSq7WFFRmTP4BNbJbp6bHxF9gwuum5fPLVF
Atkz+K3ukY0nNV5CfgPcwuLd66GCDfkN8MmNp8abzW1KfgN8g5hW4n3nFfkN
8KEGaVWnQ+TkN8BrO4/rlr9iL+kZ/Jvbz6xF4ctJz+DJ2+9F3e/iQXoGj25R
X6+7/VDSM3ib2uEZD8MsSc/gxnmvnD0bdyU9W0v6F+I4ewZfzdkzeCRnz+DT
OHsGX8bZM7g+Z8/gqRbK9gw+lbNn8LFrlO0Z/IyWsj2DNx6jbM/gZzl7BtdV
U7Zn8F6cPYO/5ux5sORPBF3OP4M7cP4Z/NBTZf8MvtRO2T+Dj66v7J/BXVoq
+2fwdM4/g2dy/hl8Guefwc04/wyuyvln8CjOP4P35fwzuE4fZf8M/ozzzynS
/ih88leON8CvLlOON8CrM5XjDfBTXLwBvoaLN8AFLt4Af8vFG+A5XLwBHszF
G+DhXLwBPpeLN8A3cvEG9Z+LN8C3c/EGuJyLN+yleE8YzcXP4DpblONnkufi
Z3BbLn4Gb8PFz+DqXPwMPoaLn8H711GOn8HPcfEzuBsXP4NXrlSOn8EruPgZ
vG4b5fgZvLadcvwM3oeLnz9J+YtwNlc5HwQfz+WD4Ie4fBC8O5cPgg/k8kHw
m2nK+SB4Xy4fBOfzQXA+HwSP5fJB8DVcPgg+p1o5HwRf0k45HwQv5fJB8BQu
H0yV8nHB21y5vgE+nKtvgK+4pVzfAK/P1TfAPfyU6xvgKsHK9Q3w3Vx9A5yv
b4A7cvUNcL6+AS7n6hvgN7n6Bjhf3wCvx9U3wDO4+garLwn/qNcJ/6jXCf+o
1wn/qNcJ/6jXCf+o1wn/qNcJ/6jXCf+o1wn/qNcJ/6jXCf+o1wn/qNcJ/6jX
CajXlYw+Oto/q0yMNMxp6591Trz9ZcHcUS9UrWddG6a6ZLSCl29u4fH4yh7h
83+fkr2LPhM/vc0urJ5lgLg0OczTy0vB9bR6rj6+b4SI9gty3sQMMjgr2j2U
LU7YqpeB9sEjT5x4fd7yuoj2wZPi5s+4+n2RgPbBW/p2alMncaKA9hssV++q
uSRJLCudeeB5+47Uf/Brnm83pCc8p/6DJ3iseL2iZzi1D74me0CB03VH6n/g
X73FizdyRe9tW82p/+D1fW5/0xPLqf/gsz0nX+w/IZn0A66/eOC8sgFzxOpO
vXU9yj8Rt6/It9MpKpfhueV//c9hsdPuc+lr6vSmcYEH77Ud8rSmksYFviRC
c9DvoyKNC9wrs7nbmRlBpLe0v+tul1gza1jPzjo9aVzgi9uVZP6e8JPGBb41
oSLz3pMMGhf43i/rVr2eFEp6c/+7TwWItkfGWwa2b039Bx+sfjwxYNIL6j/4
0QYnU1yPnaT+g6c6HJ9UobFcgN7AvepuGx9+ciiNq4/EBYejys8Fz+eeC27b
UPm54IaOys8FT+Cee1rSg9B7trI+wQ9y+gSP4fQJforT50dpHgU7zh7At3P2
AM7bA7gTZw+rJDsU8jk7B6/L2Tn4aM7OwV/7Kts5+I9vynZeT1p3Ar9+wS9y
6xd8Nbd+wZffUF6/+ZLfEAZy/gd8Ked/wJvGK/sfcFPO/zC/J/zDfwr/8J/C
P/ynwPtPnLOYvtzTbnjsVwH7IPnhnRaq1cYPqD84L4gNGj5hVdYfEfsp5HuY
jU+r86oT9RPt57w/nlTV+RLtp5A3GpI9q6/TBhHyaP/DlZDcjGm3SW9oZ4BL
w5S5BxfS/ot23Jo2jTYZ70XyaGdGic2xpwVbSQ9op5WfzE31XCfxov1Xe4OC
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
PfRn/Y8umN4+stiE9HBZ8huCkbWed+OFX2g/LWHntk/2SN/rw36qy+5LhLu5
db7/3ID0M0Tyh8JUn+crrGbXkH5msDpAEOc37rPnqmi28v7vSwzp5yV7bl6e
mqDRYQ/p55vkD4WPd3/oOBatIv3UiZHu+dQN2pXlc19Rr2i29a+/FVK/bI6t
aqDIuzuw/t+bOOHLnRQ98p/urP/301vX9DisSfpxkvYXYVDM4ynFvRX1Cl92
Dh48Qfp+I/RzlN0POWa+Tba7tpuiLiHtm4LHK8Pq+UsUdYkslu+Hc/vLLPbc
l9t6TmhScJzWkR977gh5/smSDWtoHW2Q9k2hzZBY7Zifg0g/u9k9Q1Mjzc62
fUeTfo5K+7IQebe4+EmGYn9JZf2vHSubaLZLUZfIZP3vIh98OjyxHu0vi6U4
RKgrazvBcbY6rSO1rdI9vSnsu53QTz92z1C3r67Wfh19RV1Ciq8EF7Nn/e58
zyH7cUHdg6tLBLDnRs0KkrU3nkP6qcueW3Lh46i9qwJIP1uk+ErQbugepbtn
GvmZZuz+4d6qm5eu+w2g9dVfit+EoPkjBzurNlHUJVj/1Re1P+Xi24L0M571
v9XdnfV/RCjqElZSHCsYRS8V/GdXUjyfw+4FvdwmvbcC/bxi9wwTW7vJnCc/
pnjVW4rPhe+GIe/GjCsi/Xxneb0bF68OYc8NOWr82aHOZlpfuey5B1saa73u
P4PWl5MUnwvTc4IrRzToQfopZvcVx89uPL9qfy/Szwwp/hcmT++0rtVYPUX9
gfW/059BXh9+5tK+7Mv6v+f0WYPUjop4tZ6UrwmbV/9pXCG+If+zm92D8mL3
EpEPxrJ7IAlcPpjI7ieELStPdu5bSXlQHym/E+b0O3++i5Wi/iBneb03lwfp
sP5MMY0Kdb01jewqgvXH1Mah4+oWjqQ3Qym/E1r13v7rrF8/WndxrJ+FKsZz
VS5WUj7YQ8ofhSZPu00pNKmmPOgc679hR0fjy84vrVD/1GP5Y7r227uXDBaJ
nB5E6AHyDizPilrvM/aIoT3p7QnLy5b6SL+TBflAlnfM+d0l8UXQdpJvyt5b
aXhd+t0uyC9l8fnRCGvfRT1PUH92sHj+B/t9MdQ3IH+njcP6hzd7Ew9jeUFJ
/BC7Sv/e1J+XLO4t09dpIF+cSv1Rlfy82JT9Phrko1l82Hpa4uuemWepP09Y
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
VU/2A3M+fmq8ybwca7bnaL+fUdvCiPvd2L5hHHbPr+vfNbiJvIziQjF/9lBc
KOKTeTy3+Ly/Zd4sbaXLrxtt4tVcdmflyuPJJmmIP8T8PFvg9btvmqF8CMVt
cnya3veHF3XS4XttjM+eG3+7Hj05+Jv41c4Uvwr50d9ckh/6Cx5V/2ZPW83L
Mugv3/9qtdWJuzVELvKRxDH+kHOAd7uqGGdrOcYB330CjYMYv51C8dsiPyZw
tO+48tNa7wFt5RhP8F39W5iMfWUhj6G6Y5yPMFmqQy3eg8c3cg++k84LqvmO
k7QV6rj98YsiajO0lyoDqH4ZeFStVMd51MdBtvFB6jj5kAuP146/vUuZ5fPg
VZTe/+S/N/tQNEoxSuZC9c7Az1Jd49CtXXs6hanzxKMmJDz/NCFeZvDl6v2R
Rmq+J9Kg+vSpENnRVQuCbeLVeeIRP+Y42u/zkJlR3TRuRyXVBS4x0Gn9Mkqd
l1355kJhqCxV5rXrt7TSPmpec6lbr+CcJbK3WpNWFJ1X52V/GDxs3I5FXkrf
f1Ua549U89ICZdLFgmnKL1SXDXw61dsdkFBV88sZdX50ZvU+53ne+coL3Q6e
DLJRcxerd4XHlp9RyvbZzVx3Q50fnaoati3Tapvyhk6xjsJFzQM6bUysDpqv
HB8YlLK0SJ0H/f3quK61fsOV96geHLhFH6m+bQ3Vs4M+7qW6tD/blpT2Uarz
jl1e+2b76KYrm/++eW8PJzW/tiuormy6QrnTzMLeKF+dd5yW8eTEbt8Fsg6H
b1V29FTzq9P/Wrxq/UzZobbLY/VeqvOLJ1nme7//zUlmsrWdm7ZCzSM31nn/
UzdMdpLqoXB+NNWfbSzPV8zn3Uz5vNAL9iNVSPVkxXze0ZTP21jebmP5uWIe
biLl4Yr5tkcp31bMq+1CebXiOvhn+v+Po1hC5z7oKcfVW7XouNXwMuspuDvV
h4WeYn8S8O8gz5b111hPwf2Nrk08eCZKCT0Fj8yT6qVCT7FPS586xvu3vems
p+zPOTT3QGnOFtZTcJMfXG4XrpiohJ6Ch1BdUegp9m8GD2P/2vroBOspuF3Z
tvkas0JZT8Hz7FYsiL6xVAY9Bbf/tPVpfnu5DHoKbr5cqstpQv+B4bxCqpsJ
/QX/kLz74yr/JNZf8FYTNo6tUfiz/oK/Ntxlr/HPCBn0F3xmStsuFWE2Mugv
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
s/Xk/wGELiAV
   "], {{
     {RGBColor[0.880722, 0.611041, 0.142051], EdgeForm[None], Specularity[
       GrayLevel[1], 3], 
      StyleBox[GraphicsGroup3DBox[{Polygon3DBox[CompressedData["
1:eJxNnXe8FEXz9XdndictggRBBRVQUEFFUcQAAiJGRIIYMBLMCIoZxYAIoqIY
wRzAiDmhKIqSTCgmzAEQRIyYs+/53tPP5/390bdre3p6enq6q6tOVddtNWRk
/xFRqVR6IyuVYuVdk1Jpo3Kp9Gi1VOqrNF5lN1VKpd6ix4qeKnp/0ZeLvkP0
vqIvFH296BW691Td+4nK3lWjnZXO0u/jVH6G8k9V/nKq9lS/h543QL8nib5d
9+4n+iLRN4ruI3qc6BtEDxR9hehpok9UO2PUzlKVHax0lcrvVvkg0VeLvkf0
SNU5X3WWqexzPb+H0lj9Xq7fayu/R/nb6sMM1d9TfTii6v48qHuPFH2z6IdE
/6v7dlK6R/cMVvktKn9Y5aeKfkz0XNFn6VmTdf1rlT2Quc1P1fYJVdOzVGe4
6PtFPyP6NbW3o9Ipuudu3fuG8i2Uz9DA36d0mn6vrfwp5dvonqWinxbdUXSh
et8q/0XtfaW0jsrvV36o0rUqv4/xoR+inxV9tOg7RD8h+lvR66r+A8rPVjtX
if5G9ClKj6rOi6rzl+j1VP6g8kf0LrNUvlrvcpZ+Pyv6ZdU5RvQ00U+KPlb0
dNEzRZ8p+hnRL4l+Ly+V9tE7bqf8EJVfo/J7Vf6P0mai91O+tdr9S++2lfJU
ddqqfN+K3413vEr5nurnzurPHNE1pc1V3k916oveQvT+otcS3V70ANF7ij5P
9DWin089P3fSe9RTeTvR/VV+ksq3Fb2uyvdS+fmir1V5IrqN6N6iT1O/6il1
1rMv1Xv8rry70tm6t6fqtNS9jVS/k+iDVX+0yncVvZHKm6l8R9GHq3w90TuL
PlL03nqXXdTGCyp7UWkN/eSbKO0k+gjVqYreRPQ+ovfQ2M1U/QVqs6zfH5e9
Jo9Tvz5S3kqpUP0dVP9QXc9FdxZ9iOjdde93zEnd+6jo+rpnkvIDi1JpA9UZ
pv6O1Ht9qTpbKp2o67nSFqKHq/wL5e2VvlLqQK57HtP93zNn1OZnyjdW+kLl
v/K+op+HTyi9qrIl6sMZelYT+qNnDVfbJyi1Vb3HdP9bKi8r/1tjMlVlP+i+
c0XfKHoN34QxUp3FaudXPfdl0b+rnW5KG6jOw7r+p/p5iNLN+r2n6vyo/Fu1
mamdb1T/X+X7qHyWyl9ReQPds4vKBzPPdd+hSrfo2h/KPyi7nYPUxwGR18ZB
uv9B5Scxn5Xfp/SS7m+sPtwr+k/WoOin+dZ61zW696HYvKK97rlb+bm69pPa
6690tX5/pOtHKs0QfZf6djC8QPlLKpuldKXKv1dZH6UrRP+ussNj9+0AlV2j
fJWe+WPi6+1Ff6J0n55zmPqwpOw6C/X7QN3XNzJvWk915uv3usrf1e/Ly+73
+vp9sMp/UXvnKV2r8l+Vb6Py+0Vvq/fYS6ml6u6q8rPU3s8q/461pPe/Xvn9
rBe9wyKVv6dx3l75L8wbXZuXuP4eyg/MvK73Vt35+v2ryveizdj1v9e1c0T/
FNrvp/anKp/Buoj8LfbT7ybwENW7U79nZh7jrZT/DK9nvJX/o/qHKd3KmGf+
Jk8rf1f3pUp3lP0dbld+m9IM1oPuHaQxbKf2p5e9nnsnpn9jz9L900Q/rvzF
3M9frryhrm2nugfpvhZq502121z5IuU3qc47utZM9GzRPZjHqteKcVBeUfur
2BfURnOlPqJHqHyO+v6S6leVdlf5RJXfrPKNVD9W2bsq20B0RPuiV6kfC1nL
6tunop8QXV/0ArXzsuhEaYT68LjyL9XWCSp/TPRK0RXdv7XyA9T+2qK7iR7C
nq52nlGdV5EJqv6eA1V+te59TuU/63cpMQ+4UPlE1X9U5bHqf616DVW+jfJe
Kn9S5fNV/luYS8ypw9SfQZHX/B5q/xKV36Lyt1XvFZV1Vn6grk8J8/lF1X8O
PqbfG2h8H1L+j+7rkbrO27p3U6XryuYXv+jegZHn9Bu67yilG0Qfqvx66sO7
RB8UmQcdofxhZAaVb6z3SUWvpbY7qc5cxk/lbfW8w5inek4b1cnYq1XnHfX1
VdE70He972t8I9Ffil7A/i66ser/onuvhs/pWS8wr5B7RL/IWhfdhr1c+dlq
fx3WCHuT8vWU/kU+0/Veojup/mzRUdX8fE/V/0lJ07fUjb1VbR5d9jvczDxU
Orbssd1E9+9U0zwVPVxlt8KPlUayFjK/S1v2XdW5TffdGvva65HfC/lk28j3
5mGtbx/W73TV7aV0sn7X9O4D4Udqb6Lq/ye6m1JZ4/W88ibMGV37QfcNVcev
TLxGGiq/QPV/YzyVnlCdH8PeOk7lf6usi9KE2PNwL6VLMo/tYOXrqXx3lf2k
36n6MED0VSo/Q+VNlXZiHCLzqzNZz6LbKQ0WvTj2/GCenKSxfV5tvKbxPDv2
PsJzz1P5myr/WOXniH5d9AeizxW9WPRHot+JzX/g24eGOd6CMYzNF5hv58Ze
X4zJ06qzpdIw5rb6fLjyqerzzhqrzVQ+RGPyeuY+3qC8IXu56GtFX594fq6v
vMYcUDpCv5/StUrZvHEd1R8k+jrRNyeekxsyr1R+qOgpmWV/nn+j8sVKLXV9
R82B7upDM7W5i/JcqaP6/bGuXal+JZHHugV7cdlztKPG4WTlE3VPJ+RL0ZeJ
3k73/qt7t1W+vcpPVfkklXcWfZroy0W3VjtHMkeUdlT5GSqfrPIdRJ8u+grR
m6jO0LJ5X0vGpowwIZ4uur5SX9FNkR1VfJzqX6Wyf+ExShfp+eOU9hTdWnUO
Up0zVecm1akp7cv30rtfp2tb6t1naXz+ZG4zhirbQ/WPVf0moncXfQx6iur8
wZ6F7KE29gvr+grRsVJP/d5J9c9U2ZXIhCo7GN4Fvwt8oA/rRHQeeT5PVV5P
aR/Rz6ndP3kX5Unqve9NjX8p931XqPxqlbWPPScqKu+n/EreQ2UdYn/76YHP
cG2x+vMfz1feOna/D2Ef1e9jlY9TP5uq7ADV/Ztvo+f2Y6y0Ti+HByv117X3
lS8Je3E73TtMdc7Xve1FHyX6AtGN1c5Buv6Xfm+p8mPYL1S+heijRY9FXxP9
nOhXK+YlvwZ+cpHKP1S+XOVjRL8h+kPRt+jdTkL2UL9u1/O7KJ2ke+5SvovS
KOax8rvKXgPb6t4hqn+u7l2SeI69RduJ59LbVe+jzKlbq95f2Wdvq1qWa6N0
vH4fqLGNkIH0/GN07wiVfaw6g1ReUfmvKv8vt45wkfo2R/Ra8CyVt6i6fJja
2lj0XuzDog9IPGdfVtn+iefgS6K/0b2D2fdT833W1k3oB0p7ix6ue49S/RNU
/yP2AaXdVH4Uel9qPWJtPbdDavl9sq4/nVhuf1z0r+hOKu9FffXx07Ll8+8q
ddt6qZPy75V0e6mz8h+U1FxpR+U/K2l5lHqgrynVE91T+Y+VumlZ6qr8UN24
juiqbvqjYnr7ivUB9IJKZlmsnZ65udKfzDmV71CxPIRcdIXy7ol1kadF/6Vr
zVS+M7o5a0l0d+VlXWshenfRzybWaWYxx/V7fWTXCh2RjKVsN9E9Vaej6jyr
snFKH6h8GXWU/ou9Nv7Si/SnD+rvqrLlYcZxtfIHlFaLXqM62+v6vhqMuXqf
reDryucpVfWM7VQ+Krb8sy17Cnup0taixyEnlazfjdL4f1P2/cjYP4X6lyfW
/WvKL1E/P1X9Verj31XLOd8rH6X0gspfV/lE0Z+I/pI9S/Qi0e+LPln0HNGL
RL+s5w8LusaaoJugI5yhOq+ozjsVy13oEWABPwY5Cp3oYtX5WHVWqs4Heve1
4a3q/2nKf9D1bZSOE71C+aZKm6n+ANU/RfWfUv0meu7lyINKZ4p+QvnVmXkL
PGbTqsd8lOp3EH2w6NGiByXmRa8hHyXmn4vYe6vmozci+/M8pRXsN4nxk5y1
rv4sZa9QOkr0J8rbKB2r529Ytrx3qe7/TPlXetZylW1Stpw8J/N9o5n4mff9
I8QDX8w8B2YrfyFz/bOVH682j1Fqrd+XBX1ktdocl1g2LqNnBdkGmXtSYmzh
atVdHpsG87lPdRoGvvmdyrvHlrfmBVnlRNFZat7+PjK4xnEL5Bblaeq94B0w
pch8HP6/lcqahb3n3sh8mf3itsQ6QmvlK3T/1qp3I/iN8p4BNztd1y5k/jOu
6LZ8I9H3Kb1J28ofC/jVeezFun8cawZZRfW7qp1z9Xtv3iUyNvdp5rZnKH9a
de5Rm6eqnW66fkHZz1gqetfIz/6RfTs29jc1thyCzLGN8vWD/PFgZFkE+Wk7
lW+AHsh6jSwjQXeNLVMdQ5vq56aiWyqfHVmHojzVNz5OeQf1bVli2XkzjevS
xHL1pqIPSyxbvqH8/sj7OrIUesn+Skeq//9k3ienqP2T+EaqswnyXWLZ+C3l
7dSfJmGv/SvzXnCt6kwLMgn79eSw53JP27D3Hq72r1O9dVSnqvy3zLLHZOV3
BVmI/nWLLVuyT/wkemjsb7Ot7rkEuYB1jHwWWba/M7FsvJnyB1R3+8hy8huR
5f7Ty9b50f1HqM4HmfHdO8E+1dbZZeO6O6ju6LLr7R4b86TeD0FHAAs+KXGd
B9TezZHlEGSa6xLLRc2U35tbv3tUbXbLjYMtE32h1sx7avvzitcc2FgUdE50
z27oxxWvc7Cyx6rGtp9Cv1B6RGX/qawcmyewL/6Ref+9Ws85Q3UuEv2N8t2Q
McL4nKzf58Af2ENUb4Loacof0u+3mY/Kr9HvRqofKX8KPhe7rd1VdrHyJ9SP
eerbk8hUqr8auU/pUl3rr7r9Av267p/IvFa/7lW9xaK3TKyTgbGDC7ynujtH
7tMJiXHl29AHdW8HlbcFP4usUyMj7ap7O0XW6Zao3U11T5eadUbkmbNL1hep
e47oBhXrtshUxyfW7W5V2UK1u43u2QxcEF4R5K7zE+vR/2psb02MY7RSfmJu
2b258lP13F7wFtEjM6/5RaJHZOYVi1kvmdf+GNFtwrvwTo1yy/3HKt8orF/W
8fqhfZ7TNLcucYLyEzOPz5miN1Rqi16mfHiYo6+J3jisTdYoa7YBcnnu8X9E
7/Vu7rWJTH5E7jn/OntmbnwJDP/i3DztLdHnit5cqSP8WvkJmdfRq6KPz7zW
TqXvYQwZS+bSHvA65aerzp6ix4nukhvnvFv5MSov4G+iv8qMz+4mekVmzLan
6KOQq+CH6N+ZcWDw4EGZ9RT0lQMyY7lguuByYKdgqIdk1nfQezar2d7wUmbM
8amSMci2NeM4a4lHfpkZQ/6B960Zq9pO5Zl+r6u6U5XXU2ou+nrl7VVnc7X5
vu7bQnR70R+KXh4w5e6q065mPKiT2vksM9b9ufKlmdc+PGDTmnG0+qpTVrpF
32iByjsp9dazLsrN3/YWvSS3Tt1G9NG5dd6NRR+Ve29kjzyhZB25lehhufG9
K9Tmh7l17Y3QM5U/kNq+0CHoy/NZC7l183mib8mNH/wWMAQwEPamucpvSly/
ReJ5yfxslnseM58bK58VWTc/Smnn2H2GvjFx+82RZxLr929qjLaP3Wf0mSei
0E/RO6l8q8j6fGd0w8jYwY6x3x2dB3kVPPCy3PgPMsBtuTET5ITBytdkxlv2
F/1jZgxntuifRJdV5znR96GnqN0Hc2P1YAWRvklDfaMJ6uO+hWUk+O0nuXks
eu6hon/JrCMfJPo10c+qTl/RVzHmavN55Qszy3KPi94hN143Preey755ZG5d
GHnpMMayZj3qd93Xqmb96s/MeBe86CvV2Tk39jhB+Uup97T2uec5cu/+kbF9
MP8DYmPsYObbM0f0TgfqkWfoPR+pes/pomd8rHpRbFnwsKrlF2Slr1ThHZU1
Lnu+11M+kz0kt+z0ifp1eNXyD3LQcVXvC+wPzHn2sq7M69i85V7k78h7TSOl
0bn3hY9Vd2jkNbJcdfaIzZduFH282pypfL7avKBqTPpT0a8hP6rO+kqdEtsH
sRPulBiveoK5Fts+sqTk9bi28kEaj59j2xKwI2Av/rDscUCmhkaurtOTlDYS
vW1ieyV2y5FBR0DHOybQjUreg9mLwZQrsXVS1LKxielJVfMK6u6i905iy/3U
Qc5fVjamjT1raaCfS1yOPDA81EdHODYyz+FZ2LhW8o1ED4msAzDu8NWW6Ll6
1kWJ66CTnhyZ36IjxEF+QLaAH7ZC31T9UyLzRt4R3XFVaL9DoL8qmYe3Vn4e
2E7F/Jzy4aEPtI/+wbsw7ofEtvGAh58Se2zRQ0+NrH/R1rmBxtaCvWINso3o
8ZH5P/j+JZH5fPeS+XFN9F3KJ0Vej5R/GRvT6FHy+qR8aOa9A/vaXrnXP3wA
3PXsyHsKes3pkfcdbAZjIu8v6DUnx9ZttxJ9cWQ9CPx3UMCBwYPBt79lX0us
F0OjJ58UWUfme0xM/F7YiM8M5dQZGHRqdOvOifVXbNr9EuM2U0RfG9mehC2p
eWxssLfowzNjxr3hOar/j8r3TYxvUodrLwOMcG9iPgg/PAIdUL+/LttGxpz/
OnyXMbHrYHe8TPf9VfZ4DhBPnAr/Fn86MrMtZb/cfBZ+e1jmfRwccYDKJkfG
WukndjD6j23g1cR7/YDE8j91hinfMPb78h1Hx26za8n7O3bnfmqzR9nfjvmA
nYu+gXs+mXi97wyPSmxvWQN/i8xn0OPmxZYFsEE+mnhObq/8u8j2U+6Br1wf
eMsDYY9gr3g8sT11B+Tl2PYy7GTLI+/X6HpfRGEfL9s+ie20Wdm6I/pCA6VH
EvOf7ZQ/E9t+imz9pN5xN/Y15RtrTZ0f+/ekMOfBY/snzhckXnusG+xlyE+s
65XM8cj2U+RwbKf0v6noOcr3V7pMdNPU9A/wBuUrlHZV+f2JefXWzIvA/2ln
psa3Pry5Yv4GLwJz2yUxJvGEro/h+6nOWsrHJ7bTRconJN6vY+VxxXgC92ax
eQUY2YmReQV2fGSpOv6G7qBUv+y95slqHRRWulx/iti8F7ysCTiWfn/N94+s
+6NTPBj0bnTAWexHZfvM3Jd5TzsN+TDsR4w/eys2t4cz79d8u4dEPxpblmb+
9EiMD81OLLMxlncqX5R5/C7NbINkbrLW5iTGzFqrj1cktpuslZjHbB/4DHIw
/HN1Znm0jvdmxtuwl8GXL0mMxSWs68R4VZeA73UI/Bl5A7+Pi5SvFZu3gBU2
im3rwh+lcWz+UGcPCnwPW9VzVfPaXdXmPonLXkxsW4UvYu9uEJs/84yluX0n
8EXZIbWNqZ7qzE1sp9oY2SQ2/+Q3axkMjefC01jDQyvmq/h4gBmOjrwvbKd0
YGIbwkhwWezK8Lqy5SvyZcinsXkIfA4Zr5fyK3LzLjA67FPIZvi/XBx0CJ7L
twGzwqZWdy22bYXnXZrYdyVNLOPtLfpK5PDY+gs2jnVi8398Yi6KvC90LdvG
zPfEZ6AWm/+DiyJzYreZrHbGq3xs7HaQUbHtXJ6ZT8KreZcdU9sHGyXm+dgc
6UdLfaMD2KP0nI1EDxR9mugpYV+gDjI3sjc2APRKdOLjc8vNyM/YCY4OOkUL
5c9G1j0pRz89S/XvTi33I/8Xyqck1onAKocEnWLt3HoIba6bG8OiPlj/U5F1
BGxhyPTUx84FPgS2gx16QKD/CPtCg7CvDQ4yfJJbFwMruiG1/osd+77Ueg66
Q5Pc+vJoZLHcukSr8NzHIusmPHd/7VnXq+87aM+6PjbeBfZ6baCHl7zmcCSE
n4DXtw+8C556fOTf1EH+Qy5aEWjqw9uQq5B5WHPs/ezlyG74K6wM5cgBzAfa
HB7q78S7RbZnLQ18EHnp28Q4A1glmCHY4Ikqn5pYJ8Wegn56hMpuxKcgch3G
H8yQNhmvm4O9DLvZPeBBkX0IwdOgkbEb5MYb6+fmx8PD+yIbgjsjZ7aJbQ/i
G7FewBPw+aif2k/yzqpxiTp5DJ0lMkYBhjYjYFBrlY2nUf/SkvGeHQM9LbG/
4l1V+yNBX6byJZHroHuARRTKT0fXTt3mcN23V2zs5a6SsRf22PNy8/9dIu8f
4DM8/2yVfxgZt0HP+Szy3sw94Mb4W95QMr4HfXfVOFXPUP5kbBpfzE8i4zzo
P6sSPwtcEZyF8Tk2M4ZD389C5oyM+bA2V8W2QfQtWfdDB/xPde+MjItiuwTv
bhbm6g2RMVV8LKYHGr+L1xLzpYGJcR/WEfZW8BauH4BOGhsvACt4JzKmxLtc
F8p5Fhhuk0DfGhkDxO4Jn8OnARn3hsQYFLbFLWPj8MezxPSMgxkvra+BWms3
6PpHhfVb2oxz23kbhzaxDTQM9HuJ3/eQgKd2D3MGnWlYZP0IHx3mIDoUuhM6
VJTZxxfsFLwOvQ0/mGVh3aFT/U//ODKswccS41EPVa0rYytCH8HHAZ0avRHM
irJfU+ujh0d+Br5tyI1gSei06Fj4Cj2cWOfGNxXMf+8wH5YEDOcM9XNAbJ9S
9F98gZAz0WmxT0Gju+4f2kaP/zuy7wX9wQ8Mfwx8B/H3g0affSt2nXdLltPA
YJFpfo1s86JN3pE+o0u8lHs9/Zwbw8bfhbUKPS02NgpWelfAQvENwkdoetW+
RPjjTBM9L7e/GX5n4KZ3h/rguvjcsD7Ba28POOwrsfuzoGTsljrgt+C0d4Q6
4wM20jk3rsG32En575G/Ef3/ObLPYXPRvyWmxyT2SzkolM8MGAU8hHH6J4wV
48SY4jMJrslzeTfsXmAeYPIrwhiCX3yXGMPEpoN8dH5keQgamQl5CDkIfRVZ
CH0SvRL/zd9CHerjP4hNFNnmp0B/F+7F7vhtoNGBkecuCvIbvqDnZ5YbkQMv
zCwH4r+KTHFO5P2FPQib5f/2I/AIZFPka+ziyNjnZC5Dlsa+y/6zMrTDPsVv
MCp0XfTcIwvLPuvWjHWD07yRWy5DPgMPOT3Iz8jRYzPLmPjrsseh0/Ib20Hv
MOfRR7ALoActiG23nV+yjD84MnaC3WyPwJPBkaGRz/vGtj1gd3gg8TqaUbXc
Tjn9Q07vH9pHfz0jsg77c+Lnjg52ir7h+7LHgZXw7cH2wJ7AnbCp03dk7B8i
+7KC+/yk3/tFtnegQ/UJaxXdjXJ0qwMK+7PvUjOGy7ufldlO3Tf0rV7Fvh34
dYwMeg36zaLIGDs+o8iz+CchB6ITTw70kMJ6w/o1+81ga8JGg78Fdh/sTewJ
7BP8xh6FXQrfGMpvCvsFPnno3+jwzFWwjF0CP7418GR8WCZE9mNh3iLjgnuA
H+APh1x9cZCr8S/qn7tNMBZ0fnR/dHnwCLAHMAF0DnzguoR1cWFYC2AHYAhg
EYML6xDrgb9m7he+ScjFjAMYAu+F7xHvj05wfWR9YFXVNsGOuv/Lqm1b2LPQ
7VaFecL6Xh3mQN9Ao9ui434d+Cd1vg7l1PkmfLt+gaaceUeb6IzY+ugP74xs
Dz68b8ky+3WRZXL2YMb+aL3Lwqp1AWR73gsfL8bo4NyyMDID+zk+VegItIMO
gNyFjI+sz1gPyYwJbVVz+bXhWeDl+OBWw7t8Gd4L/ODyyNgBeNikQCODY3NF
JkfWuDuyvIEPFvZb7LPIlciX//PtIz+xsCwD7o/OAWaPL+D//PDIsREMz22L
w48UWQD5BhkDm90zkW3SzE9kmn6hP/jDMRbYvZFlkWOR07FVI6sPzT2vkZeQ
c6mDfZx+YkdHTkbWwFfg+DD/sUkjO6H3PBwF/Uj5PZFlZvzLpoc1AsYE1jRM
73hT5j5i+7s5sz0dmztr87YwJ/F/QrdZN7Guhc7VPrPd7/nI9mv8Q8HRepSM
EYAV/JD5u/Atuqt8cmI5C58K7AmXhHL0sycj63Aj0G9L9pc+Lvf7oYvhW/F4
+O7YatDB0IO2DN8FP+rNI/sK4CdwTNCb2mW+99HIdhZsNehO6E34a1KGfQd9
7pHIOhZtzgzfun14LvU2Ct+ab45cjDyELMQ8ZH9lTSLLI9NjT5+e2Za+peof
Xdhu36Jm+R45os4nP7LPKxgOdkvkV2RXcIWxkbGFuwIOjA6CLZ+2t8otb7wV
ua2Fkecccgy+AIsj207QG8AHwXaQ65H1zwk0WBJyPnL9p5H5NbLz+6HO3Zl9
OrbOrYt8FFnHuCezn8g2ufUNyrBxHFPYBr5Bze28F94Fmyo+ytjosaviT35y
7u+2Vfh2+M20C9+XbwWNrv5C5O9BneWJv8ewxN+kfag/M9The2+eelyOTWw7
vlhlz6HvR7YjU//2qveoJVWvUcaNOT008Ry6o2o5rlMYW+zF6HCjlL8S2S7M
OL8UeQ3Qt1cjy17IXS9G/gY8G5syvtin5PZL5H2PTmw3n6jrI3N/K+pTr3WY
/yOCfM0cA3flmfOj/+/XSN464MGct/mfPzPnZ5CZnwh2InQB5FN87pFR2dvZ
+8GHkZ2/DzTyBXs5e0GfUI4MAD6I/MFZGGTOP8Kz+ob6+KfRB8qRRXkWMjo4
I2tkWeg/+io66HGaIzMS0+ie56NDla1HXJBbHkGuoA/fRv6NvPxb5PcBu6Rt
zsSgW4BrowsgRyNPTwm8ekH4LvTnx1AHORo5u3lYI3yn4YF+I3wv5sLCMM7M
KebfCWH8F4bv3iGUJ2HOzgtzFX992sOPCHvm3DDf8N1HJ8DfY0DoDz570zL7
imyRm29w/hD5/tjCflsb1qwvosOfH74RZ5aQLfErpV/4b9yeWb/B34M5iE8J
escdmTEI/BxGhTnM2Y2Xw9xNwrxk3nEm4vAgxzyb2+8cn6nTCmNgN8TG0NCP
8dOCx+JzhX8vehNnt7ClYJcBw2JPa5Xb3w4foIg9UuVHi/4r8bk5ypFL8e3n
DAj2CLD8YQHPXxYwVewj2C7xFyqjX2eWrWbmxn3BfzsEXR7sEv3lvIB/ss8h
h2BPAovk7CA4L3oIPn2c50QvwEbQMPZZzv8S05wBRH+hfuuS8WL0HnwXwYMb
B7wX3BOZ54TCZwDp5zLkydh+h4zBQ7kx7O+Vt9Q4DFH5H4kxe2jOuHIODzso
NlD8dvCXHhP2gtNDP8HMTw24OToLtkbwZM7UoaNdqT6vzj3O2P3x0Tgu9GdY
sJXMK/mcG+esOGOFDYjxvz9336nfKny348M3+iV8F+7lDAVn39DZf0+sd2KT
+iU1j0G3vbfqd/uiaj8x6t+DDBj7uUtL/j68F3sc9q4WsbFrzomAfaMXcOYK
HA78B7kO+xkyw0255aB7U8+R0WGeXJJbhzsqtR6EDQYsgzNdrUq2XaJLYl8B
Z/kktq9zA9EF509j+5n/k3iuMJ7gkfgsIoN9lFh+xL/1+tRyJVjup4nlRs56
0AY+IsiNnyf22/xA+ZTYNHLLNlXLehMqxn/BgcGiwaHxmwRvBvcE/wS3/Dq2
XyXvfGLFMviAYLOoF+YnNivs7vjaYifAXnB8YawdfB95e//MuuMjue2f68Ze
t9iTOQvXo+Rv0jTMt/WrfhbPvCD2t0GeXxDsdJwJQi/GHtOy5PN7jCd+43U+
ArH19NnBroSf7azEawN/P+ZXKcyxz2PbStDFsOdXY68Z5vB/keckmC1+gdxW
Z9uPbZ9D18XHA8z5+cT0M0nwQYiNszFXGD/sArzfGYE/wEM464j9qC/++aq8
H3YivfuVun5nxbgaZz7Z+/APQ6bBLwXfNWQd5DH81cCEkfceTH3WZovCGNKd
sXEk/MyQ+eD56FXoe+hWYDYdA9/G/wY9C30K2xs2OM5r48uIjHlSYfxgv9h4
An6i6IYnq3xflfeJfe4UPQ58AT9FZIl+seVVdHcwO7ALdEP8GtH7vk+8F6+T
2h8FDA9sYWBsWyrywMIg/7A/Ik8ht7HHvZXbl/JN9hpskJyFqNl3ECwaGXJM
kJuRG3+v2o/3/ar1LNYKOsuFse1HzN1LlV8SW//dV31qpT71Tu2DiFzbIfc+
3CHs0Qcit6mPj6reUNEPIftxFkP0I6LnVCzzIfsh432s+z9Q+x8pH6bfDzN3
VGd27LFj3NAvke8Zd+QR5BK+x2rVH698pfLnY59/5BscpN+3q53HOJ9RsZ2O
9YWdHts79mjs5oNiy1XYKPAHwk6Bbxo+apx/xD4PXWejj23nBT/BtxXZnLgE
98fGN9ENbs/t382YPBzqI88jV2CTYO9nbZ0c1hdyBT7fYNFgIJSD47G/cBaC
vYQ1NCKsKdbR8LCWD86MnTyd+ywHNiJs33X2ndg2bp41KrTJfjUytFmpmIYX
c66d+isDP4IvcRYVrHhgmG/4tSM/bh3sFdgw8E3H9xcfBGzizVL7ghEbAbmU
89VgIJThA4W/GHIXZ8iZ06/G/gbIuqMK46zb1ny+GtkSf4nTq97L3qp4Pe0b
1lTP0Af0GrC63mEdcf4SX2R0HORGfLvRR6aFb4TO0zl8C/Q3YnFwduCLxOeo
+bbYemqp931wac7cch+6DGutR+z1hozJvchtH1R9/qkhZ99j49ToLPARZDP0
1XtS7zXYMSupsQfshVHq9TW/ajsJ9hLOI+DHfllsX/Y4tY8GdfiNrzt7Ffnk
/0Nz9oyzcFfG/g2NrXJK2O9eqdr3fqPUZx15DmcZwD2wU2ILYn+bGvY4bOL0
DfsR/cRXhANP4B7YWjgfgd31GsrLPldBOfgeZy+5zpkL3gv70AGh7/QPX33O
Z/C+fwc5BHkRvI/v+2SYY8QTmBmblx2qefK58ieUr1Mx32DNcs6cM3actcEH
Akyb80W8J+/7qu5pldr3nvuZ85+GNYIcRNwBZCHiE3wY+zw8+/lnsff0xpXQ
h5J9DpCVOHOEPwsyK/Lq57nt85eHfQ3bP3s38u3y8F6f5ZYTiTWBbLs03HtQ
4fgQlxf2OYDXclbu2qrP9s4N+RexY3M0DM/dNezzyE+cE4PPcW4W7HRB1fz7
pcTnTh6PzZugOYsypWTbL34n4BInZ8Yh3sH2VfE+wpoiTg36EX7wzGvmN79p
j7bAHTgfcV9oE54H7wOzANPAPgqu8lnV4893AOsHKz0ls42GM9jo7Oy/NwV6
rYpp1k79ip+Nrk4b+DMTE6dBarpeah90/Gdok3V5T1ibrEnW5odVn7Whzl2B
b8I/Ob9P32eEd4FPwNPBjNgDOUeNzIbvBjZp5GDsrtD7hDrsl+DLvcJvZDXq
Twx14O3EbmB+IO+NCd+I7wXN3oR8OCG0A84zI/AxZJDxoQ9cHxvqIL+wJ00N
Y/5AGGdoxpx9h3WNLwI6JLgl6xqZFp0N3Y24H1nFfe0T+swZYM6K0/dxgeaZ
48N7XV0xTgN+0rFi+R0ZD3/wVYFX4GtGzA7sKegrnKlDl5wVaM7WgXWzB8D/
8XPj3DeYADF30MuJuYH+hA8u+y8xUDgXvmPinPr46YItYP/jHnQQzqJ3Cddf
D22+n1tnQrdiP18c2iQmEdgJcT+OCuV1MRAi2z6x2eJ/93ZoZ1Gg8ccDh0EH
Q/9Cr4K+OaxH4migy4B10Af6O7ZqTOiziv0NR4d+bh77zDI6BvjwJrEx6uGF
7dUdapZPOYfM+SXm3sbhe8F3OdcG78V/CGyes7d3pbbD47uCf8oOsX1krqp4
PwS7I4YCWDU29cWJ94oNU9saWsW2fTD3WobvzlkseDZnqznThW/N68oXJd7L
2NOmpm4TW/xnifv2LrpX1f0ZX/HegV0f+zx+BPh8YHfYNPaex17GeTD2Oc4F
4+eOr22Pku1gC8NcQjZERmwU9pHVcdg3U893zuCfWljn61nzfo4+j/x/SuF+
7aryowqf9d+45hgi8BjkAc6z1eHwAV/5JvAi9rivYu9ttPltbHygZ2h/TJjz
v4R5zp6Cr8llYZ3+GNYs/BX7JTwWPxTqsO8gi+I3wxk0zqJBs8f9nBpzwn6N
TIV/OXIVMW7ADvHzhHdxfgx5BZwKOyjzm/n1Xuw9ktggnElnT5wbW2ZuEvg+
/P/0wjanWWH9oqfQT+Q81u6s/7OWnwk0MjftINfBX5+NzWP5XtSpO9NFf0M7
zDPmGz4cxKtZEuY/+g22T2TOMzPbYDvW3PaLoX3qvBBb/kcPmBNoZEvqTAp9
mRto5sv80M/Tqh7DNyvGXfHTXS/Ufz6MA/7GAGUDc/tn4KcBZsI5a3w+8Jf/
u7COsZPyEcpnw0vV5l+F9Z8dlW+ifq+oOu5QIvq7quMgrV3zuf3eohvUfL56
H9GNaj4/3AdZoHA8tZ2VV2s+w9xTdP2a47n8rv7MLxzLrJvy/wrrTl2JKVXz
Wei+yEg1n93tR+wj3Xcre4voxjWfhd5PdFRzfIHuouOa43r0IFBKzTrbLqIr
NZ+R3lX0gornHTrXv4V1PNocovxBlc/m7FPNcUD2xs5f89np3UTvJ3of4lyg
pyufXPJY7aHyPolxkkWp9X3GdlTwp8Wvdk/VmVe13/IfhXGBzsp7q/yTxBjp
PqK/qdhvp5voUxLr6XnN5713F91d9GmJ9fSnCsfO20F5reYYCntiH645Xsle
ooua45jsIbqN6G8rPpuPrRzbMTbk3VQ+OLG98oCqx/kR1dtd5V2qttP1wh5T
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
4QjF2g==
          "]], Polygon3DBox[CompressedData["
1:eJw1nHP8JNfThUc9093f5BfbGzvZ2E423Ni2bdu2bdu2bWxsGxu8z7Nn3j/6
M7e67r2N6a5bdepUT7bxDitv32o0GisUjUaH31m6jcbLzUZjuXaj8SXth3uN
xknsXxb9n3Wj8Qy/r6N7k20SdB/TZyHa2zBmM9onov8H+W+2mdG/znY94zd2
P+NnQ94B+T/0s9O+sGo0FqW9A+NfLhuNg9i6nMhc6JYfaDTe4PcG+m/C+H8Z
Pz/y2Oh/pP+SHO8f9m/QyDlNhO4IdF95bLZZ0U3Ovg9pj8b2CP3f43g3MfYb
+i3L/J+xbzF0+zHHn/T/ge1Z5M29BnTPMv4CdKuz/y+O/5znjLwG8nDkX+iz
Jn1PZs59aH/N/ieQh3JT90J+nv4X0X9N9v9N/7/Ytwn6czxeN/f7EMZ+RP9r
aS9H/8k4t5XR78Tv6Owbgr6kPQ+6CdjO8V4xx4S0v2HeZ2iv1Mrxz0f+j7ED
9J8X/e4cc1T6f8z+SbjeD9l3H/rtkZvIe6JfqX+sd2n/w/3ZEHlp+q2A/lbk
3Zh/LuZ4gv/mY/Y/gH5HxrfR/8wx10B/YjPX+xH6+9HvgL6F/gp+R0G3N9uO
6FfnOHPSvoOtg+4T+j/o8X3+6P8d8nPI+yBX/j8cfzbmf897g/wT+pfQH4B+
ZOSbOKfTmes75C7yp+gfQr8zcoH8NfLTyHsg95BvZL5tmO9T9t3L2G2Z90za
P7FvOvq+yXYj8qbeR+7HNMjfoluQ7SP6voV8E/rNCm8y95g5jqd5Edd1Hf1n
6eXZnwh5RtpbMuZo9D+wb1rkH9heQN6P8QOM/xH5ReT9kUdCHoT8Pn1HYnuQ
sb+zrdfOf74/7W/RP0v/velf0v975OeR90Wukf+hz470n6WZ8YuiH99nB/l+
+rxE+y/0j7HthvxrN8/u08jj0/dm7s8utL9izlW5tluQd0X+xncAeTbGj9nI
Oz5rL++w7/Kk7B9Me2G2cWlPw7aAOubfA/28zbx/fzPfJOg2Yo5vaF/Btg76
J5Dnp/0ufQYjf802lf8l24noluFc/+D+Tu0zj25+tg/puyDyG40c02PfSL/x
OpEXQh7wP/Fdpz2U+7Miv1P637CtQPt2jrkXc33PHGtxfZOx723kG9jeL/I+
+n4Mov/ytKdn+wXd6mw/+bzTZxjv3oJsOyBP7Pmgm4btReTVkGdg7BT9433B
vmXQHdhM/z+qnK/n/b+B2ARtw1veU/ofyDYP8jjoz+RaJkP/pP8tx3uHffew
zYx8m+8Tuje5hudpT0d7euY7nPGLM34i+p3L+GU53iGMfdD7hH72OvNdQP9p
kZdHfwT6h9CPj9xi/y3ot2HfXex7m/lfQL6C/TOgn4z+2zP/S+gGDcTm+/wX
XNMctJdCvy9j70M/LvqpGb+2zy/68zn2VMhrIe+FfB7yOWw79+3fYYyfk+O8
3swz8hvtKem/SiN97DuuaxT6izjGUxzjA/ZfgDwR2yHI8/nO0t6A8X/QHs6c
7zD+CHSjcT7v0/9c9C+hP5h9TzL/XcjH03ca9G1+b0XeHv3d6pHHo30Q2+PI
z9H/PvSjsn8C+j/CvkWRP0V/mufD8a7jeNvRfozzXYrjXYx+Wm1gEft+P+1T
OP8nkJdivsvofwf97qX/Jdot9Js387xPgX5Z9NuiPxv91sw/je8j8vOuL+hr
5nqWvpNxPn8g95CfQZ4U+TJ+X0I+izEru3b6vtL+kfHPMn60bq5nHK/P9Ytt
KtpTs71A+2rXUMZfyZj1fUaQH6H/HOiH0d6L/3sk5On7z8euzD8XfSv6vsj8
L3XzbkzL9jLtjX1P6X+P95A+e9N/Nm0Nvyu6PjHf663MuR3Xsgfya66tyG8h
b0W/qen/N/M8V8f/+BL52mbs075scyCPzv4z0M/B9hS6Czn2dD6/Zd6PTRl/
Orq7+D3I56GZ65sc/TLot2H/WegHIS+NvHUn7+P5zL8x8mz0vRh5es5vds7v
DPY9ie5rjrM817qCNpT2cWwHoZ+b+ZfVFtD/W/rW/edtSea/FPl25r+H+XZE
/zD9j2Tf5LSXRn8t7bvR34d+5Drv5+H+T4xf2PUQ/dXob0W3EPJpyFch34L8
oDbF9Z3zvQF5QfSnIl+J/mbk4ey/mvneYJvL9Qb51GbewTmQx+1l7dDH0ddZ
lPHnMf56xt9eZz1Zqx2fRN9k3yr2UTs5Mef3Cb+HNuMDXeX7yfgTGH8x469n
/KzIByOfgXw58gLIpyBfgXwT8jzauGZ8NH21V9k2Q37cdx7dPfQ/3PeP/VNw
vNf43ULfhW0S9IO6+f8f55ze1Zft66dBvoj2/Iw/meNdrk3meM+zb51m1qR3
GPsC8nrNPPPjIV9c5f/9qhv/ajfkl5lrGP0mRN4b+R3kD5EnGojPoe/xLfNP
ifxif76J6HMe7cHoD0F/JvorvB/M+wr6z9B/7rPNdjzya2yzoVuB/vfQ/wn6
P0L/v/l/3kU+UtuiP4D8HvJRyGMg/6d/gXwM8ljI/yIPQz4aeUztP/PdivwI
8z3MfH+ifwv5UP049MN8D5r5Dw7SJ3a91FbTHhX9MmXs3T30u5/xSyBfgnwb
8t3GD73836vR/07kxdFfjHwr+ruQ/2X/jdprrvdm2q/R/3z0G9F+wGed/hei
/wl5HI43h/83+nMYfzX6OZGPQD4X+Rrk2ZEPQz4b+Sp9gTLP/6nIlxqPIB+K
fBbylciDuaevMv+XHP8L1+Q69v8I9k/N8cbh9yHkc9A/qX+gj8T4hxn/EH2/
d41o5B36m/ay6G9Gfgj9g+gbyB/wcyy6sZlvsTLXdwP6O9DfjHwGYxfpxR+4
vkosMj77rqb9HZuBmj7+A/RdshdfU59siV7iDZ/ftYrczxd6eX/WLnL/tb+r
MddJzNnVl+7FPqxbZL3R39b32s57SPtLj4m8rTbRtZo+J7i+M27pgfhr66I7
i32V/hbbebS3bMZffroX/3jVItf3CvK5yBsUsV+XFvGtL2cbFd2rxgiMPRm5
h/wU23H0X6WIfXlT+4L+NPSlsRnn9xjy/OiX5Hw67Du2nTXruW7OyXP7p5H3
d3fk6WiPRP9TmG8PfTrkkbVzyHvqryH/D/k05H30cZFHK7I+jPDhmW8PjrmV
axzyb8hnNhMvvtiLPV2niP1+jN+j0R/D1kbXcF1rZF/LWEp/mPaj9BuifUD+
h7lWYK6lkC8wjkI+mz41/cdk/7LIRyE3kXdjm9ZQhH4nc7yd9G+Ru8gnIu9f
JZ6fmXELMN99/BaM/cxnTN8K/QPIR2tPaI/D+EeRT2jGv9V/Ot9r43m/3bWL
Pp/Qvl7fm/kORl4CeRdxgIHYqyO0v+y7gfYw5rvG9bOIfXqC/pe0ExNNTftQ
tiH03Y2+C+uPdnPsH9h3E+23e7EfWxR5v97pZX3csoh9mrub9+UP+t9K+za2
v1rx+ebtxn88jfZv2hPa1+mHGi8i34i8tDE4841lTET7TrYG7UH0ucVjII+q
79hfr29l38eN9LlLW9HL+rdhEXt3D/ta6N5lG6xvgzyarz3y/bSv4Xo37vv2
t9U5HmKjqX/ZzfjR9QeQH3Ctov9ltN9m/mvpf1KR2NCY/F/07/fiD2zL/kfR
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
z/o/CpD52A==
          "]], Polygon3DBox[CompressedData["
1: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
          "]]}],
       Lighting->{{"Ambient", 
          RGBColor[0.30100577, 0.22414668499999998`, 0.090484535]}, {
         "Directional", 
          RGBColor[0.2642166, 0.18331229999999998`, 0.04261530000000001], 
          ImageScaled[{0, 2, 2}]}, {"Directional", 
          RGBColor[0.2642166, 0.18331229999999998`, 0.04261530000000001], 
          ImageScaled[{2, 2, 2}]}, {"Directional", 
          RGBColor[0.2642166, 0.18331229999999998`, 0.04261530000000001], 
          ImageScaled[{2, 0, 2}]}}]}, {}, {}, {}, {}}, {
     {GrayLevel[0], Line3DBox[CompressedData["
1:eJwl0ktIVVEUh/GVN81Kq3lgKAQR2UjpQZcQEYkEo1HYILAcKJgzSUEaRFSD
oiaJEpmCBQlCj9vImiTkTLB8lK+rZmnTjBSR/B0a7Put/3c2e521zy2ub7l4
fUdEvLaKFEmdszOiWPEvJ6JuV8QBrll9jJtLRTRwh7h2royb3x2R5Y9zt7k0
l+UWuTT3ID+imjso18jP7HnI1XIl3GXuqv0v+UtcKdfENXIZrp47yb3Qt40f
5pq5Cu4Dd5cb5Vq5EblTfuPZTbnXGefUz7khHNT3Hn9BneFG8JH8B4flKftH
1d3cX/zMdSVzu5Mv6ifJvOpx9aaeT+X1vIgr9k5wW1xPMr89k/ICTuEifsUl
/IbfcdmaVv/AGfyJs7iCc7iK8/gLs7iWax5nb+i1IE/jQPLNzDQm/zb7x+Qc
fIsz2I9j+Bg/4R18j0PWDXU/NmIn1uF9PI+38Ay2YSm2YBF26HVUz1m998vj
2CdXe8d9chUWYiUWYAXuxbO4B9PoiuM0nrIcFyfQ8VGOrjLK0Kjxzs8RZ+fp
QcU1d5vhDnMpLpV8Z7lE9ihe5f7/D28Dbh5hyQ==
       "]]}, 
     {GrayLevel[0.2], 
      Line3DBox[{1882, 2271, 2272, 2170, 2240, 1259, 2365, 2273, 2367, 2274, 
       2171, 2241, 2525, 2891, 2050, 2366, 2275, 2368, 2276, 2172, 1537, 2441,
        2051, 2543, 2479, 2480, 2236, 2853, 2052, 1883, 2679, 2683, 2554, 
       2053, 1884, 2684, 2054, 1885, 2685, 2055, 1886, 2686, 2572, 2764, 1887,
        2687, 2056, 1888, 2688, 2057, 1889, 2689, 2058, 1890, 2690, 2059, 
       1891, 2691, 2060, 1892, 2647, 2692, 2061, 2173}], 
      Line3DBox[{1893, 2442, 2443, 2237, 2242, 2573, 2854, 2369, 2277, 2371, 
       2278, 2174, 2243, 2444, 2574, 2855, 2370, 2279, 2544, 2280, 2176, 2868,
        2244, 2526, 2062, 2175, 2281, 2372, 2282, 2177, 2893, 2545, 2549, 
       2063, 2539, 2564, 2565, 2693, 2553, 2064, 1894, 2694, 2065, 1895, 2695,
        2066, 1896, 2696, 2575, 2765, 1897, 2576, 2766, 1898, 2697, 2067, 
       1899, 2698, 2068, 1900, 2699, 2069, 1901, 2700, 2070, 1902, 2701, 2071,
        1903}], 
      Line3DBox[{1913, 2078, 2709, 1912, 2077, 2708, 1911, 2076, 2707, 1910, 
       2075, 2706, 1909, 2769, 2579, 1908, 2768, 2578, 1907, 2767, 2577, 2705,
        1906, 2074, 2704, 1905, 2073, 2703, 1904, 2072, 2529, 2702, 2648, 
       2228, 2249, 2248, 2856, 2378, 2135, 2376, 2285, 2181, 2247, 2484, 1544,
        2377, 2134, 2483, 2284, 2179, 2656, 2840, 2375, 2246, 2180, 2133, 
       2374, 2283, 2178, 1542, 2373, 2245, 2481, 2132, 2482, 2445, 2527}], 
      Line3DBox[{1923, 2084, 2714, 1922, 2083, 2713, 1921, 2082, 2712, 1920, 
       2773, 2583, 1919, 2772, 2582, 1918, 2771, 2581, 1917, 2770, 2580, 2711,
        1916, 2081, 2710, 1915, 2080, 2569, 2568, 2896, 1914, 2079, 2229, 
       2140, 2861, 2288, 2187, 2253, 2843, 2660, 2385, 2139, 2490, 2287, 2184,
        2252, 2384, 2869, 2659, 2185, 2138, 2382, 2286, 2183, 2658, 2842, 
       2381, 2251, 2489, 2137, 2486, 2485, 2182, 2657, 2841, 2379, 2250, 2487,
        2136, 2488, 2446, 2528}], Line3DBox[CompressedData["
1:eJwNzM0ygnEUgPHTBtUNSDYW2FnmElg000xpGDNJ2dVMbkLoy9dWXIYVuQvU
sjtQWOK3eOZ53nPO/12rnxZbiYjIY7AYsbkU8ZiK6OsN/aB7esKr6OoxZ9HR
H7yCS/3OGVzoN17GEOe+1/3rXrf1XzIipX+5kI5I6zPzBR64e0Ifu3avbu4w
xY/ZIZfc5eyK+sTsgL/5lr94n7fs67qLGkZmc77hpvfb9mV9bFbgKr/wjK+5
4WbHzbM+Mstzhff4k6/wD2PkKkQ=
       "]], 
      Line3DBox[{1943, 2089, 2721, 1942, 2786, 2594, 1941, 2785, 2593, 1940, 
       2784, 2592, 1939, 2783, 2591, 1938, 2782, 2590, 1937, 2781, 2589, 2720,
        1936, 2088, 2719, 1935, 2555, 2780, 2680, 1934, 2195, 2491, 2889, 
       2649, 2522, 2498, 2531, 2302, 2521, 2645, 2779, 2238, 2153, 2497, 2301,
        2455, 2300, 2496, 2644, 2872, 2393, 2152, 2399, 2299, 2453, 2849, 
       2298, 2398, 2151, 2390, 2150, 2396, 2297, 2451, 2848, 2296, 2395, 2149,
        2387, 2148, 2295, 2192}], 
      Line3DBox[{1957, 2796, 2602, 1956, 2795, 2601, 1955, 2794, 2600, 1954, 
       2793, 2599, 1953, 2792, 2598, 1952, 2791, 2597, 1951, 2790, 2596, 2722,
        1950, 2789, 2595, 1949, 2540, 2556, 2681, 2894, 2557, 1948, 2541, 
       2542, 2239, 2864, 2319, 2318, 1947, 2316, 2457, 2317, 2788, 2196, 2315,
        2499, 2314, 1946, 2312, 2456, 2313, 2787, 2194, 2311, 2401, 2310, 
       1945, 2668, 2863, 2454, 2309, 2193, 2308, 2400, 2307, 1944, 2881, 2305,
        2452, 2306, 2191, 2304, 2397, 2303, 2403}], 
      Line3DBox[{1959, 2322, 2408, 2323, 2202, 2254, 2462, 2885, 2090, 2407, 
       2326, 2411, 2327, 2203, 2255, 2463, 2886, 2091, 2410, 2330, 2413, 2331,
        2204, 2661, 2851, 2535, 2092, 2412, 2335, 2546, 2336, 2205, 2873, 
       2256, 2536, 2093, 2414, 2338, 2865, 2671, 2232, 2094, 2231, 2651, 2723,
        2567, 2095, 1965, 2724, 2096, 1967, 2725, 2605, 2801, 1969, 2726, 
       2097, 1971, 2727, 2098, 1973, 2728, 2099, 1975, 2729, 2100, 1977, 2730,
        2101, 1979, 2731, 2102, 1981}], 
      Line3DBox[{1980, 2807, 2611, 1978, 2806, 2610, 1976, 2805, 2609, 1974, 
       2804, 2608, 1972, 2803, 2607, 1970, 2802, 2606, 1968, 2800, 2799, 2604,
        1966, 2798, 2603, 1964, 2206, 2797, 2650, 1963, 2500, 2501, 2201, 
       2670, 2850, 2337, 1962, 2334, 2461, 2884, 2669, 2200, 2333, 2406, 2332,
        1961, 2460, 2534, 2892, 2677, 2199, 2329, 2405, 2328, 1960, 2676, 
       2883, 2533, 2459, 2198, 2325, 2404, 2324, 1958, 2675, 2882, 2532, 2458,
        2197, 2321, 2402, 2320, 2409}], 
      Line3DBox[{1982, 2339, 2416, 2340, 2207, 2257, 2537, 2612, 2857, 2415, 
       2341, 2547, 2342, 2208, 2258, 2464, 2613, 2858, 2417, 2343, 2503, 2344,
        2209, 2874, 2259, 2103, 2418, 2345, 2346, 2210, 2875, 2260, 2104, 
       2548, 2504, 2505, 2732, 2502, 2561, 2105, 2560, 2682, 2733, 2106, 1983,
        2734, 2107, 1984, 2735, 2614, 2808, 1985, 2615, 2809, 1986, 2736, 
       2108, 1987, 2737, 2109, 1988, 2738, 2110, 1989, 2739, 2111, 1990, 2740,
        2112, 1991}], 
      Line3DBox[{1992, 2347, 2420, 2154, 2419, 2261, 2506, 2262, 2876, 2211, 
       2348, 2507, 2155, 2422, 2263, 2421, 2844, 2662, 2212, 2349, 2508, 2156,
        2214, 2859, 2264, 2423, 2265, 2213, 2350, 2424, 2157, 2425, 2860, 
       2266, 2440, 2267, 2233, 2523, 2524, 2652, 2741, 2475, 2113, 1993, 2742,
        2114, 1994, 2743, 2115, 1995, 2744, 2616, 2810, 1996, 2617, 2811, 
       1997, 2618, 2812, 1998, 2745, 2116, 1999, 2746, 2117, 2000, 2747, 2118,
        2001, 2748, 2119, 2002}], 
      Line3DBox[{2012, 2125, 2754, 2011, 2124, 2753, 2010, 2123, 2752, 2009, 
       2816, 2622, 2008, 2815, 2621, 2007, 2814, 2620, 2006, 2813, 2619, 2751,
        2005, 2122, 2750, 2004, 2121, 2749, 2003, 2120, 2234, 2162, 2890, 
       2515, 2220, 2466, 2847, 2678, 2516, 2161, 2514, 2513, 2219, 2270, 2430,
        2877, 2665, 2431, 2160, 2429, 2353, 2216, 2664, 2846, 2428, 2269, 
       2217, 2159, 2509, 2352, 2215, 2663, 2845, 2426, 2268, 2427, 2158, 2512,
        2351, 2465}], 
      Line3DBox[{2023, 2129, 2759, 2022, 2128, 2758, 2021, 2821, 2627, 2020, 
       2820, 2626, 2019, 2819, 2625, 2018, 2818, 2624, 2017, 2817, 2623, 2757,
        2016, 2127, 2756, 2015, 2126, 2755, 2014, 2221, 2235, 2852, 2653, 
       2013, 2358, 2646, 2878, 2433, 2169, 2437, 2357, 2469, 2356, 2519, 2866,
        2168, 2432, 2167, 2518, 2355, 2468, 2673, 2880, 2436, 2166, 2218, 
       2165, 2435, 2354, 2467, 2672, 2879, 2434, 2164, 2511, 2163, 2517, 2510,
        2222}], 
      Line3DBox[{2035, 2131, 2762, 2034, 2829, 2634, 2033, 2828, 2633, 2032, 
       2827, 2632, 2031, 2826, 2631, 2030, 2825, 2630, 2029, 2824, 2629, 2761,
        2028, 2130, 2760, 2027, 2823, 2628, 2026, 2225, 2822, 2654, 2025, 854,
        1815, 964, 598, 2024, 596, 1712, 750, 595, 856, 1780, 593, 748, 592, 
       855, 1779, 591, 955, 954, 968}], 
      Line3DBox[{2049, 2227, 2839, 2655, 2048, 2838, 2642, 2047, 2837, 2641, 
       2046, 2836, 2640, 2045, 2835, 2639, 2044, 2834, 2638, 2043, 2833, 2637,
        2763, 2042, 2832, 2636, 2041, 2831, 2635, 2040, 2550, 2562, 1874, 
       2563, 2039, 2551, 2552, 2830, 2226, 2473, 2472, 2038, 2364, 2471, 1663,
        2224, 2363, 2439, 2362, 2037, 2674, 2867, 2470, 2361, 2223, 2360, 
       2438, 2359, 2036, 1787, 2538, 2478, 2474, 2477, 2476, 2520}]}, 
     {GrayLevel[0.2], Line3DBox[CompressedData["
1:eJwV0L0vg1EYhvHHRyspiWAWKjVWKjERIr6iYlGjoVI7f4DZ2o2NhE1jtTL4
GGphkbAgoYOBjbQh6a/Dles+9/OckzdvurRT2G6LiA1MdEbMd0UsYDcVschL
yCKHMezp13kOF4mIH1yirM/oRrHvfIVsd8QBryYjfrnK17ys77B3I7dzIIG8
vqobku94kP+56F7O7FC+xxEmzTb1D/KIWUme0h07P+IEW7pxs7pck5+4z84z
n/neXrkH/XjRpfmVz82G5bo7DZzq3rHirQoPmDU44/zBn633cev/JXVf8h++
sWa3gGnMYgZv9poPdTET
       "]], 
      Line3DBox[{1077, 1262, 2684, 1078, 1273, 2694, 1099, 1285, 2703, 1111, 
       1878, 2896, 1879, 1880, 1881, 1867, 2895, 1869, 1868, 1137, 2780, 1863,
        1864, 1865, 2894, 1866, 1842, 1844, 1843, 1160, 2797, 1495, 1528, 
       1496, 2723, 1876, 1877, 1870, 1872, 1871, 2733, 1185, 1363, 2742, 1198,
        1375, 2749, 1210, 1387, 2755, 1223, 2823, 1399, 1236, 2831, 1412, 
       1250}], 
      Line3DBox[{1079, 1263, 2685, 1080, 1274, 2695, 1100, 1286, 2704, 1112, 
       1297, 2710, 1124, 1308, 2715, 1138, 1319, 2719, 1149, 2789, 1330, 1161,
        2798, 1341, 2724, 1172, 1352, 2734, 1186, 1364, 2743, 1199, 1376, 
       2750, 1211, 1388, 2756, 1224, 1400, 2760, 1237, 2832, 1413, 1251}], 
      Line3DBox[{1081, 1264, 2686, 1083, 1275, 2696, 1101, 1287, 2705, 1113, 
       1298, 2711, 1125, 1309, 2716, 1139, 1320, 2720, 1150, 1331, 2722, 1162,
        2799, 1342, 2725, 1173, 1353, 2735, 1187, 1365, 2744, 1200, 1377, 
       2751, 1212, 1389, 2757, 1225, 1401, 2761, 1238, 1414, 2763, 1252}], 
      Line3DBox[{1085, 1266, 2687, 1086, 2766, 1277, 1103, 2768, 1289, 1115, 
       2771, 1300, 1127, 2775, 1311, 1141, 2782, 1322, 1152, 2791, 1333, 1164,
        2802, 1344, 2726, 1175, 2809, 1355, 1189, 2811, 1367, 1202, 2814, 
       1379, 1214, 2818, 1391, 1227, 2825, 1403, 1240, 2834, 1416, 1254}], 
      Line3DBox[{1087, 1267, 2688, 1088, 1278, 2697, 1104, 2769, 1290, 1116, 
       2772, 1301, 1128, 2776, 1312, 1142, 2783, 1323, 1153, 2792, 1334, 1165,
        2803, 1345, 2727, 1176, 1356, 2736, 1190, 2812, 1368, 1203, 2815, 
       1380, 1215, 2819, 1392, 1228, 2826, 1404, 1241, 2835, 1417, 1255}], 
      Line3DBox[{1089, 1268, 2689, 1090, 1279, 2698, 1105, 1291, 2706, 1117, 
       2773, 1302, 1129, 2777, 1313, 1143, 2784, 1324, 1154, 2793, 1335, 1166,
        2804, 1346, 2728, 1177, 1357, 2737, 1191, 1369, 2745, 1204, 2816, 
       1381, 1216, 2820, 1393, 1229, 2827, 1405, 1242, 2836, 1418, 1256}], 
      Line3DBox[{1091, 1269, 2690, 1092, 1280, 2699, 1106, 1292, 2707, 1118, 
       1303, 2712, 1130, 2778, 1314, 1144, 2785, 1325, 1155, 2794, 1336, 1167,
        2805, 1347, 2729, 1178, 1358, 2738, 1192, 1370, 2746, 1205, 1382, 
       2752, 1217, 2821, 1394, 1230, 2828, 1406, 1243, 2837, 1419, 1257}], 
      Line3DBox[{1093, 1270, 2691, 1094, 1281, 2700, 1107, 1293, 2708, 1119, 
       1304, 2713, 1131, 1315, 2717, 1145, 2786, 1326, 1156, 2795, 1337, 1168,
        2806, 1348, 2730, 1179, 1359, 2739, 1193, 1371, 2747, 1206, 1383, 
       2753, 1218, 1395, 2758, 1231, 2829, 1407, 1244, 2838, 1420, 1258}], 
      Line3DBox[{1095, 1463, 1464, 2692, 1096, 1282, 2701, 1108, 1294, 2709, 
       1120, 1305, 2714, 1132, 1316, 2718, 1146, 1327, 2721, 1157, 2796, 1338,
        1169, 2807, 1349, 2731, 1180, 1360, 2740, 1194, 1372, 2748, 1207, 
       1384, 2754, 1219, 1396, 2759, 1232, 1408, 2762, 1245, 2839, 1522, 1523,
        1524}], Line3DBox[CompressedData["
1:eJwV0D8o53Ecx/GPw89AGXFSDEdEsbmcfrj4MVDnz0AZiOHqfq5I/S4Li8Fo
sEi3WGQQ0ymJkvsVi7+LkJBBShkMdN3jOzx7/Xv3/X77lg3/7B7LCCGkcJUV
wkx2CJ9jITzTd1qdE8IbPbJN6orkQjzyv/QvSGHP/l23xtfhgY/nhjDBP2Ec
f9wM6lf4GpTYb+QkX+WZP+iqm2+6Zf6LvYJeyvf0Dkv2NrnS9lsuw4U8Sm8x
gnk3rfYG/aJcjGP+nF7jDC32WXe1+hzvPtUd8gP0BM32fjrl5pN+gS9Amu+l
pfYD2oOkm4/6NL9PE7Yu/i86MWTP19d7T55cZN+R26P/hgT63GTq5vgYtviv
dDf6VnTYX1Eefbf8AZtumug24tF/tz9imv9n20Bj9B+xzv8HtpA+7g==
       "]], 
      Line3DBox[CompressedData["
1:eJwV0DsohXEcxvG/XEtKJiHF4DaQY5AyKLcwkHIWMpzBbWDB4FYsBoPBKlks
sjG4JoOkWBhcEjIZTkoRG593+PZ7bu973k5JYqJ3PCWEMIuXtBCW0kMoygyh
EJ/0QkYIP5hHXXYINzbT8gL9tyxJz7pfmMG5fkwWo9/dJs9M0R+YxIF+UL5N
V6NY/8ZPRHuMY8emV7ZFV6DI5pkfpSv97oi7YdMuq9Jt8qV44ofdIazp23SN
svXoHbilH91XPKBZv2xXK8/y3nvZNT3g3qEfNTZzNmXyfP7Sjbsl8iu3L/pm
faG8wTvy+Au6Xt8T7dGNhE2ufJXOQYH+jO+M/jN0IG6TJluhM5Fvc8K30i3o
1P+iPPpuPhWH+mP3FEeI6bv0SXeR/9Pv4SDaYh+7/D+6LkAe
       "]], 
      Line3DBox[CompressedData["
1:eJwVzssrhGEYhvFXOZQpUQ6hHBKpUdI4RqRkZzMrK8VWOZTyB1jZTIhC0oSw
0ESJPWXrlJWSUHLaKCsLft/i6nqe777nnad2bDI5kRVCmMFjdghzOSH05YVw
yAWxEPrNt7535oZwjA78yjIok33b49zKR0jgTXaAXr/P2GfxiQ8U675ztexZ
Zz/CPo1XNGEvsjzOp9jV2eZxpN3SwN3yLa5HoTd3dGL8ZG/kGu7S2Yz+C3fy
NNbNoxiQPXAF1lCOS/kGVs0v+SGM8A2ukevNK67idZ17+bB9yj2lXIIVrMra
vb1kTuICRViM7kSl7ExnGX/2c9R5M8ap6HZ5Pv/IlzBvHkSPTjuG5B3chmYs
6LRwwh31si9O+XaCfzOtOs0=
       "]], 
      Line3DBox[{1253, 1415, 2833, 1239, 1402, 2824, 1226, 1390, 2817, 1213, 
       1378, 2813, 1201, 1366, 2810, 1188, 1354, 2808, 1174, 1343, 2801, 2800,
        1163, 1332, 2790, 1151, 1321, 2781, 1140, 1310, 2774, 1126, 1299, 
       2770, 1114, 1288, 2767, 1102, 1276, 2765, 1084, 1265, 2764, 1082}], 
      Line3DBox[CompressedData["
1:eJwVzj0oRWEYB/D31r0+rjD42CgfEQoJiSgzC4vJwmbAdCelfJSB0FWSJAkD
ImKRkt212DDIZBAWWcjvDL/+z3v+z3nPqRiZGByPhRBSXCRC6MkKYYYl86wM
zBHjml7mWdZfETcv0JoXQkJWZodwI39Z1f/JHBbJ5Za+6H7S+hXZ5t0CWcho
PIQBua5r9DxtLoq+795iOaEfkmt06Deif9DdOWe4Z5jXpDvkpj7DY/R9e0+y
RvZ799mcNG/rHyhz3qKcKn2t7sW8q8s3V5l36NRVy23/MiYLdHt29s11NOjr
5bF+Uh7oDmW3503yiGbeSEV7HNpp0Ze468O5VH7KL6Y4jfbsvNNmPqOdb6Y5
50R3Ef0fl3Txwz8DGTtF
       "]]}, {}, {}}},
   VertexNormals->CompressedData["
1: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
rCGb8hj3c0dXl/8g7me/3b+Kal164VMG/UUp3M/6GfmeH3A/q74uZGPhHITC
bG3K07if2ZL5BD/ifl6Wfk9n4dIJ8QWXdlDhfu6NL9hL7ueH0Yu6jinJsHzg
Vjq5n8OGUv7083fJiqdb1Jxgs9HlP/08OffyPLmf+bL29pQvqEGCzHo/R7do
/Olnz5unvPcz8UP/336mXH1mRu7nwc9hJ3E/Q88//Sx7eb2fPeZxPxP+t595
CnE/E/7t596//QwUP3I/Ev7tZ8e//ZxMy5fmSfi3n+FvP6/5syg/IPynnxeG
WHbOYn0+8C6det/pPrRlQMwRsD7vpnS37cL6THmS6nSY9gjyKQ+ZfYL1OY77
6+k5rM+XX5LuHbwyibSXoosGsD6PN3uHnMb6nEX70BLrM5I1MUo5hvU53+sN
51Osz+FznxWwPiMJtuZ5sj6bCab80efy8OarHlNJKErG7ANZn1/5Uv7R56Da
HaMRwjZIX+bnH33us6D8o88q6XOvk7IVkPnOdX0+XHXpjz5/vBI0L+9Ojybr
/6PP9n/0OXWoosu/n0j8V5+1/uhzZonsiLJkHuFffc6KWNfnZA5xqSTCv/qc
91efZY503Q8i/KvPV+6s6/NiOezyIPyrz46n1/XZMWf20CPCf/S5693auSDM
Gzu0F8T8Po0Ai+GLEgHMG6xiC+a8mDfybJXaiw5Ng/KGlx3zmDeKLxjlDmDe
kAs8ROYNcKcpFrLBvKG48uUNJeaNSGe1ZMwbEGFWs5vMG8ekP49mYd5gq96q
xPKjAfZnLm4l80ax0bY/vCFrIqx7VtUbvop57SPzRudt/T+8EbCiP7r8XAjN
+6zzBnXI8B/ecC5OoePvFEcuhHXe8LrpO0TmjeI9rhVHlHai3395I/N+ow6Z
N1gUvDdh3iDe+Yc3TP/yBv13zBvEf3nD6y9vqLTxvo8k/ssb1H95Y+2LO4ch
8X95Aw0elbpL+Jc3GCTXeaPTX3XgLuE/vJHnR7Xqh/n5arH9mQTDSRS1ynWK
E/Pz6eEQs12YnxtfHjbB/IzuKe0qlcX8HGdXHVeN+flInpIm5mckwXDk4W7M
zw+YzqR6Yn72pumOdXzXj9SkPtK7Yn5+vZWqiszPhzm73hDsfNGNe9w+ZH4O
tal/QuZn3Ue8SyH+TyGplQbI/OxY+f0UmZ8zfAMJZ3Vuw5xS1R9+vvNd/A8/
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
tx/HeXu4InYeb6UCO4/HW4OfxxOQOawsPgnf6HEnVaYPgwru18rbn5wHX3E9
oHoprF89jfernfywfDf2E8t3oni+48X1GfdUhV8h6zMefI/pM+bRMCiHWVRA
poQeufZ3aL2UNsocT4uAbd+w/ifPQ6z/6YP3P4NMPZMoBP0hYYDxGVovgNDj
5lfZ0XqhoHBX8ie/Yegpcof7rfwkOHWqIHR3TiJ4+grLd5y4PvUknu84cP1E
Oj5MP3EfJaafmBDd1ODQWQs1wXNCvRIRjl8MlfM8Lw1EnLE+5HO8D0nCdYXe
rQU2jqL1Dsf6YY+uximY9j18wQqtd+Zz0/m2yWQCN0fi84h+InwzdRxZD0sD
WfuxuiAb161uxOsCsU7sPNIX/DxSMH4eqe2WUEP63UHQ1dA6MtM9Bb4dZsqh
NlYAisZYP1AF7wdex/uB7KmXd6yh9Zo9w6+fZi+6gH7vo2EiWq/teq44YqDT
DxSUmVncq6dB1b1LVJniOYAD17kWNcPqjjd43ZGL6w82UmP6gw24/mC3L/W7
H76T8K2DfH4uMgztVUxWbliqgjxct6iXG+u/jeK6Ra1nBLepovXpGuPVkxuq
FYDejo9Irk8/IjxZkxvTMNzrQnbfWh/ked2X5/QAgme/kt2KHs+BGB/qiWMZ
rYC+93qD9wU9YI73r7qjsP6VOt6/0mLB8p0unu9u4/nuBq67p3Ic0907juvu
cccRlXrRenyA597SNfcZUPmVTe0gWo9XshdXp9dNQMGqKb+W3f1gVUKfFDna
BYxxfG7H8fkIjs+v8XMXqfi5C8pu7NxFTJi8nnfFHBCXf1JkG9gMM8/Sfh+b
tgX8Is8ukfsGlyKf16iMTUBhwVbuwWfDYDL7xmPeng4wOCx5/rvgMDxy5vqn
e8ljQKLbrMt1dQYcqHRo1D/cAxOYtFLMH70EbPlyK17o9ZO5tMydA5uBx0On
thH0+hfao92OoNexiN37dEBwGJjts9K8i16H0dWI1ldiAhr13d6zb2wEyN5Q
7KFXMAWFx6SVp0lEGJMR0pC+ZAxsJ94fMHptDJo/XWf5iPqBsUZ2smt3P3Tk
yyOEo37guO3BNjUyAETSph9fODEN/e44lOY/MgDhJmcmPqPP68ZudWOejFb4
ie9Ejw/6vIpxnaAr3zGdIDFnTCdoHrdvdGL2JVw/yKsT0312vYXpPp/EdZ8t
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
fWmDF/SlnVZTeLvUVhJ2m6nGk/nIiSxS30h+UL6RQ9CVaxZ/zbQ9i8xHdj+k
Qs9v3Spz4E57nw1myWJ0k8xHNpL5QP9+iXzWW86l6djU2ENu5fxG3DSBce6L
GxvW6KpFYS/zetfExeTgSoVof2auV9vV+WJfZ8zKyHxkb9Qf8CjqP2u9oP/s
YhQ3xTrVKvR/46b2onzePYvbkv9vPq/vN0Y/WTfUT3Yx6ic7n897S6fqz//N
553P253kL/tP3u58fm5OwPL/5OfO5+Gqy676Tx7uPZRv2zS77j/5tqtQXu1e
8Z3/yauVW6AHdyA9uHmB3aeE7L4t/Lof9xfugiHyTqESa8VA7TfYTpdD1B9W
gPW//WEXL+XTja8ThfuvrNg8yiIB+9a70eXfoyjh1DqMA0oF2u6+7rkIbrrB
6INZiPqlYgv6pfYXXa43P7cP/M5S9vXk3AzLdjK30uPzN6WeCa9YBIzr9yR7
1bLAmBPS9N83aRv2Gtz+hNk+nRArSunA93Mw8sXeyDP6ik4u6Cv6oYj1rpj4
GHb/DJtS6Zgo2Js5QqXf64Liosqcv5h86Xa7H1Wz2NB4GP33Lmb4AFjSiF2s
ET48XJWJcXxnyJur35FHxr0Z2PDXp1OLe2PwEpTnGIn6cuYv6Mu5F/XNPLag
b2bdsniDz6s2Q4MXEtNpqUsgxdmA7hdwsfqW7dY6is8u/yS2HHRimvTMZirg
3P/4wtnXb3Hlz8H1wq++YyUsjO8vGrmcMbM1DPO+5R48kRGN8aI8gt202aFq
Zw9sD+2DyjHsOHYSyUM/6oPZs6APZoBRx6sagavgIdN2FmUjS7B/R/WeFvKe
oj6V31CfymrUp3KaXfBGRC0rmMZnfkpXcsCHy6Po55uwsjzwx4483OmTfsyB
sg6cs4WRJ7ujMX7DJe4PePe5BN+pzEhcCOH8qyFxrV8NvviHb4aGH7U8sT60
b72g3uX8FQ2sfVOm80Td//L4pt9KrT956iw25RzklVgu/S+/iTKospSMq1lR
45g7Y+oPWTfpUVwtOv4/+04M2XfaiJ+/R/x8BPHzFfbseDeWC4XehP1ZubkR
StRKlJPxVBTKdnqfOwqF7z997rxQXzkF1FduL+ortxXx/IeI579FPL8K2YPs
SxP+U2dgbd5xMyutl5Ar5sGFiNbXAO7o3/FomAouof5cIQv6c71H/bP0FvTP
shirY8MjUkEkh8/hKPFoeDmuKVWa+D6F8kmUMf+v/+kbpeMeUSLX1wbeWfHG
Cn7rBYFjE3MOc0FgHPkHDiP/ABPyD6ii+BYlFN/ijuJblqN443QUb6yO4o25
0DsOJ3rH+YTecfJQn5oHqE/NLtSnZogtePHnNb1g+ZVN13Lr2oFGx9bbP1c9
ACPonXSpGeOdlBm9k+5F76Ql6J30D4r/1EX+Xg3k7zVD/t4S1J/iDupPoYT6
U4Qw7fmbR/yvjq/Ab7yuHRac9F1fRfyva3M9dblPJ/xYZnw3Nqob3rMYP2Zo
7QAU0Pv75iMT9Dqrfuj9PRvZ9buGG+l2/VVk159H/RFCUH+E26g/whiq2x+L
6vZnobr9w14yoxhxLsozAjwC33ph82LnF87EubAoxt6Np/ZAm6MB1S/726HC
rmmX1Y9S/8U5jH9uosc5uKE4h/n4hJqM2/T4BL8F8QnMuu70+AQfFJ/Av8Be
HkD28mq2qxkG757AmMg7clHPXsMVToFpm8aoQBHVJXNT/W9dsgs+hz4Upd2F
zMvuqG648QqGRE0NDhPjU8WMOmCCw/+tA7Y8NmU61MMSeprMUhP2vYB5WePn
Aon5XSp8x7/rpR7g9HU8tqLRFNp+sU4dJtbTzNEq9+4ZAEmHnlS5u7LDZzNN
n8j1n0L1r1gW1L96Y+k7miWZjrO8NjyfvAdiKfEM3KiNE4iw0o/CVeMfGVck
3cKMUN7TollLNon7Tji7c/GV3DV3cUeEM+spNyerODWwo1CwOfrHVXwMjb8G
6p03Xp3C1s7B2nuHRRhpTMS4O+qPWbSgP+ZB/7EHKmGx4PP+lfLFqd7gZ/kf
dnXCXrh4df3Lkmk9kFPmsGZJtQ0Q48q7XkP6U6aEtqka7YdUC3bZwrijIDUn
Q5yeb4XqX6ksqH+lXDJnHSjijddG6S/dQUnGl1MZ89GcfDrzuM0Du/Z34CFr
kh9ORXgb1hS71eCvM3Zx6tkHzlMA/4Tmf4+m2P1UVxf7SIvut32i/y/P1JBy
jveSyF48xlmJ83SN9j8cPo/wcPeCPpvHnj/U17rsAsNSotqt1olDTdWh3hzi
93+Mnzq5DpyAn9/NvBs7oA4dm3llSH7ViOpc2S+oc/Vl8KmXUF8EVlLu3Kbf
aIspIV7nOqd+LfG8C8Y7+8bq71V3jB/NJ8t5+JThZS1cAQQFGafZYrVovNA5
+PMfTwP8Mi3sytfA8//W1crJ9nPbNS0wneKS1KV3ClYeNO4m89QuoDpU3+z/
W4dq05SGZNgXF9x5Ol78pHsIpov2cyXt9/jGXldcncaWD0JvY4/Q9185T9Se
Er+Ff6N5s4d9PIDP5829/Zl4VahFF5h9V82VTr8A+tqHtcj8QTFrRj2oTQvq
QU3MLV6VscoXn5599rX26Q285P+1de7xUKV/HB+yoVWLpEVtitSmK8r9OUol
yqW0IhEr23Zxvw5CiWWLJRFyr9Uq5VaJ8hzCapEol/KzZNjINddkMrMzc776
vczv9+/zOq/nPHPmO+c85z2f7+cDfYLX2SV9fQq+2ItteUPgqhcmYf4dl22b
dXPPkuH142rKZ88SHwwdQt9xxqvAf6lWdb7/Uixta6vU7aPYk/0iYColFEfA
PIbvKX+hSj5/IYMFY0cU9ieQjQ8TZPQrfieckDHDkFPPOsRUyz59e9IoJeRU
sySdKDAeEGviHH8S/HB+4vPDufOMmcfonkQaTo0WHmWLCBmFLbzzsme63JMU
W9BL7yGlRK0hZPfkA2/8k3fzU4HEUlRt/h+bwTMNKO4x9f7S2W7P+OZeFtrX
XShpxChEOzup9Td89g8tnb2CrjG9PL4NTkJvmNR4ADumiTEdjOzYTPZsSQg6
Ap/381qhJOW6SnLN5JRGnlINeSP8XM509zDRDvexdD4/w8vDgkPmvziRxHDo
uQeJx0lHMpM+zJmn/wjlM7OCz2dG/U/3PSvjO/HXI1pV6ok9SI5O5Xrv01MW
c0wn8ZNjC5taUqrR4h3UetzcFtV73krFjEjX/RsP56HbA9S4NmtTdGszHS+c
/Swp4ZOITKAOX7Nuxed378b+bNbZdHbolzqcy/28B/sKe9hX/ExcPDj5/CJR
943eaYc/o8kD+VHWfizOvtTVwiDJ7BAxaJ/7SUb2BOmjsN2OW592/1C+Mc58
vjFmPaYsr1fV2G6h0LsWs3B83o0671qnIPfwq3dwYJtwQffOUHR3nBovZ0k+
S4yOwYjlK3n45QXkAfUczl7M3GPlg3PJapnuVN8vvnOecaVaHXcvE+Wrsx9r
L4kgiuK2/BTHWWfp2715+9TsiB1fheswFpsQRiveLuD+r1YAfi9HFef7vdSM
y8z+EX8dJ3vla1Tpp2IPuP+zWLT8H8ojsBRbYMS1zgPvgvNWrSq6KdjsjVtp
zq+HS/eiThiPN/W52esXSdJFnM67PPQhEk8nX1nAGXfqXnXcs/wgWf1E/50C
+oH4XddfYJb3PKZ8Vzbx+a5sKEtVN9jwIw5Is/44nR2En8D8bKLwatBrR5zI
zroo/ZfNlz76r3zuyK0QIsjnMQfil31nRg69kCnj/o7Og2+JOJ9viQdtE339
flXcH/TkQ737f/1DKsGXo5XPl+NnAYr/9DjM5z85s81W0h7vcdSGPJ2mugf4
agVVt1nAcyoT5/McN+ufh0+KN+Ky3uaTR/ymseLpN7xxy4m0NisyBDWwa/c/
NG7G1ZrU7zesj+I5Gnw8R7/nodjohCiRE5faLq83hQ1TNXjjF70yrMW9BlEB
PWqLQmYpbls9zhu3y/QRPTpTi9wdu2ckVxShYVlqntGnFM85yMdzLr4IOxRm
LErYL1lXZ7NfjpCZ9ObxE7uSTz4nlF6hrQzD2yoWLKQpVsU7Pq1irc/ZYBLn
5U3Fbr7bgUakqPdE2uNyNfN1Rbhrc7KX7teP0V951Pznged48vEcN+hbcYe+
lW7oW1kH+ytpvv1VkOj2wiGR78n7ymuKLhVLEIJtMzzOEN2hcvvY2kXkxML6
uEx2GxLUO8Sb3yB6w5F8i368MU6Xvp6zXumBCWqdpyZ6Y/1qcJeBanJuTDFu
X0etJ+ityceHabex58B0wRKNbDzbD88R4D8xfPyHX288l0dmDf13y6H/rgL6
73YAL3Lk40UDxgLxbH8xMtG0LbCwS4U88M9gH3f+JTkxTQt9m7GiONHo5yVJ
9vlk8+ozaY2blGBxIQqOC5I6bT6GTfv7eevpUX6/R29zPposbBARvPAKs12p
unLtCzI4FZOBlr4+KnKq/iHOaaPWbzI7euzNtWhkPZMQnXkjBQfCc0EMeNFO
Pl7ULbp8qjArj6B7rLlqFemJtNqD5W4NjxCMsihzt57zxK5+9bDGjN1oxyrG
VC53HuBIwnwcqWK5mt8nmjrh2lXrfFz7o26GylAHd37Nuv/PlxQfGbwuubSM
s+9rYm7RbNJdVr2Fdx1ol3YGHF0yiTpXDbNfOObr7jXqoZ4jCVZxSTdakP5S
cZpeYbQunU39foufDSip2D9GByylaLQAN12lRupzMZmPk+6XZCJ/tiwt+ORh
3VDYX02yBuRFb15G32zbQCtL09JVhetAk/WWLPRdS8q72D7rspUnjN5f59Wh
JfAiI+H5vEjDcFeGjc635MHhkOrr2gqkitDQR+74Lv9Wk6u1C8jFNy0jxIuY
OFjYmXe8HvCigYD5vOg7eecTlWMriXSWZl2GwyLSjtbIu79tOP5COE5sEm2W
f2BhbzSD38gV844XuXRC8yd6MRpz9Fi1qeYtbndhUvcH4EW3+HhRZN6oW4T2
KDK5J+vY67GUqBP24F1naZGZta+UB1HEmum/Dd0HkGlTL+/4xVX3lAQ1XqEi
NekW5pEs1BpG1ZvEbIj/wt0FqPXa6irXsJs4poeafx3wIic+XtScLr7bVeoe
kWWRU+17Jp28pecskzE0QogCR1Lm40iHS2wd6U5CpJGtTfpBnzycnHyNN8+D
oVnrAvUOrIXHnv1W2oqMtCmu+GtRiOo/+rE49OJUud62p+jFHeq8Y1PbIpV9
E1DxWFKHWGkK2g7fu4Bpsom99C/o/MysiPkhNU5dUOPngCPl8nGk8a+p/kR9
6E/8CvoTL11w/u1XsZOEaol8y/fJLkSXq7I0138vF/iSGx9fSr1iUV35uhmJ
6Tbudan8gJ2jB3nzy4cF71l2vxTvrr2/VCi7FseLwnWbCbj33CUH33wasTJK
9AIWg32FfIdr4LmcEJxfnymh4BuKNsI6Odsb5aBkc5Se1rUtXdEVDcN4du4e
hxVXLJBE0NNAu75tX/x/IiB3u5ovd1sGdLnvQZdbaEbpcv+WXe5AZgyTZs1t
ZREhL4lyj5jF2euNiRugm82SpXSzErcp3ewzyEGe8KY4yQRwkuWg07MEnZ6m
NaXTS4d89ljIZ38H+ezmoJfzg3x2U8hnb4J89h/hvX4V5J7shNyffsj9WQO5
P0pLKB2pN+hI1SH3h7GA9aQzsYUoXTBek/JLMmK/f75+64eh/+E5qsBzYoFT
HQJOZQ+caiX0dYZDX6ce9HUWQv5dM+Tf3Yf8u3pF6n+lePhfSQjy7wrEKT3z
qypKzzwFemYEeWdZkHc2AXlnYvT53LsXuPdcH1809PHZQR9fIOgYE3ZSOsZe
0DGayQXacHPtz5WOjzwarCATpa4McXPtxcAfQwT8MRLAH8MNdGV3QFc2ALoy
W+iLMYK+GHPoi3EBXpQCvMgLeJEtn9+CKPgt+INuajqR0k3Vj1K6KQ/IBxyD
fEAlyAd8A7l7fZC7x4DcPSvQV+t0UPrqw6CvfgR6aX3QS0uPUnpp8TwqX68E
8vUUIV8vBvrTlaA/vRL60y9BrtwM5Mr9Ablym6Cv3BX6yqOgr7wG+jE7+XKf
X0JeG5NB5bUlQF7bddBtHgPdZgPoNieBs2UCZ8sFzlYL+sxtoM88G0zpM/n7
v+byW08XRDZw7wdCn4c+Mrc+Qmd6NtqcjtT+omcwBD1DIegZ5vKYJIATCkMe
E78PVSz4UNFAp5cKOr160OnVALf0A26pBtyyB/wZhKwpf4b2OX+G6UUl3PfW
j1N3/O4q1RDpGsYN3PfWv2UORHDr9kpo+96iwQpipbIKi1u3m0BPEgB6ksBD
lJ5kLo8jZ8SslZvHkQZ5HFbgj2HKlwch39GU5aAZQ2odk2WG/5ZFyrEslzOm
OPtbky2u7MYkYnSRnE6UWTQhuv3MHqXPnH1+gZFxO92XOPX7aqtonV9JmoOq
12bOdfwXfjYO8w==
    "]],
  Axes->True,
  AxesLabel->{None, None, None},
  BoxRatios->{1, 1, 0.4},
  DisplayFunction->Identity,
  FaceGridsStyle->Automatic,
  Method->{"DefaultBoundaryStyle" -> Directive[
      GrayLevel[0.3]], "RotationControl" -> "Globe"},
  PlotRange->{All, All, All},
  PlotRangePadding->{Automatic, Automatic, Automatic},
  Ticks->{Automatic, Automatic, Automatic}]], "Output"],

Cell[BoxData[
 Graphics3DBox[GraphicsComplex3DBox[CompressedData["
1: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
vEH/zP6LeIP+GbyiiDfon8Hfi3iDegaX8Qb1DH5FxBvUs6uI95TPIn6mPYOP
FPEz7RncRcTPtGfwPiJ+pj2DW4Rp8TP1DF4lQ4ufqWdwGT8zrgM/J+Jn+g3w
/CJ+pt8ATxfxM/UMfkvEz9QzeBERP1PP4E+jtPiZ+yD4DRE/M08Bl/Ez8+53
In9R3EU+SHsGvy/yQebd4O1EPkh7Bp8m8kHqGdxG5IP0G+BvRD5IvwFeVuSD
tGfwmyIfpJ7BZT5IPYP/I/JB+g1wa5EP0m+Af8jS8kHqGVzmg9QzuEOGlg8y
TwH/LPJB6vm4yMeV/qK+QXsG7ynqG8y7wacf1eob1DP4NlHfoN8Ab9tCq2/Q
nsHPiPqGHnoG3yPqG9Qz+E9R36DfAB8t6hv0G+AHRX2DegaX9Q3qGby0qG/E
Q8/gN0R9g3UkcFnfoJ7BJw7V6hvxRvU6RdbrEozqdYqs16lG9TpF1usUo3qd
Iut1ilG9TpH1OsWoXqfIep3eqF6nyHqd3qhep8h6nd6oXqfIep3OqF6nyHqd
zqhep8h6nZNRvU6R9bp4o3qdIut18Ub1OkXW65yM6nWKrNc5pbvtcpuZ9EHd
bH216sykE6qjx/N2o73y1BEXOueb7GbgZ04XHp5y4Lz63uHdoYBH78l1X8vE
WdWaq045tHKIv7+BjziTcT/w+Gcd2k+9+jqybZWjat6CfQdn+P9R0D54q8nd
G7bocltB++Dejfeam8RtUNA+eCOrs97DTdwVtF9kWn67gpMPqpfGZO0aeuYO
+w/eZ+fgtGzb++w/+I6+5R73e7CL/QefvmOnaVrvcSraD9H0tke1LLrG6ZO/
ZQLaB3eOu7lpy5Lz7D94jaVfm48vHM3+gw8dX7fMd9tp7P8nzc/sUMe0mvKr
Zf+Gzmgf/PnP7J91Wz9j++AmNYNqvZ1amu2DN+lfemXy8AD1Vy37MoM+vSMf
+LLBviJtXTiuM9q6W6dabny4oEp3B44LvKfqV2FmuTzqDXx7vlsWz+3jqDfw
ev5B69MaTuVzwV+2tYl79rUJn+uj7V+z1P6Hx47Jy2zL8YKXTl93u/IrU2c8
F9zj5go307ALHC/4q1qm867GL1fwXHC7eklda370pJ5bCK64i+dyvOCFxXMT
8FzwTuK5HC94inguxwteXjyX4z0s9KDkhGt65njBbYWeOb/gw4WeOV7wG8M0
PXO84D5CzxzvWzHvSmVhVxwveLiwK84vuEndqf/aFccLflvYFZ8LHizsis+d
LexcWV1EWy8cL3j/k9p64XPBR4j1wueCTxDrhfosJNap4jtOW+/0J+BTxXqn
PsH3ivVOfYKPEeud/b8l/IzSY6Hmr+hPwNsLf8X+g/cT/or9B7cS/ko18reK
9LeKkb9VpL9VjPytIv2tYuRvFelv9Wgf5zIjW21Nyhv2VcG+Cf/8IrSUS6FP
z9gfnC/UfjW7yv1pxRKw/0I+S1nlN+O2Ge0H7W9tG2NZ8O0E7r+Qz/5gX7Px
kijqDe0HeZa2XLb7KPWGdj6Vi830nDCVcRHaabco02FEbw/Ko50vZ/dmtlkx
i3pAOxMeuIxf29WZ+of815OD3Y8P8VBOuea4Vkl9w/ZjJ80u61b/FONq8J1n
nsfHNlwdD71h39G/eD33WsW3tBOcF8w9etG/okk1Z+gN8ulNfp7a7qtnHAj+
s9Oje0H5TnDe0c4ZB3fPByvvcN7BG+tPenbxHs3xgo9X9p4tpXqp6Cf2r4B3
1WannnvD+UW9/a3r3wcTlXqcX8iP3l6y7YjKNZl/gW864LevwZpEziPa2fM1
69GwZlmcL8h3e9Lk3IGtSzhfkG+0PMc+vHsU5wU8KnzMnzqdOrD/2B8HXlha
OX+ju+w/6th5x02dMp80pZ4h3+X+yVsT5rZlng7esNfFOtfvn6ae0c6JfW9m
2BX6xvgQ8rPSWppM/r2K+od8v5flC54veZJ+D/K95lvWHJzdkfMC+fnF85mN
vDWd6w77b/1XPr86fC/ojHGhbrw3n2VZ+5BmnBfItzQplDE5sDfnBfxm2z8W
Mwod4bjQTuHQwnWcYvI4L5APvVSg33o1iPMC+dN/XA99XpbIvAPy6TYz1iSm
9Od8QT7rZt8/VUcv4n4HPnbJrH2zF7tzHrHvX7v80LN5boUEjBf1W5u/GQeb
+dtxHiEfOzw8Orv5QM4juJuVGnJn6X3aIdqZdWXKqEF3P3EeIT81IK3G/LQw
jhfyHXOuTwpXTzH+h7zJwJuzQtf24Xghvyyv4ZsFX+cr8zbfO+c50xDPVKva
rHCbC3d00APkxwwb1qphSQ/OO+IQtWXK1klVa3C84CVvli+T5jSE8wvuNHOw
T/m+Lzgu8AMl7q1Zkb2H9ok67aIiF3uZnDzPejXkz58u0fjJwwm0T8hvn3No
wot+SxzRT8QtJ0U/OV+sc4r5on0yXhL953yBNxX953yhHb2YL9on5LeKcXG+
ID9fzBfnBfyYmBfaIfgCoX/aIeKincIOue5QD7wj1h3nBfKrhB1yXsArCDvk
umPdVaw7zhfkGws75HxB/oJYd7RDyC/x1uyQ88X6p1h39D/g/mLd0d4Qj916
qfkZziPqckVPaP6T8wh5S+FnOI/gp5w1P8N5RDsnhf/kPEJ+R7LmZzheyHcT
/pN+BvK2tpqf4Xgh31X4T84v4kA34W85v+Dnz2v7Bfdl1Mc+iv2O8wv5EmK/
4PyCx4v9guNFO2vFfsf5hfxmsV/QbiH/a5m233F+Id8mZLv1njRf2jPk3TZo
+yDnEXHpabGPc1yoR00R8QbnEfJnt2n7OOcRPFrs47Rb1tlEvMF5hLyb2Mc5
j6zjxWtxCOcF8hbDr+7dHd6Q/Ufc+0TES9zHUecpLOJMzgvkEwZr8RLjSfAC
rlq8xHlBOzoRT3JeIL/gSVzjkSemcl4gnyPiRuof3PSUFh+qRnGyIuNkxSiu
VmRcrRrFyYqMk52N4mFFxsOKUfysyPhZMYqHFRkPG8e3ioxvjeNYRcaxTuCQ
7227v71Lr/3GXJU8HvaJeKaZsE/WwbDf9a8zsbX5QjPOO9bpYbWiQ/lFLbiu
YQ+TZl4s+Giym2IUVysyrnbCfCEeXi/mi+sF+8JxsX8Z5wWKzAuUdg1vzGwT
/UGNKVpmTsCj46pv3JS9z0r8UC9HTmjQrJmB7x3WqVjE98OqW4WyT+rp35Ob
7Lo7dF61bB3kM040LNCs2RHV1SpmRsUPyQrkwUfOrZXz5cMcPrfxpbWWn6xi
1b6Wq7Pr9LNIQDvg7voZl068va9CfqvW/92q29OOMXenWDhDHrxRzyopWwek
87ngfevvL26zKprPLabpebu6NXq2x3K3PI4X/EPGGrusbvc4XvDZFntjd97e
rd5ffnK5bWcDr3en4us3naawnznael+t7ng24nrgLsO4wD/ueWeVdiyR7YMP
2xT28pL5BAXtg1vMz0k8fH0gxzVBm98A9cZPJTL6y37Kg7ceVKFUoXWTON4D
mr3NV9bMLjt12f1G7A94/2P/7J0z+DP7A145Ln83++8nOF7wXr5LNzyNn8vx
ztTsP1y50z/1waLNDZ0hD/4r/6yDxwKD2P8UzW6jlG2HBq1/dGIb2wdfn/38
afrpLpwXv0kHw48H7FW23vy57u85g12B7+vj+8YjcizbAQ8asfX35WeD2M8f
y85ctBp0SLF0Gl5qQjtT6gG8ziiPhl7eYWwffGj0nvEL3i+lPs8/297OreAx
JXBUJb8p6x8raAe8blCsn879CPUJnmFxJPvpp3nsz/Lm8+MXx8Ypde/umZA5
7wzbAXeutNn9/PG97A946DfvxouKTFBmT5xlq8+gvDps4lx95tJvilH7qmxf
hTzWb5upxfcf+l4+wfyN9Z3jAQZ56xYjSrzMSVCN+qPK/qiQRzvfveYdzihy
X13qc35+bC77qXaueWLcQddVqlH/Vdl/yqOdVJuJSzafn69apg5vER1i4Lat
e7ezud+F470g9KnGPJ80vnGYZQLGCx42WpsXjhf+p11Yr20b/Wo6o/+QN815
euufvnHUP3jmVG0eFcijnWc/yjeJmpGloP+QT5iaVypq8zbOF/g9Me8KxgU+
MmJyp7euIziuX8Le1Mx1hSqW6lTPGeMC7y3s1hny8JPtF+06V+F3Pc4j5PfO
W3Lvz+QUjgvcZKRm55xHtGN9ZXpT779fOS+Q/23yLuNV+FbOI3h1sS4oj3Y2
/73f7HrOKc4j5LvtfjTL/tpkzssIsU5Vj4Ju2xvUdEwAh9/ePzHiWNbfWpwv
yH8+UqlUzr3PtE/wB8I/cFxoJ2Kjg++lcXmcL8hvqjkjoaPVeo4LfKqH5k8o
j3buxPy1eOpynvMI+YnB3ef2fjOOfhi8qvA/lEc7Cy66m1f7n3wL48U+4upc
8+u+1Tm0t7vCH6rxc/dOapVnRj1Avu5Q31mOG95S/5APcn3YfkLts7RD8Gex
mr/luNBOodhZGxYXTeR8Qd7x5vLuS3cFcVzg7d5p/pnjQjtzTebmX9B3pbqx
c9HX20sYuMX1PgOSx/tw3kPFvqAeXXyj0BH7Hly/4DfEPkJ7wD6YOvmn3mpz
S9o5+MajA/VXk7KpB/Br7fbVX/lyAceF9rfcaFEm+cg67hfg1cy0fYryaKdq
2RW13bYFKBgX5M90mhswKnkAxwv5o42m1O7brQv98Fmxb6ozxP7LuAW8u9h/
OS+UPzX0nmVMKucR3ELsy5THvl8isfatjo8uc14gbzo/rGuVQ5s5j3yu2Mcp
j3aiy7Stk9N+FduvIbhyM0Frn+sFfLGIQ6h/xAkLRf+pT8j/I9qn/sELiriF
8minmOg/9Qx+veCHNq0O+NOu3gj9KyOFndB/gruLeIz+E/GJXtgh1xfkbxzR
7Ir+E7ysiN+oH/BdimZvnC/wW5u1uI7jAh9cTrMr6gE8UMR7lEc/Q4Xd0g4h
X6CxZm/UD+TXC/uknyko1qOyuLXmZxiHgLvGaPEw/Q/4X+FnqAdw5+danEx5
xG+1QjR/lQD9QL6b8DPUD/hSEVdTn2ino/Bj1APkI4WfoT2Du4g4nPaMdo6l
aH6M+oF8beGXqE/IL/u6Qd8jqwz1tlH4baXyJG0/or8CDxb5CP0V4s9WYl+j
XUH+mtiPuH+BtxX5C/cvtJMg9jvqB/IZYj/iegT3FvkO1yPaybXR9jvqB/Kh
Yj+iniFfNUTb17i+6ov9XRkt4g2uL3A/kcdxfSF+PibiGfptyNuLeIN2BT5A
5H20K7RTVcQzHBfkw0W8Qf1A3iWfFrfQTiDf9frd27O69+X8pou4Thkq4kPO
I+L24SLO5DxCPkPEgZxHcEXkv5xHtGMi4kzOF+R7iLyY44L8BxFPcl7A/UTc
yHnZI+JkxUXE85wX8CEirzfOFxSZL7CfkP8g4nnOC3i4qAMoRvmCIvMF6h/y
O0Q8z/UObvJUqxvojfIFReYLtE/I+4j4n3qAfK/g3wUmH+vB+hLyixTbs0+K
f7vG/Rfnkj86djx62P4DxwveotvXEq123aY+ce7p1/jq9B4Lq7EOjHzEZ8V2
s5uvC5Mjnje3TdvuWfUX61roz6Hd2yp3emaoV6CO1Obc+Xtbry5lXQ7yy4f8
WWYef5x1PDx3064R1xeEbaW98Xx5w8ZBdn+P0n7AlekHtp9yWcPxYlxvt1nE
fnS7weei/aSRzZ9vyEgix7jmWdzfZ7b0JOcR/Q8zOzB+8+rRrBOi/zcb5K1z
LBrMuhPaL3Sh85BymZ3ZDvo56kbjbqedxrAdyC9o53HlrNlwcvRn+Y+XX8yX
rKY98/du921GJZZpzHMK5B2xGd9NEp+XZb0U7Vz+Ev1k0/u6rAOgnlauZ40Z
BQYm0c7Rft7c3EGL92ayDon2g05c779szC7WIcH9t1X3rvZ9HeuiyI9OtnV7
d6GtGf0MznM/bxgxZczXNrQryJu+dMwY0s6a9Wq0f+PwolJLAxT6W547N938
bFVtU9ZR0U7VwSaTN5a+TPuB/LQ/ZStMj71G+wGv45cWudv5KO0H/TSPPxQT
e+sH7QTtb830G1FsxWty5EE9jl/IqWaazvbRTrk+ZwY1HXGc8wt5XeXXL1c0
H8I6M/jX0SU67vUZzjo58qlzC8sOy/++AOcdvP6DhkdOmVTlvKMdixe1pwyu
0oP6R/12fqGHFT8eMuxTOI9OrVaymalSgO/hoP0DU66XHVDgHevn4D0PLdxT
+PFG2jnaH1k650JFdQv9G/g/2THtrIfPp//Ec2tb+zjW6neJdoX238WPX19v
0HFy5GWFOx+40braIbaPdv5JCl28PHox6+GQz711dm7nA37UJ/I1nzif9e8m
fOG841x7xtn0U+P2feG6w/l1w/QnF/e2bUe7RTtLWraqZdXlC88vkDdZh4Uu
PNVHx3MWyI9/e7PvtVFXaT/gzmf2Np24PYN2Aj6yiGOho62Pcl9Af3rOtm5d
uUgY7Qfyv5/Ws/5hGUKO/nTu8WP+nz+hXKfI48b+HR0Z2NGE8R7q+WFB+hvt
VtfleCHvZWpR38KyJtcp2t9TfeKxPa18aG9oJ3NrZuSd+t2oB7Sjjyh24FXH
aOoBfGupeZHuT+/Sr4J/LtJ9kfmYCZx3tF/SqWZ8XNgCrjucszv//Orn9usi
7QftRAdnHbLY1ZMceWL9yFc/o+pe4PkC5EuGdkqa9tOdz0X7Gab9m3dquYb2
BvkS8Y/6PV85jBztb/1z+cKzCyto/zh/77m5y42//Qy/40N+qu65+HhP/u1c
X5D/7rxB71Ehjv0BT5k1rplLZUP+C+7tu+Xh5pw5jB+QT/3Mp80j/Sfyzd6b
2tW2GvWc+sQ5SwfRT84X2vlQUpsv9h/tePqMii5RNYZxINrJEv2nPYOrov98
Ls7rQ8U8cl2g/ZZivsiZV27R5pfto51C+bX54rpAO3vEvJCjne1iHpk/4vw9
SKwL7kc8Zxf+gf4Z+Wkd4QfIkZe9aKP5DQXrCM9NbD9V6detC9vHcy+JdUT/
jHZihN+gPUA+2VFbF7RzyG8X/oR2jn6+XrV4UGLhUWwH4+ot/AztGfL1hT8h
R/sW6Zr/YVyBc/yqwq/STyIvixP7F/0J2onr8WZw3TK23KdwnvhU7FN8zxDt
3BP7FO0H8lXE/kI7Qf6b4qrtI+RoJ1fsO7QftOMn9hfaCdoZIvYXxtU4r88T
cQ7nHXlZbRHncH5x7m8u9mXmX2jHRMQhjMeQt5YT8QY52j8g4hOuR8jnrfzg
ezBvAtcjnrtY7NccL99bEPs19Yn+vPPQ4hnaFdqPKqfFM7QH8K5jtHiG+w7y
1icHm9v0Ssyi3vD+gIxvue9AfoqIb2knGO/F4dmOjSxaUp84X3ZtosWH3HfQ
jnlo6dlDX0cw74N8mIgP6Z/Bm4n4kPaMfr4ScTL9Idrve1yLk2lX4AdEnMy4
Au8VuIn8i3aC/He6jZZn0W8zTxR5GeM95NcfOwXsupTZlONFOzM9nEYmRe1h
PIz3H2qJ+J/xD/oTLPIm2hXauSzyI44X/YkT+RTtDfJxny4XrvJ6Cu0Nzx1g
PyHl6OaF1A/kZb5DjvYrifyI8RvyYp/f7x63NE8yzn8Vmf8qRvmvIvNf6h/v
P5RNOXV2/mdDnov2ZX7NPBf9OV322MYfbWpz34T8fueQQWVPbFOM8lZF5q2K
Ud6qyLyV/UR/fhYvdO6XV6RxvqzIfJntQH5uk58Hai0IVozyU0Xmp8bjVeV4
nY30qUp9cr9DHp31YW6f2RdzqQe+LyH0kGDUf1X2XzHSjyr1QztE+/sHtw5a
3my1ajQuVY7LuB6iynqIWrlW5cmPjr8hN333rH2ssice/cc55jpzx76Wbwqx
XoQ899HxroeqDCrOdQT5C2IdcX6RR/uIdcT5RTtr935zvfo2kfaJvLXGIc2/
0T6Rl40IHRx0ILUc/RjyykDhx7h+0U7gfM1fUW/IK8sevL22SZcHjJMh716g
5cN6VsFcd2j/2JUt3h+ObiJHO9fqdTjUNWoV39tBXvzeX3tfi34b/b/xLd/t
3HEFmC8gz3JISxzxvmgt1n/Ah3eYHNNGfU7/gHb6iv2I8S3vUfHa+vPV8T2M
Y5EP2vZuPXl5lfHkkG/w99rMibtHUf947qrbx7w/zbPivCNvqhFacuHHh7bU
P/Kme25avMF5Rzu2z2MKhOS/zXlHvnP1coXTLaM/Up/g0fu2u+xedITnHXju
wNPXvs6sNZPriOduHbR4j/UZ5BfPcmZet91g0BvaP2aRvGLIsig+F/L5R0Xu
KGlygHEd5M1Xa3Ed+wP5nMMZTxu1n0b/gzylzoWadzIelqIewF1EXsD+gHcV
cT7PF8CTxbkV/Q/i7RWHHMY65/XgeBGfV/yijZf2jPOyDSIP4ngh31GMl+MC
r3pEGxftlvnOHy3PpT0gvu0m7IF+APHtCZHPUg9oZ/l2LW+lPUD+orAHcrSf
+qJEj6Xbs6k3tJNVVMtnOS60s0HYD9cF2nE//t7pcs0jnF+000fkp9QD5PsL
e+O6QFzd7KRW96BfQhxrJ9Yv1zXi3sRWTZt222vDvB7yla4039m1Yif6K7Sf
Juob1APkXYUfoB9D+xstb6RsS3lFPYDPEX6A4+L5lPADnF/wz6I+xv4j/mwr
/C3nnfcDHKm04Zx7Jc475H891+pm9GOQ/xmr+VvOI57rIepg7D/i0mjhb7ku
ID9nTqtt65cb5ovvITssT/zlUIbjQjsXRB2V/Ue8Fy32NfoxxJlRol7KeUE7
1qIuynlBHDtI7F/cZyE/Oy+y0u35ht+n4Lntxx4ouOBzHuMExI13RJzAfJZx
nag/O2N/RzsRUZaJYW930R7QTjMRDyhG5wuKPF/guBCPbRbnBYrRuYMizx2M
6/mKrOcrRvGDIuMHJ6wv7IOLxHuqnC/sp2PF+RrzWd6Hk5CzZnlwWyfEb+BF
h2260v5FPifkR9B/vPh9Fvc17OP9Nr3vnNtzIPdl7Hd/xPu0tCvsU/U/a+e5
zKdQR2pYu1m929c7Ma8EL+C4PrXa+YLOaB/9rPTGp8+kvR6OaAd++FctrR2u
L/Bvbzpc2xdgiAPBrzpo7dPPg7+t3qdejSeZtDfYbT/x3hTrD7CT1KMDHINq
dac8zlPiF81ddbhAc64XxG9Owj7p3/j+8NHHo/a++8p8CvItLA8tDPErR/sE
Py/sk/E22nkRNaRLTK1ocsSB/UqsKlQi2fC7MLafl/J6tedaPhfxz2Tvm3US
StRNwLhgV2vEuqM/gR3qq/Q0+9I7nHoAHxvXpmje7lnkiOuefDx/c7vXUNYr
0P6wVAtPs4wRXL+ozw9xDzi9s/wP2g/sqobw86w7gR8+1Wtant8X5vuI0yyv
31sQH/cP9Y+6+rxP13wT6hn8Ldo5UjY5oM5uT+bvkDe1u9Po9SVn+mHW59O6
zc4tfYVxC+KcRweKJiZtL8n3McCnlxt8L9+zm8wrwZd0ul+jy66zzH9RT/7n
RK0F9WcU5n6HeCZQxC3M08EfBuWLULoq7CfaMa+5c59fcibzGvDKF8a8bjTw
Ep+LeGxSt9+TfHqYUM9of8irXdcKL8rnDHtAO99v3Jr6s1g05xHrul6Wth6Z
34Hnd+ukbJ1r2AdRHz54vGGC4+cm9A/gX4//WP53rAXnC/3Zf/+zUj3dh/MF
+buh+25XMu1NPeC5tWto6535ILj9Yt+xgfEP6LfRTs1i+a6aL8ihf4N8+Obh
NSsO9SKHfOoL2+QGtYfRHhBn2os4lv4KdeYYMV76K/B3Yrycd94/5vHZ5ejk
lqwPoP08Me/cf+HfLrqMetG0Yz+2g/ZvCv3QH4JXEuOlPeC5R4U9sM6J544T
9sD+I258IOyf84g6sJewZ84LeKqtZp/0Y2hnolgv5JB/mqTZLfWMOPNF6b6p
HV8XdEZchHYiRJ7C/Ze/sxN2y/bRzpslzs2/10qh/0Q7c8Q6ZRyCeDJY5Hec
X9SZGwk/Q/0jnvxnwLZPHiXakUP+cR3NzzCuQPu5GVrex/gE8tGPNP/D+gzk
Vwl/SH+LeK+U8IfcpxBnRog8musRddcfwg9zv4C8h9gv+LsDyHu/SK87QxdA
/897sYT/p39GXFdf+H+2j322t9gHEzCP2JfHi3oC5xF10ctiP+J+DT5S7Eec
X8Q5qcW1/ZF+GM8tIvZH+jHUCePFfk3/CZ4h9l+OF7xVwMSMyy+HsS6EOlKP
oNyhRypGxcNvYJ9aLOJwxl3YBzsLfZLz9xEiHuPvlRA3Vt5Rvo5j0Hr+Xgn1
qOdFByX3bzBYNZJXpTzrVLynV+QjCXgu30NooeUF3E8RBx4SeRnXNe+/FfkU
fweKduLKq78fLm9A/4k4ZFnNcy3OBXZhXgkevWCl3fBUD/pn3qcq8lnGJ+Bd
RX5KO8d+0WfcZofpva25j8Cf/xZ+0hnPhfx4iwI/7+RN5HpnPNlT27/ob+EP
b4j9iOsX8j8WafsL6y1Yp7Ei3qCe4R9KizoSx4V1tFLUx6gfrGuHkD/ul72H
0G5h5xdEXZHrCOsuZk1a2v2RSzgvvO9OzAvf24T8/fbrBn/YUpfPBR9zdcKk
8kvacT/FOsrSJ8RfPBfH+gl4tdDD0x44jjReF4pcF07oD+LbtVeyu6xs/kuP
54L3u+expuLCGlwXiG/NHlX93KpHPeoBeUTyn0O1Bg1v4gT7AX9h69S7judn
RzwX67fLVe25OjwXvJR4LvMvjKtbmvZc6gH9yRV6YJ6OuPeK0D/jW6yXEWJf
4L4Je04U+xrjSfA0sU+xHcRvG921OIH2DDt3K9jTs/A5f9oz7HaoWBcJmHee
o4n1yN9LgqeK9Ug74e+dW9SOe93VnfLwb4qwT653+LeuQp52CLtdu/fZ9hJL
GlMefu+V27RZoyq0ozzynSVCnv1B3irlOV+on1v6myec2uVK+2H94eq+Xw+C
evG5mN8P2Up0a7u65Nhf+v1w6n+xmTP7g3ww2HtDnTMTS5Lzvv3s5y1Kfq/A
dtAfu9anl40aZMt7GxBPVrz+Jtp0Qk3+vhV83rs7VienKYqP2UClSuo7zm+f
fi5WWS2dyeHHvixstf/e7+5sH/2f47+seWjcdB3aBz81+ZBPgEcBtgP911AO
fYkabegn7K3atebHNkTYKjXUA2Hh4Ybn7t3penRlqD3bgd+ok3/nnwoF3ujR
Duwnt8Lw8v33lVLB4Zd+tB206Z+DhVW0j3ZaJ037UfnbH33O5uerw8MN5zge
welrG4Z8UpONznc++4rznW0x+S5dvWq4byfTLS+h27FpymSje3hOyHt4usZV
+/33r+H7F5/javmtHVdKrS77A3452bXe9RuXdeBoJy7+0Z0+89/rvic5NW3W
zCDfrcR48/I9jpFDPrfp7RkVpxzTXzP6vsZ7D/F9jcjbA4b7+xu478H5EUub
NtJBHu08kt+JgDx4sZyPBS13ztZPe5iVz8TE0E7RzKl/P5s7kEO+/Lqd//Q9
1Fnf89m0zeHhhu90hAbG9LG2r0IO+aMbo+yWb66rq5lZqGWzZgb5t+/yXJNn
JzmBQ37o3j2pN/NX0f18H3bz6lXD9ztWu75tWW9UhhM45BdXKOCwxvqD082v
tcb4+xvkMzptTYjNOUwO+bsPalda8CI9fvevY+YmJgb56/Xf2twLPEwO+YlH
7g7fWTY1HnYFP7Pb6sm1RXMKOCcbnbs1k+dusCvww9W6hn8bOoh2Bd5E3oME
OwGvtPd6zL4rpVTYA7h5XtkzqdPv0h7A78nvU2B+wQM7Fn5/0T9Uh3kEDxnr
Wu9VwgQd5gu86Lqx5fc+cON8gaeE+FXt8Lso5wV86I0qoeFeZfTQM7/rYWX3
zszXTA99Uj8NLG6Mj7tPfSIOvOAcn2UxxTIh2eg8cYeob1M/4NknFr49t6ec
Av2A7y3ZRbe7xGfaP/gB+V0J6Ac8PWXprM7Ht1E/4HMKdIkrYD+I+uF7s2/6
x50a00cP/YBPjbhu3y3GVQ/9gGda209IHtiY+gH/Mdu3eELbAtQPeOeKd2ct
qfrNCfphffX3hpQyr6rQ3sAdZFwN/YCHrvUK+JOQn/oBv3tptkmLvGe0H/CS
8nsQ0A94Zs1Fn8xPHqYfoPyA6okBvuu43sHffbXzbHV3EvXDe6savKkUqO9J
/YDvKF9pwJ50U+qH35WoFTXvnF9VHfQD/vzJreXW4RV10A/inybrx93uns+a
9gPeQ+YF0A/46opTpjWxa8b1Bd5mQJpn6pN8KvQD7iq/4wD9gFvqJ16bOHsX
9QPufDBt5O7RXtQPuHVDj2Eeh4dyfYFv8nlaotOR/lxf4CtLXQnKt6eLDvoB
T6+WUPrNptbUD3iRRX43Kt+qQ/1gX/bXeSaEZZej/YCvlee50AP4hD4TVq5P
LKpAD+DF5HcWoAd+12B6tGlURhLXEfiFjk5HKm7axXUEHvFqfn+vXgupB3CX
K7o1TxeMoR7AzX8evVp9a2/qAbzsl572J2o6UA/gLdtGn4pOrUk9IM53TrYz
GVe1rlOyUfy/Xsb/8NvgzdUm9/vnS3ScbHQPVTd5DxXsCjywRLcLG5/aO0Kf
4HOSFk+5PtDcEfoEXyK/pwB9gtuaFOvVJvGMA/QJXr7x0sp73290gD7BT3aO
Dvnca7oD9MnvLDwpvDW4m7cD9MlxXU6vkFC5rQP0CV6sq9m+ISNrO0Cf4Duu
pg8IfVXaAfpEPfC+sCuuO/Brwq647sCXVXUq061lC6478HnC3rjuwC3kdxCg
H/Dywt647sAvCXvjugPfIuyNfgncSdgb/RL4nx+avdEvgZsJe6PfBrcR9sb4
E/XD7sIvcd2BD5Pn79AP+Fzhl7gewW2EX+J6BC8tv18A/YAnxGt+iesRPH2/
5pe4HsE9hF+ifsCvCb9E/fA7BcIvUT+suwq/RP2Amwm/RP3wHv4/2r5G+wFv
I8/foR/wJ2u0fY32A94zWdvXuO+D15ffHYB+wHPFvkb9gJcV+xr1A/5C7Gv0
V+BLxb5Gf8X3BMpp+xr9FXi22NeoH3C5r1E/yHeSRFxE+wFfIM/9oQdwGf9w
fwcPl98FgB7AN4j4h+sIvI6ZFv9wHYEPEfEP9QA+R8Q/1APzNRH/UA/gXedo
8Q/9NvgUEf8wPkQ+Hi7ibdoJ+J8Y8Z4A/Db4iypavE374T1gIq6m3sBTcrW4
mvYDfkfe8w+9gcu4mnoDnyviauoNPJ+Iq7m+wEfM1eJqri/w1SlaXE29gXuI
uJp6Az8s4mrGjbxnTOS/SrLR+wxBIv9lngKeJfJfdbLRPWPnRf6rIv8Fb/Nz
qE3B0o2pZ/B5Is/VQ8/gw5tp+Sz1DP5Q3vMPPYN//Kzlp1yn4OlrtTyU6xRc
5pvUM7jMK6ln8KUif4yHnvneiMgTnaBn8ECRD1LPqFu+CD1wzCPgMesM4DXk
+x6Tje5Day3vQzOqJyiynqAY1RMUWU/QG9UNFFk3MK4PKLI+oDeqDyiyPmCc
7ysy39cZ5fWKzOuN83dF5u/xRnm6IvP0eKN8XJH5ONd1k7nHG/v7H1dXvnqo
pNf6TL3tkO/x/hkq7j2D3tbKetrrs+J+fuhnEe41OnoidvLz86yf5Et4Vmy1
7Ul1tq/tSzeTo7S3aTLfv21UP6kj+2PetNur9qv8qJ/tsj+NG5nHvNuWj+u6
/PpxNya5nVCtN937tiz8LesYK3EP8+zz7yv2fcV6ReG9dcaGtIlTWzU4/d76
wW1DvQL3PlVd9HXYAX/a1YgGt47V0x9W5zn1tZ7fMT/9/0NZT46wFPe8QQ8J
sn5Ya2wF97Pmb6mHVmN+r/KceUxd2bRSZOMyR2knB2V947JRXWiQfK7vgtVu
n7dO4bq7J59r/bXsgxqdutFOerZb4tEm+oh6d8PP0v5phjrPJVmfH2PTfcv3
xoa6gbNnhxzX1UfVOS0/hv8JWEM7iZP971Hjp0fxQhmswzSV/Q9p2rXNBTWF
9qM78mhyRr0D6vKMj3WWfCzJfcFa1tUz4sX9ddDPd1kHHjprTsvZziUYP4wr
X6FcldRDasvJf3v173iH+nkt6xWPjeoq9eVzazWwi+sYv5D6qSyf2/jLiaQi
aYb4qvjj7kf+/o1VE5JuPBzcyo76+RMk3pPZ2i5gWORvK/qlqfl9g0pkHVRr
JBT+fn2GpaGuIvvf4czBzllxJowfRsr+z9yw4/bU8CvUzz7Nbnep344uymk6
pQztZ7mswxeU9/VBP97yfC2pZau/7ZOtDHWVRSNbJXnuUy9urv3Dr8snriNH
Wa/YbFRX2Sif6/ZyQXyX2+FcR4vlc1dusy3yRp3IdTRDs/9otfeG1mOKKd70
26PluUDhztmX3FM7UD8DBn3/sTskRh3yT8sJZq9qG+oqsv9vQ2aUepCcQ/tx
lv2f0Ldf2MmHP7i+7LX52qbu+qa/NS2yGO3nV5B477qOuF+F9pMs3wtal7PY
f1j6X66vU5rd7lTH53o2bVAqg/YTI+sVBYzqKqXkc5eeT481KbmT+smVz23s
EV/72uv51E+mNu8R6v01x3te+muIzx/I9448KhSt8SqkNfWTrK3TSLVi+0le
dqPLMX44KfvfYsLsyh7eNRg/HJD9T5uxsnaFGZWYL5fQ6v8r1fSxR5M3hxj2
tdvy/fBHu8U9itBDD03/m9TFB96+LFPAUD9pJOsSNY3qJ1lBov33gwdcbL3s
INfRFdl+vRt9bzplLOY62qf1f606duS0b39XT+A6WirfO7JZ2a1imXgf+pkA
zd7C1KM/7s9MsulKPfSQ71lFdS1vu7uNoX7SQvZ/ZwmlzZRZhvrJRq3/A1VH
7f0lQ/1kwhZxztJdvDfI9eKutb9Idb1qu2lCLUP9xFLWJQoY1U/6bRbtJ9T4
lx+hHhrL9u3n/Pu9v03UQ2VtvJPVTUWKr3zmNZd62LpFnAd9WvLv9/78qYeV
mj6DVQeHfa2eNepJPfSW5zJZb74FL2rSinqwkf3f1XHcA2W/LfUwVXClc+q9
Qhf22HC9vJfnhplHxT2WWC8Z8rw7pti/3zf8wLjl1DZtvMp2MV6ulyJanWGT
4630QfqlhS+xHqLK5wbc3DYg2TeO6+WPfG7Pov/qYRXXi2OkNl7l27jndk8f
j+Z6+Sbfa7L7/e93Dw112knfNX0q+bL/1UMd+pOMbaL/uW7/fvewIP1tmwjR
/xVx/373MIP+1lfYj7LKpPfMihm2tJPN8n2hKfI9fOgnX6R4T77/E9MVWVvs
uY6qi3Wn3IkOrnr3dRGuozmyzlDEqB4yTz53u//UA9GfYqmfKPlcE68mBb0b
bqV+zol1oUx12ho01n4e9ZMh34Oa1XThsrzgUdSP6TVt3SkfChy4rPoa6iHV
Zf/bXfpePS/UUA9pLfu/8PTVnj3tajGfPSv8jKJ3W5t/gI2hTpsu338wle/h
Qz9l5Hv79cOamZaPbcr15SL8p+JU0n9J2QeGesgwWWeoZFQPuSOfu2tH7zkJ
gYb19UI+9+j3hE4h5gu5vr4I/6mYmHk9qnjwQjz0YxYp3rNyWR6wqFDzXtSP
5XLNPyvH7madWLXMhfqxkf0P+rjnRax5K+rHR/Z/4SmzEOvBhnpIX7FPKQ51
0/svPG5B+5koz9lXyPtXWfcQ+6yy4HnroNjAdO7LSbKeUNGo7jFCtp/wrOSS
Bf1XUQ9TZfuXatZ28f+xlHpYIPZZpVKXplmR1SfSz6yX57Om7V+1t7/ci35m
l9jHlaKlP6waX6kS/cxx+V7KmEsWZ72OlaceEmX/H/ScUMhqVAXqYZKIZ5Q5
h+79GP7iL/cd0+Xi3HnmcHFPLOseIh5TTjQ8H+ma+In+pN//UfeYJdv/mDZz
Q5ElW7leCsj2Iz6/ff2i7CSul2UiHlNa2VcIGJepox4s5fl4qcQ2oefqdqAe
Wot4Tzlmm2flaPW/6h7ynNr3wf2DDzMLGerVsv8OGfPNtvrl0J84ibhX6fCh
QMDMqGfM36/K3y8sFPejMj96KN9LeWwpvteDdfRSvrdQc/CUNg9nGOoeASLO
V7JyOzRdcdtQ9/gq6wlrjOoeLrI/b588y3371pf2c132J+jUYJMD+UdQb31F
nK+0O+ZX6eBNQ93jieyn+yN7q9yRhnx8mMgjlN7TXZybni9hqHvI/jdpf9TH
ppyh7jFR9n/XgS2/3EqmMa4rJPI+Jah9/0p54ZtpP+vle3ELKop7faG3KPm7
V+dT4jtEyMdri/xOebdgekiMZyPqM1b+vmNMPt8fzU0+cl9rIfJHJXx+aH/3
OoZ8Uy/rBveM6hulZT/n7dPHPs6YSH1ukP38sdp39Yji7lyP1iJ/VObcPKe7
PN6S+oyW/f+bVT7R7GVF6rOR7H/Cy+TfZW/kMM86Ifv/vlkZi39aP3ZC/cdK
5qdzA9u59a83XTXSjyr1o4N8d5nHvfBu92fqhlXUZ5rM+74KO2R9KUTmNTEJ
c0/+sNzK9i3k7wUyI8R36yA/Rcb5I1ctmbcrJ5ztr5F5wfVA8R06yL+Qca95
ndBg9+QVlBf77A71az/xXTnML+Qj8+eb56FvRf5Hxtu+vsf71U72YH8iZDxp
63myfsenx9j/NBl/tpDfj0M7kK9YLClgvI0b+X0Zx55dPrTrsF5N2P9cGacd
uOvq0KNzIvv/RL7nM0l+Jw7tQD72+ojAmu6Dya/K+PCZ3/q4ajH92H6U4Erd
lEHT6lvqDfU9ETcqVeT34NDOOSnvnX47t9KXXga9iecq+8VzqZ/rYlzKxgVB
86ZY7mb/V8u44txQ8d03tAP5vis0PbD9MBmffC+q6Y39F+8dRSjf74adfHM5
zGBv8v3nfgPE993QDuQniXkkfyL392Zm2ryz/aVy/xrifbN6l+7R1M9Yud/V
l99xg3xV6eedqx7pmOm1g/0xwfcvhD2zfS/p3+a0qub8O2wl278s/WEv6bch
X0Ou31D1x93u1cYrRnUwRdbB9EZ1SFXWIRVwvIc27lXdWY9XZ9Ifgi+V99fh
uWinavFzpW5vmaAa1S1VWbdU4Yd/qaLOdrpm2cFnex1j3u0k62n9C/40q5r/
Nvc1vLc5/Xam1aLfhro0eGIPcf8b5PF7ov/x2Dmji7xi/8FLyvvTII/3CfPm
rQz2j/pAeX6f62DFfqaOibQH+Jlxd7IbWDR0JV8p6xJNz51t0mleD/YHv/fp
fnj2uENrDHUV8GfiPXzOO/jlWq1cvr/zpD7Bs73+65fAb/9+erlOhR7kfB9g
6MOKXt19OF787ubv+zvxDS8a8jLwcPF7Cj4X/PGw//or8FKvvz6fGtqW+52/
zJcPlA3O7eJTxxCfi/hfLbNoUnyjvfWpN5y/uy9Lbl97/0DqDe8rrry1vuTU
fPWoN/DbRcXvayCP36GECnmOCzxZyLP/OIedLZ5L/eD3HS+FfvhcfqdS/t4E
+gGfO+y//go88pWmH3Kcby4U88L+43cZxYSdsP/gJeTvNWAn4DHNNDthf8CX
9f+vfwMv/UezE3L4sTrCbqmfQBnPTxd2Tv3gfct687X1wvXI7w0d0tYL5fFe
aCtnbT1SHryBvK8Gz4WfnHznYOiVTQY7mSvj6phRY0akqq2pN7xfvV74B65f
8BThH1Qj/6ZI/6YY+TdF+jcFfslRxmnSLzkZ+TFF+jEno/cDFfl+oBPsH+vl
yrluubobnxg38nc9vu4Ljk3uyHUH/RTc8d99AX6v4eeiG6YUWMt5h51PNNqX
wTO7j7ecNXwI7QfjHR+UVq7Tn+nUp408p3gzS3l9+H+9B3tYnmsMkt+XQTuQ
Xyv2HXKc13Rq+CTm8uYA6jlLngtclucRkB8gzwUWiv2OHOcaXz9aLip4cSr7
WUPWyc0s+s6IXGk453WWdfULsp4PefjnLItZQa/K5OO6PiDrzPoeor6N50Le
Uezv5KiTn43/fqHuvsPsD+LAMzZK1M8tBjuvLO/lyHsm6sNoB/KjRXxCjjpz
/3PNqqQFn6A9PJN+/rj83jH4OOnnA+T3CtEfxI2t7lYv496zLPUDP5x/r6jH
4rmQzxLxGDnquj/H1Mlvnm7IgzZLe64m9wXGG9Kfv8sV3xNEO4gzXUU8SY56
aY1f/95Lv8UQx8r6ZDMZx4Lb/Vv2m7PjzM81jrZtvPY7YryIM2sNyCky92cd
jnesrPtZyO/mMP6X8jEifiZH3TKlz8h0/wEnDXGvXEc+cn0xfpP7yEr5nT70
B3GpZXp6u95XazpD/pbcFx7K/QK8ptwXpsvv36E/iD+TRZ7CfqI+9nBEvymP
Zx9kf35JPx8m4gS2v1P6mdnFxPfmoB93Wc9pnyLqRWgf/v+cyKf4XNSdIhYO
fOXnt5rtL5f+P03kWexPK1lXGb9OfPeN8af0511C9M/ydrxmfz7L3wvUHSvq
Nowzpfx5kQ+So/5TrfXpR5PKTWH7XWU9odugo9ttt11m+2dk/aGL/O4P2oG8
zE/JUVdpON3soD5tLudX5r9KTOIwj51z73C9h8p8PJ/8HpBRvqzIfJkc9QfH
gqFLA/WTFKO6hCrrEorRc1X5XON6hSrrFapRf1TZH9Xouap8LselyPPTnaKO
RI78/dVATZ8cr6znqC7y+zvgeskLCT1zvGi/jtAnxzVFnkteEHU8ctQB3gs7
Yftmov6meviL7+OAf5HnnqYBgrM+INtf20qzE8oHyXPAy/J7NOD9JJ8t1gXb
6S/PBzOF/dPOcb6ZtF585xfyl+R5WbRYp1wvOO+LE+uRcQ78f8K+N/lt//Sj
/kfJ86YF4rwgARx1g0rCzySgfZyjTZX7AtpHO+tG/l36ZY8nOfx8pK7Urn0b
3aj/JfJ8p5E4x3EGRz2hivC33E9Nv4tzokfifIfzFSzPjwrI76dAP2h/n/C3
1A/Ov0bk/Xcf+bFFnKe01L5jsoX67y3Pgx7uvnhnhde2MxgXz6Eer9z7ur8v
9Wkmzx0OjtLOKzle1Bl+3dH2TY4rWd5TlE+cY3JcheW5hl2M4Ogn2u8doO2b
7CfOZazkfoF+Qj5J6J8c50SzxXyxn3XluUCD79p5NOcFdQzv6locQnv+Ls6L
lWnyOyDg5eS5QxfxHT32H+2PFHEI5wXnJoFyn0I/IX9B2C059qkewZOWzFte
nfqPlvV8y2Pa+wa0Z+QjLcpocRr3cfk+gFJBfncDPEbyFBG/cd2h/XgRp/G5
bWT9fIN4D4R6Q95RUcSTnHf5noaSJeJJ6s1R8uuSQz84R6gpvvdN+fuyLr1B
xL3sf6bkiZKj//6yXr1WxL3sf2OZj8wX70EZ4mFZ/8kScTufGyHrt2/F+1Hk
hyTvLr8Tgeei/SEibjd+P02V76cZ9C/zAlejvAC/E7fcU7vh3FIzjPMOtbyd
9ZJ5zYPI0c6z0R9cIt/0JcfvHH+EqFnf8i9jP/E7zdOtZyxu0nK1QT8y/m/a
vM2QYtMM72mAZ8u8gPmF9POBgZ/NFz9y5TyCH5X32KN9/C71sM1N7/sBxZ1Z
r5b1otGLT3T7Z1Ik+wn5YnWjlj9xP0SOe2PyNXc51rj4Hj4XPFTe947n8ruW
B8d+jX/2jfoH35bx3/wCPDW5UOC50ob4EDxO3q8OjvtksruL+9XxXN6X/qyq
tV1yEeoTfPGe/+YR4KeyUx2W/BzG8eJ3nRuVLyurlTHUq/m9sDPivnFwyNvI
+8bRDuo/mbnvPO/2MrQDHiDzBeZ3Mv4vYRT/Iy9+Itohh/wO0U9y3FM356M2
LuoN8g3l/dvgkPeX92+jHdwvlyPmhf3HPSHXhf7JIX9NzBf1gHsAWgn7Yfv4
XX8ZYW/sD+Q/3hT3PEMedZv1wm7J8XvtUjO1dcF2wIvI+5D/u+8cUrrtsfe6
8DmX9gm+btR/43nwj2L9cr5w39qnqf+Nz1HPaV9zQssGIYbf4UL+r/AP5LhX
zVH4E64j3HfRZlJE0b5Rhn0c/H7F/8bt4NKPGbejynZUo3ZU2Q71g/rG+b/H
jl/88JfPhX+LlfEz5OHfNgp9kiP+dBPn/tw3UZe+3rtuzNaWhQ3vp8l2Akb+
Nx5G/UQnziPI8Z5kgTYR4wtZRpDzvtaodcXValsYnyA+3yHqcuS1ZPtHzdzS
3WtXph7gVzOdPwX2cSnN/iNOPi/e9+C+jHO3C+se7FYLV+a+/Er6yeryXlbq
U/Ib7QVH//F7QIvCk85u+nqY62ui9NtVxXkN+WUp31h8n52cv2eUHP2E3zb1
W76k2XDD73fAixv1c5f0tzPk/avgqJ8HSo7+I24v2Sfc40Lv01yPqPMvkHE+
5FFXt/EoFZny9Cj7D+4g42o8F/42n4zPMY+Iz51F/Ex9on7uIdpnf8D9jOoh
8Icp6do+Qv2AH4z+b1ztLf3haPkeFJ6LuoqJOFclR5xsIfRDjnr7Ry/nlHvW
p6kH8MUyjkU/4W/1h7R9lhx1mK3CDrm+IP8x479xdYL0tweFHXJeUO81F3ZI
veE9nG+yPsP3CaU//yniDa4X1GeWifXOOATxbWZrbf1yHhEPj2n8d39a4858
Ln5Hszjsv/UZ3JPgIuIorkfEpYvFe+bsD84r04V/oz2jnRwZJ0Me92O83Fr4
Xb1PptQn/HYLo7gUdXV5zsh5xLmelaiT0/+Av61hnzntgwPHayp5snx/ANxb
+rdpG0X+Do73ulfK392jffiBfaJuTz3Dj00M0fIdcvwuctqXR666/L6sWyKf
fandP1mO+sT5+/2VRY6XumBL/dQQ73kqFvL+SXL5/uF5ydEO7pN5KPRMOwHP
aj108LIbS6ln6C1hwrZxIxMjqAfEz+9ui3sXwRHfrr0m7ktEO4gnn26pc6HK
6DO0f5yDXD86cPjBKoa8DPXhr2K8tDfcT1K286RvTmHVDe/TivGqf+X7tORS
Xi859I868wHt/r3O5Igb7eNDWm5fYfBvOL/bIvpJjjjtqhgX7Rnx1dchmv/n
fIG/l34AesO6Xin0Rj0gvkoW+yPrxojTyo7/b30V6+uomBdDXVGeH10S80iO
dXdIzDvtGecai4V/4PpCXlPIaH8sJdt/KN9bAH8p3wdLk/fBgvM+zw1ifeG5
4Du3mJSMK9KI84I458nkCj8ds5zZf/6eXfhz6g37V+YUrwchVnVoP7hH672r
Zj+GdSR5iFwv6Cf88x3ph/Fc+MnzkVr8w36Ct9qq9Z/jgh9Oie7xzHvBaz3f
X5X6vyTzfcijvnpcHTgv7n4ptj9Qxo1nWjboV7K0HfuJc8BX8r0pyIPPifmU
Vjrlgw7yVyUfLeXBv0v/dkD3X/8Gfx40bMuh7NgqbL+zrJPP/Nuo+/UdZdgf
xOdX5XspkAd3i9b6o4c83hv8IZ7L9Qu/dFOeD2IekWf9EvObgPZxHvFR2Amf
y3uBgg512dDWcK4Ne/4iOMeF30XWuOH4rOfWluQ4XzhYK+vaJ5825LifpIiQ
Z/uoM+8T8tQPfj91QN4LBI7nTpbrBe1gn10akW/y3m0NyLGuK1s26djkoaGf
ZeS5gG2NtKs2nb/owGvK89nhe9t8reZdg/K4r6bj6mZDLJrVIkd93jdsveW0
/dZ8/xz12z7yXiZw+OGiN/69b8qKHH71/ciazQdWaE6OupndeXH/EjjOfeZN
mhtVOqMA5THeIw5XI5IHf+Xv+BDHJvb6Gja+dzPKo/7c26ifqBPWsUxSvuwu
wfdScP51c5biNqtDOXKs63aJz+sG9rciRz3wrbw/Cvfy4bz76K2y7gVW1k/A
PWbg20d5zKyYa8/7uMCvJg7zDj75WdfJ065yalsDL3n+7DnF75D+unwvFLxU
dsFCS+9t1vdpFzgrydPAnXPymgYXG6NPO1GmoT4jm/xS/0LDZ8ba6vwanHhy
PMDAd/u59d/3tqYua0f/FbG5WeSnho1wdRv8y2l8+T9KdIiBN8vz/Pt1z9P4
3GURH7eXMPBs558XvZ6nxkMPz+T6vSO/P4LxgjdcM37I2IYlVIwX3P32EOsB
V1I5XvA5Hd3/WVCuM8cLnjQ0Mq1H+dk6jBf8psu+8d82+nC84H2zVz8YNceO
4wW/G1dsaE6+knqMF9z00ZLVQxaa6TFe8JLNih9zMXkSj/swwde/ads5b+4d
J4wX+bXFtVcFdR/MFIyXebe+fsUec17oMF7wR1Gd3tonntJhvOA21k3P7nJf
yPGCp4+sbD402UqP8YJ3vXx6W8KfDnqMF3zY3iPPZhdrwvGCH0xsm6mGF+d4
wd3We1339XvhhPGC+/Te3WnV4S9OmPdg6Vcd75+8NWFu2wToAVx5f8qzylsr
6gHcdEdkznPTO9QDeMqq7KUzW27jvIOX3uVlldpiLe2c7ST887nQwyDqAbx9
85FDh9fvRz2AD7tyueSjao2pB/AhKakNPsz+4wQ9gCc0WRi+ZlcpHfQA7j0p
pVjhrII63NOYIesVHxss690ixYf3XoJXHljy7Z0WXVXoB3x2+KCgO70rc12A
txpxb9Oe5l+5LsBnFKo45n3wNeoH3GWQx8Rf8yOpH3DzSZOc3vpMoX7AAxtM
H2/ZuRn1A16zb69+N83tddAP+K+2+oRg08Y66Ae8YIENZQcl1qB+2H43m1GV
PcvocG/kPJkX7C4afznJpjzvOwWvu/Th2KaNH1E/4Kad7+we6lKP+gE/eKfR
13LD31E/4FEHA7sl9NtO/YCHrnNNL1pjJdcRuEsJhzG9ms+h3wA/6j79duP7
I+g3wMObhgePeNGb+gEf/NJ/66++OuoH3KHzicp5mXbUD7jvxI6lB44tS/0s
kPWWduHN7wZdK8fvtoDPyJkVkb/NE94LCh59vVfLYfN30t7AP3du2+Va9/Hc
d8CXdx4/7J8qTlyP4MHyd4jQJ9v/Oz31/fd0+iXwxuJ3dtQneK+Mk7ea6NZS
n+AfNs5POTZ3IvUJbjOwY9sTqX2oT/CqZy6Xv9LakfoE/y5/bwh9sj8JVXqd
qV2K+hR594gzHRImnfHOV5b+aoY8Fz4w6Hw7u0cetEPID7rqefrkrXuO0DN4
0+B8w3v13OIIPYOvPTmkUIUz/o7QM/iENe6v771pQY7n5ibt/LEmuRXtGfKN
vy71bnDHzBEc8uvFvKiYF8gf8kzbn5xzxwEc8rFivmj/kHfYPDRj2NcYB3DI
t5K/l8Q8Qt715+nZtYeGOIBD3l3ML/0J5EtUXLSv0whfB3DIvxXzTj8Ded2p
ep97eDs7gEO+qrAH+mfInzlq5nWqjo0DOOQthJ1w/4J89KD5n0dnFnYAh3ym
sB897AfyuYGni1ctm9MGHPJ1hV0x3pst6wAH5feVML/gFaf29i/yqhbXF/g8
4a+434H7Cn/F9QV+Sfgrzgt4J+GvqH/wy8JfUc/gW4S/oj75XOGvqDfwpsJf
UT/gbsJf6THep7IuOk/sXxwvuKvYvzhe8CCxf3G84Dqxf9GfgJuK/Yv+BDyz
vrZ/0Z+AtxP7F8fLdtpp+xfHC55P7F8cL/hQsX9xvP/IvLKyiGe4fsFXRmjx
DPcjcNfVWjzD8YI3FfEMxwteXMQzHC94SxHPcLzg3UQ8Q/8J/vG6Fs8wbgc/
K+IZjhe8j4hnON5q+N3K5NWNKpdKZJ4C3l7EsRwv+BkRx9L/gKdX0+JY2jP4
9kAtjuV4wfuLOJbjBV8q4liOF/zaWS2O5X4BPlrEsYzbwQeLODYe/hz1GbfX
vernv9yE+yZ4JZG/0M7Ba4v8hXYObtJJy1847+B6kb9QD+BnRP7CdQ1uI/IX
rmvwDae1/IV6AP/1UMtfqAfwOSJ/YTwPflbkL/HYN/EeyNGEjJ4rHz7n/eTg
9h+tlhTxWWK4n1xys9d9hn87OIT3eIPbjdHyX8Z14PtE/quHPsEnivyX+gQ3
F/kv9QleUOS/XEfgJ0T+S32C7xD5L/VJeZH/xkOf4HVE/su8APy1yH+pT/D2
ced8Z7VZHD/dYkH71baG+oBL3ITTbe12qPkW1v2yONZQH6h3tU5521HeysLf
16JC2hh4t8MpF2f+aqqUnDi+z8wkQ31gl3dL34tef3XrMy3NJ7sZ+CWX0tvM
3kXrq/jEHQ94ZKgPpL3M3ed0bpW+Xue/5QZ9MtQBpv/77Yll5XWH9Tsuec40
8PHB2cPODKuua23vMs2toIG3HXN7yIOYPKeEPW/sOq821AHM3Q5Nv/r8QXyn
assetq1i4OVGnHMv1ul2/NW1jZe0iX5j6KdHp3eXzefG4zsFyKN7za2V8+XD
HN6vDu4q7+fHfeDgaWax6y5mFlNfTjP5aDXIwK3njmrp+S5MN+ZD5P9Ml6Fu
EL3ub6yH3Qp9Prflh3MXG+oDx7u/eJAVWFe3MKmJ3ycrA/+y7+zVXo458SUd
7pTJ2m6oAyzdecltWaW/8esPBp3PqGfg/t9f2FknpcfjOwXgF7YFJZsevu60
f52rnT7DUAfIcbsbu6eljWpf9O2D4wEGblb4cv4aVb/oT89ZsTg211AHiCv1
y+J+0h79vb5Vuq+2NeT7PY/fbJ2/pq3e52rC78Wxhvy9/48iNtl7LPQv2w49
ENLGwNM7hYVEr7sfP/pEwUEzkwx5fYEOaQtTSrzn9xSQ53adb1lzcHZHJUTe
rw7+tNKht9dHF1WKWMyY5FbQwHeOix167Xi6bv/Afa/r6Q159Jb9a6LrmFjr
7W/33GDb2cDtWztOjKyT63TKNce1Sqohv26T3fPo5x8FdLcbnNufu9iQFztM
s7zi9yBH1z/S3+eTlYHfLNUy8ZHLE/28oQ7BSZ6G/HR3mpr9UG+jK/LwSVN9
hiE/DQ8b0HrWqIq6Pfa9XVfbGvLKf65N8dp7+afea/TlyoM+GfK1qvWnzhzX
sxbvOUF86CjvOcF6Bw8cvCVzavJrrnfwq/VWlktucVDFegcvVL3ry8QS01Ss
d/DImenNN4W5qFjv4LNlXoD1Dr5Txv9Y7+DdZNyO9Q7+SsbnWO/gFWUcjvUO
XkLG21jv4C9lXI31Dm4n4+f/frc9XFkjvxP63+8BhSvf8886eCwwiPf/g++2
GHZ1R5/mCtY7uPXcqMKuFyxVrHdw51Pf4g7XecP1Du5ksrJ96s9Zeqx38A/q
r2EDpw3WY72Dd6umy395cyc91jt4MV1MoVulmuqx3sFn7E/qFRhRRY/1jniy
28zXjbKdnRWsd/C7rsVHdutqo2C9g+e9KDbNzeOTDusd/PotmwUlE1253sHf
Ljh8dlFDHdc7eI99HvsWFWykx3oHv63/PnDguKp6rHfEgXK983sK4F/ldxaw
3sFT35VxGnjmKtc7uNvW5TUGPS2vw3oHP+jZcGEtRws91jt4jymXkqpuLa3H
umbcOPFlq1uT3nBdg+smtYpqOrYA1zV4z+9XUg+f/BCPdY04p8ycHbrNT27r
sK4Zj4UvSOlx754TvscEv93l2ehuM9e1VxtlrGpTJdXwu7OYtMeZv2IqJ5zw
bJ5tNcjAp9ivsQsr9FZ1unZ/U4ksw3tWU/o07eXU+Iia1G5mt4KTDXzEsBnL
t5ebzO9vwu99LLLG6ZO/Jb+bBh4Vd3PTliXn+X0x8LZLvzYfXzia38kCnyLP
bdF/+D1bL/eoBwd1zqvUU/6Pjht4/yKbm5ZpVtcZ4wLfNGdXs5BOeUqF5j7l
UtsauM32xrebzsxQMF5w33KD2kbYGc7NwRNri/sWoAfwS52KFe350nCOCX5d
3reAdQTeRqwjfr8G/nnv4huFjtj34PfUwNP6pz5YtLkhvzcHflN+bxHf9yGX
71/huzngk+R3GGEn4GtvtCiTfGQd4xPwz8JfqcZ1IefnR84n9HnugHnBerQX
80K7ArcO1vRPu2K+LPRMuwJ/76Lpk3aF9XVe2BW/zwj+S9gVv2vGfFDYFb8H
Bx4g30NA/7HuLop1QbsCdzlt0uLDkfy0K/A5Yr3QrsDfHBp76+bC+7Qr8LFi
HdGuwDvKexWgB3APsb743SLEn/dFXkP9gJ89VXJVauOiXHfgCUW2HW9UKYH6
AT8UkS/kQbEhXHfgw73P+8w+2YPfWQPXHdfyAic8F35GJ7/fiueCz+iXcnZB
QCrXO7iN/B4rngseuCcqbOePuvx+GfyMpdP9YmcO/1D5fTHJ0woeLjX0VpLh
e+WSF2tdMKX9vCUcL/j8oSVyRrTYxfbhZz4lLa2cv9Fd9b/fpY1UX5m+K76i
QmPWsSHv3Otinev3TzN/BA9Oa2ky+fcqxTj+7C/jT9Tf0P74JZm1bxTtQ71h
3e3bcXx7mm8evzsMnj4gtOL3gq7sJ+rGzjNPnqn/tzm/7wb5aFHfoz1Avm63
jODWk35wXsDHlKj9qFVSIucFvNKvX/fsnyxWXsm4Be2/WP39cZExn7j/Qj6t
r9Pv0QX7sH34jSmhz9uOLhfviPbBd3hPnPDnY7AjxoW4y0eMi/0H7yD6z/kF
DxL953pn/VP0n/oEzxL9pD0g/tkmznf4nVnwGmGhC0/10dEewKuJcx8F/QSP
FPNIPYD/I7+nOeU/70eFKw16iPfn0U/WUcW80w/ATzpETnjXOaEUv4vK+ErY
Lc8FwFtMHHU5Iuki1wv4iHraeR/rHuBe4rxPMY6vesv4Cv0BLyvWEest4NFi
vfC54OvEeuE80q+KdcrzIMi3CNluvSfNl98TpHyji62+FazAdYS4aKLwP3y/
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
4/l00G+WPVn+VnE/9Wsj+6nefD/1OXDwcF2F+l6xllZpcovZny6G87w84OWf
WP5T9+pekkPR6nu8C1eY/xq7YbVrdvCDd0n6am6c7DPZ7PksV1+ex4fs/k2W
D3TTatMuP/+ujod1GJZh/l39YdcO9Zfuu3VW84CrMZ0HXvJ23T1/2irnQ+p4
WMXMbwFvb4xXWvN8QODzeN7M5x2aty5NUseTaqe1XSeJuqycuf5oRrGdmpv0
SJz1RjtJ+fG74XMfn1HHk3Zf+Xq139Yw5aIlleYFbmru6Jpu1HPKEGU9zzdE
fiE3lnfSIbWqZk2aOk6zb9I3N6tvV5RnzRJSop3VXKe625Wd18KUrn9I/SOz
1HGaA9Z61N/6M8Q1q3lRc4Wvmut2zzmmmx/g6rUi+kLIY3U85m/pNsNjx3i7
3uN5jmgdwvM81vA8TZi3y3lc5HLJ82I7pTr+8SCPi9Q5EbPZ6mc178HjItdZ
dx3YuUAd/+jL4yKNd9ysbDtJzT/wuMjtbebs1y9Vxzla8rhIy9WGo3UVat6J
x0Wm8LwDYlykeN8s7sri/K1uzlIx3nB4B8Ovy2c1k4pxhTeyOy6N9C6UQF6g
D7vxOEExrrDZl+jIwOXHJWL8YF3lrdcLe8ZJxDjB3G5m/XrlBkrEeEC34JNT
B9YOlIhxf+cDHV6ezegqEeP7bDbV/Gr10kAi7nNzGtnnXub7Wcgv+JlVZal9
3l9SQn7BO/izfIiQX1qHFJ/8MvVaBskv+NCGvYOuSX4l+aX1Sa6/Kj8g5Bd6
zLaqPL1t4XmSX3D5X6/mB4zfTvILbtfbf8GbT2GukF+y1zy/HuQXeu/Uo1lG
5/4+T/JL9/Ea8i1y06JIfsHth/be1lRnmCvkF3xVLwv3jIghrpBftd1neess
+fsYsGvuPH8c5Bq8ScmEmmzdCJJr8Ga5VfrGHaNIrsHnm+ydVxL5ixJyDb7K
sKvzYhsrJeQavMzC5ODghjYk1+AreT44rFuw77bf+NeI7g/7ZMBegO8xs4w9
E/RJCT0Afpnna4MeoPOO5J35n0t2kh4AX/Q8TvtrbDDpAfBKScj42X1/UkIP
gN/V/q5fxABrJfQA+MwLrq+zPtZehB4A13p7/ZxFcpEL/APQqx3ZvQgNP9th
vh8Rz5FNGzlHTuPnyOK55PKQ7iurskKk8HdhnnfmebJQH8yTAuavoHMu1H/H
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
WmdqHVWmfp8c/638rk26xMso4/8AJVBDAQ==
   "], {{
     {RGBColor[0.880722, 0.611041, 0.142051], EdgeForm[None], Specularity[
       GrayLevel[1], 3], 
      StyleBox[GraphicsGroup3DBox[{Polygon3DBox[CompressedData["
1:eJxFnXXcFdX3/e8zc+8UBmJhgIQotmKjqIgYqBio2N1d6Ae7EzFQMBDFAFtR
FBRMwBakDMTALlCwQER/683av9f3j+Hse54zZ+rE2msHbY88be9Tk1qtNqKo
1VKVa2e1WtumWu2JRq3WXcflqruxXqt9IHkp1d+n8qm8Vhus+jV1zq76fYPk
29Smq+RLJF8veQfJl0nuL3k7yRdLvk7ydMlLqp+hKnfUcYXqb1L9obruxaqf
obrDJV8m+RPJX+jmuui4Qr931+8b1X6Q2p8meYzkFySfLnms5DGSX9C9PSp5
fd3bbqrvL3mg6veSfIvkuyTvI/k2yUMk95J8q+S7Je8teYDkwZJ3knyl5Jsl
b6m+2km+X+X+urf/6V6m6e8767hK9bdw/5Lvl/yw5P0lD6G95EMk3yf5IckT
ylrtMckTdI8/qH5F9fOQyuGqP0Av/yiVh+n3A2rzCP3o92lqc62uO1rvoI2O
Y/X7yIb7eVxtjtf9DFDdLNX9rb/voeM2/X5O576gNpN0rTG522+gft7UdfbW
cZXa9NY5d6v+PvVzlOTHJT8h+QTJT0seKXkVnbuK2j6iuk90rZskfyH5RB3P
qM2zarOf6vuofqrqVlD7P9X/ciovU3mpjo24Px3r6/hO5yRqt67KXXTuozq3
i+pHq25LydtJfl7yEvxWm15q87eODpK7qvxCbWYzlvT3vXSNjSUvUrlAf1td
8nYqr9Y1f1Y/nXUsqXadVb+P6nPJm0ruKTmTvInk3SVvoj435Z2p7g/9XlX1
W6r8VodeY21DlUvpb1tJ3lfywbre9pLrep+Nhu9hN9X317v/Q/1sr2Mz9bmF
ylH6+we6n/nMHR0L1W4Ntd9eZZP+to7knSXXJK+tYifJ/+lYS/KOKpfRDXyn
817XtWarTWvJj6psVelbqs1M3cuyajNb9W+qzcWSr9L1LlQ5i7kseYTK1mrf
Su27q/1naruhjm/1e66u0VHlDipPUbu7VP+V+n9Jz9JOx/H6fZLqb1f5peq3
1XGR2l+r9hdJfkfy25KH5V4HVtM9vKBrtte5p+uce/V7iuq/1d+n6Xd7+tHv
w/T3D5u81lyo9p+o7KhjS93ncvr71mp/vNrMUF0HHefqWq+p/jVd6zsdalbr
pHK+jg0l76qyhZ75Kcaqrvl84TE+iPem/g+MMf+Wyu3U79WS79JzvaWylcpj
M9d9pHKRzrle8jHq7x/J10g+WvJg/e1tya1Vfqs+uum4Vr9nq9xRRz/Jh6v/
3UN+V/I7Km/QcWzp8nGVf+rvPXXcqt+T1GZnyf0lr6pnaKbjRua46ndLPN9+
VbmrjpslH6fze0luUvmbyh46blH9EN3TeyrbqVyoe75O8u0qnyzd352S56jP
Q1Lf8/Gq30/n1kuPpcf0ft9TmenvvVU/WG0K3pvkuyUfrHKIyg/0rk/VNQZK
nqB7/V1tLki95uyZuP511hS1mcS3U7mX6gdJfkP1B+v3A5K/Zxw1WWYv+VB9
PMjclzxN8rI6hjJG2QNU9w37Tuk2I1SepL/fK/keHQvU/8Qm38MOpefZUD3v
2RpDezEm9VwLWY/5Pipn6dwvUrf7TeUxqdfQEzJ/h9F6ro9SX2NYk9d91v/f
1N+hutYjMYYfUP2FKpdV+bPOaSu5i8qb1O5UySvrup8zhyW3V9lH5z4ea+Bx
kh9lrkn+Vc/2tcozdf25rO28H/XxSe53VuiZJqvu4Xj/y2XeQ9lLUx3bqG4/
9f+Xjg0k91D5kO7piSbfc515q/reql9a8u6Sj2Sc6flGqs08nk3136v8kTVQ
x5NcT32soTbPSN6OfU7ys/Qpubna9FR5lPpZJPl3yS/xjdTmZbVJGM/6fYjq
T2MfkXwwY4f1jWtIflllrmf5l/VcZapjgeR5rMfqZ4z6OEy/v1Y5XMeykjdW
/QuSD2XJVLu/VY5XPxuofhRjUL8v1fsawTqp+x+q9zxa8l+qL9X+P/AJ74/r
MTdVPqJzX5LcxPeQ/JzKPVjr1c8rkluon6XVri75J11rP9W/2uTv/pr6f01y
pqOL/natzhvAWqT2pereV90d6vN5yfP1t++Z4yo3Ufm1DnVRW1flDzqWkLyZ
yl907ik65ytwUOI1bUsdV0n+S+XWOv4n+SeVG+u4Um1/Yc/Rcbnq50b7axK/
h21oI/l3lVvpuCDzN/1b9zZH5SZN3lNPYxyDK/T3nxOvS6yDp7NmsV/r75dl
fs81lbcCHHV05301uQ3z7ZzCz7q7yvvi/e/FOqZz1uRdsJ8kHns76biDdSix
3E/l0yq78m3UdmHIwxK/w314D5nHQF3lNZnHSabywCbPc+b4EJ17qo5/JLfU
Oz0HcEufpe/lf7q3B1R3mo5F+tMepfs+T/Wf6NhP8vkqPwfz8c5YT0r3ebLK
K9n7Vb+cymd1b610HMU+VbrPU1R+pb8dprqLWYcLY7fLVN6jtiV7gH4/Ufi8
S1X2zzzelsqMx0+WfLXKp3Q0V91vWk++l3yE6i9ReZuucyv7hH6fUXgeb6/y
rsTztAf9Zh7P/+pbVzp2UptD9D6Wl7yv5OMlv9Lwt7tJZcJe0+T5uZ5+91F5
OTgIvM76LXkFPduvavOWrjVW8nTdw8MqV9KxgH1P9f+p3KXJ60IzsLLKQ3Xu
QPX/j+p31LGh2m/BmFb7g9VmhNo8rTYHsY5IHiH5Q8lLs0+o3EPHvap/UPV7
Sh4qeZjkm3X9v9VmZx3rq/4c1V8BLpD8P8lXcc/MW8knSF5Rcm/JJ0puKXl/
ySdJHqp++ug4iL2t4bF0q8o7VVfoPntxHyozHXtLbqu/HaM2Z4NJJB/AHqey
jY6jVX+W6m9R20Wq79ZkjACWWF7HD4Ef2KcHqv9c8p6MH5Xfq+yk4yHJzXTs
K7m9+jyOuaU+n1Hd8joOZW/SuWfrOFjyU6proeMQzlXdcB2HS95Ie8AKvA+V
HdXPGernIvCy5OMlnyt5HclnsXZKXlfy2ZIvk9xO8rGS+0g+P/G+wDpzluRv
VG6g41S1eVtt3lSbkapfLvF1n1a5TNznTpnv6221XUnHLsxTtV+J71H33Oyp
NiepnKi/7yn5VMmTGl5zWXvvVLm3xsppan6znmVl/e4h+Qidv6zkHSQfWPe+
wvjt3/DewB5xi8oOfCPJp6hN98zf+S2wbuZvO67h9Zp1e4jKZRrG+fujw2b+
Pq9xzcL1x+seWuh3N8kHoHvqWVfUcZzaraX6I1V/hupf1Tg/gnmk9j+pn2OY
I/r7j/rbkqrfom68s57q1+WdZtaVRqrNl/XFS22tY92YGGz8g8rTdJ2Pm4yZ
v0K3Uf3aKrtIWJ59XOW6mbHzk+pnHu+a/RNduPA6DT76Tb9Xlrwp+w7fQvL6
rA/oqJKvYc1Q+xvAB1p/flCfR6rPd6jPrXP9kRs3gB+uZi2pW9fYSuUc5p7k
dVTOrvve1lK5UWa98FmwA/hA9Zujz+o97J9YD7lZ72198LHK1mrXS22OVZtj
Jb8M3pB8DN9P8ouSJ6rt+alxdgv207rx4vFq86ravKLf+6jvO1W3qo7jVP8K
OIT9WuetrbpvwBWBe7mHTRhn+vvGuTE4WLtlk/E72HwlHVNTY1zw53+J8TP6
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
nnFvq1b2qy2a2U+Paz2rNkenvofxNfs08h5OVPlN4ufheeeEzLubmZlzO1rl
MYVxxcvB7R2bGK+iG6Mjf5cb+7BWw82yt2OjZR/Hrwu8g05NG3y/WM/BAugt
YDbwGjYtdDFsegcltushY+eDxxgSMvVw9dhJGyrz0uMXfzFsl9TDgzCX0c+/
rJnn7x3zYqju54DEfqTgaq6Fj1mZ2u7JuWnI02PfAXuh54Axz4p7/iZk9KlP
AtPwvIem9m3gnR+s97Uc6wJ4LbPP4clwDJltJUdm5o+Ym+hBcEbMi4MK+16i
RxxS2P61Q8wFdAr6p9/5ifvkuabG82LfXJT4eeGS2CvhDtCVwJvHx7cDd50Q
9XAZ6Mf43c2INnwzbOe0hbOCuzoxvh2Y9+TEuBf7In2g09H/KXHu53Fd9ugR
sXbBLY5PzJPjMwZnfg3rX24cio8Xeiky+jOYEhyL/xacEjI6DPrL+Znr4JfQ
ucGvYNY/Q0YHR7456uGnaL96Zd2Y74aPHzoBvh2bxTcFp6JHs2+zl3ePevRt
sOsphXE0/sZganzR4CLQFeBN0Be+DxkOAix8XvT/Xcjo4ycX1jPgwMHUXAvM
gH4JpwOPs0ppHyK4Bfj+G6INGOHjWD+7hoxeyZiaETJjjjHCWGL/BxNgy2Qc
MZ7QT7cKmXGF/GnUs26yBjD24J7xZYFzxk8R7ANeAreOiPrTC+vEbwfXju8d
uht6Bj5t4H/4BXgF/BJ5J9fGe4Cr4lkfi3o4iG3jXHQVuJeFIdPPWaFr4Gc1
L94Vev3sGBvoO+j9l0U93AncDfamkSHD4YCjB0U9fAycDnoU+GAxdihsf7gj
2mCPvTOx/ZVz70+MycERYA7swth44XfgduhzYMjcw6BoDx4Bc4A3ypCxs1I/
JOTVSuMacA64AyyCTRpbK9f6K/rnWj3i3gYnthPjo0NbbLLc2wPRHnyE3QKM
BKYAW2AvwG6ADMaAJ2AP4NuvWhr7g13BJti8wSeMeTg45kDbynrVR5XH/8XJ
//FulPiiM54vjW/xY8gbxP3g48Vzst+zh48qXA+ewwbJdcFG2KoZh4w3dBhw
+pOJMTztwYLYYMD76CrYTVqEzHil/tGQsY2D58By2L2HxzvhWmAybIq8c9pg
48aW+FFiDgpc82HIjP9n4h7AtmBxuA7sgW8l9qO6vjDngZ0UbAsPAj5eJ9qD
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
ZfbrBr+y/w6uzBtiy/t/OLLyng==
          "]], Polygon3DBox[CompressedData["
1:eJwtnGMY5FgThVvpTnrWtm171pq1rVnb9ixmPWvbtm3zW9uctTGL733n5Eee
vnWVdHJTt6rOqUy5+S5r7NxqNBqTFo1Gh9/Re43GN+1GY32O17uNxq3IF1K/
Cu139xuN0ZC/pm0Njldov7xqNJ5qNhoTU+4NaDSW5HcUJlyNMQ8z5nb6X0x5
Ncr3Mv5Dfv/H2I053qHvNbSfTPtS1N9F+1rMtzBtWzPnjWWjMS19XqT8L3N+
TJ9Hked3PHXLUR5C/+OQ76LtLcY/zXwPMt/WyI8gX0mfcWg/hOM26sal/XfK
f3CMT3kd/vR7lG9mvjbtYzHfIZzrTspvMv5Vxq/peNo3obwu/d9HvgW5Q5+f
OK6nvBdjbqc8C+NfpDwKdWtx/fch9xkzFeequD9X83sS17ckfe9k/iby88z3
LP0nZ/4r6P8McoP6kv5P8ns/4pb0f4j+zyI/jLwt8mPIzyA/hLyN9wb5b+85
c53CHPdT/ow5l6D9NeQ2fUdQdxvtJyLfR/l+6m6gfX3K9zF+Rc4/N22bUPcu
178y8rzImyJ/iHwH/+U75KeZY7Mi/8v/9yF19yDvT/kvypdxTI98MfL5jJ2C
3/l7uV9z+jxpnwx5ANe3OXJB++Q+O46b6L8h/R7geo71HtL3L/oV3I+HaL+Z
9o1of5D2q/mdiPEv0adF2zXI/1D+m2Ni5Kc4HqD/VtQ/TP8+8ie0zcbxoOuP
/ze964dyn/lvoM8hXMuhHDdSvoJxYzP/Y/T5hz4rUP8O5Rup+53ywcz3KfIA
/wvjX3XdIc/CGljPd4L6d11v9F8Y+W3an0Cev5X19Ir/E3km5HWQz6L/EK53
Pupv4vz7cY4/ab+AYzrqtkD+uJ1nPIZj6X8j/TfwWdL/JeZYhfZ9mzn/Cdy/
+5FHUO5yfVPT/276j8I801D+H+3NVtbINsgfFGkbi2Mm5D8Zdw/jl+V4hvJJ
HA/Rv8P8o1OepJd7PSb9J6Q8peuW8gbUvclcY/hMmLtL3RSU3+im7VzqvqR9
OMeVzHUDx8+Uj6PPvrTNQfla/s9z3gf678/xNWMn8pk2ck7P/T512zof43ei
/J7rCfmkZvTLvVWux+salf//ou8H7VOqo7z//P+C8mKUP+R8t9HvIuZflX73
II9L+yHIxzDHVsgPUr8yc9/J8R/lW+h/Iu0ru/Zpn4X+lyFfTf+DkCdi3ieb
0anq1hnKvA++F/vSPkk3+nND7xflX8o8u1E51qb8PmPeov+BzP8i/Wei7hLk
Kxl/APKLyP/Sd3F1Hn1nRr6U8lW0H0j7UdTtiTyL9xn5GOS9kWdDvhr5aOS9
kGdFvgp5qDoDeSbmvJnyplzT2ciH+b5T/oD+byMfRNtL9P+N883byvM8mfIf
ZXTlmK4/ynNy3ELbrVzPEPpfiHwmbU8gP488F/KttN+GfBjyr8j70z4axzqU
3+N8b9J+AOd7wefBNTxG2+rcr5cpz0ifC2i/hPH71ePn5nrOoe4kyhvSZx7k
45FfZo5Zqbuc8jW+u/Qfn/bHm9nT3Ns+5HiH9kPcp2ifnn50aYzN78yubcav
gLyZa5z2LvLS6k/kdZEL5KWQ10NeB3kTxsyrOme+9dTftC/O+X6gbnHLtE9A
+TP6H68+p24g7d9Tt5jnon16yj/QfgLtF1fRL+qZd9XXrinaf6R9GPKMtD/K
/z2aum8ZfxoX/wLyHsy5AeVvfe6U/8cxPfLWZZ73R4z/gPEV8orIg5E3dH9C
Xgh5TeQ1kVvICyOvhbwW8va9/P+xmXcT5AG0r6m+pX1j12eV/VFd/ynyZ/S7
EPkijs8p9+m/hvsb/TeifXT67831TkHdY7T1OAZR3pT29Wn/CXkG2i9i7M7I
a/Ifpkc+iD7PU/eb98f1R/1ntLfpvwhtazN+beTbyzzvM2n/AvnWMuvpdOTP
kR9gjhWR7+D4xz2xl/W1HuVDaV+IeS6mbRaOW6j7juMabQOu4QbK63P+pXk+
u7j+KX+vHqO8De03umdzrIt8r3ue7z7HkvTfuRl99CTHYsg7IK9C+aIy9+tT
xr2hPcL1vMD17IH8tPoe+Rnknd1XkF/RnkDeHfkp5JeRn0PeDflJ5NeQX0Te
E/kZ5Eur7EfuS++pjzjfUbSfwv/cCfmSIu+ia8i11OK4G/lsxjzqO+meSHmv
ZvavUTgebEZnq7t9Dj6PRxj/AvJunG8P2k6k/A7zf63eof3hej9Zl/bFad9R
/VPGPniA8jXaSPQdr7bfxuX6xqZ8uTYb7a8z/xn0/bUb2+MK9yvatkG+k//z
M/JY9P+5m730Im0Y2pvIdzH+YsY/gjwH57ye/tcz/yHeP37PbsYG3Zf2Kcvo
+zOo31X9gXwY8gnI2yJPi3w68vnIeyFPgHw48jDk7ZAnRD4C+UTk7X2e/F6g
7cexP/PP0M27uT3X9wHl6eh/Bv0voN/e9P+Y//Ae8hD6voL8JL+bIV/KmC/U
3eow5CMov077n2V0t/dofcr30H5eI7bYWOyHH2mfIB9K/5fpPwV9hiGfzvl2
Qf5UmwD5cNpfQ54OeTTapqZuWspT0/9UyudStwftUyGfgnwO8u7I06iDkM9D
3hP5KsYciryEawH5deSXkPdCfhZ5vDLtx9J/6372CfeLid3ffedZH7tybyZl
3OO0f6IN4P5E26vIEzN+qHsR43Z0/0U+0r0AeQftSfrvgzy77y3yG9pAyHsj
P6d9yPybsRbGoO4exl7EMxjRio05tc+DecbRT+J3em3RXu7XSkX2n6MYPw3X
dwd929zfm2g/gfYVi+z329O+E+3f0/6P14N8OvKPyB36d7WRkMdg/hko39uL
vbBukfV4JP2n1pfxXRyQ9bwh13Yhdb9QvqOX57FGkf3/zl7u/5pF7JG7elmf
axXZ/35izPna7vo/lK/sxd5ZvMj6vgL5YPeiIuvhFdcx/V+i/35F/DfX/9JF
nrf2sr7hUxz/+T5zHNuITaptulcv+l5/c3C9f02I/BPzDkJeCXki31fkFZCv
6+V9WbbI+jmb/38rc/U4/zG+q7083+WKvG8Danvce7KM+pN5VkNelWMF+lyi
fUbbRrTtQ/+TmO9c2taiblXK1/byvi5TZD3f0Mt6Wr7I+6fNoe0xkDUxmHLV
i+8zF31Kyr/pE6u/GvF/jud8e+oLdrNfrcrvAY3ofHX/WfRp0L438u/Iv3MN
S6mbXHf9+Kz6ru/RZ/Zu/NnZKB9M3TeUD+Sc6/su6hvQf1gV3fyH91xdhHwd
8n6uCX27bvbWCam72vXcje3cRr6U8nH0OYPyatQdXUUfnU+50qej/Ann6VBe
pxV7e3v1GfK3lJusx9ur+H/6gY0BeR/0RX/2ntL3tir+jH7Nf1zv3YxbhvmH
UfdDrb/17b2H3kvjB+qT1YvYu+p0dfvorfj/6nB1+WitPO8Tmf8c5DVdH5TP
47gL+RjmOKtKnMB4wUQc19J/d+oK+p5L/b/MfybyzV4//U+lfKx6yufJ8WE3
75++80+0L8X/WazWhfb5lPahtJ9MeXnmPIzyJ9QtQvnY+p2/kP4rUV6RY1CR
d9Z3d4dG/Dv90deRL2HM0q4F/v8otH3FuCW5vo2R59GfKmJvros8E3KjiH12
MGOOYvxCjF+K8nr6BC6xIvba0vpByMOZbynkJXsjH1PjS+QltH8YM2onun0Z
5EH8x99of6jerz/vZv/WXzS2sCv9d0deEnkF+i5hPIDyF8yxeD/r2PWsz6Xv
dQj9j3a90Gcg/den/yyUW0Xss42Q5/bvFLGfN0deEHmUIvbfOsgzIv/H/Gvo
H1dZz18j/+H7XOR6V+X/L8q5d+nFfpxQX4b2XXux3ydy30TetpdrH7OI/fmS
eoyxj7pnMn67Xuz5sYrYs1v2Yv+OVsQ+dt27/r9sxH+9iut5AfkExm9NeYte
7OdRi/gLB1J3uP4ndftTPo36EZQ38Hl1E8MwljEMeTttgfp6tHEvLOIj6isO
Qt6a8sBe/JOP+f+L9LOe1SW7+L6XjZFxJONJRzXTf3Xkaaj+k/6r0v956gap
v1rxD75QT9F+Za2P1qD/tMh/qUfpvxfz70tbk/l2pLx2N++WNqC24LXUfdCO
LlyF/ivzOzHtvzB+ReRVkCdB/tX3wPWsDmwkxmas7XyO77mW8ep42Kr0n5T2
3+i/Mv2fo245+s5On/W7iQkaG1yTYwfk6/TDaH9Ce1R7WzsC+XmvF/ntbmKP
xrCMZV1ZJf5mHO5v5l+0N/KWNT6hbSDytfoN7g8cazN+c3Uw7Rshv0V5S46r
9E+Q36X8KP230PblfDsU8e84ReNz6hdjvuWQx0X+FnlZ5H2rxDZa2jeUl6d9
PNq/o325fq73jkZiGsY2RsZbKQ+l/9083zvpt5m2LvJgfZQq79bHtX0xo2tK
VUyfy7uxM7Q3Vmom/vUQ/cdhjlld19r7jmPAq43Yu4/SPmEne9TB7mW070b7
jMhzUZ6jl7U2Pn3m1DZUH9A+OXWP6ItTdw/liWmfR1+E9qkoz0V5jAHRafN3
skbUdXuoUxj/KfIPnH9h+v+m7+EeRXm2Xmx/bTCv2fOPpy2OfFCt0xbsZI2p
67wmr20yjtkpX8H8o/P/p9WHo7woc46BPB3yFVzvmPT5sZ2YlbErfQ59D9f8
V/o39N+O6xmT9vvovxzyrLTdT9tH/TzjOTvx6X326sC5O7Fx1I1zI/9IudNL
vHFp5IU7WeOTUX6wyvnf57yj034L807VTkzA/UqbUNvwn9oG9n74/H5rxx86
R/+kmdid43djzE5c7/TUzdqN/a5+n5L+N3Vrn4jyqbRv2807vnIne4zv/kJc
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
CdL2nfZrGbxLX+AOMeZuOCNyR3an/cxeOBzWWfb+yqE6qxMOkNwq48fGS1wD
8mcuN4bjXkX7kfX6n6wRH1Ff8dJ+9Jr67cAy9oi+uDbiA663MvdmbPVlGY7R
8fXzlXt0ST/7kvvTAWUw5dlrf1WsWbzceLXv+KVF8NXtKfebiT+dQv9V6T8f
/Tel/3nI2yCvhbwP8pHI9yLfh/wE8jHIzyA/i/w/5BORl+oE016rF8x71k5i
JPrLxyG/2QnHQK6BmPLWnWDKYs07cM3zNPOOLkh5y374OrvV++vmyLvV++3e
vXCaLuuEwybXSftfrtVdyHd1gkGd2QmmJzblO+S7pP05QT86Xd0uPnlTmT3a
vVp7czyflTYs5euaiVf8Qt2p3cQPbyljT+urPKk/wnnuLLO+XGfq1jM4NqR+
Gdp34PzT94PVnVXb09rPcq3G4XiXMatTt0onnII1e/EnjbWJP8zRD8dgg04w
ebkH2yAf1wmmdkYvmId6V/07MeWbmHNHym/V8QHXzzvNcAJ8v8S8b+gEExUL
l+NyaSeYuNyXGfrhR2lzaXvJ7xFfObgZ/o/vs7bhoZxj7CoYuVj5K7V/LL/E
d02MRqzGeJr+nDE8Y3lzMOYd8Tj6r1sGz9UXNOZl7Et/Yv1WOA3f1vG5JVuJ
2Rm7Ex8Wq/mwlXuq/tdXW7QIvrJRmf5b0PYd8mxV8O7xuuEHyC9btRWfU99z
2yrxROOK32tLlIl/DizCNzi+iG2kTaJtchzHbe6nzFlRPok+S9fxiLW5fyfX
8YkZa/98ln7eN7kM3/azRl2rXoPx4OOKcEe04bTlTnM/qP37wb3wDYxtbe1+
0Q0nxHiU8SfjH6cir4Y8P/JmyKfX8QH9e2Pts1axJ8bphg+xm/5BMz6ReMdR
RWLdxgCNBYq5i73rs4iHyXGQ6/B6M/G1c/rhbqg/jcWf6T1HXhZ5R3Ui8sbI
y+lvI5+NvAny8sg798KplFv5Ye2vXeMe1AhHU67m3sgrNOMjiHeNtAcasUG0
ReRx2ver2j85t97v3c8Pov9bZbCk8xi/fxn8VXx5fPoX2nv035b+azsn8gXI
2yGvg7wf8ptlsKezjBGKF9O+A+3r0X4A7Rf6PJHXRd5few15x04wO7G7xxnz
Eef6QvuC8t1FuD8/Ubcg17tAN2V9Ln2vd3pZ6675nvZUL7pHEu+oVexBY+Ny
qF4rMqdzX1/7f5/rgzRrDg7ypWX4d1/V+vS6MtzW45ljfOY7qRd+xkTeQ7HT
MvIkyN+UeR76gochj6OtUIYbeYDvLPLPvXD7PIfncoxjV+pmfW9RhWv8vTaH
eF2Rds/xjT6oPjLyB/rDlO+pwiXscZxZ+7PaultoI1H3bxls5Cfmu7mKvSrf
QZ0k9rtnL1yJEbU9vqI2mLEKbeYqfBexkAPp87q2G+1VKzaWtlZLzKOVmMlb
9fPTt5azJHdJ+2P+ZmwabRvvgfdCm0T7xnifvr4xcmPlxhCMJRj3/rHIM/RZ
qoPdvwdUeZeNObi/q6PcB9wP1F3GFIwtyEEyPqoNoy2jnfMr/a6uwv2t9KnK
xCOMpcpxkOsgH0/uyYbIFfI2VfALcYztmaMQQ2yFY/l2Lzpvx27wX3Xhzt3s
a+5vrsf/mG8N2lra31Xs46WR3+eYq4pPrW+9SiP81U1pX66VmNEZZfgCcmfl
UJ3GvGWVa3PNu/aNmRg7MQZmvP4IrueeTuLRj/fS32uRM+L/mbAfPrq89K8o
T1GF6/M7fVYqw4mQq3lpI1wJORFyAy9rhCshPjdqK5ytx4twPOQaysmQ+6Et
oP8uhm38yf1d7Ok96uaswqGQKyRHRG6FnIyran9WrsYBtX97ce3PGT8YsxWf
Vd9VH15f/pdG+GifMv/4yCt046+fXUTWZ9V3PafIu+r7I7dKf3icVvYg9yJt
G9eyNrrxNd9p+6/YTfxAjsn1dfxU7ok+gr7CRsgTF+FEnFv7n3Il5GTI7ZFz
IldDDobcJzkncjPkTMhdknMil2JS7skZrcQknufcY5exrbxedcvh9L+9E07o
I/R/qgj33GcgPnqs/mInnB25O4OqxA+NIw7vZ70+0UgMs2ustAy3/2jGj2ts
v4xvfzfydFU4p3JP5ag+3Ms77bstluj6l7Mqd/XmOv6wLOP/acZHn7gK51V/
Vk7hHWU4p3JP5RTeRnmyMrbgs/SfqQoHSO7vebX/rD12WRF7W/00jGNvyiu3
Ey+W07s4fQXxXkJevkzZNWfs6Ev9tyLxULnAS3OM0L9k/OFV7BO5hHJm5D8Y
fxTrEsMSyxK/lXsu5+7UTji2xrmNd8u9laN7XREdoa7oVHn3/+A4v0x82r1Z
DG0axjWrYLE/uaeW4VQ9TP0j9fPSBtQWdI8WrxCD36neD8Xm5YA91EmOg9yw
ycv4HsZf5CIZwzKWpT9vvHAq5rtKe48+r5aJ8e1bx1fcX6d2T2ol5vdOGQ71
U51wJuVWP1Y/X5+/uRXmUNxSP29zK8whubmTnARzS+ScmWMgH00u2o3iY+1g
MueWyTG4qRNOvrkHcjLvrvWTXE05mfd3kpMgV1MO5oOd5HDIzZTT+UAnOSxy
PX2m8lHlpfqsP+EYrZs1vLa6vYyvMo+YrrH+MvdKG/JIyptWWUvDtaer8Mvn
aAVjOLGMPWns2BjjAd3cb2M7+oByl37mmLUVzMBcguWr5E7MJV5ShQP+dO3f
6a+tX9t7y9f2pBwJucQrNMKd2Kcb336ORuLH03biq37SDJ6sfflJbS+YG/Bx
GS6VMcpPtGU4dmok5vkl5Y/72ffd/28oY3+bayGHRox109reWq+2P+WfDW4k
Zqz9J2ZrjNn9aA+vl7ol3G+NEVSJERsr/rMRfpwcGLkw5gDIZTX+aWxcjobc
EWPAxoL/aoTfq041NiunQl17aJnciQlbuf6h9fvxcL3+jFWZj2BM3Ni4Pr7x
5UHd+P7+f8cu4vOj/1HUPVK/X88h/66/5Xp3vLF4jsuQ12COl8voyGW7sXnV
ne4hxn69p+4t3u/xWsE4h/m+IbebqfP+y7ueof6/clPeV4cjL0D/Q3vht5lb
YQ7X0Z3ES43Vm0NiLsk0nPP6Vv7TB4x9m2OMVnK6DunFJtT3kc+trSifx9iZ
99v7fnS93p6p3yfzDRZuBUM7lfKRRXxZfXJ9c/ExfZEtkXeh/IP6j/Lz7oeU
Z+uGWyfGPHUnMVBjoRs3gkfJUTR+75px7ah/jSX5TqqP5cw+1wnn+qN6f3Cv
FkN4oQxn2/3q5UbsbWOMxu/kKMmXklP7YiccWLm2cnqf74TjLdfXGI26a/lu
YjfyOfSdp+C4nuubrYyv7X4i3mcO3O9F9jxz497ux6cw52DqfjiccntPqPWp
HOGX6v1U7rA5b78Vsen1r+Qs+sz7tT6QY/tCJxxyubfXu967wRPEosUYxRrl
J8rN0l7UV3ZPnp3y11V0szraWPnwKliAMXFj43JmzVuTMyh3cK5+7qV1tq1S
xRaRsyl3c8kyXDw5d3LvvqqCNYgxiDV8XiWWJuYi9vJlFWxCTEJsYs5+bBFz
4eTTGiN2bzm1Hf7jymXK+pj6muLrcknklBxG39nL2Epizs9UwdzFocSjFvLZ
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
a3HvKrlV2jj76P/0wpUwVil/Vv6Nutccpl2qfANjiUZynIzvmJNhbsZ+9Xhz
Xsx92Qd5zyo2gbaBOTfm3uzBsX0jNpbt83B81ApGvgHnmh75vlZyAD/TVilT
dk38Ve/HYsXaHMaN3I/lrhmfMU7jO+C7MGeR2Ney2tvtcMjNt1imCtd1RB1f
X7YKl/KfOh4xRhn+pzEzx4t/mvtoDN14kDE9Y3tiXsZTzbE019IcLvPZzdn7
spt8CO1H+YHy5+Tk3lnjlcb2jDeIX/p++e0NYxSnlMmxMdfG/J7Nyvi35myK
ob5RRmdN0Mt+rC6Tsy1H3/1aLreGt9/ekCMsV/hp+vyAPJCmDXvxv+frxUfX
V5eDLRfbHPDBNeZvTpocMLkAvp+PdcNh0jbUJhMrkrOnrSYHQJ6zfGe5AWLi
8nLl54qV+z2H35rhrO5ehgNgzrsx96F1POrTRnIwzMUw5uR+574nV8R4nNiF
8aYZ+4nxGus1hrQcfed3TxALYr4RZfYXv7kjX2jPej81YUnMc5J+3hdzL42Z
zt9PDpB5h+557n3Gd8TE5WRMSXlB6r5phbP+T5lvBNzXiU/mtwPk8PrtBn0m
faedO+HumjMvHjRFP7Ej7VFjXeZz6nvKyb6n1pHqSu39afuJT5mDaT7LVP18
0+jGTr5B5LeOPujkmwpy6OTSiS/KE5cvfkEZPMKc8KfoP2k/+4ucdvMpN6ni
H5iTJ+Z8VZn1aq6pOmC+fvYHOfzqiA2qxAPMiTKmPX4/+QTaQnL6NimDZw9v
hPcnniq/1m9D+A0hvyVkvEg+3eLdcA39ZsiznfigfktEfaCuuIHjjCr4iblM
cki2re0ruY/aVNpWcn7kqaiD1cXi3+pidYi6pNtPro2YgtjCiCpcMjmecj1d
k65NY/x+P+a3XnJpzLkx98Y1N3Y33wNxLf5exwPMuTH3xviobebQmEvzdxXb
VxtY7um8Vbj9csb9noAYkFiQmLj5WfNVyRUQs1ffyUGUi+g3IPyew1kcX7YS
Y3c9i/+qC1yDrkXx48cayTky90gMSSxJTFmSmGvAtSAmLb7nejFua/zWXCHx
efc+c8bMHRNzE3szZv1jGTxDW8RvdPmtru97yT0zR8VclR96yR0zJ83ctL+R
Z20kx8dcn796yVUyJ8jcoO96yW0xx8tcrxG95AKZ02Ru07e9cG+M/5kbps/v
tvZpJ7GAUftZy2JuYm/uV+412njH0/ebXmIF5syYO/NnL7lI5jCZy2TOi3a7
a9a1a/x/SDOcKblTYtBi0cbI/R7PoHq+7zuxbdRp6ja/meP3dn7sJRfNHDpz
6eRcyL14srYH/uiFq2R8yNwqMRKxEjlU8hHE+MX65XD5/vzXC1fNnDJzy/7t
JbfMHCdzneRfmqsgp0f7RfxFboM6T923MP1HbSeHwu8x/FmFyyhnVS6z/Ayx
FjFAscDZ+tFl3hPvzaz9cHPlTMidEG9Q14oJig3K/5ALIEYiViLfb4xu8pnk
t/5bhTsoR12u+n7UXdoKZ0Q8xWTnixvB8OWqa1NoW4iHmqvzXxVuu5x2ue3m
g2ur+E0wvw22VZXcUTkQ6l/tF3PXzHHdsAp+7LeLzNHdqIr9rK4TIxYrnqYf
PpjYnfx1bTT5Q8b8td30z+Re64NdVvsjxnLMCdb/cj++sggHR39E/NZcPzkg
ckG2rJLrKodDfvMoZbBa/SOxNfEJuaRiOOKr4kF+O06MR6zHa/LaxBfl2ssp
klskp9nvG4nJi827h8unFb/2WwFyBOQKyJc298GcA3MP5F8OK4LBiH/Ld/Zb
MX7zyG8fyU/22RmjMlY1UZXcBfdov7ekvbBYMxxeubzm0xlbNiYgftvuB7sV
8xX7bfWzN4npiu3Kj3cv04bTlpu2CvdXzrz2nHid3FwxMfEtOQZyDeRMGy8b
1g23XkzN/AL5pqcUWcPyi+SEyw3XpjLfQ06S3CQxQfkqRT/YtJi12HWnH2xa
zFrsWjzL3FS/EeH3Iv4POWSYWA==
          "]], Polygon3DBox[CompressedData["
1:eJwt13n81VMex/GrunV/t4VolaVUaKPSYlfatapokaJNhSSpmSxFpcnQLiKy
NZihUgmjBSVKSdJGJSkNsqVBg8zz8zj98X7c83l9359zzvd8v9/PObdK31s6
Dy2UyWS2UpaOFGQyzTRmF8lkpopfKJbJfIj9IG5Gl1PrfCbzKVaOb7D4Kr6b
+HZi5bEh2NXYzdg2LI9di7XErsM+wcpig7Cu2I3YDqwMdgM2kHob4wBWG7tX
fBvffXxz6DE65NoFMRbfKzlzKeoexHcel8ksFX/l+jni8XJvl/s3OddgrQpn
Mut536ee4q/pXL4JfCP5JvH1wtrwbeA5iRbp72rsUmyN+ARaiO3DzpZ7t9xh
csfJbYD3xV7CXsLWYPv5amJjsTHU35wb892C/Vu8jG8T3/nYKOxtbBW2Hdsi
N4ddg/Wk7nJ3YRWwG8Xd+IbyLZZbxry24KOtwRLxXL4V5rwZ2+hab/F2Ki7u
LbeV3OvlPkqz6UfXzo9naownxI/TT9iFMRb2pHguHcYuwm7CvhV/qa+6JMw0
FdfSaGu8R3mKmMtYc6mQS30vyqfnF8+xpvYVfLPxwnxjeE7OpfGW5NNYMWZN
7ErsMWPMMMZSrDbWBXscewh7DauUS/N6Re5T4qdjLlhnbA7fTL5XsYq59O4s
zqd7jHstjzXGXs6ntYg1+d59NsTmYwtoIZXlOw97UXsGz0z6hq8udp8xRhnj
fuwReph+KEj9Dsqn+cS8/otdjN2M1aZ21mCOOGsNJuj/S9drie/R33D9TTg2
l0bYA9jf6QZ50/FpdLAgzWkAVk5+g3j/tB9ybRbVw67Fnpf3jP7eijnTXvHZ
pJm59Ni9xD19W5D6GKiPRnKHxJryLeHb4HpDbHA8I2wxth77Qk41bFTMDbsD
28TX3j2txCdTOf2Voju1t/Jt59vFVxK7A9uCbcN2YiWwkdiH2IdRn7Djsbuw
bdgObDd2AjYG2xH9xdqIjxp3nnG/inumU7AT6R7tT3l2yv1cbmlsLPYJ9im2
B/vVfVyOPYI9TLfyzNLfBP1t9Zyec+26eAeoj/Y/eebJXSW3PtYbewF7Fnsb
+11/nbB/YE9iS7D/YR2wZ+N50GhjHIw11K5JuslcJj7K15NvITYfW46V5R2P
7cY+w/Zhf/JdE+8utgBbgf2B9cAWRC6Nlfcb1hGbJ57Lt5hvftR2NaJy1GDX
pht8HVaF54KoSbRWHB93r/h+8YXClXgd3q7YE9gs7HWsDN84bBe2G/sCK47d
HjUI24htwfbEGNiIqIfYX7DPsMrYbVg/bBQ2BNtr3ffQTeZ5o7hifHt871C3
eC7msRs/XTw8nhn15SmTS99U51z6TuJ72ctXlW9k7DPGGI19jp2B3Y4NwP6K
/Qerg43DRmATsaL6HIq9h63FNmLFsFux97F1NEl8KNbFfD+K75XvR3EOHy5e
z7Me+yhqey7Nf3WsO1XgKaDbtDfwbeDbzJfHRmAfYB9gH2NZbBD2JvYmtg47
CbsX24ntwvZihbGB2ApsBfYe9nMu7ZPb4h2kSjxF6AbtlXwr+dbyHYf1x5Zh
b9AEcSEagC0XL+d7l2971Gf9DcWau+9t4k3W78eI6Sy+K/jqxv3KfRp7AluG
nY21xR7CJmMvR02T+7hnfUhf01wrH3seX2vxW3Sea215NtJBeZdQBayp+JfY
p+XMjLGxHuLBBend+Vzuy1RXf58YZxC2O94rOhfbbIwm2m/Lf8qhqLK8cdhy
7cl4KarO9wH+jf4vprL6aCL+mS6RNwNrgnUTD5M7Ue5oeb+4dkbUKuM2dn0V
1pJqYC2wUu59UexJdBpWmfZp76c9ru3nORDfTZw15A3Ub/E448TzEO+kPvod
gNXHloqXUW2sJVYPWyJ+I8bEWmCH9Vc1ak2sX5whClLtjRo8OvY4OlXeT9gZ
sUfwHY6aGvt07OPaByP27KfGd4S3ifWjhsZor79KNN1c78Ie5G3FM5n3K9dL
+v0ab6yvB+L+sBLx7WGN8qmGdc+mGhm1clk+vZP9sqmmRW17M59qdtNs2hdj
f3w1n2ps+2yq4VHLX8c2YPu1z6Vz6FLsI+x37Y7Uga7EbsGGm0thc3kjapQ5
f4wdjevU2Fpc5dpm7A9xJ2qEdT1WD4Zl0/cS3827+bRH3Z1N9SHqxKZjc9mn
XZvqxLzz6Zz9/bG5xRwfjDpn7HfM5Wic7WJdsVZxrtNeFed01yaLF8W7r10u
anDUbb4pct/CfufdRA2wOrF+2juol2v95W2lAn31MmYL99GnWFqX34qk836c
+6fk0xn9pGw6h8Z5dFY+1d3TsunMHmf3Ofl03q2RTXU46vG8fDrHFsumNY61
no51wvpETcJXm8+VUcPxNeID8dy9VyPiXYl3S8592fQf5eLYV6OOYRfRaVin
2C/pSHx/VB3rHHUy9gBJ7bAG2LXYb3EGi/2NTsU6Rl9x7hHXoHJY6zi7xdjx
bKkk1jzOyPHOis8vkr7Z+Ha/i3dXXJ+KY5fHeS3e4xiTSmDNYv8wl6Lm0h5r
iPWO+owVwtrEe4D1xAphx2Gt4/3AekQtzqU/aK2wWprdsSpRr7D7Y3/HnsdO
yaWz5VLr+Iz4WaqMXYZN4hvD9xx2ZtTT2HewidgC7Je4l+ifymNt4rvnax7n
N2wc9i+sGtYSmxp7AvZSHCCxP8Ut4wwj7BbnkjjriJvSmViXqDd8LeROwcZj
L2LVsVbYtHjG2HysBtYOmxXvXtTG6IsOx/dHp2Ad4rxGh8Tn0clYO/GjcR6Q
W7pYOtssiP9p1qNS/CehfepRI+wsrGL8/6AvsIYF6d2Kd6yW39p0QbyP8V83
vklxI7oQa2OMKYxfFk21YljUjFhnuUXwX6kqXzU6on1n7GXGOJnvBL562Okx
VtQmbCb2vNyr4xzAe6a80lj9OEOIl8qtHud8/DXxDzTZuOML0hk/zvrfHfu/
Ev8NjpdbPf5j6L+nfu+K2oSVwLpgF2L9Yt/BTo3/DlgXbGScx6O+Y9djbbFb
47uin+K9pUpY+zij81WM8zB2BTYMK8BKYVfF/ogNwG7G7jb/Ueb8s2tVzK84
dqJ2j9in+Ybw5bCSWNf4rrH+cfbBSmPdow5hg7HVscfFcyiWzqnvi/8PPKMi
/w==
          "]]}],
       Lighting->{{"Ambient", 
          RGBColor[0.30100577, 0.22414668499999998`, 0.090484535]}, {
         "Directional", 
          RGBColor[0.2642166, 0.18331229999999998`, 0.04261530000000001], 
          ImageScaled[{0, 2, 2}]}, {"Directional", 
          RGBColor[0.2642166, 0.18331229999999998`, 0.04261530000000001], 
          ImageScaled[{2, 2, 2}]}, {"Directional", 
          RGBColor[0.2642166, 0.18331229999999998`, 0.04261530000000001], 
          ImageScaled[{2, 0, 2}]}}]}, {}, {}, {}, {}}, {
     {GrayLevel[0], Line3DBox[CompressedData["
1:eJwl0j1IVXEYx/FHTTNLq6UlKKPA0K5cIjJMCR0kqCEcGjQa7IYopQhFCTU4
9SJBOGiFSWU62RtU0Ky4NWTXl65vOSTiGu1+jg3/+31+3/Oc53/O/9wjbd3N
XXkR8dUqKYhI6mv5EUcVpfLZnRH7uFtcmjvANXGHuXtcDde4K+IgX8094s5x
rXrq5af87eKI81yV+iI3qqeXa+bSXCs3YMYb9RXuD3Zyg9x7dYbbwCdm9vLT
7r/JNXBj3EPuB3eHm3DPJj/E9clt8mV5XN7Q88y+j/mr3BfuLzcgZ+QpuU5/
vvoF144/ucDn8syOiKxYJA/LHcl1bpYrVr/kVos8u3qOG5Gzrs+rZ3EB5/AX
zmMOF5JsLapzuISLuIxLuILLuIor+BvXCyNemf3PPmvJjOT95HVnMZNknMTv
+BkncQy/4SB+wAf4Fketu+p+7MD72II9eAGvYx22YAov4SFsd44pe+bsvVfO
4mu51jOWyWewFE/jHjyFu/EklmAaHXWk8IRlXFSi8XEcHWNUoFeNT34qzRbj
hu/1Ua6Q9xdsf5ro1pzhj3FlhDLe6SnP+/+f3gIMSloe
       "]]}, 
     {GrayLevel[0.2], 
      Line3DBox[{1851, 2234, 2314, 2235, 2147, 2213, 2365, 1247, 2146, 2236, 
       2316, 2237, 2148, 2214, 2366, 2807, 2023, 2315, 2238, 2239, 2149, 1521,
        2024, 2317, 2240, 2241, 2150, 2783, 2025, 1852, 2617, 2619, 2496, 
       2026, 1853, 2620, 2027, 1854, 2621, 2028, 1855, 2622, 2509, 2700, 1856,
        2623, 2029, 1857, 2624, 2030, 1858, 2625, 2031, 1859, 2626, 2032, 
       1860, 2627, 2033, 1861, 2590, 2628, 2034, 2151}], 
      Line3DBox[{1862, 2242, 2318, 2243, 2152, 2367, 2368, 2510, 2808, 2425, 
       2244, 2319, 2245, 2153, 2215, 2369, 2511, 2788, 2487, 2426, 2428, 2427,
        2154, 2817, 2216, 2035, 2211, 2105, 2155, 2828, 2483, 2036, 2482, 
       2616, 2629, 2494, 2037, 1863, 2630, 2038, 1864, 2631, 2039, 1865, 2632,
        2512, 2701, 1866, 2513, 2702, 1867, 2633, 2040, 1868, 2634, 2041, 
       1869, 2635, 2042, 1870, 2636, 2043, 1871, 2637, 2044, 1872}], 
      Line3DBox[{1882, 2051, 2645, 1881, 2050, 2644, 1880, 2049, 2643, 1879, 
       2048, 2642, 1878, 2705, 2516, 1877, 2704, 2515, 1876, 2703, 2514, 2641,
        1875, 2047, 2640, 1874, 2046, 2639, 1873, 2045, 2475, 2638, 2608, 
       2409, 2411, 2410, 2813, 2432, 2109, 2431, 2429, 2158, 2371, 2430, 1709,
        2159, 2108, 2323, 2248, 2157, 2593, 2776, 2322, 2218, 2324, 2107, 
       2247, 2156, 1525, 2217, 2320, 2106, 2321, 2246, 2370}], 
      Line3DBox[{1883, 2249, 2326, 2110, 2325, 2219, 2433, 2777, 2594, 2160, 
       2250, 2111, 2327, 2220, 2778, 2595, 2162, 2251, 2112, 2330, 2596, 2800,
        2328, 2221, 2163, 2252, 2329, 2113, 2436, 2611, 2826, 2474, 2372, 
       2209, 2473, 2492, 2825, 2164, 2415, 2052, 1884, 2646, 2053, 1885, 2647,
        2054, 1886, 2648, 2517, 2706, 1887, 2518, 2707, 1888, 2519, 2708, 
       1889, 2520, 2709, 1890, 2649, 2055, 1891, 2650, 2056, 1892, 2651, 2057,
        1893}], 
      Line3DBox[{1905, 2061, 2656, 1904, 2060, 2655, 1903, 2714, 2525, 1902, 
       2713, 2524, 1901, 2712, 2523, 1900, 2711, 2522, 1899, 2710, 2521, 2654,
        1898, 2059, 2653, 1897, 2058, 2652, 1896, 2122, 2416, 2121, 2779, 
       2417, 1895, 2257, 2582, 2801, 2332, 2120, 2256, 1894, 2255, 2792, 2119,
        2331, 2118, 2254, 2374, 2610, 2819, 2439, 2117, 2435, 2116, 2333, 
       2253, 2373, 2609, 2818, 2437, 2115, 2161, 2114, 2438, 2434, 2165}], 
      Line3DBox[{1917, 2063, 2659, 1916, 2721, 2531, 1915, 2720, 2530, 1914, 
       2719, 2529, 1913, 2718, 2528, 1912, 2717, 2527, 1911, 2716, 2526, 2658,
        1910, 2062, 2657, 1909, 2173, 2715, 2591, 1908, 2129, 2167, 2793, 
       2585, 2262, 2380, 2261, 2584, 2802, 2335, 2128, 2338, 2260, 2378, 2376,
        2449, 2583, 2820, 2442, 2127, 2447, 2441, 1907, 2785, 2375, 2446, 
       2126, 2166, 2125, 2443, 2440, 1906, 2784, 2259, 2336, 2124, 2334, 2123,
        2337, 2258, 2169}], 
      Line3DBox[{1931, 2731, 2539, 1930, 2730, 2538, 1929, 2729, 2537, 1928, 
       2728, 2536, 1927, 2727, 2535, 1926, 2726, 2534, 1925, 2725, 2533, 2660,
        1924, 2724, 2532, 1923, 2497, 2502, 2618, 2833, 2503, 1922, 2498, 
       2499, 2174, 2809, 2385, 2384, 1921, 2272, 2381, 2273, 2723, 2172, 2271,
        2340, 2270, 1920, 2268, 2379, 2269, 2722, 2171, 2267, 2339, 2266, 
       1919, 2601, 2794, 2377, 2265, 2170, 2383, 2448, 2382, 1918, 2827, 2263,
        2264, 2168, 2445, 2488, 2444, 2450}], 
      Line3DBox[{1933, 2386, 2453, 2387, 2177, 2222, 2786, 2064, 2489, 2451, 
       2455, 2452, 2178, 2223, 2388, 2810, 2065, 2341, 2277, 2343, 2278, 2179,
        2597, 2787, 2389, 2066, 2342, 2282, 2344, 2283, 2180, 2803, 2224, 
       2390, 2067, 2212, 2284, 2797, 2604, 2181, 2068, 1938, 2661, 2069, 1940,
        2662, 2070, 1942, 2663, 2543, 2736, 1944, 2664, 2071, 1946, 2665, 
       2072, 1948, 2666, 2073, 1950, 2667, 2074, 1952, 2668, 2075, 1954, 2669,
        2076, 1956}], 
      Line3DBox[{1955, 2742, 2549, 1953, 2741, 2548, 1951, 2740, 2547, 1949, 
       2739, 2546, 1947, 2738, 2545, 1945, 2737, 2544, 1943, 2735, 2734, 2542,
        1941, 2733, 2541, 1939, 2732, 2540, 1937, 2130, 2418, 2814, 2586, 
       1936, 2281, 2796, 2603, 2176, 2280, 2279, 1935, 2276, 2795, 2602, 2175,
        2275, 2274, 1934, 2615, 2816, 2485, 2424, 2413, 2423, 2422, 1932, 
       2614, 2815, 2484, 2421, 2412, 2420, 2419, 2454}], 
      Line3DBox[{1957, 2285, 2345, 2286, 2183, 2225, 2391, 2550, 2789, 2182, 
       2456, 2460, 2457, 2185, 2392, 2393, 2551, 2811, 2184, 2458, 2462, 2459,
        2186, 2821, 2394, 2395, 2077, 2461, 2287, 2347, 2288, 2187, 2804, 
       2226, 2396, 2078, 2346, 2289, 2290, 2670, 2188, 2079, 1958, 2671, 2080,
        1959, 2672, 2081, 1960, 2673, 2552, 2743, 1961, 2553, 2744, 1962, 
       2674, 2082, 1963, 2675, 2083, 1964, 2676, 2084, 1965, 2677, 2085, 1966,
        2678, 2086, 1967}], 
      Line3DBox[{1977, 2093, 2686, 1976, 2092, 2685, 1975, 2091, 2684, 1974, 
       2090, 2683, 1973, 2747, 2556, 1972, 2746, 2555, 1971, 2745, 2554, 2682,
        1970, 2089, 2681, 1969, 2088, 2680, 1968, 2087, 2210, 2679, 2587, 
       2294, 2193, 2230, 2229, 2791, 2350, 2134, 2293, 2192, 2228, 2227, 2790,
        2349, 2133, 2292, 2191, 2612, 2780, 2465, 2400, 2466, 2132, 2348, 
       2291, 2189, 2822, 2398, 2463, 2397, 2190, 2131, 2464, 2399, 2476}], 
      Line3DBox[{1987, 2099, 2691, 1986, 2098, 2690, 1985, 2097, 2689, 1984, 
       2751, 2560, 1983, 2750, 2559, 1982, 2749, 2558, 1981, 2748, 2557, 2688,
        1980, 2096, 2687, 1979, 2095, 2506, 2505, 2834, 1978, 2094, 2478, 
       2194, 2829, 2491, 2490, 2199, 2233, 2469, 2823, 2600, 2358, 2138, 2356,
        2298, 2197, 2232, 2355, 2805, 2599, 2357, 2137, 2297, 2196, 2598, 
       2782, 2231, 2353, 2136, 2296, 2195, 2613, 2781, 2467, 2401, 2468, 2135,
        2352, 2295, 2402}], 
      Line3DBox[{1997, 2102, 2695, 1996, 2101, 2694, 1995, 2756, 2565, 1994, 
       2755, 2564, 1993, 2754, 2563, 1992, 2753, 2562, 1991, 2752, 2561, 2693,
        1990, 2100, 2692, 1989, 2501, 2507, 2500, 2832, 2508, 1988, 2504, 
       2203, 2479, 2202, 2831, 2495, 2480, 2481, 2302, 2588, 2824, 2470, 2145,
        2472, 2406, 2477, 2403, 2471, 2812, 2144, 2198, 2143, 2361, 2301, 
       2405, 2606, 2806, 2360, 2142, 2354, 2141, 2300, 2404, 2605, 2798, 2140,
        2351, 2139, 2359, 2299, 2200}], 
      Line3DBox[{2008, 2104, 2698, 2007, 2764, 2572, 2006, 2763, 2571, 2005, 
       2762, 2570, 2004, 2761, 2569, 2003, 2760, 2568, 2002, 2759, 2567, 2697,
        2001, 2103, 2696, 2000, 2758, 2566, 1999, 2486, 2493, 2830, 1041, 
       1998, 1021, 2757, 2414, 892, 1012, 591, 1794, 976, 869, 1011, 1810, 
       589, 2201, 588, 866, 1757, 861, 971, 586, 755}], 
      Line3DBox[{2022, 2208, 2775, 2592, 2021, 2774, 2581, 2020, 2773, 2580, 
       2019, 2772, 2579, 2018, 2771, 2578, 2017, 2770, 2577, 2016, 2769, 2576,
        2699, 2015, 2768, 2575, 2014, 2767, 2574, 2013, 2766, 2573, 2012, 
       2589, 2765, 2207, 2313, 2312, 2011, 2311, 1646, 2206, 2310, 2309, 2010,
        2607, 2799, 2408, 2308, 2205, 2307, 2363, 2306, 2009, 1642, 2407, 
       2305, 2204, 2304, 2362, 2303, 2364}]}, 
     {GrayLevel[0.2], Line3DBox[CompressedData["
1:eJwV0MsqhHEch/GfnAkjUmRhHJtxuAFlYZqdLJjNxMoFjKWFi6AoiqK4ALZm
M4rYUJSQIgunYo2NfGbx9Hz/z/tvmvdNLizOFCoiIo+hqojh2ogRjDdEjPIY
2tCBdmT1AR7EQU3EMw4xrddp9Tiqjugt78aIol1pv7jzihXnB3dLvIoJ7Zgn
+UNfs0+xjox2zif869mG/WNv8je/4U/fcv7ENqa0L+3CnrV3+Aq7KOg57dqe
4z2+xT6WPJvX3suN7zjpfzd5h3u7x06gFY/OLXrafrL7uQ8pNOud3I0unPmm
l3572b0b+x/xrS/W
       "]], 
      Line3DBox[{1064, 1250, 2620, 1065, 1261, 2630, 1088, 1273, 2639, 1100, 
       1285, 2646, 1112, 1297, 2652, 1124, 2715, 1478, 1511, 1479, 1845, 2833,
        1846, 1839, 1841, 1840, 1149, 2732, 1331, 2661, 1161, 1343, 2671, 
       1173, 1355, 2680, 1185, 1847, 2834, 1848, 1849, 1850, 1842, 2832, 1844,
        1843, 1209, 2758, 1390, 1224, 2767, 1404, 1238}], 
      Line3DBox[{1066, 1251, 2621, 1067, 1262, 2631, 1089, 1274, 2640, 1101, 
       1286, 2647, 1113, 1298, 2653, 1125, 1309, 2657, 1136, 2724, 1320, 1150,
        2733, 1332, 2662, 1162, 1344, 2672, 1174, 1356, 2681, 1186, 1367, 
       2687, 1197, 1378, 2692, 1210, 1391, 2696, 1225, 2768, 1405, 1239}], 
      Line3DBox[{1068, 1252, 2622, 1070, 1263, 2632, 1090, 1275, 2641, 1102, 
       1287, 2648, 1114, 1299, 2654, 1126, 1310, 2658, 1137, 1321, 2660, 1151,
        2734, 1333, 2663, 1163, 1345, 2673, 1175, 1357, 2682, 1187, 1368, 
       2688, 1198, 1379, 2693, 1211, 1392, 2697, 1226, 1406, 2699, 1240}], 
      Line3DBox[{1072, 1254, 2623, 1073, 2702, 1265, 1092, 2704, 1277, 1104, 
       2707, 1289, 1116, 2711, 1301, 1128, 2717, 1312, 1139, 2726, 1323, 1153,
        2737, 1335, 2664, 1165, 2744, 1347, 1177, 2746, 1359, 1189, 2749, 
       1370, 1200, 2753, 1381, 1213, 2760, 1394, 1228, 2770, 1408, 1242}], 
      Line3DBox[{1074, 1255, 2624, 1075, 1266, 2633, 1093, 2705, 1278, 1105, 
       2708, 1290, 1117, 2712, 1302, 1129, 2718, 1313, 1140, 2727, 1324, 1154,
        2738, 1336, 2665, 1166, 1348, 2674, 1178, 2747, 1360, 1190, 2750, 
       1371, 1201, 2754, 1382, 1214, 2761, 1395, 1229, 2771, 1409, 1243}], 
      Line3DBox[{1076, 1256, 2625, 1077, 1267, 2634, 1094, 1279, 2642, 1106, 
       2709, 1291, 1118, 2713, 1303, 1130, 2719, 1314, 1141, 2728, 1325, 1155,
        2739, 1337, 2666, 1167, 1349, 2675, 1179, 1361, 2683, 1191, 2751, 
       1372, 1202, 2755, 1383, 1215, 2762, 1396, 1230, 2772, 1410, 1244}], 
      Line3DBox[{1078, 1257, 2626, 1079, 1268, 2635, 1095, 1280, 2643, 1107, 
       1292, 2649, 1119, 2714, 1304, 1131, 2720, 1315, 1142, 2729, 1326, 1156,
        2740, 1338, 2667, 1168, 1350, 2676, 1180, 1362, 2684, 1192, 1373, 
       2689, 1203, 2756, 1384, 1216, 2763, 1397, 1231, 2773, 1411, 1245}], 
      Line3DBox[{1080, 1258, 2627, 1081, 1269, 2636, 1096, 1281, 2644, 1108, 
       1293, 2650, 1120, 1305, 2655, 1132, 2721, 1316, 1143, 2730, 1327, 1157,
        2741, 1339, 2668, 1169, 1351, 2677, 1181, 1363, 2685, 1193, 1374, 
       2690, 1204, 1385, 2694, 1217, 2764, 1398, 1232, 2774, 1412, 1246}], 
      Line3DBox[{1082, 1458, 1459, 2628, 1083, 1270, 2637, 1097, 1282, 2645, 
       1109, 1294, 2651, 1121, 1306, 2656, 1133, 1317, 2659, 1144, 2731, 1328,
        1158, 2742, 1340, 2669, 1170, 1352, 2678, 1182, 1364, 2686, 1194, 
       1375, 2691, 1205, 1386, 2695, 1218, 1399, 2698, 1233, 2775, 1508, 1509,
        1510}], Line3DBox[CompressedData["
1:eJwVz70rxWEYxvHH21GOklmSRDGQGImBgWJQ52wkNopNWCzKH2A0KCVxYuAk
xcQgKcrLcA4ipYgsiDqFz2/4dl33dd13T0/1yOTARF4IYQoXhSFMF4WwEguh
Fo/8OB3DkW7cXM0/0Bt6hyx2dcOyJb4St/x7SQijfAYjSNlJyH/56+hWnzUP
8VcYxLKdHlmOj8VDOKeX5iQ9QwKLdtplT+7Lo5zvp8fow4L+UdcsryoOIS47
5V9oqfmZ/uln7NXJP80fOOG7aTy68XYXP2GnQj7P5+GQ74z+774j+pe+TDbH
5+gB8t2mzfvYQdJOgXyW/6YZt3s0Zd7GBnrtfGOK/9LtopVfRwvadK/4cftm
XkPaThNtRI3uHu+yLTTIVlGPTfM/QUdF3w==
       "]], Line3DBox[CompressedData["
1:eJwV0TsoxWEcxvHXvVxKJoMUiYEBRQyMFAMZsLnHgGMTk0UZjEZJKRmUiZNy
LAxIIQa5RUwopVzC4PMfvj3P73l+79v7P6eoP9YxnhRCmMJ5Kk0LYSU9hFI8
8mP0DqN4ywxh386ofMlcjAd+hOZlhDBM4/o+2SJfiFv+07kh/gaDWLfTKc+P
7tZd8718D5Z1LeY//iw6o78wd/On6MKCnUbZr+7QfMK30wO0YU7/o6uWz5uz
ccy/0BzvfKYhK4Rpe2XR+8wfOOKb6R6a8OyOmJ0C+aw5Oer43ei7dQk6oM+V
zfB/NIEUd2+Zd7AZvdlOqvwbV85t03p5HVp135jkP+WX+jitjX4n1KBB/4on
XaH3v+s3UaVbQyVK9F/6ezoR/Vf6DVTwqyhHDP/eL0hs
       "]], 
      Line3DBox[CompressedData["
1:eJwV0MsrhFEcBuCj5sJHiBg1LGzwP0iylN0sLS3shjXJgtK4JLeoWVhQkmzs
sCExuylFsnMtiXLdTuOxeHrPOe/vfM2Z9qHRzEhFCCHLdSyE8XgI+xSjEAr2
Wet0MoQ9eeGszbqLBHFene9SWe0D9sOJEG5pJU+apK4sd8yV5BW1ZlNygxff
bZY3+i3WrAcp0sivflU2cKnfZNk6Q4F6fswsyTre9HkGrN+dT3hHZF3FPOu6
Wbmt65dnJMgR51y/wrd+2r6PUwJTlHUnLPJlZtJZD8cc8ckhkXfHvHPB3Jh9
9/9/Yf8kPyi5+yjvmTPzLHv91hYzNe6mZBM5Xafs0N258yBnnB3wB0ayO2c=

       "]], 
      Line3DBox[{1241, 1407, 2769, 1227, 1393, 2759, 1212, 1380, 2752, 1199, 
       1369, 2748, 1188, 1358, 2745, 1176, 1346, 2743, 1164, 1334, 2736, 2735,
        1152, 1322, 2725, 1138, 1311, 2716, 1127, 1300, 2710, 1115, 1288, 
       2706, 1103, 1276, 2703, 1091, 1264, 2701, 1071, 1253, 2700, 1069}], 
      Line3DBox[CompressedData["
1:eJwV0TsohlEYB/DzufcJCwMLQiwWi5LMsrEZ2SzkVgqDASFEfWKQSyTJZWMi
w7dgUqwGJRG5DoT83uHX/3nOc973nLe3tL2rpTMWQhjgID2E6owQuhlV98gX
2StfZUVaCDXqPsb1D7zzpI9lh/ChbrCnVt/PhP5Z7rLHPnUMMGU2GL0/HsKX
ekj9LQ9lPcNM6+/Nj+UvI9b+ZDwzhJPoTqQ5d87amzqVsWiNUxpZ9/y4TNgz
KTPJYtA9H82a1Etm0zKHGXK5NUvKZmZZtudLnkX3JN255/KCVuZZs+eKfPWd
5xOygEvaWGDTfFF+mhdGZ1NEnm+6llvmP2YxfXF0LiUcuW+HTLG+bc+KuoxV
ykmad0Z3YCf6J1SqN6jihn9atkVB
       "]]}, {}, {}}},
   VertexNormals->CompressedData["
1:eJxknHk4ld379pEoQ5qIVGYqhTKHfYUGEhUVhSQqImUKJWSIUskUFQkhZCgZ
MuwlyZRZ5nlm2/Y2RJnftev5fY+n9+kfx15/7Hvd1zqv8/qciyOBSzd0LzPQ
0dFtZKWjW4V/mtzZ+ND7JxUqNrn8jDiWAMX52mejrdXBpP9SstLdAbjW+VVx
JHgEAsP8XXaX3IckQosn5/mvqOrm0ZBqeirMlETpDBqUQrr+871bjzWgMYPA
6OKFYvgicCcRraOAmmZZ+Z7VL1D8xhg7nkQ/dDAgExUtUkH9XuD+7mp5FN+n
rai2wRz1bS0OnFuhAn0bu+nhg7vAS2nWspVFBH2y2EFdweuCiTb2YjmLBHbN
Z/VNjkME3cDiFdq6ryyyli18Rjh3bSa3praWINe//Hs9bIFv7w/BWKLaQppt
fmAI4fWvld/r31byvOZ+OhPrV3aJpPc4EvNX/qwvrawc1/fSICytRL151WRI
XPxnnY7OwqQn+SCBjq5QvNieC/+k/ZvA63SzVlxVKnR04Vnft4j9az1nTc3t
TUQ6utdVckmDKv+33nCE/e30Zyq6UyxxtsYOQQsrxbFRcT8M+F+hs35KQr3v
n09db+5FC961Ix4ZDlA/7LqNJbkK3TS2TmNbTUXnYrTX3Kv+CIHkqBFzr0aw
Os3uy9DfizIzg02fqo4Av7XJe3WB92BXHHjm4vsniDRvlpNNpsLmq3QvhEYd
QCV2T4Ibmw1c6WF/2oTfKzS2rlCvjhm+PWVTY3x7GJZt9j+kvW9OcUD27e8c
qNHw9A0bbjboMFFZpq3zy59qvxcxTCQ9X+v+8VAJka169nd9FuqYV9dwxhOn
kGyARgGRqFvwp24RyydEMuKfEk4tdzMY7wohnl76s967crW//50zYXjFPeBS
mh6h5Z86L6+gF9bOKoTllZ9fJ3yNCMv/q//657MDB3E9Jz4fnlP8V51t/U7p
S+H1+O3Hc4SJ/7ceH+bcU32BAoQRtZNdu74jd6E49ZndQhBaPZTbUEqB/S7M
+ZHudTB2Pstcc99lSJn0ehXa3w9fFP3tyGtGIYzT68qjojfw6U1S4FcIgZfs
CVfZBseggJRutXCmG75HfJgoDslCzknHh1jvFcAOG7rNhxKpIPsiQLY/xx9d
/fp0NmiVBSjtc22Vw/sXfzr5rdDuDHrhVaFiEKKBWOWpEUt4PW7pSXmbFhvi
jrD1XFkSQ9mnFWdp79v3aXm+q5xMyP+kx7yta45IPFD+uw63flRfiN74ncC8
tMyxwyaD6Hbmj84XqE6rLceSCc9+TDM3D8QS3oz/qduFlZUu9PEUwXzljvaV
jYGEjuU/68MraHP3iRtE0kraK0dzK8LQP3VeXGHONfS8gHVvYpSvp/wv/feM
BIjJ4vreHLBs1fpfnSPZF86/uzaGDAt1ukM8euCB8XIcXxQXzAuQn05SqSjn
eBH/GsZ08P45EwFOBhDkwXDGdYmMrNZ0nG1a146sNmXn8d4Ig4rQrcZ3InvR
VEJ6g//iCJq8u9vLc6Qems0WmQVdg9EoP8H+W20tWumiN37TRQEQPir9OvQB
rC8t3dDcHYZabz8jCC5R4Xr4+QNaJpeBr+GWQsbAWSR5orJ2lqZz9uPJdkyK
cHU0JI6JxAySXcdbaO/VTGp+22rEBMwH5xn1fzCCnwzn7/dtvPBpp8KufELN
4JFV198NEpydfv1ed69KS/Z2+0CMbqgxQ1BIePX2T31qFsUWzEaiiaoLJm1v
Yh8Sjs//WY9a+ZZ8S+U+MWfFV0ni6U2iwz/1nFkJEH2x35Q4u9J9zGXjTSL5
f/rnKz/QfhDrXrLMR9n0f/VvsO6TDvkwBGWuHFovngwhujPrN+9eYod0tbiN
xVLj4PM0wE5YsQ0FSRUIzPSegOcxXOHrZqngF2HYQtz0Fr0jGdrdoXsCekZP
FK8Fj4NOQtFpVvFGsMy9HeJtWQbfjDOMNs7Wg0ScWWduah1cnc7f8EF1HLrS
eIKPnAyE6+68fslv38BidALfzl9UMI+dFpd+tAeVMVGcpOwdoHmaoXYQ77P7
Az+/eLsMYg9QfbqLVR12S4r+9pMsXuqitCYXcr64SUdYYR1Q1ogv0dY5D01e
6XowTcy1ln7BmFJIuNI1/McfBpa5PhrWEH9uvIGWDuYSubr/6PzXVGmA0Ks4
ojZ1WNU0I5mYRf5TH+fl7vK7268R85ZPnGFICSXy/6PzqhV4pCR/lZC34v7+
pYM7Mfefev5YMTE41XeVMLMCIx1fLxMn/ln345G8w3+0BzXptddRH43BqSrz
bQQDJgja9f1k9IUhpG48YdvROwRVeqru3k5HwVs88uFO/TFU56a/fjKqB1jK
hTT6q3wg82v+h9WWFNQvxZZxuL0O1j88nnMg6TPkyjFZ5y/0ILcFyuvJZDfI
2KvoVr5jDFLP6wV4k1ORHKvEUy36QBTsejlmlEoFOQ3yxpi9LggxqKgZZdxA
JM+Fd2V4nyLlkQ+Tcw6hmbOssjGmGkh1Aysdbf+2Bru3qdxfh/y+5VaHhAui
c3Vpc7T1noFr3Ld6iUSJzdfrDkQsEbf9Kvv9vlklBXMn5PIIn2c4vd7MthAf
XVr6vf62ceWdrHwqga73xCF6vizizoY/9XFZDHDusH5B0F+qGfk+FkzMXfiz
HrIiGQg8voQPKybske9vEq/9U8+xFT7LCalbBMrKypTqW3Vi3z/rave2FTSt
rgM/ZQbiSAsFBTRbfPP9xADrgw82tGu3AEU1/Kzui3H0LE6H4OKjDsIrtx/V
enYDNULKuL91DI09+6YnR+cJfMq75Dn5+mFFi+XW6yujKFahivsIcwFovLmk
aOfZDol5hqYxqB2lt0TOrTYYhaWO5I3u6WmwNFbY8G3VW8R4cfSj2jAVjMlr
+dfoekBD5fUl7hFbxOVueCER79OjwUa2fEYXeCXvl/knKKELxtkWy3j9pan/
I6GNuyC8JS5j26NVqFmjeob2XqSCtgvuPxjAYLliW2DnB+IQV/zv922tGOQX
vdlDOBirspY+7D2hPmPh97pP2/DYAZNCgmJ9FN/CciyBmPWnPmsX+dbN5MYQ
xBZhjZJEEOHA3J91gxX3XOEMP0LgSvd3QzUPgug/9SSt3Piw+Zg9oWdlxT4u
2prQ8c86z6V6eXMLqrIA94ffn+/Ue3XxJ9BD51lvVtstFOXn6fnJvzmJP1hn
0FANOAO2Bx7LISuHH8zMyqFxUj27WXOfB7BpGwmmCo0pr/UsD3xfR4X7crkX
9CXyYLKdYd+qmz3KzdpChGDTAZgRC/3knTwC/jVuDzj2pSurcZM/Fp7PBGav
Bib7fipYHXIokrFwVeaLqlnk4fAGYzoRi5f4OYVHzMUTIo4r2x22ZaqpOgNU
n2fCtDorCdj4CSXxK1d5DSSeTBQHOnPWH7T9rva57tvvM6s0s/nM8e4gRpCT
ePb7/bZK+1APfKhTel8c0xRP10eIoc7/Xn/w3WS4Zk+60hEpqlWDfxGBIelP
fSoXTvQ5SwUqmcjo7VC6FE/Y8w8fXlyJcvDWcFQiX86aD1gfQFj/Tz27V9I2
XXI1UcoU/7jpi4EToeufdfoNQIf1jEQerG+h6XkkOnXhPtYzZczHvE27Bd3p
64ym6XmsYG6LM9YzgW7csNqzG105922BpmfLjJJNsljPmnqjpZv4+lF2lENI
NNZzcf6RMXWsZ+LFaTtbz3Y0dnr2cxzWc0lllRpNz6k39DiwnpHKjLpRLdbz
RiGv9zQ9Zw9O8GE9I2WjH+bbsZ7p35z6recxdIGmZ1QW7nMuFOv5pPIfPaua
BtP0jHy++0TuxHo2+5+eSTQ9o8ilCteGv/TcSNMzUS12aXH62b/1/JOmZ6Ji
PVKf+UvP3exYz0SxxShOhb/0vELTMzFwJUro/H/1TOxZ4TsY+y89Q1aqOt/R
HvDmG34wgf25x4PPVhn7s+jRDaZRF4Yggy78bBf2Z7vBa06e2J8/31NzEtUf
g13Lp27/wP78cFLtdS/2ZyexyxcYLSnwQ1rnhw72Z7WHzSRF7M8qfmqW2J/B
xEHoy4kUN6AcLnah+XMH162n2J9Bg8W2UBX7s1beh1iaP++7Ok/zZyjQKrp6
Gvuz07FVKTR/Lunr9Mf+DDIB/tOvsD8PKvzxZ4lzXVuxPwNUUl2CsT/z1f/x
5/6B3UrYnwnSm1ePK2J/5v+fPxsvYX8mfp5Jif/bn7tTsD8T6XoD+Bj+689E
/SV0oekvf+ag+TMR+3NC1F/+LEnzZyL251+a//Ln7jMOCkEfhlBTRrxmBOaN
1YcMHcUwb3i6Gm4rkhpHdwbZJfdi3rDL27c0hXmjKK75FOYNJHdJY9u2zW+R
3ykrKRpvuD471WsVPI4CI1+k0WPe+FKrOuWDeSOrvuUt5g0UqPDBNxvzxo+L
5vdpvNHWXUHjDWRfufl5IuaN8uvD/DTe4C/4KIN5AyxVVOYkMW8kyzP+5o2V
lNd8mDfgvW/jud2YN96J/eENP96jS5g3oMVkVdxOzBvv/scbAlcxbxBSrKX1
OP/LG4SfG6PqZv/LGwRtKu+VC//lDULesq8m/X95g5i3EqX2N29062PeIM6s
oP2d/+IN3Q9Ne5OujcG1y1TXcMzP9he12rZjfrYgd0pifoY0kfVeCpifM02T
dGn8vF9n2dttiQzreG1mKjE/nyv65LEd87ORjd+6u5G9QEqa13yI+Rmt5j3j
jfl5e6wfG+ZniKnNTq7A/Fy9da8zjZ/PsLjwY35G8afOCrRgfnYsNP/Nz6/n
NtD4GfUmhVjlYH4+bvrtNz+HrDtE42ckycZpOjbKDI7df/h5itRP42ekdJB0
Wg/zc+r/+PncdszPxNrBi9FWf/GzyTvMz4TohoCHf/OzPo2fCaoLcCzxL35u
yMD8TMhZkRTc/Rc/h9H4mTC7kr3o9Dc/V2B+Ji6v+LL+m59Hg7Klqi5QUKjL
HZcRnAfXa/FL/8B50HLyp2ljKQX1KSryBuE8eNSm2PcYzoNnAqfJYf39iFHW
5SUJ50HersbqJzgPOsVsOFgCIehXud4mWh7c+t0zbBHnQbe0ahLOg/CUMie2
DufBzh8JrLQ8mL3qLi0PQs6+6IOxOA8G/LrxOw9urf6dB2Hn+emckzgP2gf/
yYP8K7PVOA8Cy6uvh5ZwHrx89k8e7Pm0Yw7nQWLupzuGtDyY/788OEvLg0Tm
JTcO0b/yYAATzoPEZz/SZuv/yoNwAedBovmKr/Dl/+ZBAmnlxM5bf+XBq/k4
DxIWV6J0Mv7Kg+sHcR7EOTwn4Oq/8qCLYvbA1Gc8D7tvxNPZI8h1allNu9+Y
OT1UafOUBE9Ei0stm3tREGnPFq8MB3DulS5jS64C3cd379HuN4xDzo15Vn+E
8Dy/J+ZejWiP5xbxVf296J3Ls8UA1RFI1W7LVhd4jz5bVtY6vn+C9KJZs2n3
GwGPVtPuN1D1wI5Dt9hswKeQ8/f9RlfaJO1+AwVHd+UxvD0MHu5/7jeCimto
9xvwxPCQmC03G2T9737DtO1exDCB8ryVGv/X/Ub2mhrOeMIU0hc9/Nf9BlU4
I/4p8dTyVYO/7zfyBvrfOROHVyS79f+63+im3W9gfZauovx1vxH+cHaAdr8k
lfL3/QaT7yl9Kfy5qFvjX/cb9y5zNHv/pKJHG54flz6WACsJnD60+7r5B7v0
CXcHkKFZ0Mpg8AhsGg+y3VtyHyJqyJxc579C5xXT+7T7uleM9lTafd1Wnfy1
W481wEltgmjFQjGIdYfb0u7r9Lfsr9iz+gVojjsNrkv0Q4Ov5Qtp93WeJkG0
+zr4uDRrdHCDOXpx+Ovv+7rylt/3deigYnxxO4sI2nv1z33drj/3dUQRzfvL
lY5DhPN/39cRz11TP1j93/s6gtrCjaPov/d1hPqV8ajk/97XEZdWOM5E/ve+
Dter50b2f+/rCujo1jjV//e+Dn/mt1L+132d69vOjbIVjUjo3Jx3IBcF2MZv
mX0NNYKbLZzkKYZxZB/PZfaG2gZh+39oPt8cBd0xr269+k5CK/zH3m8ZakQN
m3Veuom0g5zpi6vnHRPRZKMD56XqIrSsPNjcFkGFOKP8L+oCeTBsFXuzs46K
mvYpHtFb0AIkMGYpYzkEBybhxsmmIWS98cjDdL/H0PFzu8sDQSqUMSZln96X
g0zePieLzlUA78kNEb2SdcDwJYX9Anc5fDJetBveSwGt5Jg4mbhiELmeo1UQ
QoVZOxNhs28EcL9cqntHqgXl9h5T2fh6HAYaTr2wz3CHd32jlSnsJJR0sV1C
UqkPQsJPbDmUnI9zQ/jmEsU+1GKrwZh1yAMGE2bWCmuTwGySSJD92Y56IvUz
/crISNaLlHJ0ozTsnvA7EWUcjub9zm4KW6KiNWVzmc4Eexhjk5xYkGgDap/V
ndkd42g7aT8vw/b3EOwjWrKLvh/ihzLMRH50IbvwwuS5oAHIuFJPEFs7BA4n
2XcoygzDkUeDQnQRuyFlQH5PwqoOmN/PN+v4lQxbh8s6rthfAy3VzQd8OT7D
EFub1fVUKghMbGePk0yAQ1+2OQmwlaBhpdFXlpfGAJYE2JcUuuE6n/auAmIm
ujajfufe1GfYaXe3RDwQ61Zzj3KtLBlpGxiniMp1oQuXFRocycLwdl9GbcPP
EfR2LkCmeNUAesqhczExzBwu8ohyC6cNoL75KT1O8xEkvWG+XbU7GipsXVmQ
VQdSaDbNdCgbRWbZNbU3OVtBj4k95/vGdBRdlMDreb4CHf/E4DYHVEh+95Zv
J35+0of4gL2LxZAc8LL34mNByMzX/eQuSYXda+Re3ntfCRl3j/hO7b4E59xF
j0rGU2Dvs6An6lr14P3oZkTAxSiQ4PpeyMdLBo0dDNbBE99BqCZXx+ZEE5xy
03lpmloJ9NcujXGszoWPGyf9djHiuaz6mXdXIBW1neLt4MTPNagvdzTFz71M
2rHsIUlFIjGr/a3wc1P87Q9N4+dyCm75KhVPQc4rpo8U8XN7S+4IBeLnPv1J
4RLgJSO27J7t/vi5V930L9zAz9WkbM7Cz0U7z51rZcLPvfHtexztuc3OBk/q
ZcmQkMvLsAPXuedei78TrrPTHQfppp8jcHFN3IHPuM437HcaJOM6U0lGLKJp
AyAyKP9uE66zq9v1h+q4zh8roxYLrTrg/CaVz/a4znac0n52uM6X1RKLcJ3B
x0jMxwPXWbP5XDCtzjfRl6hda4eQlHxxuxzW1RPbA6tWYV09fJb/MXFVB/Ie
AwOars44cahaYl3FX7Wi8+P4jNgPW5rTdOWyJY87Hutq1/em41hXkHKVJ4Om
K03mr1WLWFePfUkCWFdQVqCb64l1lXJNKY+mq8tV9msUfrbDrckFZlq/uBZK
h2jifkkSuyX62jgc9q3a87tf8k/MmrjgfnmvdX5gXqIN3YxR+kTrFyHbrdb0
uF/843LocL+gyyw9Hrtwv8SQlht/4X4RqDrEIhdXjGaERVVo/c6U9UTmMu53
/6rewNtSLdCskmb+u9/vL7yyw/1u2ma4kMxOArH9xO/7cL93flHaoob73VV4
bj3ud3j09FnX7cMekCfUwUjrd9nptIuHBPLQw22PbGh+JdnNOkLzq+7UV637
LYeQiyXh1ynsV89Wodup2K/639n/8hOkIjHZJ+s8sF9Nf2S5S/OrxT3bKrFf
odDUjv362K9eGxuU0vwqX5EjQ6aiERgXTj2j+a3geOlgMfZbcZUsrkmGcdAd
8tB6h/2WxZFXLwz7bbLQLo7X30lwQDC9ix37bSb7WwUP7LeecVrO2G8h417A
kAn2W6JPFJnmt/ku217ZfCJDfKjs/nGZDli+yertePYyzDNm19b7DKKqF9/2
UFOGoePNnvvpqm6w0vG+2FyMilR7Im7rqFShCkelb48z9eCw5Ferg/3REF/+
JWBlHucoVol7W5QPwMV4JS3P1looHXxSPN9IAUmzgLekkARwZLLbafWZisrW
pE8e144A2xiv4MxSIsQZdrNXn+tDM9Xpc6tlSajHKHpmx9ZQqFFubjq21ImY
XO7ubBAehE3Zm6LffOkDG9H6J4Y1jUjda1wgZ74J2dx3Qq1VYzA5lc+/Z28R
UM/8uOQmTUHnfc3q47c2wFh3oeQbs08oxPnLXreIa2DhtPQssJkKksbb9X5s
KgMGjm2h2j6f0dNTkxeU+Whz86bSIZvdeG7Wjic18/xrPk4w334phNcVfKwz
6f/HIRVsCW3X+drh2fcPt8cWyKggyFPHT+I6PFHLFHfGeWKYaup21PY5em7q
cW+7wyEwXPuS26rwG3posW1AWIWKEp6p1bms2w1B/A+EskrI8KzDsSq4qB0d
GCfLX55+B9KFXp7XU0ggH6Lz8HRyL4S0+lMjdXwgvvP92rtZjWAupXDWPHMc
hK9+viZp8QUm9MUJATGfEVessuxWw3ZQ2pqw52YYGY52yFfa8OSjJu3zYa7V
VEjdrKOok2MCL7XMUtF9ClJ9ZjL1fn8DJGcftgzrkQfIVDEhhLXBcf714o68
49AUKBd1k2k7bFbavH4rzgUnHw9ekmEfBbf7rAomma8gg9Fet8+Bij4WrjBv
uF2K3tqbT9PrOkN/CPcqUVEyOmbD7XvQuB7MxNJY7I+0QGwOryi/5wiKS7hv
3WQ+gNSySavkazKh2LF5n7dDFTpqrs0ubTOASCG+Wm89hiGiWcZdy74a6Tvu
a6nZTEV7Zh5n2tvrQVnN5QzNsyQgxS4L0e3tQ/fy5axJlySB9fjRNZde9SOh
qzauDUdHUb0pl0qw6Ea4bVm1VLOuHIY1mT4JXqSisbk0QyeHIHD7Gryxmxdz
u2LyoNhyFYps+JGz4doN8NGXelTe3weCp87c8sgeQZS01uNGdNUQz5J3Nwj3
08tAsfCgmCLQ8aFj6s1Jhq/6boYMInmQvvbeIceJUFTvpHVqvAbnOx6bBtUP
Q/CzSbHex6cdXGwPqDP29ILtj1Nvso70wesA3xdOh0ggIOiyJD9xDLisc6N7
bfqR2bdMDUvrUZh9c7YzmSAGUbNFd+IOjMKKUjuTblo/sNsXClp6roVCLoHK
XRH1UB5eYWMSSQG1znIF7T0PoIVUPlPCNIp6z578yTbZD7pcWr5c81fgYGpG
5nb2KGQ2+7R2LogKkWTjrUS7YniSqv/TXGkc2b4a/45IrVBj1Thvw/wGOpzo
9b07viLXO+/W80l1AOGkOtcZGTL02noXEn3ISE/To5Vs+hkK+Tg761PbYaT7
bGLV0TI07xR7v/9ROFpJZMnstKCCxxsPuaVsEnLbo+glEtGLphhvD05vOgz2
k9OhM4nf4cQBtHBQk4LEu0fyn1gIQZHes51ttuOYF203uHO0Im1N7rwZMUaw
0naY0J8ZQlrfD9zcemwInVsOmbN194JnJ+/3iY23A4fB0TXTFWS078O9Y+ks
ZiAW2H6vgq0P+Wl2zH/nJ6Fvlp1UO08EViG9xlTPXjC92LLs/IWENkS4dzm4
vAaNdylpWY2V6IKYdepahl6Uf8b3jLwACUx/Bcqw3OmHK4q375c+GkIv9y8z
rtVrhjLOxHPPZU2QSJamXKJuOAqrG733Dvc/0+mprDO+JeCoGGkuU/gFye24
rWizjQqFksEHXpljfrcwc26sKQPWdWObn79RA5GZPp+ATCqop7w5cUX+M7y2
uXFXiUQPTDtPewlNUmD7srbN4olakOuy3uy28x40L6a9YxOnQBv9/W+5+76D
AXHJ4XN0Hmzr5i26QUdWljoq2nAE55bLV2/w5na9glRo2KsT3wc5AQ2yrwqq
QSZ/UCS4eQQ+ELc4WE6OKMfu9n34mZ0Cn2CjXPZ8I5wcdjaOMqei+7p2TkS8
T+eWuM+0fT7Q2PHgR+J3xHPsxS5VfF7H0vkKH+Pz+rTuveHTTDy/hRY/aOP9
r2c9PEvbP6NgdL/wJAWtF924NIn3z0mpaqbtf2TmHpPoeDta//jjHdp5aTyj
rE7D5/X4kZT8OnEKer7qgNN7/F7js+e6ivB7tRzQ4KB49qLzI75tLvi8Bruy
Yu3xebUPnh9dc6cfhW3jYy3H5yLWGeDMjM9FccNyFK4/Mt5MjpbH9bfUjuCh
1f/sNp/XK9kk4Hf1axXAOsyTWF01g3V4T/MhU49NP7w4sMrrGu67sx+cJxNx
3700/KjTYTsOedN0vxywDk+Kxkn/xDo8oc0pcX5mCKQZNQS4sQ4fqXf02GMd
tjDO9hQzjcJFr1UhHLjv2kI0X23GfVfvQtpUydYHTy/0NTdgHU7a5aU4Yh12
HnIRM1Mah9M+gavLcN8lspDzr+O+m+F6Z5TdWAlXX2QnrcE6tCXHTtF0uPxe
Vgr3HYh4vhVcwX0Xo/vrJK3vOC2XU3DfAZkz5+cX3HccBQu5tL4bLV7wzTnS
h34t0R+7hX2GlcOm5AD2mZlZB/+jZ0logL9YfRX2z2PKvm3D2D875NdteXtg
FHnPR6bpYJ852uD41Qr7jHXd963iEfVox69GJZrPbAp1WdbBPrN9d3dFJy8V
bRnbIayC/fPkGW6b9dg/KV2/juxgjwJbo/ZKms/Qr3lqR/OZ55Rc7eAIKmJj
/+Diiv1zoP5SPs0/Rf0Wd2OfAbOjynM0n9n6Q7PrNPaZkD0bt6l/GEL08Sdm
3LB/qt6XPbIa+yfbdrZz2G+Rr0lQtw/2W0LPLR2a305Aa6q2fTXc/UTOpM2L
raH7tzrieSErWcFCvE+BrxRBk3w870gNbALP8LxjOlxDMH/VDzPk0uI6PC8i
RmQ1Q/G8sBBW7sTzAvWoJ+XS5oU1NVOVNi/eDzpe63egwuQ2YsicSynab9T7
jQHPO9aQwKtl/bjOYYou9/C88O/jcT2P58UV+c7Xgp4jwEs4bNGA553Cms8K
injeJWw8+kFfowHR2ztLmp8tQs+/WDO/200BugGFiz4OVbCD637HPjwHr70v
U07Ec/D9oeeEGzz5oDH/NZQ2x/lSGAtpc/yQYdIqzBtIuGZ393q752hj2OxV
Gm9wXDq7SzWsDb3inPN1wHN8Rik5yR7PcV/N4mLu/n6onvC+JovnOPE7j6Ix
nuN8biziN1NISMI/+f5JzBszs5s4XmPesN7J2ScsSobhxaf5GniOcxXbbrDD
czzl2Qke96xGVHghos8Mc0jjfhHVfZhDGvOQqs+vRBg/tvXV8roYdKjifuW5
CSp0zGzrsOZrR4EaB7NovBT4KkXZF/NSTTGz8hUxKhwqXrkjizlzg2BvzhPM
mR/87t24XvgNSlPai2i8NKMUuMoV89KJ+5I6H0vIqO/L4RsvMS85TSebmGFe
MtgYcKL2XB/Ufnprzoh5sopn4rEA5skJ7ggZa6kRNJPH7Ge/vgKunduxuHG0
H1T3cPhibkQDF09r07jxzr1vagmYG++vblbBfIjuZvSik5gPdWNs1Wl8qPgz
zbDOZxCsvfvdJzAn57OVuKRiTr6yPUPO9hMZzWewRPVhrtbcnGfrhLl6MGPn
bdX+aNTiu+c3J7/7XsDOgznZMKN8+dpnKsStuvGGRScC+PsErWg87H8gmcW7
tRaJ3X7qQ+PnxMtfto5jfhaTzJjQXOoECc7+ORoP9ypv3kDj4XOrL9P4Fu4u
v760NvIa2B96+Jtv/+FYzK8XXyT/xbEW0vvqNuLPryO1HLj+/3XafVHr8X+t
Lw29q8P6hM7xjKgLWJ/TX9wVaPqs6GqWMzrtj04UDpBr294j1g0sY6fGqPAk
ZEItcDgDdTqf4Iq+mQ9VKQKSZz9S4flA70ywbRmsdRxapAtMQR9+8i+fMKT+
H1fj55Wtufovrs7NUPOwkhqBK9tKN/vg87pkF3uVdl6Pthm+wPML3TNTrQjC
86vgkW8WbX79WHSSNqpphBCpsscZOBdY+xsHtuFc0NBoxNHrSkGPlLPuVt5s
AF1e+32uJhZgFhEuL51IRnkJSWxzGh3ooN7LZy7uiVB3+3jR7vQatHfHo4Oi
d0aQxIhImBRTPzAOh91ppFCh+wCLJDk7FTymy4a/VIeD1g3lRDHbIYhi/Ph8
jfIAWMye/Hl6fSM8ES+6Wig4gH48SBYa7BoB188GemtctYAv0vS4Wt84itzp
lr6puwle5M2+cNXyh1HFmX7ZY004VzsFb10ZRzo/ZTbvcVCFoHW6r72WB6HE
U8RpTGUY0d/2VCcw3INSVt6YtYbjcKGxJZ/VqgXVTXGThtgKwGrTZZNPp5+g
Q0dqm3lov5+Y1rcNpFcEt1cj/OI+9ajgVvMtw2gKnE59q+y8xhmoEreF5kN7
0aLQ1cldkSQ4ccs7g+v4R8jQUxSIXNWHPl1k8v1o0QlfNS8IoIVB+PXVPlNw
byNKfMRpGrifgryt/J1a5GXAP217IPv+UuRrt556xBnngNK1UK1mD1e6uJ9J
qoWiHwG56hPjVLT7NLOXjFA6XDp2RaJHkAgde9WjD14ZRfJ8cDOHux8+5YeY
BfX0gfwkFUmVjMKRYuZBX0iBVD2dyKuTnSCSdvTl5PQgnOlEimHfe0FPq8mm
o3EMjR3Zu/dUUDciTO8Kz2aSBiv/xuRLEuNI10UixEi9DT3+etDSabMdNJhL
rWFXp6BV7bm3Yxy/ow6Zg+yuiqlw6nGF6NCrUWQmZvzogXMpquWKDos4iPNm
u0iFVBgVuPRNfnZZFEN2x+3aMBE5yMpqlD3tMAjTY1r6a+xb0L7o4a0e5wfg
gVJLuxUMoIt3bZNPPh+B6I3kb5TBbBgV2PtVuaAC5TTTh5HlBoC902xrWP8w
6C35lWdm9wLzCL+HfBwJfY99E6oh5wOLureGGo/lAk/GqYwuDyq6+SRMrVqu
CMgicedcE8vQ2o9CmhOETpQduW8svnwMpC5qxhQ6DSJ73gyepdxheHhclfBs
rS7IuAs+dtz8BX1W324uEYtz32PVSOr2IHjn7btjXXg73E2e3rdUOQa2Zh4h
WyRq4NbYztUX77bD0So/1cpBMuI0Oqe+sngRml46bt76uhYZEdReVPVSkMyL
rb4rXtHgffySrSnnCJK0Zd11fLoLcUqPejY874BHJ/VF6NhKUcdRZYm1t6kw
TZGY3kFvB1k5FnsXpfshQv18jZnrKKyps798bkcGEMT2v07YPQjHne8U0t+K
g7eVrWZqs8PQaqRnnB/aC8az6osy+SSQnTtD3fPhJPAJjvIus5aC/p1tR2jf
TxfZZLgdf/+jqaKIB90jKN2MHD4jMAC/9mX1yZcdgVKGt5PG1EoUo3jptM9u
KljFdm8vaQuC1cq9+5ek+9G9YU1m2n5K875ansf7iZmVYy8nUdFTwbMN6kIf
0DrGpc35px7A8/D+4ohpEjrxhGOf7/lOcB5n0+UQrAdyDEse3j96zbhX/6tj
HBj3qXjS9u/MXvQuImYAcYtVxiSlDKMdNY8jgjzKoDPBVtsoIBpGziucPrGq
CXUtP59gY6ZAsP3+ckrCENJ3U9TSej6EHEfvTYgtAySiq91Gd9vRoy+76Kvw
uXzae+XUEj6XaIn5au3Bfgh20F3auX4UuRW+PanPJw+qS7O2hzbkoHq63nvX
2qlIQ+e5j4T3PajjMhLB5whKI3NhtHPca5H5kHaOj4zPPIjtooDY3oFoalst
Gt1mIi81j/N7UHRIZVQfTLN9DU9NGUX7daSOk9sKIQE25FziHIFFp5zyI/jc
dXq6mBrxuYeYZa6KPdQFPRm2SiY22eiyEcv1XhYyuC9YvPuoOgYnz1Ulj3zp
AS//rBsHZfaBhJ8tD9FpEJzvppivYN3W7d6yPQTrNvQIU8UXhzYUffBDs47Q
OAzeM65eZ7QbsrmidfaHtMNLyuMCzR4yOLyhr2EytAP/d4ZqDpu/QFrU55s0
ndNNZV6mYJ2HfInKym0ZRV1B0dJVnX0gUirycqrGCrI+MLlcuPQFfVtv7BH0
hAohnenDBcffg2+HtQBHeDs63WfZtYj7wtz6awI37gu/jGmhuFoq+vpKZIhf
OQdYaq9lXacmwleNoV1fY3qQDIPUKPdcD5QH93C8vD4IWkMvhEwiKIhhnbPj
cnw9EhtH9UbfhCHFhffOgbvFoMUqsvbCMyq6zHCm6vsAPyw9PR6Ue20Yrcvi
fStWM4iahk2umX26DBuI1n0Z2b1IYKdwsQL2h0FDmRNHsD80Kgc+qWnrAavv
sXH+0mNog5jTvKq7KZyWEFv9qLIRefHYpDtxUBAwH/hlwfEG/DmZnnw/lou8
G44V0vykYHWPfhX2E8OCLWzXtUggeuhoYqJsH9oU/IEgxvgaais2FAw7F8I7
AQ37LBkyujpUOOrC2Qknj/Hcx/4DLx5zuFKx/+Txp+9IwP7THsz05qvMOGib
ElmWWL+i2YvKpZcmm8FEl7N0voAIL9uFW7KLqaA2rG7DeoEb3hbncnxbGYdq
rveHbI40gfE1cs+H9cZQEzS5oez2F6S9pVwo6DUVOLdt5/EZNICEUfmqd1dH
QM95wcMydQDSitquPb/6Aig7uZosYQA+/uq/oIv9VnN8vSUZ+63MR8EyH+52
pPwyimS5QIbrJItL/i7PYNH95vM++054YHf62clQEniY08kPsn6Hqeg6klJB
BSybJD4dx/5ca2x59hn2Z8WNSJsldgB9W9y6+9bgEMizMkG+VB2or/+8SmW+
FjFdK9UNbf4CnNcusn62p8De2Py7p3BfbUvxvWVVVgsNl47XH4/hBIfXZZ/2
hVFRZmFaWSmeIx8t3ZzD8Rw5MKbcvDahFXUKGIyKnRpHwiIF99TLN0H+IQcf
CddadMunwiZojIIEK8KYclhOwwbTqfA7IrnIo1+lf7CBigjhqy9EUgJBbfX1
PdpxZLTa6hcn5+4W9ORx6GbOU9VADX+hpucwiLxfzaesw3Nqq9SitDueU2Nj
uwblxNOAJdN223UpKnqE1kmte/wN2vYfUoztrUPF6dtVLIMrkNbTyAdJ+Jya
liu+qEVkgZFwdKRKfjOiWG8W1Q0dBwYb/8SuxjH4fP3uSU08f+8oi+/4hOfv
6ksiUeYS42BVMDuih+evelfMK2c8fw0aDZznv47Du4NrQwpsmpHrIyP1uJqn
0M2fE7ROnQJ3VCz0nuO5vFVRK+wunssm1fYDy7r9YL5iffOMxyiwtvMbk488
BZJ8CcNLMQqw8F1iaOasQ4JP3PpaGsvhIv2lIjzHoWuX5iMXPMc1T1szReI5
7qCbER6zow+qp98FxkWNwgfh3uyMVeXgQj/4lE6vHzF0PxA/jb/fSGTm6zj+
/s/692aDe/rQ9OP1zyQxh5x4f/jMQ8whXW8WU399HUcXfJQSS/D+Zep5VN/g
/ZewXaF7s6MP+WxjdHyDv39K687bTPz9C+vi9ltOdqLRuTXaE5hb+D15xMMx
t6y3kyl4LkZB7NwaV3rw/llyHnxrxvvniY3MDXRvRXdv1DWwt7xHtqNivcyH
xiHh1FgPa0IrMDYrOtF0Ernz9ObDWCcc2hI7hfc2wodlLn4aj+m27mxtxTym
KtzLcLKXAt5G3edvYR06fR0o08I6zL5w207StRaeZ+0/QdOVZNJn0U9YV1s9
3z9dt78Uus9r9NP4bct59U01mN+KdOoMXUVyobctqYemt9TCzD6a3lKbV41j
roMNHyV/c9309JNCGtcZsExPYl0h1j0kXpqu3qgQFWi6qg3+SukWJKIwfcFC
Gu/dFvmsQeO9AouLXTpxZCAU7HNlw7p1u9DbzYV1OxpelIL1hhwVPMQIWG8P
j6az0PQ2sU75KtYn3NJzOmWG9Tl1Iq2Jpk+vvWJsiwVERAw90EDzGR6+sRts
2GcqtnW0YR6Gaz/KfvOw4AWtZhoPG7Jn9Zfe/gIJBU9FaD7T2qbR4Y19JsCS
1We3Tz3En7N8QuNkC35WByfMyRmHHi9UYi7vy5EdM8N+ddfny4eP2K/KS48Z
enO3w/VI/oPXsM8cUzkq/RD7jMXOa3O/MLecCbbL3Y25euuGHUacmKuN25T3
p10dQRfDi95dwT42kizAEIF97NSHzsE1sQMQkFwS74R9RriabVMe9pkHmzfe
jFjVB3fHggtzMIevN6zVIGIO15p4tWbQvhNpMDc9P4F9bIqQ0zWEfSxqVdKo
8nwtfA27KfEC+1LHJ+OOQuxLa+QZy8IJ0SjfgN7w8MtaOC3NQf+yjwKPw5gv
4nmENDYQWGjz6PaT6SzaPBKMeLAW5xFUFM6ST8sja+ulLcVxHgkdNu+7GEGB
zlYPumk81x4wOzBcwHNNd4XlXnVbD3ItiTv+CM+j5zWkvoN4Ht1sMZi4tzyI
NC2XOMZxfolTvj2jjPOLhcJTgYJrw5Dt4TsijOfdlpTK8st43s0XrttupUVC
OmbCju/wPLrPIrVBFM8jeH3/J7PhOJoVDerehPNOgh7DoUGcd9acXB55XNkI
vU8e6dPmXfXu/KxreN5ZE+JHi2XGkY/C9BgH21d0Zo+TBG0ejci6deC5hs7b
tJjR5tpNN0mB23iuGdcRQ4oc2kD41ND2E5g3ctGuF+yYN07IWI0SBQfAb6fC
uSGc4w79DNZkwjmOGrbWJFt1DKmbLmkMYJ4Rt3slpIZ5RoHJLT2nZRSeTzrP
1WDeGGM4dn0C88ZqqXfhB/vG8fcJP9uGc5/3uXm2Ozj37bj2kiAb0o7qjRfX
0nhGgedM8RrMMzL67hFvaqlAEhFy1sa8oSFGPUrjjYaHZ4sxt4DHOaorjVvC
5S1FiZhbZr5Ae8Obegh6/kVF4nIdoupn5+edw/683/L68cF+FNOwxLkb8yHr
Rp3MM5gPD/PWPJlMGIIrhbVeGpgzE2++aBPHnGl164tgTBcFVb6pGZjDHNjU
rcEpiTlwxWpnC86/qGrqwZA/zr/S+1Mki3H+5TF2ZD6yIQd477LfpXFmWkn2
O0nMmfOiF9t22Q4h8huLmNU4F3fvc1utj3Pxx3MVEd+i+hDRveBMGubJ1uoA
qzHMk8esIypjDnWh2iuXSXaYGwvp+Q7QuPEJ5WSCb/cI8P+8yfgL8/x6Vest
cpjnLSlXHLpdKTCXkBbQhHO9rF77yG2c62N4B94ScZ69XfLNRRrnBQFl6e2S
OC84y7XdxTwP0oGf1Ddinl+6q29D43mG0LkE2UQyGM3zC1I1OtDl65uL7rgn
wqvpx8oXqJVgrcZwkpYX9D6l6NDyAnM61/aomAHgns7SfYt5HgmHe4Zinrc5
Y9OzJ70GhGTLtojcGUGbRJ537GPqB0GeUrGX0yR4mzhf/hjnBakpXuV1OC+k
nq27hPkf/bBZ8NfB/L//wEFOdsz/javP55S//AaBIoXtyYJZKNw28Qvio0JT
fYOhXV8zHL6QVcafPg6/JAKu+V0xBfVMjkDk1oPs6HS7s6zGoIHH4rSe93Xo
3H3ecKloFMU7bcqbneuDtxlsdY1lT0AjLaToxQ8q4u84bhC3nIR27UnQcFut
Doy7u08QRcnIzliTQ9imC8jzLY8N4/XBY4fB2ptufej5eUWbc9tJ6D0hsiTA
/yQ43m9T2Og6BJw1HwKpxUPA+u2n0lANgMKUTVIkdyLcMn97cG0D5vBA4kHm
pGxYR2I9n7TShnI3Lr/ZvkQGzvnjPBEbY6E1jmyqdXAUnatr6KZe6UfbG9bN
qyh8Ao4S2X7gpCJXhaOXrC2r4OuxtQpXtqXBnukHUndfU9B3XfuSFoESFDQV
nyJfXAVXX2lbl3UOIatWnx+Sl4YQo59iB9OCN7i/Vnjt3EdB91qeydu/q0Vn
P6Sf8vR6DoRU7WM6+plwNqpn8HAfFQ0k/5CnhAbCSS+P9K2R7UinfLJlT3AL
XP7UOmzKRwJzW6Gpfc9IyP1O0IU39dWwJC6XI7CuB47EmzpOf0hDd7gWIia0
+hAbP8Ql7SWB4q12rROP+1Fm9/D2lrdtKDJYN/j1w0EYb73xiuzRiTTjguT2
MpAQj75k8OXKJpg8eUTgrdsQPNgj0mqqPYgSThwOusBUC6T1Lm+4fajActtY
5RtXCRKdFig/3y0NlprTRZSoEVDYWPXl6Y0BMHa32H0yVRWSmy/u3CxAQjfW
x/nscelDk4zJD90yJSCh0zhh3/wo3BIUuzqe2IckhkxWxowjQeWE0SV/znHg
N+hj809vAzOdhLUfTztCde74xVc19WDtJ95dE0qByenXkk91PMF9NzEpgacB
tSmXNS2oUsDhiPPQp1eF0P+FhGbEh5G+LmV/w4YhCE5nyEotNAS9Q5rOfOLj
aO+vtJ8HdNtgv872ikA9MRCevDxWV9mDznz2uSCvPAaJAaYfeRiVwOtSV8wX
vXEYqdm2duvLVhCwWB9/6hU/xFs12LUl1sPPo+VPqS8psK6ay/0FvQSsFfN7
0SNERUntu5PdNKpgZSl2i0fOC/B3KExJE+xB3kkxm5Wix6BXTz3yoV4A+Arz
hbwiDKN9psEbRkYHITdBU3ekKQWyaqu9Nk1Skc60e61JWyoaZy+7GORqAdvU
OshCW8noZaasRdvLLug30drR/vYO3DD3a9b6NICYF+dfdJiOoD0kiWctjxxB
FH0+5kE/hty1nVZ8eHuRcYibn0ROPDR+3htmkVSJql8pM4twY11HpO45SciA
H1+Fmi71lcF6bn3ri0ZDyCNdUuIe8xCc4ReX27StA3okYjP8ERmFXh54Ufzw
FJiMs1VfOVkLXkzv/Ewncb6L38B1RnkfMDxk5eZ1oCLZTTvSOh+XIq/QuDg/
qc2ge97WYHG4BxnwR89cEh9DPsl6Q/7vBMH2IwTbH6HAyYI8ukO539GU4ZpU
9q8mcLzCaw+vVz8s6Jdr1xiNolv3y20enLKFPXvkfAToKcCasc+v9n0dCjTv
sCH8qoDPRi4hgco9cIvAEhJ8ZAwtuofabpMpBJltV/1DNQdAeK+I/djUAFLf
Zcuufq4N7o2+yWucokKFQG2WsXAi6PNOl9/6GQE5BzNJjkxkOMhz1l4roQtV
3XbZsT81Fa5YJavE2w1B7S274QOFQyBn0PPg4MFE2OS/Ipu7awxkFsuk0fdW
+PV1cuOn1kb4su5GegO5EbYUhSwkMYzC13OrzNJSe0DpmKCX9NlM1FZ/9Llb
PxUO2w4WLLFqQsyqzMvO0j1gN3tLzSN8DAQL7n2a+nYept0U89h6e5HBk5cJ
mx6S4GPzaUX6Hi7wD9BckJFKBvFQBg7bH1QwaPE6s1iyE85Gxjh2HaGimy5z
IlPrvsGR+4w7on6JQLY6abyzpQmZTbdOJ/SPgymxVq78jC8kxDA4CmlWIvfo
Wu2bslTY3i8Qf/+JBVQk3drqdKAbdVivHtIfGgMDM7tHLrfiYNdZQ2NpZQr6
9i6dub63AjadvVZowlkLi/u9+zeGDaAdTHYqi6/6YfX84l6n052w1uNblr44
CbkkPFUarG1F2c8tFwMOt0HCY+6dau31qHgnt5FRCAUVb5QcXy17CHzqLAr2
uI8hh0abitMXepBTupV++GZZEF06YKxsi/nb4Ifzu5JxZHo1PsxnkzAMRTDY
uVyloMUwzn1GMw1QJCx4ckZ4Nfie3tGx3E5Gss3z7ffj25HbyM2nHRGbYXui
tOnnPUXo22GdxIR3VHS8qYB78K0n+Dgd7d0sUIka7lSSs+TxXFp/UMP9kxm8
6vZ9UUsOgYu7Zu5c/EpF5VNvT3bsIELGwjLfD8seVCPk7xTkSUJ5SsQWropK
mK71V+iL7YHkLc3+VL0xNJZ932v8WCDcTXt9q/FZGhIwdJmoG6OiB/Ms4n1c
0XCPp/v90loK3PZc83DuZyM6JbHbYozhNdh0/Nwt05wPr5JsU8hZfSjI5sTP
Zx9HgeTFe7U/vh9+PRKY8zIeQRale5vbgipg5nvesTtFOSDkmJWjdGcc5Wy8
9GY1bwv86je44T9PhikksbSSVoW2Z/A7ReQ2wYphWfn3Kgp8dm/J9NauA6Pu
6cupLk+BfsdBU91nfWAQ381Prcf5ddP8IKNWHiR3MAobOFLgnqzw2MDhBtDX
FZE5FZECwgbbdh0MHocwpVtJp4e/w+MbB6mlp8rBq6aRITZ2BAi9MWlrdRtg
Rdr0+ualXnirosBHsG2G2sVL/LRz3Hq7gNsXn+MIp+ojZddxpNwvcIHS0YKG
3MsL+e7dgwLl4QNNVRQ0XOh78zbeJ7HCRDwN77M/iVWDS6ASvt0Na6Gdl5V5
q7oHPq/RpKrrH00oqO50Td7urno08yZ3JFYG11Hv15tzjhRkWvPhYjvev+C7
80m6eP+LHmbvVIPHEbnodJYW3r+iW9GBcrx/lvEWxt7YHvSedPnoBD7H9auj
1Mn4HK+cqGJaXEtBbRx27xh+NSJZYoA3CZ+Xo/q93U3P0kCCJ4RKO1/2gyUP
aecb+ypxqje+H8kvth/1wefVbund3YLPi0d0g/3DeTJi2aiCNqRXIYn7qu9f
4nPZ9Z1+Nz5H5JubgGjn+NbSx5t2jlFkQVFJ9zGgcF8jnsR9ob1hp9QL3Bdi
E0dOsfb2gvuE7cvN2B9atw5brnRzwdpYf0LnESqo8hpHreH4Bl7MHuqvsA8s
hloVyUolo2zRc+t++4bHGtYl7BvtXzh8uarbAbbOvXWtJ6PoMup6XsNVkMbM
wUPfQYZH+ozed3Ef3ZxN39WF++jw28pGQc1KyG1qPEvzDY/iaV6ab8icOOYw
Y9kDRDlD10DcF5fIJ/by4L7Yn3sZHA90g7jchJUB9pPwkYnDzthPeHo8x5JK
OyFge4/d7hsNaK3c0YKNL0kQFid8Yb8yBbKbpFQGsc+IP/+oQPMZnYvl0ufE
SRDy9VhKJ/aT3mmeO4HYT8bSxj5sCBsAzT4C3zL2n3exHK6O2H/E98YvuEhj
HwkXOu2OfTVtw6DBDPZVQuh5azy/UMazR6G0+RW9VSn1NJ5fO7g4gxUqSpFS
6K99h2yp4KNnmO1Xzgze6zpItkcoKMxAMV0bzykJj/AJVjynbj5lLubx6kcq
kQJmtXhOATuLpB+eU4yq5auapqjI78Xun/R4vlQ0WbA64fnCOPDS5a3dEBr9
dCZdAc8RDT0vdnU8R4jSFCYHJjL6sLbaXBfPnXaNZTYpPHfm+oRH83aNIcp+
g8EsPF8Yty/ezMXzRapkhLGR3IhuC+xmpM2XeNLGK+l4vmSdcnHcLj4O1wXS
etUx5+j+fCDxFHOO+paCjtrKHtiQdHu1AuYcs03c9NyYczYQnKWWh3ugmnu0
xhTPZSOTPOpjPJfJTOG9mEPgIs/R7OXWVHS54NFbGofIn1PYofNpAGo805Pb
MG/oz2390YZ546QxaVpgKxnMItLiezGfRO07srcV84mkc1iL/5tg1CbRuvpi
NwX5li3fVPxWC3z79mU+Ve5B1KuyAiF4XnOwHg3mxfP6qRoyD9EcQGlnvq8Z
x/Pa+F3hE1U8r5U49xV40o9B5Z1mPk/MM79u3AmTwjyTMrj7+bWkSjhErzkk
jHnGwTPL5xTmmfs/j77HPIMYvrAF0Hjm/a0n7DSecTZ+c76msRdxfdK6EBFI
ApNV9hLZ6pdgjeyPqC0+VDRfesilD/PtQnC7MI1vN1+q9pyMGkG8MUn2jzHf
PpIvEdLFfFtoYW3z4Wc9vCkNrp8NoEClF92a1X48cH72w5aOxHpU7xJ9ksaH
x41qRCIxH+rTU8y7ddWhwGOXwLoFKkgdGBQvLYuGTUll7amCPbAyaBxA48M4
vmimB5gPXXaZjUUQhmGokq55FPNh0iP3fUOYD0uqb2Y+5hxHi49HSR6YkyWz
uImZmJMbxEo3vK7Bz217HEHj5LWUkIZAzMkj6rq2mJOB1SS8l8bJa2McM2ic
/FCXl+cl7v8LHdokAs5fVJ2drrT89XST7Fk7tz7w0pWu0sc5yyxmuDEQ56wC
DXWtfFEy/Fr/6744zmUyqS3t53Auk1EemVSO7Ebr7jKt/VI/hsrjVLRjDomC
usytvW227Whg/a/O5gYy0g/tM9E59h4yxdaXSM6Poke1A6snMP/v3XC4exTz
/5iSocy3ziGYbJ3ZthfnJl6FJ5ZrcW5iE+NawPkI0aVO9dPykcmXsCpaPnrz
SUz2dh8Fjg3r3b2K85TRLsnXXjhPbQ6Nfs5rP4iGhH+tilapQ653n+3z4B8C
rUecA3vsx9Hlpgk5/WsZsKZQc19yQAvsXGeRF+82hEbWTHua4bxTMfk42Bjn
He7PKtlUj04oinKtEcf5KF3j28+rOB8pBFYyf1p6Bgr1snXPl6h4PhGGdN08
Yft74yKiWw+IqScZZuP8+5DhYd8pnH8TZWecF4pG4ROH5LE5nH/DJ54/bcD5
94FKpPl9eiqyWNR9U5ZQg8/fN/OCzWnIE0wRcuxrRsYv/RRp+Tq2e6ftQ5yv
bzLs6RmqGACja2cG6PRGgD+3R4++QhbKJG90x00Mw9RurrU+GQPAfW1sTmG4
CNJOViYROHFeq/XjuYdzK+WX/oo5zq2HPx6VdHtNgYzRPbafcW61DFGOU8C5
9cbwz30lCZ2I91XId+5zZDjHLGfgcSgMyuslYxNX2uBB2lANLS8HufOFv8R5
WXkTD0TNNYHKzrmIUDQG1+w5xj9yNwGi6G7E+RT6utsaP+J8qj7Evo+WTxks
95Z501NB/MZgfy9+Xz+1ojhj/L7CnWkt2UvPkNwWx9/1vG93feoUrqe9V1zS
tME4usLoF7LTqxUlfz+BWI+YwyaLc2dGKgYQ562zcSu6I+A7SmpjwHWodelz
KkrAfn8no5oH799JPtbqLt6/4vL4zYSJYdSSkirqhevTZT0pdwDXZ+dN9zUH
tdpQItxM4BYZR2Yle+ML2OPA4ka+D34vxBbb4EF7rzmtFalM/F6Bg28iy19+
Q2Zpl2azBLOQfO7jOPT777Rfmyep89P+fyGZV6OM//t7Fb9fhKKTCSQoubrX
7XRmL1pTYb5NwtwATCwPGFciKmSZujuYLiI4cOimW/bgaSD7i34gRHZDq8yH
B0W4j6ZWRT6IxX30tjSGo922HWJLquNpfdTGVjVO66M1Y+s47cKH4W6eVSff
y0FoGE80UtsRCrZbdh2uauwFWQGr4kjsb3KhuWyZ2N9+FnXVKnwZQ8ZWU6Xv
G7pRI0Rusww+DBHzAuPYx5DVBIlI8zG6/Ws/0nxsXWlXXJeuOrLqDPjtV95u
3fYl2K+uh9O7HnChoNr61/7S3g0o2+77VOdPXyi6LUKkZvagzFfFkuX+w3Bd
/Ahzelg7XNz24cjrCQrqHZ4a2plSgngmvDkyfErhQeHu+803BtElybrpXfuG
kUSJ2F2518XgbHKe4PMrEc1e/H9kfXk8Vd33v0aJJhFJIpWkKEmJ7haVIako
SSk0GDMVMmXMkChCqCQRQmRIibMzz5nneZ5dhUS4v32d/Xm+Pc/vz7tf93XO
PuusvdZ7rb3P+z3vtWxdOGxY/62Ifl4LRt6/K5A3CFdda4B+v7sgx6zqB5Ov
F8GlF/X5R1CejhIOfLWzpAA0hXEG7uY6BuZuP9e/8W4YxPXFRV/d0gGq7YJc
7XfaAfN5djmUj8CvLd2b6PlI5Pa1ySMoHyXdlBx8gOIJ39ZMy63Ib4M6zT/H
UNJBT9RGZvmCLpAfF7JuQjEYZOx3CWbrGwRPXlzn3be6A3CscbSNAQ3g8xef
sB89A+BRcF3Q3doxwPlbLb2UpxJ81d18qOvAGQCYVul8HuuBPX6nKsXEBsDb
xs3pqWaHQZbilbOHiwvAqK/ccTreuNmrae6O8Eb4Pn13ff4h8OWXtEPIvS5g
uvnGrdvXvQA7r7JPPMIVjjuuv5DaEA+pJ8ZyQ/ZZgJmU1cpfo8bgpl1bk9zK
K6Hm+yJ/me8fgW6vRGjhRD88E3unlL0zATBk+nWf5+0Fz5MGBNi+N0NBO11J
e4T3TtspG2xGeO+EunqNz5dWoMmlY/pVbQTaJ8f53Q40BxY5e5Nn+kfhOrGj
49cP1sIfdt49fq++gaFqjanvGl2gTenEq1/8Q/C5ufPVSa4EcIAisB/hOqhc
tGGnCMJ1+44LbaLjOqK4nS8wrhNcP7/NvHVzNzzPMXH54OsucC1Hd/N5jxGQ
ZjdnQcy0wK6Nl5dQ6lSAafx+c4rdKGiWqLrai+qCn9qKnbyoLhgafducen0M
CPJe0ONDOD9qwVoqEuF8Wa4V9b4OjcDEy7F3vv4jzPOqWrLqxChYW/08/hLn
MBTm8d5ptrITTpuPfLSNYAXVPfzFj7+0Qo9dF2foz8vEKaB0Cz3vgbeB3aqB
XbDgsPGSMVQHyTnpbGVEddCuT+bBZRpd0MpH0X8aPa+eLu+6n+h5S47YSwfE
dcL1dQf3tKPn8iMsjETRc3XkHVCTba4Ctxsf7qPXuQulcgcYUZ0bHLMv4tNY
D/ArbVURR/7gdCMuPxn5Q6y6x2cr3THwIOhw8m1Uz0aU8m+dRPWswaWnq7L3
ZgPvu3Jv6XWrSlRzDr1uLd0Y3In8AciZsa3tXB8PP/LyzNH94dpZ5x9zR4fA
uTrJGc4LXaA8pnYI3rcEuUOSJaiehe9WL1+sZ9c38frQ61nno0x5GVFjIPdZ
no8d8p8Bg1BjWeQ/DX5fT6lPjQJ1Q+bNj+ZrgZjEEdUl1CRg73n398H6DKgQ
fGqYXp+ybRAuodenEYLXTJG/gaktmWtVkb+F8vJ+pfubAe+C70G1VHBrDe9i
3yM5Ra2c3vc40pA0IGFGhcmZc3Fr0Prdd9QuXBCt3096n8p3tQ/Dmrab8pZm
7XDn5pCOvG8AuNM6OZkXqNAgk9Fyk3Yg8J92X51wkhsY2W6ZaGmoAxFSNfzR
3aPgUEiceOFFd1C+W6rk1rthGLJ1nZ86igN5B6njDigO8LVYn1wST4VlU2o/
Vu3KhnePfzXXrHoA9HuUJB27xqAtG1izCsUBscG39e9RHAi5Gr4JxQHosClK
8AmKA2KvH8bQ48BP3qwvG7hbYPLKN+sfwxFYcNUlPufReaAk1XxeMmcYuNH0
mWNQvH1uk73WEMXbra8cPl60oAK136suO94tAM9OF/l+lJEHVgNOMtz3qMBa
mT8/17sAsjIcu+W5nw2sbxyXkLJGcWnv0ve7Ubx1fut7vh3F27bQVsC7ZAxq
/Lwc2PixEobXGioe+10M2JVSpN6MjwHZIYE9G1G8hb75xfR4q1/bu1vduRim
vk9ZxzAfB7SXT+lMSVNB01axW0JNaeDygoBzEkML/LNS5c2z0BEw/KdudEKo
H+zrleeu3dAHXJOL3eO+XQGNdhVpylFDUPuGy9NLKK9pVJ+h7EV5zU+c5Vee
6ih8FnVTZ92LRnBGV3VaJZQXHBDo1WvnpwK2BiGan3wZyD6vvcHhcwjwlq3M
vBfUDz1tbk5xo/wVSJ3OPIHyF3u7R9Txyn5QtDeu81VhPSy/vqKvKqsT+K5N
kjfZNgr7Y1dcf/2wCZocSbpsn68H7Lb+WPZLfRRIT2bnbUU4IUTO5NoahBMS
D7kzcfANAYlVNPPd1l3w4waPUadUYaDD6XvK+M4ozLFLzDS80wCYPs0nmJWm
AV0uYQbZ001gvkV7lgPhAYk9Riu+ITxQxCzKx27XB69URSeN5PaBLas4Lg+V
A/CqWZNfWXoQqIwbSI7c7obidVzp0ke+gFubXmu+5oyBfe8fH6XvO4zlb25e
9T4N9C2J4OZ61Qx8DGsrRZ41gCcHZ67Q+/kYP9C/dy54/Rd+WJAMH3xmVgjD
zKnyrL7x8JODwRj9nOohOW3v6ogqyF/+pfTArUqoQdkiQ99f85UISg3LGpO6
vLZwdvF77Nbnf+6f2g5S63kuftMfleJSuMvwh87/4uUaE92lDUrfXTv8JDwL
OKuUGdK/z6qdatlG/z5r+MfMMSuVSvit0uEbb2EWeAc7jD7ajoGqphYJ3/5k
8PTCzEyEaQYY75Hlo5+nHdq8Mj2I8gYcK8hlP/WiApjzzvWHoDxqn8otOtjW
A9Y+bNjZcHwAzC49xHGfkxVoSsECYlsP2KFdLq7aOQBUxApU5mVUwCsBz81b
1hVJpTZ9P+m3tALsUb7/wfPPGGDf7ykx3NYDdyRSb9eh64Q5uDZao+u8Olue
P+jYAxkfcQk6+A4AMB3sP35PFAinHH33bVsP/HihJPk8ur7IDtpyGrr+DdUb
Jme/dsMjWWLv9h0YBDNqxcOnXc3Al44D/rnhHaCN7bsJ10wHUJNOUg650ws2
8zsFcKVVwenglZUJPp3gl6uZ+dH1g+CY4rqtbIPZcKXx8zP6J8rh6jhPQ87Y
MXD+BxQ22zYKbDx5Vj1H/nltL/f0A+SfwdI3LDO2V4Jziup7e2vGoBT3uSum
H66CgfjbEbkIJ21SCxt1iu2FM02vlH7WyoGlAz+Eje6MAi1W7lEL5J82W60W
TJB/froE3kqHjoEi1nSLXPFKKLRMW+epRAY4ypO4ROpYOzBduJPgUDEMTlqW
BdWLp4Ar9zKfsIYPgYzPWw7tQnX/bxvh15Xl+UAp8aHwJu1R+PBWvMoXzUZI
U3TWeydzCKza9OWWdGU/VOQ9kBaJ1l2zL8+vSrTuTJLUPTbODsObslb107PN
IPZ82bMghhJwIGjHCOufAfhp9/A484dv4HJ1XovEk27g2NNiHB7YCI3Vj9oV
ewzAP1mmAROsHWDd45hxUesOuDFh45MT9XWw9/XAlsgfA6D5z3WDP7AWLtkq
+OsO5xi05AhsOnhRFnza/X1q9QIV7HgoytiO4vxXVY/hDyjOdygXN6waHwEO
9pfnl6k0A7cHchtyPhkBVfbN10V8BoHIpRLtFu44KPHhnWvVvm4wUlocJyvR
A2Y25PWFlA6ArzeC9lDbj4I9Yd5p7j+oQITF6yTN4AO8NzKUm+nDDLhnV1uk
p/QD67Yvq+Me9ALjKBEty11cQEQYrijSqwdqYcc6dheOgt3ZRYkrB6zB/E5f
5eeTVNhr32w1yBALMk0jLiYsXARaGc4B5x5RoVXqfeWtNnnQUeUNm1jWM/Dk
zsrHekJUmCBjVTIWUAr9TL+4tdSHg2droMGhjkF4NELR8kV1F1QIU5TnG7oA
vB5VMmhwDoOYR7LmdxBucX5vfdoe4ZbZDr/jhveHgXrQofFo/Q4odzKGw6V/
O7ixYiS+baEfml7MNXwj1AuZXvp/Z+C5BwIaeFxZm3vhkumyO7ma/bD34vWV
PYQfiNpVP3mdpwkkMWo2ZYuPwrtskNasoQqEn58UX2gZASbNTUGy4c0wOvFN
Tb+bDmAukKvgNe6GGbunY93VBuGrj3MuxZ2JgD/lQ2W/Yw9o+XW+xBGtx/FC
h8ox+nqsOlj15VwPEPz+c+/tLwNAq/Xlzuk7MqBzpci1MVsqSFkiLyvakw+E
18lIc8SKAoU1POqCp6mAQ987dJYoBp6993/GW6uAwp0jchWpQyAtTKzF/HUn
fGnlUe4IlgLBh13nL0dQwbU7Ze6dHDnAdjbT9oESKyha0xZ15ms3eCa1lFkE
rfc9l65cUkTrfXDyrlKGezcQXVJW80d9EGyX0Fi5a9IRrNRrg14bqIDYcfTT
8ajv4L2T9vqaL2aAWtFgqiNbBia2nOGmnawDce91BBg5R8Go1G2X2gMNwD+/
RfzTWC7osmmKL909Cvx5OWeVPUagBjutMh/h2MbU6BAphGM5p9uMqLZUOM3n
usCFnlddMLOD/rzXrL577jlNhT+zWmV70PMea5l+9wE9r1CB59P39VXw8EFe
myGEG40lrVpNt28E3w4MTerdH4abIi2K4tB7v6zyzNkJvXe7yjTHXJZeuEo0
vZyDawCY79cVrUxbAngkiaMaEVR4/+0l/SJkH55gnaUOyD42TuYbvDdQ4d09
cap70fPOp/yqoD/vp5V1F67xNMEVr9QP5yB/CHx7v6QJ+YOo4V3huZYRGDD+
jk0J+QMvx7BbH/IHyweKtMBJKqB1u8rJLYkFqrEbt9H9X7DsU9XhjkHguSJB
IAj58xORBQl+5M8NEs9/dSz0g4Jk5tpQ5J/REe8+L0X+2bKJy+38IyqoduM8
zIjWy4bgk7H09eIz4xHC1twLHBufWWcjv7WNXFLZi/w2Ml71+NuMfnDsNfuz
EYteEHBg+Wb7s5fA0QdrLv7pR/jvWN1jNXqdAmpKn6E6RfNZ2vPtxt3g4s8g
RTfktwJy5etKkd9ejSCexauPgJk5jcaNsa1g56lTmg/m/IFYhXe2vhAVHNbZ
HtJIX6eFd2Ra0Tr1Em/bZVFLP1fZ75aF6rsy+8L4blTfHd1wtuqkRA/k6Xq7
KxjFGe4Vlct/ojjzxl1DaM2LAWgwGeBmZtEDXUX5VNeV8ABVhZcLGSn9MHiX
GiUGxZnln9L3WqM4U9158pchqisSw1pYnqO6zzM05oceqvt20O4MFOvVQ+b4
q070+MNmOJe/CsWf+5nGTMzjIzDlzFzq7PlmIL969lgeioeBX2NEUDyEniJd
Fdu2xsEQy6Xa9HjYY8fItidvEKibHRN+guroTPOxXjNUR6P6XnUe1oInep9f
0eOwhJ3Qo0MoDm8wtNDl1B4FK5g7VyagfGH37MjyaJQvBt1tB4OutkLx9HWh
+wOqYOkzsfUG7UPgg8fA+YjARsA9NC9ehOK/H1do3iSK//1pRZ4Hrem8nLc7
KCj+/+gpWvYOxf9WTa2KbK9+yCIuNOSC8uCW9eXm4ygPtgUxMFBTO0Do2Q7W
YpQntQYSSj88bwYuaWatG2aHgfGUbN8Cykcn9udNB6J8FDI17ojyEdjY7MPL
jfLRxFStBz0fiZZomoBj7TBH1CvpAcqPOluIikaUH0vHly9jDx+C+wNHdmxH
+XHOzeJzNcqPzG8nz6B8DTndfh2g5+uljoab6fl6Q6GEMggdg29uia3/jvIv
4wqO3U9Q/i2VYhFKGGqHTM2nDnx3+Q62aLWW5L2n47pxqf1VbAQDgyODswjj
P7hOMsdqC8LhoHy1dt8GhMN1Qrap0nF48jkFu+CrrSBor1X8XmRPkUmrQLo9
I80u7EJ4DHw7FRGyE+GxJtMJGToeY2DQmq1T4qZf1zOTuSbzf9f3O//lVsH5
JljdH9JzNysRPtDV2DPBMfq//9PnY1D71/+DvMA3NQsq5LrZEalPr0eWvNBJ
QvXILd1t61FdAH3yJgRSUF1Qqy8tSa8LDivNju5uHwbFx1PyjFFd9jHZQLEQ
1WXa8dobl8ZTgVhfp83PndkwV3Wt5DVUT/GeWetyx8UXMN/e6mHZlAI/jHo0
+NH3vZuVrVJ80wFU7lDN2ZcF31a/7TjmSQUBihMbvh/OAcuEls13WlfApGMD
6tBrDDCL/1xLOzoEBdde/MmO6lnRHO/0LFTPhoadbr08NQpX9KbccEL1aasv
z4WlqD49ZZpS771/BLhktA5mKbTBKTZnK5YlCFeM2Rtls/SCz/d8wjajOFml
bmhejuIkNWFDp5FLN2AJuj0Z6Q4hU9Q3gcI1g6CBQT7l67ke6OlXG3YT5a9V
x340/Ub5q5px93BZ6hBUt6oytUT5aMNZDVEHlI9M3K+uIty7oZxY6oNZlF9e
Wse6C6D8wte4XB3hDcjHcTTohuEH+IDL0ZyON6By6Md9qzvg584v1yJAA7ht
8sHpZ88A6NYlchtNesF96nyWwIF+yCC56t2RsFyUp6bq2a7Xw9FncZFjDPGg
4cPDii0ZoyCThbqjDFLhXoH0XpE5CO6tb1/yufcCCLn07bH3qxFwfqb/vtna
asg2duTTwxu1YO3u007ovcCBnV9N6O8lf6Jw8b0UqK/hefciETAG5esq+GdA
1qve40ZfqSDx95KOu3rZoP8xG1cjcwHcp9Vg5onqOuulYZG1u6hwLDPxwK7w
UjDwm5V1zjAalKutHYs26oDEk8sym2Z7wJGZ/dbVXzr/ty6Q3yb+cvprXaTy
rEh6lmAJjlvEt8+WhwKuIKaDe+ZQ/dTXwP+4KRYE3Dm8o3A6FXh9HhR5UUsF
GuW+R9pcQoHZunImi42lYM16A5gvRgWDB43dp43GpI5WtA0t8qfLy7QuvyEK
pIjfuz03jEptv3xqZoTOc8eqrBBobgbcf92n3xfGT3Sd+43uy6EQtXjfz0wC
e9F94a9WqY+56L43PulK0O+bejJRGd0XcjwT3HIX3Vdwx6Fm+n1Tee+q1uyi
gobNFpRjyA6rrgsz/UF2UHrGw/f41QiUH2AXtUX253c0feeK7O/R0KC47sUA
OGg4+tsY5QVb/i1/NqC8sM2m41RkRj+cOfRWbQjlNXUjwO6A8lqiQKlrgvoI
tOVONWJBeepm/o0yB5SnbrpLm8fWVwGe1CuX6DjBJjU+2wzhBBv2ZC/m0Dpg
U8xx2r+nAzQFvngf+GkAGI39SPTaPwL5vU+MFKF1EWkpvpwZrYu3Ra2GaD3C
lL7iqly0Hr3mvlXT12Pi43sLZYdz4HvF7QNdaD2+6pyWoK/HDIEbS/nlC+DR
TzEc9hwJsGu9jcmMLhW8edqejfwTqH+wE1q7JB6k9Q+l0v3TwF+CBf0fqPPe
XGeC/n/4w6Ad/f8bathMTm16Cx7x2307bhAElIR1I2amqWCJrkBLx580kG5W
/nu/3GOgJil9UqQZ4bPzmvT/w2+nk0ul0P9TN1yOpP//6XX1VvR/+L7ONZUV
/b/SYugU/f9W658Ll6rngByucNbpxlAQspVDYlsoFRgI7dwvOEmALm+3K3kv
yoBejqANY88YuNjVcPdZuw/4dsjv7YHURLDu27nlIaNUsOzV3RVdL74A14cH
79elR8OYbuCsVEYFX1aa2lH/2IGLU+8EhqAb5FL9sFkR+ZdT66H2SWd/kPTO
J/HudVPgE0G1VkT1DNNxX6USg7cAruU+X7A7BFyUNTI1RvNPyDDo2V8dBMyi
Dc+unnsEHJ5vd+9Efjjf2NKxvTAJnLX5+EjtQziIHLnAf6+HCi5scnj85Esy
uHnPIb5EHILXecNCl95TQU7qzcq1yVkg+E+mmuYWX7jO8eSdXYlUcKTV27hE
RAucewG+Hcu5D4ULqvxr0TzDJdquKI64AyU+8WDNH09gc/etUjM0TwszJ7Of
9q/AAdXyP662ljCJj9PUBs2n849TjJxxIBBcelI1dZs3VM0/kCg2TwXrvbR/
noqOAsur11is5daHXKbvZcXRc9X2Tut0PncGMumlBm92RMDjEmJ952eoQGcb
ba+9BrLXjqZhbk4jcBlcIizRfE68nHbP4LCGkXKz6eulrKHNVFpDIhq/R7M1
YC86BzNdoz3k3R7Bq+Orl5xF44zrGkWkWEeg5LUNppe/tEFLzjNLtk0bg0IT
cn+HwPs7XAXk/k5MCVdHxuUiYHgrp2fbgREILPe0lTg0g9GrJA8Pei+LPDyB
mIenKNbzp5LuU3jFJj4x/rQTdEoO5Y5G9jnYLHyPcnsfDMz7sk8y+xq8BW5J
z6H5zMTOG3lbmIBtA2cu9XTrAqf9p0L70bgv7FXd6rULqHYtf+ontR3Gdrb8
XOQJr3g3HdzCADx/q78SE5IFbyJa3tLHe6JJfY0x+X/ra3DJXD6971A55cJy
6ftCF2oosiYkD60D1onw/49OBOUp1f65wk8iT7XB6rpGFeVE4eDi/3ecdRzQ
Wv6cyHU/tZ4/LoUi0U3y9f0cl40L+lZCBFy0uribM4u4/YvkA9yreYfnl7Qf
Efr5zLO9wmaUN5ivMtSx/EB82H2iQkPZrlsjnrjxkxznoW0J8em/RdjTzn+/
VGf0Dy9oyoIgz0ilG2XLQn/j7TFnYgce76b1JT/yO0l57tDqbdR+jqDh8TCH
rJkOblMKO8No93OGS3T+8sVxJ9qmvCvrJShXGLjtMnW4/8kjmxfWnY07K0R5
Twsa91hxifK/66xcqs7GwTGemUTbt0Ofd8c//8/eNpQR/AIQDq/r5YKMD/0z
frS782KXBsoDzXPabr5FoE1jueuDr9fB8BC57xaK9908x8h9N/1Gc1veyQrg
NL0l7nrHKHj159BGy9bvoAHzIOWHkzxIZzEP0pztYepFy4fQ3uy+uLW1FqgZ
VQz2QPM0qOP4kNKhAqv2dapnHj8FnX8UbaPzQl/C+hTDL/6tTxEQK29syF5H
6exYt2LvOUa47ojl4vP6sYW7Dpi3UmpZrrzPcm4lOg/NLI5L8v8yyTLIocwo
ih9x4jYj4t+Q9lH+abJ8nfVLCtP0R+HVxi8p8ZgXetUyrcK2WnmC9uBrv8GA
O8UM2zOJVpEvqmRI2NJ4L6RH36BQ8fhb2ppspStXiGsM4wqvISDm8bi0pXJr
XBYVzla80rnsCkHogALv7AUVoIP3EzdWk/uJjnfJ/cTEW9K5Fm6u4MJS7bkU
WT/4lilstQJad2JLN22247gBqFv9Tx8cV4W3um2//UbXv4l1JbT/oyuhItbu
23B6E1BjVP7DoroCPDrwapF/eGFVzsgnhkFKXGvxjZqQnxSJ4I7FeT6msjh9
nTAhhKfe+R67WEtpOEL6v1yDbMwn81jiYLPFx5nBj5S9HeRznZbafXSZTwgx
OBORbrfJlrIB847a0I6/lclyIr7TNGnfTE2JN9gOarTBTU2rNYl02pq5Hjlj
4n9225HioRn8ZAQwi+kKLWltgVK8TiVP++XATYyrS3oxrr5A4uqQI57rq1s8
wdMjNSeSt4cBcz/9pXJ/UP18ty/G+oAwNJQXufB7vzkY4f0lM4yuT2A9iH6f
f+tBDAXd3vR2dCskojYQLXy8QEjJ5Dd93KVG4daZ+0uhfWdigGLcOOX8peDF
eQL28vF0725ij/vstkbxJ0TcCpLXffWj+/ah2tkE05sD+y+tSSF0/bB9zPZf
XgteEjm/RCS8tSIJYgrzNs8lDIQ+vUIML2y0ZZbwIz7ieFJHyzkZqqRLsadV
M93usiNysX1E85rCj8f0QmuPp4L13v0gb+umGPmQ42ATrgu24LpgBNcF3RXR
OSFzUdCl7Og9MQcvuJwphvnELypoPNj5qVrDEv46d6FviaMRNL28aWMNvV9e
SOo4lGIdB1ms43DLXVE4mYkPfuSw11a13AuD734fo48vu/eOIzF1nKDyL2/b
k7wGKjKyLs6TOxaWBKYGUBQ11ruBpWPEmpEfi+M+nNv0pnanUqIU9tTcfPCd
8P5D+lXYQHrXUF0Uxb11tdOMTgKR3o/5qOd9lcpSAin1f7oXfk4/IebnyHFr
2ovIXcEPKRw0Wh9bzR3iAbaPyWu+rVO368Fy6pmXHwtHYWH5uDjHZwAu4P3c
y3g/lz2F3M+VUN4/JyNgD2Ky22Yqck3gt5nZLV/pvMRYZ6FXmNRZuI51FpiS
7aRqzMUAn8haT1btTVCmc6B7MZ7ohD3KitgIsl+Lnu0610vkMFot5p3nn++a
GWpMUD7+bK8/r/GEohQ4sDhPV/6O5kn3GsrF9WuDHwTGUgKUSTvo1rkHc8ym
UYzKXq9eX/GawtOA88isw94a4dcU9dnnTtSLTygUzKMuRVMz1kZ5ZBmtgFmS
8oByEtuhFpgqi8mMSU23e1fQf+959iVL11sSHMX4nx/j/+sbSfzP8Sw6ZFvZ
sBTr8WKpTcg/giwM94sJxyCPJXmovDAPFUWa5KHi7gsr5tsfI0Vl2X4w9V0i
OOI7zBk1hta7YP/JqDPWUlUUJV/zHifgtbz+VwK6jxfWU1D8j57CiITyd9Hu
vVJTD5cNzDIcBq7Co22LPL2h2i3q3ExSJw77sWZ4sYOOfJFFe765Zrl+q1Gf
ZFz41ZdX1k5RZBV7Fp/3+BvNQePMPMnyta8/vnhbR7GmkXjgW/k7Ly6zKEnx
0JCrB7W/UnZVkvapnGHuyjN7LFlapq+Wmh5OeYj5vRUcYn6pvbgrGd8csnd1
xGPKQWzP5mWK+RO362Glzrt2ul+tGmDWZEd+1Y33zV3xvvkbvG/+6L7b77Ol
0fCKz1p4xD8cZnslzf4ZR3Ejfznd3+DeinO1DcjfdPZNLPpbIdZB8P2PDkLb
nvt0f4NrxtrduZG/ubST/sap857ub1DnJav5JPK3T//4mw3d3wi3ydc2Cpf/
9rcaur8Rl9a3hRr/y9+e0P2NMCorecn4L38TofsboT57KWboX/6WT/c3Yhnt
8s/Df/mbyK2sYhDTC4QlvjQ3oLiU7CAjIIfikh7efz+O99893pP7778Yb+Si
uARODiYc24ni0rseaxZ6XBLk+0mPS2D+5pbRWQcjKP2EezEuhWL9AmasX9CP
9QsSf76hxyXQ9sQr8ByKS+yWZFxSvfeGE8UlivMOv4OCKC7dwHGJMzYhDMUl
4kxTZy8FxaW1/8QlAQMUl4goBT/hW/+KS6e6UVwi3FsPN87+Ky550+MSUf+H
2WXqX3HJkR6XCA5aQsrmv+ISte3wuedPRuA+xXeKTCiv6V+kcD9BeW0X3n+/
hfffLWTI/ffVe7Q3oLwGtbaYl31Eec13eNcyel6jnDL5iPIakC6xGZhGea2c
fXoxr7Vh3QGv/+gOFATepec14Lejg70N5bUHp8m8ZlbjTs9r4Gino4oyymsK
/+S1CXpeo2i4D+1Q+f/zGoXpjdpS1f8/r1FyfoUc8/r/8xpleOFs7Op/5bVk
el5DeNgq/tZfee3+7frtCBcB2eu/NDwQLoKzdnkzCBetwPv+N/G+/+kIct8/
5mYdJ8I/MK7Pb+Iwwj+tgiT+uYF1AQT/owvQfK+Djn/gLuZE9ZUI/1Ri/MPB
RAwj/ENkvWJhrEL4B/yDf5Q4MiZMKMIWav5S/8I/zO8R/qEcbD64bfZv/JPR
K4nwD2VwZr7c5W/84yAfg/AP5TutMijzX/inn45/KOm0pBddf+GfiA/rn3Zr
UKHEw3NnjBHelmbLHHZAeNsEnxOIwecETo+T5wTylzRu2T5ZAfem5ynT8bad
SdfO+whv88sI0XE16Dqq1fcQ4eptt08s4moz0610XA34rNOSPiFc7ShZvIir
qxZInv/WV//m+f8RE3QL4WoiRZuZWQjhai6Mq33ZKlwQribqWAwf5PyNq7uB
KcLVxKziI6+8f+FqpyUIVxNM0xMeK/6Fq8/pt9fKU2gPzJz0/4WruQsQrqbY
0vKXff0bVzssy0W4mnKNIb0w8C9cHbVU6zuFdQTYNNu2nkX1bw0hzrId1b+r
8HkG1lbyPMMPfJ6hJL64H9W/0OqqWRe9/s0fGeil178nMM/YUcwzpo55xjqb
u8LO6b6DbcRqr5LrjlCyzFa2B9X1etrL76A6F3o4hU62ojq3Z1Jxsc491pRO
r2dhdKTWmYOonj30kaxnL2Oe/zP/4fk/9DSQXp9SHqne4dFD9akMrk9/ji+n
16GUQHb19/x/1aGo3jyG6k1KhYbOqs6/6s2UBR56XUlsWbjXpPtXXRkGA2dR
/UiwMwzuffpX/bh5IU0T1YnEe1p0q9tfdWI2NHiL6kGKQ7u3/t/14KPrPfpO
I33QiTLRI6naBzY18114+dkZRLCS5z368XkPooA878GI+dA05kg+NAvMh9Y9
AOn9BPBiVfDwu9NO8NzRxsV+wtykCL2fADaFsVgeyb4GffvIfkIQsdg3gO4M
jMn+Utvh3Q6ybzBM9geIlf/h8+cj+wPE5RMdaQJ/9QdwvU/JdY/euv2veh/X
9ZTQIwejDv5V1+P6HeHwA1Mqf9XvuE4nnsNHq/6u03E9TlxhMCpP+qsePxX5
KkfwAxUKrcyPbmTKhk4NHLe3ypqDZZj3TDKG5D3beoHkPRPVIvn5ozE/P8Mx
kp+/VOd7xSvuA3DXiiKLnptX4IleGRrdPuq0c51Bm3eCLSuWlqR78MFNOscW
damKcP+k4j/9k8s3+dzKp5oI26VZzLecE4mtnKR93p6/ujfG9AWxcqokK2Qy
iHiDcZHnsMgFiacmhDljdEvZ47tEI37erTE0Nr28pYQMTcGpflLrH72DVhr/
6PuGE5TmuRfmb0uP/sMjR1t4JnPxyX7KSwYtMxa9nf/Yp3RhXzZnKBXkLBvw
UE/PgWfYOcUuaeuA6T6S561ZjuR5uzxJ8rzt2OqyoJtgBOrNFM7wMdwCh897
SNPx7G6zudn4M0uAw7n8oo0HZQBnf18cfT43cF/I9j99oRX1HQ4lj6sowd32
tdZHqMSCEXVx/t9fPC/5Nh9DcUt3KxlP+ULsLCWf6/v29csGLvpRLLLbWTqO
BRCjOO+vpQF+Gorzq39si01NUycSsB2qF6zFBLluUCQZNAZsjLQov/D4w+Xj
XmwVvIQVLfn75zDVf9bdEM02t4JLmvg6L8T30F3kH/vY9AlkF5mMwF0c/Nf8
LrcCu+ni6vutF4Au5q/bKUDy1/lkkPx1Eu/kttTfc4HWXFeibihdA4axXPmv
6HHDP13t0Nx5+FyP487M+ZOwnqtXkR7/xXFfpeE/fZWM+/pbchgZQKntgPeB
K4MUzk+pi/N0ntm74n1cNaVISP/XVr90SvE5Mi41/xrY3v44icI46DFawPKe
0tNOPtfTwddsq1e6UkxmvSjfvEOQX5DjVkuWsnyqNiSWO3w8NC3pTPlffsyk
HWz0LjQkBBcE+A8vv0z5icfv0sQCr0ZcJrIYnJV6l578J/4HHDeqYmntBQzn
SteUaPZDyp+H39YQimDbOpKv7zjm63uJ+frk+UJqudlcwC/11e/Xv3kKg4vb
TJ+i+LPpOsPM1HUdMPZi33rDehW4P/OeGl1PRAX3VSz+01d5+vFExLmJPwTj
hf5QLeM1YP71r0W/2rXZOb+8oIRIPr2pq4BtgHJXhNRt0fSzXbP3bQYx83mz
xAXlQsoaCXL+mn3P7gaeiSceZsfu+h4ZThHA+jiM9nrtbS+eEzdlaNtU+AQp
1RhX5CwIPlW0eEAwM6wMVlC4R8RjO3xfuHFnZps6UUxb17Gu8f9whafhod+S
QQ0wp1Xl989Ho+AbFzPbJk1Z0POa5CH0wDyE4gkkD2HA+MunrDVu4NDugxsP
LAkFTOeHhWcQ/jw0ePiaS+wBaOsbN3HSxQxodihl0dddOu6rNP6nr7K67cTl
c4Uc0Cn5fVYqbTXM2M22iLuSk1+65X2dJs715jTo3mwhTCIbF+e5R9xgy/m1
jUQH99ohw4lCwnd8jlxfh2BsX1kaEZPV7kQT+Uys+IzX3YRLfiO3L/Hgd33K
BZZIgjqN8RWb9HemzVKUmYXKp81KvkTt/+I5A8Ohpy36FG3aFtmYGlsiD9vH
fWWksHJeCPCubZkSnafC42lb41STASiKI3kUozGPonEhyaO4z0vg0QlTC+jW
fMYhQMgI5uq3ttP1fYZx/yT3P/0Th9IruawCHGCy+NVdKyteSL0cu6izZmgd
uOT4pSHK7Y+y4vlMy2CSV8jifPziWgNZoiopL6Z1VmnV9hDSDKRe1SqTggGd
2UyKtcP2bXmW+US8Ajn/TyOGZq8GYih2nfUumyjRxAWsC+Y///UH00AgpfkP
TXd3pSdxBvuPFW3/0GeDh5Tohf7doeH6hAu2wzHP1PVry2tBXyRTXzL7GDDm
2igwdekYkMbniObxOaIGfI4or1SHJeiJHSi7MLTl8swd6FZ3dZag5yPcP8n6
T/9knXiyatHUdpBznpeQVeQD7098WtT1e1N92IeflQm838AeIr1piqLPKrc4
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
48VFsSKFIOuXAkW0KAc6N6q0jbUPgi/kwIorb7yBnUaPvKybP9ypfU59NTrH
GKagpW+faACRnJyrZ10N4Na+cKtB+v1AM6OuRZXyf+tacFJrcqWfdJDieQ94
1wU0k2usGH1sM64QVVUv8skje6VTdF9CcsluxnzaDNolxc4mkEY/aEOWkcFk
DO6XvWD6YhKXxRNSfibFp6HSijyF+dOGNkUNoTmTNTMOv8n2g3/58wnGJz/n
4BP+O7fkNfO8QekeX/Xx4vugPV7vsvUM0huLjr9YtVoLkEePOwafUQbVn6Wu
0vnTBNevWKP03/oV1xaYqsIzbsQZrZZk8/J88q4R47/2datFKfucyY0GU7fd
/d6QccMMOjGz/4hqmROZNXPw8VNvH9IE8/Nb2sWI9mBL0o0GVBQvWvytYyAr
HLyrfskpuEiQffCI1FXwTLtlPv29wtOJUV+ieE59iedJqqWfDwQThSaxOZEB
z0gTbBeW06SW3S4yIWZmtLxUs9zJ/Xj8aqYW6dFPh8lch+Ih5kpzshnTwfbv
VhsIVdgZ5LzbIksJ7su0nkev8zCM6zxIzKnzYOtQv2Qs2oEQZdrkeED0Opnx
Z/8dHAWWf1EjaLCmzL7mf3UY7hquX7Zc4AxoHFyquJIFwCie1Zl0uViL6yfk
zamf0PtW/PM34wuEidApFeHjO//qbUdcH+DynPoArZqMex7def+955na3LG5
uCiJCJoOsuAzoZC+2Qw+rHnCuLeJmHNvY9hjs0/VeoywVS4d1eb6Torq1c7S
K2iZhoknK4nxX9VuN+E9okCWIY8y+N7Gpee/9zZa4fnPhfaOEJ+vPw8b/rUI
bA6WmaVbW6mv2hz2ibhtdrCW26yfqF43PEs3vSH5gpM/hdQI85h3ZeIrMbia
MY4Svrf58fm/9zZ+y+W4Lh9fA98XUFa6nFwE3v82n70nCRAO3yxxboZkS18A
romUEwc4cme/f5/Q+UIsrol8nt2YaewISepyXJ8n3hMoLE4nmeRNDVQ3pZBf
Ehjjm+J7m7tz7m1WY3yeNQefe/Ft7n6QtgwWDF+apLJtgZw1E7P3A/4s3EQM
rY78+mLza/WN7LAbKM+OI+9/cWStIyT2cd0YeH+ul1zR94sxH0WTzbE+aQTT
zdfjftaFZMMmPJ8+iUAOmWjCoaXHKSUkhpzuZdB98H3O7jn3OXPjTv/0G/qM
83T24jydUJynU4zvf7rO/vf+546YAcv71h2gz/sr97gNBxSh9PfM+ndcpJ+V
GTdQ953MH7OoJPkso2f50GWFNudNlZ+EfabTEFfaB0Kpt3d2Pr8/rNs2z6mc
0GNxNzu4/R1Bu8Pgn+U1EUd0vyUTb04HpOr7hBKxdYz5X5mobgkNf0FkaG6Z
Xx/oTdhjfb4f3/+4zLn/kc6rPiUbGqUwxCG8M+n/ujrzoCauAIyDohwiVuON
LdSCSks5huAxm3lrAaVQhxZBpNVaGW2pIkKxaJAqRSBETkFBqmA6EUEmjCCC
iIVdrTV0RAWRS6WIEYQKchUVUbEh73Om3X8zO/s2m03m5Xu/7/3yitkVaT1z
8/u08/Pbj7deypdK6smatLCOaDbRoPlZkfb4+t00//EQ5D+Op9selofbSIbj
JnaP6i1j4+yetOnmA8iFklf+PxcKstDf0RM7WeK6LH1GZeIstl1tr7sP8v1H
GqptOxiVcmP2BrOnxNWzQ3ed+e5Vjdt+vsLcNFOcPX6yiUS8od/TCyM5BokP
chnnE8c2OgX8Rhbdou/rtf6WBvfpB5maG9v8yi4qSRzmUa9mDJkvHQllCu8d
szXJTSJOuA+Ve1Tumk2WvP/VwXVlUms+tuu47jlsqaY5z9eCnOe7A591/cJ8
wLKaH6dtlMzlFZOePB9//exW70jT8pfEi7FxO1IzkU8x3Kk7fugnmvMQQc5T
8bjF+9QWEzbebOkd9dC7rOJNne53bMwitinAc5Tcb7vSedT0Kakzr6Dn+fbO
Bdtr7cQgUX0mNKKCtIa8pPcHOc9mQc5Tf6jT+dEuEa92ViXFMIPE0GiX7j6f
cXFKWh3WwzkYNXbf+qiX+DR00esRey7sX5/HTb3akzxh+W3SLKPPW/Oc4idh
slwyPcdaZehWQtI66PmDkfMsFuQ89uAEesMoJ1AMTuAY8h9DQf4Tub1RNHNP
MdkwutZ8b7ABn5F9VHce8f6ac2lVzVxh8J2QsmVtnAdD88C4rWPSlY6/cwnl
vuIh18NcrYqOW1Hi62JSlcMNnfdS2EiziDM+9+jRo/vmrxVz+rxJasDseBKJ
z70I+c8+Qf6zHn2iaegTWaBPlNGpabo2NY9fUHg6yWgwmu+94Tl11oj2ORRl
XLLODuHvnup2lZsGsg8sHWeP798VglzIVJALDbcuXxXyxwCxSo9Yd72lkQQf
6tWN68YsadQvqCGWsoKyd0qruExjej25B77RizE+QBrTNzy4EVLImWKecJYE
p1hJ4zjLsVVFUYUxnC2u/1dFm1JhFcpNu/T5vYhsH9KH16dHRe34stuRK1CY
j5qn+/3nfxz12B4UeGyPgEc9Bx51AaE86nV4sV3gxe6GF9sfXuz18GIvgRe7
Dn1tvSra136EvnYJ1mETsA5rMEzXYZPhEb4Aj/BNeIRnwiNcCY9wAzzCX6BX
W1tLe7V6J2mvtkotazUu7+f72kfmZE65zCqru07Kb7uwIqzj92Ed/yo8GsL9
OiZjvw5hnvPW+6mHdZ+JLF338cN+1AHWrxntuGzmXpsrp7XjcqrVbuPjtgt6
TKvQY/IrplxlLLjKUHCVDujFs+jFN6EXnxCVkq2dh/OB7wd52Gvn4e8tLy0b
n4fXgYsbBBfnMZNycTtfRRZlDbRLRJ9ck8x+1s9mhQc5iO0K2BLkQonIhVh4
8UaQC9kKvHjbkQsdRi6kQS4UA07JG5zSMDilYXivUuG9yoD3anEO5X47XlHu
d1IB5X474JmSgeNl4ZmSoWe6Ez3TDPRMHdDrjEKvczu8SKnwFnnBW3QX3qII
8JwaA8pzOr6gPKcfuEoncJXRlZSrfAo/wm74EYzgRxCD3+sFv1cNfi8JPN6H
4PHEA5THe8vLbf6Bri/I4St520//Cv10B/TTGXA7ylLK7cSD22Gydj9TVtZI
/oQnogmeiCG5peNzX41k5H5yne7393DF5cBkhlUL1sEDRHQdfAB+Bxv4Hezh
d7BALncXudwu5HJnwOfUg8/pB5+jhMdBDo/DP/A49MKDMAUeBGd4EFrB700R
eFK2Iec0Q875EDmnKXgJFrzErI8pL2GFfdqDBPu0S5ETEuSEJcgJ9wr6TSno
N/miFz+mor34PvTiF2F/eDvB/vD+F4sS+ZJU9vvWU6WfnshnF/6tMV6j/T6d
R++1SdB7zZvhs9JeHciKvE7s0PeX8/M6J03YMj4PfLEpU5aax5aG5/wVsCKN
9zNzn6fRnmd+bWNpiiSBz9F4P2+JkLLmC33C7bTH/wt1Lz3S
    "]],
  Axes->True,
  AxesLabel->{None, None, None},
  BoxRatios->{1, 1, 0.4},
  DisplayFunction->Identity,
  FaceGridsStyle->Automatic,
  Method->{"DefaultBoundaryStyle" -> Directive[
      GrayLevel[0.3]], "RotationControl" -> "Globe"},
  PlotRange->{All, All, All},
  PlotRangePadding->{Automatic, Automatic, Automatic},
  Ticks->{Automatic, Automatic, Automatic}]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["Bias Corrected Estimator", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{
   FractionBox[
    RowBox[{"z", "-", "y"}], 
    RowBox[{"x", "-", "y"}]], "-", 
   RowBox[{
    RowBox[{"(", 
     RowBox[{
      FractionBox[
       RowBox[{"z", "-", "y"}], 
       RowBox[{"x", "-", "y"}]], "-", 
      FractionBox["y", 
       RowBox[{"x", "-", "y"}]]}], ")"}], 
    FractionBox[
     RowBox[{"x", "+", "y"}], 
     SuperscriptBox[
      RowBox[{"(", 
       RowBox[{"x", "-", "y"}], ")"}], "2"]]}]}], "//", 
  "FullSimplify"}]], "Input"],

Cell[BoxData[
 FractionBox[
  RowBox[{
   RowBox[{
    RowBox[{"-", "y"}], " ", 
    RowBox[{"(", 
     RowBox[{
      SuperscriptBox["x", "2"], "+", 
      RowBox[{
       RowBox[{"(", 
        RowBox[{
         RowBox[{"-", "2"}], "+", "y"}], ")"}], " ", "y"}], "-", 
      RowBox[{"2", " ", "x", " ", 
       RowBox[{"(", 
        RowBox[{"1", "+", "y"}], ")"}]}]}], ")"}]}], "+", 
   RowBox[{
    RowBox[{"(", 
     RowBox[{
      SuperscriptBox["x", "2"], "+", 
      RowBox[{
       RowBox[{"(", 
        RowBox[{
         RowBox[{"-", "1"}], "+", "y"}], ")"}], " ", "y"}], "-", 
      RowBox[{"x", " ", 
       RowBox[{"(", 
        RowBox[{"1", "+", 
         RowBox[{"2", " ", "y"}]}], ")"}]}]}], ")"}], " ", "z"}]}], 
  SuperscriptBox[
   RowBox[{"(", 
    RowBox[{"x", "-", "y"}], ")"}], "3"]]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  FractionBox[
   RowBox[{
    RowBox[{
     RowBox[{"-", "y"}], " ", 
     RowBox[{"(", 
      RowBox[{
       SuperscriptBox["x", "2"], "+", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{
          RowBox[{"-", "2"}], "+", "y"}], ")"}], " ", "y"}], "-", 
       RowBox[{"2", " ", "x", " ", 
        RowBox[{"(", 
         RowBox[{"1", "+", "y"}], ")"}]}]}], ")"}]}], "+", 
    RowBox[{
     RowBox[{"(", 
      RowBox[{
       SuperscriptBox["x", "2"], "+", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{
          RowBox[{"-", "1"}], "+", "y"}], ")"}], " ", "y"}], "-", 
       RowBox[{"x", " ", 
        RowBox[{"(", 
         RowBox[{"1", "+", 
          RowBox[{"2", " ", "y"}]}], ")"}]}]}], ")"}], " ", "z"}]}], 
   SuperscriptBox[
    RowBox[{"(", 
     RowBox[{"x", "-", "y"}], ")"}], "3"]], "/.", 
  RowBox[{"{", 
   RowBox[{
    RowBox[{"x", "\[Rule]", "5000"}], ",", 
    RowBox[{"y", "\[Rule]", "3000"}], ",", 
    RowBox[{"z", "\[Rule]", "4500."}]}], "}"}]}]], "Input"],

Cell[BoxData["0.7515000000000001`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Module", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"\[Alpha]", "=", "500"}], ",", 
     RowBox[{"\[Beta]", "=", "300"}], ",", 
     RowBox[{"p", "=", "1"}], ",", 
     RowBox[{"n", "=", "1000000"}], ",", "x", ",", "y", ",", "z"}], "}"}], 
   ",", "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"x", "=", 
     RowBox[{"N", "@", 
      RowBox[{"RandomVariate", "[", 
       RowBox[{
        RowBox[{"PoissonDistribution", "[", "\[Alpha]", "]"}], ",", "n"}], 
       "]"}]}]}], ";", "\[IndentingNewLine]", 
    RowBox[{"y", "=", 
     RowBox[{"RandomVariate", "[", 
      RowBox[{
       RowBox[{"PoissonDistribution", "[", "\[Beta]", "]"}], ",", "n"}], 
      "]"}]}], ";", "\[IndentingNewLine]", 
    RowBox[{"z", "=", 
     RowBox[{"RandomVariate", "[", 
      RowBox[{
       RowBox[{"PoissonDistribution", "[", 
        RowBox[{
         RowBox[{"p", " ", "\[Alpha]"}], "+", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{"1", "-", "p"}], ")"}], "\[Beta]"}]}], "]"}], ",", "n"}], 
      "]"}]}], ";", "\[IndentingNewLine]", 
    RowBox[{"{", "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{"Mean", "[", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{"z", "-", "y"}], ")"}], "/", 
        RowBox[{"(", 
         RowBox[{"x", "-", "y", "+", ".2"}], ")"}]}], "]"}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"Mean", "[", 
       FractionBox[
        RowBox[{
         RowBox[{
          RowBox[{"-", "y"}], " ", 
          RowBox[{"(", 
           RowBox[{
            SuperscriptBox["x", "2"], "+", 
            RowBox[{
             RowBox[{"(", 
              RowBox[{
               RowBox[{"-", "2"}], "+", "y"}], ")"}], " ", "y"}], "-", 
            RowBox[{"2", " ", "x", " ", 
             RowBox[{"(", 
              RowBox[{"1", "+", "y"}], ")"}]}]}], ")"}]}], "+", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{
            SuperscriptBox["x", "2"], "+", 
            RowBox[{
             RowBox[{"(", 
              RowBox[{
               RowBox[{"-", "1"}], "+", "y"}], ")"}], " ", "y"}], "-", 
            RowBox[{"x", " ", 
             RowBox[{"(", 
              RowBox[{"1", "+", 
               RowBox[{"2", " ", "y"}]}], ")"}]}]}], ")"}], " ", "z"}]}], 
        SuperscriptBox[
         RowBox[{"(", 
          RowBox[{"x", "-", "y"}], ")"}], "3"]], "]"}]}], 
     "\[IndentingNewLine]", "}"}]}]}], "\[IndentingNewLine]", "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"1.01236938405537`", ",", "1.0260365880201607`"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{
   SuperscriptBox["x", "2"], "+", 
   RowBox[{
    RowBox[{"(", 
     RowBox[{
      RowBox[{"-", "2"}], "+", "y"}], ")"}], " ", "y"}], "-", 
   RowBox[{"2", " ", "x", " ", 
    RowBox[{"(", 
     RowBox[{"1", "+", "y"}], ")"}]}]}], "//", "Expand"}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"-", "2"}], " ", "x"}], "+", 
  SuperscriptBox["x", "2"], "-", 
  RowBox[{"2", " ", "y"}], "-", 
  RowBox[{"2", " ", "x", " ", "y"}], "+", 
  SuperscriptBox["y", "2"]}]], "Output"]
}, Open  ]]
}, Closed]]
},
WindowSize->{1855, 1028},
Visible->True,
ScrollingOptions->{"VerticalScrollRange"->Fit},
ShowCellBracket->Automatic,
CellContext->Notebook,
TrackCellChangeTimes->False,
FrontEndVersion->"11.0 for Linux x86 (64-bit) (September 21, 2016)",
StyleDefinitions->"Default.nb"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[1464, 33, 435, 9, 99, "Text"],
Cell[CellGroupData[{
Cell[1924, 46, 26, 0, 44, "Subsection"],
Cell[1953, 48, 53, 0, 30, "Text"],
Cell[2009, 50, 1223, 33, 148, "Input"],
Cell[3235, 85, 51, 0, 33, "Text"],
Cell[3289, 87, 718, 16, 34, "Input"]
}, Closed]],
Cell[CellGroupData[{
Cell[4044, 108, 45, 0, 37, "Subsection"],
Cell[CellGroupData[{
Cell[4114, 112, 1135, 37, 77, "Input"],
Cell[5252, 151, 710, 25, 55, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[6011, 182, 35, 0, 36, "Subsection"],
Cell[6049, 184, 103, 3, 30, "Text"],
Cell[6155, 189, 3983, 110, 366, "Input"]
}, Closed]],
Cell[CellGroupData[{
Cell[10175, 304, 42, 0, 37, "Subsection"],
Cell[10220, 306, 390, 9, 28, "Input"],
Cell[10613, 317, 165, 3, 33, "Text"],
Cell[10781, 322, 1160, 36, 36, "Input"],
Cell[11944, 360, 91, 1, 33, "Text"],
Cell[CellGroupData[{
Cell[12060, 365, 1103, 32, 80, "Input"],
Cell[13166, 399, 2166, 64, 38, "Output"],
Cell[15335, 465, 1240, 41, 52, "Output"],
Cell[16578, 508, 1071, 36, 52, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[17686, 549, 241, 7, 34, "Input"],
Cell[17930, 558, 314, 10, 50, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[18293, 574, 41, 0, 36, "Subsection"],
Cell[18337, 576, 94, 2, 30, "Text"],
Cell[CellGroupData[{
Cell[18456, 582, 32, 0, 35, "Subsubsection"],
Cell[CellGroupData[{
Cell[18513, 586, 325, 11, 28, "Input"],
Cell[18841, 599, 170, 5, 50, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[19048, 609, 203, 7, 34, "Input"],
Cell[19254, 618, 155, 5, 54, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[19446, 628, 53, 1, 32, "Input"],
Cell[19502, 631, 730, 25, 55, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[20269, 661, 382, 12, 34, "Input"],
Cell[20654, 675, 86, 2, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[20777, 682, 302, 10, 34, "Input"],
Cell[21082, 694, 109, 3, 32, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[21240, 703, 48, 0, 30, "Subsubsection"],
Cell[21291, 705, 102, 2, 30, "Text"],
Cell[CellGroupData[{
Cell[21418, 711, 311, 10, 34, "Input"],
Cell[21732, 723, 1975, 61, 81, "Output"]
}, Open  ]],
Cell[23722, 787, 71, 0, 33, "Text"],
Cell[CellGroupData[{
Cell[23818, 791, 444, 14, 55, "Input"],
Cell[24265, 807, 32, 0, 32, "Output"],
Cell[24300, 809, 50, 1, 32, "Output"]
}, Open  ]],
Cell[24365, 813, 73, 0, 33, "Text"],
Cell[CellGroupData[{
Cell[24463, 817, 435, 14, 34, "Input"],
Cell[24901, 833, 50, 1, 32, "Output"]
}, Open  ]],
Cell[24966, 837, 107, 3, 33, "Text"],
Cell[CellGroupData[{
Cell[25098, 844, 384, 12, 34, "Input"],
Cell[25485, 858, 3721, 114, 162, "Output"]
}, Open  ]],
Cell[29221, 975, 44, 0, 33, "Text"],
Cell[CellGroupData[{
Cell[29290, 979, 501, 16, 55, "Input"],
Cell[29794, 997, 83, 2, 32, "Output"],
Cell[29880, 1001, 132, 4, 32, "Output"]
}, Open  ]],
Cell[30027, 1008, 95, 2, 33, "Text"],
Cell[CellGroupData[{
Cell[30147, 1014, 1371, 42, 57, "Input"],
Cell[31521, 1058, 35, 0, 32, "Output"],
Cell[31559, 1060, 35, 0, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[31631, 1065, 309, 9, 34, "Input"],
Cell[31943, 1076, 10822, 289, 629, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[42802, 1370, 86, 2, 32, "Input"],
Cell[42891, 1374, 1383, 43, 81, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[44311, 1422, 430, 13, 34, "Input"],
Cell[44744, 1437, 35, 0, 32, "Output"]
}, Open  ]]
}, Closed]]
}, Closed]],
Cell[CellGroupData[{
Cell[44840, 1444, 43, 0, 37, "Subsection"],
Cell[44886, 1446, 95, 2, 30, "Text"],
Cell[CellGroupData[{
Cell[45006, 1452, 1097, 35, 59, "Input"],
Cell[46106, 1489, 844, 26, 57, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[46987, 1520, 271, 9, 34, "Input"],
Cell[47261, 1531, 581, 19, 51, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[47879, 1555, 636, 21, 59, "Input"],
Cell[48518, 1578, 581, 19, 51, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[49136, 1602, 91, 2, 32, "Input"],
Cell[49230, 1606, 417, 8, 23, "Message"],
Cell[49650, 1616, 92, 2, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[49779, 1623, 241, 7, 34, "Input"],
Cell[50023, 1632, 28, 0, 32, "Output"]
}, Open  ]],
Cell[50066, 1635, 61, 1, 32, "Input"]
}, Closed]],
Cell[CellGroupData[{
Cell[50164, 1641, 45, 0, 37, "Subsection"],
Cell[50212, 1643, 109, 3, 30, "Text"],
Cell[50324, 1648, 695, 23, 59, "Input"],
Cell[51022, 1673, 83, 2, 34, "Input"],
Cell[CellGroupData[{
Cell[51130, 1679, 368, 11, 34, "Input"],
Cell[51501, 1692, 378, 13, 52, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[51916, 1710, 314, 8, 34, "Input"],
Cell[52233, 1720, 775, 26, 58, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[53045, 1751, 347, 10, 34, "Input"],
Cell[53395, 1763, 866, 28, 53, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[54298, 1796, 301, 9, 34, "Input"],
Cell[54602, 1807, 1226, 38, 54, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[55877, 1851, 40, 0, 36, "Subsection"],
Cell[55920, 1853, 70, 0, 30, "Text"],
Cell[CellGroupData[{
Cell[56015, 1857, 347, 10, 34, "Input"],
Cell[56365, 1869, 28, 0, 32, "Output"]
}, Open  ]],
Cell[56408, 1872, 38, 0, 33, "Text"],
Cell[CellGroupData[{
Cell[56471, 1876, 1007, 27, 56, "Input"],
Cell[57481, 1905, 3180, 98, 113, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[60698, 2008, 212, 6, 56, "Input"],
Cell[60913, 2016, 1732, 53, 104, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[62682, 2074, 2535, 68, 225, "Input"],
Cell[65220, 2144, 97937, 1817, 382, "Output"]
}, Open  ]],
Cell[163172, 3964, 50, 0, 33, "Text"],
Cell[CellGroupData[{
Cell[163247, 3968, 1201, 32, 56, "Input"],
Cell[164451, 4002, 13152, 395, 116, "Output"]
}, Open  ]],
Cell[177618, 4400, 1292, 34, 56, "Input"],
Cell[178913, 4436, 12976, 397, 123, "Input"],
Cell[CellGroupData[{
Cell[191914, 4837, 997, 31, 34, "Input"],
Cell[192914, 4870, 237, 7, 50, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[193200, 4883, 39, 0, 36, "Subsection"],
Cell[193242, 4885, 299, 12, 33, "Text"],
Cell[193544, 4899, 370, 12, 57, "Input"],
Cell[193917, 4913, 73, 0, 33, "Text"],
Cell[193993, 4915, 101, 3, 34, "Input"],
Cell[194097, 4920, 117, 3, 33, "Text"],
Cell[CellGroupData[{
Cell[194239, 4927, 409, 12, 34, "Input"],
Cell[194651, 4941, 1573, 48, 80, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[196261, 4994, 236, 7, 32, "Input"],
Cell[196500, 5003, 7632, 216, 135, "Output"]
}, Open  ]],
Cell[204147, 5222, 69, 0, 33, "Text"],
Cell[CellGroupData[{
Cell[204241, 5226, 542, 16, 54, "Input"],
Cell[204786, 5244, 388, 14, 49, "Output"]
}, Open  ]],
Cell[205189, 5261, 213, 4, 33, "Text"],
Cell[CellGroupData[{
Cell[205427, 5269, 732, 24, 54, "Input"],
Cell[206162, 5295, 435, 15, 52, "Output"]
}, Open  ]],
Cell[206612, 5313, 145, 3, 33, "Text"],
Cell[CellGroupData[{
Cell[206782, 5320, 686, 21, 34, "Input"],
Cell[207471, 5343, 18664, 384, 229, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[226184, 5733, 41, 0, 36, "Subsection"],
Cell[226228, 5735, 594, 13, 28, "Input"],
Cell[CellGroupData[{
Cell[226847, 5752, 27, 0, 32, "Input"],
Cell[226877, 5754, 682, 22, 57, "Output"]
}, Open  ]],
Cell[227574, 5779, 79, 0, 33, "Text"],
Cell[227656, 5781, 455, 14, 60, "Input"],
Cell[228114, 5797, 122, 3, 33, "Text"],
Cell[CellGroupData[{
Cell[228261, 5804, 365, 12, 34, "Input"],
Cell[228629, 5818, 478, 15, 56, "Output"]
}, Open  ]],
Cell[229122, 5836, 70, 0, 33, "Text"],
Cell[CellGroupData[{
Cell[229217, 5840, 684, 21, 60, "Input"],
Cell[229904, 5863, 733, 24, 56, "Output"]
}, Open  ]],
Cell[230652, 5890, 161, 3, 33, "Text"],
Cell[CellGroupData[{
Cell[230838, 5897, 792, 25, 59, "Input"],
Cell[231633, 5924, 2052, 64, 56, "Output"]
}, Open  ]],
Cell[233700, 5991, 236, 4, 33, "Text"],
Cell[CellGroupData[{
Cell[233961, 5999, 1392, 42, 112, "Input"],
Cell[235356, 6043, 790, 26, 38, "Output"],
Cell[236149, 6071, 697, 21, 38, "Output"]
}, Open  ]],
Cell[236861, 6095, 114, 3, 33, "Text"],
Cell[CellGroupData[{
Cell[237000, 6102, 1636, 46, 59, "Input"],
Cell[238639, 6150, 5544, 101, 225, "Output"]
}, Open  ]],
Cell[244198, 6254, 547, 17, 37, "Text"],
Cell[CellGroupData[{
Cell[244770, 6275, 1543, 49, 71, "Input"],
Cell[246316, 6326, 516, 18, 40, "Output"],
Cell[246835, 6346, 515, 18, 40, "Output"]
}, Open  ]],
Cell[247365, 6367, 64, 0, 33, "Text"],
Cell[CellGroupData[{
Cell[247454, 6371, 1134, 39, 41, "Input"],
Cell[248591, 6412, 594, 21, 40, "Output"]
}, Open  ]],
Cell[249200, 6436, 57, 0, 33, "Text"],
Cell[249260, 6438, 322, 9, 55, "Input"],
Cell[249585, 6449, 22, 0, 33, "Text"],
Cell[CellGroupData[{
Cell[249632, 6453, 933, 30, 51, "Input"],
Cell[250568, 6485, 1076, 33, 44, "Output"]
}, Open  ]],
Cell[251659, 6521, 43, 0, 33, "Text"],
Cell[CellGroupData[{
Cell[251727, 6525, 270, 10, 53, "Input"],
Cell[252000, 6537, 158, 4, 48, "Output"]
}, Open  ]],
Cell[252173, 6544, 67, 0, 33, "Text"],
Cell[CellGroupData[{
Cell[252265, 6548, 1344, 38, 147, "Input"],
Cell[253612, 6588, 46, 0, 32, "Output"]
}, Open  ]],
Cell[253673, 6591, 51, 0, 33, "Text"],
Cell[CellGroupData[{
Cell[253749, 6595, 4245, 127, 150, "Input"],
Cell[257997, 6724, 145, 2, 34, "Output"],
Cell[258145, 6728, 46, 0, 32, "Output"],
Cell[258194, 6730, 146, 2, 34, "Output"],
Cell[258343, 6734, 45, 0, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[258425, 6739, 729, 23, 36, "Input"],
Cell[259157, 6764, 522, 14, 49, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[259716, 6783, 657, 21, 36, "Input"],
Cell[260376, 6806, 852, 22, 49, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[261265, 6833, 1007, 31, 36, "Input"],
Cell[262275, 6866, 282, 8, 34, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[262594, 6879, 738, 22, 36, "Input"],
Cell[263335, 6903, 1202, 30, 233, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[264574, 6938, 1280, 34, 102, "Input"],
Cell[265857, 6974, 1681, 39, 226, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[267575, 7018, 949, 28, 41, "Input"],
Cell[268527, 7048, 1221, 31, 230, "Output"]
}, Open  ]],
Cell[269763, 7082, 1418, 45, 71, "Input"],
Cell[CellGroupData[{
Cell[271206, 7131, 614, 19, 36, "Input"],
Cell[271823, 7152, 1487, 35, 233, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[273347, 7192, 486, 16, 36, "Input"],
Cell[273836, 7210, 915, 25, 34, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[274788, 7240, 700, 23, 36, "Input"],
Cell[275491, 7265, 399, 8, 34, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[275927, 7278, 403, 13, 34, "Input"],
Cell[276333, 7293, 3639, 72, 226, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[280009, 7370, 1340, 40, 41, "Input"],
Cell[281352, 7412, 1264, 43, 79, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[282653, 7460, 587, 20, 41, "Input"],
Cell[283243, 7482, 26907, 453, 236, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[310187, 7940, 96, 2, 34, "Input"],
Cell[310286, 7944, 48, 0, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[310371, 7949, 1376, 44, 83, "Input"],
Cell[311750, 7995, 1793, 49, 49, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[313580, 8049, 1457, 44, 53, "Input"],
Cell[315040, 8095, 1315, 42, 58, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[316392, 8142, 1556, 48, 61, "Input"],
Cell[317951, 8192, 61, 1, 34, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[318049, 8198, 1054, 32, 34, "Input"],
Cell[319106, 8232, 3283, 94, 49, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[322426, 8331, 4103, 111, 363, "Input"],
Cell[326532, 8444, 38566, 708, 226, "Output"]
}, Open  ]],
Cell[365113, 9155, 154, 3, 55, "Input"],
Cell[CellGroupData[{
Cell[365292, 9162, 1268, 38, 53, "Input"],
Cell[366563, 9202, 24772, 417, 233, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[391372, 9624, 2663, 80, 96, "Input"],
Cell[394038, 9706, 48, 0, 32, "Output"],
Cell[394089, 9708, 48, 0, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[394174, 9713, 59, 1, 32, "Input"],
Cell[394236, 9716, 48, 0, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[394321, 9721, 1007, 32, 53, "Input"],
Cell[395331, 9755, 749, 26, 67, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[396117, 9786, 1417, 46, 78, "Input"],
Cell[397537, 9834, 787, 27, 67, "Output"]
}, Open  ]],
Cell[398339, 9864, 1405, 42, 34, "Input"],
Cell[399747, 9908, 2143, 67, 118, "Input"],
Cell[CellGroupData[{
Cell[401915, 9979, 412, 12, 34, "Input"],
Cell[402330, 9993, 28, 0, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[402395, 9998, 633, 22, 41, "Input"],
Cell[403031, 10022, 152, 5, 49, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[403220, 10032, 211, 6, 34, "Input"],
Cell[403434, 10040, 660, 22, 49, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[404131, 10067, 945, 29, 41, "Input"],
Cell[405079, 10098, 517, 15, 41, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[405633, 10118, 1253, 38, 34, "Input"],
Cell[406889, 10158, 1421, 44, 37, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[408347, 10207, 1497, 45, 39, "Input"],
Cell[409847, 10254, 373, 11, 35, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[410257, 10270, 975, 29, 47, "Input"],
Cell[411235, 10301, 915, 28, 41, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[412187, 10334, 69, 1, 32, "Input"],
Cell[412259, 10337, 50, 0, 34, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[412346, 10342, 1141, 34, 50, "Input"],
Cell[413490, 10378, 124, 2, 34, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[413651, 10385, 378, 11, 80, "Input"],
Cell[414032, 10398, 50, 0, 32, "Output"],
Cell[414085, 10400, 30, 0, 32, "Output"],
Cell[414118, 10402, 30, 0, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[414185, 10407, 1430, 42, 62, "Input"],
Cell[415618, 10451, 90, 2, 50, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[415745, 10458, 1228, 38, 62, "Input"],
Cell[416976, 10498, 455, 16, 67, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[417468, 10519, 349, 10, 34, "Input"],
Cell[417820, 10531, 7529, 134, 236, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[425386, 10670, 731, 20, 79, "Input"],
Cell[426120, 10692, 5991, 110, 215, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[432148, 10807, 54, 1, 32, "Input"],
Cell[432205, 10810, 51, 0, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[432293, 10815, 1252, 37, 34, "Input"],
Cell[433548, 10854, 2226, 65, 38, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[435811, 10924, 1230, 36, 34, "Input"],
Cell[437044, 10962, 1090, 32, 49, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[438171, 10999, 369, 12, 34, "Input"],
Cell[438543, 11013, 8980, 155, 253, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[447560, 11173, 733, 24, 57, "Input"],
Cell[448296, 11199, 11050, 192, 237, "Output"],
Cell[459349, 11393, 8198, 145, 230, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[467584, 11543, 872, 27, 72, "Input"],
Cell[468459, 11572, 873, 27, 64, "Output"]
}, Open  ]],
Cell[469347, 11602, 155, 3, 33, "Text"],
Cell[469505, 11607, 915, 28, 72, "Input"],
Cell[CellGroupData[{
Cell[470445, 11639, 698, 22, 34, "Input"],
Cell[471146, 11663, 606, 18, 61, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[471789, 11686, 1278, 38, 34, "Input"],
Cell[473070, 11726, 126, 2, 34, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[473233, 11733, 764, 25, 34, "Input"],
Cell[474000, 11760, 903, 29, 50, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[474940, 11794, 1373, 39, 147, "Input"],
Cell[476316, 11835, 46, 0, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[476399, 11840, 2911, 83, 149, "Input"],
Cell[479313, 11925, 528, 9, 23, "Message"],
Cell[479844, 11936, 139, 3, 32, "Output"]
}, Open  ]],
Cell[479998, 11942, 27, 0, 32, "Input"],
Cell[CellGroupData[{
Cell[480050, 11946, 1454, 40, 80, "Input"],
Cell[481507, 11988, 8778, 155, 223, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[490322, 12148, 2207, 68, 57, "Input"],
Cell[492532, 12218, 166353, 2722, 293, "Output"],
Cell[658888, 14942, 164598, 2689, 292, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[823535, 17637, 46, 0, 36, "Subsection"],
Cell[CellGroupData[{
Cell[823606, 17641, 494, 19, 52, "Input"],
Cell[824103, 17662, 816, 29, 60, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[824956, 17696, 1027, 35, 63, "Input"],
Cell[825986, 17733, 46, 0, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[826069, 17738, 2455, 71, 283, "Input"],
Cell[828527, 17811, 107, 2, 34, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[828671, 17818, 295, 10, 34, "Input"],
Cell[828969, 17830, 226, 7, 34, "Output"]
}, Open  ]]
}, Closed]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature Ux0vqIw@x1rILCgZCLUn05p3 *)
