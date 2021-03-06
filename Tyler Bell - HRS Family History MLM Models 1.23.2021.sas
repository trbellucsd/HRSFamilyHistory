
TITLE "UNCONDITIONAL GROWTH MODELS: PERCEIVED 2-YEAR DECLINE (1 = NO PERCEIVED DECLINE; 2 = PERCEIVED DECLINE)";
PROC GLIMMIX DATA=FAM.HRS_SUPP8TV METHOD= LAPLACE NOCLPRINT NOITPRINT;
WHERE COGFLAG2M = 0 AND RFSLFME = 0 AND RFPSTME = 0 AND AGE4 >=65;
CLASS HHIDPN HACOHORT (REF = "3") GENDER(REF="1") RARACEM (REF = "1") RAHISPAN (REF = "0")  PMEMIMP_SPLINE (REF = "0") ;
MODEL RPSTMEMCAT (REF = "1") = WAVENEW
 /DIST=BINARY LINK=LOGIT SOLUTION DDFM = BW;
RANDOM INTERCEPT /SUBJECT = HHIDPN(HACOHORT) TYPE = UN;
ESTIMATE "WAVENEW" WAVENEW 1 /EXP CL;
RUN;




TITLE "CONDITIONAL GROWTH MODELS: PERCEIVED 2-YEAR DECLINE (1 = NO PERCEIVED DECLINE; 2 = PERCEIVED DECLINE)";
PROC GLIMMIX DATA=FAM.HRS_SUPP8TV METHOD= LAPLACE NOCLPRINT NOITPRINT;
WHERE COGFLAG2M = 0 AND RFSLFME = 0 AND RFPSTME = 0 AND AGE4 >=65;
CLASS HHIDPN HACOHORT (REF = "3") GENDER(REF="1") RARACEM (REF = "1") RAHISPAN (REF = "0")  PMEMIMP_SPLINE (REF = "0") ;
MODEL RPSTMEMCAT (REF = "1") = WAVENEw AGE4 RAHISPAN RARACEM GENDER EDUC4 INCOME4K PMEMIMP_SPLINE DEP_WP
DEP4_GMC HACOHORT
 /DIST=BINARY LINK=LOGIT SOLUTION DDFM = BW;
RANDOM INTERCEPT /SUBJECT = HHIDPN(HACOHORT) TYPE = UN;
ESTIMATE "WAVENEW" WAVENEW 1 /EXP CL;
ESTIMATE "AGE4 " AGE4 1 /EXP CL;
ESTIMATE "RAHISPAN " RAHISPAN 1 -1/EXP CL;
ESTIMATE "OTHER" RARACEM 0 1 -1 /EXP CL;
ESTIMATE "BLACK" RARACEM 1 0 -1 /EXP CL;
ESTIMATE "WOMAN GENDER " GENDER 1 -1 /EXP CL;
ESTIMATE "EDUC4 " EDUC4 1 /EXP CL;
ESTIMATE "INCOME4K " INCOME4K 1 /EXP CL;
ESTIMATE "PMEMIMP_SPLINE" PMEMIMP_SPLINE 1 /EXP CL;
ESTIMATE "DEP4_GMC" DEP4_GMC 1 /EXP CL;
ESTIMATE "DEP_WP" DEP_WP 1 /EXP CL;
ESTIMATE "HACOHORT 1" HACOHORT 1 0 0 -1/EXP CL;
ESTIMATE "HACOHORT 2" HACOHORT 0 1 0 -1/EXP CL;
ESTIMATE "HACOHORT 4" HACOHORT 0 0 1 -1/EXP CL;
RUN;

TITLE "UNCONDITIONAL GROWTH MODELS: CURRENT MEMORY PROBLEMS (HIGHER = WORSE RATINGS)";
PROC GLIMMIX DATA=FAM.HRS_SUPP8TV METHOD= LAPLACE NOCLPRINT NOITPRINT;
WHERE COGFLAG2M = 0 AND RFSLFME = 0 AND RFPSTME = 0 AND AGE4 >=65 ;
CLASS HHIDPN HACOHORT (REF = "3") GENDER(REF="1") RARACEM (REF = "1") RAHISPAN (REF = "0") PMEMIMP_SPLINE (REF = "0")
HACOHORT (REF = "3") RSLFMEM;
MODEL RSLFMEM(DESC)  =  WAVENEW /DIST=MULTI LINK=CUMLOGIT SOLUTION
DDFM = BW;
RANDOM INTERCEPT /SUBJECT = HHIDPN(HACOHORT) TYPE = UN;
ESTIMATE "WAVENEW" WAVENEW 1 / EXP CL;
RUN;

TITLE "CONDITIONAL GROWTH MODELS: CURRENT MEMORY PROBLEMS (HIGHER = WORSE RATINGS)";
PROC GLIMMIX DATA=FAM.HRS_SUPP8TV METHOD= LAPLACE NOCLPRINT NOITPRINT;
WHERE COGFLAG2M = 0 AND RFSLFME = 0 AND RFPSTME = 0 AND AGE4 >=65 ;
CLASS HHIDPN HACOHORT (REF = "3") GENDER(REF="1") RARACEM (REF = "1") RAHISPAN (REF = "0") PMEMIMP_SPLINE (REF = "0")
HACOHORT (REF = "3") RSLFMEM;
MODEL RSLFMEM(DESC)  = WAVENEW AGE4 PMEMIMP_SPLINE GENDER EDUC4 INCOME4K  RAHISPAN RARACEM RCOGTOT
PMEMIMP_SPLINE|DEP_WP DEP4_GMC HACOHORT  /DIST=MULTI LINK=CUMLOGIT SOLUTION
DDFM = BW;
RANDOM INTERCEPT /SUBJECT = HHIDPN(HACOHORT) TYPE = UN;
ESTIMATE "WAVENEW" WAVENEW 1 /EXP CL;
ESTIMATE "AGE4 " AGE4 1 /EXP CL;
ESTIMATE "RAHISPAN " RAHISPAN 1 -1/EXP CL;
ESTIMATE "OTHER" RARACEM 0 1 -1 /EXP CL;
ESTIMATE "BLACK" RARACEM 1 0 -1 /EXP CL;
ESTIMATE "WOMAN GENDER " GENDER 1 -1 /EXP CL;
ESTIMATE "EDUC4 " EDUC4 1 /EXP CL;
ESTIMATE "INCOME4K " INCOME4K 1 /EXP CL;
ESTIMATE "PMEMIMP_SPLINE" PMEMIMP_SPLINE 1 /EXP CL;
ESTIMATE "PMEMIMP_SPLINE*DEP" PMEMIMP_SPLINE*DEP_WP 1 /EXP CL;
ESTIMATE "DEP4_GMC" DEP4_GMC 1 /EXP CL;
ESTIMATE "DEP_WP" DEP_WP 1 /EXP CL;
ESTIMATE "HACOHORT 1" HACOHORT 1 0 0 -1/EXP CL;
ESTIMATE "HACOHORT 2" HACOHORT 0 1 0 -1/EXP CL;
ESTIMATE "HACOHORT 4" HACOHORT 0 0 1 -1/EXP CL;
RUN;
