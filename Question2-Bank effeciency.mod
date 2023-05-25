/*********************************************
 * OPL 20.1.0.0 Model
 * Author: barav
 * Creation Date: 13 Jan 2022 at 17:54:06
 *********************************************/  
{string}inputs = ...; //number of inputs indexed by i
{string}banks = ...;  //number of banks indexed by j
{string}outputs = ...; //number of output indexed s
float F[inputs][banks] = ...; //number of inputs
float C[outputs][banks] = ...;//number of outputs
float F_0[inputs] = ...;      //input to bank2
float C_0[outputs] = ...;     //output to bank2 

//Decision variables
dvar float+ U[outputs]; //weights for output
dvar float+ V[inputs];  //weights for input


maximize sum(j in outputs) U[j]*C_0[j];

subject to{
  constraint1:
  sum(i in inputs) V[i]*F_0[i] == 1;
  
forall(j in banks)
  constraints2:
  sum(s in outputs)U[s]*C[s][j] - sum(i in inputs)V[i]*F[i][j] <= 0;
forall (j in outputs)
  U[j] >= 0.00001;
forall (i in inputs)
  V[i] >= 0.00001;
}