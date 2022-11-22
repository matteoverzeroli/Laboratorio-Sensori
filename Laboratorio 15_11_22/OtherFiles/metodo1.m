%calcolo il gradiente sui dati filtrati (filt) e estraggo le posizioni in
%cui il gradiente e' maggiore di zero (array di 0, nelle posizioni dove il 
% gradiente e' <=0, 1 nelle posizioni in cui il gradiente e' >0
grad_pos = gradient(filt)>0;

%calcolo il numero totale (sum) dei picchi vedendo i punti in cui il 
%gradiente passa da un valore positivo a uno negativo (diff(grad)==-1)
number_peaks = sum(diff(grad_pos)==-1,1);

%divido il numero di picchi trovati per il tempo di misura pari a 10s
freq = number_peaks./10;


