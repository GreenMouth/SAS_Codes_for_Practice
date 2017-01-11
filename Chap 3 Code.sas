LIBNAME Shinde 'C:\Users\pss150630\SASWalmart\Chapter3SASData'; *Write into this library;
LIBNAME Rawdata 'C:\Users\pss150630\SASWalmart\Chapter3Data';  *Read from this library;

Data shinde.homegarden;
	Infile 'C:\Users\pss150630\SASWalmart\Chapter3Data\Garden.dat';
	INPUT Name $ Tomato Zucchini Peas Grapes;
	Zone = 14;
	Zucchini = Zucchini * 10;
	Total = Tomato + Zucchini + Peas + Grapes;
	PerTom = (Tomato/Total) * 100;
Run;

Proc print data = shinde.homegarden;
run;

Data shinde.pumpkin;
	Infile 'C:\Users\pss150630\SASWalmart\Chapter3Data\Pumpkin.dat';
	Input Name $16. Age 3. +1 Type $1. +1 DateofEntry MMDDYY10. (src1 src2 src3 src4 src5)(4.1);
	AvgScore = Mean(src1,src2,src3,src4,src5);
	DayEntered = Day(DateofEntry);
	Type = UPCASE(Type);
run;

proc print data = shinde.pumpkin;
run;

DATA Shinde.UsedCars;
	Infile 'C:\Users\pss150630\SASWalmart\Chapter3Data\UsedCars.dat';
	Input Model $ Year Make $ Seats Color $ ;
	Length Status $12;                  * Changing length of a dynamically created new variable ;
	IF Year < 1975 Then Status = 'Classic';
	ELSE Status = 'Not Classic';
	IF Model = 'Corvette' OR Model = 'Camero' THEN Make = 'Chevy';
	IF Model = 'Miata' THEN DO;
	   Make = 'Mazda';
	   Seats = 2;
	END;
run;
* In book, the dataset name given is Auction.dat;
proc print data = shinde.usedcars;
Title 'Used vintage cars';
run;


DATA Shinde.Home;
	Infile 'C:\Users\pss150630\SASWalmart\Chapter3Data\Home.dat';
	Input Name $ Description $9-33 Price;
	If Price = '.' then PriceGroup = 'Missing';
		Else If Price LE 2000 Then PriceGroup = 'Low';
		Else if Price LE 10000 Then PriceGroup = 'Medium'; * LE is less than equal to or use <= sign ;
		Else PriceGroup = 'High';
RUN;

Proc print data = Shinde.Home;
Title 'Home Improvement Price Groups';
Run;


DATA Shinde.Comedy;
	Infile 'C:\Users\pss150630\SASWalmart\Chapter3Data\Shakespeare.dat';
	Input Title $25. Year Type $;
	IF Type = 'comedy';		*Here "c" in "comedy" is case sensitive;
	*IF 'Type' is 'comedy' then only print, otherwise delete;
Run;

Proc print data = Shinde.comedy;
run;


DATA Shinde.librarycards;
   INFILE 'C:\Users\pss150630\SASWalmart\Chapter3Data\Library.dat' TRUNCOVER;
   INPUT Name $11. + 1 BirthDate MMDDYY10. +1 IssueDate ANYDTDTE10. DueDate DATE11.;
   DaysOverDue = TODAY() - DueDate;
   Age = INT(YRDIF(BirthDate, TODAY(), 'ACTUAL'));
   IF IssueDate > '01JAN2008'D THEN NewCard = 'yes';
RUN;

PROC PRINT DATA = Shinde.librarycards;
   FORMAT Issuedate MMDDYY8. DueDate WEEKDATE17.;
   TITLE 'SAS Dates without and with Formats';
RUN;


DATA Shinde.Gamestats;
	Infile 'C:\Users\pss150630\SASWalmart\Chapter3Data\Games.dat';
	Input Month 1 Day 3-4 Team $21. Hits Runs;
	Retain MaxRuns;
	MaxRuns = MAX(Runs,MaxRuns);
	TotalRuns + Runs;
Run;

Proc print data = shinde.Gamestats;
Run;

DATA shinde.songs;
   INFILE 'C:\Users\pss150630\SASWalmart\Chapter3Data\WBRK.dat';
   INPUT City $ 1-15 Age domk wj hwow simbh kt aomm libm tr filp ttr;
   ARRAY song (10) domk wj hwow simbh kt aomm libm tr filp ttr;
   DO i = 1 TO 10;
      IF song(i) = 9 THEN song(i) = .;
   END;
   DROP i;  *You can drop the newly created counter variable 'i' using this statement;
RUN;
PROC PRINT DATA = shinde.songs;
   TITLE 'WBRK Song Survey';
RUN;


DATA Shinde.songs2;    
   INFILE 'C:\Users\pss150630\SASWalmart\Chapter3Data\WBRK.dat';    
   INPUT City $ 1-15 Age domk wj hwow simbh kt aomm libm tr filp ttr;
   ARRAY new (10) Song1 - Song10;
   ARRAY old (10) domk -- ttr;  *To specify a name range list use double hyphens;
   DO i = 1 TO 10;
      IF old(i) = 9 THEN new(i) = .;
         ELSE new(i) = old(i);
   END;
   AvgScore = MEAN(OF Song1 - Song10);

PROC PRINT DATA = Shinde.songs2;
   TITLE 'WBRK Song Survey';
RUN;
