function [ demodulatedBitArrayQPSK ] = qpsk_demodulation (x, y, number_of_bits)

    demodulatedBitArrayQPSK = zeros(number_of_bits, 1);
    for i = 1:number_of_bits/2
        if x(i) > 0        
            if y(i) > 0           
                demodulatedBitArrayQPSK((2*i) - 1) = 1;
                demodulatedBitArrayQPSK(2*i) = 1;          
            else        
                demodulatedBitArrayQPSK((2*i) - 1) = 1;
                demodulatedBitArrayQPSK(2*i) = 0;           
            end       
        else        
            if y(i) > 0            
                demodulatedBitArrayQPSK((2*i) - 1) = 0;
                demodulatedBitArrayQPSK(2*i) = 1;            
            else            
                demodulatedBitArrayQPSK((2*i) - 1) = 0;
                demodulatedBitArrayQPSK(2*i) = 0;           
            end        
        end    
    end

end