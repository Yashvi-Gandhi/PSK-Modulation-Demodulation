clear;

number_of_bits = 32; % Number of bits to generate
carrier_freq = 1000; % Carrier wave frequency
amp_err=0.05; 
freq_err=0.025;

original_signal = generate_random_digital_signal(number_of_bits);

[demodulated_signal_bpsk,demodulated_signal_qpsk] = process_signal (carrier_freq, number_of_bits, original_signal, amp_err, freq_err);

figure(1)
subplot(3,1,1);
stem(original_signal,'markerfacecolor',[0 0 1]);
xlabel('Number of Bits');
ylabel('Bit Value');
title('Original Signal');
subplot(3,1,2);
stem(demodulated_signal_bpsk,'markerfacecolor',[0 0 1]);
xlabel('Number of Bits');
ylabel('Bit Value');
title('Demodulated BPSK');
subplot(3,1,3);
stem(demodulated_signal_qpsk,'markerfacecolor',[0 0 1]);

title('Demodulated QPSK');

resolution = 20;
max_amp_err=0.5;    %max standard deviation
max_feq_err=0.5;      %max standard deviation

plot_BER( number_of_bits, carrier_freq, resolution, max_amp_err, max_feq_err);
