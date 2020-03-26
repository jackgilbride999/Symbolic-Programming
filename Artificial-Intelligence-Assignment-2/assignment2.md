# CSU33061 Artificial Intelligence Assignment 2
Recall from lectures that Sam is either fit or unfit.
*S = {fit, unfit}* 
and has to decide whether to exercise or relax
*A = {exercise, relax}*
on the basis of the following (probability, reward)-matrices *(p(s,a,s'),r(s,a,s'))* for row *s*, column *s'* in table with corner *a*

exercise | fit | unfit
-------- | --- | -----
fit | .99, 8 | .01, 8
unfit | .2, 0 | .8, 0

exercise | fit | unfit
-------- | --- | -----
fit | .7, 10 | .3, 10
unfit | 0, 5 | 1, 5

The γ-discounted value of *(s,a)* is
*lim n->∞ qn(s,a)*
where
*q0(s,a) := p(s,a,fit)r(s,a,fit) + p(s,a,unfit)r(s,a,unfit)*
*Vn(s) := max(qn(s,exercise), qn(s,relax))*
*qn+1(s,a) := q0(s,a) + γ(p(s,a,fit)Vn(fit) + p(s,a,unfit)Vn(unfit)).*
In particular, γ = 0.9 leads to the following qn(s,a) for n = 0,1,2
 | exercise | relax | π
 ---- | ---- | ---- | ----
 fit | 8, 16.955, 23.812 | 10, 17.65, 23.685 | relax, relax, exercise
 unfit | 0, 5.4, 10.017 | 5, 9.5, 13.55 | relax, relax, relax
 For variety, let us add a state to S, dead for the new state set
 *S' = {fit, unfit, dead}*
 and revise the functions *p* and *r* to *p'* and *r'* as follows. Let us introduce a chance 1/10 of death from exercise
*p'(s,exercise,dead) = 1/10 for s ∈ S*
*p'(s,exercise,s') = 9p(s,exercise,s')/10 for s,s' ∈ S*
and a chance 1/100 of death from relaxing
*p'(s,relax,dead) = 1/100 for s ∈ S*
*p'(s,relax,s') = 99p(s,relax,s')/10 for s,s' ∈ S*
and treat death as a sink
*p'(dead,a,dead) = 1 for a ∈ A*
*r'(s,a,dead) = 0 for s ∈ S', a ∈ A.*
Your task is to write a program that given a positive integer *n*, a γ-setting *G (0<G<1),* and a state *s ∈ S'* returns the values
*qn(s,exercise)* and *qn(s,relax)*
for γ = *G* and the revised functions *p'* and *r'*. You may use Python or if you prefer, Prolog.