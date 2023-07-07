%Analisi circuito RLC serie
R=1; L=5e-3; c=1e-6;
A=[0 1; -1/(L*c) -R/L]
B=[0 ; 1/(L*c)]
C=[1 0]
D=0
rlcsys=ss(A,B,C,D)
tfrlc=tf(rlcsys)
damp(rlcsys)
[y,t,x]=step(rlcsys) %%oppure stepplot(rlcsys)
figure
ic=c.*x(:,2)
plot(t,y,'r--' ,t,ic,'k')
grid
legend('Tensione ai capi del condensatore','Corrente',"Location","best")
xlim([0 0.05])
ylim([-0.1 2])
poli=pole(rlcsys)%% [T,Ah]=eig(A) poli=diag(Ah)  
%%oppure poli=pole(tfrlc)     
tau=-1/real(poli(1))
tempo1perc=4.6*tau
tempo5perc=3*tau
pos1=find(t>=tempo1perc)
pos5=find(t>=tempo5perc)
yline(y(pos1(1)))
xline(t(pos1(1)))
yline(y(pos5(1)))
xline(t(pos5(1)))
