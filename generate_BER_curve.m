clc;
eb = 0:1:29;
itr = 30;
k = 2;
berr = zeros(itr);
for j=1:1:itr
    EbNodB = eb(j); 
    mu = 0;
    sigma = 1;
    pd = makedist('Normal','mu',mu,'sigma',sigma);
    EbNo = 10.^(EbNodB / 10.0);
    x = sqrt(2 * k * EbNo) * sin(pi / (2.^k));
    bit_error_probability = 1 - cdf(pd,x);
    symbol_correct_probability = (1 - bit_error_probability).^k;
    symbol_error_probability = 1 - symbol_correct_probability;
    berr(j) = symbol_error_probability/k;
    ber_db= mag2db(berr);
end
plot(eb,ber_db,'m');
axis([0 12 -150 1]); %y-axis from 10^-150 to 10
xlabel ('$\frac{Eb}{N0} (dB) $','Interpreter','latex');
ylabel ('BER (dB)');
legend('BER');
title('BER QPSK = BPSK');