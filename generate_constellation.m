function [bpsk_constellation, qpsk_constellation] = generate_constellation (number_of_bits, original_signal)

    bpsk_constellation = zeros(number_of_bits, 3);
    qpsk_constellation = zeros(floor(number_of_bits/2), 1);

    for i=1:number_of_bits
        if original_signal(i) == 0
            bpsk_constellation(i,1)=0;
            bpsk_constellation(i,2)=0;
            bpsk_constellation(i,3)=1;
        end
        if original_signal(i) == 1
            bpsk_constellation(i,1)=1;
            bpsk_constellation(i,2)=0;
            bpsk_constellation(i,3)=0;
        end
    end

    for i = 1:(number_of_bits/2)
        if original_signal(2*i) == 0
                if original_signal((2*i)-1) == 0
                    qpsk_constellation(i) = 1;
                end 
                if original_signal((2*i)-1) == 1
                    qpsk_constellation(i) = 2;
                end
        end
        if original_signal(2*i) == 1
                if original_signal((2*i)-1) == 0
                    qpsk_constellation(i) = 3;
                end 
                if original_signal((2*i)-1) == 1
                    qpsk_constellation(i) = 4;
                end
        end
    end

end