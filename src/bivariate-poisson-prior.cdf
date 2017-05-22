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
NotebookDataLength[    520287,      10485]
NotebookOptionsPosition[    515963,      10323]
NotebookOutlinePosition[    516396,      10342]
CellTagsIndexPosition[    516353,      10339]
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
   ")"}]}]}], "Input"],

Cell["Symbolic assumptions used globally.", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"$Assumptions", "=", 
  RowBox[{
   RowBox[{"\[Alpha]1", ">", "0"}], "&&", 
   RowBox[{"\[Beta]1", ">", "0"}], "&&", 
   RowBox[{"\[Alpha]2", ">", "0"}], "&&", 
   RowBox[{"\[Alpha]3", ">", "0"}], "&&", 
   RowBox[{"\[Beta]2", ">", "0"}], "&&", 
   RowBox[{"x", ">", "0"}], "&&", 
   RowBox[{"\[Sigma]x", ">", "0"}], "&&", 
   RowBox[{"\[Sigma]y", ">", "0"}], "&&", 
   RowBox[{"\[Sigma]xy", ">", "0"}], "&&", 
   RowBox[{"\[Alpha]", ">", "\[Xi]"}], "&&", 
   RowBox[{"\[Beta]", ">", "\[Xi]"}], "&&", 
   RowBox[{"\[Alpha]", ">", "0"}], "&&", 
   RowBox[{"\[Xi]", ">", "0"}], "&&", 
   RowBox[{"\[Beta]", ">", "0"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"\[Alpha]1", ">", "0"}], "&&", 
  RowBox[{"\[Beta]1", ">", "0"}], "&&", 
  RowBox[{"\[Alpha]2", ">", "0"}], "&&", 
  RowBox[{"\[Alpha]3", ">", "0"}], "&&", 
  RowBox[{"\[Beta]2", ">", "0"}], "&&", 
  RowBox[{"x", ">", "0"}], "&&", 
  RowBox[{"\[Sigma]x", ">", "0"}], "&&", 
  RowBox[{"\[Sigma]y", ">", "0"}], "&&", 
  RowBox[{"\[Sigma]xy", ">", "0"}], "&&", 
  RowBox[{"\[Alpha]", ">", "\[Xi]"}], "&&", 
  RowBox[{"\[Beta]", ">", "\[Xi]"}], "&&", 
  RowBox[{"\[Alpha]", ">", "0"}], "&&", 
  RowBox[{"\[Xi]", ">", "0"}], "&&", 
  RowBox[{"\[Beta]", ">", "0"}]}]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["Priors and Posteriors", "Subsection"],

Cell[CellGroupData[{

Cell["Uncorrelated", "Subsubsection"],

Cell["\<\
Uncorrelated prior and posterior for a product Poisson likelihood:\
\>", "Text"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"prior1", "[", 
   RowBox[{
   "\[Mu]x_", ",", "\[Sigma]x_", ",", "\[Mu]y_", ",", "\[Sigma]y_", ",", 
    "\[Sigma]xy_", ",", "xdat_", ",", "ydat_"}], "]"}], ":=", 
  RowBox[{"ProductDistribution", "[", "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"GammaDistribution", "[", 
     RowBox[{
      RowBox[{"N", "[", 
       RowBox[{
        SuperscriptBox["\[Mu]x", "2"], "/", 
        SuperscriptBox["\[Sigma]x", "2"]}], "]"}], ",", 
      SuperscriptBox[
       RowBox[{"(", 
        RowBox[{"\[Mu]x", "/", 
         SuperscriptBox["\[Sigma]x", "2"]}], ")"}], 
       RowBox[{"-", "1"}]]}], "]"}], ",", "\[IndentingNewLine]", 
    RowBox[{"GammaDistribution", "[", 
     RowBox[{
      RowBox[{"N", "[", 
       RowBox[{
        SuperscriptBox["\[Mu]y", "2"], "/", 
        SuperscriptBox["\[Sigma]y", "2"]}], "]"}], ",", 
      SuperscriptBox[
       RowBox[{"(", 
        RowBox[{"\[Mu]y", "/", 
         SuperscriptBox["\[Sigma]y", "2"]}], ")"}], 
       RowBox[{"-", "1"}]]}], "]"}]}], "\[IndentingNewLine]", 
   "]"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"priorpdf1", "[", 
   RowBox[{
   "\[Alpha]_", ",", "\[Beta]_", ",", "\[Mu]x_", ",", "\[Sigma]x_", ",", 
    "\[Mu]y_", ",", "\[Sigma]y_", ",", "\[Sigma]xy_", ",", "xdat_", ",", 
    "ydat_"}], "]"}], ":=", 
  RowBox[{
   RowBox[{"PDF", "[", 
    RowBox[{
     RowBox[{"GammaDistribution", "[", 
      RowBox[{
       RowBox[{"N", "[", 
        RowBox[{
         SuperscriptBox["\[Mu]x", "2"], "/", 
         SuperscriptBox["\[Sigma]x", "2"]}], "]"}], ",", 
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{"\[Mu]x", "/", 
          SuperscriptBox["\[Sigma]x", "2"]}], ")"}], 
        RowBox[{"-", "1"}]]}], "]"}], ",", "\[Alpha]"}], "]"}], "*", 
   RowBox[{"PDF", "[", 
    RowBox[{
     RowBox[{"GammaDistribution", "[", 
      RowBox[{
       RowBox[{"N", "[", 
        RowBox[{
         SuperscriptBox["\[Mu]y", "2"], "/", 
         SuperscriptBox["\[Sigma]y", "2"]}], "]"}], ",", 
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{"\[Mu]y", "/", 
          SuperscriptBox["\[Sigma]y", "2"]}], ")"}], 
        RowBox[{"-", "1"}]]}], "]"}], ",", "\[Beta]"}], 
    "]"}]}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"posterior1", "[", 
   RowBox[{
   "\[Mu]x_", ",", "\[Sigma]x_", ",", "\[Mu]y_", ",", "\[Sigma]y_", ",", 
    "\[Sigma]xy_", ",", "xdat_", ",", "ydat_"}], "]"}], ":=", 
  RowBox[{"ProductDistribution", "[", 
   RowBox[{
    RowBox[{"GammaDistribution", "[", 
     RowBox[{
      RowBox[{
       RowBox[{"N", "[", 
        RowBox[{
         SuperscriptBox["\[Mu]x", "2"], "/", 
         SuperscriptBox["\[Sigma]x", "2"]}], "]"}], "+", 
       RowBox[{"Total", "[", "xdat", "]"}]}], ",", 
      SuperscriptBox[
       RowBox[{"(", 
        RowBox[{
         RowBox[{"\[Mu]x", "/", 
          SuperscriptBox["\[Sigma]x", "2"]}], "+", 
         RowBox[{"Length", "[", "xdat", "]"}]}], ")"}], 
       RowBox[{"-", "1"}]]}], "]"}], ",", 
    RowBox[{"GammaDistribution", "[", 
     RowBox[{
      RowBox[{
       RowBox[{"N", "[", 
        RowBox[{
         SuperscriptBox["\[Mu]y", "2"], "/", 
         SuperscriptBox["\[Sigma]y", "2"]}], "]"}], "+", 
       RowBox[{"Total", "[", "ydat", "]"}]}], ",", 
      SuperscriptBox[
       RowBox[{"(", 
        RowBox[{
         RowBox[{"\[Mu]y", "/", 
          SuperscriptBox["\[Sigma]y", "2"]}], "+", 
         RowBox[{"Length", "[", "ydat", "]"}]}], ")"}], 
       RowBox[{"-", "1"}]]}], "]"}]}], "]"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"posteriorpdf1", "[", 
   RowBox[{
   "\[Alpha]_", ",", "\[Beta]_", ",", "\[Mu]x_", ",", "\[Sigma]x_", ",", 
    "\[Mu]y_", ",", "\[Sigma]y_", ",", "\[Sigma]xy_", ",", "xdat_", ",", 
    "ydat_"}], "]"}], ":=", 
  RowBox[{
   RowBox[{"PDF", "[", 
    RowBox[{
     RowBox[{"GammaDistribution", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"N", "[", 
         RowBox[{
          SuperscriptBox["\[Mu]x", "2"], "/", 
          SuperscriptBox["\[Sigma]x", "2"]}], "]"}], "+", 
        RowBox[{"Total", "[", "xdat", "]"}]}], ",", 
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{
          RowBox[{"\[Mu]x", "/", 
           SuperscriptBox["\[Sigma]x", "2"]}], "+", 
          RowBox[{"Length", "[", "xdat", "]"}]}], ")"}], 
        RowBox[{"-", "1"}]]}], "]"}], ",", "\[Alpha]"}], "]"}], "*", 
   RowBox[{"PDF", "[", 
    RowBox[{
     RowBox[{"GammaDistribution", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"N", "[", 
         RowBox[{
          SuperscriptBox["\[Mu]y", "2"], "/", 
          SuperscriptBox["\[Sigma]y", "2"]}], "]"}], "+", 
        RowBox[{"Total", "[", "ydat", "]"}]}], ",", 
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{
          RowBox[{"\[Mu]y", "/", 
           SuperscriptBox["\[Sigma]y", "2"]}], "+", 
          RowBox[{"Length", "[", "ydat", "]"}]}], ")"}], 
        RowBox[{"-", "1"}]]}], "]"}], ",", "\[Beta]"}], "]"}]}]}]}], "Input"]
}, Closed]],

Cell[CellGroupData[{

Cell["Correlated Mixture weights", "Subsubsection"],

Cell["\<\
For correlated version, first solve for the gamma distribution parameters in \
terms of desired means and covariances.\
\>", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"soln", "=", 
  RowBox[{"First", "@", 
   RowBox[{"Solve", "[", 
    RowBox[{
     RowBox[{"{", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"x", "\[Equal]", 
        RowBox[{
         RowBox[{"\[Alpha]1", "/", "\[Beta]1"}], "+", "\[Alpha]3"}]}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"y", "\[Equal]", 
        RowBox[{
         RowBox[{"\[Alpha]2", "/", "\[Beta]2"}], "+", "\[Alpha]3"}]}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"\[Sigma]x", "==", 
        RowBox[{
         RowBox[{"\[Alpha]1", "/", 
          SuperscriptBox["\[Beta]1", "2"]}], "+", "\[Alpha]3"}]}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"\[Sigma]y", "==", 
        RowBox[{
         RowBox[{"\[Alpha]2", "/", 
          SuperscriptBox["\[Beta]2", "2"]}], "+", "\[Alpha]3"}]}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"\[Sigma]xy", "==", "\[Alpha]3"}]}], "\[IndentingNewLine]", 
      "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
      "\[Alpha]1", ",", "\[Alpha]2", ",", "\[Alpha]3", ",", "\[Beta]1", ",", 
       "\[Beta]2"}], "}"}]}], "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"\[Alpha]1", "\[Rule]", 
    RowBox[{"-", 
     FractionBox[
      SuperscriptBox[
       RowBox[{"(", 
        RowBox[{"x", "-", "\[Sigma]xy"}], ")"}], "2"], 
      RowBox[{
       RowBox[{"-", "\[Sigma]x"}], "+", "\[Sigma]xy"}]]}]}], ",", 
   RowBox[{"\[Alpha]2", "\[Rule]", 
    RowBox[{"-", 
     FractionBox[
      SuperscriptBox[
       RowBox[{"(", 
        RowBox[{"y", "-", "\[Sigma]xy"}], ")"}], "2"], 
      RowBox[{"\[Sigma]xy", "-", "\[Sigma]y"}]]}]}], ",", 
   RowBox[{"\[Alpha]3", "\[Rule]", "\[Sigma]xy"}], ",", 
   RowBox[{"\[Beta]1", "\[Rule]", 
    FractionBox[
     RowBox[{
      RowBox[{"-", "x"}], "+", "\[Sigma]xy"}], 
     RowBox[{
      RowBox[{"-", "\[Sigma]x"}], "+", "\[Sigma]xy"}]]}], ",", 
   RowBox[{"\[Beta]2", "\[Rule]", 
    FractionBox[
     RowBox[{
      RowBox[{"-", "y"}], "+", "\[Sigma]xy"}], 
     RowBox[{"\[Sigma]xy", "-", "\[Sigma]y"}]]}]}], "}"}]], "Output"]
}, Open  ]],

Cell["Posterior mixture weights from Karlis and Tsiamyrtzis:", "Text"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"pstar", "[", 
   RowBox[{
   "\[Mu]x_", ",", "\[Sigma]x_", ",", "\[Mu]y_", ",", "\[Sigma]y_", ",", 
    "\[Sigma]xy_"}], "]"}], ":=", 
  RowBox[{"N", "@", 
   RowBox[{"With", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"\[Alpha]1", "=", 
        RowBox[{"-", 
         FractionBox[
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{"\[Mu]x", "-", "\[Sigma]xy"}], ")"}], "2"], 
          RowBox[{
           RowBox[{"-", 
            SuperscriptBox["\[Sigma]x", "2"]}], "+", "\[Sigma]xy"}]]}]}], ",", 
       RowBox[{"\[Alpha]2", "=", 
        RowBox[{"-", 
         FractionBox[
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{"\[Mu]y", "-", "\[Sigma]xy"}], ")"}], "2"], 
          RowBox[{"\[Sigma]xy", "-", 
           SuperscriptBox["\[Sigma]y", "2"]}]]}]}], ",", 
       RowBox[{"\[Alpha]3", "=", "\[Sigma]xy"}], ",", 
       RowBox[{"\[Beta]1", "=", 
        FractionBox[
         RowBox[{
          RowBox[{"-", "\[Mu]x"}], "+", "\[Sigma]xy"}], 
         RowBox[{
          RowBox[{"-", 
           SuperscriptBox["\[Sigma]x", "2"]}], "+", "\[Sigma]xy"}]]}], ",", 
       RowBox[{"\[Beta]2", "=", 
        FractionBox[
         RowBox[{
          RowBox[{"-", "\[Mu]y"}], "+", "\[Sigma]xy"}], 
         RowBox[{"\[Sigma]xy", "-", 
          SuperscriptBox["\[Sigma]y", "2"]}]]}]}], "}"}], ",", 
     RowBox[{
      SuperscriptBox["\[Beta]1", "\[Alpha]1"], 
      RowBox[{
       SuperscriptBox["\[Beta]2", "\[Alpha]2"], "/", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"Gamma", "[", "\[Alpha]1", "]"}], 
         RowBox[{"Gamma", "[", "\[Alpha]2", "]"}], 
         RowBox[{"Gamma", "[", "\[Alpha]3", "]"}]}], ")"}]}]}]}], 
    "]"}]}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"weights", "[", 
   RowBox[{
   "\[Mu]x_", ",", "\[Sigma]x_", ",", "\[Mu]y_", ",", "\[Sigma]y_", ",", 
    "\[Sigma]xy_", ",", "xdat_", ",", "ydat_"}], "]"}], ":=", 
  RowBox[{
   RowBox[{
    RowBox[{"(", 
     RowBox[{"#", "/", 
      RowBox[{"Total", "[", "#", "]"}]}], ")"}], "&"}], "@", 
   RowBox[{"Module", "[", "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"c", ",", "v", ",", "s", ",", "S", ",", "ss", ",", 
       RowBox[{"n", "=", 
        RowBox[{"Length", "@", "xdat"}]}], ",", 
       RowBox[{"\[Alpha]1", "=", 
        RowBox[{"-", 
         FractionBox[
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{"\[Mu]x", "-", "\[Sigma]xy"}], ")"}], "2"], 
          RowBox[{
           RowBox[{"-", 
            SuperscriptBox["\[Sigma]x", "2"]}], "+", "\[Sigma]xy"}]]}]}], ",", 
       RowBox[{"\[Alpha]2", "=", 
        RowBox[{"-", 
         FractionBox[
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{"\[Mu]y", "-", "\[Sigma]xy"}], ")"}], "2"], 
          RowBox[{"\[Sigma]xy", "-", 
           SuperscriptBox["\[Sigma]y", "2"]}]]}]}], ",", 
       RowBox[{"\[Alpha]3", "=", "\[Sigma]xy"}], ",", 
       RowBox[{"\[Beta]1", "=", 
        FractionBox[
         RowBox[{
          RowBox[{"-", "\[Mu]x"}], "+", "\[Sigma]xy"}], 
         RowBox[{
          RowBox[{"-", 
           SuperscriptBox["\[Sigma]x", "2"]}], "+", "\[Sigma]xy"}]]}], ",", 
       RowBox[{"\[Beta]2", "=", 
        FractionBox[
         RowBox[{
          RowBox[{"-", "\[Mu]y"}], "+", "\[Sigma]xy"}], 
         RowBox[{"\[Sigma]xy", "-", 
          SuperscriptBox["\[Sigma]y", "2"]}]]}]}], "}"}], ",", 
     "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{
       RowBox[{"v", "[", 
        RowBox[{"r_", ",", "m_"}], "]"}], ":=", 
       RowBox[{
        RowBox[{"v", "[", 
         RowBox[{"r", ",", "m"}], "]"}], "=", 
        SuperscriptBox[
         RowBox[{"(", 
          RowBox[{
           RowBox[{"Factorial", "[", 
            RowBox[{
             RowBox[{"xdat", "[", 
              RowBox[{"[", "m", "]"}], "]"}], "-", "r"}], "]"}], 
           RowBox[{"Factorial", "[", 
            RowBox[{
             RowBox[{"ydat", "[", 
              RowBox[{"[", "m", "]"}], "]"}], "-", "r"}], "]"}], 
           RowBox[{"Factorial", "[", "r", "]"}]}], ")"}], 
         RowBox[{"-", "1"}]]}]}], ";", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"s", "[", "m_", "]"}], ":=", 
       RowBox[{
        RowBox[{"s", "[", "m", "]"}], "=", 
        RowBox[{"Min", "[", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"xdat", "[", 
            RowBox[{"[", "m", "]"}], "]"}], ",", 
           RowBox[{"ydat", "[", 
            RowBox[{"[", "m", "]"}], "]"}]}], "}"}], "]"}]}]}], ";", 
      "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"S", "[", "kk_", "]"}], ":=", 
       RowBox[{
        RowBox[{"S", "[", "kk", "]"}], "=", 
        RowBox[{"Sum", "[", 
         RowBox[{
          RowBox[{"s", "[", "m", "]"}], ",", 
          RowBox[{"{", 
           RowBox[{"m", ",", "kk"}], "}"}]}], "]"}]}]}], ";", 
      "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"ss", "[", "m_", "]"}], ":=", 
       RowBox[{
        RowBox[{"ss", "[", "m", "]"}], "=", 
        RowBox[{"Min", "[", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"s", "[", "m", "]"}], ",", 
           RowBox[{"S", "[", 
            RowBox[{"m", "-", "1"}], "]"}]}], "}"}], "]"}]}]}], ";", 
      "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"c", "[", 
        RowBox[{"k_", ",", "n_"}], "]"}], ":=", 
       RowBox[{
        RowBox[{"c", "[", 
         RowBox[{"k", ",", "n"}], "]"}], "=", 
        RowBox[{"If", "[", 
         RowBox[{
          RowBox[{"n", "\[Equal]", "1"}], ",", "\[IndentingNewLine]", 
          RowBox[{"v", "[", 
           RowBox[{"k", ",", "n"}], "]"}], ",", "\[IndentingNewLine]", 
          RowBox[{"Sum", "[", 
           RowBox[{
            RowBox[{
             RowBox[{"v", "[", 
              RowBox[{"r", ",", "n"}], "]"}], "*", 
             RowBox[{"c", "[", 
              RowBox[{
               RowBox[{"k", "-", "r"}], ",", 
               RowBox[{"n", "-", "1"}]}], "]"}]}], ",", 
            RowBox[{"{", 
             RowBox[{"r", ",", 
              RowBox[{"Max", "[", 
               RowBox[{"0", ",", 
                RowBox[{"k", "-", 
                 RowBox[{"ss", "[", "n", "]"}]}]}], "]"}], ",", 
              RowBox[{"Min", "[", 
               RowBox[{"k", ",", 
                RowBox[{"ss", "[", "n", "]"}]}], "]"}]}], "}"}]}], "]"}]}], 
         "\[IndentingNewLine]", "]"}]}]}], ";", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"pstar", "[", 
        RowBox[{
        "\[Mu]x", ",", "\[Sigma]x", ",", "\[Mu]y", ",", "\[Sigma]y", ",", 
         "\[Sigma]xy"}], "]"}], 
       RowBox[{"Table", "[", 
        RowBox[{
         RowBox[{
          RowBox[{"c", "[", 
           RowBox[{"k", ",", "n"}], "]"}], 
          RowBox[{"Gamma", "[", 
           RowBox[{"\[Alpha]1", "-", "k", "+", 
            RowBox[{"Total", "[", "xdat", "]"}]}], "]"}], 
          RowBox[{"Gamma", "[", 
           RowBox[{"\[Alpha]2", "-", "k", "+", 
            RowBox[{"Total", "[", "ydat", "]"}]}], "]"}], 
          RowBox[{"Gamma", "[", 
           RowBox[{"\[Alpha]3", "+", "k"}], "]"}], 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"(", 
              RowBox[{"n", "+", "\[Beta]1"}], ")"}], 
             RowBox[{
              RowBox[{"(", 
               RowBox[{"n", "+", "\[Beta]2"}], ")"}], "/", 
              RowBox[{"(", 
               RowBox[{"n", "+", "1"}], ")"}]}]}], ")"}], "k"]}], ",", 
         RowBox[{"{", 
          RowBox[{"k", ",", 
           RowBox[{"S", "[", "n", "]"}]}], "}"}]}], "]"}]}]}]}], 
    "\[IndentingNewLine]", "]"}]}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"relevantWeights", "[", 
   RowBox[{
   "\[Mu]x_", ",", "\[Sigma]x_", ",", "\[Mu]y_", ",", "\[Sigma]y_", ",", 
    "\[Sigma]xy_", ",", "xdat_", ",", "ydat_"}], "]"}], ":=", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"w", "=", 
       RowBox[{"weights", "[", 
        RowBox[{
        "\[Mu]x", ",", "\[Sigma]x", ",", "\[Mu]y", ",", "\[Sigma]y", ",", 
         "\[Sigma]xy", ",", "xdat", ",", "ydat"}], "]"}]}], ",", "indeces"}], 
     "}"}], ",", "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"indeces", "=", 
      RowBox[{"Pick", "[", 
       RowBox[{
        RowBox[{"Range", "[", 
         RowBox[{"Length", "@", "w"}], "]"}], ",", "w", ",", 
        RowBox[{"_", "?", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"#", ">", 
            RowBox[{
             RowBox[{"Max", "[", "w", "]"}], "/", "50"}]}], "&"}], ")"}]}]}], 
       "]"}]}], ";", "\[IndentingNewLine]", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"indeces", "-", "1"}], ",", 
       RowBox[{
        RowBox[{
         RowBox[{"#", "/", 
          RowBox[{"Total", "[", "#", "]"}]}], "&"}], "@", 
        RowBox[{"w", "[", 
         RowBox[{"[", "indeces", "]"}], "]"}]}]}], "}"}]}]}], 
   "\[IndentingNewLine]", "]"}]}]}], "Input"],

Cell["Look at what the weights of a posterior look like:", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"exportme", "[", "\"\<bivar-posterior-mixture-weights\>\"", "]"}], 
  "@", 
  RowBox[{"ListPlot", "[", 
   RowBox[{
    RowBox[{"weights", "[", 
     RowBox[{"207", ",", "40", ",", "140", ",", "15", ",", "90", ",", 
      RowBox[{"{", "220", "}"}], ",", 
      RowBox[{"{", "120", "}"}]}], "]"}], ",", 
    RowBox[{"PlotRange", "\[Rule]", "All"}], ",", 
    RowBox[{"PlotTheme", "\[Rule]", "\"\<Detailed\>\""}], ",", 
    RowBox[{"PlotLabel", "\[Rule]", 
     RowBox[{"Style", "[", 
      RowBox[{
       RowBox[{"Text", "[", "\"\<Posterior Mixture Weights\>\"", "]"}], ",", 
       "15"}], "]"}]}], ",", 
    RowBox[{"FrameLabel", "\[Rule]", 
     RowBox[{"(", 
      RowBox[{
       RowBox[{
        RowBox[{"Style", "[", 
         RowBox[{
          RowBox[{"Text", "[", "#", "]"}], ",", "13"}], "]"}], "&"}], "/@", 
       RowBox[{"{", 
        RowBox[{
        "\"\<k\>\"", ",", 
         "\"\<\!\(\*SuperscriptBox[SubscriptBox[\(w\), \(k\)], \
\(*\)]\)\>\""}], "}"}]}], ")"}]}]}], "]"}]}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{}, {{}, 
    {RGBColor[0.368417, 0.506779, 0.709798], PointSize[0.01388888888888889], 
     AbsoluteThickness[1.6], PointBox[CompressedData["
1:eJw1lAs0VHkcx8dUhFXyKDFFrcS0W97JI18mz5FmDGMwKEWSsnXSqqSR1FRb
U1rEymryaLYXtqNlW2lFOo7jMdUmpK3ksfQ4tDYt7WN+3XPuuedzP/dzz/3/
z/ndRTFJQbFMBoOR8u/531V1vHE3fnDpLq+8YRXdwMC74xZ65vrOKpyJng0N
cmatkFgXftvy1VuSvyU2QE+nm7KlpoXYCNzhe9mtbKaLilmY5e9q32RvR2yG
O4yPf8SNbCBejFlDhosV004Sm8PYvT+2ubWK2AI3xQUCZXMvsSXEwa/n56ZO
d1UxG8vr9t+cdsaS+Av84pWXn5DHJV6OpLPylDvsbcTWOOVh2Lt10QliG/TU
sJsr8y4R2+LK9cti9osmYjtwS5zWe23vI7ZHwcEJ7VSFmpuKHbDSPK5j6pUJ
sSP0+zoZJW4OxCvRcbqcLTVdR+yE97LhfRrMOOJVSPjMuH32vDRiZ0irhS8y
h84Qu8DkFWdzgUxB7AqZ7Lqy8tEtYjeMjWazJnyUxKuh5RhVyb7xktgdv91n
B/roThADbximncylOqv/RwlQf9PcJ67NVMUMD8SbRsZsGbUm7wGX7LtTtaUe
5D3xYffVZ3vf88l7QnpiPNl6cAN5DsZaDioq9+wgz4HnR60Hcdcl5NegvEvr
R9tAGfk1eFf48rh6QwF5L0hf/V665a2CvBcGmtKfWo1XkfeGnncRx2m8nrw3
bpfYdzTqtJP3gbvgmpeXvJu8Dxbc2qx/VN5P3hedw18vm1wxSt4XmZmin9JL
p8j74ZTMSato3kx3lffDfPb5wNBiPRUz/CGa+1qqH88i74+yxBGNHt4S8lys
2RjreTpjBXkulv6tw9MfcyQfgEapbn7nHpAPgO+UtutOng/5teBbOwrUOTzy
azGdM7vXOEpIPhAZRxTe94RR5APh8ihLZ8h/E/l18FXWbpQ2JpBfB2jodjxP
3EGeB03D2YMa63erGDxMJlfcPyZKped5mKFTrG12I13FdTxEXB3IdOnMpJ4P
rQWVlmU5x6jngz+Sy8wYkVHPh9WMzy/EDGVRz0fXz9F7ChfkUB+EpzNyjPZm
5FEfhBh15q6jWueoD0KHRp9mbmAR9UFoyr3RYjhHTr0A9SlVL+7VXqBegL0y
XqOaXwn1AvRF5xvMOV9KvQCp8XknllSXUR+Maf1/uizOvEh9MIS9NpKkD8SS
YGS8qey+YqigPhgSW9PvnNvJM0KQeIa1K2XFpz4EAT0my5QO9H5JCGLYMtN9
I/Q9dSFID5h/vDummHohJuZN1HYX03ogRPXDi/Ej9bReiRDNAnU1AzntR50Q
6duNJhOqab8YobDrz9JkDWdTH4pqj6E2vWDab0koklrbxuXaJ6kPBau3N/uS
qZR6EUrSDm2ZHDtIvQg1hxPSihbtp16ETVMV7ee6k6kXYcmV1oU2al9RHwa5
UdIBi/tx1IchK9wkdvPlaOrD0NDu/OR1SAj1Yfg+zeKIbReX+nCc/WtgV2K2
B/XhuMVnhQ/GO1AfDk39QUvuHCvqw2H3MMLP1YzmjRGBj9ut2qIXzqI+AlUW
OwPi5DS/kgh4FhSWPUkcUXFdBDYpDgWx0x/TfIthdPj923KbRhVDjC+3Pmb+
OreCejGeKL7RPdqVS70YyqIfrFaf3099JHLupKVcexZNfSTCdEaDj+S5Uh8J
mfZMM+VcA+ojwSnsck+teE7/3yjU3GYcuOpZ7PYPcsgblw==
      "]]}, {}}, {}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{False, False},
  AxesLabel->{None, None},
  AxesOrigin->{0, 0},
  DisplayFunction->Identity,
  Frame->{{True, True}, {True, True}},
  FrameLabel->{{
     FormBox[
      StyleBox[
       InterpretationBox[
        Cell[
         BoxData[
          FormBox[
          "\"\\!\\(\\*SuperscriptBox[SubscriptBox[\\(w\\), \\(k\\)], \\(*\\)]\
\\)\"", TextForm]], "InlineText"], 
        Text["\!\(\*SuperscriptBox[SubscriptBox[\(w\), \(k\)], \(*\)]\)"]], 
       13, StripOnInput -> False], TraditionalForm], None}, {
     FormBox[
      StyleBox[
       InterpretationBox[
        Cell[
         BoxData[
          FormBox["\"k\"", TextForm]], "InlineText"], 
        Text["k"]], 13, StripOnInput -> False], TraditionalForm], None}},
  FrameStyle->Automatic,
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{Automatic, Automatic},
  GridLinesStyle->Directive[
    GrayLevel[0.4, 0.5], 
    AbsoluteThickness[1], 
    AbsoluteDashing[{1, 2}]],
  Method->{},
  PlotLabel->FormBox[
    StyleBox[
     InterpretationBox[
      Cell[
       BoxData[
        FormBox["\"Posterior Mixture Weights\"", TextForm]], "InlineText"], 
      Text["Posterior Mixture Weights"]], 15, StripOnInput -> False], 
    TraditionalForm],
  PlotRange->{{0., 120.}, {0, 0.048993523779672386`}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.02], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output"]
}, Open  ]],

Cell["\<\
Test the relevant weights function which throws out the small weights for \
efficiency:\
\>", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ListPlot", "[", 
  RowBox[{
   RowBox[{
    RowBox[{"relevantWeights", "[", 
     RowBox[{"207", ",", "40", ",", "140", ",", "15", ",", "90", ",", 
      RowBox[{"{", "220", "}"}], ",", 
      RowBox[{"{", "120", "}"}]}], "]"}], "\[Transpose]"}], ",", 
   RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{}, {{}, 
    {RGBColor[0.368417, 0.506779, 0.709798], PointSize[0.019444444444444445`],
      AbsoluteThickness[1.6], PointBox[CompressedData["
1:eJw10F9IU1EcB/BLiK0tyghTCKEJPrTyoQhDQ/ZFEUTddv/s3rtRuLbcCB9M
IWcDhRuxqJQyha0eiqGzKQztQR+MzMsaGSQsN9JIHyo0GjIhxFIw1p/9PHA4
/M73fM7h/PSua7x7H8Mw5X/nv/X/UJogfx5Pu0TWmNswYfNr5+VLXVKuVkxI
Fs1va33NlJthNk69STlbKDfD17ekia+2Um5BY6znZb/SQbkFut2TwUafl3IW
gYPN7r4b3bkaLKShurcn3t2k8yyi4VD22w9/rlZZ7MqJmejkPfIc7HWzO3Oa
fvIc1pgrllfZAfIcDnjGDcGKAHkO9b/ObdeHHpPnYa6+kBVOPSHPI5PfMsE4
Q+R5bIyslnSXDZHncZoLuAs/DJMXEDof8WidI+QFBILqmacvnpEXMByIpTdS
EfICZjq21hdCo+StWJnUx8NFY+StWHt0O8acpVqxIqrbrECGzqtWqA8HW+ca
9ryICUfCqGHpfoho+lTprc7fe19EQZts/uILkxfxsVS/np6m/zASfhfwvcuL
9F9IqDpSO3r3NfVDkVBWMx33LlK/VAm6pYXUSh71k5ERue6Px69SvyEjr7I9
8aD8PnkZ3EXD1PeqO+RlZHqLD7u1t8jbUHjo53F/TQ95G2afD5SYtjrJ2zDf
teyoPdpO3gatZawhk/GQtyO5U5o0vHeQt2PQdax4f5to/APW29hs
      "]]}, {}}, {}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{None, None},
  AxesOrigin->{56.3125, 0},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{},
  PlotRange->{{57., 101.}, {0, 0.049209617372342675`}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.02], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["Sidetrack calculations", "Subsubsection"],

Cell["\<\
If there is only one sample taken, the posterior simplifies a bit. Calculate \
the same weights in this case: (formula derived below)\
\>", "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{"w", "[", 
   RowBox[{
   "\[Mu]x_", ",", "\[Sigma]x_", ",", "\[Mu]y_", ",", "\[Sigma]y_", ",", 
    "\[Sigma]xy_", ",", "x_", ",", "y_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"\[Alpha]1", "=", 
       RowBox[{"N", "@", 
        RowBox[{"-", 
         FractionBox[
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{"\[Mu]x", "-", "\[Sigma]xy"}], ")"}], "2"], 
          RowBox[{
           RowBox[{"-", 
            SuperscriptBox["\[Sigma]x", "2"]}], "+", "\[Sigma]xy"}]]}]}]}], 
      ",", 
      RowBox[{"\[Alpha]2", "=", 
       RowBox[{"N", "@", 
        RowBox[{"-", 
         FractionBox[
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{"\[Mu]y", "-", "\[Sigma]xy"}], ")"}], "2"], 
          RowBox[{"\[Sigma]xy", "-", 
           SuperscriptBox["\[Sigma]y", "2"]}]]}]}]}], ",", 
      RowBox[{"\[Alpha]0", "=", 
       RowBox[{"N", "@", "\[Sigma]xy"}]}], ",", 
      RowBox[{"\[Beta]1", "=", 
       RowBox[{"N", "@", 
        FractionBox[
         RowBox[{
          RowBox[{"-", "\[Mu]x"}], "+", "\[Sigma]xy"}], 
         RowBox[{
          RowBox[{"-", 
           SuperscriptBox["\[Sigma]x", "2"]}], "+", "\[Sigma]xy"}]]}]}], ",", 
      
      RowBox[{"\[Beta]2", "=", 
       RowBox[{"N", "@", 
        FractionBox[
         RowBox[{
          RowBox[{"-", "\[Mu]y"}], "+", "\[Sigma]xy"}], 
         RowBox[{"\[Sigma]xy", "-", 
          SuperscriptBox["\[Sigma]y", "2"]}]]}]}]}], "}"}], ",", 
    RowBox[{"Table", "[", 
     RowBox[{
      RowBox[{
       RowBox[{"(", 
        RowBox[{
         SuperscriptBox["2", 
          RowBox[{"-", "k"}]], " ", 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"(", 
             RowBox[{"1", "+", "\[Beta]1"}], ")"}], " ", 
            RowBox[{"(", 
             RowBox[{"1", "+", "\[Beta]2"}], ")"}]}], ")"}], "k"], " ", 
         RowBox[{"Gamma", "[", 
          RowBox[{"1", "+", "x"}], "]"}], " ", 
         RowBox[{"Gamma", "[", 
          RowBox[{"1", "+", "y"}], "]"}], " ", 
         RowBox[{"Gamma", "[", 
          RowBox[{"k", "+", "\[Alpha]0"}], "]"}], " ", 
         RowBox[{"Gamma", "[", 
          RowBox[{
           RowBox[{"-", "k"}], "+", "x", "+", "\[Alpha]1"}], "]"}], " ", 
         RowBox[{"Gamma", "[", 
          RowBox[{
           RowBox[{"-", "k"}], "+", "y", "+", "\[Alpha]2"}], "]"}], " ", 
         RowBox[{"Sin", "[", 
          RowBox[{"\[Pi]", " ", 
           RowBox[{"(", 
            RowBox[{"x", "+", "\[Alpha]1"}], ")"}]}], "]"}], " ", 
         RowBox[{"Sin", "[", 
          RowBox[{"\[Pi]", " ", 
           RowBox[{"(", 
            RowBox[{"y", "+", "\[Alpha]2"}], ")"}]}], "]"}]}], ")"}], "/", 
       RowBox[{"(", 
        RowBox[{
         SuperscriptBox["\[Pi]", "2"], " ", 
         RowBox[{"k", "!"}], " ", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "k"}], "+", "x"}], ")"}], "!"}], " ", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "k"}], "+", "y"}], ")"}], "!"}], " ", 
         RowBox[{"Gamma", "[", "\[Alpha]0", "]"}], " ", 
         RowBox[{"HypergeometricPFQRegularized", "[", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{
             RowBox[{"-", "x"}], ",", 
             RowBox[{"-", "y"}], ",", "\[Alpha]0"}], "}"}], ",", 
           RowBox[{"{", 
            RowBox[{
             RowBox[{"1", "-", "x", "-", "\[Alpha]1"}], ",", 
             RowBox[{"1", "-", "y", "-", "\[Alpha]2"}]}], "}"}], ",", 
           RowBox[{
            FractionBox["1", "2"], " ", 
            RowBox[{"(", 
             RowBox[{"1", "+", "\[Beta]1"}], ")"}], " ", 
            RowBox[{"(", 
             RowBox[{"1", "+", "\[Beta]2"}], ")"}]}]}], "]"}]}], ")"}]}], ",", 
      RowBox[{"{", 
       RowBox[{"k", ",", "1", ",", 
        RowBox[{"Min", "[", 
         RowBox[{"x", ",", "y"}], "]"}]}], "}"}]}], "]"}]}], "]"}]}]], "Input"],

Cell["Verify that the above sums to unity:", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"Sum", "[", 
   RowBox[{
    RowBox[{
     RowBox[{"(", 
      RowBox[{
       SuperscriptBox["2", 
        RowBox[{"-", "k"}]], " ", 
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{"1", "+", "\[Beta]1"}], ")"}], " ", 
          RowBox[{"(", 
           RowBox[{"1", "+", "\[Beta]2"}], ")"}]}], ")"}], "k"], " ", 
       RowBox[{"Gamma", "[", 
        RowBox[{"1", "+", "x"}], "]"}], " ", 
       RowBox[{"Gamma", "[", 
        RowBox[{"1", "+", "y"}], "]"}], " ", 
       RowBox[{"Gamma", "[", 
        RowBox[{"k", "+", "\[Alpha]0"}], "]"}], " ", 
       RowBox[{"Gamma", "[", 
        RowBox[{
         RowBox[{"-", "k"}], "+", "x", "+", "\[Alpha]1"}], "]"}], " ", 
       RowBox[{"Gamma", "[", 
        RowBox[{
         RowBox[{"-", "k"}], "+", "y", "+", "\[Alpha]2"}], "]"}], " ", 
       RowBox[{"Sin", "[", 
        RowBox[{"\[Pi]", " ", 
         RowBox[{"(", 
          RowBox[{"x", "+", "\[Alpha]1"}], ")"}]}], "]"}], " ", 
       RowBox[{"Sin", "[", 
        RowBox[{"\[Pi]", " ", 
         RowBox[{"(", 
          RowBox[{"y", "+", "\[Alpha]2"}], ")"}]}], "]"}]}], ")"}], "/", 
     RowBox[{"(", 
      RowBox[{
       SuperscriptBox["\[Pi]", "2"], " ", 
       RowBox[{"k", "!"}], " ", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{
          RowBox[{"-", "k"}], "+", "x"}], ")"}], "!"}], " ", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{
          RowBox[{"-", "k"}], "+", "y"}], ")"}], "!"}], " ", 
       RowBox[{"Gamma", "[", "\[Alpha]0", "]"}], " ", 
       RowBox[{"HypergeometricPFQRegularized", "[", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{
           RowBox[{"-", "x"}], ",", 
           RowBox[{"-", "y"}], ",", "\[Alpha]0"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"1", "-", "x", "-", "\[Alpha]1"}], ",", 
           RowBox[{"1", "-", "y", "-", "\[Alpha]2"}]}], "}"}], ",", 
         RowBox[{
          FractionBox["1", "2"], " ", 
          RowBox[{"(", 
           RowBox[{"1", "+", "\[Beta]1"}], ")"}], " ", 
          RowBox[{"(", 
           RowBox[{"1", "+", "\[Beta]2"}], ")"}]}]}], "]"}]}], ")"}]}], ",", 
    RowBox[{"{", 
     RowBox[{"k", ",", "0", ",", 
      RowBox[{"Min", "[", 
       RowBox[{"x", ",", "y"}], "]"}]}], "}"}]}], "]"}], "//", 
  "FullSimplify"}]], "Input"],

Cell[BoxData["$Aborted"], "Output"]
}, Open  ]],

Cell["Find the normalized sum of the formula with n=1:", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"Sum", "[", 
   RowBox[{
    RowBox[{
     FractionBox[
      RowBox[{
       SuperscriptBox["\[Beta]1", "\[Alpha]1"], 
       SuperscriptBox["\[Beta]2", "\[Alpha]2"], 
       RowBox[{"Gamma", "[", 
        RowBox[{"\[Alpha]1", "-", "k", "+", "x"}], "]"}], 
       RowBox[{"Gamma", "[", 
        RowBox[{"\[Alpha]2", "-", "k", "+", "y"}], "]"}], 
       RowBox[{"Gamma", "[", 
        RowBox[{"\[Alpha]0", "+", "k"}], "]"}]}], 
      RowBox[{
       RowBox[{
        RowBox[{"(", 
         RowBox[{"x", "-", "k"}], ")"}], "!"}], 
       RowBox[{
        RowBox[{"(", 
         RowBox[{"y", "-", "k"}], ")"}], "!"}], 
       RowBox[{"k", "!"}], 
       RowBox[{"Gamma", "[", "\[Alpha]1", "]"}], 
       RowBox[{"Gamma", "[", "\[Alpha]2", "]"}], 
       RowBox[{"Gamma", "[", "\[Alpha]0", "]"}]}]], 
     SuperscriptBox[
      RowBox[{"(", 
       FractionBox[
        RowBox[{
         RowBox[{"(", 
          RowBox[{"1", "+", "\[Beta]1"}], ")"}], 
         RowBox[{"(", 
          RowBox[{"1", "+", "\[Beta]2"}], ")"}]}], "2"], ")"}], "k"]}], ",", 
    RowBox[{"{", 
     RowBox[{"k", ",", "0", ",", 
      RowBox[{"Min", "[", 
       RowBox[{"x", ",", "y"}], "]"}]}], "}"}]}], "]"}], "//", 
  "FullSimplify"}]], "Input"],

Cell[BoxData[
 FractionBox[
  RowBox[{
   SuperscriptBox["\[Pi]", "2"], " ", 
   SuperscriptBox["\[Beta]1", "\[Alpha]1"], " ", 
   SuperscriptBox["\[Beta]2", "\[Alpha]2"], " ", 
   RowBox[{"Csc", "[", 
    RowBox[{"\[Pi]", " ", 
     RowBox[{"(", 
      RowBox[{"x", "+", "\[Alpha]1"}], ")"}]}], "]"}], " ", 
   RowBox[{"Csc", "[", 
    RowBox[{"\[Pi]", " ", 
     RowBox[{"(", 
      RowBox[{"y", "+", "\[Alpha]2"}], ")"}]}], "]"}], " ", 
   RowBox[{"HypergeometricPFQRegularized", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"-", "x"}], ",", 
       RowBox[{"-", "y"}], ",", "\[Alpha]0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"1", "-", "x", "-", "\[Alpha]1"}], ",", 
       RowBox[{"1", "-", "y", "-", "\[Alpha]2"}]}], "}"}], ",", 
     RowBox[{
      FractionBox["1", "2"], " ", 
      RowBox[{"(", 
       RowBox[{"1", "+", "\[Beta]1"}], ")"}], " ", 
      RowBox[{"(", 
       RowBox[{"1", "+", "\[Beta]2"}], ")"}]}]}], "]"}]}], 
  RowBox[{
   RowBox[{"Gamma", "[", 
    RowBox[{"1", "+", "x"}], "]"}], " ", 
   RowBox[{"Gamma", "[", 
    RowBox[{"1", "+", "y"}], "]"}], " ", 
   RowBox[{"Gamma", "[", "\[Alpha]1", "]"}], " ", 
   RowBox[{"Gamma", "[", "\[Alpha]2", "]"}]}]]], "Output"]
}, Open  ]],

Cell["\<\
Now if we divide each term we get, which was the first formula of this \
section:\
\>", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  FractionBox[
   RowBox[{
    FractionBox[
     RowBox[{
      SuperscriptBox["\[Beta]1", "\[Alpha]1"], 
      SuperscriptBox["\[Beta]2", "\[Alpha]2"], 
      RowBox[{"Gamma", "[", 
       RowBox[{"\[Alpha]1", "-", "k", "+", "x"}], "]"}], 
      RowBox[{"Gamma", "[", 
       RowBox[{"\[Alpha]2", "-", "k", "+", "y"}], "]"}], 
      RowBox[{"Gamma", "[", 
       RowBox[{"\[Alpha]0", "+", "k"}], "]"}]}], 
     RowBox[{
      RowBox[{
       RowBox[{"(", 
        RowBox[{"x", "-", "k"}], ")"}], "!"}], 
      RowBox[{
       RowBox[{"(", 
        RowBox[{"y", "-", "k"}], ")"}], "!"}], 
      RowBox[{"k", "!"}], 
      RowBox[{"Gamma", "[", "\[Alpha]1", "]"}], 
      RowBox[{"Gamma", "[", "\[Alpha]2", "]"}], 
      RowBox[{"Gamma", "[", "\[Alpha]0", "]"}]}]], 
    SuperscriptBox[
     RowBox[{"(", 
      FractionBox[
       RowBox[{
        RowBox[{"(", 
         RowBox[{"1", "+", "\[Beta]1"}], ")"}], 
        RowBox[{"(", 
         RowBox[{"1", "+", "\[Beta]2"}], ")"}]}], "2"], ")"}], "k"]}], 
   FractionBox[
    RowBox[{
     SuperscriptBox["\[Pi]", "2"], " ", 
     SuperscriptBox["\[Beta]1", "\[Alpha]1"], " ", 
     SuperscriptBox["\[Beta]2", "\[Alpha]2"], " ", 
     RowBox[{"Csc", "[", 
      RowBox[{"\[Pi]", " ", 
       RowBox[{"(", 
        RowBox[{"x", "+", "\[Alpha]1"}], ")"}]}], "]"}], " ", 
     RowBox[{"Csc", "[", 
      RowBox[{"\[Pi]", " ", 
       RowBox[{"(", 
        RowBox[{"y", "+", "\[Alpha]2"}], ")"}]}], "]"}], " ", 
     RowBox[{"HypergeometricPFQRegularized", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"-", "x"}], ",", 
         RowBox[{"-", "y"}], ",", "\[Alpha]0"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"1", "-", "x", "-", "\[Alpha]1"}], ",", 
         RowBox[{"1", "-", "y", "-", "\[Alpha]2"}]}], "}"}], ",", 
       RowBox[{
        FractionBox["1", "2"], " ", 
        RowBox[{"(", 
         RowBox[{"1", "+", "\[Beta]1"}], ")"}], " ", 
        RowBox[{"(", 
         RowBox[{"1", "+", "\[Beta]2"}], ")"}]}]}], "]"}]}], 
    RowBox[{
     RowBox[{"Gamma", "[", 
      RowBox[{"1", "+", "x"}], "]"}], " ", 
     RowBox[{"Gamma", "[", 
      RowBox[{"1", "+", "y"}], "]"}], " ", 
     RowBox[{"Gamma", "[", "\[Alpha]1", "]"}], " ", 
     RowBox[{"Gamma", "[", "\[Alpha]2", "]"}]}]]], "//", 
  "FullSimplify"}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(", 
   RowBox[{
    SuperscriptBox["2", 
     RowBox[{"-", "k"}]], " ", 
    SuperscriptBox[
     RowBox[{"(", 
      RowBox[{
       RowBox[{"(", 
        RowBox[{"1", "+", "\[Beta]1"}], ")"}], " ", 
       RowBox[{"(", 
        RowBox[{"1", "+", "\[Beta]2"}], ")"}]}], ")"}], "k"], " ", 
    RowBox[{"Gamma", "[", 
     RowBox[{"1", "+", "x"}], "]"}], " ", 
    RowBox[{"Gamma", "[", 
     RowBox[{"1", "+", "y"}], "]"}], " ", 
    RowBox[{"Gamma", "[", 
     RowBox[{"k", "+", "\[Alpha]0"}], "]"}], " ", 
    RowBox[{"Gamma", "[", 
     RowBox[{
      RowBox[{"-", "k"}], "+", "x", "+", "\[Alpha]1"}], "]"}], " ", 
    RowBox[{"Gamma", "[", 
     RowBox[{
      RowBox[{"-", "k"}], "+", "y", "+", "\[Alpha]2"}], "]"}], " ", 
    RowBox[{"Sin", "[", 
     RowBox[{"\[Pi]", " ", 
      RowBox[{"(", 
       RowBox[{"x", "+", "\[Alpha]1"}], ")"}]}], "]"}], " ", 
    RowBox[{"Sin", "[", 
     RowBox[{"\[Pi]", " ", 
      RowBox[{"(", 
       RowBox[{"y", "+", "\[Alpha]2"}], ")"}]}], "]"}]}], ")"}], "/", 
  RowBox[{"(", 
   RowBox[{
    SuperscriptBox["\[Pi]", "2"], " ", 
    RowBox[{"k", "!"}], " ", 
    RowBox[{
     RowBox[{"(", 
      RowBox[{
       RowBox[{"-", "k"}], "+", "x"}], ")"}], "!"}], " ", 
    RowBox[{
     RowBox[{"(", 
      RowBox[{
       RowBox[{"-", "k"}], "+", "y"}], ")"}], "!"}], " ", 
    RowBox[{"Gamma", "[", "\[Alpha]0", "]"}], " ", 
    RowBox[{"HypergeometricPFQRegularized", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
        RowBox[{"-", "x"}], ",", 
        RowBox[{"-", "y"}], ",", "\[Alpha]0"}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"1", "-", "x", "-", "\[Alpha]1"}], ",", 
        RowBox[{"1", "-", "y", "-", "\[Alpha]2"}]}], "}"}], ",", 
      RowBox[{
       FractionBox["1", "2"], " ", 
       RowBox[{"(", 
        RowBox[{"1", "+", "\[Beta]1"}], ")"}], " ", 
       RowBox[{"(", 
        RowBox[{"1", "+", "\[Beta]2"}], ")"}]}]}], "]"}]}], ")"}]}]], "Output"]
}, Open  ]],

Cell["\<\
It turns out that this \[OpenCurlyDoubleQuote]simplified\
\[CloseCurlyDoubleQuote] formula for n=1 is not less expensive, although no \
effort has been made to optimize either case.\
\>", "Text"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"w", "[", 
    RowBox[{
    "207", ",", "400", ",", "140", ",", "250", ",", "90", ",", "220", ",", 
     "120"}], "]"}], ";"}], "//", "Timing"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"weights", "[", 
    RowBox[{"207", ",", "400", ",", "140", ",", "250", ",", "90", ",", 
     RowBox[{"{", "221", "}"}], ",", 
     RowBox[{"{", "120", "}"}]}], "]"}], ";"}], "//", "Timing"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "0.07266599999999999448530019208192243241`4.881931167793245", ",", "Null"}],
   "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "0.0086739999999999994190202912136555824`3.958819331092367", ",", "Null"}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"ListPlot", "[", 
  RowBox[{
   RowBox[{"w", "[", 
    RowBox[{
    "207", ",", "40", ",", "140", ",", "15", ",", "90", ",", "220", ",", 
     "120"}], "]"}], ",", 
   RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}], "\[IndentingNewLine]", 
 RowBox[{"ListPlot", "[", 
  RowBox[{
   RowBox[{"weights", "[", 
    RowBox[{"207", ",", "40", ",", "140", ",", "15", ",", "90", ",", 
     RowBox[{"{", "220", "}"}], ",", 
     RowBox[{"{", "120", "}"}]}], "]"}], ",", 
   RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}]}], "Input"],

Cell[BoxData[
 GraphicsBox[{{}, {{}, 
    {RGBColor[0.368417, 0.506779, 0.709798], PointSize[0.01388888888888889], 
     AbsoluteThickness[1.6], PointBox[CompressedData["
1:eJw1lAs0VHkcx8fUGSJRHlFqkGSmtqjReubLxOQRYzDelNZ4VGt72JDsaDge
KacHYtNhEk3aijrUbitbG7Wt8ursekRbFNZkO2ptWvY1v73n3HPP537u5577
/5/zu2YxSaJYJoPBSPnn/PeqOn5zmdtd2yq8es+ebmDFuyOWiyz0HFSogX07
7smZTWJiXbATylhtyaeI9WH21Lmr7es2YiM0Kx8UPeYyHVVsAgsvJ9593gZi
Uwz9OfurRLmd2Bw+zwzMFXOOEVvgreOr2IePG4gt8Sb0TEDXw0FiK+hvnTAu
SZ/rpGIu+LcO3Zpz0op4DVZtLi1LLPUmXouLufKU77m7ia1hbGcwuNPsKLEN
1lzhPqwvrSVej2/qLkVwh+4Tb0BDhd0290+HiXkoODytla5Qc1axLWbZks7Z
10uJN+LlQA/jvLMt8cfIOXqVm8v2I7bDZMH4QXWmhNgeP/xl3KGzOIPYAabX
xUPZYyeJHaEY48edKVQQO0GQc72r/ufbxM5gTRSZTAu6iDehjxtVz218SewC
bifXV6A7TQxkvV/ew1ylvek/lAKcaxYCSTtbxQxXlBlFxiRMWpN3Reip1tmm
alfybihPvvw87b0/eTe05U8lW49uJ8/Hix8PK+pT95Dno3FG84nkupT8ZvQ+
0by23reQ/GaYlb08wrp3hrw75o/8Up3wRkHeHQatmc84Uw3kPWDJr+DbTd0l
7wHbal5ni3YHeQG2iK64u8v7yQtg3xSnlyd/RX4LCpQHVs+smyS/BaOykBuZ
1bPkPTEn306zYrGGi8p7wtqq0je4apGKGV6IMZzI1Ys3Ie+F13FK9afCleS9
4bE91u24bB15b1T+oS3Ue7uRvA9q83TLelJB3gc1H7Sc9goF5LdirfXGABZf
SH4rdFx1BpdEicn7okOm8HggjiLvC9ufTmiPeX1C3g8+T5p25LYkkveDjKXb
+WLXHvJCfGeoM6q+7XMVQ4j8tLru/JB0el6IkflVWqaNmSpuFmKBYiTbsSeb
en9wltVb1RTnU++P3aMlTJmykHp/3FFbcS5m7AT1/jjVGJ16dlkx9SK0qhUb
pclKqRfBT525P0+znHoROBrD80p8K6gXoepkY5vBQjn1AeAdaBh60HSO+gCY
Fwpb1DzPUx+ApMgy/YWV1dQH4GBs6dGVN2uoD8T84d8dzbMvUB+IhgEbadIH
YmkgdMbr+78yUFAfCCMb9pcOHeQZQXh13GR/yrr/+yCk9C1d3WVL75cGYdii
kH1QSd/THIQOD+Mj/TFV1Iuhrj/d1F9F64EYO7svxCvv0nqlYvQKWWr6ctqP
ZjF4u41mEm/SfjGCse/5iXkm40XUByPWbax9USDttzQYGx61T8m1jlEfjIme
waJadi71IZBlZCXMvD1MfQjssxMzKswOUR8Cyw91HeX9ydSHILH28XIbtc+o
D8W4YdIXlt0S6kPxUfDS2LhL0dSHwv2Rw8BEUBD1oShOscxZ3+dNfRjSpkb2
7ypypT4MSn+TsNF4W+rDcHvBqJX3Qg71YWjvCvd0MqV5Y4QjN5HTHr18AfXh
mMve6yOR0/xKwxF9+mzNwC6lipvDceNcloib2UvzHYHMrPdvrtq0qBgRWBLf
y7xjWEd9BK7VFOjm9ZVQHwHXsxc5myoPUR8J3p2MlCvPo6mPRCprMjCn1In6
SLSyNEy7DPWpj8S7030u6XUv6P8bhfJvGV9cdqty/hslTxl6
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
  PlotRange->{{0., 120.}, {0, 0.048993523779664476`}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.02], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output"],

Cell[BoxData[
 GraphicsBox[{{}, {{}, 
    {RGBColor[0.368417, 0.506779, 0.709798], PointSize[0.01388888888888889], 
     AbsoluteThickness[1.6], PointBox[CompressedData["
1:eJw1lAs0VHkcx8dUhFXyKDFFrcS0W97JI18mz5FmDGMwKEWSsnXSqqSR1FRb
U1rEymryaLYXtqNlW2lFOo7jMdUmpK3ksfQ4tDYt7WN+3XPuuedzP/dzz/3/
z/ndRTFJQbFMBoOR8u/531V1vHE3fnDpLq+8YRXdwMC74xZ65vrOKpyJng0N
cmatkFgXftvy1VuSvyU2QE+nm7KlpoXYCNzhe9mtbKaLilmY5e9q32RvR2yG
O4yPf8SNbCBejFlDhosV004Sm8PYvT+2ubWK2AI3xQUCZXMvsSXEwa/n56ZO
d1UxG8vr9t+cdsaS+Av84pWXn5DHJV6OpLPylDvsbcTWOOVh2Lt10QliG/TU
sJsr8y4R2+LK9cti9osmYjtwS5zWe23vI7ZHwcEJ7VSFmpuKHbDSPK5j6pUJ
sSP0+zoZJW4OxCvRcbqcLTVdR+yE97LhfRrMOOJVSPjMuH32vDRiZ0irhS8y
h84Qu8DkFWdzgUxB7AqZ7Lqy8tEtYjeMjWazJnyUxKuh5RhVyb7xktgdv91n
B/roThADbximncylOqv/RwlQf9PcJ67NVMUMD8SbRsZsGbUm7wGX7LtTtaUe
5D3xYffVZ3vf88l7QnpiPNl6cAN5DsZaDioq9+wgz4HnR60Hcdcl5NegvEvr
R9tAGfk1eFf48rh6QwF5L0hf/V665a2CvBcGmtKfWo1XkfeGnncRx2m8nrw3
bpfYdzTqtJP3gbvgmpeXvJu8Dxbc2qx/VN5P3hedw18vm1wxSt4XmZmin9JL
p8j74ZTMSato3kx3lffDfPb5wNBiPRUz/CGa+1qqH88i74+yxBGNHt4S8lys
2RjreTpjBXkulv6tw9MfcyQfgEapbn7nHpAPgO+UtutOng/5teBbOwrUOTzy
azGdM7vXOEpIPhAZRxTe94RR5APh8ihLZ8h/E/l18FXWbpQ2JpBfB2jodjxP
3EGeB03D2YMa63erGDxMJlfcPyZKped5mKFTrG12I13FdTxEXB3IdOnMpJ4P
rQWVlmU5x6jngz+Sy8wYkVHPh9WMzy/EDGVRz0fXz9F7ChfkUB+EpzNyjPZm
5FEfhBh15q6jWueoD0KHRp9mbmAR9UFoyr3RYjhHTr0A9SlVL+7VXqBegL0y
XqOaXwn1AvRF5xvMOV9KvQCp8XknllSXUR+Maf1/uizOvEh9MIS9NpKkD8SS
YGS8qey+YqigPhgSW9PvnNvJM0KQeIa1K2XFpz4EAT0my5QO9H5JCGLYMtN9
I/Q9dSFID5h/vDummHohJuZN1HYX03ogRPXDi/Ej9bReiRDNAnU1AzntR50Q
6duNJhOqab8YobDrz9JkDWdTH4pqj6E2vWDab0koklrbxuXaJ6kPBau3N/uS
qZR6EUrSDm2ZHDtIvQg1hxPSihbtp16ETVMV7ee6k6kXYcmV1oU2al9RHwa5
UdIBi/tx1IchK9wkdvPlaOrD0NDu/OR1SAj1Yfg+zeKIbReX+nCc/WtgV2K2
B/XhuMVnhQ/GO1AfDk39QUvuHCvqw2H3MMLP1YzmjRGBj9ut2qIXzqI+AlUW
OwPi5DS/kgh4FhSWPUkcUXFdBDYpDgWx0x/TfIthdPj923KbRhVDjC+3Pmb+
OreCejGeKL7RPdqVS70YyqIfrFaf3099JHLupKVcexZNfSTCdEaDj+S5Uh8J
mfZMM+VcA+ojwSnsck+teE7/3yjU3GYcuOpZ7PYPcsgblw==
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
  PlotRange->{{0., 120.}, {0, 0.048993523779672386`}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.02], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["Compiled Version", "Subsubsection"],

Cell["Write a compiled version of the function to speed things up:", "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{"w2", "=", 
   RowBox[{"Compile", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"\[Mu]x", ",", "_Real"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"\[Sigma]x", ",", "_Real"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"\[Mu]y", ",", "_Real"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"\[Sigma]y", ",", "_Real"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"\[Sigma]xy", ",", "_Real"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"x", ",", "_Real"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"y", ",", "_Real"}], "}"}]}], "}"}], ",", 
     RowBox[{"Module", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"p", ",", "out", ",", "indeces", ",", "max", ",", 
         RowBox[{"\[Alpha]1", "=", 
          RowBox[{"-", 
           FractionBox[
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{"\[Mu]x", "-", "\[Sigma]xy"}], ")"}], "2"], 
            RowBox[{
             RowBox[{"-", 
              SuperscriptBox["\[Sigma]x", "2"]}], "+", "\[Sigma]xy"}]]}]}], 
         ",", 
         RowBox[{"\[Alpha]2", "=", 
          RowBox[{"-", 
           FractionBox[
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{"\[Mu]y", "-", "\[Sigma]xy"}], ")"}], "2"], 
            RowBox[{"\[Sigma]xy", "-", 
             SuperscriptBox["\[Sigma]y", "2"]}]]}]}], ",", 
         RowBox[{"\[Alpha]0", "=", "\[Sigma]xy"}], ",", 
         RowBox[{"\[Beta]1", "=", 
          FractionBox[
           RowBox[{
            RowBox[{"-", "\[Mu]x"}], "+", "\[Sigma]xy"}], 
           RowBox[{
            RowBox[{"-", 
             SuperscriptBox["\[Sigma]x", "2"]}], "+", "\[Sigma]xy"}]]}], ",", 
         
         RowBox[{"\[Beta]2", "=", 
          FractionBox[
           RowBox[{
            RowBox[{"-", "\[Mu]y"}], "+", "\[Sigma]xy"}], 
           RowBox[{"\[Sigma]xy", "-", 
            SuperscriptBox["\[Sigma]y", "2"]}]]}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"p", "=", 
         RowBox[{"Exp", "@", 
          RowBox[{"Table", "[", "\[IndentingNewLine]", 
           RowBox[{
            RowBox[{
             RowBox[{"\[Alpha]1", " ", 
              RowBox[{"Log", "[", "\[Beta]1", "]"}]}], "+", 
             RowBox[{"\[Alpha]2", " ", 
              RowBox[{"Log", "[", "\[Beta]2", "]"}]}], "+", 
             RowBox[{"LogGamma", "[", 
              RowBox[{"\[Alpha]1", "-", "k", "+", "x"}], "]"}], "+", 
             RowBox[{"LogGamma", "[", 
              RowBox[{"\[Alpha]2", "-", "k", "+", "y"}], "]"}], "+", 
             RowBox[{"LogGamma", "[", 
              RowBox[{"\[Alpha]0", "+", "k"}], "]"}], "\[IndentingNewLine]", 
             "+", 
             RowBox[{"k", " ", 
              RowBox[{"Log", "[", 
               FractionBox[
                RowBox[{
                 RowBox[{"(", 
                  RowBox[{"1", "+", "\[Beta]1"}], ")"}], 
                 RowBox[{"(", 
                  RowBox[{"1", "+", "\[Beta]2"}], ")"}]}], "2"], "]"}]}], 
             "\[IndentingNewLine]", "-", 
             RowBox[{"LogGamma", "[", 
              RowBox[{"x", "-", "k", "+", "1"}], "]"}], "-", 
             RowBox[{"LogGamma", "[", 
              RowBox[{"y", "-", "k", "+", "1"}], "]"}], "-", 
             RowBox[{"LogGamma", "[", 
              RowBox[{"k", "+", "1"}], "]"}], "-", 
             RowBox[{"LogGamma", "[", "\[Alpha]1", "]"}], "-", 
             RowBox[{"LogGamma", "[", "\[Alpha]2", "]"}], "-", 
             RowBox[{"LogGamma", "[", "\[Alpha]0", "]"}]}], 
            "\[IndentingNewLine]", ",", "\[IndentingNewLine]", 
            RowBox[{"{", 
             RowBox[{"k", ",", "0", ",", 
              RowBox[{"Min", "[", 
               RowBox[{"x", ",", "y"}], "]"}]}], "}"}]}], "]"}]}]}], ";", 
        "\[IndentingNewLine]", 
        RowBox[{"p", "=", 
         RowBox[{"p", "/", 
          RowBox[{"Total", "[", "p", "]"}]}]}], ";", "\[IndentingNewLine]", 
        RowBox[{"max", "=", 
         RowBox[{"Max", "[", "p", "]"}]}], ";", "\[IndentingNewLine]", 
        RowBox[{"out", "=", 
         RowBox[{"Transpose", "[", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"Range", "[", 
             RowBox[{"0", ",", 
              RowBox[{"Min", "[", 
               RowBox[{"x", ",", "y"}], "]"}]}], "]"}], ",", "p"}], "}"}], 
          "]"}]}], ";", "\[IndentingNewLine]", 
        RowBox[{
         RowBox[{"Select", "[", 
          RowBox[{"out", ",", 
           RowBox[{
            RowBox[{
             RowBox[{"#", "[", 
              RowBox[{"[", "2", "]"}], "]"}], ">", 
             RowBox[{"max", "/", "50"}]}], "&"}]}], "]"}], 
         "\[Transpose]"}]}]}], "\[IndentingNewLine]", "]"}]}], 
    "\[IndentingNewLine]", "]"}]}], ";"}]], "Input"],

Cell["This version is quite a bit faster.", "Text"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"w", "[", 
    RowBox[{
    "207", ",", "400", ",", "140", ",", "250", ",", "90", ",", "220", ",", 
     "120"}], "]"}], ";"}], "//", "AbsoluteTiming"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"w2", "[", 
    RowBox[{
    "207", ",", "400", ",", "140", ",", "250", ",", "90", ",", "220", ",", 
     "120"}], "]"}], ";"}], "//", "AbsoluteTiming"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"weights", "[", 
    RowBox[{"207", ",", "400", ",", "140", ",", "250", ",", "90", ",", 
     RowBox[{"{", "221", "}"}], ",", 
     RowBox[{"{", "125", "}"}]}], "]"}], ";"}], "//", 
  "AbsoluteTiming"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.036264`", ",", "Null"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.000236`", ",", "Null"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.007419`", ",", "Null"}], "}"}]], "Output"]
}, Open  ]],

Cell["Check that it matches the previous function too:", "Text"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"ListPlot", "[", 
  RowBox[{
   RowBox[{
    RowBox[{"w2", "[", 
     RowBox[{
     "207", ",", "40", ",", "140", ",", "15", ",", "90", ",", "220", ",", 
      "120"}], "]"}], "\[Transpose]"}], ",", 
   RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}], "\[IndentingNewLine]", 
 RowBox[{"ListPlot", "[", 
  RowBox[{
   RowBox[{
    RowBox[{"relevantWeights", "[", 
     RowBox[{"207", ",", "40", ",", "140", ",", "15", ",", "90", ",", 
      RowBox[{"List", "@", "220"}], ",", 
      RowBox[{"List", "@", "120"}]}], "]"}], "\[Transpose]"}], ",", 
   RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}]}], "Input"],

Cell[BoxData[
 GraphicsBox[{{}, {{}, 
    {RGBColor[0.368417, 0.506779, 0.709798], PointSize[0.012833333333333334`],
      AbsoluteThickness[1.6], PointBox[CompressedData["
1:eJxTTMoPSmViYGDQBWIQDQG+DpuMzYLZnAPswdwGXwdON/77UnFhED6Dn4Nd
x0q3k2FxUHk/h8Lbk3hfeaVA5f0dpl/bl9xxLAsq7++wkVXg0uOcQqh8gMMW
Gf6X7AllEL5DgINh48YrXRE1UPUBDnIcS7gVtjdC+AcCHB4ve9FqfbMVqj/Q
YaL8Jo3l07qg+gMdOj9NZ2p+2w/VH+ggx6S8OOnVJKj+QIfWHfGV82SnQfUH
OVxlnyZR1TwTqj/IQZKbqaSTay5Uf5CDGOdTzul+C6D6gxxkZ2w/Kyq4CKo/
2OFL1bYnJ/cthuoPdlCZHHCM0XMpVH+wg3f8LBHBhcug+oMd4vJn9qruXA7V
H+IQ+PSbtVLrCqj+EAeN+4YN+b+h/IYQh9hXm+6sFV0J1R/i4GYkP9vqIlSe
IdThywyZkgp9mP5Qh9Yb0tqXTaHmN4Q6GKn2y1e/hbrnQKiDjotk952kJVD9
YQ7LxX/tu7ME6h+HMIfAqysy3h6G+rchzMEznI1RZBE0PA6EOcgVSPzN2gkN
L4Zwh/YXkzhl3kyF6g93MHZ5dUEoBBreDeEOOVcvfF/E3QfVH+6w8t79qavl
O6D6IxyK6lsy/35pguqPcDDvzKpboFgL1R/hwM+46eLcO6VQ/REOgqvPyxky
FkD1RzoIyuXXq11Jg+qPdDBIkU5NXxMP1R/poH/J6t770FB7AFIWyxI=
      
      "]]}, {}}, {}, {}, {{}, {}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{None, None},
  AxesOrigin->{57.31250000000001, 0},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  ImagePadding->All,
  Method->{"CoordinatesToolOptions" -> {"DisplayFunction" -> ({
        (Part[{{Identity, Identity}, {Identity, Identity}}, 1, 2][#]& )[
         Part[#, 1]], 
        (Part[{{Identity, Identity}, {Identity, Identity}}, 2, 2][#]& )[
         Part[#, 2]]}& ), "CopiedValueFunction" -> ({
        (Part[{{Identity, Identity}, {Identity, Identity}}, 1, 2][#]& )[
         Part[#, 1]], 
        (Part[{{Identity, Identity}, {Identity, Identity}}, 2, 2][#]& )[
         Part[#, 2]]}& )}},
  PlotRange->{{58., 102.}, {0, 0.048993523779661464`}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.02], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output"],

Cell[BoxData[
 GraphicsBox[{{}, {{}, 
    {RGBColor[0.368417, 0.506779, 0.709798], PointSize[0.012833333333333334`],
      AbsoluteThickness[1.6], PointBox[CompressedData["
1:eJw10F9IU1EcB/BLiK0tyghTCKEJPrTyoQhDQ/ZFEUTddv/s3rtRuLbcCB9M
IWcDhRuxqJQyha0eiqGzKQztQR+MzMsaGSQsN9JIHyo0GjIhxFIw1p/9PHA4
/M73fM7h/PSua7x7H8Mw5X/nv/X/UJogfx5Pu0TWmNswYfNr5+VLXVKuVkxI
Fs1va33NlJthNk69STlbKDfD17ekia+2Um5BY6znZb/SQbkFut2TwUafl3IW
gYPN7r4b3bkaLKShurcn3t2k8yyi4VD22w9/rlZZ7MqJmejkPfIc7HWzO3Oa
fvIc1pgrllfZAfIcDnjGDcGKAHkO9b/ObdeHHpPnYa6+kBVOPSHPI5PfMsE4
Q+R5bIyslnSXDZHncZoLuAs/DJMXEDof8WidI+QFBILqmacvnpEXMByIpTdS
EfICZjq21hdCo+StWJnUx8NFY+StWHt0O8acpVqxIqrbrECGzqtWqA8HW+ca
9ryICUfCqGHpfoho+lTprc7fe19EQZts/uILkxfxsVS/np6m/zASfhfwvcuL
9F9IqDpSO3r3NfVDkVBWMx33LlK/VAm6pYXUSh71k5ERue6Px69SvyEjr7I9
8aD8PnkZ3EXD1PeqO+RlZHqLD7u1t8jbUHjo53F/TQ95G2afD5SYtjrJ2zDf
teyoPdpO3gatZawhk/GQtyO5U5o0vHeQt2PQdax4f5to/APW29hs
      
      "]]}, {}}, {}, {}, {{}, {}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{None, None},
  AxesOrigin->{56.3125, 0},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  ImagePadding->All,
  Method->{"CoordinatesToolOptions" -> {"DisplayFunction" -> ({
        (Part[{{Identity, Identity}, {Identity, Identity}}, 1, 2][#]& )[
         Part[#, 1]], 
        (Part[{{Identity, Identity}, {Identity, Identity}}, 2, 2][#]& )[
         Part[#, 2]]}& ), "CopiedValueFunction" -> ({
        (Part[{{Identity, Identity}, {Identity, Identity}}, 1, 2][#]& )[
         Part[#, 1]], 
        (Part[{{Identity, Identity}, {Identity, Identity}}, 2, 2][#]& )[
         Part[#, 2]]}& )}},
  PlotRange->{{57., 101.}, {0, 0.049209617372342675`}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.02], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["Correlated distributions", "Subsubsection"],

Cell["\<\
Now make priors and posteriors for the bivariate Poisson likelihood:\
\>", "Text"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"prior2", "[", 
   RowBox[{
   "\[Mu]x_", ",", "\[Sigma]x_", ",", "\[Mu]y_", ",", "\[Sigma]y_", ",", 
    "\[Sigma]xy_", ",", "xdat_", ",", "ydat_"}], "]"}], ":=", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"\[Theta]1", ",", "\[Theta]2", ",", "\[Theta]3"}], "}"}], ",", 
    RowBox[{"TransformedDistribution", "[", "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
        RowBox[{"\[Theta]1", "+", "\[Theta]3"}], ",", 
        RowBox[{"\[Theta]2", "+", "\[Theta]3"}]}], "}"}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"\[Theta]1", "\[Distributed]", 
         RowBox[{"GammaDistribution", "[", 
          RowBox[{
           RowBox[{"N", "[", 
            RowBox[{"-", 
             FractionBox[
              SuperscriptBox[
               RowBox[{"(", 
                RowBox[{"\[Mu]x", "-", "\[Sigma]xy"}], ")"}], "2"], 
              RowBox[{
               RowBox[{"-", 
                SuperscriptBox["\[Sigma]x", "2"]}], "+", "\[Sigma]xy"}]]}], 
            "]"}], ",", 
           SuperscriptBox[
            RowBox[{"(", 
             FractionBox[
              RowBox[{
               RowBox[{"-", "\[Mu]x"}], "+", "\[Sigma]xy"}], 
              RowBox[{
               RowBox[{"-", 
                SuperscriptBox["\[Sigma]x", "2"]}], "+", "\[Sigma]xy"}]], 
             ")"}], 
            RowBox[{"-", "1"}]]}], "]"}]}], ",", "\[IndentingNewLine]", 
        RowBox[{"\[Theta]2", "\[Distributed]", 
         RowBox[{"GammaDistribution", "[", 
          RowBox[{
           RowBox[{"N", "[", 
            RowBox[{"-", 
             FractionBox[
              SuperscriptBox[
               RowBox[{"(", 
                RowBox[{"\[Mu]y", "-", "\[Sigma]xy"}], ")"}], "2"], 
              RowBox[{"\[Sigma]xy", "-", 
               SuperscriptBox["\[Sigma]y", "2"]}]]}], "]"}], ",", 
           SuperscriptBox[
            RowBox[{"(", 
             FractionBox[
              RowBox[{
               RowBox[{"-", "\[Mu]y"}], "+", "\[Sigma]xy"}], 
              RowBox[{"\[Sigma]xy", "-", 
               SuperscriptBox["\[Sigma]y", "2"]}]], ")"}], 
            RowBox[{"-", "1"}]]}], "]"}]}], ",", "\[IndentingNewLine]", 
        RowBox[{"\[Theta]3", "\[Distributed]", 
         RowBox[{"GammaDistribution", "[", 
          RowBox[{
           RowBox[{"N", "[", "\[Sigma]xy", "]"}], ",", "1"}], "]"}]}]}], 
       "}"}]}], "\[IndentingNewLine]", "]"}]}], 
   "]"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"priorpdf2", "[", 
   RowBox[{
   "\[Alpha]_", ",", "\[Beta]_", ",", "\[Mu]x_", ",", "\[Sigma]x_", ",", 
    "\[Mu]y_", ",", "\[Sigma]y_", ",", "\[Sigma]xy_", ",", "xdat_", ",", 
    "ydat_"}], "]"}], ":=", 
  RowBox[{"NIntegrate", "[", 
   RowBox[{
    RowBox[{
     RowBox[{"PDF", "[", 
      RowBox[{
       RowBox[{"GammaDistribution", "[", 
        RowBox[{
         RowBox[{"N", "[", 
          RowBox[{"-", 
           FractionBox[
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{"\[Mu]x", "-", "\[Sigma]xy"}], ")"}], "2"], 
            RowBox[{
             RowBox[{"-", 
              SuperscriptBox["\[Sigma]x", "2"]}], "+", "\[Sigma]xy"}]]}], 
          "]"}], ",", 
         SuperscriptBox[
          RowBox[{"(", 
           FractionBox[
            RowBox[{
             RowBox[{"-", "\[Mu]x"}], "+", "\[Sigma]xy"}], 
            RowBox[{
             RowBox[{"-", 
              SuperscriptBox["\[Sigma]x", "2"]}], "+", "\[Sigma]xy"}]], ")"}], 
          RowBox[{"-", "1"}]]}], "]"}], ",", 
       RowBox[{"\[Alpha]", "-", "\[Xi]"}]}], "]"}], "*", 
     RowBox[{"PDF", "[", 
      RowBox[{
       RowBox[{"GammaDistribution", "[", 
        RowBox[{
         RowBox[{"N", "[", 
          RowBox[{"-", 
           FractionBox[
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{"\[Mu]y", "-", "\[Sigma]xy"}], ")"}], "2"], 
            RowBox[{"\[Sigma]xy", "-", 
             SuperscriptBox["\[Sigma]y", "2"]}]]}], "]"}], ",", 
         SuperscriptBox[
          RowBox[{"(", 
           FractionBox[
            RowBox[{
             RowBox[{"-", "\[Mu]y"}], "+", "\[Sigma]xy"}], 
            RowBox[{"\[Sigma]xy", "-", 
             SuperscriptBox["\[Sigma]y", "2"]}]], ")"}], 
          RowBox[{"-", "1"}]]}], "]"}], ",", 
       RowBox[{"\[Beta]", "-", "\[Xi]"}]}], "]"}], "*", 
     RowBox[{"PDF", "[", 
      RowBox[{
       RowBox[{"GammaDistribution", "[", 
        RowBox[{
         RowBox[{"N", "[", "\[Sigma]xy", "]"}], ",", "1"}], "]"}], ",", 
       "\[Xi]"}], "]"}]}], ",", 
    RowBox[{"{", 
     RowBox[{"\[Xi]", ",", "0", ",", 
      RowBox[{"3", "*", "\[Mu]x"}]}], "}"}]}], "]"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"posterior2", "[", 
   RowBox[{
   "\[Mu]x_", ",", "\[Sigma]x_", ",", "\[Mu]y_", ",", "\[Sigma]y_", ",", 
    "\[Sigma]xy_", ",", "xdat_", ",", "ydat_"}], "]"}], ":=", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
     "\[Theta]1", ",", "\[Theta]2", ",", "\[Theta]3", ",", "w", ",", "idxs", 
      ",", "\[Alpha]1", ",", "\[Alpha]2", ",", "\[Alpha]3", ",", "\[Beta]1", 
      ",", "\[Beta]2", ",", "n"}], "}"}], ",", "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"\[Alpha]1", "=", 
      RowBox[{"-", 
       RowBox[{"N", "@", 
        FractionBox[
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{"\[Mu]x", "-", "\[Sigma]xy"}], ")"}], "2"], 
         RowBox[{
          RowBox[{"-", 
           SuperscriptBox["\[Sigma]x", "2"]}], "+", "\[Sigma]xy"}]]}]}]}], 
     ";", 
     RowBox[{"\[Alpha]2", "=", 
      RowBox[{"-", 
       RowBox[{"N", "@", 
        FractionBox[
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{"\[Mu]y", "-", "\[Sigma]xy"}], ")"}], "2"], 
         RowBox[{"\[Sigma]xy", "-", 
          SuperscriptBox["\[Sigma]y", "2"]}]]}]}]}], ";", 
     RowBox[{"\[Alpha]3", "=", 
      RowBox[{"N", "@", "\[Sigma]xy"}]}], ";", 
     RowBox[{"\[Beta]1", "=", 
      RowBox[{"N", "@", 
       FractionBox[
        RowBox[{
         RowBox[{"-", "\[Mu]x"}], "+", "\[Sigma]xy"}], 
        RowBox[{
         RowBox[{"-", 
          SuperscriptBox["\[Sigma]x", "2"]}], "+", "\[Sigma]xy"}]]}]}], ";", 
     RowBox[{"\[Beta]2", "=", 
      RowBox[{"N", "@", 
       FractionBox[
        RowBox[{
         RowBox[{"-", "\[Mu]y"}], "+", "\[Sigma]xy"}], 
        RowBox[{"\[Sigma]xy", "-", 
         SuperscriptBox["\[Sigma]y", "2"]}]]}]}], ";", "\[IndentingNewLine]", 
     
     RowBox[{"n", "=", 
      RowBox[{"Length", "@", "xdat"}]}], ";", "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"idxs", ",", "w"}], "}"}], "=", 
      RowBox[{"relevantWeights", "[", 
       RowBox[{
       "\[Mu]x", ",", "\[Sigma]x", ",", "\[Mu]y", ",", "\[Sigma]y", ",", 
        "\[Sigma]xy", ",", "xdat", ",", "ydat"}], "]"}]}], ";", 
     "\[IndentingNewLine]", 
     RowBox[{"TransformedDistribution", "[", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\[Theta]1", "+", "\[Theta]3"}], ",", 
         RowBox[{"\[Theta]2", "+", "\[Theta]3"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{"\[Theta]1", ",", "\[Theta]2", ",", "\[Theta]3"}], "}"}], 
        "\[Distributed]", 
        RowBox[{"MixtureDistribution", "[", 
         RowBox[{"w", ",", "\[IndentingNewLine]", 
          RowBox[{"Table", "[", 
           RowBox[{
            RowBox[{"ProductDistribution", "[", "\[IndentingNewLine]", 
             RowBox[{
              RowBox[{"GammaDistribution", "[", 
               RowBox[{
                RowBox[{"\[Alpha]1", "-", "k", "+", 
                 RowBox[{"Total", "[", "xdat", "]"}]}], ",", 
                SuperscriptBox[
                 RowBox[{"(", 
                  RowBox[{"\[Beta]1", "+", "n"}], ")"}], 
                 RowBox[{"-", "1"}]]}], "]"}], ",", "\[IndentingNewLine]", 
              RowBox[{"GammaDistribution", "[", 
               RowBox[{
                RowBox[{"\[Alpha]2", "-", "k", "+", 
                 RowBox[{"Total", "[", "ydat", "]"}]}], ",", 
                SuperscriptBox[
                 RowBox[{"(", 
                  RowBox[{"\[Beta]2", "+", "n"}], ")"}], 
                 RowBox[{"-", "1"}]]}], "]"}], ",", "\[IndentingNewLine]", 
              RowBox[{"GammaDistribution", "[", 
               RowBox[{
                RowBox[{"\[Alpha]3", "+", "k"}], ",", 
                SuperscriptBox[
                 RowBox[{"(", 
                  RowBox[{"1", "+", "n"}], ")"}], 
                 RowBox[{"-", "1"}]]}], "]"}]}], "\[IndentingNewLine]", "]"}],
             ",", 
            RowBox[{"{", 
             RowBox[{"k", ",", "idxs"}], "}"}]}], "]"}]}], 
         "\[IndentingNewLine]", "]"}]}]}], "]"}]}]}], "\[IndentingNewLine]", 
   "]"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"posteriorpdf2", "[", 
    RowBox[{
    "\[Alpha]_", ",", "\[Beta]_", ",", "\[Mu]x_", ",", "\[Sigma]x_", ",", 
     "\[Mu]y_", ",", "\[Sigma]y_", ",", "\[Sigma]xy_", ",", "xdat_", ",", 
     "ydat_"}], "]"}], ":=", 
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
      "\[Theta]1", ",", "\[Theta]2", ",", "\[Theta]3", ",", "w", ",", "idxs", 
       ",", "\[Alpha]1", ",", "\[Alpha]2", ",", "\[Alpha]3", ",", "\[Beta]1", 
       ",", "\[Beta]2", ",", "n"}], "}"}], ",", "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{"\[Alpha]1", "=", 
       RowBox[{"-", 
        RowBox[{"N", "@", 
         FractionBox[
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{"\[Mu]x", "-", "\[Sigma]xy"}], ")"}], "2"], 
          RowBox[{
           RowBox[{"-", 
            SuperscriptBox["\[Sigma]x", "2"]}], "+", "\[Sigma]xy"}]]}]}]}], 
      ";", 
      RowBox[{"\[Alpha]2", "=", 
       RowBox[{"-", 
        RowBox[{"N", "@", 
         FractionBox[
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{"\[Mu]y", "-", "\[Sigma]xy"}], ")"}], "2"], 
          RowBox[{"\[Sigma]xy", "-", 
           SuperscriptBox["\[Sigma]y", "2"]}]]}]}]}], ";", 
      RowBox[{"\[Alpha]3", "=", 
       RowBox[{"N", "@", "\[Sigma]xy"}]}], ";", 
      RowBox[{"\[Beta]1", "=", 
       RowBox[{"N", "@", 
        FractionBox[
         RowBox[{
          RowBox[{"-", "\[Mu]x"}], "+", "\[Sigma]xy"}], 
         RowBox[{
          RowBox[{"-", 
           SuperscriptBox["\[Sigma]x", "2"]}], "+", "\[Sigma]xy"}]]}]}], ";", 
      
      RowBox[{"\[Beta]2", "=", 
       RowBox[{"N", "@", 
        FractionBox[
         RowBox[{
          RowBox[{"-", "\[Mu]y"}], "+", "\[Sigma]xy"}], 
         RowBox[{"\[Sigma]xy", "-", 
          SuperscriptBox["\[Sigma]y", "2"]}]]}]}], ";", "\[IndentingNewLine]", 
      RowBox[{"n", "=", 
       RowBox[{"Length", "@", "xdat"}]}], ";", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"idxs", ",", "w"}], "}"}], "=", 
       RowBox[{"relevantWeights", "[", 
        RowBox[{
        "\[Mu]x", ",", "\[Sigma]x", ",", "\[Mu]y", ",", "\[Sigma]y", ",", 
         "\[Sigma]xy", ",", "xdat", ",", "ydat"}], "]"}]}], ";", 
      "\[IndentingNewLine]", 
      RowBox[{"Sum", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"w", "[", 
          RowBox[{"[", "k", "]"}], "]"}], 
         RowBox[{"NIntegrate", "[", 
          RowBox[{
           RowBox[{"Times", "[", "\[IndentingNewLine]", 
            RowBox[{
             RowBox[{"PDF", "[", 
              RowBox[{
               RowBox[{"GammaDistribution", "[", 
                RowBox[{
                 RowBox[{"\[Alpha]1", "-", "k", "+", 
                  RowBox[{"Total", "[", "xdat", "]"}]}], ",", 
                 SuperscriptBox[
                  RowBox[{"(", 
                   RowBox[{"\[Beta]1", "+", "n"}], ")"}], 
                  RowBox[{"-", "1"}]]}], "]"}], ",", 
               RowBox[{"\[Alpha]", "-", "\[Xi]"}]}], "]"}], ",", 
             "\[IndentingNewLine]", 
             RowBox[{"PDF", "[", 
              RowBox[{
               RowBox[{"GammaDistribution", "[", 
                RowBox[{
                 RowBox[{"\[Alpha]2", "-", "k", "+", 
                  RowBox[{"Total", "[", "ydat", "]"}]}], ",", 
                 SuperscriptBox[
                  RowBox[{"(", 
                   RowBox[{"\[Beta]2", "+", "n"}], ")"}], 
                  RowBox[{"-", "1"}]]}], "]"}], ",", 
               RowBox[{"\[Beta]", "-", "\[Xi]"}]}], "]"}], ",", 
             "\[IndentingNewLine]", 
             RowBox[{"PDF", "[", 
              RowBox[{
               RowBox[{"GammaDistribution", "[", 
                RowBox[{
                 RowBox[{"\[Alpha]3", "+", "k"}], ",", 
                 SuperscriptBox[
                  RowBox[{"(", 
                   RowBox[{"1", "+", "n"}], ")"}], 
                  RowBox[{"-", "1"}]]}], "]"}], ",", "\[Xi]"}], "]"}]}], 
            "\[IndentingNewLine]", "]"}], ",", 
           RowBox[{"{", 
            RowBox[{"\[Xi]", ",", "0", ",", 
             RowBox[{"3", "*", "\[Mu]x"}]}], "}"}]}], "]"}]}], ",", 
        "\[IndentingNewLine]", 
        RowBox[{"{", 
         RowBox[{"k", ",", 
          RowBox[{"Length", "@", "w"}]}], "}"}]}], "\[IndentingNewLine]", 
       "]"}]}]}], "\[IndentingNewLine]", "]"}]}], 
  "\[IndentingNewLine]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"ClearAll", "@", "priorkde2"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"priorkde2", "[", 
   RowBox[{
   "\[Mu]x_", ",", "\[Sigma]x_", ",", "\[Mu]y_", ",", "\[Sigma]y_", ",", 
    "\[Sigma]xy_", ",", "xdat_", ",", "ydat_"}], "]"}], ":=", 
  RowBox[{
   RowBox[{"priorkde2", "[", 
    RowBox[{
    "\[Mu]x", ",", "\[Sigma]x", ",", "\[Mu]y", ",", "\[Sigma]y", ",", 
     "\[Sigma]xy", ",", "xdat", ",", "ydat"}], "]"}], "=", 
   RowBox[{"KernelMixtureDistribution", "[", 
    RowBox[{
     RowBox[{"RandomVariate", "[", 
      RowBox[{
       RowBox[{"prior2", "[", 
        RowBox[{
        "\[Mu]x", ",", "\[Sigma]x", ",", "\[Mu]y", ",", "\[Sigma]y", ",", 
         "\[Sigma]xy", ",", "xdat", ",", "ydat"}], "]"}], ",", "1000"}], 
      "]"}], ",", "3"}], "]"}]}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"priorpdfkde2", "[", 
    RowBox[{
    "\[Alpha]_", ",", "\[Beta]_", ",", "\[Mu]x_", ",", "\[Sigma]x_", ",", 
     "\[Mu]y_", ",", "\[Sigma]y_", ",", "\[Sigma]xy_", ",", "xdat_", ",", 
     "ydat_"}], "]"}], ":=", 
   RowBox[{"PDF", "[", 
    RowBox[{
     RowBox[{"priorkde2", "[", 
      RowBox[{
      "\[Mu]x", ",", "\[Sigma]x", ",", "\[Mu]y", ",", "\[Sigma]y", ",", 
       "\[Sigma]xy", ",", "xdat", ",", "ydat"}], "]"}], ",", 
     RowBox[{"{", 
      RowBox[{"\[Alpha]", ",", "\[Beta]"}], "}"}]}], "]"}]}], 
  "\[IndentingNewLine]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"ClearAll", "@", "posteriorkde2"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"posteriorkde2", "[", 
   RowBox[{
   "\[Mu]x_", ",", "\[Sigma]x_", ",", "\[Mu]y_", ",", "\[Sigma]y_", ",", 
    "\[Sigma]xy_", ",", "xdat_", ",", "ydat_"}], "]"}], ":=", 
  RowBox[{
   RowBox[{"posteriorkde2", "[", 
    RowBox[{
    "\[Mu]x", ",", "\[Sigma]x", ",", "\[Mu]y", ",", "\[Sigma]y", ",", 
     "\[Sigma]xy", ",", "xdat", ",", "ydat"}], "]"}], "=", 
   RowBox[{"KernelMixtureDistribution", "[", 
    RowBox[{
     RowBox[{"RandomVariate", "[", 
      RowBox[{
       RowBox[{"posterior2", "[", 
        RowBox[{
        "\[Mu]x", ",", "\[Sigma]x", ",", "\[Mu]y", ",", "\[Sigma]y", ",", 
         "\[Sigma]xy", ",", "xdat", ",", "ydat"}], "]"}], ",", "1000"}], 
      "]"}], ",", "3"}], "]"}]}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"posteriorkdepdf2", "[", 
   RowBox[{
   "\[Alpha]_", ",", "\[Beta]_", ",", "\[Mu]x_", ",", "\[Sigma]x_", ",", 
    "\[Mu]y_", ",", "\[Sigma]y_", ",", "\[Sigma]xy_", ",", "xdat_", ",", 
    "ydat_"}], "]"}], ":=", 
  RowBox[{"PDF", "[", 
   RowBox[{
    RowBox[{"posteriorkde2", "[", 
     RowBox[{
     "\[Mu]x", ",", "\[Sigma]x", ",", "\[Mu]y", ",", "\[Sigma]y", ",", 
      "\[Sigma]xy", ",", "xdat", ",", "ydat"}], "]"}], ",", 
    RowBox[{"{", 
     RowBox[{"\[Alpha]", ",", "\[Beta]"}], "}"}]}], "]"}]}]}], "Input"],

Cell["Kernel density version is faster to evaluate:", "Text"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"posteriorpdf2", "[", 
   RowBox[{
   "200", ",", "150", ",", "207", ",", "40", ",", "140", ",", "15", ",", "90",
     ",", 
    RowBox[{"{", 
     RowBox[{"220", ",", "175", ",", "180"}], "}"}], ",", 
    RowBox[{"{", 
     RowBox[{"125", ",", "130", ",", "120"}], "}"}]}], "]"}], "//", 
  "Timing"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"posteriorkdepdf2", "[", 
   RowBox[{
   "200", ",", "150", ",", "207", ",", "40", ",", "140", ",", "15", ",", "90",
     ",", 
    RowBox[{"{", 
     RowBox[{"220", ",", "175", ",", "180"}], "}"}], ",", 
    RowBox[{"{", 
     RowBox[{"125", ",", "130", ",", "120"}], "}"}]}], "]"}], "//", 
  "Timing"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"1.476`", ",", "0.0001611334265205607`"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.824`", ",", "0.000036339608383494955`"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ListPlot", "[", 
  RowBox[{"{", "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"220", ",", "175", ",", "180"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"125", ",", "130", ",", "120"}], "}"}]}], "}"}], 
     "\[Transpose]"}], ",", "\[IndentingNewLine]", 
    RowBox[{"RandomVariate", "[", 
     RowBox[{
      RowBox[{"prior2", "[", 
       RowBox[{"207", ",", "40", ",", "140", ",", "15", ",", "90", ",", 
        RowBox[{"{", 
         RowBox[{"220", ",", "175", ",", "180"}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{"125", ",", "130", ",", "120"}], "}"}]}], "]"}], ",", 
      "300"}], "]"}], ",", "\[IndentingNewLine]", 
    RowBox[{"RandomVariate", "[", 
     RowBox[{
      RowBox[{"posterior2", "[", 
       RowBox[{"207", ",", "40", ",", "140", ",", "15", ",", "90", ",", 
        RowBox[{"{", 
         RowBox[{"220", ",", "175", ",", "180"}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{"125", ",", "130", ",", "120"}], "}"}]}], "]"}], ",", 
      "300"}], "]"}]}], "\[IndentingNewLine]", "}"}], "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{}, {{}, 
    {RGBColor[0.368417, 0.506779, 0.709798], PointSize[0.007333333333333334], 
     AbsoluteThickness[1.6], 
     PointBox[{{220., 125.}, {175., 130.}, {180., 120.}}]}, 
    {RGBColor[0.880722, 0.611041, 0.142051], PointSize[0.007333333333333334], 
     AbsoluteThickness[1.6], PointBox[CompressedData["
1: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

      "]]}, 
    {RGBColor[0.560181, 0.691569, 0.194885], PointSize[0.007333333333333334], 
     AbsoluteThickness[1.6], PointBox[CompressedData["
1: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
VI6V1PexiLojFrohjY88U0H4rkgB4sxD3YOWe2B6xbdF7zawGEuyd+mWoHDO
aNq9DlkGpSkzpj4M5+Pg8WUyScTv+bPjHgfNoRFy4ma8rYkA4t1bmXTi70FT
LSXkNgswaFDRqKdI9FyWdqL7CYsXY77xs1IplEz58GnXDRYDnS8tDcUpPJkg
W2yfRvr9+Z5//C3idx0jubd0Ocy0ueyowpJ53pRyYtEyDobTU+aFS3ggxapv
wblcBp1mPdel7SmoLDk5I+0sh/uzDkc3pdN48KN5RHImh6x7JovWE/33HKHC
Pd0EmP67rnpmIoUCTfnKRQ4chuqFnlbU0OiNyBmr/b4TaZ3VanGZPKwNF7/8
IYuFtkF+qRTJ77sVq18N+7H4FFW0KjeBQsh5pn1XOIu3bZusOoke1oY9ESp7
zEFLRGJDtwXJ97xMWcXrLDpd5uVDn+jBJP/XAzLPay19spQkaGT4zxx25Qng
v/S8oud9CrYis7dsIP0N077+23E1hUEX++0RYGCsOShVTubJozlpUKySxdKP
UweO29GosdANaXBicXLVvZfDl90RkOjWKRrIYn+sS/alle6QVovRmhtB8mRx
6tjm+TRUvteaKT4k+jmW9CqBJfV3zdE6LknmWZq1cErlY6xsX8U0loPYoUzX
1DwKVy8t6gXxj9llFV8Cib4v/L12uj+LQdWaExHzd/Eg1K66cvdaATSmjds4
t9CYO+tQjuEsFsmplmeD1lM4VTk2bB3Fwvt9/oKp5D7Ddo7KOWoCvFmdGa7m
SyEp+Jmp7lQO0dkf5SUJr3VvttJr7GCg1qxn45hJwX/0d31DEgODMdEk1XsU
EmQVolz/ZaFg+0G3hPhTZXG14awqFlIL1GWy/qUwPdv7ZCvhJ8ObO5rvNPDR
dOBAqrUOh+zjP1PbX/LQ1vWW+vKcg2yz6B9JYTL/5ibGfcIc8jU7/qTupyDr
dk6hvogFj4tMyPmHQn3Cm6uPn7LoTVoyrrOZwrbmLZkmOsQfzH9Nor1JflkO
XZJkid9KaXgLinn41WMneu0EC9f3eQVhLjRO9V2LH17DYWyyrN/2UR5e+ek3
GB9i0GTI8/L9w4O5SG+IF5kfn8ai1R4xfKykzMK0MzmYGpyPdfpMeOhnb8VW
OS9oF8zt9yJ5TPNFttoRPX3zWmz4yoaHsMJjXer9DJLkfyvXqvNx+dz+OENR
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
sMhxGA==
      "]]}, {}}, {}, {}, {{}, {}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{None, None},
  AxesOrigin->{117.12890920978678`, 99.98483567559967},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  ImagePadding->All,
  Method->{"CoordinatesToolOptions" -> {"DisplayFunction" -> ({
        (Part[{{Identity, Identity}, {Identity, Identity}}, 1, 2][#]& )[
         Part[#, 1]], 
        (Part[{{Identity, Identity}, {Identity, Identity}}, 2, 2][#]& )[
         Part[#, 2]]}& ), "CopiedValueFunction" -> ({
        (Part[{{Identity, Identity}, {Identity, Identity}}, 1, 2][#]& )[
         Part[#, 1]], 
        (Part[{{Identity, Identity}, {Identity, Identity}}, 2, 2][#]& )[
         Part[#, 2]]}& )}},
  PlotRange->{{119.43100442396299`, 266.7650981312414}, {104.0843222162556, 
   186.0740530293741}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.05], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output"]
}, Open  ]]
}, Closed]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Plots", "Subsection"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"makeEllipse", "[", 
   RowBox[{"p_", ",", "mat_"}], "]"}], ":=", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"d", ",", "v"}], "}"}], ",", 
    RowBox[{
     RowBox[{
      RowBox[{"{", 
       RowBox[{"d", ",", "v"}], "}"}], "=", 
      RowBox[{"Eigensystem", "[", "mat", "]"}]}], ";", 
     RowBox[{"Rotate", "[", 
      RowBox[{
       RowBox[{"Ellipsoid", "[", 
        RowBox[{"p", ",", 
         RowBox[{"Sqrt", "@", "d"}]}], "]"}], ",", 
       RowBox[{"ArcTan", "@@", 
        RowBox[{"(", 
         RowBox[{"First", "@", "v"}], ")"}]}]}], "]"}]}]}], 
   "]"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"plotcontour", "[", 
   RowBox[{
   "distpdf_", ",", "dist_", ",", "\[Mu]x_", ",", "\[Sigma]x_", ",", 
    "\[Mu]y_", ",", "\[Sigma]y_", ",", "\[Sigma]xy_", ",", "xdat_", ",", 
    "ydat_", ",", 
    RowBox[{"opt", ":", 
     RowBox[{"OptionsPattern", "[", "ListContourPlot", "]"}]}]}], "]"}], ":=", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
     "data", ",", "area", ",", "qu", ",", "pdf", ",", "num", ",", "stds", ",",
       "\[Alpha]min", ",", "\[Alpha]max", ",", "\[Alpha]step", ",", 
      "\[Beta]min", ",", "\[Beta]max", ",", "\[Beta]step", ",", "fig", ",", 
      "t", ",", "epilog", ",", "options", ",", "mean", ",", "covmatfun", ",", 
      "cov"}], "}"}], ",", "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"num", "=", "20"}], ";", "\[IndentingNewLine]", 
     RowBox[{"stds", "=", "2"}], ";", "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"\[Alpha]min", ",", "\[Alpha]max", ",", "\[Alpha]step"}], 
       "}"}], "=", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"\[Mu]x", "-", 
         RowBox[{"stds", "*", "\[Sigma]x"}]}], ",", 
        RowBox[{"\[Mu]x", "+", 
         RowBox[{"stds", "*", "\[Sigma]x"}]}], ",", 
        RowBox[{"2", "*", "stds", "*", 
         RowBox[{"\[Sigma]x", "/", "num"}]}]}], "}"}]}], ";", 
     "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"\[Beta]min", ",", "\[Beta]max", ",", "\[Beta]step"}], "}"}], 
      "=", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"\[Mu]y", "-", 
         RowBox[{"stds", "*", "\[Sigma]y"}]}], ",", 
        RowBox[{"\[Mu]y", "+", 
         RowBox[{"stds", "*", "\[Sigma]y"}]}], ",", 
        RowBox[{"2", "*", "stds", "*", 
         RowBox[{"\[Sigma]y", "/", "num"}]}]}], "}"}]}], ";", 
     "\[IndentingNewLine]", "\[IndentingNewLine]", 
     RowBox[{"epilog", "=", 
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{"FreeQ", "[", 
         RowBox[{
          RowBox[{"{", "opt", "}"}], ",", "Epilog"}], "]"}], ",", 
        RowBox[{"{", "}"}], ",", 
        RowBox[{
         RowBox[{"{", "Epilog", "}"}], "/.", 
         RowBox[{"{", "opt", "}"}]}]}], "]"}]}], ";", "\[IndentingNewLine]", 
     RowBox[{"options", "=", 
      RowBox[{"Sequence", "@@", 
       RowBox[{"Cases", "[", 
        RowBox[{
         RowBox[{"{", "opt", "}"}], ",", 
         RowBox[{"_", "?", 
          RowBox[{"(", 
           RowBox[{
            RowBox[{"FreeQ", "[", 
             RowBox[{"#", ",", "Epilog"}], "]"}], "&"}], ")"}]}]}], "]"}]}]}],
      ";", "\[IndentingNewLine]", "\[IndentingNewLine]", 
     RowBox[{"(*", 
      RowBox[{
      "ListContourPlot", " ", "is", " ", "fastest", " ", "with", " ", 
       "rectangle", " ", "of", " ", 
       RowBox[{"points", "."}]}], "*)"}], "\[IndentingNewLine]", 
     RowBox[{"data", "=", 
      RowBox[{
       RowBox[{"Table", "[", 
        RowBox[{
         RowBox[{"distpdf", "[", 
          RowBox[{
          "\[Alpha]", ",", "\[Beta]", ",", "\[Mu]x", ",", "\[Sigma]x", ",", 
           "\[Mu]y", ",", "\[Sigma]y", ",", "\[Sigma]xy", ",", "xdat", ",", 
           "ydat"}], "]"}], ",", 
         RowBox[{"{", 
          RowBox[{
          "\[Alpha]", ",", "\[Alpha]min", ",", "\[Alpha]max", ",", 
           "\[Alpha]step"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{
          "\[Beta]", ",", "\[Beta]min", ",", "\[Beta]max", ",", 
           "\[Beta]step"}], "}"}]}], "]"}], "\[Transpose]"}]}], ";", 
     "\[IndentingNewLine]", "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{"covmatfun", "[", "dat_", "]"}], ":=", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{
          RowBox[{"Variance", "[", 
           RowBox[{"dat", "[", 
            RowBox[{"[", 
             RowBox[{"All", ",", "1"}], "]"}], "]"}], "]"}], ",", 
          RowBox[{"Covariance", "@@", 
           RowBox[{"(", 
            RowBox[{"dat", "\[Transpose]"}], ")"}]}]}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"Covariance", "@@", 
           RowBox[{"(", 
            RowBox[{"dat", "\[Transpose]"}], ")"}]}], ",", 
          RowBox[{"Variance", "[", 
           RowBox[{"dat", "[", 
            RowBox[{"[", 
             RowBox[{"All", ",", "2"}], "]"}], "]"}], "]"}]}], "}"}]}], 
       "}"}]}], ";", "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"mean", ",", "cov"}], "}"}], "=", 
      RowBox[{
       RowBox[{
        RowBox[{"{", 
         RowBox[{
          RowBox[{"Mean", "[", "#", "]"}], ",", 
          RowBox[{"covmatfun", "[", "#", "]"}]}], "}"}], "&"}], "@", 
       RowBox[{"RandomVariate", "[", 
        RowBox[{
         RowBox[{"dist", "[", 
          RowBox[{
          "\[Mu]x", ",", "\[Sigma]x", ",", "\[Mu]y", ",", "\[Sigma]y", ",", 
           "\[Sigma]xy", ",", "xdat", ",", "ydat"}], "]"}], ",", 
         RowBox[{"10", "^", "4"}]}], "]"}]}]}], ";", "\[IndentingNewLine]", 
     RowBox[{"area", "=", 
      RowBox[{"\[Pi]", " ", 
       RowBox[{"(", 
        RowBox[{"Times", "@@", 
         RowBox[{"Sqrt", "[", 
          RowBox[{"Eigenvalues", "@", "cov"}], "]"}]}], ")"}]}]}], ";", 
     "\[IndentingNewLine]", 
     RowBox[{"Print", "@", "area"}], ";", "\[IndentingNewLine]", 
     RowBox[{"qu", "=", 
      RowBox[{"makeEllipse", "[", 
       RowBox[{"mean", ",", 
        RowBox[{"4.6", "cov"}]}], "]"}]}], ";", "\[IndentingNewLine]", 
     "\[IndentingNewLine]", 
     RowBox[{"fig", "=", 
      RowBox[{"ListContourPlot", "[", "\[IndentingNewLine]", 
       RowBox[{
       "data", ",", "\[IndentingNewLine]", "options", ",", 
        "\[IndentingNewLine]", 
        RowBox[{"DataRange", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{"\[Alpha]min", ",", "\[Alpha]max"}], "}"}], ",", 
           RowBox[{"{", 
            RowBox[{"\[Beta]min", ",", "\[Beta]max"}], "}"}]}], "}"}]}], ",", 
        "\[IndentingNewLine]", 
        RowBox[{"PlotRange", "\[Rule]", "All"}], ",", "\[IndentingNewLine]", 
        RowBox[{"FrameLabel", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{"\"\<\[Alpha]\>\"", ",", "\"\<\[Beta]\>\""}], "}"}]}], ",", 
        "\[IndentingNewLine]", 
        RowBox[{"ImageSize", "\[Rule]", "350"}], ",", "\[IndentingNewLine]", 
        RowBox[{"Epilog", "\[Rule]", 
         RowBox[{"{", "\[IndentingNewLine]", 
          RowBox[{
           RowBox[{"Opacity", "[", "0", "]"}], ",", 
           RowBox[{"EdgeForm", "[", 
            RowBox[{"{", 
             RowBox[{"Thick", ",", "Black", ",", "Dashed"}], "}"}], "]"}], 
           ",", "qu", ",", "\[IndentingNewLine]", 
           RowBox[{"Opacity", "[", "1", "]"}], ",", "Red", ",", 
           RowBox[{"PointSize", "[", "0.03", "]"}], ",", 
           RowBox[{"Point", "/@", 
            RowBox[{"(", 
             RowBox[{
              RowBox[{"{", 
               RowBox[{"xdat", ",", "ydat"}], "}"}], "\[Transpose]"}], 
             ")"}]}], ",", "\[IndentingNewLine]", 
           RowBox[{"(*", 
            RowBox[{"Black", ",", 
             RowBox[{"Text", "[", 
              RowBox[{
               RowBox[{"\"\<A=\>\"", "<>", 
                RowBox[{"ToString", "@", "area"}]}], ",", "mean", ",", 
               RowBox[{"{", 
                RowBox[{"Left", ",", "Top"}], "}"}], ",", 
               RowBox[{"Background", "\[Rule]", "LightRed"}]}], "]"}], ","}], 
            "*)"}], "\[IndentingNewLine]", "epilog"}], "\[IndentingNewLine]", 
          "}"}]}]}], "\[IndentingNewLine]", "]"}]}], ";", 
     "\[IndentingNewLine]", "\[IndentingNewLine]", "fig"}]}], 
   "\[IndentingNewLine]", "]"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"label", "[", "txt_", "]"}], ":=", 
  RowBox[{"Text", "[", 
   RowBox[{
    RowBox[{"Style", "[", 
     RowBox[{"txt", ",", "20", ",", "White"}], "]"}], ",", 
    RowBox[{"Scaled", "[", 
     RowBox[{"{", 
      RowBox[{"0.95", ",", "0.9"}], "}"}], "]"}], ",", 
    RowBox[{"{", 
     RowBox[{"1", ",", "0"}], "}"}]}], "]"}]}]}], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"With", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"\[Mu]x", "=", "200"}], ",", 
     RowBox[{"\[Mu]y", "=", "120"}], ",", 
     RowBox[{"\[Sigma]x", "=", "20"}], ",", 
     RowBox[{"\[Sigma]y", "=", "15"}], ",", 
     RowBox[{"\[Sigma]xy", "=", "100"}], ",", 
     RowBox[{"xdat", "=", 
      RowBox[{"{", "170", "}"}]}], ",", 
     RowBox[{"ydat", "=", 
      RowBox[{"{", "100", "}"}]}]}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"fig1", "=", 
     RowBox[{"GraphicsRow", "[", 
      RowBox[{"{", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"plotcontour", "[", 
         RowBox[{
         "priorpdf1", ",", "prior1", ",", "\[Mu]x", ",", "\[Sigma]x", ",", 
          "\[Mu]y", ",", "\[Sigma]y", ",", "\[Sigma]xy", ",", 
          RowBox[{"{", "}"}], ",", 
          RowBox[{"{", "}"}], ",", 
          RowBox[{"Epilog", "->", 
           RowBox[{"label", "[", "\"\<Prior\>\"", "]"}]}]}], "]"}], ",", 
        "\[IndentingNewLine]", 
        RowBox[{"plotcontour", "[", 
         RowBox[{
         "posteriorpdf1", ",", "posterior1", ",", "\[Mu]x", ",", "\[Sigma]x", 
          ",", "\[Mu]y", ",", "\[Sigma]y", ",", "\[Sigma]xy", ",", "xdat", 
          ",", "ydat", ",", 
          RowBox[{"Epilog", "\[Rule]", "\[IndentingNewLine]", 
           RowBox[{"label", "[", "\"\<Posterior\>\"", "]"}]}]}], "]"}]}], 
       "\[IndentingNewLine]", "}"}], "]"}]}], ";", "\[IndentingNewLine]", 
    RowBox[{"fig2", "=", 
     RowBox[{"GraphicsRow", "[", 
      RowBox[{"{", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"plotcontour", "[", 
         RowBox[{
         "priorpdf2", ",", "prior2", ",", "\[Mu]x", ",", "\[Sigma]x", ",", 
          "\[Mu]y", ",", "\[Sigma]y", ",", "\[Sigma]xy", ",", 
          RowBox[{"{", "}"}], ",", 
          RowBox[{"{", "}"}], ",", 
          RowBox[{"Epilog", "->", 
           RowBox[{"label", "[", "\"\<Prior\>\"", "]"}]}]}], "]"}], ",", 
        "\[IndentingNewLine]", 
        RowBox[{"plotcontour", "[", 
         RowBox[{
         "posteriorkdepdf2", ",", "posterior2", ",", "\[Mu]x", ",", 
          "\[Sigma]x", ",", "\[Mu]y", ",", "\[Sigma]y", ",", "\[Sigma]xy", 
          ",", "xdat", ",", "ydat", ",", 
          RowBox[{"Epilog", "->", 
           RowBox[{"label", "[", "\"\<Posterior\>\"", "]"}]}]}], "]"}]}], 
       "\[IndentingNewLine]", "}"}], "]"}]}], ";"}]}], "\[IndentingNewLine]", 
  "]"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData["940.0793016927622`"], "Print"],

Cell[BoxData["283.95363920136714`"], "Print"],

Cell[BoxData["891.829227644151`"], "Print"],

Cell[BoxData["219.80223109264094`"], "Print"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"label2", "[", "txt_", "]"}], ":=", 
   RowBox[{"Graphics", "[", 
    RowBox[{
     RowBox[{"Rotate", "[", 
      RowBox[{
       RowBox[{"Style", "[", 
        RowBox[{
         RowBox[{"Text", "[", "txt", "]"}], ",", "20"}], "]"}], ",", 
       RowBox[{"\[Pi]", "/", "2"}]}], "]"}], ",", 
     RowBox[{"ImageSize", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"18", ",", "300"}], "}"}]}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"exportme", "[", "\"\<bivar-correlated-update\>\"", "]"}], "@", 
  RowBox[{"Grid", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
        RowBox[{"label2", "@", "\"\<Uncorrelated\>\""}], ",", "fig1"}], "}"}],
       ",", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"label2", "[", "\"\<Correlated\>\"", "]"}], ",", "fig2"}], 
       "}"}]}], "}"}], ",", 
    RowBox[{"Dividers", "\[Rule]", "All"}], ",", 
    RowBox[{"Spacings", "\[Rule]", "3"}]}], "]"}]}]}], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {
     GraphicsBox[GeometricTransformationBox[
       StyleBox[InsetBox["\<\"Uncorrelated\"\>", {0, 0}],
        StripOnInput->False,
        FontSize->20], {{{0, -1}, {1, 0}}, Center}],
      ImageSize->{18, 300}], 
     GraphicsBox[{{}, {InsetBox[
         GraphicsBox[GraphicsComplexBox[CompressedData["
1:eJxlmXlcjGvYx0u2sm9lOSHHGpUW5CCXEEpZOqrZZzqzzxQiW8lQVJbDIZSU
oShZCifJ+tg6VNYIIUMoheJYkqX3Oe/bfT/v5+Kf5/Od3zM03+pyPb/bLnju
bEUzMzMzBwszs/+u//dHDv97MQQ0XRGbKVCO2EyJcsRmKpQjNlOjHLGZBuWI
zbQoR2ymQzliMz3KEZuFoByxWSjiJn8Q2PQ6YuKT5oiJT5ojJj5pjpj4pDli
4pPmiIlPmiMmPmmOmPikOWLik+aIiU/KTf7MgpruR0x80hwx8UlzxMQnzRET
nzRHTHzSHDHxSXPExCfNEROfNEdMfNIcMfFJuckfg3wyyCeDfDLIJ4N8Msgn
g3wyyCeDfDLIJ4N8Msgng3wyyCeDfDLIJ4N8Msgng3wyyCeDfBp4TVfEdH6S
HDGdnyRHTOcnyRHT+UlyxHR+khwxnZ8kR0znJ8kR0/lJcsR0fpIcMZ2fhMm8
5De9jpjOT5IjpvOT5Ijp/CQ5Yjo/SY6Yzk+SI6bzk+SI6fwkOWI6P0mOmM5P
kiOm85MwmZeCpvsR0/lJcsR0fpIcMZ2fJEdM5yfJEdP5SXLEdH6SHDGdnyRH
TOcnyRHT+UlyxHR+EibzEvlkkE8G+WSQTwb5ZJBPBvlkkE8G+WSQTwb5ZJBP
BvlkkE8G+WSQTwb5ZJBPBvlkkE8G+TQIm66I6fwkOWI6P0mOmM5PkiOm85Pk
iOn8JDliOj9JjpjOT5IjpvOT5Ijp/CQ5Yjo/CZN5KWp6HTGdnyRHTOcnyRHT
+UlyxHR+khwxnZ8kR0znJ8kR0/lJcsR0fpIcMZ2fJEdM5ydhMi/FTfcjpvOT
5Ijp/CQ5Yjo/SY6Yzk+SI6bzk+SI6fwkOWI6P0mOmM5PkiOm85PkiOn8JEzm
JfLJIJ8M8skgnwzyySCfDPLJIJ8M8skgnwzyySCfDPLJIJ8M8skgnwzyySCf
DPLJIJ8M8mmQNF0R0/lJcsR0fpIcMZ2fJEdM5yfJEdP5SXLEdH6SHDGdnyRH
TOcnyRHT+UlyxHR+Em7y11fa9Dpi4pPmiIlPmiMmPmmOmPikOWLik+aIiU+a
IyY+aY6Y+KQ5YuKT5oiJT8rk5xH5NCCfBuTTgHwakE8D8mlAPg3IpwH5NCCf
BuTTgHwakE8D8mlAPg3IpwH5NCCfBuTTgHwakE8T8mlCPk3Ipwn5NCGfJuTT
hHyakE8T8mlCPk3Ipwn5NCGfJuTThHyakE8T8mlCPk3Ipwn5NCGfIGu6HzHd
l0iOmO5LJEdM9yWSI6b7EskR032J5IjpvkRyxHRfIjliui+RHDHdl0iOmO5L
hJv8GZFPI/JpRD6NyKcR+TQin0bk04h8GpFPI/JpRD6NyKcR+TQin0bk04h8
GpFPI/JpRD6NyKcR+TQLbrofMd0/SY6Y7p8kR0z3T5IjpvsnyRHT/ZPkiOn+
SXLEdP8kOWK6f5IcMd0/SY6Y7p+Em/xJyf2IiU+aIyY+aY6Y+KQ5YuKT5oiJ
T5ojJj5pjpj4pDli4pPmiIlPmiMmPimT/Z3cj5ju8yRHTPd5kiOm+zzJEdN9
nuSI6T5PcsR0nyc5YrrPkxwx3edJjpju8yRHTPd57ut/2/O68PyYQKjkddr1
SfHz+Y1N3LeFJ9h8k2xcgrIXPr9RQVLycm2bQ4FQ3WJw9ts/8fmHClS7fH7d
Mo87L3qR9fFKL1/uPKjm1QoP8XTuPOiAS1VumZ47Dzo27F/Vit3cedDdW3e8
+tYFQv6RtM4lXfH5hRL2LrHyiFwdBNs6pNnG38LnC0pY7zRpU44Vdz4wqln6
sz15QZBi4GU4vcbnCWpI7j/o1uud3HnB5+BzV5/u5M4LxjUzO6A/HgTesmsj
/kzE5wk6eDW+4v3MmUGQY1p81+ItPi9QwL22EfrXo3jQTRC7rmcA7utVMMYv
98XZiTwQHQrLbXMR9/cqEAQJp7Z+zZ1XmPItLux5yZ1XtO2ns2104cGuo9cW
Gspw366Hkwm/N7e+EwTSxBKfeyu4Pn11fXChVzPcfyth+ud/y1yKeTByS3S+
2AX33yoI+bjJ2r4/H2SO6jNfpT/33Qnzzb3PP+DOD1q5V+6PzuPOD+rmpa4J
z+PODxr6OBtd73PnB8fTrz4S/MIHy9yOYzcN+7nvrs3JOZyfxoPyof7+Zctx
/60Hd1vP1Ins5/MvzE3bUI37bgVk3k8+0ODFh+k/rns6X8D9tRJ++/y2+HQa
H5opUnQ97+H+WgWfYrKGf8/kg+Oyr0cDCnB/rYa7gYun7PzBh/hT9glDfuA+
Ww05FeEFI65z/f8Wj4hCu+tc/9/hpttQ7Tc+fNg+psJuNe6ztRCzvSjAbyMf
2gydmn+xFPfZOvg3J2WaYiIfnG5k3cutxP11CDxf9zTWchEf1Jd2jswZxfXT
bx5NDLTdwfXP8/c+adEuBffPShisaKV6v00A+/+x7fh8Lu6fVRCeNlhaFCGA
OVYDNkX7475ZC5OFqaF7QgXAtLy9e/2Yn/vizcJevzl6C+D45g02a0f93Bef
dz4+XTlBAAvtHnkkOHB98d+u6lyRluuHW1uF5NhH4z5YAV2GLu/aQSmEeTae
7TwjuP5Xk2qudgau742IPuGe2AL3vWrIcBwb03YCe//yvlbDhv/c72Y8ind4
BkLoELXu9jp/3Pdq4fZQo+Tb70IQF+bVvdjI9bserSe+aBfK9blZs3l/1Qfg
PjcE9ri72Q+bLoTB0dFTZsXjPlcOQYbVf7mdFsLA+3XysYu5vtaig9nznjqu
n317c0Vu3tCf+9igKtfkgbuE8Ozi/kzXKpyrYeBnb5eut4WQK3I8tO4J7m81
sKbfyFFzrwghJS4tfeQ+ro9NHaa3npOD+1gduLRP+lzfSQRxPk4J+1Zz/atU
vcfrjJrrW1+FBURZJnH9avq+laX1S7j+tGjWxFyvEK4vrc4b47nEketHxzz9
1qLNa44XTlziOa2S60cfNrr/9SCF6zstx6usvhzg+k3LkyuT5Ku4PvNFn+An
PCXXX2bl5217vQ33l3IY8WfgQadAMbjXdph7eg3uKxVw/IJKlpMrhnzXQS5f
/18/Kd+SkLFzys995MBB3UZ7zRVD6sOau8c7/dxH7jdf795ushhKoy452Afh
flID03nj7Nv6iqHsQl3KtSFcH3m10wj9gBjcR+qgndsqVdeOYqjdXuW2RcH1
j+nrSjRxM7m+8V1Mif2uaK5f/H7/UfvoVK4/DJrTPUWXxvWFXg4ula2Wcv3g
671Zb+YH435QDWW63ZMulXN96pDsR5PflnN9aWJ0dca3QjH0tbxdXWvP9X1z
MuPu2Thw/d60msxzewfgfi8ERrR41/lUiRiGj+jreV3O9Xn7H9++NOES19eN
nh790aYM93VK2JGe+OuXzRKokd/YfacQ93UqGNTMQqTO4frNPlX1W11/kYJ5
t5vnvrbH/ZwG0j6d/ppqK4U/Sw6/d1r0cx9Xuf512MGzXJ+Z09GuYfhLCYRP
nbwn6xbu5/Swb17endxaCbSMi/04+znXz/34tPF1lxFc3zYojHej4Svu05TA
LL+Se2KmFCq7ZiT9O/jnvizueYP1cV8pLDfbtPngDNyfqSFMmThc6s71OQJT
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
           "], {{
             {RGBColor[0.148, 0.33, 0.54], EdgeForm[None], 
              GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJxNl0lwVkUUhd/rPyizDAIGgaoIJGFGWZFJhq0GCAE2rkCSECldSRRCkp0y
hZABypIABhECiiPgUKCoJbhT2IlbSxzXlBrLc+p+f+Hi5Hb3333v7Tucfinb
+kLD8ynLsil5lhUkZwgaZl7r0Z9jmhxGviO8LRxFXhCOCx8I7wsnhI+ED4Uu
9g0IQ8LHwhVhm/Cy8JLwrLCb+QahWWgSWoQOYa/1yHarZGeK39qFPUKZnN0l
+arWt6KvTVgnbEf3IL7Yv5PCJfzrFc4JZ4WD+PeGcIS1t4Ru4U3htNDD2hnh
EGvFM77TZeEA81NCRSHi0ptifhnbA8TsvNAnDOPHPvxz/Pajw/N+9npfuTBJ
mCw0ECPHa6Owg/lR2XtXcpHsH0nhg325rnGX8vm75q+kiJvj91QKnfck+1LE
q1Lre4lpaeF+7ss1PpTCv3kaX5OcJZ2va+0rjR/T+KTGX2s8V+NTGn+r8XKN
T2t8Q+NlGg9pfCDFnedKT2Me+fUdmrW+UnJcIWL8CXWzh9z0kP9e5p3EtJ/z
ndRNM7XTjuzjzKfCWPnwWop66Safrr/DzHdRE87n/hR1vC+Fr/b5IPXYhb02
dBzEdj/2vhBmy9Zx7W+UrBOeFJYKjwilwjxhovBQFrHx2kxhjjBaGJNFjB8Q
HhQGU/z2mXTP59wk4UetX/NZydWSi4TFWeRhAjaahQ1Cg3BVOCucEyrd+8LU
LHI4njNlwjjmVfhqmwvY+zD3ME+YNx4VRuFrNXvLhV6hXdgr9CE7hAphMrav
5mHvS+dTsjOLei1Fdwnxq8R+LecriVcJtmcTp9HcrRebd6S3SfKXPHJgHQuF
Gny0riVwn+/0vfatl/zB9acL7nSMNR6TIm4zJNdyxvk8L/Rn4bvv2kS8Xfeu
/891dqowovG/wl8p5BrJX/M483ce+anGr5sp9I1o/VYKG2NT+FXFvm/yGH+X
R15riM1GZB2+rCf3a6gL+31RurZI3s4jFs7ntCz8nUk+vXc6cRnmzjfNNdSR
7exAusY3C6uyqMEtyDXk3PHwuZ3s8+/PCZuYO9+trDk2d50vaqUFO3+mWFuR
olZcMyccJ+Gi71GIfE6itsyTNUKtUJcH15gv/TbU5/FWbPzf7zuYN8IJ29hb
7X6Dg0cVIpf1Kc6br6qEaYXQ+aJzxJrPXc+jZ927tlNhjoWvG7BnLtqKve34
ZR1tKXzZlYILzYl+kxJ1WnyrZ5Cn+disgjeHOFNCTt1P5lb73JKit0rRtRK7
voPfn/1wYGsiNim+ESq5wxCcdwi+3cB9dhMz38Nv2D509cHF5sjb5NY5nkIf
uwfv8R49LfmH8I9rKEUOG7Cxghp4gr3l5OYnzX/W+uN+r4T3tLZYF7yj8S3r
T8EH5gX3cEkhzj2Toi+dU9/vLvU3Qg1VZPdryrLIu5bmxFpyaP8GeBP8Nhym
hnbzJnTwm9+h4rvkN2wP81H0nPNURf7X8VsTMXa8/T4V35w2aqeT2m1Fb3N+
/xuqhd+62WufbsBj5jPzpXmz+M7Mwo/p9L/fEvP9AvLkWlkKhyyix1dRg0s4
s5i+Xw2vLOS8a20Z5z03F9fR3x3wRD314174LQ++MAc73uY8891EYj8Xm2ux
V+Qj6zMXmqPMe6Xwp3m0yI/+7VYeZ81t9qOR3zbBQ63cbTNr1mUea2JtJ/t8
zy2sVbNvPTZaONPM/dqJo+3Vku/lxMVviP0cptZq0HeeGhqg/9yPrjt/y56g
zy7wu7+5h+k3n7lMP/vb1N+wPdSdv4sHOX8JHafgl27q9zR15vk5atd6r6Cv
+A18gNr096J5rCNF39Ryhwnkyt8XlfSZ+83x7crivS9+H7hH/X7PoS6L/28c
g3d8b/PBePSVcX6A+Plb/zh3O8td7fd/Uf9MPQ==
                 "]], 
                PolygonBox[CompressedData["
1:eJwtk0lszlEUxd+7/1oYFhoRNSatllLzzreQYIuISGzYVGJsWKmN4duhRSj9
TFXDxpAoVhK0iKl2tDvtVqSmvTF+J+dbnLxz7n3/9z/v3vvqW/dv2hcppTWg
BlxHzGVtBK9zSj3o2fA54AX6EnoCfCJ4ip5UpFRiXQl2krsIxifveUzsGroh
+cxX6CvoWclnPkf3ouuT97xEL+C8Xtar4By522Fva8EQsSPoVtaDoIG909C3
yPWDOvgJUCa3B5TlFdwl1w0GdRb4Bx8DP+B/s3Nl3Q89ht4BPwS+wM8Tu8d6
AZyBn9Q/sj3K67fsb/eCR+R+Z3/bBf7ATxOrZHvqgB8H7fBO0FTYs7wPgRH4
BjAl2+Mv+Ef4xmRPI/BnYBl8Jrgc7pF6VQJv4O+zub75AJ/BngH4HWl4MxhO
jo2GPcqravg23FP1Vj3ph2/TN9mexuF3MLsXS8ANcqPoNvgW0BeugWqh2Fdy
B3Qn1u3ywvfL0Z9VG/AdPq9wbSvVWi1E92XXXLVvQd/PjnXLS+HZ6AFn0YvR
D+EP1CN0VzinmHLyKK9Ldb/sGqgWmonp8JvhnGr6jvxPdC3rZLAuXGPVWjM7
QGxR4X/JUyV8J91NM3k4PJOaTfX4GPpoeBY3a2bhK8Kzpx6oF/PDvVdNPsHX
h//dBGo4a2uYl6pvrT181irNOHx3mDdXe9XIno7sGe1Erw7XurZ6N82cZk97
TqF3hd+uejSV3JPst643rLc8nN1bvUG9xf9SBIFR
                 "]]}]}, 
             {RGBColor[
              0.5419757642622056, 0.49417678616243643`, 0.5004679213282881], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJxNVklsllUU/d79JCZoZIEFBRXRitBqIgj+uLJ1XNDWxMRZC1pwoi0oVAUU
bG2hTtAqAi3GKQFNUOPOpFYBJxA1FLEODK5o1TK4NBUVz/GcP7g4uW+437vv
Tud9E+9dcFNjZFn2I5ADszEpT1lWC9kMOR+oB54KjZ+BbPFaA9AGLAAWAl8A
V+KMzyH3Q68X47MgnwBmY20sDLyB8bVY34n5YaAZ4w+wNgrjYYz/BDZgPgHy
Q6xNhbwBuB5YivVarI3BOX2Y91AH2GNJe0/7Xo3AOOhVQzbhu+N0EuNrIGsw
nAvUZfLjFuBW4B5gFlBlv2/23mOh8QrIYZ6F7yohW22H/hewVg1UATMz2eCc
8bjR8xLonch0j6W+wzzgYcxXASuBR4B2z3tgoxH7P2O8JHTHxyErfV/ejXFt
AhYDa6C7JNPZbaFzz0MMKqxLH1aF/Lwgl68cz/F5DelkPOodg1qfvQhYnylf
LcAnIXkM678m2R1Oyu0dwO2ZamMj0J2Uly5gAzAjU37Pd/xZT82OZat1Fzoe
xfpq816D91tss85xfCdUJ19h/f3QHfqT4neb71PnnBTzX+Pc/JS094ttdPuu
jBHjsxzn7UnS7YPsCPmxNhTrjkyxfwjzq7D+aCivy5wLyk7rbcfeOsi/k2p2
E7CZdRvy8xzYnEnbwIVJ500ByuhzKEbjofNX0pnHnVfqFfNMyRop8VkP4Lv9
SXfal9QThaS9ub4jY3k69EuxdleoJ5nrI+5R5p73PiVXr1aH7nRmUl2vDNXu
BOzfHbrzg5B7gS08G3IoKRa/Mc6hHJ+bKz/MUwPwXkgeSLrLGUn2KhwDctPu
pD77AfIg9LdhPB7yWXPW6lDdtbmGJmP+HXSmhXLb6r2hTOv9wEdJ9dgLORDi
lIshBzNxDecDwG7Pm9x7c9wftZ6/HfJnr23Tx2J/UzJGmW0ftu2tmXyYkqv3
nw/x4CHbbPd37MGLctlupy8hftyK+e+h82aw9kP1E7n6jP023f12heeLQv0/
GjpH7edUcxttDro35rlXutx3re7hFs8vzRXrF/HtC6G78Y4d/6v9T5P48VXs
H0zqTfbovlA8J0HuCtXYP0lvBrl8bCjHzPW7Ib7vcw74xpBbXw+9B4z/MuYt
FM9xod5a4777LImXX/P7VumaqnJMCuYt8td15gbq08b3SdxCjvnG/PVWiEsK
1jsUytdl5iHmZRqwI+lMvnv9zvmQ88Tx9Dj5htG3Y6E34mr70e8a5TesmxPW
G3SetiXZ2Rh6P0e5Z75NqkPW43aML8f4FfZB0lu6BePnQrVbivgdcI+wVwrm
CL6DXybF402sH7GNipBt1kqxTin/e7+TYn4qdL5OqrvN5ooK81SfcznGvpaY
RzpDfTLZ9UNeZA53+f6bQnpl5sT7QxxB3toR4kPyIr9hTGljtTlhUi475f7+
NNcb667eb+r8UOxKzb1nOwesqZdCfcgeHe23czHWXg71Rnku7mCPdYXeBvZJ
GdbXmXcuwbgnqSf5j/NkKM78T1lvzmI/HU3iQ77/jEGv/RmRy2/y68hcebrP
OoxXp3tjwDn5w/7Mgqxyb/P/hbxAfriTPOOY1kDuNFePhPw4qYa7zSV8K2jv
X+W1PK0=
                 "]], PolygonBox[CompressedData["
1:eJwtlVmMzlcYxv/nfMTWcDPW2k1G0Quqqq6UWi4Mk0jEGlvTUjqj1lJUZ9RO
bLGMtamlQXBrVyqWorSM1HpF7VxixPJ78pyLX77nPe/5n+U97/t+LUZP6F8S
sywrgSowFKNlyLLOUDOXZW1hPboc1uB7yO9M5n0NN9G3oBhdBgfw14ND6Etw
A90X6jCnEvsluibsQf8B/6Jf41uZec1H6G+i9y6EPPbOQavgMw3Bdw7WMncd
1ELXSv58GIPdER7hewfP0KVQjG8gzEDPhOHoydCcb5djlwXfcQW6Pdzl21fw
BP0pPEZXQBt0QfTdNOcuehVs5Nv50Jr1NusbfB3hBGNTsPvwOxIa4B+P3Q3d
DkboLNG6LhShW+V8timwBDs/Zz0VlmFvil77E8UwOOaKfSk8Do6pYnscGqL7
QR7jbaAqaz0JnqsYntDZo9fqAMfwFTCnNDgmik0fqB0cY71Fu5xzYQOsxVcD
dmZ+wzPo6rAjcw5cjr6T7pbBa/SX0VoxfY6uz3ojgt/kx+gYKVYam4U9Fj5P
++utuyln+PZ/eIreDT3RveAqc4ZF54JyrgrzW2P/g++I8hX9LDheytmD2Huh
EN0X/sO3H3swegjcxu4QvZfWuBedAxUpf28rdnA1c84p9xZGv5Xu0IL9l2os
5ZvedhH2+OAYL0Z/yFhJcI4qVxtjTwgeK8OuBsszx1Sx3RN9195wjTnfRr9t
VxinvVVzwTGry1rTon0D4Ad0E8a+D95jLnYz7EnoiTBP50n5oxq9gn4bXGuK
2Uns+9hfoWfAA/SrYK0zVqJ/Ys6oVL8NWbtpzmtrz1+ia06x0J7zsc8H30U5
uD36TYpTP3qKb2eqp05wEfskfIZuDkdTjBVr7bmAuVuVL/g6w5+MHYZmmddQ
bepMOptiNBv7g9SPVA/qLd2je4dqphK9K+XDIPUrxrZEr60z6Czl0WfRHodS
D1AvWKC+hu94cG3pzbZhf5SzTzmxWvkfnZuqIdXSleC9FIN92G+Cz6YznsX+
OOfaU89Zh30juBcXKUdTz9T91HMm478THEvdQbndKLo3KGdvqVZTP1F8LjD3
7xRf1cQl9O/RsdeYfL+leuuheg++k+6msXPY06N7rXrcd9E1pdpSzlxHXw4+
axc4HfyfoP8G1XQh+mzw2jqvYv9r9Fy96Sl8FcG1qf1U+9tT/9Id/sI3JzrX
VWM/o7+I7uXqYS/Q7wGoytV9
                 "]]}]}, 
             {RGBColor[
              0.8405214368216731, 0.5990969905763068, 0.32496503394508675`], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJw1VEtsjGEU/b/7Rwgdj4RW0qJNREJGWIwukXboTLvwWJlqx7TBhhivZOoR
ieeu1vZeCRqJV0i6aWNDUYmiJOqZEintyhQJzsm5Fif3fPe/3/3u86/rLG7e
Y1EUHQNiIAtsA/LAA3y4BlkBeQ/yPHABOOuS50F8uws5D/KpST8N8kuIoi7w
z5Az3A/99QPnwP8E2dF+qskX36CvZzj3QVa7fAm8AL7hzknaQf/GpFtqOlP/
Hd87I71bAn4FxfrTYyHvjhRLfyTfr/zOMORDIMPc6B+8CH6d74C3gV812dG+
B/wJeAv4ZfAh8K3gV8CPA1twrkZBv4KXoV8D+Ri6ZvBL4I+Can0R/AdQwW+Q
40AAbzTFyFh7Ir3TARQi+Sh4nzLeq3ZgyGSbYGxeS9aU7yeC3jjksTHG1R4b
YxzwvkSm/Ol3AHZjXnv2oAP65dAVTHWnPgU5avq+DHI7kGJvkfsnj2MJ5KDX
ijVjflVAJbDJxDdC1kLWA6uA1z5zlf5mI9AQNGfMa7Hf47ck5wLnVsgFsQaZ
vnKmOBjPDvCPBD6vgDwB5KCviTUTJZ+b9ew1exnUS/b0Ofg617V6LLzLOv42
5bHBNCucmRGc025Luyag3f2OeF9r2AfPmfGOBsVQhrwP/SnwCfDTpnuLYHPG
5KcWfDIo7im0NcW20HNt5mwF9aTPZz3vs5L1ve32fZgbq+Y74eNDkN0t8PdB
M3UTfH4snwfB+bNgbgn2N2gO77CuQfN4G3zM67wS8rAplirY94Lvhf4dzkdN
Puk76bPAfo4H2fR6rqxdBnjrO3jDc2U/2KvpuF/H3rD/pjmPoTtgyov55bxn
ae9Zg59LvlPc590mfZfPUdrfaPN3mtwv/beYesD4jph6z/jznlPKZ5jvs7+M
b78pjznug3s3Cewz+Z4N/YRp3+pNtcz6rv8NmgfOxf/95y4VTTHOxN2yyd9a
3jXVdBfrbYp/Vqz8kr4z/wAtC7Cv
                 "]], PolygonBox[CompressedData["

1:eJwtlDdM1lEUxd97nyUWrAkM2EjUwWh0EEY1ggq6WBaatKiLBSyJWCZBN53d
bYOS2GOZxA0UTESIJmBB0cQCk6Am6u/k/IeT75z73v+++8697ytqat55KIUQ
doFJYANigt9h8A1eA4piCDNByoVQh86HrwT18DxiZfBScBA9DV0MXwv2oOeh
K+Dl4Aj6HqgndwP4SGwfuiT6jOnsvaUzWasFb5UH3a9aQDH8DtgNrwMfWC9J
XhsAI/BZ5NgUXZMuVgpidM1/4NtBQXSsDP4YNPNtCxjNYlpTzjH4NbANvhU8
Jz6b/Jujz2jWmjyI9mwcfjV5bwV4RnwO+7dEf9PC2t3k2uXBMLEG9KromnbA
7yd70wg+ZZ7Le51RzdqV5NzloIvYU3QbvB38Q1ehl0T3QL1Yk9zLHvmtu+Xs
tfZUom8ney1P3xObm3OvVPNh1qaCy6xdAL+JrUj2uhMMwRck8w7QB18KHmTn
LYNPBufhl8CU5BnRrOjOjfAbWT9VQz+xDnRTdv8B9P7kWdsIDsCPyd/sfvOp
NR/9MLjGF8kzot6ph6PwcX6PB9cwAe+O9k5n6uz12hPs8c/knMqtmTyKLgRP
gmdwEH4zeVY0M4PsCeiLwT1QL75m70c518FfRc+zvtG3upPuppnqhZ/S/bP3
kc/ZecleKme37ppcm3qm3l3P+qWcfXqX8jC4xpfwReypIV4LzqJ/RNemfJ3o
1mQvK8EJ+OpsPlSzai/Mea0KnEEvRFdH52xXv3NeU6wtuWbVrjd+Er03+e1L
6+3/ip6dVvAF/ih5VlXTd/TinGuVB+dY+xtdqzzoQo9F75ffequaIc2SZqw3
eY/2yoMZyTPXk/1/DSe/IfmtGRiBD0XnUk7VUpD9P2mmTqPfRfdK/uq/6HN0
7ZrJ1/DlWX7N3Bv4fyFIoCc=
                 "]]}]}, 
             {RGBColor[
              0.9381896340864442, 0.7154740852161106, 0.408387865667977], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJxFk7tOVlEQhfeeoyRCQNQGiGAM0FjwqyRqozYWSuUFVDpvlIii8gbQ6AtA
Bw8AUVQKEyUxsRFjYww2IBdJjEFBzS8FCt/KTGKxstaeM/sya+YcvNF38bal
lDpBAbpYNOaU/sIVYIzYTvgtGEdXw6/BMDrB7yNHuVPwaPK1vk8k37PDPL4P
XuHsAfQX+AXrQfRaxB6Bh2Aju/4DfzQ/pwYuWNeDOrDO+jvxE+a5Y3H3Eut3
cCv8G1SSew6eA7PED5mfUQJtUafqvRz36N0jYF51wk1wJ2gg51Lw4djfGne1
RO3SM+Ax67vwZ3L2Ymo73EPsDDD0efi6+f298BswRP7P7Ll6TxMoEy8TP61a
WN9HT6Nz5Guf/HqQ3L91cvrhl8R/oe+hX5l7JK+Ow7t4zwG+dcf9deFpY9x9
FHwyr6MZXgQL6LbwfzX5WaXYJz/K2d9RyMvwUX07pf3ob/AF87uuBcsHnTca
PVcPZ+Ps1fBRexeCZ8Lfq+yvYl8ufIZU93P735tNeW9exx5yVszPOwbfBEeI
VxTuu+qvRm9l77vm+mzMjGZHP4bqrCHninlP/sH95l6pt33m87AbvZy9F8+I
3TL3WX7fiXtrC39LEfWvxTxoLhajX5PyO/r4BD2ffZY0Ux9iJvfDP7L/O/qH
vsacnDT3Rf50oJdiZp6qn+Zzbeb9kKcleBt6R3xp
                 "]], 
                PolygonBox[CompressedData["
1:eJwtk0tvzVEUxc/Z/1LRKIIEaSvCiKSlEkYYSeiIxnNG6VR76/ENdFJfgBkf
gMSrk3okdKRioklNVG+lCQla9NZA1G9ZZ7By1zpn3332Xnv/t/cN9F6OlNJh
0KRfRIPfGfAFvgbcg78E7+BHQJVT+oZe0H2VUie6CyjRcRDwzeAE/BzYBl8N
ErGtlWP3gAHuesGW7JzKfbC834JehHeBOvoNmIXvB1+T35iH7wATpd46/Afn
w/AaeBp+U28r31n0C3CV42tgkbNW9H34bTCh2sP8BhjX/8GtZA9eh890pzcy
/Dm4kpzzF/k6wl4pfhK+M1z7KNgEPw3aiesGzZVrUC0joAF/xv1Qcs6f6FXE
dGR7eCmcQ7nugrfwR6UfxdeJ2Vju5cl7zSqc+47mCz8Qnt0U2A3vDHsnzz/D
d4Xv5PEcvCfsne4b4ZpV+15wEX0+PGvtwAX4fLY/8vAVekW41pvgd/ZO/Z8V
OARfWTmX9qEPvVz2RT2fgf8Nc3l2KrwTLWWfjsL/gK3ZO6Rd2hDuVR7Ii7Hw
rFTTd2LaynzU4wd4P9hX3pPX60o96rEW9miq7P80fG3lWhUziF5f/FCOIfTD
sg+a4Uy2B/JCO7SMPhauXT2q18fh+WuGs8UD5VdPJ+FPwPWyr584+5i92+pJ
vU2W71M73A5/UPZHMdPELmV7rxxz2d9ErdS3gP4H0Qd8qQ==
                 "]]}]}, 
             {RGBColor[
              0.9858806360927489, 0.8347015902318723, 0.5562299718875217], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJwtU7syQ1EUvWdHhAaDzjOjzNAar9KgNR599HyG8Ask1ycwk+iCQprE6Myg
SWiMKuShMmLtWatYs+45+5x91l5733T2aPvQoijaBBLAT4iiU3AXXHcGOsAV
cAacA6/AF9AEPnC5DV4F9wEXngf87WvkWAcPA3nsP4qPgRywj/UgzvTABe2d
6B1/7xIYRawITht1ef7Y9Rq1dcHLRj1L4n7kTAbq8vwDgXuTwESgbo+7vl1j
/A+8Lc2/4KzxbD9MKeF8DajKF9dxZ9yPpelevrwAT8b1NHgcuMb3GHhK+x4P
xjor4E5g3bfuW6A/Zfc10JMbfB8Y9acS9KOgt2eMXj1Lb1K1utZGxB66Ptfg
eutGjRnwmzE+b8zl8aK8aarHsXriNU8qdwrYMHLLqMlje/j+NL674O+odvfg
VR5V1DPv3ZqfNe7NGuvOa8ZyqtHXK5oxn7Ud1en9yaiWRaPGWHd6mqsto7/u
sxln0fvrfX4wzteQ0Tv3cMRY94t6WZamVmC+tv6FhmahJpTkb1X++frdGJtT
rXXd+wdbqnrG
                 "]], PolygonBox[CompressedData["
1:eJwtkTkzRFEQRvv1WBNraB0SAVLGklpSa07Oz7D8BUv5CVQpIQIEtpCaSQYR
EbMQGeV81S84Nafv9Ovb3Te7trmw4WY2BHVwQ7DP7x4kuHv4Mdzj4/Cp3MSs
hM9AA/7F2QT+B03EzbCKT0HF4qyCX8Iu8Q5UOct5fFuAYXwEivoP3lU7Y9ZF
XjesE7d49HINT3gnnOFH6gkvk7dlMYNmUY5yr6AHv/C4exsq5JaJG5OYQbNk
PGqpxx/OHokP8ENo9+ixkN7/4jGTZlONWXzeY3b1X8XPPe5STyXOVzxmUX4N
n4Zv1YIPvA1O0v4f8EWoT2IHSx47UW3tdBL/9XgL5Si312PWPBTxMQ/Xm+nt
BuDWYsevHnfoLs3Y6tGz6qunOXwQ7ix2nMezcGpRQ7Vq6f60g2X8OX0fzdDn
sTPtTt904P3peyhHuaMes+uON/wfg+dXow==
                 "]]}]}, 
             {RGBColor[1., 0.95, 0.75], EdgeForm[None], 
              GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJxNj7sNwkAQRE9HAQZiJDAxFMAnNjklUAD0Bj3YvgCnBBgLMqc2DfBWNwiC
0fPsenf20sNpf/TOuQkaoDHmAkewhj3qUInOLvYK9HCx/+S/O1zAXLWvN660
J9dcp77V1j76zMecWnvn+ABT2KKG76XuCrrlrZmtj3eVf3cV8o0Y9B6br+BV
M0O40X7LeSnX8jPd1sOdsizzpnfO/C/DMqeqWz/Rfsv5AHjJOnQ=
                 "]], 
                PolygonBox[{{718, 179, 178, 527}, {743, 221, 222, 571}, {544, 
                 198, 219, 736}, {728, 199, 198, 543}, {754, 241, 242, 583}, {
                 528, 178, 199, 728}, {557, 222, 201, 737}, {569, 219, 241, 
                 570}, {572, 242, 221, 743}, {545, 201, 179, 530}}]}]}}, {{}, 
             
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{717, 528, 728, 543, 727, 544, 736, 556, 569, 570, 
                 582, 754, 583, 755, 572, 743, 571, 744, 557, 737, 546, 545, 
                 530, 529, 718, 527, 717}]},
               "0.0005`"],
              Annotation[#, 0.0005, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{701, 498, 710, 513, 709, 514, 716, 526, 726, 541, 
                 725, 542, 735, 555, 567, 568, 753, 581, 594, 764, 595, 596, 
                 610, 774, 611, 775, 598, 765, 597, 766, 599, 767, 585, 756, 
                 584, 757, 573, 745, 558, 738, 547, 729, 532, 531, 516, 515, 
                 502, 501, 704, 500, 703, 499, 702, 497, 701}]},
               "0.0004`"],
              Annotation[#, 0.0004, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{689, 480, 700, 495, 699, 496, 708, 511, 707, 512, 
                 715, 525, 724, 540, 734, 554, 742, 566, 752, 580, 592, 593, 
                 608, 609, 621, 781, 622, 782, 623, 783, 624, 784, 625, 785, 
                 626, 786, 613, 776, 612, 777, 601, 768, 600, 769, 586, 758, 
                 575, 746, 574, 747, 559, 739, 549, 548, 533, 719, 518, 517, 
                 504, 503, 486, 485, 694, 484, 693, 483, 692, 482, 691, 481, 
                 690, 479, 689}]},
               "0.0003`"],
              Annotation[#, 0.0003, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[CompressedData["
1:eJwl0CtLw1EYwOGzLSjOpqjgNrUINoN2wWgQjBs4MFgmW9iCt+L1k3gBL2jd
os15Be+CJkGDlygqiM8fw4+Hl8N74JyeidJYMRZCyGstHsKRYYfX3OYlt3jF
fT5wj4+s8Y1VvvOAv6wzqUM160Kd0a76NKBBfWhYPxrVuPIqaErTmtFCtJ8I
YZEpLjHNZWa4wi6usptzbOMs2znPDlbYwjJbOckm5hhnlgmO8FNDelW/ntSr
++hunatRDfr25i+96Fl3utWusxue6VSb5hNu8JjrrMf+//0PuT00oQ==
                 "]]},
               "0.0002`"],
              Annotation[#, 0.0002, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[CompressedData["
1:eJwl0TczYFEYgOErFUJrhE7OBX4BNQo1jUYoditUQoddOefY0GgZrJVDJ3Ro
FVhbizOeO4p3nvlmzpl7zzlpdT+rf0QEQdChycgg2DbMcZ+z3OMMdznNv1zh
OZd5yiWecY1XXOU113nHTT5xg/+4z0+eMS7coxRdKjXco1yVqFT/Va43VSkm
Kghq2agmtahVHepUj36pX9nWDnBQo8o3j7GA4yzkBIs4zBwOhd/nCPPYywz+
Zib7mMVuprGL6WwPz8G28BxsZiIbGM96JrCG0azkiyr0qjI9q1j34b/oVslK
Umx43/pwd+961INudaNLXehEx1q09ogLPOQ8D/hHO5oyb0V8v/sXcPNGzg==

                 "]]},
               "0.0001`"],
              Annotation[#, 0.0001, "Tooltip"]& ], {}, {}}}],
          AspectRatio->1,
          DisplayFunction->Identity,
          Epilog->{
            Opacity[0], 
            EdgeForm[{
              Thickness[Large], 
              GrayLevel[0], 
              Dashing[{Small, Small}]}], 
            GeometricTransformationBox[
             TagBox[
              
              DiskBox[{200.20841703184735`, 119.57471703316162`}, {
               42.84062746087264, 32.1304365738984}], 
              "Ellipse"], {{{-0.9998588052574148, 
              0.016803855189064965`}, {-0.016803855189064965`, \
-0.9998588052574148}}, Center}], 
            Opacity[1], 
            RGBColor[1, 0, 0], 
            PointSize[0.03], {}, {
             InsetBox[
              FormBox[
               StyleBox["\"Prior\"", 20, 
                GrayLevel[1], StripOnInput -> False], TraditionalForm], 
              Scaled[{0.95, 0.9}], {1, 0}]}},
          Frame->True,
          FrameLabel->{{
             FormBox["\"\[Beta]\"", TraditionalForm], None}, {
             FormBox["\"\[Alpha]\"", TraditionalForm], None}},
          FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
          GridLinesStyle->Directive[
            GrayLevel[0.5, 0.4]],
          ImageSize->350,
          Method->{"DefaultBoundaryStyle" -> Automatic},
          PlotRange->{All, All},
          PlotRangeClipping->True,
          PlotRangePadding->{Automatic, Automatic},
          Ticks->{Automatic, Automatic}], {186.66666666666666, -183.75}, 
         ImageScaled[{0.5, 0.5}], {350, 350.}], InsetBox[
         GraphicsBox[GraphicsComplexBox[CompressedData["
1:eJxtmXlcjPvbx8dapEgLFdoUUlHEQXSJylayNXuF2dpsRbIOkT0lnJJqyL5H
iCy3bJEs6eRInQZFkjVRofPcz/P0/d6/19Xv/DOvd5/hNG/1mas+1nPmT5e3
5fF4+u14vP99/P//ZPB/D+qAlkfEPDnKEfMUKEfMU6IcMU+FcsS8EJQj5oWi
HDEvDOWIeeEoR8yLQDli3jzELf6A3/JxxMQnzRETnzRHTHzSHDHxSXPExCfN
EROfNEdMfNIcMfFJc8TEJ80RE5+UW/zxBC3PR0x80hwx8UlzxMQnzRETnzRH
THzSHDHxSXPExCfNEROfNEdMfNIcMfFJucUfg3wyyCeDfDLIJ4N8Msgng3wy
yCeDfDLIJ4N8Msgng3wyyCeDfDLIJ4N8Msgng3wyyCeDfKqFLY+IaX+SHDHt
T5Ijpv1JcsS0P0mOmPYnyRHT/iQ5YtqfJEdM+5PkiGl/khwx7U/CpC9FLR9H
TPuT5Ihpf5IcMe1PkiOm/UlyxLQ/SY6Y9ifJEdP+JDli2p8kR0z7k+SIaX8S
Jn0pbnk+YtqfJEdM+5PkiGl/khwx7U+SI6b9SXLEtD9Jjpj2J8kR0/4kOWLa
nyRHTPuTMOlL5JNBPhnkk0E+GeSTQT4Z5JNBPhnkk0E+GeSTQT4Z5JNBPhnk
k0E+GeSTQT4Z5JNBPhnkUy1peURM+5PkiGl/khwx7U+SI6b9SXLEtD9Jjpj2
J8kR0/4kOWLanyRHTPuT5IhpfxImfSlt+Thi2p8kR0z7k+SIaX+SHDHtT5Ij
pv1JcsS0P0mOmPYnyRHT/iQ5YtqfJEdM+5Mw6cvAlucjpv1JcsS0P0mOmPYn
yRHT/iQ5YtqfJEdM+5PkiGl/khwx7U+SI6b9SXLEtD8Jk75EPhnkk0E+GeST
QT4Z5JNBPhnkk0E+GeSTQT4Z5JNBPhnkk0E+GeSTQT4Z5JNBPhnkk0E+1UEt
j4hpf5IcMe1PkiOm/UlyxLQ/SY6Y9ifJEdP+JDli2p8kR0z7k+SIaX+SHDHt
T8It/qyCWz6OmPikOWLik+aIiU+aIyY+aY6Y+KQ5YuKT5oiJT5ojJj5pjpj4
pDli4pMy+XpEPtXIpxr5VCOfauRTjXyqkU818qlGPtXIpxr5VCOfauRTjXyq
kU818qlGPtXIpxr5VCOfauRTi3xqkU8t8qlFPrXIpxb51CKfWuRTi3xqkU8t
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
ibtkslEJxmcn7rZ6EAj/A3Juszo=
           "], {{
             {RGBColor[0.148, 0.33, 0.54], EdgeForm[None], 
              GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJxNmXm0V1UVx++9DyUBQUVExYTHPGiiAjIjiRoh04MyHOExPWRMJgEfIuYQ
MggaKpKMAoo5JE44rFatVqhhpq1Wa5UGiJq1VqsJw8hofzqf23t/fN/5nWmf
ffb5nn33Pq+yenbVrCLLsqvjT0WULQN5gLZz48eXAicFzgmcGGgY+LIlfa3t
bxRoG2gSODnQKnCCc9rZ1jTQIdAscErgvMAZgZaBLoHmgdMDHe0/NdBG2Y0D
nQOnOa698pDVLdBCWV2VQb3Seeh0PPbzaeCPgX8HPg58EngzsCfwfOC1wM7A
rsBbtr0QeCmwNbAt8GJgi/WXbdvuuM32nR3rNXD/70b9VWW/E9gbeEXZm5yz
X7ms80v7mfNz5dL3tv2s+QtLZB0LfOR+mLPDPZwVa1eoBzY4Em2fBXoGWgfa
BC4JVAbaBvoG2gc6BHrb1i7Qx5K+n+Vp7q+j7KUM5q8oEm9eifZ+yugYGBTo
Euga+E2e1v5znnS8L7A20N+xnQJXZUkueg2wrXNgmHr38mzWBe4PnC93zpQr
xzxbePm3KP+eJf79Jcq/ZomD/4zyaJb4Sxvj4Ae2oQ+u/SNL9oLXyKDOGoU2
hXfI+DxL6+f2wdl/eSb/CfwhS5yDo4ylD+5+YX8LeZnJ3UxZ8Jd++gZqgy6e
N1x7LPBBYF/gjcDQGH9j4IbA9YG5gZsD11l+O3Ct5ZzANwLTAzcFrrFtduBb
gVmBmYFxtlH/ZmCGcy4JDA9cFegdGGF9rPKmBa5wbdbsbv3ywNXKRtbX6uk7
xnk1gWGBCYHxga9bsjfODj/SVjvjIzp4Fu3ta2Yb9e+o+2x9QTd9A/4DP9IJ
DruPYa4xPzAvcGHgSvWuUq+pjq1Wvwvc0xD3P9G+kYHJgUmB0c6bop0mOe4V
z5B70NP12Wsf5zMWXv4u8H7gYJb8Ef7gsL4AH3DINvzHh5Zvy1f48Xs5d1gf
8bnjDns33q83Dh7hCw9YvuUc1nnHu3HQNT9z3EHv0iHlHlHWAXn/XuBXWfJN
yMC3fWKJX7xMnsG7AfKgSpteY19/27DlxXniOty5yJJz6hsYpe16aMuhns+1
yvqq68DB9YFlgdsDDwWWB+5Q1vVyd1Ce7gm8Huw87sGllvQNtB+9T5dffMce
CH/YDZvm6d42D5yepfsx1rmXy6HurneF619r3xXqcqX7nOG6V4vB9fZEeVk9
/eib6Tj6y/t/ndwdJpfHOW+IOg1y/lj3Rn26fci+QV2GatMh6lqtvOHKhtO9
rOMvetvfy/pQz7I8qx7OKc+VvhHO406Uvqz0bderC3YfoK7TrKM7dw6+VIn+
jquxzriJ6lfeS8ry7lLCp3mug2+YpS1LvzhOG2A/vkNf8RzOs74msCiw2H3g
t/BRK5SLr1kbWBK4NbDOsjbwQGBp4LbA9yyXaQtk4N/uVI852oz4jLisr/34
we9qL9a7X9nIxb+1cs7deeLHzdodGedqL3wkvhIewOuuniExGbHVysCCwMI8
8YZ+/Gzpu+HCEG0D1+9xnbnqjf3g5Spl3JInflRqLzjR2vX6uSf8/mrHYt97
tSV6DFRfdB2sLpxHD/eErK7exRZZOteh6sr9n+k5E5csCdwaqA1MDdQEVgYW
BBYGlto2LXBvYL599ztnqT5+TZZiHb7bq62vqyebdSYHptg2xfVWuc4tWYo1
V9q2xfWob7MNuZsDK+xjvcXKXq2MRa69yD5iitP0TZWBxoEmWYq5TrWvTaCR
fXeGTzshyh+FfX4caBi/f5KnePAkxyF3kvshpjtFWcSOTQPNAqOyFGsSJ47I
UqxJjNnBfuYQv67VTm3V6+TA8CzFhsxpZxty8ZXd5XV1luJIxj6YJx+/XK5w
5yd5Jym566O8M/28f3yrp3rn8Ck3ya8b5fUy26bLOdomyMdq17hSXS6S98Ti
Z3v3apSLj+nj2rcrb4b3YIKyltsGL2vVq8a9Io87PNG9jtDuI7XxJNtGyina
RgfGZCm2Jq6sylL8TX2sbYMc18++CVmKv6+SOxOVvdA+7M39PtN91ih3jLyr
ds5U5dI3zX7W5M6MV9ZIuQA/mnuPuc/E2Od7lxvrH/AJTeUWXHg26o8ENuaJ
c53qcbBjPX51cE4TuVUpj9pZbyTvW8v7SuuP6r/wqZss8eWv5elecD8224ZP
eiawQZ24S53V6ak8xRwPB76fJ/+L3FcDDaL/jpDznH2sSXxGPFfGa5TEhgey
FIeVMdcRxx3MUqxGHzkEcQm25CzwBau0Of4DX/FS9G0NbAv8UPux9su2bc/T
ewD53RmBPeqFDV7I0563BF60RNbz9tNH7EdORk6E7LvcM7YhRuc7NkJOlVye
KG9eL5JfbVUkbkx23Cg5PVnusJ/5cmih9Wr5Rx1O4o9rszo/W/pdysVyc2pW
539rHTdfO+Fb9xep7FqknLGtXNzimfM9rHI9ZOzLk93Ij3fn6Vu+XpvyDVuj
jVdZ36qMVfLmTu31pPPwZz+whENPyyNs+USe4gbWwKd3kXMLPfOV3rlp6rcz
T/EHccfjeYoPmL/LNuo7Avc5jjNZpE3JH8gryCeI/Y/KufeL9KYxUDttzlId
+22xzjeLtwveMvg+kgvt1d58O8tvI+Va9d7qfM6Jb9sa67yLlO8ulLypvOF9
+MBxrLFdG2xT1hJl3+ed2F6v7yXlohd5CnnL61nKY95zHXIu8qNlRXpfaVIR
+y9SPj65SO9Jb6rL846lzneNdyDeaaqKJHdMkdbbr1zWf9s6495Vj5oi6TCl
SPZCL3KzHY5D37wi5Yzzirp3ImTt0x74jw89t6Pue6/ngb13qSN53zHPmDcM
/MgX7gP/ciBL/qVJXve2RMnbCTryxlbmf58qo8z9ylzwY9dBX/wZbzENK9Jb
zZIi6UduT97PHg6r+4IiyZ9fpP19ZF+ZA8PHTdqdc4CXyEBXdDnufspcF66U
sdFqebEzq3uj2iGH/uS5jirSOR3SFujLGxNvff/bQ57q6IjjPK7t8MG8PWBX
3qp4w+AceLNgn9iaNur4eN6eyncsSuTi37ExffjBxerOtxl/h/8bZjk+Sz7k
Wb9FG/Xvz3rPn/Deb7D/ae/84/oAvgHPOWeb3wO+FXvz9E68vEjfgT2OK78B
5TfhBb8DW51H30/ZU8y9p0h+ard6rNfH7a7n457Uxz1lfZ167dQn4Zsey1Os
RMxELDZbn1m+/VAS1xPvE/fjEzepF3rPLRL/uDdLi/SG16gi+dSnXZsYl1j3
7iL5wZ2uvbhIZw9nbyvSu2Dj+F1bpDe8kyqy/7/r8f40Xh2JJckpycnm2k9c
Q65CDEUsVeaT5E7kl+Rh5GPkseRAxKp95Qd5DTkbsRJ52sC87o3+HHlJnEi8
CHeIm8iD0PesvO5dk7Kl3Gqt3AbOY9yJykMW+SLfcL5NnV1zgOMuUHfGEv9e
qC4XW0duD+us09M6evWyzjf1EuvklJe6N3Tp7hp8e3s77nztVObflGX+N9j5
7bVZmUP3cX4rdUTuHPcEhybpz/Hr8ItvMt/mMifnDpELrLe+1DbuEPH8g/Zx
/zl/4jB4BR/hZa69OX9ymuHe41plwHfeBuAcfCdvvke7E2tw37hn5AgPuR56
c+c3uM7D9pXvC2tde4N9vVwTn0HcTYxV5mQj1KmtdXQs/x9AnViWvIEcgXi6
r30dbSN/IJ8gxifu6GAb49pkaW3e9CuVTb2zcwY4bpQ6PVMkf9awSH3IK3MX
yjJfGe0czgqfhe/hzg9S7m/z9C7H+xz5IPHXas91qzYl7yKX48xv8ow58zJv
ZN4Ubcr5rPAc8CsT7Wf+dHnA/BmeE/X5nh/zyOdqlTXPNvKKmZ4fc+baxtnX
yLNaeQpfy7uIv97ofra7/7tse0SdVstjZD3qnGnuD7kLtMW9eV2ew7j/Ao4Q
EIs=
                 "]], PolygonBox[CompressedData["
1:eJwtkbsyhEEQhWd6dot1SQkESmpjqReQqH0CpVCiFbACrGvg8hJeQSBibeYW
yJQS2BegipUJfafOBl/9p6e7Z073P7O80WhGSmkaKnBKMMR3GO5zSvPEl+hr
+ELPwkXyWQ99Fq6twQP1x8RlcFeHeJe4j66ix4uRrsAhuRHiQGdoE48Sl+yz
feI/eKb/CVbQY8W9qjkgPocJcpOq0Tn5HvoDNskdgeaTpxvyP7CAXoIrElPQ
Sp7pBb0V7v3VDmjaUzM9n3y20athL3pDb2nm2mB/j+hWuPYV1uWds3qyR3m9
zfaqa+VtLVzbhYZ2H/YmT130W/bdc/CO/s7WmkGzyKO8asc71C+G/5V2pt2d
hP9FFe7ktXjXmkmz/QNrJTdy
                 "]]}]}, 
             {RGBColor[
              0.39014161587968066`, 0.4408165423219325, 0.5897250564796765], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJwtkrlLQ0EQh1/2Kd69RxQslZS2Hq2CooHUghdGxDOKd9RGA2KhYmmh/4BH
55XG2yiIGDQetWBMbARtxG/YKX78vt2dNztvZsvb+v19xnGcWuSibhYP+Ag+
gz7hPA72PY5TCM+xN42ScC77f3ACHsSn0Aecw/4snIYL4DCcgvPhYfhc7oLT
5GyAU/g9KoVXjT2TmE64A+3BP8ZKuNnYvJJ/Uu+UmuNogvUznu3atdQp51WO
vasevRGzhvvwb62nHT+jhjJ4Eb6AfXAEXkZFcJS9TWNzJOFRvVv++wiF4GL8
VP9lAfajKNyFP2nOdfgE9sJ3+CvrCFyJx5QrjD2TmBX4GLXCWXIn2oBrJDfq
kZ7jtygMe/EdFIC/yHGjtZXgVzrHJXhc55JJrx49tkdxj61P6ryGx/QNZLh2
9vLtAfsxj+2J9Cag/9iiNdZrr2UGMosQ+1uoDk7w3Tu8CzcZ20eJd+FDzTkP
N2qMxPYaO8ugsfOQ2i6JfdE+VMsMdXYyw21j75f3FdRvf/EhfRvy0Af03cr7
/QdSHmeO
                 "]], PolygonBox[CompressedData["
1:eJwtkksvnVEUhve3P45o+wPc2qTDillNq6YkxCXGEkFFpCVRlHCkdU2MWuMO
2lFnLrMmCCUmdNIcbY7yAxwOExEzz5u1Bm++5/3W3muvtfZ+3vOu420MIbxE
JagsDSHP9xRNEsjgr+Ei+oC/SULoghvRd/yT1GJaM6tEqe1VjmH8I/wlfIVm
8PfoBM6hN3Cp71d8Av84Nda/LL4GZeFBtAOXeFw5x/Hl+IL7afwd2oA3US/c
jnbgH+g1vEv9GbgG7cPvo9WiHGPR1mjtKjqHG9BXeBmdwXXRYqrpN1yGuuFm
tAZXo9Fg/7bhPnQYrCbVlqImj2fg2mi5tecY7vd6VdMA3On16F8HXOX5tecI
XkLP4KfogH4Wo7H6+4X/iK+EK9BPfKvPRzXdRruDnOfvgtuizU49F6LNWLPV
nQ3BI9HuVvett5FL7Px69Be+8P06oyVaj93e3xY8hz6hLdZuoxfev877D09F
y533t1hMbLbK/w9eidaLejpK7EzFNNNvxL54/6pJtZVHezt6s+vw52iz0Zo/
ic1IXm9iz2tSbfOsW0Cv/P7Vk3o78fOU/xB+AIC8blU=
                 "]], 
                PolygonBox[{{661, 660, 457, 44, 473}, {474, 64, 475, 660, 
                 661}, {770, 769, 628, 219, 626}, {611, 199, 627, 769, 770}, {
                 651, 650, 443, 24, 458}, {646, 645, 448, 6, 449}, {447, 25, 
                 444, 643, 644}, {459, 44, 456, 650, 651}}]}]}, 
             {RGBColor[
              0.5719026931993499, 0.5046942372266086, 0.4828750940936729], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJwtkTkvhFEUhr+53xA/QUalEmEaEhURP0BBLB0xCoVlLAV6EYnGkkk0Ckul
USjFlqBAhgQZM7GUEtWEylJ4Ts5bnLzPN3Puue99T20m2z0RoihqoWIqx0cH
WkpEUSe8CX+gV3yn4WX4WbwBv8NN8BZ8BtfAi/AxnIIXrJ9aguvRbaoZLvD/
AdwHf8KD8AVcRg+pGbganaUKcDJ2H+anDX2jcnAazVCX8Bc6qv4ftJ3ag7vQ
I2oArgx+xs42BL/P7h0K7sm8PaK7yuEFHtNM81KJjyI8BT/o7ZaBvdPeewL3
w6dwDzotb4Fz58rHcprUvRb6rbJa4bc79azCxYR7sJ1kg9/7h/Zq/kjwuTZ/
2HaknOuC78Z2lGfGvt6eDP5+4xjNK4fG4Hu1/mv6S8q5NXgWlsk6PC8PlkGV
dmc7nKOe4IrYPZm3b3RHPWVmvGoXtpNx9f+i98pwDb7R3lPoP1zDV24=
                 "]],
                 PolygonBox[CompressedData["
1:eJwtkD0vw1EUxk+PGuoTSPkPpkbSidnQL0AIRpKuQhMWvoAYvCViNDQ62XQV
LwtD85dIOqAR1jISFga/J+cOv9znnHvvc899xuqNuTU3swyK0CuY1VgX4ZSN
z0Jo9VrURzCJnoAue00Prd4H9SF1GT0CD9Qz1NPwDT8wDzfsnckTPQwb6B3o
oIuwZNG70Fm4hhIMQcXj7IlmRd/zRg776AMYHDB7Yu8ZtuRH/WjR20we8jqH
NuzBroeHvH49zurOCno8vad5cgWF3y3LHazrr2l+zXzp8Sf97Rje0FMes8rj
Bf3lcVcey+g/j1n15ip62yM7ZXjFPFUPL3m+omeTvzJcQL9DP2WsrDMYTZkp
u3+nGkAK
                 "]], PolygonBox[CompressedData["
1:eJwtzz9LglEYhvGjITQ2Vw7N0VJrSx+gpaE2IZuKUPse/qFAm1r6AqFfQIdq
KDAUIQTbKwpaCmzQfofOcHHdz3O/5+WctWJ5r5QNISwhh0PDHVd4hjnOsWJ3
mwlhgGEi5gvdpm4kN+Q6uvKy3RO/YEcec0t3mYj50W5DN+Ff87N8ysc4waf9
Bxbkgu6Gt3El7/Ir3tK38cwUPd0B99O/H7hqruEH3zjCva6Y3hffeYaxXZk7
aOPL2X27RXkdTbnPq8jjXb9ld539v2e87x/70DLu
                 "]]}]}, 
             {RGBColor[
              0.7536637705190192, 0.5685719321312848, 0.37602513170766927`], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJwtkT9LglEUxu97W8I+Q0FrQn9Go8F0aQiCCAwSIUeF/Ap9AdEmIV6ilhYH
qU+Q0VpGCC6ZQiT0T2hxqCF/h/sMD8/vPZxzz/Peu1is7B5559wSmkE9PmJ8
Hb9GZTiBv6u+gV+iDDyInOvAx/ACfiOex1Pqt/PG6A4u4B1mVuAavI9u4S88
rx7rbWvvHP5K/yp8Bn/CW3AEf4s/8Be0DJ9S/4lCNsvYhdfgJ7yhzH14qAwx
taoPsw/U/pXhEH/T7Dn8qAx1eBM14T08Z1nhEj5BV/COD/ts9gS+Vzbb86xs
lqWofpvL6sw0PhDbnrLu5w9v+fC/9t8Hqtv9VZTZspeU5xef1R3aG460a9uH
t7E3Svpwd3bmBTwFA39I5A==
                 "]], PolygonBox[CompressedData["
1:eJwtkLFKgmEUhr//8Lt4Bb+L0GST1urqBQgROiauUt1Cd6Ct8uOkk1PoVoM2
FpJzLUEkCA1lTZHQ83K+4YH3fOfjPec9B93LkwsLIWSQwp7iD85BjTJc8d6D
JXoAR+gaPCUh3FHfQgYl6Jv3qrCiPzTXenulblLfoHPYovP4X55v9H+ov+EM
OnAKU82GNvoRHqACh/Br3rvXjuhrOI5+a/zq5rM0c4MummdRpoVm8WcHY/Qk
esr7GV7gw9xbM1rmSGunBroAabyBbjGHmbmnvEfxXtrpPfFMyvYJX/FmWcyk
bP/zHjbF
                 "]], 
                PolygonBox[{{731, 730, 572, 156, 569}, {672, 49, 468, 487, 
                 488}, {665, 664, 462, 46, 478}, {677, 676, 477, 66, 497}, {
                 523, 107, 520, 691, 692}, {606, 196, 623, 764, 765}, {753, 
                 752, 609, 196, 604}, {488, 487, 673, 72, 491}, {513, 72, 687,
                  516, 517}, {558, 557, 555, 128, 719}, {576, 171, 735, 557, 
                 558}, {588, 177, 610, 755, 756}, {479, 66, 476, 664, 665}, {
                 622, 621, 763, 194, 603}}]}]}, 
             {RGBColor[
              0.9056589213799822, 0.6341473034499554, 0.3075426562779447], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJwtkLFqAkEURWcnWGktpFEUBCt7O3FBIbFKoaAoYi0K/oGVfyCkS2MhWKTQ
JtiYNAEL7QUFsUhILMTFTvQ85hWXc2f37bt3NtHqvnSsMSaJHtCBwzt8hj+e
MUX8G76KvvBHOEY+fs/7J52X72aogr/wfOu5mVeeLVEP/whrukdCfTTBl+Ea
9fFx2NSdAfzVDjcY4lzHe3CK2vgwDDRLev3pvHTPcB7ic9blSe4VbtAAn4Zz
3Sm7y9rnH548d5cR/kP7R+FCe8aseyczZ2YL+m3eugzJasBP7RmBWc2V/EDv
WIIr7Sl9v3UmZd2/k3vt2H8HDrw55w==
                 "]], 
                PolygonBox[CompressedData["
1:eJwtj7+OwUEQx3c3OlcTDbnuyqtphEKv0dBcLSTeQOUNFPzwAkoa0VBJFHSU
xL9Cchc8gPtMZopP9rMzm9n5fv40y43gnEtCDFJcWpw1mONn79wJhvgIfNBe
Ce7U315daoHeEx5QlXfwAXV6FZjiBRjjXfjG97CDLOQM8SvcbIbM+oU/20F2
ufDvFeI2vw0L/As6TjOs8QFEQTNIloTlkzcrPB90F9mpiKeDzpLaBs/YXf5Y
4i+vWeQ+CZq5Zv/N8D704MC7o9eMXdtvG7Qmvch2+wcOIDQH
                 "]], 
                PolygonBox[{{679, 678, 479, 67, 500}, {601, 600, 748, 172, 
                 582}, {482, 67, 478, 666, 667}, {743, 742, 588, 176, 586}, {
                 486, 485, 672, 71, 489}, {549, 135, 569, 727, 728}, {502, 87,
                  497, 678, 679}, {751, 750, 606, 195, 602}, {587, 176, 608, 
                 753, 754}, {749, 195, 603, 600, 601}}]}]}, 
             {RGBColor[
              0.934694237245744, 0.70673559311436, 0.39755213546180634`], 
              EdgeForm[None], 
              GraphicsGroupBox[{
                PolygonBox[{{567, 155, 725}, {484, 69, 669}, {481, 68, 667}, {
                 725, 155, 568}, {667, 68, 482}, {507, 69, 686}, {601, 173, 
                 749}, {602, 174, 751}, {586, 155, 743}, {585, 175, 738}, {
                 514, 92, 511}, {605, 175, 754}, {486, 70, 671}, {583, 174, 
                 736}, {504, 68, 684}, {720, 151, 560}, {743, 155, 571}, {582,
                  173, 601}, {754, 175, 587}, {562, 151, 559}, {698, 92, 
                 514}, {489, 70, 486}, {560, 151, 578}, {512, 92, 532}}], 
                PolygonBox[CompressedData["
1:eJwtkDsSQUEQRd+bEpISImABlqB8cqEisQCWI1JCn+KJvAU8CTsgQ0kESuIT
KMW5NR2cmtt9p7unp9gbtPouCIIspKBKMORcQgP9DTnRHQiIY1jDi/wbbs7f
jaCNLkAeEtjADrZQgjJkIG09YsvJ28MBatZPb6igF8qh6/AJfc/EeqjXyHlP
d074OeKszdTsM6zsfU300XmtGZoVWb121K5381XTRf9Cv7v8K3rsvFbNxf5A
fzEhP4Un+gEz9Nxy8pST9wciJTQ+
                 "]], 
                PolygonBox[{{682, 681, 482, 68, 504}, {568, 155, 586, 740, 
                 741}, {559, 151, 720, 543, 544}, {741, 740, 587, 175, 585}, {
                 532, 92, 698, 534, 535}, {729, 728, 571, 155, 567}}]}]}, 
             {RGBColor[
              0.9637295531115059, 0.7793238827787647, 0.48756161464566816`], 
              EdgeForm[None], 
              GraphicsGroupBox[{
                PolygonBox[{{512, 91, 509}, {708, 109, 527}, {723, 154, 
                 566}, {510, 91, 530}, {544, 130, 559}, {741, 154, 568}, {680,
                  88, 503}, {501, 88, 680}, {567, 134, 729}, {585, 154, 
                 741}, {565, 154, 723}, {695, 88, 506}, {721, 130, 545}, {707,
                  130, 544}, {711, 134, 548}, {509, 91, 686}, {535, 113, 
                 532}, {729, 134, 550}, {713, 113, 535}, {694, 109, 525}}], 
                PolygonBox[{{737, 736, 580, 581}, {505, 504, 684, 685}, {532, 
                 113, 91, 512}, {584, 583, 736, 737}, {550, 134, 113, 713}, {
                 581, 580, 562, 563}, {545, 130, 109, 708}, {685, 684, 507, 
                 508}, {533, 113, 134, 711}, {683, 682, 504, 505}, {530, 91, 
                 113, 533}, {739, 738, 583, 584}, {525, 109, 130, 707}, {503, 
                 88, 109, 694}, {527, 109, 88, 695}}], 
                PolygonBox[{{548, 134, 567, 725, 726}, {508, 507, 686, 91, 
                 510}, {506, 88, 501, 682, 683}, {563, 562, 559, 130, 721}, {
                 726, 725, 568, 154, 565}, {566, 154, 585, 738, 739}}]}]}, 
             {RGBColor[
              0.9927648689772678, 0.8519121724431693, 0.57757109382953], 
              EdgeForm[None], 
              GraphicsGroupBox[{
                PolygonBox[{{563, 152, 581}, {683, 89, 506}, {710, 133, 
                 547}, {564, 153, 722}, {510, 90, 508}, {508, 90, 685}, {739, 
                 153, 566}, {565, 133, 726}, {533, 112, 530}, {581, 152, 
                 737}, {711, 112, 533}, {526, 89, 697}, {721, 152, 563}, {726,
                  133, 548}, {584, 153, 739}, {505, 89, 683}}], 
                PolygonBox[{{685, 90, 89, 505}, {529, 90, 112, 531}, {737, 
                 152, 153, 584}, {709, 708, 527, 528}, {528, 527, 695, 696}, {
                 546, 545, 708, 709}, {530, 112, 90, 510}, {722, 153, 152, 
                 561}, {548, 133, 112, 711}, {531, 112, 133, 710}, {697, 89, 
                 90, 529}}], 
                PolygonBox[{{696, 695, 506, 89, 526}, {547, 133, 565, 723, 
                 724}, {561, 152, 721, 545, 546}, {724, 723, 566, 153, 
                 564}}]}]}, 
             {RGBColor[1., 0.95, 0.75], EdgeForm[None], 
              GraphicsGroupBox[{
                PolygonBox[{{561, 131, 722}, {724, 132, 547}, {110, 132, 
                 131}, {710, 111, 531}, {546, 131, 561}, {531, 111, 529}, {
                 564, 132, 724}, {526, 110, 696}, {696, 110, 528}, {132, 110, 
                 111}, {709, 131, 546}, {529, 111, 697}}], 
                PolygonBox[{{547, 132, 111, 710}, {722, 131, 132, 564}, {697, 
                 111, 110, 526}, {528, 110, 131, 709}}]}]}}, {{}, 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{696, 528, 709, 546, 561, 722, 564, 724, 547, 710, 
                 531, 529, 697, 526, 696}]},
               "0.0016`"],
              Annotation[#, 0.0016, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{683, 506, 695, 527, 708, 545, 721, 563, 581, 737, 
                 584, 739, 566, 723, 565, 726, 548, 711, 533, 530, 510, 508, 
                 685, 505, 683}]},
               "0.0014`"],
              Annotation[#, 0.0014, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{680, 503, 694, 525, 707, 544, 559, 562, 580, 736, 
                 583, 738, 585, 741, 568, 725, 567, 729, 550, 713, 535, 532, 
                 512, 509, 686, 507, 684, 504, 682, 501, 680}]},
               "0.0012`"],
              Annotation[#, 0.0012, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{667, 482, 681, 500, 679, 502, 693, 524, 706, 543, 
                 720, 560, 578, 582, 601, 749, 602, 751, 605, 754, 587, 740, 
                 586, 743, 571, 728, 549, 712, 534, 698, 514, 511, 489, 486, 
                 671, 484, 669, 481, 667}]},
               "0.001`"],
              Annotation[#, 0.001, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{665, 479, 678, 497, 677, 499, 692, 523, 705, 542, 
                 719, 558, 576, 579, 598, 748, 600, 603, 622, 765, 606, 750, 
                 604, 753, 608, 756, 588, 742, 570, 727, 569, 731, 552, 715, 
                 537, 700, 517, 513, 491, 488, 672, 485, 670, 483, 668, 480, 
                 666, 478, 665}]},
               "0.0008`"],
              Annotation[#, 0.0008, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{653, 462, 664, 476, 663, 477, 676, 498, 691, 520, 
                 690, 522, 704, 541, 555, 557, 735, 577, 596, 599, 618, 762, 
                 619, 763, 621, 764, 623, 767, 609, 752, 607, 755, 610, 758, 
                 591, 745, 572, 730, 551, 714, 536, 699, 516, 687, 493, 490, 
                 673, 487, 468, 466, 657, 464, 656, 463, 655, 461, 653}]},
               "0.0006`"],
              Annotation[#, 0.0006, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{644, 447, 654, 460, 652, 458, 651, 459, 662, 473, 
                 661, 474, 675, 496, 689, 521, 703, 540, 718, 556, 734, 575, 
                 593, 597, 615, 761, 617, 620, 631, 772, 632, 773, 633, 774, 
                 625, 766, 624, 768, 626, 770, 611, 757, 590, 744, 589, 746, 
                 573, 732, 553, 716, 538, 701, 518, 515, 492, 674, 471, 469, 
                 659, 467, 658, 465, 452, 449, 646, 446, 644}]},
               "0.0004`"],
              Annotation[#, 0.0004, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{448, 645, 445, 643, 444, 642, 442, 641, 443, 650, 
                 456, 649, 457, 660, 475}], 
                LineBox[{450, 451, 647, 453, 648, 454, 455, 470, 472, 494, 
                 495, 688, 519, 702, 539, 717, 554, 733, 574, 747, 592, 760, 
                 612, 759, 613, 771, 627, 769, 628, 776, 634, 775, 635, 781, 
                 640, 780, 639, 779, 638, 778, 637, 777, 636, 630, 629, 616, 
                 614, 594, 595}]},
               "0.0002`"],
              Annotation[#, 0.0002, "Tooltip"]& ], {}, {}}}],
          AspectRatio->1,
          DisplayFunction->Identity,
          Epilog->{
            Opacity[0], 
            EdgeForm[{
              Thickness[Large], 
              GrayLevel[0], 
              Dashing[{Small, Small}]}], 
            GeometricTransformationBox[
             TagBox[
              
              DiskBox[{179.98792912113933`, 106.84663558059235`}, {
               23.451758814862387`, 17.728826052250923`}], 
              "Ellipse"], {{{-0.9995024041025041, 
              0.03154273598333598}, {-0.03154273598333598, \
-0.9995024041025041}}, Center}], 
            Opacity[1], 
            RGBColor[1, 0, 0], 
            PointSize[0.03], {
             PointBox[{170, 100}]}, {
             InsetBox[
              FormBox[
               StyleBox["\"Posterior\"", 20, 
                GrayLevel[1], StripOnInput -> False], TraditionalForm], 
              Scaled[{0.95, 0.9}], {1, 0}]}},
          Frame->True,
          FrameLabel->{{
             FormBox["\"\[Beta]\"", TraditionalForm], None}, {
             FormBox["\"\[Alpha]\"", TraditionalForm], None}},
          FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
          GridLinesStyle->Directive[
            GrayLevel[0.5, 0.4]],
          ImageSize->350,
          Method->{"DefaultBoundaryStyle" -> Automatic},
          PlotRange->{All, All},
          PlotRangeClipping->True,
          PlotRangePadding->{Automatic, Automatic},
          Ticks->{Automatic, Automatic}], {560., -183.75}, 
         ImageScaled[{0.5, 0.5}], {350, 350.}]}, {}},
      ContentSelectable->True,
      ImageSize->{758.6666666666666, 379.5},
      PlotRangePadding->{6, 5}]},
    {
     GraphicsBox[GeometricTransformationBox[
       StyleBox[InsetBox["\<\"Correlated\"\>", {0, 0}],
        StripOnInput->False,
        FontSize->20], {{{0, -1}, {1, 0}}, Center}],
      ImageSize->{18, 300}], 
     GraphicsBox[{{}, {InsetBox[
         GraphicsBox[GraphicsComplexBox[CompressedData["
1:eJxlmXlYjWvUh0ukcsxDSYoIocyiE5YMIWVs2EN7SHsuoRBSuzRIZplVW+bU
KR0ZyskrGYoiHbO0OY4xypQk+t7zfT3P+10r/+zr7vdK+95dy3p+T1//4Pmy
VgYGBsOMDAz+e/2/PwHwvy9a7+ZXxAYylCM2kKMcsYEC5YgNlChHbKBCOWID
NcoRG2hQjtggEOWIDYJQjthgMeJmf+DT/HXExCfNEROfNEdMfNIcMfFJc8TE
J80RE580R0x80hwx8UlzxMQnzRETn5Sb/Rn4Nj+PmPikOWLik+aIiU+aIyY+
aY6Y+KQ5YuKT5oiJT5ojJj5pjpj4pDli4pNysz8G+WSQTwb5ZJBPBvlkkE8G
+WSQTwb5ZJBPBvlkkE8G+WSQTwb5ZJBPBvlkkE8G+WSQTwb51PKaXxHT+Uly
xHR+khwxnZ8kR0znJ8kR0/lJcsR0fpIcMZ2fJEdM5yfJEdP5SXLEdH4SJvOS
3/x1xHR+khwxnZ8kR0znJ8kR0/lJcsR0fpIcMZ2fJEdM5yfJEdP5SXLEdH6S
HDGdn4TJvBQ0P4+Yzk+SI6bzk+SI6fwkOWI6P0mOmM5PkiOm85PkiOn8JDli
Oj9JjpjOT5IjpvOTMJmXyCeDfDLIJ4N8Msgng3wyyCeDfDLIJ4N8Msgng3wy
yCeDfDLIJ4N8Msgng3wyyCeDfDLIp1bY/IqYzk+SI6bzk+SI6fwkOWI6P0mO
mM5PkiOm85PkiOn8JDliOj9JjpjOT5IjpvOTMJmXfs1fR0znJ8kR0/lJcsR0
fpIcMZ2fJEdM5yfJEdP5SXLEdH6SHDGdnyRHTOcnyRHT+UmYzEtR8/OI6fwk
OWI6P0mOmM5PkiOm85PkiOn8JDliOj9JjpjOT5IjpvOT5Ijp/CQ5Yjo/CZN5
iXwyyCeDfDLIJ4N8Msgng3wyyCeDfDLIJ4N8Msgng3wyyCeDfDLIJ4N8Msgn
g3wyyCeDfGrFza+I6fwkOWI6P0mOmM5PkiOm85PkiOn8JDliOj9JjpjOT5Ij
pvOT5Ijp/CQ5Yjo/CTf76yNp/jpi4pPmiIlPmiMmPmmOmPikOWLik+aIiU+a
IyY+aY6Y+KQ5YuKT5oiJT8rk9xH51CKfWuRTi3xqkU8t8qlFPrXIpxb51CKf
WuRTi3xqkU8t8qlFPrXIpxb51CKfWuRTi3xqkU898qlHPvXIpx751COfeuRT
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
PzhFXU5pb6yGN7ouThvY/eF/ABxyXII=
           "], {{
             {RGBColor[0.148, 0.33, 0.54], EdgeForm[None], 
              GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJxNl8lzVlUQxb93gwNBFBKiIqACyZcB3LiAmJCAZclOCUngD5AkJEDpwg0G
MgBLQCCBgFOAiCQBmQdFA6glLi0EFm4s2Ym4UVda5XSO/fsKFqf6jn27+53u
e9/c195ofj3lcrnns1yuSPIJQc2cx3aq8aEwIgwIY8KosIOxw8KgMM7cO8Ip
4aRwAHlC2CscY91+xj4W3haOcMZu4ajwkdAsdAprhZXIDmEP53vdCqFdaBMa
hSqhWnhL2IXuVcJ6YZ3QInShd4jzjwvb8eOQ9crp92yD5Db8sR8LFJgP7KPG
GyQrOW9CMToqjAplKdrzJb8X+tT+XWv2cY7934o+x6AfOzy/EXsd717i5bhu
Ya3X9bHWc5uIhWO2mW/jfg/73L+MXWPC07J/jffLrmWSq4mNfTonnBVqhBlC
Gf47DjXa16t2ndrTimLsjHBaeBfp7703hX6f04FNtnE0xRmO3zG1D6r9nNqX
JZ+SXac0NqH2TLVPqj0uDKu/UGsOpfg2ebWH+R4Vah9JcXa12iMpuFip9s4U
fu1IwZce7Cgvivi+r/FWuNAFZ1rhhfdtgCtLiY3n7HcTXFsCL83HBvY1w79u
eLc/hZ4h5Fa+4RrmN8K/Xuxbz3w/NvUxZ5//56Vjhu+OwTrWet1t9fcqbpMk
90huEjYLA8geoVtoE9qZt+wQfsxi/FfbI9kstLDP82uFUs39LfkPujzWiVzJ
nm909irJG1n0lwgNwgvOA6FcWEG/TujinFahXqgQ8kIT8/XorkdXHTq8rlaY
h9529Dahq1FYmgtOTRIeMOeFh4XJwhzhIfpPUttc62ax9sFc5HNJFn4XF0Ue
tKewt4EzZrLPZzwrFAtThCta96LkNe25Lryi9g+Sz3B+MXFtwj/nmeP6by5q
Vim552/yKr4tFubi8yLOm0tcHLNKvs0d4Wfi9KjwmPCn7LkruTzF/keEqcRu
KusqWDsNvVNYl2dsOvZZt3UtFB7Pxf0wCCd6HQ+dsds+Sd7IRU107XEt9Li5
OYocYMy8NB/HGBvEH59ZItxyTIWrwi8pZD7FN64WaoSvs4jLt5IXUtj3ObFf
DF/8zarY08AZVcTY8+alv9sC/LM/5rh5et35Jnk7i/2l9pH9JfQXac13ki+l
sMnzZcTsZsGPLHh2Wmt+y8L3pPZPudjrmF3V+GzJMymk+Wi+fpYFX0+kqEmu
Ta7f7dQk16bCHdlMjVlDTVpPHVvNOteyeupfa3ZPXzW1v5ka10A9a+OcFsYa
4anXV6GjER0ljPle/CKLfDuboqa1sLaTM9yfrCTKS76ZIpect84t5+Is+o7B
bPpT4KhzoBjp3LqUxdvBb4hPs3iTuJ/BU/O1CN2Oo+tZKfYeoD5vw/ZG/PRb
wLV3B7p8J/tuTuiw3hHmPbecXHs5xX3TwTepRJ9jehNO3CHnnHvlcPwWXJmA
C+bEH9L1l2Rrivm77K8m3rb1LtwzB8fJlSvk0xg5N0ouTtyXh87Lwj3hsR7y
b4Acs56KFDXCNrpmuC7M4xs4Fhvh2hD3ke8wv0t6s3vvlD7mZsAv2+43hHnY
l+KN4nj5HtyPDn+PQcasyz67BrnO7eLMbtaa3xtYuxZ++cwuON7LmPt+G23i
vH7mvd/3ge8J83UynHqa3JsD/5z7S6klC6gXy3Jx391/H1q6xrdQPzqpFd7n
2vNVFvrPp6gd1ffVEkvXpkzxme4cThFr17FF8Hgh509nbaFO5+GTa08Neis5
03fFl1n4dC7FveK70/eMa5/7roWFe7eJfS34Z/5fIreWMOZ1daz1fufLJ8LF
LN53F4TzWbynL9IfQYfXFd4i3ejowCbHqZWza7HLtXwYfX6n5vGpHj7WEqNy
bLJPx+Ff4Y0/BL+OwdF96PK71Lr9fvU7329K3/e+99vSvTeu37z+39gNj45Q
D8zHUcYG8O0wvpqv5r1rTeHetb0XicthfBomZoX/JdsxTg7Y1jF0u1+B3/bz
BD4dIL4H0WvO9ZLTvhfNnYkU3Owh7+cTp1piv5nv4feK430tRd+1wXf1HfLP
tXML/w/9rj1Z5ILfPs7RMnJ9ZlHcTdtT5L3Xu2b9B51Wfi4=
                 "]], 
                PolygonBox[CompressedData["
1:eJwtk71vz1EUxu893y5sTdpSraq0iqZqq4RIKnSkiag/QDtJw8AgBvUyqsRQ
xEvVS9Mqbfm1LLReSq1KDCa6SdoFE4mEz+MxfPJ9nnPv995zzz13/aGj+49E
SmknlME8Zi/fffA5p1RepLSD73Y4xdhjWMdYPbwmNo2vS47N4Wfwbeht8A4/
i29H74L3+GbWu873GgwzNg6rGFsNT4l14JfQH7UGuhFm9C8sofvhIPPa4Qx6
A7xgbAyq0F3wJ3mNX+jj0MzcSljJ3j1hrTmaewB+o8uJZcb34L8mx36ifxDv
Qx+GBXzASfRFKNCXoTc7pwvhmqg2qsEbdAOxkeQz6CzKUbkOwCL6GXNakmug
WujMOrvOtIzuC9e+E6rJb3e4FspRuQ7C2ewcrqBvw3n0LWhl/l38VfQ5GELf
gBPKFTYxfgnfnR1rxJ8O11Y1U+2OQVN2D6gXysK5qyaf0FuIDTF2E8bwmwvf
rfbU3i2FxwZhFH8vrKdga+EclavWuM/YI6hh7VrVgNhEuDeqVUP9h1+b3HOv
8KXwXMVe4h/i1ySv8Rw/Gf5XsVn8A3wpuwdHwjVQLfrhDn5jYf2vhuEclWvp
/7+L2b3QBW9Vu3DvqEYrmFsR7g3deaXeinouu8YD+G98e5J76Dt6PvttqAee
qJ8L35XuVHf7IXsvvSG9Jb0pvS290YXsN6q3qjW/KO9wr2hP7f0XRFF2Ew==

                 "]]}]}, 
             {RGBColor[
              0.5059918396030274, 0.48153067845473807`, 0.5216214105848018], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJxNlVlwX2MYxs95DzO40NjSscwQkbHG3pFc9p+6IVx0qOWmpIYLNE3Splyg
sUQTpLbGoMYWW2JfBklKUK1lTFLbYAztDJ2hnUF7Q13we+Z9Mu3Fc97nvN/7
ne9dv9PQ0blwaRRFMQkqcCSPxWVR3I/yK2QbuqlI2QxOBTvQX4mcRv8D/Dz4
BngrvBEcB2rgFNAMvrCNbGe/tQk+H5xsu4M4twnZE/leD+bKHttRMAZK1oaQ
ByM3sDYP/hGyF1whn3Q2axPoG5Errevw+WcXuUc4v0idYpI/NfBMkXvHwQD7
2+UDfr0Vuf4x7zOgXbEjf/dZOrM+0s8m5PLIuFZF2sl+Er4Zvgi+Hv40uJ33
E/n+FPJM9K+h+wB+Fvx1+Idl+vwG/CnHcwL2I/A74CdVGb/ieRPd+/Az4K/C
18NPg78Mfw6sVp6xfw95OvpX0H1q+3fhn/vcCfhn9mccvtHfeTuy5sqb4jks
Ml+HIifL7IuX4C+AAdWds8bg67QfPgoflB18vMy8v4juJ/gS5RY+49wrp9eC
PrAK/At+BdvAo9j1sOdYvvMIvBveAK/Bf2F9IXIX+BbeityO/KbI9wci++Qo
7O+L7HP1+xr45fAj4A/Du+DHwB+CXw9/DPmsY1FMu4s8Sz5tcd1V/zXuoRGt
RfbsXOUNHMje/1zzpaDTuKzMs1eU6Y/8+zsy1gWRudO5z0fmYhisLfIbl3r/
jNd2wr+LXN8HeWeZsXS7BzuKrOHPzvls7m8EN7gv1Z9fuk+vcx3+KtPmT2Tl
OCNSJz7kWqqmE9hsjNy3RfNY5fytjczXdJF1PieyLudGznoBSnBxJL8KWVdm
rlV/9b36f517WTGpD8oq1y/yTCiny8rMWX+ZOei3rsv9pz58EvvHXQ/N4s2R
94/uoU88I++4/pc419OuuWq/0/1Wc1zyYbdj22a7fxyLYlrgmrZF9seQcyd/
5bf8GHIdlNfbdE+iu9X3Yc33pe5W9dIccIi/1YC8J9LP4cg+k00Hcg7xtMBv
gvdG3scrZBuZ70WekdI12O66qD5Tnhu9/xYZ/7zIXPbb73HHPO15k31LpH7E
86B7vNn3/B9lxlh4dle7Rm3uZeX5Xs/j7Fwu22tWOss9vV/zPsV3IbjAeq2r
bt9H3iG7yrzL1Yf6Hwz7XtFazXuUuz73u/p+c6Tc6rX5Pq9rr55a7Lld7rnt
9bv6csCx6f+hswcj49YMauZ+LHMWd3j/oPfIv5X+Vl/kuXcjN6lm2H9dpl+a
T73rf9vqHGjudeeMup7Ku2ZrzHeG4j6gyn+T/lH7Vbm/O/KOU86aqqxVm+N9
MDK3R6M/vMqzbrGuxWcPOgbFfk3kuVdH9miTe7be9dfZ+1c520t8l9aVe2wl
69zj2tfourW7vlsj49jX/5ken/1EZM6Or9JX+XcXuv8BqbIIBg==
                 "]], 
                PolygonBox[CompressedData["
1:eJwtlFlsjlEQhr8zPwkuEFsRhKoKVTvhEkFCuSjRcEP/oheopdYLS+37Xnts
qa1i36taxL7WGoIgQYLEemO58bzmv3jzve/M+WbOmTNzmsXHZ+ZZFEW5oBJI
jkVRfoiiSWALjuboycFtW9GN0dnwEWAdOhU9BT4V7EQPAQH+mVh94aNBUnBb
FrxlzNdOA7vR+8E2+CKQhq8VmA9fAIrwpaOXwJeCYnQOqAn/S/yAbxD6D7wG
tgjdKOZ7Gw7W4BtsvvYD+AVvHfPYC8Eec4hrD3vhmeBd5DEVuw3rFwffwwHz
PWqvsu1Dj1Tx4PXAKPgrvnFMGaACfg/0h3cBV+CFrInzHQCaEGuX+dlUQ9Wy
ErqQtcXgDbwFtnH48sB21cq8doqRgu8h3yGsHQOu4WuKbSK2CWATulnM71K2
zeh8xQxew6r4vvGdwb854DX8KugJzwJl5jmVW3eyA74SDIX3AvPga81rrR5R
r9xHZ0degy/YzoP0yGOeMt+T9jYMrNbZQUbwnlJvLUf3UK+AFfCGMV+rnMq9
wdynmmyE1495LRVjCXoZGAjvDhrgO4NuR+724Aa2Orpz+Cq1C/wntgL4WPAA
nQxK4PfBR/jb4D7V47r5nSmfcqxHl5ufrRd4FPzMOvt08FXnx98J3hncQc9E
d0vcv/Yum3z9wF34WfO9dgA30VfMfeqhF8Ehrhq/VM+b51qpNtRsEDMl+B3P
Qv/gOyfynnqGfhz8LNqz9n4atI28RtfwJaEPwjeAt/Ba5rGLQG14ZXOfavZc
/WXuU81UOzOvrXrqO/HOmZ+lI7iF7oqugJ8Hn/QegIuR53yv3jTvfdlS4XPN
ey1dbwy81Hy2VAPNVh/zt0Yz+Bs+SW9W8BrXoBZxdPXgtioxn1HNahqohr4e
/O5UA9ViinkuvVm55m+K3hbFyDZ/05TvKfgJv2o+O7pzzb5mRvXVTD5Avwk+
m7qDCny9wZPIY2jvqYnz/7epN8xjy6balJjXTj10m1iHE/2s/ZaiDyXuTzNW
gj5p/taopy6jjyT6Sf9cQB9N3IdsZehjifiylasW5m+l7kh31dz8rjQzdeFz
zGunGS1QLvNZ0Zv5A37CPLf2e4k1xxP9rxwX0bPNZ1M9ql79ByGBwJE=
                 
                 "]]}]}, 
             {RGBColor[
              0.766133361093196, 0.5729542163586312, 0.3686947653637442], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJwtlElsT1EUxt87LxqbptESKkj/tSAWupBiK/l3wEolVFVVF0gTUxOtBJuK
MSqGhWnH1pqWhShRLa0Ym2LTlgRpCZVgYfh9OWfx5fvuefeed+4Zbq5lT91u
S5KkDWTgfZokDfAAxrfoZvQDdA2YQG+AJ7WXbwa+gA7WT7G/i/06t43178Sd
TgeF2FqwfQI9mMvhUmwVYCk4YK474Gq4EWwGB1lXwoX4eIbu5OwU62/ocfQq
eBTcQM+GT4IVfJ+TeXyKeTL+p//mYm8vuAc+mPMieKP5me3wEvM9i+EX2OrR
d9F9YBd6VP+IHCgXD0Ee+02+nwF51nOJoR+uxt6NbQBdg+5BP0JXoW+hn6BX
o++gH6Nr0bfRe0GOdQF+rmE7Dbp0H2zt8J/4p+q1KeJTnC9Tr5/sr9EjoAn9
Mf6zNfH1v9R9FkWO14I14EjEr3uMgIvsmQaXgW70Mvh55GE86lSVet3GYn8B
fDRqWUz8Q4mfVQ2uB2utu+mO+8z7qCvuOT/zeE5FX8i/Ymowz3e9ehLeEr2i
M8qJfJw1j+kSnJr7TOCv0avq2SblWfkIbgpfikX9szx6Tnk5ZP6tJvb+Ne/n
ZvhN9OQP1hfMY1bsjZEPnTlnntd5medd9VUd8tH7FTFzqqV6osQ8R8Xmd9Bd
yjLvUfXqSnhh5jGfRx+LXJREzioj/nZz/53m86B7HUb/BL/wsy5mSHOqdWvM
5E7FG3NeCw9H395Hj6Xea/3hWzOgM59T76sh8z7TPQf1ZsQcaZ52mO/fHzOq
XJeD4ZjRiXhXSsPvq5idXvYXZb63DT0Vb5HepOPmNZmZeZ2VN83KYPS6Zqs7
bPo2HHOvmE6Y139W5nOr/Pel/mYpJ+uxzTA/u8B8LXsdfNU8/6rDd/P+roSv
RK+UY79s3gc59H9DMKC4
                 "]], PolygonBox[CompressedData["
1:eJwtlElsT1EUxt89z7Sh0aI1RPq3smJh7o50tqELtKjqApEYEyXBpmYhpoVg
x9betNESVVJirDY2bVkYGqESLKjfl3MWX953zrnv3e9899xXaN3VsNOyLFsF
xoBtBNNTluWgCV4EzpC/DibDn4P98DbwlTXT8iyr51kHTlJ7BjZRawFfyE3N
vVYLTlAb4rmD2jrwmHgcuAxvB/36NpifXMN2eAP4Q20IrID/Tb63NI3CL5Jr
jv1nstdCaYj13+Gj4Hfm39gML4A78BugBD6Jdxbz7iJwkPidtFJrBn3wc+Sq
eK4H5+FjQ+9NMGDeg3ppBIOs6TbnTeADcReojPp9rTX3dpi4Hj6e/ecQF8Bu
c89awt/h5O80hl+viIvNtZ8FCf4zuXfy9CVxmbk2aRyE95j3ojP5zNqRWK96
H7Wj0Z88PwBfbu6dPPsFn4G+yuRr5MVDc336Xr98C7/l6Sd4aezfAT7Cb4Nq
eJXOm/XLiHs1O2AEvgUY+TKwFV5r7o3WVMBfJ+9d/XUR7zX3ayKYgLZ95u/O
01zAB2K+1OML4nugLvMzfZpcs7Qr1wNfaq5V+0nbabAy+UyU8v0F6iHzHjVb
s83vgnLl8FZzLfJLs7Y65k25f/DDYElyzUV8r91cqzw9Aj9kPnv1cZcqwp9O
eQR/m3yW5F8HcQlrashVg2Pygnhj8jtwzXyN1srzN+QeENdE/5rtPeazpv40
+7Pi/qrnS9Q647z0Ti+5ueZadKaarcx89vQP+BZ3ri70X6BWnLs2zYtma0ru
d1+aj+vuhR7t0U2uPPe7tQFcMfdc2uTZKWnNvaYer5r/c9ri//I++T9hKM7n
B/xW9K8794j6XfPetecT3a04L52H7t4a81nUDK6F/wfBLJp/
                 "]]}]}, 
             {RGBColor[
              0.9201717064829656, 0.6704292662074139, 0.35253229009719333`], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJwtkzkvRVEUhe89T5AQMxFi6ojGVKnoTAUqY4hKDO8RhKAzJv6A1g9Qq9GQ
PAoxPKIxxhwSnogYvp29i5W1zrrn3LvP2vsW9YVag87zvCYQAJe+5wXhHcxc
dDkoA1Ws9/Ar4Tg2JuL1os/BPH6UdSc6Bm6HH+EJ/H10WN4LLjw9F4U/watT
rwZ+AhF0NbwMqtiXxXca0C/4bfASqMTPxH9Gb+OXyved1piGnwQK0aN4V2CV
PfHwIqjAz+D5H7yC/+PrPeW+V77WInVJfaesu+EInM2edXQxfAhG0Lf4X2AM
fey0Vql51vKQd4bAJutO2cOze9sv51Lx19DJ8JTVL/eothzq4Bu8LnQYPQBy
WE/CjZZJPfxsOUveP6wT4B74Gx7HP0F/+Fqz1P7r9I4t8ILT/qZTe4f1rh++
9rX2XXS+r/eS3COWyTb+mWUb67QH0osSeMPTOZGejzjtt8zLp9MZqLW8JaM5
y1r2SN1xlp3M1LT1KyGg2cjdZR6jTs80ww92xz17d9i+PeN0BmQWQugCdAw6
xTLPg4dsvgclE5uHJPSdzWsFfOC0xneeBwKaRdDyu7CZPvK1v9LnE+vXFnrY
spNzb/bvyD90abMkM1VoeeXbvMv+AqtJanOc/Qc0pHUF
                 "]], 
                PolygonBox[CompressedData["
1:eJwtk7tzjVEUxc+3vxvMiBCPAkOiQyW5OgU6jwYVLsOoMOTGYDw7zxn/gNYf
kFovFULBSDwqNx5hMMzkURD81qxdrPnW/vbj7LXPPhtOtA8MRSllO2iAlxht
vsNgpiplGtyA3wdv8fWBh/AxMAV/F/bfBAvhTfCsOKYfPk/+PfhF8B3eE7Yf
gGXwbeA1fFR++CQxQ8U1X2DvSv8PsAe+E3SKz/gFX16XsoWcAXALeyMYyXqb
4Uvw9+HrB9ew14XPVn/SsiCsTTkduIaxntgm6Cb3T+Xe1fNf+IraZw2C28R+
qjyrFniKvap27lZwF/sUWANvgBb8GFic/XQRuwP7PbmzQviffOq5jR3YayvX
UK194VjVmIc3Up96Pqve836ksVf6asd2q0/sK+H+VfMMfIrveWKPgjfw6+He
VVOz2x2eve5Ad3Up9Wjml+Enw9r07zT8XLh/namzD2a+Yg7DxyvPSjN7gn08
3Nuc5gtfWXu2muEd7ENZXzX2anbplwZpGQzvomb4U7sHLhRrkrZN4V3Q/a4W
D2s9AibwPwpz9fQK+3Nlv/K/wMfSr3/y6Y5bmf8xd6SZ+3AV3/PwvqiHr/zb
H9amnZ0La5Z2vbEP+B/ne9POdyrv7GjO+xt8Ue6n3oPe2kTq0xnazdnKb6+d
b3dp7rf29R++8bAW5fyuPIORfM+T8P8VrXwV
                 "]]}]}, 
             {RGBColor[
              0.9617278600756443, 0.7743196501891108, 0.4813563662344973], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJw1Uj0vBEAU3H2c+0K0Pi4XpU60CK34jE4EiU6CCx09wT+g4RdQ8Qt0dBKC
BAkOhbjiXOQOMZN5isnM7r59+9687ZwvTC5bCGEQqAOSWOyCb8EJbGRiCHPQ
P8An9idMe+WgdQL6A1wChk16CtyIuzmcMXkySncA06Y7C6Z1Q9T5jefg/Xec
XYN7wWfACnQRMf2muD7wqCl+BHwBbEBXWAv0A/QA+A3rVegXvo31MXQ3cwbp
k6A+2E8aWDJxPWpPQ2/i7A5c8J7px1GQP3vAk4kzpn7YlyGmbMo7Ds4CW9D3
plzM+YW4ktfRA654zYPgalR81r2kD+z51VRvHnzqe/8ekYfcD/qZcL/payqq
133gAFh039dMoM6i5h0/Z9yMz6wKnjXlqIFr4G2cX0I3mWLbTf7S53PoFlOe
ZvBz1Ow4w++oN674j6Lmxbk9AofQreAx963sufkW7xRNvrd57hOfH+fAfd4/
deZ63dQ//2DefcuZ3mBMl+l/834K/Ou1scY/jyBmuA==
                 "]], 
                PolygonBox[CompressedData["
1:eJwtkjsvRFEUhc/dF2O8omYUSiGCmtCKZ3TilWg9JpR6E/wDGn4BFb9AN0qP
EELiEQoZBYMZxLeyb7Ey3z7nnj1nrbNb57MTyxZC6EQVaJDikt8CGoK/ohBy
8Ao6o25BR/AeaoR7UD742rP5N/p2FX1y9pZ6A95EdXATOoB30AM8jj7gO1SE
B8xZPd/garQN76N7uAMdB+/xBM+hmsh7/KpX0u8djWrP/L/W0Q1cjJy1dk29
gKpYy6BFWGG0wNUojkOYNM+iknoKbjD3voX+WLswZ/krUw9Tv8FXqA/uQoeJ
n27zTJSNMinBbebe5KkdLqFU5HeahvuTPORJ3k7Mzyvjx8h75pP8CvC5+V3U
/5v92ti9ydMaexa7F/WXd3mU1zRaoq6InZVp1jwz5aUZSMNj5tnqmx/4KfK7
aP/UfC2d5DcLN6Pd4BlkzD3Kq2bs1fxMLnmfj8hnRPfXmXq4bN5LmcyYZ6K7
K+MRuNc8a/XUbMjzRjJ/L5G/sd5aM5SC/wHId2LP
                 "]]}]}, 
             {RGBColor[1., 0.8805088437386336, 0.6197040820099379], EdgeForm[
              None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJxNkT0OAXEQxdeoCBdAoxehJy7gI1GjcACO4RA+zmCtK5ClV/nYRrSCCFkK
bzJvE8Uvb/87/3nzdjbfH7YH4jhOEcTBGhzAHnhgCmbgCB7gzjtz4JIxmIAF
dUoPvXujzwb47NP+FShj8BZagubAEs9Z6EWsXhDz8uh9FJuVhJ7FvDLQlFjG
gB5bzosyuTwH4MS8LrMk6KneI2bXvjBm5xd0x9o7ZnOWzOTTT3eTZgbNUhXb
X12sX3vVoyG2j45Yn89cD3rouyt3orvp8H4IbYrlf0J7Yj1f1vd/+z7QK6B3
tAuPuZ/0qYnNX7BW4M4r0K6Y10dshs5q8ZtW/H8/YixgtQ==
                 "]], 
                PolygonBox[CompressedData["
1:eJwlkEuOQVEURU+d6JSKpg46BqAYgM8EfBJ9GgbAMAzCZwyIKRAxBVV0hB5B
NSp0rJ3TWHnr3Xff3WfffG/Q7ruZpSEB/x9mQ55j2PPhDHN8AQX8AFN8Al94
GVb4Dip4TXvwLVzxJ9zwO3TwImzwX7h4ZChrBJ8ea/r2A1X8G9YWM2iWDMws
Mk/4n86wyGx6zKTZ1OFJlxbvD4s92pv0yNIZR48MZSlDWS+PWfVPF697dFOH
Bp6FpcUdpPCSR1et5TzuSHeljur6BpbpNeU=
                 "]]}]}, 
             {RGBColor[1., 0.95, 0.75], EdgeForm[None], 
              GraphicsGroupBox[
               PolygonBox[{{557, 199, 743}, {750, 199, 559}, {559, 199, 
                557}, {743, 199, 558}, {574, 199, 750}, {558, 199, 
                574}}]]}}, {{}, 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{743, 558, 574, 750, 559, 557, 743}]},
               "0.0006`"],
              Annotation[#, 0.0006, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{725, 504, 734, 521, 733, 522, 740, 538, 742, 556, 
                 572, 573, 588, 589, 604, 762, 605, 763, 606, 764, 591, 756, 
                 590, 757, 575, 751, 561, 560, 540, 539, 525, 524, 735, 523, 
                 506, 503, 725}]},
               "0.0005`"],
              Annotation[#, 0.0005, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{715, 486, 724, 501, 723, 502, 732, 519, 731, 520, 
                 739, 537, 553, 555, 749, 571, 585, 587, 601, 603, 617, 770, 
                 619, 620, 633, 779, 634, 780, 622, 771, 621, 772, 623, 773, 
                 607, 765, 592, 758, 576, 752, 562, 744, 543, 541, 528, 526, 
                 510, 508, 727, 507, 726, 505, 489, 487, 716, 485, 715}]},
               "0.0004`"],
              Annotation[#, 0.0004, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{705, 470, 714, 484, 713, 482, 712, 483, 722, 500, 
                 730, 518, 738, 536, 552, 554, 748, 570, 584, 586, 600, 602, 
                 616, 618, 631, 632, 644, 786, 645, 787, 646, 788, 647, 789, 
                 648, 790, 636, 781, 635, 782, 625, 774, 624, 775, 608, 766, 
                 593, 759, 577, 753, 564, 563, 544, 542, 529, 527, 511, 509, 
                 493, 491, 718, 490, 717, 488, 473, 472, 707, 471, 706, 469, 
                 705}]},
               "0.0003`"],
              Annotation[#, 0.0003, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[CompressedData["
1:eJwl0L0ug1EcwOHzkiY2CYOGSpTBFUhYLfZKajDpwEYiYbMwMfjqUtwHytAO
omhFhMXHYujQRDTRC9DnxPDLc/4nJznnfbOFtdxqEkJY1HlPCDVDlS+s8JU1
fvGZHb4xFfc0pKYmNa2ZeEZzymtBy1rRhja1rR3ta7g3hAMeqqQx8wmzPOU4
zzjBY47wiBkWOcq9+A7uMs0t9nOdfSzwT0sK5nnmNKtfTakV74r3alADSuJ5
tX3zj56sv/mpD92Y3/mohq7NdV7xgWXe85J3vOBt8v+fu0XYMbI=
                 "]]},
               "0.0002`"],
              Annotation[#, 0.0002, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[CompressedData["
1:eJwl0TcvhVEcwOH3XhYmEiQWInrf+ADKBxC+gLIyYFVmbMqi994tuFe9Rm2y
KDMLJjbPG8MvT/4nJycn5+S1djV1RoIg6NVmNAhODEdMMM4HxvjIG77xnt98
YnK4piwVqkgfqlWDGvWrFrWrQ6lJQdDDAQ1qWCMa14SmwrPsmeaMFlRqXmQZ
l7isDVWbV1nOFVZwjZVcZxXnwntxlsWcZwknWcAx5nCUuRxiNvuZxj6ms5sp
bGOEzfxRvepUo/fwTOUrUxlKUlRf3uxTr3pRwtpz+J6606n5lte60qH5kge8
4D7Puccz7jLOHca4zVNu8Tjy/59/UGg/yQ==
                 "]]},
               "0.0001`"],
              Annotation[#, 0.0001, "Tooltip"]& ], {}, {}}}],
          AspectRatio->1,
          DisplayFunction->Identity,
          Epilog->{
            Opacity[0], 
            EdgeForm[{
              Thickness[Large], 
              GrayLevel[0], 
              Dashing[{Small, Small}]}], 
            GeometricTransformationBox[
             TagBox[
              
              DiskBox[{199.98927118222426`, 120.14833053268083`}, {
               45.552083554744016`, 28.666945040743954`}], 
              "Ellipse"], {{{-0.9159999279471408, 
              0.40117842913201707`}, {-0.40117842913201707`, \
-0.9159999279471408}}, Center}], 
            Opacity[1], 
            RGBColor[1, 0, 0], 
            PointSize[0.03], {}, {
             InsetBox[
              FormBox[
               StyleBox["\"Prior\"", 20, 
                GrayLevel[1], StripOnInput -> False], TraditionalForm], 
              Scaled[{0.95, 0.9}], {1, 0}]}},
          Frame->True,
          FrameLabel->{{
             FormBox["\"\[Beta]\"", TraditionalForm], None}, {
             FormBox["\"\[Alpha]\"", TraditionalForm], None}},
          FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
          GridLinesStyle->Directive[
            GrayLevel[0.5, 0.4]],
          ImageSize->350,
          Method->{"DefaultBoundaryStyle" -> Automatic},
          PlotRange->{All, All},
          PlotRangeClipping->True,
          PlotRangePadding->{Automatic, Automatic},
          Ticks->{Automatic, Automatic}], {186.66666666666666, -183.75}, 
         ImageScaled[{0.5, 0.5}], {350, 350.}], InsetBox[
         GraphicsBox[GraphicsComplexBox[CompressedData["
1:eJxlmXlYzfnfxs8g26AsUZRClixliUTpbVBZhgl19krO1kJCtrEc+xANQigc
S78hhSyTZfDFoPSQLYxKhzSSZJBdzXOe5+nz+T7X3fwx53p1f6+L89J1n3fd
ncJjJmrrSSSSAsv//uf1//7T0P++GINrX4ElWsiBJTrIgSV6yIElBsiBJRGQ
A0siIQeWREEOLImGHFgyDXJgyXTgWn8krf06MPPJc2Dmk+fAzCfPgZlPngMz
nzwHZj55Dsx88hyY+eQ5MPPJc2Dmk3OtP4ms9nlg5pPnwMwnz4GZT54DM588
B2Y+eQ7MfPIcmPnkOTDzyXNg5pPnwMwn51p/AvgUwKcAPgXwKYBPAXwK4FMA
nwL4FMCnAD4F8CmATwF8CuBTAJ8C+BTApwA+BfApgE+jvPYVmPcny4F5f7Ic
mPcny4F5f7IcmPcny4F5f7IcmPcny4F5f7IcmPcny4F5fzJmfamo/Tow70+W
A/P+ZDkw70+WA/P+ZDkw70+WA/P+ZDkw70+WA/P+ZDkw70+WA/P+ZMz6Uln7
PDDvT5YD8/5kOTDvT5YD8/5kOTDvT5YD8/5kOTDvT5YD8/5kOTDvT5YD8/5k
zPoSfArgUwCfAvgUwKcAPgXwKYBPAXwK4FMAnwL4FMCnAD4F8CmATwF8CuBT
AJ8C+BTAp1FV+wrM+5PlwLw/WQ7M+5PlwLw/WQ7M+5PlwLw/WQ7M+5PlwLw/
WQ7M+5PlwLw/GbO+VNd+HZj3J8uBeX+yHJj3J8uBeX+yHJj3J8uBeX+yHJj3
J8uBeX+yHJj3J8uBeX8yZn0ZUvs8MO9PlgPz/mQ5MO9PlgPz/mQ5MO9PlgPz
/mQ5MO9PlgPz/mQ5MO9PlgPz/mTM+hJ8CuBTAJ8C+BTApwA+BfApgE8BfArg
UwCfAvgUwKcAPgXwKYBPAXwK4FMAnwL4FMCnMbT2FZj3J8uBeX+yHJj3J8uB
eX+yHJj3J8uBeX+yHJj3J8uBeX+yHJj3J8uBeX8yrvXnHFb7dWDmk+fAzCfP
gZlPngMznzwHZj55Dsx88hyY+eQ5MPPJc2Dmk+fAzCdn9v0IPo3g0wg+jeDT
CD6N4NMIPo3g0wg+jeDTCD6N4NMIPo3g0wg+jeDTCD6N4NMIPo3g0wg+zeDT
DD7N4NMMPs3g0ww+zeDTDD7N4NMMPs3g0ww+zeDTDD7N4NMMPs3g0ww+zeDT
DD7N4JOm1D4PzO8llgPze4nlwPxeYjkwv5dYDszvJZYD83uJ5cD8XmI5ML+X
WA7M7yWWA/N7iXGtPxP4NIFPE/g0gU8T+DSBTxP4NIFPE/g0gU8T+DSBTxP4
NIFPE/g0gU8T+DSBTxP4NIFPE/iUhNc+D8zvT5YD8/uT5cD8/mQ5ML8/WQ7M
70+WA/P7k+XA/P5kOTC/P1kOzO9PlgPz+5Nxrb8w9jww88lzYOaT58DMJ8+B
mU+eAzOfPAdmPnkOzHzyHJj55Dkw88lzYOaTM7vf2fPA/J5nOTC/51kOzO95
lgPze57lwPyeZzkwv+dZDszveZYD83ue5cD8nmc5ML/nWa6hmcufNlp/P5hC
zvcc0N6m7n5kLo7fm1Ak7nEFNamZuV/FPW75gfzcU7ZS+vdSbJlchnuSho79
5+c23Z5L6caNNwU7p+OeoqHCwo0ffYPFP69EdqjK9qC4V/mWXWy2e6u4V61q
4zXuhkncq7RJhan1xou8siIu1PuLuF+dDbtzx+e4lJSV3dulrBT3mNjHQ6Y7
BYv7S0Brg0TVs+4+4ZvheradUkY/N/qiPZeJe4aWBl8+9XmqjcjGm07jziyS
0S3dVMdVA+vuGR1Dv1t5r7XI+7okrUyeL+4bp2N/HdNmlowqmhSMOjS57t4R
HrN0eHW0jFIKnDcX5+I+oqe8QCtVjr2MijZkFblr6u4hvksuLLh5WkZZhoB2
jvXFPWTh13ZnHbzr7glz4+RXJ3rLaVvLy1t+SxHzVjEnhryvwD1CS/Xfp9fr
ViMj7aOCoESfuvvDX/MW/rX1qfj+JzQ62/LSRDkNjuvj1Ow33C90pHtT43LU
LPoxxitfNfGR05Do9ArHcXX3i2bbfOr/WSH6cli759ruQDnZG/wdFDm4f+jp
Sdr3tub7or9nu1/GNomS07TLAd/29xb3j1dR/YLGPxX5B+nNKe7rRN6yPs/t
O6m4h3jJoj5FfC/uCWEVGR8KZ+C+oKHSpPKHnnYKmrQm5J8PWWJ+5E39Gec/
4z6hpTibHgODOivoq/OybzlDxT2i+mHNkcJFdfeJnomTmic8kdP6/QPqdb+F
e4aO2p9+va1/sui7cHRiS+ca0WfvoZL8opMi/5tZtXeLvYISRno5J1zC/UNP
qR6Nxuz7IKc1xxuO3BUq7h2brOcvTWpfd//oIVPFN70jp7ll/SeeeizmKdZl
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
pT5/tFhkSlJSSfg0a9dUHU1u45J0zlNJPetHD7PT6klosFe935LXO1Lpffum
npY11BV4zVHSh97Hnrv7Gyh2RHzBtUjL53mvdZOtLPdlJt2pWV2tpNQXZ3S5
OZafr0Ls2me6qej9xQGe9+N09HrvjYkXZ6joUrTz8zG2OnLZd1TxT7HS0tvf
Zo0v0dHCHl8y3k9WkW6KflNSvI7sWyUrp95W0p81QV9H2+qpW43kc6Xl+f5Z
Vb0MxXrKbfV6uMMEFe2z+r1doOX+iGu8cd/8eiqy/fYqwt3yeej05VlH/9mW
z4O8fn/u62Qg4+9j/hP3Vkl32/iNyrTcEz5OL543+VNJDbfsWvVono7WFr/K
8R+opts2f7dxaqWjIfby3W7JKlqxyvTmc5mOrubMKJ/jqCarT51njRmqp0az
T6S/fqiipVP8H/1RqKcfWkX5d/heTcc80yd3PaandZPq/euZq6KS5i3z1q/W
U/7m7b9PjlfRwk/291/KDHSmqtvFKVZqchhz7unedpY+fN1h8ux9KsqeO2jy
oEoDpR8PXBzYVU0rvEqLixtGkN/9B3kT1qooxaX4Y2paBJX/fvPdJ8vnc8q0
0atXDNVRpEvldb/taupflr1z3mg9jVVlVHgcVtOJrT7e+dl6ahGueuSboSa3
uxt8uq7X01VveWHWJDWZB//UfsUCAwUGzet+9aOaZPId7761NFCDVfppXxVq
y88lNbeczlv61mPxafedanJ07OreYH4EpR/K8lv1Xk2zXEqkr5IjKOP3e/Wf
Raipbej21JD+OtrTQvdpvaXvH9ibWzhY/v0udfupbZpTCDXISXrpYbnHV2VM
nZI3OoSGHsrbMsvGQH8Zs8Iy7EIoTdrSvk9QBC2pvyP18pIQ8rma0Hcz6Unp
ej/gsXMoNUuueXPlgeXzoay6/MCIUHrb3O7yh1gDvWyz3+VtZChpn/sFH75j
oHbKyKVW3qHUaoNn1I8Ols832V3n2eUh9N9Be3uO
           "], {{
             {RGBColor[0.148, 0.33, 0.54], EdgeForm[None], 
              GraphicsGroupBox[{PolygonBox[CompressedData["
1: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
                 "]], 
                PolygonBox[CompressedData["
1:eJwtkbtKg0EQRvcfE6MvYKOoeQWFiI9goUgeQEiwEkwgxEu8VjaCpWAppLOz
sPFeSjotEhPBvIBWeQHPx2dx2DM7/z87s1us1su1SCkVIQfvBEPWb9jG87CB
N6GA92E8Yx/28RKck7uGJXwZbvBLuMXX4DV5T7nZcC39M4dPwim+BW18Fe7w
DrzhA85ZSe7hKnyGztI3j/gRqP8xxXw7Hz5bNVX7OJzTbE/kL4gX8EXoE58R
T+MzOo94QFzIPGMLr0I3eYZ1fFf1yP0SN/AdGOET7H3hD6xTxCzpMLynnGoe
4J/hu8vBHt4Lu2qq9km41zw8Z0auHl8y96zedSe6Gz2e3ko9dMMzaBbN2ME/
wr3+QD2MXDNt4pXwXQ//3149q3fd6T3yB+ZnPwE=
                 "]]}]}, 
             {RGBColor[
              0.39890936514890224`, 0.44389785995648323`, 0.5845708524364281],
               EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJwtkbdKRFEQhu89Iir7AAbEUFspmLDRSkEMKJaiLoqFCcwZM2uhtTZuYaeV
YKVrWAysioV5TS8gGJ/Ab5gpfr7/zD1nwp3cYF9Dr/M8rwIloD4OT/AWdqI4
vgN2oTf8NdxEM/gU2I++8MNwC4XwmTAJDeAT7d0f+vU0tuzpvXarJTV70AX+
BtajKD4IV1E5/sr3vAl8Kn4fP4r/wT/DGNrF18BXp7WGnPYqtbud5pX8bbAQ
beCrpUf0jb9zOo/MlQMHLf89LEPb+BKh3Qk4nVPmKLB8IZttzOmsL3DH3pZa
j3IvjCJOWQwbbd46eC7z4Fthi3mJPaJ3vCwrYD0k26wyo3yL8V/y4aLTncnu
LpzWlh5qYbbTHrOc7kx292SxsPUXJ08l/PC1P4kXwWZP41Voz9ddyE6WUB4+
SmzE/mccHnHOwB/CCErDTzo9S3waP24zyN5Oiafj52VXNssDPLG3c8TP7O0C
/th6mMW/+NrXM/z0tVdH/NLyyL9Zc3pH7h5YrSli66hJevD1vdxZIfYPdaNs
6A==
                 "]], PolygonBox[CompressedData["
1:eJwtkjkvhUEUhudOLD/BUhC1KEhoNDoSa4hSrIkC13KJJUiQCAW1ip5WJRSC
cCmI7V7bH5Bw8Qs8b84p3nzPfDNz5j3vTMXAeGcyhhCqUB66ZJDme4V64SzK
wT9oDm5Hp/ABqocHUSbYvy54FL3Dv+gJXkMlcCm6SIRQwDgFb6B9eBJ9w1k0
DG+hJrgRZVhfE23tLqqFZ9Af/IGe4X73eyjP8ID7k6ehaDVUqxpdwznUE+yM
HeZbou1Ne+8x2rw8yusN6xvgSrQeradfz2Ma/vT62vMF30bzpgxG4IlovanH
Kfgx2l5lmoJXUXGwjM7Zv8K4KNi/M8at7m8PHcPN0bLQP3l/Y013MI/b8pew
XuUpC9dF27uJyuG2aHenjDrgsmhz6rcQfvX+lPECfBftLSifMTjf70/9KstF
9y/PR4xfvD/VmIeTnodqqFbG71v9z8J9Xl9rlN1ytLeiPE6ol/b8dJ96a0v+
nnTmMfP3/v60Rlk/+HvVGXpb/4p7afQ=
                 "]], 
                PolygonBox[{{640, 639, 443, 23, 448}, {568, 171, 689, 546, 
                 547}, {644, 26, 447, 454, 455}, {455, 454, 645, 49, 457}, {
                 547, 546, 544, 128, 683}, {520, 128, 675, 496, 497}, {497, 
                 496, 498, 85, 665}, {449, 43, 450, 639, 640}}]}]}, 
             {RGBColor[
              0.5865156085815038, 0.5098297665941387, 0.47428475406071346`], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJwtkk0rhFEYhs97puQvWE7KylcjJVPKRolSaLIyYkFmIh8/wFeSxI4om8kK
i4mdUj6bxmASI0zW1vIHXE/nXtxd13nOed/znPe88fHZwRnvnEuQGHmOnGuG
mxQrpIpn4QL5wt/gOunGS6wdwW/xYfjIuAnfwAt4K76GF+VWeyEt+JY9p/XL
eA2Zxz28s+fxUXisus3n5DF4QFL4dxT2th4u4QS5wYvwg7kevALTjM+tB5jR
+8twW++psmZa5y3BKZ33ASbJKT4Al0gjfh2FPqyfOvjLOIPX4kPqwXppILt4
HB660MMZOVG9HuY11wYvfJjvhe2qJ+BVFPa1/bvUTyfc92Ff27+sc43BHd3R
E/U5/BN/hZNyqy3qvHbPR3rPH+t/9N327C70P6zg76rbfEHfs9+HM9hZOuC9
7nfVhzlb0wf/AU7ZUi8=
                 "]], PolygonBox[CompressedData["
1:eJwtkc0qRQEUhffZeREGRv5KSpQyUTIQSmak/JRiwAv4CUnMFOUNjJgphXvR
9Ve6qOvmBYiJF/Ct9h6szlpn7bP32vs0Ti+NLrqZNYEG8FmYjfPsB/sYq6AV
3gIu8XbR7fAOUEXvoNss3r2gq+ga/AMsw9ezXjVl/Fv0KfwMTMI3PHqp5gZ/
LftpZgn9BxYsMh3hbXlkkf+IV0FfqxbMwF89ZtfBCnwK3FnM1OyrIr7Xfpvo
YXBi0WMMfp/fa4dZ+Ej2V00f/MJjlt7Jq+e9lPEQ/YYeyPtU4E9FzNJMZe/J
eQegGf6N/wV+wC948MiuDPPwIY9bHYMuj0y13HcC3unhab9z+GDeVzuX4dv5
/3TTZ/XPPMq8h9ftkUWZej3+qbJrh/ciblrKe8zB/wF22Uxg
                 "]], 
                PolygonBox[{{494, 493, 514, 114, 674}, {545, 150, 683, 523, 
                 524}, {718, 717, 620, 219, 618}, {524, 523, 520, 107, 676}, {
                 541, 540, 562, 157, 688}, {606, 199, 619, 717, 718}, {537, 
                 114, 682, 540, 541}, {663, 70, 472, 490, 491}}]}]}, 
             {RGBColor[
              0.7741218520141053, 0.5757616732317942, 0.36399865568499884`], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJwtkD8LgWEUxR+PTbJTlJJsdqPyBQxS/gwGg4HPYLJYLN5dFpt8ASkZhBSZ
jDbyFfjdnjOcfqfbec6975vvjepD75zLoTi6xZyrwSnDFZrgM7CF9vgG3KED
vgNLKMIXYFb5NPzS08a/4Uf+Bx/qtz13+RdM8WaMT8CNOq07qXneh5zl5/iF
D522Z629tn+pvL1r6uY+vOjmrg832dvI3qEq/sysqL0V61bevnWmzJXMQHPr
66v/6MN/Mb+Fp1jIW/dT3joyurMM/5dmMLg=
                 "]], 
                PolygonBox[{{699, 698, 585, 586}, {586, 585, 708, 709}, {667, 
                 666, 477, 478}, {463, 462, 650, 651}, {702, 701, 593, 594}, {
                 478, 477, 655, 656}, {651, 650, 465, 466}, {548, 151, 129, 
                 526}, {545, 129, 151, 550}, {594, 593, 574, 575}, {500, 499, 
                 666, 667}, {649, 648, 462, 463}, {564, 563, 698, 699}, {597, 
                 596, 701, 702}, {716, 715, 616, 617}}], 
                PolygonBox[{{617, 616, 714, 196, 603}, {656, 655, 461, 66, 
                 476}, {709, 708, 606, 198, 604}, {511, 92, 674, 515, 516}, {
                 488, 487, 663, 92, 492}, {575, 574, 570, 151, 690}, {605, 
                 198, 618, 715, 716}, {464, 66, 460, 648, 649}, {466, 465, 
                 652, 69, 468}, {516, 515, 537, 135, 681}, {703, 196, 600, 
                 596, 597}, {559, 135, 688, 563, 564}, {522, 129, 676, 499, 
                 500}, {662, 69, 470, 487, 488}}]}]}, 
             {RGBColor[
              0.9098607181224772, 0.6446517953061928, 0.32056822617967906`], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJwtkLFqQkEQRdenlR9grz+ghb0BI4KlEII8bdIJovgZkkYQbbS1sIghsQkE
1OZ1giKWIZpOwVKsBHOGd4vLudydnd2Z5Eur3PSccykURceIcz4cEHbRM/6X
LIZv4+/4Pcrje3ZReQLWUYBfwSFq4C/U/qFHfJ+sgKb4BzhWzZXznWq28Ek1
C+irp/V+RyN8Bn7LZ+EX+sAXYRm94edeeGY1aZhTbucr9azBs+a1uQP1KcGT
8hv81F3rMdG8to+t/vzqhfPYn2ewov5L+BMJd2i7tF3YvHH7l3Z7IKvqXXu/
44W73ZCvtWfL/gE7NDpt
                 "]], 
                PolygonBox[{{702, 173, 174, 597}, {560, 156, 177, 696}, {586, 
                 177, 156, 699}, {511, 113, 91, 492}, {478, 87, 108, 667}, {
                 502, 108, 87, 668}, {549, 548, 526, 527}, {659, 67, 68, 
                 481}, {553, 552, 548, 549}, {691, 174, 173, 572}, {651, 68, 
                 67, 463}, {508, 91, 113, 512}}], 
                PolygonBox[{{539, 538, 559, 156, 687}, {706, 705, 605, 197, 
                 601}, {704, 197, 603, 598, 599}, {661, 68, 468, 484, 485}, {
                 534, 113, 681, 538, 539}, {583, 177, 604, 705, 706}, {572, 
                 173, 690, 552, 553}, {485, 484, 662, 91, 489}, {658, 657, 
                 464, 67, 479}, {527, 526, 522, 108, 677}, {480, 87, 476, 657,
                  658}, {599, 598, 703, 174, 581}}]}]}, 
             {RGBColor[
              0.9398297665941386, 0.7195744164853467, 0.4134722764418298], 
              EdgeForm[None], 
              GraphicsGroupBox[{
                PolygonBox[{{528, 130, 525}, {670, 88, 483}, {501, 88, 670}, {
                 579, 175, 693}, {539, 134, 534}, {581, 175, 599}, {582, 175, 
                 579}, {479, 88, 658}, {506, 90, 673}, {485, 90, 661}, {677, 
                 130, 527}, {599, 175, 704}, {527, 130, 549}, {486, 90, 
                 506}, {658, 88, 480}, {489, 90, 485}, {684, 130, 528}, {680, 
                 134, 535}, {687, 134, 539}, {535, 134, 557}}], 
                PolygonBox[{{707, 706, 601, 602}, {509, 508, 512, 513}, {697, 
                 696, 583, 584}, {660, 659, 481, 482}, {503, 502, 668, 669}, {
                 692, 691, 572, 573}, {573, 572, 553, 554}, {584, 583, 706, 
                 707}, {561, 560, 696, 697}, {577, 576, 691, 692}}], 
                PolygonBox[{{554, 553, 549, 130, 684}, {525, 130, 677, 502, 
                 503}, {669, 668, 480, 88, 501}, {482, 481, 661, 90, 486}, {
                 602, 601, 704, 175, 582}, {693, 175, 581, 576, 577}, {557, 
                 134, 687, 560, 561}, {513, 512, 534, 134, 680}, {673, 90, 
                 489, 508, 509}, {483, 88, 479, 659, 660}}]}]}, 
             {RGBColor[
              0.9697988150658003, 0.7944970376645007, 0.5063763267039809], 
              EdgeForm[None], 
              GraphicsGroupBox[{
                PolygonBox[{{684, 152, 554}, {556, 152, 551}, {501, 109, 
                 669}, {504, 89, 672}, {554, 152, 573}, {503, 109, 525}, {686,
                  155, 558}, {669, 109, 503}, {602, 176, 707}, {660, 89, 
                 483}, {486, 89, 482}, {509, 112, 673}, {707, 176, 584}, {510,
                  112, 532}, {678, 109, 505}, {697, 155, 561}, {482, 89, 
                 660}, {513, 112, 509}, {573, 152, 692}, {582, 176, 602}, {
                 561, 155, 557}, {680, 112, 513}}], 
                PolygonBox[{{580, 579, 693, 694}, {694, 693, 577, 578}, {584, 
                 176, 155, 697}, {558, 155, 176, 695}}], 
                PolygonBox[{{578, 577, 692, 152, 556}, {507, 506, 673, 112, 
                 510}, {505, 109, 501, 670, 671}, {532, 112, 680, 535, 536}, {
                 695, 176, 582, 579, 580}, {529, 528, 525, 109, 678}, {672, 
                 89, 486, 506, 507}, {551, 152, 684, 528, 529}, {536, 535, 
                 557, 155, 686}, {671, 670, 483, 89, 504}}]}]}, 
             {RGBColor[
              0.9997678635374618, 0.8694196588436546, 0.5992803769661317], 
              EdgeForm[None], 
              GraphicsGroupBox[{
                PolygonBox[{{510, 111, 507}, {686, 133, 536}, {507, 111, 
                 672}, {536, 133, 532}, {695, 154, 558}, {529, 131, 551}, {
                 671, 110, 505}, {504, 110, 671}, {678, 131, 529}, {580, 154, 
                 695}, {578, 153, 694}, {556, 153, 578}}], 
                PolygonBox[{{530, 111, 133, 533}, {551, 131, 153, 556}, {558, 
                 154, 133, 686}, {555, 153, 131, 531}, {505, 110, 131, 678}, {
                 672, 111, 110, 504}, {685, 154, 153, 555}, {532, 133, 111, 
                 510}, {694, 153, 154, 580}, {533, 133, 154, 685}, {531, 131, 
                 110, 679}, {679, 110, 111, 530}}]}]}, 
             {RGBColor[1., 0.95, 0.75], EdgeForm[None], 
              GraphicsGroupBox[
               PolygonBox[{{530, 132, 679}, {679, 132, 531}, {555, 132, 
                685}, {531, 132, 555}, {533, 132, 530}, {685, 132, 
                533}}]]}}, {{}, 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{679, 531, 555, 685, 533, 530, 679}]},
               "0.002`"],
              Annotation[#, 0.002, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{671, 505, 678, 529, 551, 556, 578, 694, 580, 695, 
                 558, 686, 536, 532, 510, 507, 672, 504, 671}]},
               "0.00175`"],
              Annotation[#, 0.00175, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{660, 483, 670, 501, 669, 503, 525, 528, 684, 554, 
                 573, 692, 577, 693, 579, 582, 602, 707, 584, 697, 561, 557, 
                 535, 680, 513, 509, 673, 506, 486, 482, 660}]},
               "0.0015`"],
              Annotation[#, 0.0015, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{658, 480, 668, 502, 677, 527, 549, 553, 572, 691, 
                 576, 581, 599, 704, 601, 706, 583, 696, 560, 687, 539, 534, 
                 512, 508, 489, 485, 661, 481, 659, 479, 658}]},
               "0.00125`"],
              Annotation[#, 0.00125, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{649, 464, 657, 476, 656, 478, 667, 500, 522, 526, 
                 548, 552, 690, 575, 594, 702, 597, 703, 598, 603, 617, 716, 
                 605, 705, 604, 709, 586, 699, 564, 559, 538, 681, 516, 511, 
                 492, 488, 662, 484, 468, 466, 651, 463, 649}]},
               "0.001`"],
              Annotation[#, 0.001, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{647, 461, 655, 477, 666, 499, 676, 524, 545, 550, 
                 570, 574, 593, 701, 596, 600, 614, 714, 616, 715, 618, 718, 
                 606, 708, 585, 698, 563, 688, 541, 537, 515, 674, 494, 491, 
                 663, 487, 470, 467, 652, 465, 650, 462, 648, 460, 647}]},
               "0.00075`"],
              Annotation[#, 0.00075, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{640, 449, 646, 459, 654, 475, 665, 497, 520, 523, 
                 683, 547, 568, 571, 591, 595, 611, 713, 613, 615, 625, 723, 
                 627, 724, 628, 725, 620, 717, 619, 719, 608, 710, 607, 711, 
                 588, 587, 565, 562, 540, 682, 518, 514, 493, 490, 472, 469, 
                 457, 455, 644, 453, 643, 452, 642, 451, 641, 448, 640}]},
               "0.0005`"],
              Annotation[#, 0.0005, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{450, 639, 443, 635, 442, 636, 444, 637, 445, 638, 
                 446, 447, 454, 645, 456, 458, 471, 653, 473, 474, 664, 495, 
                 517, 519, 542, 543, 566, 567, 700, 589, 712, 609, 721, 621, 
                 720, 622, 726, 629, 731, 634, 730, 633, 729, 632, 728, 631, 
                 727, 630, 626, 624, 722, 623, 612, 610, 592, 590, 569, 689, 
                 546, 544, 521, 675, 496, 498}]},
               "0.00025`"],
              Annotation[#, 0.00025, "Tooltip"]& ], {}, {}}}],
          AspectRatio->1,
          DisplayFunction->Identity,
          Epilog->{
            Opacity[0], 
            EdgeForm[{
              Thickness[Large], 
              GrayLevel[0], 
              Dashing[{Small, Small}]}], 
            GeometricTransformationBox[
             TagBox[
              
              DiskBox[{181.1155564425518, 108.1073298589472}, {
               25.718785949268085`, 12.513811001041876`}], 
              "Ellipse"], {{{-0.8544673699179488, 
              0.5195050661403632}, {-0.5195050661403632, \
-0.8544673699179488}}, Center}], 
            Opacity[1], 
            RGBColor[1, 0, 0], 
            PointSize[0.03], {
             PointBox[{170, 100}]}, {
             InsetBox[
              FormBox[
               StyleBox["\"Posterior\"", 20, 
                GrayLevel[1], StripOnInput -> False], TraditionalForm], 
              Scaled[{0.95, 0.9}], {1, 0}]}},
          Frame->True,
          FrameLabel->{{
             FormBox["\"\[Beta]\"", TraditionalForm], None}, {
             FormBox["\"\[Alpha]\"", TraditionalForm], None}},
          FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
          GridLinesStyle->Directive[
            GrayLevel[0.5, 0.4]],
          ImageSize->350,
          Method->{"DefaultBoundaryStyle" -> Automatic},
          PlotRange->{All, All},
          PlotRangeClipping->True,
          PlotRangePadding->{Automatic, Automatic},
          Ticks->{Automatic, Automatic}], {560., -183.75}, 
         ImageScaled[{0.5, 0.5}], {350, 350.}]}, {}},
      ContentSelectable->True,
      ImageSize->{758.6666666666666, 379.5},
      PlotRangePadding->{6, 5}]}
   },
   AutoDelete->False,
   GridBoxDividers->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
   GridBoxSpacings->{"Columns" -> {{3}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"With", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"\[Mu]x", "=", "200"}], ",", 
     RowBox[{"\[Mu]y", "=", "120"}], ",", 
     RowBox[{"\[Sigma]x", "=", "20"}], ",", 
     RowBox[{"\[Sigma]y", "=", "15"}], ",", 
     RowBox[{"\[Sigma]xy", "=", "100"}], ",", 
     RowBox[{"xdat", "=", 
      RowBox[{"{", "230", "}"}]}], ",", 
     RowBox[{"ydat", "=", 
      RowBox[{"{", "100", "}"}]}]}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"fig3", "=", 
     RowBox[{"GraphicsRow", "[", 
      RowBox[{"{", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"plotcontour", "[", 
         RowBox[{
         "priorpdf1", ",", "prior1", ",", "\[Mu]x", ",", "\[Sigma]x", ",", 
          "\[Mu]y", ",", "\[Sigma]y", ",", "\[Sigma]xy", ",", 
          RowBox[{"{", "}"}], ",", 
          RowBox[{"{", "}"}], ",", 
          RowBox[{"Epilog", "->", 
           RowBox[{"label", "[", "\"\<Prior\>\"", "]"}]}]}], "]"}], ",", 
        "\[IndentingNewLine]", 
        RowBox[{"plotcontour", "[", 
         RowBox[{
         "posteriorpdf1", ",", "posterior1", ",", "\[Mu]x", ",", "\[Sigma]x", 
          ",", "\[Mu]y", ",", "\[Sigma]y", ",", "\[Sigma]xy", ",", "xdat", 
          ",", "ydat", ",", 
          RowBox[{"Epilog", "\[Rule]", "\[IndentingNewLine]", 
           RowBox[{"label", "[", "\"\<Posterior\>\"", "]"}]}]}], "]"}]}], 
       "\[IndentingNewLine]", "}"}], "]"}]}], ";", "\[IndentingNewLine]", 
    RowBox[{"fig4", "=", 
     RowBox[{"GraphicsRow", "[", 
      RowBox[{"{", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"plotcontour", "[", 
         RowBox[{
         "priorpdf2", ",", "prior2", ",", "\[Mu]x", ",", "\[Sigma]x", ",", 
          "\[Mu]y", ",", "\[Sigma]y", ",", "\[Sigma]xy", ",", 
          RowBox[{"{", "}"}], ",", 
          RowBox[{"{", "}"}], ",", 
          RowBox[{"Epilog", "->", 
           RowBox[{"label", "[", "\"\<Prior\>\"", "]"}]}]}], "]"}], ",", 
        "\[IndentingNewLine]", 
        RowBox[{"plotcontour", "[", 
         RowBox[{
         "posteriorkdepdf2", ",", "posterior2", ",", "\[Mu]x", ",", 
          "\[Sigma]x", ",", "\[Mu]y", ",", "\[Sigma]y", ",", "\[Sigma]xy", 
          ",", "xdat", ",", "ydat", ",", 
          RowBox[{"Epilog", "->", 
           RowBox[{"label", "[", "\"\<Posterior\>\"", "]"}]}]}], "]"}]}], 
       "\[IndentingNewLine]", "}"}], "]"}]}], ";"}]}], "\[IndentingNewLine]", 
  "]"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData["936.3535796617966`"], "Print"],

Cell[BoxData["318.1955786032844`"], "Print"],

Cell[BoxData["881.8152482582881`"], "Print"],

Cell[BoxData["253.6116063010102`"], "Print"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"label2", "[", "txt_", "]"}], ":=", 
   RowBox[{"Graphics", "[", 
    RowBox[{
     RowBox[{"Rotate", "[", 
      RowBox[{
       RowBox[{"Style", "[", 
        RowBox[{
         RowBox[{"Text", "[", "txt", "]"}], ",", "20"}], "]"}], ",", 
       RowBox[{"\[Pi]", "/", "2"}]}], "]"}], ",", 
     RowBox[{"ImageSize", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"18", ",", "300"}], "}"}]}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"exportme", "[", "\"\<bivar-anticorrelated-update\>\"", "]"}], "@", 
  
  RowBox[{"Grid", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
        RowBox[{"label2", "@", "\"\<Uncorrelated\>\""}], ",", "fig3"}], "}"}],
       ",", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"label2", "[", "\"\<Correlated\>\"", "]"}], ",", "fig4"}], 
       "}"}]}], "}"}], ",", 
    RowBox[{"Dividers", "\[Rule]", "All"}], ",", 
    RowBox[{"Spacings", "\[Rule]", "3"}]}], "]"}]}]}], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {
     GraphicsBox[GeometricTransformationBox[
       StyleBox[InsetBox["\<\"Uncorrelated\"\>", {0, 0}],
        StripOnInput->False,
        FontSize->20], {{{0, -1}, {1, 0}}, Center}],
      ImageSize->{18, 300}], 
     GraphicsBox[{{}, {InsetBox[
         GraphicsBox[GraphicsComplexBox[CompressedData["
1:eJxlmXlcjGvYx0u2sm9lOSHHGpUW5CCXEEpZOqrZZzqzzxQiW8lQVJbDIZSU
oShZCifJ+tg6VNYIIUMoheJYkqX3Oe/bfT/v5+Kf5/Od3zM03+pyPb/bLnju
bEUzMzMzBwszs/+u//dHDv97MQQ0XRGbKVCO2EyJcsRmKpQjNlOjHLGZBuWI
zbQoR2ymQzliMz3KEZuFoByxWSjiJn8Q2PQ6YuKT5oiJT5ojJj5pjpj4pDli
4pPmiIlPmiMmPmmOmPikOWLik+aIiU/KTf7MgpruR0x80hwx8UlzxMQnzRET
nzRHTHzSHDHxSXPExCfNEROfNEdMfNIcMfFJuckfg3wyyCeDfDLIJ4N8Msgn
g3wyyCeDfDLIJ4N8Msgng3wyyCeDfDLIJ4N8Msgng3wyyCeDfBp4TVfEdH6S
HDGdnyRHTOcnyRHT+UlyxHR+khwxnZ8kR0znJ8kR0/lJcsR0fpIcMZ2fhMm8
5De9jpjOT5IjpvOT5Ijp/CQ5Yjo/SY6Yzk+SI6bzk+SI6fwkOWI6P0mOmM5P
kiOm85MwmZeCpvsR0/lJcsR0fpIcMZ2fJEdM5yfJEdP5SXLEdH6SHDGdnyRH
TOcnyRHT+UlyxHR+EibzEvlkkE8G+WSQTwb5ZJBPBvlkkE8G+WSQTwb5ZJBP
BvlkkE8G+WSQTwb5ZJBPBvlkkE8G+TQIm66I6fwkOWI6P0mOmM5PkiOm85Pk
iOn8JDliOj9JjpjOT5IjpvOT5Ijp/CQ5Yjo/CZN5KWp6HTGdnyRHTOcnyRHT
+UlyxHR+khwxnZ8kR0znJ8kR0/lJcsR0fpIcMZ2fJEdM5ydhMi/FTfcjpvOT
5Ijp/CQ5Yjo/SY6Yzk+SI6bzk+SI6fwkOWI6P0mOmM5PkiOm85PkiOn8JEzm
JfLJIJ8M8skgnwzyySCfDPLJIJ8M8skgnwzyySCfDPLJIJ8M8skgnwzyySCf
DPLJIJ8M8mmQNF0R0/lJcsR0fpIcMZ2fJEdM5yfJEdP5SXLEdH6SHDGdnyRH
TOcnyRHT+UlyxHR+Em7y11fa9Dpi4pPmiIlPmiMmPmmOmPikOWLik+aIiU+a
IyY+aY6Y+KQ5YuKT5oiJT8rk5xH5NCCfBuTTgHwakE8D8mlAPg3IpwH5NCCf
BuTTgHwakE8D8mlAPg3IpwH5NCCfBuTTgHwakE8T8mlCPk3Ipwn5NCGfJuTT
hHyakE8T8mlCPk3Ipwn5NCGfJuTThHyakE8T8mlCPk3Ipwn5NCGfIGu6HzHd
l0iOmO5LJEdM9yWSI6b7EskR032J5IjpvkRyxHRfIjliui+RHDHdl0iOmO5L
hJv8GZFPI/JpRD6NyKcR+TQin0bk04h8GpFPI/JpRD6NyKcR+TQin0bk04h8
GpFPI/JpRD6NyKcR+TQLbrofMd0/SY6Y7p8kR0z3T5IjpvsnyRHT/ZPkiOn+
SXLEdP8kOWK6f5IcMd0/SY6Y7p+Em/xJyf2IiU+aIyY+aY6Y+KQ5YuKT5oiJ
T5ojJj5pjpj4pDli4pPmiIlPmiMmPimT/Z3cj5ju8yRHTPd5kiOm+zzJEdN9
nuSI6T5PcsR0nyc5YrrPkxwx3edJjpju8yRHTPd57ut/2/O68PyYQKjkddr1
SfHz+Y1N3LeFJ9h8k2xcgrIXPr9RQVLycm2bQ4FQ3WJw9ts/8fmHClS7fH7d
Mo87L3qR9fFKL1/uPKjm1QoP8XTuPOiAS1VumZ47Dzo27F/Vit3cedDdW3e8
+tYFQv6RtM4lXfH5hRL2LrHyiFwdBNs6pNnG38LnC0pY7zRpU44Vdz4wqln6
sz15QZBi4GU4vcbnCWpI7j/o1uud3HnB5+BzV5/u5M4LxjUzO6A/HgTesmsj
/kzE5wk6eDW+4v3MmUGQY1p81+ItPi9QwL22EfrXo3jQTRC7rmcA7utVMMYv
98XZiTwQHQrLbXMR9/cqEAQJp7Z+zZ1XmPItLux5yZ1XtO2ns2104cGuo9cW
Gspw366Hkwm/N7e+EwTSxBKfeyu4Pn11fXChVzPcfyth+ud/y1yKeTByS3S+
2AX33yoI+bjJ2r4/H2SO6jNfpT/33Qnzzb3PP+DOD1q5V+6PzuPOD+rmpa4J
z+PODxr6OBtd73PnB8fTrz4S/MIHy9yOYzcN+7nvrs3JOZyfxoPyof7+Zctx
/60Hd1vP1Ins5/MvzE3bUI37bgVk3k8+0ODFh+k/rns6X8D9tRJ++/y2+HQa
H5opUnQ97+H+WgWfYrKGf8/kg+Oyr0cDCnB/rYa7gYun7PzBh/hT9glDfuA+
Ww05FeEFI65z/f8Wj4hCu+tc/9/hpttQ7Tc+fNg+psJuNe6ztRCzvSjAbyMf
2gydmn+xFPfZOvg3J2WaYiIfnG5k3cutxP11CDxf9zTWchEf1Jd2jswZxfXT
bx5NDLTdwfXP8/c+adEuBffPShisaKV6v00A+/+x7fh8Lu6fVRCeNlhaFCGA
OVYDNkX7475ZC5OFqaF7QgXAtLy9e/2Yn/vizcJevzl6C+D45g02a0f93Bef
dz4+XTlBAAvtHnkkOHB98d+u6lyRluuHW1uF5NhH4z5YAV2GLu/aQSmEeTae
7TwjuP5Xk2qudgau742IPuGe2AL3vWrIcBwb03YCe//yvlbDhv/c72Y8ind4
BkLoELXu9jp/3Pdq4fZQo+Tb70IQF+bVvdjI9bserSe+aBfK9blZs3l/1Qfg
PjcE9ri72Q+bLoTB0dFTZsXjPlcOQYbVf7mdFsLA+3XysYu5vtaig9nznjqu
n317c0Vu3tCf+9igKtfkgbuE8Ozi/kzXKpyrYeBnb5eut4WQK3I8tO4J7m81
sKbfyFFzrwghJS4tfeQ+ro9NHaa3npOD+1gduLRP+lzfSQRxPk4J+1Zz/atU
vcfrjJrrW1+FBURZJnH9avq+laX1S7j+tGjWxFyvEK4vrc4b47nEketHxzz9
1qLNa44XTlziOa2S60cfNrr/9SCF6zstx6usvhzg+k3LkyuT5Ku4PvNFn+An
PCXXX2bl5217vQ33l3IY8WfgQadAMbjXdph7eg3uKxVw/IJKlpMrhnzXQS5f
/18/Kd+SkLFzys995MBB3UZ7zRVD6sOau8c7/dxH7jdf795ushhKoy452Afh
flID03nj7Nv6iqHsQl3KtSFcH3m10wj9gBjcR+qgndsqVdeOYqjdXuW2RcH1
j+nrSjRxM7m+8V1Mif2uaK5f/H7/UfvoVK4/DJrTPUWXxvWFXg4ula2Wcv3g
671Zb+YH435QDWW63ZMulXN96pDsR5PflnN9aWJ0dca3QjH0tbxdXWvP9X1z
MuPu2Thw/d60msxzewfgfi8ERrR41/lUiRiGj+jreV3O9Xn7H9++NOES19eN
nh790aYM93VK2JGe+OuXzRKokd/YfacQ93UqGNTMQqTO4frNPlX1W11/kYJ5
t5vnvrbH/ZwG0j6d/ppqK4U/Sw6/d1r0cx9Xuf512MGzXJ+Z09GuYfhLCYRP
nbwn6xbu5/Swb17endxaCbSMi/04+znXz/34tPF1lxFc3zYojHej4Svu05TA
LL+Se2KmFCq7ZiT9O/jnvizueYP1cV8pLDfbtPngDNyfqSFMmThc6s71OQJT
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
           "], {{
             {RGBColor[0.148, 0.33, 0.54], EdgeForm[None], 
              GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJxNl0lwVkUUhd/rPyizDAIGgaoIJGFGWZFJhq0GCAE2rkCSECldSRRCkp0y
hZABypIABhECiiPgUKCoJbhT2IlbSxzXlBrLc+p+f+Hi5Hb3333v7Tucfinb
+kLD8ynLsil5lhUkZwgaZl7r0Z9jmhxGviO8LRxFXhCOCx8I7wsnhI+ED4Uu
9g0IQ8LHwhVhm/Cy8JLwrLCb+QahWWgSWoQOYa/1yHarZGeK39qFPUKZnN0l
+arWt6KvTVgnbEf3IL7Yv5PCJfzrFc4JZ4WD+PeGcIS1t4Ru4U3htNDD2hnh
EGvFM77TZeEA81NCRSHi0ptifhnbA8TsvNAnDOPHPvxz/Pajw/N+9npfuTBJ
mCw0ECPHa6Owg/lR2XtXcpHsH0nhg325rnGX8vm75q+kiJvj91QKnfck+1LE
q1Lre4lpaeF+7ss1PpTCv3kaX5OcJZ2va+0rjR/T+KTGX2s8V+NTGn+r8XKN
T2t8Q+NlGg9pfCDFnedKT2Me+fUdmrW+UnJcIWL8CXWzh9z0kP9e5p3EtJ/z
ndRNM7XTjuzjzKfCWPnwWop66Safrr/DzHdRE87n/hR1vC+Fr/b5IPXYhb02
dBzEdj/2vhBmy9Zx7W+UrBOeFJYKjwilwjxhovBQFrHx2kxhjjBaGJNFjB8Q
HhQGU/z2mXTP59wk4UetX/NZydWSi4TFWeRhAjaahQ1Cg3BVOCucEyrd+8LU
LHI4njNlwjjmVfhqmwvY+zD3ME+YNx4VRuFrNXvLhV6hXdgr9CE7hAphMrav
5mHvS+dTsjOLei1Fdwnxq8R+LecriVcJtmcTp9HcrRebd6S3SfKXPHJgHQuF
Gny0riVwn+/0vfatl/zB9acL7nSMNR6TIm4zJNdyxvk8L/Rn4bvv2kS8Xfeu
/891dqowovG/wl8p5BrJX/M483ce+anGr5sp9I1o/VYKG2NT+FXFvm/yGH+X
R15riM1GZB2+rCf3a6gL+31RurZI3s4jFs7ntCz8nUk+vXc6cRnmzjfNNdSR
7exAusY3C6uyqMEtyDXk3PHwuZ3s8+/PCZuYO9+trDk2d50vaqUFO3+mWFuR
olZcMyccJ+Gi71GIfE6itsyTNUKtUJcH15gv/TbU5/FWbPzf7zuYN8IJ29hb
7X6Dg0cVIpf1Kc6br6qEaYXQ+aJzxJrPXc+jZ927tlNhjoWvG7BnLtqKve34
ZR1tKXzZlYILzYl+kxJ1WnyrZ5Cn+disgjeHOFNCTt1P5lb73JKit0rRtRK7
voPfn/1wYGsiNim+ESq5wxCcdwi+3cB9dhMz38Nv2D509cHF5sjb5NY5nkIf
uwfv8R49LfmH8I9rKEUOG7Cxghp4gr3l5OYnzX/W+uN+r4T3tLZYF7yj8S3r
T8EH5gX3cEkhzj2Toi+dU9/vLvU3Qg1VZPdryrLIu5bmxFpyaP8GeBP8Nhym
hnbzJnTwm9+h4rvkN2wP81H0nPNURf7X8VsTMXa8/T4V35w2aqeT2m1Fb3N+
/xuqhd+62WufbsBj5jPzpXmz+M7Mwo/p9L/fEvP9AvLkWlkKhyyix1dRg0s4
s5i+Xw2vLOS8a20Z5z03F9fR3x3wRD314174LQ++MAc73uY8891EYj8Xm2ux
V+Qj6zMXmqPMe6Xwp3m0yI/+7VYeZ81t9qOR3zbBQ63cbTNr1mUea2JtJ/t8
zy2sVbNvPTZaONPM/dqJo+3Vku/lxMVviP0cptZq0HeeGhqg/9yPrjt/y56g
zy7wu7+5h+k3n7lMP/vb1N+wPdSdv4sHOX8JHafgl27q9zR15vk5atd6r6Cv
+A18gNr096J5rCNF39Ryhwnkyt8XlfSZ+83x7crivS9+H7hH/X7PoS6L/28c
g3d8b/PBePSVcX6A+Plb/zh3O8td7fd/Uf9MPQ==
                 "]], 
                PolygonBox[CompressedData["
1:eJwtk0lszlEUxd+7/1oYFhoRNSatllLzzreQYIuISGzYVGJsWKmN4duhRSj9
TFXDxpAoVhK0iKl2tDvtVqSmvTF+J+dbnLxz7n3/9z/v3vvqW/dv2hcppTWg
BlxHzGVtBK9zSj3o2fA54AX6EnoCfCJ4ip5UpFRiXQl2krsIxifveUzsGroh
+cxX6CvoWclnPkf3ouuT97xEL+C8Xtar4By522Fva8EQsSPoVtaDoIG909C3
yPWDOvgJUCa3B5TlFdwl1w0GdRb4Bx8DP+B/s3Nl3Q89ht4BPwS+wM8Tu8d6
AZyBn9Q/sj3K67fsb/eCR+R+Z3/bBf7ATxOrZHvqgB8H7fBO0FTYs7wPgRH4
BjAl2+Mv+Ef4xmRPI/BnYBl8Jrgc7pF6VQJv4O+zub75AJ/BngH4HWl4MxhO
jo2GPcqravg23FP1Vj3ph2/TN9mexuF3MLsXS8ANcqPoNvgW0BeugWqh2Fdy
B3Qn1u3ywvfL0Z9VG/AdPq9wbSvVWi1E92XXXLVvQd/PjnXLS+HZ6AFn0YvR
D+EP1CN0VzinmHLyKK9Ldb/sGqgWmonp8JvhnGr6jvxPdC3rZLAuXGPVWjM7
QGxR4X/JUyV8J91NM3k4PJOaTfX4GPpoeBY3a2bhK8Kzpx6oF/PDvVdNPsHX
h//dBGo4a2uYl6pvrT181irNOHx3mDdXe9XIno7sGe1Erw7XurZ6N82cZk97
TqF3hd+uejSV3JPst643rLc8nN1bvUG9xf9SBIFR
                 "]]}]}, 
             {RGBColor[
              0.5419757642622056, 0.49417678616243643`, 0.5004679213282881], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJxNVklsllUU/d79JCZoZIEFBRXRitBqIgj+uLJ1XNDWxMRZC1pwoi0oVAUU
bG2hTtAqAi3GKQFNUOPOpFYBJxA1FLEODK5o1TK4NBUVz/GcP7g4uW+437vv
Tud9E+9dcFNjZFn2I5ADszEpT1lWC9kMOR+oB54KjZ+BbPFaA9AGLAAWAl8A
V+KMzyH3Q68X47MgnwBmY20sDLyB8bVY34n5YaAZ4w+wNgrjYYz/BDZgPgHy
Q6xNhbwBuB5YivVarI3BOX2Y91AH2GNJe0/7Xo3AOOhVQzbhu+N0EuNrIGsw
nAvUZfLjFuBW4B5gFlBlv2/23mOh8QrIYZ6F7yohW22H/hewVg1UATMz2eCc
8bjR8xLonch0j6W+wzzgYcxXASuBR4B2z3tgoxH7P2O8JHTHxyErfV/ejXFt
AhYDa6C7JNPZbaFzz0MMKqxLH1aF/Lwgl68cz/F5DelkPOodg1qfvQhYnylf
LcAnIXkM678m2R1Oyu0dwO2ZamMj0J2Uly5gAzAjU37Pd/xZT82OZat1Fzoe
xfpq816D91tss85xfCdUJ19h/f3QHfqT4neb71PnnBTzX+Pc/JS094ttdPuu
jBHjsxzn7UnS7YPsCPmxNhTrjkyxfwjzq7D+aCivy5wLyk7rbcfeOsi/k2p2
E7CZdRvy8xzYnEnbwIVJ500ByuhzKEbjofNX0pnHnVfqFfNMyRop8VkP4Lv9
SXfal9QThaS9ub4jY3k69EuxdleoJ5nrI+5R5p73PiVXr1aH7nRmUl2vDNXu
BOzfHbrzg5B7gS08G3IoKRa/Mc6hHJ+bKz/MUwPwXkgeSLrLGUn2KhwDctPu
pD77AfIg9LdhPB7yWXPW6lDdtbmGJmP+HXSmhXLb6r2hTOv9wEdJ9dgLORDi
lIshBzNxDecDwG7Pm9x7c9wftZ6/HfJnr23Tx2J/UzJGmW0ftu2tmXyYkqv3
nw/x4CHbbPd37MGLctlupy8hftyK+e+h82aw9kP1E7n6jP023f12heeLQv0/
GjpH7edUcxttDro35rlXutx3re7hFs8vzRXrF/HtC6G78Y4d/6v9T5P48VXs
H0zqTfbovlA8J0HuCtXYP0lvBrl8bCjHzPW7Ib7vcw74xpBbXw+9B4z/MuYt
FM9xod5a4777LImXX/P7VumaqnJMCuYt8td15gbq08b3SdxCjvnG/PVWiEsK
1jsUytdl5iHmZRqwI+lMvnv9zvmQ88Tx9Dj5htG3Y6E34mr70e8a5TesmxPW
G3SetiXZ2Rh6P0e5Z75NqkPW43aML8f4FfZB0lu6BePnQrVbivgdcI+wVwrm
CL6DXybF402sH7GNipBt1kqxTin/e7+TYn4qdL5OqrvN5ooK81SfcznGvpaY
RzpDfTLZ9UNeZA53+f6bQnpl5sT7QxxB3toR4kPyIr9hTGljtTlhUi475f7+
NNcb667eb+r8UOxKzb1nOwesqZdCfcgeHe23czHWXg71Rnku7mCPdYXeBvZJ
GdbXmXcuwbgnqSf5j/NkKM78T1lvzmI/HU3iQ77/jEGv/RmRy2/y68hcebrP
OoxXp3tjwDn5w/7Mgqxyb/P/hbxAfriTPOOY1kDuNFePhPw4qYa7zSV8K2jv
X+W1PK0=
                 "]], PolygonBox[CompressedData["
1:eJwtlVmMzlcYxv/nfMTWcDPW2k1G0Quqqq6UWi4Mk0jEGlvTUjqj1lJUZ9RO
bLGMtamlQXBrVyqWorSM1HpF7VxixPJ78pyLX77nPe/5n+U97/t+LUZP6F8S
sywrgSowFKNlyLLOUDOXZW1hPboc1uB7yO9M5n0NN9G3oBhdBgfw14ND6Etw
A90X6jCnEvsluibsQf8B/6Jf41uZec1H6G+i9y6EPPbOQavgMw3Bdw7WMncd
1ELXSv58GIPdER7hewfP0KVQjG8gzEDPhOHoydCcb5djlwXfcQW6Pdzl21fw
BP0pPEZXQBt0QfTdNOcuehVs5Nv50Jr1NusbfB3hBGNTsPvwOxIa4B+P3Q3d
DkboLNG6LhShW+V8timwBDs/Zz0VlmFvil77E8UwOOaKfSk8Do6pYnscGqL7
QR7jbaAqaz0JnqsYntDZo9fqAMfwFTCnNDgmik0fqB0cY71Fu5xzYQOsxVcD
dmZ+wzPo6rAjcw5cjr6T7pbBa/SX0VoxfY6uz3ojgt/kx+gYKVYam4U9Fj5P
++utuyln+PZ/eIreDT3RveAqc4ZF54JyrgrzW2P/g++I8hX9LDheytmD2Huh
EN0X/sO3H3swegjcxu4QvZfWuBedAxUpf28rdnA1c84p9xZGv5Xu0IL9l2os
5ZvedhH2+OAYL0Z/yFhJcI4qVxtjTwgeK8OuBsszx1Sx3RN9195wjTnfRr9t
VxinvVVzwTGry1rTon0D4Ad0E8a+D95jLnYz7EnoiTBP50n5oxq9gn4bXGuK
2Uns+9hfoWfAA/SrYK0zVqJ/Ys6oVL8NWbtpzmtrz1+ia06x0J7zsc8H30U5
uD36TYpTP3qKb2eqp05wEfskfIZuDkdTjBVr7bmAuVuVL/g6w5+MHYZmmddQ
bepMOptiNBv7g9SPVA/qLd2je4dqphK9K+XDIPUrxrZEr60z6Czl0WfRHodS
D1AvWKC+hu94cG3pzbZhf5SzTzmxWvkfnZuqIdXSleC9FIN92G+Cz6YznsX+
OOfaU89Zh30juBcXKUdTz9T91HMm478THEvdQbndKLo3KGdvqVZTP1F8LjD3
7xRf1cQl9O/RsdeYfL+leuuheg++k+6msXPY06N7rXrcd9E1pdpSzlxHXw4+
axc4HfyfoP8G1XQh+mzw2jqvYv9r9Fy96Sl8FcG1qf1U+9tT/9Id/sI3JzrX
VWM/o7+I7uXqYS/Q7wGoytV9
                 "]]}]}, 
             {RGBColor[
              0.8405214368216731, 0.5990969905763068, 0.32496503394508675`], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJw1VEtsjGEU/b/7Rwgdj4RW0qJNREJGWIwukXboTLvwWJlqx7TBhhivZOoR
ieeu1vZeCRqJV0i6aWNDUYmiJOqZEintyhQJzsm5Fif3fPe/3/3u86/rLG7e
Y1EUHQNiIAtsA/LAA3y4BlkBeQ/yPHABOOuS50F8uws5D/KpST8N8kuIoi7w
z5Az3A/99QPnwP8E2dF+qskX36CvZzj3QVa7fAm8AL7hzknaQf/GpFtqOlP/
Hd87I71bAn4FxfrTYyHvjhRLfyTfr/zOMORDIMPc6B+8CH6d74C3gV812dG+
B/wJeAv4ZfAh8K3gV8CPA1twrkZBv4KXoV8D+Ri6ZvBL4I+Can0R/AdQwW+Q
40AAbzTFyFh7Ir3TARQi+Sh4nzLeq3ZgyGSbYGxeS9aU7yeC3jjksTHG1R4b
YxzwvkSm/Ol3AHZjXnv2oAP65dAVTHWnPgU5avq+DHI7kGJvkfsnj2MJ5KDX
ijVjflVAJbDJxDdC1kLWA6uA1z5zlf5mI9AQNGfMa7Hf47ck5wLnVsgFsQaZ
vnKmOBjPDvCPBD6vgDwB5KCviTUTJZ+b9ew1exnUS/b0Ofg617V6LLzLOv42
5bHBNCucmRGc025Luyag3f2OeF9r2AfPmfGOBsVQhrwP/SnwCfDTpnuLYHPG
5KcWfDIo7im0NcW20HNt5mwF9aTPZz3vs5L1ve32fZgbq+Y74eNDkN0t8PdB
M3UTfH4snwfB+bNgbgn2N2gO77CuQfN4G3zM67wS8rAplirY94Lvhf4dzkdN
Puk76bPAfo4H2fR6rqxdBnjrO3jDc2U/2KvpuF/H3rD/pjmPoTtgyov55bxn
ae9Zg59LvlPc590mfZfPUdrfaPN3mtwv/beYesD4jph6z/jznlPKZ5jvs7+M
b78pjznug3s3Cewz+Z4N/YRp3+pNtcz6rv8NmgfOxf/95y4VTTHOxN2yyd9a
3jXVdBfrbYp/Vqz8kr4z/wAtC7Cv
                 "]], PolygonBox[CompressedData["

1:eJwtlDdM1lEUxd97nyUWrAkM2EjUwWh0EEY1ggq6WBaatKiLBSyJWCZBN53d
bYOS2GOZxA0UTESIJmBB0cQCk6Am6u/k/IeT75z73v+++8697ytqat55KIUQ
doFJYANigt9h8A1eA4piCDNByoVQh86HrwT18DxiZfBScBA9DV0MXwv2oOeh
K+Dl4Aj6HqgndwP4SGwfuiT6jOnsvaUzWasFb5UH3a9aQDH8DtgNrwMfWC9J
XhsAI/BZ5NgUXZMuVgpidM1/4NtBQXSsDP4YNPNtCxjNYlpTzjH4NbANvhU8
Jz6b/Jujz2jWmjyI9mwcfjV5bwV4RnwO+7dEf9PC2t3k2uXBMLEG9KromnbA
7yd70wg+ZZ7Le51RzdqV5NzloIvYU3QbvB38Q1ehl0T3QL1Yk9zLHvmtu+Xs
tfZUom8ney1P3xObm3OvVPNh1qaCy6xdAL+JrUj2uhMMwRck8w7QB18KHmTn
LYNPBufhl8CU5BnRrOjOjfAbWT9VQz+xDnRTdv8B9P7kWdsIDsCPyd/sfvOp
NR/9MLjGF8kzot6ph6PwcX6PB9cwAe+O9k5n6uz12hPs8c/knMqtmTyKLgRP
gmdwEH4zeVY0M4PsCeiLwT1QL75m70c518FfRc+zvtG3upPuppnqhZ/S/bP3
kc/ZecleKme37ppcm3qm3l3P+qWcfXqX8jC4xpfwReypIV4LzqJ/RNemfJ3o
1mQvK8EJ+OpsPlSzai/Mea0KnEEvRFdH52xXv3NeU6wtuWbVrjd+Er03+e1L
6+3/ip6dVvAF/ih5VlXTd/TinGuVB+dY+xtdqzzoQo9F75ffequaIc2SZqw3
eY/2yoMZyTPXk/1/DSe/IfmtGRiBD0XnUk7VUpD9P2mmTqPfRfdK/uq/6HN0
7ZrJ1/DlWX7N3Bv4fyFIoCc=
                 "]]}]}, 
             {RGBColor[
              0.9381896340864442, 0.7154740852161106, 0.408387865667977], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJxFk7tOVlEQhfeeoyRCQNQGiGAM0FjwqyRqozYWSuUFVDpvlIii8gbQ6AtA
Bw8AUVQKEyUxsRFjYww2IBdJjEFBzS8FCt/KTGKxstaeM/sya+YcvNF38bal
lDpBAbpYNOaU/sIVYIzYTvgtGEdXw6/BMDrB7yNHuVPwaPK1vk8k37PDPL4P
XuHsAfQX+AXrQfRaxB6Bh2Aju/4DfzQ/pwYuWNeDOrDO+jvxE+a5Y3H3Eut3
cCv8G1SSew6eA7PED5mfUQJtUafqvRz36N0jYF51wk1wJ2gg51Lw4djfGne1
RO3SM+Ax67vwZ3L2Ymo73EPsDDD0efi6+f298BswRP7P7Ll6TxMoEy8TP61a
WN9HT6Nz5Guf/HqQ3L91cvrhl8R/oe+hX5l7JK+Ow7t4zwG+dcf9deFpY9x9
FHwyr6MZXgQL6LbwfzX5WaXYJz/K2d9RyMvwUX07pf3ob/AF87uuBcsHnTca
PVcPZ+Ps1fBRexeCZ8Lfq+yvYl8ufIZU93P735tNeW9exx5yVszPOwbfBEeI
VxTuu+qvRm9l77vm+mzMjGZHP4bqrCHninlP/sH95l6pt33m87AbvZy9F8+I
3TL3WX7fiXtrC39LEfWvxTxoLhajX5PyO/r4BD2ffZY0Ux9iJvfDP7L/O/qH
vsacnDT3Rf50oJdiZp6qn+Zzbeb9kKcleBt6R3xp
                 "]], 
                PolygonBox[CompressedData["
1:eJwtk0tvzVEUxc/Z/1LRKIIEaSvCiKSlEkYYSeiIxnNG6VR76/ENdFJfgBkf
gMSrk3okdKRioklNVG+lCQla9NZA1G9ZZ7By1zpn3332Xnv/t/cN9F6OlNJh
0KRfRIPfGfAFvgbcg78E7+BHQJVT+oZe0H2VUie6CyjRcRDwzeAE/BzYBl8N
ErGtlWP3gAHuesGW7JzKfbC834JehHeBOvoNmIXvB1+T35iH7wATpd46/Afn
w/AaeBp+U28r31n0C3CV42tgkbNW9H34bTCh2sP8BhjX/8GtZA9eh890pzcy
/Dm4kpzzF/k6wl4pfhK+M1z7KNgEPw3aiesGzZVrUC0joAF/xv1Qcs6f6FXE
dGR7eCmcQ7nugrfwR6UfxdeJ2Vju5cl7zSqc+47mCz8Qnt0U2A3vDHsnzz/D
d4Xv5PEcvCfsne4b4ZpV+15wEX0+PGvtwAX4fLY/8vAVekW41pvgd/ZO/Z8V
OARfWTmX9qEPvVz2RT2fgf8Nc3l2KrwTLWWfjsL/gK3ZO6Rd2hDuVR7Ii7Hw
rFTTd2LaynzU4wd4P9hX3pPX60o96rEW9miq7P80fG3lWhUziF5f/FCOIfTD
sg+a4Uy2B/JCO7SMPhauXT2q18fh+WuGs8UD5VdPJ+FPwPWyr584+5i92+pJ
vU2W71M73A5/UPZHMdPELmV7rxxz2d9ErdS3gP4H0Qd8qQ==
                 "]]}]}, 
             {RGBColor[
              0.9858806360927489, 0.8347015902318723, 0.5562299718875217], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJwtU7syQ1EUvWdHhAaDzjOjzNAar9KgNR599HyG8Ask1ycwk+iCQprE6Myg
SWiMKuShMmLtWatYs+45+5x91l5733T2aPvQoijaBBLAT4iiU3AXXHcGOsAV
cAacA6/AF9AEPnC5DV4F9wEXngf87WvkWAcPA3nsP4qPgRywj/UgzvTABe2d
6B1/7xIYRawITht1ef7Y9Rq1dcHLRj1L4n7kTAbq8vwDgXuTwESgbo+7vl1j
/A+8Lc2/4KzxbD9MKeF8DajKF9dxZ9yPpelevrwAT8b1NHgcuMb3GHhK+x4P
xjor4E5g3bfuW6A/Zfc10JMbfB8Y9acS9KOgt2eMXj1Lb1K1utZGxB66Ptfg
eutGjRnwmzE+b8zl8aK8aarHsXriNU8qdwrYMHLLqMlje/j+NL674O+odvfg
VR5V1DPv3ZqfNe7NGuvOa8ZyqtHXK5oxn7Ud1en9yaiWRaPGWHd6mqsto7/u
sxln0fvrfX4wzteQ0Tv3cMRY94t6WZamVmC+tv6FhmahJpTkb1X++frdGJtT
rXXd+wdbqnrG
                 "]], PolygonBox[CompressedData["
1:eJwtkTkzRFEQRvv1WBNraB0SAVLGklpSa07Oz7D8BUv5CVQpIQIEtpCaSQYR
EbMQGeV81S84Nafv9Ovb3Te7trmw4WY2BHVwQ7DP7x4kuHv4Mdzj4/Cp3MSs
hM9AA/7F2QT+B03EzbCKT0HF4qyCX8Iu8Q5UOct5fFuAYXwEivoP3lU7Y9ZF
XjesE7d49HINT3gnnOFH6gkvk7dlMYNmUY5yr6AHv/C4exsq5JaJG5OYQbNk
PGqpxx/OHokP8ENo9+ixkN7/4jGTZlONWXzeY3b1X8XPPe5STyXOVzxmUX4N
n4Zv1YIPvA1O0v4f8EWoT2IHSx47UW3tdBL/9XgL5Si312PWPBTxMQ/Xm+nt
BuDWYsevHnfoLs3Y6tGz6qunOXwQ7ix2nMezcGpRQ7Vq6f60g2X8OX0fzdDn
sTPtTt904P3peyhHuaMes+uON/wfg+dXow==
                 "]]}]}, 
             {RGBColor[1., 0.95, 0.75], EdgeForm[None], 
              GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJxNj7sNwkAQRE9HAQZiJDAxFMAnNjklUAD0Bj3YvgCnBBgLMqc2DfBWNwiC
0fPsenf20sNpf/TOuQkaoDHmAkewhj3qUInOLvYK9HCx/+S/O1zAXLWvN660
J9dcp77V1j76zMecWnvn+ABT2KKG76XuCrrlrZmtj3eVf3cV8o0Y9B6br+BV
M0O40X7LeSnX8jPd1sOdsizzpnfO/C/DMqeqWz/Rfsv5AHjJOnQ=
                 "]], 
                PolygonBox[{{718, 179, 178, 527}, {743, 221, 222, 571}, {544, 
                 198, 219, 736}, {728, 199, 198, 543}, {754, 241, 242, 583}, {
                 528, 178, 199, 728}, {557, 222, 201, 737}, {569, 219, 241, 
                 570}, {572, 242, 221, 743}, {545, 201, 179, 530}}]}]}}, {{}, 
             
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{717, 528, 728, 543, 727, 544, 736, 556, 569, 570, 
                 582, 754, 583, 755, 572, 743, 571, 744, 557, 737, 546, 545, 
                 530, 529, 718, 527, 717}]},
               "0.0005`"],
              Annotation[#, 0.0005, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{701, 498, 710, 513, 709, 514, 716, 526, 726, 541, 
                 725, 542, 735, 555, 567, 568, 753, 581, 594, 764, 595, 596, 
                 610, 774, 611, 775, 598, 765, 597, 766, 599, 767, 585, 756, 
                 584, 757, 573, 745, 558, 738, 547, 729, 532, 531, 516, 515, 
                 502, 501, 704, 500, 703, 499, 702, 497, 701}]},
               "0.0004`"],
              Annotation[#, 0.0004, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{689, 480, 700, 495, 699, 496, 708, 511, 707, 512, 
                 715, 525, 724, 540, 734, 554, 742, 566, 752, 580, 592, 593, 
                 608, 609, 621, 781, 622, 782, 623, 783, 624, 784, 625, 785, 
                 626, 786, 613, 776, 612, 777, 601, 768, 600, 769, 586, 758, 
                 575, 746, 574, 747, 559, 739, 549, 548, 533, 719, 518, 517, 
                 504, 503, 486, 485, 694, 484, 693, 483, 692, 482, 691, 481, 
                 690, 479, 689}]},
               "0.0003`"],
              Annotation[#, 0.0003, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[CompressedData["
1:eJwl0CtLw1EYwOGzLSjOpqjgNrUINoN2wWgQjBs4MFgmW9iCt+L1k3gBL2jd
os15Be+CJkGDlygqiM8fw4+Hl8N74JyeidJYMRZCyGstHsKRYYfX3OYlt3jF
fT5wj4+s8Y1VvvOAv6wzqUM160Kd0a76NKBBfWhYPxrVuPIqaErTmtFCtJ8I
YZEpLjHNZWa4wi6usptzbOMs2znPDlbYwjJbOckm5hhnlgmO8FNDelW/ntSr
++hunatRDfr25i+96Fl3utWusxue6VSb5hNu8JjrrMf+//0PuT00oQ==
                 "]]},
               "0.0002`"],
              Annotation[#, 0.0002, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[CompressedData["
1:eJwl0TczYFEYgOErFUJrhE7OBX4BNQo1jUYoditUQoddOefY0GgZrJVDJ3Ro
FVhbizOeO4p3nvlmzpl7zzlpdT+rf0QEQdChycgg2DbMcZ+z3OMMdznNv1zh
OZd5yiWecY1XXOU113nHTT5xg/+4z0+eMS7coxRdKjXco1yVqFT/Va43VSkm
Kghq2agmtahVHepUj36pX9nWDnBQo8o3j7GA4yzkBIs4zBwOhd/nCPPYywz+
Zib7mMVuprGL6WwPz8G28BxsZiIbGM96JrCG0azkiyr0qjI9q1j34b/oVslK
Umx43/pwd+961INudaNLXehEx1q09ogLPOQ8D/hHO5oyb0V8v/sXcPNGzg==

                 "]]},
               "0.0001`"],
              Annotation[#, 0.0001, "Tooltip"]& ], {}, {}}}],
          AspectRatio->1,
          DisplayFunction->Identity,
          Epilog->{
            Opacity[0], 
            EdgeForm[{
              Thickness[Large], 
              GrayLevel[0], 
              Dashing[{Small, Small}]}], 
            GeometricTransformationBox[
             TagBox[
              
              DiskBox[{200.05404320965357`, 120.11269218334611`}, {
               42.81544979977459, 32.02191668459134}], 
              "Ellipse"], {{{-0.9993988408981331, 
              0.03466924878718951}, {-0.03466924878718951, \
-0.9993988408981331}}, Center}], 
            Opacity[1], 
            RGBColor[1, 0, 0], 
            PointSize[0.03], {}, {
             InsetBox[
              FormBox[
               StyleBox["\"Prior\"", 20, 
                GrayLevel[1], StripOnInput -> False], TraditionalForm], 
              Scaled[{0.95, 0.9}], {1, 0}]}},
          Frame->True,
          FrameLabel->{{
             FormBox["\"\[Beta]\"", TraditionalForm], None}, {
             FormBox["\"\[Alpha]\"", TraditionalForm], None}},
          FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
          GridLinesStyle->Directive[
            GrayLevel[0.5, 0.4]],
          ImageSize->350,
          Method->{"DefaultBoundaryStyle" -> Automatic},
          PlotRange->{All, All},
          PlotRangeClipping->True,
          PlotRangePadding->{Automatic, Automatic},
          Ticks->{Automatic, Automatic}], {186.66666666666666, -183.75}, 
         ImageScaled[{0.5, 0.5}], {350, 350.}], InsetBox[
         GraphicsBox[GraphicsComplexBox[CompressedData["
1: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

           "], {{
             {RGBColor[0.148, 0.33, 0.54], EdgeForm[None], 
              GraphicsGroupBox[{PolygonBox[CompressedData["
1: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
4uxc9VTELWhFlmLMONd/1jMn58Kmp8gLmyA2kf/tylNetUldkltsVMeP235O
Ho9rN6vV18vOI8bvlmJDe7UjdPlSnvIz1iBGttbmqGEb6U+j1SX7w87IC8kH
X8xT/sf8FwI/tv28MjJugvaETqmnqVOpSakvqLMva1PUptu0tR22Hyild5vP
SukN40iWcm7eMo7aXu284u6FFncpdIu2XFmNL7UvNTBvM/All6fuoRahJmnr
e0ubUjpPeBT352bncYfurMb3oHyPyoP6hdrljHxZj9rlmOOO22beO7apw9+1
PayUfg8J+lHgPey2lN5o3lbeffKjvcdvR7OqeumMa5y1je6orU663gf2HVFe
+g7bf0I5zmVVb0mfeGaVynpQ3e9XluLtg5iyUB2he94hrs2r3i2gvKPh29zF
1OXFe8qXyk2dWdSX0KJevOg6yI3tXFJe5hPDsC3eRFjvhN/Ou7cLjjstjwvq
5ZLroe8P3Suxh/ujnvvBD7ifphhPJ5WSXaD34m1vt/a0VX0U73x7HfdxKfnA
LGMz74rFGw+0eIuCXmlcZs3iHQ6KTMW7ErpGbt6GeHtgH7wl0UY38KCN/uhn
DrGPs8En8Wn8ZGWWcjLqTHK0Z4zRrxgniBfF/bPHWLLT/kPGkX2OK2L6q8ai
/fYRo16373fYQqzzcCnFsTfsI25wn3Fv/DpwTYx5MMYcwUbi9yPx+zBnG7+X
xu/fYkfx+6FS1X0DL+6LA65dqYwHjYXExCKm7jL+UUcQh4saGso9TY1DTN2Q
V8VQ5u+QH2tM0Dfx0cWl9E7876BvBr0uvi8rpVqEmoQ6eWEp+cO/gs73LuZO
XlJK79WfBp2pnWAvRU2OfEV9Rb1FvkdNSA1HnUYtQk1CrUbNVtS95Kfke9TK
5JBFbQ0ldyzeyqnpyJvIFckz6/qtlTZKbUqNid+SQ92ojTbPq97podSfxZs7
fGs7j3F15AevGe6DPRQ1fD/HdVN2xlJz9lCWnrbhe4dt1ullG7nutM2dfZdt
6rYy94Ys3V2D2pp8u7f6Qk/FGwO0qPMGOr+dOiveBu52fktlhC814xPaTU/l
viGvekPhTuRuxkbxD3KaHbZX+w1/qqkuOVt8kLcD8h7eucl1+mdV/0dpZN/W
amOh+Cs5YqVrcD9zT/8iT/f0i7a5v1+yXeSpzKFGxmfwlY6u2S9L9eJm+1a6
zmb3Rn6AH1N7kXuRo1GDDbLdxDb95M5dbDf2G2/05Nld7TuVp/qCOoO1yZvI
74r/MTCOPL27bXJqdIS8jeRHu6/zRjuO2qKoI6FFXTJYWTu4177yKFPv5OI9
XO/tPOVL/M9ho/smDuGrxEHi6DzPm7Ndpt45h+JtgrhQvHeg17mOXaUdwY8Y
OcdzZVy5/RXOf1K+Mz2z5dof84i7xTsU/B7ynGg/pow7nfOUvIp3w+IdcZ12
ukF+7G2+39jbLGVn7f8BdrX7pg==
                 "]], PolygonBox[CompressedData["

1:eJwtkTkvhFEUhu89UWHGlqiNaPQkOi1KLaZQWRLD2Lda/AON0h+QaOxboZNM
UCqpFBKxTeN58yqefM+5Z+bes5QmK6NzkVLqhgZ4yymV+Q7DHoktaMc74Irc
PPEPXsTr+BDcER/CAP4FdfwXFvBO2MGrcIR/hnO6o4LncG4CDvBNaEt+85I3
tom78BLcEPcQ7yffqbs3oDX5Pxfkv4mb+DZCFV+DIrkWOOPsJPuuZlgJ96Te
euEaf+fsFX+BKXwX+vB+ePzvWb0XYBmfgQ9yz1DWbKA5u4ZF9Rr+rc6W8PVw
Lar5nLMx4lrym3r7Nvst9azea9m1DcJDds2qvQDHxKthV4+nxE/Zu1PNqn08
XJt2NIJPh3vTjrQrzVyz185TeGaanXqaDe9Uu9XM7/E/faJDdQ==
                 
                 "]]}]}, 
             {RGBColor[
              0.4188997334308202, 0.4509232290012467, 0.5728193260342782], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJwtkjkvhFEUhr+5/oKgNcbyC1CpJJaoVISYZBLLEMa+jxARJDoNjYpkejT2
sYtM7Es0FCMhYRLEGBQ8J/cUJ+9zt3PPfc9N9wXKW4zjOIVEEuEw6EAWUFlI
wB/oMjEBp6Cf6D3xQGy7HCcHDaM1xs43oifEIpxvbC7J6ULviHW4CJ0n/PAf
Z9PgSThV9wrLffWMH9EYGmFfFjwu+eFs2QOXEkdwNfpGnMFVxtYXd2y9tYyj
6Iuxb5DcHrRC90dRQ3jhEDqj/Mo9ETgE56ErjN1wN+zTO7zGvl98GIQv4AL4
GZ2V+uBbuEzrLDH2jJx9QqeIXHifPTsuy0Fj75C7Vplrhr/gd3STmIbdwupJ
P3wMZ8Jj4jHsgXvhDZ3vg9fgDLhH8qm3fvFe67xm/UD3jBjrl/hWZ6wv4kmM
9Qb1TfwOav27zG9pXwaYm9MeSi+vXDa/3BPWXkvPf/WPtaJLxBCcbOy/kf9T
bGxv5K5K9Eb9Ec/a9S8m0DZ9i7xpT3s0LH/J2D/wjQb0LXG0Sc9KjlOtNRvt
VJ9/0Evt4znapXVKvYfq7Sj8D6q4eFs=
                 "]], 
                PolygonBox[CompressedData["
1:eJwtkjsvhFEQhr/v8BMkaiy7iR8gGjWiEqVLsonCPbLENUJErFpDo1Lo0Yh1
axDZrFsUGgoSQrYgrg3Pm5nizffMmZkzl/NVpIdaB0MURbWoFJVjLPHNoBL4
JY6iNrgBXcNxMF8WbcM3nDXDXWgFuwzNwMtoH371/B60jv0XGytmC7sffcL3
KC1GD/AjGoaLwVhn3XBlsLs3UB6uRmvwJirAUygJ16g+tTqw7+BT1AIvKMf9
efzPsc2mHtVrMbZZNNMqsfMoEVnOGb66YLVz6BbOer0UusA/qx7hKnSMvRis
lmIK2O/Y3/AXGoDbg/WmHjvh32A+xYzCP74fnY0oF31EdpaBn4LtTvmatTHY
LnRnMzwXrBfNcEL9Xt+H7uiD37ye7tNbXPo+NM8RPOH7Un4uthlT/j9cwfVe
T29wDk/6vMrZwz/m9bWTHeykv5f+sUN43PermF38iWD/lmL0ttPB6ml/B/ib
fF+qqdr/bDZgbg==
                 "]], 
                PolygonBox[{{583, 189, 602, 742, 743}, {639, 638, 443, 34, 
                 453}, {752, 751, 617, 229, 615}, {472, 74, 469, 650, 651}, {
                 757, 756, 624, 248, 622}, {743, 742, 603, 209, 600}, {515, 
                 115, 512, 678, 679}, {614, 228, 623, 756, 757}, {679, 678, 
                 493, 95, 514}, {454, 54, 451, 638, 639}, {651, 650, 452, 54, 
                 471}, {601, 209, 616, 751, 752}}]}]}, 
             {RGBColor[
              0.619832889059059, 0.5215387150047811, 0.4546988767192752], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJwtkj0vhEEUhWcGf0Cj1uAP2CWhJbKiQHwUEtZn4aPR05FIRCc0CpJN1LKV
RoFkFXajwGpY2bDIZkOUwnPNKU7O807mvffcmWlOrwwuB+dcAtWhDB+rxiHK
uAnPihvwE7QA/3rnfnzkRtaO0SRcY+0GdcMFfI31JHwBb8Ep+A6egHPwKx5U
3/rfo1O4Bz9CQ/AH+y3oM/yND6Nr+BFfQiX4Cx9FebiE76AOOMe/edQFl/F9
ZSjCDz7usb31ym9zWD/rW8FflKcX77T54T58QPlT+J7+rbJ/EX6CP/EiysBJ
vKZs4yHmtvwjNq+P57MN96umnU0BHcBtIc5ss8/hadW3Poe6C7uHedX/76Oc
lndWvar4uXrZnYxpLpuvrPPZhduV+Qo/U4ZWq6E9GyFmsvUWfEbZ3vFbH8/W
7vlSZ7sOTylzJcQ3YW9jM8Qe1iuBT+se3/A/WEpgrQ==
                 "]], 
                PolygonBox[CompressedData["
1:eJwtkTtOglEQhe8/YQnamgCFO1ATpTYEKmUBqIU26haUV6xoCTQWmrgBShNt
TEQFNDY+KrEgYmIMLEC/k7nFl//MPXNnzoX09uHGgYUQFiAFLYo1vjkYJyF8
U3+iR7CDrkEV7vEeYIR+xBtCCV2BY7jF60Wkq/HuzHyWZmrxJNYfsIX+o3cP
vQnn1A2oQ5/zAfxCGa8AHc5/zHcrwy66CcvoFXind2o+Wzv2zTMrez3OXodL
vAt4M39zLu6foOc5m4MruIavxD31PKOXzO9qxmvsUW8GsrAIp3hdZUS/JJ5d
b2hTF+Au+qvoI/PsesNN4jM0qw8DyJv36k7R/I5q7Xgyz6x8+g3PqE/Ms+o/
HeL9A3sMSZY=
                 "]], PolygonBox[CompressedData["
1:eJwtj70OAVEQhe9ubC9CUGq8gewWao1EofBT2WwQlW28AI2GZ1CiF5VGQyJZ
thM6YRMSPINv4hZfzpkz92cm5/nVvqmUioMFWYoMpGFAvUY/8IYu3Mna6BQm
sDOUsskuaI36hO/o83LvBTcyD22BC5Z+20QXsIQj9wMY44v0QnyEf0ATQrI6
eiUv48/G/3+Z44B3yPbokHok70EANszpFdA8zPBbvaPsWoINWUP/Fel5ZK4v
77n0YvgE9PArNAkpvYvs9JQZ6FXQH2bpLNo=
                 "]]}]}, 
             {RGBColor[
              0.8207660446872976, 0.5921542010083155, 0.3365784274042723], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJwtkcsrxFEYhs8clz+ALNhNytKCKDNZsiEyiq3bmpWljWShbAgbO6WshYXS
ZOUyfrHSuExJckv+ABvP23kXb88z35zL951ffmahNB9DCJ2kjlRzIQzDdYpV
so/3wkvqffgyPkWu8U9YJEf4ENwjJfwrl/brnAe8Qgr4CrUTsog3wllyg3/D
MlnCW+AcyfAf+EZO8UH44nO28GlS0V0xrdP6Cfjr/ndj6kP9vMNWfq/hHfDA
PTTAC8/YHdPd6qEJ9nuuAqz3eu079jk6b8TvoPc4Ixt4Ht55r97m0Gc2w3vP
MgDPfU4b7HIP6mXcs9TgmN/nKaZ5NNczs9T8LTapjfodHmOaU/Pu4D3uJ4sp
8nb44TV/MCNFfJX6rV21V/s29Un3rO+gb697r/j/H1ZKTg0=
                 "]], 
                PolygonBox[CompressedData["
1:eJwtkKtuQkEQQJcJ/QIMwTV8QhUlWEzTEpryATw0KCSOICooj9QUj2g1IEgI
lvCwhEAIF1TBwB9wJrPiJGfnsTO7j4XKe1mcc1EIwy7k3BZaBNuwgyXxBWTw
CNTwDkzwP/iFKz03eMCr5D5hiL/AAJ/DGx4X69U7pmI92vuD96AOz+QSMCO+
57xytkMW//b5JJzIv4rdrTNS+FZsV41priFWqz0L6tOcx3gfNnhXbJbmA/I5
zh9wgABiYm/RN43wExx9jdb++/k6M49f/H/pziX87PfRWBF/EputO6zxL2iK
/bn+/R0YqzvQ
                 "]], 
                PolygonBox[{{657, 656, 458, 57, 478}, {486, 485, 663, 82, 
                 488}, {507, 82, 675, 509, 510}, {581, 187, 599, 738, 739}, {
                 716, 715, 566, 166, 562}, {570, 181, 721, 552, 553}, {518, 
                 117, 516, 682, 683}, {545, 146, 565, 715, 716}, {553, 552, 
                 550, 138, 706}, {662, 59, 464, 485, 486}, {510, 509, 530, 
                 125, 691}, {737, 736, 598, 206, 595}, {477, 76, 473, 654, 
                 655}, {667, 666, 474, 76, 495}}]}]}, 
             {RGBColor[
              0.9194407668235681, 0.6686019170589202, 0.3502663771530611], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJwtkC1rglEUgK9XEONgbQbRZl0UZYgzCn7gD5jFps20f2AQgxZBxDqTgjoZ
C1ptYpqCwyE2mQaDID6He8Lhec59z3nvuSdUrOTK1hgTJrzEN8k7fIQJ4hNf
wpvHmBJ+hTvyKZ6CF/IM3sPXeBqv469as4IfRBX3wT+tl740+Qj/gSft7eAz
ootH4ER7/fBF62PW1Un9lr6hdbPJjM94A1/AL/UgHOi7HuCRuje8bd0dclcU
zokaHrCuX3pDcKczN/E9nsVb1r1TZthwdtBz+S7/lf//43GdWd7a1/Ozx+1U
dpuEY733CRZ0b7LjvNb8wjvRTTu1
                 "]], PolygonBox[CompressedData["

1:eJwtkKtuAlEQQO9OmqaSBAcKjSyKgOALypL0A4rBtQ7FH1TxCHqDBQUJ0IYg
ioEPIK0oEKipRTZFcCYz4mTP3Nl53Jurv9SeJYSQgRsYEFT5xvAXhVAgvodP
+BI701wDLviOs2940Do4whu5d3jED/yzhy7e0xj2EEMNNrD2GTorDS3vP8G3
Yr20ZwXvQFusp/bO4K/kEvjAU17fhgV+B038CUb4rcdaM8P/I5uld/qNbEfd
9Yif4BxZrdYMOe+L/atv9EMu6/M1P8dzYrN1h6XYGzU8HvudY38zfbui2O5T
KOMlMdezvBiJ77vCrzuPPCY=
                 "]], 
                PolygonBox[{{728, 727, 581, 186, 580}, {480, 77, 476, 657, 
                 658}, {592, 591, 731, 182, 575}, {482, 481, 661, 80, 484}, {
                 669, 668, 477, 77, 498}, {499, 97, 495, 668, 669}, {579, 185,
                  595, 734, 735}, {543, 145, 562, 712, 713}}]}]}, 
             {RGBColor[
              0.9515387150069928, 0.748846787517482, 0.4497700165216777], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJwtj70OAUEUhWdWofMAOi2RkCglJNTIPsIWSt5FtBIr0So09BIPoNLIingC
fwnZwnczpzg530zunHumkkzjSeScK6MCqnNI8Sp+884N4TmcwQN4Bm/RGM59
ONv9Fb5r3t5tuE/gN7wQP+EY3sMZfkZruIV/fchcwSO0gy94XzM2+/Ahx/J+
mi/BH+1N4Zd6LuGa/tLGj8pp4h3l256u+pyi0Mm4hxfV2f5xUI7lNZRjebk6
WPc/pbYvGA==
                 "]], 
                PolygonBox[{{574, 183, 161, 557}, {726, 725, 577, 578}, {521, 
                 520, 684, 685}, {701, 700, 543, 544}, {529, 528, 700, 701}, {
                 697, 696, 520, 521}, {672, 78, 79, 502}, {733, 183, 184, 
                 594}, {572, 161, 183, 575}, {544, 543, 713, 714}, {540, 539, 
                 696, 697}, {722, 184, 183, 574}, {660, 79, 78, 479}, {578, 
                 577, 723, 724}}], 
                PolygonBox[{{554, 161, 707, 539, 540}, {501, 98, 498, 670, 
                 671}, {504, 503, 674, 102, 506}, {526, 102, 690, 528, 529}, {
                 671, 670, 480, 78, 500}, {724, 723, 579, 184, 576}, {561, 
                 165, 580, 725, 726}, {685, 684, 499, 98, 519}, {673, 79, 484,
                  503, 504}, {714, 713, 564, 165, 560}}]}]}, 
             {RGBColor[
              0.9836366631904175, 0.8290916579760439, 0.5492736558902943], 
              EdgeForm[None], 
              GraphicsGroupBox[{
                PolygonBox[{{557, 162, 574}, {559, 164, 709}, {558, 163, 
                 708}, {504, 101, 673}, {701, 123, 529}, {502, 100, 672}, {
                 540, 140, 554}, {714, 144, 544}, {506, 101, 504}, {524, 100, 
                 689}, {522, 99, 688}, {699, 144, 542}, {671, 99, 501}, {698, 
                 119, 523}, {500, 99, 671}, {560, 144, 714}, {685, 119, 
                 521}, {529, 123, 526}, {578, 164, 726}, {519, 119, 685}, {
                 726, 164, 561}, {574, 162, 722}, {576, 163, 724}, {697, 140, 
                 540}}], 
                PolygonBox[{{724, 163, 164, 578}, {527, 123, 144, 699}, {709, 
                 164, 163, 558}, {722, 162, 163, 576}, {525, 101, 123, 527}, {
                 526, 123, 101, 506}, {688, 99, 100, 524}, {521, 119, 140, 
                 697}, {689, 100, 101, 525}, {708, 163, 162, 556}, {673, 101, 
                 100, 502}, {544, 144, 123, 701}, {541, 140, 119, 698}, {672, 
                 100, 99, 500}, {554, 140, 162, 557}, {556, 162, 140, 541}}], 
                PolygonBox[{{711, 710, 561, 164, 559}, {687, 686, 501, 99, 
                 522}, {523, 119, 519, 686, 687}, {542, 144, 560, 710, 
                 711}}]}]}, 
             {RGBColor[1., 0.9499999999999997, 0.7499999999999997], EdgeForm[
              None], GraphicsGroupBox[{
                PolygonBox[{{687, 120, 523}, {143, 121, 122}, {142, 120, 
                 121}, {121, 143, 142}, {559, 143, 711}, {541, 141, 556}, {
                 525, 122, 689}, {522, 120, 687}, {527, 122, 525}, {524, 121, 
                 688}, {558, 142, 709}, {699, 122, 527}, {556, 141, 708}, {
                 711, 143, 542}, {698, 141, 541}, {120, 142, 141}}], 
                PolygonBox[{{709, 142, 143, 559}, {523, 120, 141, 698}, {708, 
                 141, 142, 558}, {688, 121, 120, 522}, {689, 122, 121, 524}, {
                 542, 143, 122, 699}}]}]}}, {{}, 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{687, 523, 698, 541, 556, 708, 558, 709, 559, 711, 
                 542, 699, 527, 525, 689, 524, 688, 522, 687}]},
               "0.0014`"],
              Annotation[#, 0.0014, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{671, 501, 686, 519, 685, 521, 697, 540, 554, 557, 
                 574, 722, 576, 724, 578, 726, 561, 710, 560, 714, 544, 701, 
                 529, 526, 506, 504, 673, 502, 672, 500, 671}]},
               "0.0012`"],
              Annotation[#, 0.0012, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{658, 480, 670, 498, 669, 499, 684, 520, 696, 539, 
                 707, 555, 572, 575, 592, 733, 594, 735, 579, 723, 577, 725, 
                 580, 728, 564, 713, 543, 700, 528, 690, 508, 505, 674, 503, 
                 484, 482, 660, 479, 658}]},
               "0.001`"],
              Annotation[#, 0.001, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{655, 477, 668, 495, 667, 497, 683, 518, 695, 538, 
                 706, 553, 570, 573, 589, 731, 591, 732, 593, 734, 595, 737, 
                 597, 739, 581, 727, 563, 712, 562, 716, 545, 702, 531, 691, 
                 510, 507, 488, 486, 662, 483, 661, 481, 659, 478, 657, 476, 
                 655}]},
               "0.0008`"],
              Annotation[#, 0.0008, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{642, 458, 656, 475, 654, 473, 653, 474, 666, 496, 
                 682, 516, 681, 517, 694, 537, 550, 552, 721, 571, 587, 590, 
                 608, 745, 609, 746, 611, 747, 612, 749, 598, 736, 596, 738, 
                 599, 741, 582, 729, 566, 715, 565, 718, 547, 704, 533, 530, 
                 509, 675, 490, 487, 663, 485, 464, 462, 646, 460, 644, 457, 
                 642}]},
               "0.0006`"],
              Annotation[#, 0.0006, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{639, 454, 652, 471, 651, 472, 665, 494, 680, 514, 
                 679, 515, 535, 536, 705, 551, 720, 569, 585, 588, 605, 744, 
                 607, 610, 620, 754, 621, 755, 622, 757, 614, 748, 613, 750, 
                 615, 752, 601, 740, 600, 743, 583, 730, 567, 717, 546, 703, 
                 532, 692, 511, 676, 492, 489, 467, 465, 648, 463, 647, 461, 
                 645, 459, 643, 456, 641, 455, 640, 453, 639}]},
               "0.0004`"],
              Annotation[#, 0.0004, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{491, 468, 466, 450, 449, 636, 448, 635, 447, 634, 
                 446, 633, 445, 632, 444, 631, 442, 630, 443, 638, 451, 637, 
                 452, 650, 469, 649, 470, 664, 493, 678, 512, 677, 513, 693, 
                 534, 548, 549, 719, 568, 584, 586, 604, 606, 618, 619, 626, 
                 760, 627, 761, 628, 762, 629, 763, 624, 756, 623, 758, 625, 
                 759, 617, 751, 616, 753, 603, 742, 602}]},
               "0.0002`"],
              Annotation[#, 0.0002, "Tooltip"]& ], {}, {}}}],
          AspectRatio->1,
          DisplayFunction->Identity,
          Epilog->{
            Opacity[0], 
            EdgeForm[{
              Thickness[Large], 
              GrayLevel[0], 
              Dashing[{Small, Small}]}], 
            GeometricTransformationBox[
             TagBox[
              
              DiskBox[{219.89725020931158`, 106.95405507334378`}, {
               25.886676417875716`, 17.998064531818283`}], 
              "Ellipse"], {{{-0.9999862342277074, -0.005247032979579136}, {
              0.005247032979579136, -0.9999862342277074}}, Center}], 
            Opacity[1], 
            RGBColor[1, 0, 0], 
            PointSize[0.03], {
             PointBox[{230, 100}]}, {
             InsetBox[
              FormBox[
               StyleBox["\"Posterior\"", 20, 
                GrayLevel[1], StripOnInput -> False], TraditionalForm], 
              Scaled[{0.95, 0.9}], {1, 0}]}},
          Frame->True,
          FrameLabel->{{
             FormBox["\"\[Beta]\"", TraditionalForm], None}, {
             FormBox["\"\[Alpha]\"", TraditionalForm], None}},
          FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
          GridLinesStyle->Directive[
            GrayLevel[0.5, 0.4]],
          ImageSize->350,
          Method->{"DefaultBoundaryStyle" -> Automatic},
          PlotRange->{All, All},
          PlotRangeClipping->True,
          PlotRangePadding->{Automatic, Automatic},
          Ticks->{Automatic, Automatic}], {560., -183.75}, 
         ImageScaled[{0.5, 0.5}], {350, 350.}]}, {}},
      ContentSelectable->True,
      ImageSize->{758.6666666666666, 379.5},
      PlotRangePadding->{6, 5}]},
    {
     GraphicsBox[GeometricTransformationBox[
       StyleBox[InsetBox["\<\"Correlated\"\>", {0, 0}],
        StripOnInput->False,
        FontSize->20], {{{0, -1}, {1, 0}}, Center}],
      ImageSize->{18, 300}], 
     GraphicsBox[{{}, {InsetBox[
         GraphicsBox[GraphicsComplexBox[CompressedData["
1:eJxlmXlYjWvUh0ukcsxDSYoIocyiE5YMIWVs2EN7SHsuoRBSuzRIZplVW+bU
KR0ZyskrGYoiHbO0OY4xypQk+t7zfT3P+10r/+zr7vdK+95dy3p+T1//4Pmy
VgYGBsOMDAz+e/2/PwHwvy9a7+ZXxAYylCM2kKMcsYEC5YgNlChHbKBCOWID
NcoRG2hQjtggEOWIDYJQjthgMeJmf+DT/HXExCfNEROfNEdMfNIcMfFJc8TE
J80RE580R0x80hwx8UlzxMQnzRETn5Sb/Rn4Nj+PmPikOWLik+aIiU+aIyY+
aY6Y+KQ5YuKT5oiJT5ojJj5pjpj4pDli4pNysz8G+WSQTwb5ZJBPBvlkkE8G
+WSQTwb5ZJBPBvlkkE8G+WSQTwb5ZJBPBvlkkE8G+WSQTwb51PKaXxHT+Uly
xHR+khwxnZ8kR0znJ8kR0/lJcsR0fpIcMZ2fJEdM5yfJEdP5SXLEdH4SJvOS
3/x1xHR+khwxnZ8kR0znJ8kR0/lJcsR0fpIcMZ2fJEdM5yfJEdP5SXLEdH6S
HDGdn4TJvBQ0P4+Yzk+SI6bzk+SI6fwkOWI6P0mOmM5PkiOm85PkiOn8JDli
Oj9JjpjOT5IjpvOTMJmXyCeDfDLIJ4N8Msgng3wyyCeDfDLIJ4N8Msgng3wy
yCeDfDLIJ4N8Msgng3wyyCeDfDLIp1bY/IqYzk+SI6bzk+SI6fwkOWI6P0mO
mM5PkiOm85PkiOn8JDliOj9JjpjOT5IjpvOTMJmXfs1fR0znJ8kR0/lJcsR0
fpIcMZ2fJEdM5yfJEdP5SXLEdH6SHDGdnyRHTOcnyRHT+UmYzEtR8/OI6fwk
OWI6P0mOmM5PkiOm85PkiOn8JDliOj9JjpjOT5IjpvOT5Ijp/CQ5Yjo/CZN5
iXwyyCeDfDLIJ4N8Msgng3wyyCeDfDLIJ4N8Msgng3wyyCeDfDLIJ4N8Msgn
g3wyyCeDfGrFza+I6fwkOWI6P0mOmM5PkiOm85PkiOn8JDliOj9JjpjOT5Ij
pvOT5Ijp/CQ5Yjo/CTf76yNp/jpi4pPmiIlPmiMmPmmOmPikOWLik+aIiU+a
IyY+aY6Y+KQ5YuKT5oiJT8rk9xH51CKfWuRTi3xqkU8t8qlFPrXIpxb51CKf
WuRTi3xqkU8t8qlFPrXIpxb51CKfWuRTi3xqkU898qlHPvXIpx751COfeuRT
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
PzhFXU5pb6yGN7ouThvY/eF/ABxyXII=
           "], {{
             {RGBColor[0.148, 0.33, 0.54], EdgeForm[None], 
              GraphicsGroupBox[{PolygonBox[CompressedData["
1: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
                 "]], 
                PolygonBox[CompressedData["
1:eJwtk71vz1EUxu893y5sTdpSraq0iqZqq4RIKnSkiag/QDtJw8AgBvUyqsRQ
xEvVS9Mqbfm1LLReSq1KDCa6SdoFE4mEz+MxfPJ9nnPv995zzz13/aGj+49E
SmknlME8Zi/fffA5p1RepLSD73Y4xdhjWMdYPbwmNo2vS47N4Wfwbeht8A4/
i29H74L3+GbWu873GgwzNg6rGFsNT4l14JfQH7UGuhFm9C8sofvhIPPa4Qx6
A7xgbAyq0F3wJ3mNX+jj0MzcSljJ3j1hrTmaewB+o8uJZcb34L8mx36ifxDv
Qx+GBXzASfRFKNCXoTc7pwvhmqg2qsEbdAOxkeQz6CzKUbkOwCL6GXNakmug
WujMOrvOtIzuC9e+E6rJb3e4FspRuQ7C2ewcrqBvw3n0LWhl/l38VfQ5GELf
gBPKFTYxfgnfnR1rxJ8O11Y1U+2OQVN2D6gXysK5qyaf0FuIDTF2E8bwmwvf
rfbU3i2FxwZhFH8vrKdga+EclavWuM/YI6hh7VrVgNhEuDeqVUP9h1+b3HOv
8KXwXMVe4h/i1ySv8Rw/Gf5XsVn8A3wpuwdHwjVQLfrhDn5jYf2vhuEclWvp
/7+L2b3QBW9Vu3DvqEYrmFsR7g3deaXeinouu8YD+G98e5J76Dt6PvttqAee
qJ8L35XuVHf7IXsvvSG9Jb0pvS290YXsN6q3qjW/KO9wr2hP7f0XRFF2Ew==

                 "]]}]}, 
             {RGBColor[
              0.5059918396030274, 0.48153067845473807`, 0.5216214105848018], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJxNlVlwX2MYxs95DzO40NjSscwQkbHG3pFc9p+6IVx0qOWmpIYLNE3Splyg
sUQTpLbGoMYWW2JfBklKUK1lTFLbYAztDJ2hnUF7Q13we+Z9Mu3Fc97nvN/7
ne9dv9PQ0blwaRRFMQkqcCSPxWVR3I/yK2QbuqlI2QxOBTvQX4mcRv8D/Dz4
BngrvBEcB2rgFNAMvrCNbGe/tQk+H5xsu4M4twnZE/leD+bKHttRMAZK1oaQ
ByM3sDYP/hGyF1whn3Q2axPoG5Errevw+WcXuUc4v0idYpI/NfBMkXvHwQD7
2+UDfr0Vuf4x7zOgXbEjf/dZOrM+0s8m5PLIuFZF2sl+Er4Zvgi+Hv40uJ33
E/n+FPJM9K+h+wB+Fvx1+Idl+vwG/CnHcwL2I/A74CdVGb/ieRPd+/Az4K/C
18NPg78Mfw6sVp6xfw95OvpX0H1q+3fhn/vcCfhn9mccvtHfeTuy5sqb4jks
Ml+HIifL7IuX4C+AAdWds8bg67QfPgoflB18vMy8v4juJ/gS5RY+49wrp9eC
PrAK/At+BdvAo9j1sOdYvvMIvBveAK/Bf2F9IXIX+BbeityO/KbI9wci++Qo
7O+L7HP1+xr45fAj4A/Du+DHwB+CXw9/DPmsY1FMu4s8Sz5tcd1V/zXuoRGt
RfbsXOUNHMje/1zzpaDTuKzMs1eU6Y/8+zsy1gWRudO5z0fmYhisLfIbl3r/
jNd2wr+LXN8HeWeZsXS7BzuKrOHPzvls7m8EN7gv1Z9fuk+vcx3+KtPmT2Tl
OCNSJz7kWqqmE9hsjNy3RfNY5fytjczXdJF1PieyLudGznoBSnBxJL8KWVdm
rlV/9b36f517WTGpD8oq1y/yTCiny8rMWX+ZOei3rsv9pz58EvvHXQ/N4s2R
94/uoU88I++4/pc419OuuWq/0/1Wc1zyYbdj22a7fxyLYlrgmrZF9seQcyd/
5bf8GHIdlNfbdE+iu9X3Yc33pe5W9dIccIi/1YC8J9LP4cg+k00Hcg7xtMBv
gvdG3scrZBuZ70WekdI12O66qD5Tnhu9/xYZ/7zIXPbb73HHPO15k31LpH7E
86B7vNn3/B9lxlh4dle7Rm3uZeX5Xs/j7Fwu22tWOss9vV/zPsV3IbjAeq2r
bt9H3iG7yrzL1Yf6Hwz7XtFazXuUuz73u/p+c6Tc6rX5Pq9rr55a7Lld7rnt
9bv6csCx6f+hswcj49YMauZ+LHMWd3j/oPfIv5X+Vl/kuXcjN6lm2H9dpl+a
T73rf9vqHGjudeeMup7Ku2ZrzHeG4j6gyn+T/lH7Vbm/O/KOU86aqqxVm+N9
MDK3R6M/vMqzbrGuxWcPOgbFfk3kuVdH9miTe7be9dfZ+1c520t8l9aVe2wl
69zj2tfourW7vlsj49jX/5ken/1EZM6Or9JX+XcXuv8BqbIIBg==
                 "]], 
                PolygonBox[CompressedData["
1:eJwtlFlsjlEQhr8zPwkuEFsRhKoKVTvhEkFCuSjRcEP/oheopdYLS+37Xnts
qa1i36taxL7WGoIgQYLEemO58bzmv3jzve/M+WbOmTNzmsXHZ+ZZFEW5oBJI
jkVRfoiiSWALjuboycFtW9GN0dnwEWAdOhU9BT4V7EQPAQH+mVh94aNBUnBb
FrxlzNdOA7vR+8E2+CKQhq8VmA9fAIrwpaOXwJeCYnQOqAn/S/yAbxD6D7wG
tgjdKOZ7Gw7W4BtsvvYD+AVvHfPYC8Eec4hrD3vhmeBd5DEVuw3rFwffwwHz
PWqvsu1Dj1Tx4PXAKPgrvnFMGaACfg/0h3cBV+CFrInzHQCaEGuX+dlUQ9Wy
ErqQtcXgDbwFtnH48sB21cq8doqRgu8h3yGsHQOu4WuKbSK2CWATulnM71K2
zeh8xQxew6r4vvGdwb854DX8KugJzwJl5jmVW3eyA74SDIX3AvPga81rrR5R
r9xHZ0degy/YzoP0yGOeMt+T9jYMrNbZQUbwnlJvLUf3UK+AFfCGMV+rnMq9
wdynmmyE1495LRVjCXoZGAjvDhrgO4NuR+724Aa2Orpz+Cq1C/wntgL4WPAA
nQxK4PfBR/jb4D7V47r5nSmfcqxHl5ufrRd4FPzMOvt08FXnx98J3hncQc9E
d0vcv/Yum3z9wF34WfO9dgA30VfMfeqhF8Ehrhq/VM+b51qpNtRsEDMl+B3P
Qv/gOyfynnqGfhz8LNqz9n4atI28RtfwJaEPwjeAt/Ba5rGLQG14ZXOfavZc
/WXuU81UOzOvrXrqO/HOmZ+lI7iF7oqugJ8Hn/QegIuR53yv3jTvfdlS4XPN
ey1dbwy81Hy2VAPNVh/zt0Yz+Bs+SW9W8BrXoBZxdPXgtioxn1HNahqohr4e
/O5UA9ViinkuvVm55m+K3hbFyDZ/05TvKfgJv2o+O7pzzb5mRvXVTD5Avwk+
m7qDCny9wZPIY2jvqYnz/7epN8xjy6balJjXTj10m1iHE/2s/ZaiDyXuTzNW
gj5p/taopy6jjyT6Sf9cQB9N3IdsZehjifiylasW5m+l7kh31dz8rjQzdeFz
zGunGS1QLvNZ0Zv5A37CPLf2e4k1xxP9rxwX0bPNZ1M9ql79ByGBwJE=
                 
                 "]]}]}, 
             {RGBColor[
              0.766133361093196, 0.5729542163586312, 0.3686947653637442], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJwtlElsT1EUxt87LxqbptESKkj/tSAWupBiK/l3wEolVFVVF0gTUxOtBJuK
MSqGhWnH1pqWhShRLa0Ym2LTlgRpCZVgYfh9OWfx5fvuefeed+4Zbq5lT91u
S5KkDWTgfZokDfAAxrfoZvQDdA2YQG+AJ7WXbwa+gA7WT7G/i/06t43178Sd
TgeF2FqwfQI9mMvhUmwVYCk4YK474Gq4EWwGB1lXwoX4eIbu5OwU62/ocfQq
eBTcQM+GT4IVfJ+TeXyKeTL+p//mYm8vuAc+mPMieKP5me3wEvM9i+EX2OrR
d9F9YBd6VP+IHCgXD0Ee+02+nwF51nOJoR+uxt6NbQBdg+5BP0JXoW+hn6BX
o++gH6Nr0bfRe0GOdQF+rmE7Dbp0H2zt8J/4p+q1KeJTnC9Tr5/sr9EjoAn9
Mf6zNfH1v9R9FkWO14I14EjEr3uMgIvsmQaXgW70Mvh55GE86lSVet3GYn8B
fDRqWUz8Q4mfVQ2uB2utu+mO+8z7qCvuOT/zeE5FX8i/Ymowz3e9ehLeEr2i
M8qJfJw1j+kSnJr7TOCv0avq2SblWfkIbgpfikX9szx6Tnk5ZP6tJvb+Ne/n
ZvhN9OQP1hfMY1bsjZEPnTlnntd5medd9VUd8tH7FTFzqqV6osQ8R8Xmd9Bd
yjLvUfXqSnhh5jGfRx+LXJREzioj/nZz/53m86B7HUb/BL/wsy5mSHOqdWvM
5E7FG3NeCw9H395Hj6Xea/3hWzOgM59T76sh8z7TPQf1ZsQcaZ52mO/fHzOq
XJeD4ZjRiXhXSsPvq5idXvYXZb63DT0Vb5HepOPmNZmZeZ2VN83KYPS6Zqs7
bPo2HHOvmE6Y139W5nOr/Pel/mYpJ+uxzTA/u8B8LXsdfNU8/6rDd/P+roSv
RK+UY79s3gc59H9DMKC4
                 "]], PolygonBox[CompressedData["
1:eJwtlElsT1EUxt89z7Sh0aI1RPq3smJh7o50tqELtKjqApEYEyXBpmYhpoVg
x9betNESVVJirDY2bVkYGqESLKjfl3MWX953zrnv3e9899xXaN3VsNOyLFsF
xoBtBNNTluWgCV4EzpC/DibDn4P98DbwlTXT8iyr51kHTlJ7BjZRawFfyE3N
vVYLTlAb4rmD2jrwmHgcuAxvB/36NpifXMN2eAP4Q20IrID/Tb63NI3CL5Jr
jv1nstdCaYj13+Gj4Hfm39gML4A78BugBD6Jdxbz7iJwkPidtFJrBn3wc+Sq
eK4H5+FjQ+9NMGDeg3ppBIOs6TbnTeADcReojPp9rTX3dpi4Hj6e/ecQF8Bu
c89awt/h5O80hl+viIvNtZ8FCf4zuXfy9CVxmbk2aRyE95j3ojP5zNqRWK96
H7Wj0Z88PwBfbu6dPPsFn4G+yuRr5MVDc336Xr98C7/l6Sd4aezfAT7Cb4Nq
eJXOm/XLiHs1O2AEvgUY+TKwFV5r7o3WVMBfJ+9d/XUR7zX3ayKYgLZ95u/O
01zAB2K+1OML4nugLvMzfZpcs7Qr1wNfaq5V+0nbabAy+UyU8v0F6iHzHjVb
s83vgnLl8FZzLfJLs7Y65k25f/DDYElyzUV8r91cqzw9Aj9kPnv1cZcqwp9O
eQR/m3yW5F8HcQlrashVg2Pygnhj8jtwzXyN1srzN+QeENdE/5rtPeazpv40
+7Pi/qrnS9Q647z0Ti+5ueZadKaarcx89vQP+BZ3ri70X6BWnLs2zYtma0ru
d1+aj+vuhR7t0U2uPPe7tQFcMfdc2uTZKWnNvaYer5r/c9ri//I++T9hKM7n
B/xW9K8794j6XfPetecT3a04L52H7t4a81nUDK6F/wfBLJp/
                 "]]}]}, 
             {RGBColor[
              0.9201717064829656, 0.6704292662074139, 0.35253229009719333`], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJwtkzkvRVEUhe89T5AQMxFi6ojGVKnoTAUqY4hKDO8RhKAzJv6A1g9Qq9GQ
PAoxPKIxxhwSnogYvp29i5W1zrrn3LvP2vsW9YVag87zvCYQAJe+5wXhHcxc
dDkoA1Ws9/Ar4Tg2JuL1os/BPH6UdSc6Bm6HH+EJ/H10WN4LLjw9F4U/watT
rwZ+AhF0NbwMqtiXxXca0C/4bfASqMTPxH9Gb+OXyved1piGnwQK0aN4V2CV
PfHwIqjAz+D5H7yC/+PrPeW+V77WInVJfaesu+EInM2edXQxfAhG0Lf4X2AM
fey0Vql51vKQd4bAJutO2cOze9sv51Lx19DJ8JTVL/eothzq4Bu8LnQYPQBy
WE/CjZZJPfxsOUveP6wT4B74Gx7HP0F/+Fqz1P7r9I4t8ILT/qZTe4f1rh++
9rX2XXS+r/eS3COWyTb+mWUb67QH0osSeMPTOZGejzjtt8zLp9MZqLW8JaM5
y1r2SN1xlp3M1LT1KyGg2cjdZR6jTs80ww92xz17d9i+PeN0BmQWQugCdAw6
xTLPg4dsvgclE5uHJPSdzWsFfOC0xneeBwKaRdDyu7CZPvK1v9LnE+vXFnrY
spNzb/bvyD90abMkM1VoeeXbvMv+AqtJanOc/Qc0pHUF
                 "]], 
                PolygonBox[CompressedData["
1:eJwtk7tzjVEUxc+3vxvMiBCPAkOiQyW5OgU6jwYVLsOoMOTGYDw7zxn/gNYf
kFovFULBSDwqNx5hMMzkURD81qxdrPnW/vbj7LXPPhtOtA8MRSllO2iAlxht
vsNgpiplGtyA3wdv8fWBh/AxMAV/F/bfBAvhTfCsOKYfPk/+PfhF8B3eE7Yf
gGXwbeA1fFR++CQxQ8U1X2DvSv8PsAe+E3SKz/gFX16XsoWcAXALeyMYyXqb
4Uvw9+HrB9ew14XPVn/SsiCsTTkduIaxntgm6Cb3T+Xe1fNf+IraZw2C28R+
qjyrFniKvap27lZwF/sUWANvgBb8GFic/XQRuwP7PbmzQviffOq5jR3YayvX
UK194VjVmIc3Up96Pqve836ksVf6asd2q0/sK+H+VfMMfIrveWKPgjfw6+He
VVOz2x2eve5Ad3Up9Wjml+Enw9r07zT8XLh/namzD2a+Yg7DxyvPSjN7gn08
3Nuc5gtfWXu2muEd7ENZXzX2anbplwZpGQzvomb4U7sHLhRrkrZN4V3Q/a4W
D2s9AibwPwpz9fQK+3Nlv/K/wMfSr3/y6Y5bmf8xd6SZ+3AV3/PwvqiHr/zb
H9amnZ0La5Z2vbEP+B/ne9POdyrv7GjO+xt8Ue6n3oPe2kTq0xnazdnKb6+d
b3dp7rf29R++8bAW5fyuPIORfM+T8P8VrXwV
                 "]]}]}, 
             {RGBColor[
              0.9617278600756443, 0.7743196501891108, 0.4813563662344973], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJw1Uj0vBEAU3H2c+0K0Pi4XpU60CK34jE4EiU6CCx09wT+g4RdQ8Qt0dBKC
BAkOhbjiXOQOMZN5isnM7r59+9687ZwvTC5bCGEQqAOSWOyCb8EJbGRiCHPQ
P8An9idMe+WgdQL6A1wChk16CtyIuzmcMXkySncA06Y7C6Z1Q9T5jefg/Xec
XYN7wWfACnQRMf2muD7wqCl+BHwBbEBXWAv0A/QA+A3rVegXvo31MXQ3cwbp
k6A+2E8aWDJxPWpPQ2/i7A5c8J7px1GQP3vAk4kzpn7YlyGmbMo7Ds4CW9D3
plzM+YW4ktfRA654zYPgalR81r2kD+z51VRvHnzqe/8ekYfcD/qZcL/payqq
133gAFh039dMoM6i5h0/Z9yMz6wKnjXlqIFr4G2cX0I3mWLbTf7S53PoFlOe
ZvBz1Ow4w++oN674j6Lmxbk9AofQreAx963sufkW7xRNvrd57hOfH+fAfd4/
deZ63dQ//2DefcuZ3mBMl+l/834K/Ou1scY/jyBmuA==
                 "]], 
                PolygonBox[CompressedData["
1:eJwtkjsvRFEUhc/dF2O8omYUSiGCmtCKZ3TilWg9JpR6E/wDGn4BFb9AN0qP
EELiEQoZBYMZxLeyb7Ey3z7nnj1nrbNb57MTyxZC6EQVaJDikt8CGoK/ohBy
8Ao6o25BR/AeaoR7UD742rP5N/p2FX1y9pZ6A95EdXATOoB30AM8jj7gO1SE
B8xZPd/garQN76N7uAMdB+/xBM+hmsh7/KpX0u8djWrP/L/W0Q1cjJy1dk29
gKpYy6BFWGG0wNUojkOYNM+iknoKbjD3voX+WLswZ/krUw9Tv8FXqA/uQoeJ
n27zTJSNMinBbebe5KkdLqFU5HeahvuTPORJ3k7Mzyvjx8h75pP8CvC5+V3U
/5v92ti9ydMaexa7F/WXd3mU1zRaoq6InZVp1jwz5aUZSMNj5tnqmx/4KfK7
aP/UfC2d5DcLN6Pd4BlkzD3Kq2bs1fxMLnmfj8hnRPfXmXq4bN5LmcyYZ6K7
K+MRuNc8a/XUbMjzRjJ/L5G/sd5aM5SC/wHId2LP
                 "]]}]}, 
             {RGBColor[1., 0.8805088437386336, 0.6197040820099379], EdgeForm[
              None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJxNkT0OAXEQxdeoCBdAoxehJy7gI1GjcACO4RA+zmCtK5ClV/nYRrSCCFkK
bzJvE8Uvb/87/3nzdjbfH7YH4jhOEcTBGhzAHnhgCmbgCB7gzjtz4JIxmIAF
dUoPvXujzwb47NP+FShj8BZagubAEs9Z6EWsXhDz8uh9FJuVhJ7FvDLQlFjG
gB5bzosyuTwH4MS8LrMk6KneI2bXvjBm5xd0x9o7ZnOWzOTTT3eTZgbNUhXb
X12sX3vVoyG2j45Yn89cD3rouyt3orvp8H4IbYrlf0J7Yj1f1vd/+z7QK6B3
tAuPuZ/0qYnNX7BW4M4r0K6Y10dshs5q8ZtW/H8/YixgtQ==
                 "]], 
                PolygonBox[CompressedData["
1:eJwlkEuOQVEURU+d6JSKpg46BqAYgM8EfBJ9GgbAMAzCZwyIKRAxBVV0hB5B
NSp0rJ3TWHnr3Xff3WfffG/Q7ruZpSEB/x9mQ55j2PPhDHN8AQX8AFN8Al94
GVb4Dip4TXvwLVzxJ9zwO3TwImzwX7h4ZChrBJ8ea/r2A1X8G9YWM2iWDMws
Mk/4n86wyGx6zKTZ1OFJlxbvD4s92pv0yNIZR48MZSlDWS+PWfVPF697dFOH
Bp6FpcUdpPCSR1et5TzuSHeljur6BpbpNeU=
                 "]]}]}, 
             {RGBColor[1., 0.95, 0.75], EdgeForm[None], 
              GraphicsGroupBox[
               PolygonBox[{{557, 199, 743}, {750, 199, 559}, {559, 199, 
                557}, {743, 199, 558}, {574, 199, 750}, {558, 199, 
                574}}]]}}, {{}, 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{743, 558, 574, 750, 559, 557, 743}]},
               "0.0006`"],
              Annotation[#, 0.0006, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{725, 504, 734, 521, 733, 522, 740, 538, 742, 556, 
                 572, 573, 588, 589, 604, 762, 605, 763, 606, 764, 591, 756, 
                 590, 757, 575, 751, 561, 560, 540, 539, 525, 524, 735, 523, 
                 506, 503, 725}]},
               "0.0005`"],
              Annotation[#, 0.0005, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{715, 486, 724, 501, 723, 502, 732, 519, 731, 520, 
                 739, 537, 553, 555, 749, 571, 585, 587, 601, 603, 617, 770, 
                 619, 620, 633, 779, 634, 780, 622, 771, 621, 772, 623, 773, 
                 607, 765, 592, 758, 576, 752, 562, 744, 543, 541, 528, 526, 
                 510, 508, 727, 507, 726, 505, 489, 487, 716, 485, 715}]},
               "0.0004`"],
              Annotation[#, 0.0004, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{705, 470, 714, 484, 713, 482, 712, 483, 722, 500, 
                 730, 518, 738, 536, 552, 554, 748, 570, 584, 586, 600, 602, 
                 616, 618, 631, 632, 644, 786, 645, 787, 646, 788, 647, 789, 
                 648, 790, 636, 781, 635, 782, 625, 774, 624, 775, 608, 766, 
                 593, 759, 577, 753, 564, 563, 544, 542, 529, 527, 511, 509, 
                 493, 491, 718, 490, 717, 488, 473, 472, 707, 471, 706, 469, 
                 705}]},
               "0.0003`"],
              Annotation[#, 0.0003, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[CompressedData["
1:eJwl0L0ug1EcwOHzkiY2CYOGSpTBFUhYLfZKajDpwEYiYbMwMfjqUtwHytAO
omhFhMXHYujQRDTRC9DnxPDLc/4nJznnfbOFtdxqEkJY1HlPCDVDlS+s8JU1
fvGZHb4xFfc0pKYmNa2ZeEZzymtBy1rRhja1rR3ta7g3hAMeqqQx8wmzPOU4
zzjBY47wiBkWOcq9+A7uMs0t9nOdfSzwT0sK5nnmNKtfTakV74r3alADSuJ5
tX3zj56sv/mpD92Y3/mohq7NdV7xgWXe85J3vOBt8v+fu0XYMbI=
                 "]]},
               "0.0002`"],
              Annotation[#, 0.0002, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[CompressedData["
1:eJwl0TcvhVEcwOH3XhYmEiQWInrf+ADKBxC+gLIyYFVmbMqi994tuFe9Rm2y
KDMLJjbPG8MvT/4nJycn5+S1djV1RoIg6NVmNAhODEdMMM4HxvjIG77xnt98
YnK4piwVqkgfqlWDGvWrFrWrQ6lJQdDDAQ1qWCMa14SmwrPsmeaMFlRqXmQZ
l7isDVWbV1nOFVZwjZVcZxXnwntxlsWcZwknWcAx5nCUuRxiNvuZxj6ms5sp
bGOEzfxRvepUo/fwTOUrUxlKUlRf3uxTr3pRwtpz+J6606n5lte60qH5kge8
4D7Puccz7jLOHca4zVNu8Tjy/59/UGg/yQ==
                 "]]},
               "0.0001`"],
              Annotation[#, 0.0001, "Tooltip"]& ], {}, {}}}],
          AspectRatio->1,
          DisplayFunction->Identity,
          Epilog->{
            Opacity[0], 
            EdgeForm[{
              Thickness[Large], 
              GrayLevel[0], 
              Dashing[{Small, Small}]}], 
            GeometricTransformationBox[
             TagBox[
              
              DiskBox[{200.15169927858938`, 119.91358757739714`}, {
               45.08105682255147, 28.641217465246772`}], 
              "Ellipse"], {{{-0.9109622228065566, 
              0.41248979213956016`}, {-0.41248979213956016`, \
-0.9109622228065566}}, Center}], 
            Opacity[1], 
            RGBColor[1, 0, 0], 
            PointSize[0.03], {}, {
             InsetBox[
              FormBox[
               StyleBox["\"Prior\"", 20, 
                GrayLevel[1], StripOnInput -> False], TraditionalForm], 
              Scaled[{0.95, 0.9}], {1, 0}]}},
          Frame->True,
          FrameLabel->{{
             FormBox["\"\[Beta]\"", TraditionalForm], None}, {
             FormBox["\"\[Alpha]\"", TraditionalForm], None}},
          FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
          GridLinesStyle->Directive[
            GrayLevel[0.5, 0.4]],
          ImageSize->350,
          Method->{"DefaultBoundaryStyle" -> Automatic},
          PlotRange->{All, All},
          PlotRangeClipping->True,
          PlotRangePadding->{Automatic, Automatic},
          Ticks->{Automatic, Automatic}], {186.66666666666666, -183.75}, 
         ImageScaled[{0.5, 0.5}], {350, 350.}], InsetBox[
         GraphicsBox[GraphicsComplexBox[CompressedData["
1:eJxlmXlYzOv/xudk/6KjIip7tiJHZI3jjbIkZKlZW3TaZrO1cZAh2ffIXtPi
4qAQKSIfUREnElKKKUlZSpLI0u/z+357nue63nP+OHO9ukfXzOvknnfn7ue9
dIGvgUAgqOb/9f+P//vHB/77oHFreUQs8EU5YoEfyhEL/FGOWBCAcsQCOcoR
CxQoRyxQohyxQIVyxAI1yhELliBu8QfClq8jJj5pjpj4pDli4pPmiIlPmiMm
PmmOmPikOWLik+aIiU+aIyY+aY6Y+KTc4k8gank+YuKT5oiJT5ojJj5pjpj4
pDli4pPmiIlPmiMmPmmOmPikOWLik+aIiU/KLf445JNDPjnkk0M+OeSTQz45
5JNDPjnkk0M+OeSTQz455JNDPjnkk0M+OeSTQz455JNDPjnkUyNueURM+5Pk
iGl/khwx7U+SI6b9SXLEtD9Jjpj2J8kR0/4kOWLanyRHTPuT5IhpfxImfSlp
+Tpi2p8kR0z7k+SIaX+SHDHtT5Ijpv1JcsS0P0mOmPYnyRHT/iQ5YtqfJEdM
+5Mw6Utpy/MR0/4kOWLanyRHTPuT5Ihpf5IcMe1PkiOm/UlyxLQ/SY6Y9ifJ
EdP+JDli2p+ESV8inxzyySGfHPLJIZ8c8skhnxzyySGfHPLJIZ8c8skhnxzy
ySGfHPLJIZ8c8skhnxzyySGfGlnLI2LanyRHTPuT5Ihpf5IcMe1PkiOm/Uly
xLQ/SY6Y9ifJEdP+JDli2p8kR0z7kzDpS/eWryOm/UlyxLQ/SY6Y9ifJEdP+
JDli2p8kR0z7k+SIaX+SHDHtT5Ijpv1JcsS0PwmTvvRoeT5i2p8kR0z7k+SI
aX+SHDHtT5Ijpv1JcsS0P0mOmPYnyRHT/iQ5YtqfJEdM+5Mw6Uvkk0M+OeST
Qz455JNDPjnkk0M+OeSTQz455JNDPjnkk0M+OeSTQz455JNDPjnkk0M+OeRT
49nyiJj2J8kR0/4kOWLanyRHTPuT5Ihpf5IcMe1PkiOm/UlyxLQ/SY6Y9ifJ
EdP+JNzir69Xy9cRE580R0x80hwx8UlzxMQnzRETnzRHTHzSHDHxSXPExCfN
EROfNEdMfFImP4/Ipwb51CCfGuRTg3xqkE8N8qlBPjXIpwb51CCfGuRTg3xq
kE8N8qlBPjXIpwb51CCfGuRTg3zqkE8d8qlDPnXIpw751CGfOuRTh3zqkE8d
8qlDPnXIpw751CGfOuRTh3zqkE8d8qlDPnXIpw75hMUtz0dM7yWSI6b3EskR
03uJ5IjpvURyxPReIjliei+RHDG9l0iOmN5LJEdM7yWSI6b3EuEWf1rkU4t8
apFPLfKpRT61yKcW+dQin1rkU4t8apFPLfKpRT61yKcW+dQin1rkU4t8apFP
LfKpRT4F3i3PR0zvT5IjpvcnyRHT+5PkiOn9SXLE9P4kOWJ6f5IcMb0/SY6Y
3p8kR0zvT5Ijpvcn4RZ/XuT5iIlPmiMmPmmOmPikOWLik+aIiU+aIyY+aY6Y
+KQ5YuKT5oiJT5ojJj4pk/udPB8xvedJjpje8yRHTO95kiOm9zzJEdN7nuSI
6T1PcsT0nic5YnrPkxwxvedJjpje8+z1RstGGY6xEMK1tPXd2r1n+41N0Nch
r4X6+9e7t/2eRJgJof16oYVLAd53FDDA6MuUm73YfpNTtzKz2EgIWlHEbwPb
6u9jY56YB66PYHxgd/97lw3ZvlMrXfb7U60bOP46uOg/DXgPUsHJ9c2jyt+4
wcO5I0/lvmH7z8e/Z4YUpuE9RQ668G0+zeeEkP3U0+eOTH8/Ec5w9dt+WwhX
g+9V2T/Fe4sCxrkEH2qIY+9v9Lerk8+sZzxC+/JmfJkQFp4sCpybivcYJWy2
eji1/1q2Z02QJYZsLWHv92WRelr9NMZ9W3+Z4HNFCJYCo2juOt5vVJBpss3a
b7sQhkVZrh7nr7/XOM6oXZfuwvawpQf6RrvWsT2s8umT92X1QpgcH5nSuyPb
c0rWmvYP3Mr4QpidadRZtp/Mdt4+tGSE/l7yue/bCU77RdCu8HCrhkMsL1oz
c+u9Wry3KCBkcNi6Y30Y25Rl/VUfJ4LIViui43z095bIFUVFOQ6M7Uq1YX/9
I4K1yrRzrq/wXqOEo/tP7vacwDjTZrR45kG2z5wdtzLs0EDG40Madr8MF8Fx
242ZJtl431GBX8cvZQ1dGO9s9E1auUkEj6x23+0xQ3/f6R83MPzFVhHEOpgr
56eyXCgszn2nZntP75zQLW966u8/9nvtzJ6li6BwYpaddwbbW2o63rR57qK/
r1RcehY51k4Mq8atOVSTwvKmkKjQi+3Z3mI8aOoBOxf9/UXo5/Q5wVkMDXEw
fNYRlidvThi2uxrvN0qY3zd5/A4DxusVq8e0WiWGv5vLDBxD9PebrKwle0a/
Yr7N2sREBjiI4UvMgZ01e/D+o4KpndaqXZuZ75oeS9rKV/Pv3+XXslxb/f1n
3lBZ1SZ7MfT62v37jzyWexV0n5+/Ae9HakiWCgo/fOV/XgWtf7b3ZHtR46Sc
XU09GBtnrww2LsB7Eu/3e11KoTHbZ64vlZ2oyBND0NePtm3M9Pcaz5UX+9zt
J4GwEZuHVJ5n+eZjLycs7MD2m9hbAYXDpjJOf1sX2HY14yGuS4ImJjEuC2nf
ukqH9yAlfF1a+2WjjQRmdBg80qEf23/iK2Mee4Tq70GSOMt+666IwcXm6h7u
Jstf9CycO2st24cidjo3RdgzXpoX5pXYwDjdxt3j8BW8L6nhoqet/0FrCZR+
GhX7zl5/T6pM3uEc/0QMw7tfrMjYhvcnOYQV1b3J5ZjPqorQ7OOPJbD/x48r
e6LxvqOAXz/DL1u/YfvYfYX9xsA5Elhzeu7rZkO27zTnNzaGOOvvPY3m8si0
RAnY/zx94uRmlj/SbrrWIZVxgIN3gbIS70dKMCh+VVy9SAJZD34WV1myvWjq
wM6VdcvxnqSCUvld5fhcCfh/GFExzEp/P7ratWxE5SEJWKeseXQgh+U91nTe
0W8943flz+5slrN9KfF4fO0WI/29adelMfLmJuZTK/mccvIC87f5ZlHED7kU
JOeW3j3Vhu03lp7eQZ7e+ntO3jiHieowxjahleELhklhSm7m9ZlJ7PnXLpQ1
zfmE9yEl1JpmpS2IYdyntK3Nn26MXeJnxlp1loKF3f7E+Nn6e1HtXM+hnzYx
tlq2aUqttRQaH5utGpWF9yYVLNIOmxbWWgrC7BWd06rw3qSGDr0NnvoNlUKO
dUj+pWVsXyqLu65wfI73JwU89l0QNOyjFGZflrdrG6K/z8SUnzgRN5Lxmmbh
kjEFUui+ePmAh2/xvqOEB3UWs85MZfzB4syRiBopVGl3nn3nqb/vbHCeuN5u
LONk85SyfJ0U1EUTLk2vxvuQChwL+sQUrWU8a37Fs561UugWsKSLLe1Ltge5
hrzpYN9OBhlzy0y/VbB9aHT9jRkZe/F+pID39WlO6TvZ+/V1E1R4xsnA+Fnu
7awqvL8oweG4pHqGLeOC7LP3H55g7ycoeG6ncmO2v0QuvRvWGCmDSTmPbxns
w3uNCizyq5LkH2Rw4k3xPpGT/j4TL+mcX1Qlg+QnNbHPS/Ceo4YaRZvvAfFs
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
ThaTeov6e8L/Abpw3Bs=
           "], {{
             {RGBColor[0.148, 0.33, 0.54], EdgeForm[None], 
              GraphicsGroupBox[{PolygonBox[CompressedData["
1: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
jqkLuiJ7ket/XluSU4wyBkzV5/BXfPCCIvWfXyR/nKiv4mvVjhumj1bra1M9
E8M9DzX6OL5OfOHsECsXyGuONOYTy+dmdfFrvjLoI+4Nds54ZSySV41jmY+N
F7rOEcqr1Z+o56mbt+cphyBf/mngh3nKO3bYt1qbLjN+4DcL5Isfzff7Be3H
uDIWIG+nPPDLbXnKUZCHv1+vj2LXJe7ZLv0X3j/LU17Cvb01T3kG87fYx/dL
6ss4avPLPatH9E1ql7K2OaVduGvXaKd1fs+1b7X2Xi9tXpFq9pNFytmP6vvQ
qHOoV6hxqKXedW/gsSqruz9WyJv6p3yToN3hnm1QHjbYnKU7n/3cKG2O/FZq
o03S1iofvnuVTz1CPVXWfOU7FPUI+cOBLNUbmxyH7tSTB6WhE3XJG+p42O/t
9jFuTJH4jy7SuwL8XtMe1EBv+Y3d31PXfeq4S/qb8sKWR+RR1p17XMfb6nRE
2vvu52nttUeZK1zDVvUlZhGrOOu83fCu83GW3giJQeVbD28/xCfiO+OITefl
dW88DY39jxdp7owi1c6MO6ON4XtCXYl3ZS1IS1ycXKQxtUWyBT540r2C10fu
0wm/37HvuHu+Q9sjn7dS3juJs+jOW1FZl37gPrFufBTf5w2Lt71Z2ojcsbt1
+s1F8qft2m659tuijZCDLbA3PLgUyrdU3la5B5Bfvm/R8h7G3jCWcbOKFK+f
KFJ8h45OJ+XBO++fHTOzSHcjMYm4QHzlLOH75KTEFGIY8Yc7eLf3B/fWXuMP
d8Cr3gmvfOXeoN3vnbPX+Zvs22e8Ie5wf5JfUW+QB5D7k1NRm5Q1AN/UAB39
pobp5Dc5ErlDjfFrt3wvkUc74yBydhpfibPEYO6f59X9CW2CbX6ZpxyYXJic
m/uJu4W8mfz56SLNe9U1r5b3DmPlNmPnc8ZNYioxnlj/kzzF6xe130p12WZM
fclxzzqP7+Xygxe1XGfXT71HzUTe1NS1tvWMVWgzfILasPzdgLaxftxCG2fy
Ylx9ZVTox02lcVZbSiMXoPaiBsNnqVPL3x9ouQ84N1dIQx41Kzkgcf1q55e/
TzCucM+Qd5Z+wPfZ6tjM+eTVZe1Ie4vyqPnKGpS2rDW7aC/k3+b8JtqsjXpQ
W3ZTD2pXavRGymut7drIgzdf8se1RerrIV/WfaN6XCm/rq7/JmlL3XN853Dg
wuCztEg1NLU0Z+BJ9xvf4Z1lmfPIzfFXclDqiWek8X6Ar+A7M53H9+P24XfT
5cF83gtWKIM3i5V+lzkuZ5fcgjPPeZomjXyVvI0zXOZxtJxvYkpjbcabyCr5
LpQOL847b0DkLrzVU8OWv1fQUt+SK5e/exCPqIGohcizOzuWvLuL39QAPbNU
W1ZIZ34755W/jfRy3Dz1IB4Q8/oqo6PyKx1HDlrWrLSD5TFU2u3Gg5FZXW0/
PKv7/aav8oc5p490vudr17X6U2P9a656EUsma7vyrXGBdhvn/uEj5ZsXe/io
fTP1o8XuT7U2L9/2aKkJxzsPXhPtK99tV7t/j8gP/6pRPrwe0Cd4N+INaIb+
OEZ/na4fL3INS/SpTc4p/ehBx+LXY+XB/NH2IeNh5ePLo5zP+v4HLrc1jA==

                 "]], PolygonBox[CompressedData["
1:eJwlkKFqgmEUhs/3saTo1GIUg8z1NYPZJl6ADC9gKpiUIWxjQdQL0GK2r8wq
TrCYxwwm3QUMWfN5OeHhf87H4T3n/MVWu/EUzSwPN1Cn+OC7gD0+gSyeg00w
+4Z7vAo/+B808Ros6T0E9weYU2+DewGm0TOUVYYv/J23BJ6ET+oxdcZ85pr6
kXpnvpN2K8EI70EGP6ufvlt4xVfBZylT2SdI85aCF3wWfbZu0C3p6Fm6QbdU
ot+uGXd4B47mO7SiZyjrQj3An+HffIZmaQftorch3o/eq4wu/qv/GXznN/wK
ZLAs6A==
                 "]]}]}, 
             {RGBColor[
              0.3754607237781458, 0.43565712337251133`, 0.5983553572677993], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJxNkk0rhFEUx+9z7dTMyCcwyUzNVrNSPoANmdnTWMgGkyZFwowUgyy9fQFj
b0FeFma8RClFiVmM961SwsLvdE6x+Pf/3XPPc86957nRzFD3oHfOtaI6dBQ4
F8MXCIbQANyM3xJvh9fgD7gHDsNT6Bt+wveIh+A5OItq8BhetppX+CjrR3jE
aqdQGvWzvsD7zB+cfj/J+gsv4C/oE57AD6kVgYtwF9qGe/E4KsJtXvtJ3xV4
B26CZ+GK5ST8X78bfNzq5/ED8sPwPPwe6Dnr4XXUAd8Ta4RzcASfRj/wM37N
Xhxehe9sbjK/lJ2z0+v9ZQ5Vr/tpm8UpeVF8mfim15j0T9iZY173JGef+KXV
lBk02Hla7B61f3M8d3rPip1tkZwtu0uV2AachM8CnZHMahfOeP12GF+ynBPi
x1ZH6uWtn/yfgv2vV7zk9Z3Ie5mxd/KG/wIHQ1d3
                 "]], 
                PolygonBox[CompressedData["
1:eJwtkbsuhFEUhf+zoxJmxBPMFMMTaD2A0uiHaUTjlojEvSBuQSvhBdAr3AsF
QkuBKcwQehFB4VvZu/gya806e//7nF2sjvQOW5ZlJWiCfswhv7dQRddSlvWg
u2AXP2Ce6UwZfUxeiHwTn4MKegLa0M9Rr//28XnzTP6L7Cp5rc7skL3CL/oH
5tCf5H3obnhCl6J+HTrRN1GvGbbwq9CKzsE52RkU0S2wQrYNHaqFe7JZ/De6
Dg30FLxk/t80+iR5rXos42egEfPNm/dUrm+eJj9TjHmO8B9xnz9YQjdDGT2k
GvOZC9H/mvPj5rPcwSB6w3xWzXyZ/E30bc0wiX5M/jbquYd/MK/VjrSrWsyr
nuq9Zv42ebhIfud69NPd3qO/Zl5Ej8a+9SZj5jurxL4O8G/md9P5Bb2t+W60
o3b0P6QIUes=
                 "]], 
                PolygonBox[{{591, 182, 720, 573, 574}, {651, 15, 449, 450, 
                 451}, {665, 39, 455, 472, 473}, {451, 450, 652, 38, 453}, {
                 473, 472, 666, 62, 475}, {574, 573, 571, 139, 710}}]}]}, 
             {RGBColor[
              0.5474345396302429, 0.4960952056208522, 0.4972589287796655], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJwtkTtLQ0EQhfduOkVE/QXx1dpZSBSsLUSF1CqIWkRBiLEKlj4KQREVtLCL
xFKwigmIQjQKWhjlQkyTdGmt/YY9xeF8d5ide3Y2ubw5v+Gdc2Moga74GMdr
kXNT8DU8i+dQC87jPWgN7sK7xUn8Tmy1CueH4QN4Fb3DW/iK+Bv/oicFn8MD
aBvuw3+oT8IXcAZ9wjG+gO7hJTxWj/WW0RC8T/0RHoEP4WoU7nJk/1SeUx++
rf5CbQ8ehB/gN805ofakOTavrGyWMVYeW9otmoGb9KzrXna/UhRm2uw/eBHu
hXdRG27jlzrbsFxwHp7A+/WvUfxVc4592J3Nb+AfynYGp7WTOR/2YlzHO9pt
wYc3s7dr4dN60xT+LLZ3rqvfzhV9yGzZb3zYs+17R/mbeFYzf/F/cJFM1g==

                 "]], PolygonBox[CompressedData["
1:eJwtkCFvAkEUhPc2WELAoI8efwEFAl1BKH+AoFBUQVAEJOBoKpqAqGtSfFUD
ugkkIJANITmwlZV8k7fiy81kdmffu7jz/NTzzrkiZCCHafMdQAEdQxc9ggT9
H1n+CGv8DBL0A2zIVHZE3+CCfoMaugon8jm+7OzOFr/Al8L9Hf43sm698Un2
4i3T+T1Z3ttsyjXLD1TCPEuyM1zRKfTlQ5/OrNTlbRftlEVPQ79m+Obsh7dZ
NfMf/hr6tM8E3YQv9DvUve2oTGeG6NTb2/Jj9Gv4P9r5QF/D2111tNB3h0Qw
2Q==
                 "]], 
                PolygonBox[{{555, 554, 550, 118, 703}, {735, 229, 631, 627, 
                 628}, {496, 61, 681, 498, 499}, {460, 54, 457, 656, 657}, {
                 628, 627, 734, 206, 617}, {657, 656, 446, 34, 459}, {612, 
                 611, 727, 183, 598}, {728, 206, 615, 611, 612}, {663, 37, 
                 453, 467, 468}, {572, 161, 710, 554, 555}, {468, 467, 664, 
                 60, 471}, {499, 498, 522, 104, 692}}]}]}, 
             {RGBColor[
              0.7194083554823403, 0.5565332878691931, 0.39616250029153166`], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJwtkDFLQlEYhu89Ds3+BENBkOYC/QlNl0vQIiQOSWBLq//ARRscpak7NBq0
VJM4qKhgWdMFxybFQd16Ps47vDzPOXznnO87udp91HRBEBRIhnyzeIdVmCct
PAdHpI2fwTsyw2/hgzyFAxLhu9DHfANLOluB1+QNj2Fd/gOfyAU+p76Dn+MT
PIFd8kj+WJfhs9U6v38J09DX9/Ev1Vjth/o/hUfWN/gerkP/lr150H4Wb2gW
mylWbwv4qf5tjqnOdvGl3uo5/xd29hduNfsJvlKN1W60nzj/j3ZnEY7Vv809
1Fw236vzvVnvL3Lrt6X/sLor9Wl/+Q9ftj/D
                 "]], 
                PolygonBox[{{633, 632, 736, 737}, {594, 593, 577, 578}, {588, 
                 146, 168, 590}, {590, 168, 189, 726}, {660, 659, 462, 463}, {
                 658, 56, 55, 459}, {463, 462, 661, 662}, {662, 661, 465, 
                 466}, {739, 738, 632, 633}, {481, 480, 669, 670}, {732, 731, 
                 622, 623}, {546, 125, 146, 709}, {671, 55, 56, 482}, {570, 
                 147, 125, 548}, {623, 622, 738, 739}, {737, 736, 629, 630}}],
                 PolygonBox[CompressedData["
1:eJwtzz8LAXEcx/GfK93AQO4J3OYZUCw8Azcoi6IoyZnYPAMbZWJlMFIWjBbi
lBB1PADKZPX+5Tu8+nx/3+/d749dbjquoZSKIIgwixBsdFivyENAqST1juyx
7qOKCi5YMCuQRSypG+QNd2SRQRpdZhvSk3/yZA4O2mjBx55ZnTxynocBdYre
ifoq85qcr+8xwhBb5glmPvnGCxO9P70P9Vj2OctMf2PKfCbv1u//0i/Rm1I/
qJ+Iy/3XZAyW0HXU+H8/J3/TZCyi
                 "]]}]}, 
             {RGBColor[
              0.8913821713344373, 0.6169713701175339, 0.2950660718033979], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJwtkL1qAlEQRq+jkCbvIIqvYBGbgIXVbkAbiSRNilhEtBMEH0MsU4TgVj6A
IulCyviDAW1EkkAqxco2Z5gpPs7Z2eW7dzb30Km1JYRQIGlySoVQhQf4zos+
nodLnkv4EO+SOb6HNfKCL+AbaeKX8JZM8Ef4TRZ4B/55zwhfu2t3xXuu4czP
zYp1aecFbHnPFt6RKd4Qu6veORF71vkK9vx7Pf+GJHgEv9x19uS76E6fPo/V
6bzCB/gej/Az/PB7luHO58/4WMx/Uraz7r4Re6dz7Yi9/15sN92xKNalnfov
9Tw9d873R98rw6zunUv463d7xf8B3as9mw==
                 "]], 
                PolygonBox[CompressedData["
1:eJwtjzEOAVEQhp/JJvQ4ANUq6O0taDRCoiEk1BLn0FriCjYh4gpWVIQCjVZJ
5ZvMK77s9/55M/um1Js0x+Kcy0MAZw47vlto4Q9I8RNM8YGvazbCa1CFECow
h4haHY4Z5y5is7RHe19kT1jiK1iL3dWeN3nAuYH3IYdnxVyzD/WE8wa++A/K
+MzfP+Bd6MAN7lCEgu9J/BtDn2ntKrab7jMU+6fO0pl7sSz172/jMSzEdtBd
/tMsKlg=
                 "]], 
                PolygonBox[{{565, 124, 709, 568, 569}, {605, 167, 726, 606, 
                 607}, {484, 76, 479, 671, 672}, {597, 596, 721, 162, 582}, {
                 674, 673, 464, 57, 485}, {733, 732, 623, 209, 620}, {678, 58,
                  469, 490, 491}, {569, 568, 588, 167, 719}, {506, 505, 503, 
                 76, 685}, {575, 162, 711, 557, 558}, {722, 185, 601, 596, 
                 597}, {491, 490, 679, 81, 495}}]}]}, 
             {RGBColor[
              0.9260952056208521, 0.6852380140521304, 0.37089513742464164`], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJwtkDELQVEYhs+5fsM12Ix+AGVWSlJSNrp1R4nR7/APlLobi2JgMBgsUkZl
ogyUXQbP13mHt+ftnvc933dPMR13RpFzroBy6OOda8MXPHGQ4Zuwiqb4Mlyi
Fv5Jxkchv4I3tMMnsIe2+AGcKf/w4V7LZ3wbKm+9DUrxP867+Dn+Avdogs/D
t7o2M1G3Dxfqfn2YZ3OvcK1uDGu68wjvPuxje8XKlGBDGcvW5W2Xs/7d3uAg
X9Hb2A427w8dbSw2
                 "]], 
                PolygonBox[{{589, 166, 145, 719}, {521, 520, 700, 701}, {603, 
                 602, 723, 724}, {517, 516, 520, 521}, {484, 77, 98, 685}, {
                 701, 700, 543, 544}, {587, 166, 187, 725}, {486, 485, 676, 
                 677}, {506, 98, 119, 694}, {605, 188, 166, 589}, {677, 676, 
                 488, 489}, {675, 674, 485, 486}, {730, 187, 188, 620}, {724, 
                 723, 599, 600}, {576, 575, 558, 559}, {508, 98, 77, 686}, {
                 534, 119, 98, 695}, {566, 145, 166, 717}}], 
                PolygonBox[{{544, 543, 565, 145, 708}, {487, 77, 483, 674, 
                 675}, {725, 187, 604, 602, 603}, {489, 488, 678, 80, 492}, {
                 559, 558, 553, 119, 704}, {600, 599, 722, 163, 585}, {691, 
                 80, 495, 516, 517}, {712, 163, 582, 575, 576}}]}]}, 
             {RGBColor[
              0.9535670611882798, 0.7539176529706996, 0.45605788968366745`], 
              EdgeForm[None], 
              GraphicsGroupBox[{
                PolygonBox[{{600, 164, 724}, {708, 123, 544}, {704, 141, 
                 559}, {603, 165, 725}, {559, 141, 576}, {585, 164, 600}, {
                 701, 102, 521}, {517, 102, 691}, {486, 78, 675}, {507, 78, 
                 688}, {541, 123, 563}, {725, 165, 587}, {492, 79, 489}, {699,
                  123, 541}, {576, 141, 712}, {583, 164, 713}, {489, 79, 
                 677}, {521, 102, 517}, {510, 79, 690}, {586, 165, 715}, {675,
                  78, 487}, {561, 141, 556}}], 
                PolygonBox[{{518, 102, 123, 699}, {567, 566, 717, 718}, {544, 
                 123, 102, 701}, {677, 79, 78, 486}, {535, 534, 695, 696}, {
                 688, 78, 79, 510}, {715, 165, 164, 583}, {724, 164, 165, 
                 603}, {696, 695, 508, 509}, {509, 508, 686, 687}}], 
                PolygonBox[{{556, 141, 704, 534, 535}, {718, 717, 587, 165, 
                 586}, {687, 686, 487, 78, 507}, {514, 513, 691, 102, 518}, {
                 580, 579, 712, 141, 561}, {713, 164, 585, 579, 580}, {690, 
                 79, 492, 513, 514}, {563, 123, 708, 566, 567}}]}]}, 
             {RGBColor[
              0.9810389167557075, 0.8225972918892688, 0.5412206419426933], 
              EdgeForm[None], 
              GraphicsGroupBox[{
                PolygonBox[{{535, 120, 556}, {696, 120, 535}, {518, 101, 
                 514}, {707, 144, 564}, {699, 101, 518}, {586, 144, 718}, {
                 697, 99, 512}, {515, 101, 539}, {507, 99, 687}, {718, 144, 
                 567}, {567, 144, 563}, {687, 99, 509}, {514, 101, 690}, {705,
                  120, 537}}], 
                PolygonBox[{{714, 713, 580, 581}, {584, 583, 713, 714}, {581, 
                 580, 561, 562}, {716, 715, 583, 584}, {509, 99, 120, 696}, {
                 689, 688, 510, 511}, {537, 120, 99, 697}}], 
                PolygonBox[{{512, 99, 507, 688, 689}, {539, 101, 699, 541, 
                 542}, {562, 561, 556, 120, 705}, {511, 510, 690, 101, 515}, {
                 564, 144, 586, 715, 716}, {542, 541, 563, 144, 707}}]}]}, 
             {RGBColor[1., 0.8972344714340326, 0.6510646339388111], EdgeForm[
              None], GraphicsGroupBox[{
                PolygonBox[{{705, 142, 562}, {511, 100, 689}, {515, 100, 
                 511}, {707, 122, 542}, {584, 143, 716}, {716, 143, 564}, {
                 562, 142, 581}, {542, 122, 539}, {581, 142, 714}, {689, 100, 
                 512}}], 
                PolygonBox[{{539, 122, 100, 515}, {714, 142, 143, 584}, {706, 
                 143, 142, 560}, {538, 537, 697, 698}, {564, 143, 122, 707}, {
                 540, 122, 143, 706}, {536, 100, 122, 540}}], 
                PolygonBox[{{698, 697, 512, 100, 536}, {560, 142, 705, 537, 
                 538}}]}]}, 
             {RGBColor[1., 0.95, 0.75], EdgeForm[None], 
              GraphicsGroupBox[
               PolygonBox[{{536, 121, 698}, {538, 121, 560}, {698, 121, 
                538}, {560, 121, 706}, {540, 121, 536}, {706, 121, 
                540}}]]}}, {{}, 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{698, 538, 560, 706, 540, 536, 698}]},
               "0.0018`"],
              Annotation[#, 0.0018, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{689, 512, 697, 537, 705, 562, 581, 714, 584, 716, 
                 564, 707, 542, 539, 515, 511, 689}]},
               "0.0016`"],
              Annotation[#, 0.0016, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{687, 509, 696, 535, 556, 561, 580, 713, 583, 715, 
                 586, 718, 567, 563, 541, 699, 518, 514, 690, 510, 688, 507, 
                 687}]},
               "0.0014`"],
              Annotation[#, 0.0014, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{675, 487, 686, 508, 695, 534, 704, 559, 576, 712, 
                 579, 585, 600, 724, 603, 725, 587, 717, 566, 708, 544, 701, 
                 521, 517, 691, 513, 492, 489, 677, 486, 675}]},
               "0.0012`"],
              Annotation[#, 0.0012, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{672, 484, 685, 506, 694, 533, 553, 558, 575, 582, 
                 597, 722, 599, 723, 602, 604, 618, 730, 620, 733, 607, 605, 
                 589, 719, 569, 565, 543, 700, 520, 516, 495, 491, 678, 488, 
                 676, 485, 674, 483, 672}]},
               "0.001`"],
              Annotation[#, 0.001, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{660, 464, 673, 482, 671, 479, 670, 481, 503, 505, 
                 693, 532, 552, 557, 711, 578, 594, 721, 596, 601, 614, 729, 
                 616, 619, 630, 737, 633, 739, 623, 732, 606, 726, 590, 588, 
                 568, 709, 546, 702, 524, 519, 497, 494, 679, 490, 469, 466, 
                 662, 463, 660}]},
               "0.0008`"],
              Annotation[#, 0.0008, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{570, 548, 545, 523, 692, 499, 496, 680, 493, 471, 
                 468, 663, 465, 661, 462, 659, 461, 658, 459, 657, 460, 669, 
                 480, 684, 504, 529, 531, 703, 555, 572, 577, 593, 598, 612, 
                 728, 613, 617, 628, 735, 629, 736, 632, 738, 622, 731, 621}]},
               "0.0006`"],
              Annotation[#, 0.0006, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{547, 525, 522, 498, 681, 475, 473, 665, 470, 664, 
                 467, 453, 451, 651, 448, 650, 447, 649, 445, 648, 446, 656, 
                 457, 655, 458, 668, 478, 683, 502, 527, 530, 550, 554, 710, 
                 574, 591, 595, 609, 727, 611, 615, 626, 734, 627, 631, 638, 
                 741, 640, 742, 641}]},
               "0.0004`"],
              Annotation[#, 0.0004, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{444, 647, 442, 646, 443, 654, 456, 667, 477, 682, 
                 501, 526, 528, 549, 551, 571, 573, 720, 592, 608, 610, 624, 
                 625, 634, 635, 642, 743, 637, 740, 636, 639, 643, 744, 644, 
                 745, 645}], 
                LineBox[{449, 450, 652, 452, 653, 454, 455, 472, 666, 474, 
                 476, 500}]},
               "0.0002`"],
              Annotation[#, 0.0002, "Tooltip"]& ], {}, {}}}],
          AspectRatio->1,
          DisplayFunction->Identity,
          Epilog->{
            Opacity[0], 
            EdgeForm[{
              Thickness[Large], 
              GrayLevel[0], 
              Dashing[{Small, Small}]}], 
            GeometricTransformationBox[
             TagBox[
              
              DiskBox[{225.4402528543922, 106.63255259388416`}, {
               28.063251553966385`, 13.23241443900696}], 
              "Ellipse"], {{{-0.9095385198304338, 
              0.41561963493639664`}, {-0.41561963493639664`, \
-0.9095385198304338}}, Center}], 
            Opacity[1], 
            RGBColor[1, 0, 0], 
            PointSize[0.03], {
             PointBox[{230, 100}]}, {
             InsetBox[
              FormBox[
               StyleBox["\"Posterior\"", 20, 
                GrayLevel[1], StripOnInput -> False], TraditionalForm], 
              Scaled[{0.95, 0.9}], {1, 0}]}},
          Frame->True,
          FrameLabel->{{
             FormBox["\"\[Beta]\"", TraditionalForm], None}, {
             FormBox["\"\[Alpha]\"", TraditionalForm], None}},
          FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
          GridLinesStyle->Directive[
            GrayLevel[0.5, 0.4]],
          ImageSize->350,
          Method->{"DefaultBoundaryStyle" -> Automatic},
          PlotRange->{All, All},
          PlotRangeClipping->True,
          PlotRangePadding->{Automatic, Automatic},
          Ticks->{Automatic, Automatic}], {560., -183.75}, 
         ImageScaled[{0.5, 0.5}], {350, 350.}]}, {}},
      ContentSelectable->True,
      ImageSize->{758.6666666666666, 379.5},
      PlotRangePadding->{6, 5}]}
   },
   AutoDelete->False,
   GridBoxDividers->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
   GridBoxSpacings->{"Columns" -> {{3}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"With", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"\[Mu]x", "=", "2000"}], ",", 
     RowBox[{"\[Mu]y", "=", "1200"}], ",", 
     RowBox[{"\[Sigma]x", "=", "200"}], ",", 
     RowBox[{"\[Sigma]y", "=", "150"}], ",", 
     RowBox[{"\[Sigma]xy", "=", "1000"}], ",", 
     RowBox[{"xdat", "=", 
      RowBox[{"{", "1700", "}"}]}], ",", 
     RowBox[{"ydat", "=", 
      RowBox[{"{", "1000", "}"}]}]}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"fig5", "=", 
     RowBox[{"GraphicsRow", "[", 
      RowBox[{"{", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"plotcontour", "[", 
         RowBox[{
         "priorpdf1", ",", "prior1", ",", "\[Mu]x", ",", "\[Sigma]x", ",", 
          "\[Mu]y", ",", "\[Sigma]y", ",", "\[Sigma]xy", ",", 
          RowBox[{"{", "}"}], ",", 
          RowBox[{"{", "}"}], ",", 
          RowBox[{"Epilog", "->", 
           RowBox[{"label", "[", "\"\<Prior\>\"", "]"}]}]}], "]"}], ",", 
        "\[IndentingNewLine]", 
        RowBox[{"plotcontour", "[", 
         RowBox[{
         "posteriorpdf1", ",", "posterior1", ",", "\[Mu]x", ",", "\[Sigma]x", 
          ",", "\[Mu]y", ",", "\[Sigma]y", ",", "\[Sigma]xy", ",", "xdat", 
          ",", "ydat", ",", 
          RowBox[{"Epilog", "\[Rule]", "\[IndentingNewLine]", 
           RowBox[{"label", "[", "\"\<Posterior\>\"", "]"}]}]}], "]"}]}], 
       "\[IndentingNewLine]", "}"}], "]"}]}], ";", "\[IndentingNewLine]", 
    RowBox[{"fig6", "=", 
     RowBox[{"GraphicsRow", "[", 
      RowBox[{"{", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"plotcontour", "[", 
         RowBox[{
         "priorpdf2", ",", "prior2", ",", "\[Mu]x", ",", "\[Sigma]x", ",", 
          "\[Mu]y", ",", "\[Sigma]y", ",", "\[Sigma]xy", ",", 
          RowBox[{"{", "}"}], ",", 
          RowBox[{"{", "}"}], ",", 
          RowBox[{"Epilog", "->", 
           RowBox[{"label", "[", "\"\<Prior\>\"", "]"}]}]}], "]"}], ",", 
        "\[IndentingNewLine]", 
        RowBox[{"plotcontour", "[", 
         RowBox[{
         "posteriorkdepdf2", ",", "posterior2", ",", "\[Mu]x", ",", 
          "\[Sigma]x", ",", "\[Mu]y", ",", "\[Sigma]y", ",", "\[Sigma]xy", 
          ",", "xdat", ",", "ydat", ",", 
          RowBox[{"Epilog", "->", 
           RowBox[{"label", "[", "\"\<Posterior\>\"", "]"}]}]}], "]"}]}], 
       "\[IndentingNewLine]", "}"}], "]"}]}], ";"}]}], "\[IndentingNewLine]", 
  "]"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData["95981.98354630986`"], "Print"],

Cell[BoxData["3936.3359683368612`"], "Print"],

Cell[BoxData["96585.54998820586`"], "Print"],

Cell[BoxData["2371.326176321184`"], "Print"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"label2", "[", "txt_", "]"}], ":=", 
   RowBox[{"Graphics", "[", 
    RowBox[{
     RowBox[{"Rotate", "[", 
      RowBox[{
       RowBox[{"Style", "[", 
        RowBox[{
         RowBox[{"Text", "[", "txt", "]"}], ",", "20"}], "]"}], ",", 
       RowBox[{"\[Pi]", "/", "2"}]}], "]"}], ",", 
     RowBox[{"ImageSize", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"18", ",", "300"}], "}"}]}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"exportme", "[", "\"\<bivar-correlated-update-large\>\"", "]"}], 
  "@", 
  RowBox[{"Grid", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
        RowBox[{"label2", "@", "\"\<Uncorrelated\>\""}], ",", "fig5"}], "}"}],
       ",", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"label2", "[", "\"\<Correlated\>\"", "]"}], ",", "fig6"}], 
       "}"}]}], "}"}], ",", 
    RowBox[{"Dividers", "\[Rule]", "All"}], ",", 
    RowBox[{"Spacings", "\[Rule]", "3"}]}], "]"}]}]}], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {
     GraphicsBox[GeometricTransformationBox[
       StyleBox[InsetBox["\<\"Uncorrelated\"\>", {0, 0}],
        StripOnInput->False,
        FontSize->20], {{{0, -1}, {1, 0}}, Center}],
      ImageSize->{18, 300}], 
     GraphicsBox[{{}, {InsetBox[
         GraphicsBox[GraphicsComplexBox[CompressedData["
1:eJxl2XlcTP37x/GEZInEHXeh3Z07smZLupJdJZGlQotdSLKHQbbc1Zmt1Mw0
ZwYtlhpbilsdJNkypUSWji1ucRtLjC2/c/++PnMeru5/PF66OWeeZ8o577EL
XxEw39jIyKhPcyOj/37933+p8P+/2P71v19p1JD2a7OoBbJf21b+azOoQxW/
tlE6Oj5qUKLjowb616ZQs6j7qdD5o9aitlX/2lGoGdTE0zzh5+tBTTxJs6iJ
J2niSZpBTTxJE0/D8VETT8PxURNP0hRqFjXxNJw/ai1q4kk6CjWDmngaJf58
PaiJJ2kWNfEkTTxJM6iJJ2niaTg+auJpOD5q4kmaQs2iJp6G80etRU08SUeh
ZlATTx3y1CFPHfLUIU8d8tQhTx3y1CFPHfLUIU8d8tQhTx3y1CFPHfLUIU8d
8tQhTx3y1CFPHfJkk36+HtTEkzSLmniSJp6kGdTEkzTxNBwfNfE0HB818SRN
oWZRE0/D+aPWoiaepKNQM6iJ5yLq5+tBTTxJs6iJJ2niSZpBTTxJE0/D8VET
T8PxURNP0hRqFjXxNJw/ai1q4kk6CjWD2vD+RJ4s8mSRJ4s8WeTJIk8WebLI
k0WeLPJkkSeLPFnkySJPFnmyyJNFnizyZJEnizxZ5DlT+PP1oCaepFnUxJM0
8STNoCaepImn4fioiafh+KiJJ2kKNYuaeBrOH7UWNfEkHYWaQU08tchTizy1
yFOLPLXIU4s8tchTizy1yFOLPLXIU4s8tchTizy1yFOLPLXIU4s8tchTizy1
yHO86OfrQU08SbOoiSdp4kmaQU08SRNPw/FRE0/D8VETT9IUahY18TScP2ot
auJJOgo1g5p4MsiTQZ4M8mSQJ4M8GeTJIE8GeTLIk0GeDPJkkCeDPBnkySBP
BnkyyJNBngzyZJAngzyHin++HtTEkzSLmniSJp6kGdTEkzTxNBwfNfE0HB81
8SRNoWZRE0/D+aPWoiaepKNQM6iJpwZ5apCnBnlqkKcGeWqQpwZ5apCnBnlq
kKcGeWqQpwZ5apCnBnlqkKcGeWqQpwZ5apCnBnk6S36+HtTEkzSLmniSJp6k
GdTEkzTxNBwfNfE0HB818SRNoWZRE0/D+aPWoiaepKNQM6iJJ408aeRJI08a
edLIk0aeNPKkkSeNPGnkSSNPGnnSyJNGnjTypJEnjTxp5EkjTxp50sizq/Tn
76MmnqRZ1MSTNPEkzaAmnqSJp+H4qImn4fioiSdpCjWLmngazh+1FjXxJB2F
mkFNPCnkSSFPCnlSyJNCnhTypJAnhTwp5EkhTwp5UsiTQp4U8qSQJ4U8KeRJ
IU8KeVLIk0Kepsk/Xw9q4kmaRU08SRNP0gxq4kmaeBqOj5p4Go6PmniSplCz
qImn4fxRa1ETT9JRqBnUxFOAPAXIU4A8BchTgDwFyFOAPAXIU4A8BchTgDwF
yFOAPAXIU4A8BchTgDwFyFOAPAXIU4A89chTjzz1yFOPPPXIU4889chTjzz1
yFOPPPXIU4889chTjzz1yFOPPPXIU4889chTjzz1yDMq5efrQU08SbOoiSdp
4kmaQU08SRNPw/FRE0/D8VETT9IUahY18TScP2otauJJOgo1g5o7/3RVs5PH
2iRAX03V2JgtTT+/MT/kLsrgvh54xmcYhKPPbzivs8bdx/jtSwCfVu+CDg1o
+vmG064er0778J8XZf428Gy4Lf95UOBTm7LVNvznQaGe4REdx/OfB9V9euNV
u4f/PGiLSfxM51cJoPfLqG/+Gn2ewV3fO5YJvvcyEmHDrbbz68c0/fwgwD3w
ZIgZ//lAhbGvbO+zRChn+wrdn6PPDzif46+jWjoX858XHHDvO8KqmP+8QGPM
VLV6yv35Arh4rBF9fsBdv/IO8r7z5yXC5ldL5l+IQfs/9/58eTN11/MdSVDe
f7Gr6jDa6zlfO7W9MkeSBLdm3lSXrWq6z09YviqozR/8vr4gKy56ki2/r+97
eelp4ZYk2J1kNIEqRfs69346X7B4h3XrJLDxnJdUd5Pf0wvyvsbeGYX2bs5v
7YY7pUobCj6vfbrwYyHav7nzGZdq5Zc2nYLHwy4cGT6s6d7d8jmUdXXm99kv
2/pNPG7B77N7TRxisi34ffbliR6jbf/g99lvJo2LC6ZQYLUy3qkmuOnefWa5
q9k0EwpivnaKyXJtum/XHajYMY17fdHpU3bus1D/+nXu58euhV6HQyIpeH1u
m/jcO7Rfc++vhKDfjKZnUDCqMM7kkQ/aq7nrNVu8ZGR6NgX3Z56Z+2ot2qu5
1/82+dARu1oK9ixx+3ziO9qvOQ/IaS1/xPAeZq0SelQxvIeuWbPgCw8oGLy5
TciSOrRfc9f7zEjPj1QqBdetbkwdXtJ0r96daOxns4SChPNXM8qjmu7TYZ9e
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
           "], {{
             {RGBColor[0.148, 0.33, 0.54], EdgeForm[None], 
              GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJxNl0lwVkUUhd/rPyizDAIGgaoIJGFGWZFJhq0GCAE2rkCSECldSRRCkp0y
hZABypIABhECiiPgUKCoJbhT2IlbSxzXlBrLc+p+f+Hi5Hb3333v7Tucfinb
+kLD8ynLsil5lhUkZwgaZl7r0Z9jmhxGviO8LRxFXhCOCx8I7wsnhI+ED4Uu
9g0IQ8LHwhVhm/Cy8JLwrLCb+QahWWgSWoQOYa/1yHarZGeK39qFPUKZnN0l
+arWt6KvTVgnbEf3IL7Yv5PCJfzrFc4JZ4WD+PeGcIS1t4Ru4U3htNDD2hnh
EGvFM77TZeEA81NCRSHi0ptifhnbA8TsvNAnDOPHPvxz/Pajw/N+9npfuTBJ
mCw0ECPHa6Owg/lR2XtXcpHsH0nhg325rnGX8vm75q+kiJvj91QKnfck+1LE
q1Lre4lpaeF+7ss1PpTCv3kaX5OcJZ2va+0rjR/T+KTGX2s8V+NTGn+r8XKN
T2t8Q+NlGg9pfCDFnedKT2Me+fUdmrW+UnJcIWL8CXWzh9z0kP9e5p3EtJ/z
ndRNM7XTjuzjzKfCWPnwWop66Safrr/DzHdRE87n/hR1vC+Fr/b5IPXYhb02
dBzEdj/2vhBmy9Zx7W+UrBOeFJYKjwilwjxhovBQFrHx2kxhjjBaGJNFjB8Q
HhQGU/z2mXTP59wk4UetX/NZydWSi4TFWeRhAjaahQ1Cg3BVOCucEyrd+8LU
LHI4njNlwjjmVfhqmwvY+zD3ME+YNx4VRuFrNXvLhV6hXdgr9CE7hAphMrav
5mHvS+dTsjOLei1Fdwnxq8R+LecriVcJtmcTp9HcrRebd6S3SfKXPHJgHQuF
Gny0riVwn+/0vfatl/zB9acL7nSMNR6TIm4zJNdyxvk8L/Rn4bvv2kS8Xfeu
/891dqowovG/wl8p5BrJX/M483ce+anGr5sp9I1o/VYKG2NT+FXFvm/yGH+X
R15riM1GZB2+rCf3a6gL+31RurZI3s4jFs7ntCz8nUk+vXc6cRnmzjfNNdSR
7exAusY3C6uyqMEtyDXk3PHwuZ3s8+/PCZuYO9+trDk2d50vaqUFO3+mWFuR
olZcMyccJ+Gi71GIfE6itsyTNUKtUJcH15gv/TbU5/FWbPzf7zuYN8IJ29hb
7X6Dg0cVIpf1Kc6br6qEaYXQ+aJzxJrPXc+jZ927tlNhjoWvG7BnLtqKve34
ZR1tKXzZlYILzYl+kxJ1WnyrZ5Cn+disgjeHOFNCTt1P5lb73JKit0rRtRK7
voPfn/1wYGsiNim+ESq5wxCcdwi+3cB9dhMz38Nv2D509cHF5sjb5NY5nkIf
uwfv8R49LfmH8I9rKEUOG7Cxghp4gr3l5OYnzX/W+uN+r4T3tLZYF7yj8S3r
T8EH5gX3cEkhzj2Toi+dU9/vLvU3Qg1VZPdryrLIu5bmxFpyaP8GeBP8Nhym
hnbzJnTwm9+h4rvkN2wP81H0nPNURf7X8VsTMXa8/T4V35w2aqeT2m1Fb3N+
/xuqhd+62WufbsBj5jPzpXmz+M7Mwo/p9L/fEvP9AvLkWlkKhyyix1dRg0s4
s5i+Xw2vLOS8a20Z5z03F9fR3x3wRD314174LQ++MAc73uY8891EYj8Xm2ux
V+Qj6zMXmqPMe6Xwp3m0yI/+7VYeZ81t9qOR3zbBQ63cbTNr1mUea2JtJ/t8
zy2sVbNvPTZaONPM/dqJo+3Vku/lxMVviP0cptZq0HeeGhqg/9yPrjt/y56g
zy7wu7+5h+k3n7lMP/vb1N+wPdSdv4sHOX8JHafgl27q9zR15vk5atd6r6Cv
+A18gNr096J5rCNF39Ryhwnkyt8XlfSZ+83x7crivS9+H7hH/X7PoS6L/28c
g3d8b/PBePSVcX6A+Plb/zh3O8td7fd/Uf9MPQ==
                 "]], 
                PolygonBox[CompressedData["
1:eJwtk0lszlEUxd+7/1oYFhoRNSatllLzzreQYIuISGzYVGJsWKmN4duhRSj9
TFXDxpAoVhK0iKl2tDvtVqSmvTF+J+dbnLxz7n3/9z/v3vvqW/dv2hcppTWg
BlxHzGVtBK9zSj3o2fA54AX6EnoCfCJ4ip5UpFRiXQl2krsIxifveUzsGroh
+cxX6CvoWclnPkf3ouuT97xEL+C8Xtar4By522Fva8EQsSPoVtaDoIG909C3
yPWDOvgJUCa3B5TlFdwl1w0GdRb4Bx8DP+B/s3Nl3Q89ht4BPwS+wM8Tu8d6
AZyBn9Q/sj3K67fsb/eCR+R+Z3/bBf7ATxOrZHvqgB8H7fBO0FTYs7wPgRH4
BjAl2+Mv+Ef4xmRPI/BnYBl8Jrgc7pF6VQJv4O+zub75AJ/BngH4HWl4MxhO
jo2GPcqravg23FP1Vj3ph2/TN9mexuF3MLsXS8ANcqPoNvgW0BeugWqh2Fdy
B3Qn1u3ywvfL0Z9VG/AdPq9wbSvVWi1E92XXXLVvQd/PjnXLS+HZ6AFn0YvR
D+EP1CN0VzinmHLyKK9Ldb/sGqgWmonp8JvhnGr6jvxPdC3rZLAuXGPVWjM7
QGxR4X/JUyV8J91NM3k4PJOaTfX4GPpoeBY3a2bhK8Kzpx6oF/PDvVdNPsHX
h//dBGo4a2uYl6pvrT181irNOHx3mDdXe9XIno7sGe1Erw7XurZ6N82cZk97
TqF3hd+uejSV3JPst643rLc8nN1bvUG9xf9SBIFR
                 "]]}]}, 
             {RGBColor[
              0.5419757642621978, 0.49417678616243377`, 0.5004679213282927], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJxNVklsllUU/d79JCZoZIEFBRXRitBqIgj+uLJ1XNDWxMRZC1pwoi0oVAUU
bG2hTtAqAi3GKQFNUOPOpFYBJxA1FLEODK5o1TK4NBUVz/GcP7g4uW+437vv
Tud9E+9dcFNjZFn2I5ADszEpT1lWC9kMOR+oB54KjZ+BbPFaA9AGLAAWAl8A
V+KMzyH3Q68X47MgnwBmY20sDLyB8bVY34n5YaAZ4w+wNgrjYYz/BDZgPgHy
Q6xNhbwBuB5YivVarI3BOX2Y91AH2GNJe0/7Xo3AOOhVQzbhu+N0EuNrIGsw
nAvUZfLjFuBW4B5gFlBlv2/23mOh8QrIYZ6F7yohW22H/hewVg1UATMz2eCc
8bjR8xLonch0j6W+wzzgYcxXASuBR4B2z3tgoxH7P2O8JHTHxyErfV/ejXFt
AhYDa6C7JNPZbaFzz0MMKqxLH1aF/Lwgl68cz/F5DelkPOodg1qfvQhYnylf
LcAnIXkM678m2R1Oyu0dwO2ZamMj0J2Uly5gAzAjU37Pd/xZT82OZat1Fzoe
xfpq816D91tss85xfCdUJ19h/f3QHfqT4neb71PnnBTzX+Pc/JS094ttdPuu
jBHjsxzn7UnS7YPsCPmxNhTrjkyxfwjzq7D+aCivy5wLyk7rbcfeOsi/k2p2
E7CZdRvy8xzYnEnbwIVJ500ByuhzKEbjofNX0pnHnVfqFfNMyRop8VkP4Lv9
SXfal9QThaS9ub4jY3k69EuxdleoJ5nrI+5R5p73PiVXr1aH7nRmUl2vDNXu
BOzfHbrzg5B7gS08G3IoKRa/Mc6hHJ+bKz/MUwPwXkgeSLrLGUn2KhwDctPu
pD77AfIg9LdhPB7yWXPW6lDdtbmGJmP+HXSmhXLb6r2hTOv9wEdJ9dgLORDi
lIshBzNxDecDwG7Pm9x7c9wftZ6/HfJnr23Tx2J/UzJGmW0ftu2tmXyYkqv3
nw/x4CHbbPd37MGLctlupy8hftyK+e+h82aw9kP1E7n6jP023f12heeLQv0/
GjpH7edUcxttDro35rlXutx3re7hFs8vzRXrF/HtC6G78Y4d/6v9T5P48VXs
H0zqTfbovlA8J0HuCtXYP0lvBrl8bCjHzPW7Ib7vcw74xpBbXw+9B4z/MuYt
FM9xod5a4777LImXX/P7VumaqnJMCuYt8td15gbq08b3SdxCjvnG/PVWiEsK
1jsUytdl5iHmZRqwI+lMvnv9zvmQ88Tx9Dj5htG3Y6E34mr70e8a5TesmxPW
G3SetiXZ2Rh6P0e5Z75NqkPW43aML8f4FfZB0lu6BePnQrVbivgdcI+wVwrm
CL6DXybF402sH7GNipBt1kqxTin/e7+TYn4qdL5OqrvN5ooK81SfcznGvpaY
RzpDfTLZ9UNeZA53+f6bQnpl5sT7QxxB3toR4kPyIr9hTGljtTlhUi475f7+
NNcb667eb+r8UOxKzb1nOwesqZdCfcgeHe23czHWXg71Rnku7mCPdYXeBvZJ
GdbXmXcuwbgnqSf5j/NkKM78T1lvzmI/HU3iQ77/jEGv/RmRy2/y68hcebrP
OoxXp3tjwDn5w/7Mgqxyb/P/hbxAfriTPOOY1kDuNFePhPw4qYa7zSV8K2jv
X+W1PK0=
                 "]], PolygonBox[CompressedData["
1:eJwtlVmMzlcYxv/nfMTWcDPW2k1G0Quqqq6UWi4Mk0jEGlvTUjqj1lJUZ9RO
bLGMtamlQXBrVyqWorSM1HpF7VxixPJ78pyLX77nPe/5n+U97/t+LUZP6F8S
sywrgSowFKNlyLLOUDOXZW1hPboc1uB7yO9M5n0NN9G3oBhdBgfw14ND6Etw
A90X6jCnEvsluibsQf8B/6Jf41uZec1H6G+i9y6EPPbOQavgMw3Bdw7WMncd
1ELXSv58GIPdER7hewfP0KVQjG8gzEDPhOHoydCcb5djlwXfcQW6Pdzl21fw
BP0pPEZXQBt0QfTdNOcuehVs5Nv50Jr1NusbfB3hBGNTsPvwOxIa4B+P3Q3d
DkboLNG6LhShW+V8timwBDs/Zz0VlmFvil77E8UwOOaKfSk8Do6pYnscGqL7
QR7jbaAqaz0JnqsYntDZo9fqAMfwFTCnNDgmik0fqB0cY71Fu5xzYQOsxVcD
dmZ+wzPo6rAjcw5cjr6T7pbBa/SX0VoxfY6uz3ojgt/kx+gYKVYam4U9Fj5P
++utuyln+PZ/eIreDT3RveAqc4ZF54JyrgrzW2P/g++I8hX9LDheytmD2Huh
EN0X/sO3H3swegjcxu4QvZfWuBedAxUpf28rdnA1c84p9xZGv5Xu0IL9l2os
5ZvedhH2+OAYL0Z/yFhJcI4qVxtjTwgeK8OuBsszx1Sx3RN9195wjTnfRr9t
VxinvVVzwTGry1rTon0D4Ad0E8a+D95jLnYz7EnoiTBP50n5oxq9gn4bXGuK
2Uns+9hfoWfAA/SrYK0zVqJ/Ys6oVL8NWbtpzmtrz1+ia06x0J7zsc8H30U5
uD36TYpTP3qKb2eqp05wEfskfIZuDkdTjBVr7bmAuVuVL/g6w5+MHYZmmddQ
bepMOptiNBv7g9SPVA/qLd2je4dqphK9K+XDIPUrxrZEr60z6Czl0WfRHodS
D1AvWKC+hu94cG3pzbZhf5SzTzmxWvkfnZuqIdXSleC9FIN92G+Cz6YznsX+
OOfaU89Zh30juBcXKUdTz9T91HMm478THEvdQbndKLo3KGdvqVZTP1F8LjD3
7xRf1cQl9O/RsdeYfL+leuuheg++k+6msXPY06N7rXrcd9E1pdpSzlxHXw4+
axc4HfyfoP8G1XQh+mzw2jqvYv9r9Fy96Sl8FcG1qf1U+9tT/9Id/sI3JzrX
VWM/o7+I7uXqYS/Q7wGoytV9
                 "]]}]}, 
             {RGBColor[
              0.8405214368216596, 0.5990969905763021, 0.32496503394509474`], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJw1VEtsjGEU/b/7Rwgdj4RW0qJNREJGWIwukXboTLvwWJlqx7TBhhivZOoR
ieeu1vZeCRqJV0i6aWNDUYmiJOqZEintyhQJzsm5Fif3fPe/3/3u86/rLG7e
Y1EUHQNiIAtsA/LAA3y4BlkBeQ/yPHABOOuS50F8uws5D/KpST8N8kuIoi7w
z5Az3A/99QPnwP8E2dF+qskX36CvZzj3QVa7fAm8AL7hzknaQf/GpFtqOlP/
Hd87I71bAn4FxfrTYyHvjhRLfyTfr/zOMORDIMPc6B+8CH6d74C3gV812dG+
B/wJeAv4ZfAh8K3gV8CPA1twrkZBv4KXoV8D+Ri6ZvBL4I+Can0R/AdQwW+Q
40AAbzTFyFh7Ir3TARQi+Sh4nzLeq3ZgyGSbYGxeS9aU7yeC3jjksTHG1R4b
YxzwvkSm/Ol3AHZjXnv2oAP65dAVTHWnPgU5avq+DHI7kGJvkfsnj2MJ5KDX
ijVjflVAJbDJxDdC1kLWA6uA1z5zlf5mI9AQNGfMa7Hf47ck5wLnVsgFsQaZ
vnKmOBjPDvCPBD6vgDwB5KCviTUTJZ+b9ew1exnUS/b0Ofg617V6LLzLOv42
5bHBNCucmRGc025Luyag3f2OeF9r2AfPmfGOBsVQhrwP/SnwCfDTpnuLYHPG
5KcWfDIo7im0NcW20HNt5mwF9aTPZz3vs5L1ve32fZgbq+Y74eNDkN0t8PdB
M3UTfH4snwfB+bNgbgn2N2gO77CuQfN4G3zM67wS8rAplirY94Lvhf4dzkdN
Puk76bPAfo4H2fR6rqxdBnjrO3jDc2U/2KvpuF/H3rD/pjmPoTtgyov55bxn
ae9Zg59LvlPc590mfZfPUdrfaPN3mtwv/beYesD4jph6z/jznlPKZ5jvs7+M
b78pjznug3s3Cewz+Z4N/YRp3+pNtcz6rv8NmgfOxf/95y4VTTHOxN2yyd9a
3jXVdBfrbYp/Vqz8kr4z/wAtC7Cv
                 "]], PolygonBox[CompressedData["

1:eJwtlDdM1lEUxd97nyUWrAkM2EjUwWh0EEY1ggq6WBaatKiLBSyJWCZBN53d
bYOS2GOZxA0UTESIJmBB0cQCk6Am6u/k/IeT75z73v+++8697ytqat55KIUQ
doFJYANigt9h8A1eA4piCDNByoVQh86HrwT18DxiZfBScBA9DV0MXwv2oOeh
K+Dl4Aj6HqgndwP4SGwfuiT6jOnsvaUzWasFb5UH3a9aQDH8DtgNrwMfWC9J
XhsAI/BZ5NgUXZMuVgpidM1/4NtBQXSsDP4YNPNtCxjNYlpTzjH4NbANvhU8
Jz6b/Jujz2jWmjyI9mwcfjV5bwV4RnwO+7dEf9PC2t3k2uXBMLEG9KromnbA
7yd70wg+ZZ7Le51RzdqV5NzloIvYU3QbvB38Q1ehl0T3QL1Yk9zLHvmtu+Xs
tfZUom8ney1P3xObm3OvVPNh1qaCy6xdAL+JrUj2uhMMwRck8w7QB18KHmTn
LYNPBufhl8CU5BnRrOjOjfAbWT9VQz+xDnRTdv8B9P7kWdsIDsCPyd/sfvOp
NR/9MLjGF8kzot6ph6PwcX6PB9cwAe+O9k5n6uz12hPs8c/knMqtmTyKLgRP
gmdwEH4zeVY0M4PsCeiLwT1QL75m70c518FfRc+zvtG3upPuppnqhZ/S/bP3
kc/ZecleKme37ppcm3qm3l3P+qWcfXqX8jC4xpfwReypIV4LzqJ/RNemfJ3o
1mQvK8EJ+OpsPlSzai/Mea0KnEEvRFdH52xXv3NeU6wtuWbVrjd+Er03+e1L
6+3/ip6dVvAF/ih5VlXTd/TinGuVB+dY+xtdqzzoQo9F75ffequaIc2SZqw3
eY/2yoMZyTPXk/1/DSe/IfmtGRiBD0XnUk7VUpD9P2mmTqPfRfdK/uq/6HN0
7ZrJ1/DlWX7N3Bv4fyFIoCc=
                 "]]}]}, 
             {RGBColor[
              0.9381896340864412, 0.7154740852161028, 0.4083878656679675], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJxFk7tOVlEQhfeeoyRCQNQGiGAM0FjwqyRqozYWSuUFVDpvlIii8gbQ6AtA
Bw8AUVQKEyUxsRFjYww2IBdJjEFBzS8FCt/KTGKxstaeM/sya+YcvNF38bal
lDpBAbpYNOaU/sIVYIzYTvgtGEdXw6/BMDrB7yNHuVPwaPK1vk8k37PDPL4P
XuHsAfQX+AXrQfRaxB6Bh2Aju/4DfzQ/pwYuWNeDOrDO+jvxE+a5Y3H3Eut3
cCv8G1SSew6eA7PED5mfUQJtUafqvRz36N0jYF51wk1wJ2gg51Lw4djfGne1
RO3SM+Ax67vwZ3L2Ymo73EPsDDD0efi6+f298BswRP7P7Ll6TxMoEy8TP61a
WN9HT6Nz5Guf/HqQ3L91cvrhl8R/oe+hX5l7JK+Ow7t4zwG+dcf9deFpY9x9
FHwyr6MZXgQL6LbwfzX5WaXYJz/K2d9RyMvwUX07pf3ob/AF87uuBcsHnTca
PVcPZ+Ps1fBRexeCZ8Lfq+yvYl8ufIZU93P735tNeW9exx5yVszPOwbfBEeI
VxTuu+qvRm9l77vm+mzMjGZHP4bqrCHninlP/sH95l6pt33m87AbvZy9F8+I
3TL3WX7fiXtrC39LEfWvxTxoLhajX5PyO/r4BD2ffZY0Ux9iJvfDP7L/O/qH
vsacnDT3Rf50oJdiZp6qn+Zzbeb9kKcleBt6R3xp
                 "]], 
                PolygonBox[CompressedData["
1:eJwtk0tvzVEUxc/Z/1LRKIIEaSvCiKSlEkYYSeiIxnNG6VR76/ENdFJfgBkf
gMSrk3okdKRioklNVG+lCQla9NZA1G9ZZ7By1zpn3332Xnv/t/cN9F6OlNJh
0KRfRIPfGfAFvgbcg78E7+BHQJVT+oZe0H2VUie6CyjRcRDwzeAE/BzYBl8N
ErGtlWP3gAHuesGW7JzKfbC834JehHeBOvoNmIXvB1+T35iH7wATpd46/Afn
w/AaeBp+U28r31n0C3CV42tgkbNW9H34bTCh2sP8BhjX/8GtZA9eh890pzcy
/Dm4kpzzF/k6wl4pfhK+M1z7KNgEPw3aiesGzZVrUC0joAF/xv1Qcs6f6FXE
dGR7eCmcQ7nugrfwR6UfxdeJ2Vju5cl7zSqc+47mCz8Qnt0U2A3vDHsnzz/D
d4Xv5PEcvCfsne4b4ZpV+15wEX0+PGvtwAX4fLY/8vAVekW41pvgd/ZO/Z8V
OARfWTmX9qEPvVz2RT2fgf8Nc3l2KrwTLWWfjsL/gK3ZO6Rd2hDuVR7Ii7Hw
rFTTd2LaynzU4wd4P9hX3pPX60o96rEW9miq7P80fG3lWhUziF5f/FCOIfTD
sg+a4Uy2B/JCO7SMPhauXT2q18fh+WuGs8UD5VdPJ+FPwPWyr584+5i92+pJ
vU2W71M73A5/UPZHMdPELmV7rxxz2d9ErdS3gP4H0Qd8qQ==
                 "]]}]}, 
             {RGBColor[
              0.9858806360927449, 0.8347015902318623, 0.5562299718875092], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJwtU7syQ1EUvWdHhAaDzjOjzNAar9KgNR599HyG8Ask1ycwk+iCQprE6Myg
SWiMKuShMmLtWatYs+45+5x91l5733T2aPvQoijaBBLAT4iiU3AXXHcGOsAV
cAacA6/AF9AEPnC5DV4F9wEXngf87WvkWAcPA3nsP4qPgRywj/UgzvTABe2d
6B1/7xIYRawITht1ef7Y9Rq1dcHLRj1L4n7kTAbq8vwDgXuTwESgbo+7vl1j
/A+8Lc2/4KzxbD9MKeF8DajKF9dxZ9yPpelevrwAT8b1NHgcuMb3GHhK+x4P
xjor4E5g3bfuW6A/Zfc10JMbfB8Y9acS9KOgt2eMXj1Lb1K1utZGxB66Ptfg
eutGjRnwmzE+b8zl8aK8aarHsXriNU8qdwrYMHLLqMlje/j+NL674O+odvfg
VR5V1DPv3ZqfNe7NGuvOa8ZyqtHXK5oxn7Ud1en9yaiWRaPGWHd6mqsto7/u
sxln0fvrfX4wzteQ0Tv3cMRY94t6WZamVmC+tv6FhmahJpTkb1X++frdGJtT
rXXd+wdbqnrG
                 "]], PolygonBox[CompressedData["
1:eJwtkTkzRFEQRvv1WBNraB0SAVLGklpSa07Oz7D8BUv5CVQpIQIEtpCaSQYR
EbMQGeV81S84Nafv9Ovb3Te7trmw4WY2BHVwQ7DP7x4kuHv4Mdzj4/Cp3MSs
hM9AA/7F2QT+B03EzbCKT0HF4qyCX8Iu8Q5UOct5fFuAYXwEivoP3lU7Y9ZF
XjesE7d49HINT3gnnOFH6gkvk7dlMYNmUY5yr6AHv/C4exsq5JaJG5OYQbNk
PGqpxx/OHokP8ENo9+ixkN7/4jGTZlONWXzeY3b1X8XPPe5STyXOVzxmUX4N
n4Zv1YIPvA1O0v4f8EWoT2IHSx47UW3tdBL/9XgL5Si312PWPBTxMQ/Xm+nt
BuDWYsevHnfoLs3Y6tGz6qunOXwQ7ix2nMezcGpRQ7Vq6f60g2X8OX0fzdDn
sTPtTt904P3peyhHuaMes+uON/wfg+dXow==
                 "]]}]}, 
             {RGBColor[1., 0.95, 0.75], EdgeForm[None], 
              GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJxNj7sNwkAQRE9HAQZiJDAxFMAnNjklUAD0Bj3YvgCnBBgLMqc2DfBWNwiC
0fPsenf20sNpf/TOuQkaoDHmAkewhj3qUInOLvYK9HCx/+S/O1zAXLWvN660
J9dcp77V1j76zMecWnvn+ABT2KKG76XuCrrlrZmtj3eVf3cV8o0Y9B6br+BV
M0O40X7LeSnX8jPd1sOdsizzpnfO/C/DMqeqWz/Rfsv5AHjJOnQ=
                 "]], 
                PolygonBox[{{718, 179, 178, 527}, {743, 221, 222, 571}, {544, 
                 198, 219, 736}, {728, 199, 198, 543}, {754, 241, 242, 583}, {
                 528, 178, 199, 728}, {557, 222, 201, 737}, {569, 219, 241, 
                 570}, {572, 242, 221, 743}, {545, 201, 179, 530}}]}]}}, {{}, 
             
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{717, 528, 728, 543, 727, 544, 736, 556, 569, 570, 
                 582, 754, 583, 755, 572, 743, 571, 744, 557, 737, 546, 545, 
                 530, 529, 718, 527, 717}]},
               "5.`*^-6"],
              Annotation[#, 5.*^-6, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{701, 498, 710, 513, 709, 514, 716, 526, 726, 541, 
                 725, 542, 735, 555, 567, 568, 753, 581, 594, 764, 595, 596, 
                 610, 774, 611, 775, 598, 765, 597, 766, 599, 767, 585, 756, 
                 584, 757, 573, 745, 558, 738, 547, 729, 532, 531, 516, 515, 
                 502, 501, 704, 500, 703, 499, 702, 497, 701}]},
               "4.`*^-6"],
              Annotation[#, 4.*^-6, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{689, 480, 700, 495, 699, 496, 708, 511, 707, 512, 
                 715, 525, 724, 540, 734, 554, 742, 566, 752, 580, 592, 593, 
                 608, 609, 621, 781, 622, 782, 623, 783, 624, 784, 625, 785, 
                 626, 786, 613, 776, 612, 777, 601, 768, 600, 769, 586, 758, 
                 575, 746, 574, 747, 559, 739, 549, 548, 533, 719, 518, 517, 
                 504, 503, 486, 485, 694, 484, 693, 483, 692, 482, 691, 481, 
                 690, 479, 689}]},
               "3.`*^-6"],
              Annotation[#, 3.*^-6, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[CompressedData["
1:eJwl0CtLw1EYwOGzLSjOpqjgNrUINoN2wWgQjBs4MFgmW9iCt+L1k3gBL2jd
os15Be+CJkGDlygqiM8fw4+Hl8N74JyeidJYMRZCyGstHsKRYYfX3OYlt3jF
fT5wj4+s8Y1VvvOAv6wzqUM160Kd0a76NKBBfWhYPxrVuPIqaErTmtFCtJ8I
YZEpLjHNZWa4wi6usptzbOMs2znPDlbYwjJbOckm5hhnlgmO8FNDelW/ntSr
++hunatRDfr25i+96Fl3utWusxue6VSb5hNu8JjrrMf+//0PuT00oQ==
                 "]]},
               "2.`*^-6"],
              Annotation[#, 2.*^-6, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[CompressedData["
1:eJwl0TczYFEYgOErFUJrhE7OBX4BNQo1jUYoditUQoddOefY0GgZrJVDJ3Ro
FVhbizOeO4p3nvlmzpl7zzlpdT+rf0QEQdChycgg2DbMcZ+z3OMMdznNv1zh
OZd5yiWecY1XXOU113nHTT5xg/+4z0+eMS7coxRdKjXco1yVqFT/Va43VSkm
Kghq2agmtahVHepUj36pX9nWDnBQo8o3j7GA4yzkBIs4zBwOhd/nCPPYywz+
Zib7mMVuprGL6WwPz8G28BxsZiIbGM96JrCG0azkiyr0qjI9q1j34b/oVslK
Umx43/pwd+961INudaNLXehEx1q09ogLPOQ8D/hHO5oyb0V8v/sXcPNGzg==

                 "]]},
               "1.`*^-6"],
              Annotation[#, 1.*^-6, "Tooltip"]& ], {}, {}}}],
          AspectRatio->1,
          DisplayFunction->Identity,
          Epilog->{
            Opacity[0], 
            EdgeForm[{
              Thickness[Large], 
              GrayLevel[0], 
              Dashing[{Small, Small}]}], 
            GeometricTransformationBox[
             TagBox[
              
              DiskBox[{1998.812085758426, 1200.7977075352767`}, {
               432.29239181471934`, 325.10233408990655`}], 
              "Ellipse"], {{{-0.9997165012193362, -0.023810022884677748`}, {
              0.023810022884677748`, -0.9997165012193362}}, Center}], 
            Opacity[1], 
            RGBColor[1, 0, 0], 
            PointSize[0.03], {}, {
             InsetBox[
              FormBox[
               StyleBox["\"Prior\"", 20, 
                GrayLevel[1], StripOnInput -> False], TraditionalForm], 
              Scaled[{0.95, 0.9}], {1, 0}]}},
          Frame->True,
          FrameLabel->{{
             FormBox["\"\[Beta]\"", TraditionalForm], None}, {
             FormBox["\"\[Alpha]\"", TraditionalForm], None}},
          FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
          GridLinesStyle->Directive[
            GrayLevel[0.5, 0.4]],
          ImageSize->350,
          Method->{"DefaultBoundaryStyle" -> Automatic},
          PlotRange->{All, All},
          PlotRangeClipping->True,
          PlotRangePadding->{Automatic, Automatic},
          Ticks->{Automatic, Automatic}], {186.66666666666666, -183.75}, 
         ImageScaled[{0.5, 0.5}], {350, 350.}], InsetBox[
         GraphicsBox[GraphicsComplexBox[CompressedData["
1:eJxl2X1wVNUdxvFMeAtFIEEQaiVCMBIZ2wSNBMyLpxVNiiICWhOwmpFWUeJk
S4FS3npLJ0I7ye6BREh2N8kNGNT4wg0YI6QMp1KFmU7ChZaQhk451TBjDQ6X
2JJbOthu6z73Tp7kj+x8s7P7O+ezN/vHuTOfK1/248SEhISJsV//e/z6p078
/2FG5dePJrUID21NbUSG9ozo0FbUpfVDO6GB5lOLRppPLcyhLak1dVYTrZ/a
pp6xb2gHqBU1PJOr4vuhhidaU8MTDU+0ooYnGp7efGp4evOp4YmW1Joant76
qW1qeKID1IoangnB+H6o4YnW1PBEwxOtqOGJhqc3nxqe3nxqeKIltaaGp7d+
apsanugAtaKGp0OeDnk65OmQp0OeDnk65OmQp0OeDnk65OmQp0OeDnk65OmQ
p0OeDnk65OmQp0OeOhTfDzU80Zoanmh4ohU1PNHw9OZTw9ObTw1PtKTW1PD0
1k9tU8MTHaBW1PBcLeP7oYYnWlPDEw1PtKKGJxqe3nxqeHrzqeGJltSaGp7e
+qltaniiA9SK2rs+yVOTpyZPTZ6aPDV5avLU5KnJU5OnJk9Nnpo8NXlq8tTk
qclTk6cmT02emjyLd8X3Qw1PtKaGJxqeaEUNTzQ8vfnU8PTmU8MTLak1NTy9
9VPb1PBEB6gVNTxt8rTJ0yZPmzxt8rTJ0yZPmzxt8rTJ0yZPmzxt8rTJ0yZP
mzxt8rTJ0yZPmzxt8izaHd8PNTzRmhqeaHiiFTU80fD05lPD05tPDU+0pNbU
8PTWT21TwxMdoFbU8FTkqchTkaciT0WeijwVeSryVOSpyFORpyJPRZ6KPBV5
KvJU5KnIU5GnIk9FnvOr4/uhhidaU8MTDU+0ooYnGp7efGp4evOp4YmW1Joa
nt76qW1qeKID1IoanhZ5WuRpkadFnhZ5WuRpkadFnhZ5WuRpkadFnhZ5WuRp
kadFnhZ5WuRpkadFnhZ5ZtTE90MNT7SmhicanmhFDU80PL351PD05lPDEy2p
NTU8vfVT29TwRAeoFTU8TfI0ydMkT5M8TfI0ydMkT5M8TfI0ydMkT5M8TfI0
ydMkT5M8TfI0ydMkT5M8TfKc9mr879TwRGtqeKLhiVbU8ETD05tPDU9vPjU8
0ZJaU8PTWz+1TQ1PdIBaUcNTkqckT0mekjwleUrylOQpyVOSpyRPSZ6SPCV5
SvKU5CnJU5KnJE9JnpI8JXkm7YnvhxqeaE0NTzQ80Yoanmh4evOp4enNp4Yn
WlJranh666e2qeGJDlAranga5GmQp0GeBnka5GmQp0GeBnka5GmQp0GeBnka
5GmQp0GeBnka5GmQp0GeBnka5OmSp0ueLnm65OmSp0ueLnm65OmSp0ueLnm6
5OmSp0ueLnm65OmSp0ueLnm65OmSZ2BvfD/U8ERranii4YlW1PBEw9ObTw1P
bz41PNGSWlPD01s/tU0NT3SAWlHHvEpKZ2fs7KoSLf12Vuu04fc3irdmnOkN
VYnPyqs3vLyG7m/EXn/P09vEvxf53bj+tSXlbwXFhM6W7z2yzz/vT33vzuyN
f/H7O5F96c23DD//z3ju2u27J/stt/U0nCnx2w0fnZ7S6HdpezT6eF9QlMkD
6zue9d9vRXN6yubO4fcT0qPrNjaP93tgQntXzq6geOOO0WlHX/bvN+wofl6W
3u33C5UffzW633+/ubc+VP/Bf/znBxJey9rcRvcrYtfnpFGVqy5mh0TurLKk
J+Xw8/qn0g7fcmRtSBRNTan5rNN//nLm9rbOBP/8flfRl92H7vV7RnZetGvn
8PP94jfb6tdGQ2LTO3+4b+pi/7x/z7yKxf03+z1wqHfqiLH+ef+6e06nJ5/y
n7/WeuLe6TvofkFsPwUNI6+0jPDPc488+unuzT/yu7X90Wcqsvxe9lDZ8tR/
hcTBq8/OPn+eztdjn1/TzRmLtz7td0F976TMHL8v3FnVo1Ok+Mb2pd9d+Njw
8/eGloKRzQV+p/z6reQdV0JizJyBgY/n+efzjV3mz1d10Hl9bH2rKt279hz0
59X0rthU8JHf76aVJ6cG/fdvnXbm/qZqKW5r+6T7nzPDomXiEx86Z6vEtfZQ
tH9vWFytPv/S36qrxKXeFybMV3XiqVORKU9kBcWavK6xK6/UCXNFWzDpZ0Fx
tT571LbUsPj8cteYY8eCImPRA7dWxK7fvCvPvF6YGRT7l2+4lBz7fNdtnVv8
zbLY/88P37GiVli8PW7k2P43gqL2+b7NGX8Oi7667iO/vRQU5+7LH3x/QkQo
+8LaSQ/HXp91fXlF7Hr7R9HgjZOnQiIzK11cbqoThadySj8ZCIqGv7577ODZ
OvHF4leiY/JCYnzV/NyfjgiL6j/+qefuipDYkvvhB/Oyw2JByawpy7pCIn97
z6fjnwyLlSd+f65mYkjMWdSTd7E+LB4oX3iha0tIvL2gOXr6/oj4ZffgSzkb
Y9fz2cItt30RFmUda462jAiJ5PVrkg+PjIrazKbam9pj83b9oke2R0RNyfGF
JQ+GRFr33tbZKizq9NyPpj8uRe63amYOFMdePzmzri1RiqU7M1fkxL5/8g/s
/9WLxVIcfjgxpbYwIka3/e6mQ/lSTB517qQ7KyJOn7j46vU0KTaceH1bSUJE
1J69kfpgkhTXG+Y09Q1GRO7gxY3935ei62TiHROPR0TvlMSVj9wuxT6n98CC
VyLiy9VFm37w95D4ScqLvfPfDIspnV37P39finGTxzmdSyIiaUnSut4OKebs
Xl/23viIaPx28dLC30ixuiPrxldWRAQr+/KPV0rxX3ChkjA=
           "], {{
             {RGBColor[0.148, 0.33, 0.54], EdgeForm[None], 
              GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJxFmQn4V1Max++tlKRSspRoka0sraLFOq1SZK20SslWSrsmaZV2UVJkT7sW
SZgsQ3bDMMYuxjJZMmMmMTPm/Tznc5/f8/R93v/7O+e8593uufd8qzdgaPfr
ymRZVq5slsW/7JBAHuC3JoHDArUDnQLNAs0DjQO1HDs8UCGwb+DMQKPA8YHT
AscGjgucrmwYeCqMnxTypZC78zR3W8h2Wfod20dor2KgbmC/QKVAPeX+gfrK
yoEjlVUCdVzHmppZiqmcvu4TKB841PjKGlt5Y6jlXOZ1DDQ15g7mAr29PqK/
H3g+8MfAPwMfBT4OzAqMCowOzAzcEBgZ+BOxBp4MvBHYGngi8KaSsT8Hng78
IfCWc58KtDR+4j5FSdynKhsEWgeOChwdaKM8JtBWeazxHG6Omxo/egtzR75b
aQ9bJ/tbPWt/hPOoZY3AQYF39He7tT84S33EftUDBwbOcQ/sXRnoHrggMChw
XuB8f2ujv0McvzAwITDYdb9XMn5T4KrA1YEbtcW8qYGhgWHawN5p7tHaPXpl
qeeo52VK6nx54NxAV/dmHf27N0/9vT1P4y2tQ1cldeimbGVMrdxvmr5cH7gl
MCJLPTEjMFz91iz1CH3T2VyTry7mrKXjfQP9svSs0N+1rFPVwAHWHFnNmlez
BtSzivNGaaN/lnoUOSAwRkkOxgUGBq4IjFeS3+nGgd9jnTvQ33qZS2LtqU6c
ffR7uOO9jbm3Y5wN9EgNbXU1l+8Fng08F3g3S/31TOChwLzA/MADgTmBuYHb
stQr9MjtgYlZ6hF685HAysCWwL2B+wIPa2NBYHPgnsDywGNK5j3u3PsDd2hv
kmtudL87A5MDUwJLlFNdT105Dxa57ubAYuVkfR9jLucqxxnfOHM/X8l+W/WF
uJ9QPpilM4J4VmTpbOOM4xncGv16f+CBwFr3xt91SvytF2MtAycHGgRaBU4N
HBVorX5MoG2gTeBIx08JrNfGXYFHlUsDa4yZ/TYF7ja/2/SXGj6pxO+NgWXO
26CNZdZsofVcpaQOq5WLjHmB9b/PfM8O/MV+edaczTbf+MFzONPxVdr7IEtn
+QuBv2ap7zjfd+gTPn7o+IuBXVk6++jNb5Xs+Z2S/v17ls505n3vb9h+SXvk
5pUs9R9996qSPn1NSQ++rqT+L7tus/6ttZ74td46PGcNGMvthYONb53zftAX
3mP/MDbeYT+aiw/NGWcEPbrdeqwyp6vdY6d+v2Zt6eN51pCzb7q1RM6wxjOs
Af0y1Xmfa4NYv1DynvybkvfkV1l6j/Ju/CbwtvndbRz4/aVzmfex9XvJ2F5U
/8y84/cnjpPXT5WMLc9Sj/AMt/UZODZPZyHnE2c8ZyfvNs7pA2PsvyH/F6iR
J/lboGr8vTfkL4HK8feekD8HqsXfv4b8T2DfPNWA74gD8jSXsZPi75qBWoEj
8jSvYp7sEj/9VSVP9thj//j731nag3nY+4na56kR8kDtQPlAhUClwL+ytGa/
PM1FP8S5ZQKHO3df5Y/2y0H6gd0T8rTmUG3vto9O9DdiODpPsVUzj9XzlLPj
lDU8f4inqudPVdfcFLgqcHXgEt7FgbMCSwJTAlMDPQJnB34XqJ+nXFT2vKqs
3bp5irOSsfHc8rw2ylM85GmfPD0bxFA2T+M8u+XyJBk73rnEXE977FfH+rBH
Q2M6yPqV0/adgcn6fZi/lTdHZZ3XUrvEcbJ+ozezHvRCc2Udz+L6xtrKPBbn
91HmnnpyZhHzqc5tYM6oH7Vqob265vd4x06zZtSKvv7a/qP29OAu+/hLn1Hq
08j1Z5gL9F99npl3qXuw/+nabmj98IXe75YnX4mpq3GidzZ+/O1kXtA7Bpqq
7/E53+mz8bnnCuO1zePPjjPW2DpRkyZK5rXP0xi/dVBi4xz3pz4X5OmMIE/n
6S+5756ndyZj7YwJWxebF/J0kfGjd9Ee9T9XScwXapt5PE9l7JUBnj18ky4N
fVpgemCZckZgWKBnoFegn7nD9/5K9hygZM/rnXtZYFKenrlrAsP9rXee+vfa
wHV5Oi8+8ey82bmMXa69rq7pYH0GB843N8zjeb5UW0ie477WFV8HaqOb+7fX
1gx9GhHoo+1O+t7OeVO0O9R5vZ073ThZ/5PviU98P/D+3OCZ+Kk9NE4/rsjT
HaO4r/D9yl2R+3FfJd/v/ZS8G/jO7eC8seYFW2PMO/po64E+MTAkT+fdVH0f
Zm2H6ffvA1c6b4I5RR9p7qjzKCV2bwwMct4N5qCvtnvYH3e53zTjJN/n6Qf9
R5/e5n7sv1CJv7crOafnB8a75wIla+4LzArMDtwbuFV9Q556l5693/E5gUf1
aak6+RrrmlHm7J7ALYGZgeVK7C7KU+/Sj3NdRw3vtm9Yc4f+Mm+xcye7/2j3
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
u1W/l7vfSm39HyQZHgo=
                 "]], 
                PolygonBox[{{489, 111, 132, 527}, {504, 64, 65, 464}, {462, 
                 69, 90, 513}, {465, 85, 64, 504}, {490, 129, 107, 481}, {443,
                  44, 23, 494}, {495, 24, 25, 444}, {527, 132, 131, 493}, {
                 448, 65, 44, 496}, {524, 130, 129, 490}, {474, 90, 111, 
                 521}, {457, 47, 69, 462}, {444, 25, 47, 445}, {477, 107, 85, 
                 465}, {525, 131, 130, 491}, {494, 23, 24, 442}}]}]}, 
             {RGBColor[
              0.5148338603909183, 0.4846380979009617, 0.5164235453293005], 
              EdgeForm[None], 
              GraphicsGroupBox[{
                PolygonBox[{{444, 46, 495}, {446, 45, 499}, {451, 46, 503}, {
                 517, 110, 488}, {494, 45, 443}, {485, 108, 478}, {445, 46, 
                 444}, {481, 108, 490}, {465, 86, 477}, {504, 86, 465}, {493, 
                 110, 527}, {490, 108, 524}, {527, 110, 489}, {464, 86, 
                 504}, {442, 45, 494}, {486, 110, 517}}], 
                PolygonBox[{{514, 513, 474, 475}, {499, 45, 46, 451}, {478, 
                 108, 86, 467}, {449, 448, 496, 497}, {463, 462, 513, 514}, {
                 475, 474, 521, 522}, {526, 525, 491, 492}, {506, 505, 448, 
                 449}, {495, 46, 45, 442}, {458, 457, 462, 463}, {477, 86, 
                 108, 481}}], 
                PolygonBox[{{522, 521, 489, 110, 486}, {467, 86, 464, 505, 
                 506}, {488, 110, 493, 525, 526}, {503, 46, 445, 457, 458}, {
                 497, 496, 443, 45, 446}, {492, 491, 524, 108, 485}}]}]}, 
             {RGBColor[
              0.7797231006515303, 0.5777301631682694, 0.3607059088821675], 
              EdgeForm[None], 
              GraphicsGroupBox[{
                PolygonBox[{{463, 68, 458}, {482, 109, 515}, {514, 68, 463}, {
                 526, 109, 488}, {458, 68, 503}, {459, 68, 471}, {485, 109, 
                 492}, {492, 109, 526}}], 
                PolygonBox[{{498, 497, 446, 447}, {476, 475, 522, 523}, {450, 
                 449, 497, 498}, {468, 467, 506, 507}, {523, 522, 486, 487}, {
                 447, 446, 499, 500}, {500, 499, 451, 452}, {487, 486, 517, 
                 518}, {479, 478, 467, 468}, {507, 506, 449, 450}}], 
                PolygonBox[{{452, 451, 503, 68, 459}, {515, 109, 485, 478, 
                 479}, {471, 68, 514, 475, 476}, {518, 517, 488, 109, 
                 482}}]}]}, 
             {RGBColor[
              0.9231010129252624, 0.6777525323131559, 0.36161314006831335`], 
              EdgeForm[None], 
              GraphicsGroupBox[{
                PolygonBox[{{498, 66, 450}, {487, 89, 523}, {466, 66, 509}, {
                 523, 89, 476}, {447, 66, 498}, {476, 89, 471}, {511, 89, 
                 472}, {509, 66, 455}}], 
                PolygonBox[{{519, 518, 482, 483}, {469, 468, 507, 508}, {516, 
                 515, 479, 480}, {501, 500, 452, 453}, {480, 479, 468, 469}, {
                 453, 452, 459, 460}, {483, 482, 515, 516}}], 
                PolygonBox[{{460, 459, 471, 89, 511}, {472, 89, 487, 518, 
                 519}, {508, 507, 450, 66, 466}, {455, 66, 447, 500, 
                 501}}]}]}, 
             {RGBColor[
              0.9654155880467659, 0.7835389701169148, 0.4927883229449742], 
              EdgeForm[None], 
              GraphicsGroupBox[{
                PolygonBox[{{508, 87, 469}, {466, 87, 508}, {469, 87, 480}, {
                 480, 87, 516}}], 
                PolygonBox[{{510, 509, 455, 456}, {461, 460, 511, 512}, {520, 
                 519, 483, 484}, {512, 511, 472, 473}, {502, 501, 453, 454}, {
                 456, 455, 501, 502}, {454, 453, 460, 461}, {473, 472, 519, 
                 520}}], 
                PolygonBox[{{470, 87, 466, 509, 510}, {484, 483, 516, 87, 
                 470}}]}]}, 
             {RGBColor[1., 0.95, 0.75], EdgeForm[None], 
              GraphicsGroupBox[{
                PolygonBox[{{454, 67, 502}, {512, 67, 461}, {510, 88, 470}, {
                 502, 67, 456}, {470, 88, 484}, {461, 67, 454}, {520, 88, 
                 473}, {484, 88, 520}}], 
                PolygonBox[{{473, 88, 67, 512}, {456, 67, 88, 510}}]}]}}, {{}, 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{502, 456, 510, 470, 484, 520, 473, 512, 461, 454, 
                 502}]},
               "0.0001`"],
              Annotation[#, 0.0001, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{501, 455, 509, 466, 508, 469, 480, 516, 483, 519, 
                 472, 511, 460, 453, 501}]},
               "0.00008`"],
              Annotation[#, 0.00008, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{498, 450, 507, 468, 479, 515, 482, 518, 487, 523, 
                 476, 471, 459, 452, 500, 447, 498}]},
               "0.00006`"],
              Annotation[#, 0.00006, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{497, 449, 506, 467, 478, 485, 492, 526, 488, 517, 
                 486, 522, 475, 514, 463, 458, 503, 451, 499, 446, 497}]},
               "0.00004`"],
              Annotation[#, 0.00004, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{494, 443, 496, 448, 505, 464, 504, 465, 477, 481, 
                 490, 524, 491, 525, 493, 527, 489, 521, 474, 513, 462, 457, 
                 445, 444, 495, 442, 494}]},
               "0.00002`"],
              Annotation[#, 0.00002, "Tooltip"]& ], {}, {}}}],
          AspectRatio->1,
          DisplayFunction->Identity,
          Epilog->{
            Opacity[0], 
            EdgeForm[{
              Thickness[Large], 
              GrayLevel[0], 
              Dashing[{Small, Small}]}], 
            GeometricTransformationBox[
             TagBox[
              
              DiskBox[{1713.8814151088543`, 1009.812181713747}, {
               85.92735876188488, 67.0762315022299}], 
              "Ellipse"], {{{-0.9999916993047646, -0.004074471937459987}, {
              0.004074471937459987, -0.9999916993047646}}, Center}], 
            Opacity[1], 
            RGBColor[1, 0, 0], 
            PointSize[0.03], {
             PointBox[{1700, 1000}]}, {
             InsetBox[
              FormBox[
               StyleBox["\"Posterior\"", 20, 
                GrayLevel[1], StripOnInput -> False], TraditionalForm], 
              Scaled[{0.95, 0.9}], {1, 0}]}},
          Frame->True,
          FrameLabel->{{
             FormBox["\"\[Beta]\"", TraditionalForm], None}, {
             FormBox["\"\[Alpha]\"", TraditionalForm], None}},
          FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
          GridLinesStyle->Directive[
            GrayLevel[0.5, 0.4]],
          ImageSize->350,
          Method->{"DefaultBoundaryStyle" -> Automatic},
          PlotRange->{All, All},
          PlotRangeClipping->True,
          PlotRangePadding->{Automatic, Automatic},
          Ticks->{Automatic, Automatic}], {560., -183.75}, 
         ImageScaled[{0.5, 0.5}], {350, 350.}]}, {}},
      ContentSelectable->True,
      ImageSize->{758.6666666666666, 379.5},
      PlotRangePadding->{6, 5}]},
    {
     GraphicsBox[GeometricTransformationBox[
       StyleBox[InsetBox["\<\"Correlated\"\>", {0, 0}],
        StripOnInput->False,
        FontSize->20], {{{0, -1}, {1, 0}}, Center}],
      ImageSize->{18, 300}], 
     GraphicsBox[{{}, {InsetBox[
         GraphicsBox[GraphicsComplexBox[CompressedData["
1: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
yLLUXasGsNx84XK9+Wo2/45dHmfmx6wvI2B/SKOw9Xwh+aup+bheFLybN/da
QJ/W84by9W8W955Jgc5GvYNTj7aeN0Tydy4bb8zm4zcNp/d0Wct8XremHkX/
b/7g6BzpsXERO19YbjU15MMsdp5Qe0mcvKsNO09QJ3dzlR5F8wXm/C4U1NMX
4yh4499Cm7q2ni+oMh9EKS5SEP20LlM6vPW84Xbem6asRPb8+bQ5sOLlQfZ8
HX3qXlyfxp6fes/v6t+l7PmxGVFw04zPrH/9oszevVrPH8yneWU8qmX9J1G2
AU/OMfvzexsxGM8nGP8yzmVL71gK/I/v4s5vYo/H80/unbKp9XzieaeUN45Z
FIx8PDLEqp49vr1E/8erPKmGV+04NyjKlZ0/iOW+dQFz2HmDwP3J7fFa7LzB
5Mbqt5MzWXb4PGj7k1nsvGHeCa7RlU5o3sD4S5vdZ+K3RTxom3TVWJbEzhv8
hu37MDaH5Zx2KeOnT2LnB0tWi+y+HGbZo1/qEPMe7Lwg7Urntj5RLO+078nd
3F76d33m+ZilrYzVcWHq1Rbv7+/PzgcMyzdPOLCGnQeEBzY6bxzCzgPuOu9T
v77Fckfxsgkh0ew8YMXKaPPSpWgewOxXv27fs1cePNgP2ywOdG2d74e6jbpe
dpsHB0ek+n7lssd3nRv48GcLy4XCR3oZW9g83312z/vmjSjfZ/Z3dXJVk/8K
HvQel8EXFEo1x3vbvBh+MonN7w8/Kr2TL2Tzes7omn83ebJ5/ZlqwyPJ/Vvn
9W8uNsZ3GMDmy+/WlkwLvs8Di9tazd5f0O//5/745N5PH1M+bNt7JLeBap3f
c0e6rZhvzYe8+LrVtSXoOPN9OuhrwXFq5EGunX3YrUWt8/ua9IRZ7Uz40O1H
j5Qfd9nj6X0qC8wXsHm9SejvNcpHLC/8aVRVL5X+/XnM84m7c2v3F8v4UDSw
LPbnJTafHzJ93fr191vn8XU1U/uvD2fzeJuzo2t3zONDwwWrXTfz2Lz+bFJY
iQWvdT7/0t71waAEPnxv61Sy4BrK65nrJ3X7Zddds1kfDk/mUKZn+GAw7ld3
9bnW+bxH07zyrr5sPl9r0jv+8AU+eFtyTS6R6+v/5fPhofMCa/l8WK5XWl3e
v3U+f8Hvju3Z9Xx4VrvwYfhp9rikQ4fTgdFSDWeKRlVXq1H+zjzP30XJxujc
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

           "], {{
             {RGBColor[0.148, 0.33, 0.54], EdgeForm[None], 
              GraphicsGroupBox[{PolygonBox[CompressedData["
1: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
9xzXXcht1y33ZEOYd2bN9/8Fbj97dQ==
                 "]], 
                PolygonBox[CompressedData["
1:eJwtkjlMVlEQhe+bpxRWFhY2Fib+BYmJgiuYQFAKC0ElwcTKJTGoIAjB1qVS
g1Yqi5K4NIr7vrAjLr17QYxbQuywRonfyfmLL3fOzNz35s7M0r1tDa2RUqqC
eQKxn/MozMe+Co1ZStXQi/0e6ojVwxS+g3lKpzlPwQNiv+Qj1ghf0B/DuVvh
K7Eb6N2cR6CJu3fQJ7Cb4Sb2EGctuSvgGbqZnF58PfAQfSD3v07CPXQ3rMeu
g13ElqDPc/cYzGF/hm3Y2+E7OVfQWzj3wD7yS8K5qvkP9gYYxR6AxcRb4RK5
F+EJsRZ0X+aaHqE/hd+mf3zDN4NuSu6henko913deRzuiXqzA37iGwi/XT2+
Fq5RteobP7DbuN+fuYanxJeHa9MbF+SekWZ1Dv5h34bOzDPRbPRGvVU9v05s
GFaTuwbG9S/iBc5l0EWsHWaJLURvJnYcvQh7Dl8H9kj47lqYwD+GrsHeCK/Q
98Oz6S/Wrhlr1qrpFrEJ2JQ847fFmWl2msll9T787XXwEt94+Nu68wa9k/yK
zDO/oNmFay0U31IFf5PfcFizhnfY01BG7Ez4rRXFb2nHtGsrYVB7Ft71Ujgb
rkG1aOcnsZ+Hc8tgGP068yzVA/VCO6pd1U7fxR6EcmKrYBTfi/Bd+Ua0t+gP
yTun3atUj5NrLmh26N/JOeW5Z6BZyFedu0bVqhk1oIfC/9KMxzT38NvVE/Xm
P5i1fcI=
                 "]]}]}, 
             {RGBColor[
              0.4524334718089836, 0.46270824887855655`, 0.5531062018758691], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJxFVUtsVmUQvXc+lKhBVhgw0aQKLABDIAGMGEUapKVIAgv+PoBCpRil7Q80
rkSsUE0UwVRsNfJSo7xRAQWkpa3vIFEpsUhC4ovHAhaiKyDReo7nJC5OZu7c
ud/MN3NmbkldcV5TZFn2KZCAPqAT6AJ68iwr5zMchkEfC4wB5iXJDbDfATnO
7+bDPgnyddhLIKcAk4FuoAznHIP9Nvh0QL8b+grYXwReABqBdcBaoBeYxRzg
82ro/I2Qv0Eug/0n6LVJ53dA/yD03UHIzyAr4HMc+qikezwAvQv2R6EfhT4V
6IH+GOThUA5F+B6DnAH7EdiaoLc6p6Jz5PMnIb0J/kMg7wXuAZ7Hd8uBBuBz
PM+G7IbvP0A79LsgV0O+BrRlqtcjwDRgTlK9Xg7FZg6drut0+7VkqhvPynLV
nT0ZAJbC9Ae+ewayPlONzrgOfbD/FcrrEmzXIYdC3p6rNjuAnawXnmeSB/Cd
6butgX7WdzkN/Vqm7/iuP1MNe4H5vgfzHJ1kezBUD9alxTEZ+wbzAE6Za7zL
ZYgrwENJ7xaH4jAev3kK9mY872NfnMdU2OqBCtjfhu13c4McKUuKsxL2cug5
bE+bwwOO+RaeSyGrk3pPDnwE26YQh8nlRdAvwH089AlJ+c6GbVXonBbIl8z1
OY5J/4uZ+sM4jF3LOSKnmRuwCFgIfGu+fYUzTpqf30D/wjUnj7aEvqlJ4toQ
964H9gK/zcXVSqDKc1Twc8E9IYfeDfVpN7mQS+f7uUm9eS7EyWHm1rZQzguS
zhhrPlb6vFLfo8x3m+bdQL9TnveTOOO0d8h30Kt8h1dCu4P+b0D+6Hn/Afr3
5uEJ6DXQV+baE2+GYrwT2k995tAec5Bc3IF3C+BThzjDk2yc9fd91pIkvnd5
x53PxdGzoV1S4lleH6rJXPNihfMody95770h/Qn43JqUxzjYHg9xuS7EG/Kh
lrsuxG1yfLvjcYdNTOL/Eu+VouNxzvf6fozBWLu4b5Nyvx/6w0k8JB/bPMe8
32Vz/L93uWpCvt0Ev2dhGwT5cWifNSblm5uvv+baIWdC9b1kPnNv7XKMA6F5
5FyOTPKrsG2h68NZ5L7jTur3fDOvn72v+uH/YSi/J5N2N3f4cuiHQnu3Afot
7tmYUJ/Yrwt4tzM0+/X+n7R41xQ8Aw3uWY3vX+r5qPTzKr8fCH03OFTvdu/Z
Vs8V+8F9UOH5Lfqcatv4jv+4zd4n3CtfMw55Cf3LXHPKea12b3nGiKR498H+
Zyj/m0P5NfkOVfblM/cXe9Ts2jTazr3AGdwK+x7P9n7Ic6EcTjhmtWsxyBy4
CnnRedL3Pee3GOf94h7x39Iemtkqc/mGdzL3L/dwMcQN9prnrnXtmR+50mbu
TM//30nhf9Wdod1S8D5qM1941t/Ok5wlp5rds17PBGv3LzWsDPg=
                 "]], 
                PolygonBox[CompressedData["
1:eJwtlFdsSGEUx+89VwiCJ7Ul5gOVIDFTIQRVMx6UaqtahLRGebRnYoQYLWLP
0poxQrW2IA1ao6gRQT3wYDwhMX7/nPvwyz3/c751zznf1y577vg5FgTBdKgD
d8IgSOWbBy8JjIFn2J+hZxQEN9E34C7j7kG1+dxp8BY9izHz+S6As8Q+8s0l
tgy+ow/BJHxDYBd2JuN7Y/eBfegIFjF2BrzHN5N4fuhrnjY/k86mNT/ge24+
Vmd4h57G+BS+I6GI2B5Ixs6AHGLf0IsD30N7zcCXSWwKlKCfwhN4jX6jdbAr
GVsL3Rm7Dt0u9DOnopPgF7GfoEQmQjH2NWhOrEL7Y4+Ax8zJR/+O1xtAPIzz
txAMe7T5XOVcuR8b5/86dGZ8FvoTdhX0QB8zP3tK/O9V6JHERsELfOn4RoSe
g93EMuL8yLcXnY1Ox54MR9BTI7fT4DD6DgxlrWFQge8+enjg/1SJvmsek+8h
+jh6At88KMZ+BCmBn6kaX1bka6sH1AsnzHtFNVAtlGPl5iNkEhtl/q9l0IlY
S/NcbYZW2PVgedyvP7Bbw5bAa/wHuxuUYBdCQ+b3N1+rCJqhz6DXhN5j6rW2
5mO15j/sJPPca40WkfeQekk5O0rsq3nvq4aq5XboQmwQ7MBeCk1Cr3kyczeg
O6Abwzh0oXnvt4eJ6BXoBOxQNUIvQ/9jblP0cuyT5rldAaew95v3uvpRd+mA
+d6qwUHsnTAYOxE2YadFfvfkU2wb9Ir7R71xKa6nal6K73Jcb/nKdE/Ma6Oe
V+/PgdWh5/AisdnoVaH7LqDbQEHgd6IBsa7oY4HXSLXaaH42/bP+far5W6N/
Hsj4Bea5+ILOwe4LVwK/kx2JZ5vHdEd0V+qavzXa8y/2XPO72Yg1hkd+59Rf
ukPzVFuYGPibdzvOsXKtGo5n7BLzuarP2Mh7Tr13FOpHXjPFVNMC85qqtqr5
evQrvjWhvyl6W/Rm6u28hX0basz31hlq4zdFtVRNtpr3qHpVOeuHzo289ivh
nN6C0Htfa2itLuZnU44SIj+zzqc3ay2x8vh90J28jq8svp96n66hr5jbut9X
0aXx+6UeKNdeke+tGp8ndtX8rdGaN/A9iOdrzafo//Gnxuo=
                 "]], 
                PolygonBox[{{457, 88, 454, 705, 706}, {722, 76, 451, 474, 
                 475}, {477, 476, 725, 100, 479}, {708, 707, 443, 69, 
                 458}}]}]}, 
             {RGBColor[
              0.6757299054360252, 0.541183033859306, 0.42183928881716093`], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJw1lMtLVVEUxs9Ze5Bp0zINr0URFNx7zRtU4NC6pIFhQSRaeZ00yBwUQVEN
pPcge0FEj4naqH8gZ0aDCiqK6EkIRS+QgoIKGtRv8a0GH+vb66y99nqeJbWR
3r2WZdlukMApDoU8yzZx+ILsQzeDbh3nn/Bh+Cf02+Fv4QeAcd6PnEI3ASbB
d86jyDnI33wfhM+6LTgEz5GvwTD8I9/X478eeQTdgiQfK+Fj4c/9+vvzsGkA
M2DIY0DWJX1fgf1j5O1MsfzlfBlZQFax+QUfgXfDW7h3Et6WdKcbPj/p7hr4
LPI5eAGa0E8jO0zvTMUbPSabGrKIzTv4ALwBfgtehG+EN/LWKPw4aIIfM+W6
GLTmqt/CXHYd2L/n7k5Trp6zxz0UMe0z2ZZAETTHWyX0y5JiWxs1Ppepft7P
1aAC2sAGr3euHDz3R2Bpkuzi7tyku4vgr6J33sOW8NEePtzXKvAj+vg5cqqP
HnVGnOWwq8a9crzfGbIcvgaS4rzkuSf1rtU0mD5Ldabvhaib53YwU67Lk3rh
PSlFPb3W09FD/1aMGv//Vo74PE/PtxnZa7LfbJp7n/+H/pbp/hVTL93PWY/N
FEMjcltS/mfgPUn9OwofSsr9OvyqKe9x01yPRZ8qUV/P7Q+oofuKTSUpHo+r
GnVsjzg8nr6kXfIafEO+ibtP4Ydjzny3PuTqke/cHdP+3kfny+/z5nM3aepP
Db7HNHu+9zfjbc/jZczDE3T34j/g/m5Eb7yH10z59CfNute6C95v2hHflQlT
7wfhD+I/c9e0z77Xz+A7Yp99Ry+aaus1PmGqle/xedPsbIFfMNVnK/x07I/3
YTxqvgv+D7bAiFA=
                 "]], PolygonBox[CompressedData["
1:eJw1lMtL1VEQx89vTpCl29QrpEYRJJilQlG5KyXLiF6QWea1ZeaiBxTVoqis
RdoDgl4rbdU/ULug0h56zSyDiMBACKIgoRYR9vkyp8WHO3Nm7jnfOTPntyTf
u+OIhRDaYB7sjiHUZyGshusE2vFrsVfCbfwRGIYx/ALsS/kNcJf1M7AQuwra
iA3g12Hn4IL5mmKV0Id/ExpT/h5iB2Ej9iYYJFYLD9H1BHLEnuM/g1fEX8Ml
7MWZa5D2Cfw8uV3wgbXz+OX8GpzAPgsl2L+Jt5B/Bb8avxi24eehGbsFHhCb
4/ckud3wGbsrujblDJnfie5Gmu9gH4Vvwc87bl6TatMZN/APpfgUNBDbCasy
vyPd1fekX+f9Za3XXOs0rCf3Kn5Z5j3pN9cs7arpsv4L74Of0Y3dCV+wx6CO
3Jf4L2Cc/Ddwz7zW+tTLHH4/uYNQJO34t7DPQcDfFX02pPmaao++v/R1mJ+h
swpwAH+Dee+kaTmxGvwh7AFYgN8afTbKU6+2mP/3MSwjNt/8bGmYw15rHtMe
pcQ7os+eZug+sU+wl1g7fGVtDf6jVP9ScsvM+6kaVesK81qVsyj6nevulROI
FaXze2BWvTOfLfXoD7kV5rWcUrruI82r9Jaw31NzLdI0opnV7MIE9ls4Zj4r
6pdmowd+Be9pM///Yb639GgWm9J96owK4vvN714zsi56T9VbnaGzZjLXrhp+
mu+pvfVGT+sdwyhM4r+D7eazqTN01rj6oZkiNpXenN7ecPoWqAbVMpr2kgZp
UQ2H8bdGf+t6oxfN34Tq1Qxvjj7T0q8Z0oeoMs2b6iuOrknaCv+1ZP7t0Qxr
lifN+6V+fGS91bzX2k+z+Q8+TJm6
                 "]], 
                PolygonBox[{{732, 731, 457, 89, 487}, {461, 90, 458, 709, 
                 710}, {471, 470, 721, 97, 473}, {488, 109, 485, 731, 
                 732}}]}]}, 
             {RGBColor[
              0.8990263390630668, 0.6196578188400554, 0.2905723757584528], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJw1kjtIXFEQhu/O9bGCdi7BBxixiRZrEUhAEHxAWJcIPpLGdVUksUji2ohs
olaisRK1srdOb51CQtDEIKKChUsIq6y7SF6d4jfMWAzzzZy5555/ZponZ4Yy
EgRBAguxgCCLu4kEwRWWgnPkajjcgh/Cp+Qn4OOI1Wl9iXwLNTvwUzgO78NJ
uEjNKPwTfofl4A7O38B/tR5uoKYcq8CeEf8jP835HBaSW8I3+nkl9jK0+CP5
frgKXoTr8WV+17LH6/gR7Jw726jthD/DA/gEtgc3k791LTGxOq1PwRF4Ca6C
R8V0qb5dsf7s812UeA2uE9Ojut6qPiwDF6iZgkvwa3wDNZ/gdjFNquW+B+r1
3VqrWlT/md9zAZ8EdlbEPoj1o4f7/vtcCuRixNtwK/ze/9FN7hqfJv+L3DwW
Je4Nrb/6nyScFXtHF7wgNgudyYrXPw+tp/rGYXhY7E2D+GrXFRfrhfbkgb7R
3/MIXhWbl85N+6797yOXj5hG1frD3/lVbM9U14H2Ex6HL+E/YnOJ4o88/w0+
hMfgPbGl1r1t0jn7PuvcvvtOflEdoe2D7kWt7/AT+HFoPX4ltq+6t2nvU9Fn
sCE2rxec//b/5sW+0ZpZ/Kbvru7sHSsSZCM=
                 "]], 
                PolygonBox[CompressedData["
1:eJwtk09IlVEQxe8395UKtUsSDfrjpqBsEahBSJZBZYvSVmkZQS20nhsxs1pZ
2iqwVfvW7Vu7knhaEkEbzQgxI0PsKUUt+h1mFodvzp25M3Nnznfw1nBP2VJK
p0AJVCA3+F4HC0VK7+E3sQfAR/gf8Bv84HwdNIDn+F6BmpxSG/xN8Hr4UfAF
exlcw1cHJrDLoIrdAWawX4MmYr+Tew185nwZTIF98BrQjf8ifC55jWb4EfNa
6qEW3gXqiK0FD/F1wndi7wBj8FnQT2yf3srZyey9qce7+N6av10x7/APwavJ
cyr3uex8CzxSrPndCjim/kAmtgSe4DuTvXf18ECx5rWVf52zlainmW/Cv0Z/
OtuAX+V+U+EzeIGvF95Y+Nk0fN58N7r/gbP75rV/wu9gX475fgI92Ieyz0/9
noePaI/Jex41j1Gszk4Qux/+MvazC94a+1UO5eozn5/m0Z59BpXw9+M7HPvR
nT34bpv3phq92GvRvzS2XbimpK2/2P+0x9CLekjc3xt6GxPHXgKL5pqRdh6b
70o70q6+Fa415fiFr8X8LZpJI/4r8V5xafFSdu0oxzP48YhX/d34Lpi/TzuX
tk9n11YpZn8g5qV6Bb6zkU8aGMdXb9673qB/55757DRDabE79KI7k/hW43/U
jKqhKdWSBp6az1z39d5B+H/fvHZc
                 "]], 
                PolygonBox[{{491, 110, 487, 733, 734}, {508, 507, 750, 120, 
                 510}, {747, 96, 473, 504, 505}, {736, 735, 461, 91, 
                 492}}]}]}, 
             {RGBColor[
              0.9355148199185477, 0.7087870497963692, 0.4000959417474978], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJwtkrtKA1EQhs/OAUVFi6Ag2CQ2RhAEiWKliRHU0hveOkHxAsbKaGxtfQBb
H8BSH0A7n8AU0doo8YagBPEbZoqf+XbO7sw/czazWVo4kBDCCIroAd2iO7TL
wQdxlIMEXcBpcin4WvNwFq7Bq3A7OoS/iTvoHc5xfgp/wtNww3tUUQvPl8QB
zgU+gzvgVvgc7oUXxd7fIg6Rv4fn4BWxvtp/DX6EB+GKey7CVz6HznPifqai
5aruY1mMl4jPSQgluAb/wWW4SfwS89ZG7PS6w3BftNoTcFlstjy5tPucIbcu
xupd59G5eoi/1D2CU/AsuoH7eecYfoML0Xwpa92CmO9JsT3qPvfhl8R2/iTm
VT2/wuPRdrIhNo/OVed8232q3x/3UBfrrR7G4JzY/eo97/lutV6331dWzLd+
2yR2+b+REduF7mRe7D9Qbw36/ANCy0/y
                 "]], 
                PolygonBox[CompressedData["
1:eJwtkjsvhEEUhuebTwhCY2k0uxUaFHaVLA2lW6gl7olVubZaP0DrByjXD6Dz
Cyjcb7uCvVgiEfG8OVM8yXnnzJzznplJzecm171zrhfq4AnxCJXIuSq8Qo71
ffhkPQWHQfvYuTV0lfgKBtHj6HPiPKTQGfQJ8REk0BPoU+ILmCJuiy2v/QPo
mrd+G9BEXIQCfOHjG/qJj515aOVsszcvOqOzA6yViUuwhE6jK87WltFd3ryo
p3pnYvOvPSvkFrx5+4BF4mSYVz1b2Nsdzh9AA/oF/QyfeKtFNnM+1B9jvTH4
U42IXA9ch/uaJTcS/Kr/rrcaqlUIsz/APZRYK8Mb8RZ7N+EHfePtrjR/MbI3
UG31WCU3GubXjHvoX29nVSNBPARnYT7dbYe32TRjfWx/QH9BM2rWd3mIzJO8
Dcd2V7rvbW8e5VV/SH+pL7yX3ryTve2hvvr/sS/t7b70Z5Lk57z5l1+9TSLM
qzPypjdVr0uYIc7GpnWHO+hpbznNlCW+g1tvnuX9H5hacGU=
                 "]], 
                PolygonBox[{{503, 502, 747, 118, 506}, {811, 810, 603, 223, 
                 601}, {495, 112, 492, 737, 738}, {583, 203, 602, 810, 
                 811}}]}]}, 
             {RGBColor[
              0.9711851767279792, 0.7979629418199481, 0.5106740478567356], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJw1kbsuhGEQhr9vNhQOi5CtEKsgQiGxtOLcC0GrQUOcLkHFFai4ApVLILiF
pRERURARwVJ43swoJu/zzcw/p7+8ujW/aSmlIayALfG4Rgd4tGOncD++LvgK
noF74HN4FJ429ytejx3BJXwF+ABuNq9xmDy2xruKVohPwBfwAtphHv9Fi9gO
/I22YnvwDzqJXcKdfFuJupqxFN+qxod530a0jtgJ3Ad/5pT24We4BduFa2Jy
juFeeAW7gQfxbcB38Bi8Dt9qX7gtdh/BV4uaqr0Ye2m/2bhhN7kvxLbhe/Mb
aGbNVCR2hg6bx5Tzmr2f+i7js5itDDdFzhf6nn3+R+2b/T5P8FTc5/9Omrka
PdRr3Hw37TgHN8StdLO37Dd/iD30X1TjD2qMQkk=
                 "]], 
                PolygonBox[CompressedData["
1:eJwtkb0uxFEQxce9aCS7drWCFbGUYrdmYz968dmqaIivR1DxBCqeQOURCPsK
6EREIRGRsBR+JzPFyf+ce+aeO/+Zytbe8m4ysynQD+qIa74XoJzNRtCnoQfQ
8+F3wTh6FtyH3sQbAifwc5DwquhL+BkYRM+AO/M763iTyWt1J+PVwSP8Cezg
VbNzna2hf8ER/BiU4D1waH42DP8BB+ZnRfhG8vt6U29/o/fNawrwTvLe9U8T
+G/Js5X31Wf2Evmq/0A/R74y3tGv0Y9qPtE1Mh6i3228BXAFvwEN+Fxo/XMx
+4w1W82ohjedXKufUvZ/VD/agXaxmDxLGcoqx35U0+P9lfDVwyq8EvNVfSH7
DNXbLViCj2bnuqPssdin5tVEt5JzzVC70M67sb823l/y3aoH9fIPc1tIZw==

                 "]], 
                PolygonBox[{{759, 758, 495, 113, 524}, {525, 133, 522, 758, 
                 759}}]}]}, 
             {RGBColor[1., 0.8919377073197147, 0.641133201224465], EdgeForm[
              None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJxFT0sOAVEQfOkXO4yJrRAWrCcuIPE5gIUDOAC3MLiCCVcwuMMcyW+jKtWJ
RaW6ujtd1f31drmxEEIXiEAB3IASODlfgSSKMywvgAfqHnoxam/gvTNwAWbQ
d96N6nFGPYKuwHPMp6Z6BW4DR9SpSVe++0S9Q91wLjzXxJSng52De9InjaqH
fqP0f1qmvY8pN/OM7f8n7zahc/DLpOlHXXdvZsncl/702wfdTT3/F5yY+m9T
Fs45q0Uxf/0BWiotIw==
                 "]], PolygonBox[CompressedData["
1:eJwtjtsRAVEQRG/NXX8eq/yiikUAZOAVgBAEQBZeKdgiBawcpOTx43TNfnTd
09Uzd7q33q42FkJooQS9MXveHarCNXM+oxhD+OKP8AE14I85a6cOj9EDztEA
7pvv3jTP/hB/gQuU4if4J3xFTXwn+r7yOdkU3eEXmsELc9aMZn/4U/BOqfmf
RZmrSxK9mzpm5p3ysq+yrOyvTurWjt5VN3V7ZN5NNypk3fJ/dV6S/QFE2yID

                 "]]}]}, 
             {RGBColor[1., 0.95, 0.75], EdgeForm[None], 
              GraphicsGroupBox[
               PolygonBox[{{549, 157, 547}, {547, 157, 772}, {548, 157, 
                562}, {562, 157, 784}, {784, 157, 549}, {772, 157, 
                548}}]]}}, {{}, 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{772, 548, 562, 784, 549, 547, 772}]},
               "7.`*^-6"],
              Annotation[#, 7.*^-6, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{759, 525, 771, 546, 783, 561, 576, 796, 578, 579, 
                 598, 807, 581, 797, 580, 798, 582, 799, 563, 785, 550, 773, 
                 531, 529, 763, 528, 762, 527, 761, 526, 760, 524, 759}]},
               "6.`*^-6"],
              Annotation[#, 6.*^-6, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{738, 495, 758, 522, 757, 523, 770, 545, 782, 560, 
                 575, 577, 596, 597, 615, 820, 616, 821, 617, 822, 600, 808, 
                 599, 809, 601, 811, 583, 800, 565, 786, 564, 787, 551, 774, 
                 534, 532, 764, 530, 506, 503, 746, 501, 744, 499, 742, 497, 
                 740, 494, 738}]},
               "5.`*^-6"],
              Annotation[#, 5.*^-6, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{734, 491, 756, 521, 769, 544, 781, 559, 795, 574, 
                 593, 595, 613, 614, 631, 832, 632, 833, 633, 834, 634, 835, 
                 635, 836, 619, 823, 618, 824, 603, 810, 602, 812, 585, 801, 
                 584, 802, 566, 788, 552, 775, 536, 533, 510, 508, 749, 505, 
                 747, 502, 745, 500, 743, 498, 741, 496, 739, 493, 737, 492, 
                 736, 490, 734}]},
               "4.`*^-6"],
              Annotation[#, 4.*^-6, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[CompressedData["
1:eJwl0L1LQlEAxuFjLg2uErZIODl4l4ZIaMzBvCC33GyJxj6WcKqpDx2rP0pC
bl9ERGA4qhAtLkEEPdLw4+E90zlnZe84OcqEEGL1F0K4N0ac8oNjDjnhjIsK
2RCKzDHiMjfYVKJVe58n6uhcdWcXvNS1tu0b7vCWLXa5xSs22GPMM27ylDUe
cp0HrHKXFbYZsc4S15hneX5vFrg0v79+veeLP/zkN9/1pif7lQ98YcpnDvjI
O6aZ///6A4plKJ4=
                 "]]},
               "3.`*^-6"],
              Annotation[#, 3.*^-6, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[CompressedData["
1:eJwl0DtLgmEYgOH30yGiPaggCKQhiBqD3COChIaETpbuOkhrQ1sNNdRip6XD
DwmlTDqJSCTRlKvQH8jro+Hm4nmGB953Il9aKUYhhJzuEyHUDR3+8JNd/nJA
fxrXUDKEaY4wzUlmmFdBZe1q0X6fRzpWRWt2ZzzXtbbNN9zhbXyDd/EdXnKd
F9zgFTd5ylWeMMtDLvOAGe5xgSXOs8g0c5zhFme5xBTnOMwpDnKMo0ooUi9+
u3/41pda5g6b/OA723xli89sssE31vnCBzZY4xOrfIz+/70PETU0Kg==
                 "]]},
               "2.`*^-6"],
              Annotation[#, 2.*^-6, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[CompressedData["
1:eJwVzLcuxWEcx+G/OrgBBgaDiYUNwWpAOBOLFr2cg9GCGaOyKYvee3fUCxA1
ItoFcAHEY/jkeb/JL296fSQUjgmCoFeZsUGQqh8lKF5fitO7ozfde7/yji+8
5TNv+MRznenYjvKIpzzkCQ94zH0ecY+H3OU+d3jw/w+vGeUVT3nBE17ykR98
4Ce/mahfpSkpLgiymMJ8lqpMOXYdi9jDfg0oZA9zTOOa0rTmNK8lLWtd7W43
2MFNdnKLYW4zwlW2cIWtXGMbF9nEBTZzlg2cYSMnWc0J1nCUlRxhFYdYzkFW
sI/F7GYBu1jIWmazhBnMYzJz+QcLpUaw
                 "]]},
               "1.`*^-6"],
              Annotation[#, 1.*^-6, "Tooltip"]& ], {}, {}}}],
          AspectRatio->1,
          DisplayFunction->Identity,
          Epilog->{
            Opacity[0], 
            EdgeForm[{
              Thickness[Large], 
              GrayLevel[0], 
              Dashing[{Small, Small}]}], 
            GeometricTransformationBox[
             TagBox[
              
              DiskBox[{2004.1843266834069`, 1202.4906988681869`}, {
               431.5634908260871, 327.6992283997823}], 
              "Ellipse"], {{{-0.9987677945918373, 
              0.049627537579023905`}, {-0.049627537579023905`, \
-0.9987677945918373}}, Center}], 
            Opacity[1], 
            RGBColor[1, 0, 0], 
            PointSize[0.03], {}, {
             InsetBox[
              FormBox[
               StyleBox["\"Prior\"", 20, 
                GrayLevel[1], StripOnInput -> False], TraditionalForm], 
              Scaled[{0.95, 0.9}], {1, 0}]}},
          Frame->True,
          FrameLabel->{{
             FormBox["\"\[Beta]\"", TraditionalForm], None}, {
             FormBox["\"\[Alpha]\"", TraditionalForm], None}},
          FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
          GridLinesStyle->Directive[
            GrayLevel[0.5, 0.4]],
          ImageSize->350,
          Method->{"DefaultBoundaryStyle" -> Automatic},
          PlotRange->{All, All},
          PlotRangeClipping->True,
          PlotRangePadding->{Automatic, Automatic},
          Ticks->{Automatic, Automatic}], {186.66666666666666, -183.75}, 
         ImageScaled[{0.5, 0.5}], {350, 350.}], InsetBox[
         GraphicsBox[GraphicsComplexBox[CompressedData["
1:eJxl2Xl0lNUdxvGwRAPYmqBWoJWkB0sjKhCwsprcFCzgAVRkycFyRIsFZRs2
kaXkpYAYCTM3LIbMBH2RpqhEeIlhCwGupoBsnhdKC+dU6YVKinASXqCQ11Kk
Y53nvc1D/sicbzLJ797PTP755acvTR32ctOkpKT0+KfvHr//KBH/e8go/P7R
phbRxq2prVjjziht3Ip67NrGnfQOzacW79J8amE3bkmtqbuuo/NTu9QZ7zXu
ELWihmfq8sR9qOGJ1tTwRMMTrajhiYZnMJ8ansF8aniiJbWmhmdwfmqXGp7o
ELWihmdSOHEfaniiNTU80fBEK2p4ouEZzKeGZzCfGp5oSa2p4Rmcn9qlhic6
RK2o4emRp0eeHnl65OmRp0eeHnl65OmRp0eeHnl65OmRp0eeHnl65OmRp0ee
Hnl65OmRp44k7kMNT7SmhicanmhFDU80PIP51PAM5lPDEy2pNTU8g/NTu9Tw
RIeoFTU8J8jEfajhidbU8ETDE62o4YmGZzCfGp7BfGp4oiW1poZncH5qlxqe
6BC1og7en+SpyVOTpyZPTZ6aPDV5avLU5KnJU5OnJk9Nnpo8NXlq8tTkqclT
k6cmT02eeUWJ+1DDE62p4YmGJ1pRwxMNz2A+NTyD+dTwREtqTQ3P4PzULjU8
0SFqRQ1Plzxd8nTJ0yVPlzxd8nTJ0yVPlzxd8nTJ0yVPlzxd8nTJ0yVPlzxd
8nTJ0yVPlzwHrkjchxqeaE0NTzQ80Yoanmh4BvOp4RnMp4YnWlJrangG56d2
qeGJDlErangq8lTkqchTkaciT0WeijwVeSryVOSpyFORpyJPRZ6KPBV5KvJU
5KnIU5GnIs+eKxP3oYYnWlPDEw1PtKKGJxqewXxqeAbzqeGJltSaGp7B+ald
aniiQ9SKGp4OeTrk6ZCnQ54OeTrk6ZCnQ54OeTrk6ZCnQ54OeTrk6ZCnQ54O
eTrk6ZCnQ54OeWauStyHGp5oTQ1PNDzRihqeaHgG86nhGcynhidaUmtqeAbn
p3ap4YkOUStqeNrkaZOnTZ42edrkaZOnTZ42edrkaZOnTZ42edrkaZOnTZ42
edrkaZOnTZ42edrk2WZ14uvU8ERranii4YlW1PBEwzOYTw3PYD41PNGSWlPD
Mzg/tUsNT3SIWlHDU5KnJE9JnpI8JXlK8pTkKclTkqckT0mekjwleUrylOQp
yVOSpyRPSZ6SPCV5pryduA81PNGaGp5oeKIVNTzR8AzmU8MzmE8NT7Sk1tTw
DM5P7VLDEx2iVtTwtMjTIk+LPC3ytMjTIk+LPC3ytMjTIk+LPC3ytMjTIk+L
PC3ytMjTIk+LPC3ytMjTJ0+fPH3y9MnTJ0+fPH3y9MnTJ0+fPH3y9MnTJ0+f
PH3y9MnTJ0+fPH3y9MnTJ89QceI+1PBEa2p4ouGJVtTwRMMzmE8Nz2A+NTzR
klpTwzM4P7VLDU90iFpRx71eTa2atS3H7ON71ZbdOrbIdEp1UUHdgbAYv/7r
TvqQ2d8fn3YgJ8M3nS3Kho/92e37/Hun51d2Hmd64/lTHT/XYdH7iyX/zrLM
85tnPZBc18fs+w+nzZh182v6ffHztHxsmtfzoNl3P7f9eM1rIiJOLtk1vn8D
7cPj87KWXXij2Y9Mt97aYsTQXNNXT2d2KJlk+kTKwMv/KDZd2W383s41EVGx
YN72ov5mnz6td5vDSWNNd71eeXrqPNPelmevnH7b9ObJ9clDK0xPfWhZ291H
b9/Pd+td9tHye0y/9pfeW/KyTVeF3MoOr5j+ttVvd9SvNP3LDTd27dwTEZt6
/inccbLZ9/9hztmiCW1Mb3w/qfPBNLPv/3jg45OfvGq+v+v8xPJPTpiueXPd
xSe2mT6UebJTVTH9PyH+ehSFV//txACz3533WSx73f916ZdfpSXfI8Xitbn1
rzxl9uk7r4rZSyeZrh8kksrCpjvYOQWfOqZHXc9urY/fvo8v/mHrltEWUiw4
1L7t6gdv38+POpnbfEm2FH1n5F9/vqXZz29/cfwfN9SZ52c98/TIq67p8uwe
d+RUmu74aPq2t4pN78raX12SQ/v++H3vHtMsu90h0wMKn5VVH5vO3/Xu2dFr
TW+7UPfYjTdM17ftuzQWMvcrX3p0YovTpvf22R0q3Gf6+KXyWXd/ZPrc+tK5
K1aZ/mZUYf5986Uo2FPReV632/ftV7rkZK7cKEVxdvk/85vTvj3+80sePrJ5
QdsiMbv76K31G0tEtyF3ptamhUVJu9zuHc6ViNoNZ45Ujg+L6iaZW0a1j4qS
ptUFi3aHRZuvut3Y+2ZUPDjyiJ8+OSz6ZnaxF/81KkZX/8rbfyYs5k/59mD6
tRJRVXZz0+apETHK2pL982eiYpFoebp3SkSMcQd1fHl2VCzbMWXn/f0i4qWM
sz9Y/05UrOz651X/+l1ETAjNvab3xd9f7/cIHdsREU0X5r0+5Y6YWPTJ4sqy
hyKiz6kJad3j983r/0B08MSImNFlzocNY2Li0QNb86+WR0TDhpKmCwdExZV5
tYtyL0ZEXvfcC+GZUfH7WqfLxPvj788954+VrouKVpEpa3/RS4ofPyV3fvh5
VKzq8UirpOelOJf2XKfvft+kIXtemDNUCutWw8gXk0uFfatXkxbDpRgXmTSm
9dmYWDYxbf/y+M8PSD/zm5o98b/vk+ffap0uxcObR7w6MxYTY/upp4ubS1F2
c8XAwfNjom/2lMd7fSlFw6Wtx9sPjb9+M1LaF1dJMejsqV9fTo+J7R+8l3yt
WIrYiRu1NZejYubf+9YNmyXFhe13/eRiu1JxqaDFiK5fSHHfuDubDEkqFanL
9qlen0mRm9q0dtO5mMgqXPhIv0opJlX/51Dq4ZgYtvyJNYNtKdZMaNg83YmJ
6eFvmo0slKLm3iurTqyOiZWRrVNfeF2K4alW3Zr4+z3nroyKinwptvkf5FUc
jYmCufmfPtmuSPwXSEnxdA==
           "], {{
             {RGBColor[0.148, 0.33, 0.54], EdgeForm[None], 
              GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJxNmQn4T1Uax++lVYt2kkTJlizZKZK17FumFFkKpZCdyJZ9SYqSRCQlJIV2
LdprmppmCmXSMm2mTWmkZt7Pcz/3+fU8vs/r/Z1z3vXcc+/5/sv1Gdz5hiJJ
khQrmiTxLykRSAP8dnrg8MARgTLKIwNnKIsFyiqPClQLlAycGmgdOC9QK1Aj
UCpwWqBp4JxA1UBNfysdaBKoHKiifpi+GT9UnbGTAie7/hTjPVdZUj+HuOas
wDGBYwPljPHowJnKY1xDrkWNu6jrGwcqGVNzc6seaGXc5DY9MDRwY2BS4LrA
oEA9/eGnvpJYvg/sCOwMvB3YGngi8M/A84EXAm8GNge2BN5SMq+BNsoHGirP
DtS1B/i7IFDRuFsYL7VvqSTu8wMVnNdIGxXs0+n2ubaSPtdRljXn0s6jLifa
j7+ax5P6PsGx8ta+eKBvoF2gfaCTvomls5LYuyip/dWBDoGOgWuUrLvE+Ihr
dKCPtsco+wVGBXo71lV7TfRd31q+mGZ9fS/kVdpt4zpkW302NNaiRbK9+0ya
5VFPW5cGLkyysQ7abuj6us4ba1zkNE5JTjcp++uzjmuGBC4P9Eiy/YW8Isn2
GfLKwMX2rLZ9Zu+y96e5fqi9pfbH2WPk8YFh2ugZ2JFmvr4KOdAeULPxxjUg
MEHJ+MTAtUm210cmWe2o2YhAL/Xh2u7lvG7Wqb897Ky9zvqraFzsm3eSbB89
Ffib8unA+4HnAtsCKwKzA3MC85JsH9D/+UrqfauSeq8MzHXuKiVzOec4NzhH
NgXuCSwLPKa8N/BoYKljC7R3k/5HWIM7AjdbG9bNCMx0PXKW/kcZ60LrO8Gx
4dq6TdvjzW2ka2baM+Y9rt3lSXZOLLceW5T3BZ6IxFYGVgXWGt+iwMPKxYF1
yjuTbN+x/3gGysSa2oFaaXYulrRG5UKvF6gbODNQX329Nu4KPBS4XX8PWC9y
2mpc9OEJ5Sr7jLw/sDFwt7V+JLBEfYO20ddob6Fr5tvn1coF1mOW/aFn0+0H
dqepY/cW9Q+S7Nx9MfCPJNtfnMXb9U0sLyuJ8RlzI5avAu8F/h74UBsvBb5I
sn3M/v238t3AK9pgT72q3OSa9fp7wx5vds3T+sTHs0n2DLyeZHuUea9p4zHj
XmufX1CuM651+thmn5j3tXZ5tjgrObM4277xN+rxnbntMJbV5k8cD2prt3EQ
17+Ub1h3zqxh9m+qdWcvsL95JtiPE5Ps/blYOTnwiTZ4H+5R8j782Nrh7/Mk
e/dQ671J9h6ln/9REvdnSfauZd6n2kDfaY/p7S4l/flI+ao5v+S8b60HPjjX
OH95XjjnWqtzprZSPyeejZMDpwSKB/4bvx0IHBP/3x/y18Bv5sB+KR+/H+tc
nrWjAkf7rCFZd5aSeWUDxZx3tuuOC3QLNAlcmGb+PtPHL/bmE33vsR7YQie+
PwJfJtm+/tm+sma/61izzx4w9j/nfu36T/XHGXJE4MhABeM6PlAlcJJ1OTVQ
NHBIoJTy0MBpysMCJTmDnNc10NjcLjW/poGbeW8Frg3cFZgSmBro7vhFgdLa
OzxQIpBqlzjIgRfBGcZLTSsFTgicGKisJO7TtXGEOR2wh/Q40S558tvBJFv3
u3Vl/R9JwR814zkjjm/dv/jeZ+3p68/2ra3nLudtO2V9a1HZul4QqGjs55on
9esQaBBoGGjvOvQurmlsLbFxjn7KugfrWJey+iznfqxu/0ppt7x7sIF7FJ13
SBnX13cdY+fZD2pZS8m8mva+tDFVMrfOgfON9c7AZHvcUd+NApfor457Za9n
AHsKyRnGnkLyDU4Pfwj5Y5LtC35Dp3/f+KzTY8Z/SrLn7xefA/bITz4HVdOs
99T6oM8x5301a3+qe5C6VnUvVrU/F5s/cbe2LujNHMdGcyX1bmWNmNcyUEO9
hePobaxBXfVS1nRxYJK1uztwS2Ba4Po0e07+ErhSH8TSU0mMvZTUeHDgssDl
1maX5yW2hgSG6ue6wKDAhMCANHs+J6bZM8rYVdpro63m5tE3zfZ3e+fyzHdz
DZLn/grzJ9be2mhrXM20dYM58VsPbbf0t4ucN9kYqcFNgWsC/a3NYPPh25Pv
jNXug488+0aaA/5HKfu4p3ZaF77TW/o+4Nufuwf3A761uXdwP+uhZN5obVCD
Mcp+gRH2AH/jjZGaTjF2cp2qJO6xrrvaHC63BjdaO/o8TEmfhyt72b8ezhtk
vbsbV1t7Qy+72Bti6ZRmz+h848b/gsA463qbktgXKtkXywOzArMD9wXmBOYG
Vvgb+sY0269LA48q7wnMS7N6jXHeSPswV8nYssCMwMzAvcpZ2mC/TtfWdOct
SrM9yv69I83eKxNdM9w+zFbi73bzYN5j+sPPEvvBPtqkD8Y2pNn7aYmxDNPu
Q9rC51olsTysXGx8N7qGvnKmdzT2oY4NsA9d7H97563TBmfng/YAfw/YJ/qz
2X5Q+y1KerJVyV3iEWOnH+u1d5djc+3JGu3hY5W/sS9WB27V3+PWCX+8D3hn
8H7gHcO5xfnFu4RznfMdDgi+Ad4BXoY7Lndd+J3T1OFx4EbgWQ5zLmM511Mu
KXBY2Mp5K3iNoxxHz7kt5sFblNduzjHBOeV3ae7W3FkrqnN3raRe3HHWw4NU
duwUbcB/wZtUcYw7VjV9kFt1dXKroU5O8C81zaGWes4x1TMH+IM65lRPPed0
ahkrfEujpMAlNTDeRupwB9yTppl/A33kfFBt87xAW+TWWL26Z1pz82yaZPzI
k2mWX1qkwEm1MJ9W6tjlm/pi69JEu+TZ2nm1HG9tj2taI+4Y3JPzO8cMcyBu
zt52SYFv6mROHRwj547q+OA7/grr0cmxlv7WIylwVZ3NDW6jW1I40y837q7O
I9ae2s35rKvN9aoku0/k3BN6efc+z8bFjvc0BziuPsaKjfzd0s8x4u2vj5xn
6W8cA9WJF54Sbqaedtsa3zDrh7/h6jkPNSQp8FBDjWuE84gJbmNUUuDjRpvP
SOf1dnyk8Y51Xs6LjU0KvNi4pMA9wYfAOU1MMp5lT5rFvzvNchvvGvKZ5DzG
J6uXLJLdPQ+mWQ7sa+6hB9Jszvdp9py0tQ/dtIVP7oB8H/LtCI/B3fEt8+D+
Osc856mTJ9zDLPOco57zU/OMFR5jgbEvVM95q/nmv0Cd9SuSjNsgf/iV25PC
nXmR+cBrLDHvOx2b6m93WZdFrqcGS10zS9vwSjwz9zjGM7RMPeezlpknHA73
eL6P+E56MinwayuNHZ5gtbmtUZ/vmlVJgbu533zgEh5MCvzUw+axXp241zov
57PWmtsG55HrI+rktlGdfB5VJ59N6jnft8n8HlenHpvVqf0WdXLeqp7zWVuT
Ap+FPsd5rHs+yTgDuIPh1nqmecKhPJsU+JrnkwJf84J5bnPeWse3medLziMf
+IqXkwKv9Ir5b3dezmFtdz2xvG/Or7mGPOFbXjcH+JK3zflNx/K/SbxpjV53
PXm/45rntA2vlHO4jMEdvav+rOPvmecH1oj98Yxzye1Dx3KOZmdS4Gh2mdsO
5213fIf5fOw84v4kyXiMnEv6xLh3Oy/nrXab36fOI//P1Mntc3Xy+UI95/i+
MB/4kC/N72t16vGNOrX/Vp2c96rnvNVe8/lOfbX1eMr8uGNwHnFWceb2Nk/u
Jz8aK1zMr8Z6QJ1Yf1Mn1oPq3GPhHbjXwgWV97uM+y73XngI7svc07mbcweG
g2Jsj372Wz/W/Gx996sT0xHaIEb8oJMDd2/u5eTEODo1gh/JuSXkH/Zpn3nu
1s8+a83479ojRu68+Z3/z7xSKfOEk4BzyHmZE/UHH4SOf+716HACJdS5W3Kf
4l7JfZJ7Un6/7OHYbL+fl/udzfc9393Ehx94JXoAfwRnRw/gjI5LC3wfPEvO
96EX8/v4DPtRTj3nznIuDQnvQE+O1Qa9L25vizhewh6Usa+77NMPSYE3wR77
sog1wDY8QzV91lCnrjXVSzoOfwGfBK8ER5VzHzkX0tQxOB3uK51d08x5JdRz
fqWq63I+Dm6oouvPV2+sXlmfja0X94naaYFvgj/J/9Zb0v5Xcd3J+kEv7dya
+iBG7ro8t6l7hG807mEd9AlH0VU/cCat9X2JOrG0Ueeu01b9hD/lRK+4/5R3
T1RQ51woag9zfrCYMeKnlT1gX7Yw7lbq1BTuo7s1vkydHlxq3E0dR29gTjlf
iGyXFjipZva+hXrOS7a17l3ta3735v7LPXq5OvdF7o33WQu4jV7Word6zkNd
mRZ4qJ766OM8YuQ+3M/ewEdcYyx9ndfe8b5pge8YZj8HuIZ44ZsGWhe4lOvT
Avd0rXUZpN7FuQOs5WDX5NwK93HOgiGOcTYMVb/C8aHmCZcApwBnMc/a5LzS
SGOHUxljbnAp48xttPNyzmi0+Yx3HnHDYdxs3JPUiXuC8wY6PsH8JjuP/Keo
5xzTFPO5RZ18pqmTz3R18puhTj1mqlP7Weo5nzLLPOeo5zzOHMEeWWH/R2ij
u/ENMu/51o444CdyDgaZ/00AmfPHSDgReArO5jXmzG+LrC9cBZxFzss8ZJ3Q
b7eOi9Rzbus218GtrFZfo058cCIr0wK/s1YfzL0/LXBSS63XMvUJ+lxofZea
J883e449BV/COVEhLfA4m60B3A38029pdh/gPkSu64yDeqxXz3mfLdZsg2P4
26gtnmF4HHivnONbkBZ4uo3GvUl9mXPRlxvX49biCf39H6LFHMQ=
                 "]], 
                PolygonBox[{{543, 153, 152, 509}, {510, 44, 45, 442}, {542, 
                 133, 132, 507}, {455, 86, 65, 515}, {467, 68, 90, 474}, {513,
                  45, 46, 448}, {509, 152, 130, 506}, {489, 90, 112, 495}, {
                 479, 108, 86, 455}, {496, 130, 108, 482}, {495, 112, 133, 
                 542}, {445, 65, 44, 510}, {508, 132, 153, 543}, {448, 46, 68,
                  451}}]}]}, 
             {RGBColor[
              0.42373632277382167`, 0.45262298883425045`, 0.5699760914045265],
               EdgeForm[None], 
              GraphicsGroupBox[{
                PolygonBox[{{509, 131, 543}, {461, 87, 453}, {543, 131, 
                 508}, {528, 111, 490}, {495, 111, 489}, {506, 131, 509}, {
                 455, 87, 479}, {501, 131, 532}, {523, 87, 461}, {507, 111, 
                 542}, {542, 111, 495}, {515, 87, 455}}], 
                PolygonBox[{{446, 445, 510, 511}, {443, 442, 513, 514}, {511, 
                 510, 442, 443}, {449, 448, 451, 452}, {452, 451, 467, 468}, {
                 468, 467, 474, 475}, {514, 513, 448, 449}, {497, 496, 482, 
                 483}}], 
                PolygonBox[{{537, 536, 508, 131, 501}, {453, 87, 515, 445, 
                 446}, {483, 482, 479, 87, 523}, {490, 111, 507, 536, 537}, {
                 532, 131, 506, 496, 497}, {475, 474, 489, 111, 528}}]}]}, 
             {RGBColor[
              0.6278938712897028, 0.524371648057084, 0.44996015234087766`], 
              EdgeForm[None], 
              GraphicsGroupBox[{
                PolygonBox[{{456, 67, 520}, {450, 67, 456}, {452, 67, 449}, {
                 449, 67, 514}}], 
                PolygonBox[{{533, 532, 497, 498}, {484, 483, 523, 524}, {469, 
                 468, 475, 476}, {476, 475, 528, 529}, {498, 497, 483, 484}, {
                 502, 501, 532, 533}, {491, 490, 537, 538}, {512, 511, 443, 
                 444}, {454, 453, 446, 447}, {447, 446, 511, 512}, {462, 461, 
                 453, 454}, {524, 523, 461, 462}, {538, 537, 501, 502}, {529, 
                 528, 490, 491}}], 
                PolygonBox[{{520, 67, 452, 468, 469}, {444, 443, 514, 67, 
                 450}}]}]}, 
             {RGBColor[
              0.8320514198055838, 0.5961203072799177, 0.32994421327722867`], 
              EdgeForm[None], 
              GraphicsGroupBox[{
                PolygonBox[{{512, 66, 447}, {444, 66, 512}, {447, 66, 454}, {
                 450, 66, 444}}], 
                PolygonBox[{{525, 524, 462, 463}, {521, 520, 469, 470}, {485, 
                 484, 524, 525}, {534, 533, 498, 499}, {530, 529, 491, 492}, {
                 470, 469, 476, 477}, {457, 456, 520, 521}, {499, 498, 484, 
                 485}, {477, 476, 529, 530}, {492, 491, 538, 539}, {539, 538, 
                 502, 503}, {503, 502, 533, 534}}], 
                PolygonBox[{{463, 462, 454, 66, 516}, {516, 66, 450, 456, 
                 457}}]}]}, 
             {RGBColor[
              0.9217586211376142, 0.6743965528440355, 0.357451725526604], 
              EdgeForm[None], 
              GraphicsGroupBox[
               PolygonBox[{{522, 521, 470, 471}, {540, 539, 503, 504}, {471, 
                470, 477, 478}, {531, 530, 492, 493}, {500, 499, 485, 486}, {
                526, 525, 463, 464}, {464, 463, 516, 517}, {458, 457, 521, 
                522}, {493, 492, 539, 540}, {504, 503, 534, 535}, {478, 477, 
                530, 531}, {486, 485, 525, 526}, {535, 534, 499, 500}, {517, 
                516, 457, 458}}]]}, 
             {RGBColor[
              0.9543716480570841, 0.7559291201427101, 0.4585521089769604], 
              EdgeForm[None], 
              GraphicsGroupBox[{
                PolygonBox[{{472, 89, 487}, {478, 89, 471}, {526, 109, 486}, {
                 486, 109, 500}, {471, 89, 522}, {488, 109, 480}, {531, 89, 
                 478}, {500, 109, 535}}], 
                PolygonBox[{{465, 464, 517, 518}, {494, 493, 540, 541}, {518, 
                 517, 458, 459}, {541, 540, 504, 505}}], 
                PolygonBox[{{487, 89, 531, 493, 494}, {459, 458, 522, 89, 
                 472}, {505, 504, 535, 109, 488}, {480, 109, 526, 464, 
                 465}}]}]}, 
             {RGBColor[
              0.9869846749765538, 0.8374616874413845, 0.5596524924273167], 
              EdgeForm[None], 
              GraphicsGroupBox[{
                PolygonBox[{{488, 110, 505}, {541, 110, 494}, {505, 110, 
                 541}, {494, 110, 487}}], 
                PolygonBox[{{481, 480, 465, 466}, {466, 465, 518, 519}, {519, 
                 518, 459, 460}, {460, 459, 472, 473}}], 
                PolygonBox[{{527, 110, 488, 480, 481}, {473, 472, 487, 110, 
                 527}}]}]}, 
             {RGBColor[1., 0.9499999999999998, 0.7499999999999998], EdgeForm[
              None], GraphicsGroupBox[
               PolygonBox[{{527, 88, 473}, {460, 88, 519}, {473, 88, 460}, {
                481, 88, 527}, {466, 88, 481}, {519, 88, 466}}]]}}, {{}, 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{519, 466, 481, 527, 473, 460, 519}]},
               "0.00014`"],
              Annotation[#, 0.00014, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{518, 465, 480, 488, 505, 541, 494, 487, 472, 459, 
                 518}]},
               "0.00012`"],
              Annotation[#, 0.00012, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{517, 464, 526, 486, 500, 535, 504, 540, 493, 531, 
                 478, 471, 522, 458, 517}]},
               "0.0001`"],
              Annotation[#, 0.0001, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{516, 463, 525, 485, 499, 534, 503, 539, 492, 530, 
                 477, 470, 521, 457, 516}]},
               "0.00008`"],
              Annotation[#, 0.00008, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{512, 447, 454, 462, 524, 484, 498, 533, 502, 538, 
                 491, 529, 476, 469, 520, 456, 450, 444, 512}]},
               "0.00006`"],
              Annotation[#, 0.00006, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{511, 446, 453, 461, 523, 483, 497, 532, 501, 537, 
                 490, 528, 475, 468, 452, 449, 514, 443, 511}]},
               "0.00004`"],
              Annotation[#, 0.00004, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{445, 510, 442, 513, 448, 451, 467, 474, 489, 495, 
                 542, 507, 536, 508, 543, 509, 506, 496, 482, 479, 455, 515, 
                 445}]},
               "0.00002`"],
              Annotation[#, 0.00002, "Tooltip"]& ], {}, {}}}],
          AspectRatio->1,
          DisplayFunction->Identity,
          Epilog->{
            Opacity[0], 
            EdgeForm[{
              Thickness[Large], 
              GrayLevel[0], 
              Dashing[{Small, Small}]}], 
            GeometricTransformationBox[
             TagBox[
              
              DiskBox[{1731.8261779158092`, 1026.8730487885146`}, {
               91.52335368281032, 37.93737948419992}], 
              "Ellipse"], {{{-0.8522320022474301, 
              0.5231640415255394}, {-0.5231640415255394, \
-0.8522320022474301}}, Center}], 
            Opacity[1], 
            RGBColor[1, 0, 0], 
            PointSize[0.03], {
             PointBox[{1700, 1000}]}, {
             InsetBox[
              FormBox[
               StyleBox["\"Posterior\"", 20, 
                GrayLevel[1], StripOnInput -> False], TraditionalForm], 
              Scaled[{0.95, 0.9}], {1, 0}]}},
          Frame->True,
          FrameLabel->{{
             FormBox["\"\[Beta]\"", TraditionalForm], None}, {
             FormBox["\"\[Alpha]\"", TraditionalForm], None}},
          FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
          GridLinesStyle->Directive[
            GrayLevel[0.5, 0.4]],
          ImageSize->350,
          Method->{"DefaultBoundaryStyle" -> Automatic},
          PlotRange->{All, All},
          PlotRangeClipping->True,
          PlotRangePadding->{Automatic, Automatic},
          Ticks->{Automatic, Automatic}], {560., -183.75}, 
         ImageScaled[{0.5, 0.5}], {350, 350.}]}, {}},
      ContentSelectable->True,
      ImageSize->{758.6666666666666, 379.5},
      PlotRangePadding->{6, 5}]}
   },
   AutoDelete->False,
   GridBoxDividers->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
   GridBoxSpacings->{"Columns" -> {{3}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{"With", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"\[Mu]x", "=", "2000"}], ",", 
     RowBox[{"\[Mu]y", "=", "1200"}], ",", 
     RowBox[{"\[Sigma]x", "=", "200"}], ",", 
     RowBox[{"\[Sigma]y", "=", "150"}], ",", 
     RowBox[{"\[Sigma]xy", "=", "1000"}], ",", 
     RowBox[{"xdat", "=", 
      RowBox[{"{", "2300", "}"}]}], ",", 
     RowBox[{"ydat", "=", 
      RowBox[{"{", "1000", "}"}]}]}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"fig7", "=", 
     RowBox[{"GraphicsGrid", "[", 
      RowBox[{"{", 
       RowBox[{"{", "\[IndentingNewLine]", 
        RowBox[{
         RowBox[{"plotcontour", "[", 
          RowBox[{
          "priorpdf1", ",", "prior1", ",", "\[Mu]x", ",", "\[Sigma]x", ",", 
           "\[Mu]y", ",", "\[Sigma]y", ",", "\[Sigma]xy", ",", 
           RowBox[{"{", "}"}], ",", 
           RowBox[{"{", "}"}], ",", 
           RowBox[{"Epilog", "->", 
            RowBox[{"label", "[", "\"\<Prior\>\"", "]"}]}]}], "]"}], ",", 
         "\[IndentingNewLine]", 
         RowBox[{"plotcontour", "[", 
          RowBox[{
          "posteriorpdf1", ",", "posterior1", ",", "\[Mu]x", ",", "\[Sigma]x",
            ",", "\[Mu]y", ",", "\[Sigma]y", ",", "\[Sigma]xy", ",", "xdat", 
           ",", "ydat", ",", 
           RowBox[{"Epilog", "\[Rule]", "\[IndentingNewLine]", 
            RowBox[{"label", "[", "\"\<Posterior\>\"", "]"}]}]}], "]"}]}], 
        "\[IndentingNewLine]", "}"}], "}"}], "]"}]}], ";", 
    "\[IndentingNewLine]", 
    RowBox[{"fig8", "=", 
     RowBox[{"GraphicsGrid", "[", 
      RowBox[{"{", 
       RowBox[{"{", "\[IndentingNewLine]", 
        RowBox[{
         RowBox[{"plotcontour", "[", 
          RowBox[{
          "priorpdf2", ",", "prior2", ",", "\[Mu]x", ",", "\[Sigma]x", ",", 
           "\[Mu]y", ",", "\[Sigma]y", ",", "\[Sigma]xy", ",", 
           RowBox[{"{", "}"}], ",", 
           RowBox[{"{", "}"}], ",", 
           RowBox[{"Epilog", "->", 
            RowBox[{"label", "[", "\"\<Prior\>\"", "]"}]}]}], "]"}], ",", 
         "\[IndentingNewLine]", 
         RowBox[{"plotcontour", "[", 
          RowBox[{
          "posteriorkdepdf2", ",", "posterior2", ",", "\[Mu]x", ",", 
           "\[Sigma]x", ",", "\[Mu]y", ",", "\[Sigma]y", ",", "\[Sigma]xy", 
           ",", "xdat", ",", "ydat", ",", 
           RowBox[{"Epilog", "->", 
            RowBox[{"label", "[", "\"\<Posterior\>\"", "]"}]}]}], "]"}]}], 
        "\[IndentingNewLine]", "}"}], "}"}], "]"}]}], ";"}]}], 
  "\[IndentingNewLine]", "]"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"label2", "[", "txt_", "]"}], ":=", 
   RowBox[{"Graphics", "[", 
    RowBox[{
     RowBox[{"Rotate", "[", 
      RowBox[{
       RowBox[{"Style", "[", 
        RowBox[{
         RowBox[{"Text", "[", "txt", "]"}], ",", "20"}], "]"}], ",", 
       RowBox[{"\[Pi]", "/", "2"}]}], "]"}], ",", 
     RowBox[{"ImageSize", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"18", ",", "300"}], "}"}]}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"exportme", "[", "\"\<bivar-anticorrelated-update-large\>\"", "]"}],
   "@", 
  RowBox[{"Grid", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
        RowBox[{"label2", "@", "\"\<Uncorrelated\>\""}], ",", "fig7"}], "}"}],
       ",", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"label2", "[", "\"\<Correlated\>\"", "]"}], ",", "fig8"}], 
       "}"}]}], "}"}], ",", 
    RowBox[{"Dividers", "\[Rule]", "All"}], ",", 
    RowBox[{"Spacings", "\[Rule]", "3"}]}], "]"}]}]}], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {
     GraphicsBox[GeometricTransformationBox[
       StyleBox[InsetBox["\<\"Uncorrelated\"\>", {0, 0}],
        StripOnInput->False,
        FontSize->20], {{{0, -1}, {1, 0}}, Center}],
      ImageSize->{18, 300}], 
     GraphicsBox[{{}, {InsetBox[
         GraphicsBox[GraphicsComplexBox[CompressedData["
1:eJxl2XlcTP37x/GEZInEHXeh3Z07smZLupJdJZGlQotdSLKHQbbc1Zmt1Mw0
ZwYtlhpbilsdJNkypUSWji1ucRtLjC2/c/++PnMeru5/PF66OWeeZ8o577EL
XxEw39jIyKhPcyOj/37933+p8P+/2P71v19p1JD2a7OoBbJf21b+azOoQxW/
tlE6Oj5qUKLjowb616ZQs6j7qdD5o9aitlX/2lGoGdTE0zzh5+tBTTxJs6iJ
J2niSZpBTTxJE0/D8VETT8PxURNP0hRqFjXxNJw/ai1q4kk6CjWDmngaJf58
PaiJJ2kWNfEkTTxJM6iJJ2niaTg+auJpOD5q4kmaQs2iJp6G80etRU08SUeh
ZlATTx3y1CFPHfLUIU8d8tQhTx3y1CFPHfLUIU8d8tQhTx3y1CFPHfLUIU8d
8tQhTx3y1CFPHfJkk36+HtTEkzSLmniSJp6kGdTEkzTxNBwfNfE0HB818SRN
oWZRE0/D+aPWoiaepKNQM6iJ5yLq5+tBTTxJs6iJJ2niSZpBTTxJE0/D8VET
T8PxURNP0hRqFjXxNJw/ai1q4kk6CjWD2vD+RJ4s8mSRJ4s8WeTJIk8WebLI
k0WeLPJkkSeLPFnkySJPFnmyyJNFnizyZJEnizxZ5DlT+PP1oCaepFnUxJM0
8STNoCaepImn4fioiafh+KiJJ2kKNYuaeBrOH7UWNfEkHYWaQU08tchTizy1
yFOLPLXIU4s8tchTizy1yFOLPLXIU4s8tchTizy1yFOLPLXIU4s8tchTizy1
yHO86OfrQU08SbOoiSdp4kmaQU08SRNPw/FRE0/D8VETT9IUahY18TScP2ot
auJJOgo1g5p4MsiTQZ4M8mSQJ4M8GeTJIE8GeTLIk0GeDPJkkCeDPBnkySBP
BnkyyJNBngzyZJAngzyHin++HtTEkzSLmniSJp6kGdTEkzTxNBwfNfE0HB81
8SRNoWZRE0/D+aPWoiaepKNQM6iJpwZ5apCnBnlqkKcGeWqQpwZ5apCnBnlq
kKcGeWqQpwZ5apCnBnlqkKcGeWqQpwZ5apCnBnk6S36+HtTEkzSLmniSJp6k
GdTEkzTxNBwfNfE0HB818SRNoWZRE0/D+aPWoiaepKNQM6iJJ408aeRJI08a
edLIk0aeNPKkkSeNPGnkSSNPGnnSyJNGnjTypJEnjTxp5EkjTxp50sizq/Tn
76MmnqRZ1MSTNPEkzaAmnqSJp+H4qImn4fioiSdpCjWLmngazh+1FjXxJB2F
mkFNPCnkSSFPCnlSyJNCnhTypJAnhTwp5EkhTwp5UsiTQp4U8qSQJ4U8KeRJ
IU8KeVLIk0Kepsk/Xw9q4kmaRU08SRNP0gxq4kmaeBqOj5p4Go6PmniSplCz
qImn4fxRa1ETT9JRqBnUxFOAPAXIU4A8BchTgDwFyFOAPAXIU4A8BchTgDwF
yFOAPAXIU4A8BchTgDwFyFOAPAXIU4A89chTjzz1yFOPPPXIU4889chTjzz1
yFOPPPXIU4889chTjzz1yFOPPPXIU4889chTjzz1yDMq5efrQU08SbOoiSdp
4kmaQU08SRNPw/FRE0/D8VETT9IUahY18TScP2otauJJOgo1g5o7/3RVs5PH
2iRAX03V2JgtTT+/MT/kLsrgvh54xmcYhKPPbzivs8bdx/jtSwCfVu+CDg1o
+vmG064er0778J8XZf428Gy4Lf95UOBTm7LVNvznQaGe4REdx/OfB9V9euNV
u4f/PGiLSfxM51cJoPfLqG/+Gn2ewV3fO5YJvvcyEmHDrbbz68c0/fwgwD3w
ZIgZ//lAhbGvbO+zRChn+wrdn6PPDzif46+jWjoX858XHHDvO8KqmP+8QGPM
VLV6yv35Arh4rBF9fsBdv/IO8r7z5yXC5ldL5l+IQfs/9/58eTN11/MdSVDe
f7Gr6jDa6zlfO7W9MkeSBLdm3lSXrWq6z09YviqozR/8vr4gKy56ki2/r+97
eelp4ZYk2J1kNIEqRfs69346X7B4h3XrJLDxnJdUd5Pf0wvyvsbeGYX2bs5v
7YY7pUobCj6vfbrwYyHav7nzGZdq5Zc2nYLHwy4cGT6s6d7d8jmUdXXm99kv
2/pNPG7B77N7TRxisi34ffbliR6jbf/g99lvJo2LC6ZQYLUy3qkmuOnefWa5
q9k0EwpivnaKyXJtum/XHajYMY17fdHpU3bus1D/+nXu58euhV6HQyIpeH1u
m/jcO7Rfc++vhKDfjKZnUDCqMM7kkQ/aq7nrNVu8ZGR6NgX3Z56Z+2ot2qu5
1/82+dARu1oK9ixx+3ziO9qvOQ/IaS1/xPAeZq0SelQxvIeuWbPgCw8oGLy5
TciSOrRfc9f7zEjPj1QqBdetbkwdXtJ0r96daOxns4SChPNXM8qjmu7TYZ9e
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
           "], {{
             {RGBColor[0.148, 0.33, 0.54], EdgeForm[None], 
              GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJxNl0lwVkUUhd/rPyizDAIGgaoIJGFGWZFJhq0GCAE2rkCSECldSRRCkp0y
hZABypIABhECiiPgUKCoJbhT2IlbSxzXlBrLc+p+f+Hi5Hb3333v7Tucfinb
+kLD8ynLsil5lhUkZwgaZl7r0Z9jmhxGviO8LRxFXhCOCx8I7wsnhI+ED4Uu
9g0IQ8LHwhVhm/Cy8JLwrLCb+QahWWgSWoQOYa/1yHarZGeK39qFPUKZnN0l
+arWt6KvTVgnbEf3IL7Yv5PCJfzrFc4JZ4WD+PeGcIS1t4Ru4U3htNDD2hnh
EGvFM77TZeEA81NCRSHi0ptifhnbA8TsvNAnDOPHPvxz/Pajw/N+9npfuTBJ
mCw0ECPHa6Owg/lR2XtXcpHsH0nhg325rnGX8vm75q+kiJvj91QKnfck+1LE
q1Lre4lpaeF+7ss1PpTCv3kaX5OcJZ2va+0rjR/T+KTGX2s8V+NTGn+r8XKN
T2t8Q+NlGg9pfCDFnedKT2Me+fUdmrW+UnJcIWL8CXWzh9z0kP9e5p3EtJ/z
ndRNM7XTjuzjzKfCWPnwWop66Safrr/DzHdRE87n/hR1vC+Fr/b5IPXYhb02
dBzEdj/2vhBmy9Zx7W+UrBOeFJYKjwilwjxhovBQFrHx2kxhjjBaGJNFjB8Q
HhQGU/z2mXTP59wk4UetX/NZydWSi4TFWeRhAjaahQ1Cg3BVOCucEyrd+8LU
LHI4njNlwjjmVfhqmwvY+zD3ME+YNx4VRuFrNXvLhV6hXdgr9CE7hAphMrav
5mHvS+dTsjOLei1Fdwnxq8R+LecriVcJtmcTp9HcrRebd6S3SfKXPHJgHQuF
Gny0riVwn+/0vfatl/zB9acL7nSMNR6TIm4zJNdyxvk8L/Rn4bvv2kS8Xfeu
/891dqowovG/wl8p5BrJX/M483ce+anGr5sp9I1o/VYKG2NT+FXFvm/yGH+X
R15riM1GZB2+rCf3a6gL+31RurZI3s4jFs7ntCz8nUk+vXc6cRnmzjfNNdSR
7exAusY3C6uyqMEtyDXk3PHwuZ3s8+/PCZuYO9+trDk2d50vaqUFO3+mWFuR
olZcMyccJ+Gi71GIfE6itsyTNUKtUJcH15gv/TbU5/FWbPzf7zuYN8IJ29hb
7X6Dg0cVIpf1Kc6br6qEaYXQ+aJzxJrPXc+jZ927tlNhjoWvG7BnLtqKve34
ZR1tKXzZlYILzYl+kxJ1WnyrZ5Cn+disgjeHOFNCTt1P5lb73JKit0rRtRK7
voPfn/1wYGsiNim+ESq5wxCcdwi+3cB9dhMz38Nv2D509cHF5sjb5NY5nkIf
uwfv8R49LfmH8I9rKEUOG7Cxghp4gr3l5OYnzX/W+uN+r4T3tLZYF7yj8S3r
T8EH5gX3cEkhzj2Toi+dU9/vLvU3Qg1VZPdryrLIu5bmxFpyaP8GeBP8Nhym
hnbzJnTwm9+h4rvkN2wP81H0nPNURf7X8VsTMXa8/T4V35w2aqeT2m1Fb3N+
/xuqhd+62WufbsBj5jPzpXmz+M7Mwo/p9L/fEvP9AvLkWlkKhyyix1dRg0s4
s5i+Xw2vLOS8a20Z5z03F9fR3x3wRD314174LQ++MAc73uY8891EYj8Xm2ux
V+Qj6zMXmqPMe6Xwp3m0yI/+7VYeZ81t9qOR3zbBQ63cbTNr1mUea2JtJ/t8
zy2sVbNvPTZaONPM/dqJo+3Vku/lxMVviP0cptZq0HeeGhqg/9yPrjt/y56g
zy7wu7+5h+k3n7lMP/vb1N+wPdSdv4sHOX8JHafgl27q9zR15vk5atd6r6Cv
+A18gNr096J5rCNF39Ryhwnkyt8XlfSZ+83x7crivS9+H7hH/X7PoS6L/28c
g3d8b/PBePSVcX6A+Plb/zh3O8td7fd/Uf9MPQ==
                 "]], 
                PolygonBox[CompressedData["
1:eJwtk0lszlEUxd+7/1oYFhoRNSatllLzzreQYIuISGzYVGJsWKmN4duhRSj9
TFXDxpAoVhK0iKl2tDvtVqSmvTF+J+dbnLxz7n3/9z/v3vvqW/dv2hcppTWg
BlxHzGVtBK9zSj3o2fA54AX6EnoCfCJ4ip5UpFRiXQl2krsIxifveUzsGroh
+cxX6CvoWclnPkf3ouuT97xEL+C8Xtar4By522Fva8EQsSPoVtaDoIG909C3
yPWDOvgJUCa3B5TlFdwl1w0GdRb4Bx8DP+B/s3Nl3Q89ht4BPwS+wM8Tu8d6
AZyBn9Q/sj3K67fsb/eCR+R+Z3/bBf7ATxOrZHvqgB8H7fBO0FTYs7wPgRH4
BjAl2+Mv+Ef4xmRPI/BnYBl8Jrgc7pF6VQJv4O+zub75AJ/BngH4HWl4MxhO
jo2GPcqravg23FP1Vj3ph2/TN9mexuF3MLsXS8ANcqPoNvgW0BeugWqh2Fdy
B3Qn1u3ywvfL0Z9VG/AdPq9wbSvVWi1E92XXXLVvQd/PjnXLS+HZ6AFn0YvR
D+EP1CN0VzinmHLyKK9Ldb/sGqgWmonp8JvhnGr6jvxPdC3rZLAuXGPVWjM7
QGxR4X/JUyV8J91NM3k4PJOaTfX4GPpoeBY3a2bhK8Kzpx6oF/PDvVdNPsHX
h//dBGo4a2uYl6pvrT181irNOHx3mDdXe9XIno7sGe1Erw7XurZ6N82cZk97
TqF3hd+uejSV3JPst643rLc8nN1bvUG9xf9SBIFR
                 "]]}]}, 
             {RGBColor[
              0.5419757642621978, 0.49417678616243377`, 0.5004679213282927], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJxNVklsllUU/d79JCZoZIEFBRXRitBqIgj+uLJ1XNDWxMRZC1pwoi0oVAUU
bG2hTtAqAi3GKQFNUOPOpFYBJxA1FLEODK5o1TK4NBUVz/GcP7g4uW+437vv
Tud9E+9dcFNjZFn2I5ADszEpT1lWC9kMOR+oB54KjZ+BbPFaA9AGLAAWAl8A
V+KMzyH3Q68X47MgnwBmY20sDLyB8bVY34n5YaAZ4w+wNgrjYYz/BDZgPgHy
Q6xNhbwBuB5YivVarI3BOX2Y91AH2GNJe0/7Xo3AOOhVQzbhu+N0EuNrIGsw
nAvUZfLjFuBW4B5gFlBlv2/23mOh8QrIYZ6F7yohW22H/hewVg1UATMz2eCc
8bjR8xLonch0j6W+wzzgYcxXASuBR4B2z3tgoxH7P2O8JHTHxyErfV/ejXFt
AhYDa6C7JNPZbaFzz0MMKqxLH1aF/Lwgl68cz/F5DelkPOodg1qfvQhYnylf
LcAnIXkM678m2R1Oyu0dwO2ZamMj0J2Uly5gAzAjU37Pd/xZT82OZat1Fzoe
xfpq816D91tss85xfCdUJ19h/f3QHfqT4neb71PnnBTzX+Pc/JS094ttdPuu
jBHjsxzn7UnS7YPsCPmxNhTrjkyxfwjzq7D+aCivy5wLyk7rbcfeOsi/k2p2
E7CZdRvy8xzYnEnbwIVJ500ByuhzKEbjofNX0pnHnVfqFfNMyRop8VkP4Lv9
SXfal9QThaS9ub4jY3k69EuxdleoJ5nrI+5R5p73PiVXr1aH7nRmUl2vDNXu
BOzfHbrzg5B7gS08G3IoKRa/Mc6hHJ+bKz/MUwPwXkgeSLrLGUn2KhwDctPu
pD77AfIg9LdhPB7yWXPW6lDdtbmGJmP+HXSmhXLb6r2hTOv9wEdJ9dgLORDi
lIshBzNxDecDwG7Pm9x7c9wftZ6/HfJnr23Tx2J/UzJGmW0ftu2tmXyYkqv3
nw/x4CHbbPd37MGLctlupy8hftyK+e+h82aw9kP1E7n6jP023f12heeLQv0/
GjpH7edUcxttDro35rlXutx3re7hFs8vzRXrF/HtC6G78Y4d/6v9T5P48VXs
H0zqTfbovlA8J0HuCtXYP0lvBrl8bCjHzPW7Ib7vcw74xpBbXw+9B4z/MuYt
FM9xod5a4777LImXX/P7VumaqnJMCuYt8td15gbq08b3SdxCjvnG/PVWiEsK
1jsUytdl5iHmZRqwI+lMvnv9zvmQ88Tx9Dj5htG3Y6E34mr70e8a5TesmxPW
G3SetiXZ2Rh6P0e5Z75NqkPW43aML8f4FfZB0lu6BePnQrVbivgdcI+wVwrm
CL6DXybF402sH7GNipBt1kqxTin/e7+TYn4qdL5OqrvN5ooK81SfcznGvpaY
RzpDfTLZ9UNeZA53+f6bQnpl5sT7QxxB3toR4kPyIr9hTGljtTlhUi475f7+
NNcb667eb+r8UOxKzb1nOwesqZdCfcgeHe23czHWXg71Rnku7mCPdYXeBvZJ
GdbXmXcuwbgnqSf5j/NkKM78T1lvzmI/HU3iQ77/jEGv/RmRy2/y68hcebrP
OoxXp3tjwDn5w/7Mgqxyb/P/hbxAfriTPOOY1kDuNFePhPw4qYa7zSV8K2jv
X+W1PK0=
                 "]], PolygonBox[CompressedData["
1:eJwtlVmMzlcYxv/nfMTWcDPW2k1G0Quqqq6UWi4Mk0jEGlvTUjqj1lJUZ9RO
bLGMtamlQXBrVyqWorSM1HpF7VxixPJ78pyLX77nPe/5n+U97/t+LUZP6F8S
sywrgSowFKNlyLLOUDOXZW1hPboc1uB7yO9M5n0NN9G3oBhdBgfw14ND6Etw
A90X6jCnEvsluibsQf8B/6Jf41uZec1H6G+i9y6EPPbOQavgMw3Bdw7WMncd
1ELXSv58GIPdER7hewfP0KVQjG8gzEDPhOHoydCcb5djlwXfcQW6Pdzl21fw
BP0pPEZXQBt0QfTdNOcuehVs5Nv50Jr1NusbfB3hBGNTsPvwOxIa4B+P3Q3d
DkboLNG6LhShW+V8timwBDs/Zz0VlmFvil77E8UwOOaKfSk8Do6pYnscGqL7
QR7jbaAqaz0JnqsYntDZo9fqAMfwFTCnNDgmik0fqB0cY71Fu5xzYQOsxVcD
dmZ+wzPo6rAjcw5cjr6T7pbBa/SX0VoxfY6uz3ojgt/kx+gYKVYam4U9Fj5P
++utuyln+PZ/eIreDT3RveAqc4ZF54JyrgrzW2P/g++I8hX9LDheytmD2Huh
EN0X/sO3H3swegjcxu4QvZfWuBedAxUpf28rdnA1c84p9xZGv5Xu0IL9l2os
5ZvedhH2+OAYL0Z/yFhJcI4qVxtjTwgeK8OuBsszx1Sx3RN9195wjTnfRr9t
VxinvVVzwTGry1rTon0D4Ad0E8a+D95jLnYz7EnoiTBP50n5oxq9gn4bXGuK
2Uns+9hfoWfAA/SrYK0zVqJ/Ys6oVL8NWbtpzmtrz1+ia06x0J7zsc8H30U5
uD36TYpTP3qKb2eqp05wEfskfIZuDkdTjBVr7bmAuVuVL/g6w5+MHYZmmddQ
bepMOptiNBv7g9SPVA/qLd2je4dqphK9K+XDIPUrxrZEr60z6Czl0WfRHodS
D1AvWKC+hu94cG3pzbZhf5SzTzmxWvkfnZuqIdXSleC9FIN92G+Cz6YznsX+
OOfaU89Zh30juBcXKUdTz9T91HMm478THEvdQbndKLo3KGdvqVZTP1F8LjD3
7xRf1cQl9O/RsdeYfL+leuuheg++k+6msXPY06N7rXrcd9E1pdpSzlxHXw4+
axc4HfyfoP8G1XQh+mzw2jqvYv9r9Fy96Sl8FcG1qf1U+9tT/9Id/sI3JzrX
VWM/o7+I7uXqYS/Q7wGoytV9
                 "]]}]}, 
             {RGBColor[
              0.8405214368216596, 0.5990969905763021, 0.32496503394509474`], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJw1VEtsjGEU/b/7Rwgdj4RW0qJNREJGWIwukXboTLvwWJlqx7TBhhivZOoR
ieeu1vZeCRqJV0i6aWNDUYmiJOqZEintyhQJzsm5Fif3fPe/3/3u86/rLG7e
Y1EUHQNiIAtsA/LAA3y4BlkBeQ/yPHABOOuS50F8uws5D/KpST8N8kuIoi7w
z5Az3A/99QPnwP8E2dF+qskX36CvZzj3QVa7fAm8AL7hzknaQf/GpFtqOlP/
Hd87I71bAn4FxfrTYyHvjhRLfyTfr/zOMORDIMPc6B+8CH6d74C3gV812dG+
B/wJeAv4ZfAh8K3gV8CPA1twrkZBv4KXoV8D+Ri6ZvBL4I+Can0R/AdQwW+Q
40AAbzTFyFh7Ir3TARQi+Sh4nzLeq3ZgyGSbYGxeS9aU7yeC3jjksTHG1R4b
YxzwvkSm/Ol3AHZjXnv2oAP65dAVTHWnPgU5avq+DHI7kGJvkfsnj2MJ5KDX
ijVjflVAJbDJxDdC1kLWA6uA1z5zlf5mI9AQNGfMa7Hf47ck5wLnVsgFsQaZ
vnKmOBjPDvCPBD6vgDwB5KCviTUTJZ+b9ew1exnUS/b0Ofg617V6LLzLOv42
5bHBNCucmRGc025Luyag3f2OeF9r2AfPmfGOBsVQhrwP/SnwCfDTpnuLYHPG
5KcWfDIo7im0NcW20HNt5mwF9aTPZz3vs5L1ve32fZgbq+Y74eNDkN0t8PdB
M3UTfH4snwfB+bNgbgn2N2gO77CuQfN4G3zM67wS8rAplirY94Lvhf4dzkdN
Puk76bPAfo4H2fR6rqxdBnjrO3jDc2U/2KvpuF/H3rD/pjmPoTtgyov55bxn
ae9Zg59LvlPc590mfZfPUdrfaPN3mtwv/beYesD4jph6z/jznlPKZ5jvs7+M
b78pjznug3s3Cewz+Z4N/YRp3+pNtcz6rv8NmgfOxf/95y4VTTHOxN2yyd9a
3jXVdBfrbYp/Vqz8kr4z/wAtC7Cv
                 "]], PolygonBox[CompressedData["

1:eJwtlDdM1lEUxd97nyUWrAkM2EjUwWh0EEY1ggq6WBaatKiLBSyJWCZBN53d
bYOS2GOZxA0UTESIJmBB0cQCk6Am6u/k/IeT75z73v+++8697ytqat55KIUQ
doFJYANigt9h8A1eA4piCDNByoVQh86HrwT18DxiZfBScBA9DV0MXwv2oOeh
K+Dl4Aj6HqgndwP4SGwfuiT6jOnsvaUzWasFb5UH3a9aQDH8DtgNrwMfWC9J
XhsAI/BZ5NgUXZMuVgpidM1/4NtBQXSsDP4YNPNtCxjNYlpTzjH4NbANvhU8
Jz6b/Jujz2jWmjyI9mwcfjV5bwV4RnwO+7dEf9PC2t3k2uXBMLEG9KromnbA
7yd70wg+ZZ7Le51RzdqV5NzloIvYU3QbvB38Q1ehl0T3QL1Yk9zLHvmtu+Xs
tfZUom8ney1P3xObm3OvVPNh1qaCy6xdAL+JrUj2uhMMwRck8w7QB18KHmTn
LYNPBufhl8CU5BnRrOjOjfAbWT9VQz+xDnRTdv8B9P7kWdsIDsCPyd/sfvOp
NR/9MLjGF8kzot6ph6PwcX6PB9cwAe+O9k5n6uz12hPs8c/knMqtmTyKLgRP
gmdwEH4zeVY0M4PsCeiLwT1QL75m70c518FfRc+zvtG3upPuppnqhZ/S/bP3
kc/ZecleKme37ppcm3qm3l3P+qWcfXqX8jC4xpfwReypIV4LzqJ/RNemfJ3o
1mQvK8EJ+OpsPlSzai/Mea0KnEEvRFdH52xXv3NeU6wtuWbVrjd+Er03+e1L
6+3/ip6dVvAF/ih5VlXTd/TinGuVB+dY+xtdqzzoQo9F75ffequaIc2SZqw3
eY/2yoMZyTPXk/1/DSe/IfmtGRiBD0XnUk7VUpD9P2mmTqPfRfdK/uq/6HN0
7ZrJ1/DlWX7N3Bv4fyFIoCc=
                 "]]}]}, 
             {RGBColor[
              0.9381896340864412, 0.7154740852161028, 0.4083878656679675], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJxFk7tOVlEQhfeeoyRCQNQGiGAM0FjwqyRqozYWSuUFVDpvlIii8gbQ6AtA
Bw8AUVQKEyUxsRFjYww2IBdJjEFBzS8FCt/KTGKxstaeM/sya+YcvNF38bal
lDpBAbpYNOaU/sIVYIzYTvgtGEdXw6/BMDrB7yNHuVPwaPK1vk8k37PDPL4P
XuHsAfQX+AXrQfRaxB6Bh2Aju/4DfzQ/pwYuWNeDOrDO+jvxE+a5Y3H3Eut3
cCv8G1SSew6eA7PED5mfUQJtUafqvRz36N0jYF51wk1wJ2gg51Lw4djfGne1
RO3SM+Ax67vwZ3L2Ymo73EPsDDD0efi6+f298BswRP7P7Ll6TxMoEy8TP61a
WN9HT6Nz5Guf/HqQ3L91cvrhl8R/oe+hX5l7JK+Ow7t4zwG+dcf9deFpY9x9
FHwyr6MZXgQL6LbwfzX5WaXYJz/K2d9RyMvwUX07pf3ob/AF87uuBcsHnTca
PVcPZ+Ps1fBRexeCZ8Lfq+yvYl8ufIZU93P735tNeW9exx5yVszPOwbfBEeI
VxTuu+qvRm9l77vm+mzMjGZHP4bqrCHninlP/sH95l6pt33m87AbvZy9F8+I
3TL3WX7fiXtrC39LEfWvxTxoLhajX5PyO/r4BD2ffZY0Ux9iJvfDP7L/O/qH
vsacnDT3Rf50oJdiZp6qn+Zzbeb9kKcleBt6R3xp
                 "]], 
                PolygonBox[CompressedData["
1:eJwtk0tvzVEUxc/Z/1LRKIIEaSvCiKSlEkYYSeiIxnNG6VR76/ENdFJfgBkf
gMSrk3okdKRioklNVG+lCQla9NZA1G9ZZ7By1zpn3332Xnv/t/cN9F6OlNJh
0KRfRIPfGfAFvgbcg78E7+BHQJVT+oZe0H2VUie6CyjRcRDwzeAE/BzYBl8N
ErGtlWP3gAHuesGW7JzKfbC834JehHeBOvoNmIXvB1+T35iH7wATpd46/Afn
w/AaeBp+U28r31n0C3CV42tgkbNW9H34bTCh2sP8BhjX/8GtZA9eh890pzcy
/Dm4kpzzF/k6wl4pfhK+M1z7KNgEPw3aiesGzZVrUC0joAF/xv1Qcs6f6FXE
dGR7eCmcQ7nugrfwR6UfxdeJ2Vju5cl7zSqc+47mCz8Qnt0U2A3vDHsnzz/D
d4Xv5PEcvCfsne4b4ZpV+15wEX0+PGvtwAX4fLY/8vAVekW41pvgd/ZO/Z8V
OARfWTmX9qEPvVz2RT2fgf8Nc3l2KrwTLWWfjsL/gK3ZO6Rd2hDuVR7Ii7Hw
rFTTd2LaynzU4wd4P9hX3pPX60o96rEW9miq7P80fG3lWhUziF5f/FCOIfTD
sg+a4Uy2B/JCO7SMPhauXT2q18fh+WuGs8UD5VdPJ+FPwPWyr584+5i92+pJ
vU2W71M73A5/UPZHMdPELmV7rxxz2d9ErdS3gP4H0Qd8qQ==
                 "]]}]}, 
             {RGBColor[
              0.9858806360927449, 0.8347015902318623, 0.5562299718875092], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJwtU7syQ1EUvWdHhAaDzjOjzNAar9KgNR599HyG8Ask1ycwk+iCQprE6Myg
SWiMKuShMmLtWatYs+45+5x91l5733T2aPvQoijaBBLAT4iiU3AXXHcGOsAV
cAacA6/AF9AEPnC5DV4F9wEXngf87WvkWAcPA3nsP4qPgRywj/UgzvTABe2d
6B1/7xIYRawITht1ef7Y9Rq1dcHLRj1L4n7kTAbq8vwDgXuTwESgbo+7vl1j
/A+8Lc2/4KzxbD9MKeF8DajKF9dxZ9yPpelevrwAT8b1NHgcuMb3GHhK+x4P
xjor4E5g3bfuW6A/Zfc10JMbfB8Y9acS9KOgt2eMXj1Lb1K1utZGxB66Ptfg
eutGjRnwmzE+b8zl8aK8aarHsXriNU8qdwrYMHLLqMlje/j+NL674O+odvfg
VR5V1DPv3ZqfNe7NGuvOa8ZyqtHXK5oxn7Ud1en9yaiWRaPGWHd6mqsto7/u
sxln0fvrfX4wzteQ0Tv3cMRY94t6WZamVmC+tv6FhmahJpTkb1X++frdGJtT
rXXd+wdbqnrG
                 "]], PolygonBox[CompressedData["
1:eJwtkTkzRFEQRvv1WBNraB0SAVLGklpSa07Oz7D8BUv5CVQpIQIEtpCaSQYR
EbMQGeV81S84Nafv9Ovb3Te7trmw4WY2BHVwQ7DP7x4kuHv4Mdzj4/Cp3MSs
hM9AA/7F2QT+B03EzbCKT0HF4qyCX8Iu8Q5UOct5fFuAYXwEivoP3lU7Y9ZF
XjesE7d49HINT3gnnOFH6gkvk7dlMYNmUY5yr6AHv/C4exsq5JaJG5OYQbNk
PGqpxx/OHokP8ENo9+ixkN7/4jGTZlONWXzeY3b1X8XPPe5STyXOVzxmUX4N
n4Zv1YIPvA1O0v4f8EWoT2IHSx47UW3tdBL/9XgL5Si312PWPBTxMQ/Xm+nt
BuDWYsevHnfoLs3Y6tGz6qunOXwQ7ix2nMezcGpRQ7Vq6f60g2X8OX0fzdDn
sTPtTt904P3peyhHuaMes+uON/wfg+dXow==
                 "]]}]}, 
             {RGBColor[1., 0.95, 0.75], EdgeForm[None], 
              GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJxNj7sNwkAQRE9HAQZiJDAxFMAnNjklUAD0Bj3YvgCnBBgLMqc2DfBWNwiC
0fPsenf20sNpf/TOuQkaoDHmAkewhj3qUInOLvYK9HCx/+S/O1zAXLWvN660
J9dcp77V1j76zMecWnvn+ABT2KKG76XuCrrlrZmtj3eVf3cV8o0Y9B6br+BV
M0O40X7LeSnX8jPd1sOdsizzpnfO/C/DMqeqWz/Rfsv5AHjJOnQ=
                 "]], 
                PolygonBox[{{718, 179, 178, 527}, {743, 221, 222, 571}, {544, 
                 198, 219, 736}, {728, 199, 198, 543}, {754, 241, 242, 583}, {
                 528, 178, 199, 728}, {557, 222, 201, 737}, {569, 219, 241, 
                 570}, {572, 242, 221, 743}, {545, 201, 179, 530}}]}]}}, {{}, 
             
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{717, 528, 728, 543, 727, 544, 736, 556, 569, 570, 
                 582, 754, 583, 755, 572, 743, 571, 744, 557, 737, 546, 545, 
                 530, 529, 718, 527, 717}]},
               "5.`*^-6"],
              Annotation[#, 5.*^-6, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{701, 498, 710, 513, 709, 514, 716, 526, 726, 541, 
                 725, 542, 735, 555, 567, 568, 753, 581, 594, 764, 595, 596, 
                 610, 774, 611, 775, 598, 765, 597, 766, 599, 767, 585, 756, 
                 584, 757, 573, 745, 558, 738, 547, 729, 532, 531, 516, 515, 
                 502, 501, 704, 500, 703, 499, 702, 497, 701}]},
               "4.`*^-6"],
              Annotation[#, 4.*^-6, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{689, 480, 700, 495, 699, 496, 708, 511, 707, 512, 
                 715, 525, 724, 540, 734, 554, 742, 566, 752, 580, 592, 593, 
                 608, 609, 621, 781, 622, 782, 623, 783, 624, 784, 625, 785, 
                 626, 786, 613, 776, 612, 777, 601, 768, 600, 769, 586, 758, 
                 575, 746, 574, 747, 559, 739, 549, 548, 533, 719, 518, 517, 
                 504, 503, 486, 485, 694, 484, 693, 483, 692, 482, 691, 481, 
                 690, 479, 689}]},
               "3.`*^-6"],
              Annotation[#, 3.*^-6, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[CompressedData["
1:eJwl0CtLw1EYwOGzLSjOpqjgNrUINoN2wWgQjBs4MFgmW9iCt+L1k3gBL2jd
os15Be+CJkGDlygqiM8fw4+Hl8N74JyeidJYMRZCyGstHsKRYYfX3OYlt3jF
fT5wj4+s8Y1VvvOAv6wzqUM160Kd0a76NKBBfWhYPxrVuPIqaErTmtFCtJ8I
YZEpLjHNZWa4wi6usptzbOMs2znPDlbYwjJbOckm5hhnlgmO8FNDelW/ntSr
++hunatRDfr25i+96Fl3utWusxue6VSb5hNu8JjrrMf+//0PuT00oQ==
                 "]]},
               "2.`*^-6"],
              Annotation[#, 2.*^-6, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[CompressedData["
1:eJwl0TczYFEYgOErFUJrhE7OBX4BNQo1jUYoditUQoddOefY0GgZrJVDJ3Ro
FVhbizOeO4p3nvlmzpl7zzlpdT+rf0QEQdChycgg2DbMcZ+z3OMMdznNv1zh
OZd5yiWecY1XXOU113nHTT5xg/+4z0+eMS7coxRdKjXco1yVqFT/Va43VSkm
Kghq2agmtahVHepUj36pX9nWDnBQo8o3j7GA4yzkBIs4zBwOhd/nCPPYywz+
Zib7mMVuprGL6WwPz8G28BxsZiIbGM96JrCG0azkiyr0qjI9q1j34b/oVslK
Umx43/pwd+961INudaNLXehEx1q09ogLPOQ8D/hHO5oyb0V8v/sXcPNGzg==

                 "]]},
               "1.`*^-6"],
              Annotation[#, 1.*^-6, "Tooltip"]& ], {}, {}}}],
          AspectRatio->1,
          DisplayFunction->Identity,
          Epilog->{
            Opacity[0], 
            EdgeForm[{
              Thickness[Large], 
              GrayLevel[0], 
              Dashing[{Small, Small}]}], 
            GeometricTransformationBox[
             TagBox[
              
              DiskBox[{2001.3250873491422`, 1198.9514712530347`}, {
               428.50524490934157`, 320.85059655460617`}], 
              "Ellipse"], {{{-0.9997969505881743, 
              0.020150870814625122`}, {-0.020150870814625122`, \
-0.9997969505881743}}, Center}], 
            Opacity[1], 
            RGBColor[1, 0, 0], 
            PointSize[0.03], {}, {
             InsetBox[
              FormBox[
               StyleBox["\"Prior\"", 20, 
                GrayLevel[1], StripOnInput -> False], TraditionalForm], 
              Scaled[{0.95, 0.9}], {1, 0}]}},
          Frame->True,
          FrameLabel->{{
             FormBox["\"\[Beta]\"", TraditionalForm], None}, {
             FormBox["\"\[Alpha]\"", TraditionalForm], None}},
          FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
          GridLinesStyle->Directive[
            GrayLevel[0.5, 0.4]],
          ImageSize->350,
          Method->{"DefaultBoundaryStyle" -> Automatic},
          PlotRange->{All, All},
          PlotRangeClipping->True,
          PlotRangePadding->{Automatic, Automatic},
          Ticks->{Automatic, Automatic}], {186.66666666666666, -183.75}, 
         ImageScaled[{0.5, 0.5}], {350, 350.}], InsetBox[
         GraphicsBox[GraphicsComplexBox[CompressedData["
1:eJxl2H1wFdUdxvFAwoAyDVAwIFUaDINSFQNiCljDsYKEFiKvwRjwnReZtl5e
BK0pLggGhNw9BuVFgexdDImg6aIgaMxwwMRMiA0LVqCB0kORCjLWjcZmW8D2
Wu+zO3mSP3Lnm3Pv/M753M0/p/+jT06e1TEpKalr/Nf3rz/8bBL/f0lf+8Or
RS1ebdua2nitbadvbtuK+uEtbTtpK82nFqU0n1pYbVtSa+rMGO2f2qVOt9t2
hFpRw7N7ceI81PBEa2p4ouGJVtTwRMMzmE8Nz2A+NTzRklpTwzPYP7VLDU90
hFpRwzMpmjgPNTzRmhqeaHiiFTU80fAM5lPDM5hPDU+0pNbU8Az2T+1SwxMd
oVbU8PTI0yNPjzw98vTI0yNPjzw98vTI0yNPjzw98vTI0yNPjzw98vTI0yNP
jzw98vTIU5uJ81DDE62p4YmGJ1pRwxMNz2A+NTyD+dTwREtqTQ3PYP/ULjU8
0RFqRQ3PuTJxHmp4ojU1PNHwRCtqeKLhGcynhmcwnxqeaEmtqeEZ7J/apYYn
OkKtqIPnkzw1eWry1OSpyVOTpyZPTZ6aPDV5avLU5KnJU5OnJk9Nnpo8NXlq
8tTkqcnz/pcS56GGJ1pTwxMNT7SihicansF8angG86nhiZbUmhqewf6pXWp4
oiPUihqeLnm65OmSp0ueLnm65OmSp0ueLnm65OmSp0ueLnm65OmSp0ueLnm6
5OmSp0ueLnnmlCTOQw1PtKaGJxqeaEUNTzQ8g/nU8AzmU8MTLak1NTyD/VO7
1PBER6gVNTwVeSryVOSpyFORpyJPRZ6KPBV5KvJU5KnIU5GnIk9Fnoo8FXkq
8lTkqchTkefwdYnzUMMTranhiYYnWlHDEw3PYD41PIP51PBES2pNDc9g/9Qu
NTzREWpFDU+HPB3ydMjTIU+HPB3ydMjTIU+HPB3ydMjTIU+HPB3ydMjTIU+H
PB3ydMjTIU+HPG96OXEeaniiNTU80fBEK2p4ouEZzKeGZzCfGp5oSa2p4Rns
n9qlhic6Qq2o4WmRp0WeFnla5GmRp0WeFnla5GmRp0WeFnla5GmRp0WeFnla
5GmRp0WeFnla5GmRZ59XEn+nhidaU8MTDU+0ooYnGp7BfGp4BvOp4YmW1Joa
nsH+qV1qeKIj1IoanpI8JXlK8pTkKclTkqckT0mekjwleUrylOQpyVOSpyRP
SZ6SPCV5SvKU5CnJs8v6xHmo4YnW1PBEwxOtqOGJhmcwnxqewXxqeKIltaaG
Z7B/apcanugItaKGp0GeBnka5GmQp0GeBnka5GmQp0GeBnka5GmQp0GeBnka
5GmQp0GeBnka5GmQp0GePnn65OmTp0+ePnn65OmTp0+ePnn65OmTp0+ePnn6
5OmTp0+ePnn65OmTp0+ePnlGNiTOQw1PtKaGJxqeaEUNTzQ8g/nU8AzmU8MT
Lak1NTyD/VO71PBER6gVdfzzZYv3nuxYXizSaudsS1vd/r5/3EvXpD50pli8
e8ezqfmD7bbr8f3ssJZmNHUO+3LvhgGxlVExs/ySXZIV3nd/VrUvpeDB9vfh
freDk968Keyc5Bcv+EvC3vivScvG1EXFrmEz1s0uCj/f9N7Iwpl729+n+2fn
dssrCDvn7pQXWj+Mip8/VVO16Vt6f9xnfv3jJ+u3RcXY/1Y/dGqqHawvOdIt
s+K2sFPufuKbr1bYbT///fdxw6Ddrb8yxZ8PrEnbOCS8jz7inbg4a2rYjT8d
eOD2Je3vr7NaFzY1vG6K2Z2PH3qgNFz/unRG50n1YZ/pNrpoVF876IJ7Vj17
e1O4fv7QuJG3PBiuX1h+prX0rrB3195cWBoNG/vv1Vg38uzo8P7yvWcymtI7
SNH9xCI7s6D9/fCFytqq7PFht6R1nPRC/7CvXCn8+LUvTbG64fXHqv7Y/j75
ncYbrn6zIOzy/9zcIzdDir880W+C6GC3fX/8+9lSn39u2zApWq7aOeLodFqP
73fslcofZ28M5y+aWnJtdnXYv0k7nXv90nDe4qYpFT3fkOLU+QV/2PtOTKx7
//6nB+4sFn2335oz/Rpb5H696kQnXSyeH3q0zLw3JlZvWNxceU9UNN82YX7l
rJj4xPx8StdYVNTtX1s0a1lM5I3avj4zJSo2d39gTc2GmDg2JNWeMDYqFjxy
o5lRGV8fsPiteS/Gn6+3W0qW18TX007vK/pTVHS9a+FPhp+LifS9+ZMrRkXF
tMvjv1yfaovvWv5RV1MVFcPHD5yx5I6YqPhsQa/ZSaY49X7KLcV5MfFKZuqK
8sdMsWzQ2Ut2/HlaXvjGN+c/MkXrd28fm7YyJs5d7rOiQ/z9v575y28vlMfE
33vX/a16jilKq470XHooJk4PferO3x82xZ7jyV7vXrboV9TVHfuBKXpsffRA
db4thjXdOHrEFlOMyz2Y3XeILU5+ce8HuRmmuCove1PZSltc17Gqwcs0xYAx
p3Rz/P/7t4dftj9tMYVd//SCuetjYuHgPTs395BiZcOl5KPx5zVn17873fmw
FCVl2SMzkm0xw595fPcvpLCeWxZZdDEmIqMOVgy+Voq38mu2134SE11+NKFl
4kVTVOddF90xJz5v+c8+fS7+vHRZ0zzx6vtssXbivGfMLCkm7/+o57wsW1zu
t+P60vi86Z3mfzVijS2SVw36/FgfKXadGdQ4rSz+/R3N3pNkSTHusHxSdbLF
P7Pyy619UkzJ/Ph0819jojBnaOMXhVL033/xd7VjbLFr6yMDK+Lv/x9ep4do

           "], {{
             {RGBColor[0.148, 0.33, 0.54], EdgeForm[None], 
              GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJxNmQn4V2MWx+/9ixJCIVHTplBJaBEjSSqlMpZWKcmWFpUWTEraU7Kk0i6S
ktJGwsjIPtZh7LJkHcvYl8Gcz/N+7vOb5+n7nP/5vdvZ7nvv+Va7/9AzhpRl
WVa2S5bFv6xqIEcPdAgcHTgm0CRwUODgQOPAgYFqgRqB8oEKgaMcrx44MXB4
oEHgpEDDQKNAG+URgVaBw5x3sr+x95/cb/dArUDFwB6B2so9A3WUewXqKisF
arquovbhUznt2jWwm7aXOVbd38rrXznntdWWIwPt9Y1YtDMW6C8GtgYeDLwR
eCywPfBt4O3AO4GpgeGBEYEXAg+45iXXPRR4PrDFsVcCfws8Evhn4GH1yYHL
AsMCLYwFMThWWdc81TB+xwfqBeoHTtGPJvpQ3XnNjBcxbuo69Jbud0jgOCV7
NXdubfO6X2D/wGuBRwN/N7cHZKmOyGsV510aODvQLdDR8zj/uyi2rvgb8vyQ
nQNdAr+HPoDYhBwTsn+Wxq9QMnaN+w4KjA8MVJ/gb4MDX+YpFltDnpWlmqM2
u2epLqnHHkpqsKeS/D+Up/lP58muFsa7qzEiNqcZlxb61tp9uziXeZMCQ83f
xMAQ9Wu1cYj5oV6pwSnmmbo51bwSr07GrLl53Sewr/mh9vc2T3s7xrNV2Rwc
6tzK7t07cI5nIPtkqUaR5wZGBvoG+gVGKc8LjFb21/buxm+Q/nfXN+LYK3C5
+/XV/16ePcR1zOO5p14O9JyO+vqvwLYs1dZzgfuz9JzwPNwVWBVYEZgduCFw
e2BW4PrATYGxgasDdzp+Y2BzYGlgWeA+5W3ujVwe2BRY4rwt/sbecwLjslRr
c7NUf9TaPCX5nK8kz7cqyf8trmPNDONLXGcaU2p8uvEaqR/8Rr1f51zmPaAt
d2Tp7sC3lVm6S1ao58aT55B7l3psjY8xcFtgeeAe7cbexqG3DZwcOCRwXKBl
oB7PjvoxgRqBPwXqOn5sYK174Os65YLAvcqFgQ2BRYHFgY1K4rtVP7B7vXMX
mdebjfdK80Y+1xh37F7tOHG9WznXfM4wZq9m6R7dZm6vM95LjTXz3go8HnjC
eavd780s3eWMvZ6lu437/d/uS21+lqU7mjv7cyVjX2bpTmTdF85F/8rfeFc8
qc/EZos5uT1PZ5Ab4vpsluqVOv2Hkjp9ynUbtWuNa7a7bp12rzMPz2Sppjfr
572e/Y3+8676jz6jf62Nb5ofnieesWlZuiMuN66rjNejxmyN+eP+mmr+qf3J
5nayY0vcixwsdi76+/qMrx8oee4/VPKe/ChL71HevR8reZd+GnjZfLxjfJ/S
tyfUdwSeNh473Y+93vM3zn7XdczjuadeeBYP410QOCFP9x/3E3c/9xp3NHdW
lRj7LeTvgX3j719D/jfwh/ZRLzycSOplvzzNZZxnbe/APnk6q3Ke9uNZ2ytQ
yWezkvPqO5dz8jztR22W5UlSd7/qJzHjGT8wUC2wS57Gv9TWT7TvZ+NOvH80
LuTkJ+UH+vORsf/FuZxxuPbi0/558glfG/zfb9UDuwXKe5cgK3inIHcPHBzY
1Xn4+bPn9Ii/23hHjQr0Iw+BeYEJgWsD85UTAwcFyrlX4TP6AXmyi5g11C5+
a6SsGjhCSbzqBPY0B7UDe6jXClRUr+p+Za4p87ya+lRRO77y2VoQf08KTHbf
H40x+fzFvHXxfuWePTFP8SWWZ6u3dryONdI50MLfurqOe/t0Jfd4p0CzQPPA
WXmqZ/Y6M0913cp59awvfjs0T/V4tPmr4bzDtKmbtpzkOYe4voXxquN5tdRb
ai/zmpr7mtpV03lNzB+1cEbgz9pymnuxN7XDncUdRu0g+e4m1t+F/D5wpLln
L+qJ2LOGnDH+Q5bywzrWkNcfrH1qheeDnB2lLfjfTvv4rb2S2LSxho4wHuSK
+uqon82MUUPn8b7lmcTGk12H3sH9eN+eqmT9Kc7lbO6An3xe+3sP8X16a55q
n9q6JTA+cE3gskCvQO/A0EBP9b6egY39lNTIMOeeExgXuCQw0P2Ql7ovclCe
nj/k4Dw9f8gheXo+O5m3c/WN887PU71S4xfkqV5Pdw/qqXugv+uYN0Wbhmt3
W+PRW9lOW9uZkz7KDq45x98mG4thxmioOr0E3+tdrYN3fA/wDuAdu8la2eGd
yPcyfSB9Id+z9Ar0WL2VjPHN28F3Qx/nol+h/wMCY/QTfbTxQh8buChwceBq
5SXmdoh2/zVwofMuN77kc4S+on+vH9g90nHyfKXnX2CuiDf360JjNMVzelgr
5Plsc3ND4CrPv1GJvTcpsfdmJbWzNDA9MCNP357XBWYGlvkb+ro81S734r1K
bNkQWBRYHLg+T7HD9lnG7grHsXeq85DTAkuU0z1vtGvm5ql2Jzg+wvjN0d7x
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
PvBABU9HHRecb19t3+SahdrCGeO0nXj8D/JbFxI=
                 "]], 
                PolygonBox[{{448, 79, 58, 492}, {492, 58, 59, 446}, {463, 100,
                  79, 500}, {523, 146, 145, 489}, {521, 145, 144, 487}, {520, 
                 144, 143, 486}, {486, 143, 121, 476}, {473, 105, 126, 519}, {
                 444, 40, 62, 445}, {519, 126, 125, 484}, {458, 62, 84, 
                 461}, {490, 38, 39, 442}, {485, 125, 146, 523}, {443, 59, 38,
                  490}, {476, 121, 100, 510}, {491, 39, 40, 444}, {461, 84, 
                 105, 509}}]}]}, 
             {RGBColor[
              0.572505777914378, 0.5049061839315705, 0.4825205650599184], 
              EdgeForm[None], 
              GraphicsGroupBox[{
                PolygonBox[{{450, 60, 498}, {519, 104, 473}, {481, 124, 
                 512}, {512, 124, 483}, {509, 83, 461}, {476, 122, 486}, {510,
                  122, 476}, {523, 124, 485}, {490, 60, 443}, {480, 122, 
                 474}, {444, 61, 491}, {442, 60, 490}, {507, 104, 471}, {489, 
                 124, 523}, {486, 122, 520}, {445, 61, 444}, {484, 104, 
                 519}, {461, 83, 458}}], 
                PolygonBox[{{459, 83, 104, 507}, {455, 61, 83, 459}, {491, 61,
                  60, 442}, {464, 463, 500, 501}, {498, 60, 61, 455}, {449, 
                 448, 492, 493}, {473, 104, 83, 509}, {501, 500, 448, 449}, {
                 522, 521, 487, 488}, {493, 492, 446, 447}, {447, 446, 494, 
                 495}, {458, 83, 61, 445}}], 
                PolygonBox[{{488, 487, 520, 122, 480}, {471, 104, 484, 516, 
                 517}, {474, 122, 510, 463, 464}, {495, 494, 443, 60, 450}, {
                 517, 516, 485, 124, 481}, {483, 124, 489, 521, 522}}]}]}, 
             {RGBColor[
              0.8758429631906299, 0.6115103065526175, 0.3042009417665307], 
              EdgeForm[None], 
              GraphicsGroupBox[{
                PolygonBox[{{488, 123, 522}, {447, 80, 493}, {480, 123, 
                 488}, {477, 123, 511}, {493, 80, 449}, {522, 123, 483}, {503,
                  80, 453}, {462, 80, 503}}], 
                PolygonBox[{{508, 507, 471, 472}, {465, 464, 501, 502}, {451, 
                 450, 498, 499}, {475, 474, 464, 465}, {499, 498, 455, 456}, {
                 496, 495, 450, 451}, {456, 455, 459, 460}, {472, 471, 517, 
                 518}, {518, 517, 481, 482}, {482, 481, 512, 513}, {460, 459, 
                 507, 508}}], 
                PolygonBox[{{513, 512, 483, 123, 477}, {502, 501, 449, 80, 
                 462}, {453, 80, 447, 495, 496}, {511, 123, 480, 474, 
                 475}}]}]}, 
             {RGBColor[
              0.9445974678062112, 0.731493669515528, 0.42825215019925467`], 
              EdgeForm[None], 
              GraphicsGroupBox[{
                PolygonBox[{{465, 101, 475}, {482, 103, 518}, {502, 101, 
                 465}, {456, 82, 499}, {475, 101, 511}, {508, 82, 460}, {506, 
                 103, 469}, {460, 82, 456}, {518, 103, 472}, {462, 101, 
                 502}}], 
                PolygonBox[{{472, 103, 82, 508}, {514, 513, 477, 478}, {454, 
                 453, 496, 497}, {497, 496, 451, 452}, {504, 503, 453, 454}, {
                 457, 82, 103, 506}}], 
                PolygonBox[{{452, 451, 499, 82, 457}, {467, 101, 462, 503, 
                 504}, {478, 477, 511, 101, 467}, {469, 103, 482, 513, 
                 514}}]}]}, 
             {RGBColor[
              0.9930538871794143, 0.852634717948536, 0.5784670502561845], 
              EdgeForm[None], 
              GraphicsGroupBox[{
                PolygonBox[{{457, 81, 452}, {452, 81, 497}, {506, 81, 457}, {
                 497, 81, 454}}], 
                PolygonBox[{{468, 467, 504, 505}, {515, 514, 478, 479}, {470, 
                 469, 514, 515}, {479, 478, 467, 468}}], 
                PolygonBox[{{505, 504, 454, 81, 466}, {466, 81, 506, 469, 
                 470}}]}]}, 
             {RGBColor[1., 0.95, 0.75], EdgeForm[None], 
              GraphicsGroupBox[
               PolygonBox[{{479, 102, 515}, {515, 102, 470}, {505, 102, 
                468}, {466, 102, 505}, {468, 102, 479}, {470, 102, 
                466}}]]}}, {{}, 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{505, 468, 479, 515, 470, 466, 505}]},
               "0.0001`"],
              Annotation[#, 0.0001, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{497, 454, 504, 467, 478, 514, 469, 506, 457, 452, 
                 497}]},
               "0.00008`"],
              Annotation[#, 0.00008, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{496, 453, 503, 462, 502, 465, 475, 511, 477, 513, 
                 482, 518, 472, 508, 460, 456, 499, 451, 496}]},
               "0.00006`"],
              Annotation[#, 0.00006, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{493, 449, 501, 464, 474, 480, 488, 522, 483, 512, 
                 481, 517, 471, 507, 459, 455, 498, 450, 495, 447, 493}]},
               "0.00004`"],
              Annotation[#, 0.00004, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{490, 443, 494, 446, 492, 448, 500, 463, 510, 476, 
                 486, 520, 487, 521, 489, 523, 485, 516, 484, 519, 473, 509, 
                 461, 458, 445, 444, 491, 442, 490}]},
               "0.00002`"],
              Annotation[#, 0.00002, "Tooltip"]& ], {}, {}}}],
          AspectRatio->1,
          DisplayFunction->Identity,
          Epilog->{
            Opacity[0], 
            EdgeForm[{
              Thickness[Large], 
              GrayLevel[0], 
              Dashing[{Small, Small}]}], 
            GeometricTransformationBox[
             TagBox[
              
              DiskBox[{2286.076387341876, 1009.7902739288529`}, {
               99.50426738731552, 66.1282695041572}], 
              "Ellipse"], {{{-0.9998751312504317, 
              0.01580259177894621}, {-0.01580259177894621, \
-0.9998751312504317}}, Center}], 
            Opacity[1], 
            RGBColor[1, 0, 0], 
            PointSize[0.03], {
             PointBox[{2300, 1000}]}, {
             InsetBox[
              FormBox[
               StyleBox["\"Posterior\"", 20, 
                GrayLevel[1], StripOnInput -> False], TraditionalForm], 
              Scaled[{0.95, 0.9}], {1, 0}]}},
          Frame->True,
          FrameLabel->{{
             FormBox["\"\[Beta]\"", TraditionalForm], None}, {
             FormBox["\"\[Alpha]\"", TraditionalForm], None}},
          FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
          GridLinesStyle->Directive[
            GrayLevel[0.5, 0.4]],
          ImageSize->350,
          Method->{"DefaultBoundaryStyle" -> Automatic},
          PlotRange->{All, All},
          PlotRangeClipping->True,
          PlotRangePadding->{Automatic, Automatic},
          Ticks->{Automatic, Automatic}], {560., -183.75}, 
         ImageScaled[{0.5, 0.5}], {350, 350.}]}, {}},
      ContentSelectable->True,
      ImageSize->{758.6666666666666, 379.5},
      PlotRangePadding->{6, 5}]},
    {
     GraphicsBox[GeometricTransformationBox[
       StyleBox[InsetBox["\<\"Correlated\"\>", {0, 0}],
        StripOnInput->False,
        FontSize->20], {{{0, -1}, {1, 0}}, Center}],
      ImageSize->{18, 300}], 
     GraphicsBox[{{}, {InsetBox[
         GraphicsBox[GraphicsComplexBox[CompressedData["
1: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
yLLUXasGsNx84XK9+Wo2/45dHmfmx6wvI2B/SKOw9Xwh+aup+bheFLybN/da
QJ/W84by9W8W955Jgc5GvYNTj7aeN0Tydy4bb8zm4zcNp/d0Wct8XremHkX/
b/7g6BzpsXERO19YbjU15MMsdp5Qe0mcvKsNO09QJ3dzlR5F8wXm/C4U1NMX
4yh4499Cm7q2ni+oMh9EKS5SEP20LlM6vPW84Xbem6asRPb8+bQ5sOLlQfZ8
HX3qXlyfxp6fes/v6t+l7PmxGVFw04zPrH/9oszevVrPH8yneWU8qmX9J1G2
AU/OMfvzexsxGM8nGP8yzmVL71gK/I/v4s5vYo/H80/unbKp9XzieaeUN45Z
FIx8PDLEqp49vr1E/8erPKmGV+04NyjKlZ0/iOW+dQFz2HmDwP3J7fFa7LzB
5Mbqt5MzWXb4PGj7k1nsvGHeCa7RlU5o3sD4S5vdZ+K3RTxom3TVWJbEzhv8
hu37MDaH5Zx2KeOnT2LnB0tWi+y+HGbZo1/qEPMe7Lwg7Urntj5RLO+078nd
3F76d33m+ZilrYzVcWHq1Rbv7+/PzgcMyzdPOLCGnQeEBzY6bxzCzgPuOu9T
v77Fckfxsgkh0ew8YMXKaPPSpWgewOxXv27fs1cePNgP2ywOdG2d74e6jbpe
dpsHB0ek+n7lssd3nRv48GcLy4XCR3oZW9g83312z/vmjSjfZ/Z3dXJVk/8K
HvQel8EXFEo1x3vbvBh+MonN7w8/Kr2TL2Tzes7omn83ebJ5/ZlqwyPJ/Vvn
9W8uNsZ3GMDmy+/WlkwLvs8Di9tazd5f0O//5/745N5PH1M+bNt7JLeBap3f
c0e6rZhvzYe8+LrVtSXoOPN9OuhrwXFq5EGunX3YrUWt8/ua9IRZ7Uz40O1H
j5Qfd9nj6X0qC8wXsHm9SejvNcpHLC/8aVRVL5X+/XnM84m7c2v3F8v4UDSw
LPbnJTafHzJ93fr191vn8XU1U/uvD2fzeJuzo2t3zONDwwWrXTfz2Lz+bFJY
iQWvdT7/0t71waAEPnxv61Sy4BrK65nrJ3X7Zddds1kfDk/mUKZn+GAw7ld3
9bnW+bxH07zyrr5sPl9r0jv+8AU+eFtyTS6R6+v/5fPhofMCa/l8WK5XWl3e
v3U+f8Hvju3Z9Xx4VrvwYfhp9rikQ4fTgdFSDWeKRlVXq1H+zjzP30XJxujc
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

           "], {{
             {RGBColor[0.148, 0.33, 0.54], EdgeForm[None], 
              GraphicsGroupBox[{PolygonBox[CompressedData["
1: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
9xzXXcht1y33ZEOYd2bN9/8Fbj97dQ==
                 "]], 
                PolygonBox[CompressedData["
1:eJwtkjlMVlEQhe+bpxRWFhY2Fib+BYmJgiuYQFAKC0ElwcTKJTGoIAjB1qVS
g1Yqi5K4NIr7vrAjLr17QYxbQuywRonfyfmLL3fOzNz35s7M0r1tDa2RUqqC
eQKxn/MozMe+Co1ZStXQi/0e6ojVwxS+g3lKpzlPwQNiv+Qj1ghf0B/DuVvh
K7Eb6N2cR6CJu3fQJ7Cb4Sb2EGctuSvgGbqZnF58PfAQfSD3v07CPXQ3rMeu
g13ElqDPc/cYzGF/hm3Y2+E7OVfQWzj3wD7yS8K5qvkP9gYYxR6AxcRb4RK5
F+EJsRZ0X+aaHqE/hd+mf3zDN4NuSu6henko913deRzuiXqzA37iGwi/XT2+
Fq5RteobP7DbuN+fuYanxJeHa9MbF+SekWZ1Dv5h34bOzDPRbPRGvVU9v05s
GFaTuwbG9S/iBc5l0EWsHWaJLURvJnYcvQh7Dl8H9kj47lqYwD+GrsHeCK/Q
98Oz6S/Wrhlr1qrpFrEJ2JQ847fFmWl2msll9T787XXwEt94+Nu68wa9k/yK
zDO/oNmFay0U31IFf5PfcFizhnfY01BG7Ez4rRXFb2nHtGsrYVB7Ft71Ujgb
rkG1aOcnsZ+Hc8tgGP068yzVA/VCO6pd1U7fxR6EcmKrYBTfi/Bd+Ua0t+gP
yTun3atUj5NrLmh26N/JOeW5Z6BZyFedu0bVqhk1oIfC/9KMxzT38NvVE/Xm
P5i1fcI=
                 "]]}]}, 
             {RGBColor[
              0.4524334718089836, 0.46270824887855655`, 0.5531062018758691], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJxFVUtsVmUQvXc+lKhBVhgw0aQKLABDIAGMGEUapKVIAgv+PoBCpRil7Q80
rkSsUE0UwVRsNfJSo7xRAQWkpa3vIFEpsUhC4ovHAhaiKyDReo7nJC5OZu7c
ud/MN3NmbkldcV5TZFn2KZCAPqAT6AJ68iwr5zMchkEfC4wB5iXJDbDfATnO
7+bDPgnyddhLIKcAk4FuoAznHIP9Nvh0QL8b+grYXwReABqBdcBaoBeYxRzg
82ro/I2Qv0Eug/0n6LVJ53dA/yD03UHIzyAr4HMc+qikezwAvQv2R6EfhT4V
6IH+GOThUA5F+B6DnAH7EdiaoLc6p6Jz5PMnIb0J/kMg7wXuAZ7Hd8uBBuBz
PM+G7IbvP0A79LsgV0O+BrRlqtcjwDRgTlK9Xg7FZg6drut0+7VkqhvPynLV
nT0ZAJbC9Ae+ewayPlONzrgOfbD/FcrrEmzXIYdC3p6rNjuAnawXnmeSB/Cd
6butgX7WdzkN/Vqm7/iuP1MNe4H5vgfzHJ1kezBUD9alxTEZ+wbzAE6Za7zL
ZYgrwENJ7xaH4jAev3kK9mY872NfnMdU2OqBCtjfhu13c4McKUuKsxL2cug5
bE+bwwOO+RaeSyGrk3pPDnwE26YQh8nlRdAvwH089AlJ+c6GbVXonBbIl8z1
OY5J/4uZ+sM4jF3LOSKnmRuwCFgIfGu+fYUzTpqf30D/wjUnj7aEvqlJ4toQ
964H9gK/zcXVSqDKc1Twc8E9IYfeDfVpN7mQS+f7uUm9eS7EyWHm1rZQzguS
zhhrPlb6vFLfo8x3m+bdQL9TnveTOOO0d8h30Kt8h1dCu4P+b0D+6Hn/Afr3
5uEJ6DXQV+baE2+GYrwT2k995tAec5Bc3IF3C+BThzjDk2yc9fd91pIkvnd5
x53PxdGzoV1S4lleH6rJXPNihfMody95770h/Qn43JqUxzjYHg9xuS7EG/Kh
lrsuxG1yfLvjcYdNTOL/Eu+VouNxzvf6fozBWLu4b5Nyvx/6w0k8JB/bPMe8
32Vz/L93uWpCvt0Ev2dhGwT5cWifNSblm5uvv+baIWdC9b1kPnNv7XKMA6F5
5FyOTPKrsG2h68NZ5L7jTur3fDOvn72v+uH/YSi/J5N2N3f4cuiHQnu3Afot
7tmYUJ/Yrwt4tzM0+/X+n7R41xQ8Aw3uWY3vX+r5qPTzKr8fCH03OFTvdu/Z
Vs8V+8F9UOH5Lfqcatv4jv+4zd4n3CtfMw55Cf3LXHPKea12b3nGiKR498H+
Zyj/m0P5NfkOVfblM/cXe9Ts2jTazr3AGdwK+x7P9n7Ic6EcTjhmtWsxyBy4
CnnRedL3Pee3GOf94h7x39Iemtkqc/mGdzL3L/dwMcQN9prnrnXtmR+50mbu
TM//30nhf9Wdod1S8D5qM1941t/Ok5wlp5rds17PBGv3LzWsDPg=
                 "]], 
                PolygonBox[CompressedData["
1:eJwtlFdsSGEUx+89VwiCJ7Ul5gOVIDFTIQRVMx6UaqtahLRGebRnYoQYLWLP
0poxQrW2IA1ao6gRQT3wYDwhMX7/nPvwyz3/c751zznf1y577vg5FgTBdKgD
d8IgSOWbBy8JjIFn2J+hZxQEN9E34C7j7kG1+dxp8BY9izHz+S6As8Q+8s0l
tgy+ow/BJHxDYBd2JuN7Y/eBfegIFjF2BrzHN5N4fuhrnjY/k86mNT/ge24+
Vmd4h57G+BS+I6GI2B5Ixs6AHGLf0IsD30N7zcCXSWwKlKCfwhN4jX6jdbAr
GVsL3Rm7Dt0u9DOnopPgF7GfoEQmQjH2NWhOrEL7Y4+Ax8zJR/+O1xtAPIzz
txAMe7T5XOVcuR8b5/86dGZ8FvoTdhX0QB8zP3tK/O9V6JHERsELfOn4RoSe
g93EMuL8yLcXnY1Ox54MR9BTI7fT4DD6DgxlrWFQge8+enjg/1SJvmsek+8h
+jh6At88KMZ+BCmBn6kaX1bka6sH1AsnzHtFNVAtlGPl5iNkEhtl/q9l0IlY
S/NcbYZW2PVgedyvP7Bbw5bAa/wHuxuUYBdCQ+b3N1+rCJqhz6DXhN5j6rW2
5mO15j/sJPPca40WkfeQekk5O0rsq3nvq4aq5XboQmwQ7MBeCk1Cr3kyczeg
O6Abwzh0oXnvt4eJ6BXoBOxQNUIvQ/9jblP0cuyT5rldAaew95v3uvpRd+mA
+d6qwUHsnTAYOxE2YadFfvfkU2wb9Ir7R71xKa6nal6K73Jcb/nKdE/Ma6Oe
V+/PgdWh5/AisdnoVaH7LqDbQEHgd6IBsa7oY4HXSLXaaH42/bP+far5W6N/
Hsj4Bea5+ILOwe4LVwK/kx2JZ5vHdEd0V+qavzXa8y/2XPO72Yg1hkd+59Rf
ukPzVFuYGPibdzvOsXKtGo5n7BLzuarP2Mh7Tr13FOpHXjPFVNMC85qqtqr5
evQrvjWhvyl6W/Rm6u28hX0basz31hlq4zdFtVRNtpr3qHpVOeuHzo289ivh
nN6C0Htfa2itLuZnU44SIj+zzqc3ay2x8vh90J28jq8svp96n66hr5jbut9X
0aXx+6UeKNdeke+tGp8ndtX8rdGaN/A9iOdrzafo//Gnxuo=
                 "]], 
                PolygonBox[{{457, 88, 454, 705, 706}, {722, 76, 451, 474, 
                 475}, {477, 476, 725, 100, 479}, {708, 707, 443, 69, 
                 458}}]}]}, 
             {RGBColor[
              0.6757299054360252, 0.541183033859306, 0.42183928881716093`], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJw1lMtLVVEUxs9Ze5Bp0zINr0URFNx7zRtU4NC6pIFhQSRaeZ00yBwUQVEN
pPcge0FEj4naqH8gZ0aDCiqK6EkIRS+QgoIKGtRv8a0GH+vb66y99nqeJbWR
3r2WZdlukMApDoU8yzZx+ILsQzeDbh3nn/Bh+Cf02+Fv4QeAcd6PnEI3ASbB
d86jyDnI33wfhM+6LTgEz5GvwTD8I9/X478eeQTdgiQfK+Fj4c/9+vvzsGkA
M2DIY0DWJX1fgf1j5O1MsfzlfBlZQFax+QUfgXfDW7h3Et6WdKcbPj/p7hr4
LPI5eAGa0E8jO0zvTMUbPSabGrKIzTv4ALwBfgtehG+EN/LWKPw4aIIfM+W6
GLTmqt/CXHYd2L/n7k5Trp6zxz0UMe0z2ZZAETTHWyX0y5JiWxs1Ppepft7P
1aAC2sAGr3euHDz3R2Bpkuzi7tyku4vgr6J33sOW8NEePtzXKvAj+vg5cqqP
HnVGnOWwq8a9crzfGbIcvgaS4rzkuSf1rtU0mD5Ldabvhaib53YwU67Lk3rh
PSlFPb3W09FD/1aMGv//Vo74PE/PtxnZa7LfbJp7n/+H/pbp/hVTL93PWY/N
FEMjcltS/mfgPUn9OwofSsr9OvyqKe9x01yPRZ8qUV/P7Q+oofuKTSUpHo+r
GnVsjzg8nr6kXfIafEO+ibtP4Ydjzny3PuTqke/cHdP+3kfny+/z5nM3aepP
Db7HNHu+9zfjbc/jZczDE3T34j/g/m5Eb7yH10z59CfNute6C95v2hHflQlT
7wfhD+I/c9e0z77Xz+A7Yp99Ry+aaus1PmGqle/xedPsbIFfMNVnK/x07I/3
YTxqvgv+D7bAiFA=
                 "]], PolygonBox[CompressedData["
1:eJw1lMtL1VEQx89vTpCl29QrpEYRJJilQlG5KyXLiF6QWea1ZeaiBxTVoqis
RdoDgl4rbdU/ULug0h56zSyDiMBACKIgoRYR9vkyp8WHO3Nm7jnfOTPntyTf
u+OIhRDaYB7sjiHUZyGshusE2vFrsVfCbfwRGIYx/ALsS/kNcJf1M7AQuwra
iA3g12Hn4IL5mmKV0Id/ExpT/h5iB2Ej9iYYJFYLD9H1BHLEnuM/g1fEX8Ml
7MWZa5D2Cfw8uV3wgbXz+OX8GpzAPgsl2L+Jt5B/Bb8avxi24eehGbsFHhCb
4/ckud3wGbsrujblDJnfie5Gmu9gH4Vvwc87bl6TatMZN/APpfgUNBDbCasy
vyPd1fekX+f9Za3XXOs0rCf3Kn5Z5j3pN9cs7arpsv4L74Of0Y3dCV+wx6CO
3Jf4L2Cc/Ddwz7zW+tTLHH4/uYNQJO34t7DPQcDfFX02pPmaao++v/R1mJ+h
swpwAH+Dee+kaTmxGvwh7AFYgN8afTbKU6+2mP/3MSwjNt/8bGmYw15rHtMe
pcQ7os+eZug+sU+wl1g7fGVtDf6jVP9ScsvM+6kaVesK81qVsyj6nevulROI
FaXze2BWvTOfLfXoD7kV5rWcUrruI82r9Jaw31NzLdI0opnV7MIE9ls4Zj4r
6pdmowd+Be9pM///Yb639GgWm9J96owK4vvN714zsi56T9VbnaGzZjLXrhp+
mu+pvfVGT+sdwyhM4r+D7eazqTN01rj6oZkiNpXenN7ecPoWqAbVMpr2kgZp
UQ2H8bdGf+t6oxfN34Tq1Qxvjj7T0q8Z0oeoMs2b6iuOrknaCv+1ZP7t0Qxr
lifN+6V+fGS91bzX2k+z+Q8+TJm6
                 "]], 
                PolygonBox[{{732, 731, 457, 89, 487}, {461, 90, 458, 709, 
                 710}, {471, 470, 721, 97, 473}, {488, 109, 485, 731, 
                 732}}]}]}, 
             {RGBColor[
              0.8990263390630668, 0.6196578188400554, 0.2905723757584528], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJw1kjtIXFEQhu/O9bGCdi7BBxixiRZrEUhAEHxAWJcIPpLGdVUksUji2ohs
olaisRK1srdOb51CQtDEIKKChUsIq6y7SF6d4jfMWAzzzZy5555/ZponZ4Yy
EgRBAguxgCCLu4kEwRWWgnPkajjcgh/Cp+Qn4OOI1Wl9iXwLNTvwUzgO78NJ
uEjNKPwTfofl4A7O38B/tR5uoKYcq8CeEf8jP835HBaSW8I3+nkl9jK0+CP5
frgKXoTr8WV+17LH6/gR7Jw726jthD/DA/gEtgc3k791LTGxOq1PwRF4Ca6C
R8V0qb5dsf7s812UeA2uE9Ojut6qPiwDF6iZgkvwa3wDNZ/gdjFNquW+B+r1
3VqrWlT/md9zAZ8EdlbEPoj1o4f7/vtcCuRixNtwK/ze/9FN7hqfJv+L3DwW
Je4Nrb/6nyScFXtHF7wgNgudyYrXPw+tp/rGYXhY7E2D+GrXFRfrhfbkgb7R
3/MIXhWbl85N+6797yOXj5hG1frD3/lVbM9U14H2Ex6HL+E/YnOJ4o88/w0+
hMfgPbGl1r1t0jn7PuvcvvtOflEdoe2D7kWt7/AT+HFoPX4ltq+6t2nvU9Fn
sCE2rxec//b/5sW+0ZpZ/Kbvru7sHSsSZCM=
                 "]], 
                PolygonBox[CompressedData["
1:eJwtk09IlVEQxe8395UKtUsSDfrjpqBsEahBSJZBZYvSVmkZQS20nhsxs1pZ
2iqwVfvW7Vu7knhaEkEbzQgxI0PsKUUt+h1mFodvzp25M3Nnznfw1nBP2VJK
p0AJVCA3+F4HC0VK7+E3sQfAR/gf8Bv84HwdNIDn+F6BmpxSG/xN8Hr4UfAF
exlcw1cHJrDLoIrdAWawX4MmYr+Tew185nwZTIF98BrQjf8ifC55jWb4EfNa
6qEW3gXqiK0FD/F1wndi7wBj8FnQT2yf3srZyey9qce7+N6av10x7/APwavJ
cyr3uex8CzxSrPndCjim/kAmtgSe4DuTvXf18ECx5rWVf52zlainmW/Cv0Z/
OtuAX+V+U+EzeIGvF95Y+Nk0fN58N7r/gbP75rV/wu9gX475fgI92Ieyz0/9
noePaI/Jex41j1Gszk4Qux/+MvazC94a+1UO5eozn5/m0Z59BpXw9+M7HPvR
nT34bpv3phq92GvRvzS2XbimpK2/2P+0x9CLekjc3xt6GxPHXgKL5pqRdh6b
70o70q6+Fa415fiFr8X8LZpJI/4r8V5xafFSdu0oxzP48YhX/d34Lpi/TzuX
tk9n11YpZn8g5qV6Bb6zkU8aGMdXb9673qB/55757DRDabE79KI7k/hW43/U
jKqhKdWSBp6az1z39d5B+H/fvHZc
                 "]], 
                PolygonBox[{{491, 110, 487, 733, 734}, {508, 507, 750, 120, 
                 510}, {747, 96, 473, 504, 505}, {736, 735, 461, 91, 
                 492}}]}]}, 
             {RGBColor[
              0.9355148199185477, 0.7087870497963692, 0.4000959417474978], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJwtkrtKA1EQhs/OAUVFi6Ag2CQ2RhAEiWKliRHU0hveOkHxAsbKaGxtfQBb
H8BSH0A7n8AU0doo8YagBPEbZoqf+XbO7sw/czazWVo4kBDCCIroAd2iO7TL
wQdxlIMEXcBpcin4WvNwFq7Bq3A7OoS/iTvoHc5xfgp/wtNww3tUUQvPl8QB
zgU+gzvgVvgc7oUXxd7fIg6Rv4fn4BWxvtp/DX6EB+GKey7CVz6HznPifqai
5aruY1mMl4jPSQgluAb/wWW4SfwS89ZG7PS6w3BftNoTcFlstjy5tPucIbcu
xupd59G5eoi/1D2CU/AsuoH7eecYfoML0Xwpa92CmO9JsT3qPvfhl8R2/iTm
VT2/wuPRdrIhNo/OVed8232q3x/3UBfrrR7G4JzY/eo97/lutV6331dWzLd+
2yR2+b+REduF7mRe7D9Qbw36/ANCy0/y
                 "]], 
                PolygonBox[CompressedData["
1:eJwtkjsvhEEUhuebTwhCY2k0uxUaFHaVLA2lW6gl7olVubZaP0DrByjXD6Dz
Cyjcb7uCvVgiEfG8OVM8yXnnzJzznplJzecm171zrhfq4AnxCJXIuSq8Qo71
ffhkPQWHQfvYuTV0lfgKBtHj6HPiPKTQGfQJ8REk0BPoU+ILmCJuiy2v/QPo
mrd+G9BEXIQCfOHjG/qJj515aOVsszcvOqOzA6yViUuwhE6jK87WltFd3ryo
p3pnYvOvPSvkFrx5+4BF4mSYVz1b2Nsdzh9AA/oF/QyfeKtFNnM+1B9jvTH4
U42IXA9ch/uaJTcS/Kr/rrcaqlUIsz/APZRYK8Mb8RZ7N+EHfePtrjR/MbI3
UG31WCU3GubXjHvoX29nVSNBPARnYT7dbYe32TRjfWx/QH9BM2rWd3mIzJO8
Dcd2V7rvbW8e5VV/SH+pL7yX3ryTve2hvvr/sS/t7b70Z5Lk57z5l1+9TSLM
qzPypjdVr0uYIc7GpnWHO+hpbznNlCW+g1tvnuX9H5hacGU=
                 "]], 
                PolygonBox[{{503, 502, 747, 118, 506}, {811, 810, 603, 223, 
                 601}, {495, 112, 492, 737, 738}, {583, 203, 602, 810, 
                 811}}]}]}, 
             {RGBColor[
              0.9711851767279792, 0.7979629418199481, 0.5106740478567356], 
              EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJw1kbsuhGEQhr9vNhQOi5CtEKsgQiGxtOLcC0GrQUOcLkHFFai4ApVLILiF
pRERURARwVJ43swoJu/zzcw/p7+8ujW/aSmlIayALfG4Rgd4tGOncD++LvgK
noF74HN4FJ429ytejx3BJXwF+ABuNq9xmDy2xruKVohPwBfwAtphHv9Fi9gO
/I22YnvwDzqJXcKdfFuJupqxFN+qxod530a0jtgJ3Ad/5pT24We4BduFa2Jy
juFeeAW7gQfxbcB38Bi8Dt9qX7gtdh/BV4uaqr0Ye2m/2bhhN7kvxLbhe/Mb
aGbNVCR2hg6bx5Tzmr2f+i7js5itDDdFzhf6nn3+R+2b/T5P8FTc5/9Omrka
PdRr3Hw37TgHN8StdLO37Dd/iD30X1TjD2qMQkk=
                 "]], 
                PolygonBox[CompressedData["
1:eJwtkb0uxFEQxce9aCS7drWCFbGUYrdmYz968dmqaIivR1DxBCqeQOURCPsK
6EREIRGRsBR+JzPFyf+ce+aeO/+Zytbe8m4ysynQD+qIa74XoJzNRtCnoQfQ
8+F3wTh6FtyH3sQbAifwc5DwquhL+BkYRM+AO/M763iTyWt1J+PVwSP8Cezg
VbNzna2hf8ER/BiU4D1waH42DP8BB+ZnRfhG8vt6U29/o/fNawrwTvLe9U8T
+G/Js5X31Wf2Evmq/0A/R74y3tGv0Y9qPtE1Mh6i3228BXAFvwEN+Fxo/XMx
+4w1W82ohjedXKufUvZ/VD/agXaxmDxLGcoqx35U0+P9lfDVwyq8EvNVfSH7
DNXbLViCj2bnuqPssdin5tVEt5JzzVC70M67sb823l/y3aoH9fIPc1tIZw==

                 "]], 
                PolygonBox[{{759, 758, 495, 113, 524}, {525, 133, 522, 758, 
                 759}}]}]}, 
             {RGBColor[1., 0.8919377073197147, 0.641133201224465], EdgeForm[
              None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJxFT0sOAVEQfOkXO4yJrRAWrCcuIPE5gIUDOAC3MLiCCVcwuMMcyW+jKtWJ
RaW6ujtd1f31drmxEEIXiEAB3IASODlfgSSKMywvgAfqHnoxam/gvTNwAWbQ
d96N6nFGPYKuwHPMp6Z6BW4DR9SpSVe++0S9Q91wLjzXxJSng52De9InjaqH
fqP0f1qmvY8pN/OM7f8n7zahc/DLpOlHXXdvZsncl/702wfdTT3/F5yY+m9T
Fs45q0Uxf/0BWiotIw==
                 "]], PolygonBox[CompressedData["
1:eJwtjtsRAVEQRG/NXX8eq/yiikUAZOAVgBAEQBZeKdgiBawcpOTx43TNfnTd
09Uzd7q33q42FkJooQS9MXveHarCNXM+oxhD+OKP8AE14I85a6cOj9EDztEA
7pvv3jTP/hB/gQuU4if4J3xFTXwn+r7yOdkU3eEXmsELc9aMZn/4U/BOqfmf
RZmrSxK9mzpm5p3ysq+yrOyvTurWjt5VN3V7ZN5NNypk3fJ/dV6S/QFE2yID

                 "]]}]}, 
             {RGBColor[1., 0.95, 0.75], EdgeForm[None], 
              GraphicsGroupBox[
               PolygonBox[{{549, 157, 547}, {547, 157, 772}, {548, 157, 
                562}, {562, 157, 784}, {784, 157, 549}, {772, 157, 
                548}}]]}}, {{}, 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{772, 548, 562, 784, 549, 547, 772}]},
               "7.`*^-6"],
              Annotation[#, 7.*^-6, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{759, 525, 771, 546, 783, 561, 576, 796, 578, 579, 
                 598, 807, 581, 797, 580, 798, 582, 799, 563, 785, 550, 773, 
                 531, 529, 763, 528, 762, 527, 761, 526, 760, 524, 759}]},
               "6.`*^-6"],
              Annotation[#, 6.*^-6, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{738, 495, 758, 522, 757, 523, 770, 545, 782, 560, 
                 575, 577, 596, 597, 615, 820, 616, 821, 617, 822, 600, 808, 
                 599, 809, 601, 811, 583, 800, 565, 786, 564, 787, 551, 774, 
                 534, 532, 764, 530, 506, 503, 746, 501, 744, 499, 742, 497, 
                 740, 494, 738}]},
               "5.`*^-6"],
              Annotation[#, 5.*^-6, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{734, 491, 756, 521, 769, 544, 781, 559, 795, 574, 
                 593, 595, 613, 614, 631, 832, 632, 833, 633, 834, 634, 835, 
                 635, 836, 619, 823, 618, 824, 603, 810, 602, 812, 585, 801, 
                 584, 802, 566, 788, 552, 775, 536, 533, 510, 508, 749, 505, 
                 747, 502, 745, 500, 743, 498, 741, 496, 739, 493, 737, 492, 
                 736, 490, 734}]},
               "4.`*^-6"],
              Annotation[#, 4.*^-6, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[CompressedData["
1:eJwl0L1LQlEAxuFjLg2uErZIODl4l4ZIaMzBvCC33GyJxj6WcKqpDx2rP0pC
bl9ERGA4qhAtLkEEPdLw4+E90zlnZe84OcqEEGL1F0K4N0ac8oNjDjnhjIsK
2RCKzDHiMjfYVKJVe58n6uhcdWcXvNS1tu0b7vCWLXa5xSs22GPMM27ylDUe
cp0HrHKXFbYZsc4S15hneX5vFrg0v79+veeLP/zkN9/1pif7lQ98YcpnDvjI
O6aZ///6A4plKJ4=
                 "]]},
               "3.`*^-6"],
              Annotation[#, 3.*^-6, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[CompressedData["
1:eJwl0DtLgmEYgOH30yGiPaggCKQhiBqD3COChIaETpbuOkhrQ1sNNdRip6XD
DwmlTDqJSCTRlKvQH8jro+Hm4nmGB953Il9aKUYhhJzuEyHUDR3+8JNd/nJA
fxrXUDKEaY4wzUlmmFdBZe1q0X6fRzpWRWt2ZzzXtbbNN9zhbXyDd/EdXnKd
F9zgFTd5ylWeMMtDLvOAGe5xgSXOs8g0c5zhFme5xBTnOMwpDnKMo0ooUi9+
u3/41pda5g6b/OA723xli89sssE31vnCBzZY4xOrfIz+/70PETU0Kg==
                 "]]},
               "2.`*^-6"],
              Annotation[#, 2.*^-6, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[CompressedData["
1:eJwVzLcuxWEcx+G/OrgBBgaDiYUNwWpAOBOLFr2cg9GCGaOyKYvee3fUCxA1
ItoFcAHEY/jkeb/JL296fSQUjgmCoFeZsUGQqh8lKF5fitO7ozfde7/yji+8
5TNv+MRznenYjvKIpzzkCQ94zH0ecY+H3OU+d3jw/w+vGeUVT3nBE17ykR98
4Ce/mahfpSkpLgiymMJ8lqpMOXYdi9jDfg0oZA9zTOOa0rTmNK8lLWtd7W43
2MFNdnKLYW4zwlW2cIWtXGMbF9nEBTZzlg2cYSMnWc0J1nCUlRxhFYdYzkFW
sI/F7GYBu1jIWmazhBnMYzJz+QcLpUaw
                 "]]},
               "1.`*^-6"],
              Annotation[#, 1.*^-6, "Tooltip"]& ], {}, {}}}],
          AspectRatio->1,
          DisplayFunction->Identity,
          Epilog->{
            Opacity[0], 
            EdgeForm[{
              Thickness[Large], 
              GrayLevel[0], 
              Dashing[{Small, Small}]}], 
            GeometricTransformationBox[
             TagBox[
              
              DiskBox[{1998.6724022575088`, 1199.7738239204432`}, {
               427.0520550882883, 322.0440824738084}], 
              "Ellipse"], {{{-0.9985925754925785, 
              0.05303647962580868}, {-0.05303647962580868, \
-0.9985925754925785}}, Center}], 
            Opacity[1], 
            RGBColor[1, 0, 0], 
            PointSize[0.03], {}, {
             InsetBox[
              FormBox[
               StyleBox["\"Prior\"", 20, 
                GrayLevel[1], StripOnInput -> False], TraditionalForm], 
              Scaled[{0.95, 0.9}], {1, 0}]}},
          Frame->True,
          FrameLabel->{{
             FormBox["\"\[Beta]\"", TraditionalForm], None}, {
             FormBox["\"\[Alpha]\"", TraditionalForm], None}},
          FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
          GridLinesStyle->Directive[
            GrayLevel[0.5, 0.4]],
          ImageSize->350,
          Method->{"DefaultBoundaryStyle" -> Automatic},
          PlotRange->{All, All},
          PlotRangeClipping->True,
          PlotRangePadding->{Automatic, Automatic},
          Ticks->{Automatic, Automatic}], {186.66666666666666, -183.75}, 
         ImageScaled[{0.5, 0.5}], {350, 350.}], InsetBox[
         GraphicsBox[GraphicsComplexBox[CompressedData["
1:eJxl2H1wVNUdxvEkZQISqby0hqGDBVokIi0CAaq8HUwtpMVIiAIyRQgtDvQF
l4DyKtwEwygNuwcCCkXw7k0wQChcQAnlbU4oijBUriiDELAHcHxBRy5Q6MUA
9rbuc8/kMX9k55vs3d85n7u7f5zOk54ZNTkjLS0tO/z1v8dvf1aL/z90qvj2
0aYWf23amtpa07Q7vdq0FfXEtU07bR3Npxav0XxqYTdtSa2pH0jS+qk96k5O
045RK2p4tl6a2g81PNGaGp5oeKIVNTzR8IzmU8Mzmk8NT7Sk1tTwjNZP7VHD
Ex2jVtTwTIun9kMNT7SmhicanmhFDU80PKP51PCM5lPDEy2pNTU8o/VTe9Tw
RMeoFTU8ffL0ydMnT588ffL0ydMnT588ffL0ydMnT588ffL0ydMnT588ffL0
ydMnT588ffLUidR+qOGJ1tTwRMMTrajhiYZnNJ8antF8aniiJbWmhme0fmqP
Gp7oGLWihucUmdoPNTzRmhqeaHiiFTU80fCM5lPDM5pPDU+0pNbU8IzWT+1R
wxMdo1bU0fuTPDV5avLU5KnJU5OnJk9Nnpo8NXlq8tTkqclTk6cmT02emjw1
eWry1OSpyXPsstR+qOGJ1tTwRMMTrajhiYZnNJ8antF8aniiJbWmhme0fmqP
Gp7oGLWihqdHnh55euTpkadHnh55euTpkadHnh55euTpkadHnh55euTpkadH
nh55euTpkadHnsOXp/ZDDU+0poYnGp5oRQ1PNDyj+dTwjOZTwxMtqTU1PKP1
U3vU8ETHqBU1PBV5KvJU5KnIU5GnIk9Fnoo8FXkq8lTkqchTkaciT0WeijwV
eSryVOSpyFOR5y8qU/uhhidaU8MTDU+0ooYnGp7RfGp4RvOp4YmW1JoantH6
qT1qeKJj1Ioani55uuTpkqdLni55uuTpkqdLni55uuTpkqdLni55uuTpkqdL
ni55uuTpkqdLni555qxI7YcanmhNDU80PNGKGp5oeEbzqeEZzaeGJ1pSa2p4
Ruun9qjhiY5RK2p42uRpk6dNnjZ52uRpk6dNnjZ52uRpk6dNnjZ52uRpk6dN
njZ52uRpk6dNnjZ52uTZfmXq79TwRGtqeKLhiVbU8ETDM5pPDc9oPjU80ZJa
U8MzWj+1Rw1PdIxaUcNTkqckT0mekjwleUrylOQpyVOSpyRPSZ6SPCV5SvKU
5CnJU5KnJE9JnpI8JXm2eDm1H2p4ojU1PNHwRCtqeKLhGc2nhmc0nxqeaEmt
qeEZrZ/ao4YnOkatqOFpkadFnhZ5WuRpkadFnhZ5WuRpkadFnhZ5WuRpkadF
nhZ5WuRpkadFnhZ5WuRpkWdAngF5BuQZkGdAngF5BuQZkGdAngF5BuQZkGdA
ngF5BuQZkGdAngF5BuQZkGdAnrFXUvuhhidaU8MTDU+0ooYnGp7RfGp4RvOp
4YmW1JoantH6qT1qeKJj1Io6vL71saF17R8259N5nXefCV4wPWtG74xTh+Ki
45ysuSNLzfl1oXz7neWvmX6hpjT7xL7vnm+PXbZh5t8LTd9fcHhY8+q4eHFg
h9rP73ai548qvTF68wTT7867I1sOdpq+XrieRT17t+6fYc5/Lw7Pn3+0p+nC
SRM/Kx5vete8WY//Z4npTivjqmJXQly9vHyfWGzOj9tWftQsmTDdK7f7iPTV
pkeeeLay2DE97bn60/W1ppdmt+rS5U3TtbvGTi3bb/rIk9Xu+UPfPa/ut7Wy
aPI14zNu+6M7Fg8w/1/wZvN2G0pNV+2qLzl8KCH+0vdMYf8sx6yv5VP+7C/o
9cP7v2PMtobirqYfebzvhaplCbHzxZ33fzLVXF/22Oyr7xaZLrj7oT11g0x3
ONtYZnczvbtFyW250/Tt4kWTk0tNw7tm0PGjBRPMeegz1dOa5RSa7p+VNTA9
z/Q302tmnM41fejDvNod95qOD9HnK9qbHv36/A5PtzQ9oEPv6gWB8Vq/r2bE
I/nm/PXB8UUf5P7E9Jobt+qGf50QK4qXLy49Z86/V5V3P5h+2/SrGw+kl3Vw
ooZny+0V+/wfm/Pb3E3HH83sIcVPT23+h1dlnv9UY6sefRbS9eH8m6uPl2Q0
mM7b0iKIv256yYHBz/+oxMybPmLm3rLTpmvyi/a2rzV99le9926ZZ9YzaWhe
ccMeKX7z9aYnzlQmxfmv0tJXDoiLKeMWvn9zU1I8eNeCudetuCjfXVTY8UBS
yJ6NV8e8HRfXqnuU5ITvp399VT56Tvj5HdJm2wkn0xH7+rQr/awqfH7JR3Nj
4feRHLMmVng5Lor9fjeWLkmKru9Vf7HxroQYNC0xq3ZFUuz+9ZanM34evn++
/PTaO+uS4rGDdefGjUiI61PFzE82JMXHg+p/u+MPCfH+p6uufG9HUsypO3Iy
66WE2Dr5cqxz+H3y/V4fjPp9TUJUXMi/NDj8/FRtOvvPvW8lRL82n89b3xB2
nz0z/LYJ8btdou5IkBTd7zvQdWL4enLCqiuXfuiIbfccPnmsPiHWJz6csfYH
jph98uDPvhwtxYbYrdxF4X5u5cw/dnCoFLWFXa5PCa8vm9tn+trw/m3tPayu
4GJSND96se1z2VJsb/en2blnkqKio/NGQYYUzXotzGwx0RGLD++/486RUpTX
vPHK7l86Ylhj/EJ2Nyky77mY8+f7HNF23P65w24mxJXxHfu89bIjLt65+Wi3
7lIoWffxzT86otOT7cY0npKi184RA5/Id0R+mxmnv1kvRbLhXOXf7nVEyeHj
45uF9/+Bzf+uOrnXEcMzLj2bF75f1i18L5a51hHThjy08aXw/rcq2jKo7/OO
qJxffuZYeP//Cw1Ow7U=
           "], {{
             {RGBColor[0.148, 0.33, 0.54], EdgeForm[None], 
              GraphicsGroupBox[{PolygonBox[CompressedData["
1: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
GiX5LdEWNpYq8blMiY3lyhnGN9TceCc4F1oY72B72Nc+dDS3QY7dbQ/wtyhw
g/1ZrGRsrT2gxg8ouQ+syIszlzPjfmNn3r0+I+d7jJF5C+wxvV2onKatKY6t
ttbUhW8A5xXfBH7zNFTnO8EZydkIRwMXAWcDR8PdFv4BTqeKOpwO3EuNrOB1
DnBsZ59VzwpuqJq2EocFp7GT4+iJ52Ie/NHB2uUuBC8Eb5Xu0tytuUsfqs7d
u7b6bo6zHh7kMMfgSuCwEndSxzHuW3X1QW5HqZNbPfXEr8HvwBHAT7Q1dniC
hlnJ1xxjHg3UiQnep5l5NnSsls+aWqfG2koc1nHm0VSdHE7QFnE3V0/cU2tr
dFJW8CDk01K9qnEdbd4nuj5xbS2zkmtr5Vw4gDbm0Fa9nn5Otsf1fZY4OHJI
d+bxWcnRtDcPOIeOzu3gWOKJOuibbyc8y/q8yPXXvMgBXqSLsZ6rnjisTubM
eGftwZf0NdZu2iUO+J8LrBn3h+7m2UOdPM9Xb+14t6zkpxhLHFavrNgLvRwj
nz766KD/PsYE/9LPHrfXBvH2d4z4uJMNzEpuaJB5DnBe4qEGGNcQ5xETvMiw
rOTmhpvPUOf1cHyo8V7uPPIYoU7cV6gT90h18hilTl2vVN+aF3+/lxe5jc6K
uz35jFEn7mvUiXusOnmMU29oPU4z5/GOETfcDfuJ7znf9S+yknuanJXc03Xm
xz13ovlPVk+c1BTjhheZZh43qpPn9c5LfND1ruf+fIe5wV/ckpUc0+ysvD9P
N7fb1PE/z/WJn5plXaZrizzhTRJfMtP1E/U5x3rMch553qld7vfc8x80t/mO
JQ5oobktUk/czXxzW6hODRY7L/FTS41xuXrisxabP+NLzPMe5xH3CnXyuFed
uFeqk8cqdeqxWj3xaKvNe4164qfWmPNadfJ8QH2+NUAfmpWcH/mtt0bkBhcD
j5J4k03m9nhWcDaJo3nY3Pjt+KjxseZp837MsZU+22D+T2gr8VZPmvMGdXJ7
Rlvk9qx64pteysr/h3jO3J5Xxx8cy6vW4jnXk/MLzqMGiU9KvNXL5vOK+jr9
vJiVXBtx1/Cbz73oUf3APd2lrfXmwe/rjVnJ0byhjbfUifX9rOAxnnLuW8bL
s83WbJO2Em/1jvlsViefD7RFPh+qJ75pS1ZyfB+Z5yfqjxvX6+b5kevJ/1Pn
kRv3zc+ykrfa6rov1F/Vz+dZyTm+Zj78vuc8aujvJ+7h5AO38HVWckw/6v9n
dWoAD/O9ecIzfJuV/BT8SOIm4Cre9xlrEg9Cr1gHTwHPgy14EvTN2v7Omn6r
PeLCHpwTcXOvTvd1JHfrTX+aSw7MhRehRvA/v5k3z1hPrX8xN2r6qzrj8AmJ
p0EmngYJZ4I9OAC4AO7+cA7o2II3gMtJPBGcD76ZC8fBfZJ7LPdL/MExsIZ7
KfendE/t6jzqjj1spTpSL+qKbfQd/E2cuD1k4vyqms/O1j7xatXzki88yPWJ
UyMf+I191RMPhc7equA4e+sP65u4jz/ci7n2WAcvUdf61VPHLpxH4myQh+uj
rmPwFNxZEm+BPMG53M0Tt9HCeZXV61hTeJxa1p31tdXhjZqqYw8eEL4JPoT7
wyGON7GW3DOOsY5wMvXtfR3tVvEZufF/wvwW57c5Nrj7crfivsSdarF2edZB
39yVz9QH/EmbvOTX0LnbnKaOH3iU1sbSRj3xj+RRyTzReYd2dI/s6nhNe8Ce
a2XcrdWpe0vrC9inXaw9fEnidzsZdwvH0/2ys/M4j7njt7efrbTLmdPOfBo5
3s66d3DNRt9h3lfu4dwfuQNzx+b+N9v18Co985J76mGNeqpTF/iJ7trmrttH
n/ARF+QlH9HbudyXh+QlH9RLW9zlh+Ul53WePYPvuMg6wZ0kTgsJHzTR2OfY
8wuNg3d7oGt477lzD8pLbmWw9b1YH10dH2h94ZzgnhKXcZ3j3OHH5SXHNML8
RqonTuqyvOSkLjemUc7DJxzFVfq4Wp084WSuNKar1Htqb7hxjXYNNYBXGmM+
E4yPnMc6ljipsdZrjOuH2O8J2ia/yfZnomP0Y5L6cMfREw9ILJ3MgZwSF9lN
33APM/Q9U5244VJuMT/4j5uMi7lwK4kHWWSs012T+KmproOvuTsveZ+brR3r
b8hLnutGewjfkfgqZOK3kHNdg8+78pIrSdzJAtdTy9vNh1rPUqeOs9UTPzjU
dfw/4oN5ySstyUtOZ62+4XHWWAO4m+X6e9B5iau6Ly95qGXGAe+zwjzWamuO
cxOvg4S3G2E+1IO9OM1cE8+11HxWavf7vPh9v2eFIrdVjv2YF/93vXeFoq8r
jPv/bAUhiw==
                 "]], 
                PolygonBox[{{508, 60, 61, 448}, {445, 80, 59, 505}, {448, 61, 
                 83, 451}, {472, 83, 105, 478}, {505, 59, 60, 442}, {480, 123,
                  101, 458}, {530, 146, 145, 498}, {533, 147, 146, 501}, {498,
                  145, 123, 491}, {458, 101, 80, 510}}]}]}, 
             {RGBColor[
              0.3822921106323298, 0.43805793025417344`, 0.5943394621202918], 
              EdgeForm[None], 
              GraphicsGroupBox[{PolygonBox[{{529, 126, 496}}], 
                PolygonBox[{{446, 445, 505, 506}, {449, 448, 451, 452}, {452, 
                 451, 472, 473}, {481, 480, 458, 459}, {511, 510, 445, 446}, {
                 499, 498, 491, 492}, {443, 442, 508, 509}, {506, 505, 442, 
                 443}, {509, 508, 448, 449}, {459, 458, 510, 511}, {531, 530, 
                 498, 499}, {502, 501, 530, 531}, {473, 472, 478, 479}, {492, 
                 491, 480, 481}, {534, 533, 501, 502}}], 
                PolygonBox[{{479, 478, 495, 126, 529}, {496, 126, 504, 533, 
                 534}}]}]}, 
             {RGBColor[
              0.5588201843872164, 0.5000965504236223, 0.49056577020048625`], 
              EdgeForm[None], 
              GraphicsGroupBox[{
                PolygonBox[{{449, 82, 509}, {529, 104, 479}, {450, 82, 466}, {
                 474, 104, 494}, {452, 82, 449}, {479, 104, 473}}], 
                PolygonBox[{{497, 496, 534, 535}, {447, 446, 506, 507}, {460, 
                 459, 511, 512}, {473, 104, 82, 452}, {500, 499, 492, 493}, {
                 507, 506, 443, 444}, {493, 492, 481, 482}, {532, 531, 499, 
                 500}, {466, 82, 104, 474}, {535, 534, 502, 503}, {512, 511, 
                 446, 447}, {503, 502, 531, 532}, {482, 481, 459, 460}}], 
                PolygonBox[{{494, 104, 529, 496, 497}, {444, 443, 509, 82, 
                 450}}]}]}, 
             {RGBColor[
              0.7353482581421029, 0.5621351705930713, 0.38679207828068074`], 
              EdgeForm[None], 
              GraphicsGroupBox[{
                PolygonBox[{{503, 125, 535}, {450, 81, 444}, {497, 125, 
                 494}, {493, 124, 500}, {453, 81, 518}, {535, 125, 497}, {507,
                  81, 447}, {500, 124, 532}, {444, 81, 507}, {488, 124, 
                 521}}], 
                PolygonBox[{{467, 466, 474, 475}, {532, 124, 125, 503}, {526, 
                 125, 124, 488}, {461, 460, 512, 513}, {483, 482, 460, 461}}],
                 PolygonBox[{{513, 512, 447, 81, 453}, {521, 124, 493, 482, 
                 483}, {475, 474, 494, 125, 526}, {518, 81, 450, 466, 
                 467}}]}]}, 
             {RGBColor[
              0.9018971776193274, 0.6247429440483184, 0.2958812506199148], 
              EdgeForm[None], 
              GraphicsGroupBox[
               PolygonBox[{{527, 526, 488, 489}, {519, 518, 467, 468}, {476, 
                475, 526, 527}, {454, 453, 518, 519}, {489, 488, 521, 522}, {
                514, 513, 453, 454}, {462, 461, 513, 514}, {522, 521, 483, 
                484}, {468, 467, 475, 476}, {484, 483, 461, 462}}]]}, 
             {RGBColor[
              0.9300965504236224, 0.6952413760590559, 0.3832993063132293], 
              EdgeForm[None], 
              GraphicsGroupBox[
               PolygonBox[{{477, 476, 527, 528}, {455, 454, 519, 520}, {528, 
                527, 489, 490}, {463, 462, 514, 515}, {523, 522, 484, 485}, {
                469, 468, 476, 477}, {520, 519, 468, 469}, {485, 484, 462, 
                463}, {490, 489, 522, 523}, {515, 514, 454, 455}}]]}, 
             {RGBColor[
              0.9582959232279173, 0.7657398080697932, 0.47071736200654357`], 
              EdgeForm[None], 
              GraphicsGroupBox[{
                PolygonBox[{{469, 103, 520}, {477, 103, 469}, {490, 103, 
                 528}, {528, 103, 477}}], 
                PolygonBox[{{524, 523, 485, 486}, {486, 485, 463, 464}, {516, 
                 515, 455, 456}, {464, 463, 515, 516}}], 
                PolygonBox[{{456, 455, 520, 103, 470}, {470, 103, 490, 523, 
                 524}}]}]}, 
             {RGBColor[
              0.9864952960322123, 0.8362382400805308, 0.5581354176998581], 
              EdgeForm[None], 
              GraphicsGroupBox[
               PolygonBox[{{457, 456, 470, 471}, {487, 486, 464, 465}, {471, 
                470, 524, 525}, {525, 524, 486, 487}, {465, 464, 516, 517}, {
                517, 516, 456, 457}}]]}, 
             {RGBColor[1., 0.95, 0.75], EdgeForm[None], 
              GraphicsGroupBox[
               PolygonBox[{{525, 102, 471}, {465, 102, 487}, {487, 102, 
                525}, {517, 102, 465}, {457, 102, 517}, {471, 102, 
                457}}]]}}, {{}, 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{517, 465, 487, 525, 471, 457, 517}]},
               "0.00016`"],
              Annotation[#, 0.00016, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{516, 464, 486, 524, 470, 456, 516}]},
               "0.00014`"],
              Annotation[#, 0.00014, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{515, 463, 485, 523, 490, 528, 477, 469, 520, 455, 
                 515}]},
               "0.00012`"],
              Annotation[#, 0.00012, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{514, 462, 484, 522, 489, 527, 476, 468, 519, 454, 
                 514}]},
               "0.0001`"],
              Annotation[#, 0.0001, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{513, 461, 483, 521, 488, 526, 475, 467, 518, 453, 
                 513}]},
               "0.00008`"],
              Annotation[#, 0.00008, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{507, 447, 512, 460, 482, 493, 500, 532, 503, 535, 
                 497, 494, 474, 466, 450, 444, 507}]},
               "0.00006`"],
              Annotation[#, 0.00006, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{506, 446, 511, 459, 481, 492, 499, 531, 502, 534, 
                 496, 529, 479, 473, 452, 449, 509, 443, 506}]},
               "0.00004`"],
              Annotation[#, 0.00004, "Tooltip"]& ], 
             TagBox[
              TooltipBox[
               {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
                LineBox[{495, 478, 472, 451, 448, 508, 442, 505, 445, 510, 
                 458, 480, 491, 498, 530, 501, 533, 504}]},
               "0.00002`"],
              Annotation[#, 0.00002, "Tooltip"]& ], {}, {}}}],
          AspectRatio->1,
          DisplayFunction->Identity,
          Epilog->{
            Opacity[0], 
            EdgeForm[{
              Thickness[Large], 
              GrayLevel[0], 
              Dashing[{Small, Small}]}], 
            GeometricTransformationBox[
             TagBox[
              
              DiskBox[{2312.3295959868806`, 1022.1281035827698`}, {
               100.17181384599346`, 44.12204138693451}], 
              "Ellipse"], {{{-0.9277332901023083, 
              0.37324381098143633`}, {-0.37324381098143633`, \
-0.9277332901023083}}, Center}], 
            Opacity[1], 
            RGBColor[1, 0, 0], 
            PointSize[0.03], {
             PointBox[{2300, 1000}]}, {
             InsetBox[
              FormBox[
               StyleBox["\"Posterior\"", 20, 
                GrayLevel[1], StripOnInput -> False], TraditionalForm], 
              Scaled[{0.95, 0.9}], {1, 0}]}},
          Frame->True,
          FrameLabel->{{
             FormBox["\"\[Beta]\"", TraditionalForm], None}, {
             FormBox["\"\[Alpha]\"", TraditionalForm], None}},
          FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
          GridLinesStyle->Directive[
            GrayLevel[0.5, 0.4]],
          ImageSize->350,
          Method->{"DefaultBoundaryStyle" -> Automatic},
          PlotRange->{All, All},
          PlotRangeClipping->True,
          PlotRangePadding->{Automatic, Automatic},
          Ticks->{Automatic, Automatic}], {560., -183.75}, 
         ImageScaled[{0.5, 0.5}], {350, 350.}]}, {}},
      ContentSelectable->True,
      ImageSize->{758.6666666666666, 379.5},
      PlotRangePadding->{6, 5}]}
   },
   AutoDelete->False,
   GridBoxDividers->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
   GridBoxSpacings->{"Columns" -> {{3}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"With", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"\[Mu]x", "=", "2000"}], ",", 
     RowBox[{"\[Mu]y", "=", "1200"}], ",", 
     RowBox[{"\[Sigma]x", "=", "2000"}], ",", 
     RowBox[{"\[Sigma]y", "=", "1500"}], ",", 
     RowBox[{"\[Sigma]xy", "=", "0"}], ",", 
     RowBox[{"xdat", "=", 
      RowBox[{"{", "2300", "}"}]}], ",", 
     RowBox[{"ydat", "=", 
      RowBox[{"{", "1000", "}"}]}]}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{"GraphicsGrid", "[", 
    RowBox[{"{", 
     RowBox[{"{", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"plotcontour", "[", 
        RowBox[{
        "priorpdf1", ",", "prior1", ",", "\[Mu]x", ",", "\[Sigma]x", ",", 
         "\[Mu]y", ",", "\[Sigma]y", ",", "\[Sigma]xy", ",", 
         RowBox[{"{", "}"}], ",", 
         RowBox[{"{", "}"}], ",", 
         RowBox[{"Epilog", "->", 
          RowBox[{"label", "[", "\"\<Prior\>\"", "]"}]}]}], "]"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"plotcontour", "[", 
        RowBox[{
        "posteriorpdf1", ",", "posterior1", ",", "\[Mu]x", ",", "\[Sigma]x", 
         ",", "\[Mu]y", ",", "\[Sigma]y", ",", "\[Sigma]xy", ",", "xdat", ",",
          "ydat", ",", 
         RowBox[{"Epilog", "\[Rule]", "\[IndentingNewLine]", 
          RowBox[{"label", "[", "\"\<Posterior\>\"", "]"}]}]}], "]"}]}], 
      "\[IndentingNewLine]", "}"}], "}"}], "]"}]}], "\[IndentingNewLine]", 
  "]"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData["9.214138731794307`*^6"], "Print"],

Cell[BoxData["4815.8826146693555`"], "Print"]
}, Open  ]]
}, Open  ]],

Cell[BoxData[
 GraphicsBox[{{}, {InsetBox[
     GraphicsBox[GraphicsComplexBox[CompressedData["
1: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
/wG1R4WQ
       "], {{
         {RGBColor[0.148, 0.33, 0.54], EdgeForm[None], 
          GraphicsGroupBox[{PolygonBox[CompressedData["
1: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
p7vkXv2Gs93LPSE2EcN4VxJbi7cqbfEOpW2rfYlr7bR3W/ucK97DnfULxomd
g7R9J32lvXsz0jW5wyfIFzp8mRhKLBytjL31lR7KPdxx5OZcnZunu2KYLfTj
lRsZx8gD/cbaot84W+Y1UXbkJO6fo5xnuBY8yRHJFRtmKW+n/lHk8bTkmNQa
qHUUtYdTnFfkltBXlUeDLNVX6kpDztnYebz1yVGpH/H2P9M+eST5JPko+eTp
9lmDug+1maPkTf2ihnPhS55M/lzkzU2lR+6WrkF+3Mx5VeRR1H7qKWst12np
2tQEOsuri/2mxoouytXHMwsPctm2ykhsaSdfvrXRNh0cK2ox0PAW5k3Mu5n8
u698W8m7l3Zs43iRP/dzH1orSxu/9dWmxJ/uWbmO1lW7862besK7qOH1lAaZ
+rsGshKLiLfET3JZclpydWoYg9TpAudxv1XY7y4NMbijcyuUg5g7TPsOkVdR
ixmSlWsxQ+VFzWWi8o3KynWGCVm6H9CDGHqRNhtjHzuOtd/Tceibec44A+fL
o7g3aMep8yWuMdD16TdR7k7qRE3nUnW43D45MDWBqeoz2bGh7vdkZSLfn6Wu
Uxwr6lkztd10eRW1mBnqMdN+O2Xtr65z5ItM5GXXqBP58lXqOtc+us2zP87x
Oeo537FJ8ihqbwscQ89FroFui+1XuDZ0jbUT+0+MwD86ZOW8/Qb1oT5Q1Eto
l6kf9ZeiXrLSech0k/RXy+N6bbZamiKnZR45KLkodaKlWaqr3KZO5LTr1WGD
fdYg592iPeC9NivnxuvUlVpDkQdvlB65N7sG53mT8+bIo6jxrFHW5a4DzZ48
zTmqlNYhxyXX/X2e5laK76/mifbIUpJ1m/NYo6iToSfvip3KtN15Gx2nX9St
lmqLR6RBDmoI1BTqlFKdYX+s+Wye7JqXEg9qc8+r5y7p0eMx6bc7/pw6kLc/
razP2t/m+LPKSn3kBXm9lKX3UZG3fyEN9YE3pNlrv6iz029WSnWYb/JyTYQa
SeNSqsN8lSd5X3YNaiTUFl5XvjfsP+k36jDQUcf5ICvX5akv8I7jPUe+MVVb
4muT3fvFWbl2/568PspSjecFdXtbvd+1v1ve72bl/xmgW1GL5/y8Jo8P3bPd
8mAeNZFP1YNaz8faaL/9M0spn/ouL9dZ9isf+dZBZfpC/ZDjgHtQ1FYOaJt9
6vM/e2cpR4MXOdlPWbm+dkh5v7O/R7n2ZeU62o/a95C8GCNvKup230uPvP9y
jY+lYx7/f+C+503B/UcsG6us5Ja8wcmzyfvIZ8mVW9onP25lv45vwiL/bu3b
kRy7WV7OuWnJh2s7Dv2xfiO3J3dsLs0R8oUftq/styKfLPJL2iJPpS1yZVpo
TlR2+JLXtlXWoo6DLEX+jM7kyKf5BqwsDXKQn1NzKfJ12uKtTUs+WtRimEee
+rj94k3PG583O2933vXksU84D3nruR5+9LPnhDdtkTuiK3l7UTupLw32aOhY
DWUv8nJa8nXe0uQj5CDk3Y2kqeY4/bNKqcb1Y5785mh540fVpCOfIt8l7x2i
XOTDvO3Jj4u8ucini7c1b+2B0pEv8gbnLc67vniL0y/e7ug9wLnkBLzdyevG
6y9d83JNiJZ3fwflY52OylShnchByE36yQOZ+ssbvrz1B0tzruujH2+d4Xk5
F7lQ+Yhf+DT+yz7h6/TZN/yYPj7FmSlqirT4I+evRl6uc1R3HzLHoed813Q/
ObfUceizP/gs54/8h/yNfKiXtqTPG22EcpPj4WvkfD2cS76Fr7TXLt39NkLd
8BF8rp4248zcIw/8lbiWqSt5J/nnw/KmHjFDWahfzNTe1EeKmgdtUeegna3c
M6WnPkCdcZk+MVteRe1gWl6uHUx3/+a6BnKTbxd1F9qiZkO7KC/XK1fIi3WW
qvd10pNL71I3fGSea+CP8+1TU+UM36Xsq+QLD+xyq/qRd6/JyzXfteqzWprZ
jq/Oy7Xg6/NyfZb6QFGfXaccNzpvnuP0JzoPOupaN0uD3tQoNqrn7cqHbTY5
tkR5N2kj5m7QNpulWaWud7o/WxzDjnfYX+k4/UnKgUxFTQTbcNaIS8Spg3l6
K/DW+CFP/k0coq5BvCRWfpqnN0fdUpKJ2s22wE95iuOtS6lWwv/PntK++D0+
+7c83f1NSikmLVSmr/N0B/P2oU7yjPTf5um+4c5/K0/v5Grxe2+e3rRHl5Jt
dijHu3l6L9coletBjHH2pql3UStf7j5xH9yvvTk3O91LvhX1ofvUYY163O0+
PyA9frDV/iZ5POR+P+jYJ3l6k/EmfSdPb//q8fu/3QasWw==
             "]], 
            PolygonBox[CompressedData["
1:eJwtkbsuBFAQhmdOdkU261JSuBUoCMGbeAQPwEtYrMsDqPVKRKOg2RWJiFsk
VIjCivu6Fb4/c4ovmf+fmZyZOQMzc9Ozycz6oQC/btYFCZpwBZv469BJYS/s
EG/DPbkG1IhvYITcHXqL+BCG0D0pauXdetSo9hpe0UX0AvEi1NBldJV4GU7y
DJqlgR4nd068RrwBFx5v6K06PKEHU8Sa6RH9nnsvYZTcFHTnHbXrs0duH4bJ
TUARrwBfMIlu8fB+4MGjVjfpSzGDZtFNdJtP9ItFj3rbYQW9Cmd4bSl2k3eK
/s5vaSbN1pGiVjtq1xJ6yeImx+jWFLeSd4R+83xLGCPnULG46QG5P5i38HaJ
9zz+Up5y6lGvZv5A/wMknEo2
             "]]}]}, 
         {RGBColor[
          0.5754761198515492, 0.5059500740692345, 0.4807744215569168], 
          EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJwtkUtOgkEQhKfn36psjYkmmigkGIh4E4/gAfBICkfwcQVlbVQCskHRhYoP
fCCy8et0LSpdXTNd092zvn+w18wppQoowDbJK/HLUmrA3+E/8EPiGThV9PwI
dMAxOAFDC75M3S4oyGdgK0fNA7yfwvMNPJK3iWucnxMH4BZ0pd8Q7y28V3Lc
a+vc3/C37uDXoAVfyuHhXheq9/sl9LlFP95XXb1NwZXFHItol5pzAb6hnp7R
niy4a1P5uN+fxSwN9dLRu2Xyns/JeTWHPoZPLHhVe+1r3g/tpYL+bTFDzf/B
Ym++v5pm+0T7tdjfTo7Yk9eLxf9soo+0k1X14vf8X/8BP+JO7w==
             "]], 
            PolygonBox[CompressedData["
1:eJwtkskuRFEQhk8dQwwxbQ1BkDQhzat4BA/AI2keQbcNCxbmhBgXum2MMXa3
MUhLfH/qLL6c+qvu/W+dqjs4Mzc9G0MIGaiHbkSecwkuLYRJdJm4At/oZnQT
7BMfwFT0WhV+0R/mz9dxZqmtcq6AEUe4MvfehiF0G+SI5+GYWiO6AXaJ96AE
Regk1xX9Hb27BY/kx5LegbfUk3prId8a3UNe6lm9V4nPg/c4jt5Eb5h/U99+
MffSDIbRJ+a9FaAHnYFicI8KtQe4h37yA7BOvAY1+IN2cgvB73hq7plPfs/o
UXQpuOer+Yw0K/Wk3uQp72KaxS0sJ79e8k/ms5CHvEaie+uZMrUf813ovtpl
BywG7+nM3COX9E3quZZ2pt29w0Xal2bdl+4jjzvzmRTSvK7NZ67ZHxIfme9M
u9NMNJuJdF95fqK/zP8d5VT7ByS5X08=
             "]], 
            PolygonBox[{{465, 464, 524, 159, 467}, {495, 217, 551, 488, 
             489}}]}]}, 
         {RGBColor[
          0.8807935330859153, 0.6132501234487242, 0.3012907025948613], 
          EdgeForm[None], 
          GraphicsGroupBox[{
            PolygonBox[{{465, 158, 523}, {553, 197, 491}, {467, 158, 465}, {
             483, 158, 539}, {547, 177, 482}, {489, 196, 495}, {539, 158, 
             467}, {490, 177, 547}, {495, 196, 552}, {531, 176, 479}, {544, 
             196, 489}, {480, 177, 534}, {497, 197, 553}, {462, 157, 521}, {
             481, 157, 538}, {477, 176, 531}}], 
            PolygonBox[{{444, 443, 514, 515}, {523, 158, 157, 462}, {479, 176,
              197, 545}, {454, 453, 518, 519}, {491, 197, 176, 546}, {534, 
             177, 176, 477}, {538, 157, 158, 483}, {546, 176, 177, 490}, {519,
              518, 458, 459}, {530, 529, 448, 449}, {510, 509, 443, 444}, {
             515, 514, 453, 454}, {552, 196, 197, 497}, {449, 448, 509, 
             510}, {476, 475, 529, 530}, {545, 197, 196, 487}}], 
            PolygonBox[{{459, 458, 521, 157, 463}, {463, 157, 481, 536, 
             537}, {487, 196, 544, 475, 476}, {537, 536, 482, 177, 
             480}}]}]}, 
         {RGBColor[
          0.9457046240128245, 0.7342615600320613, 0.43168433443975596`], 
          EdgeForm[None], 
          GraphicsGroupBox[{
            PolygonBox[{{476, 175, 487}, {545, 175, 479}, {487, 175, 545}, {
             537, 156, 463}, {463, 156, 459}, {480, 156, 537}, {459, 156, 
             519}, {530, 175, 476}}], 
            PolygonBox[{{450, 449, 510, 511}, {511, 510, 444, 445}, {535, 534,
              477, 478}, {445, 444, 515, 516}, {478, 477, 531, 532}, {516, 
             515, 454, 455}}], 
            PolygonBox[{{460, 156, 480, 534, 535}, {472, 175, 530, 449, 
             450}, {455, 454, 519, 156, 460}, {532, 531, 479, 175, 
             472}}]}]}, 
         {RGBColor[0.9944773737307744, 0.856193434326936, 0.5828798585654005],
           EdgeForm[None], 
          GraphicsGroupBox[{
            PolygonBox[{{460, 155, 455}, {455, 155, 516}, {535, 155, 460}, {
             478, 155, 535}}], 
            PolygonBox[{{451, 450, 511, 512}, {533, 532, 472, 473}, {473, 472,
              450, 451}, {512, 511, 445, 446}}], 
            PolygonBox[{{446, 445, 516, 155, 456}, {456, 155, 478, 532, 
             533}}]}]}, 
         {RGBColor[1., 0.95, 0.75], EdgeForm[None], 
          GraphicsGroupBox[
           PolygonBox[{{473, 154, 533}, {451, 154, 473}, {512, 154, 451}, {
            456, 154, 446}, {446, 154, 512}, {533, 154, 456}}]]}}, {{}, 
         TagBox[
          TooltipBox[
           {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
            LineBox[{512, 451, 473, 533, 456, 446, 512}]},
           "2.5`*^-7"],
          Annotation[#, 2.5*^-7, "Tooltip"]& ], 
         TagBox[
          TooltipBox[
           {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
            LineBox[{511, 450, 472, 532, 478, 535, 460, 455, 516, 445, 511}]},
           
           "2.`*^-7"],
          Annotation[#, 2.*^-7, "Tooltip"]& ], 
         TagBox[
          TooltipBox[
           {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
            LineBox[{510, 449, 530, 476, 487, 545, 479, 531, 477, 534, 480, 
             537, 463, 459, 519, 454, 515, 444, 510}]},
           "1.5`*^-7"],
          Annotation[#, 1.5*^-7, "Tooltip"]& ], 
         TagBox[
          TooltipBox[
           {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
            LineBox[{509, 448, 529, 475, 544, 489, 495, 552, 497, 553, 491, 
             546, 490, 547, 482, 536, 481, 538, 483, 539, 467, 465, 523, 462, 
             521, 458, 518, 453, 514, 443, 509}]},
           "1.`*^-7"],
          Annotation[#, 1.*^-7, "Tooltip"]& ], 
         TagBox[
          TooltipBox[
           {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
            LineBox[{447, 508, 442, 513, 452, 517, 457, 520, 461, 522, 464, 
             524, 466, 525, 468, 526, 469, 527, 470, 471, 542, 486, 541, 484, 
             540, 485, 550, 494, 549, 492, 548, 493, 555, 498, 554, 499, 558, 
             501, 557, 502, 562, 506, 561, 504, 560, 505, 563, 507, 503, 559, 
             500, 556, 496, 551, 488, 543, 474, 528, 447}]},
           "5.`*^-8"],
          Annotation[#, 5.*^-8, "Tooltip"]& ], {}, {}}}],
      AspectRatio->1,
      DisplayFunction->Identity,
      Epilog->{
        Opacity[0], 
        EdgeForm[{
          Thickness[Large], 
          GrayLevel[0], 
          Dashing[{Small, Small}]}], 
        GeometricTransformationBox[
         TagBox[
          
          DiskBox[{1971.775770461683, 1194.5503476678832`}, {
           4214.673930300788, 3201.0961933733797`}], 
          "Ellipse"], {{{-0.9999250201362536, -0.012245574935980543`}, {
          0.012245574935980543`, -0.9999250201362536}}, Center}], 
        Opacity[1], 
        RGBColor[1, 0, 0], 
        PointSize[0.03], {}, {
         InsetBox[
          FormBox[
           StyleBox["\"Prior\"", 20, 
            GrayLevel[1], StripOnInput -> False], TraditionalForm], 
          Scaled[{0.95, 0.9}], {1, 0}]}},
      Frame->True,
      FrameLabel->{{
         FormBox["\"\[Beta]\"", TraditionalForm], None}, {
         FormBox["\"\[Alpha]\"", TraditionalForm], None}},
      FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
      GridLinesStyle->Directive[
        GrayLevel[0.5, 0.4]],
      ImageSize->350,
      Method->{"DefaultBoundaryStyle" -> Automatic},
      PlotRange->{All, All},
      PlotRangeClipping->True,
      PlotRangePadding->{Automatic, Automatic},
      Ticks->{Automatic, Automatic}], {185.66930867459263, -183.74999999999994},
      ImageScaled[{0.5, 0.5}], {350, 350.}], InsetBox[
     GraphicsBox[GraphicsComplexBox[CompressedData["
1:eJxdmE1oHlUUhj+tGwuCiGKpC2N0oWCx0mIRtFz86UKhSHVRpCoqpd0UQ0Di
gNmUiJk0wZpN/DAYM4mUUemYoaNIFcafRUojlW5c1EqFVlQUK5QuRMRkct73
8J67uTzfuefnvrlzf3LHS6/s2X9tr9c7f02vt9Z3Lc21XT8wu973+srtdLDn
gbPA1tyegr9yOx3sfeU0F8YXyhc+CP6l8sDHIV6lvHUpxK+VnzoR8jXKQ5/F
eu33GcxHGXrSngfOAltzewr+ytDT8ytDT44vlKEn/Utl6Ml4lTL0ZPxaGXoy
X6MMPb1ezAvzUY499CRnga25PQV/Zejp+ZWhJ8cXytCT/qUy9GS8Shl6Mn6t
DD2Zr1GGnl6v5Z3EfJRZF+x54CywNben4K/M7535lfm9Y3yhzO8d/qUyv3fE
q5T5vSN+rczvHfkaZX7vrNfiHMZ8lPl3gz0PnAW25vYU/JW5PplfmesT4wtl
rk/4l8pcn4hXKXN9In6tzPWJfI0y1yfrtTjDmI8y9YQ9D5wFtub2FPyVqSfz
K1NPjC+UqSf8S2XqiXiVMvVE/FqZeiJfo0w9Wa/VgdZXjvsi9GTLAsdmerq/
MvT0/MrQk+MLZejJVipDT8arlKEn49fK0JP5GmXoyfhcn/Z7X9nXp9nzwFlg
1EV7Cv7Kvj6RX9nXp/WFsq9P8y+VfX1avErZ16f1tbKvT8vXKPv6RL3tOh/G
fJR9/zR7HjgLbM3tKfgr+/6J/Mq+f1pfKPv+af6lsu+fFq9S9v3T+lrZ90/L
1yj7/ol62/W8k5iPsp/vZs8DZ4GtuT0Ff2U/35Ff2c93G18o+/lu/qWyn+8W
r1L2893i18p+vlu+RtnPd9Tbyrz8/on5BnseOAtsze1JOVeOvd8/UV8YVyj7
/dP8S2W/f1q8Stnvn9bXyn7/tHyNst8/UW+7/vsM5qPs7yOz54GzwNbcnoK/
sr+PkF/Z30c2vlD295H5l8r+PrJ4lbK/jyx+rezvI8vXKPv7CPW263lnMR9l
f7+bPQ+cBbbm9hT8lf39jvzK/n638YWyv9/Nv1T297vFq5T9/W7xa2V/v1u+
Rtnf76i37fqD72M+ytCT9jxwFtia21PwV4aenl8ZenJ8oQw96V8qQ0/Gq5Sh
J+PXytCT+Rpl6On1tlIn988C8w32PHAW2JrbU/BXjvsi988C9YXxoef+Cf9S
mfsn4lXK3D8Rt1bm/ol8jTL3T9bbdv0m3Iv7ytCT9jxwFtia21PwV4aenl8Z
em4KuoGhJ/1LZejJeJUy9GT8Whl6Ml+jDD293nb992OYjzLPI9jzwFlga25P
wV+Z5xHzK/M8wvhCmecR/EtlnkeIVynzPEL8WpnnEfI1yjyPWG/b9ct4p/WV
oSfteeAssDW3p+CvDD09vzL0XA7fMRh60r9Uhp6MVylDT8avlaEn8zXK0NPr
bSUvz/fwf0Pa88BZYGtu13nxfA/3Qs+vzPM97IPgC+G77gUdY8/z3ZjnO+LX
yjzfka9R5vnOetuuf+045qMMPWnPA2eBrbk9BX9l6On5laEnxxfK0JP+pTLm
yXiVMvRk/FoZejJfoww9vd626w9+gvko874Eex44C2zN7Sn4K/O+xPzKvC9h
fKHM+xL8S2XelxCvUuZ9CfFrZd6XkK9R5n3J6/t57+cXtz0yRv56afjUgW/f
IC9svPf4u7veJI+9fGn6zPI4ef8X741seHKC/Pgte/ft+O5IGpxeunpyAPfA
yfTskcU/R+adp8dmLm4bnCefHp0491fhvGFk9OxHdxbkh4aGTh1YdN44dev1
j73g7/ebN9930/hPi+Tbj+26beU553u2P3/XjecXyNu/enXLM/ucd+6eeuCd
cx4f8zn04+7Lv/z3NnnPN9nZlYedd3y4eKJ+/Sj5wcG5LfePvEW+7vKVv/+9
MkU+8+UTny4PT6arw792+kD/Py593+kD/bvfV/WB/j+cnu/0gf4rOyc6faB/
57fo+kOfo08v3LBWP/TpdFmtH/pU//x291r90Gd0dvOhrav1Q5/ZR18cX6sf
+pz8/djCWv3/AyJianM=
       "], {{
         {RGBColor[0.148, 0.33, 0.54], EdgeForm[None], 
          GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJxFmQnUlmMexp9HJGHsWlRaqWyltEhJEiWt2pX2tGtPaJdKm0r79rUppZI2
DGM3B4PBJIxtyBjGMIbB2Ob/O8/vOe85/c/9Xd99/5frut/ved/3qlLfkR1G
HJMkSdliSRL/klIRaQS/KxdRPOJ49iOOjTgu4hxX9kp7ltyKESUjToyoEFEi
4oSIc13Zu9icMhHlrV1CXMwelaxxUkRl15Mjzo84LeL0iKoRv4s4JaKa66kR
1d0/I6KG65kRF8mN3lWsR35N98+KuDDibM/VkjNcz7M2va+LuDSiTsRVEReY
V0/+zF5X/vC+zLWieeXkfbkcmL2BPJmroSt7d0YMirglor61K9u7vD0aWYMZ
r3BFp2bOBe8m6oIeV7rC+2r3uZPmrpdEXBtR23kbW4/8a9xHmxautY1z5DbZ
eQd7tow6tlIX9Ggnf2ZvK2dwa3WE6w2uaNPes/Dr6ExwutEVTv3MaRPRwbON
xQ3s0Tmiqff2j4g3It6M6OW9tozoKX9wd3WB983uw6Ovs9KvT8T14i7WRvtu
6kt+b/M419+Z2lqvjroM8HdoM94cag9z7i5q2lHeQyM6uTdIjeB9q3P3iBgR
0dVZRrp2d47L1Hq4tbt6bx3sMcoaN0WMdkWbCc6FBmPVDm3GuTL3RPe5k9tc
4X1HxEDnHWM98ie5jwa3uw402smth/fA625qxBA1eC5id8SeiLnOxCyz1AIe
M9UCDe5yZW+Oc5Bzt2fhOtuVvVXmk7ciYnrEDNdh6jfDlR732J87XCxn/o7v
lRt4gRqhzRL3+btZHjHN2svkCZ5nPbSf70r+fRFTPLc3Yk3E2oiF1kbX1c6O
Hg9ELDVvs3NwdoPaMfs6+aPNelf2NtmbnCLPMtdGV/Z47vKc4HnxSLyJbIrY
nGZzzVLjta702GL/RREPyh+Nd8ofvE0d0WmX+ysjHpLbGu9+lXir9dD7flfy
d5vHuR1qQI8/RRyMOGTeJO8J3Yd6x3+I2K5+j6rdFnM2qs0jruw9bm9mf8yz
zPV7V/ZeMZ+8lyMOOMcB76NIXGSPJ+3P7M/LGQ2eUTu0edYVri+4z+vij64P
R7wUsd8+T1kPvZ92pdaLEfs8x8prYr368Vrn7+FVZ0ePD82hNp8deP/kffQv
asfsr8sfbXjmPuHeEXvD47Bnmest16ede61z7HcWNHrN/mj8Z1d6vKMWPBs+
9o7R+29qDX5PjdDmE/fh9HdrMe+n9gC/az20/6sr+UfN49xHakAPPhOVVgue
nTy3eF/5XP5o813EB+r3b3tQ+6uIt+XxtSt730a8b843noXHf1zZOzYu4F/W
KBY/f5lk+Es1PSI+Yo//2p/Zf434LMneG3+WP3r8qI7o9Jv78Dgm6v/T2mn8
/EWS4e+th94/uJLPi4M8zh2XZjPC73/WRsuz0qwHZ0ulWV36/C7NajHLKWm2
ktcufr48olHECWmmBTqdnGZzkNM2fm7ouZPSjDN7HeLnKyIaR/SNaB1xQ0TJ
NKvB/RyfZneD3iXSbKXHafHzT+pU2hnR++w0m525z0kznsUjyqbZ3YDLePZY
9772/k9NM07UPSN+/sU7OTPNVnRZGj9Pjphi/6PeU/k0m5UZa6ZZDlpWSzO9
qF0lzXRBy6qu7NVIs37knOdZ+FWPON09dKkf0SDisohzIyoa6HViRGX1pUc9
9yoZJ7p3ifzR4yLvGP0uVDtw3YgK9qiTZtzAF8iJc7XVt1zEpa7lnbGSs5RT
3+Odu7IaVFAnXi/N7M0sTeRcw9dTNfXg9XG+e1c5BzlXeha9m7peINfv/Ns6
1z5o1ND+aH+5Kz2utv/FES3ljAbXyQ3cIqKWvFu5zz20Vmt4t5EnfZpbD72v
cSX/evPIudZ69ODzH59b+cy6IvD0iBkRyyKmRkyLuMk5yOuqdszeWf5o08WV
vR72JqebZ5mruyt7w8wnb0jEjRGdXJuocSdXevS0P9r0lzN/3/3S7DUK7q1G
cB3gPs+JwREdrX1Lmv39g3tZD+1vdiV/UER7z82MGBExMqKPtdF+uLOjxx0R
A80b7xycHa12zH6r/NFmlCt74+xNzhjPMtdYV/Z4XvM++azP2cM+00fYv5vz
dbPHBPvzbJsifzSeLH/wJHUc4D2zP9S7Hy7n6d4TeKL10Ps2V/Knmce5O9WA
Hsvdo8YXvu8x913Oih7znZXa89QOfI+6gGerI9rcG3G7ei8wj1kWusJpQ8Rc
a6yPmCOeY42x4rH2WGw9Zl+dZvPNiljl3YNXqgt4nTNRb23E3eI15oF5bfHs
4HW8xNpof5/3gd5FzjhP/Xit8/ew0d+hzUPORO2dafY3ia7bnJvaWyMWqc39
ruztsB852z3Le8gDrvc5L/cwyrlHqfUm+6PxZlc0ftD+PCf2qQUaP6wW4D1q
x9z73edODsmN2gflD95lPTTe7Ur+AfM4t1cN6MGzjPcQ3gN4P+H5xvMufz/g
uYaXhPeAB5H7VmC8HzwWvBQ8oKpivCh8FXwMPKkK4uL+jnx8qUpJ5ufk/hS4
pL/D68k9qar2xgfBW8E/4rsRHk3uT1W3Nl4LPkppz+LLnOpZavF5Gj8Hvwm/
qqb58Kllj1LmcS733So4d23PwaeO/XJ/qq6z1xMzE75K46TgGTWRK15K/aTg
VTWQf33zcx+qkVwbi5n7qiTzX+iNv3Kts7QU5z7U1c5d131mwrNoJT/2c3+r
mXXhf435dT3bUt70yf2qFp5j1tbWzf2m1vJpI8YrwScYKde27uFVtRPDs72Y
ufBYusq5g3u5V5V7Vx3dY268l87y6CrmGcmz8nP5dLcus/NdooeceorRrpcY
zjeL0aC3GJ59xPDsK4ZnPzHc+ovhNkDc1Bnxm6rJOddgoOfgg380SB54IcPN
4Xv0EGsMEzMfvssYOQ93r6e/G50UfKsRch7lfeSe1Kik4D2Nldt4MXPgq9wh
N/ySCUnBk5roPQx27j7uj5fzJM/lntQkz022LnymJpn/MtA+nGtvb35XVZ0a
ynmaOfCcLoYDfsispOA93Z0UvKqZcp4lRps5nmNWvJd7koI3NE8t5npunPtz
5bzAc3BbKIbbIjEc7hXDabEYzkvEcMY/WSqfZWL4LBfDb4UYz2ClGD6rxPBZ
LYbfGnHuE62R5zoxPIqS7Lt/7j0VJQWvap08N4jhuclz8MF72ZIUvKGt8t/s
uYXub5bnNs/BE+9luzx3iOG5UwzPB8Xw3CWG524xPPeI4fmQGJ57xfB8WAyf
fWL45H4Mzy/+HngujFDTGfLEUzqYFPymx5KCP3VIbo+KmY/Pk0/L+zH3cj/o
Kfk/bi04P5lkvs0O959MCt7TM3J7TswceC0vJwUf6oWk4NfgmeT+6XT5s5/7
W89bC974Ki/K4RXrwuFV8QH7vOQ9MSMe0wb39svtNXOKkoLfBg8+Rx+W9xEx
NXgWvynPw2J4vu253A9619nfE8P/Hc895/47avC+5+DzYZL5OeiB1/KpPPBM
PpLnx+InnOUNeX5kPvw/8Rzcjoo5h1fzmXmfi1+zz1Hv9XX78/25jp+f+L84
PruUTgqe0ZfywKv4Wp7fiOH5ledy3+qrpOBPfeOsfCf+ztm/F6PHt577wP1v
zccvwSfJvaTv5YZP8qN88EV+lc9P7sHvZ/HHnv1BDfBnfnNWauPF8H6LZ8Me
363wc8BwZh8MT7wEPAW+0/PdHi8h94bYY3a+//N9H254HmC4kcM5uJW0Bnzw
SzjH3HgveDLMjQcDZm68Gs7l/hcYfwhvBo8m94nOkBs+yZnywS85Sz6lxPAp
LS7mZ+jSal1WfJyfr8vKuZwYnuXFJdQA/Jn38Iv3X9wacK2oXmhRSczceCrn
yxOvpZo88UkqpwWvqorcapgDH7yWmvK5UJx7Kw3lX9OcU6xdVc4XmfOWr2vu
nPnwRnL/qa5/D3Dm+0Qt567nuSr2yb0l1vrqeLE9ypp3ibzrm88sjZz1sP15
DaIF3xmv8CyeRmtr4Z80kyceS1M5NBPDE5+kifPik7RICx5Qc2dpIT7JuSs5
b3N75H4WtXgWXGcttGgphmsb50ML/JBWcmstRpu2noNnOzHz4cF0VONW1oUz
Xkt7Negorm5OY+fi+3HuCeVeUf4ddZP88FR6yAc/pGta8J66OSM+Rh+16OHe
9f6ut5x7Wiv3hno5b28x/PtZC579xcyIFzJUPvghA+Vzi5h+fO8eqS4DzIf3
YM/BbYgYn2m4deEzQtzJPkO8m17OnftBI9KC30Q//A98i9nywF8ZZw57o9OC
9zRGnuPEaDPBHPjgmdwu/4nu5d7QRPlMEsP5TnOayaGLPCe7x3z4EXfJCe9o
qpynpwUfcrR8hrg/RS1meA7OM8W5rzHLvNnikfaZqb5TnCP3hubIEx8GjwbP
A+9jZ1rwmxbIH79lkfznmzPR/flyXuw5+uC7LHX2ZWL4L/HcZPeXyHm55+C2
Qgy3lWI4rBLDabUYzmvEcF4rRoN1YniuF8N7gxjORWL4bBTnPm9nOeM9bZHn
Js/lPtRWueFDPSC3be7BbbuY+fC59qQFf2q7HPjdbvnvtBacd3kfuWcEHufc
8OCZxrO4jDzxp/bKc58YnvvF8DwghudBMXwOieH3iHiN9Zj7/5bjIrw=
             "]], 
            PolygonBox[{{442, 180, 202, 454}, {448, 200, 179, 466}, {460, 222,
              200, 448}, {454, 202, 223, 472}, {466, 179, 180, 442}, {472, 
             223, 222, 460}}]}]}, 
         {RGBColor[
          0.4952545245464273, 0.47775718115050164`, 0.527933442439161], 
          EdgeForm[None], 
          GraphicsGroupBox[
           PolygonBox[{{467, 466, 442, 443}, {449, 448, 466, 467}, {473, 472, 
            460, 461}, {443, 442, 454, 455}, {461, 460, 448, 449}, {455, 454, 
            472, 473}}]]}, 
         {RGBColor[0.7470908742440454, 0.5662619685841693, 0.379889070731935],
           EdgeForm[None], 
          GraphicsGroupBox[
           PolygonBox[{{474, 473, 461, 462}, {450, 449, 467, 468}, {462, 461, 
            449, 450}, {468, 467, 443, 444}, {456, 455, 473, 474}, {444, 443, 
            455, 456}}]]}, 
         {RGBColor[
          0.9158030709171987, 0.6595076772929966, 0.3389895198433158], 
          EdgeForm[None], 
          GraphicsGroupBox[
           PolygonBox[{{457, 456, 474, 475}, {463, 462, 450, 451}, {445, 444, 
            456, 457}, {475, 474, 462, 463}, {469, 468, 444, 445}, {451, 450, 
            468, 469}}]]}, 
         {RGBColor[0.956032519750684, 0.76008129937671, 0.46370081122712037`],
           EdgeForm[None], 
          GraphicsGroupBox[
           PolygonBox[{{470, 469, 445, 446}, {476, 475, 463, 464}, {464, 463, 
            451, 452}, {452, 451, 469, 470}, {446, 445, 457, 458}, {458, 457, 
            475, 476}}]]}, 
         {RGBColor[
          0.9962619685841694, 0.8606549214604233, 0.5884121026109248], 
          EdgeForm[None], 
          GraphicsGroupBox[
           PolygonBox[{{465, 464, 452, 453}, {477, 476, 464, 465}, {453, 452, 
            470, 471}, {459, 458, 476, 477}, {471, 470, 446, 447}, {447, 446, 
            458, 459}}]]}, 
         {RGBColor[1., 0.95, 0.75], EdgeForm[None], 
          GraphicsGroupBox[
           PolygonBox[{{459, 201, 447}, {465, 201, 477}, {447, 201, 471}, {
            453, 201, 465}, {471, 201, 453}, {477, 201, 459}}]]}}, {{}, 
         TagBox[
          TooltipBox[
           {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
            LineBox[{471, 453, 465, 477, 459, 447, 471}]},
           "6.`*^-8"],
          Annotation[#, 6.*^-8, "Tooltip"]& ], 
         TagBox[
          TooltipBox[
           {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
            LineBox[{470, 452, 464, 476, 458, 446, 470}]},
           "5.`*^-8"],
          Annotation[#, 5.*^-8, "Tooltip"]& ], 
         TagBox[
          TooltipBox[
           {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
            LineBox[{469, 451, 463, 475, 457, 445, 469}]},
           "4.`*^-8"],
          Annotation[#, 4.*^-8, "Tooltip"]& ], 
         TagBox[
          TooltipBox[
           {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
            LineBox[{468, 450, 462, 474, 456, 444, 468}]},
           "3.`*^-8"],
          Annotation[#, 3.*^-8, "Tooltip"]& ], 
         TagBox[
          TooltipBox[
           {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
            LineBox[{467, 449, 461, 473, 455, 443, 467}]},
           "2.`*^-8"],
          Annotation[#, 2.*^-8, "Tooltip"]& ], 
         TagBox[
          TooltipBox[
           {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
            LineBox[{448, 466, 442, 454, 472, 460, 448}]},
           "1.`*^-8"],
          Annotation[#, 1.*^-8, "Tooltip"]& ], {}, {}}}],
      AspectRatio->1,
      DisplayFunction->Identity,
      Epilog->{
        Opacity[0], 
        EdgeForm[{
          Thickness[Large], 
          GrayLevel[0], 
          Dashing[{Small, Small}]}], 
        GeometricTransformationBox[
         TagBox[
          
          DiskBox[{2300.191425925935, 999.727504879729}, {104.43924022893927`,
            67.51808994887357}], "Ellipse"], {{{-0.9999252809555643, 
          0.012224258911517004`}, {-0.012224258911517004`, \
-0.9999252809555643}}, Center}], 
        Opacity[1], 
        RGBColor[1, 0, 0], 
        PointSize[0.03], {
         PointBox[{2300, 1000}]}, {
         InsetBox[
          FormBox[
           StyleBox["\"Posterior\"", 20, 
            GrayLevel[1], StripOnInput -> False], TraditionalForm], 
          Scaled[{0.95, 0.9}], {1, 0}]}},
      Frame->True,
      FrameLabel->{{
         FormBox["\"\[Beta]\"", TraditionalForm], None}, {
         FormBox["\"\[Alpha]\"", TraditionalForm], None}},
      FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
      GridLinesStyle->Directive[
        GrayLevel[0.5, 0.4]],
      ImageSize->350,
      Method->{"DefaultBoundaryStyle" -> Automatic},
      PlotRange->{All, All},
      PlotRangeClipping->True,
      PlotRangePadding->{Automatic, Automatic},
      Ticks->{Automatic, Automatic}], {556.0105680317039, -183.75000000000006},
      ImageScaled[{0.5, 0.5}], {671.1492734478202, 350.}, {{1., 0.}, {0., 
     1.}}]}, {}},
  ContentSelectable->True,
  ImagePadding->{{169.447682, 170.447682}, {1., 0.}},
  ImageSize->{758.6666666666666, 379.5},
  PlotRange->{{180.66666666666666`, 566.}, {-372.5, 5.}},
  PlotRangePadding->Automatic]], "Input", "Input"]
}, Closed]]
},
WindowSize->{1680, 1026},
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
Cell[2009, 50, 921, 26, 148, "Input"],
Cell[2933, 78, 51, 0, 33, "Text"],
Cell[CellGroupData[{
Cell[3009, 82, 653, 16, 32, "Input"],
Cell[3665, 100, 606, 15, 32, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[4320, 121, 43, 0, 36, "Subsection"],
Cell[CellGroupData[{
Cell[4388, 125, 37, 0, 35, "Subsubsection"],
Cell[4428, 127, 90, 2, 30, "Text"],
Cell[4521, 131, 4957, 142, 287, "Input"]
}, Closed]],
Cell[CellGroupData[{
Cell[9515, 278, 51, 0, 29, "Subsubsection"],
Cell[9569, 280, 142, 3, 30, "Text"],
Cell[CellGroupData[{
Cell[9736, 287, 1115, 30, 193, "Input"],
Cell[10854, 319, 955, 29, 57, "Output"]
}, Open  ]],
Cell[11824, 351, 70, 0, 33, "Text"],
Cell[11897, 353, 8964, 252, 487, "Input"],
Cell[20864, 607, 66, 0, 33, "Text"],
Cell[CellGroupData[{
Cell[20955, 611, 1039, 28, 61, "Input"],
Cell[21997, 641, 3491, 81, 270, "Output"]
}, Open  ]],
Cell[25503, 725, 111, 3, 33, "Text"],
Cell[CellGroupData[{
Cell[25639, 732, 339, 8, 34, "Input"],
Cell[25981, 742, 1568, 36, 236, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[27598, 784, 47, 0, 29, "Subsubsection"],
Cell[27648, 786, 157, 3, 30, "Text"],
Cell[27808, 791, 4022, 114, 146, "Input"],
Cell[31833, 907, 52, 0, 33, "Text"],
Cell[CellGroupData[{
Cell[31910, 911, 2380, 69, 92, "Input"],
Cell[34293, 982, 35, 0, 32, "Output"]
}, Open  ]],
Cell[34343, 985, 64, 0, 33, "Text"],
Cell[CellGroupData[{
Cell[34432, 989, 1256, 38, 61, "Input"],
Cell[35691, 1029, 1241, 36, 64, "Output"]
}, Open  ]],
Cell[36947, 1068, 105, 3, 33, "Text"],
Cell[CellGroupData[{
Cell[37077, 1075, 2355, 69, 94, "Input"],
Cell[39435, 1146, 1984, 61, 86, "Output"]
}, Open  ]],
Cell[41434, 1210, 205, 4, 33, "Text"],
Cell[CellGroupData[{
Cell[41664, 1218, 452, 12, 57, "Input"],
Cell[42119, 1232, 139, 4, 34, "Output"],
Cell[42261, 1238, 138, 4, 34, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[42436, 1247, 550, 14, 57, "Input"],
Cell[42989, 1263, 2592, 53, 238, "Output"],
Cell[45584, 1318, 2592, 53, 238, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[48225, 1377, 41, 0, 29, "Subsubsection"],
Cell[48269, 1379, 76, 0, 30, "Text"],
Cell[48348, 1381, 4837, 123, 420, "Input"],
Cell[53188, 1506, 51, 0, 33, "Text"],
Cell[CellGroupData[{
Cell[53264, 1510, 682, 19, 80, "Input"],
Cell[53949, 1531, 84, 2, 34, "Output"],
Cell[54036, 1535, 84, 2, 34, "Output"],
Cell[54123, 1539, 84, 2, 34, "Output"]
}, Open  ]],
Cell[54222, 1544, 64, 0, 33, "Text"],
Cell[CellGroupData[{
Cell[54311, 1548, 633, 16, 57, "Input"],
Cell[54947, 1566, 2094, 46, 236, "Output"],
Cell[57044, 1614, 2080, 46, 236, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[59173, 1666, 49, 0, 29, "Subsubsection"],
Cell[59225, 1668, 92, 2, 30, "Text"],
Cell[59320, 1672, 16110, 422, 1366, "Input"],
Cell[75433, 2096, 61, 0, 33, "Text"],
Cell[CellGroupData[{
Cell[75519, 2100, 698, 20, 57, "Input"],
Cell[76220, 2122, 99, 2, 34, "Output"],
Cell[76322, 2126, 101, 2, 34, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[76460, 2133, 1148, 29, 124, "Input"],
Cell[77611, 2164, 14011, 243, 241, "Output"]
}, Open  ]]
}, Closed]]
}, Open  ]],
Cell[CellGroupData[{
Cell[91683, 2414, 27, 0, 44, "Subsection"],
Cell[91713, 2416, 8645, 222, 867, "Input"],
Cell[CellGroupData[{
Cell[100383, 2642, 2434, 57, 260, "Input"],
Cell[CellGroupData[{
Cell[102842, 2703, 44, 0, 24, "Print"],
Cell[102889, 2705, 45, 0, 24, "Print"],
Cell[102937, 2707, 43, 0, 24, "Print"],
Cell[102983, 2709, 45, 0, 24, "Print"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[103077, 2715, 1020, 31, 57, "Input"],
Cell[104100, 2748, 101388, 1798, 792, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[205525, 4551, 2434, 57, 260, "Input"],
Cell[CellGroupData[{
Cell[207984, 4612, 44, 0, 24, "Print"],
Cell[208031, 4614, 44, 0, 24, "Print"],
Cell[208078, 4616, 44, 0, 24, "Print"],
Cell[208125, 4618, 44, 0, 24, "Print"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[208218, 4624, 1027, 32, 57, "Input"],
Cell[209248, 4658, 100992, 1802, 792, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[310277, 6465, 2441, 57, 260, "Input"],
Cell[CellGroupData[{
Cell[312743, 6526, 44, 0, 24, "Print"],
Cell[312790, 6528, 45, 0, 24, "Print"],
Cell[312838, 6530, 44, 0, 24, "Print"],
Cell[312885, 6532, 44, 0, 24, "Print"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[312978, 6538, 1029, 32, 57, "Input"],
Cell[314010, 6572, 84590, 1533, 792, "Output"]
}, Open  ]],
Cell[398615, 8108, 2540, 60, 260, "Input"],
Cell[CellGroupData[{
Cell[401180, 8172, 1033, 32, 57, "Input"],
Cell[402216, 8206, 84203, 1534, 792, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[486456, 9745, 1445, 35, 168, "Input"],
Cell[CellGroupData[{
Cell[487926, 9784, 47, 0, 26, "Print"],
Cell[487976, 9786, 45, 0, 24, "Print"]
}, Open  ]]
}, Open  ]],
Cell[488048, 9790, 27899, 530, 395, "Input"]
}, Closed]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature tw0fQlmvPeOfyDKnRt8DSnjC *)
