clc
close all
clear all
fclose('all')
format shortG
sample_rate=96000;
fftlen = 4096;
x=[1:1:fftlen];
f=[1:1:fftlen]*96000/2/(4096/2+1);
smooth_len=2
fftx=zeros(fftlen,smooth_len);  
sinx=zeros(fftlen,smooth_len);  

% frequency1 = 25500;
% sinx(:,1) = sin(2*pi*frequency1*x/sample_rate)';
% fftx(:,1) = fft(sinx(:,1))/fftlen;
frequency2 = 26000;
sinx(:,2) = sin(2*pi*frequency2*x/sample_rate)';
fftx(:,2) = fft(sinx(:,2))/fftlen;
for frequency = 20000:1:30000
    
    sinx(:,1) = sinx(:,1)+ sin(2*pi*frequency*x/sample_rate)';
end
fftx(:,1) = fft(sinx(:,1))/fftlen;
figure (1)
plot(x(1:1:100),[sinx((1:1:100),1),sinx((1:1:100),2)]);
figure (2)
plot(f', [abs(fftx(:,1)),abs(fftx(:,2))])
