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
      *          D#44IN Incident data queue entry
      *
      *          ------------------------------------------
      *          General header section  (128 bytes)
      *          ------------------------------------------
      *          I44USI - This user
      *          I44JNM - Job name
      *          I44JNR - Job number
      *          I44ENT - Entity
      *          I44ACT - Action
      *          I44R1  - Reserved
      *
      *          ------------------------------------------
      *          Incident section       (869 bytes)
      *          ------------------------------------------
      *          I44HED - Helpdesk
      *          I44INC - Incident
      *          I44OSL - Old support level
      *          I44OST - Old status
      *          I44OSR - Old status route
      *          I44NSL - New support level
      *          I44NST - New status
      *          I44NSL - New support level
      *          ------------------------------------------
     D D#44IN          DS          1024
     D  I44USI                 1     10
     D  I44JNM                11     20
     D  I44JNR                21     26  0
     D  I44ENT                27     28
     D  I44ACT                29     30
     D  I44R1                 31    128
      *
     D  I44HED               129    133
     D  I44INC               134    143
     D  I44OSL               144    144
     D  I44OST               145    149
     D  I44OSR               150    159
     D  I44NSL               160    160
     D  I44NST               161    165
     D  I44NSR               166    175
