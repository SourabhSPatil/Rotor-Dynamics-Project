   clc;
 rpm=input('Enter the speed in RPM:');
 T=(60*1000)/rpm;
 display('Static Balancing [1], Dyanamic Balancing [2]');
 ch=input('Enter your choice (1/2):');
 if ch==1
    display('Enter the value of displacement without trial unbalance')
    y1=input('Amplitude (volts):');
    ph1=input('Phase (ms):');
    
    r1=y1*exp(1i*2*pi*ph1/T);
    
    display('Enter the value of Trial Unbalance')
    t=input('Magnitude (mass):');
pht=input('Angle (degree):');
    
    Tr=t*exp(1i*pht*pi/180);
    
    display('Enter the value of displacement with trial unbalance')
    y2=input('Amplitude (volts):');
    ph2=input('Phase (ms):');                  
    
    r2=y2*exp(1i*2*pi*ph2/T);
    
    alpha=(r2-r1)/Tr; 
      
    W=-r1/alpha;
    
    ampW=abs(W);
    
    angW=angle(W)*180/pi;
    
    fs='The Correction mass (w), Magnitude = %d, Angle = %d';
    display(sprintf(fs,ampW,angW));
 end
 
 if ch==2
     display('Enter the value of displacement on left plane without trial unbalance (y1a)')
    magL1=input('Amplitude (volts):');
    angL1=input('Phase (ms):');
    
    display('Enter the value of displacement on right plane without trial unbalance (y1b)')
    magR1=input('Amplitude (volts):');
    angR1=input('Phase (ms):');
    
    display('Enter the value of Trial Unbalance on right plane (Tr)')
    magTr=input('Magnitude (mass):');
    angTr=input('Angle (degree):');
    
    display('Enter the value of displacement on left plane (y2a) with trial unbalance on right plane (Tr)')
    magL2=input('Amplitude (volts):');
    angL2=input('Phase (ms):');
    
    display('Enter the value of displacement on right plane (y2b) with trial unbalance on right plane (Tr)')
    magR2=input('Amplitude (volts):');
    angR2=input('Phase (ms):');
    
    display('Enter the value of Trial Unbalance on left plane (Tl)')
    magTl=input('Magnitude (mass):');
    angTl=input('Angle (degree):');
    
    display('Enter the value of displacement on left plane (y3a) with trial unbalance on left plane (Tl)')
    magL3=input('Amplitude (volts):');
    angL3=input('Phase (ms):');
    
    display('Enter the value of displacement on right plane (y3b) with trial unbalance on left plane (Tl)')
    magR3=input('Amplitude (volts):');
    angR3=input('Phase (ms):');
    
    L1=magL1*exp(1i*angL1*2*pi/T); R1=magR1*exp(1i*angR1*2*pi/T); 

    L2=magL2*exp(1i*angL2*2*pi/T); R2=magR2*exp(1i*angR2*2*pi/T); 

    L3=magL3*exp(1i*angL3*2*pi/T); R3=magR3*exp(1i*angR3*2*pi/T);
    
    Tr=magTr*exp(1i*angTr*2*pi/T); Tl=magTl*exp(1i*angTl*2*pi/T);
    
    alpaR=(L2-L1)/Tr; alpbR=(R2-R1)/Tr; 

    alpaL=(L3-L1)/Tl; alpbL=(R3-R1)/Tl;
    
    Wr=(L1*alpbL-R1*alpaL)/(alpbR*alpaL-alpaR*alpbL);
    ampWr=abs(Wr);
    angWr=angle(Wr)*180/pi;
    fsr='The Correction mass on right plane (Wr), Magnitude = %d, Angle = %d';
    display(sprintf(fsr,ampWr,angWr));
    
    Wl=(R1*alpaR-L1*alpbR)/(alpbR*alpaL-alpaR*alpbL);
    ampWl=abs(Wl);
    angWl=angle(Wl)*180/pi;
    fsl='The Correction mass on left plane (Wl), Magnitude = %d, Angle = %d';
    display(sprintf(fsl,ampWl,angWl));
 end
    
    
    