% This program will simulate the Armature controlled DC Motor Transfer funcations along with the step out waveform

disp('In order to use the program all motor parameters must be converted to SI units')

disp('If the maxium operating speed is not given please enter zero')
wmax=input('What is the maximum operating speed, Wmax(rad/s)>');

Imax=input('What is the maximum armature current, Imax(A)>');

Ke=input('What is the Voltage constant, Ke(V*s/rad)>');

Kt=input('What is the Torque constant, Kt(N*m/A)>');

Tf=input('What is the Friction torque, Tf(N*m)>');

R=input('What is the Armature resistance, R(ohms)>');
L=input('What is the Armature inductnace, L(H)>');
Jm=input('What is the Armature moment of inertia, Jm(N*m*s^2/rad)>');
Bm=input('What is the Armature viscous friction, Bm(N*M*s/rad)>');
disp('Does the motor have speed reducers and load specifications?');
ans=input('Enter 1 for YES; Enter 0 for No>')


if ans==1;

  N1=input('How many teeth are on the first(N1) speed reducer>');
  N2=input('How many teeth are on the second(N2) speed reucer>');
  JL=input('What is the Load inertia (JL)>');
  BL=input('What is the Load friction (BL)>');

disp('The Mechanical time constant is (sec)')
Tm=Jm/Bm
pause
  
disp('The Electrical time constant is (sec)')
Te=L/R
pause
disp('The Voltage-driven Transfer Funcation of the Motor (OhmM(s)/Ea(s)')

X0=(R*Bm)+(Ke*Kt);
X1=(R*Bm*(Tm+Te));
X2=(R*Bm*Tm*Te);

X10=(X0/X2);
X11=(X1/X2);
X12=(X2/X2);
X13=(Kt/X2);

num=[Kt];
den=[X2 X1 X0];
t1=tf(num, den)
step(t1)
pause

disp('The simplified of Above Transfer funcation')
num=[X13];
den=[X12 X11 X10];
t0=tf(num, den)
step(t0)
pause

disp('Therefore the natural damped frequency of the motor is>')
w=sqrt(X10)
pause

disp('Therefore the damping factor is>')
df=(X11/(2*(w)))
pause

disp('The Simplified gain is (rad/v*s)')
Ks=((Kt)/((R*Bm)+(Ke*Kt)))
pause

disp('The simplified time constantis (s)')
Ts=((R*Jm)/((R*Bm)+(Ke*Kt)))
pause

disp('The simplified velocity Motor transfer function is(ohmM(s)/Ea(s)')
num=[Ks];
den=[Ts 1];
t2=tf(num, den)
step(t2)
pause

disp('The simplified Motor position transfer funcation is (thetaM(s)/Ea(s)>')
num=[Ks];
den=[Ts 1 0];
t3=tf(num, den)
step(t3)
pause

disp('The current-driven Motor velocity transfer funcation is (ohmsM(s)/Ia(s)>')
Kc=Kt/Bm;
num=[Kc];
den=[Tm 1];
t4=tf(num,den)
step(t4)
pause

disp('The current-driven Motor poistion tranfer function is thetaM(s)/Ia(s)>')
num=[Kc];
den=[Tm 1 0];
t5=tf(num,den)
step(t5)
pause

disp('The inertia of motor and load is, (N*m*s^2/rad)')
Jt=(Jm+(((N1/N2)^2)*JL))
pause

disp('The friction of motor and load is, N*m*s/rad')
Bt=(Bm+(((N1/N2)^2)*BL))
pause

disp('The torque time constant is, (s)')
Tt=Jt/Bt
pause

disp('The velocity transfer function (of Voltage-Driven Motor,speed Reducer and Load) is ohmsL(s)/Ea(s)>')
X3=((R*Bt)+(Ke*Kt));
X4=((R*Bt)*(Tt+Te));
X5=((R*Bt*Tt*Te));
N=(Kt*(N1/N2));

X15=N/X5;
X16=X3/X5;
X17=X4/X5;
X18=X5/X5;

num=[N];
den=[X5 X4 X3];
t6=tf(num,den)
step(t6)
pause

disp('The simplified of Above Transfer funcation')
num=[X15];
den=[X18 X17 X16];
t00=tf(num,den)
step(t00)
pause

disp('The poistion transfer funcation is thetaL(s)/Ea(s)>')
num=[N];
den=[X5 X4 X3 0];
t7=tf(num,den)
step(t6)
pause

disp('The simplified of Above Transfer funcation')
num=[X15];
den=[X18 X17 X16 0];
t000=tf(num,den)
step(t000)
pause

disp('Thank for using my program')
disp('Program created by Taptej Khachh (Humber College Student)')
else
ans==0;

disp('The Mechanical time constant is (sec)')
Tm=Jm/Bm
pause  
disp('The Electrical time constant is (sec)')
Te=L/R
pause
disp('The Voltage-driven Transfer Funcation of the Motor (OhmM(s)/Ea(s)')

X0=(R*Bm)+(Ke*Kt);
X1=(R*Bm*(Tm+Te));
X2=(R*Bm*Tm*Te);


X10=(X0/X2);
X11=(X1/X2);
X12=(X2/X2);
X13=(Kt/X2);

num=[Kt];
den=[X2 X1 X0];
t1=tf(num, den)
step(t1)
pause

disp('The simplifed of Above Transfer Funcation>')
num=[X13];
den=[X12 X11 X10];
t0=tf(num, den)
step(t0)
pause

disp('Therefore the natural damped frequency of the motor is>')
w=sqrt(X10)
pause

disp('Therefore the damping factor is>')
df=(X11/(2*(w)))
pause


disp('The Simplified gain is (rad/v*s)')
Ks=((Kt)/((R*Bm)+(Ke*Kt)))
pause
disp('The simplified time constantis (s)')
Ts=((R*Jm)/((R*Bm)+(Ke*Kt)))
pause
disp('The simplified Motor velocity transfer function is (ohmM(s)/Ea(s)')

num=[Ks];
den=[Ts 1];
t2=tf(num, den)
step(t2)
pause

disp('The simplified Motor position transfer funcation is (thetaM(s)/Ea(s)>')
num=[Ks];
den=[Ts 1 0];
t3=tf(num, den)
step(t3)
pause

disp('The current-driven Motor velocity transfer funcation is (ohmsM(s)/Ia(s)>')

Kc=Kt/Bm;

num=[Kc];
den=[Tm 1];
t4=tf(num,den)
step(t4)
pause

disp('The current-driven Motor poistion tranfer function is thetaM(s)/Ia(s)>')

num=[Kc];
den=[Tm 1 0];
t5=tf(num,den)
step(t5)
pause

end
