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
NotebookDataLength[    740862,      14521]
NotebookOptionsPosition[    733725,      14282]
NotebookOutlinePosition[    734157,      14301]
CellTagsIndexPosition[    734114,      14298]
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

Cell["Global rules for simplification:", "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{"$Assumptions", "=", 
   RowBox[{
    RowBox[{"0", "<", "\[Beta]", "<", "\[Gamma]", "<", "\[Alpha]"}], "&&", 
    RowBox[{"0", "\[LessEqual]", "p", "\[LessEqual]", "1"}], "&&", 
    RowBox[{"x", "\[GreaterEqual]", "0"}], "&&", 
    RowBox[{"y", "\[GreaterEqual]", "0"}], "&&", 
    RowBox[{"z", "\[GreaterEqual]", "0"}]}]}], ";"}]], "Input"],

Cell["Macro for exporting figures to file:", "Text"],

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
   ")"}]}]}], "Input"]
}, Closed]],

Cell[CellGroupData[{

Cell["Hyper-Prior", "Subsection"],

Cell["\<\
Functions to generate priors of the hyper parameters. The first is normal, \
the second is bivariate Poisson.\
\>", "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{"hyperPriorNormal", "[", 
   RowBox[{
   "\[Alpha]bar_", ",", "\[Beta]bar_", ",", "\[Alpha]sigma_", ",", 
    "\[Beta]sigma_", ",", "\[Alpha]\[Beta]sigma_"}], "]"}], ":=", 
  RowBox[{"MultinormalDistribution", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"\[Alpha]bar", ",", "\[Beta]bar"}], "}"}], ",", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
        SuperscriptBox["\[Alpha]sigma", "2"], ",", "\[Alpha]\[Beta]sigma"}], 
       "}"}], ",", 
      RowBox[{"{", 
       RowBox[{"\[Alpha]\[Beta]sigma", ",", 
        SuperscriptBox["\[Beta]sigma", "2"]}], "}"}]}], "}"}]}], 
   "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"hyperPriorBP", "[", 
    RowBox[{
    "\[Alpha]bar_", ",", "\[Beta]bar_", ",", "\[Alpha]sigma_", ",", 
     "\[Beta]sigma_", ",", "\[Alpha]\[Beta]sigma_"}], "]"}], ":=", 
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"\[Theta]0", ",", "\[Theta]1", ",", "\[Theta]2"}], "}"}], ",", 
     RowBox[{"TransformedDistribution", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\[Theta]1", "+", "\[Theta]0"}], ",", 
         RowBox[{"\[Theta]2", "+", "\[Theta]0"}]}], "}"}], ",", 
       RowBox[{"{", "\[IndentingNewLine]", 
        RowBox[{
         RowBox[{"\[Theta]0", "\[Distributed]", 
          RowBox[{"GammaDistribution", "[", 
           RowBox[{"\[Alpha]\[Beta]sigma", ",", "1"}], "]"}]}], ",", 
         "\[IndentingNewLine]", 
         RowBox[{"\[Theta]1", "\[Distributed]", 
          RowBox[{"GammaDistribution", "[", 
           RowBox[{
            RowBox[{
             SuperscriptBox[
              RowBox[{"(", 
               RowBox[{"\[Alpha]bar", "-", "\[Alpha]\[Beta]sigma"}], ")"}], 
              "2"], "/", 
             RowBox[{"(", 
              RowBox[{
               SuperscriptBox["\[Alpha]sigma", "2"], "-", 
               "\[Alpha]\[Beta]sigma"}], ")"}]}], ",", 
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{
               RowBox[{"(", 
                RowBox[{"\[Alpha]bar", "-", "\[Alpha]\[Beta]sigma"}], ")"}], 
               "/", 
               RowBox[{"(", 
                RowBox[{
                 SuperscriptBox["\[Alpha]sigma", "2"], "-", 
                 "\[Alpha]\[Beta]sigma"}], ")"}]}], ")"}], 
             RowBox[{"-", "1"}]]}], "]"}]}], ",", "\[IndentingNewLine]", 
         RowBox[{"\[Theta]2", "\[Distributed]", 
          RowBox[{"GammaDistribution", "[", 
           RowBox[{
            RowBox[{
             SuperscriptBox[
              RowBox[{"(", 
               RowBox[{"\[Beta]bar", "-", "\[Alpha]\[Beta]sigma"}], ")"}], 
              "2"], "/", 
             RowBox[{"(", 
              RowBox[{
               SuperscriptBox["\[Beta]sigma", "2"], "-", 
               "\[Alpha]\[Beta]sigma"}], ")"}]}], ",", 
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{
               RowBox[{"(", 
                RowBox[{"\[Beta]bar", "-", "\[Alpha]\[Beta]sigma"}], ")"}], 
               "/", 
               RowBox[{"(", 
                RowBox[{
                 SuperscriptBox["\[Beta]sigma", "2"], "-", 
                 "\[Alpha]\[Beta]sigma"}], ")"}]}], ")"}], 
             RowBox[{"-", "1"}]]}], "]"}]}]}], "\[IndentingNewLine]", "}"}]}],
       "]"}]}], "]"}]}], ";"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"With", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"bp", "=", 
     RowBox[{"PDF", "[", 
      RowBox[{
       RowBox[{"SmoothKernelDistribution", "@", 
        RowBox[{"RandomVariate", "[", 
         RowBox[{
          RowBox[{"hyperPriorBP", "[", 
           RowBox[{"700.", ",", "500.", ",", "20.", ",", "20.", ",", "300."}],
            "]"}], ",", "500000"}], "]"}]}], ",", 
       RowBox[{"{", 
        RowBox[{"\[Alpha]", ",", "\[Beta]"}], "}"}]}], "]"}]}], "}"}], ",", 
   "\[IndentingNewLine]", 
   RowBox[{"Row", "[", 
    RowBox[{"{", "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{"ContourPlot", "[", 
       RowBox[{
        RowBox[{"PDF", "[", 
         RowBox[{
          RowBox[{"hyperPriorNormal", "[", 
           RowBox[{"700", ",", "500", ",", "20", ",", "20", ",", "300"}], 
           "]"}], ",", 
          RowBox[{"{", 
           RowBox[{"\[Alpha]", ",", "\[Beta]"}], "}"}]}], "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"\[Alpha]", ",", "650", ",", "750"}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{"\[Beta]", ",", "450", ",", "550"}], "}"}], ",", 
        RowBox[{"PlotRange", "\[Rule]", "All"}], ",", 
        RowBox[{"ImageSize", "\[Rule]", "400"}]}], "]"}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"ContourPlot", "[", 
       RowBox[{"bp", ",", 
        RowBox[{"{", 
         RowBox[{"\[Alpha]", ",", "650", ",", "750"}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{"\[Beta]", ",", "450", ",", "550"}], "}"}], ",", 
        RowBox[{"PlotRange", "\[Rule]", "All"}], ",", 
        RowBox[{"ImageSize", "\[Rule]", "400"}]}], "]"}]}], 
     "\[IndentingNewLine]", "}"}], "]"}]}], "\[IndentingNewLine]", 
  "]"}]], "Input"],

Cell[BoxData[
 TemplateBox[{GraphicsBox[
    GraphicsComplexBox[CompressedData["
1:eJxtXWVAFUsbxlZUDOzAALGwsFHxVVRU9KJiIXYXV0VFvHB2Vz27WIit2ImI
WAgY2F3Yid2JqNj5zQIPw+z57h/uw8zOzDPz5gRWGDimy5CsVlZWBXJZWek/
U//rZKbUn+WDaL5Du/kOMzjWYbujHMf53onz/clxW/2DemoGTkytwPFohu6E
c/znL/vvAcdz9Q5Kahm4ot5fF45j9OZmcdxG7+84x7f0/n5zPFLvr0FwBk79
OdaAGd9Kej/zOV9g8AUGX2DwBQZfYPAFBl9g8AUGX2DwBQZfYPAFBl9g8BUw
49teh9lNGXyBwRcYfIHBFxh8gcEXGHyBwRcYfIHBFxh8gcEXGHyBwVfAjO8Y
vZ4/5wsMvsDgCwy+wOALDL7A4AsMvsDgCwy+wOALDL7A4AsMvgJmfBfq/b7i
fIHBFxh8gcEXGHyBwRcYfIHBFxh8gcEXGHyBwRcYfIHBV8CM7169XR8pgy8w
+AKDLzD4AoMvMPgCgy8w+AKDLzD4AoMvMPgCgy8w+AqY8b2vf5fA+QKDLzD4
AoMvMPgCgy8w+AKDLzD4AoMvMPgCgy8w+AKDr4AZ32z6T5Iz+AKDLzD4AoMv
MPgCgy8w+AKDLzD4AoMvMPgCgy8w+AKDr4AZ3yp6P9GcLzD4AoMvMPgCgy8w
+AKDLzD4AoMvMPgCgy8w+AKDLzD4CpjxddRxYSWDLzD4AoMvMPgCgy8w+AKD
LzD4AoMvMPgCgy8w+AKDLzD4Cpjx3aO368H5AoMvMPgCgy8w+AKDLzD4AoMv
MPgCgy8w+AKDLzD4AoOvgBFvmBUx3jArYrxhVsR4w6yI8YZZEeMNsyLGG2ZF
jDfMihhvmBUx3jArYrxhVsR4w6yI8YZZEeMNM+crYMb3rv7dAc4XGHyBwRcY
fIHBFxh8gcEXGHyBwRcYfIHBFxh8gcEXGHwFzPj+q9f7wvkCgy8w+AKDLzD4
AoMvMPgCgy8w+AKDLzD4AoMvMPgCg6+AkR/VniLmRwyDLzD4Agv5EcNCfsSw
kB8xLORHDAv5EcNCfsSwkB8xLORHDAv5EcNCfsQw+AKnpg2jzWk8vXn+AByr
9+cVLJaP5Rjf79br2U7J+B4Y3xuxsf9UXD5ILC8fJJZnGj/aS12Pvua0ek3T
87MBwRkY5anyXGFKRjkwxmv8Hv3je2P/+F4oz5R/oj20b+wf7ek07txPt//n
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
xof5FuS1mUm8L+1vEvNNtt5CvryDY+E9an8uD8J9uoocC+83w7i8YD6h/8DC
e8crhnjUbGnvoD/AsA+QN8gL5lu4v+fF44FUeW7N5xv2KSisypObNjy+r7tl
kWeSnYmiDvucfriX5w+La5w/f+gjx+Gfii0PrW6ZH2y0MdfKOoXfFyv+avzu
69tMVPXupfBZOfj81q33ctJHR8v7whNfbM3b6Bf3r/+Gdgwcl0eirzMH1ilU
hM/3jv3ea0u35nj87fGl8703W7xP/dlJsgoeLNGqposd3+azfK+6Uutw4PRE
iabcPCzv78jL2zbybukeyHFK2yOnSw/i8U3n2EWPnq7m2PbkwDkf7ljmG0e1
q9GVn/P+bF67rLx3k/vbCPe+0S8/STQhbxuHRRGaxfvUavsD1jX3ybR/9vTx
6oOdeT6RON7lSZm2rL8Qmx3lb3L/0Tpf1R9PpmgW5499F11r2uCwTG/WHqvZ
/wr3J9u+NXspHeL+ZGi1+j1nvLfMN/Ltdm34tAzXx4Rzxafnz5Q/+OR9NXhs
V54PhDjOfpoSystHXqlbl0IUarlrlM3Cb5b3G7s239Cw3EmF4ntv/16zqkq1
KrtEnksKonGmffdWMHk7svPx4veDTbTUtuz1Z3FMfvf2TelzxUQPe47zCGDy
+fLHhPjGN030LLiP29BaKl0oEK+dv28i63u5rr9g81NyX4HIi7Vk6lpkctkn
8RrVO/f8W1gehSrrP9tp5Kn/PlChwGXmxs0PaiTrPyVmXy7WbrDhJ7MH+s94
hTxGvf/8Jq9K5Zf8OLvoSRAdDrro/HmGSus9Uw72dWXy62F6dnanmZbeePjm
5hITBf8M61q0lUpFu/QNtDtrog/jXhWeOU+lods620tr2fiqbm9WoJJKhb7W
3Vwtt0SnjvdsFTOdxYudczzzqyTR92nVq9ofVGnbROc8McUlcjzw99XG4yq1
imx38FY5ia5smtyv1gMzTf2+asjrBRLVvRlR6FBBlZ48uVKpyHqJkiOm+u3t
olLojJ3Th8+TaGDnYe0rqSqdW3dhYfuZEs1KzJ6ya4FKgWOaR+2fItHB3eW6
31fYeGPzPB+2SaKyvze2qXtEpaDxoVVzhUn00CUse6KHSgVy9+jS5pdE9tcd
+r31VKnjf3+veuSR6dDeUwunzVap8Q+PkKFZZer7y0+6WFOjNdu9bnUbJVPL
No1GBdXV6ESOGL8wk0z3qt1ZYztWo2jVyinGX6b4m1XfRn5m8/nt2a9V92R6
krXX3vN/VJo6e+yNb89lcmv7cHOF5hq9aP+l5NJbMk2o9DNfByeNzHMPe7n9
kcl6TL7oFaM1+rZQa/6e1S/UwxTSxlcjX/9/Ji15J9P5Kj3e0XaNypSpkfjm
rkynl31r/eyBRk69XOySX8pUo6e25tJDjUw5Bywr+lam2y2tivX6qaaNs7ZC
49ofKxfAxp9L78dJoUZNNsV7NNSooN5PDYU2lNpwsTrzzxH6T2bPW27YsLDC
Co1iZJ+svysq9PlGp6Pvl2k0KfvQLa+bKGQzp1jSRDY/qeMao9AWvd5AjVro
3/VWyF+vx+zRF/27XgqNjZlaqr5NMEUvLGBdZIJC2WuUDZ1UT6ODOo/VCrlO
q51g3UCjmjqPNWw8ZTW35PzBVOx7051nFypp38Voae1cUKiA/vtrGm3U6yXw
/Df2QYPr4Y+C6ECHhR9GneL5F+KpkPJOC369CqI2BRe3+xPD8+VdX+vVK2Zt
mR93G9Ku19ORJuqT/XrTFjMs39tE5ZtTMvJfE9k9GHzF6pJKtcsmnb692ERr
8uSaeYDFd06nI7z7nzNRZLRDDb/Phvya2cc2T9a1K7nXRD063rkSssryPO/L
xPJuyQ9NpGlrKxx+r9K04jk9N5zi+7H9rszolHzXRCdybnnR/JtKVfurL5Kq
SWR1rULL5GOW72XivKvsL8PyrR45T+Xr9pWXL79+dpP/RbPFfee43JGTp86X
yPmsS96Cw/n5WULgiH23PLk/xHyMXzixWPlO3D/alPz2c68LP2+L+FN62F5v
iaocavdjE5Of6Y0Snw+tzfqf4D1/MPO3GxL2xSVNlWi4zfLZbkyfrJc1PFqL
2YM2X6lUMSYv4wtJ564u4ed1MxKab1wSLtEvl7lrJ9Xm52nFB19z2sHsUwtb
myKBbyRaOsf/6Whm/1wPntmQpbxMu26suTZiCo9v57d6kWf1W8vzuGrdZhzd
yOzJAWePol9seHy07mKS9/csLJ/r79AhP7Mn8U/mzz7P9Cdqyui8O9ZJVCNs
ncMMV41OF+t4p8FniX44P7UbzvjWfHLmeUBRmV57Nss3Y6RGfh8311YKyOT9
tHnspqyG+xWM31af6y0alpDJ+VWriEk1efmxvNMqX7Fn9iy/m5sygPvfFCf/
suOZPev+N2TX3dG8ftEdR1P8u6kUkr/7RXmsTDkSSj9awuz55TINSgaPlOnK
0D53/Nl8NHwV7XBmpkx9ahcOz8nsd5vVd3Z9nMb8T0rrlKxtLN/X3Pav8/aI
o0zNPgXdqsHsRfLH/ftlO5mGjZtRegHT16MtGvj86SfTq+XVr3oy+3Hg7Yc3
5oWcX8c9azsWnyVTSdtuEVed+Hna9nz78v2ezHHrMr7j6/ZUyUta8MmT2dd9
uQ89ezWL8Xk3pZ4Ts39LPwwev/+sSp+HnG52idnHwbPCfZfvU8nHuXW7wr9l
irLy62DvxffXLhWL7zF9HseTU7JlXT+Qxx995tT0Gb/e8jyuvW4PjvL53qrH
dTkU6uLTtdTxvjw/bJMQ8zrPTo5vUlyOnmy+U+WkMo9PJsx3P1D6r0x+8SW+
9L/K6zf+3rXE4VMqvdHlpBqPT8K6HOzuxPgEv2o1rs1Py/O2SJ2nrUI5Tozp
Oz3U8rztRv0Tn5KL83y0tR43MnseHbBnbPswy/c1bY98kgqwfGny5L73m19U
09aZ2fd+X75NbMny0dR1Zfb9UfnlNf4mq2nrPoHHW3XNi1tXZv7npN5vD75f
0rRk/xoxTpbnadn1cXsqFPm9UUrkac1iPGP1uJPlY4P65wtpm+k9TZRuXyto
Yr52XCM7f1/br+MV6qbb17OW+4fd9d/PVKjS3MGLnArw8zWMf7AeV+5QaOPP
ascONuD7y9ifcdfjwj0K7U0eEZclb7DFe5h4/ffnWHvrbrb07cDza9jLP5vc
zPdzmWhvzNbKnfdYvt/cdloe6akyf7I6xW/3Q8v3LNUdIzttum2iTsHuobGO
lu9ZupecUPLHeL5ftyIuot70Znw/J2JZ3MbSByTauWHLsyYDuH0b2S3eroaT
5XmbedmI67aP+X6dz4exjxZGs3zx0947IzO9X0H7jZu/ePZvC5l2u+ad8j7T
fuuJBr0r+CmW521lZlywdfVm9vFtZA+nBZbvWfYdLlFqniuLt06FH9jTynL/
aYVNqN2oBN7e+CGLq71dyff3ghdv2NEnVKbNpQ+373mA67+XW3jfp/+pFvtT
2/R5qcD3nzrrdjAnX98mX7tppiRmD+1reU/YZ7l/9ULn4aVQ1S5F+z1NsXwP
c0G3Q525PN3oU+XA/LoKZXG6f6DgL8vztnB93CaFHK++Wfuhv+X7mM263kzn
+G911s5+hZJyHvun/hsz7T6eElDhaRDtCPaa755sphON3/zdy/IBn8eT9xeM
NtO9/NrKkd1N9HjF5793WT4woMAmh9C+Jnqy7sqKs3YqbVpUqF6bESa6ejZ3
qfWfzHS69cbGiw6YyPuZT+1rzD7vPru7f0QdiZxODP1ZaYJGxb9FbN3L/McY
edadj/9pVDHLq7allsn0NfDajbvMf5bT69VTaJ4ywSF/fi2tngvL92tfPONz
nMVv/Vct2J3bRFOHBJ48nEWlXOe+zJ4yzURDFya/eThCpZ7ld3UIlkz0qsXC
BtYBLB+3+XXHdM1EPf2KuM2fptJf/44X4+6YyGmud7jbXzMlVHlw84iXRNes
51ybtEal4yeWHX/z2UT/6v1Gq1RBH5+1RH5vll3IcYvZ9462n0t8N1GvjRVb
m5k9v3s7W+4ybSRql6jU6cHyi0dtHKOoh0RNcv1Jcq2m0rVpVXyLjJVoanz4
sDs1VDr8tIrmECzR44EdH392UWlz0TKbkw+z+Gh5O3Ph6yz+aNB2W9txUhr/
1ixe/1Ns97NnEr17myW7Dcvf49q3npn7iUQB9rbd14xi44nJMmgby09uhs/4
b3ZTlZ7eqL8yb202v6Udemxg/G81WJC7UjWZUip+q1bipUrvWr/vVrsT04+n
dyJ83DWqfGb018RuMlX19lfHT9OoVNWzAz95snzD9s/PD701ahu7b+LXFTLN
v/t2c7+uGvl7/FnRmeU7CwbHBSa9VtPayaVQ2ZXRZa1VZj9fP+le8BDT529Z
Ch9ZpFHRg6POfGblU1t5L3WYr1GP0jcn3/km08Ze9/YFsvgptR+Wj2+qJF+I
YPmRpvdTRKGQIkPq/Hihpo3LTaHqn8dVn15OS+untULXxoR77z+s0dJRBYuU
K6ak9cP4pPbbTaHVIW/2+zZl+Y/ebxclrV53Le07RaESAev2h81l+ZP+s5NC
5TbNiQlO0Gje1NYVB7H8v0b9r896n9OoZJ8ag+oPUGim/vuFGpXX67H8P/X3
a7W0erMUshtkbWXP8pkOAVG+e+YqaT8vaWm/Z/nJ3ZFL235g613hUdP2174G
UeT7OS/rD1Zpi93jmguLm+hk4OhCf71UiqFR7u7WJro31MumBFtPN2fvJxeH
mWjW5ur5z7J8ddCzwEGOo/l9weo+S8PkISb6Xnby7urbVOra3TnRZbiJEhfX
DHG4z+LxGn1KtYti+fuOha1OMHluFBm/9SrLF+aNtav0Ot5M8ddrz3vM5L1i
WNSHFylmOpAQXqb2N5b/fDxQx/aLmcp59Si1kOXr3QuMK372nJm6Pip7eVRb
iXqviV1vf8JMS77eqvinMo/ngwbmdHWzk2hlQNsqAwpqFBjUfuiWH8w+jO8y
veRzFp9qDcJdPCUa+yal+N1iGn1/oG75008ih1Nhtfc8YfJUxeW/NiclejDz
n5CTHhrR64HP/IZLVPNc1IkbFTVaOyJ8Qpd9ElWvXtK3LLM3n5t8/LfHXfb9
9Xs3XrH4t/KAqjNmMn15q/MvxvRH599Upv0pN3KUcbU87xtR9ca0Svclah89
f/PfwhqNXJ4YZZUo0aDKcUWdHjF/tXPBtU3NZMpasFmkVScmf1VLXHK/ItHu
N4+P3i2jUey486tCG8l09Ehih8ipGh23GbO92QOJvu1/GjWwp0Y9S/gkn68r
E9XJtrqCJ4+/c7uV9lo5jNnPFxsK1u0gk6trpV3dmqnU5MPcTkfXyNSuSNlm
9utZfDCn7oCx7szfJR/t9neMSo9vvKi1ZyvfD3OcfaLMk4YyLbvV7vVVtt7n
/xldvWdLmWI7+na32sri5cGVvP5ulCmp8cpxNk+5f60y4rLfnc1sfFfWPYtz
k+lFtYpVi7F4/feqG/4TmT2+XM/LpepKlfou9p619YRM5Sfu9Gs8QaWH+rrk
VehOo6EX3e+y+OTmCXXvXplCi+R7ab+Zta/PU0GFjl741f/+WO5Pr197Pv8x
0yfr4/nnRayXyWn21knPb6tp81RCoYHBu2+u2q6mzWNLhTbr+vFJo2663JVW
KKJf+953f2jU3LzgnZWTQvd1/TjP9FGXW2YfPPO3vPD2jEYB3a99rF+Px8du
+j5iC4U83hRxTSrI9/tHeY6Kd2H+5Y7Om8WvBfT5YOtdWP85QqExoY8Si2YP
pgqLhu22YfZmlL7vl8Dj0xyPtbbXCmlpvJj+p46D2c/Ucc1W6F99HMzfddTH
NUNJ4+GjpfGKUaiOzmO0Rut1XvuUtH6Y/Uzt9zj374f0eWTx8tLh3iObdVVp
gNfiA5vHmuiRU5G+Nv0s7x88mHDwls0kE1VY9mzLNyY/S6eum3Yi1kT9p0zX
CoWoVCqm94UFT0x05vnqKx4LLO8rhA1e02xvkoncbl/NXYPlG5M79ny38ZGJ
bm99vab0ecv3QYfcB9aJf2+ihbl8p8jHzNTm/N2Rd8tJ9M+Mag2v/8vy6w0l
fPOVl2hvkTdHCm/n58e2s6xq9mb+6KfzvNNzC0nUr+tkimL+b+ia1evfN2D5
fvX4Du+ZPenysfSs4b0kMhWLn7P3uOF+Duu/9oiNXwaNluj+uKSU/bk0CtnW
bkCJ1vy+bLI0r/m39hLl71XzxZk6TL6yFspvv0yiDi0uH3lcSqVW9c71+HBK
oo3jLm+YXYbbh7Crczfei1Lp/dqxt0Oms/F3kfb//sz8+dvKlxYze/T806bh
0jOVAiOuTVo0Q6L/Kq7ttL4S84+LJ5xfGCjRjrVdc3cvolG+pfn71FolUbnV
xeePzs7y/ZXB7bIezPSe6XyfjvvOSHQ85kRY/ZYa5Yk/0HdvDD8PnzQ5541H
eyS6vPaHu5nFKy7jAzy2/ZGo6veQ1vVYvnm5u3/Yw1wy1bt0sXOAD1uPiI9K
z+r8/O3hgpAOp+rL9L3u5M4va2u0an/3ZK+bbH7rNL3zp7xGh49cuuP4VaI9
VXwuju+jUcsylUpo7yValOftkhhmf2f1yhacvQizb1uKtqrfRCPnYjtqZmPt
NTuz/n5Ic8N9DzbeHQuHX+jD7NmUobuXN5yk0c1Xf9a715LJQ88bTZbvle6X
TFrqwrBr19fxZ80qJbzyvPyrPctPv9gO92D2ZsLGXwE/R8kU3XaYqcoOlXK3
f+k3cyjL7y8cc8iyWqXmrrUcbk+XKdd5bVvxUKYfbpsLRkXIFBbZ6tGVBarF
/Vj50bMC+fbL9Ctx1sl9TJ6X/1snx/bV/H1Rf6ecXv9ulul8rdrbggcz/9Mj
v7ypq0w3cvrtO8fyv5qbZwwtF8Ds93Z3271sPs71vB/TKlxO0xeWXwfo+jKO
85t+o2pQ4lqZHvZ/6bsgnq3XwIC430dk8uy75evmLSqlDPu47tIjmUrm7blk
SqJK5h7Vp4/8wvKTrVPcsp5V09YhLz9P7LfF6+mJQgrtOljTtexGlk+eqxdh
s0emjxsvl2gwR6Nmv999vPtMpkdbx5/5Poath//109VY/SXXWu0qwOxJKg+W
z6zZoh3yYvFbKk8HZj9v1Kuw5ZRGQ5eELzpaXaFV0qTJ75w1StHb/Uehe0NK
dc3F/F1qv0OYvT7plhhhpVGtvjn2BLJ4qr1Hl1vbcvH8A/Kt5The9JTG/EXY
vLOFmD8Y/W2+pLD845Ge14zn5yeYry3Vx7347wh/L1X6S0RSz2f8PsyN5eu8
t7jy/dAU9/DLTcJMZBN4zT8qmu+nOiU41HgUa6ZPXxPfXTzN8+s3nQd9X8Pi
n88RO4Mu2fP9y0M+PqPuMxxu1e5nDheJync6OmOTg0qTErqvt2vJ7/OP/zPT
73Yljt/kn3Pqj8bijY6Xo7o94PclftpffbkyH98/bDEk175SD81sPk88KrhE
oqIe2Wp1eWWmOTev9TzD9LuJ3Hrv2y68fkrOU4PkaRx/n5vScRCLD0uPmny4
QBiLTwoP+id3LxYv3Gk8KDmex19UqV9ux+USrZtfK/uCEB5vbM0WMqX2PJWm
dYqqHMn0OfG/wNt/F7P4YEWNxfMdZbL+3miF0pTvD51S9rWx9bV8v1Xq47hG
Wb5zfEKvV0OhXHedig/cxesXja7pFfmQY+eljk/NezT6sGMUHc+SaX9H/248
x7b6d2sUOr6vY5b7Odl65zrs8c/jIHqT7WGlyiz/nDNxedb9IWw9G7UdcLkF
80cd3GtLZ010sV7JXEP9Vep1M/+JxtNNlN9z4aEmkkrLLkY3/DLHRO3C7Us0
r8Tswbi5R9dlk2jnG+1xmewqbR/hbHOe+Y+EYbdLB+ZSqcyqKvKkIIlmPN9V
bcNypo8RdsfsJYncuoY+KiSrZJcwrFvb3Xw/ZV/imq+3n7J4q86rmDh9v9g6
T0erKzId3DLW7h0xvs5LI3efZvlYyQ7XfRw0OqD/3kqhlUkrdn4dotExh5Mr
Ch6X6U3Mr0tbb2g0tkr1TQ1OyTRAX18W76bWq6RQrPfdF4eXaTTu1O5VNV15
Pp+3xz/TarH4xS2s67b3fTV6sL2Zf08fVq7XkzTarX/XS6Fiv8ol3mL5SfPW
0X8qTFao0cJFXsvtNXqt97uY7399NFef4ZWgUPP1nXJeXqzRsLePq5U6o1B2
8/zcS5ez/Mn5zhW7swo11NvZy/I7vd0L/O+3eL6q0aDcTRM9jM7+rX1z/t7I
U9nwO2sflUy7427sZ/oXP3RL5wIDVGqxxmzreYafvw8efin5aYKJorKvjCk1
0vJ9U6s9q/fl3myimZv7tpofx8t3VD13v+s3Mzlfjr72XxWWX7j0Gx2c6f2S
V66jxadY8fjhbMfjJwJHq5RzUvPvV8rx+7t/zuwvOol9H/nW+VL4FMv3S83S
45mp8auDXrF4fsXy6bO+9pTIrsvsBjk7qbSqcLd/I/uw+oPvz2zS1fL9Uovb
Q9Z0nMbigfT6uG8RHNv0YfBslZIqvFh+0lFKW3cWf5/Q5aOeROqK+QH3Iy3f
Nz2aN3VewzbMXpxpE/4kkZe7Ds9+us9JPn74j4+2Z4Mm1JFI2xF+YcBHy/dQ
pt0nloeVZvGb86VVdxvw+/c2Np0uDj1g+f6pnfPnpetns3yn0563bZj/rrep
gkf8bW4fC5ZZsyrhh0SOYf+d76zx+2h1q9yw7cb8W9tcpbINWCeRx4ViHu2u
svz385fov1s5vxUjqx87c0iikP7eXgevW74XSLo3qW49Zk+Pvv+YK6ed5Xup
iX+CKXuIRJ2+rD/X3tny/VTI08dnvWT+fupU0qV8g0rJdMDR6euV2ioFR28q
1MuG+VP7nUv7NLJ8P1XQ68B0hySJlsV0+VnHn5d33L106s0CGn2NLR4ysSS/
T1G8dNn+LWrKVLfYtKq7i/D7hDEbKud+nkuzeG9lPXt9cs38LD6qFH/fvYrl
+6h1coccX7Lz+93n3YL7HHZg9kOPEzpbvrcqU2HPyqZZZRrYJPvrqKGW768a
2fs9D/0mUSXV7GhVVaMRg66M8PWWKU+hVs+H1OPtFdDvUfQ2/L1w9n3R0X67
GrXn5wvJq6IHNi0tUwuHss51/SzfZ0m1vo5pNZ7Fb1+WHWk9jN9/dr+5ofbs
gSodeJL4YnIoP195VfTEwIosvvvv0OlyQUP4/bM1x38W9fJWxft7TJ8P3Q0p
OTaY3+dNvO8+8JiJ30dpMNmp460wmfo/3+Z4bwNv73hiqwp7lqji339j9qeb
sutHnkAWv/nc+lpyj+X7r6TxvQte9uP+8eGTfgOcVZnuDFXrbmts+f7raVTL
SXfm8/l7dzLRxi1Spvv2O9YFbuH380L1eygXDX+P/IpGw6dPOdOaxbPqvb7b
ey9j9kLPI7Ly8xxZvxeUX6HDTbO9GbuC38fblad3vdgQfr4EfnEhc0p1t+L3
Ec1ZAg79/ChT3/b1XtR8bvk+LF/F6efPvZRpqNOYXhVtNSrYN9TR76tM3z5s
rx2WVbN4PxaTYD2sdwp/HzbEY2v2C3m4P1vquKxf9C8ev6K/VL/G/E+qn7NT
6O2Ev5fX31Rpqp5nNFTo02z/DmUf8vuDJk/vOqsS+PkVxuuqy6GzQieW/Gy4
7rvl+7DsuhxWVmi7Hjcz/Xmsj6MWy9ejm7iYvZi8tuo/rRjLx/vbJtTydtUs
3pM9Sq+f8T5xeYWJx6vz913RCbUG2LdTyFu/Z7TQ8PfI9fvxHX/miiWFRup+
N08wtdf9cHclze9aB6f5YZ9Mf69Al5NRCn3U46oWWlqcFcDPq6L0e1GyQt8D
fb8OY/Fsj2Xteh19w9+HdZ+ye+6RlCCqOPTf+u+YP6tcIDHr35wm+nDl8djp
s1QKOGszoT6Z6OSokVGDmfxUXZyz74Yu/L7C4+gXDUr0N9GpJs1L31vL3w+s
aLy/Uo9DKq1x+xyaWzbRc//hWp0Efh+9RN+ml1cnqeK/N8Hmv9nmng0n9Obx
lcuMr9XDnSUa+O5kvj3Z+P3wccn2Ox/94f7T4a5nH3MR7h+yV5rQuHUKiyfm
XfjR6SFvb2rsjJZjt0tU47D3b/Nvy/dli+N2JNdl+e/PxjWnD/9u+d5ssl2p
9ynH+PlXP9s9w0eyeHuPrjfE/c8Jq/0PTI35/UgprO3g021Z/FksS+89nfj5
lP+l3HPj88n0M88Q1309Ld+j5RrQceWxwSz/vvM44XxHy/dnrUctqbOurkw/
3sWXXDaLlzfxcBl61qTS11Yt17Y5x/zHX7fyUzXL92nL3rovWcTiVw+/cc82
y/z+7pBjI27b7rJ8/9C87rro1nH8vdrAdp4FzzP7nOfk5UlLTlq+Z5vU3v9A
6CWWPzcPzxp4lLefmjceZvnD7OCYzlNkmq7niSct37fVLFwrZcUQmSrMKZzP
jdnbvfo+RVmFFhS8+4/dEcv3bf11v+bI8ttCjVPc9/P7xvt1f/5NTcvTPRUK
6L423jcPfy80Ss9LfzGs56lMv6P0PDQL//s9ZWcsmXzhI79/nJonj9LS8uZg
lt+OWT7y6g7+Pu3I84q99n4xU7GPc9osCefv00YljxjutJDlq8Nnvdjwf96r
nRmS5/2iP/x9mmur7WpiCYm6XZtTQj1o+V6tTR6XEfW78vdfK75embCzHI+f
RpqKZX3E6hcYP2PX4//zfm3WJKnBPibP0/P9+t27j2rxni1b40of9l/n93eG
bG2x+epU3r7mu6flU0Wi8NhzJS7f5vroduxXkVB7y/dtviN8PNcx/frvR5PX
jb5bvncrciQ6PKi6TOtLdr5dsTTXn+nU8OG0Xhyv7RpV2uVfLu+XXgXdaLvF
8r1blqszHs/2l2m47mfa8fjin6r9qi92tXz/5r6h2sHTw5i83f1n2Lpgy/dw
FyL9m/W6xeKZAvm/fV/L5XnS6vCoFq8t38cNcT7ca/hthnW7P4P78yy6XxjF
76M76/cixvL7qgUb7PUu88zyfdwk/V5KRYWkQb7BFYpavpcrpp8DMzzvxJoF
Af/n/ZyPfo9lkEJ9fg70eNaNy39p3e8oHKdoe3rHRGlEJe9tbDNDIY/c5869
ijX8+xNMP1OWTCjhw7DL8cNPK9oZ/n6V/vc99XsUFxVatm1pbKKLRk371BkV
+5nHo5/23h4yh+WjAy555mtcjc93ReX+xCPO/Pwg1Mon/OxyzmfgzsVvw1dw
/1v7g/lZVL5gi7/n4fzB5PpxsEJ5Jruv97BVaVpC6xg/X/7+rdylYhfbTTLR
zvYj7UqX1yz+HtMj147e07rKFHCm7d/ibH3qNnSIU20VuqDfGw4z/PspDLvr
81pUoW76PeCc/P66qz6PZzT6rs/raP4+LSKibB3r30EZ9jX506Rr4/xMNMHv
g+eDl4a/H8r8Y9jV71HzbvDzq+LPCw870VymKVWaK25+hr/XxPyDon2vandK
prwTV154t8Xw78Ww/lRdr0rx+MdOl3t3Hr+E6nLE1vdL8xzd1D1mkjd4Na1V
zUR+SXd+B09SaUu7eYuLMFwn682wLiz+WvGz8/le25l9ez9myWErjXKOiP58
6qGJ7H+1uLmlnEZ/w9YscynK8t982oJezTSqcSyyjWMHiYavirz71lujQy9S
brVXJfobvT164ESN4nIFdY44LFHgOcccK0LZepQrf1n6I6X1F6HRcr0/xr+a
z+6Yz681ml3YIWtAboUO1bgx4CXDeQ//iPzvFJv/K1VXFb9upiTZOtL6QxDd
2NDWw5rhF4m7fxYYI1FuvV6uYDqufxep0MXfVYZuLa7SoOzb6m7U/z2jjp06
rmzP8t1v07b1OCTTw5TJozdOVWmEPu6SCn0oMHd4cxbvBOnj9OTvZ3YnVGrR
820Qmevd/jGI5ZN2Dx/UnML83ZIB3exth6rUokS+yrE/ZKp5K9glm69GNqGf
i+5j8e3dbAerdF2jktUuNg/1mbzp42H2NpU3k+9Unm21NN5svP8DPYXqFg==

     "], {{{
        EdgeForm[], 
        RGBColor[0.148, 0.33, 0.54], 
        GraphicsGroupBox[{
          PolygonBox[CompressedData["
1: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
G53cbvX4vd6DdYb5PeeZbT8iNv0f1cg/FA==
           "]], 
          PolygonBox[CompressedData["
1:eJwllF1Mz1EYx3+//uf8QkgXpjv7W6mEsYYbZi6Mq5iXmXfrZRli04oZF64t
m+nGFDOTbOIiGipptiTvM1NGal4moi29oMjnu+fi2e/5nO85v3POc57niecd
WLc/IQiCAsxhQz4IahgojAVBJgNJiUHQib87DIIr8AT4MVzF3F54NAqCSngj
nAT/gc/Aq5n/Av4LX4AL0VPg33AFvBKO4CxsGpyClaAl8P86/D/o+WghfB3O
4H/tcAS3wcfQu+E01sQ47yb0ctih30dvQW+De9CT4Dh6N/4arJ/5JXAfdw2Y
fxW9AjfO/ALGMtFr4WY4Gb0HfRbzH8At6MUKGHwPfyp6F/pxsbM1WqsxaR5r
xS9mrBMtBtfDuXApPAV+C5ex/iacCLfD5eif4DrOuwq+jP6I/cbhargUPRV9
EvNfw5vRq+AybGJoe2ivJtaMBhbjg6zNhE+jp2M7nP1T/9aadm8xUWxSsbXo
7xSP0P6RA2/3FqtGrccfwc7iz8Z2om9zFqsK7Cfad2dzs4jZJfZPdpYr5zjP
GOzhRfAp+Bf8HF4aWo4oV6qwGaytZ+yj7uYsd5RjyrUOeENoOaZce+ks95ST
ys1e7GjMcqAYvxQb1/7MKcN/yvzzOit2BN7qLFcUowHO3w83hZYT1egLvc3V
mXX2f4xd5N/5jHXB3+Afegu9l+7mLFfmSddaZ7mtmA7iL/aWC8vhJfi3sewE
2/MW/i5nua8YZ8G1kc0dwq7hf3AWm5msqYQbmTMfv5mxBvy93vy77LEH/05k
tRIypwF/0NvbqeaH8Qv43xhzT3CnYcXeWe3qjrqrxqTFGRvnm+PtLMvwQ2c5
qdzUm61HK/T29noDvcUWb2dVDebqLt7OohyfzNp01WDMYlDkrWZUO6rxFfAh
1kxHH2DPBd56hnqHYj7H2xl0FtVoNn6rs7urhlXLw87eQncccpaDykXl0Ctn
OaHc0B6HI2uKaXxOwiOR5bRyW2fsgHuc9Ub1JPWmGme1q56p3lnprFepRlWr
Gc56k3qaetsXZ7WmHqRe9N5ZLqnGVes3nPVa9Qj1CtWIakU18gztq7Peo56s
3qyerd6tHNjHWR86q3X1RPXGud5yU3fKxs9z9pbqueq9b5z1EvUs9a7PznqT
epJ6k2KgWKiGitD6InsL1dAT+D+NdtLy
           "]]}]}, {
        EdgeForm[], 
        RGBColor[0.5077424317966875, 0.48214590254835665`, 0.520592308464567], 
        GraphicsGroupBox[{
          PolygonBox[CompressedData["
1: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
odxL/A+7T4qC
           "]], 
          PolygonBox[CompressedData["
1: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
WDP0POS6if8LqAeoF/wPq6WoxQ==
           "]]}]}, {
        EdgeForm[], 
        RGBColor[0.767904053008969, 0.5735765042523533, 0.3676538474324272], 
        GraphicsGroupBox[{
          PolygonBox[CompressedData["
1:eJxFV3lsl0UQ/Y7dBcthRZSiAi3liEYsLWALylWMJhKDIgpiYgtURNDSBNBE
qCLGVlFKAIlRokDVcFrEEMVoIEI5akQEERQkUCCCJ4cYOcX3eEP8YzPzm29m
dnf2zfHLGT1xaHkSRVG3OIpS0FoXRe0geChEUV/IdmANgvySj6LT4MfjezHo
LqwMLO+l0wfyj2GzE3zwomdj+ZiN9QtWB9p42V4FWopVBX4dbHtgz9VYDr9X
JdqL+3aCTi3oWNDJ0BsAeYR9loOfAn6F1zfqlIA+hkt0hf3CSPc4mUhvJPTb
gx6HztAg+QOgJaA5WGvxrRr000T36wa9AvjI81rkb4GPpeAn4ns9bN8L2mst
5JvA74e8Ne8F/jD4duAv4ttW8BdA94A2h/4I0LnQuQb8fKd4bE4Uz0L6xkqw
buV9sW8COgy+sqCzwCmejOVH+HYMtCbW3ZJU+07Hyg40jKJ+sHNesWwK23Wx
bKi/Azo/0xe+j8O3fPC3gR9BDIDfB748lc5NtPGK6yiv9+I70e8L8HMR3yth
1wX8j+AzodMUtkdj+bqI33XQvwD6TSy+N+jtsElBN0B+H2z/hHwJZKWJ+Db4
9nKqWK0Bfy9oS6w68G9CbxTofNjOdoprZ/j4Cd+bJfp2D2hTrBWxZHtNvgV6
NxDnsO2X6PwfWFznWmz78x0ZwyC/9F9jOJptOn0gP8i7BPknX4Zv/0AvD3Qs
75IK/7ThnWcYzpcEvcdJJ+w0mm2h0/f1OFtL2LZI9caMAc/zBPg7g/TvAM0P
uld30O+Dzr8bNAt25+1e1fA5FPRV+GwEPW+x7ZnoLfmOo72wSsyO87pfF/C1
8PU55L+Df98J/0sNj39gvQS9NZbL3wZhhTxzstHrvge9coV+iKFnvGrDFO5j
Z+CdtxBnifbgW1Sbn4VB+cz6RIznmS/mP/N7M9/T7tYWdKThtjJW/jCPejJ3
vXBeDloSlCuf4PtzqWypfx3km+B/OuS/gp8D2Ua7d5bd9ynIM2AzAXS3E77m
emHz/lRvxLrGODA2RayVsc5BLNCWdytLlCfMkWmJzl1pOd3C5Mzj7FR7rExU
H1gnmqeyp04T4xnb5ThTL8iWGb7aG1arLY8ZzykW/wqccV/QXt2d4koMMLbM
myGp8iW1PVkHWZuK7C7bQItT4Xol/AwEn8LPK0Fnrg6qeawJzJ9FXnl8yKne
stay7rFXsI/wTNNhcyNsd0Gn3ituG72w3DYVnom7UnsLxp2x2cN3hqw/Vkmk
mtrf6irrPuPwCHSSRHrUYd4PTpUb1OW+GVYjW1refR0rl3nvers7+a9wzuHQ
aQD90KuHHHXKMfqrspqaWtx4XurzzHssHjxDOydZFuwOWO0qs5pI23OgHb3O
9Df2+izozC1g12D1irnCvbbZfjF0tpP36qusuVfyizjmfsQZMd/GahCx8iT0
34DtzfA/z2ok+TVWM0qtbvSyuCSGla2W14eD5JfY74LOl++UQw12TsZ5k8W/
KlVeM3aZ0P8S/NVB/Z9YYF0iRrZfyR+v95vBOAdhdKYTNmh7t8U1Mf/FXrSZ
Vy27XNO8en5Bqn05T3CumMQ6YPOMt1zulKrXcC7gGS6fJVFO8o3vStW/iw0b
xP8VfOTZu3f1eqN6p7rDd2K/fdvrnd8CPRSk/7hTfai2WNUEnWEW6OtYueBf
C6oVlfZ2zL8Z1k8XB91rEejDTvl+wHpyrt3lchwtf6d6xWw1dNYH1a62sFts
ecp8rfLKuZ3ESFBNuB58tld/zwF916nmvQN+AHSO4DwDg/of78X7HfbK+SOg
nawv7oJ8g+GDtXaCE7bOOGG2t+H2iPV97sG3ezRV7WbN48xH7C2zukcf33G2
gzzX6YwllssZTv3+RZyhl1ccOFc+7dSH/oWsMCgPi4JsaccaS5wRbwWc3Xhu
8K2C5h7WkRzwHYPwkRuEUeKwa9AcRsxUge9hM0pP88FZmW9wxqu+n/XqXewd
fL8HoXcK8mFB8zdzowA6k7z692TQbUEx6YjvmU5zzyzIWznNTHPAxzZ7JV51
orfVio2J8odnaOKE6VVWPwYYXiKzqfDKbeb4CvYNr1o2yGuWYr2o9cI6Mc95
5JxT3Tnv1Ef51p29flO+DPwJqz+cia4NOlNr0N+c6gtnEM6+7L+DmStOObAX
thXWv9jHjgb18mOgHZzm+zronAqqNX8FzeucRcZ45QZjPByyE0Gz5kmLN+/C
2aLQ8pm5zNlkv9XQBq9e0dfpvcqtd+9zyrOZ8BOnwiux+nxQ/6pknXPq3xPB
jzK90eH//07Pev1/4KxzOqj/8R2KnGZr5vNxw3tiuTzI/mPwTeZY/WCv/8Gr
TgzB96k2F04D/cJpbhgf9L+F91rg9Z+Es2Yx5GOC/leUgf4HYMClJA==
           "]], 
          PolygonBox[CompressedData["
1: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
pWpTth6Z/0CaS3+ODxk7MPXfWn88/fX+B0x8ZSw=
           "]]}]}, {
        EdgeForm[], 
        RGBColor[0.9204577754347045, 0.6711444385867614, 0.3534191038475841], 
        
        GraphicsGroupBox[{
          PolygonBox[CompressedData["
1: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
vHhP3vdK0N+OWLkf+rf6/Z825Y95/Br8/+YweSY=
           "]], 
          PolygonBox[CompressedData["
1:eJwtlW1ol2UUxp//87+f43xppqHltOZ6ET9V9sFWSdDmBMMsZtOsGTh7L1pg
VLp0ZTrxBazRtKLMLQqqrbQXsjQik6LSGakVVBZSWUT0oYJcGv2urv+HA9d1
n3M/93Ofc51z17W1N9+dZ1m2EUvY2Miyy1ioKmXZGPDTRZY1w88rZ9k3BFzE
2tfwFvzr4Q3wH+Gt8B54I/EJPhd+Cngbdq3isV7wE9jV4KWcdRq4G5sDr+X7
X7C/Ez4DPg//KPAovj+MbzXpe+BLk/9NvMB/E2ttxE+ALwF/wFo7/B5sL/gF
bCH4F+w59m6CzwYfxrr1LfbsBt/H+Q/Aj+N/GH4F5/8N7sduhP+FDeA/kXzW
KuwkuD78fd3nYvBg2HcUOwB+pbJ/E/5a4vsK56IT3gL+lJjrOHsi8S34lyff
7SBWjW+CckRsB7wG/DK2iP1/YC8RG8TU585RAV6LvwG+D1uDfx18JngQWwtf
EL7LXcT3wm+AH6/83+nE/q6awfuw6/G3hM9SfJ/yF9ZCO/FjiN1Q+f4SeDX+
B8Pnq34d4IdYm8Pew9g4+Mfhu3yPfQKeh7+mks/f+NYObDH7F3LGPvxlbCe8
Cb4d/CL+VtWX+H/YOyusL+mvCdyDf25ujW7Bv6KwnqWpleDXCutFd96Ofzj8
msz/OAJ8dnIuFLOf730Jrytbo9JqV1iruu/l0jP+I7nP3Kx8JPeG1qaHNS5t
NLNnD/z9MJZmpE1p4H8tsPYRvjuwH9i/BtudrFFp9Sv4aGJfDWtb/zwMXxe2
P3cNVGv1jHJ/Jd/bqVzj35s7B8rFOfBt+HvhB6XdZKyaq/b18NW5e0i9VE7u
Ba31E58rn/xLA2sl8Fvhs1Rzae9OeC++rdIMeEEybifmu7BmpJ1DrE0N51C5
1B0mwz8M50Ial9bVY9LGFHgbfBX+2SXf9xFwYzh/0sBMzS7lvOT8zlD/JJ+n
GfYefANWXfIM2AhuxcaXrLlF4CfDWtf5T4HHJf+f6v8u/MJwPVXvaeDFhf9N
NTursEalVfXkMvhjyXfVeZo9dYVrqxpMBm8On6U79IRnlGbVEWLG46+CXwL/
DJ4K94R6Yxn2E3h0uN6q76nhmaj5oT3LwSNYG1nyjBupXtfMgL8NT/AhYgbA
egT2FO5x3X8a3382vCafZuJ0fG+Gtaj5/gb4WHKsZtwAsSuS61PDWmf4TVBv
ToV3a5Zju5RL5Qff58mx0k8X+48mx6qeejvWV/pJPbiOvYfCs0kaOxffz/B/
c8/IY7pr4VmjN6hB+a/Me2lgLPGTCs/mIdZ2wC8I11ZnnA+uC89K3UF3uU0z
qOwZdSv4W9amlK0nvY2PV+6ntUfxn1F4tmlGnZk8UzVP/oTPx19VeLarJ9Wb
w8O5UE1UG72Zyq002pjcM+od3XE+/JnKe6w3d2vyzJEW9aZuAR+o7FfNB8En
CveqanwSfH9y7TVTNVt/LTxL1QNXJb+BegtVI9VKGpPW9Ea9nvxG6a0K+O3K
XVir+sbzyTlVbjU/NWv7k+8ufegt3ZW8N2G3sPfewtrWTFkKrg2/Xcr/SmLf
wTrKrsHN4Zmvs9TjQ8nf0LcUo9j/AG0HBkE=
           "]]}]}, {
        EdgeForm[], 
        RGBColor[
        0.9620171398456121, 0.7750428496140304, 0.48225313352139754`], 
        GraphicsGroupBox[{
          PolygonBox[CompressedData["
1:eJxFlV1o1mUYxv/v/+NJy4/KpWVz4Zmo1VnHrTmnpoGTzN6MROhj0QzBMd+V
BrohZTAXuq30JPpCKNRqJa7UAmGgaHVgHyqd6OzLDhMhot/VdUMHz3vf7/Vc
/+e5v5/5G1/s3JRnWfYZq2Bd4Gec9XIty65WWdaEXF5mWR+k58GH4HTw/3bh
KcvmsibYuxP5Mfw+8CPsvwD3Ys28tez9jJzDfgv6afjzkrnCdcfbfNMM/lhw
ewPfDdbFWZ3c2w5nJthdcE4Evhl5Kfke2aX/r7FWw28gR3LbLFtk00bkl/Af
Qb8D/qOsK2Cnwf7KbZPuvVVnwOlCP8T6qea7H4A3lb3dfLcnmbcX/SHWdPa/
wcc/wIZZO7j3PNjqmvduwDmFnJocI93VDP9J/v8Nf31yDNYW9v/DKmRpP8RR
Xt4H70Z+Bf9ZVgX/uYinfNjDva8il9Qch4ulfTjAdxPJ57eA/VNzLmTfPvCF
4MPIr5PjNQv+tMo+vIJckByH2yov6YNgW3Lfp7v6dU/E/Bqc/ehron72h21V
7vg/BbcVfXnk92RyzOfC70rOi/KjepSuMx9Pzs8K8Ot8uy/O3B7+3MP+ushl
HTkTG+rgb7A/if46eCv6Cvbq6B+A/ZDbJtmjGm+E/Y3SMbwpOa/K4d3ov7Df
lLs2ZsBpVz1UjoPO38C331auF9Xs1dx1Iv4tfH8c/ebkmB2PPE2Pmp6WHA/V
fWfUbXf0UTNnrQN/t3LtnwiOYtAXcRB2MvDt8Dr4bhtyRjLeV7o2G1GfB+Lb
oeiXvYErLx1Rt/Kpt7BfkhPho+IqXX6WybV9I2J2Kmpva/yfwv7R5FpSTV1G
36q8In+tfO/DcJ9JrqHx0jluijk0UNmmOezPTrZLPXcYvQ29QJ6F0wPnHHJl
6bj8hj6Z3DdnkA+Wju0V8FURi98r17piPRoxOx++F3F+b9ThhajFa+A70f9E
fhe5Vs414zS/ngB/qfRZUyrX4/XIkc4biH5pj9o7WHNOZZtm2KrCNXMouJuD
fyz3f52hep9X+Fv11vrC5+9Mxnck97zOuFQ6V8qZcjc7Zsg74J+Ujo/idCZi
dYT9XZVnw+dg55LPP4scKI3vili1Rr0pn5qNmrGS30dPDfBNC3v9yB9z7wlf
lMxZiJxV2ucv0EdZi9BHkJ+ylqGPRbzl88HoZ/kyiA3Dle8cBXsL3mJ4byb3
qM4Zq1mfjB5UvFsiblVyTBNySTKnDfl01OGxyPtIzN6l8fbpzVH8NEP+683c
947FvFDNq/b1Fm2J3HXE7FgWs0ffq9dUT/0x33qCrxypJ9YU5qjvdYfOb1TO
v2q/PXm+LEW+V/rtWYl+ON4XvcnKcXe8G/JjPN5x9Whb9Kn8lA3qv22RV9Wv
3hbNCO3JlnrMB83+eryJyk9P2DwSuVBOBmP2DnHOfZH7++OdaQpfPir/f+sW
J8/ie5H/AnC+B3g=
           "]], 
          PolygonBox[CompressedData["
1:eJwtlV2IlVUUhr9zzreXWjaKaT/jcaK7mrG6UggkG2Z0xp+EsdCcjESQMlIR
DH8QRWcOpAZNODrjD4pYiGJYlClaOinpgKZQqaUj3jRmpV7mTUTP23suFqx3
v2vvvfb63rW+pxcum720mGXZUizH7qQsW1nIsjmlLOuPLNsKfgs8C/wteExu
P7GpGW74kCy7AV5LzJdww4k5DbccOwc/DTwKrh08HX8La1PwD7K2GX8oa834
p1h7GH8yZ2yu7j8PvwbcV/SZj8A/FI7dhL0E9wL416JzVK5DsNmZ99TAPY41
ai/8Y/iz2NMDXo1dIbaetWv4w7AWcC18G+8ZCX4FvB2+HnyU/YfAdblrU4af
Cx4G/33Bb1gNtz85toGYXrhnw7npjgb8S9h8uF3ge6oPe0YXXHPV/ufk3N4l
5no4R+HtyofYmazdxd/IG8fA3Qd3lFzPDfhHsVbwAvga+EHwKvBC+An4c8O5
677POO81bDc4EfM23Ku5c1uDXWP/DHB3tV7K7TlifqnWW29rhP8QvAL7Af6s
zih5zx/gsVhX5jdfDn+zTdX4i3CtrN3BX8x5e8ABPgFuUj3BZWmg4DN01ovs
rxQdk4jdiI3j7H+JWQf3EzFH8EdgPyZ/w/+/JTGPwp/EOuEGscXhmql2dfCV
sCaFdWYHuDv3/t+xKeDe3LWUXiaGa6xat+tO/J7wtx+tb5ZbM9LDeNZ2hjWj
+r+OlXP3iLSuN+lt34Rz1Rv0FtVUtVJPqDfaks+WJrcR2xnOXf34Afwg/Bb8
aax9DfcneBv4AXYE/hhrbZx9FTuO/wZ2q+Aafw7/BLhf+mB/J3hv8re5rX6H
O5xbO9ozB9wU5pSTchuKtRTcg+pF3am7/9abif0ieVb8A34TfBn8ftGa/Uq9
EebUo+pV1VBnSyMtYc2oHtpzCf/j3LW/jj0DvzK3dtSTObg9fLd6bB7+2PAs
UA3KYc3pfer5vnANVUtpfHx4xglrZtXATUrWmnruHvwA9l7JM25q7pqr9po5
FWLHgS8UvUd7y9X6a60O/6Nw7vreA+yfGtaaclLtNQM0C9SPV8EHkmepeky9
pp6WHpWDctFM0GxYonmH/13YH8DOaP7m1q5m5vPhmSesGfFb+A7dJc3MJPaT
ZK1Kw5ptO8Jalob3wd/Mnbt6pAvuyXDvSUO1+H8lzy7NrE+JfSc8a9SDi8Iz
RvdpBmkWSXPSnmbK7eR/gPpDmn4Z7kK4d/XP0b+nN/ltqkEP/vpkbUuD6/Cf
CtdeNa+w/z8HY9X0
           "]]}]}, {
        EdgeForm[], 
        RGBColor[1., 0.8814448136208629, 0.621459025539118], 
        GraphicsGroupBox[{
          PolygonBox[CompressedData["
1:eJxNVDtoVFEQvfv2vlul2BdZjXENWPor7QS1icZVFB8YFTZo2mAiFpvYuZCA
jWvWgFrZRLA0NlYWgpCoYKOyhUk6I7qgtaXncI5gMczceTNnzp2Z+w5Mz12a
zUIIc5AqZLMSwnVIAalD7kA68P9B0Eqm8y7oGegpyJUk34sYwtWkuGvQ7yAP
Yf/IQ/gJmUXMW/ja8L1EoRrOq/BP4vwMulWRfzoIi5gD+MdhbyNmC7mfcV6A
/Rr2JOy7iB2L8s1DbuHciPLzOzkSnzwPIqcP+2gS/8u+w7Ek/B3o5Uw8ed8L
0PdxvhHEdd72oyi8x8SrijPvdBL+Ifg3cvWwnqmPzF2riBvx2sZhfcbNGLvm
GPZh3Xlfcs2gCexPvjt7wJp996oBHh/g3wfdzHQ31qOvb25H8K2E7x5wniK/
hO8MfLshG7D3QJ9OuhfvR97s1W3gj8L/HvZe6G4m+yK+n8V5AHsCulEVb/Ip
XZ9Yw5nu0jIeccljyTmdpPmwB5zZm6R8cmT/knOoW84tvJ/kxnkNPLPDni/n
/MS4q96BwvgnPKOP8N+sKv/BfzX+4dPHHehl2mHmckZdz47voOcYYhHzVFR/
ibGI+ku5dugVe5uL76Gk/WA8uXzP1ctF2N+SYhh7PFcv9yfx6ZlD3/vwlTsc
tS/n/bbq3lt+q3t3Ou7z76Sa5EP+3AvuB2tsuwesTb3se7HfzC1dvzA+3zN7
MhFVmxxGo3ay5b1d987X/ObJ7zliz0Vx4z263iPyYe+HPeM1/1+mbJd+11t+
p3yvxG96z9p+O8ThrDc9Q8ZyxrzTmN9Iw/vOd8he/ErqAfvNOdG3kyun8I7x
P7TinnBO5DySpIdc9y/MiptH
           "]], 
          PolygonBox[CompressedData["
1:eJwlkrsvQ2EYxt8e53yTqVWXtprYxO1vQFLVkhASt8HQXYnBZTPoSFwG/gCJ
f8JgcpswWMSmRBNmo9/jHZ5znud7L997+fpq63P1yMz6QQyKfPb4n3B4F8xK
6EP4NnhKzMbRB/Bb0Im9ErvvMfjE3hXcNpMya6CH0S/oefQQvAfcR55Tucvg
CL7WZvaGLQ8e0Fvgkfhu9GzKY3LwKv6n8F+wjO4FNfOYInw/+F0F8jWC5/zP
jX2C2BI5AzwL5hK/Q3epJ/WWRr8Sv4DOo8dAe8pr+MA2gr6Bp9Vj4hBXTuW+
AIuRz7CA76TqQa8SU4bnONswP7tWb/hn4FOgI/aaVJtqUC1nwWOV8zy4j3xV
g2q54mwn8pwZ9AB603zmg/CV4LPaxX8J/hN8NprZN/ySO+rYWvhU0a3EfbNg
WnfFzuXzha0S3Fc70+70JvQ2VMMzvJn47jWz0dhnqFmqR/WqN6K3oh1ql83g
u1HN7/A/NrhJYA==
           "]]}]}, {
        EdgeForm[], 
        RGBColor[1., 0.95, 0.75], 
        GraphicsGroupBox[{
          
          PolygonBox[{{1360, 113, 1051}, {1044, 113, 1360}, {1070, 113, 
           1044}, {1349, 113, 1359}, {1051, 113, 1298}, {1359, 113, 1070}, {
           1298, 113, 1362}, {1362, 113, 1349}}]}]}}, {{}, 
       TagBox[
        TooltipBox[{
          Directive[
           GrayLevel[0], 
           Opacity[0.5], 
           CapForm["Butt"]], 
          LineBox[{1359, 1070, 1044, 1360, 1051, 1298, 1362, 1349, 1359}]}, 
         "0.0006`"], Annotation[#, 0.0006, "Tooltip"]& ], 
       TagBox[
        TooltipBox[{
          Directive[
           GrayLevel[0], 
           Opacity[0.5], 
           CapForm["Butt"]], 
          LineBox[CompressedData["
1:eJwl0DlKg1EUhuEjxGxAcMgEKZ3KdIIDaCZt0jiULkDXIERwBWplo5DSzspC
sNBGMBosRLvECeIafC4WL+/5vnsu/P8t7+639kYiooWP0YjlTMQDL/IdL/GA
r7IRhzzB41jRP8p5cwElFLGgG/IvDtIdtHFkf47nMY1ZzKBqv88DVPCGNbvv
6Yzr3EDH3i1/c1Pf41f5hdflH77kLd0OttM9+VNf5y++T99p3jQX+ILPcao/
wbGuyjWc6W84p9swj/G1/Gx+Qheruqm0g8n0n5n/N/wDJrYrSQ==
           "]]}, 
         "0.0005`"], Annotation[#, 0.0005, "Tooltip"]& ], 
       TagBox[
        TooltipBox[{
          Directive[
           GrayLevel[0], 
           Opacity[0.5], 
           CapForm["Butt"]], 
          LineBox[CompressedData["
1:eJwl0rlLHGEAhvFP1F3vIBItFMTOSjshjU1WKw14F2oT8Gq0VBOisCKCW3if
CCKihSjsehAxpNDCRtFKbLS1CfkD0uU3WDw87/t+M8PATM3XsfbRrBBCEpM5
IcRjIUxwHheiAI36fW4ID3jEue0CJfIHLDtf4CWutZfKC/yi78ivvKivchM3
Y9ee4M9ok9d4HUfyNm9hz/U9fMLH9mPu1ivkXk7rp3KGq7gyej/7A/7KHfZn
7uQh2zAGcKUP8i8e4S6+46J4CGfym3yPjHv7uQ9f7E96K//hA26xf5TLsa8f
8rXtBmXyJjawHmXnDfYU13E9Vuy/o2fYEnIJp3geM/YkpmzVPMtz9p/yZfSu
8jSm8APfo2/G8eg5zr/pxdF1uLV90nPlGCb1NGdj3J7D/zg/9v4P/AfGVj80

           "]]}, "0.0004`"], Annotation[#, 0.0004, "Tooltip"]& ], 
       TagBox[
        TooltipBox[{
          Directive[
           GrayLevel[0], 
           Opacity[0.5], 
           CapForm["Butt"]], 
          LineBox[CompressedData["
1:eJwl0jtIFWAchvHPy/GSRCYIKpidchXKIQ8qDupQuQkWKgSaU5lBNnUhdTBS
BxXEqYsHGrwmSlsSZCUJLhW2JbjU1GWzNOj34fDwPN/7P4PnYLL7ZmtfRggh
jXPZIbxJhPAX+/iHA2QgE33ut7gft5GNPNsdTqBWp7iOj+eEUIR73oV8DLX6
btwwrD/63AN9n5P8kB/Zh/mkd0Ns3vae1F/i3XuEq3map+xn9Rlc0DWcwnNd
z3U473Pt8XvxPmZ1OZfwpvsHLOsVWxmX4pvtO67gKy657fBl/uHeq6/jtK60
fda/dYf+ye38iz/Fz8Tvo5NY0y/5FV9zO6G70B1/b9sBbuhWvureg1XvLT5l
69QVvMSL8e/UT93S3MZzPG9/rzfQptOYwTPsxt/SPsWN/IQf21/rUt2ii3iC
xzFmH0Wz7aJ3Ex+NRiMKUOw+YB/Sg3yE85GrX7i902+xjpRtlxfsWboKe95/
sJM4/B/8D/SmUgU=
           "]]}, "0.0003`"], 
        Annotation[#, 0.0003, "Tooltip"]& ], 
       TagBox[
        TooltipBox[{
          Directive[
           GrayLevel[0], 
           Opacity[0.5], 
           CapForm["Butt"]], 
          LineBox[CompressedData["
1:eJwl011MzXEcx/FfObpos7Uxd5ZCbYZIZrHIjRvzULpwVzKN0NGIC4s8bJoV
M26wmTB52LSaGTfMQxfu1DxNN8hVbPI0ruT1XRfvvb+fz+97zv+c384paszW
tuSklAbRlEnpU15K23mUJ/gO38Yt7JL/YgFyUTE1pWXYb07O93EOT9Hl8ih/
xgtUOevQveLj8glU45hcqj/D8/g0l3CBs288Ip+KHt04J1fzGlRhNVZhg/1x
/o6zOB+7uGJ/M9dhE2pRgy32f/BPXEZP7OKu/a3ciHrclxt4lv1f/EW+yl/5
Gj/gbc6GY5efyNl4fx6R98Z3wGK5lYt1v3lc7o3Pyzt1O1AS351L8dz82vkb
vMUS+SnGzM/iruzMRRPq0YBH+nv80s4QCs2zdWV4b36Hjeb1znq5T77BdXyJ
1+mv8814vnkQM+IMF3EBK3SV6LK3lCviruPZPFO31lzA3dyFTv1JHNEV8xx0
6h/yNN1Kcz4f5Q4c1rejVTc9no9D+n4eQJ75IA6gLe7X3gQ3cznvjnvmPfyP
l/Nj/ogPyMRvNV6HLFri7nWLeCHKMF/+k5n8P/wHl7NmJQ==
           "]]}, "0.0002`"], 
        Annotation[#, 0.0002, "Tooltip"]& ], 
       TagBox[
        TooltipBox[{
          Directive[
           GrayLevel[0], 
           Opacity[0.5], 
           CapForm["Butt"]], 
          LineBox[CompressedData["
1:eJwl00lsjGEcx/FndGaqisaJaxOiVQfUEgkRNwexJg7UVqSppU26KXFzciCu
aOOCEOGCVNVSB1TtaSQdodpY0lIkpVN7fZ44fPP9/f7/933yzsw7heXVa6oS
IYQujMkNYVsyhK/4hq14lQqhlG9wTTqEPNcU67XyDLOP/ECv44c806wEQR4x
q+C5uGlWrzegEXsxy2yQH9nv48e8nyt5tl2Kv+tPuBpP8UNP80L7PP6pP+MD
6MIvPZ8X2xfwb/05H0I3/uiTeJn9ZP6r9/AxvMaoPoXX2h/nZv0tn+A33MTr
7VbwSgzKq8wzvJr7EXxHhbzRbBM+y6dc+4lP8w6zAd6DKvShFxvsh+zucFG8
l+8j6bwOnoPpSOidvAXFrsu4d4Q3x9+NsxhGkb6br6MN1zBktot34q5c4Kx7
8Vnx0qws/v7c7cxpcoXciqtowRezM3atvF2/xROd0c4t+ICx+gCX2V/mCfoV
Po/3yNXf8Tr7s5yvn+OT6ENa7+Xl9k08Tm/mo3iBlJ7hpfYHearnOcxH4meU
27BEHm92Kb6fcic6sMisATnOqOf5Zgviuy038gXXX0SpnDArwW25HfPknvjM
9ll5OH4HyOqjOd4luTz5/3/0D/GgeKA=
           "]]}, "0.0001`"], 
        Annotation[#, 0.0001, "Tooltip"]& ], {}, {}}}], {
    DisplayFunction -> Identity, AspectRatio -> 1, DisplayFunction :> 
     Identity, Frame -> True, 
     FrameTicks -> {{Automatic, Automatic}, {Automatic, Automatic}}, 
     GridLinesStyle -> Directive[
       GrayLevel[0.5, 0.4]], ImageSize -> 400, 
     Method -> {"DefaultBoundaryStyle" -> Automatic}, PlotRange -> {All, All},
      PlotRangeClipping -> True, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.02], 
        Scaled[0.02]}}, Ticks -> {Automatic, Automatic}}],GraphicsBox[
    GraphicsComplexBox[CompressedData["
1:eJxtXXVAFcvbVsBAMbGvQdgBBrbiKxgY2KjYLaLYCghn96BnFzuwAwMVxQSk
DCzAQgkbQexWsBPlm8OPh2H3fPcf7nNndneembdn5lzLCbMGTTYqUqTIr+JF
iuj/5v0zQEd5fy18KaBur4C6yzjWw14XOY7ySI/y+MOxk/4BO6kAP8jrwPEM
htKDOf6Xy/55xPFa/QeqywXYSv+9QRxH6F+3guMe+u/Fc3xf/72/HLvrv9fG
vwDn/Z2twoxvPf13AjhfYPAFBl9g8AUGX2DwBQZfYPAFBl9g8AUGX2DwBQZf
YPBVYMa3tx6aaAr4AoMvMPgCgy8w+AKDLzD4AoMvMPgCgy8w+AKDLzD4AoOv
AjO+s/T9FnK+wOALDL7A4AsMvsDgCwy+wOALDL7A4AsMvsDgCwy+wOCrwIzv
Bv1333C+wOALDL7A4AsMvsDgCwy+wOALDL7A4AsMvsDgCwy+wOCrwIzvSf17
RwoFfIHBFxh8gcEXGHyBwRcYfIHBFxh8gcEXGHyBwRcYfIHBV4EZ30z9czc4
X2DwBQZfYPAFBl9g8AUGX2DwBQZfYPAFBl9g8AUGX2DwVWDG11j/l8QCvsDg
Cwy+wOALDL7A4AsMvsDgCwy+wOALDL7A4AsMvsDgq8CMb0P9d8I5X2DwBQZf
YPAFBl9g8AUGX2DwBQZfYPAFBl9g8AUGX2DwVWDGt74eV9QW8AUGX2DwBQZf
YPAFBl9g8AUGX2DwBQZfYPAFBl9g8AUGXwVmfGP07+3D+QKDLzD4AoMvMPgC
gy8w+AKDLzD4AoMvMPgCgy8w+AKDrwIj3tBplfGGTquMN3RaZbyh0yrjDZ1W
GW/otMp4Q6dVxhs6rTLe0GmV8YZOq4w3dFplvKHTKuMNnVYZb+g4XwVmfDP0
z8VyvsDgCwy+wOALDL7A4AsMvsDgCwy+wOALDL7A4AsMvsDgq8CM70x9v++c
LzD4AoMvMPgCgy8w+AKDLzD4AoMvMPgCgy8w+AKDLzD4KjDyo+Z+yvyIYfAF
Bl9gRX7EsCI/YliRHzGsyI8YVuRHDCvyI4YV+RHDivyIYUV+xLAiP2IYfIHz
0oYZuv/xdOX5A3Ck/nuD/ZXtsznG89H6fuZ+Bc8D43k1Vn8/D1v4KtstfJXt
hcaP9+Wtxxjd//p1ys/PxvsXYLTnybOlX0E7MMarfh7fx/Pq7+N5RXuh/BPv
w/vV38f79DTSM/Ptf6Iv6cUht6pUgPXNUfvzn++sKegPjP7A1voPL+cYz+fl
/qH8eWA8D7xOT2ggx3ifun+ev7MSCvoDoz9w3nrGcYzv99XPzwah4H3AeB8w
3geM96n7z9a/t7hIPfX/PYfj6fq/M2XapO/nLVKafj5ay3RK/553vB34r348
Bzheo3/uCcd4f14+ZqMteB8w3geM96n7F9XPpxvvD4z+wPg+sKV+Pmr4F2C8
b72+3x7+PDCeB8bz6v559YMHvD+wIj5h8oj1Q/6N+Uc7MORP4Q8LyaM6/1bL
szofRzvej3bIA9qBIa/4HuQPfNT6gHaMRy3v6nwZ7bDnan1Bf8gL2jE+dTu+
r4iHC41XrT/IFzE+dX6r1k91vot2RbxcSF/RH/KFdowX+od2YIwP+of5VOs7
2jE+dX6q1n/0x3jRDn8JjPHhfdAv9XjV9gEY860ePzDGD3uC+VbzQTvmE+3g
o24HBh+1PUM74gG0gw/aoc9qfsg/0Y7+4KfmAww+sH9YH7SDD9qxPmp+aAc/
tIMf2sFPba/V+SnawQ/tsF/q+VC3q/NnNT9g8IP9Bj+0gx/awU/tL9T5ptr/
oB3jBcZ48X5FPbLQeIAxHvgHRX2StWM8aFfUKwv5J3W+qPZv6vwR7fAvwBg/
+qNdnb+qxwuM8cJfYbxq/4l2jEftT5G/4fvq/FH9fmDwB8b34B8Rb6v9rTof
Q39Fff+BKt8v5D/V9Xa1f4P/g3+DP4H9Vddv4X8wn+p6rtq+q+0/MN4P+wp7
CAx9UdcP1fZXbZ/V74O9wnyo63lqe4p2zA8w+ADj++r6Ht4HeVF/H/YC3wPG
94DxPXX9TG0vod+K+LiQvqvboS94v7peo9ZvyDfmV40V9YsPuv/py+v8fCUi
P94YkR+/1ZcKMPr30f/Ldd4OnGdOx+avj31+PLVFoo36jmH5/r1Uvv2zzre/
qRI90v/dKBb0z5NXk3z91OTvF3TO18+o/PlZmK9f2fn25Xi+PqXo/qePlvnx
mmn+fK3n4wPO0w8fPn70V4//of6/F8uPNyI5xvjV7Xge85PHxyufvwOfDzyv
bm+gf+6tUDBeYLRj/jCfaM+Tt3H5+jZKLJg/YLRjvvPmr4FMc/TvSeL9gfPk
a6tcsB5585+VL18W2oLvA6Md64X3A+P76I/3K56P4jhvfRzz5dWVP6/GkIe8
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
lai/U5T302CBtt5pdXfUEIk6Nu9/wXK1QI9vefxaeVai7wm5cYN3CtRBPjL7
hZNEF3dqGo/+LtBIr14ZD/ux+LlVVJpbaZF6l89Y0eefRO6Per52MxbJbW/a
77UeMq2NWH1kzUKRvpdY/3Yts9/axLVbTjL/U/W/fZZ/mL1v18bJ8XuySJ0n
7K/7aLxMpZuLdU8YaSmu57SyJ5i+2GaW3FYiU6R6kU/Kz3kq0+q+h07efi1S
TNP76a+/SfR4gXuRlg215LPJ62tr9v2O9yZcbNtMS888OyetdpBpco1Xi4yt
tPRm7r03Vs2ZPXHc9Gm9h5bmRnh23GXmT6EbarwJWaClFudyz8XZydSxZvTR
qkFa8jvb84tFJFvf5b1bNLzB82e/mbv7JD7zpXnrgg+eS+L5DOKhSOmzW9pH
X3r+dPbmezGG97+eLar2cvIUvl877G5wi1LTNbTfNHWWe4xEllcqrS5+SUO/
3ruePf2Z59uwv85/ug6tepXbT4f1VHrRCQ2dG53413Ov4f5b199mDT5maKiS
Uckk8atEUy3af697nteXB7bO7NT9NvMPv8ZPLvNbosE+Vd8PaiDQRE/7Bz6F
7rdMnFglze07x5af7He/def7V+eaje0TOoDn++BnY9731/ZhHFe/P+9smdm8
3jazTFqN2+34/pdpK7eEKcMFCrLfpg1qwfLj9u0fzGksUNzvzxP2FpNpyAX/
yrMXM/lbJ5ZZxPhYb5h5/uI+gXp+7Fe6g/6+SJ0Jb1Zs5PtnXb8d2ZVzSKAX
8bVvzbDl9ZXJEz9aTmf6tL/S3UbFsgS6+7nUqEFrJSq9NOHfld8C7ZrfskWR
d4b7YZLjvAd7mb4E1I/xXFuOxw/JdftvtHrC4zHkry+lei4bwwV6k/vw7253
mQb0utuwRKBAPmNmb+tpL1PTlWHZJ78JlJoUaBzRlOnH4aG1nlQTqfrjCe9S
pstkfnPM3I9mIrU7YzPM7i+/75J2UFsrsQmPXzNbje7qVUeie2dWl7Nz5/G+
0z1vqzIlRfpaIiFsVKH7L19TS0b7DJYo5epVp4XzRRpUbKXNrwCJ2h1xEeKn
iuRz0avLEWa/XrTwHTVmuUjLIzf1OHpRog8bbs7dv0gks6WPMrfV5fng/pbl
7I5257jPptjSXRmfsMkhLcqvFMnuzOxrtXex+GvinfuBjN8gt3GtU7bJ9G7w
0ga69Tx/Mbf6eWpJoEh+FRo7Z9Tl+2dvvc1+hXlzrP3ZdORfZq8yEszrnXnG
66XfDnRznBcgknUx2zNG23n/W2WqdGnB7GWNH0/fdX4lUuLtQ9tqMP1wH3ro
2jWWL13JdNUcvMHisxWZjX7eFSm7RYOhMack6vHC0et+DvPX1u+3ryopU+M+
fSt43hJpjV+nCS2zWf/LLherGHP/KcRGjF+3QqQqDcZf2+LM6/1N5nezr2TD
/XutvpqD6wN4+3iXbmcC9hru100e1OJXkXiRZjZyEDbeMrwP03vs3vJjzVg8
IAW+6jCc538H4laYdg7luMXSzJsWqyUav8P9nHETHi9c94uRl38SSRiw+sDl
dN6/d+Dyj0MuS/TgcAm7r435fkF/08dVzUuzePWyXUn/QvdjMP/mYUOmDySW
b3SY1ehMgOH9l+kvbbdv7aSlsH9dx85g811s1tZhRcfweKOKReieKqy92J2B
wheWnznG3ry2cwHPH26kdHvdvFehevL82PWZrH+nmPrmjQIM63vaoB/dJRbP
GA9u9q9ogmwwnkddut++766ljae3OvXI4PlviQNZo2Lqy8p8J57FFzEmMw4y
nFSy3dusQvdXuo8wDim/07DeF+Wx8qqHn5bGJBe/n2DG9w8L6h37+u9sdkxL
Xu0+WW0o5m9wP8VGbmJ7J4HXHzR35q7c8o//nlWlSwdeZA/VUOu+Lp18Yw3v
WxY9PfrlYo2GfHvnzn3y2vB+ycPhs/fdvK6hxJ1DAns04/nTg9TcVs2zDfcb
M18m+wTM5fWx8mL7M9YteT3b/vytgMGXBfJ/XLnik6WG903GLTSycXgo0PnX
ti82T+H2s+T8rJZGTQ33E2t1eWBT5Rmvf43vEdxl/X6BdtaZMW57OR6f4/tx
Y4QNd1xE6qkZOWyzn+F+YNl6NgFOQ/h+YMXaFlVibJg9zNof+2WL4f2Sa5kr
+nVtzuzFQdFscWfD+lDxX42//E3n71+ZNJNWMPslhPZrsSnKcD/xa5TfcpvL
fP8wo+QIl2fXeH2tjdTlgu1iFj81r+329AK3Dzv2bV4jzDOsP2XOsJsS3IDX
l/yKrG7xx0RL9at/sDCJMqxHbWjcyM5zqJZq7vLyO/Pd8L7KXKH8iSX9uXyO
+muXe6y1lk7+13j99T+G+4fmSdt6dBS5vpW/FmfWazHHwfV2BWw7rSXXnw2e
J7zX0doDsXsdXvnS94ZlnDd/0FH7H57LazCcuWL5lr+ROprWQvPFmcnz2Up2
n8tYSfQ5rN+ycxM0FBQSERbC4qHGS51LLb2goQ8LqrXKZfYu813zKf9aCFTk
V93AByvYenzu1SFys0AvyxslHTaT6ZJR9+/X6zB/1toxyipVoh0nL9Z7tEmk
rIm6ZdIWiUbZ7D5nxubrklGNbW6hMi1eU+p4I1+mb/NGzJ59WUfWryIePy6r
oQlZwU19cnV0OcPZ9bugoSyqVWHfdIl6Xh5mVNRHQymjo+uMXCTRgbuRphnJ
TJ8eG70cIkr0fHDjyp1uaWjmkO5N+vzTUa/dJZLCXQRy6/t8gm0QG49D1gHf
zxrSFXMqOT2C5c9e0y87mgj0LmjJx9GREjU49bN2t2ICnW31q7n/A4kqxw5t
XuWrhoo/HZJ7PVwiadyu9csdBZpQu39KGIvXKyVffPNtoEADq7962YzlVwfH
DvVpw/Q1aEFkSi6LF3KH9xjusUSgy6MWH/HuwOyfZXil1xcEOuLqktOC5Utj
TjU/azpHoBOzEmz3d2P5lcWC3ZEvBfqzImH9iYkSBZqddY99wt7vHXnt3gzW
f1yPvrWKifShhmD5H3vfyay+/bPsROpm5pd+soJMnq/+Oq3MEMijYbdHQyfK
lDv5RU3TYSK1qba4Swcds9+Hw7Om9BPpX2jE0Q/DmP55O1csckCkw4PGrNzc
kK1HhbCL/tdF2mT3avwGZo+POu+qujpFpD3t91aIWixT/zCjWTFxDNtR0vJ1
MrVf3KxMU+YP493MVmxg/uHBxM5jTzP/9Lyl1Se/9xItPbjB15XlA9HPSy5P
rcTGs/Rm0x1VmL21sZZCmX1s0CWmRayDli6cK3VoqbVM/jer7zLtqqXqt1bc
fsni0V/Lfh0P7KmlCiGpEf1dZaqs/8vy7e0mHVOfrJepzONP9rE1tBTjE71/
IfNH7jceCDeZfl73m3Qu8KxMu10HHevM8vHFxyIOx7H4YHjJk7ZfmL6FBFc7
mDRcpi6J4zt8Yf4q+tzBT3fdZJqx7E3LuQxvOdhP95N973ZLtzdPmXy+cR90
7geLD69Ynt92jPkX42aTG52/ItOCkjU3b2fvq/LplfCF2ZMWezpd2zlVS7de
GI/WrZJpWinn7IMsf29vPHm9Tyl/Opz5X9Fh61j/rl5iaEl/GrLNPqvxJi2d
vl4pp/pNmQZ+Gr3aPpHhCe9ext6W6bhXolzrmpZ2hx+W1zJ7uG1glaSNn31p
V7JNyPO+Ek15nb2wYg7Lj15XzQqZyuJ92xTrI+U19Hr+u3I5rL9tlUaPS0zS
kGRSrHurXiz/2W5z6+cUfv6wzt/qSfWYvm+bnHTDk8UvFS77Hw2ayPIj+4fu
lW5JZDUmZ3P4Wpb/FytSfMd1iWJLFzFrt0xD6yscSthyiOUzM14eXxStofZ3
Glo+O6Wj6WY1t378oaFHN3Ze7PFFRw6TLi6a+0tDJ2yC3Ep905FFYp2liysL
lCL/1t66pqPxn0v9G96b5cNl90zcy/KfCrePB/0tdD4vxuPgpLtVmTy3uVQ+
otD9srqR0cXLMnmaYTwjZOAXDQ394WBd5JVEJUWX2R7OAk3xaPW2TDWZymYU
L7F9tEDtvwf2WPlYomnXWvTbeV2g+MH7jGv0Y+s3PPpn4kSBTGq0S3tjJdO3
xDXOTU8J1LmyZS37TzpKnfq0bJWnTJ+rVa8XXUuiuq931auXJtDQYlEnN5Vk
+XlK799H64m0QVe/+HMjiZqaOptdqSzS6OyeRus6G+4H7phYO3j0Y4G2/Ktc
erqXRP6zj+/e3Jg9f+n1uE4DZfp9+vyElGSBSp8I8+ksM3lqemFg1fsCGW96
+XY309euU4bNG9Ca5Su6ER5rnXl+MTzj4qQrUyQqEenyIcNZJPGWUGlVe2Yf
Lj1cNfigSI+n6eq7H5Dov2eTVj+1F6lu4y2Lw2eyeHpC57sDQ0XyPfrrjx9b
T6t9Uk3nniJFLJkb8PUE8+e3U50+jxHp8hq7I0eOSTTn8aYDwUEirUrp0s66
iOH9nJpmP+2m/ifS1JwZg6+x+XcZEKOJYPHA3mcbd8x4yubDb8q7WUdFskoK
aTOc5S/G31PSn7iKFNo2wDHVSabwor1S7KaweGHjuTXdbWVqVKLNqin7Rfr4
2uFEv5GG5/EtSrp/8e3P4vlQy0fromVKiit2u8gIkS5l1g+3OiPThljnSd3d
RFo0377X2kCZrFqWi57G4gXPpPn9b1+QDM4Hxfd92ffgeJEmSqdrP/Fl/iWl
S/PqN0TaKDc5m7OD5XufDy4pfkmk0xXntguZLVH3D6suDy3H41unxe7/3Tsk
UsJui2g3Nt83ljRMP11BSz5vn/RswfLXNb/MrPzvidR/09Fdb95INHpbm++U
y/KzgAGekwv9Hot4dO65jkkyRVb83vb7Tpafmfxo+n2Z4X2dvvvPTu7I3l/B
+88LieUT5imb7OOYfT2VfeZqtaMs33K9M6J5dx4/lD5wPti5qZbSIzss77ye
1zNnhK09l/FVpoB+s8j6Py11MV54PPa3THcbnOv6lOUvFUIfz2/E7N2H/nVW
3GX2uOXzWPk/Ft+PbDbg8CRbLcVV3rhpf2mWr/uuCX8/XEs27caMdi0h007z
yol2LP7p5Vlv+FbG11n/dw6z17cmN2hs7E/3Bzxz/83G1/1KiO2VK7w+avbE
6rp7ebaed3qX67tKS3N21fgVukymVeNeFO/P7OmXLlU3zmTyUPr8a/d1EVo6
Zy508GH2uXm23cGhp1j+kFp9YC2mP70H23YtEaelwMqtDl0/wONTMflEpfOz
VL8H6CNR++f1Tn6+xuPHoRuTxda+Ig0bELx7WorhfZ9KVtqO9d6zePFtp17e
he7npnoHV0h0kehj85yZqz34+e4m56sNd5mjoQsdy9+J3s/scRfnFj3DNXTu
m3NfgeWLoxJTHU495udfWvv+7nHsNYt/Eo+VvnVVImu3oNeuGXw/rvSz7Sbe
rN1qul/rmcx+Ni4WYZRrKZDvycR/P1m++tTx7sN4hscGBpxc/1aiSWU9wizL
CDTkhNi83T2JfJ4GxN1vJdCkyhdMB8az79cuX+GAK8sv2g7LPpigOg/Gvlfm
ZcqmqdMFahb36GhlU5mySk/+MMWBn1d+W9a96fPuAlXbFn6oRguJjiwuKftt
F2jNvasrGlaX6GyJB3GTEwWaeuKVx/Pq3D4OTHeo1JXZH78As5xLq1h8Jbk4
eLN4ebG/d/yuqQIZSQ7rbj+XqNvSXfXfLBeo2PEJXWJZfDJO8ylrnLdAYfWb
VNzF/EGp1eN6BQYKtOhw5pBZxjJ5637F5Zzj47vqlTn+MPvezMm2UxwdmX65
vk0IDOf72cMXbH/pFCHQsu4jr3nk6Ohqk+ge6SYs35lpPk3U/77x9OmDepcQ
qejejLrvXdl6GKc9mG3D9ys9Q0ZbzuwoUqklu4IimsvkU7uU8+l7LJ50LFKy
dh0WvwQ6LX79W6DTTbYFpo2RqXOVAz6nPgiUUXO++co+MuW0+rLGpZJIn6rY
rp7YnsUfXTTbgtuJtDL77G3rTqr7Q2y8Zffaxz5m+deDegMrV/Ri+jw9MTSg
Gb//UyU0/dUPNp5uA71vnZQkupDdIqh2LybfGa67L7H8JvP+7JLFPERqN86x
3+PdEv2r0Ty1hsTivw0HOjZeI5FD+NTvMvMffrWLl09Yz/UF8ikWbbh75xnm
f/6FZa6vK5PJHM9f3Scw+3b12Jxba2Qa6xFU03W2SFe3WfSr7y2Tx7WzE08E
8vFtKnlik+4I63/u8MQ9LJ/+sv/TtSexIp0Td+R2Pczi73rl1+9+KpLpqhlj
O2ZKtG+w0c/vWSJtsbJvWjSRycMG2+ORpfj+Z+hZh7G7y/H6RrepFb2rMntb
c86/lROLsvjKPeaxZxmWb1x63VQ2LWT/8uXD4lanMcXNtTQx+P35WvtZPpYT
E1QmhvnbUMtKIotvP77ul9Nbf37hWc+052/4fvTxRmOzPdvK9PT3m6AjvbQ0
ZvKQXh06cXuG9bJ/fDa0Sz8t9b3XlF6zeHHapmMLJZbfHSq/omNaLZlemZ8d
2meilpI6FOtzKJfl128cey5i8eYED5uAeya83oHxjv04remXpVrKeWuzae5s
mfoc+BZe54yWEvfO3blvAd8vwnx/ddectj/P7zt1GFc8ftIzX7o2t1Vy1XBe
/95i9WnuFJYf1nR2mJhwldfPVx3yyhwQz+LJfi6lvljxenS/ezk3bjMc/2PF
+c9tBUrdubpHhrVEVZqfbRTpyOsRpY7+W/20vkC3e266buXC6731bix5XXKo
RPOebf02YqdAfeJNJ/QYKdF0z/cd553k8eBdp6nLB+9n8WPZ28a1wnk97Pyh
JV27MP8/aWfZZ6bGvH51uXijtfJsLe2dMuD9zeISrR+bYNnuqS8NMutcIoHx
HS27JPxg8e0i3+c52cTi6dvi1NNXeD3fdmj4+LIbNDT26+hOv+dI5D10s+0E
UUMvsgIbz9dK9HbNrvHScg1V86vyNqUu419/4ZRLRsz+XA/7Xm6CTG06rDqq
KcbHszhonacvk5dlQ/vYTGH5Th2fDeeX19TSEZdRV0o3lmnQob1tv9bSUnjW
yn2xLD7K1YZ96M/yp8f7DzY/a+ZPpbI7uJTw5PWuefXTW3pc19LYkOrrwjew
/Onz4cg/l7T0tVHV+Ds7ZHq+cmjVJ1e0NLNY+fo32fz0PaMpuuwG/32VMr9G
eEXf09BuTRuTLZ35faFmJ3pNeMjsW4daRXfPYfn/50Wxdw+yfPSW5zjTmmz9
6UbqroHzDe8j9R3cs0NOkIYC7O9ZTozl7b3PLSx26IeOcveP9E9pxM/zRrV0
3zuDyYfXi+jo47/5/aNsv79vahdl8fSmOrVSpgjUP/lsmwvFWH6TPLrXO5H1
H/Y73Y3Z4/HLD9c7asnPF2dIB+raMfmylrx+lvczvI80bk63IY/qMP/l/3ZV
5ACJPresfWzNCIGc+vq9v8xw39rTjRqMEqixefjkH0P4eX/bmb1G9i50H+lb
r/UtTqyU6FrvDfa1Ggg0u8m6ZRd2SlQ75OF735Ysv0jaFXDrqOH9pAtrW5Vp
yfzlktallr9/WOi+UsjuoA/X+HgL7m+0qmC9oQmL//90rRv33fA+U1E64HPT
XKAaawO3ZrXm5x2GNN1qVYnZ8xp2b8KN/QWy+7suZ/Yqw/tMo4+cdF8tCVQk
ItK3cozhfaag2D23L68V6EuNfZX/Y+OZOCqj1qhwzufp+gEBWxP5eEyWLbSP
2yqQY48SDXS1De8zNVq43+LRCoF22G43CbMzvN+06fLqsimLWH6VteFG0h/O
J10yef7Rhtnbr9/b1q7I9y/OSl5hSdYiVU5Iy5nz/9xv6lnFsuXELwLdsL8Z
vWwBb8f3lpTLti5ehp8vsNVaWzyrL9Ixo1ynKgMNz9vt8nhU9J8R80fugf1p
muF9p5w+RYd1/Mzrp9OcjvW+wfLBzQ7urv/m8ff5W/c41W68RJ36bLltEcD3
Fz7fW51mfkyk1VH94z5N4PHmm3vlX1x0kZTn05i8p7b5US10FY9fI4wu9v2u
ESnQu2W5kQcN70ftGGMh1p0vUlLj1rWuNzL8vYCKrepW/zVDpEneIeOL9mc4
vka1CFGkaYezc8u6GN53ynCYYeW4ViRnOflXEotnxDiz5CGJIlX8Mq9Lt7Ey
3a9ezc8zld+XWvbU7cXRRSJdqJFt396Tv+90/PT5Hw7x88XhKf3cou/L9OSj
7GUdx/OziCdRS1p+5feXfQ84DTJ5KFKzsPi3ez8WOi/W6KT3njGq369m6+M0
Z2HIz9Ja2hlfv2c6i3+Tq6ytX6StlkJsvjy99pifJ9O5Jc4feoPvp+B7Lrfn
V7JuqSWh/LsDC1l+sji70vBl7PmSTxz2uP7Hz5dlBHteNC4qG9yvOp/lRwl2
WrpXUqjpUcKfos+9+2HtoqVRXVpp25r6k69nh5HiKH5eedC2WyXnu2lp8qc/
aalM/s4N29Tbs9B9qQ397Lq+X8TP772cv889nsUDxpP/Ov2wZPHM8w3pA7do
qVXRSwFOTB+erdliXbTQfal6wo8/PbN8STfzygevXRIdXds73aevhj7eKDGi
Rwg/j7556Y0Ad5YvH95/M/LJIn4+eOWqkJi7rny/4t+QnMvmTQW6t6rT9e/F
+XncWzujSwblcvt5MMbtS9WXOnLLMU3pzOLzUz1K/udbgeu7Y8rqu9OWSlQn
YUqXn1dZf7dy8+1Z/nvbc16n68k8npjSskPXlbsFOvbxYAfJnz+/x7zL8CEr
DO9PvTVr0jsnju93eBzofGXXJoGebh0xUnbg9mrukGa3c9vx82ivr5onnuwh
0eBI99V3hvD9iNmx+90qmIsUQ6Efv7gY3q9qur38Nc1MkSwr2FUv0pufHx05
sPTlVP15ruwyp7MseD4fdXhC1audRTpx8ujbYdv4+/5Qk0dvAni9B/rs4BH+
dVktrv8uh6r3X9BKpO2jn/45sYp/b03pmZrpLbj9GZL+YH2qbHgfq9f9ne3v
Hxdp/TTHTX2u8POYmv5lV575KtHppLM7v15g9uF7LZtlRbm+dnhnnPzzokxH
5y6Xh7F8Oa1j6bfVErl+t8gZPKNYtEQhp6rPCqutpcqdP5lbXzS8f9Vlqdve
Ig2ZPgWturXhJI+vk1vWTyj7W6LmN9I6fHLW0pC4LfHtclg8m7RC59pcS/Mi
NOucivDfA3lRvmGj7Gx+vrNHpc4mRicM71e962ry5980DWVc/ZWQ/FVHzjGd
asez+CWh2gKHCr8M71MN9mybtuAPPw/YZ+/IOfVY/GH3vtyVjrH8PlV0n3O2
F+tJBr+PkR7vuLXE2EL//wnZcmoMe/5F3Y5r9r7g9c0mtqn3r75V/f8uPuho
69R9odduC9R8ZZ2Nv8bw/Bn+YG26V++nyfy8R4NZvxZYreD+evTYGb2PLBZo
Z1czzZY0ro9Z7+TfX+oZ3re6XfOLU1BRkbyj/erEfjG8f+X/etioz+8FCt7V
2syoGteXjCIB31hwbXAfa3TOq3OHx4hUpPbXAbdmcPnMvXw/8o614f2skzPX
Hxs3SaQfVouPPlxqeF9r9ImVN3LSREp+8cB78B7D+1t/i5ov+fVWpGFrSnRa
KnF5nT/kbevRffh9q1VHvk0rO1+mNPsaJ3YP4PlSQu2We9705fvRxkt3/unf
TEupc70WdrpgeF+rnX9QTtQ4Le2oT5dMy/D7Lof+jRj6meVnpWdpx/ks1lJw
P9NR43xU97fY96re9Xj8keHBDf87v6266jw/+7576/0fjrP43SSrQ0LEDX7e
2m9ozEm7ZzwfKp7s9LnaC5kOXHywcOgXkcYt8p5j+16moV/Gd7cvwfORNxm2
S0OD+P7muuOdV7ex09DvDpOSvBdJtO2Y9lvzuhp6PHNUjE06v281OOpSxSu3
dPQ++vSMDXPYel+zmOpbSnX/3ZT51zYTymSy+PHD2j/RyeMN7yt7uTqFFs8U
STZLmWZh5m/w+wvmIeUry1O1dPt671ejmH+osaBvp41MX6cUdW3/0Fj1e8js
e/uN5AjzWRpq0NB1eOlk1f/vJkVH0S53jWaMZ/F63YU2NXN5e1bjpcVnsfhh
jRQ87u8L7s8+jrev4ZorUOkFNdKefOb+ZF7VsrfkEYb3pWYEuNHL4/y+VG5c
Rnb4c5F+6u7P2pLO5c/iyOLMmLUypVcfs7E+iwe61Xra6KUJP4/88mmte3fY
eu8Z8GuVI5uPTxvaL36yXyb7BmMS5y3m950qjRryI0TS0pbns0L7tVL9Pifz
dxO7/w2ps11LZ54MC9jO/NnC/q16me7T0oa2ZqeCe8pk1SY559JhHk+EPu7f
yCdUS016f2lReQC/D7XfWnMjaR2/LwT/M2HpnUvbu/H7UdEDbXzLTOfn87os
9jjdao9Abzs57Q97yu9LOTvUb5Zgr/r9SgeJljYYlJ7YSySvadEnwl7wehPi
DZfZn4xSYkUyTj6yxvKg6vdq9L8ft/PvzLq1+P2DGneHujfsoaVKzSutbT9Y
om4+q53dimioY+SYM4tP66jUmuKlGzfXUOakqsnGzyXq2iZ1/M8DLB92/yRo
TWR6Nu94fac0Df388n2GGbNPLofazPIuy+xf7dw2xYnZo50xuUk9BPrzqofz
GzY/YZ2nDSSWb32te75sp1EyHXxwZf4RrUAvH+4te9yL6VvY+q3lTjH9STsZ
/TZAppYmv6c/+SHQZKFG5KzDMtkZJ260aC/Sxmkb3bY3kSm84ZrH33doafm+
Ue2jXsp0t43fYqc4Xk+aV/XOrmXMv7lOmGD39p6OrHf73D3+3Zd2jR92srWx
P41Mbjl7bzCTn8G+2RPNWX46vIRlOza/Hba79xvYU6K7I/sfyU4QaUT/TtnO
okRZDq9du7H5e9kyfWYLlr/LB9P/hQzk90EaTJ9tq48fEQ8XLXPr3D2WD572
/5jm2lSi0PZhszcuE6nC/oWalyx/Cb4yqb1/ES3Nyvl2Y2igRB6nPMuMa6cl
o1enrrhmSvS3Wve2wdO0pKnb7MxDNr4t6VnVp50U6P8ARoFA4g==
     "], {{{
        EdgeForm[], 
        RGBColor[0.148, 0.33, 0.54], 
        GraphicsGroupBox[{
          PolygonBox[CompressedData["
1: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
7Uv9Umt59htP8GfyA5g1zVhdZ57/BzpUKwo=
           "]], 
          PolygonBox[CompressedData["
1:eJwllGtMzmEYxv9v7/P/fzKb2cwHbA4zKmOsLafMJvOlJKeisjl8sWE5NpMa
+eIw5w9MX4iZCrERHzqI0hzSAYnNS0RLpUws2fwu94d773U91/1/nue97+t+
xq/flro1yvO8zYQj4n3PS+Z3bsjzZoN/B54XCXteHrychD54HfwYOR/hPcQg
eBJ6L7gXvQZ9C2vN8ILA9hokDoFj2fMHeDLxAP0uUerZGTrrJfELrZB4iHYb
noGWSSTCZ/mmxfHNTHAXa5XwufyJ/eR2s1YETiY/Fu0IawH8MjmHwQNEG9pG
eBF6CbwffI4oBt8gVqCfYf+J6D/hrfCV6Cfhv+Dv4DvhpfA8+FRwDZEPvkms
Qt9EpOm/wZeHbc/r4G/cb0LI7tgDXqCih2yPCLyFnAPkXoAvA5cRafA1RAK5
q4mxugvRRX5lYLVRzyrAz4k8+Cn0ZPB34hE8F72NbwMiGn6Q82c4q5FqtVD1
Y7+18PHk3mGtm28bfNOq2e85eI9vtVbP1LsecqrIrYZXwiuc3a2PSEKLcaaV
kdMFz/VtrwrW9oEbWMsPW81Uu8bANK01gR3fT4Knw2/B64kc8AB3WKL/56z2
Q+RkgmtZ24G+gUiFP+WMhCjzyBPwVNaSwra2Fz6H/OyQfVMHnu/sLNVcta9x
1gt5MhV+Sv0MmadOg9/75v0/nD+P3E7VAD4PPRf9hLPay0PyUrZv3lLOdnAE
vRw8nfzd6B3OZq2e/H54uzOvaeY0e+qJeqOZy0B768zL6rF63UkUg3ehj3NW
c9V+IjnV8EW+zab+QyK4hLVCzzwtb7c487pmWLN8ydmsa2Y0O1XyR8h6rt5/
Igo1H+SMdOZReVUebkb7oJqB4/mmFi0CPx42j4XhU3zzyv894U2+eVMz0Qh+
T/7RsHkgCj3Tt/+mmmWB29HPoy+CP0Z/4VsvhthjKdo0Z/gvkRJYCOsNivFt
RjQr8sQ1zUpgvZAnLvJtjm+9lOfkvQ7VBJyC3oD+BX5F886Zo/X++faWaMbT
4V/Rr6Kvg7fC7wfmXc3wvcA8Kq/qjdBbMQKe6Nl/0n8b5ay2OlNnv3G2l3qs
Xjc5u4vuoLvE+fbWasY1669YKwBnEYvhY5zdVXfS3T4SZ8N25nBnHpFX9CZG
s1daYG+n9ngNHubs7VVP1Vvtqb31Ruut1punt09v0LPA3ni99eqhelnnzAs6
U2c/cdY7eUhe0gxrluUReUUzoFmQRz+j/QMgNfgX
           "]]}]}, {
        EdgeForm[], 
        RGBColor[0.5276515963393626, 0.4891427335377952, 0.5088885184458699], 
        
        GraphicsGroupBox[{
          PolygonBox[CompressedData["
1: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
OvO+MsTxt805UPS5xjlnp0XdXcqC/MxegrHX5Nxk39rg2CZO/i6pz/t90vnP
+4t4bJ62ORMVY5ux5pNJWEpM5bmX+eysy5Pdc5JWmr8pqE/9elKtfCSTX1qM
44wl3rnYo9N3M7CuC/jpoD2Dzvkh6Jej6nR31jFiGdYchbxXlL2uAD0c5C/e
D4hJ9caKfUl5xHyibK3lxDHyPFuHqLztGNVDsJdgv7+UOZdJz+XOQ96T7swV
rzzH9qQY/CneXeDYZszT/3f+X496l3vdDb7HPsvanoSXX8M3j2A8DPlblIN/
CvLjUT6L7sOZM9yfcdNsG/IuNioo/3jna/Fdo7fzb4H1qbDOPX0XYA/FHF6J
d0awbwY9EOWjQez7MO8D+Zykuy1tzlhiXs60HxcGYTT7SuboJN81HsQ7PcDP
Ai23LqynTeZ5ljlROPML0MqoHH46CUtW+e4wJeruNtVr64xL7IuH58pH3of6
eP8LnFMHbbdy266Pea5h7De4r2MNoZ6DjDll9lGZsYe2OhX13fFBd27em/g/
xsd8L+b9uCRIl3aug7zvsY8gzjIP73Pvs8v9CW3cxXeirwTF2H6suSSpZrLf
bMB8BuS7QXdgTAG/E3RPJv25D++/HXPF32zPyRPvO+XC86uDYuBk1P2SPVOV
e6UrbRNi5OBcNXRBkvxR9i9J8t8m1fw1zp1m3+uoP3Wvco5MTdLnXXwzBdm1
j++ai2y3V917XMUeP8mPtY5BxjxrygO56gfjdiTXQ/5nYxLljAH+L8Be5ktB
94bjrsV1xlhi7RtJdZU1n/0dez72pcSJY17P/Yrek/YmHhFD2Vu1y1U72LOw
x2PfUu54YlzxeRuv4RkZH/w2cbfSdZ/P2+Y6O3O3xflIes48/1/j/xdvJt3p
z9+DC/ovhphTCv2v570L8heC/gtjfvQP+j+McubdhqBvb3f9P+ma3hhUN/j/
3DDjFXGrW5I92O/fa12p54RcZyF/dZJt64L+r+E69lZfTep3zv+HlHTGA0Fx
Wmn9mee0E+8WTwTV497EBscGY6RDUn1j7WWuV7mfOBp1tpuDYuWc+1bWIWI2
ex/WOfrq/ag+ijakTnuT9nklqdbSJy8mxVetY4w9TK19/ULS3WZT0v8cze5j
twbF4l8h35WEsaPcEy11zA8JOh//E2VPUmNf1ATZcVtSr1hi/Bzq9X9Lussu
8Xr2L9Pd4xELp7mnoT8X254PBOV/u6T9Sr0n6wbnjOe+xiJiEjGgg3FgtHs4
9hr9k/LxxqB44/7sTflfC/9zIf7y3sL7Sxn79qD+Zw3e+y9rJuoZ
           "]], 
          PolygonBox[CompressedData["
1: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
Fw==
           "]]}]}, {
        EdgeForm[], 
        RGBColor[
        0.8010859938989379, 0.5852378892296587, 0.34814753074311644`], 
        GraphicsGroupBox[{
          PolygonBox[CompressedData["
1:eJwtV3mwz1UU/y33XvtQyC7POhGSfWt4yptsMxWapmSNNql4ZC29ImJMZqKU
zCOGSUZEZalhSoUGkS1kSmkiEy1o/3zm8/nj/s75nnvuufee8znn3F/BiHF3
PpbLZDI9s5lMHrQYPxMwSsGfx0QxRlXMncOYhVETo1bIZIZBvjJmMpXB94Ju
Bvx5zM3nPMZtKZO5BJ31mL+YE78Matuz+ia/H/yD2KsF6CvQrwp5/6j9T2Es
h84myMtjvihof8p5hoHQzWGsAB+x5ijobOj+AllbjBn4vj/I9lbIS0CneN8a
kA8BX4p1G4LmaoP/GvQayAeCfgD5ZfB9sHYl+PGQbYHOJtCmkI8G7YjvbqAP
Y77Qe/cCXRw0/xzmN/vcn4E/k5VPq/oe3/gu9PEPllcC7Q75kKz255npz46w
Mw/8SdjpjT2q0weQ9QV/BfLzoEVY1xujNuY6J9kspf/tB/pjAWidrHw7OMj2
KdjsE3T/cuCHg28D/lLQ/iWO6S6Mdhg5jGGYu8pv6B/EyFMfdCP0h+YVM8aE
/C3EDebOcq+ke58yzv4zfoijlpg/kJWt7tDPMBbQ/yTqDIwV7dEu7Q/G/CDu
B9Wf8D3V+FxuX5Qm7X2QGMF4G7pfggb7f5b9wNiQXwH9jUHY7wQ6Hfo/G9PF
jhfPTOwwTmuYE/g+Cbo2q5wghsn3Aq2RE152+fy8x/YkzG8D/RjfE6HTGHv1
SMLsOvB/B53znyAsTzSerw3C/ctYNzUpl34Mignv1wPn7pATzuiLEUnnfJo+
ziuHKb+aE2Z4L+ZgC8d0GfQLofdGEibJl8BmJXzvYC0I8vcO+5xx2JlTLBi3
9o4dMVjkGjLJfG3jrrfle7AuYgzgeXCfd3gm3itItjQqbt18N+YY+cuQlyFW
YOfZJB2u7ebcZSyYv4xDlbxi0dd5sR77LnJuPhLl4/bGQ1n6E2vKgI5JWjsa
tDnGMchvAB1qjLbG2mXgx4LfDP4w98opZ+tBbx/4uknx59qRkJcEnatO0hn3
uc4wv/rkVZd2Gs/058KgdeujbB+y/dtzwjHP3DBJXpCUKzx/IeTN8H0EfFPQ
eUHr1tBvOeUMY0c7b+WUe6uh1w9nWAP6UU62aKetcXEza3UQ3lfBzgPQqwz9
Uax5+F4N/YugF5wrtV0jWTPpa8a5Yl7rr2JNAr8X9g5FxbbQ9SZnDDMmC33H
HkGYYo3ZnVS/tgbtc8W1cWnSfiOh0wL8cfA3gg5P2ncY6Jkom9+BTjMeiMfG
SfFrAtoQ9PucMM84JNcxxrmh5YOhl4d8EOiqpNitTLLX1zj/PKgvLXENoz6/
+1mHOCQGKhufQ6PsL8C6nkH3/haytTnFid/sdV3yyo0KrpmsnS8lyasF+f+q
8/q8+0JnyMsG14aoHsJawDpwIqrn3IH55kHnagpZcj9lX2WesUYwPqx/xe5Z
TzE3YOtVrGsQ5JuqUT2JvWkc+OuSYt8T/N1Jd3jSeVDGONzqntQkyvZE2z9M
/OWFw7NBtY41b4JrNftqdffUalHn4Hm6Jt2Nct6N9XuS48IYTbP/O0FvLPTf
i8IN8fNuVAwYi3aYP5pU34+xJkB2mjXeeODaKq6/PNtErB0VFLPfwU+O6i3j
o3Ddztj+zXWHNZ65zRxfnPQmoh36bpb71mHM90zqm+yfnD9rnTlB9aUl5u/F
XAPw94F2xfgX813Yi/1e2RCFu7n2A/N1l/ObfqZ+Z4ybonK9ddB8q7zOPSko
XvWx1zNRvW0maP8gHzzEN0lUPMtE9Wi+A3iHkiQ75YJwQDwMTfIj/cn1EXNF
kM+O6iOt86oBvVyzuD/tPeq3RCV898P3PMwP8Bk6wuacJMxUCep57H2NkjA/
1Xh4LWnfylHn5lraaOx4TfY7ZYb9TJ9dcE077dhzzR9R7x++g2YYV6wnrKmU
Mz/nG39cS1zzjUJsU3e6ccg1E/zW3Zsk3wabX2Rll/MFUXYa+B3BdzbrXivH
i3F7M6m/14+66znv1cC9if4mPWL+1ygfj/C7jznJ+P3lN9zmpLrb1vWf+Ux/
3GXfHzZm2A9Y1w8E4Yx4OwH+ev8f+DQqx5gv74O+kFeebsnqrcm9i+zLzvZb
AdY/wXyI2n+Xe8OJpPUnk2ora+ruoJpd7Po8BXMF0Jmc1Fu6Oe9udY4VJdUg
1qIaSWec7pp5GfI9oB383ifP/vWh78taxP6ft0/qBdWFdTjLzKQaybfzFtc0
9itilm8U4rahe2Qj0EVJ7/w6QW/NUthrBvq43w1zbIM4IAboj7b22xXjo0vQ
O4Zn5H+OWVHn4zvluN+irC91o7BXL8r3bdybK7jfV/TZ99vP5ZLuXD7pPw91
X2ddjcIse8WLUfEaExRb5gX9z/cQ+SVJ+9CHXP98FH/Zb1rGiHdh3h+wX7dF
yc4EnaOF/dzG/Yt9bE5UT5wL+qexSsx+5bcE3xQ1k96XtZLekeyZU4LyjL4s
9f+FDq4L9/hNwrcJaw/fCcyN/wHeULmu
           "]], 
          PolygonBox[CompressedData["
1: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
XE2Q/wPW3Fj0
           "]]}]}, {
        EdgeForm[], 
        RGBColor[0.92787865678251, 0.6896966419562751, 0.37642383602578117`], 
        
        GraphicsGroupBox[{
          PolygonBox[CompressedData["
1:eJwtVm1MllUYft7znnMQGaxVQrqaUK36kbVoSuVHQWAMslBrqbUxSDbKwau1
EmgtZ0CrLBkRsKVoLbfQfrQJA1tNm63U+SMrfLOgxhKDtrZS/1pdl9f94+y+
z/3c5/7+eEoaM+taXZIkF3HSOOWpJJnAmYfzGD6UglgBegb4QuDNoO+KSVID
+HNIkq3Ai0Cf9EnSD9gFvnLwP+dE3wi+HvDcD3w34Ps4K4D3Ac6B506c3eDf
4MSzHvg9gN241wFvcOJ/Fvgg3qwCPgBYBziCb504ZWYr7TwHm/Jw/wnweSc7
XgO9GXCB2fMU3nvgp2BzI/B84Ge8dBFfC57WKP6zoG8GvdDomSg8C/p20C/z
G+idOKdxinB+xHncKZbUS5sz5iP1VoG+Msr3DyCnDXgx6OeBvxAV51+Bb3Wi
M+YL4E874CHQN4F+2kmOS0su47Yoiv4qeJYC/x34MsYc9yngdwO/C2cSeB9o
e3G2QEYpaCe9ZD0B/E8n3dRLOGc5OgCeWeDLaSPsmcX3RUExnrQ4z4H2F/AO
wHrAM06+T+L+PfACwJYgebdCXpNX/q4AXgBcCp426gVPL3iuB/wN9yVOti6O
ktnFuDnlYD/41njxFQTxTqfE34v7OtzfA5wfZMc7kPGJl58rmGev+srH99W4
XwL9kah3ay22e3EvR3z2AA4ADuJEyNqBM2Q18KQX/ANympzq5kX6kFYdMA5z
QfyzgA+DPwf82aC8Mr/HgY/he0ta9T/iVVs3gf5gVGxXWW63gacV344Fxewo
4KNBMa7FuxvS6lvmZcLsYQ3/4FTrxNmvfdazd3jFshgyfnGymf3CnGesHqas
p0hf6OXTGvDPBMmp8MpzveU6Ly1djO8w4EHrU/bvsOGXgvCLgH8H2VIKOaM4
XZDxIfxdGZSHHOCLg+ykvbVBMS6xmXQupf7fxxgBXofvNV62MDbkYQ1ctc3q
gXXRkBb/tSnFcialGuVMG7BcjzrlnXOnMIhnvdedPJxFjGe/8XcaTn9qzYbN
UXVemVbtVEX1Efup294z7z022/iWdjVYri8HxbAR8sai7K3zyg/rk7n+CPRq
4Ld7xbXObBsxnDHn3KJe1uvOlPqWs+tG6zv2H2uMeqnjaYsz431vVH9dEwTP
O9lWFOTbV4CvQPcp7gDwrsY9lz0F2AL6EeAO9BNRtc0aZ9/PWOyZe/qdC5jG
myxoHrAqLTtpL2PSbvm6mjuzIUbx891tXm/2W09fsH49av1y0GtOUQZ95izm
TG4OmuVdFpNdXv1zC+TcHNVHw0G2dBjPMuvJ8agarLY6nA7K5T+c35Bzgnso
yge+Yx2/7dWTxVYLOywvJUE2sA/Iv93mDBc2/ae/Hwf12gHAwzYrGNfXo/qR
fXncdsdQ1IzkXGQuC2y2PgOYCtr7SdA85g7jbBoK2jf7guLUbrFiPukn+2lj
kEzuk/4g31/y8q/D+LkPKZ878WvrHfbQvKgZ2xPk306LSY2TDWW2nyh/j+Wn
zXqzyHJEfvYT5ypjF6L0ZCweRWZDZdT3z7z+D5ifai895eZvNPtfBn3cCWc/
lnjp5O7q9ZqPSyDvm6A99C1gIfcodx++P+SVd+b/sP2LjAT5eszp/4q1sMH2
OPVQH21qisopc5sbxVvJGrQZcTbIPr5hvL8I2tNfBs2PMZshgza72PdHjM65
VGq0CuMZNfqE165qgc4rQfQtoH3nNcfro2rhpM3zKdsx26L21bjp/Tcoltxv
+dYPOUHzYJP5y901bTWctfjTT9rbb/Mqa3J8lOzPLT6HbL9+GlQ3jOl88Cy3
GmYt53nV0FvA3w36P/zPdmuX+ZuOktnqlZOs2cDe5/xkbRV79dt4UA74/QGT
V2Y10x31z/oG4JvWP/yvuS9qNpYB/g8oaFIo
           "]], 
          PolygonBox[CompressedData["
1:eJwtlm1ol1UYxp//s3POXGMV5ba0QtfrlywqRMuXWjgdgpbOKCuIpsLM3NYi
mkYo1UzLysyRls5eMHMFmRq+VGBgL4ofKp1izSIsc0JQzY+a/a6u58P957rO
fZ9z7rdzP/+65raZrXmWZd1IQJ7kp7GUZceQqpRlr8csm4lBE7oh4G+QTvjb
8BHgl7Hpx3YqshJ8JWvPg1ejvwK8i7UT2F/C2k5wZO2ezHck8DjWTqFvga/j
7gAvB9cjEbwLGznYqv3gL5GT4E5kL/g1ZEZuH1eD24L3HtX57C/pDHQLy7Ls
MXQbsHkAfgB5Gv4W/H7wt8gi+Hvwh8E/IMvgw+GnOOsMfBv8MLxLOqQP/Dey
ClxPTH8ptuBYFyMn4UeibW/m/mX4cha+A34LfDm8NziWG1ibAB+F/ASezdoK
dFfD++Az4Evgtcm+N8A7lK/oWPey1g4fif5QYb8UvrGIdw7+VcOrk2PV/ifg
h1Sv3DHcqQZAvxO8WzmD70D/KHgJqjngPFmX2D+I/ib48cLf5fALkusxBF4B
3lTks439w4JzqtyqZyrRNUbrvmdtBPZdwVh7VIv6aN/3w2uSfZbvB+HDk2NW
7LpTvSCf5Nun8HPw3ToffBn5Po6uFdmTuyfUG43wypLXyuALgveqRqrVNmR+
7hxsBy8O9kU5VS+dhd+Ff73wM/A/kBrO64EPqHei8STuvxbb+fBR8F+wmQb/
MfrtyIdj4GeCY9P5PfDm4LO3IIPw8uS3+H+Owf9E61RD1XIuaxeWnL954Drl
DPu58KvAF3He3eDD2JwHVwT37hrWnkO/Fb605J5vgJ/mzGdLjule9Vf02++C
14G3Ii25e3Z1cI+oV+qJdwP7v4I/lXtmfA2+XvMF3UH2jwVPK+o/kbW12H9S
5Fs91Y1+DWvj0T0C34yuNzqWeciH4H3oHy/zjBkNfiP5LPkk35Rz5V4zoxb+
TrLv8uFd8PvRZ1fCvwueEZoVegN6C+fgY0qusWq9HlkA/xW5Ff365FjVY3s4
a2j07FuEvlqzJTr/2jMb/BnSju1p5APO6km2PYFsBL9ZzKOcM/ejb4meDQOK
P/gO3aWZuUm9F1w7zSTNpoqin9QDU9G1wUfnjn8W/NLouzRTRwbPKM2qP+F3
cP+WIr+aOSvRTw+OVT2r3n0heZZphmuWT0zeO4DN5dEzUrNSNVftD2hGlTkm
xaYYFItyoFxcHH2+aqhalkd/eyrQT46e+Zr9v8HHqtbJb1k91oTuPDI99zfj
X/CU6L3KgXIxPjnX+r6s5e6PontHNVFtNhf118x8Cf2Lyl/umq9Qr7O/ocxv
QG9hIXxomXtWs2sKfDD3m5kEnpVcO73RCZp9yb2lGaZZ9lD029f9D4KbuPP3
kmukWo1JjlU5Ue6VU+VWPlwX/Gb1duVjpWYlUlW8D/WyvhmaxbWstXPWEc38
4j18HP0N0bdBe5qTZ7bsZdOa/M2QvkYxwquK+as32J2cc+W+n/NuhB8NtlXP
6G32B9+tN6zZeXv0t6APGRfVNMaaQZpFPyPDivejWd1RzHf1zH3JPaveVY4n
w6+Bv5o5Z/uwXxPsi+7T7NB/CNV6JPs7lctgrH77PHrmaPboP8r24P80qtVt
2KzC/ovifeqOOt2VrFP/6r/C2uJ8+dyR/A3Xt1w9+Ep0jpVr9Ugftv8BrQ0i
rg==
           "]]}]}, {
        EdgeForm[], 
        RGBColor[0.9715582730060843, 0.7988956825152108, 0.5118306463188613], 
        
        GraphicsGroupBox[{
          PolygonBox[CompressedData["
1:eJxFVU1slUUU/b73zQwNCPowQHzEgImSsAEJElmAJcEFJhJ4KEUpNEjSWPpK
i60ETTASDFKiKAWagLW8Z1xg0GC6oEhKCLUEdu7UWGKRjQos7dK/c3KOcTG5
d+6cuXfu7zyxu2dLdynLsstYBdYjKcsmIJgD2olVhrAD9AbWYZ7HLBvAWp9n
2b6QZfOBvUgeZxPA7AP+W9Acax3k3cD0gJ8D3CHwi8DPAr8h6h75F0Fbc2F6
oacr6C51lEG7ctmeyqV/E+g8YFqBr0PPMuAeA/8S+E1Rb9kD2faou+eAvQ7+
TWDGQRvQUcc6in1LlM1FwPwE/hhkk6DbsA5B3g76KtbjkL8COpKLbwN9FDZu
gp8GbcG+qZAvVdAxyLfgfkziA+jbsLER50NRfvMO8YzlNuNHQQexmnNRvrEK
+Qzo7Af/UC4dtDsb9PMoPUegu4DsVknn037bSsjLSdgXwJ+PivVpyFYXyjXt
Vs3THmNAW7sgT8BdBd8T5MdV42fZ7vtBdUAfAmRfO68/QLbXecyg42yUj3PB
t+eqG+bpQ+yfhe3jSfGjTtqt21/6fh936+AbwFSd33ej3st38z29OFuK/RnY
3J+LZ/5oc7Uxf0fF9x/QuVgHgLsWVR+skzL4/qTY/wl+uKT6G8Ddl7GvYL81
Kg5V108z8EOgv0bVB2vjq6i6of1V0N1Xkq0T2I9Fve885E3gJ8GfAl0SZGch
6xQ6F0L/Hci2BvnOGFQKyTtz6aiY/wOYW6ClJBnPaPtnyEfBX4mKF+PG/mCf
sF/eAL7fPbwc/F9Reqhvg2t0r+dBw/6SflaoDp8J6p0K6IkkX+gT+5y9vDgp
h3XjK0k12hdUz0eK/3PdMOao8cz7PefgN9AFUfF7yrVGW6zpyeQ8R+V81L7v
wv5J7F+Legv7ttfxZZyfS6oV3lnjWUXfaXcwadbMBrY7KT6MU597bB5k00Hv
fTipxtb7PRc8I34MilPDfVXQHuce5LWkvn8rKAZNjsOOJJ3Uzbr7pKS38nym
Z0tbEv9dUA6ft8+M8wzrOQtMDftLeMt7UZjDUXVA7BTuHgyao+NJtcka7XQ/
t3iu1Bw3zjpiyq7ha+6d1z1TeZfyPtffbdDdhfqCPmxPettO0O+D5gPnxFrs
H+D8gnvkgd/A3mMP1iD/wv085nzS53b3D+UdUX7yrSugbyTq/DTOz0X5+A74
k/6zBtxzG52vDv9xXaB3SpoD9PeDoDnJefl0kuy45wRx/I/oB++yr+6WJG/z
+S/GrPK/yf9zMOhtI54Td41fmYT/NKiXWKctnjdT/htZ94zx71ExLftP5GwY
dp1wBjHmm4G97Bx84x4841nKu0PG//fHUM7zda5//k+Mz8e4+5Fz0e+/eNi5
Zq80G9/qdzLWrJea//HMfcX//Ev3BfuDMbvov4+z/5j/Gv5dN/1/8a9ifm4D
/y/S4/kP
           "]], 
          PolygonBox[CompressedData["
1:eJwtlEtsjVEUhf//3nMOKaq3lLgiJRGJiVcVA1RSA4NKaZRoaaqJoLcvbQUJ
iVQa7yraRFv1mAkiMSkJCdVER8wobbQMBDFm5vEtu4P1Z62z9jn/OWfvfRbV
NJY1JKIoKgcOvOGTlYyiqaAyRNElsBZejZflo+g8/jwmLAbV6APgaBxFtaAX
rwFsgl/HTzL3GLoktjWr0AtBNl4lYxfwHPOL4WWsn/T2T/27HbzGz0XvIn4G
MSn4erAUfQR9F/8deAifw1gD3jh6ILaYZvRX1uyH3wLleE8Yq2HtXvQaeFew
vYyDbvhGcIW99OEXwWeC6Xh3mPMFngeSeFsZO+5sDa3VxpxC+BZnZz8L3vPv
MrCf2Cb87fAxYtKsdQo9Ci8mvpvYAfAHP4MuIn4Y/PZ2J7qbZ/hB+cCvwqsD
FXgF6Fd4w2A2fsqblwKleN/QnZHdwXf4KmIm4J9BP342egi+jj11wB14ij4D
RrytqbV15iJ0o7O9KMbjbXN2V7rTx+gxb7nSnmahE8HOopqoJ3aft9rRnehu
DgerJ+XsI/498APdAp7j9zmrLY1tIPYkujS2/aTR5cSkJ+vpJ94IeBRbjTXi
Xw6Wq1HQCS9xlmvN2cHcQ8Fyk2L/tcH+qX+3ghc6i7f4SnQec7uc7V17Xkb8
KP65hPXIRfSvyfrbzNhpvDZvXPHqnYPealdn0tmWB6tdrdmNrkdPS1hNv0Xf
Dla7qskl6JXoTMJqYAW8nbGdsc3JV6y3veqObsILndWa9qS9KafKrWpOtaec
K/fqsR68wWBzmxgbgud4q+1P+AXBaka1swDsxnsZLFZ3pLt94M1TDu7Dr3m7
e/X4VW9vhM4+nzmtwXKm3DXzj9XwCWeeeqQlWM0lJ89zwtkbpLfo/5m99Zh6
TTn44O3N0NsxBVQwvy5YbvUGZeCD3nKrnpjrrUfUK3rDctF/vfWierADvjfY
WnoD9sBvOLsL9ZB6SW+C3gb1UA4839lZlKMe9D/t85rg
           "]]}]}, {
        EdgeForm[], 
        RGBColor[1., 0.95, 0.75], 
        GraphicsGroupBox[{
          PolygonBox[CompressedData["
1:eJwtVM9LlFEUffNm3oNcaI4FQYPhLgiksNaCWwNpKIjxS3Q28lXMkLlo0UZd
BAO1n/4BV6Iwi1mXBirkRhghoSDwT7B153DO4nLvd9/9ce65d2am3W12Yghh
BVKFPMwh/IbjEXSvFkKrEsJ2CqGP73kE3IOvC92BtBH/Eu97kDXY+9C3o3wj
vF9AJmBfIfcI/gno44rsRegf0H3bDej7kHXYB85nLmux1zvX5zftWcT+hb0F
ezKrVh36PWQI/x/gXKopZjIJ84VxE+9YFOaVLPsDYq8hJ3h7kYTltCI8z5Ow
PMX73Sgeyop4mo6yG8ZeQHrmgPXZs+tZdpJq/kOdO1HzkN+PNXE5n4Rl17mF
+3PeG1Vxx7eFKJ6Zvwn8D2B/9a72Hb8R5Sc/9SQeyMdyVo0z9oyah3xPZeG+
ROyXrJ2MZ/E1Mv8/a8plDfLUdi45mHUvzsBZbnkPhXdEfMSznpRTGCdrH9jm
rKfmhD5iY9wv1PqEuMus79I13+B7Cv63WTyPvN/DLM6/+d4Wzedj7/faWIau
Qy7rvovXWXZpDvq+kxNj4h6H3nfh955jniXttZk0P3mYQ69z1BtUFVeary3P
2/Ls/aR+5L6VFPPZ91aaL94f+3/Pwrzn3wO5aXge7nnD9QfmgzHEteCbaRrn
WtItkvMn3u2xubrp3+yVOR5zv45nabv+ue2W74o3UmTd6yvf1MAYVpPm5f/K
f5/2g/A=
           "]], 
          PolygonBox[CompressedData["
1:eJwlkU0rRHEYxf/G/T/FwpiREiJloZSIWSs7WYi81A1xSwwyhYWFUiyU8gHu
xtbKUnbKW2FhY2eK8hnmA/idnsW5nfN/Xu95BrLa/H4hhDAIEnDMp5WHjuYQ
di2EbXDbFEIZvQNfjiH0Er9Af6OvyO9D/4BRdBm8wmeoycltM+cvvLXD73ir
oiepz9El9B96hPg1varmszrRs8SWQA88A93E+xOv1ZtiW2AYfgAe4IvgnX5F
sAAvms9+QzeoHTPfVTtolzOQwj/AOfyReI3+GV6ckF83/9d74ofmPdSrhbcV
9HjiuV/oBrqSeK8hZmxG31m7a6cJ+Kp57Q06Na9R7aU8h++Zey/P5b08kBdT
4DQ6xLvAHHyannnBPS+R/5l4b91wzdxTeasbpeQ/mXujf3w290ze6Qbl6Dtr
d91Yt65H300zNGsj+mx5tg7/Tdwb3eCIfv/igUDL
           "]]}]}}, {{}, 
       TagBox[
        TooltipBox[{
          Directive[
           GrayLevel[0], 
           Opacity[0.5], 
           CapForm["Butt"]], 
          
          LineBox[{1629, 1626, 1229, 1627, 1230, 1630, 1144, 1643, 1644, 1640,
            1642, 1641, 1359, 1407, 1361, 1362, 1377, 1376, 1162, 1410, 1411, 
           1270, 1077, 1381, 1367, 1754, 1755, 1651, 1247, 1652, 1178, 1383, 
           1470, 1298, 1103, 1297, 1182, 1370, 1165, 1584, 1585, 1461, 1689, 
           1055, 1366, 1050, 1076, 1269, 1365, 1364, 1100, 1730, 1731, 1729, 
           1148, 1343, 1556, 1075, 1780, 1555, 1499, 1097, 1553, 1554, 1433, 
           1678, 1550, 1552, 1765, 1551, 1268, 1628, 1629}]}, "0.0005`"], 
        Annotation[#, 0.0005, "Tooltip"]& ], 
       TagBox[
        TooltipBox[{
          Directive[
           GrayLevel[0], 
           Opacity[0.5], 
           CapForm["Butt"]], 
          LineBox[CompressedData["
1:eJwl0bsrhQEcxvH3OJdEynJSDBgYKWJyGSxGkWI1Kc45LguDstAp91sp1zLQ
oWRCBpR/gYNidFutbp+T4ft+n+f5vcvbW9mX6kyGgiAYQyLiEQuCQQ5xksPc
zvfRIHjAI2ZtcyiQCzHtvsdTXJ57X07wrX4s33FST3Mtr/GJfZVr9C55mJ/0
c/mZR/R1buIDvrDvcz9vcLM9w5f6Fa5RgirbG7/jFd36B+96v1ouk1vkVrzI
HbZT+QyNaMANit3qedO9jre419aDIxwig6w95T7JFTzD+7lvy30niuS4bYe3
MSGX2kc5zuO8YV+QF5Evr2AZSxhyj3AYMfeUHuUIsrY2/Yd/MY+0/YsH7N/8
yXmx/3/7B5Z5Peg=
           "]]}, "0.0004`"], 
        Annotation[#, 0.0004, "Tooltip"]& ], 
       TagBox[
        TooltipBox[{
          Directive[
           GrayLevel[0], 
           Opacity[0.5], 
           CapForm["Butt"]], 
          LineBox[CompressedData["
1:eJwl0j9I1GEAxvH3wLvzknLIlEKpK6EWlxaPJDDRE8xrSKGhILi6oSHvCAyx
wUEwFIdoyBRPUTSQliOLJHSq1JqS/kwtQe1ZjYV9fjh8+T7P877c/e5POl+8
PBALIcyivSqEj/EQfuE38vof/sv/UMC4PoEaeQ+1CHoMbTiHTlsqEcIBPNCr
OYnzcj+/cz4jv+cr+h1u4Htctg9zvX5Bvs4f9CfyDuf1ET7Fk7xiPymncVG+
ims4hJzzW3yJW51n8FJfwwnbYZ63zeG1/NR2hOtQQiOa8Ny+7c4qZ3Aai/oC
Xsjp6PVwRj7OW9jEWzyzHeOj6HK/ondyN7Lo14vO+qLPzG/QLN/mNG/wOr7L
Q+5Pcxsv8yv7rFzGjeg5sRq9J746L9nHuYUfcsU+JT9GLnom2zIvoWC7GX2H
tl69J/oNuRtZJHHQ+aD9kXyXExzHffsYvsif8Qkdzn/wqD0ln8VPfRff4vv/
tf/RIUm/
           "]]}, "0.0003`"], Annotation[#, 0.0003, "Tooltip"]& ], 
       TagBox[
        TooltipBox[{
          Directive[
           GrayLevel[0], 
           Opacity[0.5], 
           CapForm["Butt"]], 
          LineBox[CompressedData["
1:eJwl08lLllEYhvFTaEYDhgQZppBTZaEJkugiUhfRsLAgoU2OaKTYIlPUTTZo
USBCaVRQYpOL3CWUBdGmMv+AAnVRgi3cFJiaEP0OLS6u+7nPeb/vHXfWnT/Z
uiaE8AFnEkKYWBfCW7zBH3MSLss9qJV/oRDrcSAxhGKck5d4Bcv4a34Xj5dX
MS6/xGH9aV7BlDxk7S4q0GHO0F/hNE7HDmyy9oW/oh5NaESffXt5H3YjD3tQ
af8l9KAOg/Y18xBf5WtYiueOFrkR046bQQe60IlR6+VcgUMYM5dxqv2zPG/u
5h/crruIp+Yn+CS/0h+Vq3jWfExeQIn5OGfqsrBgfmZ+Hv8T3bo8XS5Pxecg
f47PhJdRiteY1E1wjn3Z6MQFtMX7rf/II/Y8RoacqSvGTLxenJBLrA3ze/Mj
ruZ+LtI/5HHzPfk+kuV03Ri/wC5dbnwvdNmcE68h3m9O0x2Rt/Fw/G3U6mvQ
pkvl7XigH+CtuoNyCt/h26jSn8JZ3cb4HqBff4O36NbKm/kW30ST/Jtr4vlz
PV/nBl7kMv7Gc/iODeZVJKLP3ItquYDzsR8F5p8J/7+Lf8i8ZQw=
           "]]}, 
         "0.0002`"], Annotation[#, 0.0002, "Tooltip"]& ], 
       TagBox[
        TooltipBox[{
          Directive[
           GrayLevel[0], 
           Opacity[0.5], 
           CapForm["Butt"]], 
          LineBox[CompressedData["
1:eJwl08lvTlEYx/GLV1ciEYlYiKTpgqqKIRKqhogKEsVrYbYQaaKLCkkRqSFS
G0LQ/6DEAlVFYljUWEV10FYpC22NbbU1xLTzeWLxzff5Pc+5b849576Z23am
S4YlSdKJgYwk2ZxKkkEMYSPejkySfG7hVeY/kCuv5hy9qbgf6+ThnCun+Ko8
n2t4AbdxO9bggZzmGda+4IfyWq7jWXozMUrdrfeIi1CPHnk055uP4XfyY96F
BryXx/Ii83H8UW7mg2jFJ3k8rzCfwJ/lV3wSneiVJ/IW863oVpfqdfEeLtar
40o5j+tjf0jLVXwZ1ciKPVm7G33qMr1ePsD79J7wMizHbdzCOvN+s1peKU9S
T8bduA/5Ds9DTqyT7/EU82xcki9iSL1B/wsPYiDuJ96fm9GExujHXrgMzz3X
ipY4K1zBevNG7kMTCnEB2fr7PfMMDXiK/vh9sxreK9/gP/JNro47wHf5A5fE
Xvm3XMXn4w7xTe7h7eZn+Zd8jivwBl/l11xofop/yqe5HO3xrcptvMS8AEfU
lXxGvwKL1cf5WLwbXqIDS627xgV8Pc4YtZhj/Vzs0D/B5XpHMVudoTc9vqc4
OyxUd/Eh88OYFvuNbyj68gj+i02p//+vf4kihOg=
           "]]}, "0.0001`"], 
        Annotation[#, 0.0001, "Tooltip"]& ], {}, {}}}], {
    DisplayFunction -> Identity, AspectRatio -> 1, DisplayFunction :> 
     Identity, Frame -> True, 
     FrameTicks -> {{Automatic, Automatic}, {Automatic, Automatic}}, 
     GridLinesStyle -> Directive[
       GrayLevel[0.5, 0.4]], ImageSize -> 400, 
     Method -> {"DefaultBoundaryStyle" -> Automatic}, PlotRange -> {All, All},
      PlotRangeClipping -> True, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.02], 
        Scaled[0.02]}}, Ticks -> {Automatic, Automatic}}]},
  "RowDefault"]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["Model", "Subsection"],

Cell["\<\
Our model is just three (conditionally-) independent Poisson draws for \
bright, dark, and signal counts. We call draws from each x,y, and z \
respectively.\
\>", "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{"model", "[", 
   RowBox[{"\[Alpha]_", ",", "\[Beta]_", ",", "p_"}], "]"}], ":=", 
  RowBox[{"ProductDistribution", "[", 
   RowBox[{
    RowBox[{"PoissonDistribution", "[", "\[Alpha]", "]"}], ",", 
    RowBox[{"PoissonDistribution", "[", "\[Beta]", "]"}], ",", 
    RowBox[{"PoissonDistribution", "[", 
     RowBox[{"\[Beta]", "+", 
      RowBox[{
       RowBox[{"(", 
        RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], "p"}]}], "]"}]}], 
   "]"}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"likelihood", "[", 
   RowBox[{
   "\[Alpha]_", ",", "\[Beta]_", ",", "p_", ",", "x_", ",", "y_", ",", "z_"}],
    "]"}], "=", 
  RowBox[{
   RowBox[{"PDF", "[", 
    RowBox[{
     RowBox[{"model", "[", 
      RowBox[{"\[Alpha]", ",", "\[Beta]", ",", "p"}], "]"}], ",", 
     RowBox[{"{", 
      RowBox[{"x", ",", "y", ",", "z"}], "}"}]}], "]"}], "//", 
   "Simplify"}]}]], "Input"],

Cell[BoxData[
 FractionBox[
  RowBox[{
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{
     RowBox[{
      RowBox[{"-", 
       RowBox[{"(", 
        RowBox[{"1", "+", "p"}], ")"}]}], " ", "\[Alpha]"}], "+", 
     RowBox[{
      RowBox[{"(", 
       RowBox[{
        RowBox[{"-", "2"}], "+", "p"}], ")"}], " ", "\[Beta]"}]}]], " ", 
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
   RowBox[{"z", "!"}]}]]], "Output"]
}, Open  ]],

Cell["We do get correct listability list of data", "Text"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"likelihood", "[", 
  RowBox[{"\[Alpha]", ",", "\[Beta]", ",", "p", ",", 
   RowBox[{"{", 
    RowBox[{"x1", ",", "x2"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"y1", ",", "y2"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"z1", ",", "z2"}], "}"}]}], "]"}], "\[IndentingNewLine]", 
 RowBox[{"likelihood", "[", 
  RowBox[{"7000", ",", "5000", ",", "0.5", ",", 
   RowBox[{"{", 
    RowBox[{"7050", ",", "6049"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5000", ",", "4950"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"6000", ",", "6500"}], "}"}]}], "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox[
    RowBox[{
     SuperscriptBox["\[ExponentialE]", 
      RowBox[{
       RowBox[{
        RowBox[{"-", 
         RowBox[{"(", 
          RowBox[{"1", "+", "p"}], ")"}]}], " ", "\[Alpha]"}], "+", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{
          RowBox[{"-", "2"}], "+", "p"}], ")"}], " ", "\[Beta]"}]}]], " ", 
     SuperscriptBox["\[Alpha]", "x1"], " ", 
     SuperscriptBox["\[Beta]", "y1"], " ", 
     SuperscriptBox[
      RowBox[{"(", 
       RowBox[{
        RowBox[{"p", " ", 
         RowBox[{"(", 
          RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}], 
       ")"}], "z1"]}], 
    RowBox[{
     RowBox[{"x1", "!"}], " ", 
     RowBox[{"y1", "!"}], " ", 
     RowBox[{"z1", "!"}]}]], ",", 
   FractionBox[
    RowBox[{
     SuperscriptBox["\[ExponentialE]", 
      RowBox[{
       RowBox[{
        RowBox[{"-", 
         RowBox[{"(", 
          RowBox[{"1", "+", "p"}], ")"}]}], " ", "\[Alpha]"}], "+", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{
          RowBox[{"-", "2"}], "+", "p"}], ")"}], " ", "\[Beta]"}]}]], " ", 
     SuperscriptBox["\[Alpha]", "x2"], " ", 
     SuperscriptBox["\[Beta]", "y2"], " ", 
     SuperscriptBox[
      RowBox[{"(", 
       RowBox[{
        RowBox[{"p", " ", 
         RowBox[{"(", 
          RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}], 
       ")"}], "z2"]}], 
    RowBox[{
     RowBox[{"x2", "!"}], " ", 
     RowBox[{"y2", "!"}], " ", 
     RowBox[{"z2", "!"}]}]]}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "1.1552820199096920187350978774872`11.69893139701975*^-7", ",", 
   "6.648325131908563383738864489442`11.699220765924563*^-46"}], 
  "}"}]], "Output"]
}, Open  ]],

Cell["Also make a pattern for only z data:", "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{
    RowBox[{"likelihood", "[", 
     RowBox[{"\[Alpha]_", ",", "\[Beta]_", ",", "p_", ",", "z_"}], "]"}], "=", 
    RowBox[{"Exp", "[", 
     RowBox[{
      RowBox[{
       RowBox[{"-", "p"}], " ", "\[Alpha]"}], "+", 
      RowBox[{
       RowBox[{"(", 
        RowBox[{
         RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", "\[Beta]"}], "+", 
      RowBox[{"z", " ", 
       RowBox[{"Log", "[", 
        RowBox[{
         RowBox[{"p", " ", 
          RowBox[{"(", 
           RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}], 
        "]"}]}], "-", 
      RowBox[{"Log", "[", 
       RowBox[{"z", "!"}], "]"}]}], "]"}]}], ";"}], 
  RowBox[{"(*", 
   RowBox[{
    FractionBox[
     RowBox[{
      SuperscriptBox["\[ExponentialE]", 
       RowBox[{
        RowBox[{
         RowBox[{"-", "p"}], " ", 
         RowBox[{"(", 
          RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "-", "\[Beta]"}]], 
      " ", 
      SuperscriptBox[
       RowBox[{"(", 
        RowBox[{
         RowBox[{"p", " ", 
          RowBox[{"(", 
           RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}], 
        ")"}], "z"]}], 
     RowBox[{"z", "!"}]], ";"}], "*)"}]}]], "Input"],

Cell["\<\
It is worthwhile to compile the likelihood in this last case for the Bayesian \
estimator. Note that Factorial is not a compileable function, so we implement \
it manually.We don\[CloseCurlyQuote]t even try to make it efficient. We work \
in logarithmic space to reduce numerical error.\
\>", "Text"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"likelihoodC", "=", 
   RowBox[{"Compile", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"\[Alpha]", ",", "_Real", ",", "1"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"\[Beta]", ",", "_Real", ",", "1"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"p", ",", "_Real", ",", "1"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"z", ",", "_Integer"}], "}"}]}], "}"}], ",", 
     "\[IndentingNewLine]", 
     RowBox[{"Exp", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"-", "p"}], " ", "\[Alpha]"}], "+", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{
          RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", "\[Beta]"}], "+", 
       RowBox[{"z", " ", 
        RowBox[{"Log", "[", 
         RowBox[{
          RowBox[{"p", " ", 
           RowBox[{"(", 
            RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}], 
         "]"}]}], "-", 
       RowBox[{"Plus", "@@", 
        RowBox[{"Log", "[", 
         RowBox[{"Range", "[", "z", "]"}], "]"}]}]}], "]"}]}], 
    "\[IndentingNewLine]", "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"likelihoodCC", "=", 
   RowBox[{"Compile", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"\[Alpha]", ",", "_Real", ",", "1"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"\[Beta]", ",", "_Real", ",", "1"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"p", ",", "_Real", ",", "1"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"z", ",", "_Integer"}], "}"}]}], "}"}], ",", 
     "\[IndentingNewLine]", 
     RowBox[{"Exp", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"-", "p"}], " ", "\[Alpha]"}], "+", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{
          RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", "\[Beta]"}], "+", 
       RowBox[{"z", " ", 
        RowBox[{"Log", "[", 
         RowBox[{
          RowBox[{"p", " ", 
           RowBox[{"(", 
            RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}], 
         "]"}]}], "-", 
       RowBox[{"Plus", "@@", 
        RowBox[{"Log", "[", 
         RowBox[{"Range", "[", "z", "]"}], "]"}]}]}], "]"}], ",", 
     "\[IndentingNewLine]", 
     RowBox[{"CompilationTarget", "->", "\"\<C\>\""}]}], 
    "\[IndentingNewLine]", "]"}]}], ";"}]}], "Input"],

Cell["\<\
We also try a faster implementation of log-factorial, found at \
http://www.johndcook.com/blog/2010/08/16/how-to-compute-log-factorial/
We also improve numerical stability by subtracting the max log-likelihood \
before exponentiating; this does not provide the correct probabilities (as \
seen in the accuracy table below) but it does if you subsequently normalize a \
list of probabilities, as is done is estimatorBayes.\
\>", "Text"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"logfaclookup", "=", 
   RowBox[{"N", "@", 
    RowBox[{"Table", "[", 
     RowBox[{
      RowBox[{"Log", "@", 
       RowBox[{"Factorial", "[", "n", "]"}]}], ",", 
      RowBox[{"{", 
       RowBox[{"n", ",", "0", ",", "256"}], "}"}]}], "]"}]}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"likelihoodCa", "=", 
   RowBox[{"With", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"lookup", "=", "logfaclookup"}], "}"}], ",", 
     RowBox[{"Compile", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"\[Alpha]", ",", "_Real", ",", "1"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"\[Beta]", ",", "_Real", ",", "1"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"p", ",", "_Real", ",", "1"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"z", ",", "_Integer"}], "}"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{
         RowBox[{"Exp", "[", 
          RowBox[{"#", "-", 
           RowBox[{"Max", "[", "#", "]"}]}], "]"}], "&"}], "[", 
        RowBox[{
         RowBox[{
          RowBox[{"-", "p"}], " ", "\[Alpha]"}], "+", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", "\[Beta]"}], "+", 
         RowBox[{"z", " ", 
          RowBox[{"Log", "[", 
           RowBox[{
            RowBox[{"p", " ", 
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}],
            "]"}]}], "-", 
         RowBox[{"If", "[", 
          RowBox[{
           RowBox[{"z", "\[LessEqual]", "256"}], ",", 
           RowBox[{"lookup", "[", 
            RowBox[{"[", 
             RowBox[{"z", "+", "1"}], "]"}], "]"}], ",", 
           RowBox[{
            RowBox[{
             RowBox[{"(", 
              RowBox[{"z", "+", "0.5"}], ")"}], 
             RowBox[{"Log", "[", 
              RowBox[{"z", "+", "1"}], "]"}]}], "-", "z", "-", "1", "+", 
            RowBox[{"0.5", " ", 
             RowBox[{"Log", "[", 
              RowBox[{"2", " ", "\[Pi]"}], "]"}]}], "+", 
            RowBox[{"1", "/", 
             RowBox[{"(", 
              RowBox[{
               RowBox[{"12", "z"}], "+", "12"}], ")"}]}]}]}], "]"}]}], 
        "]"}]}], "\[IndentingNewLine]", "]"}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"loglikelihoodCa", "=", 
   RowBox[{"With", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"lookup", "=", "logfaclookup"}], "}"}], ",", 
     RowBox[{"Compile", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"\[Alpha]", ",", "_Real", ",", "1"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"\[Beta]", ",", "_Real", ",", "1"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"p", ",", "_Real", ",", "1"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"z", ",", "_Integer"}], "}"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{
         RowBox[{"-", "p"}], " ", "\[Alpha]"}], "+", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{
           RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", "\[Beta]"}], "+", 
        RowBox[{"z", " ", 
         RowBox[{"Log", "[", 
          RowBox[{
           RowBox[{"p", " ", 
            RowBox[{"(", 
             RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}], 
          "]"}]}], "-", 
        RowBox[{"If", "[", 
         RowBox[{
          RowBox[{"z", "\[LessEqual]", "256"}], ",", 
          RowBox[{"lookup", "[", 
           RowBox[{"[", 
            RowBox[{"z", "+", "1"}], "]"}], "]"}], ",", 
          RowBox[{
           RowBox[{
            RowBox[{"(", 
             RowBox[{"z", "+", "0.5"}], ")"}], 
            RowBox[{"Log", "[", 
             RowBox[{"z", "+", "1"}], "]"}]}], "-", "z", "-", "1", "+", 
           RowBox[{"0.5", " ", 
            RowBox[{"Log", "[", 
             RowBox[{"2", " ", "\[Pi]"}], "]"}]}], "+", 
           RowBox[{"1", "/", 
            RowBox[{"(", 
             RowBox[{
              RowBox[{"12", "z"}], "+", "12"}], ")"}]}]}]}], "]"}]}]}], 
      "\[IndentingNewLine]", "]"}]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"likelihoodCCa", "=", 
   RowBox[{"With", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"lookup", "=", "logfaclookup"}], "}"}], ",", 
     RowBox[{"Compile", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"\[Alpha]", ",", "_Real", ",", "1"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"\[Beta]", ",", "_Real", ",", "1"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"p", ",", "_Real", ",", "1"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"z", ",", "_Integer"}], "}"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{
         RowBox[{"Exp", "[", 
          RowBox[{"#", "-", 
           RowBox[{"Max", "[", "#", "]"}]}], "]"}], "&"}], "[", 
        RowBox[{
         RowBox[{
          RowBox[{"-", "p"}], " ", "\[Alpha]"}], "+", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", "\[Beta]"}], "+", 
         RowBox[{"z", " ", 
          RowBox[{"Log", "[", 
           RowBox[{
            RowBox[{"p", " ", 
             RowBox[{"(", 
              RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}],
            "]"}]}], "-", 
         RowBox[{"If", "[", 
          RowBox[{
           RowBox[{"z", "\[LessEqual]", "256"}], ",", 
           RowBox[{"lookup", "[", 
            RowBox[{"[", 
             RowBox[{"z", "+", "1"}], "]"}], "]"}], ",", 
           RowBox[{
            RowBox[{
             RowBox[{"(", 
              RowBox[{"z", "+", "0.5"}], ")"}], 
             RowBox[{"Log", "[", 
              RowBox[{"z", "+", "1"}], "]"}]}], "-", "z", "-", "1", "+", 
            RowBox[{"0.5", " ", 
             RowBox[{"Log", "[", 
              RowBox[{"2", " ", "\[Pi]"}], "]"}]}], "+", 
            RowBox[{"1", "/", 
             RowBox[{"(", 
              RowBox[{
               RowBox[{"12", "z"}], "+", "12"}], ")"}]}]}]}], "]"}]}], "]"}], 
       ",", "\[IndentingNewLine]", 
       RowBox[{"CompilationTarget", "->", "\"\<C\>\""}]}], 
      "\[IndentingNewLine]", "]"}]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"loglikelihoodCCa", "=", 
   RowBox[{"With", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"lookup", "=", "logfaclookup"}], "}"}], ",", 
     RowBox[{"Compile", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"\[Alpha]", ",", "_Real", ",", "1"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"\[Beta]", ",", "_Real", ",", "1"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"p", ",", "_Real", ",", "1"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"z", ",", "_Integer"}], "}"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{
         RowBox[{"-", "p"}], " ", "\[Alpha]"}], "+", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{
           RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", "\[Beta]"}], "+", 
        RowBox[{"z", " ", 
         RowBox[{"Log", "[", 
          RowBox[{
           RowBox[{"p", " ", 
            RowBox[{"(", 
             RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}]}], "+", "\[Beta]"}], 
          "]"}]}], "-", 
        RowBox[{"If", "[", 
         RowBox[{
          RowBox[{"z", "\[LessEqual]", "256"}], ",", 
          RowBox[{"lookup", "[", 
           RowBox[{"[", 
            RowBox[{"z", "+", "1"}], "]"}], "]"}], ",", 
          RowBox[{
           RowBox[{
            RowBox[{"(", 
             RowBox[{"z", "+", "0.5"}], ")"}], 
            RowBox[{"Log", "[", 
             RowBox[{"z", "+", "1"}], "]"}]}], "-", "z", "-", "1", "+", 
           RowBox[{"0.5", " ", 
            RowBox[{"Log", "[", 
             RowBox[{"2", " ", "\[Pi]"}], "]"}]}], "+", 
           RowBox[{"1", "/", 
            RowBox[{"(", 
             RowBox[{
              RowBox[{"12", "z"}], "+", "12"}], ")"}]}]}]}], "]"}]}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"CompilationTarget", "->", "\"\<C\>\""}]}], 
      "\[IndentingNewLine]", "]"}]}], "]"}]}], ";"}]}], "Input"],

Cell["\<\
Whether the compiled-C or compiled does better seems to depend on the amount \
of data. In either case, a huge improvement over the usual evaluation for \
lots of data.\
\>", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Module", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"testVals", "=", 
      RowBox[{"RandomVariate", "[", 
       RowBox[{
        RowBox[{"hyperPriorBP", "[", 
         RowBox[{"70000", ",", "50000", ",", "200", ",", "200", ",", "80"}], 
         "]"}], ",", "100000"}], "]"}]}], ",", "l", ",", "lc", ",", "lcc", 
     ",", "lca", ",", "lcca"}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"testVals", "=", 
     RowBox[{
      RowBox[{"Join", "[", 
       RowBox[{
        RowBox[{"testVals", "\[Transpose]"}], ",", 
        RowBox[{"{", 
         RowBox[{"ConstantArray", "[", 
          RowBox[{"0.5", ",", 
           RowBox[{"Length", "@", "testVals"}]}], "]"}], "}"}]}], "]"}], 
      "\[Transpose]"}]}], ";", "\[IndentingNewLine]", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{
       RowBox[{
        RowBox[{
         RowBox[{"l", "=", 
          RowBox[{"likelihood", "[", 
           RowBox[{
            RowBox[{"testVals", "[", 
             RowBox[{"[", 
              RowBox[{"All", ",", "1"}], "]"}], "]"}], ",", 
            RowBox[{"testVals", "[", 
             RowBox[{"[", 
              RowBox[{"All", ",", "2"}], "]"}], "]"}], ",", 
            RowBox[{"testVals", "[", 
             RowBox[{"[", 
              RowBox[{"All", ",", "3"}], "]"}], "]"}], ",", "60000"}], 
           "]"}]}], ";"}], "//", "Timing"}], "//", "First"}], "//", "Print"}],
      ")"}], ";", "\[IndentingNewLine]", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{
       RowBox[{
        RowBox[{
         RowBox[{"lc", "=", 
          RowBox[{"likelihoodC", "[", 
           RowBox[{
            RowBox[{"testVals", "[", 
             RowBox[{"[", 
              RowBox[{"All", ",", "1"}], "]"}], "]"}], ",", 
            RowBox[{"testVals", "[", 
             RowBox[{"[", 
              RowBox[{"All", ",", "2"}], "]"}], "]"}], ",", 
            RowBox[{"testVals", "[", 
             RowBox[{"[", 
              RowBox[{"All", ",", "3"}], "]"}], "]"}], ",", "60000"}], 
           "]"}]}], ";"}], "//", "Timing"}], "//", "First"}], "//", "Print"}],
      ")"}], ";", "\[IndentingNewLine]", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{
       RowBox[{
        RowBox[{
         RowBox[{"lcc", "=", 
          RowBox[{"likelihoodCC", "[", 
           RowBox[{
            RowBox[{"testVals", "[", 
             RowBox[{"[", 
              RowBox[{"All", ",", "1"}], "]"}], "]"}], ",", 
            RowBox[{"testVals", "[", 
             RowBox[{"[", 
              RowBox[{"All", ",", "2"}], "]"}], "]"}], ",", 
            RowBox[{"testVals", "[", 
             RowBox[{"[", 
              RowBox[{"All", ",", "3"}], "]"}], "]"}], ",", "60000"}], 
           "]"}]}], ";"}], "//", "Timing"}], "//", "First"}], "//", "Print"}],
      ")"}], ";", "\[IndentingNewLine]", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{
       RowBox[{
        RowBox[{
         RowBox[{"lca", "=", 
          RowBox[{"likelihoodCa", "[", 
           RowBox[{
            RowBox[{"testVals", "[", 
             RowBox[{"[", 
              RowBox[{"All", ",", "1"}], "]"}], "]"}], ",", 
            RowBox[{"testVals", "[", 
             RowBox[{"[", 
              RowBox[{"All", ",", "2"}], "]"}], "]"}], ",", 
            RowBox[{"testVals", "[", 
             RowBox[{"[", 
              RowBox[{"All", ",", "3"}], "]"}], "]"}], ",", "60000"}], 
           "]"}]}], ";"}], "//", "Timing"}], "//", "First"}], "//", "Print"}],
      ")"}], ";", "\[IndentingNewLine]", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{
       RowBox[{
        RowBox[{
         RowBox[{"lcca", "=", 
          RowBox[{"likelihoodCCa", "[", 
           RowBox[{
            RowBox[{"testVals", "[", 
             RowBox[{"[", 
              RowBox[{"All", ",", "1"}], "]"}], "]"}], ",", 
            RowBox[{"testVals", "[", 
             RowBox[{"[", 
              RowBox[{"All", ",", "2"}], "]"}], "]"}], ",", 
            RowBox[{"testVals", "[", 
             RowBox[{"[", 
              RowBox[{"All", ",", "3"}], "]"}], "]"}], ",", "60000"}], 
           "]"}]}], ";"}], "//", "Timing"}], "//", "First"}], "//", "Print"}],
      ")"}], ";", "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"Outer", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"Max", "[", 
         RowBox[{"Abs", "[", 
          RowBox[{"#1", "-", "#2"}], "]"}], "]"}], "&"}], ",", 
       RowBox[{"{", 
        RowBox[{"l", ",", "lc", ",", "lcc", ",", "lca", ",", "lcca"}], "}"}], 
       ",", 
       RowBox[{"{", 
        RowBox[{"l", ",", "lc", ",", "lcc", ",", "lca", ",", "lcca"}], "}"}], 
       ",", "1"}], "]"}], "//", "MatrixForm"}]}]}], "\[IndentingNewLine]", 
  "]"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData["0.132`"], "Print"],

Cell[BoxData["0.008`"], "Print"],

Cell[BoxData["0.008`"], "Print"],

Cell[BoxData["0.004`"], "Print"],

Cell[BoxData["0.008`"], "Print"]
}, Open  ]],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {"0``12.663483501295298", "1.3993888513252895`*^-12", 
      "1.3993888513252895`*^-12", "0.9983713272222419`", 
      "0.9983713272222419`"},
     {"1.3993888513252895`*^-12", "0.`", "0.`", "0.9983713272212217`", 
      "0.9983713272212217`"},
     {"1.3993888513252895`*^-12", "0.`", "0.`", "0.9983713272212217`", 
      "0.9983713272212217`"},
     {"0.9983713272222419`", "0.9983713272212217`", "0.9983713272212217`", 
      "0.`", "0.`"},
     {"0.9983713272222419`", "0.9983713272212217`", "0.9983713272212217`", 
      "0.`", "0.`"}
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
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["Data-Generator", "Subsection"],

Cell["\<\
Draws nParams from the hyper prior to get references, and uses each reference \
along with p to draw samples from the model\
\>", "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{"genData", "[", 
   RowBox[{"p_", ",", "hyperPrior_", ",", "nParam_", ",", "nSampPerParam_"}], 
   "]"}], ":=", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"params", ",", "data"}], "}"}], ",", "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"params", "=", 
      RowBox[{"RandomVariate", "[", 
       RowBox[{"hyperPrior", ",", "nParam"}], "]"}]}], ";", 
     "\[IndentingNewLine]", 
     RowBox[{"data", "=", 
      RowBox[{"Table", "[", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{
            RowBox[{"Sequence", "@@", "param"}], ",", "p"}], "}"}], ",", 
          RowBox[{"RandomVariate", "[", 
           RowBox[{
            RowBox[{"model", "[", 
             RowBox[{
              RowBox[{"Sequence", "@@", "param"}], ",", "p"}], "]"}], ",", 
            "nSampPerParam"}], "]"}]}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{"param", ",", "params"}], "}"}]}], "]"}]}], ";", 
     "\[IndentingNewLine]", "data"}]}], "\[IndentingNewLine]", 
   "]"}]}]], "Input"],

Cell["Test:", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"genData", "[", 
  RowBox[{"0.5", ",", 
   RowBox[{"hyperPriorNormal", "[", 
    RowBox[{"700", ",", "500", ",", "200", ",", "200", ",", "80"}], "]"}], 
   ",", "5", ",", "2"}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"647.8910469750833`", ",", "534.354397602795`", ",", "0.5`"}], 
      "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"651", ",", "538", ",", "595"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"683", ",", "530", ",", "572"}], "}"}]}], "}"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"322.7338198206741`", ",", "441.6244321794603`", ",", "0.5`"}], 
      "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"351", ",", "459", ",", "375"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"313", ",", "437", ",", "393"}], "}"}]}], "}"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"859.8658043395828`", ",", "119.07200797403851`", ",", "0.5`"}],
       "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"893", ",", "118", ",", "496"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"795", ",", "128", ",", "483"}], "}"}]}], "}"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"723.9172098257438`", ",", "731.4808094489288`", ",", "0.5`"}], 
      "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"780", ",", "723", ",", "757"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"726", ",", "730", ",", "725"}], "}"}]}], "}"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"656.409118334454`", ",", "558.9503155060961`", ",", "0.5`"}], 
      "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"668", ",", "571", ",", "622"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"678", ",", "557", ",", "609"}], "}"}]}], "}"}]}], "}"}]}], 
  "}"}]], "Output"]
}, Open  ]],

Cell["\<\
Extreme example of \[Alpha]s being a mixture distribution because of large \
\[Alpha]sigma in hyperPrior:\
\>", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Histogram", "[", 
  RowBox[{
   RowBox[{"genData", "[", 
    RowBox[{"0.5", ",", 
     RowBox[{"hyperPriorNormal", "[", 
      RowBox[{"700", ",", "500", ",", "200", ",", "200", ",", "80"}], "]"}], 
     ",", "5", ",", "1000"}], "]"}], "[", 
   RowBox[{"[", 
    RowBox[{"All", ",", "2", ",", "All", ",", "1"}], "]"}], "]"}], 
  "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{
   {RGBColor[0.987148, 0.8073604000000001, 0.49470040000000004`], EdgeForm[{
    Opacity[0.518], Thickness[Small]}], {{}, 
     {RGBColor[0.97858, 0.678934, 0.157834], Opacity[0.5], EdgeForm[{Opacity[
      0.518], Thickness[Small]}], RectangleBox[{680., 0.}, {700., 3},
       RoundingRadius->0], RectangleBox[{700., 0.}, {720., 10},
       RoundingRadius->0], RectangleBox[{720., 0.}, {740., 63},
       RoundingRadius->0], RectangleBox[{740., 0.}, {760., 162},
       RoundingRadius->0], RectangleBox[{760., 0.}, {780., 273},
       RoundingRadius->0], RectangleBox[{780., 0.}, {800., 270},
       RoundingRadius->0], RectangleBox[{800., 0.}, {820., 151},
       RoundingRadius->0], RectangleBox[{820., 0.}, {840., 50},
       RoundingRadius->0], RectangleBox[{840., 0.}, {860., 13},
       RoundingRadius->0], RectangleBox[{860., 0.}, {880., 4},
       RoundingRadius->0], RectangleBox[{880., 0.}, {900., 1},
       RoundingRadius->0]}, {}, {}}, {{}, 
     {RGBColor[0.368417, 0.506779, 0.709798], Opacity[0.5], EdgeForm[{Opacity[
      0.518], Thickness[Small]}], RectangleBox[{780., 0.}, {800., 3},
       RoundingRadius->0], RectangleBox[{800., 0.}, {820., 24},
       RoundingRadius->0], RectangleBox[{820., 0.}, {840., 87},
       RoundingRadius->0], RectangleBox[{840., 0.}, {860., 185},
       RoundingRadius->0], RectangleBox[{860., 0.}, {880., 260},
       RoundingRadius->0], RectangleBox[{880., 0.}, {900., 232},
       RoundingRadius->0], RectangleBox[{900., 0.}, {920., 129},
       RoundingRadius->0], RectangleBox[{920., 0.}, {940., 62},
       RoundingRadius->0], RectangleBox[{940., 0.}, {960., 18},
       RoundingRadius->0]}, {}, {}}, {{}, 
     {RGBColor[0.560181, 0.691569, 0.194885], Opacity[0.5], EdgeForm[{Opacity[
      0.518], Thickness[Small]}], RectangleBox[{540., 0.}, {560., 2},
       RoundingRadius->0], RectangleBox[{560., 0.}, {580., 14},
       RoundingRadius->0], RectangleBox[{580., 0.}, {600., 82},
       RoundingRadius->0], RectangleBox[{600., 0.}, {620., 199},
       RoundingRadius->0], RectangleBox[{620., 0.}, {640., 316},
       RoundingRadius->0], RectangleBox[{640., 0.}, {660., 226},
       RoundingRadius->0], RectangleBox[{660., 0.}, {680., 126},
       RoundingRadius->0], RectangleBox[{680., 0.}, {700., 30},
       RoundingRadius->0], RectangleBox[{700., 0.}, {720., 4},
       RoundingRadius->0], RectangleBox[{720., 0.}, {740., 1},
       RoundingRadius->0]}, {}, {}}, {{}, 
     {RGBColor[0.922526, 0.385626, 0.209179], Opacity[0.5], EdgeForm[{Opacity[
      0.518], Thickness[Small]}], RectangleBox[{480., 0.}, {500., 3},
       RoundingRadius->0], RectangleBox[{500., 0.}, {520., 60},
       RoundingRadius->0], RectangleBox[{520., 0.}, {540., 174},
       RoundingRadius->0], RectangleBox[{540., 0.}, {560., 335},
       RoundingRadius->0], RectangleBox[{560., 0.}, {580., 268},
       RoundingRadius->0], RectangleBox[{580., 0.}, {600., 124},
       RoundingRadius->0], RectangleBox[{600., 0.}, {620., 36},
       RoundingRadius->0]}, {}, {}}, {{}, 
     {RGBColor[0.528488, 0.470624, 0.701351], Opacity[0.5], EdgeForm[{Opacity[
      0.518], Thickness[Small]}], RectangleBox[{740., 0.}, {760., 1},
       RoundingRadius->0], RectangleBox[{760., 0.}, {780., 25},
       RoundingRadius->0], RectangleBox[{780., 0.}, {800., 99},
       RoundingRadius->0], RectangleBox[{800., 0.}, {820., 178},
       RoundingRadius->0], RectangleBox[{820., 0.}, {840., 266},
       RoundingRadius->0], RectangleBox[{840., 0.}, {860., 226},
       RoundingRadius->0], RectangleBox[{860., 0.}, {880., 140},
       RoundingRadius->0], RectangleBox[{880., 0.}, {900., 47},
       RoundingRadius->0], RectangleBox[{900., 0.}, {920., 14},
       RoundingRadius->0], RectangleBox[{920., 0.}, {940., 4},
       RoundingRadius->
        0]}, {}, {}}}, {{{{}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}}, {}}, \
{{{}, {}, {}, {}, {}, {}, {}, {}, {}}, {}}, {{{}, {}, {}, {}, {}, {}, {}, {}, \
{}, {}}, {}}, {{{}, {}, {}, {}, {}, {}, {}}, {}}, {{{}, {}, {}, {}, {}, {}, \
{}, {}, {}, {}}, {}}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{None, None},
  AxesOrigin->{470.4, 0.},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  PlotRange->{{480., 960.}, {All, All}},
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.02], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["MLE", "Subsection"],

Cell["\<\
MLE of the model. We are actually using the biased estimator with \
\[Epsilon]=0.01 to avoid dividing by zero. \
\>", "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{"estimatorMLE", "[", "data_", "]"}], ":=", 
  RowBox[{
   RowBox[{"(", 
    RowBox[{
     RowBox[{"data", "[", 
      RowBox[{"[", "3", "]"}], "]"}], "-", 
     RowBox[{"data", "[", 
      RowBox[{"[", "2", "]"}], "]"}]}], ")"}], "/", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"data", "[", 
      RowBox[{"[", "1", "]"}], "]"}], "-", 
     RowBox[{"data", "[", 
      RowBox[{"[", "2", "]"}], "]"}], "+", "0.01"}], ")"}]}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"estimatorMLE", "[", 
    RowBox[{
     RowBox[{"Last", "[", "#", "]"}], "\[Transpose]"}], "]"}], "&"}], "/@", 
  RowBox[{"genData", "[", 
   RowBox[{"0.5", ",", 
    RowBox[{"hyperPriorBP", "[", 
     RowBox[{"70000", ",", "50000", ",", "200", ",", "200", ",", "80"}], 
     "]"}], ",", "5", ",", "10"}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
    "0.5225175019660249`", ",", "0.49930051312968715`", ",", 
     "0.5139733788147384`", ",", "0.511831597388896`", ",", 
     "0.48227755067719497`", ",", "0.4995404207714501`", ",", 
     "0.5161475151183915`", ",", "0.4836175198169242`", ",", 
     "0.5045623533866408`", ",", "0.4816794960347716`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
    "0.5044879067602361`", ",", "0.4995372220959044`", ",", 
     "0.5324794678270378`", ",", "0.49902264918442196`", ",", 
     "0.5184541270264561`", ",", "0.5087793011194881`", ",", 
     "0.48183727087369776`", ",", "0.4834924871485958`", ",", 
     "0.49317934583937895`", ",", "0.4832529091174125`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
    "0.49911854700469266`", ",", "0.49473117721347876`", ",", 
     "0.4812340292478158`", ",", "0.5018596291281106`", ",", 
     "0.4929092032054423`", ",", "0.5177499644207729`", ",", 
     "0.48443241102322837`", ",", "0.5125434531734564`", ",", 
     "0.5122389781614634`", ",", "0.4991967573969034`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
    "0.5137581078586824`", ",", "0.5026552227427469`", ",", 
     "0.501192356791713`", ",", "0.5217907672009322`", ",", 
     "0.517340211385151`", ",", "0.5076167486055899`", ",", 
     "0.4858169375872244`", ",", "0.4963830624413572`", ",", 
     "0.4883765088294044`", ",", "0.4817765854035589`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
    "0.4933512850238713`", ",", "0.48719346213902287`", ",", 
     "0.48012972750326044`", ",", "0.4976462205076512`", ",", 
     "0.5120013498034801`", ",", "0.4827378557847938`", ",", 
     "0.5074041888111924`", ",", "0.48987849991056226`", ",", 
     "0.5251614161472231`", ",", "0.5279395517656578`"}], "}"}]}], 
  "}"}]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["MLE Bias Corrected", "Subsection"],

Cell["Try the bias corrected MLE:", "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{"estimatorMLEBC", "[", "data_", "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"x", "=", 
       RowBox[{"data", "[", 
        RowBox[{"[", "1", "]"}], "]"}]}], ",", 
      RowBox[{"y", "=", 
       RowBox[{"data", "[", 
        RowBox[{"[", "2", "]"}], "]"}]}], ",", 
      RowBox[{"z", "=", 
       RowBox[{"data", "[", 
        RowBox[{"[", "3", "]"}], "]"}]}]}], "}"}], ",", "\[IndentingNewLine]", 
    FractionBox[
     RowBox[{
      RowBox[{"z", 
       RowBox[{"(", 
        RowBox[{
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{"x", "-", "y"}], ")"}], "2"], "-", "x", "-", "y"}], 
        ")"}]}], "-", 
      RowBox[{"y", 
       RowBox[{"(", 
        RowBox[{
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{"x", "-", "y"}], ")"}], "2"], "-", 
         RowBox[{"2", "x"}], "-", 
         RowBox[{"2", "y"}]}], ")"}]}]}], 
     RowBox[{
      SuperscriptBox[
       RowBox[{"(", 
        RowBox[{"x", "-", "y"}], ")"}], "3"], "+", "0.01"}]]}], 
   "\[IndentingNewLine]", "]"}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"estimatorMLEBC", "[", 
    RowBox[{
     RowBox[{"Last", "[", "#", "]"}], "\[Transpose]"}], "]"}], "&"}], "/@", 
  RowBox[{"genData", "[", 
   RowBox[{"0.5", ",", 
    RowBox[{"hyperPriorBP", "[", 
     RowBox[{"70000", ",", "50000", ",", "200", ",", "200", ",", "80"}], 
     "]"}], ",", "5", ",", "10"}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
    "0.4878076094663734`", ",", "0.523240147685506`", ",", 
     "0.5150037336807193`", ",", "0.532935735143544`", ",", 
     "0.5003765733724729`", ",", "0.5163472120314909`", ",", 
     "0.4954595141407376`", ",", "0.4931764411034215`", ",", 
     "0.5061314360756454`", ",", "0.4867156208852227`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
    "0.5254157919574292`", ",", "0.5294973279577858`", ",", 
     "0.5188345877649296`", ",", "0.4789846189412754`", ",", 
     "0.5017245203618257`", ",", "0.5223742797558303`", ",", 
     "0.503904585388614`", ",", "0.49411615282494575`", ",", 
     "0.49978990142584806`", ",", "0.48284395556684195`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
    "0.5026925333130445`", ",", "0.4946710388917362`", ",", 
     "0.5150342973604686`", ",", "0.5040834175090518`", ",", 
     "0.547969639474364`", ",", "0.5078236125328732`", ",", 
     "0.49741484623839927`", ",", "0.4988491363813768`", ",", 
     "0.5094040084876512`", ",", "0.5129533567634018`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
    "0.4831074642948521`", ",", "0.5183056458833099`", ",", 
     "0.49581201740151154`", ",", "0.4875439959419332`", ",", 
     "0.49528764009583526`", ",", "0.5280619011880745`", ",", 
     "0.50571406356408`", ",", "0.5068145615003944`", ",", 
     "0.495174867139603`", ",", "0.4928377904160063`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
    "0.4913804192744071`", ",", "0.5012413425712745`", ",", 
     "0.5075399827796437`", ",", "0.5084808096245421`", ",", 
     "0.487635464599978`", ",", "0.5054357948375974`", ",", 
     "0.5214187913295004`", ",", "0.5085255719015432`", ",", 
     "0.5112514353662494`", ",", "0.4959316298416533`"}], "}"}]}], 
  "}"}]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["Bayes", "Subsection"],

Cell["\<\
The Bayes estimator is quite a bit more work to set up. We do this over 4 \
subsections.\
\>", "Text"],

Cell[CellGroupData[{

Cell["Priors", "Subsubsection"],

Cell["\<\
Put a uniform prior on p, and a product of Gammas (conjugate to product of \
Poisson) on \[Alpha] and \[Beta].\
\>", "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{"uniformP", "=", 
   RowBox[{"UniformDistribution", "[", "]"}]}], ";"}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"uncorrRefPrior", "[", 
   RowBox[{
   "\[Mu]\[Alpha]_", ",", "\[Mu]\[Beta]_", ",", "\[Sigma]\[Alpha]_", ",", 
    "\[Sigma]\[Beta]_"}], "]"}], ":=", 
  RowBox[{"ProductDistribution", "[", 
   RowBox[{
    RowBox[{"GammaDistribution", "[", 
     RowBox[{
      SuperscriptBox[
       RowBox[{"(", 
        RowBox[{"\[Mu]\[Alpha]", "/", "\[Sigma]\[Alpha]"}], ")"}], "2"], ",", 
      
      SuperscriptBox[
       RowBox[{"(", 
        RowBox[{"\[Mu]\[Alpha]", "/", 
         SuperscriptBox["\[Sigma]\[Alpha]", "2"]}], ")"}], 
       RowBox[{"-", "1"}]]}], "]"}], ",", 
    RowBox[{"GammaDistribution", "[", 
     RowBox[{
      SuperscriptBox[
       RowBox[{"(", 
        RowBox[{"\[Mu]\[Beta]", "/", "\[Sigma]\[Beta]"}], ")"}], "2"], ",", 
      SuperscriptBox[
       RowBox[{"(", 
        RowBox[{"\[Mu]\[Beta]", "/", 
         SuperscriptBox["\[Sigma]\[Beta]", "2"]}], ")"}], 
       RowBox[{"-", "1"}]]}], "]"}]}], "]"}]}]], "Input"],

Cell["The moments work as expected:", "Text"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"Mean", "[", 
  RowBox[{"uncorrRefPrior", "[", 
   RowBox[{
   "\[Mu]\[Alpha]", ",", "\[Mu]\[Beta]", ",", "\[Sigma]\[Alpha]", ",", 
    "\[Sigma]\[Beta]"}], "]"}], "]"}], "\[IndentingNewLine]", 
 RowBox[{"FullSimplify", "[", 
  RowBox[{
   RowBox[{"StandardDeviation", "[", 
    RowBox[{"uncorrRefPrior", "[", 
     RowBox[{
     "\[Mu]\[Alpha]", ",", "\[Mu]\[Beta]", ",", "\[Sigma]\[Alpha]", ",", 
      "\[Sigma]\[Beta]"}], "]"}], "]"}], ",", 
   RowBox[{"Assumptions", "->", 
    RowBox[{
     RowBox[{"\[Mu]\[Alpha]", ">", "0"}], "&&", 
     RowBox[{"\[Mu]\[Beta]", ">", "0"}], "&&", 
     RowBox[{"\[Sigma]\[Alpha]", ">", "0"}], "&&", 
     RowBox[{"\[Sigma]\[Beta]", ">", "0"}]}]}]}], "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"\[Mu]\[Alpha]", ",", "\[Mu]\[Beta]"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"\[Sigma]\[Alpha]", ",", "\[Sigma]\[Beta]"}], "}"}]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["Uncorrelated Posterior", "Subsubsection"],

Cell["\<\
The posterior of product gamma distribution prior with respective mean/std (\
\[Mu]\[Alpha],\[Sigma]\[Alpha]) and (\[Mu]\[Beta],\[Sigma]\[Beta])\
\>", "Text"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"(", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"ap", "\[Rule]", 
       RowBox[{"a", "+", "x"}]}], ",", 
      RowBox[{"bp", "->", 
       RowBox[{"b", "+", "1"}]}]}], "}"}], "/.", 
    RowBox[{"First", "@", 
     RowBox[{"Solve", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\[Mu]", "==", 
          RowBox[{"a", "/", "b"}]}], ",", 
         RowBox[{
          SuperscriptBox["\[Sigma]", "2"], "\[Equal]", 
          RowBox[{"a", "/", 
           SuperscriptBox["b", "2"]}]}]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"a", ",", "b"}], "}"}]}], "]"}]}]}], ")"}], "//", 
  "FullSimplify"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"ap", "/", "bp"}], ",", 
     RowBox[{"ap", "/", 
      SuperscriptBox["bp", "2"]}]}], "}"}], "/.", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"ap", "\[Rule]", 
        RowBox[{"a", "+", "x"}]}], ",", 
       RowBox[{"bp", "->", 
        RowBox[{"b", "+", "1"}]}]}], "}"}], "/.", 
     RowBox[{"First", "@", 
      RowBox[{"Solve", "[", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{
          RowBox[{"\[Mu]", "==", 
           RowBox[{"a", "/", "b"}]}], ",", 
          RowBox[{
           SuperscriptBox["\[Sigma]", "2"], "\[Equal]", 
           RowBox[{"a", "/", 
            SuperscriptBox["b", "2"]}]}]}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{"a", ",", "b"}], "}"}]}], "]"}]}]}], ")"}]}], "//", 
  "FullSimplify"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"ap", "\[Rule]", 
    RowBox[{"x", "+", 
     FractionBox[
      SuperscriptBox["\[Mu]", "2"], 
      SuperscriptBox["\[Sigma]", "2"]]}]}], ",", 
   RowBox[{"bp", "\[Rule]", 
    RowBox[{"1", "+", 
     FractionBox["\[Mu]", 
      SuperscriptBox["\[Sigma]", "2"]]}]}]}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox[
    RowBox[{
     SuperscriptBox["\[Mu]", "2"], "+", 
     RowBox[{"x", " ", 
      SuperscriptBox["\[Sigma]", "2"]}]}], 
    RowBox[{"\[Mu]", "+", 
     SuperscriptBox["\[Sigma]", "2"]}]], ",", 
   FractionBox[
    RowBox[{
     SuperscriptBox["\[Sigma]", "2"], " ", 
     RowBox[{"(", 
      RowBox[{
       SuperscriptBox["\[Mu]", "2"], "+", 
       RowBox[{"x", " ", 
        SuperscriptBox["\[Sigma]", "2"]}]}], ")"}]}], 
    SuperscriptBox[
     RowBox[{"(", 
      RowBox[{"\[Mu]", "+", 
       SuperscriptBox["\[Sigma]", "2"]}], ")"}], "2"]]}], "}"}]], "Output"]
}, Open  ]],

Cell["\<\
Return a function that computes the posterior given data tuple (x,y):\
\>", "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"uncorrRefPosterior", "[", 
    RowBox[{
    "\[Mu]\[Alpha]_", ",", "\[Mu]\[Beta]_", ",", "\[Sigma]\[Alpha]_", ",", 
     "\[Sigma]\[Beta]_"}], "]"}], "[", 
   RowBox[{"x_", ",", "y_"}], "]"}], ":=", 
  RowBox[{"ProductDistribution", "[", 
   RowBox[{
    RowBox[{"GammaDistribution", "[", 
     RowBox[{
      RowBox[{"x", "+", 
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{"\[Mu]\[Alpha]", "/", "\[Sigma]\[Alpha]"}], ")"}], "2"]}], 
      ",", 
      SuperscriptBox[
       RowBox[{"(", 
        RowBox[{"1", "+", 
         RowBox[{"\[Mu]\[Alpha]", "/", 
          RowBox[{"\[Sigma]\[Alpha]", "^", "2"}]}]}], ")"}], 
       RowBox[{"-", "1"}]]}], "]"}], ",", 
    RowBox[{"GammaDistribution", "[", 
     RowBox[{
      RowBox[{"y", "+", 
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{"\[Mu]\[Beta]", "/", "\[Sigma]\[Beta]"}], ")"}], "2"]}], ",", 
      SuperscriptBox[
       RowBox[{"(", 
        RowBox[{"1", "+", 
         RowBox[{"\[Mu]\[Beta]", "/", 
          RowBox[{"\[Sigma]\[Beta]", "^", "2"}]}]}], ")"}], 
       RowBox[{"-", "1"}]]}], "]"}]}], "]"}]}]], "Input"],

Cell["Posterior sits on top of data point:", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ContourPlot", "[", 
  RowBox[{
   RowBox[{"PDF", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"uncorrRefPosterior", "[", 
       RowBox[{"1000", ",", "600", ",", "100", ",", "60"}], "]"}], "[", 
      RowBox[{"1050", ",", "650"}], "]"}], ",", 
     RowBox[{"{", 
      RowBox[{"\[Alpha]", ",", "\[Beta]"}], "}"}]}], "]"}], ",", 
   RowBox[{"{", 
    RowBox[{"\[Alpha]", ",", "900", ",", "1100"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"\[Beta]", ",", "500", ",", "700"}], "}"}], ",", 
   RowBox[{"Epilog", "\[Rule]", 
    RowBox[{"{", 
     RowBox[{"Red", ",", 
      RowBox[{"Point", "[", 
       RowBox[{"{", 
        RowBox[{"1050", ",", "650"}], "}"}], "]"}]}], "}"}]}], ",", 
   RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[GraphicsComplexBox[CompressedData["
1:eJxtXHk8Vs/3t7TIllKRViFUIm1a1FHSor0QUiRttFEqUTz3PmjzXJIllawV
WpSUsrURLVq0EWmTorRvkt/w+Z7Gvc+vf57Xu3PvzLznzpx5n5k5tJesnesm
JyMjc7WdjEzzb8u/vruh5Re2g97UMN2pYRRPa4Zt9vzDa8szV5d7UxxOzLpv
Kc5aTR5wDPmHK8njmbcolm/5lfzDBs31naa4fzPuzP3D55vLs6a4pT0sxU+b
y8+heE1z+75T3PJrEsrHhG8Lz87+//giRr6IkS9i5IsY+SJGvoiRL2Lkixj5
Ika+vPawFCNfxMgXMfLlYcL3v3IoX8TIFzHyRYx8ESNfxMgXMfJFjHwRI1/E
yJfXHpZi5IsY+SJGvjxM+Lbw+E75Ika+iJEvYuSLGPkiRr6IkS9i5IsY+SJG
vrz2sBQjX8TIFzHy5WHCt6XdKwP+8UWMfBEjX8TIFzHyRYx8ESNfxMgXMfJF
jHx57WEpRr6IkS9i5MvDhG9LO8spX8TIFzHyRYx8ESNfxMgXMfJFjHwRI1/E
yJfXHpZi5IsY+SJGvjxM+La0a4boH1/EyBcx8kWMfBEjX8TIFzHyRYx8ESNf
xMiX1x6WYuSLGPkiRr48TPi2tCOf8kWMfBEjX8TIFzHyRYx8ESNfxMgXMfJF
jHx57WEpRr6IkS9i5MvDhG9LvabMP76IkS9i5IsY+SJGvoiRL2Lkixj5Ika+
iJEvrz0sxcgXMfJFjHx5mPCd0VxOIuWLGPkiRr6IkS9i5IsY+SJGvoiRL2Lk
ixj58trDUox8ESNfxMiXhwlfz+bnurH/+CJGvoiRL2Lkixj5Ika+iJEvYuSL
GPkiRr689rAUI1/EyBcx8uVhwjeyud07KF/EyBcx8kWMfBEjX8TIFzHyRYx8
ESNfxMiX1x6WYuSLGPkiRr48TPhmN5fbQPkiRr6IkS9i5IsY+SJGvoiRL2Lk
ixj5Ika+vPawFCNfxMgXMfLlYcL3efN7q8X/+CJGvoiRL2Lkixj5Ika+iJEv
YuSLGPkiRr689rAUI1/EyBcx8uVhjI+qxPz4qIryRcyLj6rE/PioSsyPj6rE
/PioSsyPj6rE/PioSsyPj6rE/PioivJFzIuPqsT8+KiK8kXc/Lqu/f/iodOC
eIngc831qYfy7SYU4/vrmutJpv2HGN8XYmH9LRi28+2wnW9v1X4sr+XzjN39
33Nb/hcfaof+w2hv6bcr4n92xNhe4ftYP74vrB/f59lbxZ9YHpYvrB/Li2h5
TvIfn0ARXGh+rpbilvE1mPuHZZvfW0Hx3ub34yhu+W0n+a/cX6J/5SPG8hFj
+YixfMRYPuLpzcTCQ/4rx535Vx9irA8x1ocY60OM9SHG+hC3jLMyirH+quZ+
rKD1I8b6EWP9iLF+xFg/YqwPMY5HxFh/m+b3ZrP/6keM9SPG+hFjfYiRL2Ks
HzHWLyxvQPNzl9l/fBBj+YixfMRYPmIsHzGWP7OZ5zDxv/IRY/mIsXzEWD5i
LB8xb3wni/njO1nMH9/JYv74TqblI0Z/ieMf+1+o59GO/hMx+k/EvPJbYRz/
6K8R4/cX6mvh/BPqbeF8FOpv4fwU6nHhfBXqc+H8RTt+D7QjP6Ed5xuuV8L5
J9TbQn8g1N9C/yDU40J/IdTnQv8h1OtCfyLU70L/gvMZ10ehvxHqe7Rj/6Ad
+0Oox4X+SajPhf5KqNeF/kuo34X+DP0D9gfakT9i5M+LT8ooRn6IkR/6B+Qn
9H9oR35Cf4h25Cf0Z0K9jnbkJ9TvQn8q1PNC/8qLT8ooRr7CeEPIFzHyRX+G
fNGOfNGOfIX+VajXhf5cqN+F/l2o54X+Xqjvhf5fqPeF64Ew/hDyRczTL8mU
L9qRH2LkgxjbjxjbK1xPhPGAsD7EPP+eLOb792Ra3/+LW/l74X4O+kvsH/SX
2N+8/YvBnNT8wfGF4wcx9p/Qjv2PdiHG/njW/Lvvf/414X/riY7kv//vyvyz
I245A2rD/cMt8Yo5xS396U3xvmZ7+v/0TjDzr3zEWD5iLB8xlo8Yy0fc8r1O
clLlGzY/95uWjxjLR4zPt4wXD/bf84ixPsRYH2Isz6u53yvZf+1FjO8jxvcR
t4yvGopR3wvtUc3lzhH/Nx4WSv77ffo//dGX9nfL+/YUt4y/MIr1m9vzLgTW
N///TOZfeYhbfm9TjPwQY32Ika/Qjt8D24N27A/EaMfnsb1ox/5CjHZ8vsX/
3BTUX0Mx2oXjo2UeXKL8EeP3R4z9IcQ4fpAv2rE/EKMdn0e+aMf+QIztFWLh
eL3Y/DuUjlfEyAfHJ7YX7fg9EaMdn8f2Icb+xuexPcLyWvRBEi2PN377Ujv2
D2K088a/PbVj/yBGOz6P7UM7YrRje9GOGO3N1eu2Df1nRz5tm381xf/ahxjb
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
o7lhlt/pfX9X3/YuW02oXkC96tTvjEyTA9HHc59dTiXr5ZyAjV9MlxH9MM9x
mwzha86sXvWUxBNpj05dPbhfOj8psGuS7TpnFvrsuqFkV8TBrqMXnWE5C8VW
Jkc3PSHxVx9xdEAQzTeYWKQYOpH4++tr7AzPlEjnP/2ebqG8y4mWP8r/Z9sC
ou83+zjMGZwmnf80472l7Vai98f5dTm/JUU6H6pCfUCpQfN+c9KdlNUv6PuP
3G+8V/5B45/O6tGjjnWSzocqDoyJjiyh+TJ99Ep2F5ezsM+hXKfmDM2HKc9l
FT1C6f0G9C/LDHz7TSxgYdvY3M+7H0vnR5UPSW8yuUhxg/GJZQkfaX+xkXXj
7Uj9C3o2vFrWRPRVsZa6830W7EICrC5V0vsJOL9v/YhWX3+ChZd746IT2oVK
5UuFSIasibjGQlGvd7fu3ZXOl4reJFmmbSEG0W0xG/xSOn9qqGnv4WUDxaDk
tGGE+KMEYgNyrh8bJQZHu5VHfTsQPbXR22KglRg2POq7JoXopUe50WWaC1rl
T623cZhM1vPtsxRm/yR6qFrDaUyBjRh6JXdpYyWi+RULUpOVo5LJ+7HPzLeM
F4OTZlhv7hEZnzarSyxX0HyCTqXFPkVkvY9XcVh2mIyP10aVdgrHaL7Uzi05
c8zPiKDJ5e1vS/L+rNtz5ikUiGD1iqedVmlz4H3JXS93CN0PszQa9PTRDBaU
FPUVrmtL50up2fhrgh/1L5VPNC06HGVh0lwDswGb6Hz7atIhrPgr/fsqecab
/4YvpuPlo3m5yhBv6fyp0qDZHxRv0Pt9cia6Ofefi+Cv/YJbj/vQfKno+6MW
f2+VP3XxJui86xUKfXcVWs/uRfOb1hqEHt6lx8DDJvmQQFlOKl+qVvtueuBh
BoKeTZsgaqT77+qpaVazKujzj4NvOQT1CpXKnxrw0fSFEdGrvaLG7nZIo/kq
A8/OZ34l0f3Yn7pus2ImUP+aajux5yWiT64Fmyc7AQtt33S7UyuSzndKeHzt
ypZDLLgoP1fbqkXznboP+zN2xF3pfKfTzxZtakPm0/zkA6E7Tej3EN9tsP94
Vjr/Kf3JsaiVMmJIr/hkcfaNdD5U3AGtHv1/k/GwLWDzpp6hsDREf3SACs1/
sso/dCpblub/rDbeGJFH5kenJlNTQ0Pp/KfddcsuvO0phtvvL2w3TpHw/14V
+d7jY+wcDPbR+XJDd8aK23E0ftY6vXqC3X6a/xSkPbjz8ESa/zToS0P3o6V0
/zN2z3Sdgkc0/8nh2cHnxSn0eU2Nl7VZC2i+05Z96zhbG5rvEzfM+YxloBic
tytdSG/19wgtsm7IbIujuENQ5cgnN2h+05b3g9OUUv+f/KZv07abd2FhcLV7
xtNW+U6v6qeM/Ej09fEG3abfZP389G7AQ+tA6fymE5NvrrQppfuXJo132p3a
SMZbgTqbuYv690/vtwX98qLrC77fZ5+T/KvpdL8leLvzidtkfZtzQvL0YKF0
PpQoZmWPqBdk/Tl0ZMbbn9L5UY6Rf+RLe4hBnVmbl9pVOl/qccY6LoDEz9OG
FLqv+cNBu3GTJp0fT/OjXsdv6dPdlPqzmtPPQspyaL5TumqnbfIqDNw5XuJy
XZPmS3mUfXlZ01OQj0jiJxnrVJ9EI8J3Se6VgWQ+99cYXc3UiUi8n6meSfTS
Zo+wYh1TBv4PkQ+6wQ==
   "], {{
     {RGBColor[0.148, 0.33, 0.54], EdgeForm[None], 
      GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJxNmGmQVdUVhe/r++4zGFHAoEBABoMKDTS0oiAGRBkUGTthkCC20EqYacEC
BImlKYPMmFTZgIqpQmkgf1IWMhVCJgRMJRENiRmQRCUYIhIRmSHry16v4Md6
957hnrPHdc5+LcdMrZhSkiRJTj+pnv8UaNcXmghXCl8XvunnVcI4YbgwQhgk
9BDuFjrnkuSintXCvcKtwm1CBy3cU2Oz9P658InwsTBNqBQeEaYKD7td7b4x
wgfCHmGv8Bc/3xGma83H01jjZuF6oZFwk3Cd262kyHTtWyV0Es6p71GhXO/n
9XxMuNFylgvfsry073Ef79+3rg8K3xV6Cb2FrcJ6YYPQ1LapK3QSWrK/12Pd
1l7rRrfLPU67mb+7Wmgs1LHduwpthLZCjTBfeF7oJpQK7bCtdDmj51ihvd7f
1fMgskn35Wq3EyapPUp4SJjs52hhv7BLeFuY4j580NM6lDsWGjgeMqGh8A1h
oTBHmCt8JhwW9gl/FH7jdT9KIp7qJRFb13ot/FMQrrD9VgqrhLusU3uhhzZe
LNmfE4ba3n2EFbbBAuHPwm7Hx522E3bpItxi230niVjEZ3c4VhibKHzPdtng
/V8SBgrdk4jpIbYFsTDe/h8pVLiPdXfIKA0l4wEpOMwy9k0i/tDva8IWYZ11
XSPFm2vuWmFsPkl+nAvDjtT7D/X+mt5f0bOtxsv0nFeI99nCC7n49oI+eUTz
F6k9TeOn9Gzh8Y4aa5FE/F1vfYs5wZM4bGQbMNbEdmvj2GvjsfmOuReTyP1S
z3sgHzm1UHJ21HO7/HRW/aslx1K1v1L/q3pfpvdTes/ywQv5QsTtA0I/oan6
e6m/XiFidXAa8QpXlJkviKnxacRVST5yeJ/WXKH520oi9pN82KlC/T8thDyv
65s0H3n+nvpz+ZD13SzWZo8f2U71HNtNHXulzodNwubkEvdhJ3K0med+7Per
vQZrNfdaLd0mDzYKbybBW/DFtiTynxxq6H3WCrX2C/FSx2uQg/gTnih3e7Pn
Ek/zksjbqfZrQ/sZudpbn6ssLzrssiybPLe1ZdnjGN1qHcqEDknk1maPtbAs
ZZad7+CuK20bYuda97WyHo0cg3U8TpscWyQsToIDrrMsV3gu7Q4lkQtP5IIv
WtkeW/TBLeo7Lf/dJ/RNo93Sdm/g+IU34YCRjjVijvOEfCZ3ObvI0fuSyAF4
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
uZ4=
         "]], PolygonBox[CompressedData["
1:eJwtk7lrVFEYxe+bN/dpY2Fhp7iA4BJMolhZiEshaBFSKFioBFEcQYkRRMQY
UbBQdIIWxsEFTDCKYCEhJjqZES2s1GgfO/8At2yz+DucKQ73nG+73/vu99b2
nO0+kwsh7AF5cC0LoT0N4QZ8gPNPDOF2EsJGsIB+gP86fAtJJfgSkq4Qex7f
R/QU5zT6FjH38DXRbfAimKfWIpjM2fYZ3gRldAc6IX6SGvvI2YCegJewlRPf
obuO5V17FvTiP4kuwddT4xJ6FXpv4pzl6ABqHJ2qD8/wb1dtkKFPoR/CO8i/
jJ6gn4PoZeANvB4d2554QDP0tiJxzE98o+Q8Tlwz4s+h64RuRafwf8TcgW8C
NXJHwCP4W+6r4ZuLns1m0MD3gpzhxN+wknr11D7VmNX8UtfSm/xFj4EG963G
fo7cr+ghai9iexUNcc24AT+R+Vv1hoep34deQ+6c7s+7J/WmGl/gv8Br+AFi
noIK8bsS70g1s02+ncR0EXsT9OHfjW1Qs+H8EPymQ/o2zq7UO7BA7LPUvasH
9XKVszP1DF5yXtT3tmam2d1PXXsd+dvIP0rPp9EF8I78Qc4doIh/jHO+tUuK
KePvjn5L1exHH8q8O+p5v+ad926px+FWzUJrp4/gq0bX1g5Uondeu9/Ev1Q/
ELa7+C5Am+hibP0rekP4VOZZK6YH/3NsAznv4Ci8P3Vur+aWGeKa+XHiv0Xv
snasiv179K5pB96n7kG9aCcL8Onof0v/QCX1G+mtdOcT9Ax6JOeZa/bj0bsv
2w/4p+h/XzvwO3rmmr1mrFn/B3tCknc=
         "]]}]}, 
     {RGBColor[
      0.38468306109197775`, 0.43889820038376215`, 0.5929339193580706], 
      EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1: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
+ZTGmA==
         "]], PolygonBox[CompressedData["
1:eJwtlmlsFlUUhme+mTsEiOJKIgIJRCFgEDSK8Q+GGEVRSwTTChRRQHZEATWm
laIIskRA2Smb0rKFRBQqLWUXAYmyKO4Gf0D8oYmiIpuU+ry88+N83/uec+6d
O+eeZdoNGd/3hUIURdVIiuxL+ImjaD/KLIuilcgT6Grg/4YoOgheA56BfAKP
sO8GT0c+gpdhfzmyzxvYCmy6p2CfGF6FPJV4/QRwOWtuAy/lmWXgBmzb4IuR
L+Ab8SlFN4c9N/G/HT6C/6n4LwF/Cl6B7zRkM/5N0R0oWCdbE/h9sXXNwMuQ
3uhfh1fj34bzHQMfRa7D9l/+rouQw9gXoXsYXTm8Cn4YnMVec73eD9kLfhvZ
In+kK3g5PgvBKfvfAz6CrgW+HyB92WMS7/Md9mbYD+qsSMDWiK0OvAQ5gn0t
upLE8RgH7oacAl/Lnl3BlazvHvtMOtsadP3yO/iJ9c2xH8J/NfYx4JPYNsLn
6k6w/wX/EHwT/yNYOw/pCR6Dbhb2HsiOyDGrxNYq9bs8hJRgWw6fEvkdmmNf
hd+jukOeV8//enQDEvus1/0h+yLHdDG2aqQ4cbzHgNch/eHH8LnE/jPh98oO
PxV857p7PWMpeDhyI/hVdEWcZVrqXGqJvKXYsmZhwe+od90Pnw9egHwGHpn6
rjrDyzPntHKzCjmUOAaKRQD3xvdE4tj3QrbD52EfX3CMFKurOaPaQC7j+3nO
NyNnE+e07rIWuaJag19kr/bgoalzTLl2A7y/7i4//1bkErqJ6KrxPw5vC+6g
egI/iO528Jl8/yNs/afuF/kY3oq1pfifDd5LNa3aPhd81iL4KvgkpB14LDIE
/8n8L4h9xkb4HPzVMPTOc8F9kZ56/4IbiGpQtbgS2a880B0ql/TO4BfZvzX6
tshz+H8ZnOs643l0J4LX3gGuwPfp4FybzvYVyot8/wnwo7qrxDbFYDr+F+Hn
YveIOnhDyM8Wu7fNRIrhTVSP2Dpljl0JvDN4CfZNuI+Fvwt/LfGz9I6T4d+w
ZmLkfvcteFfmWL2C7grv80Nwbasf/Ag+Gdy7FINfgnNYufwO/DS4UXsUvOda
9rkmc+49oBxOfUadtZtqCLmAdMQ2C7mMfVBqfCv6etYOhs+OHYOd8K9Vo6zf
hyTYjsOXFfzMGH4hOBf7sH41/l/BKwvu2erdA+GPFFy/qvVbkFBwTgwDp5l7
l2o8pJ4Bio2esTtxzWutetRo7BuwV6i3o1uduGZVu53Uk9mrJq8/nXkvul1I
bex3egbfUal9tcd6fL/Pn6eeqt66Lr8LzRjNGtWIaqUX0h/fEnQZtuHsdz+2
v4PPohr7BzwUe3tsLfAZBn4feTJxzl3B/nPw3fbLe21x5t6gNWf4H8ieLfm/
GRmNbVRmrP3Vi+7K3JtOw+/OfOe6ez1Dz9rJ/9HIPV+9X3fSJ58JF4NrtCif
kefhs+Dd857+KzwOzh3NHM2eLsjgxDOji+ZbXm/qseq1UzPn1kL831S9Ze6F
k+CPs3ZH4l6iHq1ePSVzberMqoXd8HGJc0K5oT20l3R7wLWZY6mevw28IfMs
0kxuiv/4zLmrM6kXlAb3VvW4QcF3prtTDg4InpHKN800zTbNbM1ufSO0hu8K
ri19z2xFNy64tjVDZuBbF9yLFDPFrj6fVT1UA6oVdNNiz/AV4Dsz35ViqFjO
Du4NyqHH9G0TPEvVM2rQ/RHc61vmuXAgeNZopmq2vpc5tvrmmQ8emXn26pnr
8H0+c+9XjavWlaPK1Y7gMn37pMbqwVd7ceberpxR7mzJ8/NqDcMbUs/SNuCX
lPupv+0UQ9Xub8Gx0kz8Hfxsal/1aPVqfSPpW0kzdkDqGaVZpRmhWaEe3jav
0QWpe4x6jb6JEuz/AwXLV/g=
         "]]}]}, 
     {RGBColor[0.5628051018199651, 0.5014970006396043, 0.48822319893011634`], 
      EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJw1lleMllUQhv//K4eyFDHqLmhMkBILWC9EhBuJm4AlhgRYqhEUUVwQ9UKK
wBoQMEQNBDQGlKKilI0kikpLVIqAJF6AikCwgMZCUxCCXvi8vOPFycw3Z+ac
qe/5Oo+eOHBCVqlUjrJy1qKyUnkKwWLoXlb3aqUyMVUqQ+Dvgu9UVCrt4BM6
baEle72Qt0Z+nPUpZwxA3hH5fnRqof8gP4POBWgT9GzVenuqPkfnnmLvJPQ0
9G8c6Qbfn3PmVW0rP/qiu6HqMy7EmevQKeAvwFfh3yq9v5h7p6J/An4maw2r
ge8G6CroIOhlrMfRmwMdzhnnWHOlyxl1+FCb+3sLtCNrArrnc/v/CPwS9LfK
Fv0+8OPgJyP/t7COdCfB94W/FNomd4xdWPWZ41fsezL7P5uctE/mFZP2b8Nm
IHQC33dC2xde4l+DHsG2ZcQzKnecQ+I+3fs69G786wr/J/v3lc7j/dDWrBz5
k+jMyO1TA7I2fN+BfBF0fWG/5rD/Ru6crkRnZ+k4HsPfAZl7oAm9B9CvQW8U
8r9y36v7L0SsOqtZ+VPt4Deivxd+H7r3wreANmDbA7o8c5ybkL+Mbl3yfmPm
XCtO2WpvKneMRj5NcaG3Hb4F9CTf6+FPQVtxznDs30PeBdmB8OMjvsci/zhZ
VzVX/53K3T+DkT+B7XL41cg2le6dw7nvbI5YfkL+Lt/z0B9fOCc10MNRI9Xx
IDorlEN0fijdiz9CN6iP2d/Jme/DV+E/h/+S/X6Z9xYinwQ/HNtRpfP+IHQs
d3RD99nkmZHvZ/k+lkXfs55RbtXz6IxEpz97I0r3r/zU3jC+66FDoYNK3zu4
9L7uks5zuWu4Puqmc5T/nsn39ER+DJsx8LfD74d/E52Z7K+Cn67awV9ROLa2
8M/n7p2lyLrwfQh5V+iU5FrPx+6rwrXqpViTc9o9eZ7mxEy9KOyCvhL13BCz
vzZ5NtZBF7EmY7tc+UbWnNmmt/Yz+63eV61Vg5uS83gz9AN0XoLfim1Ncu6E
ATck92KPwvnbGvn8Br1l6K9gf0fuWdPMjU/GlreT50r5/BDbxmSceUf9C810
Dvqf5MbLpdBXk+PamBvPDkR9hbnSke4LybgxN3c8iuuqqnvw+8AK5WBcbly9
Pll+HfR46Zz8Eb5rDjWDX+TuQfXp76XP/C3690ic2Sk5bvXajOQ87ouaNIcP
v+Smn5XO5ZjA4W4x15qjhdj243tBci1lv6N0vpS3zZEj5UrYPCwZD4TBtfHu
XAkdymopzEN+eeCU5qYuc++qZpr3usB5vTUd4+1RnwqvL2J11Weqz+cmx9pY
Op8HY641K3tjTr8rjV0HSs+D6nMjdu2SdWqRLYW/h/OXJN8lfgvnz8pcG9Xy
ULwROv9MYOkuzmyXW6d79Jzi2AydxlnXsjcu3gf5oJ67Ovry6cL4cVGnahzq
mfudaErmp7KuSY6rc8QqTFONjga+CeeUr9rwaVNyL40sjDfKr3xSb/4cb67+
KXS3Yrw1WX5LMp5q1jLOPB351tsyNP4V9J4LX4XXmv/R2FyC3kPJ/st3xbgm
fDqjd5a9XcKWwnghuyns7878LvyPraKtkvuwd8zKiMJ9cLq0X7tDX/Wvj7ne
FrbC6a8D34Rz6nfxmtuV4d+hwOyWUd+aeBf03zSgcG8Lt4RjTZmxTD7Kf2Hi
uZhR/Ys9jE0H+ZmMKZrPb0v/B7ULvWXxZmaB4/VR/0eTc6sc619H95wojSXK
p3BydWkflud+J7eHD8Jx5ebX0u9hh9DXOz89aiqc0p2N6M4qXLPZhedC/zfC
uLXxP3e+cG/0yV0b/SvNip7fXhoftpXGA+GAMEH3Cq+Vr/nJtgtY/wF0ZkY6

         "]], PolygonBox[CompressedData["
1:eJwtlllsVVUYhc+95+xNgVI1QSngCxYMznPi1JhIYiKKUWLhQgG1KFYKRfBF
WrXUgILBIUCRGKsUExGlTTRYCRUSDUVrIRqDA1NQIxoHaEUQoz74razz8N+z
/mHvffY/rHPH1S2a2lhMkmQdkiGP8pMWkqQaWQzenybJPnAlQRNCksxHpqJf
g/2ZmCSziakHL8W/Ed+X4H78h9Gr8C9CLiw4pgd8lOcB9Cr81xL/PutXcO6t
2LrBzfgvQzbhP4S/CXkI383YVrP+SPC7KaYVfQ/6EvTzkV7w3sz7l1j/HDH3
YpsE3ouch+8TbFl+P+31Lvo74Dk8t7LfL9jm5vv9jG0ha4rgm5BG8IbMWDna
g/8J4uvYu5M7XAdegb+rYFsz+pvIU+DhxN6dOUfK1XKkC/wIZ1YR/ywyH/wS
cTciL+DfxrMl8/sdQ78Cf7XyjT5RZ6M35PU4hP8C9CbslyIb0b9R7rCdxt+K
zMj8jnrXScSsxVefea/FxK/Ddx8yGdxKzNPYTyLj8/c7Sexq/AvVC9jnoW9J
HXs9/gb0Hejd4Hk8P2D/ZcjrxN+ArQW8PvpdFPMyeE3q2qpmqt0fyAC4HNs9
4I48XxXoJdUCvaPg/crRX8lcS9W0j5jtmfvvNta0oA/hjF5wLXgovtM8J+Bf
iZzJfGfdfQnSBm7LvLdq3qscZX7XavxT8E9jvxMF99xkfIeDe1X9sC04R8pV
K7a30W9BdpKfO9irPXqGNEuqqWrbif1F/Ldjm41vVjDWzO3AP5I1QwquybnR
M6PZUY8tx78K21voNboT+Gz8ZehHkYnoU4gpy+u7Ft+H6NMLPrMHfDDz+ylm
BvFLo/tLNW4C1yBZ6jsPEFvLHruUX2QmeFx07+lMnd0fnN/Rmh187Tw/SlzD
NvTHMq/V+bp7R+pcqeaD+EawPhZdQ3GJZriU50uzOjbzWUfUg+z3gO6c95xq
tT+4fgVkN/b66PnTjD0MHot8VXROx4Bro3OjO88UV0XvrZkS1/2AbEYfid4D
3h7d28vQ7wd/Gzxr6pf3wFdGz2pJHKW9Uq8VpxzD/wbSXPT6TeCS6pv6fM32
+Gju1Pma7fXBvakaqZfGZObKf5CziC3L+/szzYj6KZrLVONLwIPiuKJrotps
iZ4Fzaxmd1cw1+gdd4LnRHOVzlNvPB496+KMz1WfaC7VvH2K/dXo3laONwfn
RHc7B9uD0TNcnvvFhTpDZ6lnfwyeGc1OB/pB8IFgLA4Tl6mH1cuqwff4Pg7m
5i704+Ddud6J/hv412AsDhWXimPFteLA/zLXSLUSJ30Nvoj9v8v7V72lHlev
q0avsf6u4NkXZ53InAPlQt+kL8BrorlU8/J8sAirpneKz9BXFfwNPIOtEFy7
fs0z/lIwV6mm08HDMnOpZmy4uCaYT8TBp1g/Lf+e6Zv5ZOoeUr41A3XELwzm
At3pYvSrkJ+K5ld9e7vz/tGMVRB7eXSvKubq6DvqrprZ4+DG6FnWHWahL0Cv
TN1TA+IT8KjUNvn6gt9VtoZozhZ3n8L2L3hudG8ox4M8fw+upThGXPN35rPU
r39pXWau1p5/oo9A7yu659X77Zl7Wbby6BnQLOgbsUC1Cj5be24Nzrlyrxzq
v0FlNBeJE0aDR+Hfl/tr8A+N5hKdNyz6G6PeV0wF+srU/4XEV/r2/A+M7CL+

         "]]}]}, 
     {RGBColor[0.7409271425479528, 0.5640958008954466, 0.38351247850216197`], 
      EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJw1lW1okFUUx589z3MvFXNKWFp9yFVYYd80g+qDgYWyjMrWe9kM+lJp9qHa
Sgu1iByMXFIbbaHGYKVWk0XYKCuK3jApKkiKzYglzNpLWWBEvz//04fLOffc
c84953/OPbd57fob15VFUbzJqlhjbMZZ/fA/NxTFYvh26JpcFMPQ7XVRdLOa
4duQrUrmJbuINRf9BciOwR/ExzXwt2X7+gHZcs4/hV/GOsz+CPQraIXeP/A1
tJ/9Zmy3ENCZ2L6P/Av4/axXkXdBp9GZRD4Nv0Fx4Xd/2Mh2Z23Z8yH/Bb+D
8D9yvifk8jWB3gT2r3B+OnetgF+ArKO0X9mORLxbC+egXO5GdwqdNtY89p3I
h6DboO+xVsLfg8+PkuO4KRvXtsB2POI4xvl5nLXC3w+/GtvHsR2D7snWfQvd
4+yPI/8N+i7rEPwItKU0Pop7Br0p6B/I+/D1KGcvQ3uSfXapRvjcgc85yBrZ
n0Rewp/Adgb+b2Qztf30Kp5sfITTZcm5jqJ7tHQMs1kt2VitQGcb8oHSdzSx
vxz5KZyfgJ+G/xP61/88fgag35SO/6pkDIXlQHLf3QC/tHStlcPC5Du/xXay
NIaq41nc8R38fOgZ2T7nQgdr1+1p9JdUxlmxKT/5lU9hcKDBfXMS/Sfhb4U2
lK791uhj9fM7+Hiucl2+RKcf+SZ0nk3GT5hLbzQZhyOV8RM+eicXEtNPyBfV
tpsI+e+1e62V80n1kHq4MnbCcBayJyrHMhg9Ikyk11/ZVj6asmP+rHJO/0Ze
ylv3Nkb9VMdLo27qdcVwZek3rvzVa1eUjvH8bLuvsRtLxk99pPoLc/X6ltL5
HwysFee+6IfBqFE3to+gs6p2bYci/nNr11/vbzRyX4bu4cqzYgjZayneO/y9
+LuY1ct+X/TQ69g+Uzsv9eni7D55qo464XN7ZVyETy+yF/WW4Hugn1TmX6rd
c4pvCrooeybuzcZkU9Tr48B3h95pcv57k+el8pL9A9H/ege7G9xPwmVXMua7
oW3J8SuPnFyvOejfzn2nIrsjO9eFlfNdmj1D2tF9AX458p7Kvab+Vm3uRH4a
/F1666yr4fsq13M4cjiQXJsR6Hru2yUMK+M1O95ZV/SZZtJ9te/vRN5duQYb
k/3Jv3qmIzvO9uwZrZqPJ8evOFX7DYHFQ8I+YjiaPI8Ue3PkLRvpn83+e/hz
oG/UnsPza7835XEL/NpsPIXr2+w/Rz6seZk85z9Mfs+KcSf8JVHTJdl/j/6g
x7LnrPpE77sp2Y/8ba48Z9doZib3pHqzM2rREX/LZPT5xsr/3M3JmMm/+rIl
+Y1dm3y/Zqiwbow/ro+7Hg58Vie/N727Wcn/quLRXv+E3vMF2f+B+vK65Hum
4j8SZuorvc3WZNzmoXt99Lbm67qo+4O1545myATylbXngua6/mTFpj7+NfD8
ILm/9A+qRofiHuXyHxi8IPw=
         "]], PolygonBox[CompressedData["
1:eJw1lVuIllUUhr////b+RBkzyxyri5oSKxS88FCaF4YKTWaERypTx0BvPCOZ
p4I/0SBvHLVyyKnREHQ8oCKWM1gqhhREINWFKGrIOOjAjKbmuefl3V0s/vfd
79rrW3vttddfM3vhxAXlLMtWYQH7JmbZ1VKWfYw1gt/ERuHwCfwKDs/C+8Cr
4KfzLCvD74Ir7N0Ff7/Ish78fshaPdpn7GkAV2NrwR+hnyl5bQ58NT4flM3l
Owm+HbxGORFnKP4X0HuxNgQ8E308/HX4DPB7rHVP39sIb8C6wCuxLdE5K/ef
iNcODqzdg4/EvoX3Z/+UdJ7n9a3gvUfxPw/ek77fCN8NbsZ2lPz9Z9CnEm8s
+mj4FPBk9Hr4Yngteitrn8O/Y/9B8uxibXmK3wmuxw6VXOPx+PaMzuUX7BHw
AfRT4Inoc+ErsDpwF/YK2g+5978Kf0PfYu2AagUfA1+e/NuwwWj7UzzlvJq9
v2I/llyTHN9W9N/AF9EHgY+xtqHsM50AHw7OTT3wIngWa7Ul16QOXB1ci1bl
Ty22wFvAZfwfB08L7i3lPBP9eIq/WzmSy23067of+FT1W3CtlWNf/P/I3Qv6
5lG0ful7OlMVsbYG+6pHKviOjq61avIaeGlwrn+hP0W8O8G9oR65G1xT1VY9
+jv4ZawTvhO7FN3T6rWxxN7E/nXYUPAO9POqN3wA/CX4qOAaqpbqoYFoA+Hn
yu65edF30pb0QapX7tjaP0LnAY9Ld6y73hv8NnTmfeCm6Nzls5n9/bA/y77D
FvT26NrqDDrLF9gRtIdYb9U2uFf15iexd0Lw+f7G3oEvCn6Pur8exPon+H1V
4M3wf9N9fao7hDeTxzb4fSzC5wdzfa9b9MxQf6sGLxC/IbhXSvDHwF+lftH+
XsE1Uq1UY9VaNVFtNDM25u5x9brybc+do3JVjJ9z34H8NSPeLZyTYkv/Mvgb
4spxAfgafp3g4ewZFx1TsTXTprO/KU9vl7Vd0T2t76lGS8A3FCPVZ1vuM5WS
vji4p9Xb8rkZPINGpvnZCH66cG+qv6vBMwp/XzPjbc2j6FqrZ9W7b8E70Gqw
CeCLad5sRr8AbgqO/QC9iL4D3YV64GTuHniYzr8Q/Giwr3T1ynbNHOIdVH74
38idu85QG23C6oGbaF/DlyWutzys8OzXDBoOriucq2LOBn+f+yzas1XvK/es
lf969ENp3mj+rVOPp/7Vf04VuGeqn958VeH/IJ1Xa/PQagrXQj30XOE71d2q
h6/njqnYmh+ajbqzyv968EzVbFWNO+BXo2uhmdUBPpPevmp+BN4WPeulXwaf
zT07pLdE36nuVm/0ycJvqJL64Vbwf5rm3WnWnkDvUxhrZml26T9A+aommsXr
o/87NXNW4PsfuEUJNw==
         "]]}]}, 
     {RGBColor[0.9030430005233131, 0.6276075013082828, 0.29943330162227066`], 
      EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJxFlF2Il1UQxt//+57zYpmQrFiZurs3FRSotC4ZEateZLlZumYoiuZNEOGK
ICi4F5GoffiRSctGWa0XShsaq6aI+IFEih+hGUumoDfqIthFHyB40e/pGehi
eOY8Z86cM3NmpnV597wVZVEUHyIVMo3FgUZR9CCnclE8Dp4E5yIj0delopiB
zY/oLyK34QdY3wKXN6zrTFNdFJfQm8F/kv0tAOewvg//CvgOOIpLW9hbzHoC
OMx6Bb4WstcNPgl/Dv4X+OOc38Ybx8M1oy+BG0BfWtvPm3D9ssPmb/Qu+JL1
rOQ7pQ+yd4f1HXx24v8z9BfQHw5/erPu2Mn6BPzX4EPYJfhH0duT4xyK/Qfh
R4D7kCfQ9yqH2diHvyPoTez9jt6ebfM8Zz8Gp1X29R2yiPUicGJtf6uxmZTM
reVcO/wwNlPBKw3r2jtYO6ZD+LqQvHce3F/5jqOcHYvNZfSW5Pgux5vn1s79
H9geY+9n9F8r51668rCd8ytZL8G2H5uT8OewqbP1b+DWs34f293ob8F3Yr8M
fBt5HZtB+O+Rn9DHZfvujDzvC34vuCvZj/ydRh+CPwP+VfoNyumn1f857kNW
w38OToh6U919kF1b89Cvo3fhZyP6mtL8f/lKfpveOAIp4B8Ad2bbfQU+UzvH
+oeZqmP46fF3+jf968XKfaH+WFe5N7oiZ7JXTXdHjY0Gb5fx3w3H1xV+Hild
51qvSu6tJvDdeP/T6C8jFXfMr50XnZ+svszuxwuV6+hK+O9VLOBvce5+9Oae
8D8mOW79o96nf1Cdj4y6V32n7DodiJhnZ9fM9rhf79b7dtSOWfWiXIvT2zck
98am5Hh0bx/4VORf/9CsHuHsRHA4elM9qnyIl52450rfrVmgvRbs94NtpXv+
ZuX4XuX+nF1LA3B/Ju9rNoyOv1DfP1v7P9rAjqizDvQvs2fgYex7oyblr8ru
m7PwL2W/5w32ryM34W8kzzjNunuKozI/Q3E1PFu191jMUtXO1piDqtm7le1u
qfdjblytPCv1dz+ATdkzpzXunFL6jzU3VWszs2eBary3cn8oR4p/U/xFDzaf
JMe4DZye7acDPBvzTXNO9aS6+jY5x8Ph517E+EX2fbr3I7hryW9R3W1Jvncz
+Frw2h+sXP/vJfvrCZ//Ai6UzsA=
         "]], PolygonBox[CompressedData["
1:eJwtlWuIj2kYxt///32et3EqoXXYZSgZRZZ2nKVxaJHD2hmSyYQpX9TObEpR
pkh21Vgzg9LIIYdyGLGxtCunSaJY5JCwH/gyZhAfLJ988Lu63g/PzH091/0+
9/n+D6utr6wrJknyCydwdvBnQyFJxnE5IyZJZZYka5GHcvcz8lT4MvBz8D3k
XcFcrzRJVsL/G8xVo9PIXT/wdPBNTg/eewc+h50iXBX6L1Pr682J8Be5+1K0
zgXkMegPBN9H5wryiGh8GrwZvJXvF4Kvgw+Ca/jmV/Bg8ArkQ8GcdGr5tluU
8SSZxt0xuIXofFuwzUXI++DXI19D7SP8cdlIHMMJ5MvwO+D7gi8h/87d2dx/
5eZJal/lo3xtDPZFOVVu67lbDtfMm9fAc4NzIfvzsV8RnfsO9F/C9Q72tZ2T
wQ3h9IW/C/4Hrgo8s2j/1oEbOIsL1imFm6KcFe2jfG2PjreNu07kEJ2fEk6K
PACdAHcLfBb5EedM4jcmKDfBut2VA/CW4FooXtXqAbH0KPiNnvCDot/S3cDo
Gpfl/vyG/rLg3lGPbYcbFvy2fFLtNgV/q5gU23B0+sM/Bd8GN3HOF1yzVrjX
0bFN5s0mTjk57QRXozMaeWz0t6rf98hzOZPhu8Dv0X+W979q1gn+kLq/J6Ez
B90l8BOR/+KuBbmUNx8WnZMhyE+5qy04xx2pe0z1Uw8dRX6R2naV6st7/+VY
39yBn83d+Lz+bzUjwVgxKtalwb68Bb/R7HEeF+1DH+z/GO2f+C64O6l9k843
8GeC67EYvA1uP/oNBcdzAHljdK66VG/0Dwf3nuZHs/Y6OFfl4MpgH2RLNpWb
BdFYOZuP3BI9j/9zKuDvpn5PM1gSXXPVfgPnIPLJ4F2hnt6E7qfgWZSPn5Fb
832ifO5FXsU3C/L9cDV4hjRLKd/OAx+Kflv7RLtHMSt22ZAt7QTFJp+OgNdE
88rRn8p95lxoR2lX9cnrXYNcqvxHz6L6c6RmJfVsy6fVcBWZY9cMaZZO5fHJ
hmztTe2bctCUuefUe5/BszLPuN5Xz6v3ZwRzyqlyqx1bne/Dc8htqXOjnqtH
9498PtRD6i3VrDzvp53axfm+0Ixpdjfn86yZ+QH7bZljVUyKrSF6dhXPbvCo
4F6Wj2WZZ06zpx15nv+tqXXl7x74JZlro/m4wVt/p+499Y9697vMtpTjwcgz
o2dBM/kTtpqD9TWzmt1Xwbzi06zoN0K9oB1bB/8VKa/U5A==
         "]]}]}, 
     {RGBColor[0.931497000639605, 0.6987425015990126, 0.38764070198277567`], 
      EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJwtlEtIVlEQx+/97jmXtE0voqz80iKCoiIqSAnUHkZZ1mct3IUkZgu/NiqJ
QUEhFD0EqaBAqMCQoHfQQopw0ctKgjSSwpASe63aRr8/cxbDf86cOXNn5j9z
SxryuZZMFEVtSILUuihai6HKR9F2JBtH0QVs+5BO9CnwM/gXn8PgR7AP3Iks
4a4GvAVO523C3Rz068gz7DfA+8gL9AfgNHwK0F/z4WHOY+grsTVyvoueRwZj
i1MYWwzF15vL+HWAX3g3I2Mxd0vSKPrHeRc44cxHvmeI2Ut9Q9haOR/Avg69
KrVaKsFGbzH6ndWpeveDLdjr0QfQVznTT4C5EP87WOGsH934bkGK0c+Gumsz
lncD9h1gL/a9fC8mp1xqZ9lLwEWcR/FfCFZzPoK9Gn08trryId5g6EUb+lRs
uR70xsNJ/Nc7q1G1LkV6qP0xttPOersHnwXe+noUW3eoVzwXEXM4tjqz6KOx
xZob+GpzxqVqK8B2LeSv+jqc9XAZWOosH+WlWpWn6innPAGOcT/b2/y0Ouud
eliJ3h5mSTP1LraeKFZBmDd97074lngbCLyInw+JvVlMjVnu+tGPYX8SYuWx
daE3oZeBK7zV+zTMvnITfzed9bkPvBfmR3NUE+ayMMRV/E5wkruv2gn0zanp
sr1NzFf9nudtVrUHz53xIn7ehHzKweaM8S2uS8Osis+Hqe3Go9RyVc4jnJdn
bCf1/ldiO7uJd4eQOu6awZrUeBf/Pfg0Yj+OvdobL38Smw/lU+xt5sTVNmxD
ifEu/r8lltsI9vfhX1CRWu+Vj3o0ntgua6drU4s/iT7f264Wgb9DnvrHKBf1
StxvTG3eXuJ/LuxXLvwbVKdqbPfWm63Yz+NfQaxLyNXE9uEK9xu85aYcV3ub
4zXgK2fxxzSPifFchv1iYn3v8tYnxVT9P4KPdro8cKTZ0exqTj6Bxan9B7Pg
qdTm83boQVPoyUxvszsrcKKZUa81j9q3+sCZevKTt/8B8zewPg==
         "]], 
        PolygonBox[CompressedData["
1:eJwtlFtoz2EYx3/zvu8/4wZzwWKzXSAULS3mZptYzWw2XLiTWszFpmQiOdQk
F04lK5QiTVIOOVwquTBs7GaHDI05NKcrt/L59v1dvNv3+3sO7/N8n+f9V+zq
auuclmXZNk7kDPDnGv93F2XZIPhuyLI+cDFOs1OW1Ray7AN8L6cW+wL4KLa3
8KfwmuhY+VTj/w1+GFzO+U2uo/Db4K3E7MFeQvymIudYCF7Ft3LwTr71Rx/h
i9T0Avwxz1fGmSLfFmLug/dxGrAtS65/CL4c3Me35+AWcvbgfxPeqH44A/A7
8CbwDM4b+Ah8AlyBfzV4JDhXKXwJ+Ybg/fBZ8PnwNu4vCr7/NPxAtF5j2Muw
VSTXrh4qwavzfkY5a7HPSdZWNam2jdG5plQz9ofR99Xi0w4+kusn3kpsVXKt
qnkY23hwbmm4EttgcG8BPhPey9kPnuTbe/wvB/NPqgm+BvtS+Dh8AltNstby
XwfuSJ6delJv21VTXm8D/GfwrDWjSWzvomN1h+7SHbqrXTmCNVb9qvlV9Iw0
q2fwG/DiZKx5TU/uUb124HMpeCal+f4Nw1ck164d0C68jM6tO6TV5+DdVI/q
VZpKS2mq3fwT3Itm2or+56P7UY8XwN+j7d3EXA2egeI1I+3G3GittXO3ojVW
/1V8awGfidZT+pwFLyq4dr2Byugd0vxryXUO2/FkrfTejoEPRc+zWTmkXb7P
2rkS7N3RWmmnD4LromOl+XrynUrWrkt2aZe8y8p3D9/H+LQH2xvBX/L5SoNf
fO8Nrk1v7knwEVbMI/zL8n2XnuV6ywW/BfWnt347+i71oN2sT9ZGmvzQvcl6
7OB0gjdE16I7mgrWQP38JaYevpnzL9//r8TXFWzTjDVr9aB4+TSDXwfrI82u
k/tK8izVo3o9EX239ucBvj3575P0PQlenNevec8jdizfZ+233tZ/sjKoHw==

         "]]}]}, 
     {RGBColor[0.959951000755897, 0.7698775018897426, 0.4758481023432807], 
      EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJw1k02Ij1EUxu+892OlfJSaZOE/icxImpS/GWZCvkq+VhZq5KtR8pGaGRQy
M2ykRBbYSRH6I9lLUUrKYogixmSaZjbslMbv9ByL+z7nnnPuvc95znlr+47t
OlqFEHazIqvOpwfHHeyDKYQbTSE8A1tZO7E7Sgh3sV9iz8kh1FhzyT8M3sc3
E/saZwfY78VeQ/4TW/iec/cDzr4i7xG4jfgEaxb7MWLzwM3ktnF2Pv5WcBR/
M/61+MfB3kp3dbH/hd3lHI2D8bsdFR/H3+8cLoGLs975QPxTpbdtv7KIw3Ly
60V3WK3vong+xN6flX8c/MJ+DP8Q9jnWAfznwcvkX+XdF8RPsN9DziD2xSzO
w+BE1Nmv+HuzeJ81/lF6jyRpP+n6z866sxGl94xK+zNJWh8i3pyl+SJ8N8lr
EP+cVPffSppaY/+4be+3YR8B1yfhMuth1v0LjXNUD19jt3h/a65Bu9e5qojn
iqT4lOvfkqTvAuI/sH/im+TMxyRuxnEw690L4Gmv5RQ4wLqH/Tiq9zYDS7Py
/vM1jUybdnxTUTMxllzHJs1sZ1aNHeCWoto3gkt8hq3Pq4vrwR2/K/XR5mzU
OX9P8tmMNfw9e/cN/u2cnbY7sa+4VieJDxfpMwSORM2XzV2/19WXpKnl27lN
Sb3Z4Rynfbatd3WfiXp2Xuy3FvV0Q1I9duYpuK6Iq83jdZ8B0/t90hzaPHYn
1dlNbmfRnPVl9a3He/fW58z+72/+39n7pq/pfAv7H8jVhqM=
         "]], 
        PolygonBox[CompressedData["
1:eJwtlF9ojmEYxt/vfZ/nPUFMpoUD5l+aSSJstkX4kPw7VsSXpoSy2VBL9kfh
RLTUnCkRmiHHpBwoiQMKkfn3tbYTzpT4XV3vwdN3X/d1P/d7P9d939+8A8f2
HE2TJNnGCZyWPEn245hVSpJ12Itx1oBvg89gP+HsxZ6DryEmyUzOFOxn+F5m
STIErmKPkOs6uAncAP8d3xh4YXD8LXA39lPOZWIn46sldj54UsF3Yc+Ixs/B
d8Dj5PiJ3YivBe4jviMlf6MZvDGYU8xX7Ae84U/qekaw2zi/wXXwo5lzKF41
T4AfcucKsVMVA7co2Nb7T2Pv4n6SWZ8L4NnR+qi+V/hfF/oo/xfwSfh98Guw
L3L3LLgCHibNVXyPiB8s+Zv69mH42tS+duxD0d8WP0D8KmImUsfUw7WCf6XO
2QPuiL67m7MEbog7HYX+n8DDmfVewW8/9VyL5qXXN/i+6Fhp2os9Pbq3ulOD
vSyaU/2N2C+4cwN7nBxryddbvH8a5xz248zat8MPRGsgLTRj3eD+aE76/yB+
fW7t9J4N2Jvx/Uvdw3LunMo9Bl4NXh5s7+AcJFdf7rcJV8Arg2tTDzrBW3L3
Tvm2Ym+C/5u6nq7onoqXbzv8aLA20khazsX3PnUNb8E3g/XRTGu2e4r+asba
wB+CtZJmmtXj0bVJz0vc/xyst/KrF3eDZ0kzr13oLOZHPVfv7xW8Zk67+S5z
LdJcu1ku5l0zWgYvjd5V8ZrNptyzoZzNuXuo+jRDreBqcL+k+U7w/cy7qHq0
i+ejtVLPBzXfwbzer/+CSvE+aVQfvGN1RX1vwCeiZ1kzqllVz6vFPmt3TwXP
u96n3VoQ/N8gjaX1f5kTkVk=
         "]]}]}, 
     {RGBColor[0.988405000872189, 0.8410125021804724, 0.5640555027037857], 
      EdgeForm[None], GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJxFkztrVVEQhbf37HNKC9E0PlCiaEDFRxEwmttE0EJEC5uIIUauWBjFaBIQ
BI2m8VEIVjZWaeTq8YF9Iv6BqwQUohLFJhBLCTZ+izWSYp81e81zz8zZdv7K
6dFGSukMp+A85PMY/JBTelml1IWyu0zp45qU1iKfAHdk4wz4lVNj/xS/S3AL
nGfcO9nyIvw05xS+LeJs4HTgZ9FPIV+Evwve4d6GnwIfYD8IfxV+Hm4d8klw
Zza2wS+FdTU1zmXXd610HvGy+1yYl151qJ4m9j+RvyF/gv8ObsVnGDzbcA2q
v7eyrLo2l65hE1jDXcD/Mjgd93fcn2f3bT3cC3yH4A9k59mN7yh4G10L+Sj6
kcK+itPPfQv8HvS/sm3vlfaVrP42C9cq+/3YnAPH8euOvqvmPw37yP4wut/c
j4ADEVOxe+QLf534PZyNyLtK51YNe2M+4gfB3sL2es+NyDcH3iqdt594k6X7
d79yL7uinxNhLz/NQTvzv0fCGt1Kw3n1npt5dc4DlTm9VXkUR/dX0bvXYDN0
qmUyr+6merwSMQ9m166Z/Ig+qB96v941Bo6Ufuu+7D1W/xajT0vx9qV411DM
s47ZzEePxM9WnsP7qEHzUKyF2C3p3lbenzeVd1y9Vu4+7svcD8Uu6F2qXzmX
o5/tsFWc49j9hT9WeS8kazeeFN6VR5XnIb/x+M9aUc9M9Gp79o7Ifzj+707M
6R+c/IIc
         "]], PolygonBox[CompressedData["
1:eJwtk01IVVEUhc9995w3bBBkAzOe6MBEpAw0zB8oEx1E1FQxyjAa+JdgQqN8
JgTpQHDePKSXRnP7c24/VFBJ5SiooUSTvsW6g3XZa+999t5n7XMbr09fmSqF
EDpBBOf5/MUxARZTCHNgDLsrD2EV3IdPZSHUwDL2i3IITfgfcXYb+wz4VfKZ
E9T6DmrBZ35E11Ttm6CK3YHvKrE6+BPODoJJ+D/4MPY74t/gB/Bz2H3gFvw4
vI/4y+jeI/heYZ+MtjdAF/HX8DXil+BvsIfKrr0H32fueWa4hv0b31li3WXb
mqeV/Gp0rVH4LLk14h8yz3ya2Cq8P/fMK9hb4EZufR5E91Tvw5xvSM5RrnKe
Yc+Dscwa3sHeJn8XPkL+Q3y9+P6UPOMC5z/mjh/CdxTenqyFdqbdqad6t8F7
iL2PvqtmXAeb1Bsv5pXW0vSg2Pe9ZE2Ur549xJuJX8zc84jun1tP+RaI7UTr
cZn8ZWLPi7urx1NpA75k3lk/ubep8TZzjZXcO9O+6vVekjWX9npDektNybwC
TmG3JOdqHmkxkdxbGt+N1kTaqMcn4hfKvps0HsA+lrwLzfw5t0bSSm/sJ3wp
+W3qzX6N3rl2rzvswmeSd6OZx5NnqhTvSVrrH9G/ovrSZqPYv+77GPs/YWVu
WQ==
         "]]}]}, 
     {RGBColor[1., 0.95, 0.75], EdgeForm[None], 
      GraphicsGroupBox[{PolygonBox[CompressedData["
1:eJw1UTtOA1EQm9336UODkKBApCAdn5ZsgcIF6FciaZGCFImlpqQIHUodLgAS
XAACnCCRgJpDpIyNJ8XTePxmPfbb3cHV+bA0swOcgLODZlKYTYGvQVw67gb1
xEPUeaE53pPfQr0ImtsAfspmfeCjCM1ktgD3BfwNrgW8n7SrHaRDjcZ1bpN0
TzE/hk4F/j6rJz9HvYuafQG/maRJ7cp16GMQ5Il+uo4f4f8k6VtqNJ5rfd/3
mbqU5xpnEcUd4rsf98+d9M13YP/qPun313duJ2Wmzqfvqjzjv26huWWpt2C2
B9/PnZX7Yr/OwPc/jsr2nOWJ93uof67NfB9R3mZR/mr/jzdZb95k+W85X7sX
4nFQ/hF0Okk61HvL+vfvWV7pmfO9rAxnqCvlq0IE
         "]], 
        PolygonBox[{{1073, 541, 760, 1604}, {1653, 407, 804, 1655}, {1678, 
         830, 162, 917}, {1730, 878, 407, 1653}, {1315, 162, 865, 1711}, {
         1654, 804, 541, 1073}, {1074, 865, 864, 1710}, {1236, 363, 281, 
         996}, {1218, 349, 273, 985}, {1605, 760, 363, 1409}, {1219, 468, 878,
          1729}, {1715, 281, 830, 1716}, {1710, 864, 866, 1075}, {1394, 605, 
         349, 1218}, {1320, 273, 468, 1321}, {1308, 274, 469, 1309}, {1221, 
         469, 605, 909}, {1712, 866, 274, 986}}]}]}}, {{}, 
     TagBox[
      TooltipBox[
       {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
        LineBox[{1075, 1710, 1074, 1711, 1315, 1329, 1237, 917, 1678, 1677, 
         1716, 1715, 1161, 1340, 996, 1236, 1090, 1409, 1605, 1604, 1073, 
         1654, 1655, 1653, 1730, 1729, 1219, 1220, 1321, 1320, 984, 1303, 985,
          1218, 1394, 909, 1221, 1222, 1309, 1308, 986, 1712, 1075}]},
       "0.0002`"],
      Annotation[#, 0.0002, "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       {GrayLevel[0], Opacity[0.5], CapForm["Butt"], 
        LineBox[{1061, 1190, 1060, 1301, 1217, 908, 1392, 1379, 1072, 1591, 
         1154, 1155, 1393, 1234, 994, 1599, 1087, 1406, 1086, 1598, 1325, 
         1326, 1091, 1410, 1411, 1412, 1246, 923, 1250, 1251, 1092, 1254, 
         1413, 1414, 950, 1713, 1714, 1606, 1609, 1608, 997, 1596, 1597, 1400,
          1675, 1398, 1595, 1594, 1066, 1592, 1065, 1396, 1395, 910, 1223, 
         902, 1382, 1147, 1063, 1197, 1195, 1300, 944, 1144, 1061}]},
       "0.000175`"],
      Annotation[#, 0.000175, "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       {GrayLevel[0], Opacity[0.5], CapForm["Butt"], LineBox[CompressedData["
1:eJwl0M8rgwEcx/GvzO4cpFxsygonWfmRA8UuavgTRG2X7WTiYA6WcpbWuLop
B/4AZyXtMisrCbUW/4OXHN69P5/P8+2p50ltl7dKfRGxid1ExD3uMDIQMcGH
OMCo/twfcSOPYx8VDNuf7NfykDyIW72WjDjBjp72bExu2TP6Cz/YpuRJTKOp
v9vn5A9edr+Cqn6Mc1vbTYNfuYNF+wJ6tje9Ln/yt74k//CXfilfyV05751r
nOMcb/AZr/Pq33e5PcWF+5Y+Iz/yvOezvKdnOc0pFFHAUeL///0CNw0qDA==

         "]]},
       "0.00015`"],
      Annotation[#, 0.00015, "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       {GrayLevel[0], Opacity[0.5], CapForm["Butt"], LineBox[CompressedData["
1:eJwl0M0rBHEYB/BH2MhxXQjbljNODlzWS9kU2ok/wJbr7smNg1KSvJ32qFDk
JIUc5EpeSg5SXBHFv+AzOXz6fp9n5jczTb5cTSp1ETFLLhORpZMOrhoiqo0R
FS71HpY4qY9Y415/YJAVBuh375MsOF+Q2+YhOWL+dOZFr9m9ySmG9W/7Ublu
3iDhgx/7ov1W+hym+WKGMftf10uem7Bq3pQ1u3NO9TPGmWSCd/vn9Bu55dXc
61wfN+ZruvUL2SVzLOoLlPRH97fJdo7t5uRR+g/sW/RW/ZADlu325D7NrjVx
Z7drLus7Mk9Wn0/fl/n//3902zGI
         "]]},
       "0.000125`"],
      Annotation[#, 0.000125, "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       {GrayLevel[0], Opacity[0.5], CapForm["Butt"], LineBox[CompressedData["
1:eJwl0TsohWEcx/FHzjEZXEo2LCjK4JaNlOiYHLGQy2IRpQyKUnIp6tQhIvdN
p45iIEnJaFEyWY4JsYmy+ZwM376//+//vLfeitHJnomcEMI0CiMhbKIAedEQ
jnghN4R9PkREl4t7XUleCOW6Ii7jFKf1I/bDuNE9mSvlebnevgG1qDPP6Jvk
RmScazYv6VcwJ6/rWnibN5xJyoM8gHddu3nV2TW0ya3IyC+II4Ft3Q6+5GPX
fPMP+vCLXbs9XNp18LvuA91yDEl5yPP6s+9l3scBPrPP0HdyjLu4l+/sbvGG
VyTc9xzX8hWe5QwvOzvONa6rkh/15eZq8wXG5DN+0OfLpfIp0ljUnfAsx+2m
5OLst2ILUV3KbjLy/z//ANk1PRk=
         "]]},
       "0.0001`"],
      Annotation[#, 0.0001, "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       {GrayLevel[0], Opacity[0.5], CapForm["Butt"], LineBox[CompressedData["
1:eJwl0ksopWEAxvHXXeKQyG3lslDsWdhamCIUuRSxsGFcysKo2UxJyYqUpiiU
xXEsLGZKrBSlFFkqC1OT1AzGjEts/L5m8e//PM/3fm+nc0754Fj7aFIIYQax
1BAy00PI4Wxe4S8pIfSnhdCHQlsBJu2lXIYilKAYe/Z91KJG30YCO+6Yw4l9
gedt0+6r189wiinbEM/bp+VPaNB7uBeL9ma9W77gPm7lTXsb/8E91twftz3I
D3Kj/Jf/6VvyMz/qTfITv+gJeRuv8hu6onv0peg7cGYXH/Tf9lu0RJ8Fi/KA
M4NY1zew6uydvcP2K3oHB7i233CdZz/5Ut/jH7hCtfN5XM4VGJaruBLnzubo
MXz3/jfM2nb4M3faO1Ckx5w/tn2V8zGBcWR5fmRflnMxio/IsB/al6LfHMl6
XB9J/f9/eAdDK0b/
         "]]},
       "0.000075`"],
      Annotation[#, 0.000075, "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       {GrayLevel[0], Opacity[0.5], CapForm["Butt"], LineBox[CompressedData["
1:eJwl0ktIVGEYxvFvcCx0iFa1KBBaKCSkFbmM9tJKomaaGYguaOnowp0Ko5CR
QhBddGNQaoWLJGIo8bYpHUXaWXmlRa4KSiGwhYt+Bxd//s/7fO935hyYE9fb
GlpjIYQXSMRDKD0QQjkneIjTpSFcRQoV5na8KQkha85g0rxsrpTzcq17p3Eq
wlzDZ3EG3+2ds3dX34tOuQt1eOz8ER7IF50l5fPcxU38RP8UA7iAZ9H74bXc
xI3Y8fyi+bZ8B2n3fpv/6he5WfcS0+YW/qPbxhJy5leYcdbKGXd39Lvmz9ym
m0JW/9w8jj35n/Nb+pQ8Gr2fPIhJ/QeewDXcxA1s6y9zvf1++w/leZ7DJ/zC
z6i3V8CsPIMt/ECf/fvIydV8Esc9q5Krou/W34t23J3Q5zmpu4Jj5sPO4hwz
H+FLfJQP6RfsvjcXeZN7dJ3yujwib3ABa1hFh7NvPOxshd/hK76gW5fHcvRd
9t7yRy6L/l84iDK/O8Zj+ub4/v/vP97lWB8=
         "]]},
       "0.00005`"],
      Annotation[#, 0.00005, "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       {GrayLevel[0], Opacity[0.5], CapForm["Butt"], LineBox[CompressedData["
1:eJwV0UlLlWEYxvHnePToTlsKuvAztGrjFxBM3AQtNAcMWzi2CVGyViWogQsH
cMBZBBGR0rLjtAiJytrrzg+gOXs8/p7Fn/99XffzPu8Zyupbq1sSIYRRfEiG
UJgXwlt+nwrhHbaRRnFuCI3YM/fYZ83B2QZ+ravn73zPnTzvzAx3YN25Hfkf
J+2Tuhysydv6v5yjT+gCVuW0/pAT+izPyVPxfvMK/uA37jBr9wY99tVy8EyG
d3UpXUrO5Txe4AX9K3MB9uV8HsOB/pFcai7iEl7iZX0vjtx5jM/4gg18tD/h
I/t0/D5YN3/CY/NwnJ3pM1e475n5CXfxS+7XD2AQ5RjTj2LW/Ny+yVzJ3dwc
P79+EZPureJpPuUz/MCN/J/HnT/nW/kg/k58wRP6S87IP/mer+J9+mvOyr/i
c5jX3fCMLuPd7fILbuM6Hor/uV0Nf9PV8la8R7fBmxjGCCZ0X/HUfQ/N6l5v

         "]]},
       "0.000025`"],
      Annotation[#, 0.000025, "Tooltip"]& ], {}, {}}}],
  AspectRatio->1,
  DisplayFunction->Identity,
  Epilog->{
    RGBColor[1, 0, 0], 
    PointBox[{1050, 650}]},
  Frame->True,
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{"DefaultBoundaryStyle" -> Automatic},
  PlotRange->{All, All},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.02], 
     Scaled[0.02]}},
  Ticks->{Automatic, Automatic}]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["Correlated Posterior", "Subsubsection"],

Cell["\<\
Now we need to implement the bivariate Poisson posterior,  which is slightly \
non-trivial to get right just because there are so many indices and variable \
floating around. Mixture weights of the posterior.\
\>", "Text"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"weightFcn", "[", 
    RowBox[{
    "\[Alpha]0_", ",", "\[Alpha]1_", ",", "\[Alpha]2_", ",", "\[Beta]1_", ",",
      "\[Beta]2_", ",", "x_", ",", "y_", ",", "k_"}], "]"}], "=", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"LogGamma", "[", 
      RowBox[{"\[Alpha]1", "-", "k", "+", "x"}], "]"}], "+", 
     RowBox[{"LogGamma", "[", 
      RowBox[{"\[Alpha]2", "-", "k", "+", "y"}], "]"}], "+", 
     RowBox[{"LogGamma", "[", 
      RowBox[{"\[Alpha]0", "+", "k"}], "]"}], "+", "\[IndentingNewLine]", 
     RowBox[{"k", " ", 
      RowBox[{"Log", "[", 
       FractionBox[
        RowBox[{
         RowBox[{"(", 
          RowBox[{"1", "+", "\[Beta]1"}], ")"}], 
         RowBox[{"(", 
          RowBox[{"1", "+", "\[Beta]2"}], ")"}]}], "2"], "]"}]}], "-", 
     RowBox[{"LogGamma", "[", 
      RowBox[{"x", "-", "k", "+", "1."}], "]"}], "-", 
     RowBox[{"LogGamma", "[", 
      RowBox[{"y", "-", "k", "+", "1."}], "]"}], "-", 
     RowBox[{"LogGamma", "[", 
      RowBox[{"k", "+", "1."}], "]"}]}], ")"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"posteriorWeights", "=", 
   RowBox[{"Function", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
      "\[Mu]x", ",", "\[Sigma]x", ",", "\[Mu]y", ",", "\[Sigma]y", ",", 
       "\[Sigma]xy", ",", "x", ",", "y"}], "}"}], ",", "\[IndentingNewLine]", 
     
     RowBox[{"Module", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"p", ",", "out", ",", "indeces", ",", "max", ",", 
         RowBox[{"\[Alpha]1", "=", 
          RowBox[{
           RowBox[{"-", 
            FractionBox[
             SuperscriptBox[
              RowBox[{"(", 
               RowBox[{"\[Mu]x", "-", "\[Sigma]xy"}], ")"}], "2"], 
             RowBox[{
              RowBox[{"-", 
               SuperscriptBox["\[Sigma]x", "2"]}], "+", "\[Sigma]xy"}]]}], "//",
            "N"}]}], ",", 
         RowBox[{"\[Alpha]2", "=", 
          RowBox[{
           RowBox[{"-", 
            FractionBox[
             SuperscriptBox[
              RowBox[{"(", 
               RowBox[{"\[Mu]y", "-", "\[Sigma]xy"}], ")"}], "2"], 
             RowBox[{"\[Sigma]xy", "-", 
              SuperscriptBox["\[Sigma]y", "2"]}]]}], "//", "N"}]}], ",", 
         RowBox[{"\[Alpha]0", "=", 
          RowBox[{"\[Sigma]xy", "//", "N"}]}], ",", 
         RowBox[{"\[Beta]1", "=", 
          RowBox[{
           FractionBox[
            RowBox[{
             RowBox[{"-", "\[Mu]x"}], "+", "\[Sigma]xy"}], 
            RowBox[{
             RowBox[{"-", 
              SuperscriptBox["\[Sigma]x", "2"]}], "+", "\[Sigma]xy"}]], "//", 
           "N"}]}], ",", 
         RowBox[{"\[Beta]2", "=", 
          RowBox[{
           FractionBox[
            RowBox[{
             RowBox[{"-", "\[Mu]y"}], "+", "\[Sigma]xy"}], 
            RowBox[{"\[Sigma]xy", "-", 
             SuperscriptBox["\[Sigma]y", "2"]}]], "//", "N"}]}], ",", "const",
          ",", "wf"}], "}"}], ",", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"const", "=", 
         RowBox[{
          RowBox[{"\[Alpha]1", " ", 
           RowBox[{"Log", "[", "\[Beta]1", "]"}]}], "+", 
          RowBox[{"\[Alpha]2", " ", 
           RowBox[{"Log", "[", "\[Beta]2", "]"}]}], "-", 
          RowBox[{"LogGamma", "[", "\[Alpha]1", "]"}], "-", 
          RowBox[{"LogGamma", "[", "\[Alpha]2", "]"}], "-", 
          RowBox[{"LogGamma", "[", "\[Alpha]0", "]"}]}]}], ";", 
        "\[IndentingNewLine]", 
        RowBox[{"wf", "=", 
         RowBox[{"Function", "[", 
          RowBox[{
           RowBox[{"{", "k", "}"}], ",", 
           RowBox[{"Re", "[", 
            RowBox[{"Evaluate", "[", 
             RowBox[{"const", "+", 
              RowBox[{"weightFcn", "[", 
               RowBox[{
               "\[Alpha]0", ",", "\[Alpha]1", ",", "\[Alpha]2", ",", 
                "\[Beta]1", ",", "\[Beta]2", ",", "x", ",", "y", ",", "k"}], 
               "]"}]}], "]"}], "]"}]}], "]"}]}], ";", "\[IndentingNewLine]", 
        RowBox[{"(*", 
         RowBox[{
         "Evaluate", " ", "wf", " ", "a", " ", "little", " ", "bit", " ", 
          "at", " ", "a", " ", "time", " ", "to", " ", "avoid", " ", 
          "computing", " ", "way", " ", "more", " ", "than", " ", "we", " ", 
          "need", " ", "to"}], " ", "*)"}], "\[IndentingNewLine]", 
        RowBox[{"p", "=", 
         RowBox[{"Exp", "@", 
          RowBox[{"Table", "[", 
           RowBox[{
            RowBox[{"Evaluate", "[", 
             RowBox[{"wf", "[", "k", "]"}], "]"}], ",", 
            RowBox[{"{", 
             RowBox[{"k", ",", "0", ",", "200"}], "}"}]}], "]"}]}]}], ";", 
        "\[IndentingNewLine]", 
        RowBox[{"(*", 
         RowBox[{
         "Stop", " ", "when", " ", "adding", " ", "100", " ", "more", " ", 
          "points", " ", 
          RowBox[{"doesn", "'"}], "t", " ", "add", " ", "up", " ", "to", " ", 
          "at", " ", "least", " ", "1", "%", " ", "more", " ", "weight"}], 
         "*)"}], "\[IndentingNewLine]", 
        RowBox[{"While", "[", 
         RowBox[{
          RowBox[{
           RowBox[{
            RowBox[{
             RowBox[{"Length", "[", "p", "]"}], "-", "1"}], "<", 
            RowBox[{"Min", "[", 
             RowBox[{"x", ",", "y"}], "]"}]}], "&&", 
           RowBox[{
            RowBox[{
             RowBox[{"Total", "[", 
              RowBox[{"p", "[", 
               RowBox[{"[", 
                RowBox[{
                 RowBox[{"-", "100"}], ";;"}], "]"}], "]"}], "]"}], "/", 
             RowBox[{"Total", "[", "p", "]"}]}], ">", "0.01"}]}], ",", 
          "\[IndentingNewLine]", 
          RowBox[{"p", "=", 
           RowBox[{"Join", "[", 
            RowBox[{"p", ",", 
             RowBox[{"Exp", "@", 
              RowBox[{"Table", "[", 
               RowBox[{
                RowBox[{"Evaluate", "[", 
                 RowBox[{"wf", "[", "k", "]"}], "]"}], ",", 
                RowBox[{"{", 
                 RowBox[{"k", ",", 
                  RowBox[{"Length", "[", "p", "]"}], ",", 
                  RowBox[{"Min", "[", 
                   RowBox[{"x", ",", "y", ",", 
                    RowBox[{
                    RowBox[{"Length", "[", "p", "]"}], "-", "1", "+", 
                    "100"}]}], "]"}]}], "}"}]}], "]"}]}]}], "]"}]}]}], 
         "\[IndentingNewLine]", "]"}], ";", "\[IndentingNewLine]", 
        RowBox[{"p", "=", 
         RowBox[{"Abs", "[", 
          RowBox[{"p", "/", 
           RowBox[{"Total", "[", "p", "]"}]}], "]"}]}], ";", 
        "\[IndentingNewLine]", 
        RowBox[{"max", "=", 
         RowBox[{"Max", "[", "p", "]"}]}], ";", "\[IndentingNewLine]", 
        RowBox[{"out", "=", 
         RowBox[{"Transpose", "[", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"Range", "[", 
             RowBox[{"0", ",", 
              RowBox[{
               RowBox[{"Length", "[", "p", "]"}], "-", "1"}]}], "]"}], ",", 
            "p"}], "}"}], "]"}]}], ";", "\[IndentingNewLine]", 
        RowBox[{"out", "=", 
         RowBox[{
          RowBox[{"Select", "[", 
           RowBox[{"out", ",", 
            RowBox[{
             RowBox[{
              RowBox[{"#", "[", 
               RowBox[{"[", "2", "]"}], "]"}], ">", 
              RowBox[{"max", "/", 
               SuperscriptBox["10", "5"]}]}], "&"}]}], "]"}], 
          "\[Transpose]"}]}], ";", "\[IndentingNewLine]", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"out", "[", 
           RowBox[{"[", "1", "]"}], "]"}], ",", 
          RowBox[{
           RowBox[{"out", "[", 
            RowBox[{"[", "2", "]"}], "]"}], "/", 
           RowBox[{"Total", "[", 
            RowBox[{"out", "[", 
             RowBox[{"[", "2", "]"}], "]"}], "]"}]}]}], "}"}]}]}], 
      "\[IndentingNewLine]", "]"}]}], "\[IndentingNewLine]", "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"ListPlot", "@", 
  RowBox[{"Transpose", "@", 
   RowBox[{"posteriorWeights", "[", 
    RowBox[{
    "100000", ",", "500", ",", "60000", ",", "450", ",", "300", ",", "100500",
      ",", "65000"}], "]"}]}]}]}], "Input"],

Cell[BoxData[
 GraphicsBox[{{}, {{}, 
    {RGBColor[0.368417, 0.506779, 0.709798], PointSize[0.009166666666666668], 
     AbsoluteThickness[1.6], PointBox[CompressedData["
1:eJw1lws01Gkfx1UWm1YkpbI1iS5SKUJafLWUeJUuKtW6pRZj7veZFJL7bbeL
WhVJl43kaIVthaQIG227cguhk9Zbs0WUS2/vzq85Z86cz5k5830+/+d5fs/v
mR/A2bp/opqa2j+f3v///PeFYDi5FFpO2h3n8C/7BePjo/AE2/cpKg4PRsX2
Me/I2cdVnBmM73ybj41bnVZxeTCelFXGPziSoeLOYBw02BnflX1BxWohsJe7
t3OYV1TMCMGlrMp0O5c8FSMEV02udvALCyg/BJsYi/TvTi2i/BCcuRf8fKn3
b5QfgplbOwQL/CooPwTez3xru+yrKD8EV35nNtT01lA+Ew/4QhtG2EPKZyIw
le19euYflM/EPA3n6OkzmyifCQPtfZmDza2Uz8RL/YU+98s7KZ+JyFqHy1Nm
91A+EysXFxy+qPOC8pkIiOrWUxT1U34oODyBgGX4D+WHYl+X16ZgjwHKD8XE
aS4x1VOGKT8UByYwPZ6HjFJ+KCZ9kxDhXqbmqMoPRckvI03X8yepuDwUl95b
xjTN1FRxZyjCnZ3aEtS1VazGQuvvD4QusVNVzGBheuHhapM901QMFtQG9MO6
txio2I8F/3fDmu9vGKo4nIUv0zZWTE02onwWgnXtPIbEDMpnIeH06eXr/jGm
fBZmda3/ZbjUlPLZqJbuqL/fu5jy2VirsNQe5ZlTPhvdFiHnnawtKJ8Nx49F
fu84qyifjTNS7tsbf1tRPhtLvdzD/K7bUD4bAdmCL5ZX2FE+G199u6/55CIH
yudgbL7e97kDoHwOIiKWXS7S+JbyObgt5OhHe7hQPgf+m55H3K/bQPkcuOkI
6+1j3Sifg7jccLuiIx6Uz8G9oF9mRvl7Uj4HNUotxkTTrZTPhaPxVNe1OttV
rMvFbPOE2inzdtB4uEianmW6wXuXii24eFVs4v/z7d00Pi4WPHxs3ub5nYo9
udDtGd57U8uPxsuFxpWzxd3h/irmcrGldNL603r7aPxcdE+WeATeClRxKhfS
nNdHSw4dIB8uTGdN9n2zJ0jF+VwMJ8XuctsWQn5ctLWeFLQFhqq4gQtbu8vl
mals8uXiQGv4V6uZXBUruRDZFmi9+YlH/jzcsa8/6trEJ38eqs9N3N0zT0j+
PAympG3fIxSRPw/lU1fcMX8sJn8epIJoowoHKfnzoNPY/zL4hoz8eRjYOe2R
/0oF+fPgKXrcVld0kPx5mKCnNVTscoj8eVAmzsqa23KY/Hmo+NH9tbIknPx5
GL5VcLkvNoL8eXhpWnh/l3ck+fPQWtLoc8LsCPnzYM4u/vr1CLGSB99cd/fr
dVHkz0eW7+OGWWeOkj8fq1bd3skOjiZ/PhLjb8n6LGPIn48bQyvHqz4Qg4+D
b+uMHUpjyZ+P9IEX/YnyOPLnI3B99OHXK+PJn4+2K7r8S8+Iw/moeZm4cCgh
gfz5WKqYOnvZskTy5+OOh5F5ehVxPh9bZ+5tObM9ifz5CBBGsNKaiRv4SJq7
Qn9kWzL585Fs3d/9bSWxko+hmVcaPixMIX8BbBJ6hDcPEesKcCljbuOcB8QM
AWo37uNx1FPJXwDNuroU/6+JIcATR+0X9SuIPQXQs9U3vbSW2E+AphWd6j0g
5gpwvn359jhH4nABLg8wWjNsiFMFUM4Ys1mzhDhTAIe++lz2dOJ8AWpWffi1
4g2Nr1yAxhKfj+x84oZP/3/+z3GnAOJOAXxcmpZlaxErBZhs0lYyOZueh5oQ
R6y4Pw5aEesKMW/Hxv2vbtHzZAgxsq40PmYNsYUQuRf3/707j+YDQpjOkLZr
zSH2FKJxWf+YdTjNp58QVnYFX6Y8/Tz/QiB5clGp9ef5F+JW8PfHeXG0XlKF
SPaw/a93E62nTCECJCdvms4nzheifrNOXOT3tP7KhdBcFHxxTg6t1wYhCoPk
X57up/XcKcQ3tSuOnTMnVgox22jUupb5ef2LwOIfXl98lfaHrgiXgvJqh/to
PzFEcBtc/c7QjNhChAItg3NnmbT/IMJmjaInk67T/vQUIeJUjktEH+1fPxEq
Pc3sIuS0v7kiWGVYFz/UCyN/EdQiXE4syKf6kCqC4cJUO+MdcvIXISZ6/TVf
daon+SJsGd930+eWhPxFeFZbv/AHBdWjBhFq3AXWu1yoXnWK4GVpPaI+i+qZ
UoSvu0YHnryjeqcmRlJQYa5GB9VDXTGGBswDCxqpXjLEyDWpvdB7lkP+YjBC
Pzy+cI1F/mKsm/baN/0Rk/zF0OP26xdMofrsJ8aezVcdSz7Xb64Yu3WHQzll
VN/DxSh8/HJWpM1+8hcjy9Wdk1JJ50OmGPZmr5WL9gWQ/6ff71ln3GBA50m5
GGd4uk7qN33JX4z0vSe8fQLpPOoU426zo3vk6j3kL8aTh4o2m8Xe5C+B19PR
I/Zrd5K/BCNfNDx3Y3mRvwTzHlWZ6ZduI38J0py1jDYsofMTEmi0XF+Slk/n
q6cEllciA0IubCJ/Ce5pL3DOnfEf8pfg2vGx5weKN5K/BA0nLLsNo+k8T5Ug
+6bBnU1hdN5nSuCc4zWUnU79QL4ES1Z6ptY8dSJ/CRyHKtLDnKl/aJBAM3BD
hvkJe/KXwGrUtmuknfoPpQSSD5kfg3xtyV8K27h7BzINrMlfijgbZtjIqCX5
S1Hm492mNo36HQspnAdFNoFbqB+CFKyDOWPa3GXkL8VorzCq96gZ+UuR5fXD
r3efLiJ/KRIHol6yRNR/hUvxY4D12SHnBeQvhX17/IRq1/nkL0VdU5eDyfu5
5C/Fkj/vll4snkP+UhgK1nSkV1M/2CDFvLv/tTQwnkH+Uvzm0zHx/G198pfi
j7Oxla6n9MhfBt3WNAv9bdR/6spgVXUiL72F+lOGDH+Z3feqL9UifxlGVydd
1h74gvxlWFArWMgRUb/rKcODroH4ErsJ5C8Ds66l/Lh8XNUvc2XQ1F9qsvjV
B+qfZWA0s7uMq4ZUnCpD3Om0A5JB6r8zZYicu/vvCeI3Ks6XIf7qNY7YQUn9
vQyJ4qOCjGTq5xtkSGFMPH9Iv4/6fRm+yknu+eZjr4qVMpQflo+Xre+m/l+O
n88sztbopPuDrhwdLTvH5kW1031ADufeF9VxNc0qtpCjp6VKXhXxF90P5Mjb
Oz7wMIPuK55yjB65PV/dsJHuC3LY3bWNeltWT/5yxJzqa65vo/tPuBzorl+q
Jb5H/nJUXHN90XOwkvzlOObW7rCxp5z85ZjmuXnExKmU/D9973ch7ummEvKX
Q2dKcqq0o5D85fjLX6ek+hnd35Ry2Ho/mhHjlk/+CiTnGdVbTs8lfwV6l2c8
qTP/fB9UYO9il0ketdnkr4AO70ZH1NPz5K8A961xxa9558hfgTWvpg9abfmJ
/BV44VAudU06Sf4K/FCZEpGz6Rj5K6B57mpH1pFU8ldg3MrRKGhNIvkrsMjr
1O9lhrEO/wP71Zva
      "]]}, {}}, {}, {}, {{}, {}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{None, None},
  AxesOrigin->{198.25000000000003`, 0},
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
  PlotRange->{{202., 442.}, {0, 0.015872538373557035`}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.02], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"posteriorWeights", "[", 
    RowBox[{
    "1000", ",", "50", ",", "600", ",", "30", ",", "300", ",", "1050", ",", 
     "650"}], "]"}], ";"}], "//", "Timing"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"posteriorWeights", "[", 
    RowBox[{
    "100000", ",", "500", ",", "60000", ",", "450", ",", "300", ",", 
     "345344353", ",", "43534"}], "]"}], ";"}], "//", "Timing"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.008`", ",", "Null"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.008`", ",", "Null"}], "}"}]], "Output"]
}, Open  ]],

Cell["\<\
We don\[CloseCurlyQuote]t actually use the following definition because it is \
way too slow when all we want to do is draw random variates.\
\>", "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"corrRefPosterior", "[", 
    RowBox[{
    "\[Mu]x_", ",", "\[Sigma]x_", ",", "\[Mu]y_", ",", "\[Sigma]y_", ",", 
     "\[Sigma]xy_"}], "]"}], "[", 
   RowBox[{"x_", ",", 
    RowBox[{"y_", "?", "NumericQ"}]}], "]"}], ":=", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
     "weights", ",", "indeces", ",", "\[Theta]1", ",", "\[Theta]2", ",", 
      "\[Theta]3", ",", "\[Alpha]1", ",", "\[Alpha]2", ",", "\[Alpha]3", ",", 
      "\[Beta]1", ",", "\[Beta]2"}], "}"}], ",", "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{
      RowBox[{"{", 
       RowBox[{"indeces", ",", "weights"}], "}"}], "=", 
      RowBox[{"posteriorWeights", "[", 
       RowBox[{
       "\[Mu]x", ",", "\[Sigma]x", ",", "\[Mu]y", ",", "\[Sigma]y", ",", 
        "\[Sigma]xy", ",", "x", ",", "y"}], "]"}]}], ";", 
     "\[IndentingNewLine]", 
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
         RowBox[{"weights", ",", "\[IndentingNewLine]", 
          RowBox[{"Table", "[", 
           RowBox[{
            RowBox[{"ProductDistribution", "[", "\[IndentingNewLine]", 
             RowBox[{
              RowBox[{"GammaDistribution", "[", 
               RowBox[{
                RowBox[{"\[Alpha]1", "-", "k", "+", "x"}], ",", 
                SuperscriptBox[
                 RowBox[{"(", 
                  RowBox[{"\[Beta]1", "+", "1"}], ")"}], 
                 RowBox[{"-", "1"}]]}], "]"}], ",", "\[IndentingNewLine]", 
              RowBox[{"GammaDistribution", "[", 
               RowBox[{
                RowBox[{"\[Alpha]2", "-", "k", "+", "y"}], ",", 
                SuperscriptBox[
                 RowBox[{"(", 
                  RowBox[{"\[Beta]2", "+", "1"}], ")"}], 
                 RowBox[{"-", "1"}]]}], "]"}], ",", "\[IndentingNewLine]", 
              RowBox[{"GammaDistribution", "[", 
               RowBox[{
                RowBox[{"\[Alpha]3", "+", "k"}], ",", 
                SuperscriptBox[
                 RowBox[{"(", 
                  RowBox[{"1", "+", "1"}], ")"}], 
                 RowBox[{"-", "1"}]]}], "]"}]}], "\[IndentingNewLine]", "]"}],
             ",", 
            RowBox[{"{", 
             RowBox[{"k", ",", "indeces"}], "}"}]}], "]"}]}], 
         "\[IndentingNewLine]", "]"}]}]}], "]"}]}]}], "\[IndentingNewLine]", 
   "]"}]}]], "Input"],

Cell["Instead we do the random sampling a bit more manually:", "Text"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"ClearAll", "@", "corrRefPosterior"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"corrRefPosterior", "/:", 
  RowBox[{"RandomVariate", "[", 
   RowBox[{
    RowBox[{
     RowBox[{"corrRefPosterior", "[", 
      RowBox[{
      "\[Mu]x_", ",", "\[Mu]y_", ",", "\[Sigma]x_", ",", "\[Sigma]y_", ",", 
       RowBox[{"\[Sigma]xy_", "?", "NumericQ"}]}], "]"}], "[", 
     RowBox[{"x_", ",", 
      RowBox[{"y_", "?", "NumericQ"}]}], "]"}], ",", 
    RowBox[{"n_", "?", "NumericQ"}]}], "]"}], ":=", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
     "dist", ",", "weights", ",", "indeces", ",", "\[Theta]1", ",", 
      "\[Theta]2", ",", "\[Theta]3", ",", "\[Alpha]1", ",", "\[Alpha]2", ",", 
      "\[Alpha]3", ",", "\[Beta]1", ",", "\[Beta]2"}], "}"}], ",", 
    "\[IndentingNewLine]", 
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
     
     RowBox[{
      RowBox[{"{", 
       RowBox[{"indeces", ",", "weights"}], "}"}], "=", 
      RowBox[{"posteriorWeights", "[", 
       RowBox[{
       "\[Mu]x", ",", "\[Sigma]x", ",", "\[Mu]y", ",", "\[Sigma]y", ",", 
        "\[Sigma]xy", ",", "x", ",", "y"}], "]"}]}], ";", 
     "\[IndentingNewLine]", 
     RowBox[{"(*", 
      RowBox[{
      "Figure", " ", "out", " ", "how", " ", "many", " ", "samples", " ", 
       "of", " ", "each", " ", "mixand", " ", "we", " ", "need"}], "*)"}], 
     "\[IndentingNewLine]", 
     RowBox[{"dist", "=", 
      RowBox[{"Select", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"{", 
          RowBox[{"indeces", ",", 
           RowBox[{"RandomVariate", "[", 
            RowBox[{"MultinomialDistribution", "[", 
             RowBox[{"n", ",", "weights"}], "]"}], "]"}]}], "}"}], 
         "\[Transpose]"}], ",", 
        RowBox[{
         RowBox[{
          RowBox[{"Last", "[", "#", "]"}], ">", "0"}], "&"}]}], "]"}]}], ";", 
     "\[IndentingNewLine]", 
     RowBox[{"(*", 
      RowBox[{
      "Then", " ", "draw", " ", "the", " ", "appropriate", " ", "number", " ",
        "of", " ", "samples", " ", "from", " ", "each", " ", "product", " ", 
       RowBox[{"distribution", ".", " ", "Note"}], " ", "that", " ", "the", 
       " ", "order", " ", "of", " ", "this", " ", "list", " ", "is", " ", 
       "not", " ", 
       RowBox[{"randomized", "."}]}], " ", "*)"}], "\[IndentingNewLine]", 
     RowBox[{"Join", "@@", 
      RowBox[{"Map", "[", 
       RowBox[{
        RowBox[{
         RowBox[{
          RowBox[{"With", "[", 
           RowBox[{
            RowBox[{"{", "\[IndentingNewLine]", 
             RowBox[{
              RowBox[{"a", "=", 
               RowBox[{"RandomVariate", "[", 
                RowBox[{
                 RowBox[{"GammaDistribution", "[", 
                  RowBox[{
                   RowBox[{"\[Alpha]1", "-", 
                    RowBox[{"#", "[", 
                    RowBox[{"[", "1", "]"}], "]"}], "+", "x"}], ",", 
                   SuperscriptBox[
                    RowBox[{"(", 
                    RowBox[{"\[Beta]1", "+", "1"}], ")"}], 
                    RowBox[{"-", "1"}]]}], "]"}], ",", 
                 RowBox[{"#", "[", 
                  RowBox[{"[", "2", "]"}], "]"}]}], "]"}]}], ",", 
              "\[IndentingNewLine]", 
              RowBox[{"b", "=", 
               RowBox[{"RandomVariate", "[", 
                RowBox[{
                 RowBox[{"GammaDistribution", "[", 
                  RowBox[{
                   RowBox[{"\[Alpha]2", "-", 
                    RowBox[{"#", "[", 
                    RowBox[{"[", "1", "]"}], "]"}], "+", "y"}], ",", 
                   SuperscriptBox[
                    RowBox[{"(", 
                    RowBox[{"\[Beta]2", "+", "1"}], ")"}], 
                    RowBox[{"-", "1"}]]}], "]"}], ",", 
                 RowBox[{"#", "[", 
                  RowBox[{"[", "2", "]"}], "]"}]}], "]"}]}], ",", 
              "\[IndentingNewLine]", 
              RowBox[{"c", "=", 
               RowBox[{"RandomVariate", "[", 
                RowBox[{
                 RowBox[{"GammaDistribution", "[", 
                  RowBox[{
                   RowBox[{"\[Alpha]3", "+", 
                    RowBox[{"#", "[", 
                    RowBox[{"[", "1", "]"}], "]"}]}], ",", 
                   SuperscriptBox[
                    RowBox[{"(", 
                    RowBox[{"1", "+", "1"}], ")"}], 
                    RowBox[{"-", "1"}]]}], "]"}], ",", 
                 RowBox[{"#", "[", 
                  RowBox[{"[", "2", "]"}], "]"}]}], "]"}]}]}], 
             "\[IndentingNewLine]", "}"}], ",", 
            RowBox[{"{", 
             RowBox[{
              RowBox[{"a", "+", "c"}], ",", 
              RowBox[{"b", "+", "c"}]}], "}"}]}], "]"}], "\[Transpose]"}], 
         "&"}], ",", "dist", ",", "1"}], "]"}]}]}]}], "\[IndentingNewLine]", 
   "]"}]}]}], "Input"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"RandomVariate", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"corrRefPosterior", "[", 
       RowBox[{"1000", ",", "600", ",", "50", ",", "30", ",", "500"}], "]"}], 
      "[", 
      RowBox[{"1050", ",", "650"}], "]"}], ",", "1000"}], "]"}], "//", 
   "Dimensions"}], "//", "Timing"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"RandomVariate", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"corrRefPosterior", "[", 
       RowBox[{"100000", ",", 
        RowBox[{"2", " ", 
         RowBox[{"Sqrt", "[", "100000", "]"}]}], ",", "60000", ",", 
        RowBox[{"2", 
         RowBox[{"Sqrt", "[", "60000", "]"}]}], ",", 
        RowBox[{"1.5", 
         RowBox[{"Sqrt", "[", "60000", "]"}]}]}], "]"}], "[", 
      RowBox[{"150000", ",", "65000"}], "]"}], ",", "1000"}], "]"}], "//", 
   "Dimensions"}], "//", "Timing"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.04`", ",", 
   RowBox[{"{", 
    RowBox[{"1000", ",", "2"}], "}"}]}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.044`", ",", 
   RowBox[{"{", 
    RowBox[{"1000", ",", "2"}], "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ListPlot", "[", 
  RowBox[{"{", 
   RowBox[{
    RowBox[{"RandomVariate", "[", 
     RowBox[{
      RowBox[{
       RowBox[{"corrRefPosterior", "[", 
        RowBox[{"1000", ",", "600", ",", "50", ",", "30", ",", "500"}], "]"}],
        "[", 
       RowBox[{"1050", ",", "650"}], "]"}], ",", "1000"}], "]"}], ",", 
    RowBox[{"RandomVariate", "[", 
     RowBox[{
      RowBox[{
       RowBox[{"uncorrRefPosterior", "[", 
        RowBox[{"1000", ",", "600", ",", "50", ",", "30"}], "]"}], "[", 
       RowBox[{"1050", ",", "650"}], "]"}], ",", "1000"}], "]"}]}], "}"}], 
  "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{}, {{}, 
    {RGBColor[0.368417, 0.506779, 0.709798], PointSize[0.004583333333333334], 
     AbsoluteThickness[1.6], PointBox[CompressedData["
1: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
JD0pOPzn4uWA1QT8B2DsLZw=
      "]]}, 
    {RGBColor[0.880722, 0.611041, 0.142051], PointSize[0.004583333333333334], 
     AbsoluteThickness[1.6], PointBox[CompressedData["
1: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
      
      "]]}, {}}, {}, {}, {{}, {}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{None, None},
  AxesOrigin->{938.1397062438787, 558.6355640534621},
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
  PlotRange->{{940.7975931864424, 1110.902357510531}, {565.4129425229781, 
   700.9605119132993}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.05], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["Estimators", "Subsubsection"],

Cell["\<\
We use a particle approximation for our estimator. This is simply because a \
closed form expression for the mean of the posterior is intractable, even \
when the reference posterior is known as a product of gammas, even when the \
prior for p is flat. Perhaps there is some better prior for p? I doubt it.\
\>", "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"estimatorBayes", "[", 
    RowBox[{"pprior_", ",", "refPosterior_", ",", 
     RowBox[{"nParticles_:", "3000"}]}], "]"}], "[", "data_", "]"}], ":=", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
     "sigData", ",", "makeIntermediateParticles", ",", "particles", ",", 
      "likelihoods"}], "}"}], ",", "\[IndentingNewLine]", 
    RowBox[{"(*", " ", 
     RowBox[{
      RowBox[{
      "Apoligies", " ", "if", " ", "this", " ", "function", " ", "is", " ", 
       "difficult", " ", "to", " ", "parse"}], ";", " ", 
      RowBox[{
      "it", " ", "needed", " ", "to", " ", "work", " ", "for", " ", "arrays", 
       " ", "of", " ", "data"}]}], " ", "*)"}], "\[IndentingNewLine]", 
    RowBox[{"(*", " ", 
     RowBox[{
     "Sample", " ", "from", " ", "the", " ", "prior", " ", "on", " ", "p", 
      " ", "to", " ", "get", " ", "particles", " ", "for", " ", "the", " ", 
      "particles", " ", "approximation"}], " ", "*)"}], "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"particles", "=", 
      RowBox[{"RandomVariate", "[", 
       RowBox[{"pprior", ",", "nParticles"}], "]"}]}], ";", 
     "\[IndentingNewLine]", 
     RowBox[{"(*", " ", 
      RowBox[{
       RowBox[{
       "Since", " ", "we", " ", "know", " ", "the", " ", "posterior", " ", 
        "of", " ", "the", " ", "references"}], ",", " ", 
       RowBox[{
       "sample", " ", "from", " ", "this", " ", "instead", " ", "of", " ", 
        "using", " ", "a", " ", "particle", " ", "update"}]}], " ", "*)"}], 
     "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{"makeIntermediateParticles", "[", 
       RowBox[{"x_", ",", "y_"}], "]"}], ":=", 
      RowBox[{
       RowBox[{"Join", "[", 
        RowBox[{
         RowBox[{
          RowBox[{"RandomVariate", "[", 
           RowBox[{
            RowBox[{"refPosterior", "[", 
             RowBox[{"x", ",", "y"}], "]"}], ",", "nParticles"}], "]"}], 
          "\[Transpose]"}], ",", 
         RowBox[{"{", "particles", "}"}]}], "]"}], "\[Transpose]"}]}], ";", 
     "\[IndentingNewLine]", 
     RowBox[{"particles", "=", 
      RowBox[{"makeIntermediateParticles", "@@@", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"data", "[", 
          RowBox[{"[", 
           RowBox[{"{", 
            RowBox[{"1", ",", "2"}], "}"}], "]"}], "]"}], "\[Transpose]"}], 
        ")"}]}]}], ";", "\[IndentingNewLine]", 
     RowBox[{"(*", " ", 
      RowBox[{
      "Now", " ", "compute", " ", "the", " ", "likelihoods", " ", "of", " ", 
       "all", " ", "particles", " ", "given", " ", "the", " ", "z", " ", 
       "data"}], " ", "*)"}], "\[IndentingNewLine]", 
     RowBox[{"likelihoods", "=", 
      RowBox[{"MapThread", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"likelihoodCCa", "[", 
          RowBox[{
           RowBox[{"Sequence", "@@", 
            RowBox[{"(", 
             RowBox[{"#1", "\[Transpose]"}], ")"}]}], ",", "#2"}], "]"}], 
         "&"}], ",", 
        RowBox[{"{", 
         RowBox[{"particles", ",", 
          RowBox[{"data", "[", 
           RowBox[{"[", "3", "]"}], "]"}]}], "}"}], ",", "1"}], "]"}]}], ";", 
     "\[IndentingNewLine]", 
     RowBox[{"(*", " ", 
      RowBox[{"Finally", ",", " ", 
       RowBox[{
       "normalize", " ", "the", " ", "likelihoods", " ", "and", " ", "use", 
        " ", "them", " ", "to", " ", "approximate", " ", "the", " ", "mean", 
        " ", "of", " ", "the", " ", "posteriors"}]}], " ", "*)"}], 
     "\[IndentingNewLine]", 
     RowBox[{"likelihoods", "=", 
      RowBox[{"Map", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"(", 
          RowBox[{"#", "/", 
           RowBox[{"Total", "[", "#", "]"}]}], ")"}], "&"}], ",", 
        "likelihoods"}], "]"}]}], ";", "\[IndentingNewLine]", 
     RowBox[{"Map", "[", 
      RowBox[{"Total", ",", 
       RowBox[{"(", 
        RowBox[{"likelihoods", " ", "*", " ", 
         RowBox[{"particles", "[", 
          RowBox[{"[", 
           RowBox[{"All", ",", "All", ",", "3"}], "]"}], "]"}]}], ")"}], ",", 
       
       RowBox[{"{", "1", "}"}]}], "]"}]}]}], "\[IndentingNewLine]", 
   "]"}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"estimatorBayes", "[", 
   RowBox[{"uniformP", ",", 
    RowBox[{"uncorrRefPosterior", "[", 
     RowBox[{"70000", ",", "50000", ",", "200", ",", "200"}], "]"}], ",", 
    "100"}], "]"}], "[", 
  RowBox[{"Transpose", "@", 
   RowBox[{"Last", "@", 
    RowBox[{"First", "@", 
     RowBox[{"genData", "[", 
      RowBox[{"0.5", ",", 
       RowBox[{"hyperPriorBP", "[", 
        RowBox[{"70000", ",", "50000", ",", "10", ",", "10", ",", "10"}], 
        "]"}], ",", "500", ",", "10"}], "]"}]}]}]}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "0.48457183689270367`", ",", "0.5000476880487256`", ",", 
   "0.5000167267950489`", ",", "0.5070465564064538`", ",", 
   "0.5051345444084359`", ",", "0.4923770542035427`", ",", 
   "0.5084143738810316`", ",", "0.5101029465489884`", ",", 
   "0.49168425635973356`", ",", "0.4920029094795064`"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"estimatorBayes", "[", 
   RowBox[{"uniformP", ",", 
    RowBox[{"corrRefPosterior", "[", 
     RowBox[{"70000", ",", "50000", ",", "200", ",", "200", ",", "200"}], 
     "]"}], ",", "100"}], "]"}], "[", 
  RowBox[{"Transpose", "@", 
   RowBox[{"Last", "@", 
    RowBox[{"First", "@", 
     RowBox[{"genData", "[", 
      RowBox[{"0.65", ",", 
       RowBox[{"hyperPriorBP", "[", 
        RowBox[{"70000", ",", "50000", ",", "10", ",", "10", ",", "10"}], 
        "]"}], ",", "500", ",", "10"}], "]"}]}]}]}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "0.6216686501845915`", ",", "0.6312794356036268`", ",", 
   "0.6284098465731376`", ",", "0.6667479185121361`", ",", 
   "0.6415768486321525`", ",", "0.6687204200636072`", ",", 
   "0.6160566387925028`", ",", "0.6749266022234721`", ",", 
   "0.6370346191798973`", ",", "0.6180979488350062`"}], "}"}]], "Output"]
}, Open  ]]
}, Closed]]
}, Closed]],

Cell[CellGroupData[{

Cell["Loss Functions", "Subsection"],

Cell["Define the mean squared error loss function:", "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{"mse", "[", 
   RowBox[{"p_", ",", "pestimate_"}], "]"}], ":=", 
  RowBox[{
   RowBox[{"Total", "[", 
    SuperscriptBox[
     RowBox[{"(", 
      RowBox[{"p", "-", "pestimate"}], ")"}], "2"], "]"}], "/", 
   RowBox[{"If", "[", 
    RowBox[{
     RowBox[{"ListQ", "[", "pestimate", "]"}], ",", 
     RowBox[{"Length", "[", "pestimate", "]"}], ",", "1"}], 
    "]"}]}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Mean", "[", 
  RowBox[{
   RowBox[{
    RowBox[{"mse", "[", 
     RowBox[{
      RowBox[{
       RowBox[{"First", "[", "#1", "]"}], "\[LeftDoubleBracket]", "3", 
       "\[RightDoubleBracket]"}], ",", 
      RowBox[{"estimatorMLE", "[", 
       RowBox[{
        RowBox[{"Last", "[", "#", "]"}], "\[Transpose]"}], "]"}]}], "]"}], 
    "&"}], "/@", 
   RowBox[{"genData", "[", 
    RowBox[{"0.5", ",", 
     RowBox[{"hyperPriorNormal", "[", 
      RowBox[{"7000", ",", "5000", ",", 
       RowBox[{"2", 
        RowBox[{"Sqrt", "[", "7000", "]"}]}], ",", 
       RowBox[{"2", " ", 
        RowBox[{"Sqrt", "[", "3500", "]"}]}], ",", 
       RowBox[{"1.5", " ", 
        RowBox[{"Sqrt", "[", "3500", "]"}]}]}], "]"}], ",", "50", ",", 
     "1000"}], "]"}]}], "]"}]], "Input"],

Cell[BoxData["0.002253281303526387`"], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["Risk Definition", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"monteCarloRisk", "[", 
   RowBox[{
   "estimator_", ",", "loss_", ",", "pvals_", ",", "hyperPrior_", ",", 
    "nParam_", ",", "nSampPerParam_"}], "]"}], ":=", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"data", ",", "estimates"}], "}"}], ",", "\[IndentingNewLine]", 
    RowBox[{"Table", "[", "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{
       RowBox[{"data", "=", 
        RowBox[{"genData", "[", 
         RowBox[{
         "p", ",", "hyperPrior", ",", "nParam", ",", "nSampPerParam"}], 
         "]"}]}], ";", "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{"p", ",", 
         RowBox[{"Mean", "[", 
          RowBox[{
           RowBox[{
            RowBox[{"loss", "[", 
             RowBox[{
              RowBox[{
               RowBox[{"First", "[", "#", "]"}], "\[LeftDoubleBracket]", "3", 
               "\[RightDoubleBracket]"}], ",", 
              RowBox[{"estimator", "[", 
               RowBox[{
                RowBox[{"Last", "[", "#", "]"}], "\[Transpose]"}], "]"}]}], 
             "]"}], "&"}], "/@", "data"}], "]"}]}], "}"}]}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{"p", ",", "pvals"}], "}"}]}], "\[IndentingNewLine]", "]"}]}], 
   "\[IndentingNewLine]", "]"}]}]], "Input"]
}, Closed]],

Cell[CellGroupData[{

Cell["Setups", "Subsection"],

Cell["Here we define all of the parameter sets to do tests with.", "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{"$setups", "=", 
   RowBox[{"{", "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"id", "\[Rule]", "1"}], ",", 
       RowBox[{"name", "\[Rule]", "\"\<High-Data Regime\>\""}], ",", 
       RowBox[{"shortname", "\[Rule]", "\"\<hd\>\""}], ",", 
       RowBox[{"\[Alpha]bar", "\[Rule]", "100000"}], ",", 
       RowBox[{"\[Beta]bar", "\[Rule]", 
        RowBox[{"\[Alpha]bar", "/", "4"}]}], ",", 
       RowBox[{"\[Alpha]sigma", "\[Rule]", 
        RowBox[{"2", " ", 
         RowBox[{"Sqrt", "[", "\[Alpha]bar", "]"}]}]}], ",", 
       RowBox[{"\[Beta]sigma", "\[Rule]", 
        RowBox[{"2", " ", 
         RowBox[{"Sqrt", "[", "\[Beta]bar", "]"}]}]}], ",", 
       RowBox[{"\[Alpha]\[Beta]sigma", "\[Rule]", 
        RowBox[{"1.5", " ", "\[Beta]bar"}]}]}], "}"}], ",", 
     "\[IndentingNewLine]", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"id", "\[Rule]", "2"}], ",", 
       RowBox[{"name", "\[Rule]", "\"\<Mid-Data Regime\>\""}], ",", 
       RowBox[{"shortname", "\[Rule]", "\"\<md\>\""}], ",", 
       RowBox[{"\[Alpha]bar", "\[Rule]", "10000"}], ",", 
       RowBox[{"\[Beta]bar", "\[Rule]", 
        RowBox[{"\[Alpha]bar", "/", "4"}]}], ",", 
       RowBox[{"\[Alpha]sigma", "\[Rule]", 
        RowBox[{"2", " ", 
         RowBox[{"Sqrt", "[", "\[Alpha]bar", "]"}]}]}], ",", 
       RowBox[{"\[Beta]sigma", "\[Rule]", 
        RowBox[{"2", " ", 
         RowBox[{"Sqrt", "[", "\[Beta]bar", "]"}]}]}], ",", 
       RowBox[{"\[Alpha]\[Beta]sigma", "\[Rule]", 
        RowBox[{"1.5", " ", "\[Beta]bar"}]}]}], "}"}], ",", 
     "\[IndentingNewLine]", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"id", "\[Rule]", "3"}], ",", 
       RowBox[{"name", "\[Rule]", "\"\<Low-Data Regime\>\""}], ",", 
       RowBox[{"shortname", "\[Rule]", "\"\<ld\>\""}], ",", 
       RowBox[{"\[Alpha]bar", "\[Rule]", "1000"}], ",", 
       RowBox[{"\[Beta]bar", "\[Rule]", 
        RowBox[{"\[Alpha]bar", "/", "4"}]}], ",", 
       RowBox[{"\[Alpha]sigma", "\[Rule]", 
        RowBox[{"2", " ", 
         RowBox[{"Sqrt", "[", "\[Alpha]bar", "]"}]}]}], ",", 
       RowBox[{"\[Beta]sigma", "\[Rule]", 
        RowBox[{"2", " ", 
         RowBox[{"Sqrt", "[", "\[Beta]bar", "]"}]}]}], ",", 
       RowBox[{"\[Alpha]\[Beta]sigma", "\[Rule]", 
        RowBox[{"1.5", " ", "\[Beta]bar"}]}]}], "}"}], ",", 
     "\[IndentingNewLine]", "\[IndentingNewLine]", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"id", "\[Rule]", "4"}], ",", 
       RowBox[{"name", "\[Rule]", "\"\<High-Contrast Regime\>\""}], ",", 
       RowBox[{"shortname", "\[Rule]", "\"\<hc\>\""}], ",", 
       RowBox[{"\[Alpha]bar", "\[Rule]", "10000"}], ",", 
       RowBox[{"\[Beta]bar", "\[Rule]", 
        RowBox[{"0.1", "\[Alpha]bar"}]}], ",", 
       RowBox[{"\[Alpha]sigma", "\[Rule]", 
        RowBox[{"2", " ", 
         RowBox[{"Sqrt", "[", "\[Alpha]bar", "]"}]}]}], ",", 
       RowBox[{"\[Beta]sigma", "\[Rule]", 
        RowBox[{"2", " ", 
         RowBox[{"Sqrt", "[", "\[Beta]bar", "]"}]}]}], ",", 
       RowBox[{"\[Alpha]\[Beta]sigma", "\[Rule]", 
        RowBox[{"1.5", " ", "\[Beta]bar"}]}]}], "}"}], ",", 
     "\[IndentingNewLine]", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"id", "\[Rule]", "5"}], ",", 
       RowBox[{"name", "\[Rule]", "\"\<Low-Contrast Regime\>\""}], ",", 
       RowBox[{"shortname", "\[Rule]", "\"\<lc\>\""}], ",", 
       RowBox[{"\[Alpha]bar", "\[Rule]", "10000"}], ",", 
       RowBox[{"\[Beta]bar", "\[Rule]", 
        RowBox[{"0.9", "\[Alpha]bar"}]}], ",", 
       RowBox[{"\[Alpha]sigma", "\[Rule]", 
        RowBox[{"2", " ", 
         RowBox[{"Sqrt", "[", "\[Alpha]bar", "]"}]}]}], ",", 
       RowBox[{"\[Beta]sigma", "\[Rule]", 
        RowBox[{"2", " ", 
         RowBox[{"Sqrt", "[", "\[Beta]bar", "]"}]}]}], ",", 
       RowBox[{"\[Alpha]\[Beta]sigma", "\[Rule]", 
        RowBox[{"1.5", " ", "\[Beta]bar"}]}]}], "}"}], ",", 
     "\[IndentingNewLine]", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"id", "\[Rule]", "6"}], ",", 
       RowBox[{"name", "\[Rule]", "\"\<Mid-Contrast Regime\>\""}], ",", 
       RowBox[{"shortname", "\[Rule]", "\"\<mc\>\""}], ",", 
       RowBox[{"\[Alpha]bar", "\[Rule]", "10000"}], ",", 
       RowBox[{"\[Beta]bar", "\[Rule]", 
        RowBox[{"0.5", "\[Alpha]bar"}]}], ",", 
       RowBox[{"\[Alpha]sigma", "\[Rule]", 
        RowBox[{"2", " ", 
         RowBox[{"Sqrt", "[", "\[Alpha]bar", "]"}]}]}], ",", 
       RowBox[{"\[Beta]sigma", "\[Rule]", 
        RowBox[{"2", " ", 
         RowBox[{"Sqrt", "[", "\[Beta]bar", "]"}]}]}], ",", 
       RowBox[{"\[Alpha]\[Beta]sigma", "\[Rule]", 
        RowBox[{"1.5", " ", "\[Beta]bar"}]}]}], "}"}]}], 
    "\[IndentingNewLine]", "}"}]}], ";"}]], "Input"]
}, Closed]],

Cell[CellGroupData[{

Cell["Test Risk", "Subsection"],

Cell["\<\
Check how long it takes to compute the risk for each setup and estimator on \
small sample sizes. This will help us estimate how long bigger runs will \
take. Note how crazy long Bayes with correlated prior takes...\
\>", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"TextGrid", "@", 
  RowBox[{"{", "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Prepend", "[", 
     RowBox[{
      RowBox[{"$setups", "[", 
       RowBox[{"[", 
        RowBox[{"All", ",", "2", ",", "2"}], "]"}], "]"}], ",", "\"\<\>\""}], 
     "]"}], ",", "\[IndentingNewLine]", 
    RowBox[{"Prepend", "[", 
     RowBox[{
      RowBox[{"Table", "[", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{
         RowBox[{
          RowBox[{
           RowBox[{"ReleaseHold", "[", 
            RowBox[{
             RowBox[{"Hold", "[", "\[IndentingNewLine]", 
              RowBox[{"monteCarloRisk", "[", 
               RowBox[{"estimatorMLE", ",", "mse", ",", 
                RowBox[{"Range", "[", 
                 RowBox[{"0", ",", "1", ",", "0.1"}], "]"}], ",", 
                RowBox[{"hyperPriorNormal", "[", 
                 RowBox[{
                 "\[Alpha]bar", ",", "\[Beta]bar", ",", "\[Alpha]sigma", ",", 
                  "\[Beta]sigma", ",", "\[Alpha]\[Beta]sigma"}], "]"}], ",", 
                "10", ",", "10"}], "]"}], "\[IndentingNewLine]", "]"}], "//.",
              "setup"}], "]"}], ";"}], "//", "Timing"}], "//", "First"}], ",",
         "\[IndentingNewLine]", 
        RowBox[{"{", 
         RowBox[{"setup", ",", "$setups"}], "}"}]}], "\[IndentingNewLine]", 
       "]"}], ",", "\"\<MLE\>\""}], "]"}], ",", "\[IndentingNewLine]", 
    RowBox[{"Prepend", "[", 
     RowBox[{
      RowBox[{"Table", "[", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{
         RowBox[{
          RowBox[{
           RowBox[{"ReleaseHold", "[", 
            RowBox[{
             RowBox[{"Hold", "[", "\[IndentingNewLine]", 
              RowBox[{"monteCarloRisk", "[", 
               RowBox[{"estimatorMLEBC", ",", "mse", ",", 
                RowBox[{"Range", "[", 
                 RowBox[{"0", ",", "1", ",", "0.1"}], "]"}], ",", 
                RowBox[{"hyperPriorNormal", "[", 
                 RowBox[{
                 "\[Alpha]bar", ",", "\[Beta]bar", ",", "\[Alpha]sigma", ",", 
                  "\[Beta]sigma", ",", "\[Alpha]\[Beta]sigma"}], "]"}], ",", 
                "10", ",", "10"}], "]"}], "\[IndentingNewLine]", "]"}], "//.",
              "setup"}], "]"}], ";"}], "//", "Timing"}], "//", "First"}], ",",
         "\[IndentingNewLine]", 
        RowBox[{"{", 
         RowBox[{"setup", ",", "$setups"}], "}"}]}], "\[IndentingNewLine]", 
       "]"}], ",", "\"\<MLEBC\>\""}], "]"}], ",", "\[IndentingNewLine]", 
    RowBox[{"Prepend", "[", 
     RowBox[{
      RowBox[{"Table", "[", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{
         RowBox[{
          RowBox[{
           RowBox[{"ReleaseHold", "[", 
            RowBox[{
             RowBox[{"Hold", "[", "\[IndentingNewLine]", 
              RowBox[{"monteCarloRisk", "[", 
               RowBox[{
                RowBox[{"estimatorBayes", "[", 
                 RowBox[{"uniformP", ",", 
                  RowBox[{"uncorrRefPosterior", "[", 
                   RowBox[{
                   "\[Alpha]bar", ",", "\[Beta]bar", ",", "\[Alpha]sigma", 
                    ",", "\[Beta]sigma"}], "]"}]}], "]"}], ",", "mse", ",", 
                RowBox[{"Range", "[", 
                 RowBox[{"0", ",", "1", ",", "0.1"}], "]"}], ",", 
                RowBox[{"hyperPriorNormal", "[", 
                 RowBox[{
                 "\[Alpha]bar", ",", "\[Beta]bar", ",", "\[Alpha]sigma", ",", 
                  "\[Beta]sigma", ",", "\[Alpha]\[Beta]sigma"}], "]"}], ",", 
                "10", ",", "10"}], "]"}], "\[IndentingNewLine]", "]"}], "//.",
              "setup"}], "]"}], ";"}], "//", "Timing"}], "//", "First"}], ",",
         "\[IndentingNewLine]", 
        RowBox[{"{", 
         RowBox[{"setup", ",", "$setups"}], "}"}]}], "\[IndentingNewLine]", 
       "]"}], ",", "\"\<Bayes-U1\>\""}], "]"}], ",", "\[IndentingNewLine]", 
    RowBox[{"Prepend", "[", 
     RowBox[{
      RowBox[{"Table", "[", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{
         RowBox[{"(", 
          RowBox[{
           RowBox[{
            RowBox[{
             RowBox[{"ReleaseHold", "[", 
              RowBox[{
               RowBox[{"Hold", "[", "\[IndentingNewLine]", 
                RowBox[{"monteCarloRisk", "[", 
                 RowBox[{
                  RowBox[{"estimatorBayes", "[", 
                   RowBox[{"uniformP", ",", 
                    RowBox[{"corrRefPosterior", "[", 
                    RowBox[{
                    "\[Alpha]bar", ",", "\[Beta]bar", ",", "\[Alpha]sigma", 
                    ",", "\[Beta]sigma", ",", "\[Alpha]\[Beta]sigma"}], 
                    "]"}]}], "]"}], ",", "mse", ",", 
                  RowBox[{"Range", "[", 
                   RowBox[{"0", ",", "1", ",", "0.1"}], "]"}], ",", 
                  RowBox[{"hyperPriorNormal", "[", 
                   RowBox[{
                   "\[Alpha]bar", ",", "\[Beta]bar", ",", "\[Alpha]sigma", 
                    ",", "\[Beta]sigma", ",", "\[Alpha]\[Beta]sigma"}], "]"}],
                   ",", "2", ",", "2"}], "]"}], "\[IndentingNewLine]", "]"}], 
               "//.", "setup"}], "]"}], ";"}], "//", "Timing"}], "//", 
           "First"}], ")"}], "*", "25"}], 
        RowBox[{"(*", 
         RowBox[{
         "mult", " ", "by", " ", "25", " ", "because", " ", "fewer", " ", 
          "samples"}], "*)"}], ",", "\[IndentingNewLine]", 
        RowBox[{"{", 
         RowBox[{"setup", ",", "$setups"}], "}"}]}], "\[IndentingNewLine]", 
       "]"}], ",", "\"\<Bayes-C1\>\""}], "]"}]}], "\[IndentingNewLine]", 
   "}"}]}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {Cell[""], Cell["High-Data Regime"], Cell["Mid-Data Regime"], Cell[
     "Low-Data Regime"], Cell["High-Contrast Regime"], Cell[
     "Low-Contrast Regime"], Cell["Mid-Contrast Regime"]},
    {Cell["MLE"], "0.062311`", "0.052005`", "0.053599`", "0.056397`", 
     "0.054739`", "0.056219`"},
    {Cell["MLEBC"], "0.058251`", "0.058142`", "0.059175`", "0.06065`", 
     "0.059758`", "0.078362`"},
    {Cell["Bayes-U1"], "4.412915`", "4.222987`", "2.134891`", "4.050404`", 
     "2.16004`", "3.983344`"},
    {Cell["Bayes-C1"], "1278.098125`", "146.8448`", "38.776075`", "92.51`", 
     "343.504975`", "237.303275`"}
   },
   AutoDelete->False,
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "TextGrid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"2", "*", "10", "*", "100", "*", 
  RowBox[{
   RowBox[{
    RowBox[{"1278", "/", "60."}], "/", "60"}], "/", "24"}]}]], "Input"],

Cell[BoxData["29.58333333333333`"], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["Risk -- Systematic Plots", "Subsection"],

Cell[CellGroupData[{

Cell["Calculations", "Subsubsection"],

Cell["\<\
The more CPU cores on your machine, the better. Although regular Mathematica \
licenses only allow 16 kernels I think.\
\>", "Text"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"LaunchKernels", "[", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"DistributeDefinitions", "[", 
   RowBox[{
   "monteCarloRisk", ",", "estimatorBayes", ",", "estimatorMLE", ",", 
    "estimatorMLEBC", ",", "mse", ",", "hyperPriorNormal", ",", 
    "uncorrRefPosterior", ",", "corrRefPosterior", ",", "posteriorWeights"}], 
   "]"}], ";"}]}], "Input"],

Cell["\<\
Now we systematically call each estimator on all setups. We save the data and \
the notebook between different estimators in case something crashes. If \
something does crash, run the DumpGet calls to the data you have already \
computed. The bayes estimators take a very long time, set aside a few days of \
CPU time.\
\>", "Text"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"allDataMLE", "=", 
   RowBox[{"Parallelize", "@", 
    RowBox[{"Table", "[", 
     RowBox[{
      RowBox[{"{", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"id", "\[Rule]", 
         RowBox[{"(", 
          RowBox[{"id", "/.", "setup"}], ")"}]}], ",", 
        RowBox[{"name", "\[Rule]", 
         RowBox[{"(", 
          RowBox[{"name", "/.", "setup"}], ")"}]}], ",", 
        RowBox[{"shortname", "\[Rule]", 
         RowBox[{"(", 
          RowBox[{"shortname", "/.", "setup"}], ")"}]}], ",", 
        "\[IndentingNewLine]", 
        RowBox[{"data", "\[Rule]", 
         RowBox[{"ReleaseHold", "[", 
          RowBox[{
           RowBox[{"Hold", "[", 
            RowBox[{"monteCarloRisk", "[", 
             RowBox[{"estimatorMLE", ",", "mse", ",", 
              RowBox[{"Range", "[", 
               RowBox[{"0", ",", "1", ",", "0.05"}], "]"}], ",", 
              RowBox[{"hyperPriorNormal", "[", 
               RowBox[{
               "\[Alpha]bar", ",", "\[Beta]bar", ",", "\[Alpha]sigma", ",", 
                "\[Beta]sigma", ",", "\[Alpha]\[Beta]sigma"}], "]"}], ",", 
              "1000", ",", "1000"}], "]"}], "]"}], "//.", "setup"}], 
          "]"}]}]}], "\[IndentingNewLine]", "}"}], ",", "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{"setup", ",", "$setups"}], "}"}]}], "\[IndentingNewLine]", 
     "]"}]}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"SetDirectory", "[", 
   RowBox[{"NotebookDirectory", "[", "]"}], "]"}], ";", 
  RowBox[{"DumpSave", "[", 
   RowBox[{
   "\"\<../data/estimator_sims/allDataMLE.mx\>\"", ",", "allDataMLE"}], "]"}],
   ";"}]}], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"SetDirectory", "[", 
   RowBox[{"NotebookDirectory", "[", "]"}], "]"}], ";", 
  RowBox[{
  "DumpGet", "[", "\"\<../data/estimator_sims/allDataMLE.mx\>\"", 
   "]"}]}]], "Input"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"allDataMLEBC", "=", 
   RowBox[{"Parallelize", "@", 
    RowBox[{"Table", "[", 
     RowBox[{
      RowBox[{"{", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"id", "\[Rule]", 
         RowBox[{"(", 
          RowBox[{"id", "/.", "setup"}], ")"}]}], ",", 
        RowBox[{"name", "\[Rule]", 
         RowBox[{"(", 
          RowBox[{"name", "/.", "setup"}], ")"}]}], ",", 
        RowBox[{"shortname", "\[Rule]", 
         RowBox[{"(", 
          RowBox[{"shortname", "/.", "setup"}], ")"}]}], ",", 
        "\[IndentingNewLine]", 
        RowBox[{"data", "\[Rule]", 
         RowBox[{"ReleaseHold", "[", 
          RowBox[{
           RowBox[{"Hold", "[", 
            RowBox[{"monteCarloRisk", "[", 
             RowBox[{"estimatorMLEBC", ",", "mse", ",", 
              RowBox[{"Range", "[", 
               RowBox[{"0", ",", "1", ",", "0.05"}], "]"}], ",", 
              RowBox[{"hyperPriorNormal", "[", 
               RowBox[{
               "\[Alpha]bar", ",", "\[Beta]bar", ",", "\[Alpha]sigma", ",", 
                "\[Beta]sigma", ",", "\[Alpha]\[Beta]sigma"}], "]"}], ",", 
              "1000", ",", "1000"}], "]"}], "]"}], "//.", "setup"}], 
          "]"}]}]}], "\[IndentingNewLine]", "}"}], ",", "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{"setup", ",", "$setups"}], "}"}]}], "\[IndentingNewLine]", 
     "]"}]}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"SetDirectory", "[", 
   RowBox[{"NotebookDirectory", "[", "]"}], "]"}], ";", 
  RowBox[{"DumpSave", "[", 
   RowBox[{
   "\"\<../data/estimator_sims/allDataMLEBC.mx\>\"", ",", "allDataMLEBC"}], 
   "]"}], ";"}]}], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"SetDirectory", "[", 
   RowBox[{"NotebookDirectory", "[", "]"}], "]"}], ";", 
  RowBox[{
  "DumpGet", "[", "\"\<../data/estimator_sims/allDataMLEBC.mx\>\"", 
   "]"}]}]], "Input"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"allDataUncorrBayes", "=", 
   RowBox[{"Parallelize", "@", 
    RowBox[{"Table", "[", 
     RowBox[{
      RowBox[{"{", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"id", "\[Rule]", 
         RowBox[{"(", 
          RowBox[{"id", "/.", "setup"}], ")"}]}], ",", 
        RowBox[{"name", "\[Rule]", 
         RowBox[{"(", 
          RowBox[{"name", "/.", "setup"}], ")"}]}], ",", 
        RowBox[{"shortname", "\[Rule]", 
         RowBox[{"(", 
          RowBox[{"shortname", "/.", "setup"}], ")"}]}], ",", 
        "\[IndentingNewLine]", 
        RowBox[{"data", "\[Rule]", 
         RowBox[{"ReleaseHold", "[", 
          RowBox[{
           RowBox[{"Hold", "[", 
            RowBox[{"monteCarloRisk", "[", 
             RowBox[{
              RowBox[{"estimatorBayes", "[", 
               RowBox[{"uniformP", ",", 
                RowBox[{"uncorrRefPosterior", "[", 
                 RowBox[{
                 "\[Alpha]bar", ",", "\[Beta]bar", ",", "\[Alpha]sigma", ",", 
                  "\[Beta]sigma"}], "]"}]}], "]"}], ",", "mse", ",", 
              RowBox[{"Range", "[", 
               RowBox[{"0", ",", "1", ",", "0.05"}], "]"}], ",", 
              RowBox[{"hyperPriorNormal", "[", 
               RowBox[{
               "\[Alpha]bar", ",", "\[Beta]bar", ",", "\[Alpha]sigma", ",", 
                "\[Beta]sigma", ",", "\[Alpha]\[Beta]sigma"}], "]"}], ",", 
              "500", ",", "1000"}], "]"}], "]"}], "//.", "setup"}], "]"}]}]}],
        "\[IndentingNewLine]", "}"}], ",", "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{"setup", ",", "$setups"}], "}"}]}], "\[IndentingNewLine]", 
     "]"}]}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"SetDirectory", "[", 
   RowBox[{"NotebookDirectory", "[", "]"}], "]"}], ";", 
  RowBox[{"DumpSave", "[", 
   RowBox[{
   "\"\<../data/estimator_sims/allDataUncorrBayes.mx\>\"", ",", 
    "allDataUncorrBayes"}], "]"}], ";"}]}], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"SetDirectory", "[", 
   RowBox[{"NotebookDirectory", "[", "]"}], "]"}], ";", 
  RowBox[{
  "DumpGet", "[", "\"\<../data/estimator_sims/allDataUncorrBayes.mx\>\"", 
   "]"}]}]], "Input"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"allDataUncorr2Bayes", "=", 
   RowBox[{"Parallelize", "@", 
    RowBox[{"Table", "[", 
     RowBox[{
      RowBox[{"{", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"id", "\[Rule]", 
         RowBox[{"(", 
          RowBox[{"id", "/.", "setup"}], ")"}]}], ",", 
        RowBox[{"name", "\[Rule]", 
         RowBox[{"(", 
          RowBox[{"name", "/.", "setup"}], ")"}]}], ",", 
        RowBox[{"shortname", "\[Rule]", 
         RowBox[{"(", 
          RowBox[{"shortname", "/.", "setup"}], ")"}]}], ",", 
        "\[IndentingNewLine]", 
        RowBox[{"data", "\[Rule]", 
         RowBox[{"ReleaseHold", "[", 
          RowBox[{
           RowBox[{"Hold", "[", 
            RowBox[{"monteCarloRisk", "[", 
             RowBox[{
              RowBox[{"estimatorBayes", "[", 
               RowBox[{"uniformP", ",", 
                RowBox[{"uncorrRefPosterior", "[", 
                 RowBox[{"\[Alpha]bar", ",", "\[Beta]bar", ",", 
                  RowBox[{"10", "\[Alpha]sigma"}], ",", 
                  RowBox[{"10", "\[Beta]sigma"}]}], "]"}]}], "]"}], ",", 
              "mse", ",", 
              RowBox[{"Range", "[", 
               RowBox[{"0", ",", "1", ",", "0.05"}], "]"}], ",", 
              RowBox[{"hyperPriorNormal", "[", 
               RowBox[{
               "\[Alpha]bar", ",", "\[Beta]bar", ",", "\[Alpha]sigma", ",", 
                "\[Beta]sigma", ",", "\[Alpha]\[Beta]sigma"}], "]"}], ",", 
              "500", ",", "1000"}], "]"}], "]"}], "//.", "setup"}], "]"}]}]}],
        "\[IndentingNewLine]", "}"}], ",", "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{"setup", ",", "$setups"}], "}"}]}], "\[IndentingNewLine]", 
     "]"}]}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"SetDirectory", "[", 
   RowBox[{"NotebookDirectory", "[", "]"}], "]"}], ";", 
  RowBox[{"DumpSave", "[", 
   RowBox[{
   "\"\<../data/estimator_sims/allDataUncorr2Bayes.mx\>\"", ",", 
    "allDataUncorr2Bayes"}], "]"}], ";"}]}], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"SetDirectory", "[", 
   RowBox[{"NotebookDirectory", "[", "]"}], "]"}], ";", 
  RowBox[{
  "DumpGet", "[", "\"\<../data/estimator_sims/allDataUncorr2Bayes.mx\>\"", 
   "]"}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"allDataCorrBayes", "=", 
   RowBox[{"Parallelize", "@", 
    RowBox[{"Table", "[", 
     RowBox[{
      RowBox[{"{", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"id", "\[Rule]", 
         RowBox[{"(", 
          RowBox[{"id", "/.", "setup"}], ")"}]}], ",", 
        RowBox[{"name", "\[Rule]", 
         RowBox[{"(", 
          RowBox[{"name", "/.", "setup"}], ")"}]}], ",", 
        RowBox[{"shortname", "\[Rule]", 
         RowBox[{"(", 
          RowBox[{"shortname", "/.", "setup"}], ")"}]}], ",", 
        "\[IndentingNewLine]", 
        RowBox[{"data", "\[Rule]", 
         RowBox[{"ReleaseHold", "[", 
          RowBox[{
           RowBox[{"Hold", "[", 
            RowBox[{"monteCarloRisk", "[", 
             RowBox[{
              RowBox[{"estimatorBayes", "[", 
               RowBox[{"uniformP", ",", 
                RowBox[{"corrRefPosterior", "[", 
                 RowBox[{
                 "\[Alpha]bar", ",", "\[Beta]bar", ",", "\[Alpha]sigma", ",", 
                  "\[Beta]sigma", ",", "\[Alpha]\[Beta]sigma"}], "]"}]}], 
               "]"}], ",", "mse", ",", 
              RowBox[{"Range", "[", 
               RowBox[{"0", ",", "1", ",", "0.05"}], "]"}], ",", 
              RowBox[{"hyperPriorNormal", "[", 
               RowBox[{
               "\[Alpha]bar", ",", "\[Beta]bar", ",", "\[Alpha]sigma", ",", 
                "\[Beta]sigma", ",", "\[Alpha]\[Beta]sigma"}], "]"}], ",", 
              "500", ",", "1000"}], "]"}], "]"}], "//.", "setup"}], "]"}]}]}],
        "\[IndentingNewLine]", "}"}], ",", "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{"setup", ",", "$setups"}], "}"}]}], "\[IndentingNewLine]", 
     "]"}]}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"SetDirectory", "[", 
   RowBox[{"NotebookDirectory", "[", "]"}], "]"}], ";", 
  RowBox[{"DumpSave", "[", 
   RowBox[{
   "\"\<../data/estimator_sims/allDataCorrBayes.mx\>\"", ",", 
    "allDataCorrBayes"}], "]"}], ";"}]}], "Input"],

Cell[BoxData["$Aborted"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"SetDirectory", "[", 
   RowBox[{"NotebookDirectory", "[", "]"}], "]"}], ";", 
  RowBox[{
  "DumpGet", "[", "\"\<../data/estimator_sims/allDataCorrBayes.mx\>\"", 
   "]"}]}]], "Input"],

Cell[BoxData[
 TemplateBox[{
  "DumpGet","noopen",
   "\"Cannot open \
\\!\\(\\*RowBox[{\\\"\\\\\\\"../data/estimator_sims/allDataCorrBayes.mx\\\\\\\
\"\\\"}]\\).\"",2,23,6,20222618633676080340,"Local"},
  "MessageTemplate"]], "Message", "MSG"],

Cell[BoxData[
 RowBox[{"DumpGet", "[", "\<\"../data/estimator_sims/allDataCorrBayes.mx\"\>",
   "]"}]], "Output"]
}, Open  ]],

Cell[BoxData[{
 RowBox[{
  RowBox[{"allDataCorr2Bayes", "=", 
   RowBox[{"Parallelize", "@", 
    RowBox[{"Table", "[", 
     RowBox[{
      RowBox[{"{", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"id", "\[Rule]", 
         RowBox[{"(", 
          RowBox[{"id", "/.", "setup"}], ")"}]}], ",", 
        RowBox[{"name", "\[Rule]", 
         RowBox[{"(", 
          RowBox[{"name", "/.", "setup"}], ")"}]}], ",", 
        RowBox[{"shortname", "\[Rule]", 
         RowBox[{"(", 
          RowBox[{"shortname", "/.", "setup"}], ")"}]}], ",", 
        "\[IndentingNewLine]", 
        RowBox[{"data", "\[Rule]", 
         RowBox[{"ReleaseHold", "[", 
          RowBox[{
           RowBox[{"Hold", "[", 
            RowBox[{"monteCarloRisk", "[", 
             RowBox[{
              RowBox[{"estimatorBayes", "[", 
               RowBox[{"uniformP", ",", 
                RowBox[{"corrRefPosterior", "[", 
                 RowBox[{"\[Alpha]bar", ",", "\[Beta]bar", ",", 
                  RowBox[{"10", "\[Alpha]sigma"}], ",", 
                  RowBox[{"10", "\[Beta]sigma"}], ",", 
                  "\[Alpha]\[Beta]sigma"}], "]"}]}], "]"}], ",", "mse", ",", 
              RowBox[{"Range", "[", 
               RowBox[{"0", ",", "1", ",", "0.05"}], "]"}], ",", 
              RowBox[{"hyperPriorNormal", "[", 
               RowBox[{
               "\[Alpha]bar", ",", "\[Beta]bar", ",", "\[Alpha]sigma", ",", 
                "\[Beta]sigma", ",", "\[Alpha]\[Beta]sigma"}], "]"}], ",", 
              "500", ",", "1000"}], "]"}], "]"}], "//.", "setup"}], "]"}]}]}],
        "\[IndentingNewLine]", "}"}], ",", "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{"setup", ",", "$setups"}], "}"}]}], "\[IndentingNewLine]", 
     "]"}]}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"SetDirectory", "[", 
   RowBox[{"NotebookDirectory", "[", "]"}], "]"}], ";", 
  RowBox[{"DumpSave", "[", 
   RowBox[{
   "\"\<../data/estimator_sims/allDataCorr2Bayes.mx\>\"", ",", 
    "allDataCorr2Bayes"}], "]"}], ";"}]}], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"SetDirectory", "[", 
   RowBox[{"NotebookDirectory", "[", "]"}], "]"}], ";", 
  RowBox[{
  "DumpGet", "[", "\"\<../data/estimator_sims/allDataCorr2Bayes.mx\>\"", 
   "]"}]}]], "Input"],

Cell["NIntegrate errors are not actually a problem here.", "Text"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"CRB", "[", 
   RowBox[{
   "p_", ",", "\[Alpha]bar_", ",", "\[Beta]bar_", ",", "\[Alpha]sigma_", ",", 
    "\[Beta]sigma_", ",", "\[Alpha]\[Beta]sigma_"}], "]"}], ":=", 
  RowBox[{"NIntegrate", "[", 
   RowBox[{
    RowBox[{
     RowBox[{
      RowBox[{"(", 
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
           RowBox[{"-", "1"}], "+", "p"}], ")"}], " ", "\[Beta]"}]}], ")"}], 
      "/", 
      RowBox[{
       RowBox[{"(", 
        RowBox[{"\[Alpha]", "-", "\[Beta]"}], ")"}], "^", "2"}]}], " ", 
     RowBox[{"PDF", "[", 
      RowBox[{
       RowBox[{"hyperPriorNormal", "[", 
        RowBox[{
        "\[Alpha]bar", ",", "\[Beta]bar", ",", "\[Alpha]sigma", ",", 
         "\[Beta]sigma", ",", "\[Alpha]\[Beta]sigma"}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"\[Alpha]", ",", "\[Beta]"}], "}"}]}], "]"}]}], ",", 
    RowBox[{"{", 
     RowBox[{"\[Alpha]", ",", 
      RowBox[{"\[Alpha]bar", "-", 
       RowBox[{"10", " ", "\[Alpha]sigma"}]}], ",", 
      RowBox[{"\[Alpha]bar", "+", 
       RowBox[{"10", " ", "\[Alpha]sigma"}]}]}], "}"}], ",", 
    RowBox[{"{", 
     RowBox[{"\[Beta]", ",", 
      RowBox[{"\[Beta]bar", "-", 
       RowBox[{"10", " ", "\[Beta]sigma"}]}], ",", 
      RowBox[{"\[Beta]bar", "+", 
       RowBox[{"10", " ", "\[Beta]sigma"}]}]}], "}"}]}], 
   "]"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"allDataCRB", "=", 
   RowBox[{"Table", "[", 
    RowBox[{
     RowBox[{"{", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"id", "\[Rule]", 
        RowBox[{"(", 
         RowBox[{"id", "/.", "setup"}], ")"}]}], ",", 
       RowBox[{"name", "\[Rule]", 
        RowBox[{"(", 
         RowBox[{"name", "/.", "setup"}], ")"}]}], ",", 
       RowBox[{"shortname", "\[Rule]", 
        RowBox[{"(", 
         RowBox[{"shortname", "/.", "setup"}], ")"}]}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"data", "\[Rule]", 
        RowBox[{"ReleaseHold", "[", 
         RowBox[{
          RowBox[{"Hold", "[", 
           RowBox[{"Table", "[", 
            RowBox[{
             RowBox[{"{", 
              RowBox[{"p", ",", 
               RowBox[{"CRB", "[", 
                RowBox[{
                "p", ",", "\[Alpha]bar", ",", "\[Beta]bar", ",", 
                 "\[Alpha]sigma", ",", "\[Beta]sigma", ",", 
                 "\[Alpha]\[Beta]sigma"}], "]"}]}], "}"}], ",", 
             RowBox[{"{", 
              RowBox[{"p", ",", "0", ",", "1", ",", "0.05"}], "}"}]}], "]"}], 
           "]"}], "//.", "setup"}], "]"}]}]}], "\[IndentingNewLine]", "}"}], 
     ",", "\[IndentingNewLine]", 
     RowBox[{"{", 
      RowBox[{"setup", ",", "$setups"}], "}"}]}], "\[IndentingNewLine]", 
    "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"SetDirectory", "[", 
   RowBox[{"NotebookDirectory", "[", "]"}], "]"}], ";", 
  RowBox[{"DumpSave", "[", 
   RowBox[{
   "\"\<../data/estimator_sims/allDataCRB.mx\>\"", ",", "allDataCRB"}], "]"}],
   ";"}]}], "Input"],

Cell[BoxData[
 TemplateBox[{
  "NIntegrate","ncvb",
   "\"NIntegrate failed to converge to prescribed accuracy after \
\\!\\(\\*RowBox[{\\\"18\\\"}]\\) recursive bisections in \
\\!\\(\\*RowBox[{\\\"\[Alpha]\\\"}]\\) near \\!\\(\\*RowBox[{\\\"{\\\", \
RowBox[{\\\"\[Alpha]\\\", \\\",\\\", \\\"\[Beta]\\\"}], \\\"}\\\"}]\\) = \
\\!\\(\\*RowBox[{\\\"{\\\", RowBox[{\\\"9603.66583440553`\\\", \\\",\\\", \
\\\"9603.678974047954`\\\"}], \\\"}\\\"}]\\). NIntegrate obtained \
\\!\\(\\*RowBox[{\\\"0.025740579951046394`\\\"}]\\) and \
\\!\\(\\*RowBox[{\\\"0.003387344896027179`\\\"}]\\) for the integral and \
error estimates.\"",2,30,16,20222618633676080340,"Local"},
  "MessageTemplate"]], "Message", "MSG"],

Cell[BoxData[
 TemplateBox[{
  "NIntegrate","ncvb",
   "\"NIntegrate failed to converge to prescribed accuracy after \
\\!\\(\\*RowBox[{\\\"18\\\"}]\\) recursive bisections in \
\\!\\(\\*RowBox[{\\\"\[Alpha]\\\"}]\\) near \\!\\(\\*RowBox[{\\\"{\\\", \
RowBox[{\\\"\[Alpha]\\\", \\\",\\\", \\\"\[Beta]\\\"}], \\\"}\\\"}]\\) = \
\\!\\(\\*RowBox[{\\\"{\\\", RowBox[{\\\"9603.66583440553`\\\", \\\",\\\", \
\\\"9603.678974047954`\\\"}], \\\"}\\\"}]\\). NIntegrate obtained \
\\!\\(\\*RowBox[{\\\"0.02457406882802237`\\\"}]\\) and \
\\!\\(\\*RowBox[{\\\"0.0032260203748577685`\\\"}]\\) for the integral and \
error estimates.\"",2,30,17,20222618633676080340,"Local"},
  "MessageTemplate"]], "Message", "MSG"],

Cell[BoxData[
 TemplateBox[{
  "NIntegrate","ncvb",
   "\"NIntegrate failed to converge to prescribed accuracy after \
\\!\\(\\*RowBox[{\\\"18\\\"}]\\) recursive bisections in \
\\!\\(\\*RowBox[{\\\"\[Alpha]\\\"}]\\) near \\!\\(\\*RowBox[{\\\"{\\\", \
RowBox[{\\\"\[Alpha]\\\", \\\",\\\", \\\"\[Beta]\\\"}], \\\"}\\\"}]\\) = \
\\!\\(\\*RowBox[{\\\"{\\\", RowBox[{\\\"9603.66583440553`\\\", \\\",\\\", \
\\\"9603.678974047954`\\\"}], \\\"}\\\"}]\\). NIntegrate obtained \
\\!\\(\\*RowBox[{\\\"0.02354160978805366`\\\"}]\\) and \
\\!\\(\\*RowBox[{\\\"0.003081592041158204`\\\"}]\\) for the integral and \
error estimates.\"",2,30,18,20222618633676080340,"Local"},
  "MessageTemplate"]], "Message", "MSG"],

Cell[BoxData[
 TemplateBox[{
  "General","stop",
   "\"Further output of \\!\\(\\*StyleBox[RowBox[{\\\"NIntegrate\\\", \
\\\"::\\\", \\\"ncvb\\\"}], \\\"MessageName\\\"]\\) will be suppressed during \
this calculation.\"",2,30,19,20222618633676080340,"Local"},
  "MessageTemplate"]], "Message", "MSG"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"SetDirectory", "[", 
   RowBox[{"NotebookDirectory", "[", "]"}], "]"}], ";", 
  RowBox[{
  "DumpGet", "[", "\"\<../data/estimator_sims/allDataCRB.mx\>\"", 
   "]"}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Plots", "Subsubsection"],

Cell["Gather results and plot.", "Text"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"$datasets", "=", 
   RowBox[{"{", 
    RowBox[{
    "allDataCRB", ",", "allDataMLE", ",", "allDataMLEBC", ",", 
     "allDataUncorrBayes", ",", "allDataUncorr2Bayes"}], "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"$datasetnames", "=", 
   RowBox[{"{", 
    RowBox[{
    "\"\<CRB\>\"", ",", "\"\<MLE\>\"", ",", "\"\<BCE\>\"", ",", 
     "\"\<Bayes\>\"", ",", "\"\<Bayes-10\>\""}], "}"}]}], ";"}]}], "Input"],

Cell["Fix an annoying typo:", "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{"$datasets", "=", 
   RowBox[{"$datasets", "/.", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"x___", ",", 
        RowBox[{"name", "\[Rule]", "\"\<High-Contrast Regime\>\""}], ",", 
        RowBox[{"shortname", "\[Rule]", "\"\<mc\>\""}], ",", "y___"}], "}"}], 
      "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"x", ",", 
        RowBox[{"name", "\[Rule]", "\"\<Mid-Contrast Regime\>\""}], ",", 
        RowBox[{"shortname", "\[Rule]", "\"\<mc\>\""}], ",", "y"}], "}"}]}], 
     "}"}]}]}], ";"}]], "Input"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"ClearAll", "@", "GetField"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"GetField", "[", 
   RowBox[{"$shortname_", ",", "field_"}], "]"}], ":=", 
  RowBox[{"Table", "[", 
   RowBox[{
    RowBox[{"field", "/.", 
     RowBox[{"(", 
      RowBox[{"First", "@", 
       RowBox[{"Select", "[", 
        RowBox[{"dataset", ",", 
         RowBox[{
          RowBox[{
           RowBox[{"(", 
            RowBox[{"shortname", "/.", "#"}], ")"}], "\[Equal]", 
           "$shortname"}], "&"}]}], "]"}]}], ")"}]}], ",", 
    RowBox[{"{", 
     RowBox[{"dataset", ",", "$datasets"}], "}"}]}], 
   "]"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"GetAttr", "[", 
   RowBox[{"$shortname_", ",", "attr_"}], "]"}], ":=", 
  RowBox[{"attr", "/.", 
   RowBox[{"First", "@", 
    RowBox[{"Cases", "[", 
     RowBox[{"$setups", ",", 
      RowBox[{"{", 
       RowBox[{"___", ",", 
        RowBox[{"shortname", "\[Rule]", "$shortname"}], ",", "___"}], "}"}]}],
      "]"}]}]}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"Vet", "[", "data_", "]"}], ":=", 
  RowBox[{"Map", "[", 
   RowBox[{
    RowBox[{
     RowBox[{"If", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"Max", "[", 
         RowBox[{"Flatten", "[", "#", "]"}], "]"}], "<", "1000"}], ",", "#", 
       ",", 
       RowBox[{"0", " ", "#"}]}], "]"}], "&"}], ",", "data"}], 
   "]"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"contrast", "[", "$shortname_", "]"}], ":=", 
  RowBox[{
   RowBox[{
    RowBox[{"Round", "[", 
     RowBox[{"100", "*", 
      RowBox[{"Simplify", "[", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{"\[Alpha]bar", "-", 
          RowBox[{"GetAttr", "[", 
           RowBox[{"$shortname", ",", "\[Beta]bar"}], "]"}]}], ")"}], "/", 
        RowBox[{"(", 
         RowBox[{"\[Alpha]bar", "+", 
          RowBox[{"GetAttr", "[", 
           RowBox[{"$shortname", ",", "\[Beta]bar"}], "]"}]}], ")"}]}], 
       "]"}]}], "]"}], "/", "100"}], "//", "N"}]}]}], "Input"],

Cell[BoxData[{
 RowBox[{"<<", "MaTeX`"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"texStyle", "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"FontFamily", "\[Rule]", "\"\<Latin Modern Roman\>\""}], ",", 
     RowBox[{"FontSize", "\[Rule]", "12"}]}], "}"}]}], ";"}]}], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"PlotRisk", "[", 
   RowBox[{"$shortname_", ",", "placement_", ",", 
    RowBox[{"opt", ":", 
     RowBox[{"OptionsPattern", "[", "ListPlot", "]"}]}]}], "]"}], ":=", 
  RowBox[{"ListPlot", "[", "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Apply", "[", 
     RowBox[{
      RowBox[{
       RowBox[{"{", 
        RowBox[{"#1", ",", 
         RowBox[{"Sqrt", "[", "#2", "]"}]}], "}"}], "&"}], ",", 
      RowBox[{"(", 
       RowBox[{"Vet", "@", 
        RowBox[{"GetField", "[", 
         RowBox[{"$shortname", ",", "data"}], "]"}]}], ")"}], ",", 
      RowBox[{"{", "2", "}"}]}], "]"}], ",", "\[IndentingNewLine]", "opt", 
    ",", "\[IndentingNewLine]", 
    RowBox[{"ImageSize", "\[Rule]", "350"}], ",", "\[IndentingNewLine]", 
    RowBox[{"Joined", "\[Rule]", "True"}], ",", "\[IndentingNewLine]", 
    RowBox[{"PlotLegends", "\[Rule]", 
     RowBox[{"If", "[", 
      RowBox[{
       RowBox[{"placement", "===", "None"}], ",", "None", ",", 
       RowBox[{"Placed", "[", 
        RowBox[{
         RowBox[{"LineLegend", "[", 
          RowBox[{
           RowBox[{
            RowBox[{"MaTeX", "[", 
             RowBox[{"\"\<\\\\text{\>\"", "<>", "#", "<>", "\"\<}\>\""}], 
             "]"}], "&"}], "/@", "$datasetnames"}], "]"}], ",", "placement"}],
         "]"}]}], "]"}]}], ",", "\[IndentingNewLine]", 
    RowBox[{"PlotTheme", "\[Rule]", "\"\<Detailed\>\""}], ",", 
    "\[IndentingNewLine]", 
    RowBox[{"PlotStyle", "\[Rule]", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", "Thick", "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"Thick", ",", " ", "Dashed"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"Thick", ",", "Dotted"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"Thick", ",", "DotDashed"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"Thick", ",", 
         RowBox[{"Dashing", "[", 
          RowBox[{"{", 
           RowBox[{"0.01", ",", "0.02", ",", "0.03"}], "}"}], "]"}]}], 
        "}"}]}], "}"}]}], ",", "\[IndentingNewLine]", 
    RowBox[{"PlotLabel", "\[Rule]", 
     RowBox[{"MaTeX", "[", 
      RowBox[{
      "\"\<S_\\\\text{\>\"", "<>", "$shortname", "<>", "\"\<}; \\\\text{\>\"",
        "<>", 
       RowBox[{"GetAttr", "[", 
        RowBox[{"$shortname", ",", "name"}], "]"}], "<>", 
       "\"\<; }\\\\alpha=\>\"", "<>", 
       RowBox[{"ToString", "[", 
        RowBox[{"GetAttr", "[", 
         RowBox[{"$shortname", ",", "\[Alpha]bar"}], "]"}], "]"}], "<>", 
       "\"\<\\\\text{, }C=\>\"", "<>", 
       RowBox[{"ToString", "[", 
        RowBox[{"contrast", "[", "$shortname", "]"}], "]"}]}], "]"}]}], ",", 
    "\[IndentingNewLine]", 
    RowBox[{"FrameLabel", "\[Rule]", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"MaTeX", "[", "\"\<p\>\"", "]"}], ",", 
       RowBox[{"MaTeX", "[", 
        RowBox[{"StringReplace", "[", 
         RowBox[{"\"\<\\\\sqrt{R_\\\\text{Setup}(\\\\hat{p},p)}\>\"", ",", 
          RowBox[{"\"\<Setup\>\"", "\[Rule]", "$shortname"}]}], "]"}], 
        "]"}]}], "}"}]}], ",", "\[IndentingNewLine]", 
    RowBox[{"BaseStyle", "\[Rule]", "texStyle"}]}], "\[IndentingNewLine]", 
   "]"}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Grid", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{
        RowBox[{"exportme", "[", "\"\<risk-ld\>\"", "]"}], "@", 
        RowBox[{"PlotRisk", "[", 
         RowBox[{"\"\<ld\>\"", ",", "None", ",", 
          RowBox[{"PlotRange", "\[Rule]", 
           RowBox[{"{", 
            RowBox[{"0.02", ",", "0.062"}], "}"}]}]}], "]"}]}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"exportme", "[", "\"\<risk-md\>\"", "]"}], "@", 
        RowBox[{"PlotRisk", "[", 
         RowBox[{"\"\<md\>\"", ",", "None", ",", 
          RowBox[{"PlotRange", "\[Rule]", 
           RowBox[{"{", 
            RowBox[{"0.007", ",", "0.02"}], "}"}]}]}], "]"}]}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"exportme", "[", "\"\<risk-hd\>\"", "]"}], "@", 
        RowBox[{"PlotRisk", "[", 
         RowBox[{"\"\<hd\>\"", ",", "None", ",", 
          RowBox[{"PlotRange", "\[Rule]", 
           RowBox[{"{", 
            RowBox[{"0.0025", ",", "0.006"}], "}"}]}]}], "]"}]}]}], 
      "\[IndentingNewLine]", "}"}], ",", 
     RowBox[{"{", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{
        RowBox[{"exportme", "[", "\"\<risk-lc\>\"", "]"}], "@", 
        RowBox[{"PlotRisk", "[", 
         RowBox[{"\"\<lc\>\"", ",", "None", ",", 
          RowBox[{"PlotRange", "\[Rule]", 
           RowBox[{"{", 
            RowBox[{"0.09", ",", "0.18"}], "}"}]}]}], "]"}]}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"exportme", "[", "\"\<risk-mc\>\"", "]"}], "@", 
        RowBox[{"PlotRisk", "[", 
         RowBox[{"\"\<mc\>\"", ",", "None"}], "]"}]}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"exportme", "[", "\"\<risk-hc\>\"", "]"}], "@", 
        RowBox[{"PlotRisk", "[", 
         RowBox[{"\"\<hc\>\"", ",", "None"}], "]"}]}]}], 
      "\[IndentingNewLine]", "}"}], ",", 
     RowBox[{"{", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{
        RowBox[{"exportme", "[", "\"\<risk-legend\>\"", "]"}], "@", 
        RowBox[{"(", 
         RowBox[{"First", "@", 
          RowBox[{"Last", "@", 
           RowBox[{"PlotRisk", "[", 
            RowBox[{"\"\<ld\>\"", ",", 
             RowBox[{"{", 
              RowBox[{"0.2", ",", "0.65"}], "}"}]}], "]"}]}]}], ")"}]}], ",", 
       "Null", ",", "Null"}], "\[IndentingNewLine]", "}"}]}], "}"}], 
   "\[Transpose]"}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {
     GraphicsBox[{{}, {{}, {}, 
        {RGBColor[0.368417, 0.506779, 0.709798], PointSize[
         0.009166666666666668], Thickness[Large], 
         StyleBox[LineBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQDQPVux/8UPk3z37WTBBYad9x41lIRNF8KH+nfcVH
o341rgX2JsYgcNjeds+2xesLFkDlT9rvX/Sq3f71AnuIaRfskzY5njWoWAhV
f9l+X73myauii+zT00Dgmv0q/Y/VnYcWQfXftO/z/rJzd81i+7NnQOCOfbdK
QNsPpyVQ8x7YFzT+5X0jvBSq/qH97DfOtinvlkLNf2zfcq5plf/FZVD9T+x/
bPBl3bN7OdS+Z/bru/uOXlqzAmreC3uTA3YdNxevhJr30n5xRt5CzQWroOa9
tt96WnK10cLVUPPe2F/Q8O0pXbYGat47eye2Ozea1q+FmvfBPvPXU7Mfu9fZ
AwAUvqCI
           "]],
          FontFamily->"Latin Modern Roman",
          FontSize->12]}, 
        {RGBColor[0.880722, 0.611041, 0.142051], PointSize[
         0.009166666666666668], Thickness[Large], Dashing[{Small, Small}], 
         StyleBox[LineBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQDQOr008LCdnNt581EwRW2gv/k/I4fhDG32nPGFmd
PUt0gb2JMQgctmdfsSG8t34BVP6k/e62Gftc/y6wh5h2wf7YxNR5Tm0Loeov
279lS7zaL7DIPj0NBK7Zh7q9DDK9sgiq/6b93u/HZx1qXWx/9gwI3LH/PfU1
h0T+Eqh5D+zlJykZnJJfClX/0F787bmYt9+WQs1/bP94brHEjEfLoPqf2Lc/
Zpl89vZyqH3P7I+8is/ecGkF1LwX9gEvjViyLq6EmvfSnuvYpgf3T66Cmvfa
Xm2VvEjB9dVQ897YC3w41GN0fQ3UvHf2p2YrPtx6Zi3UvA/2tz3zli29sc4e
ALr2nWI=
           "]],
          FontFamily->"Latin Modern Roman",
          FontSize->12]}, 
        {RGBColor[0.560181, 0.691569, 0.194885], PointSize[
         0.009166666666666668], Thickness[Large], Dashing[{0, Small}], 
         StyleBox[LineBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQDQMWZqZpUz7Ms581EwRW2uvYxPw4WTIfyt9pv/jN
D68miQX2JsYgcNj+rm3b5pNlC6DyJ+2DGmdq7fy5wB5i2gX7m85Fb66WL4Sq
v2w/6/GvMlmxRfbpaSBwzb7u2qVo78uLoPpv2rMnvT9g1b7Y/uwZELhjP+t1
b9mV4CVQ8x7YX+e6oZmmvxSq/qG9svMnhvinS6HmP7bneBGwY/mnZVD9T+xV
+n33dJxbDrXvmf2BUqnHSsdXQM17Yb/hgtpba6A/Iea9tH/nVhnPvWoV1LzX
9m3XjrbwLFkNNe+NvZFqpOeVeWug5r2zP3BYcNeXI2uh5n2wj5ztFrb+zjp7
ANQInQk=
           "]],
          FontFamily->"Latin Modern Roman",
          FontSize->12]}, 
        {RGBColor[0.922526, 0.385626, 0.209179], PointSize[
         0.009166666666666668], Thickness[Large], 
         Dashing[{0, Small, Small, Small}], 
         StyleBox[LineBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQDQPxZjmsDzvn2s+aCQIr7QuO118xzJoB5e+013iX
e8zw9Fx7E2MQOGx/730y45Yt86HyJ+2V6mOz7dMW2ENMu2CvKfZGeAHrQqj6
y/YbXeacWrdtoX16GghcszcW5sy8ZLcIqv+m/ZFjvq/+/Flkf/YMCNyxV5/M
ZlS1czHUvAf2G/627/MrXAJV/9D+dbn4vUORS6HmP7bPzvm4frn/Mqj+J/aa
dtPKDTiWQ+17Zi/1oV50x63lUPNe2P8+vf65z5oVUPNe2rPsZC4yZ1oJNe+1
ffOOyRUCKiug5r2xX7Btl7zWmaVQ897Z/69ufCh6fAnUvA/2K1LUfU4xrrEH
AHOol8Q=
           "]],
          FontFamily->"Latin Modern Roman",
          FontSize->12]}, 
        {RGBColor[0.528488, 0.470624, 0.701351], PointSize[
         0.009166666666666668], Thickness[Large], Dashing[{0.01, 0.02, 0.03}], 
         StyleBox[LineBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQDQMLYr8nnNk/z37WTBBYaZ/6VXC2mv9MKH+n/bXn
f3OlDsyzNzEGgcP2pkJfVY7lLIDKn7RfFcdxR1NwoT3EtAv2+eeL3u48uhCq
/rL9uuRl6Waei+zT00Dgmv3DjANJapyLofpv2hulsIddXLDY/uwZELhjL/39
0RnO+Uug5j2wP2uSURMTuBSq/qG9eT3XcWuXZVDzH9sn+B6eEyWyHKr/iX2l
/6XwbJ0VUPue2e9jfXTVVWgl1LwX9pmfik8oPVgJNe+l/fcgJx7l5yuh5r22
D87ckHF33wqoeW/sp7trtrM8XAo17539zV9WK5+8hbnvg33Pko0/dkxaYw8A
uzaZoA==
           "]],
          FontFamily->"Latin Modern Roman",
          FontSize->12]}}, {}, {}, {{}, {}}},
      AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
      Axes->{False, False},
      AxesLabel->{None, None},
      AxesOrigin->{0, 0.02021},
      BaseStyle->{FontFamily -> "Latin Modern Roman", FontSize -> 12},
      DisplayFunction->Identity,
      Frame->{{True, True}, {True, True}},
      FrameLabel->{{
         FormBox[
          GraphicsBox[{
            Thickness[0.01769598301185631], 
            StyleBox[{
              
              FilledCurveBox[{{{1, 4, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1,
                3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 
               0}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJhIGYC4t2JtxedcZNwmAkGjA7LX3jo/T8oCefL71qw
L/WcpIP273Uc/7YzOqR4qVw87SHlEM4p1m78n9mhPmtPyWQLLYfbGQz5jSoG
Dkv8HIQTk7Uc7E3jdnn6IPjiU69wZgQh+A5Nj47PiEZSXxmxwrTWwKFnw8OX
U420oPYbOGy/yHCP6aUmnJ94+LJ26kwEX0r/rgpbo6bD8yztb9OB+sH2JGk6
gIw7CzTffc3R5QwSUg4LLsoeOTeF20FmXpzm6Qv8DhUXwyeknVFyAPrOb3or
k4MDp3HufysFhxYFdtUzX5gdHrjGO87aKA/x534uB0PVSS9SVRQdAIbUfRk=

               "]]}, 
             Thickness[0.008458679879667317], StripOnInput -> False], 
            StyleBox[{
              
              JoinedCurveBox[{{{0, 2, 0}}}, {{{12.951199999999998`, 
               16.344899999999996`}, {55.51480000000001, 
               16.344899999999996`}}}, CurveClosed -> {0}], 
              
              FilledCurveBox[{{{1, 4, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0,
                 1, 0}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0,
                 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 
                0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1,
                 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 
                0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                 3, 3}}}, {{{20.699600000000004`, 11.9254}, {
                20.699600000000004`, 11.300799999999999`}, {20.3863, 
                9.499999999999998}, {17.969099999999997`, 
                9.499999999999998}, {16.6105, 9.499999999999998}, {
                17.404299999999996`, 12.7219}, {17.5125, 
                13.174999999999997`}, {17.5605, 13.200000000000001`}, {
                18.029299999999996`, 13.200000000000001`}, {
                18.895300000000002`, 13.200000000000001`}, {
                19.929299999999998`, 13.200000000000001`}, {
                20.699600000000004`, 12.880899999999997`}, {
                20.699600000000004`, 11.9254}}, CompressedData["
1:eJxl1HlIk2EcB/DXWFlEKtTcu2psmiazdMf7DjqsfqMEXdLsoAYdntOR1jo0
JabSKtJMPNJMy+h2ZaVddkAju1asdWqH/bGyCC3DIysh7W3Pas8D7oGXlw/v
8bzv7/n+nqBk4zL9KIqiVrkOdM7/PWfTkzcqUIRWdOqzhOCxyTnYztiFkHeh
ObngkQpKdcVan14h6IUdOsE14iintqT6CHH4nAp7wUEVBGT0SanTQqCrWscZ
KlTQUmw1swuFcPizqL4zRgXtU0xJyjY+hFRzZfl2FmJupvU7fk6Cc8XvDFQB
sft5JfH78fvPmH1Y4Pkd0zjy+djb0fc2CLD3RFqMNS9piCw7OqiYzkLP8UaJ
Y5YIFr3pHdBIWRiw9l1N3yaC6NDsUbWzWBjmXGOBGHuf5guP3UwsR/VpJbZH
m8LSzgeB9nn5mj87GcjR+H7lMoOhYf6q1Rf9GdA7+S1cczB0T7DKa/a67rfO
MHNrpwEdEz9EX1bBGom6LyUuFJtCIzEM21WkSE4thXuSpi2GFhZsUldhuXBo
ze2arqAZ7JlB4oHMZhl2U+TGEz5RxAbKuIM32ttP21Z2yw4Rp6ehEQ4ln/rF
L2TEcej/ThC781Ak9/KvO6lnE1li283rJWN6pWAaYc/10m+mBSqrFFanznVq
8+SAUvU8UQoW89LYutsREIvW+wANiSuWhR0tioB4p7Le3hEI5yv1hSl5EeCe
Pi0QCnj3SxWvZ2D3oHpriEuXZ4VUi73dJHHo2Do+NsugwYf4jNqcw8nEBmPv
7kdZxO48dhCfQuuUNBOetW8Q1C7mQ9xD33mH2ohPLoGJSa76eeyvbazUj5Vj
t6H1jJHj9/3LP3FdT/2DxdXEeag/r3u7K/cx6IeIPf/biOpVR+zOgZG48ueY
hIOZMi+n6u5PqbER/+lbd1WpFmAPj/DQx1vr9ccFcA3MHbZcGWSYLb8pHg1o
1QMLPXkJhmPRzd+HBxTYP2607x3mM9hNH7qqLsUx//psUILdwCu+WyMjnoDq
aBGDMcH3iVDBgOShehzjEIHY1VaPRQx8Wk7tSy+bClsN5d9MnPJ/f02GHSgv
v5TQXen3insrxC6KQomjsd9HJ6hry/mQEqCbfcXCwDk0PzcRdh1xnH2azWLz
VvpFXNqgwvbsn/5rXYm10TByf/0LAkQ/Lg==
                "]}], 
              
              FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0,
                1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 
               3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGIxIGYC4kaWo/2G7BYO/8GA2wHGT00DAT6HE5pWk07X
m8P5YCoNk88i4zR11lwBOB9inqLDOcnAW9I2Zg7K/pPWzTyD4Hdu/SHCYKzo
cKbeY3/tXiQ+GJg5CD5Z0DJTDMFv11uRPzNYAc6fCQYCcD7MPTfOfQ9+vBXB
h9mHzof5Nzb36L9N3WYOFv6lJ84a8DjY6FyZ9ewvgv/w+Izd0xTM4fzEw5e1
Uz0R/E8bArJnbUfw0cMTAP+hoVE=
               "]], 
              
              FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0,
                 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {1, 3, 3}, {0, 1, 0}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {
                1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["

1:eJxTTMoPSmViYGCQBGIQ/TxL+9v0uTYO/8GA2wHGT00DAT6H3ul5Qs0CCP4D
EdmTT/9bO8zZelvP5DqC/2Xfx63p3wTgfIh5ig5nwMDKQdl/0rqZZxD8zq0/
RBiMFR0Elu49KB5mDee7Vzfr+6RZO+y+1fU3VRzB548NuG8UrgDntwil3fpn
KuUg8/qRmZSCtcPyFx56/xOlHfKFmg+cOmgFtV/aoWbdtqT6SAQ//JTRkY1x
lnD+Y5B76y0cdifeXnTmmQScz+O/fkrqCRE4/3VbbrfRbQGHmkSjUAMvSwcT
YxDgduBh0m4X87SC83tA4XUAwV9yfx/fHGVrB/ldC/al8vE6pIPD0drh+HIG
ifMJ/HA+TD0ANJS0hw==
                "], CompressedData["
1:eJxTTMoPSmViYGAQA2IQnZ4GAtYO6SXsG41ZhRxgfJd5KrHGlYJw/vspfNf+
Rwo6uBf95H/pbu2wRkiHL32fgMOTxIXXTPitHeR3LdiXysfvsPyFh97/jVYO
M2aCAK/Dgbbl4aeCEHyfE+y2s79awvnfgx8vnb3EEq7f7+LEmH/Flg78sQH3
jZYLOESlWN/3t7V0+LLv49b0a4IO4h4BfySMLR1MjIEgWBjOX/HtZcWZAyJw
fk7Tit8MLWIOQp8cz6e5WjqATDt9SBxuPki78WUJuP33zfd9O/NJ0mGFXXj0
xv+WDmfAQMohRfJRhHi6FZz/IflMrPcJBB/sD01rBxPHK7UMQlLw8GKRcZo6
q1bCAQDpi5kw
                "]}], 
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
               3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJ5IGYCYvbGqc7dSxwctpj/OJSixewA49/RlF3zvxjB
35Nf83bmUmaH3ys/XvLtcnDQ4UuvM3VndfgPAvftHW7w3hZL/cbnYGIMAvYO
B2plLdJTxOH89DQgmKYA59u9uLnml42qQ/vy8FNGR+wdIsW3X2Sw03TYbzBT
S2Kqg4MESxifrpAO3H71up6d2Z4Ifsu8s6vOhyL4VypeqhlmIPgsiydZMfbq
OJTrKsp/mePgMGMmCOg49C/4YfhsGoIPdk4zgm/N6NvCy+7gEF67blvSfS2H
rS01FzZX2jvseSwie7JVw+G/Twuv/307By431VImKTWoPjsHl3kqscadynA+
zL8w/o5gq4j/z2UcfC9OjPl32M6hQ29F/kxjcYcH3JNXNiXaO5g6XqllEBJy
OHxZO1WSy8FBfOoVzoxFHA67WYVE7NscIOalMcHdD+PD/Afjw/w/d+ttPZPp
CD4sfgGcvscu
               "]], 
              
              FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0,
                1, 0}}}, {{{39.64609999999999, 11.662099999999999`}, {37.8289,
                13.533999999999999`}, {36.0117, 11.662099999999999`}, {
               36.1672, 11.500399999999999`}, {37.8289, 
               12.760199999999998`}, {39.4906, 11.500399999999999`}}}], 
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0,
                 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {
                0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}}}, {CompressedData["
1:eJxl03lI02EYB/A1JadT0zK1lq2fvylWdswtRwf0vBNNXVrqHx4Q5rEtNLGy
ULCpFBFeCEnRVpaKpZElqRlGEqXrch6kLjzC2jwz88zN1MxN/b2QX3h5+fDy
wvu87/MS0YnBYjqNRoOlYZiZHLe0nE4vWEypiJCfI2DVPcWq9fISEhradou3
ZHkBn2eIC2y4yyuudsAezHEbtaoRUm7RhWgfxAiBo9aE0MpJqAr/XdsVLARu
uSZXFUKCe2XBWKmPEMqzu8/Q8jhQUvfGwZWJ91+iKxisZkT5dH+rc3cRdtLz
zXONaQh+mPJtPXs40JYYadYcheCx7NB23jgJX8an/cN9EJTNDKeobEhQ/q1M
ndyPwDZ+YiftFkGZ+IDMeTJsrsuNIXEsAXmFeu6AJ4JNk6hF4k1A2YGmw4EI
W/TQwsclAPv+Efd2RSAC8hRvViIioEOZwM8IXVnvICC/Md33dQKC2q6sBbGA
hOwFsa4vE4HcGA50si5HeSixl27nnWgQ21j2FIIMU2UeV4AdekX5XZVOUk72
NxtZ/OkMoZ88Gp79WlmvcIYYm7CD1UMIsuvlkU3IefkcRxF0mAbp1jGsIXkP
wZ7mI6gW6N/G7mIC2z4uYGovAqnEEAuQPa2JTp8AyjGHe0/k9mK/qDAZzGld
a30XT0RvZ1DWrbje0E+fARaNMVvuDw228fwz2PGvLuY7WiLo9Y5ECi4DtHZO
H/vZ2MZ+jcI+dnLeMWkMUfvbFANOpXrss4NzjyYshGtssk14UyEzp7xaz3uR
IBPRsP1Sr+47PoDvhzWi8dxaiF1leb48+w5arteOSfm24Tk7see1dXFiuhUI
1EsN8w1BXwgtR9pqD20B0TZhwwh2GPpz1AGC/AoyXP8geLLR3Vp6zx6+5l+/
FkEKQWWMHTBmC6VVF7C1UUVqPtuL8up/9n0pmWxSs+D///4PKVPEgw==
                
                "], CompressedData["
1:eJxTTMoPSmViYGAQB2Iw7RHwR0LZ2UG83Xj/rMNSDt/Z4mf4/HVyiBTffpHB
TsLhuKbVpNPbnRwYwEDM4ffKj5d8ixB8+6ZHx2dwI/g5z4Eqfjk67K+VtUhn
kYLz72jKrvlvjOC7rzm6nCFCCmLPP0eHLxsCsmdtl3K4ejTXpOG/o4OBMRB8
lnLgVtGo6/F0cig/vM11Jq+SQ/aekskSIU4O+7+dmcSwVckhPQ0I6pwcum08
d6UlKTvMt9G5Mmuak8OeF9oextuUHZ4kLrxmshwof3hm/NmPyg4PX07dxHPT
yWEmGKg4OK/NvFco5AznV+gqyn8JQfCX7D0orlbs7PBgH98c40nKcL5KrPHP
tGglOL/8YviENBtFhxXCF1xueDg79Hi9YjExlHVAD18A7pqZKQ==
                "]}], 
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
               3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJ5IGYC4hgnuxc3eVwdwjjF2o3lRR1gfJVrj4IZ3og7
zDmisKHog4vDfzCQdDAxBoLNCP7Puqw9Jc0I/iaewjXd2S4OX/Z93Jq+TQLO
X8PSfXjmfHE4f5vrTF6jTjGHmmZ9n2VNLhBzjUUdTpTtmy+1HcFfsveguNpp
BB9o22SJOy4OWU0rfjOkiDose+Gh9/+li0OnjeeutEuiDnsNZmpJvHVxUHvS
PO/sK1GHVQkhQeofcPNXQvmqUP7BFUv8HD5D3WuP4P95vDcrlQnB74/o9mcs
EHaQKL4u9Alov8eutE9nwwQcePzXT0md4OIQ7zhrY0YVl4NHwB+J4noXB+8T
7LazQznh/Duasmv+f+bAyYfo53Bg1G4Xu9kGC192B69qYID1IfgP9vHNMZ6F
4MPiT6RyUslZFX4H9PgFAFm34A0=
               "]], 
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0,
                 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {
                0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}}}, {CompressedData["
1:eJxTTMoPSmViYGBwAGIQff3DF6/INE+H/xXro2YWKDrA+HcWnWGbuUTZoX/B
D8NnYp4OJsYgoOpwO4Mhv3GJB5y/OfLrzltOCP6cIwobij64O6hcexTMsEbZ
oUHtUNvy++4Ohmse9Z4JVnb4WZe1p+Syu8OabqBJ/SoOhV19Tz5Nd4frdzqf
dvV5FIKvu2nu++V6CL5D06PjM7jdHV6xmAia3VFxWGCjc2XWOzeH1bVWcsYf
lB2W7D0ornbZzWHFt5cVZwSUHSadrvfYv9fNQTD7oybDNEU4X/GEI6dxLYJv
qDrpRWqKokNM7tF/mw67OQh/cjyf5qroUMo0i0P6HIIvUXxd6NNNBD+H8+eC
9NtuDsqxxj/TvBUdFk2yYvR9ApW/quiQMMNHtOeXm8POW11/U82VHSJOGR3Z
KObuMBMMVByWvfDQ+x+I4ANDZ7JECYLPAAIN7g4NLEf7Dc0R/PCmow/P1CvD
+eVe7K//v1FyUJn+f0JdNVR+vZKDwV0VtsZSd4fuwzPjzzoqObQtDz9ldMbN
4SpL4HdGDj4Hl19vXx846OawxfzHoRQtboc3j8ykDux2c0hPAwEuB6/qZn2f
OgTfgGONTFQOgt9Sc2FzZCwm/8ctY2+mKxxw/ncofwIoPcW5OfwHA3ZI+shH
8MHub0bwLTodE57OcHO47xrvOMuQw2HDw5dTN61B8G+A0us7BF9E9uRT+xp3
uP4F6ZtfFbci+JZbTpTtm47JZ5ZxmjqrlhPOh/lnigRLGF8vgi/mEfBHohjB
f7F9PfNzHQS/4aZtZYSGO8S/Itxw/gxQdN5E8P883puVysTrwLIYmGBy3R2e
BDP0pF8Qc1ggpX9XpczdQQGUPt+KO8iJZfl+bnN3WCukw5c+T8xhVUJIkPoG
d4czYCDicPVorknDfwR/g17eYsY1HnA+LD977Er7dPaatAN6fgcANk7EIA==

                "], CompressedData["
1:eJxTTMoPSmViYGAQB2IQ/VhE9uTT9R4O4u3G+2cdlnI4fFk7VbLLwyFSfPtF
BjsJhynf2OJnuHg4MICBmMOJsn3zpf67w/k8/uunpM5A8C23AFW0uzvsr5W1
SGeRgvPvaMqu+W+M4LuvObqcIULKQe1J87yzXe4OXzYEZM/aLuWwaJIVo2+P
u4OBMRB8lnK48eGLV+Q1d4fyw9tcZ/IqOVh0OiY8fQA0/9uZSQxblRxAyoy5
PRy6bTx3pSUpO2Rz/lyQruzhsOeFtofxNmWHjXp5ixlNgPKHZ8af/ajssG5b
Uv3NVA+HmWCg4sBfZbbabj6C7/zr7esDDxH8gq6+J5/+ezg82Mc3x3iSMpyv
Emv8My1aCc4vvxg+Ic1G0aH0wRzBpVc9HHq8XrGYGMo6oIcvAAZjnEY=
                "]}], 
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
               3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJ5IGYC4usfvnhFqnk7pKcBwTQFBxj/w6L1CmczlBx2
3Or6myru7VAg1HzgVKKqwwa9vMWMR7wcuLcuqzyuqeGQsadkskSOl0NNolGo
AZe2g3jxdaFPHz0dZswEAR0HHhWNup6HCL5906PjM24j+D8Mn61TveLpwLJ4
khVjL4J/peKlmmEGgt8y7+yq86EIvnpdz85sTx2H9duS6m++9XSQ0b+rwvZQ
26FcV1H+S4uXwy1poItKNSH23/RyWNkU6Dm3QRXOL78YPiFtjgKcf+5Wrvis
1+IO8TN8RHsmeTn4P/G8ZHqZ3+HAiiV+Do89Hf483puV2sQCt39Pfs3bmUuZ
4fw7mrJr/hcj+FvMfxxK0ULw5269rWcynQnuf3B4pzHBwwfGB7v/C4Jvw+jb
wpvv5VB2eJvrTF9Oh/7SQmneHV4O76fwXfsfKehwx425gpvF2yFSfPtFBjsx
ePydB/knW9oBPX4BvRnZ0w==
               "]]}, 
             JoinForm[{"Miter", 10.}], 
             Thickness[0.008458679879667317], StripOnInput -> False]}, {
           ImageSize -> {56.5119601494396, 18.058181818181815`}, 
            BaselinePosition -> Scaled[0.29350487424072735`], 
            ImageSize -> {57., 19.}, PlotRange -> {{0., 56.51}, {0., 18.06}}, 
            AspectRatio -> Automatic}], TraditionalForm], None}, {
         FormBox[
          GraphicsBox[{
            Thickness[0.12706480304955528`], 
            StyleBox[{
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0,
                 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {
                0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}}}, {CompressedData["
1:eJxTTMoPSmViYGBwAGIQXXExfELaGSmH/xXro2YWKDrA+HcWnWGbuUTZwdy/
9MTZAAkHE2MQUHVgkXGaOmuvCJz/OJihJ32DIJwf7zhrY4YVn4PKtUfBDGuU
HaaUnH0yW5fXwXDNo94zwcoOW8x/HErJ4nFY0307g6FfxaHLxnNX2iYOuP6C
ea8mzH7IAuc/z9L+Nl2WCc6/8PvY9Xk3/9u/YjERNLuj4lDzounXNMs/9qtr
reSMPyg7VN3/ccv49A/7Fd9eVpwRUHaYkCianyL3zV4w+6MmwzRFOF/xhCOn
cS2Cb6g66UVqCtD/1/J2X7jzzV74k+P5NFdFB+fF1h1zNX/A+XfEUs1OLPkJ
54s3yUwxuPzTXjnW+Geat6JD+LdYwT/vf0Hkryo66Pxex/Fv+1/7nbe6/qaa
Q90zj8FhJhioOAQ88bxkGswC57cqsKueKWGD8yH+ZndoYDnab2iO4Ic3HX14
pl4Zzi/3Yn/9/42SQ6zeI2vD12wQ+fVKkPDoZnPoPjwz/qyjksMG6W26p958
t7/KEvidkYMP6p5v9uB40eJ2OHnYaW3mva/26WkgwOXAute8jSHhDZy/avr9
TKPHz+H8rYL+ZcbKTzD4QFu9ma5wOGyB8r9D+Qkr9R6ktj2x/w8G7A7vGXfp
p297Aedf6WQJPrvmLZy/5Nbyx4bNH+3vuwJTliGHQ4xqhMy5P5/h/Adg+g+c
3wgKp+9sDjD9F17wJaV3scP5TxIXXjNZz4HBZwal61pOOB/mH7+LE2P+MSP4
IpWTSs6msMH5wW8vf5zByATnA3mNp3YwOoD9K8IN588ARedNBP/P471ZqUy8
EP8xszk8AeWjC2IOPifYbWdPZXNQAKXPt+IOElOvcGYsYndYK6TDlz5PzEFf
/OPcGaZcDmfAQAQS39r8cD442fwUgfNh+dljV9qns9ekHdDzOwDHSclA
                
                "], CompressedData["
1:eJxTTMoPSmViYGAQB2IQ/WHReoWzEqIO4u3G+2cdlnK4+IIvKf2VsEOk+PaL
DHYSDmuEdPjS9wk6MICBmINI5aSSsyr8cP5Wrw0Wc3ZywPlPEhdeM1nP7rC/
VtYinUUKzr+jKbvmvzGC777m6HKGCCkHmY1i85kesDt82RCQPWu7lIPW73Uc
/76zOxgYA8FnKQew+2bwOJQf3uY6k1fJIeTt5Y8zHHkd9n87M4lhq5JDahoQ
PON36Lbx3JWWpOzQrsCuemaLgMOeF9oextuUHWbPBAJLQYfuwzPjz35UduDx
Xz8l9YSQw0wwUHHo0FuRP3OyCJyfEnFUeuZyMTjfdZ5KrPFMcYcH+/jmGE9S
hvOB5M+0aCU4v/xi+IQ0G0WHPYm3F51xE3Po8XrFYmIo64AevgDTN5IN
                
                "]}]}, 
             Thickness[0.12706480304955528`], StripOnInput -> False]}, {
           ImageSize -> {7.867666251556662, 16.338709838107096`}, 
            BaselinePosition -> Scaled[0.32439307852814453`], 
            ImageSize -> {8., 17.}, PlotRange -> {{0., 7.87}, {0., 16.34}}, 
            AspectRatio -> Automatic}], TraditionalForm], None}},
      FrameStyle->Automatic,
      FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
      GridLines->{Automatic, Automatic},
      GridLinesStyle->Directive[
        GrayLevel[0.4, 0.5], 
        AbsoluteThickness[1], 
        AbsoluteDashing[{1, 2}]],
      ImagePadding->All,
      ImageSize->350,
      Method->{"CoordinatesToolOptions" -> {"DisplayFunction" -> ({
            (Part[{{Identity, Identity}, {Identity, Identity}}, 1, 2][#]& )[
             Part[#, 1]], 
            (Part[{{Identity, Identity}, {Identity, Identity}}, 2, 2][#]& )[
             Part[#, 2]]}& ), "CopiedValueFunction" -> ({
            (Part[{{Identity, Identity}, {Identity, Identity}}, 1, 2][#]& )[
             Part[#, 1]], 
            (Part[{{Identity, Identity}, {Identity, Identity}}, 2, 2][#]& )[
             Part[#, 2]]}& )}},
      PlotLabel->FormBox[
        GraphicsBox[{
          Thickness[0.004649000464900047], 
          StyleBox[{
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1,
              3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3,
              3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJx11A1MU1cUB/AHreCilg8phZZ+2jKhG7oWRoMs/NnCVNxWgi6tC2wU+sFQ
RogEWZBFGwKLmElYcFSnQ7ekRtlwm4pDxTHCINAyOnFh4KxTE3GZQx1jaLFv
fS3cJks4yc3LLy/3vHfvOfdKiyvyTSyKokJ8Q+cbob5B+0OIRrtuSMWWYNFG
N7eXDpNi/vblMpNViOxn1OX0H1IY9f0Cm10AFud4rnNEBvvsvRpHOx+n6zJE
6rw1gflX4tHRNFlKVaxB/v2rD9uyuejlJW5dxpKjtU7Hpj1RSHNueMNVKcdP
E+W8w01R+L5OqLHUy+Ga4hRbTkUi8l5XJ+uuHMsUjrNPT0fgTc7z3xzVKhBR
mOdWWTj4TR62r/V20Mdzzv/99Gwi8beD1T2fda9FrXtuQr1lNRz+SMZ2XpeL
usEjro82T3hbE4glg76VOkWQTT7+oKwgifi1wfCXjnCfJZ7J3d6gqU7EwJn9
6aqDItwaaLt4aFRBbCy8/irrQtC39L4P71UgNXusjnoU9MZu8yNnrJg4csfD
JKoh6A8zN3ebW8R4UlDe721RgNeovnK4T4y5H4ynimYUgTqkSKFj9medkthi
ZkIJE1PHWcmS/jL6OY7lRtAPkqgf1eMSpP/SX55atPD+IwnWNbfPvRCmhLi7
vcc0IsLdMuXsJ0eT8Kk9445Zs9A/ciV2u3TN5pV8ku+7rRl6OjyOeHff+Rzb
/SjiasbO5TD0XVWabGuJhfapTSluBbG//hFyHGD2Q7UKOmv/7w5aBmabKG8k
LhomTzgOyVDC9GdjFIZ7lFa6ToYLObZVqndjAn0gkIFi4iY30KfT0sD8t+Mw
LXin1myTYpunKtNMxYOu6XzLtleKS0zeMD6mT3RKnHOSwFPDxyu8sS7HrxKk
qpkQ4H39yTTnlqD9dcsXEY8L9hhU1+IxyvT7Ch5upvfMOlRcbOzot1OaaOJ/
B2qvDdWvJP465b3PQy6xUHWO6xn+K5b4zxoHTHsSiP19WS5Es4FbYRSxA+s6
JkJxrtw1XMpGgUKfMJIgJn7drbIPvyzGNuZ87mMDVl8HH1nagbqLUWmvOuPV
shfuBwlGmfO6n0Uc7j+vocTaO5t/Tvs4FNeZ9f8jxkF9kzZkfSjymLxSMTad
0w6UNDzJ8udJ5uKA7+2x3sdZCR30rraKGOIOdlOfjV6NzB1dhaVfeZb0ztai
Ss2ueeLxWNOLg1/MZ9X4+zIGl62pJa4Zb9YQ0x/OGBiY/ZhiYb2iZco0xsOY
b7VDmjDstJ70UOxYLNfUJ6dtWIHFfA+Y+sdFEwuZ/9TGES/en4H5fPz/fv0P
ELNj9w==
             "]], 
            
            FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 
             1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1,
              3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGIxIGYC4jmLlHf+Wa7i8B8MuB1g/NQ0EOBzcJ2nEms8
UxnOTwfTmHwWGaeps+YKwPkQ8xQdug/PjD8rqOig7D9p3cwzCH7n1h8iDMaK
DrcXnWGbKaIE5xuDgZKD4JMFLTPFEPx2vRX5M4MV4PyZYCAA58PcI/zJ8Xwa
K4IPsw+dD/NvcInK9P8bFB0s/EtPnDXggeifqgTnT+/+4XfmFoJfcTF8QpqO
Mpxf+9uq4ByHCpyPHp4AKlGUFw==
             "]], 
            
            FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 
              1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {0, 1, 0}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGCQBGIQnZH/ofXkFV2H/2DA7QDjp6aBAJ/DlhNl++bv0oHz
Ew5f1k6dqeMwZ+ttPZPrCP6XfR+3pn8TgPMh5ik6mBiDgJaDsv+kdTPPIPid
W3+IMBgrOux5LCJ70lUbztefsOCHYZq2w+5bXX9TxRF8/tiA+0bhCnB+i1Da
rX+mUg4X8uPZz93Uclj+wkPvf6K0Q/m++VL6slpQ+6Udpnxji5/hownnA1Up
/g1Th/MTwe5VddideHvRmWcScD6P//opqSdE4PzXbbndRrcFHCbG/HP+pasO
9Qe3w8a575cf09aE88HhJaUF5z+JEN9+8YGWg/yuBftS+Xgd0sHhqO1wfDmD
xPkEfjgfph4ANxmzJg==
              "], CompressedData["
1:eJxTTMoPSmViYGAQA2IQnZ4GAtoO6SXsG41ZhRxgfJd5KrHGlYJw/vspfNf+
Rwo6qNf17MzW1HZYI6TDl75PwCEl9o4b8w4tB/ldC/al8vE7PM/S/jb9r6bD
jJkgwOsgt/yFh549gm+gtVL4QosGnN/pmPD0wiN1uH4zm71B0xrVHfhjA+4b
LRdw8E0SiLAUUXf4su/j1vRrgg4nNK0mnf6v5mBiDATBwnD+im8vK84cEIHz
c5pW/GZoEXM4UCtrka6i7gAy7fQhcbj5IO3GlyXg9t833/ftzCdJh/diHgF/
Zmg4nAEDKYfkM7HeJ9I14fyaRKNQAy0tOB9MvdFyMHG8UssgJAUPLxYZp6mz
aiUcADEnlwg=
              "]}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1,
               4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}}}, {{{17.999599999999997`, 
              9.905859999999999}, {17.999599999999997`, 
              10.239799999999999`}, {17.7152, 10.499600000000001`}, {17.4059, 
              10.499600000000001`}, {17.047299999999996`, 
              10.499600000000001`}, {16.799999999999997`, 
              10.215199999999998`}, {16.799999999999997`, 
              9.905859999999999}, {16.799999999999997`, 9.53477}, {
              17.108999999999998`, 9.299999999999999}, {17.393399999999996`, 
              9.299999999999999}, {17.727299999999996`, 9.299999999999999}, {
              17.999599999999997`, 9.559769999999999}, {17.999599999999997`, 
              9.905859999999999}}, CompressedData["
1:eJxTTMoPSmViYGCQBGIQ/VhE9uTT/4YOHmuOLmewEHWA8f9+jNtqxCjusFud
n3vrN0OH/2Ag6WBx7WiuSQKCnyL5KEKcHcE/AwYGDkleKhdPv5CA89ewdB+e
OV8cztf4pPJylqcYXL+JMQiIOvjLiWX5JiP4z7O0v02fi+CLewT8kdhs6BCj
GiFzrkbUwaRhu0PTIUOHisPbXGeuRfD/PN6blcokAuczgMACAbh9HxatVzgr
weUgbH/sztYvBg7eJ9htZ4dywvl3NGXX/P/MgZMf7zhrY0YVh0P2npLJEiww
/7M7ZHP+XJAujODPfia7/IUGgg8LX5HKSSVnVfgd0MMfAIo4ub8=
              "]}], 
            
            FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 
             1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0,
              1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {
             0, 1, 0}, {0, 1, 0}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJFIGYC4v7peULNF6wdXFVLmWbtUHCwqYxYYdqLxL/v
3zs9z9qhQ29F/szJMg5f/l6peOlm7ZAGBmIO0q8fmUkZWML5ehMW/DBUs4Dz
T2haTTo93xzO39pSc2HzTHMHFhmnqbP2Ivizl1s9SYuQgPPZ18hEpVhrovKl
teDmpYPN03Ko+21VcG6FBZy/eJIVoy+LJQb/OEjffy0H+6ZHx2estnBYcn8f
35zPWg5rb8SX+c8zh/MlPAL+SBgj+HPfLz/mfd0Mzgf7/5gpnH+m3mN/ba0p
3HwYH2Z/xCmjIxv3Ifi167Yl1a80g/MD5MSyfDebOcxZpLzzjzqCb2azN2ia
oyacL7Pmf/GM9RJwfsB9o+WnH4nBzYOFL8w+GB/mHnS+iTEIiDqYdzomPG2w
hvMBX0ncug==
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1,
               4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}}}, {{{33.800000000000004`, 
              7.852339999999998}, {33.800000000000004`, 9.379690000000002}, {
              32.6344, 10.600000000000001`}, {31.255499999999998`, 
              10.600000000000001`}, {29.82929999999999, 
              10.600000000000001`}, {28.7004, 9.344140000000001}, {28.7004, 
              7.852339999999998}, {28.7004, 6.336719999999999}, {
              29.888699999999996`, 5.199999999999999}, {31.24379999999999, 
              5.199999999999999}, {32.64609999999999, 5.199999999999999}, {
              33.800000000000004`, 6.36016}, {33.800000000000004`, 
              7.852339999999998}}, CompressedData["
1:eJxTTMoPSmViYGCQBGIQfXDFEj+HYgeHCy/4ktJPyTvA+DNmAoGkHJz/pi23
20ha2kF5+v8Jdd4ODs1Cabf+XZVwqP9tVXBOwcHhQK2sRXqLmIPAJ8fzaVvt
HWaCgajDA+7JK5scEfz/m6o/bbhgB+fvuNX1N9XdziGCU6zdOF7MYU337QyG
97YO6xXORpjslXBY//Dl1E1zbB3UP6m8nPVSCuKumbYOB7r3NZkcloXzYe6H
8VfXWskZX1CA813mqcQaeyo5XKl4qWb4w9aBoT1gaVq8ssOZeo/9tb52Dh+W
H/M2z1Rx2H9qoeu2y3YOZ8BAxeH4Yae1mXb2cD7MfzA+x88F6ZulHBzsXtxc
8ytGxWGqc3fOc2cHh4qIFaZns5Xh4Qe2z18Jzn8/he/a/5MKDujhDwBHOLzx

              "]}], 
            
            FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 
             3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0,
              1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {
             0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 
             3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3,
              3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 
             3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJXIGYC4oKuvief/rs4pIGBigOMf0LTatLp/yoOW1tq
Lmy+6eKw5P4+vjmfVRz0Jiz4YbgPwWfSbhe72YfgV+gqyn/hQeiH8WHmg80L
dHG4lB/Pfi5SxeGOG3MFd4qLA0Pl+qiZG5Th/A/S8dVplrj5u291/U1lV3Y4
s9B12+dYFwd31VKmWSeUHK74JglEXHR2WK9wNsJkr4TDjvXMz3ssnB3umu/7
dkZJ2cG80zHhqYGzw2yFV3YMlQg+2Lx2BL/Ci/31/zkIPsz97y1c3YsyEXwe
FY26nk5MPsz/T+2BIRPnDA8f6dePzKQUEPzKiBWmZz87wfm5Jg3bHbKc4Pph
fJj5hhxrZKKWIPjm147mmuxwctB4y7vPABiewSUq0/+fcHJo4fVfP4VVxeHy
rGeyyy84OTDzLfQ6e0/Z4XdM7tF/j5wcZgh5fjHiUnYofTBHcOlbJwfneSqx
xp1KDhUg92Q7OXzaEJA9y1zSARRNkjcdHTLebuM+66oM8f9FRweB2ID7RtMR
fOM1j3rPLEbwz4DAHgQf5t7JEixhfLwI9x++rJ0qqYXJh/l/qnN3znNmRPhc
PQoKEUc4fzerkIh9H4K/OiEkSJ3BEa4fxoeZ/7wHGFJ+CH4zMDlGxjo6sC6e
ZMXoq+IwX0r/rkqeo8OeF9oexm3KDrqb5r5frufkUHExfELaGlGIv0ycHETb
jffPUhZ1uAxKb5ZOEPEzIg4gZxh7IfiFoPwUjuAnW9/37413cujxesVi8lHE
4Uniwmsm6U4OdzRl1/zfLOrwHwycHP5+jNtqtFDRofa3VcG5Gc5w+TlHFDYU
LXCG65cBpacVznDz129Lqr+5FcHXAbn/GIJ/cMUSP4fTznD3w/ILzH8PX07d
xNPoAkmXp5UcOH4uSN+8yMXByBgIglUcToHy21MXhwmghBaPKC9g4QkAuiDk
cQ==
             "]], 
            
            FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}}}, {{{
             42.400000000000006`, 7.599999999999999}, {45.49961, 
             7.599999999999999}, {45.49961, 8.199609}, {42.400000000000006`, 
             8.199609}}}], 
            
            FilledCurveBox[{{{1, 4, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1, 
              3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {
              1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 
              0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 
              3}}}, {CompressedData["
1:eJxTTMoPSmViYGAQAWIQbWIMAt4OtxedYZu5RMkBxhd4uX09s7u6Q8lW0d+n
07wcjmtaTTr9X8vBvunR8RnZnnB+wtMLSrcj3TH46WkgoOUQ6Dm3Qa0KwQdT
7xD8gyuW+Dl8dneYs0h55x91BN/MZm/QNEdNOF9mzf/iGesl4PyA+0bLTz8S
g5sHptPE4PbB+DD3oPMh/hSF+wfG/5B8JtY7wwvOh4UHfyzQxnQZB/TwAgA2
WoHc
              "], CompressedData["
1:eJxTTMoPSmViYGAQA2IQbWIMBJu9HJwnNAulrVJygPEVHD8mn/FVdOBR0ajr
2ejlsNV1Jq8Rp5xDTbO+z7IoL4f+iG5/xgIphw/JZ2K9NbwchCsnlZxNkXA4
AwaeDmlgIOaw/uHLqZt8EPzJ39jiZ6zxgPNr121Lqs9E8L/cvt5YnObhwCLj
NHXWXgR/9nKrJ2kREnC+bWXECtNcTTh/y4myffOttODmpYPN04LbB+PD3APj
+8uJZfmeRvALuvqefNL3QjU/z8tBgiWMT/eSOjx85hgv2mIuoQbn392QG5i2
WNkBPTwBq8WPqA==
              "]}], 
            
            FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 
              3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1,
               3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGAwBmIQnZoGAn4OGSXsG41TJR1g/D+P92alKsk4/AcBe0x+
1f0ft4y9JeH8lIij0jPTxRzsmx4dnyHt58AABmIO1z988YpkQ/Btw6M37j/j
i8GXXfO/eEa/BJy/zXUmr5GnJEJ9e8DStPsKcP5p1xr1NF0lOF+4clLJWRVl
B5kD0QqOnb4OX70i2yzEVBzOfg9+vDTY1+EVi4mg2R0Vh/BTRkc28vk6mBiD
gKqDv5xYlu9pHzifJYxPd5Mvgn9DuibR6K23AzPfQq+z75Th/NnLrZ6kZSjB
+c4TmoXSdik6WDD6tvCy+zjseaHtYZymCPG/GoLPX2W22s4fwW9dDnRRjo9D
8O8Sm7QLCD5EXgmNr+zgs4zLTdUUwdeZsOCHoRyCnx/Pfk7S0cdhw5TUjmRb
FYflLzz0/nf6OMwEAxWHkq2iv08fQ/BVciqqlvL4wvlg96b5OuzNr3k7c6sy
nP+Wd5/BzFmKcH41KP5XKziwnpMMvGXs4+A6TyXWeKaCQ0FX35NP+70d9tbK
WqS7yML5QNNUGVdJwvkea44uZ/gh6qDg+DH5DDC8z4CBCMS81Qi+Oj/31mWC
vnD+mu7bGQzhvg6KJxw5jdeKOSyZZMXoW+LrcGqfdtP/txIOF5Ru/6yr8nWY
u/W2nsl0MYcck4btDqsQ+lkbpzp3v0HwS3UV5b/w+MH5sPQ/tTac5X+1qAN6
/gAACxRaqw==
              "], {{58.79959999999999, 7.002729999999999}, {
              58.79959999999999, 5.818359999999999}, {57.913699999999984`, 
              5.419530000000002}, {57.39179999999999, 5.419530000000002}, {
              56.7973, 5.419530000000002}, {56.29959999999999, 5.85469}, {
              56.29959999999999, 6.434769999999999}, {56.29959999999999, 
              8.030079999999998}, {58.362899999999996`, 8.175389999999998}, {
              58.79959999999999, 8.200000000000001}}}], 
            
            FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 
             3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0,
              1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {
             1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGIZIGYC4sv3HnBPtgxw4I8NuG+kLu0A479py+02ui3r
MH/12hvxapj8iovhE9J8pOH8Dr0V+TM/iztsX8/8vEcgwIEBDMQcUtOA4Jk/
nN9bWijN24DJB5tfLQXnnwEBoPkwfhoYqDhc5sxQytEJwOCf0LSadPq/Clw9
On++jc6VWWmaDur83FuXRSL4KxJCgtQj/B3+fit9MMdQ3YHj54L0zUr+Do+O
z9g97YOKwwaewjXds/0cTh12Wpt5D8GH2Q82T9Ifg19+eJvrTF9pOP/iC76k
9FeiDgsmWTH69kD9d0YEEj73EPz/ICAfAOfD4mODwtkIk73iDujxBQB4jrj/

             "]], 
            
            FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 
              3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1,
               3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGAwBmIQfQYMAh0yStg3GqdKOsD4fx7vzUpVknGYCQI7MflV
93/cMvaWhPNTIo5Kz0wXc9h5q+tv6vJABwYwEHNgFRKxPzYHwbdwdS/6WY/J
l13zv3hGvwScv811Jq+RpyRCfXvA0rT7CnD+adca9TRdJThfuHJSyVkVZYfl
lcc1reICHb56RbZZiKk4NEx17s5xDnR4xWIiaHZHxeHov03VnxQCHUyMQUDV
4eCKJX4O/wPg/NlHFDYUHUDw25eHnzKaEODAzLfQ6+w7ZTh/9nKrJ2kZSnC+
84RmobRdig7mUgeiFeYGOOx5oe1hnKYI8f8aBH/hNZP3FgcR/JhcoIvOBzgE
/y6xSbuA4EPkldD4yg7738yz0dmC4K9/+HLqphUIfqDn3Aa1XQEOG6akdiTb
qji85d1nMPNeACSeZqo4BJeoTP//B8Ffff5q2Bv5QDgf7F6fQIe9+TVvZ25V
hvPB5sxShPOrQfG/WsFhToPaobbNAQ6u81RijWcqOFy+94B7cmWAw95aWYt0
F1k4H2iaKuMqSTjfY83R5Qw/RB20rSadrgeGNyTdiUDMe4/g6yrKf8lRCoTz
8+PZz0m6BjoonnDkNF4r5vD6kZnUgeBAh1P7tJv+v5VwYNZuF7sZFugwd+tt
PZPpYg7nN0d+3ZmH0C8TlWJ9vx/BDzHQWim8AMGHpf+pteEs/6tF4XxY/gAA
I/BkBg==
              "], {{69.19959999999999, 7.002729999999999}, {
              69.19959999999999, 5.818359999999999}, {68.31369999999998, 
              5.419530000000002}, {67.79180000000001, 5.419530000000002}, {
              67.1973, 5.419530000000002}, {66.69959999999999, 5.85469}, {
              66.69959999999999, 6.434769999999999}, {66.69959999999999, 
              8.030079999999998}, {68.76289999999999, 8.175389999999998}, {
              69.19959999999999, 8.200000000000001}}}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 
              1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {
              0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 
              0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 
              3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGBwAmIQXRmxwvTs9xCHZqG0W/9CJR1g/OUvPPT+L0Tw72jK
rvkvLOVgYgwE7xH8nbe6/qY+x+SrP2med/aUpMOWE2X75j8LcXjoGu84K1DS
YUaeUPOBRyEO76bwXftfKebwZOnsIwpnQhwemO/7dsZIFGL+ZgRfJ1XyUUQ/
gp9ifd+/tz3EoUNvRf7MYnGHvQfF1YIbQxzWC+nwpf+TdHDJzP/QWhni4L4r
7dPZabIOIQZaK4VLQhxiVCNkzv2Rdzj6b1P1p4IQh/sg8w4pOFy694B7cmSI
Q3CJyvT/DYoOteu2JdUHhjgYqE56kXpE0UFXUf5Ljl2Iwwwhzy9GWUoOfySK
rwuJhTjsfqHtYXxMyaGvtFCaNwHo/w25gWnByg4zwSDEYU/JZAmWaypwvg3Q
2dPXqcH54PBl1HRQ0ajr2ekc4nBc02rS6f9aDgtWr70Rfy0Yzhe/ee578Ocg
DH56GghoOfBzb11WyRwM54ONt0XwT+za0cvmEOwwZ5Hyzj/qCL6Zzd6gaY6a
cL7Mmv/FM9ZLwPkB942Wn34kBjcPbFyaGNw+GB/mHnQ+OB6NRR02FGVMfMsS
7HDhVq74LG9Rh+mbeArXOCP4oOB7EIng94MEChB8cHyvR/D/X6l4qXYwGG4+
jA+z/8hl7VTJTQi+TBTQhGoEPyEkSH1BZbADAwg8QPAh6V0CzoeEn5JDrb1p
3K6LCD44Pb5H8D0CgCmCG5get/4QYVBWcrBwdS/6KR/iMHu51ZO0CkWHCPHt
FxmsoOlrggIqXwDBnw4K55sycP68rbf1TMQl4XyXCaAcKu4wFRR+0SEOCrsW
7Es9J+qwBJQB0kMcvmwIyJ4lLurQkRx7xw2YP9awdB+e+V/YobPvySf5TQi+
guPH5DNvEXxY/q64GD4hzUfCAb08AAC79MeQ
              "], {{81.33749999999999, 
              11.349600000000002`}, {81.33749999999999, 
              10.283999999999999`}, {80.7777, 9.499999999999998}, {
              79.23199999999999, 9.499999999999998}, {77.90039999999999, 
              9.499999999999998}, {77.90039999999999, 12.7094}, {
              77.90039999999999, 12.991399999999997`}, {77.90039999999999, 
              13.1383}, {78.14999999999999, 13.1871}, {78.257, 
              13.200000000000001`}, {78.6137, 13.200000000000001`}, {78.8516, 
              13.200000000000001`}, {79.81479999999999, 
              13.200000000000001`}, {81.33749999999999, 
              13.200000000000001`}, {81.33749999999999, 
              11.349600000000002`}}}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 
              1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}}, {{0, 2, 0}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["

1:eJxTTMoPSmViYGCQA2IQHVKiMv2/QZhDegn7RuOnUg4w/pl92k3/daUdjvQb
luvqhjmsF9LhS4+TduB5oDthgQaCrxrMuniSEoL/8OXUTTyKYQ7hnGLtxvLS
DinW9/175cMc/oPAfSkHB+HEw5e5wxwcmh4dn7FbDKL+ZqjDTDAQdejxesVi
shPB9zHvdEyYieCfAQGfUAeXeSqxxj/F4HyPXWmfzpbJw/mdW3+IMBgrQPgK
YXB+QkiQ+gJDBD+nomqpjjEmH2Ifgq8KtC3tt5IDy/MejbecYQ4mxiCg6lC7
bltS/dpQOF9XUf5LThiC/+vt6wOWwqEO3Taeu9IOKcH54PBeKg/nC1dOKjmb
Iunw4YtXZFtCKMTdZ0QcXqoZcqzZguCfeGq/5D5fGJwPiy/+2ID7Rs8lHdDj
EwADTs8E
              "], {{88., 8.299999999999999}, {85.17930000000001, 
              8.299999999999999}, {85.2738, 10.184}, {86.3168, 
              10.399999999999999`}, {86.6484, 10.399999999999999`}, {
              87.91640000000001, 10.399999999999999`}, {87.98750000000001, 
              8.70781}, {88., 8.299999999999999}}}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
              3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
              3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1,
               3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxF1HtIU1EcB/CLWGJpj6Eubb7aNQpX2mYvGPbrMXOiSBn3aK+V4nyUaGlv
TdJKw6WlzpxmOmVjlvluWdgc9LLEUJHITNHUMJugLSqNXLsz7/nB5fD549x7
7u/743hGJu6PtiIIIsD80OvJ8xdVvCYEY8eV7/1CSViw/3hfzWwrCXEhxtww
DQL70LrC6Fgv8A1WLwm4iZ0ksXnnHI3t5hQfYgxAcKN++Ku8kYRRVekLDyGC
FeHbm9spEl7NNV76TiIYIBdfkY+QIOT1lnyxReAnoMsLpn4ERVw3UIzHutb0
z6ixLWsyBdkbNYmKAi7jc8+1IsUzT8Zbd/amEZEekB115FNAHgUH/qQIpYQ7
hB9qaDMUmfcLxU+l+W6Q35Ee2HaTAsj4/Lq43xW2ifaenkmnoFhhrgscxtac
XfKSMhfGU4XL3pv62DA7+U2/vZSCyCCyu0PjBBUxTRPJSgrefUxgl5xwgrRa
bWR6GgWe7TttBZ2O0DM4tLQgggJf9nRZsaMD42/XE3L4pSsZr5L32sZW2oHW
+Lf3vHLh/22A9/POQIEJ22Cv81UcRIyldKkR1LB4y2L87RiPhBGymPqVjE3T
Rx/xh1ng4mNOQomAU2NKLq5zhO/uPYmSZAQtIoU9fz0bLse3phQEo/l90lUg
trPyzlqLbcl/jGK8ix4cLfbV1K6miAbsrl9hI6oqCrT0+8XOkHvm1Gr7u//z
0TuDLGjC2k9OgT5Hl+FX5cI4nP24m7i3mvExut+xHKDb26egIIueB4Er2JHr
LsvM/TLQ/TTnOf6nerrnJQXRlu9zwDKWo9gv8jad2zCJ3dx+VlfOR4wrHjz8
IJEiiEmxaRCo3BmXekz4E9WejDt03hmmkDUw6uD6ZkyCoHXcO1CwhQtvlSKt
UYTm52mGCxfCNZs7oxDcPjy3e3aSBMPnLS76LGxLvjnYqZk+wepc7NaiW8sv
5mPviUucuiZHkMTK1L8dJuFwwsu5xjwE5i48OfGGhEUshx2vZAjIoEuZPjLs
lm5i0EqMPVCfsE9q5MLvTV9qvQrN52WJf/Dvc+fnvRybjmtIhb1wX0xV1nl0
tmMv3Cf/AFpV3tg=
              "], CompressedData["
1:eJxTTMoPSmViYGAQBmIQvXHu++XH9MMddr/Q9jDepugA47frrcif6Yzgl9qk
LTCyU3DQVZT/kqMU7rC3VtYiXUXe4erRXJMG4XCH++b7vp3ZJOtQ0NX35NPv
MAcTYxCQdRDg3rqs8jWCnwYCyzD5p11r1NNkFeH88KajD8+sR/CNdzXfmKmk
BOe7rzm6nEFD2eHNIzOpA5vDHO5oyq75f1nZoaZZ32fZoTCHMyDQo+LwYB/f
HONbUP4ZFQfOnwvSN79C8GH+Q+d/WLRe4ayHkgN6+AAAQOuMPQ==
              "], {{
              94.00040000000001, 4.36328}, {94.00040000000001, 
              3.6601599999999994`}, {93.09769999999999, 
              3.0999999999999996`}, {92.0059, 3.0999999999999996`}, {
              90.86599999999999, 3.0999999999999996`}, {89.99959999999999, 
              3.68398}, {89.99959999999999, 4.36328}, {89.99959999999999, 
              4.45859}, {90.0234, 4.923439999999999}, {90.47460000000001, 
              5.2332}, {90.7355, 5.3999999999999995`}, {90.8426, 
              5.3999999999999995`}, {91.67340000000002, 
              5.3999999999999995`}, {92.65859999999999, 
              5.3999999999999995`}, {94.00040000000001, 
              5.3999999999999995`}, {94.00040000000001, 4.36328}}}], 
            
            FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 
              1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {
              1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}}}, {CompressedData["
1:eJxTTMoPSmViYGAQA2IQvb9W1iK9IsLBxBgERB1g/DQwEHP4xhY/w8cTwQdT
bhEOB0DqliD4SV4qF093SMD5EPNUHVKs7/v33g53OAMGKnA+RF7FIdP3c18w
TwScD6aEIxxe/F758RIvgl9ik7bA6J4SnN+utyJ/5mQJOB/mPuuCcx2XuBD8
jIlva+xvhmPwYf51sXtxc827cIcLt3LFZ3mLOuy81fU3FWgejD8TBDQR/Ajx
7RcZjBD8+avX3oiPQ/DRwxMAuSGFgQ==
              "], {{97.19959999999999, 
              12.493799999999998`}, {97.19959999999999, 12.8648}, {
              96.90269999999998, 13.100000000000001`}, {96.60589999999999, 
              13.100000000000001`}, {96.2598, 13.100000000000001`}, {
              95.99999999999999, 12.8277}, {95.99999999999999, 
              12.493799999999998`}, {95.99999999999999, 
              12.172299999999998`}, {96.2719, 11.9004}, {96.59339999999999, 
              11.9004}, {96.96449999999999, 11.9004}, {97.19959999999999, 
              12.1969}, {97.19959999999999, 12.493799999999998`}}}], 
            
            FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0,
              1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {
             1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 
             3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3,
              3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 
             1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxl1G1Ik1EUAOCloRFNwjY3NGRusz9ly48Y0o9OmA6ZZma4vftTiM0QdVBT
y8Rs9uEYkaUyl4Qk+VWywiKMYhSohYyKMM2JTisQcVIRqCG17vuOew+4C/fH
w+7dPfec896kEsuJM5EikWgLmUVkRpAZKBxOvLZsgox0fkiB2iyMODBkPntX
M4Zuy3JULD5FC/uIA9crHWkzMuaZbm+Uq1TBXMYv71UyN/cZxtNOqqBvTK+1
3zdBR7ClYSNeDeqoK+1ZDhPUFCTGlYuTYTh3R8TeMhpfMrTJtxbH5KPztPYj
p8Xoq8vkAiscXPSv+9JfquDo899/J+Y5KPVL3wTHlPBYt1AnmeTgJ3/wgBrW
ir71dA5ybH9+yU5jZj3aEtv0ejwVLayXcOB0rB/zxqtC+Ynh4EfCqUtmlxIi
i2NShsThpvs1eb3bc3qM4BWGmjn0uxoWNwZ+fZpGB/nhN8K+VedsazRaNzja
J/qiZL6xv9/iapUz0/pMjlZmNE6h6XmbTes/ciu1NuWFET76KmV39VKwFebe
a/yKfvThc3FgDe3m80nuT91IqlehRcum368V6Tn2/9T0/AtLe1K37UYLy3aF
e07rWfXekTOH6qlgFvHjuCq0L4eDgNhzwPVQDaqZPw3lVrS/4KazqhstlIHU
v5nP33kVs8E2uuANJjE3xZp9/9rlzDQ+wQ/Qer4fq8NN7z9fJ3Hr7Jgf0j2e
riG0UL+36JaV+sMH59Clh8gNok3M6w3lr6wJ+P1S0/Mn+IZewnhC/RFuml9q
ml9qml8jH4DUxPJXdpsEmI2u9XTFa6rRwv7LJpZfappfappfahqfcN9atGaW
vBDZ4Wb9q3hy7iyH+XFWkQ/Yhv7e0zmi6EBbW8mD4kbz7eyeQm9+H/8DhdQ4
kQ==
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 
              1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}}, {{0, 2, 0}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["

1:eJxTTMoPSmViYGCQA2IQXT/VuTvHPMYhvYR9o/FTKQcY/8w+7ab/utIOd1TY
GqcaxzisF9LhS4+Tdri6uMCWSx/B14jpP/RVA8EH61ePcQjnFGs3lpd2OLPQ
ddtn1RiH/yBwX8qB4zrQAKEYB4emR8dn7BZzaACpvx/tMBMMRB3C+XQ3zd2P
4FtsOVG2bz6Cb2IMBMHRDi7zVGKNf4rB+R670j6dLZOH8zu3/hBhMFZwWCMT
lWINdA+MD3aHOYI/A2SsJSYfYh+Crwq0Le23ksN2udbXgQIxEHuMVR2mAJ3/
fHM0nH8GBGIQfLB+yWiHbhvPXWmHlOB8cHgvlYfzhSsnlZxNkXT48vdKxcu0
aIg5Z0Qc/Hun5wntRvDTJ76tsReNgfNh8cUfG3Df6LmkA3p8AgCM+ct2
              "], {{
              112.09999999999998`, 8.299999999999999}, {109.27899999999998`, 
              8.299999999999999}, {109.37400000000001`, 10.184}, {
              110.41699999999997`, 10.399999999999999`}, {110.74799999999999`,
               10.399999999999999`}, {112.01599999999996`, 
              10.399999999999999`}, {112.08799999999997`, 8.70781}, {
              112.09999999999998`, 8.299999999999999}}}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1,
               4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}}}, {{{115.39999999999998`, 
              9.905859999999999}, {115.39999999999998`, 
              10.239799999999999`}, {115.11499999999997`, 
              10.499600000000001`}, {114.80599999999998`, 
              10.499600000000001`}, {114.44699999999999`, 
              10.499600000000001`}, {114.19999999999999`, 
              10.215199999999998`}, {114.19999999999999`, 
              9.905859999999999}, {114.19999999999999`, 9.53477}, {
              114.50899999999997`, 9.299999999999999}, {114.79299999999999`, 
              9.299999999999999}, {115.12700000000001`, 9.299999999999999}, {
              115.39999999999998`, 9.559769999999999}, {115.39999999999998`, 
              9.905859999999999}}, CompressedData["
1:eJxTTMoPSmViYGCQBGIQPWMmENyMcfBYc3Q5g4WoA4z/92PcViNGcYc575cf
874e4/AfDCQdenKe/165EcFnXyMTlTIbwT8DAj0xDkleKhdPv5CA89ewdB+e
OV8cztf4pPJylqcYXL+JMQiIOtz1752etwnBl9C/q8J2EMFPTQOCYzEOMaoR
MudqRB04ri8usD0V41BxeJvrzLUI/p/He7NSmUTgfAYQWCAAt+/DovUKZyW4
HPgjLLecmBbj4H2C3XZ2KCecf0dTds3/zxw4+fGOszZmVHE4bDlRtm/+LJj/
2R3CgdJl8xD8JQW2XNcXI/iw8BWpnFRyVoXfAT38AbBxwAg=
              "]}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
              3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 
              3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGDQAWIQ7bLt898rJ+IdnCY0C6VJSTjA+EleKhdPd0g4iN48
9z34MIIvoX9Xhe0ggr9k9hGFDbsQ/IAdcq2vd8Y7ZDWt+M2QIuGQYn3fv3d7
vMPyFx56/xklHHqm5wk1b4h3kF3zv3jGeTGH1DQgmBfvsAIkf1DU4U0g0IBu
BN/EGAiKMfmdNp670i5JwPlrhHT40vdJO/j3Ai0AuteZ0zj3/ykFhxtA5z++
Gu+wJ7/m7cyryjj5Z0CAR8UhlE9309zzCH76xLc19mcR/AlArukxBN+G6/ri
gqPxDi6g8Pul7PBn5cdLvofiHVSuPQpm6FF2eLIUGEA74h1KbdIWGNUpOWyY
+375scXxDitrreSMFyjA3X/XfN+3M0GycL7xruYbMzch5DNK2Dcasyo7LD/m
bd7pGQ8RN1Z1uOKbJBDxMw7ObzlwaqHrNAQfQsdBwvmYIpz/9z8Q7JeB829K
1yQaTZVwMOBYIxMVEwfx3xkRB1VDoMAqBB8Y20UZNxH8+KcXlG4LQsPjjagD
LzD43rvHO6xXOBthslfCYcuJsn3zg+IdYlQjZM7JiDlwAIPLNiserj92lycP
UzeC7wP0juUWBB+WHt+05XYbVYs7oKdXAOoEPVQ=
              "], CompressedData["
1:eJxTTMoPSmViYGAQAWIQnT7xbY29a7xDj9crFpOPkg5/Vn685MsU77BB4WyE
iayYwwSgtOmxOIeKw9tcZ64VdbijwtY4dTWCL9B84NTCUgQ/NQ0E4hzetOV2
G+2WgPP/PN6blcokDed/2RCQPUtc1mHO++XHvMvjHG4vOsM2k0XR4eriAluu
/jgHZ/Er289EKjl48DBpt68Dmle8VfQ3t4rD1s9/r1TcjHM4AwYqDq1iN899
/43gg813i8fgu6qWMs3aoQjnM/At9DobJw9xP9D//RHd/owbpOF89zVHlzPs
kIKrfz+F79r/SikH9PACAO9lkQ0=
              "]}], 
            
            FilledCurveBox[{{{1, 4, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 
             1, 0}, {1, 3, 3}}, {{1, 4, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {
             0, 1, 0}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJ+KL3bk4dJuzjR4f0Uvmv/Tyo5wPgmxiCg7PA9+PHS
2TkIfrXIOveHaQj+898rP15qTYDzhYHSVQ0I/kwQqMTkr2bpPjzzvBKcn54G
AkoO2XtKJks0IPgw82F8mP0wvm+SQIRlDoIPcz86H91//LEB942Oy8D5M8AO
kYX7F8aH2Qfjw9wD48P8C+PD/IPON3G8UstwSQbO/w8G0nD/wvgw82F8mP0w
Psy/MD7M/eh8mP8ARjDZXQ==
             "]], 
            
            FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 
             3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0,
              1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJZIGYC4o+XfJMEJiQ5mBiDgKgDjJ8GBmIOiwtsua43
I/jl++ZL6Sci+P9BID7J4U1bbrfRbwR/JgjslIDz9bVWCl9g0YLzczh/Lkif
jOBfyI9nPzdTy0F4nfvDqggEvzhj4tsa/ySHMyDwRtMhWSDCcotNEkTffw2H
3SWTJVjEMPkQ92k4yLe+Dtwhh+CD3WWI4KeDKLckh687b3X9fYrgNwul3fq3
VQLOd5kAFPkl5pAOdI69K8L/FS/VDDlUEPztckALJTD5sPDdfKJs33wloP9u
5YrP8hZ1sNwCFHBH8FeCIiAEwV/ouu3z3wQEv8beNG5XK4KPHn8AvUjR6A==

             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJJKH0GBGKSHf6DgL2SA4z/YB/fHGMnFQdG7Xaxm1HJ
Dimxd9yYLdQcFrpu+/zXJ9nB+r5/73Q+DYcPy495m9smO8jMi9M8LaDlsP3z
3ysViskOF/Lj2c/N1IKqQ/B9kwQiLH8kwfnmnY4JT+8kOfiAGZoOm0+U7Zt/
LslhqZ+DcOJjdYfFBbZc1w8nOdi9uLnmV4waxJ37ofw7KnA+zP0wvvyuBftS
z8k7LJ19RGHDoSQHgeyPmgxuMg6sjVOduy8kOXzZ93Fr+jUJhzsqbI1T7yc5
JHmpXDytIeogzhLGp/sryWENS/fhmf+FHSa+rbE3Bbofxj9wChgC+gj+0wtK
t386JTvkNK34zdAi5rBASv+uil+yQ6eN5660IEmHipdqhhzA8GzVW5E/87MM
PHw/LFqvcPaGggN6+DOAgEOyw9+PcVuNFiL43SDzmBTh/A8bArJnhctB3GOd
7LC/VtYiPUXaYYdc6+tAk2QHU8crtQxCYg6g6DsnneywJ/H2ojNqog4SIP/x
IfhA38XtYkTwQcFV9CLJQRAUXmxiDpNBGh4mOZy/lSs+y1sa4l5gfPWA3GMk
B+eHNh19eOa9ApwPcz+MP6W9NeryHBU4X+Dl9vXM6WoO8bs8eZgeJ0HSxRV1
B+FmoI9eJjkYg0CxJiQ9/U1yyOH8uSDdWAvufhhfI6b/0FcZBD8FlOCMkx2+
Bz9eOnuJpsMXoPaXVskOhdK8D3QnqMPDDxhaLpn6anC+7oQFPwzdVDDCHwDN
6Gfz
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJJKJ0GAmIpDv9BwF7JAcZ/sI9vjrGTisOcIwobikRS
HFJi77gxW6g52Nz3753OluJgDaL5NBw6HBOeXviW7CAzL07ztICWQ0Dv9Dyh
28kOF/Lj2c/N1HK4UvFSzfAEgv/i98qPlzYi+BeUbv+sm5bs4GPeCTRJ08E3
SSDCsiPZYamfg3DiY3UHW67riwtqkx3sXtxc8ytGzWEmCFRC+XdU4HyY+2F8
+V0L9qWek3dwMI3b5VmT7CCQ/VGTwU3GYYGU/l2VrmSHL/s+bk2/JuFQvm++
lP7MZIckL5WLpzVEHTbOfb/82OZkhzUs3Ydn/hd20GkXu3nuOIIfnQL0+UsE
vyFrT8nkP8kOOU0rfjO0iDlYbjlRto89xaHTxnNXWpCkg1DzgVMLRVMcWvVW
5M/8LAMP3w+L1iucvaHggB7+YPf/THb4+zFuq9FCBL8bZB6TIpz/YUNA9qxw
OYdIkHu+Jjvsr5W1SE+RdgjcIdf6+m2yg6njlVoGITEHUPRlXE122JN4e9EZ
NVGHzSD/HUfwxW+e+x68G8E3AQYXz6JkB0FQeLGJOehsAmqYlexw/lau+Cxv
aYd0kHuB8dUDco+RHJwf2nT04Zn3CnA+zP0w/pT21qjLc1TgfIGX29czp6s5
/Ah+vHT2nGRIvF9Rd1gjE5VivTjZwRgEijUh6Wk7MHw5fy5IN9aCux/GP/xV
I6b/GoL/F5TggP7/DjJ3iaYDSHvzl2SHQmneB7oT1OHhBwwtl0x9NThfd8KC
H4ZuKhjhDwDhW3Bf
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJJKG1iDASXUxz+g4C9kgOM/2Af3xxjJxWHjIlva+wv
pjikxN5xY7ZQc+BYIxOVcjjFwfq+f+90Pg2HUD7dTXM3pzjIzIvTPC2g5QCU
tb4/PcXhQn48+7mZWg4LXbd9/tuC4G85UbZvfh6CP/f98mPewSkOPuadjglP
NR2k9O+qsLmmOCz1cxBOfKzuwHV9cYGtVYqD3Yuba37FqDmkgYAZlH9HBc6H
uR/Gl9+1YF/qOXkHHibtdjHLFAeB7I+aDG4yDjnPf6/86Jbi8GXfx63p1yQc
XLqBIqEpDkleKhdPa4g61GXtKZlckOKwhqX78Mz/wg4/gh8vnd2C4GsYAkNg
GYIPdvfOFIecphW/GVrEHNgapzp3H0lx6LTx3JUWJOnwABhMeZdSHFr1VuTP
/CwDD98Pi9YrnL2h4IAe/mD3b0tx+PsxbqvRQgS/G2QekyKc/2FDQPascDkH
NZB7NqU47K+VtUhPkXaQa30duGNVioOp45VaBiExhwnA6DOdlOKwJ/H2ojNq
og4NIP+1IPhPls4+olCB4DMCg+tmXIqDICi82MQcfoICJDzF4fytXPFZ3tIQ
9wLjqwfkHiM5OD+06ejDM+8V4HyY+2H8Ke2tUZfnqMD5Ai+3r2dOV3M4orCh
KCMyxcE3SSDC8oq6Q8VLoI8SUhxAyoyLNSHpqRgYvpw/F6Qba8HdD+NPOPRV
I2Yygn8KlOBWpjh8B8XbEk0HkHb/jSkOhdK8D3QnqMPDDxhaLpn6anC+7oQF
PwzdVDDCHwBAHVKF
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJ5IGYC4jMgoJPqEMYp1m4sL+oA469XOBthIivhsEOu
9XWgSqrDfzCQdPgR/HjpbBEEf0NRxsS3HAj+wyqRde6MqQ5JXioXT7+QgPPX
sHQfnjlfHM7X+KTycpanGMQ8oH4TYxAQdYjpP/RVQwTBP7XQddtnSQRfgiWM
T1cOan6HqAPQtIdVCqkOgtkfNRmOiTr05Dz/vVIx1UHtSfO8s69EHdJAQAk3
PxXKV4XywfYoQ91rj+D/ebw3K5UJwdcX/zh3xldBh79XKl6qAd3XY+O5K82I
zwHENQT6p2R5yYZ/5zkdtpwo2zefLdWhSbyWNbON06HlANBHQL73CXbb2aEI
/h1N2TX/P3PA+fGOszZmVHE4OJjG7fKEhy+7w5+VHy/5ciH44PDhRfBh8SdS
OankrAq/A3r8AgDo6d7P
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0,
              1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGIzIGYCYo2Y/kNfd6Q57MmveTszVMEBxldw/Jh8plfB
4ca578GPtyL4d37WZe3ZguBHpVjf99+I4G8oypj4dkOaQ3LEUemZ6QoOIOM0
gPwSm7QFRn4KDltOlO2bPy/NgT824L7RcwkHE2MgyE5zeGC+79sZI1GHKRIs
YXyuCP5LNUOONTII/kwQ+JnqEPIbaGKDBJy/F+T+VHk431n8yvYzlQoORxSA
Lvqb6rDk/j6+OZtVHHqm5wk1a6Q5rHjhoff/obrDts9/r1TYpjn0Pfkkfylf
E+KfxDSHM2Cg5bDimLd5ZyuCD/JezXoEH+Rc3UNpDlxuqqVMszTg/DsqbI1T
ldXg/A7HhKcXmlQdpPTvqrAdTHOY8X9C3e9fKnD+A6DzjB8h+G949xnMXKXi
sG8+UOQIgr+nZLIEyzEEf8LbGnvTUwg+MLRj+oH8J8dn7J62QcUhC6ThTJrD
RJA6OVVIfDxJcwjn0900V18bzk9PAwFtSHg/wM1/gcYHU/cQfLGbwARzO83B
pTvn+W9NbUh6OJDmIGuR7pKpr+kACt7ezWkOCYcva6fO1HLw5GHSbp+H0A8M
JaXbjQg+KBid9RF8cPzeTHU4UAs0UUUNzv9fsT5qZoMCnM8s4zR11l8JB1Bw
hbGlOaxh6T48878wJD7sEHxweo5B8N8E7pBrLU9zEMr+qMmwTNQBpHxTLzS9
sks4PAE67+c6YHzaeO5KmyQNzy/Gax71nlFG5B9YfgIAl2+B1A==
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 
             1, 0}, {1, 3, 3}}, {{1, 4, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {
             0, 1, 0}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJ+KL3Lk4dJOznD4f0Uvmv/Tyo5wPgmxiCg7PA9+PHS
2TEIfpXIOveHYQj+i98rP14qTYfzQdJVBQj+TBDIxOSvZuk+PPO8EpyfngYC
Sg5Ze0omSxQg+DDzYXyY/TC+b5JAhGUMgg9zPzof3X/8sQH3jY7LwPkzwA6R
hfsXxofZB+PD3APjw/wL48P8g843cbxSy3BJBs7/DwbScP/C+DDzYXyY/TA+
zL8wPsz96HyY/wA9xdhH
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJJKP0fBPozHcC0vZIDjP9gH98cYycVB5O4XZ48fZkO
KbF33Jgt1ByuVLxUM2zIdLC+7987nU/DQen2z7qsgkwHmXlxmqcFtByAshxr
QjIdLuTHs5+bqeWQJ9R84JQjgt8w1bk7RxvBz9pTMllCINPBx7zTMeGppsPz
3ys/XmLMdFjq5yCc+Fjd4friAluu7xkOdi9urvkVo+ZgDAKfofw7KnA+zP0w
vvyuBftSz8k73Dj3Pfjx1wwHgeyPmgxuMg4WW06U7WPOdPiy7+PW9GsSDvwR
lltOCGU6JHmpXDytIergDXKHbqbDGpbuwzP/CzscUdhQlOGI4H/+CwyBJARf
giWMT7cs0yGnacVvhhYxh8u+SQIRjZkOnTaeu9KCJB1Wy0SlWAPDs1VvRf7M
zzLw8P2waL3C2RsKDujhD3Z/cabD349xW40WIvjdIPOYFOH8DxsCsmeFy0Hc
k5fpsL9W1iI9RdrhdeAOudb0TAdTxyu1DEJiDrHA6GPyz3TYk3h70Rk1qP8c
Efz1RRkT35og+KDgWiqd6SAICi82MYdjIA0imQ7nb+WKz/KWhriTP9OhB+Qe
Izk4P7Tp6MMz7xXgfJj7Yfwp7a1Rl+eowPkCL7evZ05Xc5j4tsbeVCzTARRs
llfUHVy3AX0kkwn1pyYkPRkAw5fz54J0Yy24+2H86P5DXzUCEPzpoASXlukA
8sbsJZoO6kDtMsDwKZTmfaA7QR0efsDQcsnUV4PzdScs+GHopoIR/gCCAWgg

             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}}, {{{
             207.20000000000002`, 5.893750000000001}, {207.20000000000002`, 
             6.252339999999999}, {206.903, 6.499999999999999}, {
             206.60599999999997`, 6.499999999999999}, {206.24700000000004`, 
             6.499999999999999}, {205.99999999999997`, 6.20273}, {
             205.99999999999997`, 5.9058600000000006`}, {205.99999999999997`, 
             5.547270000000001}, {206.297, 5.300000000000001}, {
             206.59300000000005`, 5.300000000000001}, {206.95199999999997`, 
             5.300000000000001}, {207.20000000000002`, 5.59688}, {
             207.20000000000002`, 5.893750000000001}}}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 
              3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGBQBmIQnS/UfODUxiyHNUI6fOn35Bxg/L35NW9nLlVyCLfc
cqKsL8thyje2+BlnVBx6pucJNWcg+PKtrwN3uCH44ixhfLpWWQ73zfd9O/NJ
ySE9DQjMshxSQbQbgq9wwpHT+C2C76payjSLQ9PBgGONTFRKlsN/MNB0YG+c
6txdgeAf+aoR09+G4Ndn7SmZPCXL4fzVsDf6uzUh4rNh8hoOYOOmI/j750vp
3+3AxVeH8280FrtNKVN3sLnv3zsd6H8GMFCHuGcGgq9uCLRhEYL/Pfjx0tkr
shwmvq2xN41D8EV7vF6xiGjA+VxuQA9HaTqsd39YJTIry+FCfjz7uZlaEPsr
EPwzIOCB4IPDSwyqv0odzuePDbhvpK4E569h6T4887+Yw/WKl2qGLjC+sEOB
Ldf1xSkIfsuBUwtd+xB8WPx/2fdxa/o0CQf09AEAmOn/Hg==
              
              "], CompressedData["
1:eJxTTMoPSmViYGAQA2IQbWIMBJOzHAxA9Gc5BxR+sQycz8C30OusnZSDTFSK
9f3uLIdlLzz0/idKOHBcX1xg25TlsDPYKuI/u5iDAccamaiSLIcH5vu+nTES
dTDvdEx4moLgfw9+vHS2D4Ivo39Xhc0xy+EeiP9J3GH5MW/zTtssh+ndP/zO
/JJwWO/+sErEKsthOcg+RykHHpB9ZlkONW9nqjKukoHzFU84chrzKsD51fd/
3DL+rejwZOnsIwouWQ56Exb8MExTcWDQbhe7mYbgf7jkmyRQg+CrsDVOdW7P
cii1SVtgVKcMcV9vlsOHResVzq5QgofHym8vK84cUITz+WMD7hu1KzighycA
lKKMtg==
              "]}]}, 
           Thickness[0.004649000464900047], StripOnInput -> False]}, {
         ImageSize -> {215.0960697384807, 16.338709838107096`}, 
          BaselinePosition -> Scaled[0.32439307852814453`], 
          ImageSize -> {216., 17.}, PlotRange -> {{0., 215.1}, {0., 16.34}}, 
          AspectRatio -> Automatic}], TraditionalForm],
      PlotRange->{{0, 1.}, {0.02, 0.062}},
      PlotRangeClipping->True,
      PlotRangePadding->{{
         Scaled[0.02], 
         Scaled[0.02]}, {0, 0}},
      Ticks->{Automatic, Automatic}], 
     GraphicsBox[{{}, {{}, {}, 
        {RGBColor[0.368417, 0.506779, 0.709798], PointSize[
         0.009166666666666668], Thickness[Large], 
         StyleBox[LineBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQDQMWh5VKHDuP2M+aCQIr7VfpZsofEIDxd9o/mHHG
Yv3iw/YmxiBw2L7NSlr8otNhqPxJ+14RmZ8P3h2yh5h2wd6K/0ti74pDUPWX
7SvN9wkWFRyyT08DgWv2G5e8/ivofgiq/6a9/hzBwxd1DtmfPQMCd+xveq8R
/KwIM++Bva0xV89ENZj6h/ZN035lL7SCmf/YfvJ7RvEPsTD9T+yZ8lMmqE2A
2ffMPjXDoOXsBZh5L+yvdzTVB8nD3P/SfrfR1Gu81TD/vbbfrrVjp8fjw1Dz
3tiXlWVwO4cfgZr3zn7rWtGlFteOQM37YG9778W11Pij9gDwHpgi
           "]],
          FontFamily->"Latin Modern Roman",
          FontSize->12]}, {}, {}, 
        {RGBColor[0.922526, 0.385626, 0.209179], PointSize[
         0.009166666666666668], Thickness[Large], 
         Dashing[{0, Small, Small, Small}], 
         StyleBox[LineBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQDQPddfay+08dsJ81EwRW2vP8XPd34vbdUP5O+8BP
tscjA3bamxiDwGH7G32FU6dL7YTKn7TnEdnwI/vMTnuIaRfs9W6Gvr5nshuq
/rL9ySJJy0N9e+zT00Dgmr3B89KcHNa9UP037Zel9MrN1t5nf/YMCNyxt7h7
xd953z6oeQ/sLWS/Ho/u2AdV/9D+nsjvenWHfVDzH9tnvLmWf8IPpv+J/cdJ
WhLPjfZC7XtmP+H0qYd5WXug5r2wb5XJrbz+bxfUvJf21ca3Vphb7oKa99r+
puuG1d/qdkLNe2O/8Pz/n/Nsd0HNe2d/SUX4xLlfMPM+2Jeo/peNtzpoDwBG
VJ7B
           "]],
          FontFamily->"Latin Modern Roman",
          FontSize->12]}, 
        {RGBColor[0.528488, 0.470624, 0.701351], PointSize[
         0.009166666666666668], Thickness[Large], Dashing[{0.01, 0.02, 0.03}], 
         StyleBox[LineBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQDQPvJj2P2uh00H7WTBBYab/cuu5Az7V9UP5O+9kH
lDolVXfbmxiDwGH7H+ayDOHXd0LlT9q7TWWf+mb9LnuIaRfsLT37JmcywNRf
tn9z6fHppON77NPTQOCa/dTDd2w9i/dC9d+0z7mkcvnz1H32Z8+AwB17hk3p
4Z2z90PNe2Bf1d36f8Y7mHse2j/oemLFsHkf1PzH9haV8R+PnILpf2Lf9eVI
2fwNe6H2PbPXNrvq3ui7B2reC/t5deEsW+p2Q817ab9kS7NnuOEuqHmv7dlP
yUguV94FNe+Nfb2d4uWV33ZDzXtnH3mh6eGDhn1Q8z7YB5isL8q+e9AeANCt
neI=
           "]],
          FontFamily->"Latin Modern Roman",
          FontSize->12]}}, {}, {}, {{}, {}}},
      AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
      Axes->{False, False},
      AxesLabel->{None, None},
      AxesOrigin->{0, 0.09045},
      BaseStyle->{FontFamily -> "Latin Modern Roman", FontSize -> 12},
      DisplayFunction->Identity,
      Frame->{{True, True}, {True, True}},
      FrameLabel->{{
         FormBox[
          GraphicsBox[{
            Thickness[0.017995321216483715`], 
            StyleBox[{
              
              FilledCurveBox[{{{1, 4, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1,
                3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 
               0}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJhIGYC4t2JtxedcZNwmAkGjA7LX3jo/T8oCefL71qw
L/WcpIP273Uc/7YzOqR4qVw87SHlEM4p1m78n9mhPmtPyWQLLYfbGQz5jSoG
Dkv8HIQTk7Uc7E3jdnn6IPjiU69wZgQh+A5Nj47PiEZSXxmxwrTWwKFnw8OX
U420oPYbOGy/yHCP6aUmnJ94+LJ26kwEX0r/rgpbo6bD8yztb9OB+sH2JGk6
gIw7CzTffc3R5QwSUg4LLsoeOTeF20FmXpzm6Qv8DhUXwyeknVFyAPrOb3or
k4MDp3HufysFhxYFdtUzX5gdHrjGO87aKA/x534uB0PVSS9SVRQdAIbUfRk=

               "]]}, 
             Thickness[0.008601763541479216], StripOnInput -> False], 
            StyleBox[{
              
              JoinedCurveBox[{{{0, 2, 0}}}, {{{12.951199999999998`, 
               16.344899999999996`}, {54.5738, 16.344899999999996`}}}, 
               CurveClosed -> {0}], 
              
              FilledCurveBox[{{{1, 4, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0,
                 1, 0}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0,
                 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 
                0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1,
                 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 
                0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                 3, 3}}}, {{{20.699600000000004`, 11.9254}, {
                20.699600000000004`, 11.300799999999999`}, {20.3863, 
                9.499999999999998}, {17.969099999999997`, 
                9.499999999999998}, {16.6105, 9.499999999999998}, {
                17.404299999999996`, 12.7219}, {17.5125, 
                13.174999999999997`}, {17.5605, 13.200000000000001`}, {
                18.029299999999996`, 13.200000000000001`}, {
                18.895300000000002`, 13.200000000000001`}, {
                19.929299999999998`, 13.200000000000001`}, {
                20.699600000000004`, 12.880899999999997`}, {
                20.699600000000004`, 11.9254}}, CompressedData["
1:eJxl1HlIk2EcB/DXWFlEKtTcu2psmiazdMf7DjqsfqMEXdLsoAYdntOR1jo0
JabSKtJMPNJMy+h2ZaVddkAju1asdWqH/bGyCC3DIysh7W3Pas8D7oGXlw/v
8bzv7/n+nqBk4zL9KIqiVrkOdM7/PWfTkzcqUIRWdOqzhOCxyTnYztiFkHeh
ObngkQpKdcVan14h6IUdOsE14iintqT6CHH4nAp7wUEVBGT0SanTQqCrWscZ
KlTQUmw1swuFcPizqL4zRgXtU0xJyjY+hFRzZfl2FmJupvU7fk6Cc8XvDFQB
sft5JfH78fvPmH1Y4Pkd0zjy+djb0fc2CLD3RFqMNS9piCw7OqiYzkLP8UaJ
Y5YIFr3pHdBIWRiw9l1N3yaC6NDsUbWzWBjmXGOBGHuf5guP3UwsR/VpJbZH
m8LSzgeB9nn5mj87GcjR+H7lMoOhYf6q1Rf9GdA7+S1cczB0T7DKa/a67rfO
MHNrpwEdEz9EX1bBGom6LyUuFJtCIzEM21WkSE4thXuSpi2GFhZsUldhuXBo
ze2arqAZ7JlB4oHMZhl2U+TGEz5RxAbKuIM32ttP21Z2yw4Rp6ehEQ4ln/rF
L2TEcej/ThC781Ak9/KvO6lnE1li283rJWN6pWAaYc/10m+mBSqrFFanznVq
8+SAUvU8UQoW89LYutsREIvW+wANiSuWhR0tioB4p7Le3hEI5yv1hSl5EeCe
Pi0QCnj3SxWvZ2D3oHpriEuXZ4VUi73dJHHo2Do+NsugwYf4jNqcw8nEBmPv
7kdZxO48dhCfQuuUNBOetW8Q1C7mQ9xD33mH2ohPLoGJSa76eeyvbazUj5Vj
t6H1jJHj9/3LP3FdT/2DxdXEeag/r3u7K/cx6IeIPf/biOpVR+zOgZG48ueY
hIOZMi+n6u5PqbER/+lbd1WpFmAPj/DQx1vr9ccFcA3MHbZcGWSYLb8pHg1o
1QMLPXkJhmPRzd+HBxTYP2607x3mM9hNH7qqLsUx//psUILdwCu+WyMjnoDq
aBGDMcH3iVDBgOShehzjEIHY1VaPRQx8Wk7tSy+bClsN5d9MnPJ/f02GHSgv
v5TQXen3insrxC6KQomjsd9HJ6hry/mQEqCbfcXCwDk0PzcRdh1xnH2azWLz
VvpFXNqgwvbsn/5rXYm10TByf/0LAkQ/Lg==
                "]}], 
              
              FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0,
                1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 
               3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGIxIGYC4kaWo/2G7BYO/8GA2wHGT00DAT6HE5pWk07X
m8P5YCoNk88i4zR11lwBOB9inqLDOcnAW9I2Zg7K/pPWzTyD4Hdu/SHCYKzo
cKbeY3/tXiQ+GJg5CD5Z0DJTDMFv11uRPzNYAc6fCQYCcD7MPTfOfQ9+vBXB
h9mHzof5Nzb36L9N3WYOFv6lJ84a8DjY6FyZ9ewvgv/w+Izd0xTM4fzEw5e1
Uz0R/E8bArJnbUfw0cMTAP+hoVE=
               "]], 
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
               3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGINIGYCYg+9/4p/t1k7dHu9YjG5KOgA49+Wrkk0MhVy
OF62b77UfAR/xkwQQPArluo4y3Qj+OadjglPG6wdyi+GT0jTEXJQedI872yV
tYOB6qQXqVcEHcq5VTTqcqwdptaGs/yXFnTI4fy5IN3Y2uEMGPA4zHm//Jh3
uhWcX//bquDcC0s4X9wj4I+EsaXD8hdAlzIKwPlzt97WM/kuAufXvJ2pynhK
0kHjLe8+g5OWUHdLO9hXRqwwjbWC80syJr6tyUfw43d58jDdRvDB9ihaOzwJ
ZuhJ/yDlIO/4MfnMWysHh6ZHx2fMlnJITwOCZ1YO4u3G+2cdloTzjUEgGMHX
F/84d0aohMMboHNmclk7gI2fKe7wHwTsEfz73JNXNhUi+LDw/rQhIHuWuQSc
z8S30OusnSScH84p1m4cLw0JfwFrh1SQvWkyDj4XJ8b8C7aC88HBaGMJ5z8W
kT35tN7CQfnao2CGMxJw/okNXeZG70Xg/P6Ibn/GCwIOS2cfUdgQZOlgAvYg
t8ORy9qpkkFWcP4TkPp8azgflp7KD29znZmLSF+w9AYA4gQPrA==
               "]], 
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
               3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJ5IGYC4su+SQIRhg4OW8x/HErRYnaA8e9oyq75X4zg
78mveTtzKbPDibJ986XEHRx0+NLrTN1ZHWbMBIKfdg43eG+LpX7jczgDAj52
DgdqZS3SU8Th/PQ0IJimAOfbvbi55peNqoOC48fkM3ftHCLFt19ksNN06P6b
+v2JooODBEsYn66QDtx+9bqendmeCH7LvLOrzoci+FcqXqoZZiD4LIsnWTH2
6jg4/3r7+oCmA8SdM3UcYnKP/tukjOD/BwF+BJ93jvGiLer2DuG167Yl3ddy
8JcTy/KdbOew57GI7MlWDYcZz2SXv/hh68DlplrKJKXmYGIMBJttHVzmqcQa
dyrD+TD/wvg7gq0i/j+XcXiepf1t+l1bhw69FfkzjcUdapbqOMtU2zmYOl6p
ZRAScpAHhYeuvYP41CucGYs4HNov3XvALewAMS+NCe5+GB/mPxgf5v+5W2/r
mUxH8GHxCwCLAMw4
               "]], 
              FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0,
                1, 0}}}, {{{38.74609999999999, 11.662099999999999`}, {
               36.92889999999999, 13.533999999999999`}, {35.111700000000006`, 
               11.662099999999999`}, {35.267199999999995`, 
               11.500399999999999`}, {36.92889999999999, 
               12.760199999999998`}, {38.590599999999995`, 
               11.500399999999999`}}}], 
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0,
                 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {
                0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}}}, {CompressedData["
1:eJxl03tIU1EcB/ClklPTtEytZXm3KVZGzC1H2R+/o1jq0tT94QNivraZViZW
SrYcRURuIiQ9NjLNLI2WlpphJGI2ezgfNJ34CNH5qExSs6b4yk29B/ILl8uH
w4Hzu/d7iPjUCKEZhUKB5cf4tmF6XpFH+8NSZkWM4hwBa+4r1mxUlDCgUbtP
uN3aHzhsY9xh8312cfVdP9Kjcs9xWx/sNgNf/1iPgKkb5FNUDKiK/lPb8wUB
SzWYq+EzwKuy4FdpEwKVrDeJkseEkroGZw8ZIvdfMFNSaaHYscPt9F4CO/3V
trnmRYAfFhwHnz4maFMFlq0DAM8kh3exJxjQNTEdHN0EUPb3e6bGngHqxcqs
qRcADimTeyh3CNLER2TFlmCz3G99EyYSkFc0wxqpAdg6hdpEAQSUHWzxDW3A
5j2xPuregl14xKtD2QrAOMmeFfEI6FSf4Ui7Vtc7Cchvzg6sHweo7clZEHIZ
IFsQGoasEChMYUI37XKcdwC28evwxNimsdMRSC3UeSwuduRV9YAmm0E6I9hy
bOknHSI/e79/eXZ1vYIOCfZRh6qTEMgaFYIWRF85Rz1Ap0W4YQPVDjL2E7un
qwGquTPvEvfawG6n5JDf5QBikTHWICmvic9Ow07w7T+RK8B+XWE+Kg9b75ke
Ns+sg0rasGpTnyIAlkyxXOlHPLbp/BexU96ez3eRA/QHCJCSRQW9o+un4UJs
U18HsI+FzbukpyJyv1Y54lqaiX16dO7pZM56m+/0u62UWJFem+cDj3sTSbGD
sq4dOC7Cpo0N+uxww67alKaS0dDKvI42pO8Zf2c39ry+LlloZgtc3XJhYhEM
8SlycbsTaEPi7aNOIXAz9nPcGcKDCqQelxA83+JlJ37gBF/zb1yPeYRAY4oj
UGeLxFVT2Pq4hzpOoR/ptfsc+EY01aKjwf/3/R9L9MJk
                
                "], CompressedData["
1:eJxTTMoPSmViYGAQB2Iw7RHwR2Kxk4N4u/H+WYelHL6zxc/wqXVyiBTffpHB
TsLhuKbVpNPmTg4MYCDm8Hvlx0u+nxzhfPumR8dndCP4Oc+BKqocHfbXylqk
s0jB+Xc0Zdf8N0bw3dccXc4QIQWxp87R4cuGgOxZ26Ucrh7NNWmod3QwMAaC
z1IO3CoadT0nHR3KD29zncmr5JC9p2SyxBWg+d/OTGLYquSQngYE/xwdum08
d6UlKTvMt9G5MkvMyWHPC20P423KDk8SF14zUXdy6D48M/7sR2WHhy+nbuKJ
dHKYCQYqDs5rM+8VTkLwy3UV5b9cQfAX7z0orvbZyeHBPr45xpOU4XyVWOOf
adFKcH75xfAJaTaKDiuEL7jcOOHk0OP1isXEUNYBPXwBHmiamA==
                "]}], 
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
               3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJ5IGYCYg1+7q3LZro4hHGKtRvLizrA+CrXHgUzvBF3
yJj4tsa+1sXhPxhIOjCAgAOCf8zbvNNRAMFvuGlbGfHD2eHLvo9b07dJwPlr
WLoPz5wvDudvc53Ja9Qp5uAR8EeimN/FwcQYBEQdpjp35zx3RvALu/qefApH
8C06HROeZrg4ZDWt+M2QIupQslX09+kyF4dOG89daZdEHbr+pn5/UunioPak
ed7ZV6IOFbqK8l9qCPNVofy+0kJp3gYXiHvtEfw/j/dmpTIh+P0R3f6MBcIO
T+2X3N8HtN9jV9qns2ECDjelaxKNZF0c4h1nbcyo4nIQkT351J7HxcH7BLvt
7FBOOP+Opuya/585cPIh+jkczn0PfrxUGBa+7A4SoACTRvDXdN/OYFBH8GHx
J1I5qeSsCr8DevwCADSf1ho=
               "]], 
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0,
                 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {
                0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}}}, {CompressedData["
1:eJxTTMoPSmViYGBwAGIQvXjvQXG1zx4O/yvWR80sUHSA8e8sOsM2c4myQ0zu
0X+bFns4mBiDgKrDCtOz1n6GCH6D2qG25efd4fyMiW9r7GvdHVSuPQpmWKPs
4PO5L7gkx93BcM2j3jPByg7HvM07HRPcHdZ0385g6FdxsAuP3rhfBaFfYI7x
oi3P3eD8X3VZe0p2I/g8/uunpM5wc3jFYiJodkfFIYfz54L0ajeH1bVWcsYf
lB0KuvqefIp3c1jx7WXFGQFlh4QZPqI9Xm4OgtkfNRmmKcL5iiccOY1rEXxD
1UkvUlMUHTStJp2uD3BzEP7keD7NVdHB6Xza1edRCP5T+yX396Uh+BbXjuaa
ZLg5KMca/0zzVnQoiGc/J1kIlb+q6KCTKvkoot3NYeetrr+p5soOKtP/T6hb
7OYwEwxUHEq2iv4+fQ/BtwCGzlMGdzj/DAjwuDs0sBztNzRH8MObjj48U68M
55d7sb/+/0bJ4WPymVhvDqj8eiWHPys/XvJlcnfoPjwz/qyjkkNICdAFEW4O
V1kCvzNy8DkIHN+1o9fPzWGL+Y9DKVrcDjvWMz/v8XBzSE8DAS4HCY+APxLc
CP7fKxUv1X66wvkBnnMb1F5h8n/cMvZmusIB53+H8sHp6bWrw38wYIekjz8I
/geQ+wXc4HyWMD7dTapuDvdd4x1nGXI41KzbllRvieAvAaXXagT/4cupm3g4
3eH6c0watjsIIfhsjVOdu1Uw+cwyTlNn1XLC+TD/JDy9oHRbEsF/IiJ78ul/
RHhsbam5sHkngu+zjMtNdasbxL8i3HD+DFB03kTw/zzem5XKxOtwMR+YYH66
OTwJZuhJvyDmkPP898qPwPhSAKXPt+IObx6ZSR0QdndYK6TDlz5PzKFCV1H+
i407JN7PiDgsmmTF6NuD4Nf+tio4Z+EB58Pys8eutE9nr0k7oOd3AGbevzM=

                "], CompressedData["
1:eJxTTMoPSmViYGAQB2IQveHhy6mbbDwcxNuN9886LOXQv+CH4TMxD4dI8e0X
GewkHBIPX9ZOvejuwAAGYg5TnLtznncj+DelaxKNVBF8tsapzt0i7g77a2Ut
0lmk4Pw7mrJr/hsj+O5rji5niJBy+LIhIHuWuDuE3i7lUBDPfk5S0t3BwBgI
Pks5LNl7UFwt2d2h/PA215m8Sg4sYXy6m3KB5n87M4lhqxLE3hnuDt02nrvS
kpQdLK4dzTXZ4O6w54W2h/E2ZYe631YF5w4A5Q/PjD/7UdmhplnfZ9knd4eZ
YKDicNuNuYJbxwPOFzi+a0dvHoJvGx69cX+Ph8ODfXxzjCcpw/kqscY/06KV
4Pzyi+ET0mwUHZzWZt4rTPJw6PF6xWJiKOuAHr4AfpKP8Q==
                "]}], 
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
               3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJ5IGYC4usfvnhFLvNySE8DgmkKDjD+h0XrFc5mKDns
uNX1N3W6l0OBUPOBU4mqDhv08hYzung5cG9dVnlcU8MhY0/JZIk3ng41iUah
BlzaDhLF14U+FXo6zJgJAjoO3CoadT2JCL5D06PjM6IR/B+Gz9aphng6sCye
ZMXYi+BfqXipZpiB4LfMO7vqfCiCr17XszPbU8dh3bak+pu5ng4y+ndV2B5q
O5TrKsp/YfFyuCUNdFGppgMPyP5IL4eVTYGecxtU4fzyi+ET0uYowPnnbuWK
z3ot7hA/w0e0R8jLwf+J5yXTy/wOB1cs8XNI9nT483hvVmoTC9z+Pfk1b2cu
ZYbz72jKrvlfjOBvMf9xKEULwZ+79baeyXQmuP/B4Z3GBA8fGB/s/hIE34bR
t4X3vadD2eFtrjN9OR36SwuleS28HN5P4bv2P1LQ4Y4bcwV3i5dDpPj2iwx2
YvD4Ow/yT7a0A3r8AgBboNJM
               "]]}, 
             JoinForm[{"Miter", 10.}], 
             Thickness[0.008601763541479216], StripOnInput -> False]}, {
           ImageSize -> {55.57114819427148, 18.058181818181815`}, 
            BaselinePosition -> Scaled[0.29350487424072735`], 
            ImageSize -> {56., 19.}, PlotRange -> {{0., 55.57}, {0., 18.06}}, 
            AspectRatio -> Automatic}], TraditionalForm], None}, {
         FormBox[
          GraphicsBox[{
            Thickness[0.12706480304955528`], 
            StyleBox[{
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0,
                 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {
                0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}}}, {CompressedData["
1:eJxTTMoPSmViYGBwAGIQXXExfELaGSmH/xXro2YWKDrA+HcWnWGbuUTZwdy/
9MTZAAkHE2MQUHVgkXGaOmuvCJz/OJihJ32DIJwf7zhrY4YVn4PKtUfBDGuU
HaaUnH0yW5fXwXDNo94zwcoOW8x/HErJ4nFY0307g6FfxaHLxnNX2iYOuP6C
ea8mzH7IAuc/z9L+Nl2WCc6/8PvY9Xk3/9u/YjERNLuj4lDzounXNMs/9qtr
reSMPyg7VN3/ccv49A/7Fd9eVpwRUHaYkCianyL3zV4w+6MmwzRFOF/xhCOn
cS2Cb6g66UVqCtD/1/J2X7jzzV74k+P5NFdFB+fF1h1zNX/A+XfEUs1OLPkJ
54s3yUwxuPzTXjnW+Geat6JD+LdYwT/vf0Hkryo66Pxex/Fv+1/7nbe6/qaa
Q90zj8FhJhioOAQ88bxkGswC57cqsKueKWGD8yH+ZndoYDnab2iO4Ic3HX14
pl4Zzi/3Yn/9/42SQ6zeI2vD12wQ+fVKkPDoZnPoPjwz/qyjksMG6W26p958
t7/KEvidkYMP6p5v9uB40eJ2OHnYaW3mva/26WkgwOXAute8jSHhDZy/avr9
TKPHz+H8rYL+ZcbKTzD4QFu9ma5wOGyB8r9D+Qkr9R6ktj2x/w8G7A7vGXfp
p297Aedf6WQJPrvmLZy/5Nbyx4bNH+3vuwJTliGHQ4xqhMy5P5/h/Adg+g+c
3wgKp+9sDjD9F17wJaV3scP5TxIXXjNZz4HBZwal61pOOB/mH7+LE2P+MSP4
IpWTSs6msMH5wW8vf5zByATnA3mNp3YwOoD9K8IN588ARedNBP/P471ZqUy8
EP8xszk8AeWjC2IOPifYbWdPZXNQAKXPt+IOElOvcGYsYndYK6TDlz5PzEFf
/OPcGaZcDmfAQAQS39r8cD442fwUgfNh+dljV9qns9ekHdDzOwDHSclA
                
                "], CompressedData["
1:eJxTTMoPSmViYGAQB2IQ/WHReoWzEqIO4u3G+2cdlnK4+IIvKf2VsEOk+PaL
DHYSDmuEdPjS9wk6MICBmINI5aSSsyr8cP5Wrw0Wc3ZywPlPEhdeM1nP7rC/
VtYinUUKzr+jKbvmvzGC777m6HKGCCkHmY1i85kesDt82RCQPWu7lIPW73Uc
/76zOxgYA8FnKQew+2bwOJQf3uY6k1fJIeTt5Y8zHHkd9n87M4lhq5JDahoQ
PON36Lbx3JWWpOzQrsCuemaLgMOeF9oextuUHWbPBAJLQYfuwzPjz35UduDx
Xz8l9YSQw0wwUHHo0FuRP3OyCJyfEnFUeuZyMTjfdZ5KrPFMcYcH+/jmGE9S
hvOB5M+0aCU4v/xi+IQ0G0WHPYm3F51xE3Po8XrFYmIo64AevgDTN5IN
                
                "]}]}, 
             Thickness[0.12706480304955528`], StripOnInput -> False]}, {
           ImageSize -> {7.867666251556662, 16.338709838107096`}, 
            BaselinePosition -> Scaled[0.32439307852814453`], 
            ImageSize -> {8., 17.}, PlotRange -> {{0., 7.87}, {0., 16.34}}, 
            AspectRatio -> Automatic}], TraditionalForm], None}},
      FrameStyle->Automatic,
      FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
      GridLines->{Automatic, Automatic},
      GridLinesStyle->Directive[
        GrayLevel[0.4, 0.5], 
        AbsoluteThickness[1], 
        AbsoluteDashing[{1, 2}]],
      ImagePadding->All,
      ImageSize->350,
      Method->{"CoordinatesToolOptions" -> {"DisplayFunction" -> ({
            (Part[{{Identity, Identity}, {Identity, Identity}}, 1, 2][#]& )[
             Part[#, 1]], 
            (Part[{{Identity, Identity}, {Identity, Identity}}, 2, 2][#]& )[
             Part[#, 2]]}& ), "CopiedValueFunction" -> ({
            (Part[{{Identity, Identity}, {Identity, Identity}}, 1, 2][#]& )[
             Part[#, 1]], 
            (Part[{{Identity, Identity}, {Identity, Identity}}, 2, 2][#]& )[
             Part[#, 2]]}& )}},
      PlotLabel->FormBox[
        GraphicsBox[{
          Thickness[0.004077139478941575], 
          StyleBox[{
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1,
              3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3,
              3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJx11A1MU1cUB/AHreCilg8phZZ+2jKhG7oWRoMs/NnCVNxWgi6tC2wU+sFQ
RogEWZBFGwKLmElYcFSnQ7ekRtlwm4pDxTHCINAyOnFh4KxTE3GZQx1jaLFv
fS3cJks4yc3LLy/3vHfvOfdKiyvyTSyKokJ8Q+cbob5B+0OIRrtuSMWWYNFG
N7eXDpNi/vblMpNViOxn1OX0H1IY9f0Cm10AFud4rnNEBvvsvRpHOx+n6zJE
6rw1gflX4tHRNFlKVaxB/v2rD9uyuejlJW5dxpKjtU7Hpj1RSHNueMNVKcdP
E+W8w01R+L5OqLHUy+Ga4hRbTkUi8l5XJ+uuHMsUjrNPT0fgTc7z3xzVKhBR
mOdWWTj4TR62r/V20Mdzzv/99Gwi8beD1T2fda9FrXtuQr1lNRz+SMZ2XpeL
usEjro82T3hbE4glg76VOkWQTT7+oKwgifi1wfCXjnCfJZ7J3d6gqU7EwJn9
6aqDItwaaLt4aFRBbCy8/irrQtC39L4P71UgNXusjnoU9MZu8yNnrJg4csfD
JKoh6A8zN3ebW8R4UlDe721RgNeovnK4T4y5H4ynimYUgTqkSKFj9medkthi
ZkIJE1PHWcmS/jL6OY7lRtAPkqgf1eMSpP/SX55atPD+IwnWNbfPvRCmhLi7
vcc0IsLdMuXsJ0eT8Kk9445Zs9A/ciV2u3TN5pV8ku+7rRl6OjyOeHff+Rzb
/SjiasbO5TD0XVWabGuJhfapTSluBbG//hFyHGD2Q7UKOmv/7w5aBmabKG8k
LhomTzgOyVDC9GdjFIZ7lFa6ToYLObZVqndjAn0gkIFi4iY30KfT0sD8t+Mw
LXin1myTYpunKtNMxYOu6XzLtleKS0zeMD6mT3RKnHOSwFPDxyu8sS7HrxKk
qpkQ4H39yTTnlqD9dcsXEY8L9hhU1+IxyvT7Ch5upvfMOlRcbOzot1OaaOJ/
B2qvDdWvJP465b3PQy6xUHWO6xn+K5b4zxoHTHsSiP19WS5Es4FbYRSxA+s6
JkJxrtw1XMpGgUKfMJIgJn7drbIPvyzGNuZ87mMDVl8HH1nagbqLUWmvOuPV
shfuBwlGmfO6n0Uc7j+vocTaO5t/Tvs4FNeZ9f8jxkF9kzZkfSjymLxSMTad
0w6UNDzJ8udJ5uKA7+2x3sdZCR30rraKGOIOdlOfjV6NzB1dhaVfeZb0ztai
Ss2ueeLxWNOLg1/MZ9X4+zIGl62pJa4Zb9YQ0x/OGBiY/ZhiYb2iZco0xsOY
b7VDmjDstJ70UOxYLNfUJ6dtWIHFfA+Y+sdFEwuZ/9TGES/en4H5fPz/fv0P
ELNj9w==
             "]], 
            
            FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 
             1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1,
              3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGIxIGYC4jmLlHf+Wa7i8B8MuB1g/NQ0EOBzcJ2nEms8
UxnOTwfTmHwWGaeps+YKwPkQ8xQdug/PjD8rqOig7D9p3cwzCH7n1h8iDMaK
DrcXnWGbKaIE5xuDgZKD4JMFLTPFEPx2vRX5M4MV4PyZYCAA58PcI/zJ8Xwa
K4IPsw+dD/NvcInK9P8bFB0s/EtPnDXggeifqgTnT+/+4XfmFoJfcTF8QpqO
Mpxf+9uq4ByHCpyPHp4AKlGUFw==
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
              3, 3}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGINIGYCYp1v0+9OZtdx6PZ6xWJyUdABxr8tXZNoZCrk
oNEudvPcdW04/wwYIPj9Tz7JX1qP4LOvkYlKma3tUH4xfEKajpDDk8SF10z6
tR0MVCe9SL0i6NCx4eHLqUXaDlNrw1n+Sws6FKzpvp3BoA01l8fhSsVLNcMM
TTh/+gT+KrNsDTj/hKbVpNP/1RyWv/DQ+88oAOfP3Xpbz+S7CJxf83amKuMp
SYdXxVtFf2trOMyYCQLSDqI9QI+GaML5dVl7SiZXIPjhfLqb5vprwfkvsrSB
IaLl8CSYoSf9g5TDDZA/S7UcHJoeHZ8xW8ohPQ0EtBzE2433zzosCecbg0Aw
gq8v/nHujFAJhxKgc06v03IAGz9THGKPpDacH7Nx/5t5NQg+LLw/bQjInmUu
Aecz8S30OmsnCeeHc4q1G8dLQ8J/t5ZDKtheGQczm71B0xw14XwjkLuE1eH8
xMOXtVNnqjooX3sUzHBGAs4/saHL3Oi9CJzfH9Htz3hBwOHpBaXbP+3UHUzA
HuR2UHD8mHzGVhPOTwCpr9SG82HpqfzwNteZuYj0BUtvAGabEfU=
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1,
               4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}}}, {{{16.999599999999997`, 
              9.905859999999999}, {16.999599999999997`, 
              10.239799999999999`}, {16.7152, 10.499600000000001`}, {16.4059, 
              10.499600000000001`}, {16.047299999999996`, 
              10.499600000000001`}, {15.799999999999997`, 
              10.215199999999998`}, {15.799999999999997`, 
              9.905859999999999}, {15.799999999999997`, 9.53477}, {
              16.108999999999998`, 9.299999999999999}, {16.393399999999996`, 
              9.299999999999999}, {16.727299999999996`, 9.299999999999999}, {
              16.999599999999997`, 9.559769999999999}, {16.999599999999997`, 
              9.905859999999999}}, CompressedData["
1:eJxTTMoPSmViYGCQBGIQ/VhE9uTT/wYOHmuOLmewEHWA8f9+jNtqxCjusFud
n3vrNwOH/2Ag6WBx7WiuSQKCnyL5KEKcHcGfMRME9B2SvFQunn4hAeevYek+
PHO+OJyv8Unl5SxPMbh+E2MQEHXwlxPL8k1G8J9naX+bPhfBF/cI+COx2cAh
RjVC5lyNqINJw3aHpkMGDhWHt7nOXIvg/3m8NyuVSQTOZwCBBQJw+z4sWq9w
VoLLQb2uZ2f2S30H7xPstrNDOeH8O5qya/5/5sDJj3ectTGjisMhe0/JZAkW
mP/ZHbI5fy5IF0bwZz+TXf5CA8GHha9I5aSSsyr8DujhDwCPTrSR
              "]}], 
            
            FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 
             1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0,
              1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {
             0, 1, 0}, {0, 1, 0}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJFIGYCYnVDjjUyr6wcXFVLmWbtUHC4LvTJ8fwyBP9K
xUs1ww4rhw69FfkzJ8s49EzPE2pOsHJIAwMxh60tNRc2e1rA+Sc0rSadtjeH
8xMOX9ZO3WkG5wfIiWX5bjZzYJFxmjprL4I/e7nVk7QICTiffY1MVIq1Jipf
WgtuXjrYPC0HialXODMOmcP5NjpXZj2TtcDgHwe567+Ww03pmkSjo+YOS+7v
45vzWcvBo+gn/8vtZnD+hocvp27yQfAtOh0Tnn4whfPB/n9gAuenSj6KEJ9u
AjcfxofZ/yH5TKz3DQRfwiPgj8RhUzj/xfb1zM/PmDrMWaS88486gm9mszdo
mqMmnC+z5n/xjPUScH7AfaPlpx+Jwc2DhS/MPhgf5h50vokxCIg6nFe6/bNu
lhWcDwDUs9jh
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1,
               4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}}}, {{{32.9, 7.852339999999998}, {32.9, 
              9.379690000000002}, {31.734400000000008`, 
              10.600000000000001`}, {30.355499999999996`, 
              10.600000000000001`}, {28.929299999999998`, 
              10.600000000000001`}, {27.800399999999996`, 
              9.344140000000001}, {27.800399999999996`, 7.852339999999998}, {
              27.800399999999996`, 6.336719999999999}, {28.988699999999994`, 
              5.199999999999999}, {30.343799999999987`, 5.199999999999999}, {
              31.7461, 5.199999999999999}, {32.9, 6.36016}, {32.9, 
              7.852339999999998}}, CompressedData["
1:eJxTTMoPSmViYGCQBGIQ3V9aKM3L4OBw4QVfUvopeQcYf8ZMIJCUg/PftOV2
G0lLOzw4PmP3tA32Ds1Cabf+XZVwmDqBv8os2t7hQK2sRXqLmMOa7tsZDOft
HGaCgahDzVIdZ5loBH+Gj2iP1ytbOD+kRGX6/wRbhwhOsXbjeDEHF9VSplkc
tg7rFc5GmOyVcPCobtb32WbjoP5J5eWsl1IOJsZAsNnG4UD3viaTw7JwPsz9
MP7qWis54wsKcL7LPJVYY08lh1yh5gOnBG0dGNoDlqbFKzukSD6KEE+3dfiw
/Ji3eaaKQ0SK9X3/t7YOZ8BAxSEh9o4bc4QdnA/zHwrf397B7sXNNb9iVByO
KGwoylho71ARscL0bLYyPPzA9vkrwfnvp/Bd+39SwQE9/AGO9KI+
              "]}], 
            
            FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 
             3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0,
              1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {
             0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 
             3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3,
              3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 
             3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJXIGYCYtvw6I37e1wc0sBAxQHGP6FpNen0fxWHpkDP
uQ1pLg5L7u/jm/NZxeFPTO7Rf14I/oXvwY+XSiP4Lr/evj4w0xmuH8aHmd8M
Mu+es8Ol/Hj2c5EqDiuEL7jc+ODswFC5PmrmBmU4/4N0fHWaJW7+7ltdf1PZ
lR1m5Ak1H3jl7OCuWso064SSwwIp/bsqcc4O6xXORpjslXBorrmwOfKok8Nd
833fzigpOzCH8elu2uvkMFvhlR1DJYIPNq8dwa/wYn/9fw6CD3P/blYhEftv
CP71D1+8IsWcMfgw/2/mKVzT/doJHj4vtq9nfr4GwQe7uwHBt2b0beH97gjX
D+PDzP9/peKlmiHCfpbFk6wYXZ0cNN7y7jMAhqe848fkM6FODi28/uunsKo4
LEjf/Ko41smBmW+h19l7yg7HQebmOznMEPL8YsSl7OC8NvNeYZWTg/M8lVjj
TiUHV5B7fjg6fNoQkD3LXNLBWufKrGepjg4Zb7dxn3VVhvg/ztFBIDbgvtF0
BN94zaPeM4sR/DMgsAfBh7k3/ukFpdszEfz+BT8Mn23D5MP8nywQYbllgiM8
fEDe9XVB8Dsu3XvALY3gl+sqyn/pcYDrh/Fh5m+O/Lrz1i0EPwCYHNVeOTiw
gg1Wcch5/nvlx18ODnteaHsYtyk7/K7L2lOy29Gh4mL4hLQ1og4zQeCgo4No
u/H+WcqiDvNB6e0Y1L9nRBxWd9/OYLiO4NuD8tMTBN+AY41M1BtHhx6vVywm
H0UcNurlLWb84uhwR1N2zf/NohB1PU4Ofz/GbTVaqOjgfYLddraqM1w+feLb
GntdZ7h+cHoycYabX9Os77PMCcH/CXJ/MILfX1oozRvhDHc/LL/A/LduW1L9
TV4Xh8qIFaZnTys5XD2aa9Kg7+JgZAwEwSqQ/Fbk4jAhuERlejyivICFJwAx
WeM+
             "]], 
            
            FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}}}, {{{
             41.400000000000006`, 7.599999999999999}, {44.49961, 
             7.599999999999999}, {44.49961, 8.199609}, {41.400000000000006`, 
             8.199609}}}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1,
              3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJdIGYC4v8gUO/lYLzmUe8ZZQUHGP+jJsMx4wwEX8Hx
Y/KZXgWH8Df6u9XzEfyCrr4nn+IR/C+3rzcWx3k5nN6n3fQ/F8F/4BrvOMtR
weF968mQgwFeDjuCrSL+L5dwqL9pWxmxwNPhgfm+b2eMRB2inexe3ORB8MWn
XuHMWOQB5zOAQIO7Q4xqhMw5G3E4P/3tNu6zW5Xg/JpPGwKyd2k6rNuWVH9z
rofDGTDQcrg7ub01itsTzv8Rk3v03yoEf8KCH4bPzLwc0kBgmYbDd7b4GT6h
Xg4e+2tlLdhVIe6N8HIAunLNrz0qcP4b3n0GM1epQOgsBB8Wfuj8KUBnXN6D
4N9oLHabYqYK57vIvH5kdksLzk85E+t9wl0bzk8HO1Db4cqsZ7LLCxD8FOv7
/r3pCH64+PaLDGlekPCI0nZ4sX098/MYL4cIkLictoPD2sx7hUJeDnlCzQdO
OWo6PO/ReMt7ztMhh/PngvTJWg5P7Zfc35fmCTfvkm+SQMRPDzg/QE4sy/ex
O5xvYgwEn90cLlwNe6M/Wx3Oh8UPjP+m4oxDao20w40PX7win7k7rGHpPjzz
vzDcfBgfGPqiPZ884XyY/839S0+c/SDlgJ5+AUPAV1o=
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1,
               4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}}}, {{{59.19999999999999, 
              7.852339999999998}, {59.19999999999999, 9.379690000000002}, {
              58.034399999999984`, 10.600000000000001`}, {56.65549999999999, 
              10.600000000000001`}, {55.229300000000016`, 
              10.600000000000001`}, {54.10040000000001, 9.344140000000001}, {
              54.10040000000001, 7.852339999999998}, {54.10040000000001, 
              6.336719999999999}, {55.2887, 5.199999999999999}, {
              56.64379999999999, 5.199999999999999}, {58.046099999999996`, 
              5.199999999999999}, {59.19999999999999, 6.36016}, {
              59.19999999999999, 7.852339999999998}}, CompressedData["
1:eJxTTMoPSmViYGCQBGIQ/eX29cZiNV+HCy/4ktJPyTvA+DNmAoGkHJz/pi23
20ha2iH8lNGRjf98HJqF0m79uyrhsEEvbzHjFR+HA7WyFuktYg42OldmPev1
cZgJBqIOKjv/tH8JRvA38BSu6ZZG8Ccs+GH47Jq3QwSnWLtxvJgD+88F6ZtX
eTusVzgbYbJXwoFHRaOup9HbQf2TystZL6Uc/oNAvbfDge59TSaHZeF8mPth
/NW1VnLGFxTgfJd5KrHGnkoO898vP+a93tuBoT1gaVq8soN48XWhTze9HT4A
hc0zVRymSLCE8cn6OJwBAxUH8alXODOCEHyY/1D4Z30c7F7cXPMrRsXheNm+
+VLffRwqIlaYns1Whocf2D5/JTj//RS+a/9PKjighz8AuUjFXg==
              "]}], 
            
            FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1,
              3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {
             0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 
             0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJzIGYCYmn9uypspQEOJsYgIOoA46eBgZgD8/Mejbe+
CP781WtvxFsh+DNBwDLA4U1bbrfRbXE4//aiM2wzUxTg/HSQ8mVKcH7H8vBT
RiHKDv2lhdK8GgEOM/5PqPstpeJweqHrts+CAQ5l/nJiWbyqDiKyJ5/a3/GH
uk/VYc4RhQ1FKxB8lZyKqqUiCP70PKHmA7f8HKZ3//A7I6XswH98147ec34O
76Xjq9NmKjmwLJ5kxXgWkw/TP+F0vcf+v74OZ8BABc6HyKs4MGi3i91M84Pz
wXSxn4POt+l3J7Mj+O5rji5nuKEE57frrcifOVkCzoeF3/19fHOMkxB8mH3o
fFj87Amaptin6udw4Vau+CxvUQfza0dzTSoQ/I5L9x5wL0bw99zq+pt6HsE3
idvlyaPkD+cnPL2gdNvTH24+jA+zHxQNvq8R7psBir+bmPx75vu+nZkkAeen
3Bc9+P+YApzPAAIByg7/QcDe3+EN7z6DmatUHLbo5S1mnIPgg+W/I/jgdMMG
TC+g8CtWhvPDm44+PPNfEc5vFkq79W+qBJwPc59tePTG/X8Q/gkX336RYR4m
H+Z/ecePyWeOIsKnHZROeQIQ4RUSpL5AEcF3EE48fNkcwf9/peKlWiKCj56/
AI4uYUs=
             "]], 
            
            FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 
             3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0,
              1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {
             1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGIZIGYC4vmr196ITwt04I8NuG+kLu0A479py+02ui3r
kF1RtVQnGJNfcTF8QpqPNJzfobcif+ZncYeWmgubI20DHRjAQMzhPwjII/iT
21ujLr8JwOCDza+WgvPPgADQfBg/DQxUHBZcM3lvERmIwT+haTXp9H8VuHp0
/nwbnSuz0jQdEkKC1BfcRPAV/34rfXAjwAFEzTFUdwj0nNugti/A4dHxGbun
fVBxUA1mXTypKsDh1GGntZn3EHyY/WDzdmLyyw9vc53pKw3nX3zBl5T+StRB
VizL9/MnqP/OiEDCRzoQzof4G8GHxccGhbMRJnvFHdDjCwAtpcsC
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 
             1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1,
              3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGI9IGYC4u9s8TN8FgY57L7V9Tf1uLIDjH9Hha1xarOK
w/4382x0eoIcTIxBQNVBNZh18aQsBP+n4bN1qhoIfu26bUn1gkEO7cvDTxl9
UXI4AwI8QQ7lh7e5zqxVcugvLZTmxcKH6ed5oDthwYpAiL4zKnA+RF7FQYIl
jE/3FoJ/fNeOXrYHgQ4636bfncyO4LuvObqc4YYSnN+utyJ/5mQJOD8NDMQc
/oPAdQQfZh86H2KfqINp3C5Pnn2BDhdu5YrP8hZ1eLx09hGFFwi+f+/0PKH/
CP7rR2ZSB4SD4Pw/EsXXhbwQ/KmbeArXRAfBzYfxYfangyg3BL8+a0/JZBEE
//fb1wcsgeYr7FqwL/Udgl91/8ct49UScD7Yn/IKcH5yxFHpmeVKDpNP13vs
NwxyeMO7z2DmKhWH91+8IttyEPzNJ8r2zS9C8H+A4rsEwQc7uzzI4UCtrEX6
EhWHmSBQGOSwae775ce6VRzmr157Iz4tyMFjP0gBgt9zeGb82YPKcP7qWis5
YwFlh7kNaofagOZB4l/JwT0AGGLNCD5Y/SQEH5ZeS2zSFhjJIdIvLD0DAFbM
QmA=
             "]], 
            
            FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 
              3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1,
               3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGAwBmIQDQYKIQ4ZJewbjVMlHWD8P4/3ZqUqyTicAQEeTH7V
/R+3jL0l4fyUiKPSM9PFHN7w7jOY+SsYYg6DmIOFq3vRz/cIfk5F1VKdy5h8
2TX/i2f0S8D521xn8hp5SiLUtwcsTbuvAOefdq1RT9NVgvOFKyeVnFVRdri9
5ldM7sZgh69ekW0WYioOW06U7Zs/LdjhFYuJoNkdFYcfhs/WqZYEO5gYg4Cq
w5fb1xuLgxD889+DHy8VRvB33ur6m/o4yIGZb6HX2XfKcP7s5VZP0jKU4Hzn
Cc1CabsUHTJ9P/cFfwhy2PNC28M4TRHi//8I/hXODKUckWA4v38B0EVKwQ7B
v0ts0i4g+BB5JTS+ssNn+Uv58ewI/mMR2ZNPfwfB+S01FzZH8gY7bJiS2pFs
q+Kg4Pgx+YxhsMNMMFBxaF8efsooAMG/z8TZJV+M4IPdOz/YYW9+zduZW5Xh
/LegeJ2lCOdXg+J/tYLD+c2RX3eyBTu4zlOJNZ6p4MAqJGJ/7EyQw95aWYt0
F1k4H2iaKuMqSTjfY83R5Qw/RB1ic4/+2wQMb3A6OiPicAFknhOCnxASpL6g
FMFfMsmK0XdGsIPiCUdO47ViDvJiWb6flwU7nNqn3fT/rYSDadwuT55VwQ5z
t97WM5ku5sDyvEfj7UGE/oDe6XlCjxH8juTYO26fEXxY+p9aG87yv1rUAT1/
AAAgvFgi
              "], {{78.49959999999999, 7.002729999999999}, {
              78.49959999999999, 5.818359999999999}, {77.6137, 
              5.419530000000002}, {77.09179999999999, 5.419530000000002}, {
              76.4973, 5.419530000000002}, {75.99959999999999, 5.85469}, {
              75.99959999999999, 6.434769999999999}, {75.99959999999999, 
              8.030079999999998}, {78.06290000000001, 8.175389999999998}, {
              78.49959999999999, 8.200000000000001}}}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1,
              3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 
             0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxl1H8slGEcAPBTalmci/uROHfHiZKSV+La6qvSzEL0vO1sqThe/RD9QClt
jcbWEbVmDpVKKCyTH1uzS0rRnaKaqVaaNLpFkT/OpHrfF++z6tmePz7be8/z
fH/cVxGbHBk/n8fjWdA7jN7z6K1jVgAJRr1n5u9QR5hzjd0qfsIHKQzeKnks
l5PQqtVn+mpkkBtisvR1IGF9eGpHV7cMyhLumY5PI7BPv5TSVS4H649eBWXD
CLZeVUYTnXJQZ/v3tjci6NfzSwk7BWRkrdlecRWBYLDsnM5PAWXVtX17KQTp
6qp1XVrskkrVIGV24Sxkzm9whYaONP21NARGdikhNFagDmjB/j4REpUtIDlP
vz75ZbmInIlL5wKLJukXi0mQBY5pjO8VIFjcWJEuIcEQlOFO1SpguPnu/CEn
bF+CXjLs+ivfKp+4/2/XaGKSMmBr1O2OuvUunM9OqY48r1JyvhHU9GNa6MaZ
vYdwA+S98ra9HPvZdfpDB+zgHT+XHl9Mwm45HUCNEh6/8ox3WEiCcDzwBZWq
BC+FbCJxFIGl1XmZhu8GRUl2Wa29iPt9yGm6AHrstKOONh9jsNl8b5vNd7kr
5xK5aSMvyoXzEqZ+Yuz3dYcjqC0KKKy3PlqjQVB9RuVMHJHDgdAfF3ZmIEhp
FE0ZLshgX9F2UW4hAijIsqNUMlBLmnt49xGkPmoK0nU5g7kt7s6+QQRxIcoe
Q7AzUMwanX2P0hlGOx9trrUgIWd1VbKOkELchv7wPFsSRi7ze3+nO83Umc5X
9zA/NuGgI2e2XwXLOLP3/pLM5IPO30nm/loRtBQW2J5qQ5zH63YcKs7H/mqj
99YdpN/H1DdHAh62dANFIWiJeXfDSDmB284FNy/tQpDRb35LeEqBKZORRPBz
bE+jT+D/Fko7P29Cs/2bKIX2/LUnvCKwLTxzxG/CsOfy/a/z1NpwC29sL8nY
lSLSifPSHOJB8ScRZzoaGx8r0d/nGYUQxeQlDHt46vbYywhsNr5IBKXM/7NP
OJP/vQj82XkgglXxDgNquv7svHAVcy7SmsOMKjHsWWEQPE1CEFzTXskzi8E0
4LesVYvPrzu2/+JIAzbbnw+xLYdyPUaWkJzn5hXbP3kS+Hee/QFPSCuP
             "]], 
            
            FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 
             3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0,
              1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {
             1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGIZIGYCYlYhEftjPmEO/LEB943UpR1g/Ddtud1Gt2Ud
Lt17wD3ZEpNfcTF8QpqPNJzfobcif+ZncYc3j8ykDiiHOTCAgZhDGgiwIfi/
3r4+YHk5FIMPNr9aCs4/AwJA82F8sDlpKg4ctrND59uHYfBPaFpNOv1fBa4e
nT/fRufKrDRNhxO7dvSyHUDwO5Jj77jtD3X4+630wRxDdYcd65mf9ywJdXh0
fMbuaR9UHHp2ZnP+TAh1OHXYaW3mPQQfZj/YvAWY/PLD21xn+krD+Rdf8CWl
vxJ1aKm5sDnyJtR/Z0Qg+pjC4HwTYxBA8GHxsUHhbITJXnEH9PgCAIWlxdk=

             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 
              1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {
              0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 
              0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 
              3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGBwAmIQrd0udvPc9EiHZqG0W/9CJR1g/OUvPPT+L0Tw72jK
rvkvLOWwWiYqxbofwW+Y6tyd047JV3/SPO/sKUkHnU1z3y9vi3R46BrvOCtQ
0mF6nlDzgaZIh3dT+K79rxRzyNpTMlkiJ9Lhgfm+b2eMRB2MQSAYwe8/9FUj
Rh/BT7G+79+rHunQobcif2axuMNl3ySBCMVIh/VCOnzp/yQdlh/zNu+UjHRw
35X26ew0WYj5IpEOMaoRMuf+yDtoxABNFIh0uA8y75CCw6V7D7gn/4xwCC5R
mf6/QdGhdt22pPqPEQ4GqpNepB5RdNBVlP+Scy/CYYaQ5xejLCWH3xLF14W2
RTjsfqHtYXxMyeHjJaADGID+35AbmBas7DATBCwjHUDWslxTgfNtgM6evk4N
zgeHL6Omg7JGXc/OxxEOxzWtJp3+r+Uwf/XaG/FlCD4w9L8HTw7H4KengYCW
gwD31mWVixF8sPl3EfwTu3b0sj0Id5izSHnnH3UE38xmb9A0R004X2bN/+IZ
6yXg/ID7RstPPxKDmwc2Lk0Mbh+MD3MPOt8EHJGiDhuKMia+XRLucOFWrvgs
b1GHaZt4Ctc8RvBLC6V5H/xE8PtAAgIRcH4yKL79Efx/VypeqiVGwM2H8WH2
H76snSoZhOBLA5PrfWkEPyEkSH2BZIQDAwg8QPAh6V0CzoeEn5JDrb1p3K5C
BB9o+qOIfgTfI+CPRPHqCIeOrT9EGJSVHCxc3Yt+7o9wmL3c6klahaJDhPj2
iwy3oOlrggIqXwDBnw4K55sycP68rbf1TMQl4XyXCaAcKu4wFRR+vyMcFHYt
2Jd6TtRhlycPkzZ7pMOXDQHZs8RFHYC57Zg3MH+sYek+PPO/sIOaIccamSAE
//nvlR8v9SL4sPxdcTF8QpqPhAN6eQAAIMXGBw==
              "], {{
              99.83749999999999, 11.349600000000002`}, {99.83749999999999, 
              10.283999999999999`}, {99.2777, 9.499999999999998}, {
              97.73199999999999, 9.499999999999998}, {96.40039999999999, 
              9.499999999999998}, {96.40039999999999, 12.7094}, {
              96.40039999999999, 12.991399999999997`}, {96.40039999999999, 
              13.1383}, {96.64999999999999, 13.1871}, {96.75699999999999, 
              13.200000000000001`}, {97.11369999999998, 
              13.200000000000001`}, {97.35159999999999, 
              13.200000000000001`}, {98.31479999999999, 
              13.200000000000001`}, {99.83749999999999, 
              13.200000000000001`}, {99.83749999999999, 
              11.349600000000002`}}}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 
              1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}}, {{0, 2, 0}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["

1:eJxTTMoPSmViYGCQA2IQLaF/V4XtYpRDegn7RuOnUg4w/pl92k3/daUdyvfN
l9I/G+WwXkiHLz1O2iHfluv64hMI/pGvGjH9hxB8sP6DUQ7hnGLtxvLSDinW
9/1790c5/AeB+1IOSwqABqyOcnBoenR8xm4xBxmQ+sooh5lgIOrwfvkxb/NI
BP+Kb5JAhCWCfwYE3kQ6uMxTiTX+KQbne+xK+3S2TB7O79z6Q4TBWMHBZdvn
v1cORMH5M0DGXETwTYyB4DImH2Ifgq8KtC3tt5JDwA651tcroyDixqoOIOc3
+iL46WlA8C0SzgfTmyMdum08d6UdUoLzweG9VB7OF66cVHI2RdKhZ3qeUDND
FMQfZ0QcXqgZcqwJQfAZtNvFbq5D8GHxxR8bcN/ouaQDenwCAJJHx1w=
              "], {{
              106.49999999999999`, 8.299999999999999}, {103.67899999999997`, 
              8.299999999999999}, {103.77399999999999`, 10.184}, {104.817, 
              10.399999999999999`}, {105.14800000000001`, 
              10.399999999999999`}, {106.416, 10.399999999999999`}, {106.488, 
              8.70781}, {106.49999999999999`, 8.299999999999999}}}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
              3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
              3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1,
               3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxF1HtIU1EYAPCLlSao+N6y+dy1DB+rbWqi6GeiqSFmhojn0kPcHIgYJdlT
8JWJSpgOpmaiIWqMNDFdYSIVtvKVMiRTEzNLU1HRCJVa5256zweXw++Pe757
vu871z0165zMhKKoKPywq1SCI5GB+csN49J4GvYcujCh3u6hodulaCkhmgHL
+LYqmcIT0itW7oT5EhcuJWhcDhB//+QxufUDQUn77KKygwZFT3YlfwqBdXJQ
pzaJhrarioqVdwimadM85RwNZzU4QSsy5pV4glmeMqK0jNiwXxSxYbVDcN+v
Jau6Usg5521XZPVrd86B4bq7VKobPFpt7j8jQnB+JztETrnC5l/djcUA/H5I
zCv5QxfY9GIevPFFAPnf3qsmnUHPhisCVTWOmwLO+wWnlDV1TpzXqqzG9RM8
Y75gBKmx9OhAiyN0b+AE4QiGv2TyajIcQcQe1BmBuzbcXDLkYNx3KwWO89br
VA72nJfuZZaKa20485U6c0WjBbef8fxmkBY8E19eT9ypvd5bv00sk+OIYkBt
62OVHmrBeS6RKktvt+GsX7/wQjxrC3z2A8MZEKj111RtDmCmFqSk2TGgiay2
FB/jGfuxjEBuCD5EW5h4F/cTG/pfROzTUbfanESsi0u1Tk4gHvmTONcUgaCL
3T/mEOQsHjlxMGS3P33YvfVOIn8EfaW9+dInTpyTed2j1OPDnC+x9VYI4OI8
HpAgBMXsPEicAXc7sATXa5mtJ+7nz53W9TEZMp5bLoAFnE5dSGzYr5zYUM8x
YsNqykB6ttlzSZMr51q3X6FUqzvngV7vfH2cB+DqBc/oEfQseEdLAoQw2BDZ
tTG/O09bQmjH5enfx0AF8y9ie4WGk2zCo8RT7L3wJjbU0494BF+HXDGxLztf
/gxcsS3o+zhLw+nZW/bPRAx45Za9zPhAwyAbPgzQsbcLRGXEmlHqq0kM8XR7
ZoJ8Qwj4Nvz2kjKgso3ZFD8VGuc9jPjzMG5gJPHe/2Ktsc1tSEu89z/5D9CW
3Ic=
              "], CompressedData["
1:eJxTTMoPSmViYGAQBmIQbbHlRNm+89EOu19oexhvU3SA8dv1VuTPdEbwS23S
FhjZKTjc9++dnnco2mFvraxFuoq8w5vAHXKtm6Md7pvv+3Zmk6xDu9jNc99n
RzuYGIOArMOPuqw9Jd0IfnoaELhh8k+71qinySrC+eFNRx+eWY/gG+9qvjFT
SQnOd19zdDmDhrLDhrnvlx8Ljna4oym75v9lZQeQc+cnRTucAYEeFQdxljA+
3Soo/4yKw5LZRxQ2dCH4MP+h8z8sWq9w1kPJAT18ALkpiv0=
              "], {{
              112.49999999999999`, 4.36328}, {112.49999999999999`, 
              3.6601599999999994`}, {111.59800000000001`, 
              3.0999999999999996`}, {110.50599999999997`, 
              3.0999999999999996`}, {109.36599999999997`, 
              3.0999999999999996`}, {108.49999999999999`, 3.68398}, {
              108.49999999999999`, 4.36328}, {108.49999999999999`, 4.45859}, {
              108.52300000000001`, 4.923439999999999}, {108.97500000000001`, 
              5.2332}, {109.23599999999998`, 5.3999999999999995`}, {
              109.34300000000002`, 5.3999999999999995`}, {110.17299999999999`,
               5.3999999999999995`}, {111.15899999999998`, 
              5.3999999999999995`}, {112.49999999999999`, 
              5.3999999999999995`}, {112.49999999999999`, 4.36328}}}], 
            
            FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 
              1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {
              1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}}}, {CompressedData["
1:eJxTTMoPSmViYGAQA2IQ7dKd8/y3YKyDiTEIiDrA+GlgIOZQI7LO/eGjGDj/
Pwjcj3E4UCtrkb4EwU/yUrl4ukMCzoeYp+rQ8jpwh1xpjMMZMFCB8yHyKg5n
Frpu+7wUiQ8Ca2IcXvxe+fESL4JfYpO2wOieEpzfrrcif+ZkCTgf5j6F2z/r
spbEoLq/CJMP8+9Rb/NOx44Yhwu3csVneYs6LAA65+8aBB+s7jCCf0eFrXHq
aQQf7N/vCD56eAIAjqmjjA==
              "], {{115.59999999999998`, 
              12.493799999999998`}, {115.59999999999998`, 12.8648}, {
              115.30299999999998`, 13.100000000000001`}, {115.00599999999997`,
               13.100000000000001`}, {114.65999999999997`, 
              13.100000000000001`}, {114.39999999999998`, 12.8277}, {
              114.39999999999998`, 12.493799999999998`}, {114.39999999999998`,
               12.172299999999998`}, {114.67199999999998`, 11.9004}, {114.993,
               11.9004}, {115.36399999999998`, 11.9004}, {115.59999999999998`,
               12.1969}, {115.59999999999998`, 12.493799999999998`}}}], 
            
            FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0,
              1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {
             1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 
             3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3,
              3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 
             1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxl1G1IU1EYB/BloX3ICHE6LGzeTSFsvWhh0oee0pDQXLlI+3DvDZlTJDXK
NCtmaS/KGFhT1pIQAptFSpiFoIwClZBRBoPKYUtqhagYBL4Qts4945yH3IHz
4cfuueec//PsppTWFJWtV6lU68g0kRlF5tzJweRbNhn2ZSpDDcwWOhKgOHvg
bZ0F3Z5jO/fThKbriOduV9ky/Inc/kfeaJdZy12uPP5Y4G5xF49nnNKBeyw/
q/WwDPdDbdY/SXrQR9/oyEmXoc6YnFAZmwqDxzZFpcew86VCu2bD6c3zEncB
WX22F31zllzALkFDYHkyc0gHua9+r/quS2AOqN+ExgTozZu+El8nwS9l4yd6
WDJ96+4swPXHS7eUZG9DV8U1vx7/IHLT5wdEcNqWC71JunA+fSIsbJWvWlwC
kNMZ+nsjzdaX352/duioCF469Nzh3/UgBycEfwM6pIxGEXYuOqccMei8Z6Nu
1SeB+86unhqXQ8PN6nO+gmxQj2b7rTWr/6rv8kzaGREmJqsSH+Sr4b3gX7E2
oWMN/Q8XnGiaZx+6sYM0yEe0+vO7JdMsvp+Z7V8/k7Z347D4fz+9iPSXLM+i
956GO1xPLbdKGSd0UKYs+yHCXKxnj+upHrTk+JXxEveU0e6sPoKmZSD1b1Hy
u6jjLm4anfaGUrib4yyTfzs03Ox81Llo2o/qSLP7fyVp5e2QeD6kezxdRWha
v3J0GynPfivafDBgtLvRy9bK4dohfD8z29+nNHQrOtwfkWb5MrN8mVm+JcoB
XmJ+tH+C6EuerqTdapmbrt8u83yZWb7MLF9mdj5630S0YYp8IYJShNn9R7TP
L1SsYD7OavIHFmTu792dI9oD6FoH+aAUomk716PXfh//AU8fOJ4=
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 
              1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}}, {{0, 2, 0}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["

1:eJxTTMoPSmViYGCQA2IQ3TM9T6g5I8EhvYR9o/FTKQcY/8w+7ab/utIO1vf9
e6enJTisF9LhS4+Tdtgu1/o6MAXBf1glss49EcEH609IcAjnFGs3lpd22Dz3
/fJj8QkO/0HgvpRD4A6gAaEJDg5Nj47P2C3m0AtSb5PgMBMMRB2+Bz9eOlsH
wX+pZsixRgbBPwMCb+IdXOapxBr/FIPzPXalfTpbJg/nd279IcJgrOCgfPtn
XRbQPTA+WD4DwQcbm4nJh9iH4KsCbUv7reSgEdN/6GtIgoOJMQioOoCcf0AN
wU9NA4Jv8XA+mN4c79Bt47kr7ZASnA8O76XycL5w5aSSsymSDse9zTsdGRIg
7jwj4lAyWYIlTAvBb5jq3J0TjuDD4os/NuC+0XNJB/T4BABu8892
              "], {{
              130.49999999999997`, 8.299999999999999}, {127.67899999999997`, 
              8.299999999999999}, {127.77399999999999`, 10.184}, {
              128.81699999999998`, 10.399999999999999`}, {129.148, 
              10.399999999999999`}, {130.41599999999997`, 
              10.399999999999999`}, {130.48799999999997`, 8.70781}, {
              130.49999999999997`, 8.299999999999999}}}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1,
               4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}}}, {{{133.79999999999998`, 
              9.905859999999999}, {133.79999999999998`, 
              10.239799999999999`}, {133.51499999999996`, 
              10.499600000000001`}, {133.206, 10.499600000000001`}, {
              132.84699999999998`, 10.499600000000001`}, {132.6, 
              10.215199999999998`}, {132.6, 9.905859999999999}, {132.6, 
              9.53477}, {132.90899999999996`, 9.299999999999999}, {
              133.19299999999998`, 9.299999999999999}, {133.52700000000002`, 
              9.299999999999999}, {133.79999999999998`, 9.559769999999999}, {
              133.79999999999998`, 9.905859999999999}}, CompressedData["
1:eJxTTMoPSmViYGCQBGIQPRMEdiY4eKw5upzBQtQBxv/7MW6rEaO4w+wjChuK
diQ4/AcDSQfh5gOnFi5F8C8o3f5ZNwvBNwaByQkOSV4qF0+/kIDz17B0H545
XxzO1/ik8nKWpxhcvwlYQtRhd8lkCZZlCH5kivV9/7UIPtia9QkOMaoRMudq
RB0Cd8i1vt6Y4FBxeJvrzLUI/p/He7NSmUTgfAYQWCAAt+/DovUKZyW4HK5U
vFQznJHg4H2C3XZ2KCecf0dTds3/zxw4+fGOszZmVHE4qBtyrJGB+5/dASTN
MQfBl299HbhjHoIPC1+RykklZ1X4HdDDHwAmcb2L
              "]}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
              3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 
              3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGDQAWIQrXz7Z12WSZKD04RmoTQpCQcYP8lL5eLpDgmH7pzn
v1caIvg90/OEmg0Q/Mu+SQIRugi+Rkz/oa86SQ5ZTSt+M6RIOGyc+375Me0k
h+UvPPT+M0o4HPc273TUSHKQXfO/eMZ5MQdjEJBPclgBkj8o6vAVZIAogj8T
BDgx+Z02nrvSLknA+WuEdPjS90k7LD8GtADoXmdO49z/pxQcQM7/aJXksCe/
5u3Mq8o4+WdAgEfFQbtd7OY5cwR/84myffPNEHwQV8oYwZdvfR24wyjJwQUU
fr+UHf5eqXipBrRf5dqjYIYeZYePl4ABBAyPUpu0BUZ1Sg43zn0PfqyY5LCy
1krOeIEC3P13zfd9OxMkC+cb72q+MXMTQj6jhH2jMauyQ/DjpbOPfEl0MAEH
nKoD0DKONWcQfMeEpxeUZiP4YP2ZiQ6paUBwTBHO//sfCPbLwPk3pWsSjaZK
OEiwhPHp1iVC/HdGxGEySGApgp8sEGG5ZQ+Cv74oY+LbG1D+G1EHUPB9/5zo
sF7hbITJXgmH6BTr+/4/Ex1iVCNkzsmIObQAg0uONQmuX/+uClujKIKvDvSO
jBaCD0uPb9pyu42qxR3Q0ysAo6BAqw==
              "], CompressedData["
1:eJxTTMoPSmViYGAQAWIQvflE2b75nxIderxesZh8lHT4e6XipdrFRIcNCmcj
TGTFHEDSUpsTHSoOb3OduVbUIV+o+cCppQh+h2PC0wtdCL4xCDQnOrxpy+02
2i0B5/95vDcrlUkazv+yISB7lrisw/nvwY+Xdic63F50hm0mi6LD68Adcq3T
Ex2cxa9sPxOp5KDC1jjVeTnQvOKtor+5VRxu/6zL2rMn0eEMGKg4OHfnPP99
FsEHm/8Zk++qWso0a4cinM/At9DrbJw8xP1A//dHdPszbpCG893XHF3OsEMK
rv79FL5r/yulHNDDCwBAspNm
              "]}], 
            
            FilledCurveBox[{{{1, 4, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 
             1, 0}, {1, 3, 3}}, {{1, 4, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {
             0, 1, 0}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJ+KN0hdvPc9/3JDu+n8F37f1LJAcY3MQYBZYcjChuK
MnYi+B4Pq0TWbUbwN58o2zf/UhKc/wAo7X4WwU9PA4JjmPzVLN2HZ55XgvPB
dJqSg3mnY8LTMwg+zHwYH2Y/jC+tf1eFbSeCD3M/Oh/df/yxAfeNjsvA+TNm
goAs3L8wPsw+GB/mHhgf5l8YH+YfdL6J45VahksycP5/MJCG+xfGh5kP48Ps
h/Fh/oXxYe5H58P8BwAy3Oad
             "]], 
            
            FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 
             3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0,
              1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJZIGYC4o+XfJMEHqQ4mBiDgKgDjJ8GBmIOSwpsua5f
RvDL9s2X0t+I4DOAwIYUhzdtud1GvxH8mSCwUwLO19daKXyBRQvOz+H8uSB9
MoJ/IT+e/dxMLQeRde4Pq1Yg+EUZE9/WzE9xOAMCbzQdkgQiLLf0pDj8BwMN
hz0lkyVY0jD5EPdpOMi1vg7ckYfgg93ViOCDqWkpDl933ur6+xTBbxZKu/Vv
qwSc7zIBKPJLzAHkHPupCP9XvFQz5ChB8HeALMzA5MPCd8sJYAgWAf13K1d8
lreogyVIYDqCvxIUAUsQ/IWu2z7/3YDg19ibxu26iuCjxx8ArwzCUQ==
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJJKD0TBFamOvwHAXslBxj/wT6+OcZOKg7nvgc/Xro8
1SEl9o4bs4WaQ55Q84FTM1MdrO/7907n03DYUzJZgqUr1UFmXpzmaQEth5YD
pxa65qU6XMiPZz83U8uBY41MVEo0gi+lf1eFzRXBZwnj092kmergY97pmPBU
06FhqnN3jnSqw1I/B+HEx+oOBbZc1xcLpDrYvbi55leMmsMZEOCB8u+owPkw
98P48rsW7Es9J+9QlDHxbQ1/qoNA9kdNBjcZh0u+SQIRsqkOX/Z93Jp+TcJh
5UegiE6qQ5KXysXTGqIOTy4o3f7pluqwhqX78Mz/wg5xuzx5mKIR/N7pwBCo
QfA3zX2//Fh/qkNO04rfDC1iDjnPf6/8OCvVodPGc1dakKSD67bPf6+sSHVo
1VuRP/OzDDx8Pyxar3D2hoIDeviD3d+T6vD3Y9xWo4UIfjfIPCZFOP/DhoDs
WeFyDj0g93SkOuyvlbVIT5F2aHkduEOuMdXB1PFKLYOQmMMPYPTNzkh12JN4
e9EZNVGHpyD/RSH4QN9pt/sh+KDgsjdNdRAEhRebmEMCSINuqsP5W7nis7yl
Ie4FxlcPyD1GcnB+aNPRh2feK8D5MPfD+FPaW6Muz1GB8wVebl/PnK7moNMu
dvOcfqoDKFosr6g7PAAmqzyzVAdjECjWhKQnL2D4cv5ckG6sBXc/jP9VI6b/
UCaCbwBKcA2pDqBkO3uJpgNI+7b2VIdCad4HuhPU4eEHDC2XTH01OF93woIf
hm4qGOEPAGyNdVc=
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJJKJ0GAQ7/QcBeyQHGf7CPb46xk4rDnCMKG4pS0hxS
Yu+4MVuoOdjc9++dHpbmYA2i+TQcOhwTnl5wS3OQmReneVpAyyGgd3qekHaa
w4X8ePZzM7UcrlS8VDOUQPBf/F758RIjgn9B6fbPumepDj7mnUCTNB18kwQi
LG+kOiz1cxBOfKzuYMt1fXHB2VQHuxc31/yKUXOYCQInofw7KnA+zP0wvvyu
BftSz8k7OJjG7fI8k+ogkP1Rk8FNxmGBlP5dlVupDl/2fdyafk3CoWzffCn9
l6kOSV4qF09riDpsnPt++THmNIc1LN2HZ/4XdtBpF7t5ThzBj0oB+twSwW/I
2lMy2SfNIadpxW+GFjEHyy0nyvaFpzl02njuSguSdBBqPnBqYWqaQ6veivyZ
n2Xg4fth0XqFszcUHNDDH+x+zzSHvx/jthotRPC7QeYxKcL5HzYEZM8Kl3OI
BLnHNc1hf62sRXqKtEPgDrnW17ZpDqaOV2oZhMQcQNGXoZrmsCfx9qIzaqIO
m0D+E0fwgb77HsyN4JsAg4vnU6qDICi82MQcdEAaXqU6nL+VKz7LWxriXmB8
9YDcYyQH54c2HX145r0CnA9zP4w/pb016vIcFThf4OX29czpag4/gh8vnf0m
FRLvV9Qd1sgAQ/hzqoMxCBRrQtITOzB8OX8uSDfWgrsfxj/0VSOmXw3B/wtK
cED/fweZu0TTAaS92SXNoVCa94HuBHV4+AFDyyVTXw3O152w4IehmwpG+AMA
oxlocA==
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJJKA0GCukO/0HAXskBxn+wj2+OsZOKg0ncLk8euXSH
lNg7bswWag5XKl6qGQqkO1jf9++dzqfhoHT7Z10WQ7qDzLw4zdMCWg5AWY41
T9IcLuTHs5+bqeWQJ9R84NRFBL9hqnN3zm4EP2tPyWSJBWkOPuadjglPNR1e
/F758dLENIelfg7CiY/VHW4sLrDlak9zsHtxc82vGDUHE2MgaIby76jA+TD3
w/jyuxbsSz0n73Dj3Pfgx61pDgLZHzUZ3GQcLLacKNs3Oc3hy76PW9OvSTgI
RFhuObEozSHJS+XiaQ1RiDv2pjmsYek+PPO/sMMRhQ1FGRcR/C9/gSHwCcGX
YAnj02VLd8hpWvGboUXM4YpvkkCEYLpDp43nrrQgSYc1MlEp1vLpDq16K/Jn
fpaBh++HResVzt5QcEAPf7D7mdMd/n6M22q0EMHvBpnHpAjnf9gQkD0rXA7i
nn9pDvtrZS3SU6Qd3gTukGv9nuZg6nillkFIzCEWGH1M99Mc9iTeXnRGDeq/
iwg+0HcT3x5B8EHBtXR1moMgKLzYxByOeQM1LElzOH8rV3yWtzTEvcD46gG5
x0gOzg9tOvrwzHsFOB/mfhh/Sntr1OU5KnC+wMvt65nT1Rwmvq2xN12W5gAK
Nssr6g6u2z7/vbImzQHkTeNiTUh6OpDmkMP5c0G6sRbc/TB+TP+hrxoPEPwZ
oAT3Lc0B5I3ZSzQdNIDaZYDhUyjN+0B3gjo8/ICh5ZKprwbn605Y8MPQTQUj
/AHmEEIN
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJJKH0GBO6kO/wHAXslBxj/wT6+OcZOKg6M2u1iN2+l
O6TE3nFjtlBzWOi67fPfM+kO1vf9e6fzaTh8WH7M23xvuoPMvDjN0wJaDkDZ
KxUL0x0u5Mezn5up5WADUteH4PsmCURYViD4Fp2OCU9j0h18zEEMTYctJ8r2
zfdLd1jq5yCc+FjdYUmBLdd153QHuxc31/yKUXNgAAEHKP+OCpwPcz+ML79r
wb7Uc/IOS2cfUdjglO4gkP1Rk8FNxoG1capzd0C6w5d9H7emX5NwuKPC1jg1
Pt0hyUvl4mkNUQcJljA+3ap0hzUs3Ydn/hd2mPi2xt60D8E/cAoYAusR/KcX
lG7/PJTukNO04jdDi5jDAin9uyrn0h06bTx3pQVJOlS8VDPkAIZnq96K/Jmf
ZeDh+2HReoWzNxQc0MMf7P4D6Q5/P8ZtNVqI4HeDzGNShPM/bAjInhUuB3HP
7nSH/bWyFukp0g475FpfB25JdzB1vFLLICTmoAWMvnOz0x32JN5edEYN6r8+
BB/ou7hdjQj+HGBwFWWkOwiCwotNzGEKSENiusP5W7nis7ylIe4FxlcPyD1G
cnB+aNPRh2feK8D5MPfD+FPaW6Muz1GB8wVebl/PnK7mELfLk4cpOR2SLq6o
Owg1A32Ume5gDALFmpD0VAsMX86fC9KNteDuh/E1YvoPfZ2D4KeAEubmdIfv
wY+Xzl6i6fAFqP3lrnSHQmneB7oT1OHhBwwtl0x9NThfd8KCH4ZuKhjhDwCt
KV3k
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJ5IGYC4jQQMMtwCOMUazeWF3WA8dcrnI0wkZVwCNwh
1/paN8PhPxhIOkx8W2NvKofge/IwabcLIfjVIuvcH3JlOCR5qVw8/UICzl/D
0n145nxxOF/jk8rLWZ5iDhNA5gH1mxiDgKjDV42Y/kOyCH6y9X3/XmUEf9Pc
98uPqUPN7xB1WOv+sEpEK8NBMPujJsMxUQcVtsapztoZDmpPmuedfSUKcRce
/j8oXxXKPwMCOlD32iP4fx7vzUplQvD1xT/OnfFV0GF6nlDzAaUMhx4bz11p
RnwOIO4pwQyHkuUlG/6d53TwTRKIsBTIcGgSr2XNbON0kIlKsb7Pn+HgfYLd
dnYogn9HU3bN/88ccH6846yNGVUcDjfOfQ9+LAgLX3aHqc7dOc+FEXxw+Igj
+LD4E6mcVHJWhd8BPX4BS6ngRA==
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0,
              1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGIzIGYC4iNfNWL6D2U67MmveTszVMEBxldw/Jh8plfB
oSRj4tua/Uj8yRIsYfsQ/C9/r1S83IXge/AwabcD+ckRR6Vnpis4fAcZtzPT
ocQmbYGRn4KDf5JAhOWKTAf+2ID7Rs8lHM6AQEmmwwPzfd/OGIk66Gya+365
H4LffODUQlc1BN8YBJgzHUJ+A01skIDz94LcnyoP5zuLX9l+plLBIXaXJw8T
e6bDkvv7+OZsVnFQM+RYI2OU6bDihYfe/4fqDv690/OE3DMd+p58kr+Ur+nw
GeSfrEyIu85oOTgmPL2g1I/gg7wnthPB3wB07rHTmQ5cbqqlTLM04Pw7KmyN
U5XV4PwOkEFNqg5bTpTtm38q02HG/wl1v3+pwPkPgM4zfoTgv+HdZzBzlYpD
uCVQ5BwSn09309zzCL5Ou9jNc5cRfGBof9W4kunw5PiM3dM2qDiwhAE1XM10
AMaivamcKiQ+3mZCzNHXhvPT00BA26EFFN6viOf/B4HnCP76ImCCeZLp4NKd
8/y3pjYkPQD9I2uR7pKpr+nwHxi8anszHRIOX9ZOnanl8GTp7CMKKxD6f9Zl
7SnpRvD3zZfSv2uB4IPj93GGw4FaoIkqanD+/4r1UTMbFOB8ZhmnqbP+SjiA
vPmeP9NhDUv34Zn/hR1AyeuYO4IPTs9pCH7L68Adco2ZDkLZHzUZlok6gJR7
T4emV3YJh3qg8ybvAManjeeutEnS8PxivOZR7xllRP6B5ScAx5+Khw==
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 
             1, 0}, {1, 3, 3}}, {{1, 4, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {
             0, 1, 0}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJ+KB3yeOnsIznZDu+n8F37f1LJAcY3MQYBZYcJb2vs
TdMQfJF17g+rEhD8hqnO3Tn1WXD+eqC0SBWCD6aLMfmrWboPzzyvBOenp4GA
kgNLGJ/upkoEH2Y+jA+zH8Z//nvlx0upCD7M/eh8dP/xxwbcNzouA+fPmAkC
snD/wvgw+2B8mHtgfJh/YXyYf9D5Jo5XahkuycD5/8FAGu5fGB9mPowPsx/G
h/kXxoe5H50P8x8Ad5TXzQ==
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJJKH0GBObkOPwHAXslBxj/wT6+OcZOKg4s2u1iN2fl
OKTE3nFjtlBzWOC67fPfnhwH6/v+vdP5NBzeLz/mbV6b4yAzL07ztICWw9bP
f69UJOY4XMiPZz83U8vBBqTOD8H3TRKIsLRA8M07HROeyuQ4+IAZmg5bTpTt
m8+X47DUz0E48bG6w5ICW67rzDkOdi9urvkVowZx5/9sCP+OCpwPcz+ML79r
wb7Uc/IOS2cfUdjAlOMgkP1Rk8FNxoG1capzt0COw5d9H7emX5NwuKvC1jhV
PschyUvl4mkNUQdxljA+XaschzUs3Ydn/hd2mPC2xt7UD8E/cGqh67Z8BP/p
BaXbP5tyHHKaVvxmaBFzmC+lf1elL8eh08ZzV1qQpEP5SzVDDmB4tuqtyJ/5
WQYevh8WrVc4e0PBAT38wXR9jsPfj3FbjRYi+N0g85gU4fwPGwKyZ4XLOewH
uac6x2F/raxFeoq0ww651teBJTkOpo5XahmExBx0gNF3LjrHYU/i7UVn1EQd
JED+80Pwgb6L2+WI4M8BBleRRo6DICi82MQcpoA0KOY4nL+VKz7LWxriXmB8
9YDcYyQH54c2HX145r0CnA9zP4w/pb016vIcFThf4OX29czpag6xuzx5mJRz
IOniirqDSDMwhDVzHIxBoFgTkp5sgeHL+XNBurEW3P0wvkZM/6GvMQh+Cihh
Fuc4fA9+vHT2Ek2HL0DtL6tyHAqleR/oTlCHhx8wtFwy9dXgfN0JC34Yuqlg
hD8A7OaCIg==
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}}, {{{
             231.49999999999997`, 5.893750000000001}, {231.49999999999997`, 
             6.252339999999999}, {231.20299999999997`, 6.499999999999999}, {
             230.90599999999995`, 6.499999999999999}, {230.547, 
             6.499999999999999}, {230.29999999999995`, 6.20273}, {
             230.29999999999995`, 5.9058600000000006`}, {230.29999999999995`, 
             5.547270000000001}, {230.59699999999998`, 5.300000000000001}, {
             230.893, 5.300000000000001}, {231.25199999999995`, 
             5.300000000000001}, {231.49999999999997`, 5.59688}, {
             231.49999999999997`, 5.893750000000001}}}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJJKP0fBPbnOoBpeyUHGP/BPr45xk4qDqZxuzx59uU6
pMTecWO2UHO4UvFSzXBDroP1ff/e6XwaDiq3f9ZlLch1kJkXp3laQMvhhZoh
x5qWXIcL+fHs52ZqOeQKNR84VYjgN0x17s6JRvBz9pRMlnDIdfAx73RMeKrp
8Pz3yo+XDHMdlvo5CCc+Vne4urjAlks918Huxc01v2LUHEyMgUAZyr+jAufD
3A/jy+9asC/1nLzDjXPfgx+r5joIZH/UZHCTcbDYcqJsn3Guw5d9H7emX5Nw
EIiw3HLCKdchyUvl4mkNUYg7YnMd1rB0H575X9jhiMKGooxCBP/LX2AITELw
JVjC+HSX5TrkNK34zdAi5nDFN0kgYmOuQ6eN5660IEmHNTJRKdbA8GzVW5E/
87MMPHw/LFqvcPaGggN6+IPdvzjX4e/HuK1GCxH8bpB5TIpw/ocNAdmzwuUg
7pmX67C/VtYiPUXa4U3gDrnW6bkOpo5XahmExBxigdHHVJ/rsCfx9qIzalD/
FSL464syJr5NQfDPAoNrqXeugyAovNjEHI57AzW45Dqcv5UrPstbGurOXIce
kHuM5OD80KajD8+8V4DzYe6H8ae0t0ZdnqMC5wu83L6eOV3NYcLbGntTt1wH
ULBZXlF3cN32+e8Vn1wHkDeNizUh6SkBGL6cPxekG2vB3Q/jx/Qf+qrRgOBP
zwMmuGm5DiBvzF6i6aAO1C4DDJ9Cad4HuhPU4eEHDC2XTH01OF93woIfhm4q
GOEPAN/PbV8=
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
              3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJx11HtIU1EYAPD5wEekBJYbc825zXTL57aUVOibtmz5GBqJRZia05juCqU1
oqTC0Fj9paVThg8SE0aFaVqpRBlITTGxqLQ0NGQl2TBmK2Wde2+7B4oOnD9+
cM93zne+79yw4spcrReLxfJAMwNNTzRrv+QM8qsJUCinz7N6+eD2o6KZTmuC
EPZv9txZl0fAVOUx3wmTGKoaON55MdiLXa2jAg52xdKvHrsPAfXKwk+TnmKw
kmNdDyuNga9dh0WMy/2d7WXySBgV3D15IoCAm9kQVOQVCd83pg02LgEuakQA
oDDCUOwt+bv7xg5gp8xprjWVEsCLfS/2+ShhjE4ZGC2TMo6oufqgXC0F8nhT
WgLKSskhhWWU7uXj//deI8qoCJu6jwLsRnIjNQH57IGXrA8SiOo1r3QnEHSe
VgmUkAeOwva18I6UBGFnJl5RFnoQ0Dd2eqQtSQrh8X4W3k89E//C9TRjxRp2
7ePnHSrH/62Qo7H6rxNThnNvKLEtl3LU5nkJ43TLs27WGyHjJuOPbKsOW0uG
2yeEqLrgtxNr2Of27Cp46MR2n59KL1MI1g7V/dUNFD+82rOlWQizzhrdkB8B
k+/07JZWEd0nqN4VVD+IYYhssBhsKm4qtsU+lVWcSUBrd9JiqZ8I1lG4Kg0B
PQ6bwdoupNejfiWPLb8XRq9HVpH71wsYry8M67SpoYzjyO9PbWd8NDyfNzHE
hfG1gwtdGX/2a+YAWb7kNALM/TMxiqZgINNXKwiYTxxxWGXb6HqJsKn72IR9
ZqSNG2vXQxzbbm6uZtP1+6wHl72gXxYWAq8Mth3xy3oYUJkCZDYuTApnnDVf
9SAYU/rLx7kgRtR9w6bemwN7/uzW2+monyhnhTCm3wuPMZVnKZ++L1Qvqs7y
UCa+2+SzumjDLklGD2pOD5o5WfeLJ3zGSwYraGd5jFc67wjGBzn0e0P9YfE2
PjW5guj6iwnGhwKje80abPf/py7mVqWpgQN//59+A0CACvI=
             "]]}, 
           Thickness[0.004077139478941575], StripOnInput -> False]}, {
         ImageSize -> {245.27543711083436`, 16.338709838107096`}, 
          BaselinePosition -> Scaled[0.32439307852814453`], 
          ImageSize -> {246., 17.}, 
          PlotRange -> {{0., 245.26999999999998`}, {0., 16.34}}, AspectRatio -> 
          Automatic}], TraditionalForm],
      PlotRange->{{0, 1.}, {0.09, 0.18}},
      PlotRangeClipping->True,
      PlotRangePadding->{{
         Scaled[0.02], 
         Scaled[0.02]}, {0, 0}},
      Ticks->{Automatic, Automatic}], 
     TemplateBox[{GraphicsBox[{
         Thickness[0.03656307129798903], 
         StyleBox[{
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3,
             3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3,
             3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
            3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJdIGYC4plgoOhgvOZR7xllBQcY/6MmwzHjDARfwfFj
8pleBYfdL7Q9jMMQ/PfS8dVpkgj+nQ25gWnCig6n92k3/c9F8B+4xjvOclRw
UPaftG7mHQWHHcFWEf+XSzi0CKXd+mcq4/DAfN+3M0aiDu+m8F37P1Mczk8D
ATcRVH4am0OMaoTMORtxOD/97Tbus1uV4PyaTxsCsndpOqx44aH3X1HE4QwY
aDmcArmrVxzOr7j/45Zxtwycn1HCvtG4VAFizjINB2a+hV5n3yk4eOyvlbVg
V3Vw5DTO/f9LwcHuxc01v/aowPlvePcZzFyl4nBbU3bNf2dFOB8Wfuj8Ke2t
UZf3IPg3GovdppipwvkuMq8fmd3SgvNTzsR6n3DXhvPTwQ7UdjgbLFtkHIPg
81/7b3nGHMEHh7uhIiQ8orQdFE8AXcyr6BAhvv0ig5y2w57E24vOHJN3yBNq
PnDKUdNBtN14/6zFsg45nD8XpE/WctjuOpPXKFMKbh5Y3z8xOP9NW2630Wwe
ON/EGAR+21+4GvZGf7Y6nA+LHxj/TcUZh9QaaQeVa4+CGc7wOKxh6T48878w
3HwYPzXiqPTM43JwPsz/5v6lJ85+kILzYekXAOt7OTI=
            "]], 
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1,
              0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 
             1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {0,
              1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {
             0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}, {1, 3, 3}}, {{1, 4, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxl1HtIU1EcB/CZUvjPkOlePnCbc7r33eajROi3bGgp+ao0sDRrV8lkkUIG
Qg8FjRCXlY9VNqOYgaRIBmmNfCW5tFWipoaPLEaglYyytN12HTsj/cHl8vnj
fM+5P37ncvN1GdptFAplj/Mh38ybY76FNCVU0PApxyE2uG2yJcmIFo9nhCFt
hH8gEGR9UyAHNR8TWqxbHbFY0TwyzAbvw1Rp54gC5jW5akM6G64tle+ONitg
+QZ1nDjPgBfDLZonJxQwF2v++VpJd+UTGPKnocae+jMeD3A6zhamY1Ata9U1
lTBBGFdnubATg3aahFrgYINm8rt9PxuDxG58ZaQ+BKrs0xOXvDHICc8OHl0P
BX2OI+HPkhxmybw+DqznFA86lHLILOU3EBe5kDoVVH58RQZYeJ1NO8AFqy53
x+gRGTTS9tmVp3iQKCO4fxlS6LGJk1QveTBBW1G/weUw01GcjmeGQdNGYfCs
9DrLZ5yPHD+bWtPwSIC80V8vIVSZsoaVlTIYIj+EEEFe/3uxli1GDpR/5G/3
4m9xAU6WCObM1Nuqyx4rVc7KFCAb4yVjBlwAt++FPV2P8Dgm/nlGvVqIHNxG
lDS2s5DTZpUmywID5W3E4Qy0n9vu82x2FLlORQfb2sMf72r4YJ0qZhqS6UBf
syy/qhAgB5Dti45AniT7+cXjanXeZ+uCEDnLOU53dCKU77Z7/0qfwVrFLyFy
cuwVdZ4mErnI97exQBUJFLLmPHbNOwvZ1T8epOT7Ze+yi5CHahXnpPNi5Afk
ul4JVHetBlDCeCDVG1cVuBRumeIW8TIuSLih9tMxMtd86Tn/28/jBnIsPgQj
N3dNy6KYbOS9evKGMl39S5ADp9to1o7SoYYMuisHe0dakYFJh4O9rfcPpGHQ
5nO1v4nwh6PO8e5c8/hx7Grfya8KZPf9LnubpcdTWLD5f/APZci24w==
             "], {{
             15.537500000000001`, 11.349600000000002`}, {15.537500000000001`, 
             10.283999999999999`}, {14.977699999999997`, 9.499999999999998}, {
             13.432, 9.499999999999998}, {12.100399999999999`, 
             9.499999999999998}, {12.100399999999999`, 12.7094}, {
             12.100399999999999`, 12.991399999999997`}, {12.100399999999999`, 
             13.1383}, {12.35, 13.1871}, {12.456999999999999`, 
             13.200000000000001`}, {12.813699999999997`, 
             13.200000000000001`}, {13.0516, 13.200000000000001`}, {
             14.014800000000001`, 13.200000000000001`}, {15.537500000000001`, 
             13.200000000000001`}, {15.537500000000001`, 
             11.349600000000002`}}}], 
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1,
              0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 
             1, 0}, {0, 1, 0}, {1, 3, 3}}, {{1, 4, 3}, {0, 1, 0}, {0, 1, 0}, {
             1, 3, 3}, {0, 1, 0}, {1, 3, 3}}, {{1, 4, 3}, {0, 1, 0}, {1, 3, 
             3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGCQAmIQXZNoFGqwy9IhRjVC5twfWQcYf3WtlZzxBwUH/jnG
i7Zct3BQvvYomOGOkkNToOfchjRzh4qIFaZntZUd1nTfzmDot3B4y7vPYOYs
ZYc0MLB0EP19+t1JZVU4X2ZenObpD2pw/t/U708SGTUdYnOP/tsUbeFwXNNq
0un/Wg5bzH8cSjllBufbVgItmmuEwU8Hm6PloNhXWih9F8EPkBPL8j1sDOe/
2L6e+fkZY4c5i5R3/lFH8M1s9gZNc9SE82XW/C+esV4Czg+4b7T89CMxuHkQ
d4vB7YPxYe5B55sYg4Cow0a9vMWMMuZw/nWhT47nl1nA+bDwXvntZcWZBEkH
9PgAAF+ZqaY=
             "], {{24.300399999999996`, 11.5043}, {
             24.300399999999996`, 10.705100000000002`}, {23.6922, 
             9.700000000000001}, {22.394899999999996`, 9.700000000000001}, {
             20.700400000000002`, 9.700000000000001}, {20.700400000000002`, 
             12.715199999999998`}, {20.700400000000002`, 13.1148}, {
             20.723399999999998`, 13.200000000000001`}, {21.237899999999996`, 
             13.200000000000001`}, {22.710499999999996`, 
             13.200000000000001`}, {23.8789, 13.200000000000001`}, {
             24.300399999999996`, 12.158199999999999`}, {24.300399999999996`, 
             11.5043}}, {{24.599999999999998`, 7.4632799999999975`}, {
             24.599999999999998`, 6.4894500000000015`}, {23.8855, 5.6}, {
             22.737899999999996`, 5.6}, {21.2391, 5.6}, {20.723799999999997`, 
             5.6}, {20.700400000000002`, 5.683979999999999}, {
             20.700400000000002`, 6.0808599999999995`}, {20.700400000000002`, 
             9.399999999999999}, {22.8898, 9.399999999999999}, {
             24.014099999999996`, 9.399999999999999}, {24.599999999999998`, 
             8.389059999999999}, {24.599999999999998`, 
             7.4632799999999975`}}}]}, 
          Thickness[0.03656307129798903], StripOnInput -> False]}, {
        ImageSize -> {27.351412204234123`, 16.338709838107096`}, 
         BaselinePosition -> Scaled[0.32439307852814453`], 
         ImageSize -> {28., 17.}, PlotRange -> {{0., 27.35}, {0., 16.34}}, 
         AspectRatio -> Automatic}],GraphicsBox[{
         Thickness[0.03571428571428571], 
         StyleBox[{
           FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3,
             3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1,
             0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1,
             0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3,
             3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1,
             0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3,
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGIHIGYCYtnlLzz04tUcTIxBQNQBxk8DAzEI/74qnP8r
JvfoPyEVOD+86ejDM/+VHQLuGy0//QjBl1nzv3jGegk438xmb9A0R004f84i
5Z1/1LXg5qWDzdOC24fCB7oHnX9c02rS6f9aDs4TmoXSVinB+cZrHvWeUUbw
Sw9vc50pq+Sw3aHp0fEfWg7K/pPWzXyj6OB/cWLMv2Yth/KL4RPSciQdTByv
1DJsknQI5xRrN/7P61CTaBRq0KXl8OOWsTdTCC/cPA6LFi1TawT/Okvgd0YO
bjg/Vu+RtWH2D3t0Psz9Jw47rc2M+wPnnwEBH1a4/2aCASs8fGB8WPjB+GtY
ug/P/C8J58PCG8aHxQ/MfnQ+LL4PdO9rMkn+a3/hVq74LG9RhyW3lj82PMzs
AONb+JeeOFvABudPSBTNT5HjhPN7I7r9GQ344PzP+z5uTQ8TgKcnGB9m/38w
YMfgb3edyWu0UgLO1xf/OHfGV0k4f8LbGntTOS0H9zVHlzNIcMD5siB/94s7
TK0NZ/kvLeYQ8rvEJu2AuMNNaWAMThV1yCxh32j8VBzuntWgcIuXgPPB6eMs
gi+U/VGT4ZmEQ4/XKxaTQlGHExu6zI30JR0uvOBLStcSc9jzQtvDOE0JHl8w
Piz8YXxYfkh/u437bKgS3L/g+D6jgMg/oPTGj8mHuUf52qNghjkK8PDdk1/z
dmarEpwvEAu0yVwZzndXLWWa9QLBD7gFDIhLqnA+en4HACBrqrc=
            "]], 
           
           FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1,
             0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1,
             0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1,
             0}, {0, 1, 0}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJFIGYC4v2nFrpuazZycFUtZZq1Q8GhYE337QwHBD9f
qPnAKUUjhw69FfkzJ8s4qBtyrJH5ZeiQBgZiDnNtdK7MOqYP5x9pWx5+apMu
nP9l562uv0t14PwL+fHs52bqOLDIOE2dtRfBn73c6klahAScz75GJirFWhOV
L60FNy8dbJ6WQ0rsHTfmHXpwPsj5DPn6GPzjmlaTTv/Xcniapf1t+l49hyX3
9/HN+azlcEBcLZh1sQ6cP+UbW/yMM9pw/gLXbZ//iiD4vkkCEZZfNOD8v6nf
nyQmasDNh/Fh9ov9Pv3u5GMEP+HwZe3UnVpwPsviSVaMZ7Uc5ixS3vlHHcE3
s9kbNM1RE86XWfO/eMZ6CTg/4L7R8tOPxODmwcIXZh+MD3MPOt/EGAREHbL3
lEyWMDGC8wGw9N+m
            "]], 
           
           FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1,
             0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3,
             3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1,
             0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1,
             0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGIdIGYC4pp125LqZ1o5uKqWMs3aoeBwBgR8EPwlk6wY
fVmsHBwmNAul3ZJ0mO7cnfN8t6VDGhiIOZw67LQ2c585nA9Wr2IG56+xC4/e
ON8Uzt/aUnNh80xThwjx7RcZ9iH4ryrOOKTGSMD55V7sr/+fUXK4UvFSzXCF
GZzvdYLddvZRczgfbOwzc4f3i9YrnOVA8M39S0+cvSDvIO4R8EfC2AKDH3hL
uibRSA2uHp3fsTz8lJGKCtw+gScLWmamKcPdA+PD3IvOV3D8mHzGVhPOB+vj
0IKHx5+Y3KP/jLQcWqMu73kMDC8Y/9OGgOxZ283hfGH7Y3e2lljC+SYN2x2a
Llk6WFw7mmvCoOnwHwwsHVgXAwO+VxUefzC+TWXECtO/lg5TvrHFzzij5XCm
3mN/ba0xBh9mfsQpoyMb9yH4taD0sdIEzg+QE8vy3WzisMB12+e/XzTh/OAS
len/BRB89U8qL2etlIDzQ95e/jjjoRjcPFh6gNkH48Pcg843MQYBUYeCjIlv
a+St4HwA+GEyBw==
            "]]}, 
          Thickness[0.03571428571428571], StripOnInput -> False]}, {
        ImageSize -> {27.998017434620174`, 16.338709838107096`}, 
         BaselinePosition -> Scaled[0.32439307852814453`], 
         ImageSize -> {28., 17.}, PlotRange -> {{0., 28.}, {0., 16.34}}, 
         AspectRatio -> Automatic}],GraphicsBox[{
         Thickness[0.03745318352059925], 
         StyleBox[{
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1,
              0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 
             1, 0}, {0, 1, 0}, {1, 3, 3}}, {{1, 4, 3}, {0, 1, 0}, {0, 1, 0}, {
             1, 3, 3}, {0, 1, 0}, {1, 3, 3}}, {{1, 4, 3}, {0, 1, 0}, {1, 3, 
             3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGCQAmIQ/fdj3FYjR0WHGNUImXN/ZB1g/NW1VnLGHxQc5iy3
epL2Q85B+dqjYIY7Sg7teivyZxpLOlRErDA9q63soCv+ce6Mq7IOb3n3Gcyc
pewwEwwUHER/n353UlkVzpeZF6d5+oManP839fuTREZNBx7/9VNSOWQdjmta
TTr9X8vhYPe+JpPDYnB+zYumX9Msf9ij89PTQEDLQef3Oo5/5n/g/LLD21xn
+rI6wPguE5qF0maxOsxZpLzzjzqCb2azN2iaoyacL7Pmf/GM9RJwfsB9o+Wn
H4nBzQMblyYGtw/Gh7kHnW9iDAKiDuqfVF7O4pRwgPFbFdhVz5jIwfmw8F75
7WXFmQRJB/T4AACdfbNm
             "], {{7.200389999999999, 11.5043}, {
             7.200389999999999, 10.705100000000002`}, {6.592190000000001, 
             9.700000000000001}, {5.294919999999999, 9.700000000000001}, {
             3.6003899999999995`, 9.700000000000001}, {3.6003899999999995`, 
             12.715199999999998`}, {3.6003899999999995`, 13.1148}, {
             3.6234400000000004`, 13.200000000000001`}, {4.13789, 
             13.200000000000001`}, {5.61055, 13.200000000000001`}, {6.77891, 
             13.200000000000001`}, {7.200389999999999, 12.158199999999999`}, {
             7.200389999999999, 11.5043}}, {{7.499999999999999, 
             7.4632799999999975`}, {7.499999999999999, 6.4894500000000015`}, {
             6.78555, 5.6}, {5.63789, 5.6}, {4.13906, 5.6}, {
             3.6238300000000003`, 5.6}, {3.6003899999999995`, 
             5.683979999999999}, {3.6003899999999995`, 6.0808599999999995`}, {
             3.6003899999999995`, 9.399999999999999}, {5.78984, 
             9.399999999999999}, {6.914059999999999, 9.399999999999999}, {
             7.499999999999999, 8.389059999999999}, {7.499999999999999, 
             7.4632799999999975`}}}], 
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3,
             3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3,
             3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
            3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJdIGYC4pkgIGnoYLzmUe8ZZQUHGP+jJsMx4wwEX8Hx
Y/KZXgUH96Kf/C+/G8D5teu2JdXfRPCbAz3nNlwzcDi9T7vpfy6C/8A13nGW
o4JD9VIdZ5ndBg47gq0i/i+XcDCYqSUxdYuewwPzfd/OGIk6zLXRuTIrTQfO
n9LeGnV5jxacb2IMAmoOMaoRMudsxOH89LfbuM9uVYLzaz5tCMjepenwnnef
wcxVWg5nwEDLYU0T0EEJOnC+7PIXHnr39eD8nbe6/qa2GzikgcAyDYf25eGn
jI4YOHjsr5W1YFd1mOEj2uN1ysDB7sXNNb/2qMD5b8D2qDiUbBX9ffodgg8L
P3Q+xF8I/o3GYrcpZqpwvovM60dmt7Tg/JQzsd4n3LXh/HSwA7UdnM+nXX3+
ywDOTxaIsNzyAsH3PsFuO/upASQ8orQdsjl/Lki/bOAQIb79IoOctoP8l5yw
WjsDhzyh5gOnHDUdQMZlZes75IDUTQaGm9GRjXrndOHm1WftKZksoQPnF6zp
vp1xQB3OZwADFYcLV8Pe6M9Wh/Nh8QPjv6k445BaI+0w5Rtb/Iwz6g5rWLoP
z/wvDDcfxl87JbUj+a8+nA/zv7l/6YmzH6Qc0NMvAHvsNG4=
            "]], 
           
           FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1,
             0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3,
             3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1,
             0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1,
             0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGIdIGYC4g0PX07d5GPp4KpayjRrh4LDfzCwgPOvHc01
adhu4eAwoVko7Zakw4myffOl8i0c0sBAzOHvt9IHcwrN4Hyw+usmcP69wq6+
J0EI/ovt65mf+5g4RIhvv8iwD8F/VXHGITVGAs4v92J//f+MkgPHGpmolGhT
OL/2t1XBuQozOH8mGJg5vF+0XuEsB4Jv7l964uwFeQev6mZ9n2eY/MBb0jWJ
Rmpw9ej8juXhp4xUVOD2CTxZ0DIzTRnuHhgf5l50voLjx+Qztppw/pWKl2qG
HFrw8PgTk3v0n5GWw45etg9iNxB81SfN885mmcH57kU/+V+qW8D56ZtfFW9t
tXCwAAU0g6aDMQhstnBgXTzJirFXFR5/MH7hmu7bGRssHKZ8Y4ufcUbL4f+m
6k8bDIww+DDzu/+mfn9SiOCD00eMMZzfHOg5tyHN2GGB67bPf79owvnBJSrT
/wsg+OqfVF7OWikB54e8vfxxxkMxuHmw9ACzD8aHuQedbwL2qKjD0tlHFDZc
soDzAexqQYU=
            "]]}, 
          Thickness[0.03745318352059925], StripOnInput -> False]}, {
        ImageSize -> {26.7013499377335, 16.338709838107096`}, 
         BaselinePosition -> Scaled[0.32439307852814453`], 
         ImageSize -> {27., 17.}, PlotRange -> {{0., 26.7}, {0., 16.34}}, 
         AspectRatio -> Automatic}],GraphicsBox[{
         Thickness[0.03176620076238882], 
         StyleBox[{
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1,
              0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 
             1, 0}, {0, 1, 0}, {1, 3, 3}}, {{1, 4, 3}, {0, 1, 0}, {0, 1, 0}, {
             1, 3, 3}, {0, 1, 0}, {1, 3, 3}}, {{1, 4, 3}, {0, 1, 0}, {1, 3, 
             3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGCQAmIQ/fdj3FYjR0WHGNUImXN/ZB1g/NW1VnLGHxQc5iy3
epL2Q85B+dqjYIY7Sg7teivyZxpLOlRErDA9q63soCv+ce6Mq7IOb3n3Gcyc
pewwEwwUHER/n353UlkVzpeZF6d5+oManP839fuTREZNBx7/9VNSOWQdjmta
TTr9X8vhYPe+JpPDYnB+zYumX9Msf9ij89PTQEDLQef3Oo5/5n/g/LLD21xn
+rI6wPguE5qF0maxOsxZpLzzjzqCb2azN2iaoyacL7Pmf/GM9RJwfsB9o+Wn
H4nBzQMblyYGtw/Gh7kHnW9iDAKiDuqfVF7O4pRwgPFbFdhVz5jIwfmw8F75
7WXFmQRJB/T4AACdfbNm
             "], {{7.200389999999999, 11.5043}, {
             7.200389999999999, 10.705100000000002`}, {6.592190000000001, 
             9.700000000000001}, {5.294919999999999, 9.700000000000001}, {
             3.6003899999999995`, 9.700000000000001}, {3.6003899999999995`, 
             12.715199999999998`}, {3.6003899999999995`, 13.1148}, {
             3.6234400000000004`, 13.200000000000001`}, {4.13789, 
             13.200000000000001`}, {5.61055, 13.200000000000001`}, {6.77891, 
             13.200000000000001`}, {7.200389999999999, 12.158199999999999`}, {
             7.200389999999999, 11.5043}}, {{7.499999999999999, 
             7.4632799999999975`}, {7.499999999999999, 6.4894500000000015`}, {
             6.78555, 5.6}, {5.63789, 5.6}, {4.13906, 5.6}, {
             3.6238300000000003`, 5.6}, {3.6003899999999995`, 
             5.683979999999999}, {3.6003899999999995`, 6.0808599999999995`}, {
             3.6003899999999995`, 9.399999999999999}, {5.78984, 
             9.399999999999999}, {6.914059999999999, 9.399999999999999}, {
             7.499999999999999, 8.389059999999999}, {7.499999999999999, 
             7.4632799999999975`}}}], 
           
           FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3,
              3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1,
              3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 
             3}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGAwBmIQ/R8MdB0yStg3GqdKOsD4fx7vzUpVknFITQMBTH7V
/R+3jL0l4fyUiKPSM9PFHDLyP7SevKLjwAAGYg7HNa0mna5H8BMOX9ZOnamN
wZdd8794Rr8EnL/NdSavkackQn17wNK0+wpw/mnXGvU0XSU4X7hyUslZFWWH
82lXn2d1azl89YpssxBTcVjguu3z3y2aDq9YTATN7qg4HOk3LNddqOFgYgwC
qg5L7u/jmzNZHc4v2zdfSn+uKpx/4WrYG31pFQdmvoVeZ98pw/mzl1s9SctQ
gvOdJzQLpe1SdAjInlU+p0nFYc8LbQ/jNEWHEyD//0fwl/g5CCcuVoXzG1mO
9huKqzkE/y6xSbuA4EPkldD4yg7T/k+o+22lCufLLn/hoXdfBc5XfdI872yW
qsOGKakdybYqDiycXfLJfWoOM8FAxcHMZm/QtEZ1OP+9mEfAnxkacD44vv5r
OuzNr3k7c6synP+Wd5/BzFmKcH41KP5XKzi0zDu76rypqoPrPJVY45kKcHfs
rZW1SHeRhfOBpqkyrpKE8z3WHF3O8EPU4UWW9rfpwPA+AwYiEPNE1eF8lsWT
rBjXasD54lOvcGYc0nRQPOHIabxWzOHLBmCIm2s5nNqn3fT/rYTDio+XfJMC
tBzmbr2tZzJdzEEe6IpMfm24/vqsPSWTJXTgfBeZ14/MZiH4sPQ/tTac5X+1
qAN6/gAAM85fIw==
             "], {{12.9996, 7.002729999999999}, {12.9996, 
             5.818359999999999}, {12.1137, 5.419530000000002}, {11.5918, 
             5.419530000000002}, {10.9973, 5.419530000000002}, {
             10.499600000000001`, 5.85469}, {10.499600000000001`, 
             6.434769999999999}, {10.499600000000001`, 8.030079999999998}, {
             12.562899999999997`, 8.175389999999998}, {12.9996, 
             8.200000000000001}}}], 
           
           FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3,
             3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1,
             0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3,
             3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3,
             3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJrIGYC4jNgYOKQBgYqDjD+CU2rSaf/qziYNGx3aCoy
cVhyfx/fnM8qDl/+Xql46YbgB8iJZfk+Nobz575ffsz7uRFcP4wPM3+L+Y9D
KVHGDomHL2unRqo4pIOEy4wdXOapxBqfVIbz5yy3epIWgeCHNh19eEZe2cHi
2tFckwJjh/8V66NmMig7HDi10HVbsrFD9+GZ8WcPKjl4Vzfr+6gZOVTd/3HL
WFvS4cX29czPzxg4OHIa5/6XUnZYbRcevXG/gYOC48fkM7UI/pru2xkM63Hz
Ye5XfdI876yWIZyfHHvHjTkDkw/zP6//+impEobw8AGHZ5MBnA8Obh0EP+VM
rPcJdj24fhgfxf4sfTi/PGKF6dnZ+g7zbHSuzHJTcTifdvV51mt9hz0vtD2M
25QdmMP4dDftNXSw8C89cTZA1MFD77/iXzNDh9P7tJv+6wrA+belaxKNRAXg
/stpWvGbIYXf4brQJ8fz3wwctujlLWas4XHI3lMyWWKJgUPZ4W2uM89yQOJT
CsEHm1emD+d3OCY8vcCk7xCjGiFzroYLg9+OxoekP32HKbXhLP9vI/gHuvc1
mSjzwfnmIP8YCDjoa60UvpCiDxUXcAjInlU+hwnB3/NYRPbkUj0438QYBPQc
3NccXc4QgeCff8GXlM7FB+f7P/G8ZDqZy8FgppbEVBF9qDi7QwUovLUN4Hxw
+ryG4PuD8kOwoQO76pktf19zQ+J7kaFDOKdYu/F/AYcH3JNXNm00drhvvu/b
mUNKkPTLbOLAAAIJKg73Crv6nkzCzI8wPgAQYJN9
            "]], 
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1,
              0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}}, {{0, 2, 0}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGCQA2IQLT0vTvP0BEuH9BL2jcZPpRxg/DP7tJv+60o7POCe
vLKp0dJhvZAOX3qctAOjbwuvfz6Cnyr5KEI8HMEPLlGZ/j/A0iGcU6zdWF7a
IW6XJw+Tt6XDfxC4L+VwTjLwlvQfCweHpkfHZ+wWg6g3sHCYCQaiDn+/lT6Y
s9Eczv+z8uMlXyMEnwEMzBxc5qnEGv8Ug/M9dqV9OlsmD+d3bv0hwmCsALHX
3xLO95cTy/KdjODXrtuWVD8Tkw+xD8FXBdqW9lvJ4XYGQ37jFwsHE2MQUHU4
2LY8/FSTOZzfFOg5t0HNDM7f2lJzYbOkqUO3jeeutENKcD44vJfKw/nClZNK
zqZIOkxY8MPwmZ+ZwxkwEHEoypj4tma+OZz/MflMrDeHJZwPiy/+2ID7Rs8l
HdDjEwAOkMP7
             "], {{24.799999999999997`, 8.299999999999999}, {
             21.979299999999995`, 8.299999999999999}, {22.0738, 10.184}, {
             23.116799999999998`, 10.399999999999999`}, {23.4484, 
             10.399999999999999`}, {24.716399999999997`, 
             10.399999999999999`}, {24.787499999999998`, 8.70781}, {
             24.799999999999997`, 8.299999999999999}}}], 
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3,
             3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3,
             3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3,
             3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3,
             3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxl1HtMU1ccB/AKRuMyq2N9qAX64JJlAY2hIu70XviiY6IixGUqMyKOQiG+
EKVTCGwTTbqIJfhsK2iYMcIySFUEEzXg203KQyKKIuKDBDDDhM1piTB27+04
N+ovOX98/jjnnt/v/O5Pn5b9dYa/TCabwK9Efvnxy+niY2Y0PA1hRWPLNRh3
dUC4PPNxEBpv/xJXX8vhcnFD0TyzFutTHn3l7+QQlWT9vblNi/N3ZI/9Pufw
ad6B3OaTOmTWvthe18Hiy+NMivEPHRwJyn1LP2LR0yAvNwbooY0dMntqTJje
W7HHNV8P99OBw2c9BHnJVZHNxZLLKkmvxWugVgjnnwvBxFXy2WenmuARg0HW
pdyDMxiW+p9Jqc4EK0cdblM9aLFxcIlhQLKav3EJ57tHtx7ZqZNbZu7n0BRX
8JmlRo+OgL9iW09JHhPCLXnk16H25e0fOiTFOGxpkmxOvqFxRRmof3pLtrZU
MdQn4ur/HlWEUs8zChEK26uu+7tqJadcWPKxX5nkb3IZx9h6Dmt1fALVDGKK
nt1yLuOg4K9tsTLoP+/27/uTxcQpe7VmeShKBwtiIktYul/cFy558nBFZu0F
Qi3WO+H/ep8MoS7TvYiWfWug/kR4P5Xk7tObV1gW6bFvNONN7xWC3wpJsHGr
Dp1ZsuxdjAm5dcq3TSVauA9l/Gy2m4DS3QEWosXh0mn58zUsrNfq41zNwVDE
3HxUd51F+lLmTlN8sO8d+XzE+zDBGFyzMLr/Cw62OVXZLmMQrutOb8vK4TB4
SH5vLC/Q178uDm398rTMDRpqsV+nz6IW++Bfta8eCRx2Ct+vUUJXYs3RcCz1
yGvrk/IcE3XfhrDXjm6CdOF9bWq0CQ3kIrj0XdcJjyUQnh/jGwvtBAU93ofG
sCCci/JeTd9LMDK0ri4i9kPbKlffjthDfHluCsLibcPTBnZIZnuS7I4tksfr
/b7tycVJE+ZKnq0eOuZcGUg9w2ZsPPpcSc1nMzViivLd8zwKOIT32Ci51dA1
/EO+ZDG/QoJy4f/sVPjqf4ZggTgPlHhyy3nxyGXimxchKmpnsTfRQ1Rwd6Z+
n/SSIL76RqXMq/LNhTQTPf/V6N2dA5NYarE/iWS0Wjr68jnq8Xkl9o9djffn
2X9pMkkH
            "]]}, 
          Thickness[0.03176620076238882], StripOnInput -> False]}, {
        ImageSize -> {31.483287671232876`, 16.338709838107096`}, 
         BaselinePosition -> Scaled[0.32439307852814453`], 
         ImageSize -> {32., 17.}, 
         PlotRange -> {{0., 31.479999999999997`}, {0., 16.34}}, AspectRatio -> 
         Automatic}],GraphicsBox[{
         Thickness[0.021235931195582924`], 
         StyleBox[{
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1,
              0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 
             1, 0}, {0, 1, 0}, {1, 3, 3}}, {{1, 4, 3}, {0, 1, 0}, {0, 1, 0}, {
             1, 3, 3}, {0, 1, 0}, {1, 3, 3}}, {{1, 4, 3}, {0, 1, 0}, {1, 3, 
             3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGCQAmIQ/fdj3FYjR0WHGNUImXN/ZB1g/NW1VnLGHxQc5iy3
epL2Q85B+dqjYIY7Sg7teivyZxpLOlRErDA9q63soCv+ce6Mq7IOb3n3Gcyc
pewwEwwUHER/n353UlkVzpeZF6d5+oManP839fuTREZNBx7/9VNSOWQdjmta
TTr9X8vhYPe+JpPDYnB+zYumX9Msf9ij89PTQEDLQef3Oo5/5n/g/LLD21xn
+rI6wPguE5qF0maxOsxZpLzzjzqCb2azN2iaoyacL7Pmf/GM9RJwfsB9o+Wn
H4nBzQMblyYGtw/Gh7kHnW9iDAKiDuqfVF7O4pRwgPFbFdhVz5jIwfmw8F75
7WXFmQRJB/T4AACdfbNm
             "], {{7.200389999999999, 11.5043}, {
             7.200389999999999, 10.705100000000002`}, {6.592190000000001, 
             9.700000000000001}, {5.294919999999999, 9.700000000000001}, {
             3.6003899999999995`, 9.700000000000001}, {3.6003899999999995`, 
             12.715199999999998`}, {3.6003899999999995`, 13.1148}, {
             3.6234400000000004`, 13.200000000000001`}, {4.13789, 
             13.200000000000001`}, {5.61055, 13.200000000000001`}, {6.77891, 
             13.200000000000001`}, {7.200389999999999, 12.158199999999999`}, {
             7.200389999999999, 11.5043}}, {{7.499999999999999, 
             7.4632799999999975`}, {7.499999999999999, 6.4894500000000015`}, {
             6.78555, 5.6}, {5.63789, 5.6}, {4.13906, 5.6}, {
             3.6238300000000003`, 5.6}, {3.6003899999999995`, 
             5.683979999999999}, {3.6003899999999995`, 6.0808599999999995`}, {
             3.6003899999999995`, 9.399999999999999}, {5.78984, 
             9.399999999999999}, {6.914059999999999, 9.399999999999999}, {
             7.499999999999999, 8.389059999999999}, {7.499999999999999, 
             7.4632799999999975`}}}], 
           
           FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3,
              3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1,
              3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 
             3}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGAwBmIQ/R8MdB0yStg3GqdKOsD4fx7vzUpVknFITQMBTH7V
/R+3jL0l4fyUiKPSM9PFHDLyP7SevKLjwAAGYg7HNa0mna5H8BMOX9ZOnamN
wZdd8794Rr8EnL/NdSavkackQn17wNK0+wpw/mnXGvU0XSU4X7hyUslZFWWH
82lXn2d1azl89YpssxBTcVjguu3z3y2aDq9YTATN7qg4HOk3LNddqOFgYgwC
qg5L7u/jmzNZHc4v2zdfSn+uKpx/4WrYG31pFQdmvoVeZ98pw/mzl1s9SctQ
gvOdJzQLpe1SdAjInlU+p0nFYc8LbQ/jNEWHEyD//0fwl/g5CCcuVoXzG1mO
9huKqzkE/y6xSbuA4EPkldD4yg7T/k+o+22lCufLLn/hoXdfBc5XfdI872yW
qsOGKakdybYqDiycXfLJfWoOM8FAxcHMZm/QtEZ1OP+9mEfAnxkacD44vv5r
OuzNr3k7c6synP+Wd5/BzFmKcH41KP5XKzi0zDu76rypqoPrPJVY45kKcHfs
rZW1SHeRhfOBpqkyrpKE8z3WHF3O8EPU4UWW9rfpwPA+AwYiEPNE1eF8lsWT
rBjXasD54lOvcGYc0nRQPOHIabxWzOHLBmCIm2s5nNqn3fT/rYTDio+XfJMC
tBzmbr2tZzJdzEEe6IpMfm24/vqsPSWTJXTgfBeZ14/MZiH4sPQ/tTac5X+1
qAN6/gAAM85fIw==
             "], {{12.9996, 7.002729999999999}, {12.9996, 
             5.818359999999999}, {12.1137, 5.419530000000002}, {11.5918, 
             5.419530000000002}, {10.9973, 5.419530000000002}, {
             10.499600000000001`, 5.85469}, {10.499600000000001`, 
             6.434769999999999}, {10.499600000000001`, 8.030079999999998}, {
             12.562899999999997`, 8.175389999999998}, {12.9996, 
             8.200000000000001}}}], 
           
           FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3,
             3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1,
             0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3,
             3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3,
             3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJrIGYC4jNgYOKQBgYqDjD+CU2rSaf/qziYNGx3aCoy
cVhyfx/fnM8qDl/+Xql46YbgB8iJZfk+Nobz575ffsz7uRFcP4wPM3+L+Y9D
KVHGDomHL2unRqo4pIOEy4wdXOapxBqfVIbz5yy3epIWgeCHNh19eEZe2cHi
2tFckwJjh/8V66NmMig7HDi10HVbsrFD9+GZ8WcPKjl4Vzfr+6gZOVTd/3HL
WFvS4cX29czPzxg4OHIa5/6XUnZYbRcevXG/gYOC48fkM7UI/pru2xkM63Hz
Ye5XfdI876yWIZyfHHvHjTkDkw/zP6//+impEobw8AGHZ5MBnA8Obh0EP+VM
rPcJdj24fhgfxf4sfTi/PGKF6dnZ+g7zbHSuzHJTcTifdvV51mt9hz0vtD2M
25QdmMP4dDftNXSw8C89cTZA1MFD77/iXzNDh9P7tJv+6wrA+belaxKNRAXg
/stpWvGbIYXf4brQJ8fz3wwctujlLWas4XHI3lMyWWKJgUPZ4W2uM89yQOJT
CsEHm1emD+d3OCY8vcCk7xCjGiFzroYLg9+OxoekP32HKbXhLP9vI/gHuvc1
mSjzwfnmIP8YCDjoa60UvpCiDxUXcAjInlU+hwnB3/NYRPbkUj0438QYBPQc
3NccXc4QgeCff8GXlM7FB+f7P/G8ZDqZy8FgppbEVBF9qDi7QwUovLUN4Hxw
+ryG4PuD8kOwoQO76pktf19zQ+J7kaFDOKdYu/F/AYcH3JNXNm00drhvvu/b
mUNKkPTLbOLAAAIJKg73Crv6nkzCzI8wPgAQYJN9
            "]], 
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1,
              0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}}, {{0, 2, 0}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGCQA2IQLT0vTvP0BEuH9BL2jcZPpRxg/DP7tJv+60o7POCe
vLKp0dJhvZAOX3qctAOjbwuvfz6Cnyr5KEI8HMEPLlGZ/j/A0iGcU6zdWF7a
IW6XJw+Tt6XDfxC4L+VwTjLwlvQfCweHpkfHZ+wWg6g3sHCYCQaiDn+/lT6Y
s9Eczv+z8uMlXyMEnwEMzBxc5qnEGv8Ug/M9dqV9OlsmD+d3bv0hwmCsALHX
3xLO95cTy/KdjODXrtuWVD8Tkw+xD8FXBdqW9lvJ4XYGQ37jFwsHE2MQUHU4
2LY8/FSTOZzfFOg5t0HNDM7f2lJzYbOkqUO3jeeutENKcD44vJfKw/nClZNK
zqZIOkxY8MPwmZ+ZwxkwEHEoypj4tma+OZz/MflMrDeHJZwPiy/+2ID7Rs8l
HdDjEwAOkMP7
             "], {{24.799999999999997`, 8.299999999999999}, {
             21.979299999999995`, 8.299999999999999}, {22.0738, 10.184}, {
             23.116799999999998`, 10.399999999999999`}, {23.4484, 
             10.399999999999999`}, {24.716399999999997`, 
             10.399999999999999`}, {24.787499999999998`, 8.70781}, {
             24.799999999999997`, 8.299999999999999}}}], 
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3,
             3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3,
             3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3,
             3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3,
             3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxl1HtMU1ccB/AKRuMyq2N9qAX64JJlAY2hIu70XviiY6IixGUqMyKOQiG+
EKVTCGwTTbqIJfhsK2iYMcIySFUEEzXg203KQyKKIuKDBDDDhM1piTB27+04
N+ovOX98/jjnnt/v/O5Pn5b9dYa/TCabwK9Efvnxy+niY2Y0PA1hRWPLNRh3
dUC4PPNxEBpv/xJXX8vhcnFD0TyzFutTHn3l7+QQlWT9vblNi/N3ZI/9Pufw
ad6B3OaTOmTWvthe18Hiy+NMivEPHRwJyn1LP2LR0yAvNwbooY0dMntqTJje
W7HHNV8P99OBw2c9BHnJVZHNxZLLKkmvxWugVgjnnwvBxFXy2WenmuARg0HW
pdyDMxiW+p9Jqc4EK0cdblM9aLFxcIlhQLKav3EJ57tHtx7ZqZNbZu7n0BRX
8JmlRo+OgL9iW09JHhPCLXnk16H25e0fOiTFOGxpkmxOvqFxRRmof3pLtrZU
MdQn4ur/HlWEUs8zChEK26uu+7tqJadcWPKxX5nkb3IZx9h6Dmt1fALVDGKK
nt1yLuOg4K9tsTLoP+/27/uTxcQpe7VmeShKBwtiIktYul/cFy558nBFZu0F
Qi3WO+H/ep8MoS7TvYiWfWug/kR4P5Xk7tObV1gW6bFvNONN7xWC3wpJsHGr
Dp1ZsuxdjAm5dcq3TSVauA9l/Gy2m4DS3QEWosXh0mn58zUsrNfq41zNwVDE
3HxUd51F+lLmTlN8sO8d+XzE+zDBGFyzMLr/Cw62OVXZLmMQrutOb8vK4TB4
SH5vLC/Q178uDm398rTMDRpqsV+nz6IW++Bfta8eCRx2Ct+vUUJXYs3RcCz1
yGvrk/IcE3XfhrDXjm6CdOF9bWq0CQ3kIrj0XdcJjyUQnh/jGwvtBAU93ofG
sCCci/JeTd9LMDK0ri4i9kPbKlffjthDfHluCsLibcPTBnZIZnuS7I4tksfr
/b7tycVJE+ZKnq0eOuZcGUg9w2ZsPPpcSc1nMzViivLd8zwKOIT32Ci51dA1
/EO+ZDG/QoJy4f/sVPjqf4ZggTgPlHhyy3nxyGXimxchKmpnsTfRQ1Rwd6Z+
n/SSIL76RqXMq/LNhTQTPf/V6N2dA5NYarE/iWS0Wjr68jnq8Xkl9o9djffn
2X9pMkkH
            "]], 
           
           FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}}}, {{{
            30.599999999999994`, 7.599999999999999}, {33.69961, 
            7.599999999999999}, {33.69961, 8.199609}, {30.599999999999994`, 
            8.199609}}}], 
           
           FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3,
             3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1,
             0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJZIGYC4vk2OldmLXN2MDEGAVEHGD8NDMQcJp+u99hf
iuAv2XtQXO21E5yfDqKeOTm8acvtNvqN4M8EgZ0ScL6+1krhCyxacH4O588F
6ZMR/Av58eznZmo51N+0rYw4geAvnmTF6LvEyeEMCLzRdOj2esViEunk8B8M
NBy+3L7eWLzPEYMPcZ+Gg+SBaAXHhwh+tJPdi5s6TnB+f2mhNG+Dk8PXnbe6
/j5F8JuF0m792yoB57tMAIr8EnP4XZe1p6Qa4f/mQM+5Dd8c4fx6tUNty49j
8mHhe/TfpupPHxwdLtzKFZ/lLeog/MnxfFqrE5z/WET25NPtCL741CucGa8Q
/O9s8TN8ap3hfPT4AwBKVsrp
            "]], 
           
           FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3,
             3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 
            3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
            3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJJKH0GDNwc/oOAvZIDjP9gH98cYycVhykSLGF8R90c
UmLvuDFbqDn4nGC3nd3r5mB93793Op+GQxoI+Lk5yMyL0zwtoOXgEfBHovi+
q8OF/Hj2czO1HFR2/mn/MhnBT5jhI9pjheD7LONyUz3r4uBj3umY8FTTIWtP
yWSJKS4OS/0chBMfqzsc/bep+lOGi4Pdi5trfsWoOXCpaNT1REL5d1TgfJj7
YXz5XQv2pZ6TdzDkWCMTleLiIJD9UZPBTcahMmKF6dnZLg5f9n3cmn5NwuGJ
iOzJp9ddHJK8VC6e1hB1yDVp2O7g5OqwhqX78Mz/wg4SU69wZkxC8OccUdhQ
JOEG5+8JmqbYl+rmkNO04jdDixgk3Ca5OXTaeO5KC5J02NpSc2HzSTeHVr0V
+TM/y8DD98Oi9Qpnbyg4oIf/TBCIdHP4+zFuq9FCBL8bZB6TIpz/YUNA9qxw
OQde//VTUj3cHPbXylqkp0g7bIn8uvOWlpuDqeOVWgYhMYe631YF5064OuxJ
vL3ojJqoQ6d88ruoSQj+jvXMz3sSEPwczp8L0n+7OAiCwotNzGHdtqT6m3dd
HM7fyhWf5S3tYBsevXH/GReHHpB7jOTg/NCmow/PvFeA82Huh/GntLdGXZ6j
AucLvNy+njldzaH0wRzBpU9dHHyTBCIsr6g7yLx+ZCbF4OpgDALFmpD05O8K
cZexFtz9ML7BXRW2xrMIvuWWE2X71N0cvgc/Xjp7iabDN7b4GT6ubg6F0rwP
dCeow8MPGFoumfpqcL7uhAU/DN1UMMIfAL7xY9I=
            "]]}, 
          Thickness[0.021235931195582924`], StripOnInput -> False]}, {
        ImageSize -> {47.09139726027397, 16.338709838107096`}, 
         BaselinePosition -> Scaled[0.32439307852814453`], 
         ImageSize -> {48., 17.}, PlotRange -> {{0., 47.09}, {0., 16.34}}, 
         AspectRatio -> Automatic}]},
      "LineLegend",
      DisplayFunction->(StyleBox[
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
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6], FontFamily -> 
                    "Latin Modern Roman", FontSize -> 12, 
                    Thickness[Large]], {
                    LineBox[{{0, 10}, {40, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.08250000000000002], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6], FontFamily -> 
                    "Latin Modern Roman", FontSize -> 12, 
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
                    RGBColor[0.880722, 0.611041, 0.142051], 
                    AbsoluteThickness[1.6], FontFamily -> 
                    "Latin Modern Roman", FontSize -> 12, 
                    Thickness[Large], 
                    Dashing[{Small, Small}]], {
                    LineBox[{{0, 10}, {40, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.08250000000000002], 
                    RGBColor[0.880722, 0.611041, 0.142051], 
                    AbsoluteThickness[1.6], FontFamily -> 
                    "Latin Modern Roman", FontSize -> 12, 
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
                    RGBColor[0.560181, 0.691569, 0.194885], 
                    AbsoluteThickness[1.6], FontFamily -> 
                    "Latin Modern Roman", FontSize -> 12, 
                    Thickness[Large], 
                    Dashing[{0, Small}]], {
                    LineBox[{{0, 10}, {40, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.08250000000000002], 
                    RGBColor[0.560181, 0.691569, 0.194885], 
                    AbsoluteThickness[1.6], FontFamily -> 
                    "Latin Modern Roman", FontSize -> 12, 
                    Thickness[Large], 
                    Dashing[{0, Small}]], {}}}, AspectRatio -> Full, 
                   ImageSize -> {40, 10}, PlotRangePadding -> None, 
                   ImagePadding -> Automatic, 
                   BaselinePosition -> (Scaled[0.1] -> Baseline)], #3}, {
                  GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.08250000000000002], 
                    RGBColor[0.922526, 0.385626, 0.209179], 
                    AbsoluteThickness[1.6], FontFamily -> 
                    "Latin Modern Roman", FontSize -> 12, 
                    Thickness[Large], 
                    Dashing[{0, Small, Small, Small}]], {
                    LineBox[{{0, 10}, {40, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.08250000000000002], 
                    RGBColor[0.922526, 0.385626, 0.209179], 
                    AbsoluteThickness[1.6], FontFamily -> 
                    "Latin Modern Roman", FontSize -> 12, 
                    Thickness[Large], 
                    Dashing[{0, Small, Small, Small}]], {}}}, AspectRatio -> 
                   Full, ImageSize -> {40, 10}, PlotRangePadding -> None, 
                   ImagePadding -> Automatic, 
                   BaselinePosition -> (Scaled[0.1] -> Baseline)], #4}, {
                  GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.08250000000000002], 
                    RGBColor[0.528488, 0.470624, 0.701351], 
                    AbsoluteThickness[1.6], FontFamily -> 
                    "Latin Modern Roman", FontSize -> 12, 
                    Thickness[Large], 
                    Dashing[{0.09, 0.18, 0.27}]], {
                    LineBox[{{0, 10}, {40, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.08250000000000002], 
                    RGBColor[0.528488, 0.470624, 0.701351], 
                    AbsoluteThickness[1.6], FontFamily -> 
                    "Latin Modern Roman", FontSize -> 12, 
                    Thickness[Large], 
                    Dashing[{0.09, 0.18, 0.27}]], {}}}, AspectRatio -> Full, 
                   ImageSize -> {40, 10}, PlotRangePadding -> None, 
                   ImagePadding -> Automatic, 
                   BaselinePosition -> (Scaled[0.1] -> Baseline)], #5}}, 
                GridBoxAlignment -> {
                 "Columns" -> {Center, Left}, "Rows" -> {{Baseline}}}, 
                AutoDelete -> False, 
                GridBoxDividers -> {
                 "Columns" -> {{False}}, "Rows" -> {{False}}}, 
                GridBoxItemSize -> {"Columns" -> {{All}}, "Rows" -> {{All}}}, 
                GridBoxSpacings -> {"Columns" -> {{0.5}}, "Rows" -> {{0.8}}}],
                "Grid"]}}, 
            GridBoxAlignment -> {"Columns" -> {{Left}}, "Rows" -> {{Top}}}, 
            AutoDelete -> False, 
            GridBoxItemSize -> {
             "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
            GridBoxSpacings -> {"Columns" -> {{1}}, "Rows" -> {{0}}}], 
           "Grid"], Alignment -> Left, AppearanceElements -> None, 
          ImageMargins -> {{5, 5}, {5, 5}}, ImageSizeAction -> "ResizeToFit"],
          LineIndent -> 0, StripOnInput -> False], {FontFamily -> "Arial"}, 
        Background -> Automatic, StripOnInput -> False]& ),
      Editable->True,
      InterpretationFunction:>(RowBox[{"LineLegend", "[", 
         RowBox[{
           RowBox[{"{", 
             RowBox[{
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.009166666666666668`", "]"}], 
                   ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
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
                    Magnification])}]], 
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
                   
                   RowBox[{
                    "FontFamily", "\[Rule]", "\"Latin Modern Roman\""}], ",", 
                   
                   RowBox[{"FontSize", "\[Rule]", "12"}], ",", 
                   RowBox[{"Thickness", "[", "Large", "]"}]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.009166666666666668`", "]"}], 
                   ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
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
                    Magnification])}]], 
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
                   
                   RowBox[{
                    "FontFamily", "\[Rule]", "\"Latin Modern Roman\""}], ",", 
                   
                   RowBox[{"FontSize", "\[Rule]", "12"}], ",", 
                   RowBox[{"Thickness", "[", "Large", "]"}], ",", 
                   RowBox[{"Dashing", "[", 
                    RowBox[{"{", 
                    RowBox[{"Small", ",", "Small"}], "}"}], "]"}]}], "]"}], 
               ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.009166666666666668`", "]"}], 
                   ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
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
                    Magnification])}]], 
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
                   
                   RowBox[{
                    "FontFamily", "\[Rule]", "\"Latin Modern Roman\""}], ",", 
                   
                   RowBox[{"FontSize", "\[Rule]", "12"}], ",", 
                   RowBox[{"Thickness", "[", "Large", "]"}], ",", 
                   RowBox[{"Dashing", "[", 
                    RowBox[{"{", 
                    RowBox[{"0", ",", "Small"}], "}"}], "]"}]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.009166666666666668`", "]"}], 
                   ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0.922526, 0.385626, 0.209179], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> 
                    RGBColor[
                    0.6150173333333333, 0.25708400000000003`, 
                    0.13945266666666667`], FrameTicks -> None, 
                    PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    "RGBColor[0.922526, 0.385626, 0.209179]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0.922526, 0.385626, 0.209179]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0.922526, 0.385626, 0.209179], Editable -> False,
                     Selectable -> False], ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   
                   RowBox[{
                    "FontFamily", "\[Rule]", "\"Latin Modern Roman\""}], ",", 
                   
                   RowBox[{"FontSize", "\[Rule]", "12"}], ",", 
                   RowBox[{"Thickness", "[", "Large", "]"}], ",", 
                   RowBox[{"Dashing", "[", 
                    RowBox[{"{", 
                    RowBox[{"0", ",", "Small", ",", "Small", ",", "Small"}], 
                    "}"}], "]"}]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.009166666666666668`", "]"}], 
                   ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0.528488, 0.470624, 0.701351], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> 
                    RGBColor[
                    0.3523253333333333, 0.3137493333333333, 
                    0.46756733333333333`], FrameTicks -> None, 
                    PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    "RGBColor[0.528488, 0.470624, 0.701351]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0.528488, 0.470624, 0.701351]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0.528488, 0.470624, 0.701351], Editable -> False,
                     Selectable -> False], ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   
                   RowBox[{
                    "FontFamily", "\[Rule]", "\"Latin Modern Roman\""}], ",", 
                   
                   RowBox[{"FontSize", "\[Rule]", "12"}], ",", 
                   RowBox[{"Thickness", "[", "Large", "]"}], ",", 
                   RowBox[{"Dashing", "[", 
                    RowBox[{"{", 
                    RowBox[{"0.01`", ",", "0.02`", ",", "0.03`"}], "}"}], 
                    "]"}]}], "]"}]}], "}"}], ",", 
           RowBox[{"{", 
             RowBox[{#, ",", #2, ",", #3, ",", #4, ",", #5}], "}"}], ",", 
           RowBox[{"LegendMarkers", "\[Rule]", 
             RowBox[{"{", 
               RowBox[{
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}]}], "}"}]}], ",", 
           RowBox[{"Joined", "\[Rule]", 
             RowBox[{"{", 
               
               RowBox[{
                "True", ",", "True", ",", "True", ",", "True", ",", "True"}], 
               "}"}]}], ",", 
           RowBox[{"LabelStyle", "\[Rule]", 
             RowBox[{"{", "}"}]}], ",", 
           RowBox[{"LegendLayout", "\[Rule]", "\"Column\""}]}], "]"}]& )]},
    {
     GraphicsBox[{{}, {{}, {}, 
        {RGBColor[0.368417, 0.506779, 0.709798], PointSize[
         0.009166666666666668], Thickness[Large], 
         StyleBox[LineBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQDQPqmyvO+oU128+aCQIr7cP9YyuWLILxd9q//2Qx
exd3i72JMQgctv83QzftRn8LVP6k/eot8/lYdFvtIaZdsL/8h32T4sNWqPrL
9uLnPybzrWqzT08DgWv276UW/d/S2g7Vf9M+rm/eZZmiDvuzZ0Dgjr3CsVPz
inI7oeY9sF/zZxYzb1kXVP1D+10v2OfndnVDzX9s/3eHwh37lT1Q/U/sD+5z
jw+72Au175n9iaTuzcsZ+6HmvbC/4DUjcqnMBKh5L+1rYheX7tw9AWrea3vu
/Y7TtsVOhJr3xj66ONXEj2kS1Lx39tb3+HKtV06CmvfBfgnbrP2OQZPtAUnE
lww=
           "]],
          FontFamily->"Latin Modern Roman",
          FontSize->12]}, 
        {RGBColor[0.880722, 0.611041, 0.142051], PointSize[
         0.009166666666666668], Thickness[Large], Dashing[{Small, Small}], 
         StyleBox[LineBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQDQM7/uTtd4hutp81EwRW2p9aGxfxYw2Mv9N++7cp
XT1iLfYmxiBw2F5A6PabvLYWqPxJey+/ig4eo1Z7iGkX7H9+jDv67VErVP1l
ez/tUydTVrXZp6eBwDX7xK3fguo626H6b9rzOxnbehZ32J89AwJ37CWlLu91
yO2EmvfA/sK8xXN/VHZB1T+0n9gWfeNOVzfU/Mf2+rzHnn9Y3QPV/8Terevo
ofYbvVD7ntnvOFUxo4e1H2reC3vlR/0hycoToOa9tDc+nK38cfsEqHmv7V88
u7/hVNhEqHlv7FnkLH4cYJ4ENe+d/ee8kIeLF02CmvfBfsK7W9WqoZPtAUzI
nGM=
           "]],
          FontFamily->"Latin Modern Roman",
          FontSize->12]}, 
        {RGBColor[0.560181, 0.691569, 0.194885], PointSize[
         0.009166666666666668], Thickness[Large], Dashing[{0, Small}], 
         StyleBox[LineBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQDQOJnqzX5AKb7WfNBIGV9tct99TULILxd9o3HO0x
5uZpsTcxBoHD9rJb77x16mmByp+0n/PZQ2mbdqs9xLQL9o2M0RwrHrZC1V+2
V3QqcK9e3WafngYC1+xFP1RZTuhuh+q/aX/s5M7rVzM77M+eAYE79suzhZNf
F3dCzXtgX9tQ2aZR3gVV/9D+ju7tJvvebqj5j+2nHrtQ1rm6B6r/iT2rjFhw
4v1eqH3P7GXXRjeuZOuHmvfC/sJUo2nzpSdAzXtpz//uvv38nROg5r22l/ww
J1M7diLUvDf2mfrtS5f+nAg17539060/DQ4tnQQ174P9ebWOd//9JtsDAKlb
lpU=
           "]],
          FontFamily->"Latin Modern Roman",
          FontSize->12]}, 
        {RGBColor[0.922526, 0.385626, 0.209179], PointSize[
         0.009166666666666668], Thickness[Large], 
         Dashing[{0, Small, Small, Small}], 
         StyleBox[LineBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQDQP+27tvNixvsp81EwRW2levuX5a6h6Mv9N+n3Rh
kXpms72JMQgctn8zX6piyr9mqPxJe/H/kz6J97bYQ0y7YN+krDz7VkArVP1l
+z2nq6LF/rXap6eBwDX7C/7Hck0+tkH137S/OIF5UvKDdvuzZ0Dgjv2JnJZn
Ubs6oOY9sP+xaD6/1+lOqPqH9rPLltU/2dgFNf+x/QfTaN3E691Q/U/s5T5N
5mA83gO175m9yS1mwS+3eqHmvbAXvt+i2yrWDzXvpX1dyoSt+fwToOa9tv/v
91KHe9kEqHlv7P9ctUpIMJ4INe+dveEB3m3rOidAzftgb+5ZcEiRYZI9AMeP
mBw=
           "]],
          FontFamily->"Latin Modern Roman",
          FontSize->12]}, 
        {RGBColor[0.528488, 0.470624, 0.701351], PointSize[
         0.009166666666666668], Thickness[Large], Dashing[{0.01, 0.02, 0.03}], 
         StyleBox[LineBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQDQMZP+oSLHKb7WfNBIGV9md/dty8sQ/G32l/Y96D
9DL5FnsTYxA4bO/uuW733U0tUPmT9qzJkolNlq32ENMu2FtP+ZRqzNIGVX/Z
ntPwJduTK2326WkgcM1+3eXjXacntUP137Rf+CrSQ6a4w/7sGRC4Yx+wS2/a
tMJOqHkP7LdzRXRy9XZB1T+0f115YhHnim6o+Y/tj74y/MF8vgeq/4m97OmW
Zc++90Lte2ZfWS9e2K7TDzXvhT2/Zl3AccMJUPNe2vu/kNn46+IEqHmv7a9t
XmO/Mnki1Lw39pv3rnBz4pwENe+dfZcRu46YykSoeR/sQ9Q+ffZ5PckeAHfx
l3E=
           "]],
          FontFamily->"Latin Modern Roman",
          FontSize->12]}}, {}, {}, {{}, {}}},
      AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
      Axes->{False, False},
      AxesLabel->{None, None},
      AxesOrigin->{0, 0.007065},
      BaseStyle->{FontFamily -> "Latin Modern Roman", FontSize -> 12},
      DisplayFunction->Identity,
      Frame->{{True, True}, {True, True}},
      FrameLabel->{{
         FormBox[
          GraphicsBox[{
            Thickness[0.01633453119895459], 
            StyleBox[{
              
              FilledCurveBox[{{{1, 4, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1,
                3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 
               0}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJhIGYC4t2JtxedcZNwmAkGjA7LX3jo/T8oCefL71qw
L/WcpIP273Uc/7YzOqR4qVw87SHlEM4p1m78n9mhPmtPyWQLLYfbGQz5jSoG
Dkv8HIQTk7Uc7E3jdnn6IPjiU69wZgQh+A5Nj47PiEZSXxmxwrTWwKFnw8OX
U420oPYbOGy/yHCP6aUmnJ94+LJ26kwEX0r/rgpbo6bD8yztb9OB+sH2JGk6
gIw7CzTffc3R5QwSUg4LLsoeOTeF20FmXpzm6Qv8DhUXwyeknVFyAPrOb3or
k4MDp3HufysFhxYFdtUzX5gdHrjGO87aKA/x534uB0PVSS9SVRQdAIbUfRk=

               "]]}, 
             Thickness[0.007807905913100294], StripOnInput -> False], 
            StyleBox[{
              
              JoinedCurveBox[{{{0, 2, 0}}}, {{{12.951199999999998`, 
               16.344899999999996`}, {60.219899999999996`, 
               16.344899999999996`}}}, CurveClosed -> {0}], 
              
              FilledCurveBox[{{{1, 4, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0,
                 1, 0}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0,
                 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 
                0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1,
                 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 
                0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                 3, 3}}}, {{{20.699600000000004`, 11.9254}, {
                20.699600000000004`, 11.300799999999999`}, {20.3863, 
                9.499999999999998}, {17.969099999999997`, 
                9.499999999999998}, {16.6105, 9.499999999999998}, {
                17.404299999999996`, 12.7219}, {17.5125, 
                13.174999999999997`}, {17.5605, 13.200000000000001`}, {
                18.029299999999996`, 13.200000000000001`}, {
                18.895300000000002`, 13.200000000000001`}, {
                19.929299999999998`, 13.200000000000001`}, {
                20.699600000000004`, 12.880899999999997`}, {
                20.699600000000004`, 11.9254}}, CompressedData["
1:eJxl1HlIk2EcB/DXWFlEKtTcu2psmiazdMf7DjqsfqMEXdLsoAYdntOR1jo0
JabSKtJMPNJMy+h2ZaVddkAju1asdWqH/bGyCC3DIysh7W3Pas8D7oGXlw/v
8bzv7/n+nqBk4zL9KIqiVrkOdM7/PWfTkzcqUIRWdOqzhOCxyTnYztiFkHeh
ObngkQpKdcVan14h6IUdOsE14iintqT6CHH4nAp7wUEVBGT0SanTQqCrWscZ
KlTQUmw1swuFcPizqL4zRgXtU0xJyjY+hFRzZfl2FmJupvU7fk6Cc8XvDFQB
sft5JfH78fvPmH1Y4Pkd0zjy+djb0fc2CLD3RFqMNS9piCw7OqiYzkLP8UaJ
Y5YIFr3pHdBIWRiw9l1N3yaC6NDsUbWzWBjmXGOBGHuf5guP3UwsR/VpJbZH
m8LSzgeB9nn5mj87GcjR+H7lMoOhYf6q1Rf9GdA7+S1cczB0T7DKa/a67rfO
MHNrpwEdEz9EX1bBGom6LyUuFJtCIzEM21WkSE4thXuSpi2GFhZsUldhuXBo
ze2arqAZ7JlB4oHMZhl2U+TGEz5RxAbKuIM32ttP21Z2yw4Rp6ehEQ4ln/rF
L2TEcej/ThC781Ak9/KvO6lnE1li283rJWN6pWAaYc/10m+mBSqrFFanznVq
8+SAUvU8UQoW89LYutsREIvW+wANiSuWhR0tioB4p7Le3hEI5yv1hSl5EeCe
Pi0QCnj3SxWvZ2D3oHpriEuXZ4VUi73dJHHo2Do+NsugwYf4jNqcw8nEBmPv
7kdZxO48dhCfQuuUNBOetW8Q1C7mQ9xD33mH2ohPLoGJSa76eeyvbazUj5Vj
t6H1jJHj9/3LP3FdT/2DxdXEeag/r3u7K/cx6IeIPf/biOpVR+zOgZG48ueY
hIOZMi+n6u5PqbER/+lbd1WpFmAPj/DQx1vr9ccFcA3MHbZcGWSYLb8pHg1o
1QMLPXkJhmPRzd+HBxTYP2607x3mM9hNH7qqLsUx//psUILdwCu+WyMjnoDq
aBGDMcH3iVDBgOShehzjEIHY1VaPRQx8Wk7tSy+bClsN5d9MnPJ/f02GHSgv
v5TQXen3insrxC6KQomjsd9HJ6hry/mQEqCbfcXCwDk0PzcRdh1xnH2azWLz
VvpFXNqgwvbsn/5rXYm10TByf/0LAkQ/Lg==
                "]}], 
              
              FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1,
                3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 
               0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 
               3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {
               1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 
               3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 
               1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 
               3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBOIAIGYC4thdnjxMu20c/oMBtwOMP2MmCPA6iHgE/JEw
RvDBtCQmP/jt5Y8zHAXg/CQvlYunO8ThfP7YgPtG6lIO9/fxzTG+ZA21T9pB
X2ul8IUvVnD++ygnuxeWCH6MguPH5DuWDtuDrSL+s0s5THfuznm+29Ih+HeJ
TZqCpMPOW11/U6dbOjCAQIK0wxKQBcqWcP1FGRPf1sy3gPMvKN3+WXfLHM5n
XTzJirHW3OHDhoDsWdclHQKzZ5XPSTJ3WM3SfXjmfwmHh8dn7J6WgMmH6Vcz
5FgjY2Xm4D5PJdZ4JoJfcTF8QtoZKYcNU1I7kvci+GfAwMyhx+sVi8lEBL9d
b0X+zM8ScD6v//opqR4CcD4svDM2vyreuhXBh9mHzofFZ55Q84FTE80cLPxL
T5w14HFwaHp0fMZrBH/Z7CMKG5TM4XxQcJ+JRfA7vty+3rgZwX99wFLZi9sC
bj6MD7O/YE337YwGczg/DQww+cKVk0rOugjA+eDw0RGD88HKZ0o6rAeFH6+F
g4kxCEg7GDdsd2iahOBXRqwwPSttiZAHA0to+pOE81lknKbO2isO58Psh/Fh
7tvaUnNhsySCD0xd359MtMDgw/wPVv/SAh4+2Zw/F6Q7W8L54PRWheCng+MP
wWdfIxOVwm0F54uD8luyFdx8GB9m/40MhvzGJwj3QdIHJh/mPxgfFr4wPix8
t5j/OJSSZQUPvysVL9UMXyD44PyYaQ3ng51Vbw0PXxgfFr4wPsx+GB/mvg/A
1OWdgeBfyI9nP/fSCoMP8/8D7skrmxyt4eHzBpTeZiP44lOvcGZcQvDP1Hvs
r+W1gfPB7k5G8NHLOwCAbU6l
               "]], 
              
              FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0,
                 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {1, 3, 3}, {0, 1, 0}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {
                1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["

1:eJxTTMoPSmViYGCQBGIQzeu/fkrqCgeH/2DA7QDjp6aBAJ9DwtMLSrcTEXxu
FY26nkgHhzlbb+uZXEfwv+z7uDX9mwCcDzFPEULX2zso+09aN/MMgt+59YcI
g7Gig3JORdVSFgc43zY8euN+HgeH3be6/qaKI/j8sQH3jcIV4PwWobRb/0yl
HPzlxLJ8L9s7LH/hofc/Udphgeu2z39L7KH2Szusffhy6iYeBL/nb+r3J4J2
cL6IR8AfCWNbh92JtxedeSYB5/OAwuGECJz/ui232+i2gMPaKakdyX9tHUyM
QYDbwd40bpfnHzs4f/+pha7biu3h/KtCnxzPX7N3kN+1YF8qH6/DGRAAuv/4
cgaJ8wn8cD5MPQBG2rXf
                "], CompressedData["
1:eJxTTMoPSmViYGAQA2IQfQYEeBwc0kvYNxqzCjnA+C7zVGKNKwXh/PdT+K79
jxR0qFmq4yzz295hjZAOX/o+AQfxqVc4Mw7ZO8jvWrAvlY/f4YZ0TaJRqr3D
jJkgwOvwZeetrr+sCH7tb6uCcyvs4HyNdrGb58Lt4PrrWY72G6rbOfDHBtw3
Wi7g0DM9T6j5g63Dl30ft6ZfE3Rwr27W93lm62BiDATBwnD+im8vK84cEIHz
c5pW/GZoEXNwUS1lmvXD1gFk2ulD4nDzQdqNL0vA7b9vvu/bmU+SDncKu/qe
bLKD+PuMlMN0H9EeLyl7OF9l+v8JddUIPpi6Y+9g4nillkFICh5eLDJOU2fV
SjgAAKuMnqs=
                "]}], 
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
               3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJ5IGYC4vlS+ndV/jk5bDH/cShFi9kBxr+jKbvmfzGC
vye/5u3MpcwOU527c54/dnLQ4UuvM3VndZgJAp5ODjd4b4ulfuNzMAaBz44O
B2plLdJTxOH89DQgmKYA59u9uLnml42qQ2zu0X+brJ0cIsW3X2Sw03QIP2V0
ZOM7JwcJljA+XSEduP3qdT07sz0R/JZ5Z1edD0Xwr1S8VDPMQPBZFk+yYuzV
cRA4vmtH7zcnhxlgh+o4aFpNOl3/AcE/AwJ3EPzLs57JLk9wcgivXbct6b6W
w5fb1xuLxYD+fywie7JVw0HyQLSC40lHBy431VImKTWIv5Y5OrjMU4k17lSG
82H+hfF3BFtF/H8u4+DQ9Oj4jN2ODh16K/JnGos7dMsnv4vicnIwdbxSyyAk
5BADCo9kJwfxqVc4MxZxOITMX732xn0niDlpTHD3w/gw/8H4MP/P3Xpbz2Q6
gg+LXwA7qtGo
               "]], 
              
              FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0,
                1, 0}}}, {{{44.4461, 11.662099999999999`}, {
               42.628899999999994`, 13.533999999999999`}, {40.8117, 
               11.662099999999999`}, {40.9672, 11.500399999999999`}, {
               42.628899999999994`, 12.760199999999998`}, {44.29059999999999, 
               11.500399999999999`}}}], 
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0,
                 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {
                0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}}}, {CompressedData["
1:eJxTTMoPSmViYGBwAGIQvWTvQXE1YzeH/xXro2YWKDrA+HcWnWGbuUTZISb3
6L9Nj10dTIxBQNVhhelZa79CBL9B7VDbcn4EP2Pi2xr7vS4OKtceBTOsUXbw
+dwXXLLGxcFwzaPeM8HKDse8zTsdF7g4rOm+ncHQr+JgFx69cX+KC1y/wBzj
RVvUEfzfdVl7Sn47w/k8/uunpN5wdnjFYiJodkfFIYfz54L03c4Oq2ut5Iw/
KDsUdPU9+TTf2WHFt5cVZwSUHRJm+Ij2dDk7CGZ/1GSYpgjnK55w5DSuRfAN
VSe9SE1RdNC0mnS6foKzg/Anx/NprooOzufTrj6fheA/tV9yf98yBN/i2tFc
kxXODsqxxj/TvBUdCuLZz0luhMpfVXTQSZV8FHHc2WHnra6/qebKDirT/0+o
e+zsMBMMVBxKtor+Pi3nAudbdDomPHVA8M+AgI+LQwPL0X5DcwQ/vOnowzP1
ynB+uRf76/9vlBw+Jp+J9faAyq9Xcviz8uMlXycXh+7DM+PPOio5hJQAXTDD
2eEqS+B3Rg4+B4Hju3b09jk7bDH/cShFi9thx3rm5z0dzg7paSDA5SDhEfBH
whvB/3ul4qWaJYIf4Dm3QU0Lk//jlrE30xUOB38o/zuUD05P2s4O/8GAHZI+
bBD8DyD3ByD4LGF8uptSnR3uu8Y7zjLkcKhZty2pvhLBB6fX3Qj+w5dTN/F4
usD155g0bHcIQvDZGqc6d6dg8pllnKbOquWE82H+SXh6Qel2JIL/RET25FN7
BH9rS82FzT8R/vdZxuWm+hXqXxFuOH8GKDpvIvh/Hu/NSmXidbiYD0wwli4O
T4IZetIviDnkPP+98iMwvhRA6fOtuMObR2ZSB4JdHNYK6fClzxNzqNBVlP9S
4wKJ9zMiDosmWTH6nkHwa39bFZyrcIXzYfnZY1fap7PXpB3Q8zsAefK/hw==

                "], CompressedData["
1:eJxTTMoPSmViYGAQB2IQveHhy6mbalwdxNuN9886LOUwYcEPw2dhrg6R4tsv
MthJOCQevqydKujqwAAGYg5TnLtznp92gfNvStckGqUi+GyNU527Q1wc9tfK
WqSzSMH5dzRl1/w3RvDd1xxdzhAh5fBlQ0D2rHAXCL1dyqEgnv2cZKSLg4Ex
EHyWcliy96C42mIXh/LD21xn8io5sITx6W5aCzT/25lJDFuVIPbecHHotvHc
lZak7GBx7WiuyQcXhz0vtD2Mtyk71P22KjjH4OrQfXhm/NmPyg41zfo+y4xc
HWaCgYrDHTfmCu4cBF/g+K4dvesQfNvw6I37z7g6PNjHN8d4kjKcrxJr/DMt
WgnOL78YPiHNRtHBaW3mvcJFrg49Xq9YTAxlHdDDFwAy7JJx
                "]}], 
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
               3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJ5IGYC4i+3rzcWp7k7hHGKtRvLizrA+CrXHgUzvBF3
MInb5cnj5e7wHwwkHc6AAA+CP0WCJYzvrhuc77OMy031qJvDl30ft6Zvk4Dz
17B0H545XxzO3+Y6k9eoU8xBRPbkU/s7bg4mxiAg6pAkEGG5RcAdzrcLj964
XwXBB9qmu8nU3SGracVvhhRRB4emR8dnOLs7dNp47kq7JOoQccroyEY3dwe1
J83zzr4SdXD59fb1AU/CfFUoP8bJ7sVNH3eIe+0R/D+P92alMiH4/RHd/owF
wg6beArXdAPt99iV9ulsmIDDshceev9fujnEO87amFHF5fDw5dRNPDfdHLxP
sNvODuWE8+9oyq75/5kDJx+in8NhzhGFDUUPYOHL7vAEFGDPEfzKiBWmZz8j
+LD4E6mcVHJWhd8BPX4Ba2bqJg==
               "]], 
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0,
                 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {
                0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}}}, {CompressedData["
1:eJxl03tIU1EcB/A5H5v5SM3UNS3vHpS2qDVrZkm/RdLOpoQZ+cJG6lSMUElK
yHf2UjOwDLc0yYICrZENK8GUYqk10z984AvzkWUmuQk+orJd3e6B/MLl8OFw
4P7O73eI+LQTSjqNRgPTR67pxWWTxhY5rGRpYlTpBFg8XKu3Uz3igiCo/GNe
uhwCRGT4kElXM9l/ZZSPz5dFZFZhi083IUeZDHh94xG0ei54t8b6Sg7IQFg/
flMfwYU7XjannHfJoL5kKIV2iweOvB25pQZEnR9OoaUVaLHb5OIbkuvYA+zs
M3uVCL7bBLjuH+ZBYJ/uXIAUQV1O0FbRHBeCI2OftwgQPFmYztK7cGGnkjUe
5YnA9azBj3aXoEy0S+xFOdhCfvk3ZSIBC3aKylAfBJuMkq6kEAI2Volqtdux
Gxwz6ktE2LYPy4Os9iHgxomWk+QEHBT0qKeCzfu9BCwJp57xTyJ4PVj8Rynm
wlyCPk6ejkC1Gh4cLhxvq6zDJm+noRO7klwGEOTb6G4JxdiRhboxfR6X8kUZ
Y2blBwda9qj8vXrN+xoOtF94U7OlC0HJO5WiU8KBbRJDgp6PoNcmfNGK6Qwj
t69diWEj0IqX3ib6O0BRdveL6M0IkpPIbIAJd5+OL/1Syh8ehDTO67B9PFLD
5hvXe2lQJKf3MMHb7EWz/ch5eiWFldUwgEXORwd2M/n/I9jdnKHlXKMURkMU
ErWQCejS5d2hdohyBjmvx7A1jfF5A6b6LecDrcKKnEaxu8PiXaIM623tfaRC
nWNP2VKPoKH65+MpbM3YdEWDHrswHFXnX8Vmne93MxagtXrdHSiv9Qn790Rz
qpLuBDWHTAPzHsFkBK00udsDArWmjpn65UvO56wnvNRYfy39jOCpm8A5+b4H
HP01O9NqLwP9atwhTcH4xIrGDm1nBN+zlVO2vGdpU5Kxs48N/7/3fwOzvQ4=

                "], CompressedData["
1:eJxTTMoPSmViYGAQB2IQXbNuW1I9p7eDeLvx/lmHpRzic4/+2/TYyyFSfPtF
BjsJB50JC34YzvNyYAADMYcEgQjLLREI/vIXHnr/P3rC+Vd8kwQiHno67K+V
tUhnkYLz72jKrvlvjOC7rzm6nCFCCqLuiafDlw0B2bO2SznY6FyZ9eypp4OB
MRB8lnIo6Op78knfy6H88DbXmbxKDheUbv+ss/Jy2P/tzCSGrUoOZ0Agxcuh
28ZzV1qSsgPL4klWjLVeDnteaHsYb1N28DnBbju7Fyh/eGb82Y/KDu4BfySK
93s5zAQDFYflwhdcbvxA8O9Mbm+NsvaG83lUNOp6Ir0dHuzjm2M8SRnOV4k1
/pkWrQTnl18Mn5Bmo+jAX2W22k7f26HH6xWLiaGsA3r4AgDzb5OX
                "]}], 
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
               3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJ5IGYC4oKuvief6n0d0tOAYJqCA4z/YdF6hbMZSg4h
JSrT/xf4OhQINR84lajq4HOC3Xa2rK8D99Zllcc1NRxYwvh0Nx31cahJNAo1
4NJ22MBTuKbb28dhxkwQ0HFYsveguJo1gn9DGqjSFMGfcrreY7+ujwPL4klW
jL0I/pWKl2qGGQh+y7yzq86HIvjqdT07sz11HNwD/kgUu/s4yOjfVWF7qO3A
f3zXjt57Pg63QPaUakLsN/Z1WNkU6Dm3QRXOL78YPiFtjgKcf+5Wrvis1+IO
3w2frVN94+Pg/8TzkullfocYJ7sXN218HP483puV2sQCt39Pfs3bmUuZ4fw7
mrJr/hcj+FvMfxxK0ULw5269rWcynQnuf3B4pzHBwwfGB7vfD8G/MuuZ7PIT
Pg5lh7e5zvTldFDnB4a8oK/D+yl81/5HCjqUPJgjuDTW1yFSfPtFBjsxePyd
B/knW9oBPX4BkOvV/w==
               "]]}, 
             JoinForm[{"Miter", 10.}], 
             Thickness[0.007807905913100294], StripOnInput -> False]}, {
           ImageSize -> {61.21664757160647, 18.058181818181815`}, 
            BaselinePosition -> Scaled[0.29350487424072735`], 
            ImageSize -> {62., 19.}, 
            PlotRange -> {{0., 61.220000000000006`}, {0., 18.06}}, 
            AspectRatio -> Automatic}], TraditionalForm], None}, {
         FormBox[
          GraphicsBox[{
            Thickness[0.12706480304955528`], 
            StyleBox[{
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0,
                 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {
                0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}}}, {CompressedData["
1:eJxTTMoPSmViYGBwAGIQXXExfELaGSmH/xXro2YWKDrA+HcWnWGbuUTZwdy/
9MTZAAkHE2MQUHVgkXGaOmuvCJz/OJihJ32DIJwf7zhrY4YVn4PKtUfBDGuU
HaaUnH0yW5fXwXDNo94zwcoOW8x/HErJ4nFY0307g6FfxaHLxnNX2iYOuP6C
ea8mzH7IAuc/z9L+Nl2WCc6/8PvY9Xk3/9u/YjERNLuj4lDzounXNMs/9qtr
reSMPyg7VN3/ccv49A/7Fd9eVpwRUHaYkCianyL3zV4w+6MmwzRFOF/xhCOn
cS2Cb6g66UVqCtD/1/J2X7jzzV74k+P5NFdFB+fF1h1zNX/A+XfEUs1OLPkJ
54s3yUwxuPzTXjnW+Geat6JD+LdYwT/vf0Hkryo66Pxex/Fv+1/7nbe6/qaa
Q90zj8FhJhioOAQ88bxkGswC57cqsKueKWGD8yH+ZndoYDnab2iO4Ic3HX14
pl4Zzi/3Yn/9/42SQ6zeI2vD12wQ+fVKkPDoZnPoPjwz/qyjksMG6W26p958
t7/KEvidkYMP6p5v9uB40eJ2OHnYaW3mva/26WkgwOXAute8jSHhDZy/avr9
TKPHz+H8rYL+ZcbKTzD4QFu9ma5wOGyB8r9D+Qkr9R6ktj2x/w8G7A7vGXfp
p297Aedf6WQJPrvmLZy/5Nbyx4bNH+3vuwJTliGHQ4xqhMy5P5/h/Adg+g+c
3wgKp+9sDjD9F17wJaV3scP5TxIXXjNZz4HBZwal61pOOB/mH7+LE2P+MSP4
IpWTSs6msMH5wW8vf5zByATnA3mNp3YwOoD9K8IN588ARedNBP/P471ZqUy8
EP8xszk8AeWjC2IOPifYbWdPZXNQAKXPt+IOElOvcGYsYndYK6TDlz5PzEFf
/OPcGaZcDmfAQAQS39r8cD442fwUgfNh+dljV9qns9ekHdDzOwDHSclA
                
                "], CompressedData["
1:eJxTTMoPSmViYGAQB2IQ/WHReoWzEqIO4u3G+2cdlnK4+IIvKf2VsEOk+PaL
DHYSDmuEdPjS9wk6MICBmINI5aSSsyr8cP5Wrw0Wc3ZywPlPEhdeM1nP7rC/
VtYinUUKzr+jKbvmvzGC777m6HKGCCkHmY1i85kesDt82RCQPWu7lIPW73Uc
/76zOxgYA8FnKQew+2bwOJQf3uY6k1fJIeTt5Y8zHHkd9n87M4lhq5JDahoQ
PON36Lbx3JWWpOzQrsCuemaLgMOeF9oextuUHWbPBAJLQYfuwzPjz35UduDx
Xz8l9YSQw0wwUHHo0FuRP3OyCJyfEnFUeuZyMTjfdZ5KrPFMcYcH+/jmGE9S
hvOB5M+0aCU4v/xi+IQ0G0WHPYm3F51xE3Po8XrFYmIo64AevgDTN5IN
                
                "]}]}, 
             Thickness[0.12706480304955528`], StripOnInput -> False]}, {
           ImageSize -> {7.867666251556662, 16.338709838107096`}, 
            BaselinePosition -> Scaled[0.32439307852814453`], 
            ImageSize -> {8., 17.}, PlotRange -> {{0., 7.87}, {0., 16.34}}, 
            AspectRatio -> Automatic}], TraditionalForm], None}},
      FrameStyle->Automatic,
      FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
      GridLines->{Automatic, Automatic},
      GridLinesStyle->Directive[
        GrayLevel[0.4, 0.5], 
        AbsoluteThickness[1], 
        AbsoluteDashing[{1, 2}]],
      ImagePadding->All,
      ImageSize->350,
      Method->{"CoordinatesToolOptions" -> {"DisplayFunction" -> ({
            (Part[{{Identity, Identity}, {Identity, Identity}}, 1, 2][#]& )[
             Part[#, 1]], 
            (Part[{{Identity, Identity}, {Identity, Identity}}, 2, 2][#]& )[
             Part[#, 2]]}& ), "CopiedValueFunction" -> ({
            (Part[{{Identity, Identity}, {Identity, Identity}}, 1, 2][#]& )[
             Part[#, 1]], 
            (Part[{{Identity, Identity}, {Identity, Identity}}, 2, 2][#]& )[
             Part[#, 2]]}& )}},
      PlotLabel->FormBox[
        GraphicsBox[{
          Thickness[0.004447607187333215], 
          StyleBox[{
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1,
              3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3,
              3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJx11A1MU1cUB/AHreCilg8phZZ+2jKhG7oWRoMs/NnCVNxWgi6tC2wU+sFQ
RogEWZBFGwKLmElYcFSnQ7ekRtlwm4pDxTHCINAyOnFh4KxTE3GZQx1jaLFv
fS3cJks4yc3LLy/3vHfvOfdKiyvyTSyKokJ8Q+cbob5B+0OIRrtuSMWWYNFG
N7eXDpNi/vblMpNViOxn1OX0H1IY9f0Cm10AFud4rnNEBvvsvRpHOx+n6zJE
6rw1gflX4tHRNFlKVaxB/v2rD9uyuejlJW5dxpKjtU7Hpj1RSHNueMNVKcdP
E+W8w01R+L5OqLHUy+Ga4hRbTkUi8l5XJ+uuHMsUjrNPT0fgTc7z3xzVKhBR
mOdWWTj4TR62r/V20Mdzzv/99Gwi8beD1T2fda9FrXtuQr1lNRz+SMZ2XpeL
usEjro82T3hbE4glg76VOkWQTT7+oKwgifi1wfCXjnCfJZ7J3d6gqU7EwJn9
6aqDItwaaLt4aFRBbCy8/irrQtC39L4P71UgNXusjnoU9MZu8yNnrJg4csfD
JKoh6A8zN3ebW8R4UlDe721RgNeovnK4T4y5H4ynimYUgTqkSKFj9medkthi
ZkIJE1PHWcmS/jL6OY7lRtAPkqgf1eMSpP/SX55atPD+IwnWNbfPvRCmhLi7
vcc0IsLdMuXsJ0eT8Kk9445Zs9A/ciV2u3TN5pV8ku+7rRl6OjyOeHff+Rzb
/SjiasbO5TD0XVWabGuJhfapTSluBbG//hFyHGD2Q7UKOmv/7w5aBmabKG8k
LhomTzgOyVDC9GdjFIZ7lFa6ToYLObZVqndjAn0gkIFi4iY30KfT0sD8t+Mw
LXin1myTYpunKtNMxYOu6XzLtleKS0zeMD6mT3RKnHOSwFPDxyu8sS7HrxKk
qpkQ4H39yTTnlqD9dcsXEY8L9hhU1+IxyvT7Ch5upvfMOlRcbOzot1OaaOJ/
B2qvDdWvJP465b3PQy6xUHWO6xn+K5b4zxoHTHsSiP19WS5Es4FbYRSxA+s6
JkJxrtw1XMpGgUKfMJIgJn7drbIPvyzGNuZ87mMDVl8HH1nagbqLUWmvOuPV
shfuBwlGmfO6n0Uc7j+vocTaO5t/Tvs4FNeZ9f8jxkF9kzZkfSjymLxSMTad
0w6UNDzJ8udJ5uKA7+2x3sdZCR30rraKGOIOdlOfjV6NzB1dhaVfeZb0ztai
Ss2ueeLxWNOLg1/MZ9X4+zIGl62pJa4Zb9YQ0x/OGBiY/ZhiYb2iZco0xsOY
b7VDmjDstJ70UOxYLNfUJ6dtWIHFfA+Y+sdFEwuZ/9TGES/en4H5fPz/fv0P
ELNj9w==
             "]], 
            
            FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0,
              1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {
             1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 
             3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1,
              0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 
             3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxl1F9IU1EcB/CrbpjU1P6gbpPa/78qwxmUjDgToRrklmMokalbW3O1JrJS
wYfKh0arsKnkRg6iF9OiGYIvmZGBghu0eijqYdJLf4UkkIEP696rv98Fd+A8
fODc8zvne3/3Sp2BVncRRVEF9LTRs5CejtLal5NldSTHjr0EPBFlhoAsaxsj
q7kadJId+bavf9yYMJejnRZFejVUiS7rsGXq1SLSVjmfpk7U7NQTk+z67zfH
h3Xo69bDFT6BFm37Ih7qbtWQeXtje65YRN5JEn3e/Rpi3wqaPBIhKbW+GHOv
qAnFjC4x+dZOF1hT4fM3fK+Co5+VaFPGeu9hiwIdqpsKREfl5G/Cdjn2SUiK
Sh9bUhfkZIYXXormqshEONuSPJdveF5i3nAlBVJyMq7oMEY5D6TbRjxJETEo
Iz/ch2RoIztk5K7lF6/hAefbzDn+VaEFzL1OlaMh78XNZITic4Z6uw3vU7Ji
LjEuSMkx67WVlGEfebr5cyDZK0PPhL96qQxnb7B41uiQc+tvnT09SSnQfWLB
Wm1CgfuDoX7zyPABT0yOvuRhRr4PDkaCqeZyNJtPTQWaXR4Vkuzbi9NdcwrS
wOYgJoWxPeL4ayWazTGtQrN9QKl3+k+I5lU3jccWKtFQHwzn4z+JNBakVOjE
mDvkWlDmGe7PY9b7VZhP7zM6UIkazfbbfc5eKnCTx9egpzc+nHEmOLPfW6cW
9wdDfbpL+x85Nejt/sg33A8M+YIh38KSO0dcV7WYX3P4yvetHh26n/ke/Xr0
dh095guGfMFQHwznG+qudxh8nE2D7VNH/bo8w/3Pzy7+iVfruXyZfnvPeXmp
6XkP/T8BG6K6qvE5zuw2nbXo3f+7/wUrGz8=
             "]], 
            
            FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 
              1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {0, 1, 0}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGCQBGIQ3chytN9wu7HDfzDgdoDxU9NAgM9B3ZBjjYwWgl+7
bltSvaSxw5ytt/VMriP4X/Z93Jr+TQDOh5in6JAO0vbM0EHZf9K6mWcQ/M6t
P0QYjBUdVtuFR2/MN4LzH4vInnxab+Sw+1bX31RxBJ8/NuC+UbgCnN8ilHbr
n6mUw9aWmgubLY0clr/w0PufKO3AvkYmKuW2IdR+aQdxj4A/EsUI/ofkM7He
FQZw/p+Y3KP/jPQddifeXnTmmQScz+O/fkrqCRE4/3VbbrfRbQEH8d+n351M
NnAwMQYBbofls48obEgyhPPB4XULwbevjFhhamvkIL9rwb5UPl6IvUD3H1/O
IHE+gR/Oh6kHANmft1w=
              "], CompressedData["
1:eJxTTMoPSmViYGAQA2IQ/R8E6o0c0kvYNxqzCjnA+C7zVGKNKwXh/PdT+K79
jxR0eMA9eWVTopHDGiEdvvR9Ag71v60KzmkYOcjvWrAvlY/fwaHp0fEZpw0d
ZswEAV6HaAXHj8k5CP6TxIXXTPgR/Ilva+xN9xnA9T/P0v42vdfAgT824L7R
cgGHz3+vVLwMM3D4su/j1vRrgg4bHr6cusnHwMHEGAiCheH8Fd9eVpw5IALn
5zSt+M3QIuawuvt2BkO8gQPItNOHxOHmg7QbX5aA23/ffN+3M58kHVxvfPji
JWnocAYMpBz+b6r+tKEBwe/+m/r9yUMEH2yOs5GDieOVWgYhKXh4scg4TZ1V
K+EAAC3XrIk=
              "]}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1,
               4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}}}, {{{22.699600000000004`, 
              9.905859999999999}, {22.699600000000004`, 
              10.239799999999999`}, {22.4152, 10.499600000000001`}, {22.1059, 
              10.499600000000001`}, {21.747299999999996`, 
              10.499600000000001`}, {21.5, 10.215199999999998`}, {21.5, 
              9.905859999999999}, {21.5, 9.53477}, {21.808999999999997`, 
              9.299999999999999}, {22.093400000000003`, 9.299999999999999}, {
              22.427299999999995`, 9.299999999999999}, {22.699600000000004`, 
              9.559769999999999}, {22.699600000000004`, 
              9.905859999999999}}, CompressedData["
1:eJxTTMoPSmViYGCQBGIQLeER8Edis5mDx5qjyxksRB1g/L8f47YaMYo7vIty
snux0szhPxhIOuRw/lyQLozgz/AR7fHaZQrnM4BAg6lDkpfKxdMvJOD8NSzd
h2fOF4fzNT6pvJzlKQbXb2IMAqIOTYGecxvEzOB8mXlxmqcDEHyv6mZ9nzQz
hxjVCJlzNaIOGZtfFW8tNXOoOLzNdeZaBP/P471ZqUwicD7Y3gUCcPs+LFqv
cFaCy8Gj6Cf/y+WmDt4n2G1nh3LC+Xc0Zdf8/8yBkx/vOGtjRhWHw9z3y495
b4f5n91hgY3OlVnHEPxzkoG3pO8g+LDwFamcVHJWhd8BPfwBM8Ws2g==
              "]}], 
            
            FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 
             3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {0,
              1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {
             0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 
             0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3,
              3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 
             3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGIHIGYC4sTDl7VTPzo6mBiDgKgDjJ8GBmIQ/kUE//qH
L16RcQg+t4pGXU+ko0PAfaPlpx8h+DJr/hfPWC8B55vZ7A2a5qgJ589ZpLzz
j7oW3Lx0sHlacPtQ+B8x+cc1rSad/q/l0L48/JQRC4IfP8NHtOeRA5wfXKIy
/f8DB4ftDk2Pjv/QcrAPj964/4qDg//FiTH/mrUc1t6IL/Pns3cwcbxSy7BJ
0kHEI+CPRLGNQ02iUahBl5YDSxif7qZYG7h5b3j3GcyMQvBbQfaLIPjvo5zs
XlhaYfBh7udh0m4Xq0Twz4BAjDWcD6Gt4eED48PCD8Zfw9J9eOZ/STgfFt4w
Pix+YPaj82HxnQAKz04rhwu3csVneYs62AODaYa2NZy/3PSstV8jgu+u91/x
7zUEX/0tMEAqbeD8+t9WBedO2MDNh/Fh9oPFN1tj8Le7zuQ1WikB5+uLf5w7
46sknD/hbY29qZyWg/6EBT8MtyH4KZKPIsSn2zlMrQ1n+S8t5uAvJ5blu9jO
4aY0MAanijqUghLcGju4eyqW6jjLnEbw59roXJn1DMFf//Dl1E1v7Bx6vF6x
mBSKOqzpvp3B8N/O4cILvqR0LTGHxXsPiqt9doDHF4wPC38YH5YfrBl9W3jf
O8D9C47vHgRf+JPj+bRYTD7MPe6qpUyzGhzg4fs7Jvfov18I/s5bXX9T1R3h
/NePzKQOBCP44PA6h+Cj53cAcsmbfQ==
             "]], 
            
            FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 
              1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {
              1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}}}, {CompressedData["
1:eJxTTMoPSmViYGAQA2IQvVEvbzHjEmcHE2MQEHWA8dPAQMxBwfFj8hlXBJ8B
BBycHQ7UylqkL0Hwk7xULp7ukIDzIeapOvxe+fGSb5aTwxkwUIHzIfIqDuzn
JANvnUbwZ4LATSeHFyCFvAh+iU3aAqN7SnB+u96K/JmTJeB8mPtWCF9wuXEC
wWcO49PdlIrJh/l3+3rm5z0TnBwu3MoVn+Ut6rD8hYfe/5sIfjpIG5sznP8k
ceE1E3EEv7Cr78mnfAQfPTwBtS2ISg==
              "], {{38.59959999999999, 
              12.493799999999998`}, {38.59959999999999, 12.8648}, {
              38.302699999999994`, 13.100000000000001`}, {38.0059, 
              13.100000000000001`}, {37.65979999999999, 
              13.100000000000001`}, {37.4, 12.8277}, {37.4, 
              12.493799999999998`}, {37.4, 12.172299999999998`}, {
              37.671899999999994`, 11.9004}, {37.9934, 11.9004}, {38.3645, 
              11.9004}, {38.59959999999999, 12.1969}, {38.59959999999999, 
              12.493799999999998`}}}], 
            
            FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 
              1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {0, 1, 0}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGCQBGIQfXDFEj+Hz24OfRHd/owBog4wfsXF8AlpZ8Qcfhg+
W6fag+D3lRZK8za4OYS8vfxxhqK4Q0FX35NP9W4OzUJpt/6VSsL5JsYgoO1w
48MXr8hlrg5nQOCNFpwPkddyEPnkeD6N1w3O51LRqOuRdHO4UvFSzZADwY8Q
336R4Z4GnK9wwpHTeK6ywwrTs9Z+P10dbknXJBqFqjh4BPyRKN4OM1/VYdkL
D73/kQh+w03byogVLnB+xBv93er8Lg4zhDy/GN1SgvPB8pPl4fxIkP11kg4z
QWChC8Q/Z0Qcluw9KK7m7Qrnf0g+E+t9AMEHhx+Lm8Ofx3uzUpXEHba21FzY
DHT/nvyatzNZJeB8mHoAfkio6Q==
              "], CompressedData["
1:eJxTTMoPSmViYGAQA2IQbaNzZdYzUTcH+V0L9qWek3KA8c/s0276/1YSzk/x
Url4+oSkg6bVpNP1DG4OnrvSPp3dJuHw5pGZ1IHbrg4B942Wn2YSd5giwRLG
N9fVYSYYiELUByD4H1pPhhzUQPB/1mXtKWl2cfiy7+PWdDExOD81DQja5OH8
dr0V+TObFR0UHD8mn5nq4qDsP2ndzBolh6tHc00atrs4zBTy/GLkpexQwjSL
Q/qai8OMCfxVZtwqDgFyYlm+wq4OZ8BAxeEEyEHxCH7EKaMjG/ch+CKyJ5/a
f3F1uKMpu+b/ZmWHTTyFa7qZ3RxCfpfYpAUow8MjHeS+Z0pw/vspfNf+30Tw
34L4mUoOAI+poHU=
              "]}], 
            
            FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}}}, {{{46.3, 
             7.599999999999999}, {49.399609999999996`, 7.599999999999999}, {
             49.399609999999996`, 8.199609}, {46.3, 8.199609}}}], 
            
            FilledCurveBox[{{{1, 4, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1, 
              3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {
              1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 
              0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 
              3}}}, {CompressedData["
1:eJxTTMoPSmViYGAQAWIQnZoGBGq+DrcXnWGbuUTJAcYXeLl9PbO7usPSFx56
/yN9HI5rWk06/V/LoWSr6O/Tcd5w/mQJljA+X08MfjrInDQth5aaC5sjcxH8
GTOB4CGC/+X29cbiZ54OcxYp7/yjjuCb2ewNmuaoCefLrPlfPGO9BJwfcN9o
+elHYnDzwMalicHtg/Fh7kHnmxiDgCjcPzC+yvT/E+qifeB8WHjwxwJtTJdx
QA8vADyRhPU=
              "], CompressedData["
1:eJxTTMoPSmViYGAQA2IQnZoGBMt8HJwnNAulrVJygPEVHD8mn/FVdLANj964
f4mPw1bXmbxGnHIOa7cl1d/09XHoj+j2ZyyQclCZ/n9CnbSPg3DlpJKzKRIO
/0Fgv7dDGhiIOTwRkT351B7BP65pNen0fC84f/3Dl1M3xSD46vzcW5dFejmw
yDhNnbUXwZ+93OpJWoQEnG9bGbHCNFcTzt9yomzffCstuHnpYPO04PbB+DD3
wPgtgZ5zG/Yh+Ev2HhRXU/ZBNT/Rx0GCJYxP95I6PHzmGC/aYi6hBuff3ZAb
mLZY2QE9PAFOCYyy
              "]}], 
            
            FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 
              3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1,
               3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGAwBmIQfQYEdAIcMkrYNxqnSjrA+H8e781KVZJxmAkCkpj8
qvs/bhl7S8L5KRFHpWemiznsvNX1N5U9wIEBDMQceFQ06np++sP5BV19Tz7t
x+TLrvlfPKNfAs7f5jqT18hTEqG+PWBp2n0FOP+0a416mq4SnC9cOankrIqy
g+/nvuCSGn+Hr16RbRZiKg4M2u1iN938HV6xmAia3VFx6Pmb+v0Jo7+DiTEI
qDq0BHrObdjnB+ebdzomPHVA8Hn8109JfeDrwMy30OvsO2U4f/ZyqydpGUpw
vvOEZqG0XYoOOSYN2x1++TrseaHtYZymCPG/pB+c77I2816hE4K/AxRe8X4O
wb9LbNIuIPgQeSU0vrJD7U3byggNBD/+8GXtVEEEf8kkK0ZfEz+HDVNSO5Jt
VRzuSNckGtX6QeJpporD0hceev93Ivih81evvfEfwQe7N9LfYW9+zduZW5Xh
/Le8+wxmzlKE86tB8b9awcGC0beFV93PwXWeSqzxTAWHJXsPiqtt9nXYWytr
ke4iC+cDTVNlXCUJ53usObqc4YeoQ0iJyvT/wPAGp7szIhDz5iP4MU52L26y
+MP59/fxzTH28ndQPOHIabxWzOHq0VyThnR/h1P7tJv+v5VwYAnj092U6+8w
d+ttPZPpYg7z0ze/Kp6L0G+x5UTZvvsIfoiB1kphhgA4H5b+p9aGs/yvFoXz
YfkDAJSQXZk=
              "], {{62.699600000000004`, 7.002729999999999}, {
              62.699600000000004`, 5.818359999999999}, {61.81369999999998, 
              5.419530000000002}, {61.291799999999995`, 5.419530000000002}, {
              60.69730000000001, 5.419530000000002}, {60.199600000000004`, 
              5.85469}, {60.199600000000004`, 6.434769999999999}, {
              60.199600000000004`, 8.030079999999998}, {62.262899999999995`, 
              8.175389999999998}, {62.699600000000004`, 8.200000000000001}}}], 
            
            FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 
             3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0,
              1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {
             1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGIZIGYC4uyKqqU6xoEO/LEB943UpR1g/Ddtud1Gt2Ud
LFzdi37KY/IrLoZPSPORhvM79Fbkz/ws7hDoObdBjSvQgQEMxBzOgMCbADg/
ISRIfcFOTD7Y/GopOB+sD2g+jJ8GBioOuYsZ97CqBWLwT2haTTr9XwWuHp0/
30bnyqw0TQddRfkvOcsQ/PcnDzutXRrg8Pdb6YM5huoO8mJZvp+7AhweHZ+x
e9oHFYfP8pfy490DHE4BlWXeQ/Bh9oPNa8Pklx/e5jrTVxrOv/iCLyn9lajD
60dmUgf2Q/13RgRCv0DwZ4KAZCCcD4uPDQpnI0z2ijugxxcA0y+6eg==
             "]], 
            
            FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 
              3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1,
               3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGAwBmIQnZ4GBMeCHDJK2Dcap0o6wPh/Hu/NSlWScTAGgc2Y
/Kr7P24Ze0vC+SkRR6Vnpos5BJeoTP+/IMiBAQzEHOavXnsjfhqCf/neA+7J
lZh82TX/i2f0S8D521xn8hp5SiLUtwcsTbuvAOefdq1RT9NVgvOFKyeVnFVR
dnAQTjx8OTzI4atXZJuFmIqDtP5dFTbbIIdXLCaCZndUHOJn+Ij2SAU5mIAd
ruoQ7WT34uaPQDjfNG6XJ88uBF/e8WPymc5AB2a+hV5n3ynD+bOXWz1Jy1CC
850nNAul7VJ0OL858uvOaYEOe15oexinKUL8vwzBty4413FpF4L/nQ3oopOB
DsG/S2zSLiD4EHklNL6yQ0SbxbWjaxF8z+pmfZ9FCP7rR2ZSBzYHOmyYktqR
bKvi0L48/JTRjUCHmWCg4vCGd5/BzG8Ivktm/odWySA4H+xetyCHvfk1b2du
VYbz34L0zVKE86tB8b9awcFc6kC0AtA9rvNUYo1nKjhkV1Qt1SkOdNhbK2uR
7iIL5wNNU2VcJQnne6w5upzhh6jD4cvaqZLA8DgDBiIQ814i+Md37ehlkwmC
8zl/LkjfbBfkoHjCkdN4rZhDS82FzZG+QQ6n9mk3/X8r4TD7iMKGooAgh7lb
b+uZTBdzyPT93BecgdC//fPfKxWdCP77k4ed1s5E8GHpf2ptOMv/alEH9PwB
AE2rXgc=
              "], {{73.0996, 7.002729999999999}, {73.0996, 
              5.818359999999999}, {72.2137, 5.419530000000002}, {
              71.69179999999999, 5.419530000000002}, {71.0973, 
              5.419530000000002}, {70.5996, 5.85469}, {70.5996, 
              6.434769999999999}, {70.5996, 8.030079999999998}, {72.6629, 
              8.175389999999998}, {73.0996, 8.200000000000001}}}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 
              1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {
              0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 
              0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 
              3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGBwAmIQLfLJ8Xzax1CHZqG0W/9CJR1g/OUvPPT+L0Tw72jK
rvkvLOVwBgReIPghJSrT/z/A5Ks/aZ539pSkg2+SQIQlkP/QNd5xVqCkgwHH
GpmoO6EO76bwXftfKeZQY28at+toqMMD833fzhiJQsxfg+Af/bep+lMHgv/v
SsVLtcZQhw69Ffkzi8UdIqI37n9TFeqwXkiHL/2fpMM9Js4u+eJQB/ddaZ/O
TpN1eHfysNPa3FCHGNUImXN/5B0SZviI9mSFOtwHmXdIwSGnomqpTnCoQzDI
3Q2KDhIeAX8kvEMdDFQnvUg9ouhwYteOXjaLUIcZQp5fjLKUHKZu4ilcwx/q
sPuFtofxMSUHDX7urcsigf7fkBuYFqzsYGIMBJNDHfaUTJZguaYC59vc9++d
vk4NzgeHL6Omw96D4mrBtqEOxzWtJp3+r+Vg4epe9PN8CJy/oShj4ts3wRj8
9DQQ0HJYscTPQfgvgg823zwEzk8ICVJfYBniMGeR8s4/6gi+mc3eoGmOmnC+
zJr/xTPWS8D5AfeNlp9+JAY3D2xcmhjcPhgf5h50PlifsaiDNw+Tdvu/YIcL
t3LFZ3mLOhj4LONysw2B8wWAwVcZjOCDwzMTwf8Liu+VCP6MPKHmA7tC4ObD
+DD7Y3KBKWY1gr/1M9CEUgT/19vXByyLQxwYQOABgg9J7xJwPiT8lBwkbp77
HnwawQenxxcI/qOXwBTBCkyPW3+IMCgrOVy694B7smSow+zlVk/SKhQdPm0I
yJ5lDE1fExRQ+QII/vSZQHBTBs6ft/W2nom4JJzvMgGUQ8Uh4Rca6qCwa8G+
1HOiDnbhwAyQEOrwBaROXNRB8e+30gcNoQ5rWLoPz/wv7KCiUdezczWCv/NW
19/U5wg+LH9XXAyfkOYj4YBeHgAAne/LLw==
              "], {{85.23750000000001, 
              11.349600000000002`}, {85.23750000000001, 
              10.283999999999999`}, {84.67770000000002, 9.499999999999998}, {
              83.132, 9.499999999999998}, {81.8004, 9.499999999999998}, {
              81.8004, 12.7094}, {81.8004, 12.991399999999997`}, {81.8004, 
              13.1383}, {82.05000000000001, 13.1871}, {82.157, 
              13.200000000000001`}, {82.51369999999999, 
              13.200000000000001`}, {82.7516, 13.200000000000001`}, {83.7148, 
              13.200000000000001`}, {85.23750000000001, 
              13.200000000000001`}, {85.23750000000001, 
              11.349600000000002`}}}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 
              1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}}, {{0, 2, 0}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["

1:eJxTTMoPSmViYGCQA2IQ/YZ3n8FMrXCH9BL2jcZPpRxg/DP7tJv+60o7xGme
FjiuFu6wXkiHLz1O2mFZ5XFNKyUE/8CbeTY6Mgh+TbO+zzKpcIdwTrF2Y3lp
h79XKl6qSYY7/AeB+1ION9f8isllDXdwaHp0fMZuMYj6S2EOM8FA1EH1SfO8
s5sQ/CcXlG7/nITgp4GAW5iDyzyVWOOfYnC+x660T2fL5OH8zq0/RBiMFSB8
oHtg/F9vXx+w1EbwWYVE7I/pYPIh9iH4qkDb0n4rOcxpUDvUxhzuYGIMAqoO
Eh4BfySWh8H5J3bt6GULQPCntLdGXeYJc+i28dyVdkgJzgeH91J5OF+4clLJ
2RRJh66+J5/ko8IczoCBiEPLgVMLXdch+En1N20rOcLhfFh88ccG3Dd6LumA
Hp8AT3bGag==
              "], {{91.89999999999999, 8.299999999999999}, {
              89.0793, 8.299999999999999}, {89.1738, 10.184}, {
              90.21679999999999, 10.399999999999999`}, {90.54840000000002, 
              10.399999999999999`}, {91.81639999999999, 
              10.399999999999999`}, {91.88749999999999, 8.70781}, {
              91.89999999999999, 8.299999999999999}}}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
              3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
              3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1,
               3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxF1HlQTHEcAPAn0ex0YNl2y1a79mWKXLvlnvYbU6qpydH0fhk21rTtqGQU
idBBhzZJ7dhtJylyxkYkJpURIiFHhNLtbCbHmFnXei96v+/MmzefP37v/X7f
4ydWxq2MtCAIwo9+mPcY7iT57QoE/etL2zxDSBix97v2ih+1JIx+q3EbLEVg
G2IsjFS7wt1++fE3Gdgc09GoKgX2FSO9AhBkV3a/114kIVnupbjmhWA8WnCp
KYyECF0QT+OMoIMcm6rtJeHZrVjPlNEIPGVMuEL2gb4vLgMU65SNtQkFR7Hv
MxFDQdbMU3H6AgnrxJvVvvrrYtbzfJ7uIpQiEP/+vrUri4LQnwmLVYQLDH0L
DM84SK9fHHBNdcgZPCIdelAmBZDWc0f3ygked3ZZFyRRoNPTkSRkbSlcoi0q
dmQ9VGjXZm7nQ2HmvtVPCilQBpKtzafsYeGo4L22BgoevIzlF0Xbg8B/+S9B
IgXiJh+OrIUHMdt3lHusomA2/3OxjjeJ9ceM2BypYQJrgfYpR11mA8tzD2/i
GkbObwWNeXMSZ5iwM05S96ShiLWZiRIEFVwPuyhvG9a9qwhNVOUE1ubPisvS
bi5UNW2rKylCIKwwx+uMPMi5Gs0xxSCo8dXbSt35wLcMs5vhh0A1HALoLTc0
ikTYw/XvpFi/fp4a71eJ7Wy/MfjrGWx1/mCyvJiCaub7AQ7gNs768gnt//o0
OIBrX/qRlgMUNOTUpXkec2SN+FdaiSOTWa9j8q0WApPe+AIKMpl+kDnB8es3
+FPpfH1i8knXM0W7NCemnoLI4f8LIXBn+qygTmyFe/P4OwPYwUq6Uz0Q6/m+
y7aYIhBEJVhdkJW7sDaIPngTp8Wsm+ump5mDp8Cu89XKPeEIat9N95fNlcCG
RW9CcuXoXz+ZJDDxi89D1VoE+Wv+LP0xSMLe5EdV4anYw/Xdh81zoicuCzt0
9rTTEzXYHRac/S55CDZz0xvudZPwfSw9YdkI3HZrrkbfJaHk7LkXEfS8kszB
Ndg1rUSnRQB2R2XsCtVXCRxq3uNfn0vvlxvwTXpG8q/f9dhMuZJKsEfui6Ey
o6ilCXvkPvkL3t7hQA==
              "], CompressedData["
1:eJxTTMoPSmViYGAQBmIQ7W3e6ZigGeGw+4W2h/E2RQcYv11vRf5MZwS/1CZt
gZGdgsPxXTt62WQiHPbWylqkq8g75Mezn5PkjXC4b77v25lNsg5cKhp1PV/D
HUyMQUDWYeUSPwfhpwg+AwgswOSfdq1RT5NVhPPDm44+PLMewTfe1XxjppIS
nO++5uhyBg1lh5aaC5sj14Y73NGUXfP/srKDiOzJp/Z7wh3OgECPikNlxArT
s5eh/DMqDksmWTH6PkHwYf5D539YtF7hrIeSA3r4AACYa3Ly
              "], {{
              97.90039999999999, 4.36328}, {97.90039999999999, 
              3.6601599999999994`}, {96.9977, 3.0999999999999996`}, {
              95.90589999999999, 3.0999999999999996`}, {94.76599999999999, 
              3.0999999999999996`}, {93.89959999999999, 3.68398}, {
              93.89959999999999, 4.36328}, {93.89959999999999, 4.45859}, {
              93.92340000000002, 4.923439999999999}, {94.37459999999999, 
              5.2332}, {94.63549999999998, 5.3999999999999995`}, {
              94.74259999999998, 5.3999999999999995`}, {95.57339999999999, 
              5.3999999999999995`}, {96.5586, 5.3999999999999995`}, {
              97.90039999999999, 5.3999999999999995`}, {97.90039999999999, 
              4.36328}}}], 
            
            FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 
              1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {
              1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}}}, {CompressedData["
1:eJxTTMoPSmViYGAQA2IQ7dyd8/x3YaSDiTEIiDrA+GlgIOZQJbLO/aETgv8f
BOwjHQ7UylqkL0Hwk7xULp7ukIDzIeapOvy9UvFS7WqEwxkwUIHzIfIqDqcW
um77zBoJ54OV8UQ6vPi98uMlXgS/xCZtgdE9JTi/XW9F/szJEnA+zH3Kt3/W
ZbEg+Iza7WI3L0Vg8GH+vXO9sdjtRYTDhVu54rO8RR1AzvkLNA/GBytTRvDv
qLA1TtVG8MH+DUfw0cMTAKH2nlY=
              "], {{101.1, 
              12.493799999999998`}, {101.1, 12.8648}, {100.80299999999998`, 
              13.100000000000001`}, {100.50599999999999`, 
              13.100000000000001`}, {100.16, 13.100000000000001`}, {
              99.89999999999999, 12.8277}, {99.89999999999999, 
              12.493799999999998`}, {99.89999999999999, 
              12.172299999999998`}, {100.172, 11.9004}, {100.49299999999998`, 
              11.9004}, {100.86399999999999`, 11.9004}, {101.1, 12.1969}, {
              101.1, 12.493799999999998`}}}], 
            
            FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0,
              1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {
             1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 
             3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3,
              3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 
             1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxl1F9IU1EcB/Bpoj74D3E6Vphu0xct/xXiS/s9RCOkrJR090LKMBPJSWWW
JUJqaUigWcylKQW5jGUgPYSJTUgLGTUtKGe2rCwkRYUQw2qde8fv/MgdOA8f
7j33nPM9v3MTTVVHjm9RKBQBrOezHsh604/DT+LnRdiVJTUloMvkFgsrUwdM
UQ5y2qwu+NJDslNqdhEWr1S2Zs7Ecc/cdQZbSxO4T0iv92m4W2yFE5kFWoCS
eZemS4ROb1v9hloHz3rVabNNItTkxcdWhCdBwZd7Xc9LcH1JkDp4e9m2j/zV
pZn5FUzefplt4JsAtZ51d9ZTLXjyrlnMbgFKPcpR77gGDHMXYgZeC7BiG8/N
7tdB21KdfnefwMd/3+hfnTpLDrFvE0pTyPL7EQJYWtcPOtVaXz6hAixvLb5Y
ZtVA9zL7cIi/cbwipTl2usfoy8Gp4/Y918F6fcVw9Rtyp5W1aSOkrllmO0LI
BvuYTfFew928836VtUPFjecTFsgmmCTjfJuN528xRzc6Bo3gclfG3cpVQvlw
dYfqA1mK7eoqWc6T7Q+tkgokg/zodHn70l6Bfx+N80c1OibuKIX/6ynM3x+z
R9ac11XcvvNM4FZI7ZAWvFLTC7AYPpJufaADaflBZvK5heSM0G6yry4FaJHy
O6PlLmwYm3N6E7kbo8vcf2+quHF9snvIcj2a/Y37r4sZMMw1UD55pqiiHDtZ
Pr9Rcio7nlfvyL/fnl9IDhC5b6iCjkYo6f6icf6TUkF/pvX46sPfmC8a80Vj
vj//sAVEiDw/uX72kCOLch6/NJPl8bUizxeN+aIxXzSuT97vKfKLmpFetd7f
uP/iof1hgfmUT3oou8B1ZHZ7jw21kyN3SD8U8idWzoZJ8ub/4z//sDR1
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 
              1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}}, {{0, 2, 0}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["

1:eJxTTMoPSmViYGCQA2IQLaF/V4XNMNYhvYR9o/FTKQcY/8w+7ab/utIOpfvm
S+nrxjqsF9LhS4+Tdsi35bq+WAPBP/JVI6ZfCcEH61eMdQjnFGs3lpd2SLG+
798rH+vwHwTuSzksKQAawB3r4ND06PiM3WIOMiD1N2McZoKBqMP75ce8zXci
+Fd8kwQiZiL4Z0DAJ8bBZZ5KrPFPMTjfY1fap7Nl8nB+59YfIgzGCg4u2z7/
vaIQC+fPABljiOCbGIMAJh9iH4KvCrQt7beSQ8AOudbXnLFQcVUHXaDzG9fG
wPmpaUAQhuCDaeEYh24bz11ph5TgfHB4L5WH84UrJ5WcTZF06JmeJ9ScEAPx
xxkRhxdqhhxrtiD4DNrtYjf5YuF8WHzxxwbcN3ou6YAenwARi7rq
              "], {{
              115.99999999999999`, 8.299999999999999}, {113.17899999999997`, 
              8.299999999999999}, {113.27399999999999`, 10.184}, {
              114.31699999999996`, 10.399999999999999`}, {114.64799999999998`,
               10.399999999999999`}, {115.916, 10.399999999999999`}, {115.988,
               8.70781}, {115.99999999999999`, 8.299999999999999}}}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1,
               4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}}}, {{{119.30000000000001`, 
              9.905859999999999}, {119.30000000000001`, 
              10.239799999999999`}, {119.01499999999997`, 
              10.499600000000001`}, {118.70599999999997`, 
              10.499600000000001`}, {118.34699999999998`, 
              10.499600000000001`}, {118.09999999999998`, 
              10.215199999999998`}, {118.09999999999998`, 
              9.905859999999999}, {118.09999999999998`, 9.53477}, {
              118.40899999999998`, 9.299999999999999}, {118.69299999999998`, 
              9.299999999999999}, {119.02699999999999`, 9.299999999999999}, {
              119.30000000000001`, 9.559769999999999}, {119.30000000000001`, 
              9.905859999999999}}, CompressedData["
1:eJxTTMoPSmViYGCQBGIQbWIMBJdjHTzWHF3OYCHqAOP//Ri31YhR3MG00zHh
6YVYh/9gIOmgwtY41Xk1gr/Addvnv1MQ/NQ0IGiLdUjyUrl4+oUEnL+Gpfvw
zPnicL7GJ5WXszzF4PrB9hqLOpS/VDPkWIPgbzlRtm/+LgQfbM3+WIcY1QiZ
czWiDksKbLmuH451qDi8zXXmWgT/z+O9WalMInA+AwgsEIDb92HReoWzElwO
Kz5e8k2aEOvgfYLddnYoJ5x/R1N2zf/PHDj58Y6zNmZUcTj4JAlEWML9z+7w
ASgtMAPBt+G6vrhgLoIPC1+RykklZ1X4HdDDHwBW+bqO
              "]}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
              3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 
              3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGDQAWIQ/X75MW/zxAQHpwnNQmlSEg4wfpKXysXTHRIO4ZZb
TpTFIfiRKdb3/WMR/PlS+ndVohD8rxox/YciExyymlb8ZkiRcKjP2lMyOSLB
YfkLD73/jBIOkyVYwvhCExxk1/wvnnFezOE/CHgnOKwAyR8UdTgMMsAJwU9P
AwIzTH6njeeutEsScP4aIR2+9H3SDiUgC4DudeY0zv1/SsEB5Px96QkOe/Jr
3s68qoyTfwYEeFQcvgc/Xjo7BcFvmOrcnZOM4IO4z+MR/NeBO+RagXwXUPj9
UnY4vdB122dg+KhcexTM0KPssB8UQED/l9qkLTCqU3JYOvuIwga/BIeVtVZy
xgsU4O6/a77v25kgWTjfeFfzjZmbEPIZJewbjVmVHRQ2FGVMVExwMDEGAVWH
nOe/V378FA/ny0QBI6gfwQe7UyfeIRVkzjFFOP8vKNz3y8D5N6VrEo2mSjic
Abk/NB4ifkbEYf8poMBiBD92lycP02UEv8beNG4XKzQ83og6gILviEKCw3qF
sxEmeyUc1A051sioJTjEqEbInJMRcwAF12vDBLh+oOsv+Toh+J//Xql4GYbg
w9Ljm7bcbqNqcQf09AoAY+1C4Q==
              "], CompressedData["
1:eJxTTMoPSmViYGAQAWIQ3TDVuTtHPsGhx+sVi8lHSYcpQO7z3/EOGxTORpjI
ijnotIvdPLc/3qHi8DbXmWtFHUr3zZfSX4rgr5GJSrHOR/D/g0B8vMObttxu
o90ScP6fx3uzUpmk4fwvGwKyZ4nLOph2OiY8LYh3uL3oDNtMFkWHfFuu64s7
4h2cxa9sPxOp5PBk6ewjCiuA5hVvFf3NreLg3zs9T+hyvMMZMFBxkN9QlDHx
K4IPNh/oH3S+q2op06wdinA+A99Cr7Nx8g6hfLqb5gL5/RHd/owbpOF89zVH
lzPskIKrfz+F79r/SikH9PACANsunzk=
              "]}], 
            
            FilledCurveBox[{{{1, 4, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 
             1, 0}, {1, 3, 3}}, {{1, 4, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {
             0, 1, 0}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJ+KN0udvPc9/eJDu+n8F37f1LJAcY3MQYBZYcjChuK
Ml4i+O4Pq0TWPUbwN58o2zefCcF/AJR2/5sA56enAcE3TP5qlu7DM88rwflg
Ok3JwbzTMeHpHwQfZj6MD7MfxpfWv6vC9hLBh7kfnY/uP/7YgPtGx2Xg/Bkz
QUAW7l8YH2YfjA9zD4wP8y+MD/MPOt/E8UotwyUZOP8/GEjD/Qvjw8yH8WH2
w/gw/8L4MPej82H+AwB9O+f5
             "]], 
            
            FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 
             3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0,
              1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJZIGYC4v3zpfTv8iQ7mBiDgKgDjJ8GBmIOBbZc1xcz
IPjO3TnPf99NgvPPgMCdJIc3bbndRr8R/JkgsFMCztfXWil8gUULzs/h/Lkg
fTKCfyE/nv3cTC2HB1Ui69yvIvj2pnG7PM8kQdS90XTQv6vC1rgzyeE/GGg4
dDgmPL0wCZMPcZ+Gw+vAHXKtsxH8dBC1DsEHe/twksPXnbe6/j5F8JuF0m79
2yoB57tMAIr8EnMwATqH5xDC/67bPv+9sgDBbwFZOBWTDwvfhqnAEJwP9N+t
XPFZ3qIO7I1AgSMIfvk+YARcRPDzhZoPnLqL4HvyMGm3MyXD+ejxBwDr5tAh

             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJJKJ2eBgTXkh3+g4C9kgOM/2Af3xxjJxWHOUcUNhRd
SXZIib3jxmyh5mBz3793+rFkB2sQzafh0OGY8PTCtmQHmXlxmqcFtBwCeqfn
Cc1OdriQH89+bqaWw5WKl2qGHQj+i98rP14qRPAvKN3+WReW7OBj3gk0SdPB
N0kgwtIj2WGpn4Nw4mN1B1uu64sLbJMd7F7cXPMrRs1hJghYQvl3VOB8mPth
fPldC/alnpN3cDCN2+Vpk+wgkP1Rk8FNxmGBlP5dFa9khy/7Pm5NvybhUL5v
vpR+ZLJDkpfKxdMaog4b575ffqw42WENS/fhmf+FHXTaxW6ea0fwo1OAPl+J
4Ddk7SmZvCfZIadpxW+GFjEHyy0nyvYdT3botPHclRYk6SDcfODUwqvJDq16
K/JnfpaBh++HResVzt5QcEAPf7D7dyY7/P0Yt9VoIYLfDTKPSRHO/7AhIHtW
uJxDJMg9W5Md9tfKWqSnSDsE7pBrfb022cHU8Uotg5CYAyj6MqYmO+xJvL3o
jJqow2aQ/9oRfPGb574HVyP4JsDg4klKdhAEhRebmIPOJqCGqGSH87dyxWd5
S0PcC4yvHpB7jOTg/NCmow/PvFeA82Huh/GntLdGXZ6jAucLvNy+njldzeFH
8OOls2OSIfF+Rd1hjUxUinVysoMxCBRrQtJTOTB8OX8uSDfWgrsfxj/8VSOm
fxqC/xeU4ID+/w4yd4mmA0h785Zkh0Jp3ge6E9Th4QcMLZdMfTU4X3fCgh+G
bioY4Q8ABEtr3A==
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJJKG1iDASTUxz+g4C9kgOM/2Af3xxjJxWHjIlva+wn
pjikxN5xY7ZQc+BYIxOV0pziYH3fv3c6n4ZDKJ/uprnFKQ4y8+I0TwtoOQBl
re+HpzhcyI9nPzdTy2Gh67bPf10Q/C0nyvbN10Pw575ffsxbOMXBx7zTMeGp
poOU/l0VNtYUh6V+DsKJj9UduK8vLrD9lexg9+Lmml8xag7paUDwDcq/owLn
w9wP48vvWrAv9Zy8Aw+TdrvYz2QHgeyPmgxuMg45z3+v/MiW4vBl38et6dck
HFy6gSKiKQ5JXioXT2uIOtRl7SmZbJDisIal+/DM/8IOP4IfL53tguBrGAJD
IA3BB7u7MsUhp2nFb4YWMQe2xqnO3S0pDp02nrvSgiQdHgCDKW9SikOr3or8
mZ9l4OH7YdF6hbM3FBzQwx/k/LSyFIe/H+O2Gi1E8LtB5jEpwvkfNgRkzwqX
c1ADuacoxWF/raxFeoq0g1zr68AdWSkOpo5XahmExBwmAKPPNCjFYU/i7UVn
1EQdGkD+c0HwnyydfUTBAsFnBAbXTbkUB0FQeLGJOfwEBYh4isP5W7nis7yl
Ie4FxlcPyD1GcnB+aNPRh2feK8D5MPfD+FPaW6Muz1GB8wVebl/PnK7mcERh
Q1GGZIqDb5JAhOUVdYeKl0AfKaQ4gJQZF2tC0pMxMHw5fy5IN9aCux/Gn3Do
q0ZMMIJ/CpTgMlMcvoPibYmmA0i7f2GKQ6E07wPdCerw8AOGlkumvhqcrzth
wQ9DNxWM8AcAVwNLBA==
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJJKH0GBHxSHf6DgL2SA4z/YB/fHGMnFQdG7Xaxm16p
Dimxd9yYLdQcFrpu+/zXJtXB+r5/73Q+DYcPy495m+umOsjMi9M8LaDlAJS9
UiGY6nAhP5793EwtBxuQun8pcL5vkkCE5QsE36LTMeHpmRQHH3MQQ9Nhy4my
ffP3pTgs9XMQTnys7rCkwJbr+uYUB7sXN9f8ilFzYACBDVD+HRU4H+Z+GF9+
14J9qefkHZbOPqKwYVOKg0D2R00GNxkH1sapzt0HUhy+7Pu4Nf2ahMMdFbbG
qedTHJK8VC6e1hB1kGAJ49N9leKwhqX78Mz/wg4T39bYm/5D8A+cAoaAfCqc
//SC0u2fRqkOOU0rfjO0iDkskNK/q2KX6tBp47krLUjSoeKlmiEHMDxb9Vbk
z/wsAw/fD4vWK5y9oeCAHv5g9xukOvz9GLfVaCGC3w0yj0kRzv+wISB7Vrgc
xD3aqQ77a2Ut0lOkHXbItb4OVEl1MHW8UssgJOagBYy+c9ypDnsSby86owb1
H9A/MD7Qd3G7PiL4c4DBVXQjxUEQFF5sYg5TQBoupjicv5UrPstbGuJeYHz1
gNxjJAfnhzYdfXjmvQKcD3M/jD+lvTXq8hwVOF/g5fb1zOlqDnG7PHmYLqdA
0sUVdQehZqCPbqY4GINAsSYkPb1Nccjh/Lkg3VgL7n4YXyOm/9BXnlQ4PwWU
MJVTHb4HP146e4mmwxeg9pdaqQ6F0rwPdCeow8MPGFoumfpqcL7uhAU/DN1U
MMIfAI6xW0Y=
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJJKD0TBDjTHP6DgL2SA4z/YB/fHGMnFYdz34MfL2VP
c0iJvePGbKHmkCfUfODUz1QH6/v+vdP5NBz2lEyWYHmV6iAzL07ztICWQ8uB
Uwtdz6U6XMiPZz83U8uBY41MVMpuBF9K/64K21IEnyWMT3dTZ6qDj3mnY8JT
TYeGqc7dOdWpDkv9HIQTH6s7FNhyXV9ckOpg9+Lmml8xag5nQCAHyr+jAufD
3A/jy+9asC/1nLxDUcbEtzX5qQ4C2R81GdxkHC75JglE1KY6fNn3cWv6NQmH
lR+BIj2pDkleKhdPa4g6PLmgdPvnslSHNSzdh2f+F3aI2+XJw7Qbwe+dDgyB
Owj+prnvlx97n+qQ07TiN0OLmEPO898rP/5Kdei08dyVFiTp4Lrt898rHGkO
rXor8md+loGH74dF6xXO3lBwQA9/sPvfpDr8/Ri31Wghgt8NMo9JEc7/sCEg
e1a4nEMPyD0vUh3218papKdIO7S8Dtwh9zDVwdTxSi2DkJjDD2D0zT6R6rAn
8faiM2qiDk9B/tuF4AN9p92+DsEHBZf91FQHQVB4sYk5JIA09KY6nL+VKz7L
WxriXmB89YDcYyQH54c2HX145r0CnA9zP4w/pb016vIcFThf4OX29czpag46
7WI3z/WnOoCixfKKusMDYLLKm5bqYAwCxZqQ9LQKGL6cPxekG2vB3Q/jf9WI
6T90EsE3ACW4B6kOoGQ7e4mmA0j7tuepDoXSvA90J6jDww8YWi6Z+mpwvu6E
BT8M3VQwwh8A3cqCHQ==
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJ5IGYC4jQIcAjjFGs3lhd1gPHXK5yNMJGVcAjcIdf6
OjbN4T8YSDpMfFtjb+qH4HvyMGm3OyH4NSLr3B9apTkkealcPP1CAs5fw9J9
eOZ8cThf45PKy1meYg4TQOYB9ZsYg4Cow1eNmP5Dvgh+ivV9/95gBH/T3PfL
j4VDze8QdVjr/rBKJCrNQTD7oybDMVEHFbbGqc7RaQ5qT5rnnX0l6sAAAjGE
+apQ/hkQiIG61x7B//N4b1YqE4KvL/5x7oyvgg4z8oSaDwSlOfTYeO5KM+Jz
AHFPOaY5lCwv2fDvPKeDb5JAhKVDmkOTeC1rZhung0wU0Ef2aQ7eJ9htZ4ci
+Hc0Zdf8/8wB58c7ztqYUcXhcOPc9+DHjrDwZXeY6tyd89wZwQeHjzuCD4s/
kcpJJWdV+B3Q4xcA+RrW7w==
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0,
              1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGIzIGYC4gmHvmrEvE932JNf83ZmqIIDjK/g+DH5TK+C
g4Np3C7PNwi+Y8LTC0qvEfwDpxa6bnuO4IvdPPc9GMhPjjgqPTNdwQFkXP+z
dIcSm7QFRn4KDlL6d1XYrqY78McG3Dd6LuEwEwQWpjs8MN/37YyRqMPPuqw9
JdUIfkDv9DyhYASfAQQM0h1CfgNNbJCA8/eC3J8qD+c7i1/ZfqZSwUGrHegi
43SHJff38c3ZrOLw5e+Vipdx6Q4rXnjo/X+o7iATlWJ9vzjdoe/JJ/lL+ZoQ
/0xPdzgDBloOfLqb5r7fjeDfAHrv8VMEH+TcyT/SHbjcVEuZZmnA+XdU2Bqn
KqvB+R2ggGtSdWiY6tyd8z3dYcb/CXW/f6nA+Q+AzjN+hOC/4d1nMHOVigPI
GOffCL7SbWAI/UHwga5ZOpshA84Hhvahr0D+k+Mzdk/boOJwAaSBKcNh4tsa
e1M5VUh8SGU4hIM8pq8N56engYC2gz8ovMVx8/3Q+OBgEEHwgbbE7RLMcHDp
znn+W1Mbkh6A/pG1SHfJ1Nd0AAXv55fpDgmHL2unztRy2FCUMfHtlXS4/mPe
5p2OOxD8HqAxK1MRfHD8CqQ7HKgFmqiiBuf/r1gfNbNBAc5nlnGaOuuvhMMd
UIKySXdYw9J9eOZ/YYcGUHyUIPjg9DwZwQ/cIdf6em26g1D2R02GZaIOIOUS
R6DplV3CwQfovARg/HfYeO5KmyQNzy/Gax71nlFG5B9YfgIAeY5+lQ==
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 
             1, 0}, {1, 3, 3}}, {{1, 4, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {
             0, 1, 0}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJ+KB3yeOnsI3MyHd5P4bv2/6SSA4xvYgwCyg4T39bY
m05D8IXXuT+smoDgN0x17s5ZnwHnrwVKi6xC8MHUYkz+apbuwzPPK8H56Wkg
oOTAHManu2klgg8zH8aH2Q/jP/+98uOlqQg+zP3ofHT/8ccG3Dc6LgPnz5gJ
ArJw/8L4MPtgfJh7YHyYf2F8mH/Q+SaOV2oZLsnA+f/BQBruXxgfZj6MD7Mf
xof5F8aHuR+dD/MfAIjX3SM=
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJJKD1jJhCczHL4DwL2Sg4w/oN9fHOMnVQczn8Pfrz0
eJZDSuwdN2YLNYd8oeYDp3ZmOVjf9++dzqfhsKdksgTLqiwHmXlxmqcFtBxa
Dpxa6NqX5XAhP5793EwtB/Y1MlEp1Qi+jP5dFbZUBJ8ljE93k2eWg495p2PC
U02HhqnO3TnWWQ5L/RyEEx+rO+Tbcl1fbJDlYPfi5ppfMWoOZ0BAB8q/owLn
w9wP48vvWrAv9Zy8Q0nGxLc1+lkOAtkfNRncZByu+CYJRNhmOXzZ93Fr+jUJ
hzUfL/km+WQ5JHmpXDytIerw5ILS7Z9pWQ5rWLoPz/wv7BC/y5OHqRrB75+e
J9Q8B8HfMvf98mPrsxxymlb8ZmgRc8h5/nvlx11ZDp02nrvSgiQdXLZ9/nvl
RJZDq96K/JmfZeDh+2HReoWzNxQc0MMf7P41WQ5/P8ZtNVqI4HeDzGNShPM/
bAjInhUu59ADcs+KLIf9tbIW6SnSDu2vA3fILcxyMHW8UssgJOYAir7ZHVkO
exJvLzqjJurwHOS/KgTfg4dJuz0PwU8HBpd9aJaDICi82MQcEp4CNfhmOZy/
lSs+y1sa4l5gfPWA3GMkB+eHNh19eOa9ApwPcz+MP6W9NeryHBU4X+Dl9vXM
6WoOOu1iN8/5ZzmAosXyiroDKFnlhWU5GINAsSYkPWUBw5fz54J0Yy24+2H8
7xox/Yc6EXwDDmCCW5AF8fcSTQeQ9m3LsxwKpXkf6E5Qh4cfMLRcMvXV4Hzd
CQt+GLqpYIQ/AOAWfJo=
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}}, {{{
             216.89999999999998`, 5.893750000000001}, {216.89999999999998`, 
             6.252339999999999}, {216.60300000000004`, 6.499999999999999}, {
             216.306, 6.499999999999999}, {215.947, 6.499999999999999}, {
             215.70000000000002`, 6.20273}, {215.70000000000002`, 
             5.9058600000000006`}, {215.70000000000002`, 5.547270000000001}, {
             215.99700000000004`, 5.300000000000001}, {216.293, 
             5.300000000000001}, {216.65200000000002`, 5.300000000000001}, {
             216.89999999999998`, 5.59688}, {216.89999999999998`, 
             5.893750000000001}}}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 
              3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGBQBmIQzb5GJirldbbDGiEdvvR7cg4w/t78mrczlyo5fLjk
myRwItthyje2+BlnVBzUDTnWyCxC8LfLtb4ObEDwN8x9v/xYcbbDffN93858
UnL4DwL52Q6paUDghuArnHDkNH6L4LuqljLN4tB0OLPQddvnudkQ8f+aDvOl
9O+qbELwY/oPfdU4gOBLsITx6Z7Ldjh/NeyN/m5NhxkzgeAqTF7DYQnQuL8X
EPxwyy0nyg7h4qvD+Tcai92mlKk7XKl4qWYI9D8DGKhD3HMJwd9/Cujg2wj+
hLc19qaPsh0mgug4BF+0x+sVi4gGnM/lBvRwlKaD+8MqkXWXsx0u5Mezn5up
BbF/E4KfDgq3JgQf7Ex/qP4qdTifPzbgvpG6Epy/hqX78Mz/Yg75Qs0HTtXC
+MIOPNcXF9jOQ/CBsW19/ziCD4v/L/s+bk2fJuGAnj4AXy0TBQ==
              
              "], CompressedData["
1:eJxTTMoPSmViYGAQA2IQfQYMsh0MjIHgs5wDCr9YBs5n4FvoddZOymH7579X
Ko5mOyx74aH3P1HCYUmBLdf13dkOO4OtIv6zizmcWei67fPabIcH5vu+nTES
dbigdPtn3TwEf8LbGnvTNgR/y4myffOrsh3ugfifxB0cEp5eUCrPdpje/cPv
zC8JB/eHVSLrirMdloPsc5SC2Jef7VDzdqYq4yoZOF/xhCOnMa8CnF99/8ct
49+KDkDb4nbVZjvoTVjwwzBNxWHOEYUNRQsQ/J6c579XbkXw98+X0r97INuh
1CZtgVGdMsR9x7IdPixar3B2hRI8PFZ+e1lx5oAinM8fG3DfqF3BAT08ASlK
rZk=
              "]}]}, 
           Thickness[0.004447607187333215], StripOnInput -> False]}, {
         ImageSize -> {224.8397509339975, 16.338709838107096`}, 
          BaselinePosition -> Scaled[0.32439307852814453`], 
          ImageSize -> {225., 17.}, PlotRange -> {{0., 224.84}, {0., 16.34}}, 
          AspectRatio -> Automatic}], TraditionalForm],
      PlotRange->{{0, 1.}, {0.007, 0.02}},
      PlotRangeClipping->True,
      PlotRangePadding->{{
         Scaled[0.02], 
         Scaled[0.02]}, {0, 0}},
      Ticks->{Automatic, Automatic}], 
     GraphicsBox[{{}, {{}, {}, 
        {RGBColor[0.368417, 0.506779, 0.709798], PointSize[
         0.009166666666666668], Thickness[Large], 
         StyleBox[LineBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQDQMWjjwLTnZPsZ81EwRW2m8/Ur/YPRjG32m/e7vS
dlu9KfYmxiBw2N5ezjhfXBYmf9LeS+bBQnaFKfYQ0y7YT3pxsIfVHKb+sv22
6eLBZxOn2KengcA1e1/7u5cez4fpv2l/s7IlYO6HKfZnz4DAHfsJeRu11IKn
Qs17YD/3oNXCnmNToeof2u+76XrwlOc0qPmP7YsTyzecvz0Nqv+JPVd36Ln2
6ulQ+57Z2z1+E/9YfQbUvBf2Znwem27fnwE176U9c6rh8bJFM6HmvbZnnF26
82TeLKh5b+zdnFMFfznPhpr3zn7CugAXO8U5UPM+2P/7UTD1LutcewB0zJY+

           "]],
          FontFamily->"Latin Modern Roman",
          FontSize->12]}, 
        {RGBColor[0.880722, 0.611041, 0.142051], PointSize[
         0.009166666666666668], Thickness[Large], Dashing[{Small, Small}], 
         StyleBox[LineBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQDQO7w55ETJo3xX7WTBBYaX/hxyut5CAYf6e9m9zj
3fGWU+xNjEHgsH2nxoNLBw1h8ift15We3r/VZIo9xLQL9rnzZpc9NIWpv2yf
GT2x6kXOFPv0NBC4Zn8o136l8CqY/pv2DCYN9xZ8nGJ/9gwI3LFX+Xp7Q1Ti
VKh5D+yTK1Jm9NybClX/0P75lBb3u57ToOY/tk/IMTTSvjsNqv+Jvc6lLUuK
GqZD7Xtmf2C20qFksxlQ817YH7ty6n/kgxlQ817a3/pcyvdm7Uyoea/t7+xK
nKfbOAtq3ht7D4P5M3JDZ0PNe2cfuDFF4oHRHKh5H+wlV7IfWs0/1x4A0z+b
cg==
           "]],
          FontFamily->"Latin Modern Roman",
          FontSize->12]}, 
        {RGBColor[0.560181, 0.691569, 0.194885], PointSize[
         0.009166666666666668], Thickness[Large], Dashing[{0, Small}], 
         StyleBox[LineBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQDQNN6/R1FrRPsZ81EwRW2v92njk9KRjG32l/8JbI
Fh67KfYmxiBw2H7FItM0TlmY/En7he1mTw5JT7GHmHbBPoF/wWJNI5j6y/b/
nW78z4qbYp+eBgLX7LmZlLf2LoTpv2mvte1A+93fU+zPngGBO/acfDEX7oZP
hZr3wD40iHeB6umpUPUP7W2NRDmVAqZBzX9sXxusF3n80TSo/if2Nc+X7X9V
Px1q3zP7s5cy5Vdqz4Ca98JezdRkatDDGVDzXto/n+317fmimVDzXtvHxNi3
zsifBTXvjf0m0TTpT1Gzoea9s49ruOF3VWEO1LwP9p/8GZoMhOfaAwCD+ZNr

           "]],
          FontFamily->"Latin Modern Roman",
          FontSize->12]}, 
        {RGBColor[0.922526, 0.385626, 0.209179], PointSize[
         0.009166666666666668], Thickness[Large], 
         Dashing[{0, Small, Small, Small}], 
         StyleBox[LineBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQDQNcurJfCt0n28+aCQIr7WPkEs52n54I5e+013h6
XPRW8WR7E2MQOGx/vsNs/rIAmPqT9jOtzJS6OibbQ0y7YL9FdGmb/wSY+sv2
h0yz2Y6+mmyfngYC1+z/MObOdJCYAtV/07789vk9TGlT7M+eAYE79tfzmsUO
XpoCNe+B/SLdFq17HlOh6h/aM2f/KA0+OBVq/mN7Hg+GshLPaVD9T+xZWcwC
i1dMg9r3zP6umn+Xj+d0qHkv7K3uyLL9l58BNe+lfca/r1sdl82AmvfaXuSd
12y27JlQ897YJ6Tfb5Kpmwk17509b+zOi9FnpkLN+2Afz7TrUOuWWfYA13GS
Yg==
           "]],
          FontFamily->"Latin Modern Roman",
          FontSize->12]}, 
        {RGBColor[0.528488, 0.470624, 0.701351], PointSize[
         0.009166666666666668], Thickness[Large], Dashing[{0.01, 0.02, 0.03}], 
         StyleBox[LineBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQDQO9jyNYfIKm2M+aCQIr7Z9Khe511JsE5e+0vy2+
8WKY0RR7E2MQOGy/5wSvb7sITP1J+9SVbzfvkp9iDzHtgn3nnCPZHZEw9Zft
9cQri6emT7FPTwOBa/Z6Trt7s/bC9N+0L3w5JfMj61T7s2dA4I79pOjdT5zj
pkLNe2C/Ruf/jOM3p0LVP7TfrlKg1h04DWr+Y/vJ6c//ZP6dBtX/xP7Lfgnb
kM7pUPue2fNOsS7hU5oBNe+FfXqOkUbjjxlQ817ax27baRF0eibUvNf2T14p
aTSWz4Ka98a+Sc2AJXLRLKh57+xznq67czJ3GtS8D/Y7+0TaSjTm2AMAKFeV
+g==
           "]],
          FontFamily->"Latin Modern Roman",
          FontSize->12]}}, {}, {}, {{}, {}}},
      AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
      Axes->{False, False},
      AxesLabel->{None, None},
      AxesOrigin->{0, 0.016827254995248248`},
      BaseStyle->{FontFamily -> "Latin Modern Roman", FontSize -> 12},
      DisplayFunction->Identity,
      Frame->{{True, True}, {True, True}},
      FrameLabel->{{
         FormBox[
          GraphicsBox[{
            Thickness[0.0165892501658925], 
            StyleBox[{
              
              FilledCurveBox[{{{1, 4, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1,
                3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 
               0}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJhIGYC4t2JtxedcZNwmAkGjA7LX3jo/T8oCefL71qw
L/WcpIP273Uc/7YzOqR4qVw87SHlEM4p1m78n9mhPmtPyWQLLYfbGQz5jSoG
Dkv8HIQTk7Uc7E3jdnn6IPjiU69wZgQh+A5Nj47PiEZSXxmxwrTWwKFnw8OX
U420oPYbOGy/yHCP6aUmnJ94+LJ26kwEX0r/rgpbo6bD8yztb9OB+sH2JGk6
gIw7CzTffc3R5QwSUg4LLsoeOTeF20FmXpzm6Qv8DhUXwyeknVFyAPrOb3or
k4MDp3HufysFhxYFdtUzX5gdHrjGO87aKA/x534uB0PVSS9SVRQdAIbUfRk=

               "]]}, 
             Thickness[0.007929661579296617], StripOnInput -> False], 
            StyleBox[{
              
              JoinedCurveBox[{{{0, 2, 0}}}, {{{12.951199999999998`, 
               16.344899999999996`}, {59.2789, 16.344899999999996`}}}, 
               CurveClosed -> {0}], 
              
              FilledCurveBox[{{{1, 4, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0,
                 1, 0}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0,
                 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 
                0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1,
                 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 
                0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                 3, 3}}}, {{{20.699600000000004`, 11.9254}, {
                20.699600000000004`, 11.300799999999999`}, {20.3863, 
                9.499999999999998}, {17.969099999999997`, 
                9.499999999999998}, {16.6105, 9.499999999999998}, {
                17.404299999999996`, 12.7219}, {17.5125, 
                13.174999999999997`}, {17.5605, 13.200000000000001`}, {
                18.029299999999996`, 13.200000000000001`}, {
                18.895300000000002`, 13.200000000000001`}, {
                19.929299999999998`, 13.200000000000001`}, {
                20.699600000000004`, 12.880899999999997`}, {
                20.699600000000004`, 11.9254}}, CompressedData["
1:eJxl1HlIk2EcB/DXWFlEKtTcu2psmiazdMf7DjqsfqMEXdLsoAYdntOR1jo0
JabSKtJMPNJMy+h2ZaVddkAju1asdWqH/bGyCC3DIysh7W3Pas8D7oGXlw/v
8bzv7/n+nqBk4zL9KIqiVrkOdM7/PWfTkzcqUIRWdOqzhOCxyTnYztiFkHeh
ObngkQpKdcVan14h6IUdOsE14iintqT6CHH4nAp7wUEVBGT0SanTQqCrWscZ
KlTQUmw1swuFcPizqL4zRgXtU0xJyjY+hFRzZfl2FmJupvU7fk6Cc8XvDFQB
sft5JfH78fvPmH1Y4Pkd0zjy+djb0fc2CLD3RFqMNS9piCw7OqiYzkLP8UaJ
Y5YIFr3pHdBIWRiw9l1N3yaC6NDsUbWzWBjmXGOBGHuf5guP3UwsR/VpJbZH
m8LSzgeB9nn5mj87GcjR+H7lMoOhYf6q1Rf9GdA7+S1cczB0T7DKa/a67rfO
MHNrpwEdEz9EX1bBGom6LyUuFJtCIzEM21WkSE4thXuSpi2GFhZsUldhuXBo
ze2arqAZ7JlB4oHMZhl2U+TGEz5RxAbKuIM32ttP21Z2yw4Rp6ehEQ4ln/rF
L2TEcej/ThC781Ak9/KvO6lnE1li283rJWN6pWAaYc/10m+mBSqrFFanznVq
8+SAUvU8UQoW89LYutsREIvW+wANiSuWhR0tioB4p7Le3hEI5yv1hSl5EeCe
Pi0QCnj3SxWvZ2D3oHpriEuXZ4VUi73dJHHo2Do+NsugwYf4jNqcw8nEBmPv
7kdZxO48dhCfQuuUNBOetW8Q1C7mQ9xD33mH2ohPLoGJSa76eeyvbazUj5Vj
t6H1jJHj9/3LP3FdT/2DxdXEeag/r3u7K/cx6IeIPf/biOpVR+zOgZG48ueY
hIOZMi+n6u5PqbER/+lbd1WpFmAPj/DQx1vr9ccFcA3MHbZcGWSYLb8pHg1o
1QMLPXkJhmPRzd+HBxTYP2607x3mM9hNH7qqLsUx//psUILdwCu+WyMjnoDq
aBGDMcH3iVDBgOShehzjEIHY1VaPRQx8Wk7tSy+bClsN5d9MnPJ/f02GHSgv
v5TQXen3insrxC6KQomjsd9HJ6hry/mQEqCbfcXCwDk0PzcRdh1xnH2azWLz
VvpFXNqgwvbsn/5rXYm10TByf/0LAkQ/Lg==
                "]}], 
              
              FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1,
                3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 
               0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 
               3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {
               1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 
               3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 
               1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 
               3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBOIAIGYC4thdnjxMu20c/oMBtwOMP2MmCPA6iHgE/JEw
RvDBtCQmP/jt5Y8zHAXg/CQvlYunO8ThfP7YgPtG6lIO9/fxzTG+ZA21T9pB
X2ul8IUvVnD++ygnuxeWCH6MguPH5DuWDtuDrSL+s0s5THfuznm+29Ih+HeJ
TZqCpMPOW11/U6dbOjCAQIK0wxKQBcqWcP1FGRPf1sy3gPMvKN3+WXfLHM5n
XTzJirHW3OHDhoDsWdclHQKzZ5XPSTJ3WM3SfXjmfwmHh8dn7J6WgMmH6Vcz
5FgjY2Xm4D5PJdZ4JoJfcTF8QtoZKYcNU1I7kvci+GfAwMyhx+sVi8lEBL9d
b0X+zM8ScD6v//opqR4CcD4svDM2vyreuhXBh9mHzofFZ55Q84FTE80cLPxL
T5w14HFwaHp0fMZrBH/Z7CMKG5TM4XxQcJ+JRfA7vty+3rgZwX99wFLZi9sC
bj6MD7O/YE337YwGczg/DQww+cKVk0rOugjA+eDw0RGD88HKZ0o6rAeFH6+F
g4kxCEg7GDdsd2iahOBXRqwwPSttiZAHA0to+pOE81lknKbO2isO58Psh/Fh
7tvaUnNhsySCD0xd359MtMDgw/wPVv/SAh4+2Zw/F6Q7W8L54PRWheCng+MP
wWdfIxOVwm0F54uD8luyFdx8GB9m/40MhvzGJwj3QdIHJh/mPxgfFr4wPix8
t5j/OJSSZQUPvysVL9UMXyD44PyYaQ3ng51Vbw0PXxgfFr4wPsx+GB/mvg/A
1OWdgeBfyI9nP/fSCoMP8/8D7skrmxyt4eHzBpTeZiP44lOvcGZcQvDP1Hvs
r+W1gfPB7k5G8NHLOwCAbU6l
               "]], 
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
               3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGINIGYC4v0GM7UkTB0cur1esZhcFHSA8W9L1yQamQo5
/L1S8VJNE8FPTwMCNQQ//I3+bnV5BN8kbpcnj5SDQ/nF8AlpOkIOq7tvZzCI
OzgYqE56kXpF0CFk/uq1N/gdHKbWhrP8lxZ0mGujc2XWM3uHM2DA43Be6fbP
OikEf4Ne3mLGOXZwvnt1s77PM1uH5S889P4zCsD5c7fe1jP5LgLn17ydqcp4
StIhRsHxY3KNncOMmSAg7VCwBuggAXs4f+nsIwoblBD8CW9r7E37EPwbIH9d
tXd4EszQk/5ByiGkRGX6/wX2Dg5Nj47PmC0FVWfvIN5uvH/WYUk43xgEghF8
ffGPc2eESjjIA51zZq+9A1h4priDCUjdZwS/Uz75XZSQA5wPC+9PGwKyZ5lL
wPlMfAu9ztpJwvnhnGLtxvHSDjl7SiZLHLF3SAWJp8k41LMc7TdkR/D/g8B7
WzhfxCPgj4SxrYPytUfBDGck4PwTG7rMjd6LwPn9Ed3+jBcEHK6f+x78mNUO
4m5jboevbPEzfFjt4XxuFY26HkEHOB+WnsoPb3OdmYtIX7D0BgDG6QFt
               "]], 
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
               3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJ5IGYC4pznv1d+7HJy2GL+41CKFrMDjH9HU3bN/2IE
f09+zduZS5kdkgUiLLcUODno8KXXmbqzOqSnAcE1R4cbvLfFUr/xOfwHgXpH
hwO1shbpKeJwPljdNAU43+7FzTW/bFQdtK0mna4/4egQKb79IoOdpoPK9P8T
6qqdHCRYwvh0hXTg9qvX9ezM9kTwW+adXXU+FMG/UvFSzTADwWdZPMmKsVfH
4e7k9taoZieHGTNBQMfhO1v8DJ9aBB9MZSL4C9I3vyp+6+gQXrtuW9J9LYeD
K5b4OSx2dNjzWET2ZKuGw/Mejbe8YY4OXG6qpUxSag7GYODo4DJPJda4UxnO
h/kXxt8RbBXx/7mMA6//+impHo4OHXor8mcaizuEv9HfrT7d0cHU8Uotg5CQ
gyYoPD44OohPvcKZsYjDQTGnomppjhPEvDQmuPthfJj/YHyY/+duva1nMh3B
h8UvAPsk3aA=
               "]], 
              
              FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0,
                1, 0}}}, {{{43.4461, 11.662099999999999`}, {
               41.628899999999994`, 13.533999999999999`}, {39.8117, 
               11.662099999999999`}, {39.9672, 11.500399999999999`}, {
               41.628899999999994`, 12.760199999999998`}, {43.29059999999999, 
               11.500399999999999`}}}], 
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0,
                 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {
                0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}}}, {CompressedData["
1:eJxl02tIk1EYB/B5IeeloeW9i75ujgz9MLZUJuGznVmWmtYgpZKJuimm6IdF
Rk5XROC9JEulJERS0xp5yRRNM1aK85Kp4AXEtWGWgrNIZbPl5nwP5B9eXn4c
DpzD8z9EcvYlsTWFQoGdz/Sv7/3gwWyLAGOu4kp1DgF7nq9THaiup8O1LOXf
1pQI4LBN8YfGUyNhF3QC0nLmwP2Gcuz0h6t54acFwJhWCyktdIj+VSaUBgqA
1aIuVQnp8CkqpJDnK4CW4rl0SjkDwuOvvunTIHK/81N2XXsDtj4/o0d6G9sp
VvFInIDghy3HJXieAZn2W8/TwhA0y7jH2Wt0yCkq06z7IGj8s5yrcqaDqCra
rcQBgct1XQDlMUGaGOTZs2XYLP+K7+JUAgK4FcMFzggOr/PGJBEEoDHJ1JI3
tja8fuE9Ezt0WpnFOYGAnsjekkQRkC2yG/ViWdanCAgUe6kTziLomi3aFofQ
gfHE+CA/BUG1OQyQdrjph2uxQwt5Sdp+bJU5COS2ynJWCHb8XeWiqoBO+uZ5
u5/GFT/QpagSowYt6wo/MDTpJmIGEBR/rBaN8PxAKN05gSeCKduLG1ZUGjh/
7n5XSkPQHrI5kHrSEToVNkslVARpElMcwCMyzuA5zCe9PZm7zOzCjjv3TM58
ud+bs+wo60kqxFq8YbG5T818MJpjt9uPHuw10/nHsW0u04JatXxYiBDxalhU
yHv9NrlgC9vc153573lxubLVaQiR+zM58k6YwLa7U4mKNfttc5RfWSOzJ713
nyTtuN/cDLbG9diQtg+7417eeNst7OgXDmf8b6Dd+7o6kq4yjXMG2/CtN0Ns
fRC+mArThUAjpJSkjbtD5pK+SbczL19TP1c9YEUd7N3/FcGrQ4G0tFp3yA0i
fH4bkGXurlBXwbWKiRaQlum5OaOb2HvvObJbsj4yfQT+f+//AKWCxF4=
                
                "], CompressedData["
1:eJxTTMoPSmViYGAQB2IQveHhy6mb/rg4iLcb7591WMphwoIfhs+uuThEim+/
yGAn4ZB4+LJ26kQXBwYwEHOY4tyd89wbwb8pXZNo9NQZzmdvnOrcfcXZYX+t
rEU6ixScf0dTds1/YwTffc3R5QwRUg5fNgRkz7ruDKG3SzkUxLOfk7zp7GBg
DASfpRyW7D0orqbs4lB+eJvrTF4lB5YwPt1Nui4O+7+dmcSwVQlib4SLQ7eN
5660JGUHi2tHc00KXBz2vND2MN6m7FD326rgXANQ/vDM+LMflR1qmvV9lm1y
cZgJBioOd9yYK7jfIPgCx3ft6NVzhfNtw6M37vdxdXiwj2+O8SRlOF8l1vhn
WrQSnF9+MXxCmo2ig9PazHuFSq4OPV6vWEwMZR3QwxcAYzeT5w==
                "]}], 
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
               3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJ5IGYC4oMrlvg5fHZzCOMUazeWF3WA8VWuPQpmeCPu
wKjdLnbzmpvDfzCQdJgJBgh+wtMLSrczEXyJ4utCnwLdHL7s+7g1fZsEnL+G
pfvwzPnicP4215m8Rp1iDg9fTt3EA9RvYgwCog4Gd1XYGuci+DwqGnU9GxF8
oG0/6w65OWQ1rfjNkAKU918/JfWCm0OnjeeutEuiDirT/0+ou+zmoPaked7Z
V6IOAsd37ei9RpivCuVr8HNvXXYT6l57BP/P471ZqUwIfn9Etz9jgbBDw03b
ygig/R670j6dDRNwKNkq+vt0mZtDvOOsjRlVXA7rtiXV30x1c/A+wW47O5QT
zr+jKbvm/2cOnHyIfg6HjIlva+xzYeHL7rABFGAlCL6bainTrAYEHxZ/IpWT
Ss6q8Dugxy8Am4rpIQ==
               "]], 
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0,
                 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {
                0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}}}, {CompressedData["
1:eJxl0wtIU1EcBvBpUzfN4av5SMQ9LF+kY6ZhD/9LhHs3y3ShqcVK3GZaGRRk
qJtmEDhF0GZOsMLExExLJVLSVqJFzAe1GT7CNJ2PlFTCOdDWtuYO5AeXy4/D
uZxzz3doGblJQlsCgQDGx/SOSUl/+TaeB4a8tjTFdRrseLJeZa9oYIDOXlAT
v82FCLYpARAzLNLMlyL7KtP9OUHIxJB71LFRHJijM3xCCwPmywJXnAdwYLXM
lKv4DBDMjdAnunBokU1kESqY8HX1NzdVglvnNx0ePHqag1zlRUym7ENuXMAO
GdYwWCJGuEZOMsHuSWW0jQaDZ4XRfuxVBjgyAyVlXRg0bSzmqVwYsMnStgY0
YOCasxZEqKZZTfvIIbMLkVkBlQvCTBr0fQkRejdj4L7OGRbF0cC4ytziTmTp
2PHb55TIn3MFDkPvMGBcYOtFPBqQ9I/FHZ8s4xoa9P9pz1//jkHXeOm2MIoB
PeGKYK9tDBTmMGFvQtt94RHcauPf0UvSkEXm4FBE7K9gRSGn3OmfVkkZVt/i
Ovw0LNNBti3UzV6yjLfRQR4ruzKfjoOsTyEY5NBh2bk3XNGOgYaYqLMhUaD5
4tmkg00YdEZtvs8MdoJEvK7oQD0GYvN3HeHF9KK8PRP5wTW3EmUS8tJMpI8y
drc3x9k8WzUJFi3WWbxh6lMcBgZzHEBr6kcycqlp/ZeR6349HeBJMZiKE3Bq
WSSgYme2vKqQT5j6qkbOLwmLb8zArfPth7wTx3OQH/mEfWNKdnuP70l5bSHZ
6p396CXZb27eQC5ofZUhTUVO8KNmn3JH1sY0TPVS8H/79XCyusZ0nGPIWz96
soW2zpBDNhaGj8Msn1AmHqGCXbHxxM7j4G/q54on3C0Y6Ui9isNzt1CK+CEV
XD50vy6vxkFljgccC1XXaueQPeVqclYl1+qd+4x1i9YHR/fD//f9L2uRwCw=

                "], CompressedData["
1:eJxTTMoPSmViYGAQB2IQ7VHdrO8zzctBvN14/6zDUg46VpNO1xd4OUSKb7/I
YCfh8CMm9+g/LS8HBjAQc9C/q8LW+NQTzi/eKvr7dB2CP18KqCLP02F/raxF
OosUnH9HU3bNf2ME333N0eUMEVIOPV6vWEwKPR2+bAjInrVdyoHj54L0zUWe
DgbGQPBZysE+PHrj/j2eDuWHt7nO5FVymP9++THv40Dzv52ZxLBVyWHGTCD4
6OnQbeO5Ky1J2eFCfjz7OU4vhz0vtD2Mtyk7iE+9wpkh5eXQfXhm/NmPyg4i
sief2vt4OcwEAxWHkgdzBJe2IvgrEkKC1E8g+Nc/fPGKfObl8GAf3xzjScpw
vkqs8c+0aCU4v/xi+IQ0G0WHO27MFdx7vCD+MpR1QA9fABevliU=
                "]}], 
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
               3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJ5IGYC4oKuvief/vs4pKcBwTQFBxj/w6L1CmczlBxC
SlSm///g41Ag1HzgVKKqg88JdtvZc30cuLcuqzyuqeHAEsanu8nVx6Em0SjU
gEvbYQNP4Zru094OM2aCgI7Dkr0HxdV2I/g3pIEqtyL4U07Xe+xf6+3AsniS
FWMvgn+l4qWaYQaC3zLv7KrzoQi+el3PzmxPHQf3gD8Sxce9HWT076qwPdR2
4D++a0dvnI/DLZA9pZoQ+zf7OKxsCvSc26AK55dfDJ+QNkcBzj93K1d81mtx
h++Gz9ap5vg4+D/xvGR6md8hxsnuxc093g5/Hu/NSm1igdu/J7/m7cylzHD+
HU3ZNf+LEfwt5j8OpWgh+HO33tYzmc4E9z84vNOY4OED44Pdfw7BvzLrmexy
Dx+HssPbXGf6cjqo8wNDfqKPw/spfNf+Rwo6lDyYI7j0ro9DpPj2iwx2YvD4
Ow/yT7a0A3r8AgC9suFk
               "]]}, 
             JoinForm[{"Miter", 10.}], 
             Thickness[0.007929661579296617], StripOnInput -> False]}, {
           ImageSize -> {60.27584557907846, 18.058181818181815`}, 
            BaselinePosition -> Scaled[0.29350487424072735`], 
            ImageSize -> {61., 19.}, PlotRange -> {{0., 60.28}, {0., 18.06}}, 
            AspectRatio -> Automatic}], TraditionalForm], None}, {
         FormBox[
          GraphicsBox[{
            Thickness[0.12706480304955528`], 
            StyleBox[{
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0,
                 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {
                0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}}}, {CompressedData["
1:eJxTTMoPSmViYGBwAGIQXXExfELaGSmH/xXro2YWKDrA+HcWnWGbuUTZwdy/
9MTZAAkHE2MQUHVgkXGaOmuvCJz/OJihJ32DIJwf7zhrY4YVn4PKtUfBDGuU
HaaUnH0yW5fXwXDNo94zwcoOW8x/HErJ4nFY0307g6FfxaHLxnNX2iYOuP6C
ea8mzH7IAuc/z9L+Nl2WCc6/8PvY9Xk3/9u/YjERNLuj4lDzounXNMs/9qtr
reSMPyg7VN3/ccv49A/7Fd9eVpwRUHaYkCianyL3zV4w+6MmwzRFOF/xhCOn
cS2Cb6g66UVqCtD/1/J2X7jzzV74k+P5NFdFB+fF1h1zNX/A+XfEUs1OLPkJ
54s3yUwxuPzTXjnW+Geat6JD+LdYwT/vf0Hkryo66Pxex/Fv+1/7nbe6/qaa
Q90zj8FhJhioOAQ88bxkGswC57cqsKueKWGD8yH+ZndoYDnab2iO4Ic3HX14
pl4Zzi/3Yn/9/42SQ6zeI2vD12wQ+fVKkPDoZnPoPjwz/qyjksMG6W26p958
t7/KEvidkYMP6p5v9uB40eJ2OHnYaW3mva/26WkgwOXAute8jSHhDZy/avr9
TKPHz+H8rYL+ZcbKTzD4QFu9ma5wOGyB8r9D+Qkr9R6ktj2x/w8G7A7vGXfp
p297Aedf6WQJPrvmLZy/5Nbyx4bNH+3vuwJTliGHQ4xqhMy5P5/h/Adg+g+c
3wgKp+9sDjD9F17wJaV3scP5TxIXXjNZz4HBZwal61pOOB/mH7+LE2P+MSP4
IpWTSs6msMH5wW8vf5zByATnA3mNp3YwOoD9K8IN588ARedNBP/P471ZqUy8
EP8xszk8AeWjC2IOPifYbWdPZXNQAKXPt+IOElOvcGYsYndYK6TDlz5PzEFf
/OPcGaZcDmfAQAQS39r8cD442fwUgfNh+dljV9qns9ekHdDzOwDHSclA
                
                "], CompressedData["
1:eJxTTMoPSmViYGAQB2IQ/WHReoWzEqIO4u3G+2cdlnK4+IIvKf2VsEOk+PaL
DHYSDmuEdPjS9wk6MICBmINI5aSSsyr8cP5Wrw0Wc3ZywPlPEhdeM1nP7rC/
VtYinUUKzr+jKbvmvzGC777m6HKGCCkHmY1i85kesDt82RCQPWu7lIPW73Uc
/76zOxgYA8FnKQew+2bwOJQf3uY6k1fJIeTt5Y8zHHkd9n87M4lhq5JDahoQ
PON36Lbx3JWWpOzQrsCuemaLgMOeF9oextuUHWbPBAJLQYfuwzPjz35UduDx
Xz8l9YSQw0wwUHHo0FuRP3OyCJyfEnFUeuZyMTjfdZ5KrPFMcYcH+/jmGE9S
hvOB5M+0aCU4v/xi+IQ0G0WHPYm3F51xE3Po8XrFYmIo64AevgDTN5IN
                
                "]}]}, 
             Thickness[0.12706480304955528`], StripOnInput -> False]}, {
           ImageSize -> {7.867666251556662, 16.338709838107096`}, 
            BaselinePosition -> Scaled[0.32439307852814453`], 
            ImageSize -> {8., 17.}, PlotRange -> {{0., 7.87}, {0., 16.34}}, 
            AspectRatio -> Automatic}], TraditionalForm], None}},
      FrameStyle->Automatic,
      FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
      GridLines->{Automatic, Automatic},
      GridLinesStyle->Directive[
        GrayLevel[0.4, 0.5], 
        AbsoluteThickness[1], 
        AbsoluteDashing[{1, 2}]],
      ImagePadding->All,
      ImageSize->350,
      Method->{"CoordinatesToolOptions" -> {"DisplayFunction" -> ({
            (Part[{{Identity, Identity}, {Identity, Identity}}, 1, 2][#]& )[
             Part[#, 1]], 
            (Part[{{Identity, Identity}, {Identity, Identity}}, 2, 2][#]& )[
             Part[#, 2]]}& ), "CopiedValueFunction" -> ({
            (Part[{{Identity, Identity}, {Identity, Identity}}, 1, 2][#]& )[
             Part[#, 1]], 
            (Part[{{Identity, Identity}, {Identity, Identity}}, 2, 2][#]& )[
             Part[#, 2]]}& )}},
      PlotLabel->FormBox[
        GraphicsBox[{
          Thickness[0.004013324236465064], 
          StyleBox[{
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1,
              3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3,
              3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJx11A1MU1cUB/AHreCilg8phZZ+2jKhG7oWRoMs/NnCVNxWgi6tC2wU+sFQ
RogEWZBFGwKLmElYcFSnQ7ekRtlwm4pDxTHCINAyOnFh4KxTE3GZQx1jaLFv
fS3cJks4yc3LLy/3vHfvOfdKiyvyTSyKokJ8Q+cbob5B+0OIRrtuSMWWYNFG
N7eXDpNi/vblMpNViOxn1OX0H1IY9f0Cm10AFud4rnNEBvvsvRpHOx+n6zJE
6rw1gflX4tHRNFlKVaxB/v2rD9uyuejlJW5dxpKjtU7Hpj1RSHNueMNVKcdP
E+W8w01R+L5OqLHUy+Ga4hRbTkUi8l5XJ+uuHMsUjrNPT0fgTc7z3xzVKhBR
mOdWWTj4TR62r/V20Mdzzv/99Gwi8beD1T2fda9FrXtuQr1lNRz+SMZ2XpeL
usEjro82T3hbE4glg76VOkWQTT7+oKwgifi1wfCXjnCfJZ7J3d6gqU7EwJn9
6aqDItwaaLt4aFRBbCy8/irrQtC39L4P71UgNXusjnoU9MZu8yNnrJg4csfD
JKoh6A8zN3ebW8R4UlDe721RgNeovnK4T4y5H4ynimYUgTqkSKFj9medkthi
ZkIJE1PHWcmS/jL6OY7lRtAPkqgf1eMSpP/SX55atPD+IwnWNbfPvRCmhLi7
vcc0IsLdMuXsJ0eT8Kk9445Zs9A/ciV2u3TN5pV8ku+7rRl6OjyOeHff+Rzb
/SjiasbO5TD0XVWabGuJhfapTSluBbG//hFyHGD2Q7UKOmv/7w5aBmabKG8k
LhomTzgOyVDC9GdjFIZ7lFa6ToYLObZVqndjAn0gkIFi4iY30KfT0sD8t+Mw
LXin1myTYpunKtNMxYOu6XzLtleKS0zeMD6mT3RKnHOSwFPDxyu8sS7HrxKk
qpkQ4H39yTTnlqD9dcsXEY8L9hhU1+IxyvT7Ch5upvfMOlRcbOzot1OaaOJ/
B2qvDdWvJP465b3PQy6xUHWO6xn+K5b4zxoHTHsSiP19WS5Es4FbYRSxA+s6
JkJxrtw1XMpGgUKfMJIgJn7drbIPvyzGNuZ87mMDVl8HH1nagbqLUWmvOuPV
shfuBwlGmfO6n0Uc7j+vocTaO5t/Tvs4FNeZ9f8jxkF9kzZkfSjymLxSMTad
0w6UNDzJ8udJ5uKA7+2x3sdZCR30rraKGOIOdlOfjV6NzB1dhaVfeZb0ztai
Ss2ueeLxWNOLg1/MZ9X4+zIGl62pJa4Zb9YQ0x/OGBiY/ZhiYb2iZco0xsOY
b7VDmjDstJ70UOxYLNfUJ6dtWIHFfA+Y+sdFEwuZ/9TGES/en4H5fPz/fv0P
ELNj9w==
             "]], 
            
            FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0,
              1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {
             1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 
             3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1,
              0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 
             3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxl1F9IU1EcB/CrbpjU1P6gbpPa/78qwxmUjDgToRrklmMokalbW3O1JrJS
wYfKh0arsKnkRg6iF9OiGYIvmZGBghu0eijqYdJLf4UkkIEP696rv98Fd+A8
fODc8zvne3/3Sp2BVncRRVEF9LTRs5CejtLal5NldSTHjr0EPBFlhoAsaxsj
q7kadJId+bavf9yYMJejnRZFejVUiS7rsGXq1SLSVjmfpk7U7NQTk+z67zfH
h3Xo69bDFT6BFm37Ih7qbtWQeXtje65YRN5JEn3e/Rpi3wqaPBIhKbW+GHOv
qAnFjC4x+dZOF1hT4fM3fK+Co5+VaFPGeu9hiwIdqpsKREfl5G/Cdjn2SUiK
Sh9bUhfkZIYXXormqshEONuSPJdveF5i3nAlBVJyMq7oMEY5D6TbRjxJETEo
Iz/ch2RoIztk5K7lF6/hAefbzDn+VaEFzL1OlaMh78XNZITic4Z6uw3vU7Ji
LjEuSMkx67WVlGEfebr5cyDZK0PPhL96qQxnb7B41uiQc+tvnT09SSnQfWLB
Wm1CgfuDoX7zyPABT0yOvuRhRr4PDkaCqeZyNJtPTQWaXR4Vkuzbi9NdcwrS
wOYgJoWxPeL4ayWazTGtQrN9QKl3+k+I5lU3jccWKtFQHwzn4z+JNBakVOjE
mDvkWlDmGe7PY9b7VZhP7zM6UIkazfbbfc5eKnCTx9egpzc+nHEmOLPfW6cW
9wdDfbpL+x85Nejt/sg33A8M+YIh38KSO0dcV7WYX3P4yvetHh26n/ke/Xr0
dh095guGfMFQHwznG+qudxh8nE2D7VNH/bo8w/3Pzy7+iVfruXyZfnvPeXmp
6XkP/T8BG6K6qvE5zuw2nbXo3f+7/wUrGz8=
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
              3, 3}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGINIGYC4sfHZ+yedsHIodvrFYvJRUEHGP+2dE2ikamQ
Q6JAhOWWHQi+MQhsRvCF7Y/d2boEwb+gdPtn3Swjh/KL4RPSdIQc9tfKWqRP
MXIwUJ30IvWKoIPg0r0HxduMHKbWhrP8lxZ0YF08yYrR18jhDBjwOJh3OiY8
bTCE88WnXuHMYELwNzx8OXWTj4HD8hceev8ZBeD8uVtv65l8F4Hza97OVGU8
JelwuG15+KlHBg4zZoKAtMN1oU+O58sM4XweJu12sU4E/3vw46WzvyD4jk2P
js+wNnJ4EszQk/5BymHnra6/qexGDg4g8dlSDv/BwNBBvN14/6zDknA+OJyC
EXx98Y9zZ4RKOLQDnWOkYuQANn6mOISORPCrl+o4y3Qj+LDw/rQhIHuWuQSc
z8S30OusnSScH84p1m4cLw0Jfy0jh9Q0EJBxeJ6l/W16riGcnw6iwgzg/D8x
uUf/Gek7KF97FMxwRgLOP7Ghy9zovQic3x/R7c94QcDB3jRul2eOgYMJ2GJu
B5D0pmxDOL923bak+k4jOB+WnsoPb3OdmYtIX7D0BgBsDBll
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1,
               4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}}}, {{{21.699600000000004`, 
              9.905859999999999}, {21.699600000000004`, 
              10.239799999999999`}, {21.4152, 10.499600000000001`}, {21.1059, 
              10.499600000000001`}, {20.747299999999996`, 
              10.499600000000001`}, {20.5, 10.215199999999998`}, {20.5, 
              9.905859999999999}, {20.5, 9.53477}, {20.808999999999997`, 
              9.299999999999999}, {21.093400000000003`, 9.299999999999999}, {
              21.427299999999995`, 9.299999999999999}, {21.699600000000004`, 
              9.559769999999999}, {21.699600000000004`, 
              9.905859999999999}}, CompressedData["
1:eJxTTMoPSmViYGCQBGIQLeER8Edis6mDx5qjyxksRB1g/L8f47YaMYo7vIty
snux0tThPxhIOuRw/lyQLozgz/AR7fHaZQLnM4BAg4lDkpfKxdMvJOD8NSzd
h2fOF4fzNT6pvJzlKQbXb2IMAqIOTYGecxvETOF8mXlxmqcDEHyv6mZ9nzRT
hxjVCJlzNaIOGZtfFW8tNXWoOLzNdeZaBP/P471ZqUwicD7Y3gUCcPs+LFqv
cFaCy8Gj6Cf/y+UmDt4n2G1nh3LC+Xc0Zdf8/8yBkx/vOGtjRhWHw9z3y495
b4f5n91hgY3OlVnHEPxzkoG3pO8g+LDwFamcVHJWhd8BPfwBIAuswQ==
              "]}], 
            
            FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 
             3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {0,
              1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {
             0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 
             0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3,
              3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 
             3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGIHIGYCYv0JC34Y1jk6mBiDgKgDjJ8GBmIQfhyCv2Tv
QXG11w5w/vUPX7winzk4BNw3Wn76EYIvs+Z/8Yz1EnC+mc3eoGmOmnD+nEXK
O/+oa8HNSwebpwW3D4Vfh8k/rmk16fR/LYfgEpXp/yc4wPnaqZKPIvIRfHnH
j8lnch0ctjs0PTr+Q8uBW0WjrifRwcH/4sSYf81aDu5FP/lfqts5mDheqWXY
JOmw/uHLqZt6rB1qEo1CDbq0HOa/X37Mu9wabl778vBTRiXWqObrIsl/uX29
MdgSgw9z/9LZRxQ2TELwwXSZFZz/HwTqreDhA+PDwg/GX8PSfXjmf0k4Hxbe
MD4sfmD2o/Nh8f0nJvfov0WWDhdu5YrP8hZ1uCEN9LmrFZzvcD7t6vNZCP6D
4zN2T/uA4B9oAwbIJGs4X2LqFc6MR9Zw82F8mP1nwMAKg7/ddSav0UoJOF9f
/OPcGV8l4fwJb2vsTeW0IOF6HsH/u6n604YNtg5Ta8NZ/kuLObzYvp75+R5b
h5sgf0wVdeBfCkxgx2zh7hGxP3Zn6xME3/za0VwTBjs436O6Wd+Hzc6hx+sV
i0mhqIOLainTLAk7hwsv+JLStcQcCrr6nnyqR6RXGB8W/jA+LD+wn5MMvFWN
yC8zQUASwd9bK2uRfsUegw9zj/Anx/NpvA7w8AX7vx3BB6fHLQg+yPs9DxD8
36D4jXKE89HzOwBwM8dP
             "]], 
            
            FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 
              1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {
              1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}}}, {CompressedData["
1:eJxTTMoPSmViYGAQA2IQXf/bquCcgbODiTEIiDrA+GlgIObwhnefwcxLTnD+
GTBwcjhQK2uRvgTBT/JSuXi6QwLOh5in6nCibN98qe+OUHEVOB8ir+JwedYz
2eURTnB+OtgeJ4cXv1d+vMSL4JfYpC0wuqcE57frrcifOVkCzoe5r/TBHMGl
oQj+BaXbP+s+OWLwYf5trrmwOVLWyeHCrVzxWd6iDsVbRX+fTkPwwcomI/gb
9fIWMy5B8O3Dozfu/4Pgo4cnAB0elFI=
              "], {{37.6996, 
              12.493799999999998`}, {37.6996, 12.8648}, {37.4027, 
              13.100000000000001`}, {37.1059, 13.100000000000001`}, {
              36.75979999999999, 13.100000000000001`}, {36.49999999999999, 
              12.8277}, {36.49999999999999, 12.493799999999998`}, {
              36.49999999999999, 12.172299999999998`}, {36.771899999999995`, 
              11.9004}, {37.093399999999995`, 11.9004}, {37.46450000000001, 
              11.9004}, {37.6996, 12.1969}, {37.6996, 12.493799999999998`}}}], 
            
            FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 
              1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {0, 1, 0}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGCQBGIQfXDFEj+HYjeHvohuf8YAUQcYv+Ji+IS0M2IOPwyf
rVPlQfD7SguleRncHELeXv44Q1HcoaCr78mn/64OzUJpt/6VSsL5JsYgoO1w
48MXr0g1V4czIPBGC86HyGs5iHxyPJ/Wi+BzqWjU9cx0dbhS8VLNkAPBjxDf
fpHhngacr3DCkdN4rrLDCtOz1n6Vrg63pGsSjUJVHDwC/kgUm8PMU3VY9sJD
7/9NFzi/4aZtZYQGgh/xRn+3er+zwwwhzy9Gt5TgfLD8ZHk4PxJkf52kw0wQ
UHSB+OeMiMOSvQfF1U4j+B+Sz8R6O7jC+eDwa3F1+PN4b1aqkrjD1paaC5uB
7t+TX/N2JqsEnA9TDwCVvapb
              "], CompressedData["
1:eJxTTMoPSmViYGAQA2IQbaNzZdazqa4O8rsW7Es9J+UA45/Zp930/60knJ/i
pXLx9AlJB02rSafrG1wdPHelfTq7TcLhzSMzqQPRrg4B942Wn2YSd5giwRLG
J+vqMBMMRCHqL7jA+R9aT4YcXIHg/6zL2lPC7OLwZd/HreliYnB+ahoQtMnD
+e16K/JnNis6KDh+TD4j6uKg7D9p3cwaJYerR3NNGsyB5gl5fjHyUnYoYZrF
IR3m4jBjAn+VGbeKQ4CcWJbvZBeHM2Cg4nAC5KD7CH7EKaMjG+1c4XwR2ZNP
7UtcHe5oyq75v1nZYRNP4ZruZleHkN8lNmkByvDwSAe575kSnP9+Ct+1/zcR
/LcgfqaSAwA6YKFp
              "]}], 
            
            FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}}}, {{{45.3, 
             7.599999999999999}, {48.399609999999996`, 7.599999999999999}, {
             48.399609999999996`, 8.199609}, {45.3, 8.199609}}}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1,
              3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJdIGYCYhNjICj2cTBe86j3jLKCA4z/UZPhmHEGgq/g
+DH5TK+CQ4988ruoJAR/yd6D4mrBCL46P/fWZYE+Dqf3aTf9z0XwH7jGO85y
VHBQ2fmn/Yuzj8OOYKuI/8slHDbwFK7pnuzt8MB837czRqIO/aWF0rwMCL7P
CXbb2VO94HxjsHs8HWJUI2TO2YjD+elvt3Gf3aoE59d82hCQvUvT4f7LqZt4
Jno5nAEDLQf+47t29P5D8HUmLPhhOM8bzj9yWTtVUsvHIQ0Elmk4aFhNOl3v
4ePgsb9W1oJdFeJebx8Huxc31/zaowLnv+HdZzBzlYqDPCgcYhF8WPih86e0
t0Zd3oPg32gsdptipgrnu8i8fmR2SwvOTzkT633CXRvOTwc7UNuB9Zxk4K1k
BH96nlDzgSgEv8frFYtJpA8kPKK0HUDGSgX4OESIb7/IIKftUPJgjuBSVh8H
kLZTjpoOMgeiFRwPejvkcP5ckD5Zy0G8+LrQp0hvuHnsjVOdu994wfktgZ5z
G655wvlg6pmHw4WrYW/0Z6vD+bD4gfHfVJxxSK2RduBR0ajruenpsIal+/DM
/8Jw82H8CcDQ3//UG86H+d/cv/TE2Q9SDujpFwCg5CS1
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1,
               4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}}}, {{{63.099999999999994`, 
              7.852339999999998}, {63.099999999999994`, 9.379690000000002}, {
              61.93439999999998, 10.600000000000001`}, {60.55549999999999, 
              10.600000000000001`}, {59.1293, 10.600000000000001`}, {
              58.00039999999999, 9.344140000000001}, {58.00039999999999, 
              7.852339999999998}, {58.00039999999999, 6.336719999999999}, {
              59.18869999999998, 5.199999999999999}, {60.543800000000005`, 
              5.199999999999999}, {61.94609999999998, 5.199999999999999}, {
              63.099999999999994`, 6.36016}, {63.099999999999994`, 
              7.852339999999998}}, CompressedData["
1:eJxTTMoPSmViYGCQBGIQrc7PvXWZpL/DhRd8Semn5B1g/BkzgUBSDs5/05bb
bSQt7dDzN/X7k49+Ds1Cabf+XZVweJK48JrJcT+HA7WyFuktYg758eznJBv9
HGaCgahD6Bv93eruCP4T+yX39/Eh+Ecua6dKnvJ1iOAUazeOF3Ow0bky69lc
X4f1CmcjTPZKONiGR2/cX+LroP5J5eWsl1IOJsZAUOzrcKB7X5PJYVk4H+Z+
GH91rZWc8QUFON9lnkqssaeSwwWl2z/rFvk6MLQHLE2LV3bwWcblpnrW1+HD
8mPe5pkqDse9zTsdBfwczoCBioPPCXbb2a4IPsx/KPyDfg52L26u+RWj4vBn
5cdLvq/8HCoiVpiezVaGhx/YPn8lOP/9FL5r/08qOKCHPwCuVqh2
              "]}], 
            
            FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1,
              3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {
             0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 
             0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJzIGYC4i0nyvbNzwt0MDEGAVEHGD8NDMQc5jaoHWpz
R/AtXN2Lfhoj+GBtQP6bttxuo9vicP7tRWfYZqYowPnpIOXLlOD8juXhp4xC
lB3U+bm3LlMMdJjxf0LdbykVh2Tr+/693IEOZf5yYlm8qg7KGnU9O58HQN2n
6vD898qPl84i+KvPXw1704zgP72gdPtnWoDD9O4ffmeklB0U/34rfZAQ4PBe
Or46baaSg/TrR2ZSWPgw/Uf+bar+9MHf4QwYqMD5EHkVB2n9uypsugFwPsQ/
AQ4636bfncyO4LuvObqc4YYSnN+utyJ/5mQJOB8Wfpw/F6Rv1kLwYfah82Hx
8/1QyqoEngCHC7dyxWd5izpsbam5sNkUwb/PxNkl743gf2eLn+GTiOBvBsVv
F4LvzcOk3T4vAG4+jA+z/+CKJX4O+Qg+OB7TMPn3zPd9OzNJAs5PuS968P8x
BTifAQQClB1mgkGAwxvefQYzV6k4fN4QkD3rOIIPlv6K4P8HgwCHDlD4FSvD
+eFNRx+e+a8I5zcLpd36N1UCzkdJr98RfFfVUqZZJzD5MP9rWk06XX8HET7y
jh+Tz7AGwvm/374+YCmN4N9e8ysm1xDBn54n1HwgCsFHz18Afh5qqw==
             "]], 
            
            FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 
             3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0,
              1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {
             1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGIZIGYCYgtX96Kf8UEO/LEB943UpR1g/Ddtud1Gt2Ud
WIVE7I/5YPIrLoZPSPORhvM79Fbkz/ws7iAvluX72SzIgQEMxBxmgoAkgq+r
KP8l51kgBh9sfrUUnH8GBIDmw/hpYKDiYF1wruNSUBAG/4Sm1aTT/1Xg6tH5
8210rsxK03T4/fb1AcvLCP7uaRP4qy4FOvz9VvpgjqG6w+tHZlIHtgc6PDo+
Y/e0DyoO+9/Ms9EpCXQ4ddhpbeY9BB9mP9i8zZj88sPbXGf6SsP5F1/wJaW/
EnXYvp75ec8bqP/OiEDCRzQIzk8HGeOG4MPiY4PC2QiTveIO6PEFAGw4wYM=

             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 
             1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1,
              3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGI9IGYC4gkLfhg+mxXssPtW19/U48oOMP4dFbbGqc0q
DhFtFteOtgY7mBiDgKrDgTfzbHRSEPzJp+s99isi+OIeAX8kuIMd2peHnzL6
ouSQngYEbMEO5Ye3uc6sVXJQ5+feuowVkw/Tv7zyuKbVoiCHM2CgAudD5FUc
Ns99v/zYZQQ/ISRIfcHNIAedb9PvTmZH8N3XHF3OcEMJzm/XW5E/c7IEnJ8G
BmIOM0HgIoIPsw+dD7FP1OH89+DHS7cHOVy4lSs+y1vUodbeNG7XQwT/hZoh
x5ofCH5LzYXNkbzBcP70TTyFa5wRfAOfZVxuocFw82F8mP0MIOCA4EuwhPHp
8iH4k9tboy7zBDso7FqwL/Udgl91/8ct49UScP5/EJBXgPOTI45KzyxXctBJ
lXwUoR3s8IZ3n8HMVSoOnX1PPsmnIfi+SQIRljkIPji+cxF8cDQVBDscqJW1
SF+iAvFHdrDDJlA8das4WLi6F/2MD3bw2A9SgOD3HJ4Zf/agMpy/utZKzlgA
yJc6EK1QGAyNfyWHhy+nbuKpRfDB6rsRfFh6LbFJW2Akh0i/sPQMAJL8MXg=

             "]], 
            
            FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 
              3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1,
               3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGAwBmIQPRMEJEMdMkrYNxqnSjrA+H8e781KVZJxSAMBNkx+
1f0ft4y9JeH8lIij0jPTxRzaloefMvoS4sAABmIOl+494J78EsFnFRKxP3YG
ky+75n/xjH4JOH+b60xeI09JhPr2gKVp9xXg/NOuNeppukpwvnDlpJKzKsoO
JW5TvrGtDnH46hXZZiGm4uCbJBBhOSHE4RWLiaDZHRWHSafrPfbnhjiYGIOA
qkNfaaE0rw+CnzHxbY09L4IfUqIy/f+dYAdmvoVeZ98pw/mzl1s9SctQgvOd
JzQLpe1SdGB53qPx9mWww54X2h7GaYoOl0H+/4ng5y1m3MPKFwLna1oBXSQT
4hD8u8Qm7QKCD5FXQuMrO/TszOb8yYDg16zbllT/NRjOlxPL8v3MFuKwYUpq
R7KtisOuW11/U7VDIPE6U8VBwfFj8hlPBL9iziLlnTkIPji+ZoY47M2veTtz
qzKc/5Z3n8HMWYpwfjUo/lcrOGT6fu4LBrrHdZ5KrPFMBYcFq9feiD8W7LC3
VtYi3UUWzgeapsq4ShLO91hzdDnDD1GHH2zxM3yA4X0GDEQg5tkg+L/evj5g
mY/g2+hcmfVsYoiD4glHTuO1Yg471jM/71kQ4nBqn3bT/7cSDhe+Bz9eujjE
Ye7W23om08Uc5jSoHWrbjdD/Us2QY80dBF/x77fSB28QfFj6n1obzvK/WtQB
PX8AAJrDWxA=
              "], {{82.39959999999999, 7.002729999999999}, {
              82.39959999999999, 5.818359999999999}, {81.51369999999999, 
              5.419530000000002}, {80.99180000000001, 5.419530000000002}, {
              80.3973, 5.419530000000002}, {79.8996, 5.85469}, {79.8996, 
              6.434769999999999}, {79.8996, 8.030079999999998}, {
              81.96289999999999, 8.175389999999998}, {82.39959999999999, 
              8.200000000000001}}}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1,
              3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 
             0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxl1HtIU1EcB/BZFlk55tzD0rlNN3tYYc7SVuTPzEfmszq3WVrmdEVliig4
MjI1TacRkuDKJETUSk0s7YnZQ8q2lUlELxNslUUFrqCZqd17p/eQ/eD88fnj
/nbO9/x2pMnpW1JnslgsO3JFk2sGufwUVBFg7PTOn4hyhSk3cZex974TQW7g
ql03FxDQpevM91OLQW4uqDFxCfCPyX5k6hWD0i6q0PEXAmdtRZapTgL12odL
lIMINtbIEhU9ErCI+9J3X0Yw0MmuVnClwBf1fAisQsAxny/Ur5ZCQEhY5shu
BFpV4yqTDvtsg9KssXow5lH9r3pCVDJHtSYDgZEuGQyNXhjua8cuPWm2iOcS
jKsOcQu62ATo6fKA2gpyxxwCxEHDamO/FBrrosHZiQBDSO4iTbMU8uM2ncsT
YNNtXLAj/UuCkqT/2zNRMaIxYKtV3a56fw/GeaPKjCeNMsa1IR0/xnhyxrbc
5fC95/6G5gXYKWsHYsqdsQc/V7bNn0VAgoQ8QJMMEtK6x9smyHwsQU812TJ4
dPN6+ewhBPYOpWI1Ww4+c5rcdvQi5nszj7yAa9icee312p3YdN6Bk3nXeTI+
K/mynhXvwdiJuj8Bdn9rWpwmWAo+kfVzQxMRXDqidFdkSMD+U9nib9kIstr5
o4aTYrCu/NgiP4UAThVwNUoxWFpjD5y5giD7fkeI3uQOFQnjwb/7EaREyJ4Z
wt2BRdXQ5H5k7nBCnfg2dBRB8YrGdL1CBGPPcz57ORDw7TT7xYTWzXYOMq/e
IXby3v2ujOl55SxkrBJee8YaF9ryIPPLoX6/mQ/bfJZecL6NXRbxxd6vBLuo
Yftj3xRyf9T9FgvhLjVAWxHc3vOm1qhxg66vNeuWxSLIHbC+VniL4Mbr0rHU
GAR/hne1+wb975aO5KOvoibn96AIkpYYOA8jsKsfSFozw7Gn8p7ucpUuxs4H
e7lw+FwVcmPsUqy4c+Y9nzF5GkdfB/6//Yw8+EndRxj2scpg3cHN2PT5IhFU
U//Plzxb/vEIAuj3gA/kNB62JCDbe+EpYFyls0YblQKw3ku5mLQPQXhTdwPL
KoDC3N4r8cdx/4j5M7yLW7Dp+byFXZ3nda9oHsF46r2i56dcCNPfs7/msBD9

             "]], 
            
            FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 
             3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0,
              1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {
             1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGIZIGYC4gWr196Idwt34I8NuG+kLu0A479py+02ui3r
kFNRtVTHGJNfcTF8QpqPNJzfobcif+ZncYeWmgubI2XDHRjAQAxKI/hT2luj
Lp8Jw+CDza+WgvPPgADQfBg/DQxUHBZcM3lvYRmOwT+haTXp9H8VuHp0/nwb
nSuz0jQdEkKC1BfsRPAV/34rfbAjzAFEzTFUdwj0nNugNi/M4dHxGbunfVBx
UA1mXTwpKszh1GGntZn3EHyY/WDzZmLyyw9vc53pKw3nX3zBl5T+StRBVizL
9/MlqP/OiEDC4Q+CD6Z0wuF8WHxsUDgbYbJX3AE9vgDuOL9C
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 
              1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {
              0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 
              0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 
              3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGBwAmIQfURhQ1HGxCiHZqG0W/9CJR1g/OUvPPT+L0Tw72jK
rvkvLOXgsu3z3ysdCL6E/l0VtkZMvvqT5nlnT0k6HPc273RsiHJ46BrvOCtQ
0sGAY41MVE2Uw7spfNf+V4o5sITx6W5KjXJ4YL7v2xkjUYczIOCD4GvE9B/6
qoHg/7lS8VJNMcqhQ29F/sxicYec579XfpSKclgvpMOX/k/SwSHh6QUl4SgH
911pn85Ok4WYzxvlEKMaIXPuj7zDga9AE7miHO6DzDuk4GBiDASfIx2CS1Sm
/29QdPDvnZ4n9DrSwUB10ovUI4oO/0HgeqTDDCHPL0ZZSg7uD6tE1q2PdNj9
QtvD+JiSQw/IAT8jHe5syA1MC1aGmGcc5bCnZLIEyzUVON/mPtDkdWpwPjh8
GTUdIlKs7/vfjXQ4rmk16fR/LYh9+Qj+emDov+2JwOCnp4GAlsOKJX4OwnMR
fLDx1xH8hJAg9QU3IxzmLFLe+UcdwTez2Rs0zVETzpdZ8794xnoJOD/gvtHy
04/E4OaBjUsTg9sH48Pcg86H+FPUwYuHSbt9XoTDhVu54rO8RR30fZZxud1F
8Pm5ty6r/Izgd4PCkzMSzv8Lim9PBB8YO80HoiLh5sP4MPv3n1rous0bwdcD
JUdRBB+sTTjSgQEEHiD4kPQuAedDwk/JQfzmue/B2Qg+OD12IPhTJIApbGmk
Q8fWHyIMykoOM2YCwc5Ih9nLrZ6kVSg63AFaP/UyNH1NUEDlCyD400H6bsrA
+fO23tYzEZeE810mgHKouEP6xLc19l8jHRR2LdiXek7UIeTx0tlHGKIcvmwI
yJ4lLuoAzG0JTxWiHNawdB+e+V8YGh4Ifv1U5+6cdgQflr8rLoZPSPORcEAv
DwA6HLxb
              "], {{103.738, 11.349600000000002`}, {103.738, 
              10.283999999999999`}, {103.17799999999998`, 
              9.499999999999998}, {101.63199999999999`, 9.499999999999998}, {
              100.3, 9.499999999999998}, {100.3, 12.7094}, {100.3, 
              12.991399999999997`}, {100.3, 13.1383}, {100.55, 13.1871}, {
              100.657, 13.200000000000001`}, {101.014, 13.200000000000001`}, {
              101.252, 13.200000000000001`}, {102.21499999999999`, 
              13.200000000000001`}, {103.738, 13.200000000000001`}, {103.738, 
              11.349600000000002`}}}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 
              1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}}, {{0, 2, 0}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["

1:eJxTTMoPSmViYGCQA2IQveVE2b75p6Id0kvYNxo/lXKA8c/s0276ryvtwB9h
ueXEsWiH9UI6fOlx0g4c1xcX2B5C8GP6D33V2IPgg/XvinYI5xRrN5aXdvh/
peKl2s5oh/8gcF/KwYYLaMDSaAeHpkfHZ+wWg6gvinaYCQaiDh2OCU8vBCH4
Oc9/r/xohOCnpwHBsygHl3kqscY/xeB8j11pn86WycP5nVt/iDAYKzjc9++d
ngd0D4xvYgwEpxH8M2CAyYfYh+CrAm1L+63k8CZwh1zr4miIOcaqDseBzpdy
R/DB/nwfBeeDta+Jcui28dyVdkgJzgeH91J5OF+4clLJ2RRJB3VDjjUyv6Kg
9oo4tBw4tdDVLxrOn3NEYUPRCgQfFl/8sQH3jZ5LOqDHJwCpDOSk
              "], {{
              110.39999999999998`, 8.299999999999999}, {107.57900000000001`, 
              8.299999999999999}, {107.67399999999998`, 10.184}, {
              108.71699999999997`, 10.399999999999999`}, {109.04799999999999`,
               10.399999999999999`}, {110.31599999999997`, 
              10.399999999999999`}, {110.38799999999998`, 8.70781}, {
              110.39999999999998`, 8.299999999999999}}}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
              3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
              3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1,
               3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxF1H8slGEcAPB3ZpntiBsOnR/nXjrz48yRifhephBDNbP1vCULt5C29DtW
hAxr4tYdkzAbzSJDV5PdVKPQssmmJiRF2BhtYVzP+x7v893evfv88T7f5/l+
v88rSc05mWZCUdQx/LDvYTZiGZg73zAeEE/DnsPmJ9o2e2lI0DkXLSoZsIhv
r05TuQPlVWI34UHsVLSYqNtBvPMu9uZWTSMo7ZhZUHfSYJpk6dP5BYFVcnDX
YBINUQITr5I+BJP0vnvqWRqWEnGCJgQBCjbcod5RPkkXE3PrATG3PwGCB74t
OdoqKe/rb3sitW8kvIOUY3lUqisElipT5mQITm/lhqZTLlD++JKw0A9/Hxr9
Ov2RM1T0/5Whgwig4MeA5psTaLQ4HJDxfVPM21R8VF1T58h7pdpy3DAhMuYL
QJAaQ48OtdhBfAVOEILg09dsUU2mHQxc66t3FCGQDCrNFSO2xnOsnQE/0Wqd
xtaG92Jxdpl/rTVve/WYuapRwK9nPL8ZbI/dWPDQEsem4squExvYCGegTeht
mREm4D17iirP6LDmbVg92+0/I4SuQbzBwwyI2wxXNO228DSyZ21bwIAuUmvh
7yky9uMXgnQu7OFnc+07Vz0x1/984vcngkqVCcRZv7daV2OIMyqX74QfQdDD
rh/tAFaF+o8Ngbv90TvAfnZOfBHoy/oKApoceSeLXo5STw7wTmHrrRLDv3w8
IAoEJew8KJwAUuY+u+F6LbH1xP28q44oyzqHII3LL4b7OF1kPjG3XjFxHFvP
YWKuXgYEGblmLxTNLrxrXf+EUa0S3kN9XgWGODfoXsMd2kDQO+8VpTgkhQsh
U/EVU7vztCGFWFyelG0ElWgnYnOZhjE2oYThfRWPi9ydmKunjFiFr4O9NzE3
X3IGLgtxIWdomL5l8/y4JwOy/PJXmR9o4znwfaVjbhfKy4l1o9R3k2jiyY7s
xPQ1KazL0MN+HwY0wuh1/2dS476DiXNVbAOJ9/4XK43triODxHv/k//uZejm

              "], CompressedData["
1:eJxTTMoPSmViYGAQBmIQfcU3SSDiZIzD7hfaHsbbFB1g/Ha9FfkznRH8Upu0
BUZ2Cg7lL9UMOfbEOOytlbVIV5F3aHkduENubYzDffN9385sknWQ31CUMXFq
jIOJMQjIOkyRYAnja0Xw/4OAPSb/tGuNepqsIpwf3nT04Zn1CL7xruYbM5WU
4Hz3NUeXM2goO/iYdzom+MY43NGUXfP/srIDyLmWMTEOZ0CgR8Vhw9z3y48V
Q/lnVBxsTeN2ebYg+DD/ofM/LFqvcNZDyQE9fACywo2Y
              "], {{
              116.39999999999998`, 4.36328}, {116.39999999999998`, 
              3.6601599999999994`}, {115.49799999999999`, 
              3.0999999999999996`}, {114.406, 3.0999999999999996`}, {
              113.26599999999996`, 3.0999999999999996`}, {112.39999999999998`,
               3.68398}, {112.39999999999998`, 4.36328}, {112.39999999999998`,
               4.45859}, {112.42299999999999`, 4.923439999999999}, {
              112.87499999999999`, 5.2332}, {113.13599999999997`, 
              5.3999999999999995`}, {113.243, 5.3999999999999995`}, {
              114.07299999999998`, 5.3999999999999995`}, {115.05899999999997`,
               5.3999999999999995`}, {116.39999999999998`, 
              5.3999999999999995`}, {116.39999999999998`, 4.36328}}}], 
            
            FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 
              1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {
              1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}}}, {CompressedData["
1:eJxTTMoPSmViYGAQA2IQfUeFrXEqd5yDiTEIiDrA+GlgIOYgss79YdWdWDh/
xkwguBnrcKBW1iJ9CYKf5KVy8XSHBJwPMU/VQbb1deCOvFiHM2CgAudD5FUc
Uqzv+/fOR/BTQdYsi3V48Xvlx0u8CH6JTdoCo3tKcH673or8mZMl4HyY+/aU
TJZgmReL6v4cTD7Mv/FPLyjdbox1uHArV3yWt6iDDdA505ch+GBn70HwS/fN
l9I/iuCD/fsRwUcPTwBG6pEZ
              "], {{119.49999999999999`, 
              12.493799999999998`}, {119.49999999999999`, 12.8648}, {
              119.20299999999997`, 13.100000000000001`}, {118.906, 
              13.100000000000001`}, {118.56, 13.100000000000001`}, {
              118.30000000000001`, 12.8277}, {118.30000000000001`, 
              12.493799999999998`}, {118.30000000000001`, 
              12.172299999999998`}, {118.57199999999999`, 11.9004}, {
              118.89299999999999`, 11.9004}, {119.26399999999997`, 11.9004}, {
              119.49999999999999`, 12.1969}, {119.49999999999999`, 
              12.493799999999998`}}}], 
            
            FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0,
              1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {
             1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 
             3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3,
              3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 
             1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxl1HFIU0EcB/CXiUroEHHzsTLmNiVopWlhQdmP/miElWWREfXeEjWRzErR
NDFwpIZE2gpdFGKB05AVgRAlZoQGNsIiqBxzCFJEyozKFlbr7sbdD9zB8fiw
vfvd+/7uvbTiqsLSlZIkrSDzEJlRZL74ue74tV022JxDhxa4y9jQwYUvGZvi
stBdZ5LsoxnoU/RCPNdS2Z7tTRH23vXEOEsMwuzaZxRucxVNZB82geHh+fLO
VBt0hzqalvRm8BdcJSVsUFuwVleRkA4D397uK5b4/tLB8uhOwPVJFZ6dNHp/
96FTL389+LhFhXp/cCrnqQl8dL0GFUr82uehcSNYZxqS3VUqLLjG83MHzNAx
37hzy268//MSqahFxw6uOVbyShFm/3cr0NUe3O/Rm2CBbC+xX4HAavVimdMI
twNkYVek+f3S+lbdxzwFPGyYhcO/myHYVDFcU43udpJRr4BlscvniEVbB8dc
0gejcOvG/iqnQxbm/YmPIgXOoXm95eb9Z/0tVGByqjLlVr4WyodrHHIjmsZ2
pRPN8nSh5UyfOeYN+gFp7/wsrs/N6yfaRyd6h9AslsFIT+eOLHquy8LhfhqE
JToOmCBEh1+BuYSRLOd9M9DtR2tU4Tp6nrejS2kZ0v82ml+1SbioeWzGE0oT
tieVTf27KQvz/THnodl51ESaP39jsts6Y1RFPuT0HN22F836dxJtIe15XYf+
8468kb3oG3L0Ec0Qrs/N65+mB7oZHT4fkeb5cvN8uXm+P/6SDbgxP3Z+ptHs
fYm1CbP+xNtEvtw8X26eLzff3yXyOjji0C9rR3r0fjXC/PlPPNkTH/Ud86Fx
bNDYhJ/16DN9MprG+8uEPrtj1ft7W9HLv4//AQfsKKo=
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 
              1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}}, {{0, 2, 0}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["

1:eJxTTMoPSmViYGCQA2IQHZlifd//aYJDegn7RuOnUg4w/pl92k3/daUd2NfI
RKU8TnBYL6TDlx4n7dDyOnCH3EMEf737wyqRewg+WP/dBIdwTrF2Y3lph/qs
PSWT7yQ4/AeB+1IO8q1AAy4lODg0PTo+Y7eYQzRI/c4Eh5lgIOpwRGFDUcZK
BH/7579XKmYi+MYgUJzg4DJPJdb4pxic77Er7dPZMnk4v3PrDxEGYwWH98uP
eZvfRfDBxjxF8NPTgOAZJh9iH4KvCrQt7beSw1eNmP5DFxMcTMAWqTokA53f
uxjBB/uzHMEH6w9LcOi28dyVdkgJzgeH91J5OF+4clLJ2RRJh8kSLGF8tcDw
BwMRB8eEpxeUliP4vkkCEZZXEHxYfPHHBtw3ei7pgB6fAOGszsM=
              "], {{
              134.39999999999998`, 8.299999999999999}, {131.57899999999998`, 
              8.299999999999999}, {131.67399999999998`, 10.184}, {
              132.71699999999996`, 10.399999999999999`}, {133.04799999999997`,
               10.399999999999999`}, {134.316, 10.399999999999999`}, {134.388,
               8.70781}, {134.39999999999998`, 8.299999999999999}}}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1,
               4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}}}, {{{137.70000000000002`, 
              9.905859999999999}, {137.70000000000002`, 
              10.239799999999999`}, {137.41499999999996`, 
              10.499600000000001`}, {137.10599999999997`, 
              10.499600000000001`}, {136.74699999999999`, 
              10.499600000000001`}, {136.49999999999997`, 
              10.215199999999998`}, {136.49999999999997`, 
              9.905859999999999}, {136.49999999999997`, 9.53477}, {
              136.80899999999997`, 9.299999999999999}, {137.093, 
              9.299999999999999}, {137.427, 9.299999999999999}, {
              137.70000000000002`, 9.559769999999999}, {137.70000000000002`, 
              9.905859999999999}}, CompressedData["
1:eJxTTMoPSmViYGCQBGIQnZ4GBGaJDh5rji5nsBB1gPH/fozbasQo7pA+8W2N
vWmiw38wkHS47987PU8JwZ/7fvkxb3EEH0zxJzokealcPP1CAs5fw9J9eOZ8
cThf45PKy1meYnD9JsYgIOrQ4Zjw9IISgq9uyLFGRgvBPwMCOokOMaoRMudq
RB3kW18H7tBLdKg4vM115loE/8/jvVmpTCJwPgMILBCA2/dh0XqFsxJcDgtd
t33+K5Lo4H2C3XZ2KCecf0dTds3/zxw4+fGOszZmVHE4fP57peKlGMz/7A4g
6SsSCD7QdrlWaQQfFr4ilZNKzqrwO6CHPwBdwsDK
              "]}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
              3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 
              3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGDQAWIQ/X75MW/zjUkOThOahdKkJBxg/CQvlYunOyQcwi23
nChbh+BHpljf91+L4M+X0r+rsgrB/6oR039oZZJDVtOK3wwpEg71WXtKJq9I
clj+wkPvP6OEw2QJljC+pUkOsmv+F884L+bwHwRmJzmsAMkfFHU4DDJgEoKf
ngYEbZj8ThvPXWmXJOD8NUI6fOn7pB1KQBYA3evMaZz7/5SCA8j5+7YnOezJ
r3k786oyTv4ZEOBRcfge/Hjp7C0IfsNU5+6czQg+iPt8PYL/OnCHXCuQ7wIK
v1/KDqcXum77DAwflWuPghl6lB32gwII6P9Sm7QFRnVKDktnH1HYMC/JYWWt
lZzxAgW4+++a7/t2JkgWzjfe1Xxj5iaEfEYJ+0ZjVmUHhQ1FGRMLkxxMjEFA
1WH7579XKjwRfH7dTXPfiyP4YP3PEh1SQfQxRTj/Lyjc98vA+TelaxKNpko4
PL2gdPvnr0SI/86IOMSDBBST4HxgbLM1WiL4NfamcbtCofw3og6g4DtSkOSw
XuFshMleCQd1Q441MmVJDjGqETLnZMQcQMH1uhGh//fKj5d8JyH4IO+8XIbg
w9Ljm7bcbqNqcQf09AoAidRKMg==
              "], CompressedData["
1:eJxTTMoPSmViYGAQAWIQ3TDVuTsnP8mhx+sVi8lHSYfTC123ffZNctigcDbC
RFbMAST9XD/JoeLwNteZa0UdrO/7905XQvBD+XQ3zWVH8P+DQaLDm7bcbqPd
EnD+n8d7s1KZpOH8LxsCsmeJyzrMPqKwoYgjyeH2ojNsM1kUHbbLtb4OFEly
cBa/sv1MpJLDx0u+SQIqSQ5vireK/uZWcVh+zNu80zLJ4QwYqDjwR1huOeGF
4IONz8fku6qWMs3aoQjnM/At9DobJw9xP5DfH9Htz7hBGs53X3N0OcMOKbj6
91P4rv2vlHJADy8Aq4WhGw==
              "]}], 
            
            FilledCurveBox[{{{1, 4, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 
             1, 0}, {1, 3, 3}}, {{1, 4, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {
             0, 1, 0}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJ+KB3yeOnsIzYpDu+n8F37f1LJAcY3MQYBZYeJb2vs
Tc0QfJF17g+rDBD8hqnO3Tn+yXD+WqC0iBeCD6adMfmrWboPzzyvBOenp4GA
kgNLGJ/uJk8EH2Y+jA+zH8Z/8Xvlx0umCD7M/eh8dP/xxwbcNzouA+fPmAkC
snD/wvgw+2B8mHtgfJh/YXyYf9D5Jo5XahkuycD5/8FAGu5fGB9mPowPsx/G
h/kXxoe5H50P8x8AWVbRWw==
             "]], 
            
            FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 
             3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0,
              1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJZIGYC4n3zpfTvxqQ6mBiDgKgDjJ8GBmIOBbZc1xcH
IPgu3TnPf+si+GdAQCfV4U1bbrfRbwR/JgjslIDz9bVWCl9g0YLzczh/Lkif
jOBfyI9nPzdTy+FBlcg6d1UE38E0bpenTCpE3RtNB4O7KmyNnKkO/8FAw6HD
MeHphUcpGHyI+zQc3gTukGt9jeCDqX8IPtjfwqkOX3fe6vr7FMFvFkq79W+r
BJzvMgEo8kvMwQToHB4hhP9dt33+e+VDCpzf8hpo4VNMPix8G6Y6d+e8T3G4
cCtXfJa3qANbI1BAJBXOLwNFgCKCnyfUfOCULoLvycOk3R6E4KPHHwDTscl7

             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJJKJ0GAmppDv9BwF7JAcZ/sI9vjrGTisOcIwobilTS
HFJi77gxW6g52Nz3750uluZgDaL5NBw6HBOeXmBLc5CZF6d5WkDLIaB3ep7Q
61SHC/nx7OdmajlcqXipZngDwX/xe+XHSwcR/AtKt3/WLUt18DHvBJqk6eCb
JBBhOSPVYamfg3DiY3UHW67riwt6Ux3sXtxc8ytGzWEmCHRC+XdU4HyY+2F8
+V0L9qWek3dwMI3b5dmT6iCQ/VGTwU3GYYGU/l2VWakOX/Z93Jp+TcKhbN98
Kf2VqQ5JXioXT2uIOmyc+375scOpDmtYug/P/C/soNMudvPcdQQ/KgXo858I
fkPWnpLJPGkOOU0rfjO0iDlYbjlRtk88zaHTxnNXWpCkg1DzgVMLVdMcWvVW
5M/8LAMP3w+L1iucvaHggB7+YPdzpjn8/Ri31Wghgt8NMo9JEc7/sCEge1a4
nEMkyD2saQ77a2Ut0lOkHQJ3yLW+/pvqYOp4pZZBSMwBFH0ZT1Md9iTeXnRG
TdRhE8h/1xF8oO++B59G8E2AwcWzKdVBEBRebGIOOiANq1Idzt/KFZ/lLQ1x
LzC+ekDuMZKD80Objj48814Bzoe5H8af0t4adXmOCpwv8HL7euZ0NYcfwY+X
zl6TCon3K+oOa2SAIbw51cEYBIo1IenpeKpDDufPBenGWnD3w/iHvmrE9D9D
8P+CEhzQ/99B5i7RdABpb2ZJcyiU5n2gO0EdHn7A0HLJ1FeD83UnLPhh6KaC
Ef4AWzxp4g==
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJJKG1iDASP0xz+g4C9kgOM/2Af3xxjJxWHjIlva+wf
pjmkxN5xY7ZQc+BYIxOVcjnNwfq+f+90Pg2HUD7dTXMPpznIzIvTPC2g5QCU
tb6/PM3hQn48+7mZWg4LXbd9/jsFwd9yomzf/DoEf+775ce8k9McfMw7HROe
ajpI6d9VYQtNc1jq5yCc+Fjdgev64gJbrzQHuxc31/yKUXNIAwE3KP+OCpwP
cz+ML79rwb7Uc/IOPEza7WKeaQ4C2R81GdxkHHKe/175MSzN4cu+j1vTr0k4
uHQDRVLTHJK8VC6e1hB1qMvaUzK5Ic1hDUv34Zn/hR1+BD9eOnsKgq9hCAyB
bQg+2N0n0xxymlb8ZmgRc2BrnOrcfSXNodPGc1dakKTDA2Aw5T1Kc2jVW5E/
87MMPHw/LFqvcPaGggN6+IPdfyzN4e/HuK1GCxH8bpB5TIpw/ocNAdmzwuUc
1EDuOZTmsL9W1iI9RdpBrvV14I5daQ6mjldqGYTEHCYAo890UZrDnsTbi86o
iTo0gPw3BcF/snT2EYUOBJ8RGFw389IcBEHhxSbm8BMUIOlpDudv5YrP8paG
uBcYXz0g9xjJwfmhTUcfnnmvAOfD3A/jT2lvjbo8RwXOF3i5fT1zuprDEYUN
RRmZaQ6+SQIRllfUHSpeAn1UkOYAUmZcrAlJT83A8OX8uSDdWAvufhh/wqGv
GjGLEfxToAS3M83hOyjelmg6gLT7H0xzKJTmfaA7QR0efsDQcsnUV4PzdScs
+GHopoIR/gDI0FYJ
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJJKH0GBOakO/wHAXslBxj/wT6+OcZOKg6M2u1iN2el
O6TE3nFjtlBzWOi67fPfnnQH6/v+vdP5NBw+LD/mbV6b7iAzL07ztICWA1D2
SkViusOF/Hj2czO1HGxA6vwQfN8kgQhLCwTfotMx4alMuoOPOYih6bDlRNm+
+XzpDkv9HIQTH6s7LCmw5brOnO5g9+Lmml8xag4MYADl31GB82Huh/Hldy3Y
l3pO3mHp7CMKG5jSHQSyP2oyuMk4sDZOde4WSHf4su/j1vRrEg53VNgap8qn
OyR5qVw8rSHqIMESxqdrle6whqX78Mz/wg4T39bYm/oh+AdOAUMgH8F/ekHp
9s+mdIecphW/GVrEHBZI6d9V6Ut36LTx3JUWJOlQ8VLNkAMYnq16K/JnfpaB
h++HResVzt5QcEAPf7DzG9Id/n6M22q0EMHvBpnHpAjnf9gQkD0rXA7inup0
h/21shbpKdIOO+RaXweWpDuYOl6pZRASc9ACRt+56HSHPYm3F51Rg/rPD8EH
+i5ulyOCPwcYXEUa6Q6CoPBiE3OYAtKgmO5w/lau+CxvaYh7gfHVA3KPkRyc
H9p09OGZ9wpwPsz9MP6U9taoy3NU4HyBl9vXM6erOcTt8uRhUk6HpIsr6g5C
zUAfaaY7GINAsSYkPdkCw5fz54J0Yy24+2F8jZj+Q19jEPwUUMIsTnf4Hvx4
6ewlmg5fgNpfVqU7FErzPtCdoA4PP2BouWTqq8H5uhMW/DB0U8EIfwD+fVFk

             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJJKD0TBCIzHP6DgL2SA4z/YB/fHGMnFYdz34MfLw3P
cEiJvePGbKHmkCfUfOCUZ4aD9X3/3ul8Gg67SyZLsFhlOMjMi9M8LaDlAJRd
6CqX4XAhP5793EwtB/Y1MlEp3Ai+lP5dFbav6XA+Sxif7qab6Q4+5p2OCU81
HRqmOnfnnE53WOrnIJz4WN2hwJbr+uID6Q52L26u+RWj5nAGBPZA+XdU4HyY
+2F8+V0L9qWek3coypj4tmZ/uoNA9kdNBjcZh0u+SQIRZ9Mdvuz7uDX9moTD
yo9AkTvpDkleKhdPa4g6PLmgdPvnt3SHNSzdh2f+F3aI2+XJwwR0P4zfOx0Y
AjoI/qa575cfs89wyGla8ZuhRcwh5/nvlR+9Mhw6bTx3pQVJOrhu+/z3SkSG
Q6veivyZn2Xg4fth0XqFszcUHNDDH+x+mwyHvx/jthotRPC7QeYxKcL5HzYE
ZM8Kl3PoAbnHIsNhf62sRXqKtEPL68AdcoYZDqaOV2oZhMQcQNE3WyLDYU/i
7UVn1EQdnoL8x4XgA32n3f4vHc4HBZf903QHQVB4sYk5JIA03E13OH8rV3yW
tzTEvcD46gG5x0gOzg9tOvrwzHsFOB/mfhh/Sntr1OU5KnC+wMvt65nT1Rx0
2sVunruf7gCKFssr6g4PgMkq71m6gzEIFGs6tIDS0690hxzOnwvSjbXg7ofx
v2rE9B+SRPANOIAJziAD4u8lmg4g7dvMMxwKpXkf6E5Qh4cfMLRcMvXV4Hzd
CQt+GLqpYIQ/ADWifDM=
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJ5IGYCYmMQ2JzhEMYp1m4sL+oA469XOBthIivhINf6
OnDHqgyH/2Ag6RC3y5OHaTaCL3bz3PfgfgTf/WGVyLr2DIckL5WLp19IwPlr
WLoPz5wvDudrfFJ5OctTzCEWZB5QvwnYYlGHQ181YvpnIfgGHGtkohYg+PVZ
e0omL4Ga3yHqADTN/eGyDAfB7I+aDMdEHT5e8k0SWJHhoPaked7ZV6IOZ0AA
D/80lK8K5c8EgZVQ99oj+H8e781KZULw9cU/zp3xVdAh2fq+f+/8DIceG89d
aUZ8DiDu9L4Mh5LlJRv+ned0kNK/q8LWm+HQJF7LmtnG6fBSzZBjTU+Gg/cJ
dtvZoQj+HU3ZNf8/c8D58Y6zNmZUcTgsnX1EYUMfLHzZHZIEIiy3TEDwweEz
BcGHxZ9I5aSSsyr8DujxCwDhIOFx
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0,
              1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGIzIGYC4v5DXzVi7LMc9uTXvJ0ZquAA4ys4fkw+06vg
YG8at8vTBsF3SHh6QckawT9waqHrNnMEX/zmue/BQH5yxFHpmekKDkeAxvWb
ZTmU2KQtMPJTcJDRv6vCpprlwB8bcN/ouYTDjJlA8DHT4YH5vm9njEQdftRl
7Sk5jeD7907PE1qM4P8HgfpMh5DfQBMbJOD8vSD3p8rD+c7iV7afqVRw0GoX
u3muOdNhyf19fHM2qzh8+Xul4uW6TIcVLzz0/j9Ud5CJSrG+fzjToe/JJ/lL
+ZoQ/zzPdDgDBloO/Lqb5r7nzoLzbwC999gUwa8HOneyR5YDl5tqKdMsDTj/
jgpb41RlNTi/wxEYcE2qDg1Tnbtz3LMcZvyfUPf7lwqc/wDoPONHCP4b3n0G
M1epOICMcfZG4t/+WZflg+ADXbN0dgCCDwztQ1+B/CfHZ+yetkHF4bwSUENQ
lsPEtzX2pnKqkPjIynII5wN6TF8bzk9PAwFtSHinE88HB0MKgl8DSjCJWQ4u
3TnPf2tqQ9ID0D+yFukumfqaDmeAwfvZMssh4fBl7dSZWg7rizImvlVB6D/u
bd7pyIHg9wCNWbk1E84Hx298psOBWqCJKmpw/v+K9VEzGxTgfGYZp6mz/ko4
gIJrT0+mwxqW7sMz/wtD4uMIgg9Oz48R/JAdcq2v/2Y6CGV/1GRYJuqQAVQu
IQJNr+wSDj5A5yUA47/DxnNX2iRpeH4xXvOo94wyIv/A8hMAt6eT3g==
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 
             1, 0}, {1, 3, 3}}, {{1, 4, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {
             0, 1, 0}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJ+KK2woShj4stsh/dT+K79P6nkAOObGIOAskP8Lk8e
pscI/oMqkXXudxF8/ySBCMs/WXB+DVD64TcE/z8IvMfkr2bpPjzzvBKcn54G
AkoOF5Ru/6z7huDDzIfxYfbD+FtOlO2b/wjBh7kfnY/uP/7YgPtGx2Xg/Bkz
QUAW7l8YH2YfjA9zD4wP8y+MD/MPOt/E8UotwyUZOB9M/5eG+xfGh5kP48Ps
h/Fh/oXxYe5H58P8BwBXqfJZ
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJJKD1jJhBI5jr8BwF7JQcY/8E+vjnGTioO578HP14q
nuuQEnvHjdlCzSFXqPnAKc5cB+v7/r3T+TQc9pRMlmD5leMgMy9O87SAlkPL
gVMLXe/lOFzIj2c/N1PLgX2NTFTKaQRfRv+uCttWBJ8ljE9308wcBx/zTseE
p5oODVOdu3O6cxyW+jkIJz5Wd8i35bq+uCHHwe7FzTW/YtQczoBADZR/RwXO
h7kfxpfftWBf6jl5h5KMiW9r6nMcBLI/ajK4yThc8U0SiOjNcfiy7+PW9GsS
Dms+XvJNmpPjkOSlcvG0hqjDkwtKt39uy3FYw9J9eOZ/YYfYXZ48TKcR/N7p
eULNbxD8LXPfLz/2P8chp2nFb4YWMYec579XfuTKdei08dyVFiTp4LLt898r
ErkOrXor8md+loGH74dF6xXO3lBwQA9/sPv/5Dj8/Ri31Wghgt8NMo9JEc7/
sCEge1a4nEMPyD0/chz218papKdIO7S+Dtwh9zHHwdTxSi2DkJgDKPpm38hx
2JN4e9EZNVGHpyD/nULwPXiYtNv3IfjpwOCyX5rjIAgKLzYxhwSQhrk5Dudv
5YrP8paGuBcYXz0g9xjJwfmhTUcfnnmvAOfD3A/jT2lvjbo8RwXOF3i5fT1z
upqDTrvYzXPzcxxA0WJ5Rd0BlKzyluU4GINAsSYkPe0Chi/nzwXpxlpw98P4
XzVi+g/dRPANOIAJ7kMOxN9LNB1A2rd9z3EolOZ9oDtBHR5+wNByydRXg/N1
Jyz4YeimghH+ADzXhJg=
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}}, {{{
             235.39999999999998`, 5.893750000000001}, {235.39999999999998`, 
             6.252339999999999}, {235.10299999999998`, 6.499999999999999}, {
             234.80599999999995`, 6.499999999999999}, {234.447, 
             6.499999999999999}, {234.19999999999996`, 6.20273}, {
             234.19999999999996`, 5.9058600000000006`}, {234.19999999999996`, 
             5.547270000000001}, {234.49699999999999`, 5.300000000000001}, {
             234.793, 5.300000000000001}, {235.15199999999996`, 
             5.300000000000001}, {235.39999999999998`, 5.59688}, {
             235.39999999999998`, 5.893750000000001}}}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
              3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJXIGYCYvY1MlEp1nkOF17wJaV7yTrA+Ku7b2cw3Fdw
COXT3TRXPs+h3Iv99f85ShD+71yH3S+0PYzZlB18kwQiLGXyHP5+jNtqtFDZ
IWPi2xp7wzwHH/NOx4RUVTifz3/9lFQPdTjf9Ky130VDTYfzSrd/1gkB7c+P
Zz83U8thrfvDKpF3uXB+bdaeksknEPwzILAm1+E/CMhrwvmvWEwEzWLU4fwf
wY+Xzk5RczhwaqHrtu25DibGIKDmoBHTf+jrHgTfgAPo4SMIPlj/mVyHvief
5C/1I/gadT07sz3V4XxZi3SXTH4NSHgcznXQm7Dgh2GahgM4+HYj+OuLgD7e
geCDrNdA4l9dXGDLBXQf6+JJVoy+Gg7yG4AajuY6mF87mmvCoOWw/Ji3eedL
BL9hqnN3zmsE/8MlYAz8QPDB9gnkOYhPvcKZsUgTzn96ARjQdupwPjg+Tqg5
nP8ODCj+PIe4XZ48TNmqkHBgznOwKjjXcSlOxSEHGPwSQPPPBssWGfsoO5SA
IhBo/wfp+Oo0S2UH/bsqbI0PYeGn7JCaBgTXYPGj7AAKjvvncx1mgoCksgMw
9k3jzuU6gJULI/hg+ZtKqPyZSpD0dQHBfwLyxzUE/ygweBxfIMkvnX1EgSMP
zge7RwzKf6kA59833/ftjJEsnP/n8d6s1EdiDnd+1mXt+ZPr8AAsL+rAcR0Y
Qa8QfLD5NxD8v1cqXqrtzHVoEUq79S9UzIEHpH4dzD2SDuGWW06U7cp1WPHt
ZcWZBkl4/G5QOBthEisF54P1i8rA+fqqk16klsg6sIQBE9jeXIg70+Qg4bwZ
wX/+e+XHSysRfFD2WTc/1+HLhoDsWdtl4fz/vAu9zt6ThvMv3MoVn9Ut7gAK
7l0Hcx3WsHQfnvlf2OEq0DuGbxB8sLxkHpwPKx92J95edCZNwgG9/AAAr6Dt
EQ==
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
              3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJXIGYC4gWu2z7//ZLncOEFX1K6l6wDjL+6+3YGw30F
h/fLj3mb38xzKPdif/1/jhKEvzXPYfcLbQ9jNmWH579Xfrx0Nc/h78e4rUYL
lR1YtNvFbr7Kc/Ax73RMSFWF8/n8109J9VCH803PWvtdNNR0yNhTMlniDND+
/Hj2czO1HNwfVomsW47gi7OE8ek2IfipaSCQ5/AfBOQ14fxXLCaCZjHqcP6P
4MdLZ6eoOcSkWN/3L8xzMDEGATWHI181YvrLEPwzC4EerkXwwfrb8hz6nnyS
v9SP4GvU9ezM9lSH82Ut0l0y+TUg4QHUrzdhwQ/DNA0HUPBdKUHwPXiYtNuL
EHyQ9YcKEfx8W67riwvyHFgXT7Ji9NVw2OEJ1FCf52B+7WiuCYOWg0PC0wtK
ixF8Gf27KmxLEfyeHGAMbETwwfadynMQn3qFM2ORJpwPNOX2Tzt1OB8cHyfU
HDImvq2xP5nnELcLaHG2qsMZENiT52BVcK7jUpyKAyj4NwHNPxssW2Tso+wA
0i4GtP+DdHx1mqWyw4myffOlZsPCTxkSL/2w+FF22AoMjorOPIeZICCp7ACM
/XPf2/McwMqFEXyw/E0lVP5MJUj66kTwa7OACWYCgh8P8thCBL/G3jRu10EE
H+yO81D+SwU4/775vm9njGTh/D+P92alPhJzAKZGlrBteQ4PwPKiDksKQBGE
4IPNn4jgT88Taj4AjN8WobRb/0LFIOrTYfZLOny45JskAEwPK769rDjTIAmP
3w0KZyNMYqXgfLB+URk4X1910ovUElmHOaAEVp4HTddykPjJQfAbpjp35yQj
+A+A2cc9Ms/hy4aA7FnbZeH8/7wLvc7ek4bzL9zKFZ/VLe4gCgzu4Oo8hzUs
3Ydn/hd2yAd659RSBB8sfxnBh5UPuxNvLzqTJuGAXn4AABVZ9Tw=
             "]]}, 
           Thickness[0.004013324236465064], StripOnInput -> False]}, {
         ImageSize -> {249.16608717310086`, 16.338709838107096`}, 
          BaselinePosition -> Scaled[0.32439307852814453`], 
          ImageSize -> {250., 17.}, PlotRange -> {{0., 249.17}, {0., 16.34}}, 
          AspectRatio -> Automatic}], TraditionalForm],
      PlotRange->{{0, 1.}, {0.017378029260753144`, 0.028393514570851104`}},
      PlotRangeClipping->True,
      PlotRangePadding->{{
         Scaled[0.02], 
         Scaled[0.02]}, {
         Scaled[0.05], 
         Scaled[0.05]}},
      Ticks->{Automatic, Automatic}], ""},
    {
     GraphicsBox[{{}, {{}, {}, 
        {RGBColor[0.368417, 0.506779, 0.709798], PointSize[
         0.009166666666666668], Thickness[Large], 
         StyleBox[LineBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQDQOr//XPyMrNsJ81EwRW2l/hNA0MOgfj77Q/6fc9
ZlJwpr2JMQgctpd8bzPz969MqPxJe8nGGV95DmXZQ0y7YM+9MPqs1LJsqPrL
9uE5Gx4ULMmxT08DgWv2mydt25uzKxeq/6b99JonJhOe5tmfPQMCd+w3T54d
fEywAGreA3uLcwc8VXYWQNU/tF+z91zxh/RCqPmP7cW+hO4Nli2C6n9iXzLF
7X7/jSKofc/sPy1+6Pp3RjHUvBf2St5yxzniSqDmvbQ/U/470lC9FGrea/tv
ixa+Zv1SCjXvjX1ukUGi8pEyqHnv7GXWu5wxml4ONe+DvZ9L45XnORX2APuP
mQ0=
           "]],
          FontFamily->"Latin Modern Roman",
          FontSize->12]}, 
        {RGBColor[0.880722, 0.611041, 0.142051], PointSize[
         0.009166666666666668], Thickness[Large], Dashing[{Small, Small}], 
         StyleBox[LineBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQDQOzRaMO7M/NsJ81EwRW2q+azmmceR7G32m/RCf6
n1NApr2JMQgcti+O4VGc+C8TKn/SPozH5sGvI1n2ENMu2L+/71WgsT4bqv6y
fV7i0ry+VTn26WkgcM3++y2j+2+350L137R3+/X0JfPDPPuzZ0Dgjv2l3Z6/
KngLoOY9sJ9YyyX+Y1cBVP1D+78r/pd1pxVCzX9s/+bP/rVaUkVQ/U/sy1Yd
cVhxvQhq3zN750NzepNnFUPNe2HPJhncNS+mBGreS/uHd52ezFIqhZr32j48
mFlc63sp1Lw39t7fpxk17y6DmvfO3l3kqOHNGeVQ8z7Yz+39XtWcV2EPACQo
mMk=
           "]],
          FontFamily->"Latin Modern Roman",
          FontSize->12]}, 
        {RGBColor[0.560181, 0.691569, 0.194885], PointSize[
         0.009166666666666668], Thickness[Large], Dashing[{0, Small}], 
         StyleBox[LineBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQDQMTL09sZ8zLsJ81EwRW2u8+8KN5yVEYf6d99d6n
RZz+mfYmxiBw2P5ZRbG76adMqPxJ+6BNnkUnDmXZQ0y7YB9z1eJZ2OJsqPrL
9pxpm83mrsyxT08DgWv29RZTN6dsy4Xqv2n/w+2OwqtnefZnz4DAHfvXL+/N
TRIsgJr3wF75T1Xdkc0FUPUP7Vu0z376n14INf+xfcmSA0z7FIug+p/YK3O2
b3O9UwS175m9QX8Cq+HsYqh5L+wXTV9+rCO+BGreS3u5i+qRvlqlUPNe2yuk
VD7e/qUUat4b+9PnVK+k7CmDmvfOvtrnm6To3HKoeR/sH7LGzvydX2EPABQM
mIo=
           "]],
          FontFamily->"Latin Modern Roman",
          FontSize->12]}, 
        {RGBColor[0.922526, 0.385626, 0.209179], PointSize[
         0.009166666666666668], Thickness[Large], 
         Dashing[{0, Small, Small, Small}], 
         StyleBox[LineBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQDQMe/3kV90xJt581EwRW2psz5q8248mA8nfab489
897zTYa9iTEIHLbXO5Ly82NsJlT+pP2keU0+R1Kz7CGmXbBv31HJo2OcDVV/
2d5umc45V50c+/Q0ELhmryPV9V7UJReq/6b92fmnKhPN8+zPngGBO/bqzGfO
ZfTnQ817YN/0TDM/MLMAqv6hfSSrkX0/QyHU/Mf2WafUo22XFEL1P7F/P29F
3jOnIqh9z+wFy9zjr7EUQ817Yb+7Jpg7Yl0x1LyX9uvjxFaFxpRAzXttv+Hz
juSVNqVQ897Yl/GHx+XeKIWa985+5RpGD9ZZZVDzPtgnvf2/scy23B4AyBmP
Qg==
           "]],
          FontFamily->"Latin Modern Roman",
          FontSize->12]}, 
        {RGBColor[0.528488, 0.470624, 0.701351], PointSize[
         0.009166666666666668], Thickness[Large], Dashing[{0.01, 0.02, 0.03}], 
         StyleBox[LineBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQDQPnnU5JZptn2s+aCQIr7bVzI3quwPk77V+7zHok
sinT3sQYBA7b66vlcyx2y4LKn7R3mLN5+w3hbHuIaRfsMz9tKol9mw1Vf9n+
UefsLxw/c+zT00Dgmn1K4XL5aZx5UP037S/NLLuraZRvf/YMCNyxP5ppczFV
rwBq3gN79o6rBrE3CqDqH9pfLDjqqz2hEGr+Y3tl2eX9Wv5FUP1P7D92LS7T
fl8Ete+ZfUb+5+vtB4qh5r2w/92jeOVSXwnUvJf2S2+oX33jUAo177V9wpRK
x0MaZVDz3tjzRLFJTXlaBjXvnb2rdtbbuzfLoeZ9sN8fcNHKelKFPQAMGZUt

           "]],
          FontFamily->"Latin Modern Roman",
          FontSize->12]}}, {}, {}, {{}, {}}},
      AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
      Axes->{False, False},
      AxesLabel->{None, None},
      AxesOrigin->{0, 0.0025175},
      BaseStyle->{FontFamily -> "Latin Modern Roman", FontSize -> 12},
      DisplayFunction->Identity,
      Frame->{{True, True}, {True, True}},
      FrameLabel->{{
         FormBox[
          GraphicsBox[{
            Thickness[0.016989466530750934`], 
            StyleBox[{
              
              FilledCurveBox[{{{1, 4, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1,
                3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 
               0}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJhIGYC4t2JtxedcZNwmAkGjA7LX3jo/T8oCefL71qw
L/WcpIP273Uc/7YzOqR4qVw87SHlEM4p1m78n9mhPmtPyWQLLYfbGQz5jSoG
Dkv8HIQTk7Uc7E3jdnn6IPjiU69wZgQh+A5Nj47PiEZSXxmxwrTWwKFnw8OX
U420oPYbOGy/yHCP6aUmnJ94+LJ26kwEX0r/rgpbo6bD8yztb9OB+sH2JGk6
gIw7CzTffc3R5QwSUg4LLsoeOTeF20FmXpzm6Qv8DhUXwyeknVFyAPrOb3or
k4MDp3HufysFhxYFdtUzX5gdHrjGO87aKA/x534uB0PVSS9SVRQdAIbUfRk=

               "]]}, 
             Thickness[0.008120965001698947], StripOnInput -> False], 
            StyleBox[{
              
              JoinedCurveBox[{{{0, 2, 0}}}, {{{12.951199999999998`, 
               16.344899999999996`}, {57.867999999999995`, 
               16.344899999999996`}}}, CurveClosed -> {0}], 
              
              FilledCurveBox[{{{1, 4, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0,
                 1, 0}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0,
                 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 
                0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1,
                 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 
                0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                 3, 3}}}, {{{20.699600000000004`, 11.9254}, {
                20.699600000000004`, 11.300799999999999`}, {20.3863, 
                9.499999999999998}, {17.969099999999997`, 
                9.499999999999998}, {16.6105, 9.499999999999998}, {
                17.404299999999996`, 12.7219}, {17.5125, 
                13.174999999999997`}, {17.5605, 13.200000000000001`}, {
                18.029299999999996`, 13.200000000000001`}, {
                18.895300000000002`, 13.200000000000001`}, {
                19.929299999999998`, 13.200000000000001`}, {
                20.699600000000004`, 12.880899999999997`}, {
                20.699600000000004`, 11.9254}}, CompressedData["
1:eJxl1HlIk2EcB/DXWFlEKtTcu2psmiazdMf7DjqsfqMEXdLsoAYdntOR1jo0
JabSKtJMPNJMy+h2ZaVddkAju1asdWqH/bGyCC3DIysh7W3Pas8D7oGXlw/v
8bzv7/n+nqBk4zL9KIqiVrkOdM7/PWfTkzcqUIRWdOqzhOCxyTnYztiFkHeh
ObngkQpKdcVan14h6IUdOsE14iintqT6CHH4nAp7wUEVBGT0SanTQqCrWscZ
KlTQUmw1swuFcPizqL4zRgXtU0xJyjY+hFRzZfl2FmJupvU7fk6Cc8XvDFQB
sft5JfH78fvPmH1Y4Pkd0zjy+djb0fc2CLD3RFqMNS9piCw7OqiYzkLP8UaJ
Y5YIFr3pHdBIWRiw9l1N3yaC6NDsUbWzWBjmXGOBGHuf5guP3UwsR/VpJbZH
m8LSzgeB9nn5mj87GcjR+H7lMoOhYf6q1Rf9GdA7+S1cczB0T7DKa/a67rfO
MHNrpwEdEz9EX1bBGom6LyUuFJtCIzEM21WkSE4thXuSpi2GFhZsUldhuXBo
ze2arqAZ7JlB4oHMZhl2U+TGEz5RxAbKuIM32ttP21Z2yw4Rp6ehEQ4ln/rF
L2TEcej/ThC781Ak9/KvO6lnE1li283rJWN6pWAaYc/10m+mBSqrFFanznVq
8+SAUvU8UQoW89LYutsREIvW+wANiSuWhR0tioB4p7Le3hEI5yv1hSl5EeCe
Pi0QCnj3SxWvZ2D3oHpriEuXZ4VUi73dJHHo2Do+NsugwYf4jNqcw8nEBmPv
7kdZxO48dhCfQuuUNBOetW8Q1C7mQ9xD33mH2ohPLoGJSa76eeyvbazUj5Vj
t6H1jJHj9/3LP3FdT/2DxdXEeag/r3u7K/cx6IeIPf/biOpVR+zOgZG48ueY
hIOZMi+n6u5PqbER/+lbd1WpFmAPj/DQx1vr9ccFcA3MHbZcGWSYLb8pHg1o
1QMLPXkJhmPRzd+HBxTYP2607x3mM9hNH7qqLsUx//psUILdwCu+WyMjnoDq
aBGDMcH3iVDBgOShehzjEIHY1VaPRQx8Wk7tSy+bClsN5d9MnPJ/f02GHSgv
v5TQXen3insrxC6KQomjsd9HJ6hry/mQEqCbfcXCwDk0PzcRdh1xnH2azWLz
VvpFXNqgwvbsn/5rXYm10TByf/0LAkQ/Lg==
                "]}], 
              
              FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1,
                3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 
               3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 
               1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {
               1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGITIGYC4vQ0ELBy+A8G3A4wfiqY5nNY4Lrt898nlnD+
GTDA5E+tDWf5P1sAzk/yUrl4eoU4nK9wwpHT2FfKwfq+f+/0OkuofdIOu9X5
ubcus4Dzu/6mfn/y0RzOD5ATy/KdbO4Q8rvEJs1BymHtjfgy/zxzh5XfXlac
cZB0cDCN2+WZg8mH6Fd0UDPkWCNjZeag7D9p3cwzCH7n1h8iDMaKDh56/xX/
HkPwv2wIyJ513cxB8MmClpliCH673or8mcEKcP5MMBCA82HhEXHK6MjGfQg+
zD50Piy8TYyBYLKZg4V/6YmzBjwOJw87rc18h+CDtamZw/kmDdsdmpIQfLAz
diL4S2cfUdggZAE3H8aH2V/KNItDus8czr8lXZNoVIrJzyhh32i8VADONxD/
OHdGqRicX3X/xy3jbEkHYGjzMElbQONZChouCL6+1krhCyKWcL4xGEDTS7Uk
nN8X0e3POEEczr9vvu/bmUkCcD7MfU7n064+l0LwYfah82H+752eJ9T8wQIe
PomHL2unelrC+WBl9Qj+G959BjN3IfglGRPf1vBbwfno+QUAHxhykw==
               "]], 
              
              FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0,
                 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {1, 3, 3}, {0, 1, 0}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {
                1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["

1:eJxTTMoPSmViYGCQBGIQ7XtxYsw/ZnuH/2DA7QDjp6aBAJ/Dl79XKl6W2cH5
7tXN+j5pdg5ztt7WM7mO4H/Z93Fr+jcBOB9inqKDiTEI2Doo+09aN/MMgt+5
9YcIg7GiQzm3ikbdHgR/7cOXUzedsXXYfavrb6o4gs8fG3DfKFwBzm8RSrv1
z1TKoSXQc25Dm63D8hceev8TpR2ArlUz1LCF2i/t8EBE9uTT/TZw/n6DmVoS
R63hfLB7n1k57E68vejMMwk4n8d//ZTUEyJw/uu23G6j2wIOD47P2D1tgzXU
H9wOJRkT39ast4HzweGlZgvnc7ipljJ12TrI71qwL5WP1+EMGNg6HF/OIHE+
gR/Oh6kHAIb4t7g=
                "], CompressedData["
1:eJxTTMoPSmViYGAQA2IQfQYMbB3SS9g3GrMKOcD4LvNUYo0rBeH891P4rv2P
FHRYeyO+zH+drcMaIR2+9H0CDj4n2G1nl9o6yO9asC+Vj9+Bx3/9lFQJW4cZ
M0GA10H9Le8+g502cP4GvbzFjDEIfswuTx4mbhu4/i3mPw6l3LJ24I8NuG+0
XMBh/6mFrtsWWzt82fdxa/o1QYeadduS6mdaO5gYA0GwMJy/4tvLijMHROD8
nKYVvxlaxBzKI1aYnl1t7QAy7fQhcbj5IO3GlyXg9t833/ftzCdJB/6lew+K
p9lA/S3lcKbeY3/tWQQ//JTRkY16tnD+fxDot3UwcbxSyyAkBQ8vFhmnqbNq
JRwA5cikGA==
                "]}], 
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
               3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJ5IGYCYsstJ8r2XXd02GL+41CKFrMDjH9HU3bN/2IE
f09+zduZS5kd9O+qsDXudXTQ4UuvM3VndTAGAWVHhxu8t8VSv/E5nAEDB4cD
tbIW6SnicH56GhBMU4Dz7V7cXPPLRtXhO1v8DB9RR4dI8e0XGew0HT4mn4n1
PuHoIMESxqcrpAO3X72uZ2e2J4LfMu/sqvOhCP6VipdqhhkIPsviSVaMvToO
qxNCgtQvODrMmAkCOg6HL2unSp5C8MHu2obg55o0bHewcnQIr123Lem+lkN/
aaE07wcHhz2PRWRPtmo4bI78uvPWIgcHLjfVUiYpNYf/IFDv4OAyTyXWuFMZ
zof5F8bfEWwV8f+5jMNt6ZpEo6kODh16K/JnGos7KO/80/7lsYODqeOVWgYh
IUh42Do6iE+9wpmxiMPhvYWre9FOR4h5aUxw98P4MP/B+DD/z916W89kOoIP
i18AkWje2Q==
               "]], 
              
              FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0,
                1, 0}}}, {{{42.046099999999996`, 11.662099999999999`}, {
               40.228899999999996`, 13.533999999999999`}, {
               38.411699999999996`, 11.662099999999999`}, {38.56720000000001, 
               11.500399999999999`}, {40.228899999999996`, 
               12.760199999999998`}, {41.89059999999999, 
               11.500399999999999`}}}], 
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0,
                 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {
                0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}}}, {CompressedData["
1:eJxTTMoPSmViYGBwAGIQXdDV9+TTfxeH/xXro2YWKDrA+HcWnWGbuUTZQdNq
0un6DS4OJsYgoOpQyjSLQ9oOwff53BdccscZzjeJ2+XJ0+XsoHLtUTDDGmUH
yQPRCo6Vzg6Gax71nglWdpgiwRLGl+vssKb7dgZDv4oDt4pGXY8hQj9QNL/x
ixOcf9zbvNPxBIJ/U7om0Wipk8MrFhNBszsqDhbXjuaadDg5rK61kjP+oOxg
Gx69cX+Ok8OKby8rzggoO2inSj6KCHdyEMz+qMkwTRHOVzzhyGlci+Abqk56
kZqi6PCdLX6GT6yTg/Anx/NprooO/HOMF21JR/A38xSu6S5G8FkXT7JiLHVy
UI41/pnmrehgrXNl1rNaqPxVRYcfhs/WqU5xcth5q+tvqrmyw4fkM7HeG5wc
ZoKBioN906PjM14j+MxhfLqbeJ3hfDAl6ezQwHK039AcwQ9vOvrwTL0ynF/u
xf76/xslh/0GM7UkRKHy65UcTpTtmy/F7+zQfXhm/FlHJQd5x4/JZ1KdHK6y
BH5n5OBzuDu5vTUq2slhi/mPQyla3A4tNRc2R4Y6OaSngQCXw2MR2ZNPxRH8
0wtdt31mRfBlxbJ8P39zxOD/uGXszXSFw0EGyv8O5YPT0w9Hh/9gwA5JH5xO
cP5ekPtlEfwLSrd/1hk5Odx3jXecZcjh4FndrO/jhuAXgtJrO4K/fltS/U2g
/2H6LRl9W3jlEfzLvkkCEYaYfGYZp6mzajnhfJh/dDbNfb9cDcFf//Dl1E08
CH5zoOfchmOI8JAsvi706aATxL8i3HD+DFA83UTw/zzem5XKxOsw3waYYNic
HZ4EM/SkXxBzsNgCjDFgfCmA0udbcYft65mf9yg4O6wV0uFLnyfm4PLr7esD
ns4OZ8BAxKEgnv2c5EwE3+sEu+1sVxeEPDQ/e+xK+3T2mrQDen4HAN5StGc=

                "], CompressedData["
1:eJxTTMoPSmViYGAQB2IQXbtuW1K9p4uDeLvx/lmHpRxico/+26Ts4hApvv0i
g52Eg/6EBT8M7zk7MICBmEOiQITllhkI/vIXHnr/DRH8y75JAhGKzg77a2Ut
0lmk4Pw7mrJr/hsj+O5rji5niJCCqFNxdviyISB71nYpB2udK7OeqTo7GBgD
wWcph8Kuvief8p0dyg9vc53Jq+RwQen2z7oqoPnfzkxi2KrkcAYEljg7dNt4
7kpLUnZgWTzJinGvs8OeF9oextuUHXxOsNvOPguUPzwz/uxHZQePgD8Sxf+d
HWaCgYrDCuELLjcsXOD8u5PbW6OqEXwuFY26npkuDg/28c0xnqQM56vEGv9M
i1aC88svhk9Is1F0EKgyW22X7+LQ4/WKxcRQ1gE9fAHgiZC8
                "]}], 
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
               3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJ5IGYC4r7SQmleBzeHME6xdmN5UQcYX+Xao2CGN+IO
574HP16q7ObwHwwkHdJA4JkrnK+zae775dsQ/Kf2S+7vm+fq8GXfx63p2yTg
/DUs3YdnzheH87e5zuQ16hRzWLctqf7mVlcHE2MQEHX4s/LjJd9XCP6ND1+8
Iv8h+EDbjnnzuzlkNa34zZAi6nBTuibRSNbNodPGc1faJVGHD8lnYr0V3BzU
njTPO/tK1OHu5PbWKGXc/DtQviqU/+X29cZiNTeIe+0R/D+P92alMiH4/RHd
/owFwg4+y7jcVIH2e+xK+3Q2TMDBoenR8RmHXR3iHWdtzKjicqhp1vdZtsnV
wfsEu+3sUE44/46m7Jr/nzlw8iH6ORxM4nZ58uyChS+7Qy0owA4i+CKfHM+n
nUXwYfEnUjmp5KwKvwN6/AIAW8jnWg==
               "]], 
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0,
                 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {
                0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}}}, {CompressedData["
1:eJxl03tIU1EcB/A7m/OVombzUYhzW5lKOmYKivlbITtT09TKTGIhbppG9keQ
4TuLQCeCtnAre5iY5as0oiSnVFbEfOArfIS4bD5SsiHOgba8c94D+YXL5cPh
XM6553tYqdkJEguCIGDzId8RSSkvu2RRYMxpPae4woJtT9aqGYo6NugZ4uqY
8CgI4pPhQkS/dGT2q4iye3eKl+AiNs3vNnOMKQLOqCaRaGKDVuazZM8QAa9J
U65OZIP454D3hAFBU9lEBlHBgW/LK1HJKkTNbzjSGxZbjF3lRj/jcBq7fg4d
NvIQLNCDnIInOWD5pDKUthdBY36oJ3+ZDbYcnwKZQQgNq/M5akc2rPG0LdwZ
IThl/TlE3GVRZn0R2PDzsXncyjlJGgs+DvlJ3BeEsEcn6JdGsmAyg8guXsEu
HAu/fpZAlAezxVZ9NATs83yDNJoF1oZH6e225vERFvT8bcvVeSF4O166IQlh
Q2egwtctHIHCFA7sjmu9I8nBJv9OgRJbSqYeQRG9p4IXgp10o2daXcimfC3K
6pdx0RvKNiT6mcfm8VZvkB8vuzR7D0HZB4W4V+ANi/aqQIVOCCP0eD3N2gGe
XziVcHBOCK9C1t6n+dpBvKim6IBGCOmmD9vCi+l5eVsddvVl55LuSuwFTbBH
d8lOr43zoy2GrWHebL3Zq2SfbgnBaIrVVj/uYpeS63+GXfP76afoLiFMRYoF
Sp41MNHJdbch7KNkX10Q5dySgJj6WkTNZ/S5x483Yj/0CPjOUe30rv3H5Mp8
G8rb+zEUZL672o6d1/I6tVCBHefJzDyRiK2NqJtSxaKt/brYUa4mj3MMe/1H
Z6bEwh6ybDYLU4VgJpGQpQ8wwbJ488TuI/Ai+7nkCjfzBtqTmxE0O/s7pD9g
guPnjjflowjUprhAmP+wUssVUXaVD9tkDGJv32fUIdX1ju6D/+/7P7Taw/M=

                "], CompressedData["
1:eJxTTMoPSmViYGAQB2IQ7VHdrO9zzdNBvN14/6zDUg46VpNO12/wdIgU336R
wU7C4XdM7tF/WZ4ODGAg5qB3V4WtURXBL94q+vv0Pg84f76U/l2VdR4O+2tl
LdJZpOD8O5qya/4bI/jua44uZ4iQcujxesVistHD4cuGgOxZ26UcOH4uSN+8
ycPBwBgIPks52IVHb9z/x8Oh/PA215m8Sg5z3y8/5s3u6bD/25lJDFuVHGaC
gKGnQ7eN5660JGWHi/nx7Oc8PR32vND2MN6m7CA+9QpnRhRQ/vDM+LMflR1E
ZE8+te/xhOibqeJQ8mCO4NKjCP6KhJAgdQ4vOP/6hy9ekWpeDg/28c0xnqQM
56vEGv9Mi1aC88svhk9Is1F0uOPGXMH9xxPiL0NZB/TwBQCSj5TW
                "]}], 
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
               3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJ5IGYCYtvw6I37fXwc0tOAYJqCA4z/YdF6hbMZSg7y
jh+Tz9j6OBQINR84lajqID71CmfGK28H7q3LKo9rajicV7r9s26St0NNolGo
AZe2Q/1N28oICW+HGTNBQMehoKvvySd2BH/5Cw+9/4wIfvwMH9GeX14OLIsn
WTH2IvhXKl6qGWYg+C3zzq46H4rgq9f17Mz21HEQkT351F7E20FG/64K20Nt
hzuT21ujVns73JIGuqhUE2L/f2+HlU2BnnMbVOH88ovhE9LmKMD5527lis96
Le5w5N+m6k87vB38n3heMr3M76DOD/Qpp7fDn8d7s1KbWOD278mveTtzKTOc
f0dTds3/YgR/i/mPQylaCP7crbf1TKYzwf0PDu80Jnj4wPhg90sj+AvSN78q
nurtUHZ4m+tMX06HL7evNxbf83Z4P4Xv2v9IQQeHtZn3CrV8HCLFt19ksBOD
x995kH+ypR3Q4xcA4/fbjg==
               "]]}, 
             JoinForm[{"Miter", 10.}], 
             Thickness[0.008120965001698947], StripOnInput -> False]}, {
           ImageSize -> {58.86430884184309, 18.058181818181815`}, 
            BaselinePosition -> Scaled[0.29350487424072735`], 
            ImageSize -> {59., 19.}, PlotRange -> {{0., 58.86}, {0., 18.06}}, 
            AspectRatio -> Automatic}], TraditionalForm], None}, {
         FormBox[
          GraphicsBox[{
            Thickness[0.12706480304955528`], 
            StyleBox[{
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0,
                 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {
                0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}}}, {CompressedData["
1:eJxTTMoPSmViYGBwAGIQXXExfELaGSmH/xXro2YWKDrA+HcWnWGbuUTZwdy/
9MTZAAkHE2MQUHVgkXGaOmuvCJz/OJihJ32DIJwf7zhrY4YVn4PKtUfBDGuU
HaaUnH0yW5fXwXDNo94zwcoOW8x/HErJ4nFY0307g6FfxaHLxnNX2iYOuP6C
ea8mzH7IAuc/z9L+Nl2WCc6/8PvY9Xk3/9u/YjERNLuj4lDzounXNMs/9qtr
reSMPyg7VN3/ccv49A/7Fd9eVpwRUHaYkCianyL3zV4w+6MmwzRFOF/xhCOn
cS2Cb6g66UVqCtD/1/J2X7jzzV74k+P5NFdFB+fF1h1zNX/A+XfEUs1OLPkJ
54s3yUwxuPzTXjnW+Geat6JD+LdYwT/vf0Hkryo66Pxex/Fv+1/7nbe6/qaa
Q90zj8FhJhioOAQ88bxkGswC57cqsKueKWGD8yH+ZndoYDnab2iO4Ic3HX14
pl4Zzi/3Yn/9/42SQ6zeI2vD12wQ+fVKkPDoZnPoPjwz/qyjksMG6W26p958
t7/KEvidkYMP6p5v9uB40eJ2OHnYaW3mva/26WkgwOXAute8jSHhDZy/avr9
TKPHz+H8rYL+ZcbKTzD4QFu9ma5wOGyB8r9D+Qkr9R6ktj2x/w8G7A7vGXfp
p297Aedf6WQJPrvmLZy/5Nbyx4bNH+3vuwJTliGHQ4xqhMy5P5/h/Adg+g+c
3wgKp+9sDjD9F17wJaV3scP5TxIXXjNZz4HBZwal61pOOB/mH7+LE2P+MSP4
IpWTSs6msMH5wW8vf5zByATnA3mNp3YwOoD9K8IN588ARedNBP/P471ZqUy8
EP8xszk8AeWjC2IOPifYbWdPZXNQAKXPt+IOElOvcGYsYndYK6TDlz5PzEFf
/OPcGaZcDmfAQAQS39r8cD442fwUgfNh+dljV9qns9ekHdDzOwDHSclA
                
                "], CompressedData["
1:eJxTTMoPSmViYGAQB2IQ/WHReoWzEqIO4u3G+2cdlnK4+IIvKf2VsEOk+PaL
DHYSDmuEdPjS9wk6MICBmINI5aSSsyr8cP5Wrw0Wc3ZywPlPEhdeM1nP7rC/
VtYinUUKzr+jKbvmvzGC777m6HKGCCkHmY1i85kesDt82RCQPWu7lIPW73Uc
/76zOxgYA8FnKQew+2bwOJQf3uY6k1fJIeTt5Y8zHHkd9n87M4lhq5JDahoQ
PON36Lbx3JWWpOzQrsCuemaLgMOeF9oextuUHWbPBAJLQYfuwzPjz35UduDx
Xz8l9YSQw0wwUHHo0FuRP3OyCJyfEnFUeuZyMTjfdZ5KrPFMcYcH+/jmGE9S
hvOB5M+0aCU4v/xi+IQ0G0WHPYm3F51xE3Po8XrFYmIo64AevgDTN5IN
                
                "]}]}, 
             Thickness[0.12706480304955528`], StripOnInput -> False]}, {
           ImageSize -> {7.867666251556662, 16.338709838107096`}, 
            BaselinePosition -> Scaled[0.32439307852814453`], 
            ImageSize -> {8., 17.}, PlotRange -> {{0., 7.87}, {0., 16.34}}, 
            AspectRatio -> Automatic}], TraditionalForm], None}},
      FrameStyle->Automatic,
      FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
      GridLines->{Automatic, Automatic},
      GridLinesStyle->Directive[
        GrayLevel[0.4, 0.5], 
        AbsoluteThickness[1], 
        AbsoluteDashing[{1, 2}]],
      ImagePadding->All,
      ImageSize->350,
      Method->{"CoordinatesToolOptions" -> {"DisplayFunction" -> ({
            (Part[{{Identity, Identity}, {Identity, Identity}}, 1, 2][#]& )[
             Part[#, 1]], 
            (Part[{{Identity, Identity}, {Identity, Identity}}, 2, 2][#]& )[
             Part[#, 2]]}& ), "CopiedValueFunction" -> ({
            (Part[{{Identity, Identity}, {Identity, Identity}}, 1, 2][#]& )[
             Part[#, 1]], 
            (Part[{{Identity, Identity}, {Identity, Identity}}, 2, 2][#]& )[
             Part[#, 2]]}& )}},
      PlotLabel->FormBox[
        GraphicsBox[{
          Thickness[0.004305890458146745], 
          StyleBox[{
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1,
              3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3,
              3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJx11A1MU1cUB/AHreCilg8phZZ+2jKhG7oWRoMs/NnCVNxWgi6tC2wU+sFQ
RogEWZBFGwKLmElYcFSnQ7ekRtlwm4pDxTHCINAyOnFh4KxTE3GZQx1jaLFv
fS3cJks4yc3LLy/3vHfvOfdKiyvyTSyKokJ8Q+cbob5B+0OIRrtuSMWWYNFG
N7eXDpNi/vblMpNViOxn1OX0H1IY9f0Cm10AFud4rnNEBvvsvRpHOx+n6zJE
6rw1gflX4tHRNFlKVaxB/v2rD9uyuejlJW5dxpKjtU7Hpj1RSHNueMNVKcdP
E+W8w01R+L5OqLHUy+Ga4hRbTkUi8l5XJ+uuHMsUjrNPT0fgTc7z3xzVKhBR
mOdWWTj4TR62r/V20Mdzzv/99Gwi8beD1T2fda9FrXtuQr1lNRz+SMZ2XpeL
usEjro82T3hbE4glg76VOkWQTT7+oKwgifi1wfCXjnCfJZ7J3d6gqU7EwJn9
6aqDItwaaLt4aFRBbCy8/irrQtC39L4P71UgNXusjnoU9MZu8yNnrJg4csfD
JKoh6A8zN3ebW8R4UlDe721RgNeovnK4T4y5H4ynimYUgTqkSKFj9medkthi
ZkIJE1PHWcmS/jL6OY7lRtAPkqgf1eMSpP/SX55atPD+IwnWNbfPvRCmhLi7
vcc0IsLdMuXsJ0eT8Kk9445Zs9A/ciV2u3TN5pV8ku+7rRl6OjyOeHff+Rzb
/SjiasbO5TD0XVWabGuJhfapTSluBbG//hFyHGD2Q7UKOmv/7w5aBmabKG8k
LhomTzgOyVDC9GdjFIZ7lFa6ToYLObZVqndjAn0gkIFi4iY30KfT0sD8t+Mw
LXin1myTYpunKtNMxYOu6XzLtleKS0zeMD6mT3RKnHOSwFPDxyu8sS7HrxKk
qpkQ4H39yTTnlqD9dcsXEY8L9hhU1+IxyvT7Ch5upvfMOlRcbOzot1OaaOJ/
B2qvDdWvJP465b3PQy6xUHWO6xn+K5b4zxoHTHsSiP19WS5Es4FbYRSxA+s6
JkJxrtw1XMpGgUKfMJIgJn7drbIPvyzGNuZ87mMDVl8HH1nagbqLUWmvOuPV
shfuBwlGmfO6n0Uc7j+vocTaO5t/Tvs4FNeZ9f8jxkF9kzZkfSjymLxSMTad
0w6UNDzJ8udJ5uKA7+2x3sdZCR30rraKGOIOdlOfjV6NzB1dhaVfeZb0ztai
Ss2ueeLxWNOLg1/MZ9X4+zIGl62pJa4Zb9YQ0x/OGBiY/ZhiYb2iZco0xsOY
b7VDmjDstJ70UOxYLNfUJ6dtWIHFfA+Y+sdFEwuZ/9TGES/en4H5fPz/fv0P
ELNj9w==
             "]], 
            
            FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 
             3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0,
              1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {
             1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 
             3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGITIGYC4jQw0HT4DwbcDjB+Kpjmc7irwtY4NVkDzjcG
A0z+1Npwlv+zBeD8JC+Vi6dXiMP5CiccOY19pRwEIiy3nJimDrVP2kHg5fb1
zM9V4fwNU1I7kmtV4PzVtVZyxgeUHUJ+l9ikOUg57Hmh7WFcpuyw8tvLijMO
kg4P9vHNMS7C5EP0KzooOH5MPsOr6KDsP2ndzDMIfufWHyIMxooOyRFHpWeq
K8H5HxatVzjroeQg+GRBy0wxBL9db0X+zGAFOH8mGAjA+bDwSL8vevC/GIIP
sw+dDwtvMLVf0cHCv/TEWQMeh3SQsjIlVP4zBD9iQprOrDhlOP8MCPCowPlP
Lyjd/rlPBW4+jA+zP+PtNu6zW5Xh/Duasmv+N2PyM0rYNxovFYDzDcQ/zp1R
KgbnV93/ccs4W9IhlE9309zzKhB3nJGC0qpw/q+3rw9YHlaD8xnAQB2SXqol
4fy+iG5/xgnicP59833fzkwSgPNh7pO1SHfJPK8G58PsQ+fD/L/lRNm++VVq
8PCJAUWAjjqcD4lHBL94q+jv03wacH5d1p6SyTsQfPT8AgDDpWzx
             "]], 
            
            FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 
              1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {0, 1, 0}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGCQBGIQLT0vTvN0gKHDfzDgdoDxU9NAgM9h/6mFrtsOG8D5
4h4BfyQ2GzjM2Xpbz+Q6gv9l38et6d8E4HyIeYpQWs9B2X/SuplnEPzOrT9E
GIwVHVxufPjixWkA59eu25ZUL2ngsPtW199UcQSfPzbgvlG4ApzfIpR265+p
lMNcG50rs5bpOyx/4aH3P1HawaU75/nvl3pQe6QdEg5f1k6VRPBFfp9+d1JZ
B87Xn7Dgh2GalsPuxNuLzjyTgPN5/NdPST0hAue/bsvtNrot4BCveVrg+C9t
BxNjEOB2qM/aUzL5hy6c3zDVGegCPTh/veqT5nlr9R3kdy3Yl8rH6zATBIDu
P76cQeJ8Aj+cD1MPAGP9uls=
              "], CompressedData["
1:eJxTTMoPSmViYGAQA2IQPRMEJA0c0kvYNxqzCjnA+C7zVGKNKwXh/PdT+K79
jxR0+OIV2WbxTd9hjZAOX/o+AQd9rZXCF1r0HeR3LdiXysfvsMX8x6GUU3oO
M8AaeR1eFG8V/c2N4P/5VvpgTqAunB/Kp7tp7noduH4Wzi75ZD8dB/7YgPtG
ywUcZPTvqrA91Hb4su/j1vRrgg5TvrHFzzij7WBiDATBwnD+im8vK84cEIHz
c5pW/GZoEXPo8XrFYvJR2wFk2ulD4nDzQdqNL0vA7b9vvu/bmU+SDnsfi8ie
TNV1OAMGUg4GM7Ukpprowfkeev8V/35D8MH+2KnvYOJ4pZZBSAoeXiwyTlNn
1Uo4AACxmpiZ
              "]}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1,
               4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}}}, {{{20.299599999999998`, 
              9.905859999999999}, {20.299599999999998`, 
              10.239799999999999`}, {20.0152, 10.499600000000001`}, {19.7059, 
              10.499600000000001`}, {19.3473, 10.499600000000001`}, {
              19.099999999999998`, 10.215199999999998`}, {19.099999999999998`,
               9.905859999999999}, {19.099999999999998`, 9.53477}, {
              19.409000000000002`, 9.299999999999999}, {19.693399999999997`, 
              9.299999999999999}, {20.027299999999997`, 9.299999999999999}, {
              20.299599999999998`, 9.559769999999999}, {20.299599999999998`, 
              9.905859999999999}}, CompressedData["
1:eJxTTMoPSmViYGCQBGIQveHhy6mbfEwcPNYcXc5gIeoA4//9GLfViFHcoePL
7euNziYO/8FA0oF18SQrxrXGcL7hs3WqT4IR/JkgIGnskOSlcvH0Cwk4fw1L
9+GZ88XhfI1PKi9neYrB9ZsYg4Cog8zrR2ZSGxD8LeY/DqW8QvCfiMiefPrf
2CFGNULmXI2oA6NvC68/v4lDxeFtrjPXIvh/Hu/NSmUSgfMZQGCBANy+D4vW
K5yV4HJ4wD15ZZOjsYP3CXbb2aGccP4dTdk1/z9z4OTHO87amFHF4WDR6Zjw
NADmf3YHi2tHc00SEPyMza+Kt5Yi+LDwFamcVHJWhd8BPfwBbFe2gQ==
              "]}], 
            
            FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 
             3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0,
              1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {
             0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 
             0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3,
              3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 
             1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1,
              3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJPIGYCYlvTuF2ea+wdTIxBQNQBxk8DAzEHlsWTrBhz
EfyadduS6jvt4Pz/IFBv5xBw32j56UcIvsya/8Uz1kvA+WY2e4OmOWrC+XMW
Ke/8o64FNy8dbJ4W3D4YH+YedP5xTatJp/9rORxpWx5+KsneYcn9fXxzPms5
uBf95H+ZbgfnHy/bN1+KH8H3lxPL8t1sC+d/SD4T673DBs7vX/DD8FmeDdx8
GB9mv7zjx+QzaxF882tHc00m2ML5W1tqLmyeaetwXeiT43k1BH/9lNSOZFtN
OF/gyYKWmWnKDjKvH5lJMVhh8GHqYXyYeRpvefcZcFrB7dtfK2uR/gTBX256
1tpP0RqDD/OPRrvYzXPXreD+fbF9PfPzO5ZwftaekskSLZao4aOB4EemWN/3
17WA842erVN98tgcbj6MD7N/r8FMLQlVCzj/sYjsyaf8lqjhJWkJTw8wPiy9
wPiw9ATjw9IbzDxYeoTZB+PD3IPOh6V3mH8u3MoVn+UtCvcvjJ8fz35OshHB
h4UXjA8LTxgfFt4w82F8mP2w+ILxYfEJ48Pi+2D3viaTxwj+42CGnvQNEnB+
uRf76/9nlODpCZ0PUw/jw8yDpVeYfbD0DOPD0js6H+YfWH6B+ReWn2D8M5KB
t6R57OB8WH6E8WH5FcZHL38A6PDyzA==
             "]], 
            
            FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 
              1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {
              1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}}}, {CompressedData["
1:eJxTTMoPSmViYGAQA2IQ7X2C3XZ2raODiTEIiDrA+GlgIOaw81bX31R5BH8m
CEg6OhyolbVIX4LgJ3mpXDzdIQHnQ8xTdZjq3J3z3NnB4QwYqMD5EHkVh/np
m18VL0XwwdRmB4cXv1d+vMSL4JfYpC0wuqcE57frrcifOVkCzoe5z3lt5r3C
RQj+3PfLj3nbY/Jh/g3wnNugluXgcOFWrvgsb1EH+6ZHx2dsRvD/g8B9BL/+
t1XBuQ8IPreKRl2PpyOcjx6eACp9i8o=
              "], {{34.29959999999999, 
              12.493799999999998`}, {34.29959999999999, 12.8648}, {34.0027, 
              13.100000000000001`}, {33.70590000000001, 
              13.100000000000001`}, {33.3598, 13.100000000000001`}, {
              33.099999999999994`, 12.8277}, {33.099999999999994`, 
              12.493799999999998`}, {33.099999999999994`, 
              12.172299999999998`}, {33.371900000000004`, 11.9004}, {
              33.69339999999999, 11.9004}, {34.0645, 11.9004}, {
              34.29959999999999, 12.1969}, {34.29959999999999, 
              12.493799999999998`}}}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
              3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
              3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1,
               3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxF1HswVFEYAPCbmqTYyU5atLLb3jUZlHbpIfTtvXdplbcpScpqlzI7DBrT
GBSVRKY8mkVM0UtjsnakxyBNGm+NGKVGJWl6t8pML9nuJed+M2fO/P44957z
fd85QmVCiMoEwzAfejCz187d9ffyKRiPvjjkFojDnL3fDdf+bsLBY57/MYtU
CiwC64pVcWJ4OK1P+was5eJDJmUGErm6kF7RQEKubvR9iR4HZ33F16uVJCwN
39TQsQMHQ0zPnm2JJIzgC4+WjOHwqoVzXupBgpuUCTH4Bk1ZJxsJZNdFtfyI
FNY9TJgTcHLNtYTSIhFy6oNGeWmzEHmDbDAdUwog1UVoP0kREPYnxVON2cMy
u87xLWH0ek/FXXXhSsj7q/rxRkYAZL1u1z63gyeGSb9dDgRoS+k4zEdewCdK
yipskQ3FnCHjMA92E3SmIglQ+uH93deWw1X33s0BBwjoe6bhlcUvh+gHA04q
IQHCDpmZtNcKluCrM/KHZeDKm6jQWi1D/nhCkycpt0S2Lhk0i6syhwF/5dLw
A3PnN4WmkHPCAjGJPLtv1jNzMgW1XGdOrLc58lgolh+rs0Q2TkTdlIxy4Xyb
QJcURwG/1pisrbOC7VcW+4gtKLgtL7WQOPJg/+aXgafvkaCeCWv4lXGwKSWZ
9Wz9CeSPr9fbthaxTthr2meTy3r+Do6LXkNAI/N9hQ1kBysqjkT9r0+rDWT+
8UjsCyKgNa8ly63aFjmcd6sfq1yBvI/JdxwfmPTaRBCQw/SD1A7SbzQqM+l8
fWLySdfTLequwlxPgGrm/3xod/Qo7P7K2nC8M+w+RiI/+hE6djmP9aXm+zyH
7yTEppjWSy/bI5cLPnhjNULk7hanLKP/KnA5c+HnurckNL1z2ipdL4KpmonH
/npytp9+iWbP8YWEs5HT5O/POHg6D5a9daeQm5n6erGO1NA3jmQ9UpRzPGIb
a8NGuW9SMAWJ3OzWrlEcBLKJmB45BXQX3YnvxCHxVMGbb1sowP3Sstfms77d
j70wUbAe0WmC1d/p/XVJ2uoDKNByFZOS6yJ4yvS7mnUQXS6HJNZz74Whqk7Q
28F67j35B6zq0y4=
              "], CompressedData["
1:eJxTTMoPSmViYGAQBmIQfXqh67bPrc4Ou19oexhvU3SA8dv1VuTPdEbwS23S
FhjZKTgcXLHEzyHb2WFvraxFuoq8g8gnx/Npvs4O9833fTuzSdbBu7pZ30fO
2cHEGARkHZprLmyO/OsE54OpYkz+adca9TRZRTg/vOnowzPrEXzjXc03Ziop
wfnua44uZ9BQdrDWuTLrWa+Twx1N2TX/Lys7xOQe/bdptZPDGRDoUXFQfdI8
7+wtKP+MikNlxArTs78RfJj/0PkfFq1XOOuh5IAePgDShYWP
              "], {{
              40.300399999999996`, 4.36328}, {40.300399999999996`, 
              3.6601599999999994`}, {39.39769999999999, 
              3.0999999999999996`}, {38.3059, 3.0999999999999996`}, {37.166, 
              3.0999999999999996`}, {36.29959999999999, 3.68398}, {
              36.29959999999999, 4.36328}, {36.29959999999999, 4.45859}, {
              36.32339999999999, 4.923439999999999}, {36.77459999999999, 
              5.2332}, {37.035500000000006`, 5.3999999999999995`}, {
              37.14259999999999, 5.3999999999999995`}, {37.97339999999999, 
              5.3999999999999995`}, {38.95859999999999, 
              5.3999999999999995`}, {40.300399999999996`, 
              5.3999999999999995`}, {40.300399999999996`, 4.36328}}}], 
            
            FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1,
              3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {
             0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 
             0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJzIGYCsbXbxW5uc3cwMQYBUQcYPw0MxByuzHomuzwD
wedR0ajrcUTwGUDAwd3hTVtut9FtcTj/9qIzbDNTFOD8dJDyZUpwfsfy8FNG
IcoOL7avZ34u4+4w4/+Eut9SKg5JAhGWWz64OZT5y4ll8ao6PHw5dRPPSjeo
+1QdMia+rbEvRfAf7OObY/zJFVV+q6vDhVu54rNmKzs8EZE9+XS+q8N76fjq
tJtKEHfPw+RD9Gs7JMzwEe055eJwXNNq0un/WnA+2P1pWg7nvgc/XmrsCudD
/OPqsOVE2b75Vgh+fEiQ+gJOTTjfc1fap7PTJOB8WPit6b6dwaCP4MPsQ+fD
4qdTPvld1CcXiP+8RR1YFk+yYnR1hfND5q9eeyMfwW8DhfMcBJ8JFL/vEHyd
TXPfLxdzg5sP48Psl3n9yExqB8J9YGoZJr94q+jv030ScH65F/vr/3sU4PwV
+TMvpzoqO5wBAR43h5lgoOJQ99uq4FwGgg+WP4Lgg6mbbpBwS1CG88H0S0U4
H2Y/jI+SXk8i+GpPmuedzcLkw/z/hnefwcxJbvDwuSldk2j0FMHvKy2U5hVw
h/N9PvcFl9gg+KBkINWP4KPnLwDvd1HA
             "]], 
            
            FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}}}, {{{47.8, 
             7.599999999999999}, {50.899609999999996`, 7.599999999999999}, {
             50.899609999999996`, 8.199609}, {47.8, 8.199609}}}], 
            
            FilledCurveBox[{{{1, 4, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1, 
              3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {
              1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 
              0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 
              3}}}, {CompressedData["
1:eJxTTMoPSmViYGAQAWIQnZoGBM98HW4vOsM2c4mSA4wv8HL7emZ3dYelLzz0
/kv6OhzXtJp0+r+WQ8lW0d+n5Xzg/CkSLGF8vF4Y/HSQOWlaDi01FzZH6iL4
M2YCwUIE/8vt643Fy7wc5ixS3vlHHcE3s9kbNM1RE86XWfO/eMZ6CTg/4L7R
8tOPxODmgY1LE4PbB+PD3IPONzEGAVG4f2B8len/J9RJ+8L5sPDgjwXamC7j
gB5eAKZChAk=
              "], CompressedData["
1:eJxTTMoPSmViYGAQA2IQnZoGAr4OzhOahdJWKTnA+AqOH5PP+Co62IZHb9yf
4uuw1XUmrxGnnMPabUn1N3l9Hfojuv0ZC6QcVKb/n1B328dBuHJSydkUCYf/
IFDv4wA2Jk3M4YmI7Mmn/73h/OOaVpNOxyP46x++nLpJBsFX5+feukzS24FF
xmnqrL0I/uzlVk/SIiTgfNvKiBWmuZpw/pYTZfvmW2nBzUsHm6cFtw/Gh7kH
xm8J9JzbUOcD5y/Ze1Bc7bEPqvmKvg4SLGF8upfU4eEzx3jRFnMJNTj/7obc
wLTFyg7o4QkATf6LRA==
              "]}], 
            
            FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 
              3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1,
               3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGAwBmIwDQKTAxwyStg3GqdKOsD4fx7vzUpVknH4DwL1mPyq
+z9uGXtLwvkpEUelZ6aLOcg7fkw+kxvgwAAGYg7ZFVVLdZIR/Pmr196Id8Pk
y675XzyjXwLO3+Y6k9fIUxKhvj1gadp9BTj/tGuNepquEpwvXDmp5KyKsgPv
A90JC1QCHL56RbZZiKk4PP+98uMlzgCHVywmgmZ3VBzCTxkd2XjO38EE7FFV
B385sSzfbgSfJYxPdxMvgn9DuibRaK2fAzPfQq+z75Th/NnLrZ6kZSjB+c4T
moXSdik6WDD6tvAe93PY80LbwzhN0eH6hy9ekc8QfP4qs9V2/P5wfutyoIt0
/B2Cf5fYpF1A8CHySmh8ZQefZVxuql/94HydCQt+GN5D8PPj2c9JMvo7bJiS
2pFsq+Kw/IWH3n9Pf4eZYKDiULJV9PfpNgRfJQcYQWcQfHB8CQc47M2veTtz
qzKc/5Z3n8HMWYpwfjUo/lcrOLCekwy89dnPwXWeSqzxTAWHgq6+J5/q/Rz2
1spapLvIwvlA01QZV0nC+R5rji5n+CHqoABKL8DwPgMGIhDzshF8dX7urcsu
IvjXj+aaNHAHOCiecOQ0XivmEOg5t0FNKsDh1D7tpv9vJRwyJr6tsZcNcJi7
9baeyXQxB3OpA9EKpgFw/c0HTi10DUPwd0+bwF+VhuDD0v/U2nCW/9WiDuj5
AwBK+FZo
              "], {{64.29959999999998, 7.002729999999999}, {
              64.29959999999998, 5.818359999999999}, {63.413699999999984`, 
              5.419530000000002}, {62.89179999999999, 5.419530000000002}, {
              62.2973, 5.419530000000002}, {61.79959999999999, 5.85469}, {
              61.79959999999999, 6.434769999999999}, {61.79959999999999, 
              8.030079999999998}, {63.862899999999996`, 8.175389999999998}, {
              64.29959999999998, 8.200000000000001}}}], 
            
            FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 
             3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0,
              1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {
             1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGIZIGYC4uyKqqU6kwMd+GMD7hupSzvA+G/acruNbss6
WLi6F/2sx+RXXAyfkOYjDed36K3In/lZ3CHQc26DWlagAwMYiDmcAQEfBD8h
JEh9gSQmH2x+tRScD9EnDeengYGKQ+5ixj2sbZj8E5pWk07/V4GrR+fPt9G5
MitN00FXUf5LDhuC//7kYae1rIEOf7+VPphjqO4gL5bl+/lVgMOj4zN2T/ug
4vBZ/lJ+/PIAh1NAZZn3EHyY/WDznmHyyw9vc53pKw3nX3zBl5T+StTh9SMz
qQPyUP+dEYHQHgj+TBCoRPBh8bFB4WyEyV5xB/T4AgAznboF
             "]], 
            
            FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 
              3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1,
               3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGAwBmIQfQYEdIIdMkrYNxqnSjrA+H8e781KVZJxmAkCkpj8
qvs/bhl7S8L5KRFHpWemiznsvNX1N5U92IEBDMQcWIVE7I/9CYLzLVzdi37e
x+TLrvlfPKNfAs7f5jqT18hTEqG+PWBp2n0FOP+0a416mq4SnC9cOankrIqy
w/LK45pW+4IcvnpFtlmIqTg0THXuzlkc5PCKxUTQ7I6Kw9F/m6o/NQQ5mBiD
gKrDwRVL/BziEfzZRxQ2FCkg+O3Lw08ZfQh0YOZb6HX2nTKcP3u51ZO0DCU4
33lCs1DaLkUHc6kD0Qp/Ax32vND2ME5ThPifJwjOX3jN5L2FIoIfkwt0kX6Q
Q/DvEpu0Cwg+RF4Jja/ssP/NPBsdEQR//cOXUzdxIPiBnnMb1KSCHDZMSe1I
tlVxeMu7z2CmXRAknmaqOASXqEz/H4Pgrz5/NexNPYIPdu+aIIe9+TVvZ25V
hvPB5sxShPOrQfG/WsFhToPaoTbhIAfXeSqxxjMVHC7fe8A9+Wagw95aWYt0
F1k4H2iaKuMqSTjfY83R5Qw/RB20rSadrgeGNzjdnRGBmOeP4Osqyn/JaULw
8+PZz0kuDXJQPOHIabxWzOH1IzOpA5uDHE7t0276/1bCgVm7XezmtiCHuVtv
65lMF3M4vzny685zCP0yUSnW998j+CEGWiuFGYLhfFj6n1obzvK/WhTOh+UP
AFlXX3E=
              "], {{74.69959999999999, 7.002729999999999}, {
              74.69959999999999, 5.818359999999999}, {73.81369999999998, 
              5.419530000000002}, {73.29180000000001, 5.419530000000002}, {
              72.6973, 5.419530000000002}, {72.19959999999999, 5.85469}, {
              72.19959999999999, 6.434769999999999}, {72.19959999999999, 
              8.030079999999998}, {74.26289999999999, 8.175389999999998}, {
              74.69959999999999, 8.200000000000001}}}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 
              1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {
              0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 
              0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 
              3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxl1GtIU2EYB/AlEtnEZDq3yUQ3r1MxUbsoUo+SuXKVur1TykyEHaMySQ1m
RQR+KEzBtNxmKRalQitNGbSVZtnNaxdLcIlO8cOk9MMUu6A7nbO185I+cDj8
4Jz/+/Kc5z2iwpJslRuLxUqlLvrua0v5QGQpoZJDmO1IAC63WaUx5F3sSUmA
nvTxh2G6pNiK8hANCRsdPlfZPDIogEOF3rmJlGfSTqQ0ZgkgdoteeDRZCYs3
vcbJCj+4tHdHvilUCZZdvSvDcVxnvif2G3vXRZsVMbZ/Uc+HzSC4FtNeoivj
Qe6xJy9+mBF0cKK9iuwCmHLzqAocQ5BuImwjDQGwONCf+mgEQV5ornB0NRAK
tDJu9SCCaTrvVRCcUV94EN2NQE7v+4oI+NLMVf5DBLGhdVbVaxG8Nz2t2axF
oOUcWI47JYZbXZ7n9CUInlmjpPFvxRCxjW1oNSKY7CzOIuTBkBBP1RKC5+X1
fPfxEMbJ00dqNI/DGDv6u0kCPS95YfImBO8kSXVDZCTsTksv/b0du7P05I0F
mWKDiwi6IqH9/mHwOY7tyNdgFyiyw1t0CrhzL9i4Go69M7knuyFFwlioJ8u0
HXzGmdNxbUOzfkyeI47wY9Zz2bWf9Xa8F8+Fg55uUVfzFfDRXMxrzOBCrKx1
6/4mbG+qfRXd2I5+DmCv0d/bAzHWnuVU9vkjJt9l1/p5xdTEsLENS1TCV7y/
Pwvf+xLHFMCiy4LtnHc+Y2f/xMCfGP0pj0KMHfMoxZ6dpyZCRc2j4ZcvK1gM
n6cs7PoKBLfbkuYItQhsnZmnG+v/zVdt0P/2xtboqJoQMm42fItJ4AkY76ul
TyjP2T8DgiBTS69qlAt7cqgD0IdgmX6OxwXR2sp5iwWB3v16v470gZCIy9VG
tpKx0Vy1pkrHdp1v9aecWkLGh/X/g7/c88gK
              "], {{86.73750000000001, 
              11.349600000000002`}, {86.73750000000001, 
              10.283999999999999`}, {86.17770000000002, 9.499999999999998}, {
              84.632, 9.499999999999998}, {83.3004, 9.499999999999998}, {
              83.3004, 12.7094}, {83.3004, 12.991399999999997`}, {83.3004, 
              13.1383}, {83.55000000000001, 13.1871}, {83.657, 
              13.200000000000001`}, {84.01369999999999, 
              13.200000000000001`}, {84.2516, 13.200000000000001`}, {85.2148, 
              13.200000000000001`}, {86.73750000000001, 
              13.200000000000001`}, {86.73750000000001, 
              11.349600000000002`}}}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 
              1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}}, {{0, 2, 0}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["

1:eJxTTMoPSmViYGCQA2IQ/YZ3n8HMrnCH9BL2jcZPpRxg/DP7tJv+60o7xGme
FjjeFu6wXkiHLz1O2mFZ5XFNqyYE/8CbeTY6NQh+TbO+z7KqcIdwTrF2Y3lp
h79XKl6qVYY7/AeB+1ION9f8islNDXdwaHp0fMZuMYh6o3CHmWAg6qD6pHne
WSEE/8kFpds/P4XB+WkgsCzMwWWeSqzxTzE432NX2qezZfJwfufWHyIMxgoQ
PtA9MP6vt68PWHYj+KxCIvbHejD5EPsQfFWgbWm/lRzmNKgdaksOdzAxBgFV
BwmPgD8S7Aj+iV07etk2hMH5U9pboy7nhDl023juSjukBOeDw3upPJwvXDmp
5GyKpENX35NP8rvCHM6AgYhDy4FTC135wuH8pPqbtpUZCD4svvhjA+4bPZd0
QI9PAIUXza4=
              "], {{93.39999999999999, 8.299999999999999}, {
              90.5793, 8.299999999999999}, {90.6738, 10.184}, {
              91.71679999999999, 10.399999999999999`}, {92.04840000000002, 
              10.399999999999999`}, {93.31639999999999, 
              10.399999999999999`}, {93.38749999999999, 8.70781}, {
              93.39999999999999, 8.299999999999999}}}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
              3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
              3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1,
               3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxF1HtQTFEYAPArhlkqtWxbbG1rb0bktZu32b40pZqahOmeNaZY09ZIGOVd
eqnQxvTYsVtTeUWIjUiZ2jIYPZF3TEgij9gemtnIunfTPd/MnTu/P+6553yP
I1LsWBtuQRCED/0w72YmLOXQtfn0C/cgEkYt624rHaomIbjSKfXbGDlYBely
wyNdoKHL49y7T4g1x3gqolyPfUs39rPqFIKjZR1f1NdJiPNYFHpbjcAGLbtR
H0JCmCaApzqEoJ0cn6TuJOH5/Wj3xC0I3KVMuMDR4x/7hD7YCVurY3MIbPP+
mik4Mq9khzZHzHrv3QpvbY2I9RLPZ/GEwhlEw4O733dTsP537EolIQTDgL88
zUB/v9LvtjLbCdzCHT6gzxRA8ocHmjeO8OTt+0k5bRRotHTsF7AeJ1ilziuY
xtqQa/3C1MaH3PTUDU8HKFD4k61NJXawfEzgYavfFDx8Hc3Pi7IDe981f+xf
UiCq9+RIW3iwbd+BYrdyChbwews0vKmsv6VFZ0jybVnbq59xIs9YwprMk9u5
9Hoj558A904s3DtXjlinXaAaJTewTeZAUMp1s46QWbLuXEeoIspsWZt6Q29K
OrhQXr9HXzSEQFBqitHoeJBRFcUxNiOo9NZaSVz5wB8XYj33PAKlOeyhszj/
nnMitrn+Muw3L5NifGywney2BvZPxI7M6onzGKagglnfzwFmTZ508/yv//Wp
cwCXjymFLT8oqMvQJ7ufncYa8W+1EoXTWW9i8h0pACa9Mf0UpDP9IHWEczV3
+DPpfH1n8knXM1HtlbFNiCDc/H8B+B9MmR8gww51bbJ54IMdqKA7VYW91Hv1
LmMtgojYCdekxULW+c5fZcRFEesm/ZxkU+AMiL9aoUioQlDdPcdXulgMW1a8
C8osQiP9ZBTDlD7PR8oaBFkb/3oN9ZBwOO5xubwD21zfLmyeIz1x3djrF8y+
OOU7drsF55jwJ4Kd3JS6xg4SBsfTE/YFwaxDqqqoBhKKLl95FUbPK8kcXIVd
2Uq8tfDDbi+LDlb2iyG7KcG3tofeL9dvQHJJPNLvRmymXPtN2KP3heGMzrml
Hnv0PvkHFCD4yA==
              "], CompressedData["
1:eJxTTMoPSmViYGAQBmIQ7W3e6ZjQGeGw+4W2h/E2RQcYv11vRf5MZwS/1CZt
gZGdgsPxXTt62WoiHPbWylqkq8g75Mezn5PMjXC4b77v25lNsg5cKhp1PaER
DibGICDrsHKJn4OwK4L/HwzCMfinXWvU02QV4fzwpqMPz6xH8I13Nd+YqaQE
57uvObqcQUPZoaXmwuZI3giHO5qya/5fVnYQkT351F4mwuEMCPSoOFRGrDA9
awzln1FxWDzJitHXBcGH+Q+d/2HReoWzHkoO6OEDAFYBjPk=
              "], {{
              99.40039999999999, 4.36328}, {99.40039999999999, 
              3.6601599999999994`}, {98.4977, 3.0999999999999996`}, {
              97.40589999999999, 3.0999999999999996`}, {96.26599999999999, 
              3.0999999999999996`}, {95.39959999999999, 3.68398}, {
              95.39959999999999, 4.36328}, {95.39959999999999, 4.45859}, {
              95.42340000000002, 4.923439999999999}, {95.87459999999999, 
              5.2332}, {96.13549999999998, 5.3999999999999995`}, {
              96.24259999999998, 5.3999999999999995`}, {97.07339999999999, 
              5.3999999999999995`}, {98.0586, 5.3999999999999995`}, {
              99.40039999999999, 5.3999999999999995`}, {99.40039999999999, 
              4.36328}}}], 
            
            FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 
              1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {
              1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}}}, {CompressedData["
1:eJxTTMoPSmViYGAQA2IQ7dKd8/z3xUgHE2MQEHWA8dPAQMyhRmSd+8NFCP5/
EJgf6XCgVtYifQmCn+SlcvF0hwScDzFP1aHldeAOOdNIhzNgoALnQ+RVHE4t
dN32ORXBByvLiXR48Xvlx0u8CH6JTdoCo3tKcH673or8mZMl4HyY+5Rv/6zL
SkHwq0DuN8Lkw/x73Nu809Ej0uHCrVzxWd6iDiDn/M1B8MHKmhH8OypsjVO7
EXywf7cj+OjhCQA1aKDG
              "], {{102.60000000000001`, 
              12.493799999999998`}, {102.60000000000001`, 12.8648}, {
              102.30299999999998`, 13.100000000000001`}, {102.00599999999999`,
               13.100000000000001`}, {101.66, 13.100000000000001`}, {
              101.39999999999999`, 12.8277}, {101.39999999999999`, 
              12.493799999999998`}, {101.39999999999999`, 
              12.172299999999998`}, {101.672, 11.9004}, {101.99299999999998`, 
              11.9004}, {102.36399999999999`, 11.9004}, {102.60000000000001`, 
              12.1969}, {102.60000000000001`, 12.493799999999998`}}}], 
            
            FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0,
              1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {
             1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 
             3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3,
              3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 
             1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxl1G1IU1EYB/C5zPqgFcuXtUDmNteHMkurIUE+ZSBiZmU0uVcwZG0y2oxc
WipG2YsigaZjLQkhWPZqIRFGMQrUQkb5YVK5bNkLIS4MAl1ErXPPPOchd+B8
+LF77jnn/zy7GVU1B44skclkcWSWkSknM7R/MP18cQVsyZVGCjCb6UgFY97D
l3V6dHdB+9Fvq9F0HXHogq09J5DGHbjuS3Cb1NwW6fEbGu7WPuNozkEt9I0U
G9riKuBKpKP5t0oHuoQzzoIZEepK01OtSZkwWJQoX/9CXDhfJnQr4w+tuIfe
Y2jbediGPjdDLlAiwqlgeCL3iRZ2P/r5xw8imIIpzyMjGrhfONWQvE2EH9LG
t3QwX/bZ05OI60urVpXnvRe4axQtz0Y70fR5hwCu9vBen0obzccuwOzaykaz
WwPkdFkDtliz9ZbO7035SwXw0aHjjv6ug8qvY5pAHjoijXwBNsy5JruWoQvv
DvfJ3mq4L268WePuUnKz+hyrJhsY0Gy/xWb1j/hPTuvXCDA2YUu7WpwCrzWB
X8270CuzBq7NGtE0Tzv6tJM0iAud9u7VfNkdfD8z279+Wr95eZPwfz/VxvqD
wTvnu6zkjtZTzS2Txj7tQp8JEErybnLf1oGaHN/qRwdLL7nscpGbloHUv1XK
r1bLbTw7POWLZHC3KMwTf51KbnY+6ng07cdxIcbs/h8bkvsLpzEf0j3eXoXI
Teu3Dt1ByrN1B9q0ndzAgg43W586GkX+fma2v7+ENHQROtofsWb5MrN8mVm+
5dIBTmB+tH886Hpvryp7HE3XBzFfZpYvM8uXmZ2P3vcNOnuSfCE8sWb3H1I/
OF79GPNx2ckf+BP6i6dnSB1GO7qkD0oFt9TO/Qb04u/jP4OuMfA=
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 
              1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}}, {{0, 2, 0}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["

1:eJxTTMoPSmViYGCQA2IQLaF/V4VtYqxDegn7RuOnUg4w/pl92k3/daUdSvfN
l9LvjXVYL6TDlx4n7ZBvy3V9cQeCf+SrRkx/E4IP1t8Y6xDOKdZuLC/tkGJ9
37+3PtbhPwjcl3JYUgA0IDvWwaHp0fEZu8UcZEDqLWMdZoKBqMP75ce8zSUR
/Cu+SQIRP2Pg/DMgsCbGwWWeSqzxTzE432NX2qezZfJwfufWHyIMxgoOLts+
/73SEAvnzwAZMxHBNzEGgsmYfIh9CL4q0La030oOATvkWl9nxkLEjVUddEHe
5UXwU9OAYFsMnA+mi2Mcum08d6UdUoLzweG9VB7OF66cVHI2RdKhZ3qeUPOB
GIg/zog4vFAz5FgjEgvnM2i3i93MQ/Bh8cUfG3Df6LmkA3p8AgBHLMIu
              "], {{
              117.49999999999999`, 8.299999999999999}, {114.67899999999997`, 
              8.299999999999999}, {114.77399999999999`, 10.184}, {
              115.81699999999996`, 10.399999999999999`}, {116.14799999999998`,
               10.399999999999999`}, {117.416, 10.399999999999999`}, {117.488,
               8.70781}, {117.49999999999999`, 8.299999999999999}}}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1,
               4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}}}, {{{120.80000000000001`, 
              9.905859999999999}, {120.80000000000001`, 
              10.239799999999999`}, {120.51499999999997`, 
              10.499600000000001`}, {120.20599999999997`, 
              10.499600000000001`}, {119.84699999999998`, 
              10.499600000000001`}, {119.59999999999998`, 
              10.215199999999998`}, {119.59999999999998`, 
              9.905859999999999}, {119.59999999999998`, 9.53477}, {
              119.90899999999998`, 9.299999999999999}, {120.19299999999998`, 
              9.299999999999999}, {120.52699999999999`, 9.299999999999999}, {
              120.80000000000001`, 9.559769999999999}, {120.80000000000001`, 
              9.905859999999999}}, CompressedData["
1:eJxTTMoPSmViYGCQBGIQbWIMAnEOHmuOLmewEHWA8f9+jNtqxCjuYNrpmPDU
IM7hPxhIOqiwNU515kbwF7hu+/z3Syycn5oGBM9iHZK8VC6efiEB569h6T48
c744nK/xSeXlLE8xuH6IvaIO5S/VDDl44uD8LSfK9s2XQvDB1sjHOcSoRsic
qxF1WFJgy3VdOc6h4vA215lrEfw/j/dmpTKJwPkMILBAAG7fh0XrFc5KcDms
+HjJN+lDrIP3CXbb2aGccP4dTdk1/z9z4OTHO87amFHF4eCTJBBhCfc/u8MH
oLTADwTfhuv64oK/CD4sfEUqJ5WcVeF3QA9/AOy1t/o=
              "]}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
              3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 
              3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGDQAWIQrXz7Z13WlAQHpwnNQmlSEg4wfpKXysXTHRIO3TnP
f6+ciOD3TM8Tap6A4F/2TRKI6EXwNWL6D33tSXDIalrxmyFFwmHj3PfLj3Un
OCx/4aH3n1HC4bi3eadjR4KD7Jr/xTPOizkYg0B9gsMKkPxBUYevIANKEfyZ
IJCJye+08dyVdkkCzl8jpMOXvk/aYfkxoAVA9zpzGuf+P6XgAHL+x1kJDnvy
a97OvKqMk38GBHhUHLTbxW6em47gbz5Rtm/+NAQfxJWajODLt74O3DEpwcEF
FH6/lB3+Xql4qQa0X+Xao2CGHmWHj5eAAQQMj1KbtAVGdUoON859D37cmOCw
stZKzniBAtz9d833fTsTJAvnG+9qvjFzE0I+o4R9ozGrskPw46Wzj4QkOJiA
A07V4aWaIccaHQS/5cCpha7f4uF8MD053iE1DQiOKcL5f/8DwX4ZOP+mdE2i
0VQJBwOONTJRe+Ih/jsj4jBZgiWMjzUBzk8WiLDcIoPgry/KmPjWAsp/I+oA
Cr7vwQkO6xXORpjslXCITrG+7x+Z4BCjGiFzTkbMoQUYXHKpCP36d1XYGksR
fHWgd2S6EHxYenzTltttVC3ugJ5eASSiREM=
              "], CompressedData["
1:eJxTTMoPSmViYGAQAWIQvflE2b75QQkOPV6vWEw+Sjr8vVLxUs0wwWGDwtkI
E1kxB5C0lHCCQ8Xhba4z14o65As1HzjFiuALALkLr8bD+alpQHAs3uFNW263
0W4JOP/P471ZqUzScP6XDQHZs8RlHea8X37M+3q8w+1FZ9hmsig6XF1cYMv1
Pt7BWfzK9jORSg4qbI1TndkTHN4UbxX9za3icPtnXdYemQSHM2Cg4uDcnfP8
ty6CbwwCwZh8V9VSplk7FOF8Br6FXmfj5B06HBOeXgD6vz+i259xgzSc777m
6HKGHVJw9e+n8F37XynlgB5eAKJFjlg=
              "]}], 
            
            FilledCurveBox[{{{1, 4, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 
             1, 0}, {1, 3, 3}}, {{1, 4, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {
             0, 1, 0}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJ+KN0udvPcd/kkh/dT+K79P6nkAOObGIOAssMRhQ1F
GZIIvvvDKpF1wgj+5hNl++YbJcL5D4DS7roIfnoaEKhh8lezdB+eeV4JzgfT
aUoO5p2OCU91EHyY+TA+zH4YX1r/rgqbJIIPcz86H91//LEB942Oy8D5M2aC
gCzcvzA+zD4YH+YeGB/mXxgf5h90vonjlVqGSzJw/n8wkIb7F8aHmQ/jw+yH
8WH+hfFh7kfnw/wHAD2S07M=
             "]], 
            
            FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 
             3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0,
              1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJZIGYC4v3zpfTv2iQ7mBiDgKgDjJ8GBmIOBbZc1xcb
IPjO3TnPf/Mi+GdAgCfZ4U1bbrfRbwR/JgjslIDz9bVWCl9g0YLzczh/Lkif
jOBfyI9nPzdTy+FBlcg6d1YE3940bpfnnySIujeaDvp3VdgaXyY5/AcDDYcO
x4SnFw5h8iHu03B4HbhDrvU0gp8Oou4h+GBvf05y+LrzVtffpwh+s1DarX9b
JeB8lwlAkV9iDiZA5/B8SoL733Xb579XLiD4LSALj2LyYeHbMBUYgueTHC7c
yhWf5S3qwN4IFPiC4JfvA0YAYzKcny/UfOAUL4LvycOk3W6E4KPHHwCgtcya

             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJJKD0TBDhTHP6DgL2SA4z/YB/fHGMnFYdz34MfL2VP
cUiJvePGbKHmkC/UfODUz2QH6/v+vdP5NBz2lEyWYHmV7CAzL07ztICWQ8uB
UwtdzyU7XMiPZz83U8uBY41MVMpuBF9a/64K21IEnyWMT3dTZ7KDj3mnY8JT
TYeGqc7dOdXJDkv9HIQTH6s7FNhyXV9ckOxg9+Lmml8xag5nQCAHyr+jAufD
3A/jy+9asC/1nLxDccbEtzX5yQ4C2R81GdxkHC77JglE1CY7fNn3cWv6NQmH
lR8v+Sb1JDskealcPK0h6vDkgtLtn8uSHdawdB+e+V/YIX6XJw/TbgS/d3qe
UPMdBH/z3PfLj71PdshpWvGboUXMIef575UffyU7dNp47koLknRw3fb57xWO
FIdWvRX5Mz/LwMP3w6L1CmdvKDighz/Y/W+SHf5+jNtqtBDB7waZx6QI53/Y
EJA9K1zOoQfknhfJDvtrZS3SU6QdWl4H7pB7mOxg6nillkFIzOEHMPpmn0h2
2JN4e9EZNVGHpyD/7ULwgb7Tbl+H4IOCy35qsoMgKLzYxBwSQBp6kx3O38oV
n+UtDXEvML56QO4xkoPzQ5uOPjzzXgHOh7kfxp/S3hp1eY4KnC/wcvt65nQ1
B512sZvn+pMdQNFieUXd4QEwWeVNS3YwBoFiTUh6WgUMX86fC9KNteDuh/G/
asT0HzqJ4BuAEtyDZAdQsp29RNMBpH3b82SHQmneB7oT1OHhBwwtl0x9NThf
d8KCH4ZuKhjhDwBOsoG/
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJJKG1iDASHUxz+g4C9kgOM/2Af3xxjJxWHjIlva+wP
pjikxN5xY7ZQc+BYIxOVsjnFwfq+f+90Pg2HUD7dTXMXpzjIzIvTPC2g5QCU
tb7fnuJwIT+e/dxMLYeFrts+/y1B8LecKNs3Pw7Bn/t++TFv5xQHH/NOx4Sn
mg5S+ndV2ExTHJb6OQgnPlZ34Lq+uMBWK8XB7sXNNb9i1BzSQEANyr+jAufD
3A/jy+9asC/1nLwDD5N2u5hmioNA9kdNBjcZh5znv1d+NEtx+LLv49b0axIO
Lt1AEdcUhyQvlYunNUQd6rL2lExOSHFYw9J9eOZ/YYcfwY+Xzi5B8DUMgSEw
DcEHu3tlikNO04rfDC1iDmyNU527t6Q4dNp47koLknR4AAymvEMpDq16K/Jn
fpaBh++HResVzt5QcEAPf7D7l6U4/P0Yt9VoIYLfDTKPSRHO/7AhIHtWuJyD
Gsg9i1Ic9tfKWqSnSDvItb4O3DErxcHU8Uotg5CYwwRg9Jk2pTjsSby96Iya
qEMDyH8lCP6TpbOPKGQg+IzA4Lrpl+IgCAovNjGHn6AAcU9xOH8rV3yWtzTE
vcD46gG5x0gOzg9tOvrwzHsFOB/mfhh/Sntr1OU5KnC+wMvt65nT1RyOKGwo
yvBMcfBNEoiwvKLuUPES6KOAFAeQMuNiTUh6SgaGL+fPBenGWnD3w/gTDn3V
iGlG8E+BEtzMFIfvoHhboukA0u6/MMWhUJr3ge4EdXj4AUPLJVNfDc7XnbDg
h6GbCkb4AwBUck9l
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJJKA0GDakO/0HAXskBxn+wj2+OsZOKg0ncLk+eulSH
lNg7bswWag5XKl6qGRakOljf9++dzqfhoHT7Z11WQqqDzLw4zdMCWg5AWY41
LqkOF/Lj2c/N1HLIE2o+cMoQwW+Y6tydI43gZ+0pmSzBkOrgY97pmPBU0+HF
75UfL31McVjq5yCc+Fjd4cbiAluu5ykOdi9urvkVo+ZgYgwEj6H8OypwPsz9
ML78rgX7Us/JO9w49z348dMUB4Hsj5oMbjIOFltOlO37nOLwZd/HrenXJBwE
Iiy3nGBKdUjyUrl4WkMU4g7ZVIc1LN2HZ/4XdjiisKEowxDB//IXGAJBCL4E
SxifblqqQ07Tit8MLWIOV3yTBCIKUx06bTx3pQVJOqyRiUqxrk91aNVbkT/z
sww8fD8sWq9w9oaCA3r4g92fnOrw92PcVqOFCH43yDwmRTj/w4aA7FnhchD3
xKU67K+VtUhPkXZ4E7hDrjU81cHU8Uotg5CYQyww+pjsUx32JN5edEYN6j9D
BB/ou4lvVRB8UHAt5U51EASFF5uYwzFvoAaWVIfzt3LFZ3lLQ9wLjK8ekHuM
5OD80KajD8+8V4DzYe6H8ae0t0ZdnqMC5wu83L6eOV3NYeLbGntTtlQHULBZ
XlF3cN32+e8VnlQHkDeNizUh6UkBGL6cPxekG2vB3Q/jx/Qf+qrhgODPACW4
sFQHkDdmL9F00ABqlwGGT6E07wPdCerw8AOGlkumvhqcrzthwQ9DNxWM8AcA
Bdo5hA==
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJJKH0GBGzSHP6DgL2SA4z/YB/fHGMnFQdG7Xaxm1Zp
Dimxd9yYLdQcFrpu+/xXJ83B+r5/73Q+DYcPy495m8umOcjMi9M8LaDlAJS9
UsGY5nAhP5793EwtBxuQunepcL5vkkCE5Q0E36LTMeHpnlQHH3MQQ9Nhy4my
ffPXpTos9XMQTnys7rCkwJbr+uJUB7sXN9f8ilFzYACBBVD+HRU4H+Z+GF9+
14J9qefkHZbOPqKwYVGqg0D2R00GNxkH1sapzt0bUh2+7Pu4Nf2ahMMdFbbG
qftTHZK8VC6e1hB1kGAJ49O9leqwhqX78Mz/wg4T39bYm75D8A+cAoYAfxqc
//SC0u2fSmkOOU0rfjO0iDkskNK/q6KX5tBp47krLUjSoeKlmiEHMDxb9Vbk
z/wsAw/fD4vWK5y9oeCAHv5g9yukOfz9GLfVaCGC3w0yj0kRzv+wISB7Vrgc
xD3SaQ77a2Ut0lOkHXbItb4OFElzMHW8UssgJOagBYy+c79THfYk3l50Rg3q
v3cIPtB3cbseIvhzgMFVdCLVQRAUXmxiDlNAGg6mOpy/lSs+y1sa4l5gfPWA
3GMkB+eHNh19eOa9ApwPcz+MP6W9NeryHBU4X+Dl9vXM6WoOcbs8eZgOp0LS
xRV1B6FmoI9OpjoYg0CxJiQ93U11yOH8uSDdWAvufhhfI6b/0Nc/CH4KKGEK
pzl8D368dPYSTYcvQO0vpdIcCqV5H+hOUIeHHzC0XDL11eB83QkLfhi6qWCE
PwCGFFpW
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJJKJ0GAt/SHP6DgL2SA4z/YB/fHGMnFYc5RxQ2FH1J
c0iJvePGbKHmYHPfv3f6szQHaxDNp+HQ4Zjw9MK1NAeZeXGapwW0HAJ6p+cJ
7U5zuJAfz35uppbDlYqXaoYrEPwXv1d+vDQRwb+gdPtnXVmag495J9AkTQff
JIEIy4w0h6V+DsKJj9UdbLmuLy6ITXOwe3Fzza8YNYeZIBAJ5d9RgfNh7ofx
5Xct2Jd6Tt7BwTRul2dMmoNA9kdNBjcZhwVS+ndVstIcvuz7uDX9moRD2b75
UvqVaQ5JXioXT2uIOmyc+375sclpDmtYug/P/C/soNMudvPccgQ/KgXo85MI
fkPWnpLJd9IccppW/GZoEXOw3HKibN/zNIdOG89daUGSDkLNB04t/Jrm0Kq3
In/mZxl4+H5YtF7h7A0FB/TwB7v/ZprD349xW40WIvjdIPOYFOH8DxsCsmeF
yzlEgtxzNc1hf62sRXqKtEPgDrnW12fTHEwdr9QyCIk5gKIvY2uaw57E24vO
qIk6bAL5bzmCD/Td9+DZCL4JMLh4mtIcBEHhxSbmoAPSUJXmcP5Wrvgsb2mI
e4Hx1QNyj5EcnB/adPThmfcKcD7M/TD+lPbWqMtzVOB8gZfb1zOnqzn8CH68
dHZNGiTer6g7rJEBhnBzmoMxCBRrQtLTdGD4cv5ckG6sBXc/jH/oq0ZM/zYE
/y8owQH9/x1k7hJNB5D25itpDoXSvA90J6jDww8YWi6Z+mpwvu6EBT8M3VQw
wh8AsK1yog==
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJ5IGYCYhNjIAhOdwjjFGs3lhd1gPHXK5yNMJGVcJBr
fR24wyvd4T8YSDrE7fLkYbJG8MVunvserI/gezysElmnnu6Q5KVy8fQLCTh/
DUv34ZnzxeF8jU8qL2d5ijnEgswD6gfbayzqcOirRky/FYJvwLFGJsoBwW/I
2lMy2QVqfoeoA9A094du6Q6C2R81GY6JOny85Jsk4JHuoPaked7ZV6IOZ0CA
CL4qlD8TBDyh7rVH8P883puVyoTg64t/nDvjq6BDivV9/177dIceG89daUZ8
DjZA7nS9dIeS5SUb/p3ndJDSv6vCppvu0CRey5rZxunwUs2QY41OuoP3CXbb
2aEI/h1N2TX/P3PA+fGOszZmVHE4LJ19RGGDHix82R2SBCIstxgg+ODwMUHw
YfEnUjmp5KwKvwN6/AIAaIXVvQ==
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0,
              1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGIzIGYC4uj+Q1817mQ47MmveTszVMEBxldw/Jh8plfB
gZtJu13sJoLPp7tp7vvrCH7v9Dyh5isI/uOls48oAPnJEUelZ6YrOICMi7mc
4VBik7bAyE/B4fnvlR8vHcxw4I8NuG/0XMIhDQT6MhwemO/7dsZI1OGYt3mn
YwaCLxOVYn3fHsE/AwIyGQ4hv4EmNkjA+XtB7k+Vh/Odxa9sP1Op4PA9GOgi
hQyHJff38c3ZrOKw/9RC123eGQ4rXnjo/X+o7vBSzZBjTUKGQ9+TT/KX8jUh
/mnJgJhzRsvh9s+6rD0rEHyQ9zZcQvBBzk14muHA5aZayjRLA86/o8LWOFVZ
Dc7vAJIXmlQdfJMEIiyfZDjM+D+h7vcvFTj/AdB5xo8Q/De8+wxmrlJx+HgJ
KPICwX+/HBhCLxH8wwobijLeIvjA0O4/BOQ/OT5j97QNKg5zQRreZzhMfFtj
byqnCokP9kyHcFBE6mvD+engiNCGhDczbr40Gn8mCDAi+J48wATzL8PBpTvn
+W9NbUh6APpH1iLdJVNf0wEUvAeuZTgkHL6snTpTywHoqrhdwPQA0z9ZgiWM
bymCH2655URZEIIPDvY/6Q4HaoEmqqjB+f8r1kfNbFCA85llnKbO+ivhAAqu
Ts0MhzUs3Ydn/heGxEcigg9Oz/UIvlzr68AdszIchLI/ajIsE3UAR98GaHpl
l3AQBzpPFxj/HTaeu9ImScPzi/GaR71nlBH5B5afAGRoiJ4=
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 
             1, 0}, {1, 3, 3}}, {{1, 4, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {
             0, 1, 0}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJ+KK2woShjYmeWw/spfNf+n1RygPFNjEFA2SF+lycP
UzOC/6BKZJ17LYLvnyQQYTknE84HST+chuD/B4F+TP5qlu7DM88rwfnpaSCg
5HBB6fbPumkIPsx8GB9mP4y/5UTZvvlNCD7M/eh8dP/xxwbcNzouA+fPmAkC
snD/wvgw+2B8mHtgfJh/YXyYf9D5Jo5XahkuycD5YPq/NNy/MD7MfBgfZj+M
D/MvjA9zPzof5j8AiIjm9w==
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJJKJ2eBgTbsh3+g4C9kgOM/2Af3xxjJxWHOUcUNhRt
yXZIib3jxmyh5mBz3793+rJsB2sQzafh0OGY8PTCtGwHmXlxmqcFtByAonlC
1dkOF/Lj2c/N1HK4UvFSzTADwX/+e+XHS4EI/gWl2z/rzLIdfMw7gSZpOvgn
CURYamQ7LPVzEE58rO5gw3V9cYFstoPdi5trfsWoOcyYCQSSUP4dFTgf5n4Y
X37Xgn2p5+Qd7E3jdnnKZDsIZH/UZHCTcZgvpX9XRSvb4cu+j1vTr0k4lO8D
ilhmOyR5qVw8rSHqsGHu++XHgrMd1rB0H575X9hBp13s5rl0BD8mBejzTgS/
PmtPyeQ52Q45TSt+M7SIOVhsOVG2b3m2Q6eN5660IEkHgeYDpxZuzXZo1VuR
P/OzDDx8Pyxar3D2hoIDeviD3T8z2+Hvx7itRgsR/G6QeUyKcP6HDQHZs8Ll
HCJA7pma7bC/VtYiPUXaIWSHXOvr3mwHU8crtQxCYg6g6MsozXbYk3h70Rk1
UYctIP+lI/jiN899D45G8E2AwcXjlO0gCAovNjEH/U1ADVbZDudv5YrP8paG
uBcYXz0g9xjJwfmhTUcfnnmvAOfD3A/jT2lvjbo8RwXOF3i5fT1zuprD9+DH
S2fbZDv4guL9irrDGpmoFGvnbAdjECjWhKSncGD4cv5ckG6sBXc/jH/kq0ZM
fxmC/x+U4ID+B5u7RNOhH6i9eUq2Q6E07wPdCerw8AOGlkumvhqcrzthwQ9D
NxWM8AcAjGNnJQ==
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}}, {{{
             224.29999999999995`, 5.893750000000001}, {224.29999999999995`, 
             6.252339999999999}, {224.00300000000004`, 6.499999999999999}, {
             223.70600000000002`, 6.499999999999999}, {223.34699999999998`, 
             6.499999999999999}, {223.10000000000002`, 6.20273}, {
             223.10000000000002`, 5.9058600000000006`}, {223.10000000000002`, 
             5.547270000000001}, {223.39700000000005`, 5.300000000000001}, {
             223.69299999999998`, 5.300000000000001}, {224.05200000000002`, 
             5.300000000000001}, {224.29999999999995`, 5.59688}, {
             224.29999999999995`, 5.893750000000001}}}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 
              3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGBQBmIQfaXipZrhjRyHNUI6fOn35Bxg/L35NW9nLlVy2Dtf
Sv/ulhyHKd/Y4mecUXH48heoog/Bb3kduEMuF8GvzdpTMjkhx+G++b5vZz4p
OZwBgZgch9Q0IHBD8BVOOHIav0XwXVVLmWZxaDpMzxNqPtCV4/AfDDQdcp7/
XvlxHoKvEdN/6OsaBP/pBaXbP3flOJy/GvZGf7cmxJ5DMHkNh3ygcaf2Ivgq
bI1Tndfj4qvD+Tcai92mlKk7LHDd9vkv0P8MYKAOcc8+BL8H5OATCH7sLk8e
pvM5DhPf1tibxiH4oj1er1hENOB8Ljegh6M0HUTWuT+sOpDjcCE/nv3cTC2I
/fMRfBNjIMhH8MHhZQPVX6UO5/PHBtw3UleC89ewdB+e+V/Mwea+f+/0LBhf
2OH64gJbrm4E/4WaIceaLQg+LP6/7Pu4NX2ahAN6+gAAyj0Mig==
              
              "], CompressedData["
1:eJxTTMoPSmViYGAQA2IQPWMmEOzMcTAwBoLPcg4o/GIZOJ+Bb6HXWTsph5YD
pxa6bspxWPbCQ+9/ooRDvi3X9cUrchx2BltF/GcXc5ieJ9R8YFaOwwPzfd/O
GIk6zH2//Jh3N4Ifu8uTh6kYwW+Y6tydk57jcA/E/yTuwKu7ae775ByH6d0/
/M78knAQWef+sCohx2E5yD5HKYcCkH0xOQ41b2eqMq6SgfMVTzhyGvMqwPnV
93/cMv6t6ODBw6TdnpXjoDdhwQ/DNBWH9Ilva+x7Efxwyy0nyhYh+D05z3+v
XJvjUGqTtsCoThnivs05Dh8WrVc4u0IJHh4rv72sOHNAEc7njw24b9Su4IAe
ngDwBKAF
              "]}]}, 
           Thickness[0.004305890458146745], StripOnInput -> False]}, {
         ImageSize -> {232.24181320049811`, 16.338709838107096`}, 
          BaselinePosition -> Scaled[0.32439307852814453`], 
          ImageSize -> {233., 17.}, 
          PlotRange -> {{0., 232.23999999999998`}, {0., 16.34}}, AspectRatio -> 
          Automatic}], TraditionalForm],
      PlotRange->{{0, 1.}, {0.0025, 0.006}},
      PlotRangeClipping->True,
      PlotRangePadding->{{
         Scaled[0.02], 
         Scaled[0.02]}, {0, 0}},
      Ticks->{Automatic, Automatic}], 
     GraphicsBox[{{}, {{}, {}, 
        {RGBColor[0.368417, 0.506779, 0.709798], PointSize[
         0.009166666666666668], Thickness[Large], 
         StyleBox[LineBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQDQMakVbaV+NL7GfNBIGV9r4JP0TempZB+Tvt2w5L
CR1SqbA3MQaBw/bZMcqtN9SqoPIn7QOOXw0Xsaixh5h2wf6Yk86bmNA6qPrL
9i/ib/Pr2DXYp6eBwDX7dXqzd84ObYTqv2nfK/BV1qugyf7sGRC4Y7/FZULj
qt5mqHkP7Hn2sfv6rm2Bqn9on/JdV/LmuVao+Y/tD0evm8b6qQ2q/4n9kYM1
B6aLdUDte2Yv6Rf5N86mE2reC3vz+OpfRsldUPNe2mt6nmH81NUNNe+1/f3U
SRvrN/dAzXtj75Eg8vfwnV6oee/sz0a0Ja9i64ea98G+uc5/xQSJCfYAYzOS
XA==
           "]],
          FontFamily->"Latin Modern Roman",
          FontSize->12]}, 
        {RGBColor[0.880722, 0.611041, 0.142051], PointSize[
         0.009166666666666668], Thickness[Large], Dashing[{Small, Small}], 
         StyleBox[LineBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQDQN3OR0PPUsssZ81EwRW2ts4f2XJMyuD8nfaN+7R
35epXWFvYgwCh+27QssNrfWqoPIn7f+r2tjyWdXYQ0y7YP/6xZIzE6PqoOov
269YNvX6RLcG+/Q0ELhmbx2jIs8Y1AjVf9Pea7bFV/G8JvuzZ0Dgjv3MxaLr
bKY0Q817YJ95dek5sU0tUPUP7dfcyu2ddqEVav5je0N/p0l639qg+p/YW+hm
cESIdEDte2a/etvt698sO6HmvbDPcrn9LTKlC2reS/uH2efmbp7UDTXvtX0o
56Yp07b1QM17Y7/WeN7JMzd7oea9s7eJmlrMz9cPNe+D/cIdiT9UZSfYAwBv
cZPh
           "]],
          FontFamily->"Latin Modern Roman",
          FontSize->12]}, 
        {RGBColor[0.560181, 0.691569, 0.194885], PointSize[
         0.009166666666666668], Thickness[Large], Dashing[{0, Small}], 
         StyleBox[LineBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQDQNX0nr9bOJK7GfNBIGV9s/jdS+amZRB+TvtN5Uv
XdurUmFvYgwCh+13P3Jft9uoCip/0r75ddaHX6Y19hDTLtg/iH2cI+dTB1V/
2d7/xPobHrYN9ulpIHDNXnOuk2xzeCNU/0170c/sz9kKmuzPngGBO/YK5yOO
zJ3cDDXvgT3PskirFetaoOof2h+ZPbmN7Vor1PzH9lmd8mXFL9ug+p/Ye/67
0/qHtwNq3zP7UjN/zetmnVDzXtgfOsS/wSG2C2reS/uLatOM33d0Q817be86
x/39ttU9UPPe2Htt2OEpe6UXat47+7nXH93ewt4PNe+D/fRVmxueiEywBwCK
SJfY
           "]],
          FontFamily->"Latin Modern Roman",
          FontSize->12]}, 
        {RGBColor[0.922526, 0.385626, 0.209179], PointSize[
         0.009166666666666668], Thickness[Large], 
         Dashing[{0, Small, Small, Small}], 
         StyleBox[LineBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQDQNzZnQv5WcrsZ81EwRW2qv9cjnwZ04plL/T/p+t
3mneynJ7E2MQOGwf7fXjnu+GSqj8SfsjjR59Dkur7SGmXbB/w/08wmhbLVT9
ZfusJyrn3z+ot09PA4Fr9vnT8pcI/WiA6r9p/yKnW/PO+0b7s2dA4I69ymbH
q7rSzVDzHth/LE7zXMjfAlX/0P6dts3yJTatUPMf2y+Z8OxOS2wbVP8T+xUX
1cMsfNqh9j2zdxC99U02qwNq3gt7cf9jUi6WnVDzXtozlPjnZbV0Qc17bT+5
VdXMfHU31Lw39gV+/wTVZvRAzXtnf9jlm9WGph6oeR/sz2y7c2Mbc589ADkp
lfU=
           "]],
          FontFamily->"Latin Modern Roman",
          FontSize->12]}, 
        {RGBColor[0.528488, 0.470624, 0.701351], PointSize[
         0.009166666666666668], Thickness[Large], Dashing[{0.01, 0.02, 0.03}], 
         StyleBox[LineBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQDQMO1b+qdZeX2M+aCQIr7X87RmfzeZVB+Tvtj9z7
fa/KvsLexBgEDts/eSR58GpAFVT+pP1Lv9cVR+Nr7CGmXbAPnNC+1Ty3Dqr+
sv06da6UuLgG+/Q0ELhmbzK/l/1RYiNU/037s65GCRPrm+zPngGBO/ae7V0n
WSc3Q817YH9r09u+07tboOof2n9lXJRT8bAVav5je/4JWw1K2duh+p/YL1Zh
y8zS6YDa98w+lvOBfnxWJ9S8F/ZCsY8nRBR3Qc17aW+/PLJ9/6xuqHmv7b0T
nBh7z/ZAzXtj/3DBPuPSZ71Q897Zf/zCV8O/vxdq3gf77TrHl8Sf6bcHALNb
lgo=
           "]],
          FontFamily->"Latin Modern Roman",
          FontSize->12]}}, {}, {}, {{}, {}}},
      AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
      Axes->{False, False},
      AxesLabel->{None, None},
      AxesOrigin->{0, 0},
      BaseStyle->{FontFamily -> "Latin Modern Roman", FontSize -> 12},
      DisplayFunction->Identity,
      Frame->{{True, True}, {True, True}},
      FrameLabel->{{
         FormBox[
          GraphicsBox[{
            Thickness[0.017265193370165747`], 
            StyleBox[{
              
              FilledCurveBox[{{{1, 4, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1,
                3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 
               0}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJhIGYC4t2JtxedcZNwmAkGjA7LX3jo/T8oCefL71qw
L/WcpIP273Uc/7YzOqR4qVw87SHlEM4p1m78n9mhPmtPyWQLLYfbGQz5jSoG
Dkv8HIQTk7Uc7E3jdnn6IPjiU69wZgQh+A5Nj47PiEZSXxmxwrTWwKFnw8OX
U420oPYbOGy/yHCP6aUmnJ94+LJ26kwEX0r/rgpbo6bD8yztb9OB+sH2JGk6
gIw7CzTffc3R5QwSUg4LLsoeOTeF20FmXpzm6Qv8DhUXwyeknVFyAPrOb3or
k4MDp3HufysFhxYFdtUzX5gdHrjGO87aKA/x534uB0PVSS9SVRQdAIbUfRk=

               "]]}, 
             Thickness[0.008252762430939227], StripOnInput -> False], 
            StyleBox[{
              
              JoinedCurveBox[{{{0, 2, 0}}}, {{{12.951199999999998`, 
               16.344899999999996`}, {56.927, 16.344899999999996`}}}, 
               CurveClosed -> {0}], 
              
              FilledCurveBox[{{{1, 4, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0,
                 1, 0}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0,
                 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 
                0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1,
                 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 
                0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                 3, 3}}}, {{{20.699600000000004`, 11.9254}, {
                20.699600000000004`, 11.300799999999999`}, {20.3863, 
                9.499999999999998}, {17.969099999999997`, 
                9.499999999999998}, {16.6105, 9.499999999999998}, {
                17.404299999999996`, 12.7219}, {17.5125, 
                13.174999999999997`}, {17.5605, 13.200000000000001`}, {
                18.029299999999996`, 13.200000000000001`}, {
                18.895300000000002`, 13.200000000000001`}, {
                19.929299999999998`, 13.200000000000001`}, {
                20.699600000000004`, 12.880899999999997`}, {
                20.699600000000004`, 11.9254}}, CompressedData["
1:eJxl1HlIk2EcB/DXWFlEKtTcu2psmiazdMf7DjqsfqMEXdLsoAYdntOR1jo0
JabSKtJMPNJMy+h2ZaVddkAju1asdWqH/bGyCC3DIysh7W3Pas8D7oGXlw/v
8bzv7/n+nqBk4zL9KIqiVrkOdM7/PWfTkzcqUIRWdOqzhOCxyTnYztiFkHeh
ObngkQpKdcVan14h6IUdOsE14iintqT6CHH4nAp7wUEVBGT0SanTQqCrWscZ
KlTQUmw1swuFcPizqL4zRgXtU0xJyjY+hFRzZfl2FmJupvU7fk6Cc8XvDFQB
sft5JfH78fvPmH1Y4Pkd0zjy+djb0fc2CLD3RFqMNS9piCw7OqiYzkLP8UaJ
Y5YIFr3pHdBIWRiw9l1N3yaC6NDsUbWzWBjmXGOBGHuf5guP3UwsR/VpJbZH
m8LSzgeB9nn5mj87GcjR+H7lMoOhYf6q1Rf9GdA7+S1cczB0T7DKa/a67rfO
MHNrpwEdEz9EX1bBGom6LyUuFJtCIzEM21WkSE4thXuSpi2GFhZsUldhuXBo
ze2arqAZ7JlB4oHMZhl2U+TGEz5RxAbKuIM32ttP21Z2yw4Rp6ehEQ4ln/rF
L2TEcej/ThC781Ak9/KvO6lnE1li283rJWN6pWAaYc/10m+mBSqrFFanznVq
8+SAUvU8UQoW89LYutsREIvW+wANiSuWhR0tioB4p7Le3hEI5yv1hSl5EeCe
Pi0QCnj3SxWvZ2D3oHpriEuXZ4VUi73dJHHo2Do+NsugwYf4jNqcw8nEBmPv
7kdZxO48dhCfQuuUNBOetW8Q1C7mQ9xD33mH2ohPLoGJSa76eeyvbazUj5Vj
t6H1jJHj9/3LP3FdT/2DxdXEeag/r3u7K/cx6IeIPf/biOpVR+zOgZG48ueY
hIOZMi+n6u5PqbER/+lbd1WpFmAPj/DQx1vr9ccFcA3MHbZcGWSYLb8pHg1o
1QMLPXkJhmPRzd+HBxTYP2607x3mM9hNH7qqLsUx//psUILdwCu+WyMjnoDq
aBGDMcH3iVDBgOShehzjEIHY1VaPRQx8Wk7tSy+bClsN5d9MnPJ/f02GHSgv
v5TQXen3insrxC6KQomjsd9HJ6hry/mQEqCbfcXCwDk0PzcRdh1xnH2azWLz
VvpFXNqgwvbsn/5rXYm10TByf/0LAkQ/Lg==
                "]}], 
              
              FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1,
                3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 
               3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 
               1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {
               1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGITIGYC4vQ0ELBy+A8G3A4wfiqY5nNY4Lrt898nlnD+
GTDA5E+tDWf5P1sAzk/yUrl4eoU4nK9wwpHT2FfKwfq+f+/0OkuofdIOu9X5
ubcus4Dzu/6mfn/y0RzOD5ATy/KdbO4Q8rvEJs1BymHtjfgy/zxzh5XfXlac
cZB0cDCN2+WZg8mH6Fd0UDPkWCNjZeag7D9p3cwzCH7n1h8iDMaKDh56/xX/
HkPwv2wIyJ513cxB8MmClpliCH673or8mcEKcP5MMBCA82HhEXHK6MjGfQg+
zD50Piy8TYyBYLKZg4V/6YmzBjwOJw87rc18h+CDtamZw/kmDdsdmpIQfLAz
diL4S2cfUdggZAE3H8aH2V/KNItDus8czr8lXZNoVIrJzyhh32i8VADONxD/
OHdGqRicX3X/xy3jbEkHYGjzMElbQONZChouCL6+1krhCyKWcL4xGEDTS7Uk
nN8X0e3POEEczr9vvu/bmUkCcD7MfU7n064+l0LwYfah82H+752eJ9T8wQIe
PomHL2unelrC+WBl9Qj+G959BjN3IfglGRPf1vBbwfno+QUAHxhykw==
               "]], 
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
               3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGINIGYC4vVTUjuSZe0cur1esZhcFHSA8W9L1yQamQo5
6N5VYWtkRfD/g4EtnH+fe/LKpo8I/pz3y495P7d1KL8YPiFNR8ihB2TuQ1sH
A9VJL1KvCDrcKezqe3LJ1mFqbTjLf2lBhwv58eznZto6nAEDHgeWMD7dTWdt
4PwniQuvmfgj+DXrtiXVz7R2WP7CQ+8/owCcP3frbT2T7yJwfs3bmaqMpyQd
+oNLVKbr2zjMmAkC0g5L7u/jm3MYwb9x7nvw46sI/hGFDUUZjrZwPo8/KERs
HZ4EM/Skf5ByaF0efsooxNbBoenR8RmzpSDu8rF1EG833j/rsCScbwwCwQi+
vvjHuTNCJRxCgM75X2DrADZ+prhDahoQLEPwXYt+8r+8juDDwvvThoDsWeYS
cD4T30Kvs3aScH44p1i7cby0w1xQ+JfbQsxNk3HYYv7jUMouGzjfBOSuxdZw
vnt1s77PMysH5WuPghnOSMD5JzZ0mRu9F4Hz+yO6/RkvCDjwMGm3i+20hphj
zO2gYTXpdP0OGzjfA6T+mi2cD0tP5Ye3uc7MRaQvWHoDAFleG+s=
               "]], 
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
               3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJ5IGYCYsstJ8r2hTs6bDH/cShFi9kBxr+jKbvmfzGC
vye/5u3MpcwO+ndV2BptHR10+NLrTN1ZHYxBYLGDww3e22Kp3/gczoCAj4PD
gVpZi/QUcTg/PQ0IpinA+XYvbq75ZaPq8J0tfobPVAeHSPHtFxnsNB0+Jp+J
9fZwdJBgCePTFdKB269e17Mz2xPBb5l3dtX5UAT/SsVLNcMMBJ9l8SQrxl4d
h9UJIUHqAY4OM2aCgI7D4cvaqZJeCD7YXWYIfq5Jw3aHXQ4O4bXrtiXd13Lo
Ly2U5i1wcNjzWET2ZKuGw+bIrztvKTk4cLmpljJJqTn8BwN7B5d5KrHGncpw
Psy/MP6OYKuI/89lHG5L1yQaiTo4dOityJ9pLO6gvPNP+5dkBwdTxyu1DEJC
kPDY6+AgPvUKZ8YiDof3Fq7uRZaOEPPSmODuh/Fh/oPxYf6fu/W2nsl0BB8W
vwB1S9ZS
               "]], 
              
              FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0,
                1, 0}}}, {{{41.14609999999999, 11.662099999999999`}, {
               39.328900000000004`, 13.533999999999999`}, {37.5117, 
               11.662099999999999`}, {37.6672, 11.500399999999999`}, {
               39.328900000000004`, 12.760199999999998`}, {40.9906, 
               11.500399999999999`}}}], 
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0,
                 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {
                0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}}}, {CompressedData["
1:eJxl03tIU1EcB/CrqZuaombzUYh3m2Uq6ZgpKMPfPVMwNU2tzCQW4jbTyP4I
MnxnEbSJoM2aZQ8TNXyVRpTkg8SKmA/yET5CXOZbsiHOgba2qfdAfuFy+XA4
l3Pu+R4yNStBbE4QBBge41uQlPK6Sx4O+uyWC8prJOx6slplpazhwLqV6GGM
IBwC+cZ4gXBAMjL3VUjbrTvFk7qMbeZ7lzXGEgJ3VJ1INHJgTu69YmclBF6j
ukSVyAHRr0H2hA5Bo2winSjlwvfVtajkTkTPrz/RFxpbhF3uanHO/ix23Xzk
cT0PwaJFoGPQJBcsX5SFmB1E0JAX4sFf5YAt1ztfrqOgfn0hW+XAgQ3ebLPX
DAWOmX+OERUkbfILZc3Pw+Z5lc2L00joGfIVuy1ScEBDDUgiSDCsMqtoDbtg
THDzPIFoD2WJGP1mCDgX+TpJNAlM3TNpm83O+AgJvX9bczSeCN6P39sSB3Og
I0Dp4ypAoDSFC/vjWu6Ls7GNfye/ElsqMaQWQaFFbykvGDvpVu+0qoBD+0YU
Y0m/zAbZllg783xnvIUNCqHsytwjBLIepaiPYsOyXWeAUkPBiEW81oxpDw2X
ziQcnafgTfDGxzQfW4g/WVV4RE1tf1diA6+mFxStNdgPrjoVd5dhL6mD3LuL
93pjnB9tPsykrd2x1tinOxToTWFs96MC27T+l9hVv+s+RXdRMBUhoip5THCJ
PL3pOoQdZuyrM6KdU+wfU1uN6PmMfrf48Qbsp+7+P7ide73vMFJU5lnT3t2P
Lj/jw/U27Nzmt6kFSuw4D1bGqUTsubCaqc5YtL1fZ1vaD43HOYa9+bMjQ2xu
B5nWhsKUI5hJJOTSQRZYFhlO7DECT2M/V1zgdu5gW3ITgiYnP3vpExY4fG5/
VzKKQGWKM4T6DVfOeglpuyqGrdO/Ye/e58h2iaZv9BD8f9//AcvtwoE=
                
                "], CompressedData["
1:eJxTTMoPSmViYGAQB2IQ7V3drO9zzdlBvN14/6zDUg6aVpNO129wdogU336R
wU7C4U9M7tF/Wc4ODGAg5qB/V4WtURXBL94q+vv0Pic4f74UUMU6J4f9tbIW
6SxScP4dTdk1/40RfPc1R5czREg59Hi9YjHZ6OTwZUNA9qztUg4cPxekb97k
5GBgDASfpRzsw6M37v/j5FB+eJvrTF4lh7nvlx/zZnd22P/tzCSGrUoOM0HA
0Nmh28ZzV1qSssPF/Hj2c57ODnteaHsYb1N2kJh6hTMjCih/eGb82Y/KDiKy
J5/a9zhD9M1UcSh9MEdw6VEEf1VCSJA6hwucf+PDF69INReHB/v45hhPUobz
VWKNf6ZFK8H55RfDJ6TZKDrccWOu4P7jDPGXoawDevgCADSLlFk=
                "]}], 
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
               3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJ5IGYC4hgnuxc3z7g6hHGKtRvLizrA+CrXHgUzvBF3
mHNEYUPRBleH/2Ag6WBiDATFCP7Puqw9Jc4I/iaewjXd2q4OX/Z93Jq+TQLO
X8PSfXjmfHE4f5vrTF6jTjGHmmZ9n2VOrhBzjUUdTpTtmy9VjuAv2XtQXK0b
wQfaNllijqtDVtOK3wwpog7LXnjo/V/p6tBp47kr7ZKow16DmVoSa10d1J40
zzv7StRhVUJIkPoG3PyVUL4qlH9wxRI/h81Q99oj+H8e781KZULw+yO6/RkL
hB0kiq8LfQLa77Er7dPZMAEHHv/1U1IDXB3iHWdtzKjicvAI+CNRbO/q4H2C
3XZ2KCecf0dTds3/zxw4+RD9HA6M2u1iN91g4cvu4FUNDDA/BP/BPr45xlEI
Piz+RConlZxV4XdAj18AxpncaA==
               "]], 
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0,
                 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {
                0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}}}, {CompressedData["
1:eJxTTMoPSmViYGBwAGIQzaOiUdcj6eXwv2J91MwCRQcY/86iM2wzlyg7HLms
nSp5ytPBxBgEVB345xgv2hKO4D/r0XjL+80Dzj/3Pfjx0sUeDirXHgUzrFF2
2Bz5deetSR4Ohmse9Z4JVnbQ2TT3/fI2D4c13bczGPpVHJbsPSiu5o3QX8o0
i0OaD8FPeHpB6fZDdzi/ZKvo79P73B1esZgImt1RcbiUH89+bqG7w+paKznj
D8oONz588Ypsc3dY8e1lxRkBZYej/zZVfypwdxDM/qjJME0Rzlc84chpXIvg
G6pOepGaougwYcEPw2dl7g7CnxzPp7kqOqwwPWvt14jg+yzjclPtRfAX2Ohc
mdXn7qAca/wzzVvR4erRXJOG6VD5q4oOk07Xe+xf6+6w81bX31RzZQcg+f3J
SXeHmWCg4nBTuibRiNUDzgeGzjFvdQQf7G1jD4cGlqP9huYIfnjT0Ydn6pXh
/HIv9tf/3yg5hJ8yOrJRDyq/XskhSSDCcouGh0P34ZnxZx2VIO6od3e4yhL4
nZGDz6FCV1H+S4m7wxbzH4dStLgd5MSyfD/nuTukp4EAl0Ptum1J9YYIfor1
ff9eeQR/x3rm5z0CmPwft4y9ma5wwPnfoXxwehJyd/gPBuwOW0DpQwnBjwC5
3wzBz9pTMlnCx93hvmu84yxDDocnIrInn8Yj+OD0uhDBdw/4I1Gs7wHXf3nW
M9nlFgh+zvPfKz96YfKZZZymzqrlhPNh/jnmbd7p6IDge1Y36/uoIfgyrx+Z
ST1A+H8LTyEwaUP9K8IN588ARedNBP/P471ZqUy8DubXgAlGwcPhSTBDT/oF
MYdLvsAY0/RwUAClz7fiDoGecxvUrDwc1grp8KXPE3O4O7m9NSrZw+EMGIg4
cPxckL55E4L/OHHhNZN4Tzgflp89dqV9OntN2gE9vwMAraG8Kg==
                
                "], CompressedData["
1:eJxTTMoPSmViYGAQB2Iw7RHwRyLZ00G83Xj/rMNSDt/Y4mf42Ho6RIpvv8hg
J+FwXNNq0unvHg4MYCDm8Hvlx0u+mxB8+6ZHx2d4I/g5z4EqrDwc9tfKWqSz
SMH5dzRl1/w3RvDd1xxdzhAhBbXHw+HLhoDsWdulHK4ezTVpsPdwMDAGgs9S
DtwqGnU9nR4O5Ye3uc7kVXLI2lMyWWIK0PxvZyYxbFVySAOBfR4O3Taeu9KS
lB3m2ehcmXXNw2HPC20P423KDk8SF14zeQ6UPzwz/uxHZYeHL6du4pH0dJgJ
BioOTmsz7xUGIfjluoryX6Yg+Ev2HhRX2+zp8GAf3xzjScpwvkqs8c+0aCU4
v/xi+IQ0G0WHFcIXXG50eDr0eL1iMTGUdUAPXwDLdph0
                "]}], 
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
               3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJ5IGYCYh4Vjbqem94O6WlAME3BAcb/sGi9wtkMJYc3
vPsMZp7ydigQaj5wKlHV4Uniwmsm5d4O3FuXVR7X1HCY8375MW95b4eaRKNQ
Ay5tB59lXG6qS70cZswEAR0H+/DojfunIPglW0V/n+5D8HVSJR9FtHs5sCye
ZMXYi+BfqXipZpiB4LfMO7vqfCiCr17XszPbU8fhwcupm3gWejnI6N9VYXuo
7bAiISRI3cLb4ZY00EWlmhD7e7wdVjYFes5tUIXzyy+GT0ibowDnn7uVKz7r
tbjDhNP1HvtdvR38n3heMr3M7/Dl9vXG4mleDn8e781KbWKB278nv+btzKXM
cP4dTdk1/4sR/C3mPw6laCH4c7fe1jOZzgT3Pzi805jg4QPjg92/AsHPN2nY
7qDk7VB2eJvrTF9OhwMrlvg5ZHs7vJ/Cd+1/pKADf5XZarvt3g6R4tsvMtiJ
wePvPMg/2dIO6PELAOjAz7A=
               "]]}, 
             JoinForm[{"Miter", 10.}], 
             Thickness[0.008252762430939227], StripOnInput -> False]}, {
           ImageSize -> {57.92350684931507, 18.058181818181815`}, 
            BaselinePosition -> Scaled[0.29350487424072735`], 
            ImageSize -> {58., 19.}, PlotRange -> {{0., 57.92}, {0., 18.06}}, 
            AspectRatio -> Automatic}], TraditionalForm], None}, {
         FormBox[
          GraphicsBox[{
            Thickness[0.12706480304955528`], 
            StyleBox[{
              
              FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
                 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0,
                 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {
                0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
                3}}}, {CompressedData["
1:eJxTTMoPSmViYGBwAGIQXXExfELaGSmH/xXro2YWKDrA+HcWnWGbuUTZwdy/
9MTZAAkHE2MQUHVgkXGaOmuvCJz/OJihJ32DIJwf7zhrY4YVn4PKtUfBDGuU
HaaUnH0yW5fXwXDNo94zwcoOW8x/HErJ4nFY0307g6FfxaHLxnNX2iYOuP6C
ea8mzH7IAuc/z9L+Nl2WCc6/8PvY9Xk3/9u/YjERNLuj4lDzounXNMs/9qtr
reSMPyg7VN3/ccv49A/7Fd9eVpwRUHaYkCianyL3zV4w+6MmwzRFOF/xhCOn
cS2Cb6g66UVqCtD/1/J2X7jzzV74k+P5NFdFB+fF1h1zNX/A+XfEUs1OLPkJ
54s3yUwxuPzTXjnW+Geat6JD+LdYwT/vf0Hkryo66Pxex/Fv+1/7nbe6/qaa
Q90zj8FhJhioOAQ88bxkGswC57cqsKueKWGD8yH+ZndoYDnab2iO4Ic3HX14
pl4Zzi/3Yn/9/42SQ6zeI2vD12wQ+fVKkPDoZnPoPjwz/qyjksMG6W26p958
t7/KEvidkYMP6p5v9uB40eJ2OHnYaW3mva/26WkgwOXAute8jSHhDZy/avr9
TKPHz+H8rYL+ZcbKTzD4QFu9ma5wOGyB8r9D+Qkr9R6ktj2x/w8G7A7vGXfp
p297Aedf6WQJPrvmLZy/5Nbyx4bNH+3vuwJTliGHQ4xqhMy5P5/h/Adg+g+c
3wgKp+9sDjD9F17wJaV3scP5TxIXXjNZz4HBZwal61pOOB/mH7+LE2P+MSP4
IpWTSs6msMH5wW8vf5zByATnA3mNp3YwOoD9K8IN588ARedNBP/P471ZqUy8
EP8xszk8AeWjC2IOPifYbWdPZXNQAKXPt+IOElOvcGYsYndYK6TDlz5PzEFf
/OPcGaZcDmfAQAQS39r8cD442fwUgfNh+dljV9qns9ekHdDzOwDHSclA
                
                "], CompressedData["
1:eJxTTMoPSmViYGAQB2IQ/WHReoWzEqIO4u3G+2cdlnK4+IIvKf2VsEOk+PaL
DHYSDmuEdPjS9wk6MICBmINI5aSSsyr8cP5Wrw0Wc3ZywPlPEhdeM1nP7rC/
VtYinUUKzr+jKbvmvzGC777m6HKGCCkHmY1i85kesDt82RCQPWu7lIPW73Uc
/76zOxgYA8FnKQew+2bwOJQf3uY6k1fJIeTt5Y8zHHkd9n87M4lhq5JDahoQ
PON36Lbx3JWWpOzQrsCuemaLgMOeF9oextuUHWbPBAJLQYfuwzPjz35UduDx
Xz8l9YSQw0wwUHHo0FuRP3OyCJyfEnFUeuZyMTjfdZ5KrPFMcYcH+/jmGE9S
hvOB5M+0aCU4v/xi+IQ0G0WHPYm3F51xE3Po8XrFYmIo64AevgDTN5IN
                
                "]}]}, 
             Thickness[0.12706480304955528`], StripOnInput -> False]}, {
           ImageSize -> {7.867666251556662, 16.338709838107096`}, 
            BaselinePosition -> Scaled[0.32439307852814453`], 
            ImageSize -> {8., 17.}, PlotRange -> {{0., 7.87}, {0., 16.34}}, 
            AspectRatio -> Automatic}], TraditionalForm], None}},
      FrameStyle->Automatic,
      FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
      GridLines->{Automatic, Automatic},
      GridLinesStyle->Directive[
        GrayLevel[0.4, 0.5], 
        AbsoluteThickness[1], 
        AbsoluteDashing[{1, 2}]],
      ImagePadding->All,
      ImageSize->350,
      Method->{"CoordinatesToolOptions" -> {"DisplayFunction" -> ({
            (Part[{{Identity, Identity}, {Identity, Identity}}, 1, 2][#]& )[
             Part[#, 1]], 
            (Part[{{Identity, Identity}, {Identity, Identity}}, 2, 2][#]& )[
             Part[#, 2]]}& ), "CopiedValueFunction" -> ({
            (Part[{{Identity, Identity}, {Identity, Identity}}, 1, 2][#]& )[
             Part[#, 1]], 
            (Part[{{Identity, Identity}, {Identity, Identity}}, 2, 2][#]& )[
             Part[#, 2]]}& )}},
      PlotLabel->FormBox[
        GraphicsBox[{
          Thickness[0.003988672171034263], 
          StyleBox[{
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1,
              3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3,
              3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJx11A1MU1cUB/AHreCilg8phZZ+2jKhG7oWRoMs/NnCVNxWgi6tC2wU+sFQ
RogEWZBFGwKLmElYcFSnQ7ekRtlwm4pDxTHCINAyOnFh4KxTE3GZQx1jaLFv
fS3cJks4yc3LLy/3vHfvOfdKiyvyTSyKokJ8Q+cbob5B+0OIRrtuSMWWYNFG
N7eXDpNi/vblMpNViOxn1OX0H1IY9f0Cm10AFud4rnNEBvvsvRpHOx+n6zJE
6rw1gflX4tHRNFlKVaxB/v2rD9uyuejlJW5dxpKjtU7Hpj1RSHNueMNVKcdP
E+W8w01R+L5OqLHUy+Ga4hRbTkUi8l5XJ+uuHMsUjrNPT0fgTc7z3xzVKhBR
mOdWWTj4TR62r/V20Mdzzv/99Gwi8beD1T2fda9FrXtuQr1lNRz+SMZ2XpeL
usEjro82T3hbE4glg76VOkWQTT7+oKwgifi1wfCXjnCfJZ7J3d6gqU7EwJn9
6aqDItwaaLt4aFRBbCy8/irrQtC39L4P71UgNXusjnoU9MZu8yNnrJg4csfD
JKoh6A8zN3ebW8R4UlDe721RgNeovnK4T4y5H4ynimYUgTqkSKFj9medkthi
ZkIJE1PHWcmS/jL6OY7lRtAPkqgf1eMSpP/SX55atPD+IwnWNbfPvRCmhLi7
vcc0IsLdMuXsJ0eT8Kk9445Zs9A/ciV2u3TN5pV8ku+7rRl6OjyOeHff+Rzb
/SjiasbO5TD0XVWabGuJhfapTSluBbG//hFyHGD2Q7UKOmv/7w5aBmabKG8k
LhomTzgOyVDC9GdjFIZ7lFa6ToYLObZVqndjAn0gkIFi4iY30KfT0sD8t+Mw
LXin1myTYpunKtNMxYOu6XzLtleKS0zeMD6mT3RKnHOSwFPDxyu8sS7HrxKk
qpkQ4H39yTTnlqD9dcsXEY8L9hhU1+IxyvT7Ch5upvfMOlRcbOzot1OaaOJ/
B2qvDdWvJP465b3PQy6xUHWO6xn+K5b4zxoHTHsSiP19WS5Es4FbYRSxA+s6
JkJxrtw1XMpGgUKfMJIgJn7drbIPvyzGNuZ87mMDVl8HH1nagbqLUWmvOuPV
shfuBwlGmfO6n0Uc7j+vocTaO5t/Tvs4FNeZ9f8jxkF9kzZkfSjymLxSMTad
0w6UNDzJ8udJ5uKA7+2x3sdZCR30rraKGOIOdlOfjV6NzB1dhaVfeZb0ztai
Ss2ueeLxWNOLg1/MZ9X4+zIGl62pJa4Zb9YQ0x/OGBiY/ZhiYb2iZco0xsOY
b7VDmjDstJ70UOxYLNfUJ6dtWIHFfA+Y+sdFEwuZ/9TGES/en4H5fPz/fv0P
ELNj9w==
             "]], 
            
            FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 
             3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0,
              1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {
             1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 
             3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGITIGYC4jQw0HT4DwbcDjB+Kpjmc7irwtY4NVkDzjcG
A0z+1Npwlv+zBeD8JC+Vi6dXiMP5CiccOY19pRwEIiy3nJimDrVP2kHg5fb1
zM9V4fwNU1I7kmtV4PzVtVZyxgeUHUJ+l9ikOUg57Hmh7WFcpuyw8tvLijMO
kg4P9vHNMS7C5EP0KzooOH5MPsOr6KDsP2ndzDMIfufWHyIMxooOyRFHpWeq
K8H5HxatVzjroeQg+GRBy0wxBL9db0X+zGAFOH8mGAjA+bDwSL8vevC/GIIP
sw+dDwtvMLVf0cHCv/TEWQMeh3SQsjIlVP4zBD9iQprOrDhlOP8MCPCowPlP
Lyjd/rlPBW4+jA+zP+PtNu6zW5Xh/Duasmv+N2PyM0rYNxovFYDzDcQ/zp1R
KgbnV93/ccs4W9IhlE9309zzKhB3nJGC0qpw/q+3rw9YHlaD8xnAQB2SXqol
4fy+iG5/xgnicP59833fzkwSgPNh7pO1SHfJPK8G58PsQ+fD/L/lRNm++VVq
8PCJAUWAjjqcD4lHBL94q+jv03wacH5d1p6SyTsQfPT8AgDDpWzx
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
              3, 3}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGINIGYC4upEo1CDLAOHbq9XLCYXBR1g/NvSNYlGpkIO
v1d+vOQbhOCfAQEfBH/tjfgyfzsEP3tPyWQJEwOH8ovhE9J0hBwixLdfZNAz
cDBQnfQi9Yqgw2q78OiN8gYOU2vDWf5LCzrYVkasMD2rDzH3DI/DAtdtn/+a
6MH5KbF33JgtdOH8Kd/Y4mec0XZY/sJD7z+jAJw/d+ttPZPvInB+zduZqoyn
JB22OzQ9Ov5Dx2HGTBCQdngAcpCCHpzvY97pmOCK4Kvc/lmXJaMP5281/3Eo
ZZW+w5Nghp70D1IOS0H2Ouo7gIydMVvKwcQYBPQdxNuN9886LAnng6lgBF9f
/OPcGaESDvYgfdX6DmDjZ4o7pKYBwTMEX9j+2J2tKgZwPiy8P20IyJ5lLgHn
M/Et9DprJwnnh3OKtRvHSztcqXipZtihDzE3TcaBhbNLPplPD87/DwL3teF8
/QkLfhimaTkoX3sUzHBGAs4/saHL3Oi9CJzfH9Htz3hBwGHD3PfLj3HrQP3F
7fCGd5/BTC49OF/cI+CPhLIBnA9LT+WHt7nOzEWkL1h6AwBtsQfH
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1,
               4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}}}, {{{19.399600000000003`, 
              9.905859999999999}, {19.399600000000003`, 
              10.239799999999999`}, {19.115199999999998`, 
              10.499600000000001`}, {18.805899999999998`, 
              10.499600000000001`}, {18.447299999999995`, 
              10.499600000000001`}, {18.2, 10.215199999999998`}, {18.2, 
              9.905859999999999}, {18.2, 9.53477}, {18.508999999999997`, 
              9.299999999999999}, {18.793400000000002`, 9.299999999999999}, {
              19.127299999999995`, 9.299999999999999}, {19.399600000000003`, 
              9.559769999999999}, {19.399600000000003`, 
              9.905859999999999}}, CompressedData["
1:eJxTTMoPSmViYGCQBGIQ7V3drO+TZuzgsebocgYLUQcY/+/HuK1GjOIOin2l
hdKxxg7/wUDSYb6NzpVZx4zg/NP1HvtrcxF8YzAwckjyUrl4+oUEnL+Gpfvw
zPnicL7GJ5WXszzF4PpNwOKiDltbai5sPong+1+cGPOP2RjOr123Lale0tgh
RjVC5lyNqMPsZ7LLX2gYO1Qc3uY6cy2C/+fx3qxUJhE4nwEEFgjA7fuwaL3C
WQkuh+qlOs4y0UYO3ifYbWeHcsL5dzRl1/z/zIGTH+84a2NGFYfDBaXbP+uy
YP5nd7icH89+rhLBZ/Rt4fXvR/Bh4StSOankrAq/A3r4AwA076oF
              "]}], 
            
            FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 
             3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0,
              1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {
             0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 
             0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3,
              3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 
             1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1,
              3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJPIGYCYlvTuF2ea+wcTIxBQNQBxk8DAzEHlsWTrBhz
EfyadduS6jtt4fz/IFBv6xBw32j56UcIvsya/8Uz1kvA+WY2e4OmOWrC+XMW
Ke/8o64FNy8dbJ4W3D4YH+YedP5xTatJp/9rORxpWx5+KsnOYcn9fXxzPms5
uBf95H+ZbgvnHy/bN1+KH8H3lxPL8t1sA+d/SD4T673DGs7vX/DD8FmeNdx8
GB9mv7zjx+QzaxF882tHc00m2MD5W1tqLmyeaeNwXeiT43k1BH/9lNSOZFtN
OF/gyYKWmWnKDtKvH5lJMVhi8GHqYXyYeRpvefcZcFrC7dtfK2uR/gTBX256
1tpP0QqDD/OPRrvYzXPXLeH+fbF9PfPzOxZwftaekskSLRao4aOB4EemWN/3
1zWH842erVN98tgMbj6MD7N/r8FMLQlVczj/sYjsyaf8FqjhJWkBTw8wPiy9
wPiw9ATjw9IbzDxYeoTZB+PD3IPOh6V3mH8u3MoVn+UtCvcvjJ8fz35OshHB
h4UXjA8LTxgfFt4w82F8mP2w+ILxYfEJ48Pi+2D3viaTxwj+42CGnvQNEnB+
uRf76/9nlODpCZ0PUw/jw8yDpVeYfbD0DOPD0js6H+YfWH6B+ReWn2D8M5KB
t6R5bOF8WH6E8WH5FcZHL38ANgbyfQ==
             "]], 
            
            FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 
              1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {
              1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}}}, {CompressedData["
1:eJxTTMoPSmViYGAQA2IQLT71CmcGl6ODiTEIiDrA+GlgIObQvjz8lNEaBzg/
HUQtc3A4UCtrkb4EwU/yUrl4ukMCzoeYp+pwRGFDUcZCe4czYKAC50PkVRxy
TBq2Oxg5wPn/QcDeweHF75UfL/Ei+CU2aQuM7inB+e16K/JnTpaA82Hu468y
W22nj+BfqXipZjjDHoMP86+NzpVZz97aO1y4lSs+y1vUgcd//ZRUBwc4H+zs
HATf+wS77exaBP/6hy9ekdcQfPTwBAB3JZLf
              "], {{33.399599999999985`, 
              12.493799999999998`}, {33.399599999999985`, 12.8648}, {
              33.10269999999999, 13.100000000000001`}, {32.8059, 
              13.100000000000001`}, {32.459799999999994`, 
              13.100000000000001`}, {32.199999999999996`, 12.8277}, {
              32.199999999999996`, 12.493799999999998`}, {32.199999999999996`,
               12.172299999999998`}, {32.4719, 11.9004}, {32.79339999999999, 
              11.9004}, {33.1645, 11.9004}, {33.399599999999985`, 12.1969}, {
              33.399599999999985`, 12.493799999999998`}}}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
              3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
              3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1,
               3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxF1HssVXEcAPCTWpLHIrroyr05LEOPe28qpO+5v6Srbp6T6HnrXpaJRWut
oUgqjxVpni1EaZbHojKPaxjyKLHeMimjx7oem0qlc8jv993Ofvv88Tvn+/t+
v+cnVIT7KLUoitrBPty6dW9QRYPedvh0JP+FxJOGebuOvC79VUuD8wL5Bf0p
BPqeZdeVIdbQ8rfy7Lia2M36lFZ2BHFhmtMCuQTB5fLB0YxKGuwr877fWYVg
WcCWB23+NGiOdh7YpZFCP734fMYQDQP1BrniGilIxFxYg7vXb9PIWOL1S0r5
gZMMdicXyQxcWns3PCvdCvt0U7VbVp0QexPTF00pBHDaQWg52cyA33SUi4qy
BGOL9k/b+tj9LrIaVdoqSPqjnPrYyADEfWjNfGsBLzWTHvuKGcjMYuMMH3sR
X5qRnWeOrblu8GLmNQ+CpGyl3jGg8KB7Ou6ugDsbu5z3jDLQ/SaMlx26Ao40
9dop8xkQtjE64i4T0KXXxCTvY2A9bywv08QY+8vFsCRRjiG2aUafTkiBHvTK
FcsCRufPrw21PjeEqUVS7Nm8gxD27DqBoNTI3iDYVQ97yJdKDi43xJ4ZO1gl
GjSC3GZB+ckRBPzSmcjMMhPYXbx0h3UKgkduWfoiWx4ccx7wTNmGQDUbpvAz
5nht1IQUe67/xF8+OJqrlxOHH9LuNtMhXuhv4FD5jYFq7v0yM4j3luWde/+/
P2oziJ12iuh+xoA6qT5OUmiOHcB72EPdXIl9mKt3CB+48pq9YSCRmwexBUTf
r1bEsvX6ytWT7afkYI1MTyQF5ez3+dBq65TWEU6sSWj3azxH/HTKd6hIF2Hf
rmvk2UQiCI7SrhAXWWLnCD67UiVC7I56u7gZ+WpwuHrrxwYVgtoRu51iRyuY
Lhl7LhehuXn6aTV3jhMIru3/i359o8HFvi97uIq4jutvHfH+MPaPayLuT09M
COwg1mx2cz/ZgyDCKF79ZJAGATN2tLMFATtFj0PbaYi4kvpxvAEB7XE2fl0y
8aMe6r2WjLi/PMxbNcHm90TUXNHN5mskmxTds4JX3LwPE3ux7bIZJ56/LzQF
ZYKuNuL5++QfYLLdAA==
              "], CompressedData["
1:eJxTTMoPSmViYGAQBmIQfXqh67bPrM4Ou19oexhvU3SA8dv1VuTPdEbwS23S
FhjZKTgcXLHEz+G1k8PeWlmLdBV5B+FPjufTzjo53Dff9+3MJlkH7+pmfZ95
Tg4mxiAg69Bcc2FzZC2CD6Y+O2LwT7vWqKfJKsL54U1HH55Zj+Ab72q+MVNJ
Cc53X3N0OYOGsoO1zpVZz3idHO5oyq75f1nZISb36L9N2k4OZ0CgR8VB9Unz
vLNRUP4ZFYfKiBWmZ6sRfJj/0PkfFq1XOOuh5IAePgDTVYQG
              "], {{
              39.300399999999996`, 4.36328}, {39.300399999999996`, 
              3.6601599999999994`}, {38.39769999999999, 
              3.0999999999999996`}, {37.3059, 3.0999999999999996`}, {36.166, 
              3.0999999999999996`}, {35.29959999999999, 3.68398}, {
              35.29959999999999, 4.36328}, {35.29959999999999, 4.45859}, {
              35.32339999999999, 4.923439999999999}, {35.77459999999999, 
              5.2332}, {36.035500000000006`, 5.3999999999999995`}, {
              36.14259999999999, 5.3999999999999995`}, {36.97339999999999, 
              5.3999999999999995`}, {37.95859999999999, 
              5.3999999999999995`}, {39.300399999999996`, 
              5.3999999999999995`}, {39.300399999999996`, 4.36328}}}], 
            
            FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1,
              3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {
             0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 
             0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJzIGYC4nPfgx8vdXZ3MDEGAVEHGD8NDMQcFqRvflX8
1Q3Ov/Hhi1fkOQT/DBi4Obxpy+02ui0O599edIZtZooCnJ8OUr5MCc7vWB5+
yihE2WFrS82FzSvdHGb8n1D3W0rFweCuCltjrZtDmb+cWBavqsO6bUn1N03d
oO5TdTCN2+XJw4Tgr+m+ncFQ74oq7+TqcOFWrvis2coOGx6+nLpJx9XhvXR8
ddpNJYg6bUw+RL+2g06q5KOIcBeH45pWk07/14Lzwe5P03KYc0RhQ9EBBB/i
HxeHLSfK9s23QvDjQ4LUF3Bqwvmeu9I+nZ0mAefDwq8yYoXp2d0IPsw+dD4s
fsLe6O9Wr3eB+M9b1OFifjz7uYsIvmJORdXSPwh+SInK9P8arnD+BVD8ViP4
P+uy9pQsdoWbD+PD7H+xfT3zcxcEH6IOk1+8VfT36T4JOL/ci/31/z0KcP6K
/JmXUx2VHWaCgSuUVnHwOcFuO/srgg+mAt3gfIg9bg4MIJCgDOeDpV8qwvkw
+2F8lPQahuB/2RCQPeu7KwYf5v+dt7r+psq7wcNn2QsPvf+FCH6Mk92Lm3MQ
fMkD0QqOJxH8qc7dOc+l3eF89PwFAPyRb9A=
             "]], 
            
            FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}}}, {{{
             46.900000000000006`, 7.599999999999999}, {49.99961, 
             7.599999999999999}, {49.99961, 8.199609}, {46.900000000000006`, 
             8.199609}}}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1,
              3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJdIGYC4v8gYO/rYLzmUe8ZZQUHGP+jJsMx4wwEX8Hx
Y/KZXgWH8Df6u9X1EfyCrr4nn+QR/C+3rzcWy/k6nN6n3fQ/F8F/4BrvOMtR
weF968mQgwK+DjuCrSL+L5dwqL1pWxmR4OPwwHzftzNGog4xTnYvbp7xhvMl
pl7hzEhC8CHu8XKIUY2QOWcjDuenv93GfXarEpxf82lDQPYuTYc125Lqb8Z6
O5wBAy2HO5PbW6NOI/g/YnKP/svygfMnLPhh+Oybj0MaCCzTcPjKFj/DR9TX
wWN/rawFuyrEvRK+DkBXrvm1RwXOf8O7z2DmKhUIrYXgw8IPnT8F6IzLexD8
G43FblPMVOF8F5nXj8xuacH5KWdivU+4a8P56WAHajtcmfVMdrkBgp9ifd+/
Vx3BDxfffpFBzRcSHlHaDi+2r2d+LuPrEAESl9N2cFibea/wko9DnlDzgVOO
mg7PezTe8vb5OORw/lyQPlnL4Yn9kvv71HwQ9vkmCUTs9Ibz/eXEsnwXe8H5
JsZAsNnT4cLVsDf6s9XhfFj8wPhvKs44pNZIO1z/8MUrcpmXwxqW7sMz/wvD
zYfxY4Gh37PJB86H+d/cv/TE2Q9ScD4s/QIAQsVfgQ==
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1,
               4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}}}, {{{64.69999999999999, 
              7.852339999999998}, {64.69999999999999, 9.379690000000002}, {
              63.534399999999984`, 10.600000000000001`}, {62.15549999999999, 
              10.600000000000001`}, {60.7293, 10.600000000000001`}, {
              59.60040000000001, 9.344140000000001}, {59.60040000000001, 
              7.852339999999998}, {59.60040000000001, 6.336719999999999}, {
              60.788699999999984`, 5.199999999999999}, {62.14379999999999, 
              5.199999999999999}, {63.546099999999996`, 5.199999999999999}, {
              64.69999999999999, 6.36016}, {64.69999999999999, 
              7.852339999999998}}, CompressedData["
1:eJxTTMoPSmViYGCQBGIQ/eX29cbiZ/4OF17wJaWfkneA8WfMBAJJOTj/TVtu
t5G0tEP4KaMjG/f5OzQLpd36d1XCYYNe3mLGKf4OB2plLdJbxBxsdK7Meubr
7zATDEQdVHb+af8ijOBv4Clc033bD86fsOCH4bNpfg4RnGLtxvFiDuw/F6Rv
zvJzWK9wNsJkr4QDj4pGXY+jn4P6J5WXs15KOfwHAXs/hwPd+5pMDsvC+TD3
w/ira63kjC8owPku81RijT2VHOa+X37MO9/PgaE9YGlavLKDePF1oU8z/Rw+
AIXNM1UcpkiwhPHd9XM4AwYqDuJTr3BmCPnD+TD/ofB7/R3sXtxc8ytGxeF4
2b75Utv9HSoiVpiezVaGhx/YPn8lOP/9FL5r/08qOKCHPwBQRMdf
              "]}], 
            
            FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1,
              3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {
             0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 
             0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJzIGYC4i0nyvbNPxfoYGIMAqIOMH4aGIg5zG1QO9S2
HMG3cHUv+jkZwQdrA/LftOV2G90Wh/NvLzrDNjNFAc5PBylfpgTndywPP2UU
ouygzs+9dVljoMOM/xPqfkupOCRb3/fvzQ50KPOXE8viVXVQ1qjr2ekOc5+q
w/PfKz9e0kXwV5+/GvbmcQCc//SC0u2fxwIcpnf/8Dsjpeyg+Pdb6YMDAQ7v
peOr02YqOUi/fmQmhYUP059cf9O2MiLA4QwYqMD5EHkVB2n9uypsvQg+xD8B
Djrfpt+dzI7gu685upzhhhKc3663In/mZAk4HxZ+nD8XpG/uQvBh9qHzYfHz
/VDKqoScAIcLt3LFZ3mLOmxtqbmweSqCf5+Js0t+NYL/nS1+hs9BBH8zKH5f
IfjePEza7f8Q5sP4MPsPrlji53AewQfH4zFM/j3zfd/OTJKA81Puix78f0wB
zmcAgQBlh5kg8DPA4Q3vPoOZq1QcPm8IyJ6lHgjng+VDEfz/IBAPTC+g8CtW
hvPDm44+PPNfEc5vFkq79W+qBJyPkl7DEXxX1VKmWRqYfJj/Na0mna63CYSH
j7zjx+QzqQj+77evD1hWI/i31/yKyZ2I4E/PE2o+sAvBR89fAFb2abs=
             "]], 
            
            FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 
             3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0,
              1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {
             1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGIZIGYC4vmr196IPxbkwB8bcN9IXdoBxn/TltttdFvW
IbuiaqnOZkx+xcXwCWk+0nB+h96K/JmfxR1aai5sjpwb5MAABmIO/0GgHsGf
3N4addkHkw82v1oKzj8DAkDzYfw0MFBxWHDN5L3FTkz+CU2rSaf/q8DVo/Pn
2+hcmZWm6ZAQEqS+wBLBV/z7rfSBRZADiJpjqO4Q6Dm3QU0uyOHR8Rm7p31Q
cVANZl086Vagw6nDTmsz7yH4MPvB5kkGYfDLD29znekrDedffMGXlP5K1EFW
LMv3cxDUf2dEIOFTjeCDqTUIPiw+NiicjTDZK+6AHl8AURDIqw==
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 
             1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1,
              3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGI9IGYC4gkLfhg++xXssPtW19/U48oOMP4dFbbGqc0q
DhFtFteOPg12MDEGAVWHA2/m2egcQfCnnK732N+I4Et4BPyRyA52aF8efsro
i5JDehoIBDuUH97mOrNWyUGDn3vrslRMPkz/8srjmlZMwQ5nwEAFzofIqzhs
nvt++TFjBD8hJEh9gWWwg8636XcnsyP47muOLme4oQTnt+utyJ85WQLOBzsr
TcxhJggYIvgw+9D5EPtEHc5/D368VDzY4cKtXPFZ3qIOtfamcbscEfwXaoYc
ayIQ/JaaC5sjcxH86Zt4CtcsRvANfJZxuW1FmA/jw+xnAIEFCL4ESxifbh6C
P6W9NepyTrCDwq4F+1LfIfhV93/cMl4tAef/BwF5BTg/OeKo9MxyJQedVMlH
Ed3BDm949xnMXKXi0Nn35JP8MQTfN0kgwvIMgj8ZFN9nEXxwNF0IdjhQK2uR
vkQF4o/TwQ6bQPHUreJg4epe9HN/sIPHfpACBL/n8Mz4sweV4fzVtVZyxgJA
vtSBaIWLsPhXcnj4cuomnrsIPlj9awQfll5LbNIWGMkh0i8sPQMAyr41zQ==

             "]], 
            
            FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 
              3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1,
               3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGAwBmIQDQYNoQ4ZJewbjVMlHWD8P4/3ZqUqyTicAYEcTH7V
/R+3jL0l4fyUiKPSM9PFHN7w7jOYGRUKMYdBzMHC1b3opz+Cn1NRtVTHGJMv
u+Z/8Yx+CTh/m+tMXiNPSYT69oClafcV4PzTrjXqabpKcL5w5aSSsyrKDrfW
/IrJFQx1+OoV2WYhpuKw5UTZvvnfQhxesZgImt1Rcfhh+Gyd6pUQBxNjEFB1
+HL7emPxJgT/wvfgx0uLEfydt7r+pjqHODDzLfQ6+04Zzp+93OpJWoYSnO88
oVkobZeiQ6bv577ggBCHPS+0PYzTFCH+j0fwr3BmKOWUIPgTFgBd1BTiEPy7
xCbtAoIPkVdC4ys7fJK/lB+fjuA/EZE9+TQawW+pubA5MjfEYcOU1I5kWxUH
BcePyWcmhjjMBAMVh7bl4aeMNiD495g4u+QvI/hg9/4PcdibX/N25lZlOP8t
KF5nKcL51aD4X63gALTt6860EAfXeSqxxjMVHFiFROyP6QD118papLvIwvlA
01QZV0nC+R5rji5n+CHqEJt79N8mYHiD09EZEYh5ixD8hJAg9QVXEfwlk6wY
fX+EOCiecOQ0XivmICeW5fuZLdTh1D7tpv9vJRxM43Z58nCFOszdelvPZLqY
A8vzHo23iqFw/QG90/OEnBH8juTYO27BCD4s/U+tDWf5Xy3qgJ4/AAI3VI0=

              "], {{83.99959999999999, 7.002729999999999}, {83.99959999999999,
               5.818359999999999}, {83.1137, 5.419530000000002}, {
              82.59179999999999, 5.419530000000002}, {81.9973, 
              5.419530000000002}, {81.49959999999999, 5.85469}, {
              81.49959999999999, 6.434769999999999}, {81.49959999999999, 
              8.030079999999998}, {83.56290000000001, 8.175389999999998}, {
              83.99959999999999, 8.200000000000001}}}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1,
              3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 
             0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxl1G1MU1cYB/DiiJmbdh20dJGWttA6Fbd0XByuzvlHxDEiMI3nWBWUUajx
FUQxNLIMgchGwRicCVVkCyFQtShRwZc5ZCoR1nZDsxnnVBKtm5hppPqhDkFv
L3JP1Cc5H34f7nPv83KPLid/cd4bEokkhD/p/BnHn3iOj90Uns7YsmdpkRiz
K2yGdPVNNUrmzlx52kbRZe8si7doYPCVN3gLKRIyinq8fRqYQtIqJi2lCLfV
bvE2adFsuzjNNI9ifoM+i+vVwq+5nL/qHYr+Tmk9F6aDQt17Z26AQOb7scLx
sQ6zkj8vfHKWwGZ2zvTamfe1mHzWQLRoeTD/8Rik5cjMn/QReITQ4+7QgcHL
Ciq6aqfPr1nLXLcxrLxrI4VDiGg01vJfXEChSRy0eG7o4GxKR/gmCndyyfvW
Vh3KFn2xv3Qrs5CmmHlhwneJ2dtfd0wW98TqZraYuyMdCdGiS4dMBb859aIb
kzseDcsNooW+cwY86D0/r9XGnDu7P6NmM/OtgT1HJ+ZRZGr5Alx6ZG7oHjm6
ikLuT/zdWqRHz+mTNeNTKEInVGksUgOMb7pUy43seZ+cH4CSWfZ2e7PtJyJa
6PcPL/rdFCN6n/beZ5Jl0aLfDc4vgvlG24ZF1iQdjAub31rwM8Ghr01RXIEW
of9WT73/J8GWdsWQe6cGgY/+OWx4SIBd5WFWkwb+ti/X7Q2nKDrfkezwRqE2
cyTp/zkUuan6S+6UKEiCwdcjfI8+Ct9asq4vWEFR+aEz38GpMfxH8cCUNRT3
v5deeWZTjdbB96vvrjRn9dpI0cK+yiaLNitPXJKMKEf7wfevOPj+VgWWGKcf
CFcxV6feC40fIKJ3tCz9Ne4CQW5wvpVK/BJcoGMEZ776u9FjVaHrv4ZPZ7QR
lPQHrnGxapy6VjWcd4Tg6eDK9rjE1324I+ebv1pf7PN6NbKnuWUXDzLXX9C2
FTqZx/r9qmvM9owQI/MHysH9dUQl+r1K7uze2wrRfDWT4iYoXs7nkeNxcB4t
zNv3JNnXH2IW6nMR1Af/z6vy0f6fIpgl3AcK8Nu4zX+GjN4XMRGi6+yBdI8p
AoFzuQezewhSXN0tkkAEKkr6ji27w/KnThwXWymlooX9jGSuL51ybsc65rH7
StifGiVevc+eA7cTHk0=
             "]], 
            
            FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 
             3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0,
              1, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {
             1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGIZIGYC4gWr196IXxbuwB8bcN9IXdoBxn/TltttdFvW
IaeiaqnOZEx+xcXwCWk+0nB+h96K/JmfxR1aai5sjqwNd2AAAzEInYDgT2lv
jbqsg8kHm18tBeefAQGg+TB+GhioOCy4ZvLeYiYm/4Sm1aTT/1Xg6tH58210
rsxK03RICAlSXyCJ4Cv+/Vb6QCLcAUTNMVR3CPSc26D2L8zh0fEZu6d9UHFQ
DWZdPGlXmMOpw05rM+8h+DD7web9xOSXH97mOtNXGs6/+IIvKf2VqIOsWJbv
ZyOo/86IQMIhBsEHUz0IPiw+NiicjTDZK+6AHl8AqFu/zA==
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 
              1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {
              0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 
              0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 
              3, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {0, 1, 0}, {0, 1, 0}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxl1HtIU1EYAPAlFv0RFtO5LSZt89W0ljhp5IM+S9Ey8rGs3YOQhF7NMsEt
MIlS/CPDIvP9CEkpVBwqgUJmJmYJvjIQQTOmpbSgAkt7kHo7Z3PnkH5wufy4
nO+c853vXNWFnKR0F5FIdAw/5D2o7MzNXEJQJOZn1pPl4HSzLVYrNDLParws
gvteiOr+sTZpY5Ydeu+zY36r/ReKGsaG5TAUp78dOYdgPvp8ZF2iHIJ2WhRo
FsG3Crcp4ZonuJ51O/jkFYI5fd/P0WAJjJKwMO9PuTewUsy8Opn32a8QQbG2
JafWJIXLn/62LuUj6BAfcMtYlwOkLk6oTQhievjvY1VejvzZCFJ8jYrx1X3Q
v4IzZiGwknwDSgjR4TAgMJh9qoUCFcTfrb4ijkMQ5FtmSx9UgUBCj6BGfGI5
OEsNMfP5Hu27ETyzBcbqXqvhDlkAh/ffmZ3IG7wd+coR9JrLZa5TPtThVpy5
3Y/aXt9tGjCmhVnjIxAMaULLRoQAx3xvOOqO3Mz7X78YtziDJxEALY9Og/sa
c5sCpYXpOepaEkc4eNDk/XTVn/lw+POkqkgNtcIimGo6ZNQJ1uDmkQ+eNJ89
He9J53PauZ7Ntu9TJ4GTu1wCb60bYWImW1oXJwH89frRCI76z42sXrOBuYTU
8yKzQM67lRmfTlF/D0fzO+2c/8VwY3R3G7MWt2PhVWb7MBMHIhJzzI5+l1E7
6qcG6fT4L8MIs70fbcwVMtxh23E/dv32EHmroYbUT46gvjl0gc9TwSyevlK3
0V+lyv+9h7majJtWUDd0vdOGSOXUUaXkhkohg9QvGYGy52Ff+rgEznx8XD+Y
imC5M+FSnVQC+LalLhYgsLiWvKwV3DfqwXyz8jguMbPzfue9PVfKn5LB5v/B
P1XKx8g=
              "], {{105.238, 11.349600000000002`}, {105.238, 
              10.283999999999999`}, {104.67799999999998`, 
              9.499999999999998}, {103.132, 9.499999999999998}, {101.8, 
              9.499999999999998}, {101.8, 12.7094}, {101.8, 
              12.991399999999997`}, {101.8, 13.1383}, {102.05, 13.1871}, {
              102.157, 13.200000000000001`}, {102.514, 13.200000000000001`}, {
              102.75200000000001`, 13.200000000000001`}, {103.71499999999997`,
               13.200000000000001`}, {105.238, 13.200000000000001`}, {105.238,
               11.349600000000002`}}}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 
              1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}}, {{0, 2, 0}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["

1:eJxTTMoPSmViYGCQA2IQveVE2b75WjEO6SXsG42fSjnA+Gf2aTf915V24I+w
3HJCLcZhvZAOX3qctAPH9cUFtkoIfkz/oa8aMgg+WL9UjEM4p1i7sby0w98r
FS/VJGMc/oPAfSkHGy6gAawxDg5Nj47P2C0GUX8p2mEmGIg6dDgmPL2wCcHP
ef575cdJCH56GhC4RTu4zFOJNf4pBud77Er7dLZMHs7v3PpDhMFYweGuf+/0
PKB7YHwTYyDQRvDPgIAOJh9iH4KvCrQt7beSw5vAHXKtzDEQc4xVHY6DvLs8
Gs4H+9MfwQfr54l26Lbx3JV2SAnOB4f3Unk4X7hyUsnZFEkHdUOONTJR0RDx
MyIOLQdOLXRdh+DPOaKwoYgjBs6HxRd/bMB9o+eSDujxCQCls9b5
              "], {{
              111.89999999999998`, 8.299999999999999}, {109.07900000000001`, 
              8.299999999999999}, {109.17399999999998`, 10.184}, {
              110.21699999999997`, 10.399999999999999`}, {110.54799999999999`,
               10.399999999999999`}, {111.81599999999997`, 
              10.399999999999999`}, {111.88799999999998`, 8.70781}, {
              111.89999999999998`, 8.299999999999999}}}], 
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
              3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
              3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1,
               3, 3}, {1, 3, 3}}}, {CompressedData["
1:eJxF1H1IU1EUAPCHSRKo5VBna+p0rzBWGZslkehZoqUZZkUU3Ftr5DZqZtDK
vozS/MLZpyPnMLMQLEZalK0wEytcnySMwELLzL5UUDRIw9Z9b3rvgcfl98e7
595zznsx+vwtuX4cx6WTR1hfC+HEMLin4X1CNg+zTv7R45xq42GzK6pkqAFD
UHZzda5pMXCqsvCeUubIkqEc1y7mwn1tlsuAoaKl/6ftLg/+24OX312FYcGO
Nffc23nYEOinKovC0MvPPWMb4GE4hySYgyFBI8RiqJfF9/LfELW43zVm8Xxm
BOUrmvLtl5XUBU9b0+yPY6gTtZ5CTq+AVRVa3WA5gm1/LUkGLhqsVw5Iii+Q
95MyHhkuRUFV5+84VIYAir501XyMhBo7iWNoZpVT+8vX2WrrZNSj1cHvvT1S
X75qBPpMvvtVUzhkV5EEDgRvP+RJa/eHQ9eR9npZAYIYt3ae5k2Y7x5bEayU
jtXVhIVSD5XmVaodIdQRNs880/VAup/v/gEw7Tn6c8kkc5aeVHYbpvYKUY/B
KVkWbEwOpB7YylmNLSHU3rFd99X9ErjnJgesxSB3eg/VNIfBtbTW8WkzBlea
PUi9VOrrRzoGgxgR8LXR8UyhYBb734eon29MrNC2MJu//705dovZeHHkZEod
glZh/4yFsKC442WDbaY/HQthvjAn5xB0VLYXJdyQUe+QPujmri6i1gn1Nsnh
zylhQBCUCfOgiQTQDb6LJfUaFupJ+nnallppfoIgV8wvh7MkXVofs7jfN+ZN
Qj2XYWqxXrsxGC0BdzSN0dQOxa9k7mYM9at2VZF3UyzcHycd2omh7Ydqg2a1
Evau/ZRdlYJ9czOphCxSHh3GcBH9S50a4cEjJDzDfJiMS3wJs1jPcmYTuW2E
lVmcr/MYDkpIIft5+Hw89Pb6Cgxxp6wP97/gffcg3yufeaI43srs6ub6/DKY
e1vycgzjSpiIQ+c7q8h5JRkT6ltK37ntzBYTaWA98+z/YvR6s+KNm3n2f/If
nyrxOA==
              "], CompressedData["
1:eJxTTMoPSmViYGAQBmIQfcU3SSBCM9Zh9wttD+Ntig4wfrveivyZzgh+qU3a
AiM7BYfyl2qGHDKxDntrZS3SVeQdWl4H7pDjjXW4b77v25lNsg7yG4oyJn6N
cTAxBgFZhykSLGF8TxH8/yAwH5N/2rVGPU1WEc4Pbzr68Mx6BN94V/ONmUpK
cL77mqPLGTSUHXzMOx0T1sY43NGUXfP/srIDyLmWe2IczoBAj4rDhrnvlx+7
DOWfUXGwNY3b5fkEwYf5D53/YdF6hbMeSg7o4QMAgJOMwA==
              "], {{
              117.89999999999998`, 4.36328}, {117.89999999999998`, 
              3.6601599999999994`}, {116.99799999999999`, 
              3.0999999999999996`}, {115.906, 3.0999999999999996`}, {
              114.76599999999996`, 3.0999999999999996`}, {113.89999999999998`,
               3.68398}, {113.89999999999998`, 4.36328}, {113.89999999999998`,
               4.45859}, {113.92299999999999`, 4.923439999999999}, {
              114.37499999999999`, 5.2332}, {114.63599999999997`, 
              5.3999999999999995`}, {114.743, 5.3999999999999995`}, {
              115.57299999999998`, 5.3999999999999995`}, {116.55899999999997`,
               5.3999999999999995`}, {117.89999999999998`, 
              5.3999999999999995`}, {117.89999999999998`, 4.36328}}}], 
            
            FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0, 
              1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {
              1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
              3}}}, {CompressedData["
1:eJxTTMoPSmViYGAQA2IQ7dKd8/x3YZyDiTEIiDrA+GlgIOZQI7LO/aETgv8f
BOzjHA7UylqkL0Hwk7xULp7ukIDzIeapOrS8DtwhdzXW4QwYqMD5EHkVhzML
Xbd9Zo1D8EGAJ87hxe+VHy/xIvglNmkLjO4pwfnteivyZ06WgPNh7lO4/bMu
iwXN/ZdiMfgw/x71Nu90fBHrcOFWrvgsb1GHBUDn/AWaB+OD1Skj+HdU2Bqn
aiP4YP+GI/jo4QkA4fWd8A==
              "], {{121.09999999999998`, 
              12.493799999999998`}, {121.09999999999998`, 12.8648}, {
              120.80299999999998`, 13.100000000000001`}, {120.50599999999997`,
               13.100000000000001`}, {120.15999999999997`, 
              13.100000000000001`}, {119.89999999999998`, 12.8277}, {
              119.89999999999998`, 12.493799999999998`}, {119.89999999999998`,
               12.172299999999998`}, {120.17199999999998`, 11.9004}, {120.493,
               11.9004}, {120.86399999999998`, 11.9004}, {121.09999999999998`,
               12.1969}, {121.09999999999998`, 12.493799999999998`}}}], 
            
            FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {0, 1, 0}, {0,
              1, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {
             1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 
             3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3,
              3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 
             1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxl1GtIFFEUB/BJxRVREXF1sYe6u0ah5auw6OGhAgsxqw2NCGcwtUV0DbW3
WCmlIZG2yLohRgWaIRZ9ChJTQj/IYlYfzLVNjCgiRf2QD4S2e6+ce8C9MAw/
duc+/ufMxBdWnCr2VxRlA7ss7PJj1/u/2849qNRgVzofekCXiBEFV39vTQ3S
yA5bRP1AHvkCvzHP3C1vSpuMlp586gp0FsVJi3unUbqxK38k7bQJ4l5VWlty
NGjzNteuxphhKve+w3ZIg8u5W6JKQxOge+FTTmEK7i8BoidGlywmcpW1ZbbG
n7z5zp+Tb36qcG1q2Z3+1gQePp9bhaIp/aB32AhZ09cjez+oMN81nJ3RbYbm
2ZrM3Z2qfP7XKlvxElnXs+lsUSJZ/D9MBUfT8nFXjAnm2fbCg1SY26jeKHEa
oX2OTazzNT6vJDZETXQUgEsMs/Ta72ZYri3tq/5MbnOyMVEASYsOj11HzuoZ
6lK+GKUbdj6vcNoN0lifED+2wEcyrrfeWH9R39cFMOYuj36UrQdrX7Xd8JXM
Y7u3QBZ5svOhDckec2Aq+SUr7+wRVc6PxvXD6wdGnujJIpYQX3/L6F90PTRI
r9UzTlrh44QJvHxkqjAT2p/ifGEGvv0AG/kK7+d2crHoSxUaeX5VJun8uqFp
lzdeuj6ixP2v1SCN+xPuIP8YM06u2HyN56+J7M2arqN8WPec2dtDFvUbJCex
8oyOk2+y9rArmvQxXuBgen/RuH4Zb+jvtJ+1/vA15ovGfNGY7wrvT50m87vV
eripLJYs3pcMsqjPfk3mi8Z80ZgvGvcnzruHfH4f+0LE+hrPz9vv9nbKxxCQ
F7bjIPnd45hkz1Eyj3fJQr54IHj8mZW8/vv4H2ZJJ4M=
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 
              1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}}, {{0, 2, 0}, {1, 3, 3}, {1, 3, 3}}}, {CompressedData["

1:eJxTTMoPSmViYGCQA2IQ3TM9T6hZItEhvYR9o/FTKQcY/8w+7ab/utIO1vf9
e6eLJTqsF9LhS4+Tdtgu1/o6UATBf1glss5dEMEH6xdIdAjnFGs3lpd22Dz3
/fJj/IkO/0HgvpRD4A6gAayJDg5Nj47P2C3m0AtS/ybBYSYYiDp8D368dPYd
BP+lmiHHmjMIfnoaECxLcHCZpxJr/FMMzvfYlfbpbJk8nN+59YcIg7GCg/Lt
n3VZQPfA+GdAQALBBxsricmH2IfgqwJtS/ut5KAR03/oK0uig4kxCKg6gJx/
4FoCnA+mViP4YP2dCQ7dNp670g4pwfng8F4qD+cLV04qOZsi6XDc27zTcUMC
xJ1nRBxKJkuwhN1C8BumOnfnsCfC+bD44o8NuG/0XNIBPT4BTpDLxQ==
              "], {{
              135.99999999999997`, 8.299999999999999}, {133.17899999999997`, 
              8.299999999999999}, {133.27399999999997`, 10.184}, {
              134.31699999999998`, 10.399999999999999`}, {134.648, 
              10.399999999999999`}, {135.91599999999997`, 
              10.399999999999999`}, {135.98799999999997`, 8.70781}, {
              135.99999999999997`, 8.299999999999999}}}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1,
               4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}}}, {{{139.29999999999998`, 
              9.905859999999999}, {139.29999999999998`, 
              10.239799999999999`}, {139.01499999999996`, 
              10.499600000000001`}, {138.706, 10.499600000000001`}, {
              138.34699999999998`, 10.499600000000001`}, {138.1, 
              10.215199999999998`}, {138.1, 9.905859999999999}, {138.1, 
              9.53477}, {138.40899999999996`, 9.299999999999999}, {
              138.69299999999998`, 9.299999999999999}, {139.02700000000002`, 
              9.299999999999999}, {139.29999999999998`, 9.559769999999999}, {
              139.29999999999998`, 9.905859999999999}}, CompressedData["
1:eJxTTMoPSmViYGCQBGIQPRMEMhMdPNYcXc5gIeoA4//9GLfViFHcYfYRhQ1F
GYkO/8FA0kG4+cCphaEI/gWl2z/rvBB8YxBwTnRI8lK5ePqFBJy/hqX78Mz5
4nC+xieVl7M8xeD6TcASog67SyZLsIQh+JEp1vf9YxF8sDXxiQ4xqhEy52pE
HQJ3yLW+Tkx0qDi8zXXmWgT/z+O9WalMInA+AwgsEIDb92HReoWzElwOVype
qhl6JDp4n2C3nR3KCeff0ZRd8/8zB05+vOOsjRlVHA7qhhxrZOD+Z3cASXP4
IPjyra8Dd/gh+LDwFamcVHJWhd8BPfwBB+G11A==
              "]}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
              3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {
              1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 
              3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 
              3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGDQAWIQ/X75MW/zh0kOThOahdKkJBxg/CQvlYunOyQcwi23
nCi7h+BHpljf97+L4M+X0r+rcgvB/6oR03/oZpJDVtOK3wwpEg71WXtKJt9I
clj+wkPvP6OEw2QJljC+q0kOsmv+F884L+bwHwROJzmsAMkfFHU4DDYAwU9P
A4JtmPxOG89daZck4Pw1Qjp86fukHUpAFgDd68xpnPv/lIIDyPn7nic57Mmv
eTvzqjJO/hkQ4FFx+B78eOnsJwh+w1Tn7pzHCD6I+/w+gv86cIdcK5DvAgq/
X8oOpxe6bvsMDB+Va4+CGXqUHfaDAgjo/1KbtAVGdUoOS2cfUdhwLslhZa2V
nPECBbj775rv+3YmSBbON97VfGPmJoR8Rgn7RmNWZQeFDUUZExcmOZgYg4Cq
w/bPf69UVCL4/Lqb5r53R/DB+sWSHFJB9DFFOP8vKNz3y8D5N6VrEo2mSjg8
vaB0+6cW1H9nRBziQQKBCD4wttkaMxH8GnvTuF2tUP4bUQdQ8B1ZkOSwXuFs
hMleCQd1Q441MsuSHGJUI2TOyYg5gILr9UaE/t8rP17yPYTgg7zz8hqCD0uP
b9pyu42qxR3Q0ysA8hROdg==
              "], CompressedData["
1:eJxTTMoPSmViYGAQAWIQ3TDVuTtnfpJDj9crFpOPkg6nF7pu+1yb5LBB4WyE
iayYA0j6eXySQ8Xhba4z14o6WN/3750ehOCH8ulummuO4P8HAf0khzdtud1G
uyXg/D+P92alMknD+V82BGTPEpd1mH1EYUORRZLD7UVn2GayKDpsl2t9HeiS
5OAsfmX7mUglh4+XfJMEQoDmFW8V/c2t4rD8mLd5Z2aSwxkwUHHgj7DccqIK
wQebPx+T76payjRrhyKcz8C30OtsnDzE/UB+f0S3P+MGaTjffc3R5Qw7pODq
30/hu/a/UsoBPbwAgFOh3g==
              "]}], 
            
            FilledCurveBox[{{{1, 4, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 
             1, 0}, {1, 3, 3}}, {{1, 4, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {
             0, 1, 0}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJ+KN0hdvPc9/wUh/dT+K79P6nkAOObGIOAssMRhQ1F
GZkIvsfDKpF1yQj+lhNl++Y3JcP5D4DS7rUIfnoaEJRh8lezdB+eeV4JzgfT
aUoOFp2OCU9rEHyY+TA+zH4YX0r/rgpbJoIPcz86H91//LEB942Oy8D5M2aC
gCzcvzA+zD4YH+YeGB/mXxgf5h90vonjlVqGSzJw/n8wkIb7F8aHmQ/jw+yH
8WH+hfFh7kfnw/wHAGzR3V8=
             "]], 
            
            FilledCurveBox[{{{0, 2, 0}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 
             3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {0,
              1, 0}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJZIGYC4n3zpfTv9qQ6mBiDgKgDjJ8GBmIOBbZc1xc3
IPgu3TnPf8ci+GdAICbV4U1bbrfRbwR/JgjslIDz9bVWCl9g0YLzczh/Lkif
jOBfyI9nPzdTy+FBlcg691AE38E0bpenTypE3RtNB4O7KmyNlqkO/8FAw6HD
MeHpBSFMPsR9Gg5vAnfItUoj+GBKD8EH+9s51eHrzltdf58i+M1Cabf+bZWA
810mAEV+iTmYAJ3D44Twv+u2z3+vKCD4La+BFopi8mHh2zDVuTtHHui/W7ni
s7xFHdgagQIuCH4ZKAICEfw8oeYDp2IRfE8eJu32JgQfPf4APxHG8w==
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJJKD0TBCLTHP6DgL2SA4z/YB/fHGMnFYdz34MfLw1P
c0iJvePGbKHmkCfUfOCUZ5qD9X3/3ul8Gg57SiZLsFilOcjMi9M8LaDl0HLg
1EJXuTSHC/nx7OdmajlwrJGJSuFG8KX076qwfU2F81nC+HQ33Ux18DHvdEx4
qunQMNW5O+d0qsNSPwfhxMfqDgW2XNcXH0h1sHtxc82vGDWHMyCwB8q/owLn
w9wP48vvWrAv9Zy8Q1HGxLc1+1MdBLI/ajK4yThc8k0SiDib6vBl38et6dck
HFZ+BIrcSXVI8lK5eFpD1OHJBaXbP7+lOqxh6T4887+wQ9wuTx4moPth/N7p
wBDQQfA3zX2//Jh9mkNO04rfDC1iDjnPf6/86JXm0GnjuSstSNLBddvnv1ci
0hxa9Vbkz/wsAw/fD4vWK5y9oeCAHv5g99ukOfz9GLfVaCGC3w0yj0kRzv+w
ISB7VricQw/IPRZpDvtrZS3SU6QdWl4H7pAzTHMwdbxSyyAk5vADGH2zJdIc
9iTeXnRGTdThKch/XAg+0Hfa7f9S4XxQcNk/TXUQBIUXm5hDAkjD3VSH87dy
xWd5S0PcC4yvHpB7jOTg/NCmow/PvFeA82Huh/GntLdGXZ6jAucLvNy+njld
zUGnXezmufupDqBosbyi7vAAmKzynqU6GINAsSYkPf1Kdcjh/Lkg3VgL7n4Y
/6tGTP8hSQTfAJTgDNIcQMl29hJNB5D2beZpDoXSvA90J6jDww8YWi6Z+mpw
vu6EBT8M3VQwwh8Aojt70w==
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJJKG1iDATC6Q7/QcBeyQHGf7CPb46xk4pDxsS3NfaC
6Q4psXfcmC3UHDjWyESlMKc7WN/3753Op+EQyqe7ae7nNAeZeXGapwW0HICy
1vevpzlcyI9nPzdTy2Gh67bPf48g+FtOlO2bvw7Bn/t++THvyWkOPuadjglP
NR2k9O+qsLWmOSz1cxBOfKzuwHV9cYFtVZqD3Yuba37FqDmkgUAZlH9HBc6H
uR/Gl9+1YF/qOXkHHibtdrHKNAeB7I+aDG4yDjnPf6/82Jbm8GXfx63p1yQc
XLqBIlPTHJK8VC6e1hB1qMvaUzJ5Q5rDGpbuwzP/Czv8CH68dPYRBF/DEBgC
zxB8sLt/pjnkNK34zdAi5sDWONW5myXdodPGc1dakKTDA2Aw5QmlO7Tqrcif
+VkGHr4fFq1XOHtDwQE9/MHu/5bm8Pdj3FajhQh+N8g8JkU4/8OGgOxZ4XIO
aiD3fEpz2F8ra5GeIu0g1/o6cMerNAdTxyu1DEJiDhOA0Wd6Kc1hT+LtRWfU
RB0aQP47guA/AfpOYQeCzwgMrpvz0hwEQeHFJubwExQg09Mczt/KFZ/lLQ1x
LzC+ekDuMZKD80Objj48814Bzoe5H8af0t4adXmOCpwv8HL7euZ0NYcjChuK
MmamOfgmCURYXlF3qHgJ9NGCNAeQMuNiTUh62gwMX86fC9KNteDuh/EnHPqq
EXMZwT8FSnAv0xy+g+JtiaYDSLv/xzSHQmneB7oT1OHhBwwtl0x9NThfd8KC
H4ZuKhjhDwDFhFdx
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJJKA0GF9Id/oOAvZIDjP9gH98cYycVB5O4XZ4859Id
UmLvuDFbqDlcqXipZngg3cH6vn/vdD4NB6XbP+uyNqQ7yMyL0zwtoOUAlOVY
MyXd4UJ+PPu5mVoOeULNB041IvgNU527c7IR/Kw9JZMlAtIdfMw7HROeajq8
+L3y4yXHdIelfg7CiY/VHW4sLrDlMk93sHtxc82vGDUHE2MQgPLvqMD5MPfD
+PK7FuxLPSfvcOPc9+DHpukOAtkfNRncZBwstpwo2+ec7vBl38et6dckHAQi
LLecCEp3SPJSuXhaQxTijtx0hzUs3Ydn/hd2OKKwoSijEcH/8hcYAosQfAmW
MD7dbekOOU0rfjO0iDlc8U0SiDiY7tBp47krLUjSYY1MVIr1+XSHVr0V+TM/
y8DD98Oi9Qpnbyg4oIc/2P2b0x3+fozbarQQwe8GmcekCOd/2BCQPStcDuKe
dekO+2tlLdJTpB3eBO6Qa12e7mDqeKWWQUjMIRYYfUz96Q57Em8vOqMG9V8j
gg/03cS3JQg+KLiWRqc7CILCi03M4Zg3UENIusP5W7nis7ylIe4FxlcPyD1G
cnB+aNPRh2feK8D5MPfD+FPaW6Muz1GB8wVebl/PnK7mMPFtjb1pWLoDKNgs
r6g7uG77/PdKTLoDOBqLNSHpqQAYvpw/F6Qba8HdD+PH9B/6qjEBwZ8BSnDL
0h1A3pi9RNNBA6hdBhg+hdK8D3QnqMPDDxhaLpn6anC+7oQFPwzdVDDCHwDP
sEKP
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJJKD0TBDozHP6DgL2SA4z/YB/fHGMnFYdz34MfL23P
cEiJvePGbKHmkCfUfOBUZYaD9X3/3ul8Gg67SyZLsGRlOMjMi9M8LaDlAJRd
6OqX4XAhP5793EwtB/Y1MlEp1gi+lP5dFTZVBJ85jE93E2eGg495p2PCU02H
hqnO3Tm/0x2W+jkIJz5Wdyiw5bq++EO6g92Lm2t+xag5nAGBN1D+HRU4H+Z+
GF9+14J9qefkHYoyJr6teZ/uIJD9UZPBTcbhkm+SQMTfdIcv+z5uTb8m4bDy
I1CEJ8MhyUvl4mkNUYcnF5Ru/1TLcFjD0n145n9hh7hdnjxM1gh+73RgCMQg
+Jvmvl9+LD/DIadpxW+GFjGHnOe/V36synDotPHclRYk6eC67fPfKx0ZDq16
K/JnfpaBh++HResVzt5QcEAPf7D7czIc/n6M22q0EMHvBpnHpAjnf9gQkD0r
XM6hB+SejAyH/bWyFukp0g4trwN3yCVmOJg6XqllEBJzAEXfbI8Mhz2Jtxed
URN1eArynxWCD/Sddrsegp8ODC570QwHQVB4sYk5xIM08GY4nL+VKz7LWxri
XmB89YDcYyQH54c2HX145r0CnA9zP4w/pb016vIcFThf4OX29czpag7a7WI3
z/FnOICixfKKugMoWeWJZTgYg0CxJiQ9aQHDl/PngnRjLbj7YfyvGjH9hzwR
fAMOYIJLyID4e4mmA0j7tvQMh0Jp3ge6E9Th4QcMLZdMfTU4X3fCgh+GbioY
4Q8A3jx2nA==
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJ5IGYC4jQQeJbhEMYp1m4sL+oA469XOBthIivhELhD
rvX13QyH/2Ag6TDxbY296TkE35OHSbv9EIJfLbLO/eGuDIckL5WLp19IwPlr
WLoPz5wvDudrfFJ5OctTzGECyDygfhNjEBB1+KoR03/oLIKfbH3fv/cygr9p
7vvlx65Dze8QdVjr/rBK5FaGg2D2R02GY6IOKmyNU51vZzioPWmed/aVKMRd
ePj/oHxVKP8MCNyButcewf/zeG9WKhOCry/+ce6Mr4IO0/OEmg9cynDosfHc
lWbE5wDinjqY4VCyvGTDv/OcDr5JAhGWBzIcmsRrWTPbOB1kolKs7+/PcPA+
wW47OxTBv6Mpu+b/Zw44P95x1saMKg6HG+e+Bz8+CAtfdoepzt05zw8j+ODw
OY7gw+JPpHJSyVkVfgf0+AUAMlT1lA==
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0,
              1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGIzIGYC4v5DXzVi8rMc9uTXvJ0ZquAA4ys4fkw+06vg
YG8at8szB8F3SHh6QSkbwT9waqHrtnQEX/zmue/BQH5yxFHpmekKDkeAxvWn
ZTmU2KQtMPJTcJDRv6vCFprlwB8bcN/ouYTDjJlAoJjl8MB837czRqIOP+qy
9pT8zoTz/Xun5wldRvD/g8D6TIeQ30ATGyTg/L0g96fKw/nO4le2n6lUcNBp
F7t5bnOmw5L7+/jmbFZx+PL3SsXLe5kOK1546P1/qO4gE5Viff9zpkPfk0/y
l/I1If4Rz3I4AwZaDvy6m+a+t0bwbwC99zgVwa8HOndyRZYDl5tqKdMsDTj/
jgpb41RlNTi/wxEYcE2qDg1TnbtzyrMcZvyfUPf7lwqc/wDoPONHCP4b3n0G
M1epOICMca5G4t/+WZdVg+ADXbN0dgOCDwztQ1+B/CfHZ+yetkHF4bwSUENT
lsPEtzX2pnKqkPiYleUQzgf0mL42nJ+eBgLakPCeTjwfHAxTEPwaUIKZmOXg
0p3z/LemNiQ9AP0ja5Hukqmv6XAGGLyfM7McEg5f1k6dqeWwvihj4tsQhP7j
3uadjhYIfg/QmJVPM+F8cPz2ZzocqAWaqKIG5/+vWB81s0EBzmeWcZo666+E
wx1gcO3Zk+mwhqX78Mz/wpD4+ILgg9OzcBacH7JDrvW1bpaDUPZHTYZlog4Z
QOUSLtD0yi7h4AN0XgIw/jtsPHelTZKG5xfjNY96zygj8g8sPwEALAOaBQ==

             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {0, 
             1, 0}, {1, 3, 3}}, {{1, 4, 3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {
             0, 1, 0}, {1, 3, 3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJ+KB3yeOnsIzI5Du+n8F37f1LJAcY3MQYBZYcJb2vs
TcUQfJF17g+rBBD8hqnO3Tn62XD+eqC0iBaCD6aVMfmrWboPzzyvBOenp4GA
kgNLGJ/uJk0EH2Y+jA+zH8Z//nvlx0uiCD7M/eh8dP/xxwbcNzouA+fPmAkC
snD/wvgw+2B8mHtgfJh/YXyYf9D5Jo5XahkuycD5/8FAGu5fGB9mPowPsx/G
h/kXxoe5H50P8x8ArUnOiw==
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1, 3, 3}, {
             1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 
             3}}}, CompressedData["
1:eJxTTMoPSmVmYGBgAmJJKD1jJhB45jr8BwF7JQcY/8E+vjnGTioO578HP17q
nuuQEnvHjdlCzSFXqPnAKctcB+v7/r3T+TQc9pRMlmDRynWQmReneVpAy6Hl
wKmFrny5Dhfy49nPzdRyYF8jE5XyOwfOl9G/q8L2FMFnCePT3XQyx8HHvNMx
4ammQ8NU5+6c3TkOS/0chBMfqzvk23JdX7whx8Huxc01v2LUHM6AwBoo/44K
nA9zP4wvv2vBvtRz8g4lGRPf1qzPcRDI/qjJ4CbjcMU3SSBib47Dl30ft6Zf
k3BY8/GSb9KZHIckL5WLpzVEHZ5cULr981mOwxqW7sMz/ws7xO7y5GH6jeD3
Ts8TapbJhfO3zH2//Jh+rkNO04rfDC1iDjnPf6/8aJXr0GnjuSstSNLBZdvn
v1c8ch1a9Vbkz/wsAw/fD4vWK5y9oeCAHv5g9+vkOvz9GLfVaCGC3w0yj0kR
zv+wISB7VricQw/IPRq5DvtrZS3SU6QdWl8H7pBTzHUwdbxSyyAk5gCKvtkc
uQ57Em8vOqMm6vAU5L9fOXC+Bw+Tdvs7BD8dGFz2V3McBEHhxSbmkADScDbH
4fytXPFZ3tIQ9wLjqwfkHiM5OD+06ejDM+8V4HyY+2H8Ke2tUZfnqMD5Ai+3
r2dOV3PQaRe7ee58jgMoWiyvqDuAklXetRwHYxAo1oSkp1c5DjmcPxekG2vB
3Q/jf9WI6T/EmQvnG3AAE5xCLsTfSzQdQNq3qec6FErzPtCdoA4PP2BouWTq
q8H5uhMW/DB0U8EIfwAhm34I
             "]], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}}, {{{
             236.99999999999997`, 5.893750000000001}, {236.99999999999997`, 
             6.252339999999999}, {236.70299999999997`, 6.499999999999999}, {
             236.40599999999995`, 6.499999999999999}, {236.047, 
             6.499999999999999}, {235.79999999999995`, 6.20273}, {
             235.79999999999995`, 5.9058600000000006`}, {235.79999999999995`, 
             5.547270000000001}, {236.09699999999998`, 5.300000000000001}, {
             236.393, 5.300000000000001}, {236.75199999999995`, 
             5.300000000000001}, {236.99999999999997`, 5.59688}, {
             236.99999999999997`, 5.893750000000001}}}], 
            
            FilledCurveBox[{{{1, 4, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 
              3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 
              3}, {0, 1, 0}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}}, {{1, 4, 3}, {1,
               3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 3, 3}}}, {CompressedData["
1:eJxTTMoPSmViYGCQAWIQzb5GJiolO8+h/GL4hDQeWQcY//Q+7ab/fxUclhTY
cl33z3O4vegM20wRJYc9JZMlWIzyHM6A5G2VHVIEIiy3uOQ5ZJSwbzR+quzw
HwTi8xwe7OObY8ykCue/5d1nMJNLHc73Nu90TFDVhPDt8xwu5Mezn5up5bDA
ddvnvzII/pz3y495f8+F82fMBIKbuQ7a7WI3z13XgPM99tfKWixXg/Nb5p1d
df6qqsPWz3+vVNzNdTgAlE5nUXWwN43b5fki1+FPTO7Rf0YqDr3T84Sa3+Q6
mDteqWV4pOwActZTIL8yYoXp2dvKDry6m+a+Z89zqL7/45bxaiWH2F2ePEyP
cx3ubMgNTJusCHH/+VyHvfk1b2c+lYfz30zhu/Y/UgbON1Cd9CLVRNzhyFeN
mP5vuQ5rWLoPz/wvDHGfbB6cDwx96/vuCD4sPj5tCMie9V3cAT2+AMwx3Pw=

              "], {{242.49999999999997`, 11.508199999999999`}, {
              242.49999999999997`, 10.7742}, {241.98, 10.1848}, {241.295, 
              9.799610000000001}, {239.92599999999993`, 
              10.714100000000002`}, {239.77199999999993`, 
              10.822299999999998`}, {239.29999999999995`, 
              11.135199999999998`}, {239.29999999999995`, 
              11.724600000000002`}, {239.29999999999995`, 
              12.506599999999999`}, {240.10299999999998`, 
              13.000399999999997`}, {240.89399999999998`, 
              13.000399999999997`}, {241.74400000000003`, 
              13.000399999999997`}, {242.49999999999997`, 12.3742}, {
              242.49999999999997`, 11.508199999999999`}}, {{
              242.79999999999995`, 6.858979999999999}, {242.79999999999995`, 
              5.933199999999999}, {241.89499999999998`, 5.299610000000001}, {
              240.95500000000004`, 5.299610000000001}, {239.957, 
              5.299610000000001}, {239.10000000000002`, 6.055079999999999}, {
              239.10000000000002`, 7.066019999999999}, {239.10000000000002`, 
              8.016409999999999}, {239.76899999999998`, 8.783979999999998}, {
              240.53300000000002`, 9.149610000000001}, {241.95399999999995`, 
              8.18672}, {242.259, 7.9796900000000015`}, {242.79999999999995`, 
              7.6019499999999995`}, {242.79999999999995`, 
              6.858979999999999}}}], 
            
            FilledCurveBox[{{{0, 2, 0}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {1, 
             3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1,
              3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {1, 3, 3}, {0, 1, 0}, {
             0, 1, 0}, {0, 1, 0}}}, CompressedData["
1:eJxTTMoPSmVmYGBgBGJdIGYC4pbXgTvkVPMdptSGs/y3lnXg1d009700gr90
9hGFDVL5DgH3jZafTpJx6D/0VSNGPN8hvYR9o/FSSQcTYyAQzndwnacSa3xT
woG1capzt0C+QxoYSDhcX1xgy/U7D84/cGqh67b3CP4ZIPfzSgR/zcdLvklb
8hzE2o33z2qWhLjndJ5DhPj2iwzzZBz2lEyWYLmW57Aj2Cri/3FZhzs/67L2
AO37sGi9wlkPJYdUkDFq+Q4XbuWKz+pWhvPzFjPuYf2kCudXRKwwPbtbw4F9
jUxUCjNQfX48+7mZWg78EZZbTgDNh/HnS+nfVVmF4P8Hgf48hze8+wxmamnA
+WX+cmJZvGpw/pRvbPEzzqg4iKxzf1i1AMGfMRMIFiL4Wz//vVKxEsEHh+dm
aHioqcL5ehMW/DB8huC/+L3y46VeNYfyl2qGHGvyHE5oWk06/V/NwZYLGOIL
EXzTuF2ePPMQ/IgU6/v+cxH8GFCEzslzyMz/0HpSRB0SHovzHAJuSdckXtJw
aBe7ee779jwH82tHc00YtCDhfQHBB8fHJwQfHL5s+Q7JZ2K9T7hrwPkbVJ80
zwOGD4zPzLfQ6+w/ZQeQc3o/5znc0ZRd899YyUGgGZhC7uY58MeCUpwCPDxj
VCNkzsWIwfngcDAWhdDA9ArjAwAsAjpc
             "]]}, 
           Thickness[0.003988672171034263], StripOnInput -> False]}, {
         ImageSize -> {250.71510834371108`, 16.338709838107096`}, 
          BaselinePosition -> Scaled[0.32439307852814453`], 
          ImageSize -> {251., 17.}, 
          PlotRange -> {{0., 250.70999999999998`}, {0., 16.34}}, AspectRatio -> 
          Automatic}], TraditionalForm],
      PlotRange->{{0, 1.}, {0, 0.015736192021386434`}},
      PlotRangeClipping->True,
      PlotRangePadding->{{
         Scaled[0.02], 
         Scaled[0.02]}, {
         Scaled[0.02], 
         Scaled[0.05]}},
      Ticks->{Automatic, Automatic}], ""}
   },
   AutoDelete->False,
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]]
}, Open  ]]
}, Closed]]
},
WindowSize->{1332, 998},
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
Cell[1953, 48, 48, 0, 30, "Text"],
Cell[2004, 50, 375, 8, 34, "Input"],
Cell[2382, 60, 52, 0, 33, "Text"],
Cell[2437, 62, 921, 26, 148, "Input"]
}, Closed]],
Cell[CellGroupData[{
Cell[3395, 93, 33, 0, 37, "Subsection"],
Cell[3431, 95, 133, 3, 30, "Text"],
Cell[3567, 100, 660, 19, 41, "Input"],
Cell[4230, 121, 2705, 69, 159, "Input"],
Cell[CellGroupData[{
Cell[6960, 194, 1717, 44, 146, "Input"],
Cell[8680, 240, 94958, 1676, 411, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[103687, 1922, 27, 0, 36, "Subsection"],
Cell[103717, 1924, 180, 4, 30, "Text"],
Cell[103900, 1930, 497, 13, 34, "Input"],
Cell[CellGroupData[{
Cell[104422, 1947, 416, 13, 34, "Input"],
Cell[104841, 1962, 716, 25, 57, "Output"]
}, Open  ]],
Cell[105572, 1990, 58, 0, 33, "Text"],
Cell[CellGroupData[{
Cell[105655, 1994, 594, 16, 57, "Input"],
Cell[106252, 2012, 1561, 52, 57, "Output"],
Cell[107816, 2066, 192, 5, 38, "Output"]
}, Open  ]],
Cell[108023, 2074, 52, 0, 33, "Text"],
Cell[108078, 2076, 1238, 41, 47, "Input"],
Cell[109319, 2119, 310, 5, 55, "Text"],
Cell[109632, 2126, 2376, 70, 170, "Input"],
Cell[112011, 2198, 445, 7, 77, "Text"],
Cell[112459, 2207, 8379, 237, 354, "Input"],
Cell[120841, 2446, 192, 4, 33, "Text"],
Cell[CellGroupData[{
Cell[121058, 2454, 4696, 131, 217, "Input"],
Cell[CellGroupData[{
Cell[125779, 2589, 32, 0, 24, "Print"],
Cell[125814, 2591, 32, 0, 24, "Print"],
Cell[125849, 2593, 32, 0, 24, "Print"],
Cell[125884, 2595, 32, 0, 24, "Print"],
Cell[125919, 2597, 32, 0, 24, "Print"]
}, Open  ]],
Cell[125966, 2600, 1097, 26, 114, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[127112, 2632, 36, 0, 36, "Subsection"],
Cell[127151, 2634, 147, 3, 30, "Text"],
Cell[127301, 2639, 1097, 31, 124, "Input"],
Cell[128401, 2672, 21, 0, 33, "Text"],
Cell[CellGroupData[{
Cell[128447, 2676, 217, 5, 34, "Input"],
Cell[128667, 2683, 1880, 58, 80, "Output"]
}, Open  ]],
Cell[130562, 2744, 129, 3, 33, "Text"],
Cell[CellGroupData[{
Cell[130716, 2751, 369, 10, 34, "Input"],
Cell[131088, 2763, 4573, 80, 242, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[135710, 2849, 25, 0, 36, "Subsection"],
Cell[135738, 2851, 135, 3, 30, "Text"],
Cell[135876, 2856, 471, 15, 34, "Input"],
Cell[CellGroupData[{
Cell[136372, 2875, 370, 10, 34, "Input"],
Cell[136745, 2887, 1804, 38, 126, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[138598, 2931, 40, 0, 36, "Subsection"],
Cell[138641, 2933, 43, 0, 30, "Text"],
Cell[138687, 2935, 1125, 37, 130, "Input"],
Cell[CellGroupData[{
Cell[139837, 2976, 372, 10, 34, "Input"],
Cell[140212, 2988, 1794, 38, 126, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[142055, 3032, 27, 0, 37, "Subsection"],
Cell[142085, 3034, 112, 3, 30, "Text"],
Cell[CellGroupData[{
Cell[142222, 3041, 31, 0, 35, "Subsubsection"],
Cell[142256, 3043, 134, 3, 30, "Text"],
Cell[142393, 3048, 116, 3, 34, "Input"],
Cell[142512, 3053, 973, 28, 42, "Input"],
Cell[143488, 3083, 45, 0, 33, "Text"],
Cell[CellGroupData[{
Cell[143558, 3087, 732, 18, 57, "Input"],
Cell[144293, 3107, 96, 2, 34, "Output"],
Cell[144392, 3111, 102, 2, 34, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[144543, 3119, 47, 0, 29, "Subsubsection"],
Cell[144593, 3121, 168, 3, 30, "Text"],
Cell[CellGroupData[{
Cell[144786, 3128, 1567, 52, 71, "Input"],
Cell[146356, 3182, 339, 11, 54, "Output"],
Cell[146698, 3195, 626, 21, 63, "Output"]
}, Open  ]],
Cell[147339, 3219, 93, 2, 33, "Text"],
Cell[147435, 3223, 1155, 34, 64, "Input"],
Cell[148593, 3259, 52, 0, 33, "Text"],
Cell[CellGroupData[{
Cell[148670, 3263, 773, 21, 56, "Input"],
Cell[149446, 3286, 48425, 847, 364, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[197920, 4139, 45, 0, 29, "Subsubsection"],
Cell[197968, 4141, 232, 4, 52, "Text"],
Cell[CellGroupData[{
Cell[198225, 4149, 8034, 205, 568, "Input"],
Cell[206262, 4356, 4855, 91, 232, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[211154, 4452, 450, 12, 57, "Input"],
Cell[211607, 4466, 81, 2, 34, "Output"],
Cell[211691, 4470, 81, 2, 34, "Output"]
}, Open  ]],
Cell[211787, 4475, 164, 3, 33, "Text"],
Cell[211954, 4480, 4017, 105, 413, "Input"],
Cell[215974, 4587, 70, 0, 33, "Text"],
Cell[216047, 4589, 6050, 155, 413, "Input"],
Cell[CellGroupData[{
Cell[222122, 4748, 896, 25, 79, "Input"],
Cell[223021, 4775, 129, 4, 34, "Output"],
Cell[223153, 4781, 130, 4, 34, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[223320, 4790, 613, 17, 57, "Input"],
Cell[223936, 4809, 41427, 692, 241, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[265412, 5507, 35, 0, 29, "Subsubsection"],
Cell[265450, 5509, 330, 5, 52, "Text"],
Cell[265783, 5516, 4147, 106, 307, "Input"],
Cell[CellGroupData[{
Cell[269955, 5626, 547, 14, 57, "Input"],
Cell[270505, 5642, 354, 7, 34, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[270896, 5654, 559, 14, 57, "Input"],
Cell[271458, 5670, 352, 7, 34, "Output"]
}, Open  ]]
}, Closed]]
}, Closed]],
Cell[CellGroupData[{
Cell[271871, 5684, 36, 0, 36, "Subsection"],
Cell[271910, 5686, 60, 0, 30, "Text"],
Cell[271973, 5688, 414, 13, 41, "Input"],
Cell[CellGroupData[{
Cell[272412, 5705, 796, 23, 57, "Input"],
Cell[273211, 5730, 48, 0, 32, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[273308, 5736, 37, 0, 36, "Subsection"],
Cell[273348, 5738, 1313, 35, 163, "Input"]
}, Closed]],
Cell[CellGroupData[{
Cell[274698, 5778, 28, 0, 37, "Subsection"],
Cell[274729, 5780, 74, 0, 30, "Text"],
Cell[274806, 5782, 4736, 106, 307, "Input"]
}, Closed]],
Cell[CellGroupData[{
Cell[279579, 5893, 31, 0, 36, "Subsection"],
Cell[279613, 5895, 239, 4, 52, "Text"],
Cell[CellGroupData[{
Cell[279877, 5903, 5574, 125, 668, "Input"],
Cell[285454, 6030, 779, 16, 127, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[286270, 6051, 151, 4, 32, "Input"],
Cell[286424, 6057, 45, 0, 32, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[286518, 6063, 46, 0, 37, "Subsection"],
Cell[CellGroupData[{
Cell[286589, 6067, 37, 0, 29, "Subsubsection"],
Cell[286629, 6069, 142, 3, 33, "Text"],
Cell[286774, 6074, 400, 9, 80, "Input"],
Cell[287177, 6085, 342, 6, 55, "Text"],
Cell[287522, 6093, 1659, 41, 238, "Input"],
Cell[289184, 6136, 212, 6, 34, "Input"],
Cell[289399, 6144, 1668, 41, 238, "Input"],
Cell[291070, 6187, 214, 6, 34, "Input"],
Cell[291287, 6195, 1962, 47, 239, "Input"],
Cell[293252, 6244, 220, 6, 34, "Input"],
Cell[293475, 6252, 2013, 48, 239, "Input"],
Cell[295491, 6302, 221, 6, 34, "Input"],
Cell[CellGroupData[{
Cell[295737, 6312, 1999, 48, 239, "Input"],
Cell[297739, 6362, 35, 0, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[297811, 6367, 218, 6, 34, "Input"],
Cell[298032, 6375, 244, 6, 23, "Message"],
Cell[298279, 6383, 113, 2, 32, "Output"]
}, Open  ]],
Cell[298407, 6388, 2038, 48, 239, "Input"],
Cell[300448, 6438, 219, 6, 34, "Input"],
Cell[300670, 6446, 66, 0, 33, "Text"],
Cell[CellGroupData[{
Cell[300761, 6450, 3207, 89, 263, "Input"],
Cell[303971, 6541, 703, 12, 41, "Message"],
Cell[304677, 6555, 703, 12, 41, "Message"],
Cell[305383, 6569, 702, 12, 41, "Message"],
Cell[306088, 6583, 301, 6, 23, "Message"]
}, Open  ]],
Cell[306404, 6592, 212, 6, 34, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[306653, 6603, 30, 0, 35, "Subsubsection"],
Cell[306686, 6605, 40, 0, 33, "Text"],
Cell[306729, 6607, 461, 13, 57, "Input"],
Cell[307193, 6622, 37, 0, 33, "Text"],
Cell[307233, 6624, 567, 15, 34, "Input"],
Cell[307803, 6641, 2006, 61, 126, "Input"],
Cell[309812, 6704, 282, 7, 56, "Input"],
Cell[310097, 6713, 3148, 78, 308, "Input"],
Cell[CellGroupData[{
Cell[313270, 6795, 2477, 63, 262, "Input"],
Cell[315750, 6860, 417935, 7417, 766, "Output"]
}, Open  ]]
}, Open  ]]
}, Closed]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature DwD0s1bcS@VO8A1Nx7w@XDLf *)
