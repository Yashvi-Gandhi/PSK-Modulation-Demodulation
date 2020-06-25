function [BER] = calculate_BER (number_of_bits, original_signal, demodulated_signal)

    iterator = 0;
    for i = 1:number_of_bits
        if original_signal(i) ~= demodulated_signal(i)
            iterator = iterator + 1;
        end
    end
    BER = iterator / number_of_bits;

end