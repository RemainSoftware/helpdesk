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
      *          This source member contains the input
      *          definitions used for the OMQCHGCC api
      *          Change Incident
      *          ------------------------------------------
      *
      *          ------------------------------------------
      *          Interface level  (INPUT)
      *          The interface level ensures that the parameters
      *          passed to the program are recognized by the API.
      *          ------------------------------------------
     D C4INTL          DS             8
      *
      *          ------------------------------------------
      *          Action code  (INPUT)
      *          The action code describes the mode in which the
      *          API is to be activated for the object
      *          ------------------------------------------
     D C4ACTC          DS             2
      *
      *          ------------------------------------------
      *          Input buffer processing array
      *          C4EOP - End of processing  (true/false)
      *          C4UPD - Update call        (true/false)
      *          C4UPB - Update call buffer (true/false)
      *          ------------------------------------------
     D C4PRC           DS
     D  C4EOP                  1      1
     D  C4UPD                  2      2
     D  C4UPB                  3      3
     D  C4DU2                  4     40
      *
      *          ------------------------------------------
      *          Output buffer error data
      *          ------------------------------------------
     D C4ERR           DS
     D  C4MSID                 1      7
     D  C4MSTP                 8      8
     D  C4MSGD                 9    136
      *
      *          ------------------------------------------
      *          Input / Output buffer field error data
      *          ------------------------------------------
     D C4FLD           DS
     D  C4MSQ                  1     10
     D  C4FLDA                11    130
      *
      *          ------------------------------------------
      *          Input buffer data structure for all codes
      *          ------------------------------------------
     D C4BUF           DS
     D  C4HEDC                 1      5
     D  C4CTN#                 6     15
     D  C4CUSC                16     25
     D  C4CCTC                26     35
     D  C4INDT                36     42  0
     D  C4INTM                43     48  0
     D  C4RCTM                49     54  0
     D  C4USID                55     64
     D  C4CSRC                65     65
     D  C4USF1                66     75
     D  C4USF2                76    100
     D  C4USF3               101    108P 0
