s = serial('COM7','BAU',115200,'terminator','LF');
fopen(s);

arr2 = nan(100,3);

for i=1:100
    arr2(i,:) = fscanf(s,'%f %f %f');
    pause(0.1);
end

fclose(s);

%%
t=0:1:length(arr2)-1;
t=t*0.1;7
arr2 = arr2 - mean(arr2,1); 
filt = movmean(arr2,10);

freq=sum(diff(gradient(filt)>0)==-1,1)./10

Fs=10;
T=1/Fs;
L=100;
tfft=(0:L-1)*T;
Y=fft(filt(:,3));
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
plot(f,P1) 
title("Single-Sided Amplitude Spectrum of X(t)")
xlabel("f (Hz)")
ylabel("|P1(f)|")

plot(t,filt)
legend('X','Y','Z');