function [ demodulatedBitArrayBPSK ] = bpsk_demodulation (x, number_of_bits)

    demodulatedBitArrayBPSK = zeros(number_of_bits, 1);
    for i = 1:number_of_bits
        if x(i) > 0  
            demodulatedBitArrayBPSK(i) = 1; 
        else    
            demodulatedBitArrayBPSK(i) = 0; 
        end
    end
    
end