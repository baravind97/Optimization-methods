/*********************************************
 * OPL 20.1.0.0 Model
 * Author: barav
 * Creation Date: 10 Jan 2022 at 02:10:47
 *********************************************/
tuple arc{
  string origin; //start node
  string destination; //destination node
}
{string}S = ...;  //set of supply nodes indexed i
{string}D = ...;  //set of demand nodes indexed j
{string}T = ...;  //set of transhipment indexed k
{arc}A = ...;     //set of arcs indexed as a
float c[A] = ...; //cost of shipping in each node to other
float supply[S] = ...; //demand for i
float demand[D] = ...; // demand for j
	
//Decision variables
dvar boolean x[A];

//Objective function
minimize sum(a in A) c[a] * x[a];

//constraints
subject to {
  forall(i in S)
  sum(a in A : a.origin == i) x[a] == supply[i];
  
  forall (j in D)
  sum(a in A : a.destination==j) x[a] == demand[j];
  
  forall(k in T)
  sum(a in A : a.destination == k) x[a] - sum(a in A : a.origin == k) x[a] == 0;
}
