/*
  csound_rtaudio: realtime audio module functions

  Copyright (C) 1991-2024 

  This file is part of Csound.

  The Csound Library is free software; you can redistribute it
  and/or modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2.1 of the License, or (at your option) any later version.

  Csound is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with Csound; if not, write to the Free Software
  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
  02110-1301 USA
*/

#ifndef _CSOUND_RTAUDIO_
#define _CSOUND_RTAUDIO_
#ifdef __cplusplus
extern "C" {
#endif /*  __cplusplus */

  /**
   * Real-time audio parameters structure
   */
  typedef struct {
    /** device name (NULL/empty: default) */
    char    *devName;
    /** device number (0-1023), 1024: default */
    int32_t     devNum;
    /** buffer fragment size (-b) in sample frames */
    uint32_t     bufSamp_SW;
    /** total buffer size (-B) in sample frames */
    int32_t     bufSamp_HW;
    /** number of channels */
    int32_t     nChannels;
    /** sample format (AE_SHORT etc.) */
    int32_t     sampleFormat;
    /** sample rate in Hz */
    float   sampleRate;
    /** ksmps */
    int32_t ksmps;
  } csRtAudioParams;

  typedef int32_t (*devOpenFunc)(CSOUND *, const csRtAudioParams *);
  typedef void (*audioOutFunc)(CSOUND *, const MYFLT *, int32_t) ;
  typedef int32_t (*audioInFunc)(CSOUND *, MYFLT *, int32_t);
  typedef int32_t (*audioDevListFunc)(CSOUND *,
                                      CS_AUDIODEVICE *, int32_t);

  void **csoundGetRtRecordUserData(CSOUND *);
  void **csoundGetRtPlayUserData(CSOUND *);
  void csoundSetPlayopenCallback(CSOUND *, devOpenFunc);
  void csoundSetRtplayCallback(CSOUND *, audioOutFunc);
  void csoundSetRecopenCallback(CSOUND *, devOpenFunc);
  void csoundSetRtrecordCallback(CSOUND *, audioInFunc);
  void csoundSetRtcloseCallback(CSOUND *, void (*)(CSOUND *));
  void csoundSetAudioDeviceListCallback(CSOUND *csound, audioDevListFunc);

  
#ifdef __cplusplus
}
#endif /*  __cplusplus */
#endif // _CSOUND_RTAUDIO_
