function [filtered_signal_1,filtered_signal_2] = filter_signal(modulated_signal,carrier_freq,time,sampling_frequency)
    component_1 = modulated_signal * cos(2*pi*carrier_freq*time);
    component_2 = modulated_signal * sin(2*pi*carrier_freq*time);
    
    filtered_signal_1 = lowpass(component_1,carrier_freq-10,sampling_frequency);
    filtered_signal_2 = lowpass(component_2,carrier_freq-10,sampling_frequency); 

end