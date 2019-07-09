reg anayaBase i.ingreso
tab partidopresi
tab presi
gen anaya_amlo=.
replace anaya_amlo=1 if presi==2
replace anaya_amlo=0 if presi==1
gen indes_anaam=.
replace indes_anaam=1 if presi==0
replace indes_anaam=0 if (presi==1|presi==2)
tab anaya_
tab sexo
recode sexo 2=0
reg anaya_ sexo
reg anaya_ i.carrera
char carrera[omit] 7
xi: reg anaya_ i.carrera
tab carrera anaya_amlo
edit ingh ingl inge
gen inglés= (ingh+ ingl+ inge)/3
reg anaya_ inglés
sum prom prombach paa
reg anaya_amlo prom prombach paa
reg anaya_ escpadr escmadr
reg anaya_ prom escmadr
reg anaya_ prom escmadr ingreso
reg anaya_ prom ingreso
tab leidos
reg anaya_ leidos
reg anaya_ prom escmadr ingreso leidos
reg anaya_ prom ingreso leidos
tab libros
tab inglés

reg anaya_amlo índice_se
reg anaya_amlo índice_se prom
sum índice_se
reg anaya_amlo índice_se prom leidos
reg anaya_amlo índice_se prom leidos sexo
reg anaya_amlo índice_se prom leidos paa
reg anaya_amlo índice_se prom leidos i.sitlab
tab carrera presi
tab carrera presi, row nofreq
tab carrera presi if presi==1 | presi==2, row nofreq
reg anaya_amlo índice_se prom leidos

reg indes_anaam prom interes índice_se

reg anaya_amlo índice_se corri prom, nocons







use "C:\Users\azael\OneDrive\Universidad\Econometría 1\Elecciones\baseCompleta.dta" 
label variable carrera "Carrera"
label variable sexo "Sexo"
label variable sexo "Género"
label variable sitlab "Situación laboral"
label variable prom "Promedio actual"
label variable prombach "Promedio Bachillerato"
label variable prombach "Promedio prepa"
label variable paa "Prueba aptitud"
label variable padm "Puntaje admisión"
label variable escpadr "Escolaridad padre"
label variable escmadr "Escolaridad madre"
label variable ingreso "Ingreso hogar"
label variable codpost "Codigo postal"
label variable libros "Libros en casa"
label variable leidos "Leídos"
label variable ingh "Inglés hablado"
label variable ingl "Ingles comprensión"
label variable inge "Inglés escrtio"
label variable corri "Corriente "
label variable interes "Interés político"
label variable info "Información candidatos"
label variable presi "Elección presidencia"
label variable gober "Elección gober"
label variable vio_debate "Vio debate"
label variable cambio_pref "Cambio preferencia "
label variable voto_ant "Voto anterior"
label variable partidopresi "Partido presidencia"
label variable inglés "Inglés"
label variable índice_se "Indice SE"
do "C:\Users\azael\AppData\Local\Temp\STD00000000.tmp"
do "C:\Users\azael\AppData\Local\Temp\STD00000000.tmp"
do "C:\Users\azael\AppData\Local\Temp\STD00000000.tmp"
do "C:\Users\azael\AppData\Local\Temp\STD00000000.tmp"
reg anaya_amlo ingreso escmadr
reg anaya_amlo ingreso
reg anaya_amlo índice_se
do "C:\Users\azael\AppData\Local\Temp\STD00000000.tmp"
reg anaya_amlo índice_se paa leidos
reg anaya_amlo índice_se leidos
reg anaya_amlo índice_se corri
reg anaya_amlo índice_se interes
reg anaya_amlo índice_se i.sexo
reg anaya_amlo índice_se sexo
do "C:\Users\azael\AppData\Local\Temp\STD00000000.tmp"
reg anaya_amlo índice_se corriente
reg anaya_amlo ingreso leidos
reg anaya_amlo ingreso leidos prom
tab presi
reg indes_anaam prom
reg indes_anaam prom interes
tab ingreso presi
reg indes_anaam prom interes leidos
reg indes_anaam prom interes escmadr
reg indes_anaam prom interes escpadr
reg indes_anaam prom interes escmadr
reg indes_anaam prom interes índice_se
reg indes_anaam paa interes índice_se
qnorm paa
reg anaya_amlo índice_se corri prom
reg indes_anaam paa info índice_se
reg indes_anaam paa i.info índice_se
reg indes_anaam prom interes índice_se i.sitlab
reg anaya_amlo índice_se prom
reg anaya_amlo corri índice_se inglés
reg anaya_amlo corri índice_se
reg anaya_amlo corri índice_se
reg anaya_amlo corri índice_se gober
reg anaya_amlo corri índice_se interes
reg anaya_amlo corri índice_se interes
reg anaya_amlo corri índice_se leidos
reg anaya_amlo corri índice_se prom
reg anaya_amlo corri índice_se prom sitlab
reg anaya_amlo corri índice_se prom paa
reg anaya_amlo índice_se corri prom
predict residA, resid
qnorm residA
estat hettest
estat dwatson
estat hettest, iid
drop residA
reg anaya_amlo índice_se corri padm
reg anaya_amlo índice_se corri prombach
reg anaya_amlo índice_se corri prom
reg anaya_amlo índice_se corri leidos
reg anaya_amlo índice_se corri interes
reg anaya_amlo corri codpostclasif prom
reg anaya_amlo corri codpostclasif
tab índice_se
edit
reg anaya_amlo índice_se corri prom
estat hettest
reg anaya_amlo índice_se corri prom, nocons
logit anaya_amlo índice_se corri prom
mdf
logistic anaya_amlo índice_se corri prom
reg anaya_amlo índice_se i.corri prom, nocons
reg anaya_amlo índice_se i.corri, nocons
reg anaya_amlo índice_se i.corri leidos, nocons
reg anaya_amlo índice_se i.corri, nocons
reg anaya_amlo índice_se i.corri prom, nocons
reg anaya_amlo índice_se i.corri, nocons
predict residG, resid
drop residG
reg anaya_amlo i.corri, nocons
reg anaya_amlo índice_se i.corri, nocons
predict residG, resid
qnorm residG
estat hettest
estat hettest, iid
reg índice_se anaya_amlo
reg índice_se i.anaya_amlo
reg indes_anaam prom interes índice_se
reg indes_anaam prom interes índice_se, nocons
reg indes_anaam prom interes índice_se
reg anaya_amlo índice_se prom
reg anaya_amlo índice_se prom i.corri
reg anaya_amlo índice_se i.corri
tab presi if corri==4
tab presi if corri==3
tab presi if corri==2
tab presi if corri==1
reg anaya_amlo índice_se prom sexo
tab sexo
recode sexo 2=0
reg anaya_amlo índice_se prom sexo
reg anaya_amlo índice_se prom paa
reg anaya_amlo índice_se prom leidos
reg anaya_amlo índice_se prom i.carrera
tab carrera
char carrera[omit] 12
xi: reg anaya_amlo índice_se prom i.carrera
reg anaya_amlo índice_se prom
probit anaya_amlo índice_se prom
dprobit anaya_amlo índice_se prom
probit anaya_amlo índice_se prom
mfx
 reg anaya_amlo índice_se prom
predict resid, resid
hist resid
sktest resid
hettest
imtest
vif
qnorm resid
qnorm resid
hist resid
estat hettest, ftest
estat hettest, fstat
reg anaya_amlo índice_se prom
reg anaya_amlo índice_se prom
estat hettest, fstat
reg prom índice_se
corr anaya_amlo índice_se prom
pwcorr
pwcorr prom índice_se
pwcorr anaya_amlo prom índice_se
replace voto_ant = 0 in 256
replace cambio_pref = 1 in 256
replace cambio_pref = 1 in 257
replace voto_ant = 0 in 257
save "C:\Users\azael\OneDrive\Universidad\Econometría 1\Elecciones\baseCompleta.dta", replace
save "C:\Users\azael\OneDrive\Universidad\Econometría 1\Elecciones\baseCompleta.dta", replace
drop residG
hist resid
rvfplot, yline(0)
rvfplot, yline(0)
reg prom índice_se
rvfplot, yline(0)
reg anaya_amlo índice_se prom
rvfplot, yline(0)
rvfplot, yline(0)
graph export "C:\Users\azael\Desktop\Graph.png", as(png) replace
predict probs
scatter probs
scatter probs índice_se
scatter probs prom
drop probs
reg anaya_amlo índice_se
predict probs
scatter probs índice_se
drop probs
reg anaya_amlo índice_se prom
predict probs
qnorm probs
hist probs
qnorm probs
drop probs
predict estimaciones
predict residG, resid
drop estimaciones
predict estimaciones if anaya_amlo == 0 | anaya_amlo == 1
qnorm estimaciones
sktest estimaciones
hist estimaciones, norm
sktest
sktest residG
drop resid
drop residG
reg anaya_amlo índice_se prom
predict resid, resid
sktest resid
imtest
imtest, white
reg anaya_amlo índice_se prom
pwcorr
pwcorr anaya_amlo prom índice_se
tab presi corri
tab presi corri if presi == 0 | presi == 1
tab corri presi if presi == 0 | presi == 1
