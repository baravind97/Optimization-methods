/*********************************************
 * OPL 20.1.0.0 Model
 * Author: barav
 * Creation Date: 10 Jan 2022 at 00:14:41
 *********************************************/
{string} salad_contents = ...; //set of meat contents in salad indexed as i
{string} salad_nutrients = ...; // set of nutrients in salad indexed as j
float a[salad_contents][salad_nutrients] = ...; //Matrix of content & nutrients
float cost[salad_contents] = ...; //cost per lb of contents in salad
float lower[salad_nutrients] = ...; //lower bound in nutrients 
float upper[salad_nutrients] = ...; //upper bound in nutrients

//Decision variables
dvar float+ x[salad_contents];

//objective function
minimize sum(i in salad_contents) cost[i] * x[i];

//constraints
subject to {
forall (j in salad_nutrients)
sum(i in salad_contents ) a[i][j]*x[i] >= lower[j];
  
forall (j in salad_nutrients)
sum(i in salad_contents ) a[i][j]*x[i] <= upper[j];
  
}
