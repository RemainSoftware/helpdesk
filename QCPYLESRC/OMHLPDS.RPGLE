      *  -------------------------------------------------------------
      *  The MIT License (MIT)
      *
      *  Copyright (c) 2019 Remain (https://remainsoftware.com)
      *
      *  Permission is hereby granted, free of charge, to any person 
      *  obtaining a copy of this software and associated documentation 
      *  files (the "Software"), to deal in the Software without 
      *  restriction, including without limitation the rights to use, 
      *  copy, modify, merge, publish, distribute, sublicense, and/or 
      *  sell copies of the Software, and to permit persons to whom 
      *  the Software is furnished to do so, subject to the following 
      *  conditions:
      *
      *  The above copyright notice and this permission notice shall 
      *  be included in all copies or substantial portions of the 
      *  Software.
      *
      *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY 
      *  KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE 
      *  WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
      *  PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS 
      *  OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR 
      *  OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
      *  OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
      *  SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
      *
      *  Contributors:
      *      Remain Software - initial API and implementation
      *  -------------------------------------------------------------


      *
      *          ------------------------------------------
      *          D#D7HD User portion
      *          D7USID - This user
      *          D7USCL - His class
      *          D7GRID - His first group
      *          D7GRCL - The class of his first group
      *          D7USDC - The users description
      *          D7HEDC - The ACTIVE helpdesk code
      *          D7SUL# - The support level for this helpdesk
      *          D7DUM1 - Dummy
      *          ------------------------------------------
     D D#D7HD          DS           200
     D  D7USID                 1     10
     D  D7USCL                11     20
     D  D7GRID                21     30
     D  D7GRCL                31     40
     D  D7USDC                41     90
     D  D7HEDC                91     95
     D  D7SUL#                96     96
     D  D7DUM1                97    200
     D L#D7HD          C                   CONST(200)
      *
      *          ------------------------------------------
      *          D#D8HD Helpdesk portion
      *          D8HEDC - Helpdesk code
      *          D8HEDD - Descriprion
      *          D8HDMC - Helpdesk manager
      *          D8CTFP - Call track program
      *          D8CTFL - Call track library
      *          D8INFP - Incident program
      *          D8INFL - Incident library
      *          D8DUM1 - Dummy
      *          ------------------------------------------
     D D#D8HD          DS           200
     D  D8HEDC                 1      5
     D  D8HEDD                 6     55
     D  D8HDMC                56     65
     D  D8CTFP                66     75
     D  D8CTFL                76     85
     D  D8INFP                86     95
     D  D8INFL                96    105
     D  D8DUM1               106    200
     D L#D8HD          C                   CONST(200)
