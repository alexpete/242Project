/*\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\ free2mv.c
\
\ Checks if the position (xval, yval) is already occupied.  If so, return 0, else 1.
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*/

#include "free2mv.h"

int
free2mv(int xval, int yval, double *xcheck, double *ycheck, int ncar)
{
  int i, val = 1;
  for(i = 0; i < ncar; i++){
    if(xval == (int)xcheck[i] && yval == (int)ycheck[i]){
      val = 0; /* car is blocked */
      break;
    }
  }
  
  return(val);
    
}
