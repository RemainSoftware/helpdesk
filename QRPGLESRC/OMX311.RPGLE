      *  -------------------------------------------------------------
      *  Copyright (c) 2019 Remain BV (https://remainsoftware.com)
      *
      *  This program and the accompanying materials are made
      *  available under the terms of the Eclipse Public License 2.0
      *  which accompanies this distribution, and is available at
      *  https://www.eclipse.org/legal/epl-2.0/
      *
      *  SPDX-License-Identifier: EPL-2.0
      *
      *  Contributors:
      *      Remain Software - initial API and implementation
      *
      *  -------------------------------------------------------------


     H DFTACTGRP(*NO) ACTGRP(*CALLER)
      * ------------------------------------------------------------- *
      * Description                                                   *
      * ------------------------------------------------------------- *
      *                                                               *
      * Program ....: OMX311                                          *
      * Function ...: Substitute &-values for Pager                   *
      * Author .....: Remain Software                               *
      * Purpose ....: Find substitutions for &HEDC and &INCN,         *
      *               HelpDesk code and incident number.              *
      *               Up to 98 substitutions are possible with        *
      *               the current design of the program); in case of  *
      *               modifications, make sure the compile-time       *
      *               array SV has 'XXXX' as last element.            *
      *                                                               *
      * ------------------------------------------------------------- *
      /EJECT
      * ------------------------------------------------------------- *
      * File specifications                                           *
      * ------------------------------------------------------------- *
      *
      * (no files are used in this program)
      *
      * ------------------------------------------------------------- *
      /EJECT
      * ------------------------------------------------------------- *
      * Extension specifications                                      *
      * ------------------------------------------------------------- *
      *                                                               *
      * MSG   - Message string                                        *
      * MSG   - Message string                                        *
      *                                                               *
      * SV     - substition variable names                            *
      *                                                               *
      * ------------------------------------------------------------- *
      *
     D MSG             S              1    DIM(256)
     D SAV             S              1    DIM(256)
      *
     D SV              S              5    DIM(99) CTDATA PERRCD(1)
     D PS              S              5  0 DIM(200)
      *COPY QCPYSRC,OMSREFREN
      *
      * ------------------------------------------------------------- *
      /EJECT
      * ------------------------------------------------------------- *
      * Input specifications                                          *
      * ------------------------------------------------------------- *
      *
      *          ------------------------------------------
      *          Field reference file used to define fields
      *          ------------------------------------------
     D               E DS                  EXTNAME(OMSREFHD)
      *
      *          ------------------------------------------
      *          Program data structure
      *          ------------------------------------------
     D PGM            SDS
     D  D#PARM           *PARMS
      *
      *          ------------------------------------------
      *          Error buffer for API call
      *          ------------------------------------------
      /COPY QAPILESRC,ERR_BUFFER
      *
      *          ------------------------------------------
      *          Binary number definition
      *          ------------------------------------------
      /COPY QAPILESRC,DEFBINARY
      *
      *          ------------------------------------------
      *          Named constants
      *          ------------------------------------------
     D C#TERM          C                   CONST('*TERM')
     D C#NORM          C                   CONST('*NORM')
      * Prototype for OMX311
     D OMX311          PR
     D P#MSG_                              LIKE(P#MSG)
     D P#HEDC_                             LIKE(P#HEDC)
     D P#INC#_                             LIKE(P#INC#)
     D P#STAT_                             LIKE(P#STAT)
      * *ENTRY Interface for Main Procedure
     D OMX311          PI
     D P#MSG                      99999
     D P#HEDC                         5
     D P#INC#                        10
     D P#STAT                         5
      *----------------------------------------------------------------------
      * Stand Alone Fields - TOP
      *----------------------------------------------------------------------
     D I#PSSR          S              1
     D X1              S              3  0
     D X2              S              3  0
     D X3              S              3  0
     D Y1              S              3  0
     D Y2              S              3  0
     D Y3              S              2  0
     D Z1              S              2  0
     D Z2              S              2  0
      *----------------------------------------------------------------------
      * Stand Alone Fields - BOTTOM
      *----------------------------------------------------------------------
      *
      * ------------------------------------------------------------- *
      /EJECT
      * ------------------------------------------------------------- *
      * Main line                                                     *
      * ------------------------------------------------------------- *
      *
      *          ------------------------------------------
      *          Entry parameters
      *          ------------------------------------------
      *
      *          ------------------------------------------
      *          Exit immediately if not enough parameters
      *          ------------------------------------------
     C                   IF        D#PARM = *ZEROS                              B01
     C                   EXSR      SRTTLR
     C                   ENDIF                                                  E01
      *
      *          ------------------------------------------
      *          Init
      *          ------------------------------------------
     C                   EXSR      SRINIT
      *
      *          ------------------------------------------
      *          Do the processing routine
      *          ------------------------------------------
     C                   EXSR      SRVERW
      *
      *          ------------------------------------------
      *          Do the total last record routine
      *          ------------------------------------------
     C                   EXSR      SRTTLR
      *
      * ------------------------------------------------------------- *
      /EJECT
      * ------------------------------------------------------------- *
      * SRINIT - Init                                                 *
      *                                                               *
      * ------------------------------------------------------------- *
     C     SRINIT        BEGSR
      *
      *          ------------------------------------------
      *          Check length of keyfields
      *          ------------------------------------------
     C                   EVAL      Z1 = %CHECKR(' ':P#HEDC)
     C                   EVAL      Z2 = %CHECKR(' ':P#INC#)
      *
      *          ------------------------------------------
      *          End of subroutine
      *          ------------------------------------------
     C                   ENDSR
      *
      * ------------------------------------------------------------- *
      /EJECT
      * ------------------------------------------------------------- *
      * SRVERW - Processing                                           *
      *                                                               *
      * ------------------------------------------------------------- *
     C     SRVERW        BEGSR
      *
      *          ------------------------------------------
      *          Start of normal
      *          ------------------------------------------
     C                   EVAL      P#STAT = C#NORM
      *
      *          ------------------------------------------
      *          Fill the command work array
      *          ------------------------------------------
     C                   MOVEA     P#MSG         MSG
      *
      *          ------------------------------------------
      *          Do it
      *          ------------------------------------------
     C                   EXSR      SRDOIT
      *
      *          ------------------------------------------
      *          End of subroutine
      *          ------------------------------------------
     C                   ENDSR
      *
      * ------------------------------------------------------------- *
      /EJECT
      * ------------------------------------------------------------- *
      * SRDOIT - Processing                                           *
      *                                                               *
      * This routine substitutes the variables                        *
      *                                                               *
      * ------------------------------------------------------------- *
     C     SRDOIT        BEGSR
      *
      *          ------------------------------------------
      *          Initialize
      *          ------------------------------------------
     C                   EVAL      X1 = 1
     C                   EVAL      X2 = 1
     C                   EVAL      X3 = 1
      *
      *          ------------------------------------------
      *          Do for all variables
      *          ------------------------------------------
     C                   DOW       SV(X1) <> 'XXXX'                             B01
      *
      *          ------------------------------------------
      *          Find it and store
      *          ------------------------------------------
     C     SV(X1)        SCAN      P#MSG:X3      PS(X2)                   99
      *
      *          ------------------------------------------
      *          Store type as well
      *          ------------------------------------------
     C                   MULT      100           PS(X2)
     C                   ADD       X1            PS(X2)
      *
      *          ------------------------------------------
      *          Next if not found
      *          ------------------------------------------
     C                   IF        *IN99 = *OFF                                 B02
     C                   ADD       1             X1
     C                   EVAL      X3 = 1
     C                   ELSE                                                   X02
      *
      *          ------------------------------------------
      *          Resume scanning at the point we left
      *          ------------------------------------------
     C     PS(X2)        DIV       100           X3
     C                   ADD       1             X3
     C                   ADD       1             X2
     C                   ENDIF                                                  E02
     C                   ENDDO                                                  E01
      *
      *          ------------------------------------------
      *          Sort the array
      *          ------------------------------------------
     C                   DOW       X2 <= 200                                    B01
     C                   EVAL      PS(X2) = 99999
     C                   ADD       1             X2
     C                   ENDDO                                                  E01
     C                   SORTA     PS
      *
      *----------------------------------------------------
      * Execute the substitute algorithme:
      *----------------------------------------------------
      *
      *          ------------------------------------------
      *          move message array to help array
      *          ------------------------------------------
     C                   MOVEA     MSG(1)        SAV(1)
      *
      *          ------------------------------------------
      *          initialize postion counter and correction factor
      *          ------------------------------------------
     C                   EVAL      Y1 = 0
     C                   EVAL      X1 = 1
      *
      *          ------------------------------------------
      *          for all substitutions: determine type and correct
      *          ------------------------------------------
     C                   DOW       PS(X1) <> 99999                              B01
     C     PS(X1)        DIV       100           X2
     C                   MVR                     Y3
     C                   ADD       Y1            X2
      *
      *          ------------------------------------------
      *          execute the substitution; then:
      *          determine length of substitution, as well as
      *          its deviation from the current value (which is
      *          always 5)
      *          ------------------------------------------
     C                   SELECT
     C                   WHEN      Y3 = 1                                       B02
     C                   MOVEA     P#HEDC        SAV(X2)
     C     X2            ADD       Z1            X3
     C                   EVAL      Y2 = Z1 - 5
     C                   WHEN      Y3 = 2                                       B03
     C                   MOVEA     P#INC#        SAV(X2)
     C     X2            ADD       Z2            X3
     C                   EVAL      Y2 = Z2 - 5
     C                   ENDSL                                                  E03
      *
      *          ------------------------------------------
      *          rearrange the array.
      *          ------------------------------------------
     C                   ADD       5             X2
     C                   MOVEA     MSG(X2)       SAV(X3)
     C                   MOVEA     SAV(1)        MSG(1)
     C                   ADD       1             X1
     C                   ADD       Y2            Y1
     C                   ENDDO                                                  E01
      *
      *          ------------------------------------------
      *          Fill parameter
      *          ------------------------------------------
     C                   MOVEA     MSG(1)        P#MSG
      *
      *          ------------------------------------------
      *          End of subroutine
      *          ------------------------------------------
     C                   ENDSR
      *
      * ------------------------------------------------------------- *
      /EJECT
      * ------------------------------------------------------------- *
      * *PSSR  - Error subroutine                                     *
      *                                                               *
      * ------------------------------------------------------------- *
     C     *PSSR         BEGSR
      *
      *          ------------------------------------------
      *          Do if error not in this routine
      *          ------------------------------------------
     C                   IF        I#PSSR <> *ON                                B01
      *
      *          ------------------------------------------
      *          Indicate that this block was processed
      *          ------------------------------------------
     C                   EVAL      I#PSSR = *ON
      *
      *          ------------------------------------------
      *          Indicate that program ended abnormally
      *          ------------------------------------------
     C                   EVAL      P#STAT = C#TERM
      *
     C                   ENDIF                                                  E01
      *
      *          ------------------------------------------
      *          Exit
      *          ------------------------------------------
     C                   EXSR      SRTTLR
      *
      *          ------------------------------------------
      *          End of subroutine
      *          ------------------------------------------
     C                   ENDSR
      *
      * ------------------------------------------------------------- *
      /EJECT
      * ------------------------------------------------------------- *
      * SRTTLR - Exit processing                                      *
      *                                                               *
      * ------------------------------------------------------------- *
     C     SRTTLR        BEGSR
      *
      *          ------------------------------------------
      *          If closing call
      *          ------------------------------------------
     C                   IF        D#PARM = *ZEROS                              B01
      *
      *          ------------------------------------------
      *          Set last record indicator on
      *          ------------------------------------------
     C                   EVAL      *INLR = *ON
     C                   ENDIF                                                  E01
      *
      *          ------------------------------------------
      *          Return
      *          ------------------------------------------
     C                   EVAL      *INLR = *ON
     C                   RETURN
      *
      *          ------------------------------------------
      *          End of subroutine
      *          ------------------------------------------
     C                   ENDSR
      *
      * ------------------------------------------------------------- *
      /EJECT
      * ------------------------------------------------------------- *
      * *INZSR - Program initialization                               *
      *                                                               *
      * ------------------------------------------------------------- *
     C     *INZSR        BEGSR
      *
      *          ------------------------------------------
      *          Explicit numeric field definitions
      *          ------------------------------------------
     C                   EVAL      X1 = 0
     C                   EVAL      X2 = 0
     C                   EVAL      X3 = 0
     C                   EVAL      Y1 = 0
     C                   EVAL      Y2 = 0
     C                   EVAL      Y3 = 0
     C                   EVAL      Z1 = 0
     C                   EVAL      Z2 = 0
      *
      *          ------------------------------------------
      *          Parameter definitions
      *          ------------------------------------------
      *
      *          ------------------------------------------
      *          API parameter definition
      *          ------------------------------------------
      /COPY QAPILESRC,DEFOTHER
      *
      *          ------------------------------------------
      *          End of subroutine
      *          ------------------------------------------
     C                   ENDSR
      *
      * ------------------------------------------------------------- *
      /EJECT
      * ------------------------------------------------------------- *
      * Arrays for field substitution.                                *
      * ------------------------------------------------------------- *
      *
**         Array SV  (substitution values)
&HEDC      A      5     Helpdesk code
&INCN      A     10     Incident code
XXXX                    End of valid codes
