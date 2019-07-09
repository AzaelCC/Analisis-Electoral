replace prom_act = 88 in 31
replace prom_act = 82 in 33
replace prom_act = . in 410
replace prom_bach = 83 in 4
replace prom_bach = 85 in 33
gen paa2=.
replace paa2=paa if paa<100
replace paa2=(paa-prom_bach) if paa>100
gen amlo=voto_federal==2
gen anaya=voto_federal==1
ren (genero sit_laboral prom_act codigo_postal ingles_hab ingles_escu voto_federal voto_estatal) (sexo sit_lab promedio cp ing_hab ing_esc voto_fed voto_est)
gen inglés=( ing_hab+ ing_leer+ ing_esc)/3
recode sexo 2=0
replace libros_casa=. if libros_casa>4
gen amlo_anaya=voto_fed
replace amlo_anaya=. if voto_fed>2
recode amlo_anaya 1=0
recode amlo_anaya 2=1
gen i_escP=.
replace i_escP=0 if escpadr==1 | escpadr==2
replace i_escP=5 if escpadr==3
replace i_escP=10 if escpadr==4
replace i_escP=15 if escpadr==5
replace i_escP=20 if escpadr==6
replace i_escP=25 if escpadr==7
gen i_escM=.
replace i_escM=0 if escmadr==1 | escmadr==2
replace i_escM=5 if escmadr==3
replace i_escM=10 if escmadr==4
replace i_escM=15 if escmadr==5
replace i_escM=20 if escmadr==6
replace i_escM=25 if escmadr==7
gen i_ing=.
replace i_ing=1 if ingreso==1
replace i_ing=3 if ingreso==2
replace i_ing=5 if ingreso==3
replace i_ing=7 if ingreso==4
replace i_ing=10 if ingreso==5
gen i_lib=libros
recode i_lib 4=5
gen i_inglés=.
replace i_inglés=-5 if inglés==1
replace i_inglés=-1 if inglés>1 & inglés<1.6
replace i_inglés=2 if inglés>1.6 & inglés<2
replace i_inglés=5 if inglés==2
replace i_inglés=9 if inglés>2 & inglés<2.6
replace i_inglés=12 if inglés>2.6 & inglés<3
replace i_inglés=15 if inglés==3
replace i_inglés=19 if inglés>3 & inglés<3.6
replace i_inglés=22 if inglés>3.6 & inglés<4
replace i_inglés=25 if inglés==4
replace i_inglés=29 if inglés>4 & inglés<4.6
replace i_inglés=32 if inglés>4.6 & inglés<5
replace i_inglés=35 if inglés==5
gen índice_se= i_escP+ i_escM+ i_ing+ i_lib+ i_inglés
