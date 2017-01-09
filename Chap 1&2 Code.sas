*create a SAS dataset called distance & convert miles into kilometers;
Data Mylib.distance;
	Miles = 26.22;
	Kilometers = Miles * 1.61;
Run;

* print the result;
Proc print data = distance;
run;

PROC CONTENTS Data = mylib.distance;
run;

PROC OPTIONS; * Result is in LOG tab ;
RUN;

proc print data = mylib.bands;
run;

* Read 'internal data' into SAS dataset USPRESIDENTS;

DATA Mylib.USPRESIDENTS;
	INPUT President $ Party $ Number;
	DATALINES;
Adams F 2
Lincoln R 16
Grant R 18
Kennedy D 35
;
Run;

Data uspresidents1;
	INFILE "C:\Users\pss150630\SASWalmart\USPRESIDENTS.dat";
	INPUT President $ Party $ Number;
Run;


DATA Mylib.ToadJump;
	INFILE 'C:\Users\pss150630\SASWalmart\Chapter2data\ToadJump.dat';
	INPUT ToadName $ Weight Jump1 Jump2 Jump3;
RUN;

PROC PRINT DATA = Mylib.ToadJump;
	TITLE 'SAS Dataset Toads';
RUN;

DATA Mylib.Sales;
	Infile 'C:\Users\pss150630\SASWalmart\Chapter2data\OnionRing.dat';
	INPUT Name $ 1-20 ConcessionSale 21-24  BleachersSale 25-28 OurHits 29-31 TheirHits 32-34 OurRuns 35-37 TheirRuns 38-40;
Run;

Proc Print data = Mylib.Sales;
Run;

Data Mylib.Pumpkin;
	Infile 'C:\Users\pss150630\SASWalmart\Chapter2data\Pumpkin.dat';
	Input Name $16. Age Type $ Date MMDDYY10. (Score1 Score2 Score3 Score4 Score5) (4.1);
Run;

Proc Print data = Mylib.Pumpkin;
Run;

Data Mylib.Natpark;
	Infile 'C:\Users\pss150630\SASWalmart\Chapter2data\NatPark.dat';
	INPUT Name $22. State $ Year @40 Acreage COMMA9. ;  *'@40 Acreage COMMA9.' goes together;
RUN;

Proc print data = Mylib.Natpark;
run;

Data canoeresults;
	Infile 'C:\Users\pss150630\SASWalmart\Chapter2data\Canoes.dat';
	Input @'School:' SchoolName $ @'Time:' RaceTime :STIMER8. ;
Run;

Proc print data = canoeresults;
TITLE "Concrete Canoe Men's Sprint Results";
run;  *No dataset is available;


Data Mylib.Temperature;
	Infile 'C:\Users\pss150630\SASWalmart\Chapter2data\Temperature.dat';
	Input City $ State $ /NormalHigh NormalLow /RecordHigh RecordLow;
Run; * "/" indicates the data is on new line ;

Proc Print data = Mylib.Temperature;
Title 'High & Low temperature for different vacation locations';
Run;

Data Mylib.Rainfall;
	Infile 'C:\Users\pss150630\SASWalmart\Chapter2data\Precipitation.dat';
	Input City $ State $ NormalRain MeanDayRain @@;
Run;

Proc Print data = Mylib.Rainfall;
Title 'Normal Total Precipitation and';
Title 'Mean days with precipiitation';
Run;

Data Mylib.freeways;
	INFILE 'C:\Users\pss150630\SASWalmart\Chapter2data\Traffic.dat';
	INPUT Type $ @;
	IF Type = 'surface' THEN DELETE;
	INPUT Name $ 9-38 AMTraffic PMTraffic;
Run;

Proc print data = Mylib.freeways;
Title 'Traffic for freeways';
RUN;


DATA Mylib.icecream;
	Infile 'C:\Users\pss150630\SASWalmart\Chapter2data\IceCreamSales.dat' FIRSTOBS = 3;
	Input Flavor $ 1-9 Location Boxes_Sold ; 
Run;

proc print data = Mylib.icecream;
Run;


DATA Mylib.icecream2;
	Infile 'C:\Users\pss150630\SASWalmart\Chapter2data\IceCreamSales2.dat' FIRSTOBS = 3 OBS =  5;
	Input Flavor $ 1-9 Location Boxes_Sold ; 
Run;

proc print data = Mylib.icecream2;
Run;


Data Mylib.AllScores;
	Infile 'C:\Users\pss150630\SASWalmart\Chapter2data\AllScores.dat' TRUNCOVER;
	Input Name $ Test1 Test2 Test3 Test4 Test5 ;
run;

proc print data = Mylib.AllScores;
Run;

Data Mylib.HomeAddresses;
	Infile 'C:\Users\pss150630\SASWalmart\Chapter2data\Address.dat' TRUNCOVER;
	Input Name $ 14. Number 16-19 Street $ 20-37 ;
Run;

Proc print data = Mylib.HomeAddresses;
Run;

DATA Mylib.Bands;
	Infile 'C:\Users\pss150630\SASWalmart\Chapter2data\Bands2.csv' DLM = ',' DSD MISSOVER FIRSTOBS = 2 OBS = 5;
	INPUT BandName :$30. GigDate :MMDDYY10. EightPM NinePM TenPM ElevenPM ;
Run;

Proc print data = Mylib.Bands;
Run;

Proc import DATAFILE = 'C:\Users\pss150630\SASWalmart\Chapter2data\Bands2.csv' OUT = Mylib.MusicBands REPLACE ;
Run;

Proc print data = Mylib.MusicBands;
run;

PROC IMPORT DATAFILE = 'C:\Users\pss150630\SASWalmart\Chapter2data\Baseball.xls' OUT = Mylib.Baseball DBMS = XLS REPLACE;
Run;

Proc print data = Mylib.Baseball;
Run;
