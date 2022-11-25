%codice tratto da: https://it.mathworks.com/help/matlab/ref/fft.html

%frequenza di campionamento della board
Fs = 10;
%periodo di campionamento
T = 1/Fs;
%vettore dei tempi, filt E'il segnale filtrato
tfft = (0:length(filt)-1)*T;
%FFT della componente z del segnale filtrato
Y = fft(filt(:,3));
%calcolo dello spettro a due lati (frequenze positive e negative) P2 e
%calcolo dello spettro a un lato (solo frequenza positive) P1
P2 = abs(Y/length(filt));
P1 = P2(1:length(filt)/2+1);
P1(2:end-1) = 2*P1(2:end-1);
%calcolo dello spettro delle frequenze (asse x)
f = Fs*(0:(length(filt)/2))/length(filt);
%plot dello spettro in frequenza del segnale filtrato
plot(f,P1) 
title("Single-Sided Amplitude Spectrum of X(t)")
xlabel("f [Hz]")
ylabel("|P1(f)|")