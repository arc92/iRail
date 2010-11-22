#!/bin/perl
################################################################\__
#This file is part of iRail         #     #      #                 \
#                                   #     #      #                   \
#See project.iRail.be for more details.###  #  ################### ### _
#                                                                       #_
#This script produces a list of Stations for the Belgian iRail API        #
# Author: Pieter Colpaert <pieter aŧ iRail.be>                              #
##########################################################################__ #
 #  #     #  #    #  #     #  #     #  #     #  #    #  #
  ##       ##      ##       ##       ##       ##      ##
my @pieces;

#initialising used vars
my %stations;
while(<DATA>){
  my %station;
  @pieces = split(/;/gi, $_);
  chomp $pieces[-1];
  if($#pieces > 3){
    #now we've got a BE string
#    if($stations{ $pieces[1] } ){
      %station = %{$stations{$pieces[1]}};
      $station{x} = $pieces[3];
      $station{y} = $pieces[2];
      $station{id} = $pieces[0];
      $stations{$pieces[1]} = \%station;
  }else{
    #here we have railtime ids
      %station = %{$stations{$pieces[1]}};
      $station{rtid} = $pieces[2];
      $stations{$pieces[1]} = \%station;
  }

}
#loop through everything and combine what's possible
%stationscp = %stations;
$cOut = 0; #outer loop count
while (($name0, $stationref0) = each(%stations)){
  my %station0;
  %station0 = %{$stationref0};
  $cIn = 0; #inner loop count
  while (($name1, $stationref1) = each(%stationscp)){
    my %station1;
    %station1 = %{$stationref1};
    if(($cIn != $cOut) && ($station0{rtid} eq $station1{rtid}) && $station1{id} && $station1{id} ne $station0{id}){
      $station0{id} = $station1{id};
      $station0{x} = $station1{x};
      $station0{y} = $station1{y};
      $stations{$name0} = \%station0;
    }
    $cin ++;
  }
  
  $cOut ++;
}


#print

foreach $name (sort keys %stations) {
     %station = %{$stations{$name}};
     if($station{id} && $station{rtid}){ # CHECK WHETHER DATA IS COMPLETE
       print $station{id} . ";".$name . ";" . $station{y} . ";" . $station{x} . ";" . $station{rtid} . ";" . "\n";
     }
}


__DATA__
BE.NMBS.1;AALST;50.943053;4.038586;
;AALST;6
;AALST KERREBROEK;104
BE.NMBS.2;AALST KERREBROEK;50.948316;4.024773;
BE.NMBS.3;AALTER;51.092258;3.447856;
;AALTER;8
;AARLEN;70
BE.NMBS.4;AARSCHOT;50.984408;4.824036;
;AARSCHOT;9
;AARSELE;10
BE.NMBS.5;AARSELE;50.984458;3.418361;
;AAT;77
;ACREN;12
BE.NMBS.6;ACREN;50.732936;3.846683;
;AISEAU;16
BE.NMBS.7;AISEAU;50.429545;4.584378;
;ALKEN;19
BE.NMBS.8;ALKEN;50.886419;5.29173;
;ALOST;6
;AMAY;22
BE.NMBS.9;AMAY;50.546006;5.320489;
;AMPSIN;24
BE.NMBS.10;AMPSIN;50.539236;5.288855;
;ANDENNE;25
BE.NMBS.11;ANDENNE;50.496799;5.095972;
;ANGLEUR;27
BE.NMBS.12;ANGLEUR;50.61253;5.600949;
;ANS;31
BE.NMBS.13;ANS;50.661214;5.509703;
;ANSEREMME;34
BE.NMBS.14;ANSEREMME;50.238016;4.905525;
;ANTOING;35
BE.NMBS.15;ANTOING;50.569628;3.451308;
;ANTWERPEN BERCHEM;139
;ANTWERPEN BERCHEM;139
BE.NMBS.16;ANTWERPEN BERCHEM;51.198914;4.4332;
;ANTWERPEN CENTRAAL;37
;ANTWERPEN CENTRAAL;37
BE.NMBS.17;ANTWERPEN CENTRAAL;51.21686;4.421242;
;ANTWERPEN DAM;38
;ANTWERPEN DAM;38
BE.NMBS.18;ANTWERPEN DAM;51.231782;4.426479;
;ANTWERPEN HAVEN;30
;ANTWERPEN HAVEN;30
;ANTWERPEN LUCHTBAL;764
;ANTWERPEN LUCHTBAL;764
;ANTWERPEN NOORDERDOKK;58
BE.NMBS.19;ANTWERPEN NOORDERDOKKEN;51.264045;4.42874;
;ANTWERPEN NOORDERDOKKEN;58
BE.NMBS.20;ANTWERPEN OOST;51.206616;4.434799;
;ANTWERPEN OOST;61
;ANTWERPEN OOST;61
BE.NMBS.21;ANTWERPEN ZUID;51.197514;4.392258;
;ANTWERPEN ZUID;64
;ANTWERPEN ZUID;64
;ANVERS BERCHEM;139
;ANVERS CENTRAL;37
;ANVERS DAM;38
;ANVERS EST;61
;ANVERS LUCHTBAL;764
;ANVERS NOORDERDOKKEN;58
;ANVERS SUD;64
BE.NMBS.22;ANZEGEM;50.826208;3.495469;
;ANZEGEM;66
BE.NMBS.23;APPELTERRE;50.81345;3.972025;
;APPELTERRE;67
BE.NMBS.24;ARCHENNES;50.754337;4.662366;
;ARCHENNES;68
BE.NMBS.25;ARLON;49.679975;5.810614;
;ARLON;70
BE.NMBS.26;ASSE;50.906731;4.208422;
;ASSE;74
BE.NMBS.27;ASSESSE;50.36855;5.021306;
;ASSESSE;75
BE.NMBS.28;ATH;50.6271;3.776406;
;ATH;77
;ATHUS;78
;AUBANGE;1841
;AUDENARDE;939
BE.NMBS.29;AUVELAIS;50.44917;4.6307;
;AUVELAIS;82
;AYE;100
BE.NMBS.30;AYE;50.224872;5.300689;
BE.NMBS.31;AYWAILLE;50.473014;5.672483;
;AYWAILLE;84
;BAASRODE SUD;102
;BAASRODE ZUID;102
BE.NMBS.32;BAASRODE ZUID;51.019236;4.153992;
;BALEGEM DORP;105
BE.NMBS.33;BALEGEM DORP;50.919953;3.7907;
;BALEGEM SUD;106
;BALEGEM VILLAGE;105
;BALEGEM ZUID;106
BE.NMBS.34;BALEGEM ZUID;50.900803;3.805767;
;BALEN;107
BE.NMBS.35;BALEN;51.168314;5.16605;
;BAMBRUGGE;110
BE.NMBS.36;BAMBRUGGE;50.913903;3.935661;
;BARVAUX;114
BE.NMBS.37;BARVAUX;50.349541;5.502133;
;BAS OHA;118
BE.NMBS.38;BAS OHA;50.522625;5.190939;
;BASSE WAVRE;120
BE.NMBS.39;BASSE WAVRE;50.724184;4.621178;
;BASTENAKEN NOORD;124
;BASTENAKEN ZUID;123
;BASTOGNE NORD;124
BE.NMBS.40;BASTOGNE NORD;50.00716;5.721388;
;BASTOGNE SUD;123
BE.NMBS.41;BASTOGNE SUD;49.99963;5.709672;
;BEAURAING;126
BE.NMBS.42;BEAURAING;50.113836;4.957029;
;BEERNEM;127
BE.NMBS.43;BEERNEM;51.128008;3.329886;
;BEERSEL;128
BE.NMBS.44;BEERSEL;50.766404;4.302274;
;BEERVELDE;130
;BEGIJNENDIJK;132
BE.NMBS.45;BEGIJNENDIJK;51.021972;4.800344;
;BEIGNEE;133
BE.NMBS.46;BEIGNEE;50.333239;4.406797;
;BELLEM;136
BE.NMBS.47;BELLEM;51.083908;3.487367;
;BELSELE;138
BE.NMBS.48;BELSELE;51.150903;4.089164;
;BERCHEM SAINTE AGATHE;243
BE.NMBS.49;BERCHEM SAINTE AGATHE;50.872831;4.290961;
;BERGEN;848
;BERINGEN;143
BE.NMBS.50;BERINGEN;51.076814;5.231867;
;BERLAAR;142
BE.NMBS.51;BERLAAR;51.113708;4.638258;
;BERTRIX;146
BE.NMBS.52;BERTRIX;49.852199;5.267703;
;BERZEE;147
BE.NMBS.53;BERZEE;50.285589;4.405942;
;BEUZET;148
BE.NMBS.54;BEUZET;50.532914;4.750092;
;BEVEREN ;151
;BEVEREN;151
;BEVEREN;151
BE.NMBS.55;BEVEREN;51.20845;4.26052;
;BIERGES WALIBI;153
BE.NMBS.56;BIERGES WALIBI;50.707772;4.594753;
;BIERSET AWANS;155
BE.NMBS.57;BIERSET AWANS;50.658614;5.46055;
;BILZEN;157
BE.NMBS.58;BILZEN;50.86869;5.50918;
;BINCHE;158
BE.NMBS.59;BINCHE;50.408764;4.172453;
;BISSEGEM;160
BE.NMBS.60;BISSEGEM;50.825844;3.224047;
;BLANKENBERGE;166
BE.NMBS.61;BLANKENBERGE;51.312431;3.133862;
;BLANMONT;167
BE.NMBS.62;BLANMONT;50.619447;4.636386;
;BLATON;169
BE.NMBS.63;BLATON;50.505939;3.665675;
;BLERET;171
BE.NMBS.64;BLERET;50.685161;5.28599;
;BOCKSTAEL;1767
BE.NMBS.65;BOCKSTAEL;50.879428;4.348507;
;BOECHOUT;177
BE.NMBS.66;BOECHOUT;51.163828;4.494047;
;BOITSFORT;183
BE.NMBS.67;BOITSFORT;50.794458;4.407986;
;BOKRIJK;184
BE.NMBS.68;BOKRIJK;50.955514;5.408728;
;BOMAL;185
BE.NMBS.69;BOMAL;50.37691;5.519342;
;BOOISCHOT;187
BE.NMBS.70;BOOISCHOT;51.0375;4.772797;
;BOOM;188
BE.NMBS.71;BOOM;51.091006;4.360297;
;BOONDAAL;189
BE.NMBS.72;BOONDAAL;50.801975;4.393523;
;BOONDAEL;189
;BOORTMEERBEEK;190
BE.NMBS.73;BOORTMEERBEEK;50.98185;4.573897;
;BORDET;191
BE.NMBS.74;BORDET;50.877782;4.409992;
;BORGWORM;1213
BE.NMBS.75;BORGWORM;50.694725;5.248986;
;BORNEM;192
BE.NMBS.76;BORNEM;51.098819;4.240431;
;BOSVOORDE;183
BE.NMBS.77;BOSVOORDE;50.794458;4.407986;
;BOURG LEOPOLD;708
;BOUSSU;195
BE.NMBS.78;BOUSSU;50.436239;3.79585;
;BOUWEL;199
BE.NMBS.79;BOUWEL;51.165844;4.747581;
;BRACQUEGNIES;201
BE.NMBS.80;BRACQUEGNIES;50.474413;4.126332;
;BRAINE L'ALLEUD;203
BE.NMBS.81;BRAINE L ALLEUD;50.684778;4.375525;
;BRAINE LE COMTE;205
BE.NMBS.82;BRAINE LE COMTE;50.605075;4.137658;
;BRESSOUX;208
BE.NMBS.83;BRESSOUX;50.644473;5.612496;
;BRUGELETTE;209
BE.NMBS.84;BRUGELETTE;50.594131;3.85305;
;BRUGES ;210
;BRUGES;210
;BRUGES SAINT PIERRE;212
;BRUGES  SINT PIETERS;212
;BRUGGE ;210
;BRUGGE;210
BE.NMBS.85;BRUGGE;51.197225;3.216728;
;BRUGGE  SINT PIETERS;212
;BRUGGE SINT PIETERS;212
BE.NMBS.86;BRUGGE ST PIETERS;51.222658;3.201742;
;BRUSSEL CENTRAAL;215
BE.NMBS.87;BRUSSEL CENTRAAL;50.845175;4.357131;
;BRUSSEL  CENTRAL;215
;BRUSSEL  CHAPELLE;217
;BRUSSEL  CONGRES;216
;BRUSSEL CONGRES;216
BE.NMBS.88;BRUSSEL CONGRES;50.851671;4.362634;
;BRUSSEL KAPELLEKERK;217
BE.NMBS.89;BRUSSEL KAPELLEKERK;50.841131;4.347869;
;BRUSSEL  LUXEMBOURG;218
;BRUSSEL LUXEMBURG;218
BE.NMBS.90;BRUSSEL LUXEMBURG;50.83886;4.37382;
;BRUSSEL  MIDI;220
;BRUSSEL NATIONAAL LUCHTHAVEN;219
BE.NMBS.91;BRUSSEL NAT LUCHTHAVEN;50.896821;4.48549;
;BRUSSEL NOORD;221
BE.NMBS.92;BRUSSEL NOORD;50.859658;4.360854;
;BRUSSEL  NORD;221
;BRUSSEL  OUEST;223
;BRUSSELS AIRPORT;219
;BRUSSELS  CENTRAL;215
;BRUSSELS  CHAPELLE;217
;BRUSSEL  SCHUMAN;227
;BRUSSEL SCHUMAN;227
BE.NMBS.93;BRUSSEL SCHUMAN;50.842851;4.380022;
;BRUSSELS  CONGRES;216
;BRUSSELS LUXEMBOURG;218
;BRUSSELS  MIDI;220
;BRUSSELS  NORD;221
;BRUSSELS  OUEST;223
;BRUSSELS  SCHUMAN;227
;BRUSSEL WEST;223
;BRUSSEL ZUID;220
BE.NMBS.94;BRUSSEL ZUID;50.836782;4.336922;
;BRUXELLES CENTRAL;215
BE.NMBS.95;BRUXELLES CENTRAL;50.845175;4.357131;
;BRUXELLES CHAPELLE;217
BE.NMBS.96;BRUXELLES CHAPELLE;50.841131;4.347869;
;BRUXELLES CONGRES;216
BE.NMBS.97;BRUXELLES CONGRES;50.851671;4.362634;
;BRUXELLES LUXEMBOURG;218
BE.NMBS.101;BRUXELLES LUXEMBOURG;50.83886;4.37382;
;BRUXELLES MIDI;220
BE.NMBS.98;BRUXELLES MIDI;50.836782;4.336922;
BE.NMBS.99;BRUXELLES NAT AEROPORT;50.896821;4.48549;
;BRUXELLES NATIONAL AEROPORT;219
;BRUXELLES NORD;221
BE.NMBS.100;BRUXELLES NORD;50.859658;4.360854;
;BRUXELLES OUEST;223
;BRUXELLES SCHUMAN;227
BE.NMBS.102;BRUXELLES SCHUMAN;50.842851;4.380022;
;BUDA;229
BE.NMBS.103;BUDA;50.908281;4.417053;
;BUGGENHOUT;231
BE.NMBS.104;BUGGENHOUT;51.016228;4.200575;
;BUIZINGEN;232
BE.NMBS.105;BUIZINGEN;50.751581;4.258561;
;BURST;235
BE.NMBS.106;BURST;50.907103;3.920911;
;CALLENELLE;246
BE.NMBS.107;CALLENELLE;50.527192;3.526182;
;CAMBRON CASTEAU;247
BE.NMBS.108;CAMBRON CASTEAU;50.587131;3.874183;
;CARLSBOURG;249
BE.NMBS.109;CARLSBOURG;49.903539;5.097419;
;CARNIERES;250
BE.NMBS.110;CARNIERES;50.4477;4.264386;
;CEROUX MOUSTY;252
BE.NMBS.111;CEROUX MOUSTY;50.659325;4.568547;
;CHAPELLE DIEU;255
BE.NMBS.112;CHAPELLE DIEU;50.557902;4.698662;
;CHAPOIS;257
BE.NMBS.113;CHAPOIS;50.262372;5.124278;
;CHARLEROI OUEST;258
BE.NMBS.114;CHARLEROI OUEST;50.409741;4.435644;
;CHARLEROI SUD;259
BE.NMBS.115;CHARLEROI SUD;50.404713;4.438567;
;CHARLEROI WEST;258
;CHARLEROI ZUID;259
;CHASTRE;261
BE.NMBS.116;CHASTRE;50.607464;4.649833;
;CHATEAU DE SEILLES;262
BE.NMBS.117;CHATEAU DE SEILLES;50.49721;5.081753;
;CHATELET;263
BE.NMBS.118;CHATELET;50.410103;4.52186;
;CHENEE;266
BE.NMBS.119;CHENEE;50.608327;5.61484;
;CINEY;272
BE.NMBS.120;CINEY;50.292022;5.090581;
;COMBLAIN LA TOUR;277
BE.NMBS.121;COMBLAIN LA TOUR;50.45663;5.567193;
;COMINES;278
BE.NMBS.122;COMINES;50.77225;2.999117;
BE.NMBS.123;COO;50.391311;5.880883;
;COO;992
;COUILLET;281
BE.NMBS.124;COUILLET;50.392727;4.469343;
;COURCELLES MOTTE;286
BE.NMBS.126;COURCELLES MOTTE;50.462014;4.400528;
;COURRIERE;287
BE.NMBS.127;COURRIERE;50.387727;4.995732;
;COUR SUR HEURE;288
BE.NMBS.125;COUR SUR HEURE;50.300889;4.392258;
;COURTRAI;649
;COURT SAINT ETIENNE;289
BE.NMBS.128;COURT SAINT ETIENNE;50.645566;4.565819;
;COUVIN;291
BE.NMBS.129;COUVIN;50.057871;4.492653;
;DAVE SAINT MARTIN;313
BE.NMBS.130;DAVE SAINT MARTIN;50.429042;4.884233;
;DE HOEK;316
BE.NMBS.131;DE HOEK;50.739181;4.370128;
;DEINZE;317
BE.NMBS.134;DEINZE;50.97824;3.53494;
;DELTA;1761
BE.NMBS.135;DELTA;50.819281;4.403972;
;DENDERLEEUW;318
BE.NMBS.136;DENDERLEEUW;50.891925;4.071828;
;DENDERMONDE;319
BE.NMBS.137;DENDERMONDE;51.022775;4.101431;
;DE PANNE;13
BE.NMBS.132;DE PANNE;51.077288;2.602397;
;DE PINTE;320
BE.NMBS.133;DE PINTE;50.99735;3.650883;
;DIEGEM;325
BE.NMBS.138;DIEGEM;50.890481;4.441931;
;DIEPENBEEK;324
BE.NMBS.139;DIEPENBEEK;50.911414;5.416061;
;DIESDELLE;824
;DIEST;326
BE.NMBS.140;DIEST;50.993342;5.050025;
;DIKSMUIDE;327
BE.NMBS.141;DIKSMUIDE;51.033075;2.869156;
;DILBEEK;328
BE.NMBS.142;DILBEEK;50.866731;4.243389;
;DINANT;329
BE.NMBS.143;DINANT;50.260724;4.908179;
;DIXMUDE;327
;DOLHAIN GILEPPE;331
BE.NMBS.144;DOLHAIN GILEPPE;50.616374;5.936683;
;DOORNIK;1154
BE.NMBS.145;DOORNIK;50.613125;3.396936;
;DRONGEN;335
BE.NMBS.146;DRONGEN;51.0474;3.653483;
;DUFFEL;336
BE.NMBS.147;DUFFEL;51.091633;4.492194;
;DUINBERGEN;337
BE.NMBS.148;DUINBERGEN;51.338108;3.26295;
;ECAUSSINNES;342
BE.NMBS.149;ECAUSSINNES;50.5621;4.156094;
;EDE;345
BE.NMBS.150;EDE;50.911203;3.987761;
;EDINGEN;360
BE.NMBS.151;EDINGEN;50.697198;4.04725;
;EEKLO;346
BE.NMBS.152;EEKLO;51.180567;3.575256;
;EERKEN;68
;EICHEM;347
BE.NMBS.153;EICHEM;50.823878;3.993659;
;EIGENBRAKEL;203
BE.NMBS.154;EIGENBRAKEL;50.684778;4.375525;
;EINE;348
BE.NMBS.155;EINE;50.871008;3.623697;
;EKE NAZARETH;351
BE.NMBS.156;EKE NAZARETH;50.961558;3.627192;
;EKEREN;352
BE.NMBS.157;EKEREN;51.277214;4.433047;
;ENGHIEN;360
BE.NMBS.158;ENGHIEN;50.697198;4.04725;
;ENGIS;361
BE.NMBS.159;ENGIS;50.582964;5.401992;
;EPPEGEM;363
BE.NMBS.160;EPPEGEM;50.9584;4.457486;
;ERBISOEUL;364
BE.NMBS.161;ERBISOEUL;50.507814;3.888717;
;EREMBODEGEM;365
BE.NMBS.162;EREMBODEGEM;50.919302;4.055543;
;ERNAGE;366
BE.NMBS.163;ERNAGE;50.592412;4.667119;
;ERPE MERE;367
BE.NMBS.164;ERPE MERE;50.928603;3.962461;
;ERPS KWERPS;368
BE.NMBS.165;ERPS KWERPS;50.896506;4.584997;
;ERQUELINNES;369
BE.NMBS.166;ERQUELINNES;50.304189;4.113564;
;ERQUELINNES DORP;371
;ERQUELINNES VILLAGE;371
BE.NMBS.167;ERQUELINNES VILLAGE;50.309539;4.130281;
;ESNEUX;375
BE.NMBS.168;ESNEUX;50.529628;5.572658;
;ESSEN;376
BE.NMBS.169;ESSEN;51.462736;4.451106;
;ESSENE LOMBEEK;378
BE.NMBS.170;ESSENE LOMBEEK;50.882447;4.115169;
;ETTERBEEK;380
BE.NMBS.171;ETTERBEEK;50.821208;4.390222;
;EUPEN;382
BE.NMBS.172;EUPEN;50.635164;6.037114;
;EVERE;383
BE.NMBS.173;EVERE;50.868281;4.4012;
;EVERGEM;1843
;EZEMAAL;384
BE.NMBS.174;EZEMAAL;50.772131;4.994222;
;FAMILLEUREUX;391
BE.NMBS.175;FAMILLEUREUX;50.519364;4.211575;
;FARCIENNES;392
BE.NMBS.176;FARCIENNES;50.435567;4.565091;
;FAUX;395
BE.NMBS.177;FAUX;50.621833;4.549264;
;FEXHE LE HAUT CLOCHER;399
BE.NMBS.178;FEXHE LE HAUT CLOCHER;50.664364;5.397297;
;FLAWINNE;400
BE.NMBS.179;FLAWINNE;50.456244;4.8063;
;FLEMALLE GRANDE;401
BE.NMBS.180;FLEMALLE GRANDE;50.605352;5.480983;
;FLEMALLE HAUTE;402
BE.NMBS.181;FLEMALLE HAUTE;50.594591;5.456364;
;FLEURUS;404
BE.NMBS.182;FLEURUS;50.481021;4.542909;
;FLOREE;405
BE.NMBS.183;FLOREE;50.357516;5.056275;
;FLOREFFE;406
BE.NMBS.184;FLOREFFE;50.443733;4.762781;
;FLORENVILLE;409
BE.NMBS.185;FLORENVILLE;49.706969;5.331119;
;FLORIVAL;410
BE.NMBS.186;FLORIVAL;50.761503;4.653873;
;FONTAINE VALMONT;412
BE.NMBS.187;FONTAINE VALMONT;50.320439;4.211775;
;FORCHIES;413
BE.NMBS.188;FORCHIES;50.43305;4.323483;
;FOREST EST;414
BE.NMBS.189;FOREST EST;50.810204;4.320936;
;FOREST MIDI;415
BE.NMBS.190;FOREST MIDI;50.810158;4.310025;
;FORRIERES;418
BE.NMBS.191;FORRIERES;50.133072;5.276572;
;FRAIPONT;421
BE.NMBS.192;FRAIPONT;50.565414;5.723475;
;FRAMERIES;422
BE.NMBS.193;FRAMERIES;50.405539;3.906314;
;FRANCHIMONT;423
BE.NMBS.194;FRANCHIMONT;50.525214;5.822594;
;FRANIERE;424
BE.NMBS.195;FRANIERE;50.439544;4.733547;
;FROYENNES;427
BE.NMBS.196;FROYENNES;50.629856;3.355508;
;FURNES;1181
;GALMAARDEN;432
BE.NMBS.197;GALMAARDEN;50.743998;3.964938;
;GAMMERAGES;432
;GAND DAMPOORT;449
;GAND SAINT PIERRE;455
BE.NMBS.207;GAND-SAINT-PIERRE;51.035763;3.710232;
;GASTUCHE;433
BE.NMBS.198;GASTUCHE;50.736647;4.649597;
;GAVERE ASPER;434
BE.NMBS.199;GAVERE ASPER;50.930558;3.638958;
;GEDINNE;435
BE.NMBS.200;GEDINNE;49.984133;4.977867;
;GEEL;436
BE.NMBS.201;GEEL;51.169244;4.989567;
;GEMBLOUX;438
BE.NMBS.202;GEMBLOUX;50.571292;4.690778;
;GENDRON CELLES;442
BE.NMBS.203;GENDRON CELLES;50.210804;4.964598;
;GENK;1670
BE.NMBS.204;GENK;50.967056;5.49803;
;GENLY;446
BE.NMBS.205;GENLY;50.390639;3.911636;
;GENTBRUGGE;447
BE.NMBS.208;GENTBRUGGE;51.038714;3.755975;
;GENT DAMPOORT;449
BE.NMBS.206;GENT DAMPOORT;51.05665;3.740491;
;GENT SINT PIETERS;455
BE.NMBS.207;GENT SINT PIETERS;51.035763;3.710232;
;GENVAL;457
BE.NMBS.209;GENVAL;50.726408;4.513725;
;GERAARDSBERGEN;458
BE.NMBS.210;GERAARDSBERGEN;50.771025;3.871956;
;GHENT DAMPOORT;449
;GHENT SINT PIETERS;455
;GHLIN;462
BE.NMBS.211;GHLIN;50.487408;3.906342;
;GLAAIEN;470
;GLONS;470
BE.NMBS.212;GLONS;50.750543;5.535468;
;GODARVILLE;471
BE.NMBS.213;GODARVILLE;50.4928;4.290314;
;GODINNE;472
BE.NMBS.214;GODINNE;50.348908;4.869961;
;GONTRODE;474
BE.NMBS.215;GONTRODE;50.979844;3.801559;
;GOUVY;477
BE.NMBS.216;GOUVY;50.189414;5.953908;
;GOUY LEZ PIETON;479
BE.NMBS.217;GOUY LEZ PIETON;50.4957;4.325064;
;GRAIDE;480
BE.NMBS.218;GRAIDE;49.933789;5.043708;
;GRAMMONT;458
;GROENENDAAL;486
BE.NMBS.219;GROENENDAAL;50.76614;4.44935;
;GROOT BIJGAARDEN;488
BE.NMBS.220;GROOT BIJGAARDEN;50.868231;4.27455;
;GRUPONT;489
BE.NMBS.221;GRUPONT;50.090622;5.280228;
;HAACHT;493
BE.NMBS.222;HAACHT;50.966238;4.613314;
;HAALTERT;494
BE.NMBS.223;HAALTERT;50.907375;4.021797;
;HABAY;496
BE.NMBS.224;HABAY;49.718619;5.632569;
;HAININ;501
BE.NMBS.225;HAININ;50.428042;3.766787;
;HAL;504
BE.NMBS.226;HAL;50.7332;4.2395;
;HALANZY;502
;HALLE;504
BE.NMBS.227;HALLE;50.7332;4.2395;
;HAMBOS;507
BE.NMBS.230;HAMBOS;50.944247;4.663011;
BE.NMBS.231;HAMOIR;50.428342;5.53373;
;HAMOIR;510
BE.NMBS.228;HAM SUR HEURE;50.320539;4.405086;
;HAM SUR HEURE;514
BE.NMBS.229;HAM SUR SAMBRE;50.452852;4.672923;
;HAM SUR SAMBRE;515
BE.NMBS.232;HANSBEKE;51.072708;3.537447;
;HANSBEKE;518
BE.NMBS.233;HARCHIES;50.481939;3.699;
;HARCHIES;519
BE.NMBS.234;HARELBEKE;50.856308;3.314617;
;HARELBEKE;520
;HAREN;1663
BE.NMBS.235;HAREN;50.889231;4.419825;
BE.NMBS.236;HAREN SUD;50.889567;4.415109;
;HAREN SUD;521
BE.NMBS.237;HAREN ZUID;50.889567;4.415109;
;HAREN ZUID;521
BE.NMBS.238;HASSELT;50.931122;5.32618;
;HASSELT;523
BE.NMBS.239;HAUTE FLONE;50.554331;5.331097;
;HAUTE FLONE;530
BE.NMBS.240;HAVERSIN;50.249672;5.194081;
;HAVERSIN;532
BE.NMBS.241;HAVRE;50.470739;4.058311;
;HAVRE;535
BE.NMBS.242;HEIDE;51.365344;4.461131;
;HEIDE;539
BE.NMBS.243;HEIST;51.334008;3.240611;
;HEIST;540
BE.NMBS.244;HEIST OP DEN BERG;51.073517;4.709361;
;HEIST OP DEN BERG;541
BE.NMBS.245;HEIZIJDE;50.988814;4.157117;
;HEIZIJDE;542
BE.NMBS.246;HEMIKSEM;51.136393;4.338527;
;HEMIKSEM;546
BE.NMBS.247;HENNUYERES;50.651008;4.175892;
;HENNUYERES;550
BE.NMBS.248;HERENT;50.903528;4.672189;
;HERENT;553
BE.NMBS.249;HERENTALS;51.181;4.828608;
;HERENTALS;554
;HERGENRATH;825
BE.NMBS.250;HERNE;50.723701;4.014376;
;HERNE;559
BE.NMBS.251;HERSEAUX;50.71425;3.244758;
;HERSEAUX;560
BE.NMBS.252;HERSTAL;50.6604;5.62235;
;HERSTAL;562
BE.NMBS.253;HERZELE;50.897203;3.879358;
;HERZELE;563
BE.NMBS.254;HEUSDEN;51.038314;5.280683;
;HEUSDEN;565
BE.NMBS.255;HEVER;50.996904;4.539585;
;HEVER;566
BE.NMBS.256;HEVERLEE;50.862442;4.694414;
;HEVERLEE;567
BE.NMBS.257;HILLEGEM;50.891303;3.857472;
;HILLEGEM;568
BE.NMBS.258;HOBOKEN POLDER;51.183414;4.348442;
;HOBOKEN POLDER;570
BE.NMBS.259;HOEI;50.527239;5.234206;
;HOEI;592
BE.NMBS.260;HOEILAART;50.760158;4.467406;
;HOEILAART;572
BE.NMBS.261;HOFSTADE;50.988661;4.498342;
;HOFSTADE;574
BE.NMBS.262;HOLLEKEN;50.767081;4.354914;
;HOLLEKEN;578
BE.NMBS.263;HONY;50.540336;5.573494;
;HONY;579
BE.NMBS.264;HOURAING;50.702879;3.835269;
;HOURAING;583
BE.NMBS.265;HOURPES;50.363689;4.308742;
;HOURPES;585
BE.NMBS.266;HOUYET;50.190339;5.005861;
;HOUYET;589
BE.NMBS.267;HOVE;51.154114;4.465469;
;HOVE;590
BE.NMBS.268;HUIZINGEN;50.75171;4.265581;
;HUIZINGEN;591
BE.NMBS.269;HUY;50.527239;5.234206;
;HUY;592
BE.NMBS.270;IDDERGEM;50.876855;4.068503;
;IDDERGEM;600
BE.NMBS.271;IDEGEM;50.801704;3.921411;
;IDEGEM;601
BE.NMBS.272;IEPER;50.8474;2.876589;
;IEPER;602
BE.NMBS.273;INGELMUNSTER;50.914758;3.254289;
;INGELMUNSTER;604
BE.NMBS.274;IZEGEM;50.920958;3.21335;
;IZEGEM;606
BE.NMBS.275;JAMBES;50.454014;4.87536;
;JAMBES;611
BE.NMBS.276;JAMBES EST;50.454804;4.880256;
;JAMBES EST;610
;JAMBES OOST;610
BE.NMBS.277;JAMIOULX;50.353039;4.410997;
;JAMIOULX;612
BE.NMBS.278;JEMAPPES;50.452289;3.885189;
;JEMAPPES;615
BE.NMBS.279;JEMELLE;50.160472;5.266375;
;JEMELLE;617
BE.NMBS.280;JEMEPPE SUR MEUSE;50.61843;5.49779;
;JEMEPPE SUR MEUSE;619
BE.NMBS.281;JEMEPPE SUR SAMBRE;50.450949;4.662626;
;JEMEPPE SUR SAMBRE;620
BE.NMBS.282;JETTE;50.88091;4.328463;
;JETTE;621
;JURBEKE;628
BE.NMBS.283;JURBISE;50.530503;3.910686;
;JURBISE;628
BE.NMBS.284;JUSLENVILLE;50.544514;5.810194;
;JUSLENVILLE;629
BE.NMBS.285;KALMTHOUT;51.389744;4.466942;
;KALMTHOUT;630
BE.NMBS.287;KAPELLEN;51.313375;4.433081;
;KAPELLEN;632
BE.NMBS.286;KAPELLE OP DEN BOS;51.010795;4.358819;
;KAPELLE OP DEN BOS;634
BE.NMBS.288;KESSEL;51.151056;4.618458;
;KESSEL;635
BE.NMBS.289;KIEWIT;50.954364;5.350553;
;KIEWIT;636
BE.NMBS.290;KIJKUIT;51.379236;4.467533;
;KIJKUIT;637
BE.NMBS.291;KNOKKE;51.339608;3.284097;
;KNOKKE;642
BE.NMBS.292;KOKSIJDE;51.078667;2.654107;
;KOKSIJDE;643
;KOMEN;278
BE.NMBS.293;KOMEN;50.77225;2.999117;
BE.NMBS.294;KONTICH;51.13364;4.476695;
;KONTICH;644
BE.NMBS.295;KORTEMARK;51.025358;3.043867;
;KORTEMARK;647
BE.NMBS.296;KORTENBERG;50.893072;4.543297;
;KORTENBERG;648
BE.NMBS.297;KORTRIJK;50.824339;3.265676;
;KORTRIJK;649
BE.NMBS.298;KWATRECHT;50.991464;3.833333;
;KWATRECHT;654
BE.NMBS.303;LABUISSIERE;50.316139;4.186581;
;LABUISSIERE;664
BE.NMBS.299;LA HULPE;50.737958;4.497064;
;LA HULPE;672
BE.NMBS.300;LA LOUVIERE CENTRE;50.477773;4.179965;
;LA LOUVIERE CENTRE;673
;LA LOUVIERE CENTRUM;673
;LA LOUVIERE SUD;1744
BE.NMBS.301;LA LOUVIERE SUD;50.465017;4.190115;
;LA LOUVIERE ZUID;1744
BE.NMBS.304;LANDEGEM;51.064114;3.576889;
;LANDEGEM;682
BE.NMBS.305;LANDELIES;50.377314;4.350981;
;LANDELIES;683
BE.NMBS.306;LANDEN;50.747925;5.079658;
;LANDEN;684
BE.NMBS.307;LANDSKOUTER;50.970664;3.791227;
;LANDSKOUTER;685
BE.NMBS.308;LANGDORP;51.002469;4.863539;
;LANGDORP;686
;LA PANNE;13
BE.NMBS.302;LA ROCHE;50.610336;4.539158;
;LA ROCHE ;692
BE.NMBS.310;LEBBEKE;51.004606;4.134544;
;LEBBEKE;699
BE.NMBS.309;LE CAMPINAIRE;50.429587;4.552951;
;LE CAMPINAIRE;700
BE.NMBS.311;LEDE;50.970903;3.984975;
;LEDE;701
BE.NMBS.312;LEIGNON;50.267772;5.107781;
;LEIGNON;704
BE.NMBS.313;LEMAN;50.5995;5.467;
;LEMAN;705
BE.NMBS.314;LEMBEEK;50.715108;4.221581;
;LEMBEEK;706
BE.NMBS.315;LENS;50.559128;3.903279;
;LENS;707
BE.NMBS.316;LEOPOLDSBURG;51.117314;5.257289;
;LEOPOLDSBURG;708
;LESSEN;710
BE.NMBS.317;LESSINES;50.712947;3.836492;
;LESSINES;710
BE.NMBS.318;LEUVEN;50.881356;4.716096;
;LEUVEN;715
BE.NMBS.319;LEUZE;50.600576;3.61677;
;LEUZE;719
BE.NMBS.320;LEVAL;50.4308;4.211044;
;LEVAL;720
BE.NMBS.321;LIBRAMONT;49.920425;5.379272;
;LIBRAMONT;723
BE.NMBS.322;LICHTERVELDE;51.025281;3.126908;
;LICHTERVELDE;724
BE.NMBS.323;LIEDEKERKE;50.882525;4.095286;
;LIEDEKERKE;725
BE.NMBS.324;LIEGE GUILLEMINS;50.622935;5.568461;
;LIEGE GUILLEMINS;726
BE.NMBS.325;LIEGE JONFOSSE;50.6403;5.561125;
;LIEGE JONFOSSE;728
BE.NMBS.326;LIEGE PALAIS;50.64705;5.57255;
;LIEGE PALAIS;730
BE.NMBS.327;LIER;51.136022;4.561579;
;LIER;732
;LIERDE;1085
BE.NMBS.328;LIERDE;50.816822;3.825947;
;LIERRE;732
BE.NMBS.329;LIERS;50.698464;5.566533;
;LIERS;733
BE.NMBS.330;LIGNY;50.511514;4.565608;
;LIGNY;736
BE.NMBS.331;LILLOIS;50.643742;4.363247;
;LILLOIS;738
BE.NMBS.332;LIMAL;50.692144;4.575297;
;LIMAL;739
BE.NMBS.333;LINKEBEEK;50.773331;4.339781;
;LINKEBEEK;742
BE.NMBS.334;LISSEWEGE;51.294708;3.194506;
;LISSEWEGE;743
BE.NMBS.335;LOBBES;50.346384;4.260988;
;LOBBES;744
BE.NMBS.336;LODELINSART;50.43245;4.462947;
;LODELINSART;747
BE.NMBS.337;LOKEREN;51.107103;3.985283;
;LOKEREN;748
BE.NMBS.338;LOMMEL;51.211664;5.310547;
;LOMMEL;750
BE.NMBS.339;LONDERZEEL;51.009519;4.296936;
;LONDERZEEL;751
BE.NMBS.340;LONZEE;50.551939;4.720097;
;LONZEE;754
BE.NMBS.341;LOT;50.765175;4.272426;
;LOT;759
BE.NMBS.318;LOUVAIN;50.881356;4.716096;
;LOUVAIN;715
BE.NMBS.342;LOUVAIN LA NEUVE UNIV;50.6697;4.616;
;LOUVAIN LA NEUVE UNIVERSITE;762
;LOUVAIN LA NEUVE UNIVERSITEIT;762
;LUIK GUILLEMINS;726
;LUIK JONFOSSE;728
;LUIK PALEIS;730
BE.NMBS.343;LUSTIN;50.369746;4.877468;
;LUSTIN;767
;LUTTICH  GUILLEMINS;726
;LUTTICH  JONFOSSE;728
;LUTTICH  PALAIS;730
BE.NMBS.344;LUTTRE;50.505864;4.384119;
;LUTTRE;768
BE.NMBS.345;MAFFLE;50.614031;3.800459;
;MAFFLE;782
BE.NMBS.346;MALDEREN;51.014325;4.231403;
;MALDEREN;781
;MALINES;810
;MALINES NEKKERSPOEL;811
BE.NMBS.347;MANAGE;50.506114;4.234678;
;MANAGE;784
BE.NMBS.348;MARBEHAN;49.728319;5.539533;
;MARBEHAN;786
BE.NMBS.349;MARCHE EN FAMENNE;50.222472;5.346294;
;MARCHE EN FAMENNE;788
BE.NMBS.350;MARCHE LES DAMES;50.480739;4.964581;
;MARCHE LES DAMES;789
BE.NMBS.351;MARCHE LEZ ECAUSSINNES;50.545931;4.176558;
;MARCHE LEZ ECAUSSINNES;790
BE.NMBS.352;MARCHIENNE AU PONT;50.412173;4.394223;
;MARCHIENNE AU PONT;791
BE.NMBS.353;MARCHIENNE ZONE;50.397166;4.389017;
;MARCHIENNE ZONE;793
BE.NMBS.354;MARIA AALTER;51.107608;3.386725;
;MARIA AALTER;797
BE.NMBS.355;MARIEMBOURG;50.095489;4.525694;
;MARIEMBOURG;798
BE.NMBS.356;MARLOIE;50.203115;5.31456;
;MARLOIE;801
BE.NMBS.357;MASNUY SAINT PIERRE;50.536547;3.962139;
;MASNUY SAINT PIERRE;805
BE.NMBS.358;MAUBRAY;50.546947;3.495487;
;MAUBRAY;807
BE.NMBS.359;MAZY;50.513503;4.675825;
;MAZY;809
BE.NMBS.360;MECHELEN;51.01758;4.48313;
;MECHELEN;810
BE.NMBS.361;MECHELEN NEKKERSPOEL;51.030012;4.489986;
;MECHELEN NEKKERSPOEL;811
BE.NMBS.362;MEISER;50.854558;4.394025;
;MEISER;812
BE.NMBS.363;MELKOUWEN;51.095064;4.671031;
;MELKOUWEN;814
BE.NMBS.364;MELLE;51.002814;3.797086;
;MELLE;815
BE.NMBS.365;MELREUX HOTTON;50.283672;5.440142;
;MELREUX HOTTON;818
BE.NMBS.366;MELSELE;51.210714;4.288533;
;MELSELE;819
BE.NMBS.367;MENEN;50.799492;3.113794;
;MENEN;820
;MENIN;820
BE.NMBS.368;MERCHTEM;50.953853;4.223492;
;MERCHTEM;821
BE.NMBS.369;MERELBEKE;51.020153;3.764963;
;MERELBEKE;822
BE.NMBS.370;MERODE;50.839881;4.399058;
;MERODE;826
BE.NMBS.371;MERY;50.548233;5.586942;
;MERY;827
;MESSANCY;1842
BE.NMBS.372;MEVERGNIES ATTRE;50.600333;3.833003;
;MEVERGNIES ATTRE;832
BE.NMBS.373;MILMORT;50.693364;5.599325;
;MILMORT;835
BE.NMBS.374;MOENSBERG;50.777909;4.32979;
;MOENSBERG;837
;MOESKROEN;868
BE.NMBS.375;MOL;51.191064;5.114733;
;MOL;840
BE.NMBS.376;MOLLEM;50.932808;4.21675;
;MOLLEM;841
BE.NMBS.377;MOMALLE;50.669911;5.367597;
;MOMALLE;842
BE.NMBS.378;MONS;50.45445;3.942303;
;MONS;848
BE.NMBS.379;MONT SAINT GUIBERT;50.638214;4.612581;
;MONT SAINT GUIBERT;855
BE.NMBS.380;MOORTSELE;50.953053;3.78055;
;MOORTSELE;860
BE.NMBS.381;MORLANWELZ;50.458;4.247367;
;MORLANWELZ;862
BE.NMBS.382;MORTSEL;51.190291;4.440127;
;MORTSEL;863
BE.NMBS.383;MORTSEL DEURNESTEENWEG;51.186039;4.44383;
;MORTSEL DEURNESTEENWEG;864
;MORTSEL LIERSESTEENWEG;877
BE.NMBS.384;MORTSEL OUDE GOD;51.171914;4.455511;
;MORTSEL OUDE GOD;866
BE.NMBS.385;MOUSCRON;50.738372;3.225307;
;MOUSCRON;868
BE.NMBS.386;MOUSTIER;50.452754;4.693809;
;MOUSTIER;870
BE.NMBS.387;MUIZEN;51.008203;4.513839;
;MUIZEN;871
BE.NMBS.388;MUNKZWALM;50.875853;3.731544;
;MUNKZWALM;873
BE.NMBS.389;NAMECHE;50.470381;4.998369;
;NAMECHE;894
;NAMEN;895
BE.NMBS.390;NAMUR;50.469156;4.862057;
;NAMUR;895
BE.NMBS.391;NANINNE;50.419394;4.930342;
;NANINNE;896
BE.NMBS.392;NATOYE;50.343358;5.0612;
;NATOYE;897
BE.NMBS.393;NEERPELT;51.222414;5.436692;
;NEERPELT;899
BE.NMBS.394;NEERWINDEN;50.763964;5.036322;
;NEERWINDEN;900
BE.NMBS.395;NESSONVAUX;50.572043;5.741708;
;NESSONVAUX;901
BE.NMBS.396;NEUFCHATEAU;49.853819;5.452592;
;NEUFCHATEAU;752
BE.NMBS.397;NEUFVILLES;50.543597;4.010669;
;NEUFVILLES;902
BE.NMBS.398;NIEL;51.110917;4.340583;
;NIEL;905
BE.NMBS.399;NIEUWKERKEN WAAS;51.185114;4.184414;
;NIEUWKERKEN WAAS;906
BE.NMBS.400;NIJLEN;51.159717;4.664447;
;NIJLEN;907
BE.NMBS.401;NIJVEL;50.600536;4.334678;
;NIJVEL;911
BE.NMBS.402;NIMY;50.471812;3.956505;
;NIMY;908
BE.NMBS.403;NINOVE;50.839504;4.026242;
;NINOVE;910
BE.NMBS.404;NIVELLES;50.600536;4.334678;
;NIVELLES;911
;NOORDERKEMPEN;1839
BE.NMBS.405;NOSSEGEM;50.883308;4.506108;
;NOSSEGEM;916
BE.NMBS.406;OBAIX BUZET;50.535765;4.363632;
;OBAIX BUZET;919
BE.NMBS.407;OBOURG;50.469539;4.008558;
;OBOURG;920
BE.NMBS.408;OKEGEM;50.857256;4.053542;
;OKEGEM;923
BE.NMBS.409;OLEN;51.17403;4.9025;
;OLEN;924
BE.NMBS.410;OOSTENDE;51.226518;2.927904;
;OOSTENDE;929
BE.NMBS.411;OOSTKAMP;51.154108;3.257467;
;OOSTKAMP;931
BE.NMBS.412;OPWIJK;50.974503;4.187442;
;OPWIJK;933
;OPZULLIK;121
;OSTEND ;929
;OSTENDE;929
BE.NMBS.413;OTTIGNIES;50.671632;4.569615;
;OTTIGNIES;936
BE.NMBS.415;OUDEGEM;51.014903;4.062361;
;OUDEGEM;938
BE.NMBS.416;OUDENAARDE;50.850558;3.600803;
;OUDENAARDE;939
BE.NMBS.414;OUD HEVERLEE;50.835928;4.653306;
;OUD HEVERLEE;941
;OVERPELT;1666
BE.NMBS.417;OVERPELT;51.21555;5.423126;
BE.NMBS.418;PALISEUL;49.894789;5.118997;
;PALISEUL;951
;PAPEGEM;952
BE.NMBS.419;PAPIGNIES;50.687817;3.823797;
;PAPIGNIES;952
BE.NMBS.420;PECROT;50.779208;4.651031;
;PECROT;954
BE.NMBS.421;PEPINSTER;50.568814;5.808247;
;PEPINSTER;956
BE.NMBS.422;PEPINSTER CITE;50.563381;5.804611;
;PEPINSTER CITE;957
BE.NMBS.423;PERUWELZ;50.513639;3.592061;
;PERUWELZ;958
BE.NMBS.424;PHILIPPEVILLE;50.191639;4.535958;
;PHILIPPEVILLE;961
BE.NMBS.425;PIETON;50.434964;4.288444;
;PIETON;962
BE.NMBS.426;POIX SAINT HUBERT;50.019772;5.292058;
;POIX SAINT HUBERT;968
BE.NMBS.427;PONT A CELLES;50.5136;4.354139;
;PONT A CELLES;970
BE.NMBS.428;PONT DE SERAING;50.619968;5.511328;
;PONT DE SERAING;971
BE.NMBS.429;POPERINGE;50.854421;2.736304;
;POPERINGE;973
BE.NMBS.430;POULSEUR;50.508958;5.57819;
;POULSEUR;974
BE.NMBS.431;PROFONDSART;50.693761;4.54915;
;PROFONDSART;975
BE.NMBS.432;PRY;50.268789;4.430361;
;PRY;976
BE.NMBS.433;PUURS;51.077219;4.283558;
;PUURS;977
BE.NMBS.434;QUAREGNON;50.450039;3.855461;
;QUAREGNON;979
BE.NMBS.435;QUEVY;50.341517;3.909245;
;QUEVY;982
BE.NMBS.436;QUIEVRAIN;50.410514;3.686067;
;QUIEVRAIN;984
BE.NMBS.437;REBAIX;50.661058;3.793502;
;REBAIX;989
BE.NMBS.438;REMICOURT;50.678608;5.321406;
;REMICOURT;991
;RENAIX;1013
BE.NMBS.444;RENAIX;50.742508;3.60255;
BE.NMBS.439;RHISNES;50.499347;4.801872;
;RHISNES;995
;RHODE SAINT GENESE;1079
BE.NMBS.440;RIVAGE;50.486422;5.585186;
;RIVAGE;996
BE.NMBS.441;RIXENSART;50.711414;4.532861;
;RIXENSART;997
;ROESELARE;1005
BE.NMBS.442;ROESELARE;50.949358;3.130358;
;RONET;1009
BE.NMBS.443;RONET;50.457735;4.828415;
;RONSE;1013
BE.NMBS.444;RONSE;50.742508;3.60255;
;ROULERS;1005
;ROUX;1018
BE.NMBS.445;ROUX;50.443114;4.393197;
;RUISBROEK;1021
BE.NMBS.446;RUISBROEK;50.791831;4.295328;
;RUISBROEK SAUVEGARDE;1017
;SAINT DENIS BOVESSE;1031
BE.NMBS.448;SAINT DENIS BOVESSE;50.521297;4.767792;
;SAINT GHISLAIN;1034
BE.NMBS.449;SAINT GHISLAIN;50.442625;3.820092;
;SAINT JOB;1081
BE.NMBS.450;SAINT JOB;50.79362;4.360403;
;SAINT NICOLAS;1088
;SAINT TROND;1090
;SART BERNARD;1043
BE.NMBS.451;SART BERNARD;50.406617;4.948467;
BE.NMBS.447;SAUVEGARDE;51.081313;4.336987;
;SCHAARBEEK;1048
BE.NMBS.452;SCHAARBEEK;50.878508;4.378644;
;SCHAERBEEK;1048
BE.NMBS.453;SCHAERBEEK;50.878508;4.378644;
;SCHELDEWINDEKE;1056
BE.NMBS.454;SCHELDEWINDEKE;50.937803;3.777614;
;SCHELLE;1066
;SCHELLEBELLE;1058
BE.NMBS.455;SCHELLEBELLE;51.003153;3.921372;
;SCHENDELBEKE;1059
BE.NMBS.456;SCHENDELBEKE;50.797818;3.899159;
;SCHOONAARDE;1060
BE.NMBS.457;SCHOONAARDE;51.003116;4.011276;
;SCHULEN;1061
BE.NMBS.458;SCHULEN;50.96335;5.188078;
;SCLAIGNEAUX;1062
BE.NMBS.459;SCLAIGNEAUX;50.492204;5.026374;
;SCLESSIN;1063
BE.NMBS.460;SCLESSIN;50.610396;5.556722;
;SERSKAMP;1068
BE.NMBS.461;SERSKAMP;50.984403;3.959356;
;'S GRAVENBRAKEL;205
BE.NMBS.462;S GRAVENBRAKEL;50.605075;4.137658;
;SILLY;121
BE.NMBS.463;SILLY;50.663319;3.937144;
;SIMONIS;1768
;SINAAI;1073
BE.NMBS.464;S'INAAI;51.143403;4.068942;
;SINT AGATHA BERCHEM;243
BE.NMBS.465;SINT AGATHA BERCHEM;50.872831;4.290961;
;SINT DENIJS BOEKEL;1076
BE.NMBS.466;SINT DENIJS BOEKEL;50.874303;3.698397;
;SINT GENESIUS RODE;1079
BE.NMBS.467;SINT GENESIUS RODE;50.748081;4.361492;
;SINT GILLIS ;1730
;SINT GILLIS;1730
;SINT GILLIS;1730
BE.NMBS.468;SINT GILLIS;51.021925;4.11715;
;SINT JOB;1081
BE.NMBS.469;SINT JOB;50.79362;4.360403;
;SINT JORIS WEERT;1082
BE.NMBS.470;SINT JORIS WEERT;50.8013;4.65195;
;SINT KATELIJNE WAVER;1083
BE.NMBS.471;SINT KATELIJNE WAVER;51.070931;4.495481;
;SINT MARIABURG;1084
BE.NMBS.472;SINT MARIABURG;51.292714;4.434961;
;SINT MARTENS BODEGEM;1087
BE.NMBS.473;SINT MARTENS BODEGEM;50.867158;4.205081;
;SINT NIKLAAS;1088
BE.NMBS.474;SINT NIKLAAS;51.17174;4.14315;
;SINT TRUIDEN;1090
BE.NMBS.475;SINT TRUIDEN;50.817617;5.17665;
;SLEIDINGE;1091
BE.NMBS.476;SLEIDINGE;51.126428;3.66776;
;SOIGNIES;1092
BE.NMBS.477;SOIGNIES;50.573447;4.069142;
;SOLRE SUR SAMBRE;1093
BE.NMBS.478;SOLRE SUR SAMBRE;50.312639;4.158431;
;SPA;1097
BE.NMBS.479;SPA;50.490163;5.855831;
;SPA GERONSTERE;459
BE.NMBS.480;SPA-GERONSTERE;50.489296;5.866227;
;STATTE;1102
BE.NMBS.481;STATTE;50.528283;5.219678;
;STOCKEM;1107
BE.NMBS.482;STOCKEM;49.690736;5.767712;
;SY;1113
BE.NMBS.483;SY;50.403122;5.523094;
;TAMINES;1125
BE.NMBS.484;TAMINES;50.432088;4.608861;
;TAMISE;1128
;TEMSE;1128
BE.NMBS.485;TEMSE;51.125914;4.221817;
;TERHAGEN;1130
BE.NMBS.486;TERHAGEN;50.902003;3.897361;
BE.NMBS.487;TERHULPEN;50.737958;4.497064;
;TERHULPEN;672
;TERMONDE;319
;TERNAT;1131
BE.NMBS.488;TERNAT;50.874519;4.165342;
;TESTELT;1134
BE.NMBS.489;TESTELT;51.009864;4.945833;
;THEUX;1135
BE.NMBS.490;THEUX;50.536314;5.815186;
;THIEU;1136
BE.NMBS.491;THIEU;50.469539;4.098522;
;THUIN;1139
BE.NMBS.492;THUIN;50.342739;4.288914;
;THULIN;1141
BE.NMBS.493;THULIN;50.423789;3.745783;
;TIELEN;1144
BE.NMBS.494;TIELEN;51.241017;4.893089;
;TIELT;1145
BE.NMBS.495;TIELT;50.990058;3.328611;
;TIENEN;1146
BE.NMBS.496;TIENEN;50.808022;4.925814;
;TILFF;1147
BE.NMBS.497;TILFF;50.570464;5.582514;
;TILLY;1149
BE.NMBS.498;TILLY;50.556742;4.551353;
;TIRLEMONT;1146
;TOLLEMBEEK;1150
BE.NMBS.499;TOLLEMBEEK;50.735382;3.992833;
;TONGEREN;1151
BE.NMBS.500;TONGEREN;50.784214;5.473222;
;TONGRES;1151
;TORHOUT;1152
BE.NMBS.501;TORHOUT;51.064708;3.105869;
;TOURNAI;1154
BE.NMBS.502;TOURNAI;50.613125;3.396936;
;TROIS PONTS;1157
BE.NMBS.503;TROIS PONTS;50.369264;5.872817;
;TRONCHIENNES;335
;TROOZ;1159
BE.NMBS.504;TROOZ;50.573337;5.688504;
;TUBEKE;1160
;TUBIZE;1160
BE.NMBS.505;TUBIZE;50.691708;4.205725;
;TURNHOUT;1161
BE.NMBS.506;TURNHOUT;51.322775;4.937564;
;UCCLE CALEVOET;1167
BE.NMBS.507;UCCLE CALEVOET;50.792131;4.331383;
;UCCLE STALLE;1168
BE.NMBS.508;UCCLE STALLE;50.802431;4.323539;
;UKKEL KALEVOET;1167
BE.NMBS.509;UKKEL KALEVOET;50.792131;4.331383;
;UKKEL STALLE;1168
BE.NMBS.510;UKKEL STALLE;50.802431;4.323539;
;VELTEM;1174
BE.NMBS.511;VELTEM;50.900519;4.633522;
;VERTRIJK;1176
BE.NMBS.512;VERTRIJK;50.8359;4.836591;
;VERVIERS CENTRAAL;1177
;VERVIERS CENTRAL;1177
BE.NMBS.513;VERVIERS CENTRAL;50.587821;5.854597;
;VERVIERS PALAIS;1180
BE.NMBS.514;VERVIERS PALAIS;50.590961;5.865262;
;VERVIERS PALEIS;1180
;VEURNE;1181
BE.NMBS.515;VEURNE;51.073897;2.669742;
;VIANE MOERBEKE;1182
BE.NMBS.516;VIANE MOERBEKE;50.751914;3.917055;
;VICHTE;1184
BE.NMBS.517;VICHTE;50.833558;3.392842;
;VIELSALM;1185
BE.NMBS.518;VIELSALM;50.278814;5.909;
;VIJFHUIZEN;1186
BE.NMBS.519;VIJFHUIZEN;50.943327;3.982651;
;VILLE POMMEROEUL;1187
BE.NMBS.520;VILLE POMMEROEUL;50.464339;3.724189;
;VILLERS LA VILLE;1189
BE.NMBS.521;VILLERS LA VILLE;50.578028;4.533432;
;VILVOORDE;1192
BE.NMBS.522;VILVOORDE;50.924208;4.432583;
;VILVORDE;1192
;VIRTON;1194
BE.NMBS.523;VIRTON;49.560932;5.518441;
;VISE;1195
BE.NMBS.524;VISE;50.740296;5.692835;
;VIVIER D'OIE;824
;VIVILLE;1198
BE.NMBS.525;VIVILLE;49.688369;5.785497;
;VOROUX;1202
BE.NMBS.526;VOROUX GOREUX;50.660752;5.431066;
;VORST OOST;414
BE.NMBS.527;VORST OOST;50.810204;4.320936;
;VORST ZUID;415
BE.NMBS.528;VORST ZUID;50.810158;4.310025;
;WAARSCHOOT;1206
BE.NMBS.529;WAARSCHOOT;51.154608;3.615353;
;WALCOURT;1207
BE.NMBS.530;WALCOURT;50.258639;4.435336;
;WAREGEM;1212
BE.NMBS.531;WAREGEM;50.892458;3.425514;
;WAREMME;1213
BE.NMBS.532;WAREMME;50.694725;5.248986;
;WATERLOO;1218
BE.NMBS.533;WATERLOO;50.715558;4.382925;
;WATERMAAL;1219
BE.NMBS.534;WATERMAAL;50.809691;4.399692;
;WATERMAEL;1219
BE.NMBS.535;WATERMAEL;50.809691;4.399692;
;WAVER;1223
BE.NMBS.536;WAVER;50.716272;4.604783;
;WAVRE;1223
BE.NMBS.537;WAVRE;50.716272;4.604783;
;WEERDE;1224
BE.NMBS.538;WEERDE;50.977411;4.470292;
;WELKENRAEDT;1226
BE.NMBS.539;WELKENRAEDT;50.659464;5.974261;
;WELLE;1228
BE.NMBS.540;WELLE;50.903375;4.050922;
;WERVIK;1229
BE.NMBS.541;WERVIK;50.781861;3.046975;
;WESPELAAR TILDONK;1230
BE.NMBS.542;WESPELAAR TILDONK;50.958297;4.637489;
;WETTEREN;1234
BE.NMBS.543;WETTEREN;51.001603;3.881881;
;WEVELGEM;1235
BE.NMBS.544;WEVELGEM;50.811017;3.182533;
;WEZEMAAL;1238
BE.NMBS.545;WEZEMAAL;50.956206;4.748314;
;WEZET;1195
;WICHELEN;1253
BE.NMBS.546;WICHELEN;51.001903;3.974897;
;WIJGMAAL;1242
BE.NMBS.547;WIJGMAAL;50.923017;4.700242;
;WILDERT;1244
BE.NMBS.548;WILDERT;51.427614;4.463825;
;WILLEBROEK;1245
BE.NMBS.549;WILLEBROEK;51.066608;4.356083;
;WOLFSTEE;1232
;WONDELGEM;1248
BE.NMBS.550;WONDELGEM;51.086864;3.718372;
;YPRES;602
;YVES GOMEZEE;1254
BE.NMBS.551;YVES GOMEZEE;50.238039;4.490469;
;YVOIR;1255
BE.NMBS.552;YVOIR;50.320839;4.878644;
;ZANDBERGEN;1256
BE.NMBS.553;ZANDBERGEN;50.80715;3.956928;
;ZAVENTEM;1260
BE.NMBS.554;ZAVENTEM;50.88572;4.469886;
;ZEDELGEM;1261
BE.NMBS.555;ZEDELGEM;51.12641;3.1634;
;ZEEBRUGGE DORP;1262
BE.NMBS.556;ZEEBRUGGE DORP;51.326108;3.195697;
;ZEEBRUGGE STRAND;1723
BE.NMBS.557;ZEEBRUGGE STRAND;51.324546;3.186668;
;ZELE;1265
BE.NMBS.558;ZELE;51.073103;4.041586;
;ZELLIK;1266
BE.NMBS.559;ZELLIK;50.889731;4.275583;
;ZICHEM;1270
BE.NMBS.560;ZICHEM;51.006694;4.987358;
;ZINGEM;1272
BE.NMBS.561;ZINGEM;50.909158;3.645875;
;ZINNIK;1092
;ZOLDER;1231
;ZOTTEGEM;1274
BE.NMBS.562;ZOTTEGEM;50.869103;3.814414;
;ZWANKENDAMME;1275
BE.NMBS.563;ZWANKENDAMME;51.306408;3.191564;
;ZWIJNDRECHT;1278
BE.NMBS.564;ZWIJNDRECHT;51.214214;4.329161;
