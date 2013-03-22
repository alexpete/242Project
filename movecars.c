/*\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\ movecars.c 
\
\ C routine for car movement 
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*/

#include "free2mv.h"
#include "mex.h"

/* Move Cars */
void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[]){
 
  /* Declare input and output variables, then get values */
    
    double *color, *xin, *yin, *nrow, *ncol, *tin, *xout, *yout;
    int ncar, t, i;
    
    color = mxGetPr(prhs[0]);
    xin = mxGetPr(prhs[1]);
    yin = mxGetPr(prhs[2]);
    nrow = mxGetPr(prhs[3]);
    ncol = mxGetPr(prhs[4]);
    tin = mxGetPr(prhs[5]);
    
    ncar = mxGetN(prhs[0]); /* number of cars is the number of columns, or length, of color */
    t = (int)tin[0]; /* time step */
    
    plhs[0] = mxDuplicateArray(prhs[1]);
    plhs[1] = mxDuplicateArray(prhs[2]);
    
    xout = mxGetPr(plhs[0]);
    yout = mxGetPr(plhs[1]);
    
    for(i = 0; i < ncar; i++){
        
      if((int)color[i] == 2 && !(t % 2)){ /* color is red and time step is even */
            int tmp = ((int)xin[i] + 1) % (int)ncol[0];
            int mv = free2mv(tmp, (int)yin[i], xin, yin, ncar);
            if(mv == 1) xout[i] = (double)tmp;
        }
        if((int)color[i] == 1 && (t%2)){ /* color is blue and time step is odd */
            int tmp = ((int)yin[i] + (int)nrow[0] - 1) % (int)nrow[0];
            int mv = free2mv((int)xin[i], tmp, xin, yin, ncar);
            if(mv == 1) yout[i] = (double)tmp;
        }
    }
}
