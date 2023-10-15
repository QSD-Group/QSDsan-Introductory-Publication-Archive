/*
 * combiner.c calculates the concentrations when adding two flow  
 * streams together.
 *  
 * Copyright: Ulf Jeppsson, IEA, Lund University, Lund, Sweden
 */

#define S_FUNCTION_NAME combiner

#include "simstruc.h"


/*
 * mdlInitializeSizes - initialize the sizes array
 */
static void mdlInitializeSizes(SimStruct *S)
{
    ssSetNumContStates(    S, 0);   /* number of continuous states           */
    ssSetNumDiscStates(    S, 0);   /* number of discrete states             */
    ssSetNumInputs(        S, 30);   /* number of inputs                      */
    ssSetNumOutputs(       S, 15);   /* number of outputs                     */
    ssSetDirectFeedThrough(S, 1);   /* direct feedthrough flag               */
    ssSetNumSampleTimes(   S, 1);   /* number of sample times                */
    ssSetNumSFcnParams(    S, 0);   /* number of input arguments             */
    ssSetNumRWork(         S, 0);   /* number of real work vector elements   */
    ssSetNumIWork(         S, 0);   /* number of integer work vector elements*/
    ssSetNumPWork(         S, 0);   /* number of pointer work vector elements*/
}

/*
 * mdlInitializeSampleTimes - initialize the sample times array
 */
static void mdlInitializeSampleTimes(SimStruct *S)
{
    ssSetSampleTime(S, 0, CONTINUOUS_SAMPLE_TIME);
    ssSetOffsetTime(S, 0, 0.0);
}


/*
 * mdlInitializeConditions - initialize the states
 */
static void mdlInitializeConditions(double *x0, SimStruct *S)
{
}

/*
 * mdlOutputs - compute the outputs
 */

static void mdlOutputs(double *y, double *x, double *u, SimStruct *S, int tid)
{
  if ((u[14] > 0) || (u[29] > 0)) {
    y[0]=(u[0]*u[14] + u[15]*u[29])/(u[14]+u[29]);
    y[1]=(u[1]*u[14] + u[16]*u[29])/(u[14]+u[29]);
    y[2]=(u[2]*u[14] + u[17]*u[29])/(u[14]+u[29]);
    y[3]=(u[3]*u[14] + u[18]*u[29])/(u[14]+u[29]);
    y[4]=(u[4]*u[14] + u[19]*u[29])/(u[14]+u[29]);
    y[5]=(u[5]*u[14] + u[20]*u[29])/(u[14]+u[29]);
    y[6]=(u[6]*u[14] + u[21]*u[29])/(u[14]+u[29]);
    y[7]=(u[7]*u[14] + u[22]*u[29])/(u[14]+u[29]);
    y[8]=(u[8]*u[14] + u[23]*u[29])/(u[14]+u[29]);
    y[9]=(u[9]*u[14] + u[24]*u[29])/(u[14]+u[29]);
    y[10]=(u[10]*u[14] + u[25]*u[29])/(u[14]+u[29]);
    y[11]=(u[11]*u[14] + u[26]*u[29])/(u[14]+u[29]);
    y[12]=(u[12]*u[14] + u[27]*u[29])/(u[14]+u[29]);
    y[13]=(u[13]*u[14] + u[28]*u[29])/(u[14]+u[29]);
    y[14]=(u[14]+u[29]);
  }
  else {
    y[0]=0;
    y[1]=0;
    y[2]=0;
    y[3]=0;
    y[4]=0;
    y[5]=0;
    y[6]=0;
    y[7]=0;
    y[8]=0;
    y[9]=0;
    y[10]=0;
    y[11]=0;
    y[12]=0;
    y[13]=0;
    y[14]=0;
  }
}

/*
 * mdlUpdate - perform action at major integration time step
 */

static void mdlUpdate(double *x, double *u, SimStruct *S, int tid)
{
}

/*
 * mdlDerivatives - compute the derivatives
 */
static void mdlDerivatives(double *dx, double *x, double *u, SimStruct *S, int tid)
{
}


/*
 * mdlTerminate - called when the simulation is terminated.
 */
static void mdlTerminate(SimStruct *S)
{
}

#ifdef	MATLAB_MEX_FILE    /* Is this file being compiled as a MEX-file? */
#include "simulink.c"      /* MEX-file interface mechanism */
#else
#include "cg_sfun.h"       /* Code generation registration function */
#endif
