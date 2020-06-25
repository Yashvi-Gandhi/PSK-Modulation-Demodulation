function [demodulated_signal_bpsk,demodulated_signal_qpsk] = process_signal (carrier_freq, number_of_bits, original_signal, amp_err, freq_err)

[qpsk_modulated_wave_e,qpsk_modulated_wave, time_axis_qpsk, no_samp_qpsk, x_qpsk, y_qpsk] = qpsk_modulation(carrier_freq, number_of_bits, original_signal, amp_err, freq_err);
[bpsk_modulated_wave_e,bpsk_modulated_wave, time_axis_bpsk, no_samp_bpsk, x_bpsk, y_bpsk] = bpsk_modulation(carrier_freq, number_of_bits, original_signal, amp_err, freq_err);

figure(2)
subplot(2,2,1);
plot (time_axis_qpsk,qpsk_modulated_wave_e,'b')
xlabel ('time[s]');
ylabel ('signal');
title('QPSK Modulation with noise');
subplot(2,2,2);
plot (time_axis_qpsk,qpsk_modulated_wave,'b')
xlabel ('time[s]');
ylabel ('signal');
title('QPSK Modulation');
subplot(2,2,3);
plot (time_axis_bpsk,bpsk_modulated_wave_e,'b')
xlabel ('time[s]');
ylabel ('signal');
title('BPSK Modulation with noise');
subplot(2,2,4);
plot (time_axis_bpsk,bpsk_modulated_wave,'b')
xlabel ('time[s]');
ylabel ('signal');
title('BPSK Modulation');

[bpsk_constellation, qpsk_constellation] = generate_constellation (number_of_bits, original_signal);


figure(3)
subplot(1,2,1);
scatter(x_qpsk,y_qpsk,10,qpsk_constellation,'filled');
axis([-1 1 -1 1]);
xlabel('X');
ylabel('Y');
title('Constellation QPSK');
subplot(1,2,2);
scatter(x_bpsk,y_bpsk,10,bpsk_constellation,'filled');
axis([-1 1 -1 1]);
xlabel('X');
ylabel('Y');
title('Constellation BPSK');

demodulated_signal_bpsk = bpsk_demodulation (x_bpsk, number_of_bits);
demodulated_signal_qpsk = qpsk_demodulation (x_qpsk, y_qpsk, number_of_bits);

bpsk_BER_val = calculate_BER (number_of_bits, original_signal, demodulated_signal_bpsk);
qpsk_BER_val = calculate_BER (number_of_bits, original_signal, demodulated_signal_qpsk);

disp(100*(1 - bpsk_BER_val));
disp(100*(1-qpsk_BER_val));

end
