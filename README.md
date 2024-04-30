``` r
devtools::load_all(".")
```

    ## ℹ Loading BitterCAS

``` r
InitCAS(con = EnvCAS$currentConn, userDir = "~/Desktop/Projects/BitterCAS/inst/tmp/")
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax
for authoring HTML, PDF, and MS Word documents. For more details on
using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that
includes both content as well as the output of any embedded R code
chunks within the document. You can embed an R code chunk like this:

``` r
summary(cars)
```

    ##      speed           dist       
    ##  Min.   : 4.0   Min.   :  2.00  
    ##  1st Qu.:12.0   1st Qu.: 26.00  
    ##  Median :15.0   Median : 36.00  
    ##  Mean   :15.4   Mean   : 42.98  
    ##  3rd Qu.:19.0   3rd Qu.: 56.00  
    ##  Max.   :25.0   Max.   :120.00

<math display="block" xmlns="http://www.w3.org/1998/Math/MathML">
<mi>U_R</mi> <mfenced separators=""><mi>t</mi> </mfenced> <mo>=</mo>
<mo>-</mo> <mi>R</mi> <mspace width="thinmathspace"/><mi>I_C</mi>
<mfenced separators=""><mi>t</mi> </mfenced> </math></br>
<math display="block" xmlns="http://www.w3.org/1998/Math/MathML">
<mi>U_L</mi> <mfenced separators=""><mi>t</mi> </mfenced> <mo>=</mo>
<mo>-</mo> <mi>L</mi>
<mspace width="thinmathspace"/><mfenced separators="">
<mfrac><mrow><mtext>ⅆ</mtext></mrow> <mrow>
<mtext>ⅆ</mtext><mspace width="thinmathspace"/> <mi>t</mi>
</mrow></mfrac> <mspace width="thinmathspace"/> <mi>I_C</mi>
<mfenced separators=""><mi>t</mi> </mfenced> </mfenced>
</math></br><math display="block" xmlns="http://www.w3.org/1998/Math/MathML">
<mi>I_C</mi> <mfenced separators=""><mi>t</mi> </mfenced> <mo>=</mo>
<mi>C</mi> <mspace width="thinmathspace"/>
<mfenced separators=""><mfrac><mrow><mtext>ⅆ</mtext> </mrow>
<mrow><mtext>ⅆ</mtext> <mspace width="thinmathspace"/><mi>t</mi>
</mrow></mfrac> <mspace width="thinmathspace"/><mi>U_C</mi>
<mfenced separators=""> <mi>t</mi> </mfenced> </mfenced> </math></br>
<math display="block" xmlns="http://www.w3.org/1998/Math/MathML">
<mi>U_R</mi> <mfenced separators=""><mi>t</mi> </mfenced> <mo>+</mo>
<mi>U_L</mi> <mfenced separators=""><mi>t</mi> </mfenced> <mo>=</mo>
<mi>U_C</mi> <mfenced separators=""><mi>t</mi> </mfenced>
</math></br><math display="block" xmlns="http://www.w3.org/1998/Math/MathML">
<mfenced separators="" open="[" close="]"><mi>y</mi> <mo>+</mo>
<mi>x</mi> <mo>=</mo> <mn>5</mn> <mo>,</mo><mi>z</mi> <mo>+</mo>
<mi>y</mi> <mo>=</mo> <mn>3</mn> </mfenced> </math></br>
<math display="block" xmlns="http://www.w3.org/1998/Math/MathML">
<mfenced separators="" open="[" close="]">
<mfenced separators="" open="[" close="]"><mi>x</mi> <mo>=</mo>
<msub><mi>%r</mi> <mn>1</mn></msub> <mo>+</mo> <mn>2</mn> <mo>,</mo>
<mi>y</mi> <mo>=</mo> <mn>3</mn> <mo>-</mo> <msub><mi>%r</mi>
<mn>1</mn></msub> <mo>,</mo><mi>z</mi> <mo>=</mo> <msub><mi>%r</mi>
<mn>1</mn></msub> </mfenced> </mfenced> </math></br>
<math display="block" xmlns="http://www.w3.org/1998/Math/MathML">
<mfenced separators="" open="[" close="]"><mn>2</mn>
<mspace width="thinmathspace"/><mi>x</mi> <mo>-</mo>
<mfenced separators=""><mi>a</mi> <mo>-</mo> <mn>1</mn> </mfenced>
<mspace width="thinmathspace"/><mi>y</mi> <mo>=</mo> <mn>5</mn>
<mspace width="thinmathspace"/><mi>b</mi> <mo>,</mo><mi>b</mi>
<mspace width="thinmathspace"/><mi>y</mi> <mo>+</mo> <mi>a</mi>
<mspace width="thinmathspace"/><mi>x</mi> <mo>+</mo> <mi>c</mi>
<mo>=</mo> <mn>0</mn> </mfenced> </math></br>
<math display="block" xmlns="http://www.w3.org/1998/Math/MathML">
<mfenced separators="" open="(" close=")"><mtable><mtr><mtd> <mn>2</mn>
</mtd><mtd><mn>1</mn> <mo>-</mo> <mi>a</mi> </mtd><mtd>
<mo>-</mo><mn>5</mn> <mspace width="thinmathspace"/><mi>b</mi>
</mtd></mtr> <mtr><mtd><mi>a</mi> </mtd><mtd><mi>b</mi> </mtd><mtd>
<mi>c</mi> </mtd></mtr> </mtable></mfenced> </math>
