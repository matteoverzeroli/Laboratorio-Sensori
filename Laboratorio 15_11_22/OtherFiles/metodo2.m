Fs = 10;
T = 1/Fs;

tfft = (0:length(filt)-1)*T;

Y = fft(filt(:,3));
P2 = abs(Y/length(filt));
P1 = P2(1:length(filt)/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(length(filt)/2))/length(filt);