 /* ---------------------------------------------------------------- */
 /*  Copyright (c) 2019 Remain BV (https://remainsoftware.com)       */
 /*                                                                  */
 /*  This program and the accompanying materials are made            */
 /*  available under the terms of the Eclipse Public License 2.0     */
 /*  which accompanies this distribution, and is available at        */
 /*  https://www.eclipse.org/legal/epl-2.0/                          */
 /*                                                                  */
 /*  SPDX-License-Identifier: EPL-2.0                                */
 /*                                                                  */
 /*  Contributors:                                                   */
 /*      Remain Software - initial API and implementation            */
 /*                                                                  */
 /* ---------------------------------------------------------------- */


 /*   *$$\CRTOM CRTCMD                                                        */
 /*   *$$ PGM(OMH0262)                                                        */
 /*   *$$ MODE(*ALL)                                                          */
 /*   *$$ ALLOW(*ALL)                                                         */
 /*   *$$ PMTFILE(OMHDSP)                                                     */
 /*   *$$ MSGF(QCPFMSG)                                                       */
 /*   *$$ HLPPNLGRP(OMSCMDHD)                                                 */
 /*   *$$ HLPID(*CMD)                                                         */
 /*   *$$ HLPSCHIDX(REMAINHD)                                                 */
 /*   *$$\ENDOM                                                               */
 /* ---------------------------------------------------------------- */
 /* Description                                                      */
 /* ---------------------------------------------------------------- */
 /*                                                                  */
 /* Command ....: STRESC                                             */
 /* Function ...: Start escalation                                   */
 /* Author .....: Remain Software                                    */
 /*                                                                  */
 /* ---------------------------------------------------------------- */
             CMD        PROMPT('Start escalation')

             PARM       KWD(HEDC) TYPE(*NAME) LEN(8) DFT(*ALL) +
                          SPCVAL((*ALL) (*CURRENT)) MIN(0) +
                          PROMPT(MQP0002 2) /* Help Desk */

