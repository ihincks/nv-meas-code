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
NotebookDataLength[     92504,       2045]
NotebookOptionsPosition[     92018,       2009]
NotebookOutlinePosition[     92451,       2028]
CellTagsIndexPosition[     92408,       2025]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell["Macro for exported figures to file.", "Text"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"$doExport", "=", "False"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"exportme", "[", "name_", "]"}], "[", "fig_", "]"}], ":=", 
  RowBox[{"(", 
   RowBox[{
    RowBox[{"SetDirectory", "[", 
     RowBox[{"NotebookDirectory", "[", "]"}], "]"}], ";", 
    RowBox[{"if", "[", 
     RowBox[{"$doExport", ",", 
      RowBox[{
       RowBox[{"Export", "[", 
        RowBox[{
         RowBox[{"\"\<../fig/\>\"", "<>", "name", "<>", "\"\<.pdf\>\""}], ",",
          "fig"}], "]"}], ";", 
       RowBox[{"Export", "[", 
        RowBox[{
         RowBox[{"\"\<../fig/\>\"", "<>", "name", "<>", "\"\<.png\>\""}], ",",
          "fig"}], "]"}]}]}], "]"}], ";", "fig"}], 
   ")"}]}], "\[IndentingNewLine]", 
 RowBox[{"Needs", "[", "\"\<MaTeX`\>\"", "]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"texStyle", "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"FontFamily", "\[Rule]", "\"\<Latin Modern Roman\>\""}], ",", 
     RowBox[{"FontSize", "\[Rule]", "12"}]}], "}"}]}], ";"}]}], "Input"],

Cell[CellGroupData[{

Cell["Moments", "Subsubsection"],

Cell["\<\
In this section we compute the moments of a system drifting according to two \
Ornstein-Uhlenbeck processes.\
\>", "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{"$Assumptions", "=", 
   RowBox[{
    RowBox[{"\[Sigma]\[Nu]", ">", "0"}], "&&", 
    RowBox[{"\[Theta]\[Nu]", ">", "0"}], "&&", 
    RowBox[{"0", "<", "\[CapitalGamma]", "<", "\[Alpha]1"}], "&&", 
    RowBox[{"0", "<", "\[Kappa]0", "<", "1"}], "&&", 
    RowBox[{"\[Sigma]\[Kappa]", ">", "0"}], "&&", 
    RowBox[{"\[Theta]\[Kappa]", ">", "0"}], "&&", 
    RowBox[{"t", ">", "0"}]}]}], ";"}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"p", "[", "expr_", "]"}], ":=", 
  RowBox[{"TransformedProcess", "[", "\[IndentingNewLine]", 
   RowBox[{"expr", ",", "\[IndentingNewLine]", 
    RowBox[{"{", "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{"\[Nu]", "\[Distributed]", 
       RowBox[{"OrnsteinUhlenbeckProcess", "[", 
        RowBox[{"0", ",", "\[Sigma]\[Nu]", ",", "\[Theta]\[Nu]", ",", 
         RowBox[{"\[Alpha]1", "-", "\[CapitalGamma]"}]}], "]"}]}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"\[Kappa]", "\[Distributed]", 
       RowBox[{"OrnsteinUhlenbeckProcess", "[", 
        RowBox[{
        "\[Kappa]0", ",", "\[Sigma]\[Kappa]", ",", "\[Theta]\[Kappa]"}], 
        "]"}]}]}], "\[IndentingNewLine]", "}"}], ",", "\[IndentingNewLine]", 
    "t"}], "\[IndentingNewLine]", "]"}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"\[Alpha]mean1", "=", 
  RowBox[{
   RowBox[{
    RowBox[{"p", "[", 
     RowBox[{"\[CapitalGamma]", "+", 
      RowBox[{"\[Nu]", "[", "t", "]"}]}], "]"}], "[", "t", "]"}], "//", 
   "Mean"}]}], "\[IndentingNewLine]", 
 RowBox[{"\[Beta]mean1", "=", 
  RowBox[{
   RowBox[{
    RowBox[{"p", "[", 
     RowBox[{"\[CapitalGamma]", "+", 
      RowBox[{
       RowBox[{"\[Kappa]", "[", "t", "]"}], 
       RowBox[{"\[Nu]", "[", "t", "]"}]}]}], "]"}], "[", "t", "]"}], "//", 
   "Mean"}]}], "\[IndentingNewLine]", 
 RowBox[{"\[Alpha]var1", "=", 
  RowBox[{
   RowBox[{
    RowBox[{"p", "[", 
     RowBox[{"\[CapitalGamma]", "+", 
      RowBox[{"\[Nu]", "[", "t", "]"}]}], "]"}], "[", "t", "]"}], "//", 
   "Variance"}]}], "\[IndentingNewLine]", 
 RowBox[{"\[Beta]var1", "=", 
  RowBox[{
   RowBox[{
    RowBox[{
     RowBox[{"p", "[", 
      RowBox[{"\[CapitalGamma]", "+", 
       RowBox[{
        RowBox[{"\[Kappa]", "[", "t", "]"}], 
        RowBox[{"\[Nu]", "[", "t", "]"}]}]}], "]"}], "[", "t", "]"}], "//", 
    "Variance"}], "//", "Expand"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"\[Alpha]\[Beta]product", "=", 
    RowBox[{
     RowBox[{
      RowBox[{"(", 
       RowBox[{"\[CapitalGamma]", "+", 
        RowBox[{"\[Nu]", "[", "t", "]"}]}], ")"}], 
      RowBox[{"(", 
       RowBox[{"\[CapitalGamma]", "+", 
        RowBox[{
         RowBox[{"\[Kappa]", "[", "t", "]"}], 
         RowBox[{"\[Nu]", "[", "t", "]"}]}]}], ")"}]}], "//", "Expand"}]}], 
   ";"}], "\[IndentingNewLine]", 
  RowBox[{"(*", 
   RowBox[{
    RowBox[{
    "We", " ", "need", " ", "to", " ", "compute", " ", "the", " ", 
     "covariance", " ", "manually", " ", "using", " ", 
     RowBox[{"Cov", "[", 
      RowBox[{"a", ",", "b"}], "]"}]}], "=", 
    RowBox[{
     RowBox[{"Mean", "[", 
      RowBox[{"a", "*", "b"}], "]"}], "-", 
     RowBox[{
      RowBox[{"Mean", "[", "a", "]"}], 
      RowBox[{"Mean", "[", "b", "]"}]}]}]}], 
   "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{"\[Alpha]\[Beta]cov1", "=", 
  RowBox[{
   RowBox[{
    RowBox[{"Sum", "[", 
     RowBox[{
      RowBox[{"Mean", "[", 
       RowBox[{
        RowBox[{"p", "[", "expr", "]"}], "[", "t", "]"}], "]"}], ",", 
      RowBox[{"{", 
       RowBox[{"expr", ",", 
        RowBox[{"List", "@@", "\[Alpha]\[Beta]product"}]}], "}"}]}], "]"}], 
    "-", 
    RowBox[{"\[Alpha]mean", "*", "\[Beta]mean"}]}], "//", 
   "Expand"}]}]}], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{
     RowBox[{"-", "t"}], " ", "\[Theta]\[Nu]"}]], " ", 
   RowBox[{"(", 
    RowBox[{"\[Alpha]1", "-", "\[CapitalGamma]"}], ")"}]}], "+", 
  "\[CapitalGamma]"}]], "Output"],

Cell[BoxData[
 RowBox[{
  SuperscriptBox["\[ExponentialE]", 
   RowBox[{
    RowBox[{"-", "t"}], " ", "\[Theta]\[Nu]"}]], " ", 
  RowBox[{"(", 
   RowBox[{
    RowBox[{
     SuperscriptBox["\[ExponentialE]", 
      RowBox[{"t", " ", "\[Theta]\[Nu]"}]], " ", "\[CapitalGamma]"}], "+", 
    RowBox[{
     RowBox[{"(", 
      RowBox[{"\[Alpha]1", "-", "\[CapitalGamma]"}], ")"}], " ", 
     "\[Kappa]0"}]}], ")"}]}]], "Output"],

Cell[BoxData[
 FractionBox[
  RowBox[{
   RowBox[{"(", 
    RowBox[{"1", "-", 
     SuperscriptBox["\[ExponentialE]", 
      RowBox[{
       RowBox[{"-", "2"}], " ", "t", " ", "\[Theta]\[Nu]"}]]}], ")"}], " ", 
   SuperscriptBox["\[Sigma]\[Nu]", "2"]}], 
  RowBox[{"2", " ", "\[Theta]\[Nu]"}]]], "Output"],

Cell[BoxData[
 RowBox[{
  FractionBox[
   RowBox[{
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "2"}], " ", "t", " ", "\[Theta]\[Nu]"}]], " ", 
    SuperscriptBox["\[Alpha]1", "2"], " ", 
    SuperscriptBox["\[Sigma]\[Kappa]", "2"]}], 
   RowBox[{"2", " ", "\[Theta]\[Kappa]"}]], "-", 
  FractionBox[
   RowBox[{
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "2"}], " ", "t", " ", "\[Theta]\[Nu]"}]], " ", "\[Alpha]1",
     " ", "\[CapitalGamma]", " ", 
    SuperscriptBox["\[Sigma]\[Kappa]", "2"]}], "\[Theta]\[Kappa]"], "+", 
  FractionBox[
   RowBox[{
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "2"}], " ", "t", " ", "\[Theta]\[Nu]"}]], " ", 
    SuperscriptBox["\[CapitalGamma]", "2"], " ", 
    SuperscriptBox["\[Sigma]\[Kappa]", "2"]}], 
   RowBox[{"2", " ", "\[Theta]\[Kappa]"}]], "+", 
  FractionBox[
   RowBox[{
    SuperscriptBox["\[Kappa]0", "2"], " ", 
    SuperscriptBox["\[Sigma]\[Nu]", "2"]}], 
   RowBox[{"2", " ", "\[Theta]\[Nu]"}]], "-", 
  FractionBox[
   RowBox[{
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "2"}], " ", "t", " ", "\[Theta]\[Nu]"}]], " ", 
    SuperscriptBox["\[Kappa]0", "2"], " ", 
    SuperscriptBox["\[Sigma]\[Nu]", "2"]}], 
   RowBox[{"2", " ", "\[Theta]\[Nu]"}]], "+", 
  FractionBox[
   RowBox[{
    SuperscriptBox["\[Sigma]\[Kappa]", "2"], " ", 
    SuperscriptBox["\[Sigma]\[Nu]", "2"]}], 
   RowBox[{"4", " ", "\[Theta]\[Kappa]", " ", "\[Theta]\[Nu]"}]], "-", 
  FractionBox[
   RowBox[{
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "2"}], " ", "t", " ", "\[Theta]\[Nu]"}]], " ", 
    SuperscriptBox["\[Sigma]\[Kappa]", "2"], " ", 
    SuperscriptBox["\[Sigma]\[Nu]", "2"]}], 
   RowBox[{"4", " ", "\[Theta]\[Kappa]", " ", "\[Theta]\[Nu]"}]]}]], "Output"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"-", "\[Alpha]mean"}], " ", "\[Beta]mean"}], "+", 
  RowBox[{
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{
     RowBox[{"-", "t"}], " ", "\[Theta]\[Nu]"}]], " ", "\[Alpha]1", " ", 
   "\[CapitalGamma]"}], "+", 
  SuperscriptBox["\[CapitalGamma]", "2"], "-", 
  RowBox[{
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{
     RowBox[{"-", "t"}], " ", "\[Theta]\[Nu]"}]], " ", 
   SuperscriptBox["\[CapitalGamma]", "2"]}], "+", 
  RowBox[{
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{
     RowBox[{"-", "2"}], " ", "t", " ", "\[Theta]\[Nu]"}]], " ", 
   SuperscriptBox["\[Alpha]1", "2"], " ", "\[Kappa]0"}], "-", 
  RowBox[{"2", " ", 
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{
     RowBox[{"-", "2"}], " ", "t", " ", "\[Theta]\[Nu]"}]], " ", "\[Alpha]1", 
   " ", "\[CapitalGamma]", " ", "\[Kappa]0"}], "+", 
  RowBox[{
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{
     RowBox[{"-", "t"}], " ", "\[Theta]\[Nu]"}]], " ", "\[Alpha]1", " ", 
   "\[CapitalGamma]", " ", "\[Kappa]0"}], "+", 
  RowBox[{
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{
     RowBox[{"-", "2"}], " ", "t", " ", "\[Theta]\[Nu]"}]], " ", 
   SuperscriptBox["\[CapitalGamma]", "2"], " ", "\[Kappa]0"}], "-", 
  RowBox[{
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{
     RowBox[{"-", "t"}], " ", "\[Theta]\[Nu]"}]], " ", 
   SuperscriptBox["\[CapitalGamma]", "2"], " ", "\[Kappa]0"}], "+", 
  FractionBox[
   RowBox[{"\[Kappa]0", " ", 
    SuperscriptBox["\[Sigma]\[Nu]", "2"]}], 
   RowBox[{"2", " ", "\[Theta]\[Nu]"}]], "-", 
  FractionBox[
   RowBox[{
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "2"}], " ", "t", " ", "\[Theta]\[Nu]"}]], " ", "\[Kappa]0",
     " ", 
    SuperscriptBox["\[Sigma]\[Nu]", "2"]}], 
   RowBox[{"2", " ", "\[Theta]\[Nu]"}]]}]], "Output"]
}, Open  ]],

Cell[BoxData[{
 RowBox[{
  RowBox[{"totalExp", "[", "mean_", "]"}], ":=", 
  RowBox[{"Mean", "[", 
   RowBox[{"TransformedDistribution", "[", 
    RowBox[{"mean", ",", 
     RowBox[{"\[Alpha]1", "\[Distributed]", 
      RowBox[{"NormalDistribution", "[", 
       RowBox[{"\[Alpha]0", ",", "\[Sigma]\[Alpha]"}], "]"}]}]}], "]"}], 
   "]"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"totalVar", "[", 
   RowBox[{"mean_", ",", "var_"}], "]"}], ":=", 
  RowBox[{
   RowBox[{"Variance", "[", 
    RowBox[{"TransformedDistribution", "[", 
     RowBox[{"mean", ",", 
      RowBox[{"\[Alpha]1", "\[Distributed]", 
       RowBox[{"NormalDistribution", "[", 
        RowBox[{"\[Alpha]0", ",", "\[Sigma]\[Alpha]"}], "]"}]}]}], "]"}], 
    "]"}], "+", 
   RowBox[{"Mean", "[", 
    RowBox[{"TransformedDistribution", "[", 
     RowBox[{"var", ",", 
      RowBox[{"\[Alpha]1", "\[Distributed]", 
       RowBox[{"NormalDistribution", "[", 
        RowBox[{"\[Alpha]0", ",", "\[Sigma]\[Alpha]"}], "]"}]}]}], "]"}], 
    "]"}]}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"totalCov", "[", 
   RowBox[{"mean1_", ",", "mean2_", ",", "cov_"}], "]"}], ":=", 
  RowBox[{
   RowBox[{"Covariance", "[", 
    RowBox[{
     RowBox[{"TransformedDistribution", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"mean1", ",", "mean2"}], "}"}], ",", 
       RowBox[{"\[Alpha]1", "\[Distributed]", 
        RowBox[{"NormalDistribution", "[", 
         RowBox[{"\[Alpha]0", ",", "\[Sigma]\[Alpha]"}], "]"}]}]}], "]"}], 
     ",", "1", ",", "2"}], "]"}], "+", 
   RowBox[{"Mean", "[", 
    RowBox[{"TransformedDistribution", "[", 
     RowBox[{"cov", ",", 
      RowBox[{"\[Alpha]1", "\[Distributed]", 
       RowBox[{"NormalDistribution", "[", 
        RowBox[{"\[Alpha]0", ",", "\[Sigma]\[Alpha]"}], "]"}]}]}], "]"}], 
    "]"}]}]}]}], "Input"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"\[Alpha]mean", "=", 
  RowBox[{"totalExp", "[", "\[Alpha]mean1", "]"}]}], "\[IndentingNewLine]", 
 RowBox[{"\[Beta]mean", "=", 
  RowBox[{"totalExp", "[", "\[Beta]mean1", "]"}]}], "\[IndentingNewLine]", 
 RowBox[{"\[Alpha]var", "=", 
  RowBox[{"totalVar", "[", 
   RowBox[{"\[Alpha]mean1", ",", "\[Alpha]var1"}], 
   "]"}]}], "\[IndentingNewLine]", 
 RowBox[{"\[Beta]var", "=", 
  RowBox[{
   RowBox[{"totalVar", "[", 
    RowBox[{"\[Beta]mean1", ",", "\[Beta]var1"}], "]"}], "//", 
   "Expand"}]}], "\[IndentingNewLine]", 
 RowBox[{"\[Alpha]\[Beta]cov", "=", 
  RowBox[{"totalCov", "[", 
   RowBox[{"\[Alpha]mean1", ",", "\[Beta]mean1", ",", "\[Alpha]\[Beta]cov1"}],
    "]"}]}]}], "Input"],

Cell[BoxData[
 RowBox[{
  SuperscriptBox["\[ExponentialE]", 
   RowBox[{
    RowBox[{"-", "t"}], " ", "\[Theta]\[Nu]"}]], " ", 
  RowBox[{"(", 
   RowBox[{"\[Alpha]0", "+", 
    RowBox[{
     RowBox[{"(", 
      RowBox[{
       RowBox[{"-", "1"}], "+", 
       SuperscriptBox["\[ExponentialE]", 
        RowBox[{"t", " ", "\[Theta]\[Nu]"}]]}], ")"}], " ", 
     "\[CapitalGamma]"}]}], ")"}]}]], "Output"],

Cell[BoxData[
 RowBox[{"\[CapitalGamma]", "+", 
  RowBox[{
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{
     RowBox[{"-", "t"}], " ", "\[Theta]\[Nu]"}]], " ", "\[Alpha]0", " ", 
   "\[Kappa]0"}], "-", 
  RowBox[{
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{
     RowBox[{"-", "t"}], " ", "\[Theta]\[Nu]"}]], " ", "\[CapitalGamma]", " ",
    "\[Kappa]0"}]}]], "Output"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{
     RowBox[{"-", "2"}], " ", "t", " ", "\[Theta]\[Nu]"}]], " ", 
   SuperscriptBox["\[Sigma]\[Alpha]", "2"]}], "+", 
  FractionBox[
   RowBox[{
    RowBox[{"(", 
     RowBox[{"1", "-", 
      SuperscriptBox["\[ExponentialE]", 
       RowBox[{
        RowBox[{"-", "2"}], " ", "t", " ", "\[Theta]\[Nu]"}]]}], ")"}], " ", 
    SuperscriptBox["\[Sigma]\[Nu]", "2"]}], 
   RowBox[{"2", " ", "\[Theta]\[Nu]"}]]}]], "Output"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{
     RowBox[{"-", "2"}], " ", "t", " ", "\[Theta]\[Nu]"}]], " ", 
   SuperscriptBox["\[Kappa]0", "2"], " ", 
   SuperscriptBox["\[Sigma]\[Alpha]", "2"]}], "+", 
  FractionBox[
   RowBox[{
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "2"}], " ", "t", " ", "\[Theta]\[Nu]"}]], " ", 
    SuperscriptBox["\[Alpha]0", "2"], " ", 
    SuperscriptBox["\[Sigma]\[Kappa]", "2"]}], 
   RowBox[{"2", " ", "\[Theta]\[Kappa]"}]], "-", 
  FractionBox[
   RowBox[{
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "2"}], " ", "t", " ", "\[Theta]\[Nu]"}]], " ", "\[Alpha]0",
     " ", "\[CapitalGamma]", " ", 
    SuperscriptBox["\[Sigma]\[Kappa]", "2"]}], "\[Theta]\[Kappa]"], "+", 
  FractionBox[
   RowBox[{
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "2"}], " ", "t", " ", "\[Theta]\[Nu]"}]], " ", 
    SuperscriptBox["\[CapitalGamma]", "2"], " ", 
    SuperscriptBox["\[Sigma]\[Kappa]", "2"]}], 
   RowBox[{"2", " ", "\[Theta]\[Kappa]"}]], "+", 
  FractionBox[
   RowBox[{
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "2"}], " ", "t", " ", "\[Theta]\[Nu]"}]], " ", 
    SuperscriptBox["\[Sigma]\[Alpha]", "2"], " ", 
    SuperscriptBox["\[Sigma]\[Kappa]", "2"]}], 
   RowBox[{"2", " ", "\[Theta]\[Kappa]"}]], "+", 
  FractionBox[
   RowBox[{
    SuperscriptBox["\[Kappa]0", "2"], " ", 
    SuperscriptBox["\[Sigma]\[Nu]", "2"]}], 
   RowBox[{"2", " ", "\[Theta]\[Nu]"}]], "-", 
  FractionBox[
   RowBox[{
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "2"}], " ", "t", " ", "\[Theta]\[Nu]"}]], " ", 
    SuperscriptBox["\[Kappa]0", "2"], " ", 
    SuperscriptBox["\[Sigma]\[Nu]", "2"]}], 
   RowBox[{"2", " ", "\[Theta]\[Nu]"}]], "+", 
  FractionBox[
   RowBox[{
    SuperscriptBox["\[Sigma]\[Kappa]", "2"], " ", 
    SuperscriptBox["\[Sigma]\[Nu]", "2"]}], 
   RowBox[{"4", " ", "\[Theta]\[Kappa]", " ", "\[Theta]\[Nu]"}]], "-", 
  FractionBox[
   RowBox[{
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "2"}], " ", "t", " ", "\[Theta]\[Nu]"}]], " ", 
    SuperscriptBox["\[Sigma]\[Kappa]", "2"], " ", 
    SuperscriptBox["\[Sigma]\[Nu]", "2"]}], 
   RowBox[{"4", " ", "\[Theta]\[Kappa]", " ", "\[Theta]\[Nu]"}]]}]], "Output"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{
     RowBox[{"-", "2"}], " ", "t", " ", "\[Theta]\[Nu]"}]], " ", "\[Kappa]0", 
   " ", 
   SuperscriptBox["\[Sigma]\[Alpha]", "2"]}], "+", 
  FractionBox[
   RowBox[{
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "2"}], " ", "t", " ", "\[Theta]\[Nu]"}]], " ", "\[Kappa]0",
     " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"2", " ", "\[Theta]\[Nu]", " ", 
       SuperscriptBox["\[Sigma]\[Alpha]", "2"]}], "-", 
      SuperscriptBox["\[Sigma]\[Nu]", "2"], "+", 
      RowBox[{
       SuperscriptBox["\[ExponentialE]", 
        RowBox[{"2", " ", "t", " ", "\[Theta]\[Nu]"}]], " ", 
       SuperscriptBox["\[Sigma]\[Nu]", "2"]}]}], ")"}]}], 
   RowBox[{"2", " ", "\[Theta]\[Nu]"}]]}]], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Numerics", "Subsubsection"],

Cell["\<\
In this section we simulate a trajectory of the model and compare it to the \
moment formulas.\
\>", "Text"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"reps", "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"\[Sigma]\[Nu]", "->", "0.00005"}], ",", 
     RowBox[{"\[Theta]\[Nu]", "->", "0.03"}], ",", 
     RowBox[{"\[Alpha]1", "\[Rule]", 
      RowBox[{"1.02", " ", 
       SuperscriptBox["10", 
        RowBox[{"-", "3"}]]}]}], ",", 
     RowBox[{"\[Alpha]0", "->", 
      SuperscriptBox["10", 
       RowBox[{"-", "3"}]]}], ",", 
     RowBox[{"\[Sigma]\[Alpha]", "\[Rule]", 
      RowBox[{"0.5", " ", 
       SuperscriptBox["10", 
        RowBox[{"-", "4"}]]}]}], ",", 
     RowBox[{"\[CapitalGamma]", "->", 
      RowBox[{"0.3", " ", 
       SuperscriptBox["10", 
        RowBox[{"-", "3"}]]}]}], ",", 
     RowBox[{"\[Kappa]0", "\[Rule]", 
      RowBox[{"1", "/", "3"}]}], ",", 
     RowBox[{"\[Sigma]\[Kappa]", "->", "0.01"}], ",", 
     RowBox[{"\[Theta]\[Kappa]", "->", "0.01"}]}], "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"plt1", "=", 
   RowBox[{"Plot", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"\[Alpha]mean", "/.", "reps"}], ",", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{"\[Alpha]mean", "+", 
          RowBox[{"Sqrt", "[", "\[Alpha]var", "]"}]}], ")"}], "/.", "reps"}], 
       ",", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{"\[Alpha]mean", "-", 
          RowBox[{"Sqrt", "[", "\[Alpha]var", "]"}]}], ")"}], "/.", 
        "reps"}]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"t", ",", "0", ",", "10"}], "}"}], ",", 
     RowBox[{"PlotRange", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"0", ",", "Automatic"}], "}"}]}], ",", 
     RowBox[{"Filling", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"2", "\[Rule]", 
        RowBox[{"{", "3", "}"}]}], "}"}]}], ",", 
     RowBox[{"PlotStyle", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{"Red", ",", "Thin"}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{"Red", ",", "Thin"}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{"Red", ",", "Thin"}], "}"}]}], "}"}]}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"plt2", "=", 
   RowBox[{"Plot", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"\[Beta]mean", "/.", "reps"}], ",", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{"\[Beta]mean", "+", 
          RowBox[{"Sqrt", "[", "\[Beta]var", "]"}]}], ")"}], "/.", "reps"}], 
       ",", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{"\[Beta]mean", "-", 
          RowBox[{"Sqrt", "[", "\[Beta]var", "]"}]}], ")"}], "/.", "reps"}]}],
       "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"t", ",", "0", ",", "10"}], "}"}], ",", 
     RowBox[{"PlotRange", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"0", ",", "Automatic"}], "}"}]}], ",", 
     RowBox[{"Filling", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"2", "\[Rule]", 
        RowBox[{"{", "3", "}"}]}], "}"}]}], ",", 
     RowBox[{"PlotStyle", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{"Red", ",", "Thin"}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{"Red", ",", "Thin"}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{"Red", ",", "Thin"}], "}"}]}], "}"}]}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"plt12", "=", 
   RowBox[{"Plot", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"\[Alpha]mean", "/.", "reps"}], ",", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{"\[Alpha]mean", "+", 
          RowBox[{"Sqrt", "[", "\[Alpha]var", "]"}]}], ")"}], "/.", "reps"}], 
       ",", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{"\[Alpha]mean", "-", 
          RowBox[{"Sqrt", "[", "\[Alpha]var", "]"}]}], ")"}], "/.", "reps"}], 
       ",", 
       RowBox[{"\[Beta]mean", "/.", "reps"}], ",", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{"\[Beta]mean", "+", 
          RowBox[{"Sqrt", "[", "\[Beta]var", "]"}]}], ")"}], "/.", "reps"}], 
       ",", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{"\[Beta]mean", "-", 
          RowBox[{"Sqrt", "[", "\[Beta]var", "]"}]}], ")"}], "/.", "reps"}]}],
       "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"t", ",", "0", ",", "10"}], "}"}], ",", 
     RowBox[{"PlotRange", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"0", ",", "Automatic"}], "}"}]}], ",", 
     RowBox[{"Filling", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"2", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"{", "3", "}"}], ",", 
           RowBox[{"Directive", "[", 
            RowBox[{"Red", ",", 
             RowBox[{"Opacity", "[", "0.1", "]"}]}], "]"}]}], "}"}]}], ",", 
        RowBox[{"5", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"{", "6", "}"}], ",", 
           RowBox[{"Directive", "[", 
            RowBox[{"Red", ",", 
             RowBox[{"Opacity", "[", "0.1", "]"}]}], "]"}]}], "}"}]}]}], 
       "}"}]}], ",", 
     RowBox[{"PlotStyle", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{"Red", ",", "Thin"}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{"Red", ",", "Thin"}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{"Red", ",", "Thin"}], "}"}]}], "}"}]}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"plt4", "=", 
   RowBox[{"Plot", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"Sqrt", "[", 
       RowBox[{"\[Alpha]\[Beta]cov", "/.", "reps"}], "]"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"t", ",", "0", ",", "10"}], "}"}], ",", 
     RowBox[{"PlotStyle", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"Thick", ",", "Purple", ",", "DotDashed"}], "}"}]}]}], "]"}]}],
   ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"plt3", "=", 
   RowBox[{"ListPlot", "[", 
    RowBox[{
     RowBox[{"RandomFunction", "[", 
      RowBox[{
       RowBox[{"Evaluate", "[", 
        RowBox[{
         RowBox[{"p", "[", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"\[CapitalGamma]", "+", 
             RowBox[{"\[Nu]", "[", "t", "]"}]}], ",", 
            RowBox[{"\[CapitalGamma]", "+", 
             RowBox[{
              RowBox[{"\[Kappa]", "[", "t", "]"}], 
              RowBox[{"\[Nu]", "[", "t", "]"}]}]}], ",", 
            RowBox[{"-", "1000"}]}], "}"}], "]"}], "/.", "reps"}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"0", ",", "10", ",", "0.2"}], "}"}]}], "]"}], ",", 
     "\[IndentingNewLine]", 
     RowBox[{"PlotStyle", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{"Black", ",", "Thick"}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{"Black", ",", "Thick", ",", "Dashed"}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{"Thick", ",", "Purple", ",", "DotDashed"}], "}"}]}], "}"}]}],
      ",", "\[IndentingNewLine]", 
     RowBox[{"Joined", "\[Rule]", "True"}], ",", "\[IndentingNewLine]", 
     RowBox[{"PlotTheme", "\[Rule]", "\"\<Detailed\>\""}], ",", 
     "\[IndentingNewLine]", 
     RowBox[{"PlotRange", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"0", ",", 
        RowBox[{"1.2", " ", 
         SuperscriptBox["10", 
          RowBox[{"-", "3"}]]}]}], "}"}]}], ",", "\[IndentingNewLine]", 
     RowBox[{"FrameLabel", "\[Rule]", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{
         RowBox[{"MaTeX", "[", 
          RowBox[{"#", ",", 
           RowBox[{"FontSize", "\[Rule]", "14"}]}], "]"}], "&"}], "/@", 
        RowBox[{"{", 
         RowBox[{
         "\"\<\\\\text{time}\>\"", ",", "\"\<\\\\text{references}\>\""}], 
         "}"}]}], ")"}]}], ",", "\[IndentingNewLine]", 
     RowBox[{"BaseStyle", "\[Rule]", "texStyle"}], ",", "\[IndentingNewLine]", 
     RowBox[{"PlotLegends", "\[Rule]", 
      RowBox[{"LineLegend", "[", 
       RowBox[{"MaTeX", "[", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{
          "\"\<\\\\alpha(t)\>\"", ",", "\"\<\\\\beta(t)\>\"", ",", 
           "\"\<\\\\sigma_{\\\\alpha\\\\beta}\>\""}], "}"}], ",", 
         RowBox[{"FontSize", "\[Rule]", "14"}]}], "]"}], "]"}]}]}], 
    "\[IndentingNewLine]", "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"fig1", "=", 
  RowBox[{
   RowBox[{"exportme", "[", "\"\<stoch-variate\>\"", "]"}], "@", 
   RowBox[{"Show", "[", 
    RowBox[{"{", 
     RowBox[{"plt3", ",", "plt4", ",", "plt12"}], "}"}], "]"}]}]}]}], "Input"],

Cell[BoxData[
 TemplateBox[{GraphicsBox[{{{}, {{{}, {}, {
         Hue[0.67, 0.6, 0.6], 
         Directive[
          PointSize[0.009166666666666668], 
          AbsoluteThickness[1.6], FontFamily -> "Latin Modern Roman", 
          FontSize -> 12, 
          GrayLevel[0], 
          Thickness[Large]], 
         LineBox[CompressedData["
1:eJxTTMoPSmViYGAwBmIQDQMLzEVXGmwLsJ81EwRO2n88mXSLxywQyr9pv+7z
5YyltoH2JsYg8Nh+dZqlhlMLTP6l/VTnkmkyioH2ENM+2NftjZqnXQ1T/9n+
08MPN29tC7RPTwOBb/Y6eXbCxVEw/T/tO3zU3zJvDbQ/ewYE/th31FcsWB4C
M4/BwWn7lKetL2HuY3QI333PscYXZj6zw5w1zPqHi2D6WRzel9/0cVsGs4/N
4fDk1Y9TPsPM43Bg/Zb+IG0WzH5OhzqZBK49X2DmcTvsK73v8ncFzDweh7mP
j7SLaQZBzeNzcDE2L3G7AzNPwKGEk61XOAGmXsBBNfnUKc5ymPmCDtyKd+rX
2cLcI+Sw9H2KfZcwzD5hh+qEybcYOwOg5ok4bHywoDbSJABqnojDBj8bq6oF
/lDzRB3S+v8XPvb1h5on5nBB53bX3HX+UPPEHY5ejzyxlAVmnoSDiU75lz08
MPMkHFbfznB8UgQLT0kHmYDzf2ZfhJkn5bAiSr3cKCMAap60w0U5A3bNPTDz
ZBwS+u7PmxwF86+Mg4r3W4E9D2DmyTrcO+B6PBBoPsQ8OYfvHF3RX5lg5sk7
+J3sX6213R9qnoKDWmMVQ9U1mP0KDiGBpX/S4v2h5is4fLFcvu51mL89WLux
ooPFlotLjMpg4aHosIdT8clUP5h5Sg4bipfMcnKFmafkwHVemX3hVV+oeUoO
h0RVb1aW+UHdo+xwK/an5gkNmHnKDgndzV4r+GD+VXE4aMQgNEklwB4AGkdE
8g==
          "]]}, {
         Hue[0.9060679774997897, 0.6, 0.6], 
         Directive[
          PointSize[0.009166666666666668], 
          AbsoluteThickness[1.6], FontFamily -> "Latin Modern Roman", 
          FontSize -> 12, 
          GrayLevel[0], 
          Thickness[Large], 
          Dashing[{Small, Small}]], 
         LineBox[CompressedData["
1:eJw90WFIU1EUB/CtZThmTefc5lrmpg3so1srlHH/L1OoCGOIQmGUlLZps6CE
ESuxcmKaxIpc0NQIInHfckRCGdkHU2MUboVCpJXpkgnTLW1ILd/pwONxuef8
7v9ytTWNljObBAKB4e+X/FO9MwaMnmGw+55kjbKEtEx1Qs3x60/sgU9ahQiY
0ZCsWfZLKU1drqL9edagcD9kJo5taEvM+yzhLDnN8f1R5p1f5wovcqyuNlkx
Bgl3NiSi+VX2rVd4dauZYxPjyUqwZfHxiuoweE8Ak/3kaH8/5RMiX76n2R2k
PCKoClznTZ/Bz2+GoCS8q1lB522BrUXf9gqULxVZczc6X6bQ+WL493tnpjIo
rwQHrP5jzkny0vB75mDBi6PkbYNqwIAKNXnp+FJU7fOvU3862s2u3hEj+Rlw
xIprpmU0L4NF+fyrP0b5M1Gv87vdI3RfOdwXCh+9v0yeHCHzoOajju6fBWmP
qfxcjPGeAuHgPWeXkDwlngaGU0pl5KkQm3psj84y3lOh9sOpLo+UvGxouKa1
5P6Gp0Z0NXPsSiV529HqzLk7MUSeBt/1lW9W1PReGvxcGDvc/f89d6A8Xmdx
hcB7ObhZel2/0kfeTtQPSVv7OsnLRU9Z/HW0nfpz0XLJ4jhipfvnQm6NFBXb
wP6NG7RIs6+Z97oovxaLHW13fN3k6dDwtiP+5DZ5OtiuORpt2eTp0BTZNz1o
ozx5OBSULIhukZeHH4Hdi3OT5OVDPO6OLw2A/QFMdUYB
          
          "]]}}}, {}, {}, {{}, {}}}, {{{{}, {}, 
        TagBox[{
          Directive[
           Opacity[1.], 
           AbsoluteThickness[1.6], 
           Thickness[Large], 
           RGBColor[0.5, 0, 0.5], 
           Dashing[{0, Small, Small, Small}]], 
          LineBox[CompressedData["
1:eJwVx3080wkcwHFiiNFm2y+Pe/CT5SF0PbyqF32/oVeFlKQcV9cWmyJd2ToV
YqhccTuHQnLq6FyxHuZ6PElCeTiadGWVa5xLDy9ZO4Y7t/vj8/q83jzh3k1x
s4yMjNYb+v/l6UKzhbEnVrJU5rLdYgo0q7ihW7m7IKX2mwKnBArMtDRkcbkH
YbQoXtWZRIHyxjwOhZsLYSdGhhccoECiv3TPOKcEXAWD4sFsCqim4gtHOTVQ
QW7jeZ6jgHn/a/57zk0oy5BvdlFToPJRxb63nIeQuWNbQud6M6hT5PYnej+H
J7K0gcoV5iCGnpJ3+zWQpSp2mKZaQNKQu0ZZ9wbyi5Om3B5bgCUvm/9q2Sgs
WlJ19sXZ2ZBPa/eo3KGF6WThDGuLJQj7N9816fgbjq7RHHjGtIJ9D7KFe/mT
8LG1cammzQqufEWNsFv3D9hZCPue7aZC5eGEEd+tRlha4zCexLQGWcV0+Kd3
xnh7WbteUmsNRqoBvHPIBCnLz17qXWkDbhJRymYPCs4oX55RPLWBQd2pLVa/
muHBzLmrjIVzIHhod1rBPgs0e5AiytLOgbBBuSebbYk3qqJN6UCDkfvCjLZa
K/z5FtfvbRoNvOl9zoFfWuODsZRd/o00sASdQK21wXlFNhfSpmmw5n30uEsk
Ddv6OmQ0Pzr83hRrHO1Fx+GAKt/eFDrUH2/eztXRUTfWneV4mQ4iinSgq8sW
XzWXJxaM0GHn/sP11FIGekrdaX0cW/ARe3aFCpgY6nMm/8UmW/jN1stKupyF
O54Huo4dt4XbdbIyLxMCN90lNwTcsoXDxh4bO14Q6JMfcD/9gy1Yqg+tTVLO
RYs71KgSLgOGqnmFFal2CEX+W8PDGFA43970ZqQ9Wu5NLu9NZ4C8VNQq4Dqg
XbSvvdtFBkQXbuuiDjvgtcqmq9efMGAiqEpf0eCI2/MlR3SzmKAZCkhpOuaE
X/RGZYd5MeGc/0LHToEz/qFQ05dFMaE2R0oXL2Bj1MLqgdgMJhyL3BliomNj
6QjBMb/AhCXqyppjnRyMurIl1bmbCafdy2o7Q7hY3/555HUdE4405p0OucnF
e0tdv77kzIL1jpFVj1x5GP7yZAU3iAWrklpj6Lk8XFeTGhohZkGFk9C1Q8fD
ycXxf7WcZIHr/QvFYTEuKDI6OUooWCBf0OTxuMEFi+z5E7xuFoi0pj0PPUhc
4bE6OVLLAuGVMW7utyRqznAExQwCEmUR08HfkWg6VcKexyRAGqF8Sv2eROsb
2u5rBh/XSfPlxSRmBQYze1gE1C3XT50qJ/FRUDXLyo4A/b2ZvuqLJPqJvE3T
nAiQP6bmNbeSKOueWxI1j4DS83vijz4kcbxo4NOQweclXYFr20kU6BWrk90I
+IWQT7Z3kUiViFvy+ASooxnxqickepIxQU3uBPA19oGvNSRa0GIXuXsT4Ks8
xP5xiESVij9Qb/CKnH593DCJPTkUWYAPAaH88stvRkgMyWRUxfgSsD+By/74
kcSiuLL4vM8ISPXL1F/VkljmubHBfhEBOdaveyU6EqWS+bOrDT6tOH9iYoJE
98i16Q2LCTiXYSq+NUli04aCn4KXEHAxPC4gdZpERYFpW5/BSpcW55X/ktgd
9oNauJSABq2bfmbGYKXozw8G/wfofQl8
           "]]}, 
         Annotation[#, "Charting`Private`Tag$2767#1"]& ]}}, {}, {}}, {
      GraphicsComplexBox[CompressedData["
1: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
638QzQ6F
       
       "], {{{}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, \
{}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {
          EdgeForm[], 
          Directive[
           RGBColor[1, 0, 0], 
           Opacity[0.1]], 
          GraphicsGroupBox[{
            PolygonBox[CompressedData["
1:eJwt02WQEEQYgOGju5GuA0RCujsl5Qru4E5CTjqOkJTuFFBaaQmlS0EaQUG6
u1M6FEmRhxl+PPvOt392Znc2MLpzWEzsgICAWCSzJKchQdThE6pRhRSkJBWp
SUNaPiAd6clARjKRmSxkJRvZyUEgOclFbj4kDx+Rl3zkpwAfU5BCFKYIRSlG
cUpQklKUpgxlKUd5KlCRSoQTTF1qUp2qRBBCPWpRg0aE8im1aUwY9YmkAVFU
ZuD7u7uq8XSbnuU/FvALR/iHb5nNKvbxgBF8zQyW8ge3GUB/+tGXr+hDb3rR
kx5050u60ZUudCaGTnSkA+1pR1va0JpWtOQLomnB5zSnGU1pwmdEEUljGhFB
OA0Zzjims4Tf+YsGDGMs0/iJXdwijG+YxUr2cp+hjGEqP7KTm4QykZms4E/u
MYR5rOUgjxnNFBbzGzcIYStneM0P/Mxh/mYCGznBc77nPP+znD3cZTCXieOt
N2siPaUvmUsS8wV996nWSAI9oI8YRVLzJY2tGzShHtN/mUxi8zl9wyLim3fo
dYK5Qlx7W/Q0r5jPxXdH2l+nh3jCeH7lOM/4jmXs5g6D2MRJXjCH1eznISNZ
z1GeMomFbOcaQbwFm1CF4w==
             
             "]]}]}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, \
{}, {}, {}, {}, {}, {}, {}, {}, {}, {
          EdgeForm[], 
          Directive[
           RGBColor[1, 0, 0], 
           Opacity[0.1]], 
          GraphicsGroupBox[{
            PolygonBox[CompressedData["
1:eJwVz+lSDgAUBuDvK62itNJCn0glFVJZkm6hS+gCuB9XQCi0KiQ7kXZri/ZV
ZE+Lpx/PzDvnnHlnTqj2Us3FsEAgEOQyP4WzBqcooZB8jvDL7jd/+Msa/1hn
g022tovcBgkjnB1EEEkU0cQQy07i2MVu4klgD4kkkUwKqaSxl32kk0EmWezn
ANmEOEgOhzjMOco4zjEKyKOSck5QxFHOU8FJiqniNKVc4AzV5PLezz9Y5juz
LLHKBDMs8o1RPjPNAl/5yAjjTDHPCu94yzBDDDJAP3308oYeXvOKbl7yguc8
4ylPeMwjHtLFAzq5zz3u0kE7d2ijlRaaaaKR29ziJg3Uc4PrXKOOq3zgE2NM
MscXrvAfA4VUQQ==
             "]]}]}, {}, {}}, {{}, {}, {}, 
         TagBox[{
           Directive[
            Opacity[1.], 
            AbsoluteThickness[1.6], 
            RGBColor[1, 0, 0], 
            Thickness[Tiny]], 
           
           LineBox[{1, 71, 65, 60, 56, 53, 51, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11,
             12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 
            28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 
            44, 45, 46, 47, 48, 49, 72, 66, 61, 57, 54, 52, 73, 67, 62, 58, 
            55, 74, 68, 63, 59, 75, 69, 64, 76, 70, 77, 50}]}, 
          Annotation[#, "Charting`Private`Tag$2722#1"]& ], 
         TagBox[{
           Directive[
            Opacity[1.], 
            AbsoluteThickness[1.6], 
            RGBColor[1, 0, 0], 
            Thickness[Tiny]], 
           LineBox[CompressedData["
1:eJwt0Wc70GEUwOG/hkh9iL5QGQ2VSrQHqWjR0qS9NRANob2J9hRNqRSShvae
Urfr6sV9/Z5z3pwXT6+E5OikkCAIztCbp//fO1nLV25znMW85zoHyeMn9yhn
Lq+4TCmb+c5dTrKCT9zgCCEON2gBv7lPBV3sn2gfWjhLqN0ubaee7uZ1+o07
hJlPaCdt1B66RD9QTTfzoaDjaBA8lgjN11/UEW4+pZ21Sefxmivs5S+P2MIP
ailjJZ+5yVEKaeMBlUTyjHPsZj1L+UgNh9nOfN5wlX1sZRVRPOc8RWwgi0ze
co39bGM10bzgAnvYSDYLiOElFylmE8tYSF/60Z8BxDKQQQwmjiEMZRjxDCeB
REYwklGMZgxjGcd4JjCRJJKZRAqTmcJUUkljGtOZwUxmkU4Gs2nlEiXksJxF
vKOKA+Syhi/c4hg7+MNDTtPVXzdrT52j/wCxzHai
            "]]}, 
          Annotation[#, "Charting`Private`Tag$2722#2"]& ], 
         TagBox[{
           Directive[
            Opacity[1.], 
            AbsoluteThickness[1.6], 
            RGBColor[1, 0, 0], 
            Thickness[Tiny]], 
           LineBox[CompressedData["
1:eJwNxllWQQEAANDXBpAxkSJRaEIZmiNSSZGoTwvI/v+6H/ecm1+tp38bQRCM
CckX74x44pF7wkTYJEqMOAmSpNgizTYZsuyQY5c98hTYp8gBJcocckSFKjWO
OeGUM86p06DJBZe0aNOhyxXX3HDLnAkvDOjxwDcfvDKkz4JP3nhmyZQxP8z4
5Y5/jcYR8g==
            "]]}, 
          Annotation[#, "Charting`Private`Tag$2722#3"]& ], 
         TagBox[{
           Directive[
            Opacity[1.], 
            AbsoluteThickness[1.6], 
            RGBColor[1, 0, 0], 
            Thickness[Tiny]], 
           LineBox[CompressedData["
1:eJwVzclWgQEAgNG/R/FANm2JMoRUkmigRNEkiSaJJPSaXYt7zrf7QonC+v5a
EARhIuKHEW/0eeKRKBvEiLPJFgmSpEizTYYsOXbIs8seq1mBA4ocUuKIMhWO
OeGUM6rUOOeCOpc0aHLFNS3a3HDLHfc8MOOLdwb06PLLmA9eeGbOhCGvLPjm
kyVT/ujwD6uUKRs=
            "]]}, 
          Annotation[#, "Charting`Private`Tag$2722#4"]& ], 
         TagBox[{
           Directive[
            Opacity[1.], 
            AbsoluteThickness[1.6], 
            RGBColor[1, 0, 0], 
            Thickness[Tiny]], 
           LineBox[CompressedData["
1:eJwNxls2QgEAAMBrKS2oH0toAdlWIakkCuVRpKiQSHklJUliAeZjzplQZGU5
uhQEQZiYzBgz4IkeXeKsssY6CTZIskmKNBm2yLJNjh12yVNgj30OKFLikCOO
OaFMhVPOqHJOjToXXNKgSYsrrrmhzS0d7vjmgzee6fPAnAlDXnjkh0/eeWXB
lBG/fPHHPf/JYkBE
            "]]}, 
          Annotation[#, "Charting`Private`Tag$2722#5"]& ], 
         TagBox[{
           Directive[
            Opacity[1.], 
            AbsoluteThickness[1.6], 
            RGBColor[1, 0, 0], 
            Thickness[Tiny]], 
           LineBox[CompressedData["
1:eJwVzOkygmEABeD3S1IRaVFJKFuWtFizhAvoj0twAVw9RaSnH8/MmTlnTv3t
4/U9CiEM+RTuYyFc0eGMY4740o0Y880PE375Y8r//Mg2IsYCcRZJsESSFGmW
WSHDKmtkWSdHngJFNihRpsImVbaosc0Ou9RpsMc+BzxwTZcWJzR55IYe55wy
4JYL2jzR55Jn7njhkBmMXRWv
            "]]}, 
          Annotation[#, "Charting`Private`Tag$2722#6"]& ]}}], {}, {}}}, {
    DisplayFunction -> Identity, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {0, 0}}, AxesOrigin -> {0, 0}, 
     PlotRange -> {{0, 10.}, {0, 0.0012}}, PlotRangeClipping -> True, 
     ImagePadding -> All, DisplayFunction -> Identity, AspectRatio -> 
     NCache[GoldenRatio^(-1), 0.6180339887498948], Axes -> {False, False}, 
     AxesLabel -> {None, None}, AxesOrigin -> {0, 0}, 
     BaseStyle -> {FontFamily -> "Latin Modern Roman", FontSize -> 12}, 
     DisplayFunction :> Identity, Frame -> {{True, True}, {True, True}}, 
     FrameLabel -> {{
        FormBox[
         GraphicsBox[{
           Thickness[0.01663616702711695], 
           StyleBox[{
             
             FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 
              1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {
              1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 
              0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGI9IGYC4oPd+5pMFos7eOyvlbVYruYA409pb426XKPu
cADEVxZz8L04Meafs4bDGiEdvvR9wnB+i3gtayYbH5x/Bgy4HDLzP7Se3KIK
1c/lsEH1SfM8XVWoekw+TH/ti6Zf0yy/2fucYLed/VUdzge7T13d4WXt4+zz
a5gcYPyAJ56XTCczO0DUq8H5OxyaHh2foQrnrwW5W04Gzo9RjZA5N0fSYSYI
RDLB+TD70Pn/wUDcIWdqQqFF8R/7aJC8jARUP4sDjN8X0e3PuIEdzu8B87ng
/Or7P24ZewvC+cYgMFnIAWY+jA+z/8u+j1vTywThfFj4wvj+YP9wOcwAucNS
Co0vA+eD7a1WgvNRw58fEn5b1aHmC8P54HCzE4Hz37TldhtFI/gmYPeKOLBw
dsknr1N3CHl7+eMMRRGHgFvSNYmTYPqFIfGVjsYHpjcYHxxfN1QdRConlZxt
EXHYYv7jUEqXqoPGJ5WXszJF4fw0EGgTg/NR0u9zND7QfABHbTBz
              "]], 
             
             FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 
               1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
               1, 3, 3}}, {{0, 2, 0}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGCQA2IQ/ap4q+jv1+oOa4V0+NLnyTnA+K0K7Kpnvsg5zFmk
vPPPcXWHs2eAQEfe4UWW9rfpcxF8v4sTY/4lI/g6ivJfcsLUHVLTgOAZVL87
wnwWzi755D41BwNjIPgs6fD3W+mDORtVHKru/7hlvFoCoq9NGc6vBtHRSnC+
+5qjyxkk5B1mzAQCSyk4/zTI/jeKcP4dTdk1/4uVHB5FiG+/6KAO54PdfxfB
h/kXnQ+29zeCv8X8x6GUU6oOMybwV5llq0H8la7hUH54m+tMXmU4/0D3viaT
w/Jw/hqQv+9JQfR3qcL5/LEB943EleD8L/s+bk2/JuOwJ7/m7UxXBYcHrvGO
swrFHVSuPQpmiFGG88H2r1aD82HuA4dnsawDenwCAKIK2dA=
               "], {{11.0984,
                9.490630000000001}, {7.787499999999998, 9.490630000000001}, {
               7.899999999999999, 11.6734}, {9.12344, 11.924999999999999`}, {
               9.512499999999998, 11.924999999999999`}, {11., 
               11.924999999999999`}, {11.084400000000002`, 
               9.964060000000002}, {11.0984, 9.490630000000001}}}], 
             
             FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 
              1, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {
              1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 
              0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 
              3, 3}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJ9IGYC4uTYO27MGoYOMstfeOjt13WA8VPTgOCYHoS/
wsAhI/9D68kp+g4zZgLBT304331/rawFux6cD6avaDuI9ni9YhHRg/OPH3Za
m2mnDedPaW+NuvxH3SE+JEh9wUpNDD4LZ5d8sp46XD06f62QDl+6nAycH6Ma
IXNujqRDOsjdbQh+Csj9OzQx+P/BQNxBHuTvei2HaJC8jATE32w6cP4GvbzF
jHcQfLA75+jC+bqK8l9ypunD+WdAQMYAbj6MD7N/6gT+KrPV+nC+z8WJMf8W
6yL4J9htZ0/VhYSzpRQaXwbOh4WHbWXECtNYAww+LDzB8dOui8GHxQeMD4v/
J4kLr5mc14OGg76D/y3pmsRP+nD+1523uv6KGsD500H+8TaAhOsPPYcvIPlS
A4e1qk+a553Vc/i8ISB7VroBPD0VbxX9fZoPym9D8CHxogvnQ9KPLkS/u4GD
+NQrnBmLdBxmggGCD3bvewQfln5h+tHTNwAH0zN9
              "]], 
             
             FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 
               1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
               1, 3, 3}}, {{0, 2, 0}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGCQA2IQfbBtefgpJzOHtUI6fOnz5Bxg/FYFdtUzX+QcZObF
aZ42MHM4ewYIdOQdHJoeHZ8hjeCXbBX9ffqfKZyfEnvHjfmHqUNqGhA8g+r/
YAo33+/ixJh/k00dDIyB4LOkg88JdtvZS00cqu7/uGW8WsKBAQQEEPwt5j8O
pVQZw/lg9wkZOcyYCQSWUnD+aZD9bxTh/Duasmv+Fys52FZGrDB9awrnO4Lc
b20G58P8i86vBtn3G8EHu+OUqoPE1CucGU2mDnMWKe/8k67hsOT+Pr45l43h
/OdZ2t+m2xrB+ftrZS3SWQwh+rtU4Xz+2ID7RuJKcP6XfR+3pl+TcegPLlGZ
nm/k8MA13nFWobiD6pPmeWd/GcP5YPsXmcL5MPeBw7NY1gE9PgHZDdRC
               "], {{
               21.3984, 9.490630000000001}, {18.087500000000002`, 
               9.490630000000001}, {18.2, 11.6734}, {19.4234, 
               11.924999999999999`}, {19.8125, 11.924999999999999`}, {
               21.299999999999997`, 11.924999999999999`}, {21.3844, 
               9.964060000000002}, {21.3984, 9.490630000000001}}}], 
             
             FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 
              1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {
              1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 
              0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGI9IGYCYvGpVzgzmqwdPPbXylosV3OA8ae0t0ZdrlF3
kADxlawdfC9OjPnnrOGg8ZZ3n0GnFZy/xfzHoZQoSzjfGAQ+Wzhk5n9oPblF
1SFCfPtFhnsWDhtUnzTP01WFqL+FyYfpt6uMWGH618zB5wS77eyv6nA+2H3q
6g5PEhdeM3lvDudv1MtbzMhjAVWvBufvcGh6dHyGKpy/VkiHL11OBs6PUY2Q
OTdH0sFAa6XwhSfmcD7MPnT+fzAQd5CZF6d5OsHcIRokLyMB0a9iAef3BZeo
TO9H8PtB/PcIfoyC48fkN5Zw/vHDTmsz7azg5sP4MPsbWI72G363hPNh4Qvj
bwD5542Fw4yZQGAphcaXgfOr7/+4ZVytBOejhH+VJST8tqo7nAGBHis4Hxzf
KxH8/DXdtzM2IPhg9+6zcmDh7JJPXqfusPyFh97/hVYOAbekaxInQfVnWkHi
Kx2ND0xvMD44vm6oOqgAnXV2lxXEXV2qDj6gdPEZwZ8+gb/KzNoazkdJv8/R
+EDzAeKxMNg=
              "]], 
             
             FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 
               1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
               1, 3, 3}}, {{0, 2, 0}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGCQA2IQfVzTatLp4w4Oa4V0+NLnyTnA+K0K7Kpnvsg5FG8V
/X16n4PD2TNAoCPv0L48/JTRFgRf3vFj8pmlCL741CucGYscHFLTgOAZVP88
hPk8/uunpBY4OBgYA8FnSYj6T/YOVfd/3DJeLeEAMuZMDIJfz3K03/C4HZzf
G1yiMj3e1mHGTCCwlILzT4P0vVGE8+9oyq75X6zkwLJ4khXjXAc4H+z+Iwg+
zL/o/GqQfb8R/C3mPw6lnFJ1+LwhIHtWuoPDnEXKO/+kazjkr+m+naFgD+eD
1XXZwvk9Xq9YTAJtoOKqcD5/bMB9I3ElOP/Lvo9b06/JOMQoAAN0j63DA9d4
x1mF4g4fQPa528P5YPvLHeB8mPvA4Vks64AenwD479hA
               "], {{
               32.69839999999999, 9.490630000000001}, {29.387500000000003`, 
               9.490630000000001}, {29.499999999999996`, 11.6734}, {
               30.723399999999994`, 11.924999999999999`}, {
               31.112499999999997`, 11.924999999999999`}, {
               32.599999999999994`, 11.924999999999999`}, {
               32.684400000000004`, 9.964060000000002}, {32.69839999999999, 
               9.490630000000001}}}], 
             
             FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 
              3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {
              1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 
              3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 
              1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 
              3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJzIGYC4p23uv6mzndx+A8G4g4wfoxqhMy5OZIOaSDg
huAve+Gh918Swbe4djTXRMLFYUewVcR/d2k4v9vGc1faISWEvEPTo+MRqnA+
AwgoqDk8SVx4zeS9s4PvxYkx/5jVHUDKZux2dpgJApIaEHUZUHlnDYdszp8L
0rUR/OKtor9P1znB+b9jco/+s3JyyMz/0Hryi6rDGRDQcYL4I00VIq+FyYfp
Dy5Rmf7fwtHB5wS77eyv6nC+x/5aWQt1dYflIP9vRPDNQf45AFOvBueD/TtD
Fc5fK6TDly4nA+fDwm/yN7b4GWsQfJh96HxY/IDDK93RIRokLyMBia/jCH63
1ysWk58IPsz/MD7L4klWjL0IvjEI7HaCmw/jw+xPOHxZO9UTwd+ol7eY0QST
D/MfjF95/8ctY2tlOB8SXmqQ+FrnBAmvreoON6VrEo1kneF8cLB1I/gHgNrS
lzg7bDH/cSjFSw3OT4m948Y8QwXOh9kP48PcV//bquDcBAQfZh86H+b/HFD6
8naGhw/YPasRfOFPjufT7iL4IaD4EXCB83tA4V/ogho/SPkLAAoObB4=
              "]], 
             
             FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
              3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGINIGYC4k8bArJnzXd3WCukw5c+T84BhS8n7/ArJvfo
v0kIvoLjx+QzvWj8WgR/o17eYsYad4dWBXbVM1/kHObZ6FyZVebuoP5J5eUs
TzmHnbe6/qb6uzt82fdxa3qYlMOTxIXXTN67OVTd/3HLeLUEhN+P4L/h3Wcw
UwnBl5h6hTNjkqvDerB7peH894vWK5zlUILzPfbXylosV3O4mB/Pfk7TzWHG
BP4qs9PqDqpPmuedbULw00DgGIJvce1oromGuwMDCCSoO/R4vWIxCXR32GL+
41CKl5pDZcQK07PWCP6yFx56/3+6YfDB5qqpwvmQcFGBmC/hDnEnkwokfJ0Q
/A0gdTkIPiy8wealIfiZ+R9aT5qowvl/v5U+mCMIda+gu8OcRco7/6RrOISU
qEz/3+AG57uqljLN2uAK55sYAwG3q8Ovt68PWDarwvndNp670piU4HyRykkl
Z5/IOESIb7/IsM3V4YFrvOOsQnFIfNW7wfkP9vHNMc5yh/NR0xNa+gKmNwCV
uQbx
              "]], 
             
             FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 
               1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
               1, 3, 3}}, {{0, 2, 0}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGCQA2IQrT9hwQ/DdV4Oa4V0+NLnyTnA+K0K7Kpnvsg53JCu
STRa6uVw9gwQ6Mg7vOfdZzBzFoLfvjz8lFEPgl//26rgXIeXQ2oaEDyD6m9F
mF+yVfT36TAvBwNjIPgs6fBhQ0D2rPueDlX3f9wyXi3hADLmzBQEf9kLD73/
ngi+Lsh90zwcZswEAkspOP80SN8bRTj/jqbsmv/FSg45nD8XpDd7wflvQO5f
heDD/IvOrwbZ9xvB32L+41DKKVWHCPHtFxn8vBzmLFLe+Sddw2Gejc6VWWWe
cL5906PjM1Z7wPlrum9nMPB7QPR3qcL5/LEB943EleD8L/s+bk2/JuMw5Rtb
/IwjHg4PXOMdZxWKO9zfxzfHuMsTzg8H2R/nBefD3AcOz2JZB/T4BAAWktuC

               "], {{52.4984, 9.490630000000001}, {49.18749999999999, 
               9.490630000000001}, {49.3, 11.6734}, {50.523399999999995`, 
               11.924999999999999`}, {50.912499999999994`, 
               11.924999999999999`}, {52.400000000000006`, 
               11.924999999999999`}, {52.48439999999999, 9.964060000000002}, {
               52.4984, 9.490630000000001}}}], 
             
             FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
              3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 
              1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}}}, CompressedData["
1:eJxl1HtIU1EYAPA7FcrIR2U5lbFd7+YUTc2tTPGPb4Rh3bPsIShhrMfmjCgr
JpkU1R8SNim1IjUJ0cCghUImKmXlEDKdFkaECUrQgzK0CBFfa+fce8/F+cH5
48d37uWc7zvnsMdLDtoCGYZR+MY+3wjwjYrW/LdpyAxVBc5cRbgaJE83t2k8
a1mwuEcTbRvMMDjkiykWjmIrRCfFCn6NoB5HMAdVe38GGWsQjCeoXF4DB2UF
j7Z7YsR8JQf2Il9844X8Uw5eXlbttFt5sB4Z3x2o1FLP//71KsOto2ZwNMXB
uxLLmuFKHnJw4rseWn/kJHsTEHV78pkWxZRsx7PNC4OzCJZmSycbD+gg8u6H
4OJ5BCdLZioGHFrowPMXkfBdlhaydaUBDWvN1BrTnxNDIbLJftnVVuGFWPw8
Idv8vqZw2a1f6V3x1I3NXPeiPR7+te8/1RAmW6q35Bmcn0BQVx1WvmNQD0aD
L0ZFO/XCfhoR3L5ecXg0Kx5wm4asiH5/AfcjUTapbx6/0hG8UK+aOOqO9Lk+
6zodNdn/cy21M2tPT1EfB14c+Tzcx/0eiIU8h/aet1rMB8RC+F/TSJGHF+aN
sNA1dmPJpkaCb7HC+bmGYDLbYmowsbA+t+2OrQ6J542FoJbaTEU/gicbk0Lt
DzSCvyIwkNDQfnrIfDW1MF9FXYfXlxEj1HsEgbqnqdd2UwmLhaf7l9NkR+D1
vuCpyTrtPJRNzI0ZHkfDlYXMs8PAQ6m7M7tepRHOZwZP10fmp/PAffxyiHGt
NqmfkYcZfN/eaOBTzKVjaVtlk/l62VK9/b3pYq3D89DPWtnk/nUrqXNc/a1M
VyQ1qfe5SEipbprbFifb5fxczKTIJvtNFe/jVTGfy0M5qYeS9p/UKzSKmuQT
o2AqpDe1/ryUjxbeg075/zbsLYianF+jbNKvadnSeyX1w/89+w/x4yIW
              "]]}, 
            Thickness[0.01663616702711695], StripOnInput -> False]}, {
          ImageSize -> {60.10965877957659, 18.729753424657535`}, 
           BaselinePosition -> Scaled[0.32127889429728423`], 
           ImageSize -> {61., 19.}, PlotRange -> {{0., 60.11}, {0., 18.73}}, 
           AspectRatio -> Automatic}], TraditionalForm], None}, {
        FormBox[
         GraphicsBox[{
           Thickness[0.03502626970227671], 
           StyleBox[{
             
             FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 
              3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {
              0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 
              3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGIZIGYC4gPd+5pMlMUcUtOA4JmcA4z/ftF6hbMcig4a
n1ReznopgsEPeXv54wxGeTS+tMMZEPARdqi6/+OW8WoJh2CQuKIgnN8T0e3P
uIELg++65uhyhhuycL46yNyTcnA+C2eXfLKeukMfiG8gisGf0t4adfmPOlw9
Ov/81bA3+tK6DtGqETLnbDjg/ENg/3I4PM/S/ja9VstBZqPYfCYFFoeAW9I1
iZfUHRjA4Is92Lw9CD7M/hu8t8VSy5gd0Pmw8ITxZ4LATgmHfrB7uB0euMY7
zioUd6gEhcNpATgfEn4icD4sPkQqJ5WcfSLlgB5fALBfts0=
              "]], 
             
             FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 
               1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {
               1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
               3}}}, {CompressedData["
1:eJxTTMoPSmViYGAQA2IQXX54m+tMX2WH/2Ag7gDjx6hGyJybI+kQzinWblyv
COd323juSktSdBCpnFRy9gmC3xPR7c8oIAPn+16cGPPPWcPBxBgEpB18TrDb
zv6qDud77K+VtVBXdzjQva/J5LAcnL8fxHeWd5jS3hp1+Y8anM8AAgtU4fy1
Qjp86XIycD7MfSlpQLBMDs5X/6TychanNAYf5l/3NUeXM8yQcYgGyctIwM2D
8cHK8hXgfLC9+xD86vs/bhlHK8H56OEJAFekjEI=
               "], {{8.87344, 
               14.399999999999999`}, {8.87344, 14.817199999999998`}, {8.53906,
                15.081299999999997`}, {8.20469, 15.081299999999997`}, {
               7.815629999999998, 15.081299999999997`}, {7.52344, 
               14.774999999999999`}, {7.52344, 14.399999999999999`}, {7.52344,
                14.0391}, {7.829689999999999, 13.732800000000005`}, {
               8.190629999999999, 13.732800000000005`}, {8.60938, 
               13.732800000000005`}, {8.87344, 14.065599999999998`}, {8.87344,
                14.399999999999999`}}}], 
             
             FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 
              3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {
              0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 
              0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 
              3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {
              1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 
              3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 
              3}}}, CompressedData["
1:eJxl1GtIU1EcAPDpRiGhlDE2c7aZ3nu3te6ekq/oWKA2euGgFlpU02kQ6ocV
RfihrD64QoIei4ZQflhBEULiA7IlRpYlE+qLBauwiMooULBmrZ1z+/8vzAOX
8ePce/6Pc3YKD7fVNSkVCkVG6vGknszUo+s5YJowlJAkGxoCbuC8uslwHgn0
qxMTrS70/NB01x+1bO2VV1ktuS4y6Cn3Jmvy0cHKbcP+0XXyPDnz4amXQyvo
MPCk/W7wTUvUSXZMXWr4qxSIcTZ7xLbPSa7TkWckkc+1YrLPIc1vNZKORHn7
ZKnsoPuLyrXKjq5KhQmdsknxQjx5fD6y9/kWG/k9+zVa1smRfFrfShupfdRR
UBoRSEnlw7qrN0X8fsarGZh6Z0Grsrr0PtGMLqAJ6U3kSNuPc8/mOOKn45NR
+vVz0nx8qeH706on3XYNR7aPL990Y15As3wEgcRe7/lmTfBo9QVaoPD/fR4t
1ceh7+VacprX6tCwP2ezd92//JFHQ7x0w/6PDw9eXBbjSD2d12nJGtqv3QLa
t/9ttVJrREP94Bqad7MZzZbVr8f1wRB/gJ0LE5rtk3KpoT7wyfjCtLOiCC31
i5f267tZ6le/QMK3ioYWIxY02+9DItpqvrM6NiaSBxsXRhvdPLqR1hkqRkN8
MORnKdTPHT0uG+KlG+pn5+vgBuwPy+e9iGbn+7YVzc5zhQ3dJ7b2ZizKptvb
5LXj+mCIz/IN2NArqrljme6lhvrA0F8w9LfbEyi+ttmO/as3VP306Rxogf5/
f8nmZjp7Xpqd2F8w9BcM8cGQX298JCeslA3x0g31s/6dcGB/2H1S5kS/oCMs
eye7d1zoKD2+Y7LT78d/iXARXQ==
              "]], 
             
             FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 
               1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
               1, 3, 3}}, {{0, 2, 0}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGCQA2IQrfGWd5+BprXDWiEdvvR5cg4wfqsCu+qZL3IO9SxH
+w3FrR3OngECHXmH5S889P4zIvg3pGsSjZ5awfknDjutzbxn5ZCaBgTPoPqv
W8HN32L+41BKlZWDgTEQfJZ02KiXt5ixx9Kh6v6PW8arJRxA2tK+WcD50vPi
NE8nIPhg9/00c5gxEwgspeD80yD73yjC+Xc0Zdf8L1ZyWHJ/H9+cy1ZwPtj9
itZwPsy/6PxqkH2/EXywu0+pOtT/tio4l2HlMGeR8s4/6RoOXG6qpUy7LOB8
v4sTY/4pm8P5qk+a5519ZQrR36UK5/PHBtw3EleC87/s+7g1/ZqMw9edt7r+
hpo7PHCNd5xVKO7Q7fWKxeShBZwPtr/DCs6HuQ8cnsWyDujxCQBW19TO
               "], {{
               26.2984, 9.490630000000001}, {22.987499999999997`, 
               9.490630000000001}, {23.099999999999998`, 11.6734}, {
               24.323399999999996`, 11.924999999999999`}, {24.7125, 
               11.924999999999999`}, {26.200000000000003`, 
               11.924999999999999`}, {26.2844, 9.964060000000002}, {26.2984, 
               9.490630000000001}}}]}, 
            Thickness[0.03502626970227671], StripOnInput -> False]}, {
          ImageSize -> {28.548154420921545`, 18.729753424657535`}, 
           BaselinePosition -> Scaled[0.32127889429728423`], 
           ImageSize -> {29., 19.}, PlotRange -> {{0., 28.55}, {0., 18.73}}, 
           AspectRatio -> Automatic}], TraditionalForm], None}}, FrameStyle -> 
     Automatic, 
     FrameTicks -> {{Automatic, Automatic}, {Automatic, Automatic}}, 
     GridLines -> {Automatic, Automatic}, GridLinesStyle -> Directive[
       GrayLevel[0.4, 0.5], 
       AbsoluteThickness[1], 
       AbsoluteDashing[{1, 2}]], 
     Method -> {"CoordinatesToolOptions" -> {"DisplayFunction" -> ({
           (Part[{{Identity, Identity}, {Identity, Identity}}, 1, 2][#]& )[
            Part[#, 1]], 
           (Part[{{Identity, Identity}, {Identity, Identity}}, 2, 2][#]& )[
            Part[#, 2]]}& ), "CopiedValueFunction" -> ({
           (Part[{{Identity, Identity}, {Identity, Identity}}, 1, 2][#]& )[
            Part[#, 1]], 
           (Part[{{Identity, Identity}, {Identity, Identity}}, 2, 2][#]& )[
            Part[#, 2]]}& )}}, PlotRange -> {{0, 10.}, {0, 0.0012}}, 
     PlotRangeClipping -> True, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {0, 0}}, Ticks -> {Automatic, Automatic}}],FormBox[
    FormBox[
     TemplateBox[{
       GraphicsBox[{
         Thickness[0.037993920972644375`], 
         StyleBox[{
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3,
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 
             3}}}, {CompressedData["
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
             "]}], 
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3,
             3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
            3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJ5IGYCYp+LE2P+LdZxuMF7Wyz1G4sDjH8GBHxY4fwm
8VrWzDZWh63mPw6laOk4cDnyec3IZHcQn3qFMyNJ08EYBIIFHUR7vF6xXFF3
CHl7+eOMRik4/zTIvDdKcH7ALemaxCANiH4lTYcWlqP9ht91HKa0t0ZdjtFx
+A8C8gZw+8F8ewS/EaTeHcH/+630wZxANPl0A4i+eh2HCPHtFxnyDBx8QfLJ
CL77/lpZC3YEX2b5Cw+9/ZoOG/TyFjPe0YP6T8PB1GZv0DRFHYcGsDvVoO7X
dDAC+1vNYYdD06PjEWpwPsy/MD44fIoVIPq3A9UHW0X8d5dySAgJUl+gqeHQ
psCueiZExGG96pPmeWc1Hc6Dw5/bwecEu+1sUR2HgCeel0yFWeDuh/Fh/oPx
UeMPwYfFLwDyF9br
            "]], 
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3,
             3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1,
             0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1,
             0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3,
             3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJLIGYCYv+LE2P+BRs7tCqwq575Iu8A4wtXTio5q6Lg
4H2C3Xa2q7GD84RmoTQrBYfCNd23MwwQ/AI0vuqT5nlnpRB8sHnCxg6lh7e5
zpRF8Eug/DMgwGPsEM4p1m7Mr+Cw+P4+vjmfjRzetOV2G1nLO6i/5d1nsNLI
wcAYCIplHG5K1yQasRo5yO9asC+1T8LhutAnx/NmhnD+Rr28xYxnDOB8A62V
wheOGED0f5aE82vu/7hlrC3toI/Gh8nvCLaK+O8u49AfXKIy/TxMv4zDbZD9
Tw0dWDi75JP11CHu1zGG88HhU4Dgg/07GQd/HYI/pb016vIfdYeSraK/T9ch
+J83BGTPMkfwI8W3X2T4ZwjnL3/hofe/0QgajjoO/0Gg38jh+K4dvWwFCP6J
w05rM+vQ5Dcg+OJTr3BmKOlCzEs0cpAA8ZN0IfFhjOA3shztNxRH8MHxcdQQ
Yr+PrkP9b6uCcysMHWpBdIaOQwTIvXII94LdMU8fzj8KcocAGv+CHgbfB5QO
SxF8WHia2uwNmsaoD+eD7e1A8Lu9XrGYMCLiKz0NCMQMIO5dI+8g0gNU8EUf
kt52y0Lcd0/f4Sw4XhF8WPqD8b/s+7g1/Ro0PaUYODxwjXecVSjusAGU/nQM
4Xxw+E02gvNh+as3otufcQIiv8HyHwCqx4Wn
            "]], 
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3,
             3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
            3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJ5IGYC4g16eYsZ35g7nD4DBG+UHGD8LeY/DqVwqTrw
+a+fknrC3GFye2vU5RoNhx6vVywmjOYODSxH+w23azuUbBX9fVrPzGGt6pPm
ebz6DjMm8FeZcZs6RIhvv8iQZ+Dgd3FizL/HJnC+zwl229lXTVDlD5s4NILM
S0fw/34rfTAnEE3eHcH/DwL2Bg4Fa7pvZzCYOhiDALOBw4FaWYv0FDOI+8x1
HRyaHh2foW3u8Ahk4QINOP+Opuya/5+V4PwY1QiZczLSEP0tZhDzLgs6fNoQ
kD3ruYlDi3gta2YbG9z+JjCfFc4HBd8ZHwT/Bu9tsdRvLGjyLHD/BzzxvGQq
zAIPHxh/2QsPvf+CpnD+l523uv6amjl82fdxa7oYD8R9T4DhLaTDl14n7MDl
plrKNMvcoer+j1vG2pLw+DsLsk9H3gE9fgGQZNu7
            "]]}, 
          Thickness[0.037993920972644375`], StripOnInput -> False]}, {
        ImageSize -> {26.321494396014945`, 18.729753424657535`}, 
         BaselinePosition -> Scaled[0.32127889429728423`], 
         ImageSize -> {27., 19.}, PlotRange -> {{0., 26.32}, {0., 18.73}}, 
         AspectRatio -> Automatic}], 
       GraphicsBox[{
         Thickness[0.038417210910487894`], 
         StyleBox[{
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3,
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 
             3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1,
              3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 
             0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3,
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {
             1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGDQA2IQLVw5qeSsi4KDMRgoOoRzirUb5ys4/AeB84oO5Ye3
uc6sVXA4fQYIcpTg/G4bz11pTMpwfkrsHTdmCRUI31bBQXb5Cw89eVWHtUI6
fOlx8g6Z+R9aT35RdTABWbNZzsHnBLvt7FI1B5CxZ97IOnjsr5W1eK7mUHP/
xy3j1zIQeVN1h+3BVhH/22UdGEAgQd1BBOReFTmHgFvSNYmT1OHmzZjAX2V2
Wt0hPQ0IyhQcHkWIb7+4QMMB4j9FB32tlcIXjmhC/DlZ0eF5lva36X+1HD4s
Wq9wdoUixJxgbQf+2ID7RtsVHY7v2tHLtgHBb+H1Xz+FVQfOP3817I3+bR1I
OOUrOohPvcKZsUgXwn+v4CAD8r+9HsQ9ZgoOf96+PmCprA93/wa9vMWMc/Sh
/pOG8z3WHF3O8EMEzn/gGu84S1AAEk5ntB22em2wmFPJ4+B7cWLMP2YNh5yp
CYUWxd/sW8RrWTPbuOF8sDv2czlc+n3s+rzI7/Y8jnxeMzK5HGpeNP2aZvkD
zvd/4nnJdPJPOB+i/xec/8TvZcJf+d/2R7r3NZks5nK4Ajbvt/2XfR+3potx
O9zgvS2WWsbqcBbkPB1ZhyaQO9jYHXaA/HVc0gHsLjYeiD8KxR1mzwSCm4Jw
Psy/MD44nh0kIOFYL+EAsUfaIUY1QubcHCmHkLeXP844KAtJV/NkHHojuv0Z
L8g7tCqwq54pkXdAT88AWUY16A==
             "], CompressedData["
1:eJxTTMoPSmViYGCwAGIQ/WXfx63pYrIO/0HAX9FhxkwgqJRxeOAa7ziLUcHB
xBgEpB1EKieVnE2RdUhPAwI2SQcDkHCxtIPHmqPLGX6IOcjvWrAvtU/S4U1b
brdRtAjEvHoJh9kg824KwvlnwIAbzgdJz4xkd1gvpMOXPk8azu+N6PZnnCAP
5ztPaBZKs1JwCHjiecl0MrsD2FmbFRyaxWtZM9k4IHxjRYeC5SUb/p3nc2Di
7JJPfqfuEPz28scZioIOx3ft6GUr0HbQ+KTyclamqENG/ofWkyL6DtuDrSL+
t0vD+WDn5cjC+WD//JZziA8JUl+wUs9hDcid9+QdJObFaZ7+oOsQzinWbqyv
4NDC679+Squug/K1R8EMPlA+K4J/4rDT2sw6HTgfbA+PDiQ8zaDhPFkb4k8p
BYeaTxsCsqW0HVJA8svkHV4UbxX9za0FUbdZzuF5lva36X81HGru/7hl/FrG
gRnkXz0NePxNaW+NuvxHHSov7TBjAn+V2WkoP1vagQEEFqhD4s1PChLON9Ud
2hTYVc+ISDr4nGC3nf1VHaLugDicDw6P26JwPsTdwnD+WlD42AlD7PNG8MHy
puoO/aB4NRB22OHQ9Oi4BG4+2P01atD0JArng9OloTicDwqetDYJOB/iX0mI
eTPUIOnMXhrCv6EGiW92GYct5j8OpXSpQdL1EhkHj/21shbqMHlZh0xQ/G9R
dQDnj2myDrLLX3joyatC0uUFqHyJCpzfbeO5K+2QMpxfDXLHbyVo+pJ12Jtf
83amqpIDen4DANMJeHY=
             "], {{6.45156, 11.6188}, {
             6.2437499999999995`, 11.5484}, {6.02031, 11.507799999999998`}, {
             5.8125, 11.507799999999998`}, {5.52031, 11.507799999999998`}, {
             5.08906, 11.507799999999998`}, {5.117190000000001, 
             11.590600000000002`}, {5.143750000000001, 11.715599999999998`}, {
             5.58906, 11.715599999999998`}, {5.923439999999999, 
             11.715599999999998`}, {6.11719, 11.715599999999998`}, {
             6.284379999999999, 11.6875}, {6.45156, 11.6188}}}], 
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3,
             3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
            3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJ5IGYC4i3mPw6lcOk43OC9LZb6jcUBxj8DAj6scH6T
eC1rZhurg8y8OM3TE7QduBz5vGZksjvU/bYqOHdCw8EYBIIFHWo+bQjItlJ3
CHl7+eOMRik4/zTIvDdKcH7ALemaxCANh1qQ/g4NhxaWo/2G33Ucfrx9fcDy
sLbDfxCQN4DbD+bbI/iNIPXuCP7fb6UP5gSiyacbOKSnAcEzbYcI8e0XGfKg
8qcQ/PWqT5rn5SL4Lbz+66eoajps0MtbzHhHD+o/dQdTm71B0xR1HF5kaX+b
HqsGdb+mw4yZQLBT1WGHQ9Oj4xFqcD7MvzA+OHyKFSD6ZdUcdgRbRfx3l3I4
sWtHL9sEdYc2BXbVMyEiDqI9Xq9YTDQdzoPDn9thC8gdNdoOAU88L5kKs8Dd
D+PD/IciD48/BB8WvwAMJtxV
            "]], 
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3,
             3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1,
             0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1,
             0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3,
             3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJLIGYC4kaWo/2G7MYOrQrsqme+yDvA+MKVk0rOqig4
1P62Kjj3w8jBeUKzUJqVgsOS+/v45jxG8Bej8SPEt19kOIfgg807buRQenib
60xZBYcGKL8Eyv8PAvuNHMI5xdqN+RUcrgt9cjy/zMjhTVtut5G1vEO0guPH
5BgjBwNjICiWceDxXz8ldYehg/yuBftS+yQcuN1US5leGcD5TxIXXjOpR/CT
Y++4MVcYQPR/loTza+7/uGWsLY2TvyPYKuK/u4zDwbbl4aeaYPplHHhB9s8w
dGDh7JJP1lOHuP++EZwPDh9lYzgf7H93HPx1CP6U9taoy3/UHZa/8ND7b4jg
qz5pnnf2lRGc3+P1isVkoyGcf1u6JtHI1MjhDAjw6DiAnGnsbORwfNeOXrYC
BP/EYae1mXVo8hsQfPGpVzgzlHQh5okaOUiA+Em6kPh4ZgjnbzH/cSjlFIIP
jo8KQ4j9ProOG/XyFjPGGELSTYaOQzfIvRcN4O7V11opfIFFH87XUZT/klOm
h8o3w+T7nGC3nV2K4MPCc84i5Z1/0hF8cPy/R/D318papG8xgPNNQP6drA9x
7xp5h5pPGwKyo/Qh6W23LMR9LvoOZ0HyOgg+LP3B+F/2fdyafg2aniQMHB64
xjvOKhR3eAyy/z6CDw4/NyM4H5a/eiO6/RknIPIbLP8BAED9ZhI=
            "]], 
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3,
             3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
            3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJ5IGYC4ieJC6+ZzDd3OH0GCN4oOcD4W8x/HErhUnVw
bHp0fEa1ucPk9taoyzUaDgdqZS3St5g5NLAc7Tfcru2w4oWH3v+Hpg5rVZ80
z+PVdzh12Glt5j4Thwjx7RcZ8gwcGkHqpiP4db+tCs51oMmXm0DodAT/77fS
B3MC0eTdEfz/IGBv4LDk/j6+OZtNHIxBgNnA4cuGgOxZ4lD3mes6lGwV/X36
npnDI5CFCzTg/Duasmv+f1aC82NUI2TOyUg7fALpNzeDmHdZ0AHkrbOzTBxa
xGtZM9vY4PY3gfmscD4o+M74IPg3eG+LpX5jQZNngfs/4InnJVNhFnj4wPg3
pWsSjY4i+BpvefcZvDR1+LLv49Z0MR6I/6abOawV0uFLrxN2sK2MWGHqa+5Q
df/HLWNtSXj8nQXZpyPvgB6/ABoq2mk=
            "]]}, 
          Thickness[0.038417210910487894`], StripOnInput -> False]}, {
        ImageSize -> {26.029310087173098`, 18.729753424657535`}, 
         BaselinePosition -> Scaled[0.32127889429728423`], 
         ImageSize -> {27., 19.}, PlotRange -> {{0., 26.03}, {0., 18.73}}, 
         AspectRatio -> Automatic}], 
       GraphicsBox[{
         Thickness[0.044306601683650866`], 
         StyleBox[{
           
           FilledCurveBox[{{{1, 4, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3,
              3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1,
              3, 3}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGAQBWIQ/WHReoWzGYoODCCQoO4A409pb426/Efd4YFrvOOs
hwqo/EQE32PN0eUMFSJwfrRqhMw5Gw44P3tqQqFF8Q97sLoIZTg/nFOs3Zhf
Ac4XqZxUcjZF2mEmCEQyQewpFHewLXGsPR3DA+evEdLhS98nAufX3P9xy/i1
tEPI28sfZzTKwflnQCBHGc7/9fb1ActmFQg/W9rh77fSB3Mmqjp82fdxa7qY
FMS9NWoO90HmKirA+eWHt7nOrEXwUcIHiQ8LPwDzi5gB
             "], {{
             6.145309999999999, 9.879690000000002}, {6.145309999999999, 
             9.393750000000002}, {5.923439999999999, 8.225}, {
             5.435939999999999, 7.418749999999999}, {4.935939999999999, 
             6.59844}, {4.18438, 6.13906}, {3.5593799999999995`, 6.13906}, {
             2.8499999999999996`, 6.13906}, {2.33438, 6.681249999999999}, {
             2.33438, 7.640629999999999}, {2.33438, 8.475}, {2.83594, 
             11.2438}, {4.87969, 11.2438}, {5.47813, 11.2438}, {
             6.145309999999999, 10.9516}, {6.145309999999999, 
             9.879690000000002}}}], 
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3,
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{
             1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, {CompressedData["
1:eJxTTMoPSmViYGDQB2IQLbP8hYeevK6DMQh8FnSA8d3XHF3OYCHk8CBCfPtF
Bl2Hz/s+bk0PE3L48/b1AcvHOnD+fxDYj+DLzIvTPL1BB65ffOoVzoxFOnDz
5yxS3vnHXcdhZ7BVxH92AYeEkCD1BZ3aOPksnF3yye+0MPjtCuyqZ0SE4XyR
ykklZ1lE4HwPkP03EPya+z9uGb8WgfhHQdvhYPe+JpNkUYcWlqP9ht91HELe
Xv44g1EK4p94XYdWkPlT5DD4f6H8Fij//NWwN/rRug5zZgLBTzkHn4sTY/4p
I/j+t6RrEj/pYPDftOV2G92Wc9jq0PTo+A0dhx0g/6nLOciCwr9ex6E/otuf
cYO0wwyQvpvakPDcIQH3D1h9uhic3wZyzxWEPMy+ye2tUZdlNB26bTx3pRUp
OGwx/3EoZZU6nL9RL28x4x8VOJ8/NuC+UbqSwxkQ8JGG88H2HReF84VB4a0i
BInXycoOX8Dxz+cQAPLfJFU4f4Pqk+Z5Z9XgfF1F+S85ZhoOD1zjHWcJCjiY
gPRv1oSEb4mQg0iP1yuWL5oOwaD4SBRw2A4KnxlacP01nzYEZFdpw/m+oPBu
1oHzYen3Icj8QER6hqU/AGDkQOU=
             "], CompressedData["
1:eJxTTMoPSmViYGAQBmIQLbP8hYfefE2HmSBQKeyQBgLP1B2+7Pu4Nb1MwMFA
a6XwhRQ1h53BVhH/2QUcNunlLWacowrnH9u1o5etQAXOB5tzU9mh8v6PW8an
BeH8KhDfWwTOB5tvJgYxL0bFoT+i25+xQMphI4j/R8VBdteCfal5Mg4e+2tl
LZ6rOqh/Unk5y1PewecEu+3sr2oOtzVl1/xnVoC4b4k6nJ+Z/6H15BRNDP4O
kPueS8H5b9pyu41ui6PKp4vB+Qe69zWZKIs4oIcPAKfwh+Q=
             "]}], 
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3,
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 
             3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1,
              3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 
             0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3,
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {
             1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGDQA2IQ/SJL+9t0WRMHBhB4IObA5aZayqRl4hClGiFzbo+4
w99vpQ/mGJo4zAQDCTg/6O3ljzMSJeH8+67xjrM+Sjnw+q+fkiph4iBSOank
bIqMQ3oaEDwzdnjTltttNFvWgR8kf8IYIu8i53BbuibRaClU/racg+qT5nln
q4wd1D+pvJzlKe/gf3FizL/Jxg6pIHPa5B3OgMAaY4cQkP0H5R2+7LzV9feo
scP7ResVznIowN0fzinWbjxfweEWyPxSE4fTIH05ig4y8+I0T08wcSg/vM11
pq8SxL0zoOr7lRxsKyNWmM41cai+/+OW8WkEnz824L4RuzKc32njuSttkbLD
H5D/G00cRHu8XrGYqDgYaK0UvhBi4mBqszdo2kIVB7CwoImDxNQrnBlOqg4p
sXfcmFcYO2zSy1vMOEfVYfkLD73/hgi+9wl229msRqjyioYOa4R0+NLfKUH8
f8bAQRgcfgoOuoryX3Km6Tlc570tlvqNAc7/su/j1vQwBoet5j8OpazSc2gW
r2XNZGNwmLNIeeef4wg+2J0PEfyaTxsCsn8h+CycXfLJfPoO/0HAnsHBxBgI
hPUdCpeXbPjXzwCJH2MDh2BQfDAKO5w+7LQ2M87AIRqcfgQg6eOiAdQ9fA4b
Qf6qMYTz1UHxzWUE5y+5v49vzmIjB/8nnpdML/NDwkPVGJKO0gQdIsS3X2SY
Z+wgv2vBvtRzQg5bQP77ZeygAOaLOKCnZwCAWDS+
             "], CompressedData["
1:eJxTTMoPSmViYGCwAGIQzeO/fkpqhbGDiTEQCIs7bDH/cSglytghDQTcRB1A
wsbKxg4KuxbsS80TdvjzrfTBnINGDv0R3f6MAkIO4lOvcGYkGTmkg9QfE3A4
AwJvDB12BltF/GcXcDh92GltZh2CDzb/lAGcv+T+Pr45yQYO8iDz9YTg/C/7
Pm5N/yaCyp8m6sALcm8GlG8mBrG/yMCBAQQeiDnU/7YqOMdh6KB87VEwg44C
hB9hCPHHYiWHaAXHj8kyRg4NIHENVYf+4BKV6frGcL6B1krhCy0IvvqT5nln
Txk7/Hr7+oDlYxWHw23Lw099MnZ4FCG+/WKCisNMEOA0cfA5wW47W1TFocfr
FYuJoInDym8vK84cUIbzH7jGO85KROMLKjts1MtbzMhjAnHvHiWHCSD3/Dd2
4I8NuG+UrgRx/wtjhw+L1iucXaEIUb/H2MF5QrNQ2isFh5Og8M0zhrgjUgEe
f+D4MFOAhJ+zMcT/wgoOtpURK0x1jR1aFdhVz3yRd5g+gb/K7LeRQ6eN5640
JQV4/Fbe/3HL2FrBwRvkr1YEH6xeG8Ff/sJD7/9BQzi/cE337YwNhg47QPGb
Lu8ACiaGdYaQ9BWM4Ae8vfxxhiJuPjh8DOUc9EHxIWIE54PjLwfBVwXFzyoE
HxwOL40cpoPDQ84hOfaOG7MGNH1vloOEp4exQy8o/QbIQfybaAxJt2dkIeqK
jR3Ogrg6sg4xIPt6jB3etOV2G0XLQMJ1mrFDOyj8SqTh/Bkg+yql4PwgkH8S
JR143FRLmbqg4W0i4YCe3wBYeHBf
             "], {{18.864099999999997`, 
             7.8421899999999996`}, {18.717200000000002`, 
             7.7921900000000015`}, {18.5703, 7.76406}, {18.4328, 7.76406}, {
             18.217200000000002`, 7.76406}, {17.9141, 7.76406}, {
             17.924999999999997`, 7.8031299999999995`}, {17.953100000000003`, 
             7.890629999999999}, {18.2766, 7.890629999999999}, {
             18.510899999999996`, 7.890629999999999}, {18.6391, 
             7.890629999999999}, {18.756299999999996`, 7.87031}, {
             18.864099999999997`, 7.8421899999999996`}}}]}, 
          Thickness[0.044306601683650866`], StripOnInput -> False]}, {
        ImageSize -> {22.572453300124533`, 18.729753424657535`}, 
         BaselinePosition -> Scaled[0.32127889429728423`], 
         ImageSize -> {23., 19.}, PlotRange -> {{0., 22.57}, {0., 18.73}}, 
         AspectRatio -> Automatic}]}, "LineLegend", 
      DisplayFunction -> (FormBox[
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
                    PointSize[0.08250000000000002], 
                    AbsoluteThickness[1.6], FontFamily -> 
                    "Latin Modern Roman", FontSize -> 12, 
                    GrayLevel[0], 
                    Thickness[Large]], {
                    LineBox[{{0, 10}, {40, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.08250000000000002], 
                    AbsoluteThickness[1.6], FontFamily -> 
                    "Latin Modern Roman", FontSize -> 12, 
                    GrayLevel[0], 
                    Thickness[Large]], {}}}, AspectRatio -> Full, 
                    ImageSize -> {40, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.08250000000000002], 
                    AbsoluteThickness[1.6], FontFamily -> 
                    "Latin Modern Roman", FontSize -> 12, 
                    GrayLevel[0], 
                    Thickness[Large], 
                    Dashing[{Small, Small}]], {
                    LineBox[{{0, 10}, {40, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.08250000000000002], 
                    AbsoluteThickness[1.6], FontFamily -> 
                    "Latin Modern Roman", FontSize -> 12, 
                    GrayLevel[0], 
                    Thickness[Large], 
                    Dashing[{Small, Small}]], {}}}, AspectRatio -> Full, 
                    ImageSize -> {40, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #2}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.08250000000000002], 
                    AbsoluteThickness[1.6], FontFamily -> 
                    "Latin Modern Roman", FontSize -> 12, 
                    Thickness[Large], 
                    RGBColor[0.5, 0, 0.5], 
                    Dashing[{0, Small, Small, Small}]], {
                    LineBox[{{0, 10}, {40, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.08250000000000002], 
                    AbsoluteThickness[1.6], FontFamily -> 
                    "Latin Modern Roman", FontSize -> 12, 
                    Thickness[Large], 
                    RGBColor[0.5, 0, 0.5], 
                    Dashing[{0, Small, Small, Small}]], {}}}, AspectRatio -> 
                    Full, ImageSize -> {40, 10}, PlotRangePadding -> None, 
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
                   RowBox[{"PointSize", "[", "0.009166666666666668`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   
                   RowBox[{
                    "FontFamily", "\[Rule]", "\"Latin Modern Roman\""}], ",", 
                   
                   RowBox[{"FontSize", "\[Rule]", "12"}], ",", 
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
                    Dynamic[{
                    Automatic, 
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
                   RowBox[{"Thickness", "[", "Large", "]"}]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.009166666666666668`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   
                   RowBox[{
                    "FontFamily", "\[Rule]", "\"Latin Modern Roman\""}], ",", 
                   
                   RowBox[{"FontSize", "\[Rule]", "12"}], ",", 
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
                    Dynamic[{
                    Automatic, 
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
                   RowBox[{"Thickness", "[", "Large", "]"}], ",", 
                   RowBox[{"Dashing", "[", 
                    RowBox[{"{", 
                    RowBox[{"Small", ",", "Small"}], "}"}], "]"}]}], "]"}], 
               ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.009166666666666668`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   RowBox[{
                    "FontFamily", "\[Rule]", "\"Latin Modern Roman\""}], ",", 
                   
                   RowBox[{"FontSize", "\[Rule]", "12"}], ",", 
                   RowBox[{"Thickness", "[", "Large", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0.5, 0, 0.5], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> 
                    RGBColor[0.33333333333333337`, 0., 0.33333333333333337`], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], "RGBColor[0.5, 0, 0.5]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0.5, 0, 0.5]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0.5, 0, 0.5], Editable -> False, Selectable -> 
                    False], ",", 
                   RowBox[{"Dashing", "[", 
                    RowBox[{"{", 
                    RowBox[{"0", ",", "Small", ",", "Small", ",", "Small"}], 
                    "}"}], "]"}]}], "]"}]}], "}"}], ",", 
           RowBox[{"{", 
             RowBox[{#, ",", #2, ",", #3}], "}"}], ",", 
           RowBox[{"LegendMarkers", "\[Rule]", 
             RowBox[{"{", 
               RowBox[{
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}]}], "}"}]}], ",", 
           RowBox[{"Joined", "\[Rule]", 
             RowBox[{"{", 
               RowBox[{"True", ",", "True", ",", "True"}], "}"}]}], ",", 
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
}, Open  ]]
}, Open  ]]
},
WindowSize->{1631, 1026},
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
Cell[1464, 33, 51, 0, 33, "Text"],
Cell[1518, 35, 1041, 28, 148, "Input"],
Cell[CellGroupData[{
Cell[2584, 67, 32, 0, 35, "Subsubsection"],
Cell[2619, 69, 132, 3, 33, "Text"],
Cell[2754, 74, 437, 10, 34, "Input"],
Cell[3194, 86, 811, 17, 192, "Input"],
Cell[CellGroupData[{
Cell[4030, 107, 2428, 75, 168, "Input"],
Cell[6461, 184, 258, 8, 34, "Output"],
Cell[6722, 194, 424, 13, 38, "Output"],
Cell[7149, 209, 305, 9, 56, "Output"],
Cell[7457, 220, 1838, 50, 54, "Output"],
Cell[9298, 272, 1848, 51, 54, "Output"]
}, Open  ]],
Cell[11161, 326, 1831, 48, 103, "Input"],
Cell[CellGroupData[{
Cell[13017, 378, 716, 17, 124, "Input"],
Cell[13736, 397, 404, 13, 38, "Output"],
Cell[14143, 412, 380, 11, 34, "Output"],
Cell[14526, 425, 506, 15, 56, "Output"],
Cell[15035, 442, 2357, 64, 54, "Output"],
Cell[17395, 508, 812, 23, 56, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[18256, 537, 33, 0, 35, "Subsubsection"],
Cell[18292, 539, 118, 3, 33, "Text"],
Cell[CellGroupData[{
Cell[18435, 546, 8369, 240, 457, "Input"],
Cell[26807, 788, 65183, 1217, 253, "Output"]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature Ev0qUd6j28B@tDwkT0keLit4 *)
