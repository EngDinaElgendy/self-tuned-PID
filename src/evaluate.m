function delta = evaluate (Pop_Kp , Pop_Ki)

set_param ('power_V2G_GA/V2G 4 MW (100x40 kW)/Grid regulation/Grid regulation ocntrol/Gain1','Gain',num2str(1e6*Pop_Kp));
set_param ('power_V2G_GA/V2G 4 MW (100x40 kW)/Grid regulation/Grid regulation ocntrol/Gain','Gain',num2str(1e6*Pop_Ki));
sim ('power_V2G_GA');
Wmin = min(Werr);
Wmax = max(Werr);
delta = Wmax-Wmin;

end