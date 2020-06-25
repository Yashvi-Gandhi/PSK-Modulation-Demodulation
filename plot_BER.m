function plot_BER ( number_of_bits, carrier_freq, resolution, max_amp_err, max_freq_err)
%% Prepare Arrays

bpsk_BER = zeros(resolution, resolution);
qpsk_BER = zeros(resolution, resolution);

%% Generate BER Values

for i=1:resolution
    for j=1:resolution
        amp_err = i/resolution*(max_amp_err); 
        freq_err = j/resolution*(max_freq_err);

        original_signal = generate_random_digital_signal(number_of_bits);
        [qpsk_carrier_wave_e, qpsk_carrier_wave,time_axis_qpsk, no_samp_in_symb_qpsk, x_qpsk, y_qpsk] = qpsk_modulation( carrier_freq, number_of_bits, original_signal, amp_err, freq_err);
        [bpsk_carrier_wave_e, bpsk_carrier_wave,time_axis_bpsk, no_samp_in_symb_bpsk, x_bpsk, y_bpsk] = bpsk_modulation(carrier_freq, number_of_bits, original_signal, amp_err, freq_err);

        [ demodulated_signal_bpsk ] = bpsk_demodulation (x_bpsk, number_of_bits);
        [ demodulated_signal_qpsk ] = qpsk_demodulation (x_qpsk, y_qpsk, number_of_bits);

        bpsk_ber_val = calculate_BER (number_of_bits, original_signal, demodulated_signal_bpsk);
        qpsk_ber_val = calculate_BER (number_of_bits, original_signal, demodulated_signal_qpsk);

        bpsk_BER(i, j)=bpsk_ber_val;
        qpsk_BER(i, j)=qpsk_ber_val;
    end
end

arr_amp_err= 1/resolution*(max_amp_err):1/resolution*(max_amp_err):max_amp_err;
arr_freq_err= 1/resolution*(max_freq_err):1/resolution*(max_freq_err):max_freq_err;

figure(4);
subplot(1,2,1);
surf(arr_freq_err,arr_amp_err,bpsk_BER);
colormap hsv
colorbar
title('BPSK');
xlabel ('$\sigma_{\Omega}$','Interpreter','latex');
ylabel ('$\sigma_{U}$','Interpreter','latex');
zlabel ('BER');

subplot(1,2,2);
surf(arr_freq_err,arr_amp_err,qpsk_BER);
colormap hsv
colorbar
title('QPSK');
xlabel ('$\sigma_{\Omega}$','Interpreter','latex');
ylabel ('$\sigma_{U}$','Interpreter','latex');
zlabel ('BER');

end
