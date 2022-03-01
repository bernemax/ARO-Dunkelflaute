Scalars
*max invest budget
IB           /2000000000/
*big M
M            /10000/
*reliability of powerlines (simplification of n-1 criteria)
reliability  /1/
*curtailment costs
cur_costs    /150/
*ratio storage capacity factor
store_cpf    /7/
*base value for per unit calculation
MVABase      /500/

************************ARO

Toleranz            / 0.001 /

LB                  / -1e10 /

UB                  / 1e10 /

itaux               / 1 /

Gamma_Load          /0/

Gamma_PG_conv       /0/

Gamma_PG_PV         /0/

Gamma_PG_Wind       /0/
;

Parameter
Node_Demand                     upload table
Ger_Demand                      upload table
Grid_tech                       upload table
Gen_conv                        upload table
Gen_res                         upload table
Gen_Hydro                       upload table
priceup                         upload table
availup_hydro                   upload table
availup_res                     upload table
Grid_invest_new                 upload table
Grid_invest_upgrade             upload table 

*************************************Load

total_load(t)                   electrical demand in germany in hour t
load(n,t)                       electrical demand in each node in hour t
delta_load(n,t)                 max increase of demand in each node in hour t
load_share(n)                   electrical demand share per node
Neighbor_Demand(t,n)            electrical demand in neighboring countries of germany in hour t
LS_costs(n)                     loadshedding costs per node

Demand_data_fixed(n,t,v)        fixed realisation of demand in subproblem and tranferred to master

*************************************lines

B(l)                            susceptance of existing lines in german Grid
B_prosp(l)                      susceptance of existing lines in german Grid
H(l,n)                          flow senitivity matrix
Incidence(l,n)
L_cap(l)                        max. power of each existing line (220 & 380)
L_cap_prosp(l)                  max. power of each prospective 380 kv line
circuits(l)                     number of parallel lines in grid
I_costs_upg(l)                  investment cost for an upgrade from 220 kv line to 380 kv line
I_costs_new(l)                  investment cost for a new line or connection (e.g. PCI)

**************************************generation 

PG_M_fixed_conv(g,t,v)           fixed realisation of supply in subproblem and tranferred to master
AF_M_PV_fixed(t,sr,n,v)          fixed PV availability factor in subproblem and tranferred to master
AF_M_Wind_fixed(t,wr,n,v)        fixed Wind availability factor in subproblem and tranferred to master

**************************************tech & costs
Fc_conv(g,t)                    fuel costs conventional powerplants
Fc_res(res,t)                   fuel costs renewable powerplants
CO2_content(g)                  Co2 content
CO2_costs(t)                    CO2 costs
SU_costs(g,t)                   start-up costs conventionals
su_fact(g)                      start-up factor conventionals
fuel_start(g)                   fuel consumption factor if start-up decision
depri_costs(g)                  deprication costs conventionals
var_costs(g,t)                  variable costs conventional power plants

cap_conv(g)                     max. generation capacity of each conventional generator
delta_cap_conv(g)               max. decrease of generation capacity of each conventional generator
cap_hydro(s)                    max. generation capacity of each psp
cap_res(res)                    max. generation capacity of each RES

Eff_conv(g)                     efficiency of conventional powerplants
Eff_hydro(s)                    efficiency of hydro powerplants
Eff_res(res)                    efficiency of renewable powerplants

**************************************Availability

af_hydro(s,t)                   availability of hydro potential
af_PV_up(t,sr,n)                upper capacity factor of solar energy
delta_af_PV(t,sr,n) 
af_wind_up(t,wr,n)              upper capacity factor of wind energy
delta_af_Wind(t,wr,n) 

**************************************historical physical flow

phy_flow_to_DE(t,n)             physical cross border flow for each country specific node in direct realtion with germany
phy_flow_states_exo(t,n)        physical cross border flow for each country specific node in no realtion with germany

*********************************************report parameters********************************************************

report_main(*,*)
report_decomp(v,*,*)
inv_iter_hist(l,v)
inv_cost_master


$ontext
Time_restrict_up
Time_restrict_lo
*solve_time(,*)

report_mapped_flow(l,t)                directed flow report
report_mapped_flow_DE(t)               saldo flow report regarding total Ex and imports of germany
report_mapped_ExIm_flow(l,t)           directed flow report from and to DE neigboring countries
report_mapped_ExIm_sum_flow(n)  	   directed summarized flow report from and to DE neigboring countries

report_resulting_load_De(t)
report_price(n,t)
report_price_de(t)

report_total_gen(t)
report_total_gen_g(t)
report_total_gen_r(t)
report_total_gen_s(t)

report_DE_gen_lig(t)
report_DE_gen_coal(t)
report_DE_gen_gas(t)
report_DE_gen_oil(t)
report_DE_gen_nuc(t)
report_DE_gen_waste(t)

report_DE_gen_Sun(t)
report_DE_gen_Wind(t)
report_DE_gen_BIO(t)

report_DE_gen_ROR(t)
report_DE_gen_PSP(t)
report_DE_gen_Reservoir(t)

report_DE_charge(t)

report_countries_gen_lig(n,t)
report_countries_gen_coal(n,t)
report_countries_gen_gas(n,t)
report_countries_gen_oil(n,t)
report_countries_gen_nuc(n,t)
report_countries_gen_waste(n,t)

report_countries_gen_sun(n,t)
report_countries_gen_wind(n,t)
report_countries_gen_bio(n,t)

report_countries_gen_ROR(n,t)
report_countries_gen_PSP(n,t)
report_countries_gen_Reservoir(n,t)

report_Gen_Denmark(n,t)
report_Gen_Sweden(n,t)
report_Gen_Poland(n,t)
report_Gen_Czechia(n,t)
report_Gen_Austria(n,t)
report_Gen_Swiss(n,t)
report_Gen_France(n,t)
report_Gen_Luxemburg(n,t)
report_Gen_Belgium(n,t)
report_Gen_Netherland(n,t)
$offtext
**********************************************input Excel table*******************************************************
;

$onecho > TEP.txt
set=Map_send_L                  rng=Mapping!A3:B1000                    rdim=2 cDim=0
set=Map_res_L                   rng=Mapping!D3:E1000                    rdim=2 cDim=0
set=MapG                        rng=Mapping!G3:H567                     rdim=2 cDim=0
set=MapS                        rng=Mapping!J3:K180                     rdim=2 cDim=0
set=MapRes                      rng=Mapping!S3:T1027                    rdim=2 cDim=0
set=MapWr                       rng=Mapping!AA3:AB483                   rdim=2 cDim=0
set=MapSr                       rng=Mapping!AD3:AE483                   rdim=2 cDim=0
set=Map_WR_wind                 rng=Mapping!AG3:AI483                   rdim=3 cDim=0
set=Map_SR_sun                  rng=Mapping!AK3:AM483                   rdim=3 cDim=0
set=SR_sun                      rng=Mapping!AO3:AP483                   rdim=2 cDim=0
set=WR_wind                     rng=Mapping!AR3:AS483                   rdim=2 cDim=0
set=Border_exist_DE             rng=Mapping!V3:V47                      rdim=1 cDim=0


par=Node_Demand                 rng=Node_Demand!A1:C506                 rDim=1 cdim=1
par=Neighbor_Demand             rng=Neighboring_countries!A2:L8762      rDim=1 cdim=1
par=Ger_Demand                  rng=Node_Demand!E1:F8761                rDim=1 cdim=1
par=Grid_tech                   rng=Grid_tech!A1:H843                   rDim=1 cdim=1
par=Gen_conv                    rng=Gen_conv!B2:J567                    rDim=1 cdim=1
par=Gen_res                     rng=Gen_res!A2:E1123                    rDim=1 cdim=1
par=Gen_Hydro                   rng=Gen_Hydro!A2:F180                   rDim=1 cdim=1
par=priceup                     rng=prices!A1:I8761                     rDim=1 cdim=1
par=availup_hydro               rng=Availability!A2:D8762               rDim=1 cdim=1
par=availup_res                 rng=Av_country!A2:Z8762                 rDim=1 cdim=1
par=phy_flow_to_DE              rng=Cross_border_flow!A2:J8763          rDim=1 cdim=1
par=phy_flow_states_exo         rng=Cross_border_flow!L2:T8763          rDim=1 cdim=1
par=Grid_invest_new             rng=Grid_invest!A2:K50                  rDim=1 cdim=1
$offecho

$onUNDF
$call   gdxxrw Data.xlsx @TEP.txt
$GDXin  Data.gdx
$load   Map_send_L, Map_res_L, MapG, MapS, MapRes, MapSr, MapWr, Map_WR_wind, Map_SR_sun, SR_sun, WR_wind
$load   Border_exist_DE
$load   Node_Demand,Neighbor_Demand, Ger_demand, Grid_tech
$load   Gen_conv, Gen_res, Gen_Hydro, priceup
$load   availup_hydro, availup_res
$load   phy_flow_to_DE, Phy_flow_states_exo
$load   Grid_invest_new
$GDXin
$offUNDF

*res availiability corrisponding to german 60 zones
*par=availup_res                 rng=Availability!E2:DU8762              rDim=1 cdim=1 
;
*####################################subset definitions#############################

Map_Grid(l,n)$(Map_send_L(l,n)) = yes
;
Map_Grid(l,n)$(Map_res_L(l,n)) = yes
;
Relevant_Nodes(n)$NoDeSciGrid(n)  = no
;
De(n)$NoDeSciGrid(n)  = no

;
gas(g)      =    Gen_conv(g,'tech')  = 1
;
oil(g)      =    Gen_conv(g,'tech')  = 2
;
coal(g)     =    Gen_conv(g,'tech')  = 3
;
lig(g)      =    Gen_conv(g,'tech')  = 4
;
nuc(g)      =    Gen_conv(g,'tech')  = 5
;
waste(g)    =    Gen_conv(g,'tech')  = 6
;

***************************************hydro****************************************

psp(s)      =    Gen_Hydro(s,'tech') = 1
;
reservoir(s)=    Gen_Hydro(s,'tech') = 2
;
ror(s)      =    Gen_Hydro(s,'tech') = 3
;

****************************************res*****************************************

wind(res)   =    Gen_res(res,'tech') = 1
;
sun(res)    =    Gen_res(res,'tech') = 2
;
biomass(res)=    Gen_res(res,'tech') = 3
;

*###################################loading parameter###############################

*****************************************demand*************************************

total_load(t)       =          Ger_demand(t,'total_load')
;
LS_costs(n)         =          Node_Demand(n,'LS_costs')
;
load_share(n)       =          Node_Demand(n,'share')
;

*****************************************prices*************************************

Fc_conv(gas,t)      =          priceup(t,'gas')
;
Fc_conv(oil,t)      =          priceup(t,'oil')
;
Fc_conv(coal,t)     =          priceup(t,'coal')
;
Fc_conv(lig,t)      =          priceup(t,'lignite')
;
Fc_conv(nuc,t)      =          priceup(t,'nuclear')
;
Fc_conv(waste,t)    =          priceup(t,'waste')
;
Fc_res(biomass,t)   =          priceup(t,'biomass')
;
CO2_costs(t)        =          priceup(t,'CO2')
;

************************************Grid technical**********************************

B(l)                =          Grid_tech(l,'Susceptance')
;
incidence(l,n)      =          Map_Grid(l,n)
;
L_cap(l)            =          Grid_tech(l,'L_cap')
;
circuits(l)         =          Grid_tech(l,'circuits')
;
L_cap_prosp(l)      =          Grid_invest_new(l,'new_cap')
;
B_prosp(l)          =          Grid_invest_new(l,'Susceptance')
;

*************************************generators*************************************

Cap_conv(g)         =          Gen_conv(g,'Gen_cap')
;
Cap_hydro(s)        =          Gen_Hydro(s,'Gen_cap')
;
Cap_res(res)        =          Gen_res(res,'Gen_cap')
;
Eff_conv(g)         =          Gen_conv(g,'eff')
;
Eff_hydro(s)        =          Gen_Hydro(s,'eff')
;
Eff_res(res)        =          Gen_res(res,'eff')
;
Co2_content(g)      =          Gen_conv(g,'CO2')
;
su_fact(g)          =          Gen_conv(g,'su_fact')
;
depri_costs(g)      =          Gen_conv(g,'depri_costs')
;
fuel_start(g)       =          Gen_conv(g,'fuel_start')
;

************************************availability************************************


af_hydro(ror,t)                         =          availup_hydro(t,'ror')
;
af_hydro(psp,t)                         =          availup_hydro(t,'psp')
;
af_hydro(reservoir,t)                   =          availup_hydro(t,'reservoir')
;
af_PV_up(t,sr,n)$MapSR(n,sr)            =          availup_res(t,sr)
;
delta_af_PV(t,sr,n)$MapSR(n,sr)         =          availup_res(t,sr) * 0.95
;
af_Wind_up(t,wr,n)$MapWR(n,wr)          =          availup_res(t,wr)
;
delta_af_Wind(t,wr,n)$MapWR(n,wr)       =          availup_res(t,wr) * 0.95
;
*************************************Investments************************************

I_costs_new(l)      =  (Grid_invest_new(l,'Inv_costs_new')/(8760/card(t))) 
;
*I_costs_upg(l)      =  (Grid_invest_upgrade(l,'Inv_costs_upgrade')/(8760/card(t))) 
*;
*************************************calculating************************************

H(l,n)                              =            B(l)* incidence(l,n)
;
load(n,t)$(De(n))                   =            (load_share(n)*total_load(t) ) / 1
;
delta_load(n,t)$(De(n))             =            load_share(n)*total_load(t) * 0.1
; 
load(n,t)$(border_states(n))        =            (Neighbor_Demand(t,n)) 
;
delta_load(n,t)$(border_states(n))  =            Neighbor_Demand(t,n) * 0.1
;
delta_Cap_conv(g)                   =            Cap_conv(g) * 0.9
;


var_costs(g,t)                      =            ((FC_conv(g,t)+ co2_costs(t) * co2_content(g)) / Eff_conv(g))
;
su_costs(g,t)                       =            depri_costs(g) + su_fact(g) * fuel_start(g) * FC_conv(g,t) + co2_content(g) * co2_costs(t)
;
