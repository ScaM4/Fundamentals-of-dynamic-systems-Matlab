RESONANCE RLC
r=0;c=1e-6;l=1e-3;
A=[-r/l -1/l; 1/c 0];
B=[1/l;0];
C=[0 1];
D=0;
rlcsystem=ss(A,B,C,D)
rlctf=tf(rlcsystem)
poli=[pole(rlcsystem)]'
rlocus(rlctf)
damp(rlctf)
[zeri,gain]=zero(rlcsystem);
zpgtransf=zpk(zeri,poli,gain)%%inutile in questo caso, poli complessi coniugati.
%time constant in infinite because there is no dissipation of energy =>
%r=0; l'induttore e il condensatore si scambiano reciprocamente energia
%elettrica/magnetica
initial(rlcsystem,[0;1],0.005) %%Condensatore carico e corrente iniziale nulla;

%Simuliamo il sistema quando in ingresso vi è un ingresso sinusoidale
omega=sqrt(1/(l*c)) %la pulsazione di risonanza è uguale al polo,
omega1=imag(poli(1));
f=omega/(2*pi);
tau=1/f;
[u,t]=gensig('sin',tau,0.002);
y=lsim(rlcsystem,u,t);
plot(t,y,'r',t,u,'g')
xlim('auto')
ylim('auto')
grid on 
[gpeak,fpeak]=getPeakGain(rlcsystem) %con la frequenza di risonanza si ha il più alto guadagno possibile.
