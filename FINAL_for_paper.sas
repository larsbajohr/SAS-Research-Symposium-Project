/* Generated Code (IMPORT) */
/* Source File: Millennial Project 3.csv */
/* Source Path: C:/Users/kak5320/Desktop */
/* Code generated on: 11/5/19, 11:03 AM */

%web_drop_table(WORK.IMPORT);


FILENAME REFFILE 'C:/Users/kak5320/Desktop/Millennial Project 3.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.mil_proj;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.mil_proj; RUN;

%web_open_table(WORK.IMPORT);

/*dropping unecessary variables*/
data mil_proj2(drop=edu age ftotinc mortgage_2 cbserial);
	set mil_proj;
run;

/*formatting year, birth yr, (and yr married?) to eventually be character 
		instead of numeric*/
proc format;
value YEAR_b
  2013 = "2013"
  2014 = "2014"
  2015 = "2015"
  2016 = "2016"
  2017 = "2017"
;

value birthyr_b
  1981 = '1981'
  1982 = '1982'
  1983 = '1983'
  1984 = '1984'
  1985 = '1985'
  1986 = '1986'
  1987 = '1987'
  1988 = '1988'
  1989 = '1989'
  1990 = '1990'
  1991 = '1991'
  1992 = '1992'
  1993 = '1993'
  1994 = '1994'
  1995 = '1995'
  1996 = '1996'
  ;
run;
/*
value yrmarr_b
  1995 = '1995'
  1996 = '1996'
  1997 = '1997'
  1998 = '1998'
  1999 = '1999'
  2000 = '2000'
  2001 = '2001'
  2002 = '2002'
  2003 = '2003'
  2004 = '2004'
  2005 = '2005'
  2006 = '2006'
  2007 = '2007'
  2008 = '2008'
  2009 = '2009'
  2010 = '2010'
  2011 = '2011'
  2012 = '2012'
  2013 = '2013'
  2014 = '2014'
  2015 = '2015'
  2016 = '2016'
  2017 = '2017'
  ;
 run;
*/

/*this shows the unique values in edu_details variable*/
proc sql;
   select distinct(edu_nocomma) as edu_nc
   from remove_comma;
quit;

/*taking out the comma & apostrophe in edu details*/
data remove_comma;
set mil_proj2;
edu_nocomma = TRANSLATE(edu_details,"",',');
run;

data remove_apot;
set remove_comma;
edu_noapot = TRANSLATE(edu_nocomma,"",'''');
run;

/*taking out extra spaces in between words*/
data mil_proj3; 
   set remove_apot; 
   edu_details_b=compbl(edu_noapot) 
   ; 
run; 

/*taking out unwanted spaces*/
data mil_proj4; 
   set mil_proj3; 
   edu_details_c=TRANWRD(edu_details_b,'Bachelor s','Bachelors')
   ; 
run; 
 
data mil_proj5; 
   set mil_proj4; 
   edu_details_d=TRANWRD(edu_details_c,'Associate s','Associates')
   ; 
run; 

data mil_proj6; 
   set mil_proj5; 
   edu_details_e=TRANWRD(edu_details_d,'Master s','Masters')
   ; 
run; 


/*formatting values in edu_details
	--less than HS, HS diploma, College Degree, Professional Degree*/

proc format;
value $edu_details_2a
	'No schooling completed','Nursery school preschool','Kindergarten','Grade 1','Grade 2','Grade 3','Grade 4','Grade 5','Grade 6','Grade 7','Grade 8','Grade 9','Grade 10','Grade 11','12th grade no diploma'='Less than HS'
	'Regular high school diploma','GED or alternative credential','Some college but less than 1 year','1 or more years of college credit no degree'='HS Diploma or equivalent'
	'Associates degree type not specified','Bachelors degree'='College Degree'
	'Masters degree','Professional degree beyond a bachelor s degree','Doctoral degree'='Professional Degree'
	;
run;

/*showing the frequency of the 4 education categories in our data*/
proc freq data=mil_proj6;
   tables edu_details_e;
   format edu_details_e  $edu_details_2a.; /*<= says to group the data according the values in the format*/
run;

/*dropping variables/levels, formatting year and birth year to character*/
data mil_proj7 (drop=year birthyr edu_details_b edu_details_c edu_details_d
						edu_nocomma edu_noapot edu_details);
	set mil_proj6;
	if ncouples = '2' then delete;
	if ncouples gt '2' then delete;
	if birthyr = '1980' then delete;
	if birthyr = '1997' then delete;
	if year = '2013' then delete;
	if year = '2014' then delete;
	if year = '2015' then delete;
	if year = '2016' then delete;
	if yrmarr = 1995 then delete;
	if yrmarr = 1996 then delete;
	if yrmarr = 1997 then delete;
	if yrmarr = 1998 then delete;
	if yrmarr = 1999 then delete;
	if hhincome lt 10000 then delete;
	if hhincome gt 200000 then delete;
	year_2 = put(year, YEAR_b.);
	birthyr_2 = put(birthyr, birthyr_b.);
run;


/*changing order that variables appear in output table*/
data mil_proj8 ;
   retain YEAR_2 SERIAL PerNum PerWt HHwt SEX_2 BirthYr_2 YrMarr 
   			Ncouples OCC Edu_Details_e Ownership Own_Details RENT HHincome INCtot;
   set mil_proj7;
run;


/*PIE CHART FOR EDU_DETAILS*/
goptions device=png;              /*Specify the device to use*/ 
ods listing close;                /*Close in case of back-to-back programs*/ 
ods html path='C:\Users\kak5320\Projects\Millennial Project'         /*Specify the directory path for the output file*/          
body='Edu_Level.html'        /*Specify the HTML file to be created*/         
style=banker;            /*Specify the ODS Style to use*/

title 'Education Level IPUMS USA 2017';
proc gchart data=mil_proj8;
   format edu_details_e $edu_details_2a.;	
   pie edu_details_e / other=0
              midpoints= "Less than HS" "HS Diploma or equivalent" "College Degree" "Professional Degree"
              value=none
              percent=inside
              slice=outside
              noheading 
              plabel=(font='Albany AMT/bold' h=1.3 color=depk)
              other=4
              clockwise angle=200
              ;
              
run;
quit; 
  ods html close;                 
  ods listing;

/*Probability distribution of Education Details*/
goptions device=png;               
ods listing close;                 
ods html path='C:\Users\kak5320\Projects\Millennial Project';

ods graphics on;
proc logistic data=mil_proj8 plots=effect(individual) descending;
   class edu_details_e;
   format edu_details_e $edu_details_2a.;	
   model ownership = edu_details_e ;
   store milp;
run;
ods html close;                  
ods listing;

/*Cumulative Dist. Plot for Year Married*/
goptions device=png;               
ods listing close;                 
ods html path='C:\Users\kak5320\Projects\Millennial Project';
ods graphics on;
proc freq data=mil_proj8;    
  tables yrmarr /plots=cumfreqplot(scale=percent type=dotplot); 
  run; 
ods html close;                    
ods listing;

/*Distribution of year married and education details--Maybe use this later*/
ods graphics on; 
proc freq data=mil_proj8;   
format edu_details_e $edu_details_2a.;	  
tables yrmarr*edu_details_e /plots=freqplot(groupby=row twoway=cluster );      
run;


/*Ownership against Education Details and HHincome*/
goptions device=png;               
ods listing close;                 
ods html path='C:\Users\kak5320\Projects\Millennial Project'                  
/*body='Edu_Level.html' */                
;
title 'Ownership across Education Level and HHincome';
proc sgplot data=mil_proj8;
 hbar edu_details_e / group=ownership groupdisplay=cluster
 response=hhincome stat=mean;
 format edu_details_e $edu_details_2a.;	
run;
ods html close;                    
ods listing;


/*Modeling probability that ownership=Rented based on edu level*/
 ods graphics off;
proc genmod data=mil_proj8 descending;
 	class edu_details_e;
 	format edu_details_e $edu_details_2a.;	
	model ownership =  edu_details_e / dist=binomial type3;
	/*lsmeans edu_details/diff adjust=tukey;*/
run;

/*Modeling probability that ownership=rented based on year married*/
ods graphics off;
proc genmod data=mil_proj8 descending;
 	class yrmarr ;
	model ownership =  yrmarr/ dist=binomial type3;
run;

/*Modeling HHincome against education details only*/
ods graphics off;
proc glm data=mil_proj8;
 	class edu_details_e ;
 	format edu_details_e $edu_details_2a.;	
	model hhincome = edu_details_e / solution ;
	lsmeans edu_details_e / diff adjust=tukey;
run;

/*Modeling HHincome against education details and yrmarr*/
ods graphics off;
proc glm data=mil_proj8;
 	class edu_details_e yrmarr;
 	format edu_details_e $edu_details_2a.;	
	model hhincome = edu_details_e yrmarr/ solution ;
	lsmeans edu_details_e / diff adjust=tukey;
run;

ods graphics off;
proc glm data=mil_proj8;
 	class edu_details_e yrmarr;
 	format edu_details_e $edu_details_2a.;	
	model hhincome = edu_details_e yrmarr/ solution ;
	lsmeans edu_details_e / diff adjust=bonferroni;
run;



