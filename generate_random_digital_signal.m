function original_signal = generate_random_digital_signal(number_of_bits)

    original_signal = rand(number_of_bits,1);

    for i = 1:number_of_bits
        if(original_signal(i) < 0.5)
            original_signal(i) = 0;
        else
            original_signal(i) = 1;
        end
    end

end
