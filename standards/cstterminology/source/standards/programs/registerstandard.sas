**********************************************************************************;
* Copyright (c) 2022, SAS Institute Inc., Cary, NC, USA.  All Rights Reserved.   *;
* SPDX-License-Identifier: Apache-2.0                                            *;
*                                                                                *;
* registerstandard.sas                                                           *;
*                                                                                *;
* Sample driver program to perform a primary Toolkit action, in this case,       *;
* registerering Controlled Terminology.                                          *;
* The following data sets are assumed to exist in the control subfolder:         *;
*                                                                                *;
*    standards                                                                   *;
*    standardsasreferences                                                       *;
*    standardsubtypes                                                            *;
*                                                                                *;
* CSTversion  1.5                                                                *;
**********************************************************************************;

* Register the standard to the global library;

* Set up macro variables needed by this program;
%let _thisStandard=CDISC-TERMINOLOGY;
%let _thisStandardVersion=NCI_THESAURUS;
%let _thisProductRevision=1.7;
%let _thisDirWithinStandards=cdisc-terminology-1.7;



**********************************************************************************;
* Nothing below this needs to be edited to register controlled terminolog         ;
* It is assumed that the standards and standardsasreferences datasets are in a    ;
* control subfolder of the followong folder:                                      ;
*    &_cstGRoot/standards/&_thisDirWithinStandards                                ;
**********************************************************************************;


%cstutil_setcstgroot;

* Set the framework properties used for the uninstall;
%cst_setStandardProperties(
  _cstStandard=CST-FRAMEWORK,
  _cstSubType=initialize
  );

* Get the currently registered standards;
%cst_getRegisteredStandards(
  _cstOutputDS=work.regStds
  );

* check and see if this standard-version is registered and whether it is this revision;
%let _stdVersionIsRegistered=0;
%let _stdVersionRevisionIsSame=0;
data _null_;
  set regStds(where=(standard="&_thisStandard"
    and standardVersion="&_thisStandardVersion"));
  call symputx('_stdVersionIsRegistered',1);
  if (productRevision="&_thisProductRevision") then do;
    call symputx('_stdVersionRevisionIsSame',1);
  end;
run;

%macro _registerIfNeeded();
  %if ((&_stdVersionIsRegistered=0) or
       (&_stdVersionRevisionIsSame=1)) %then %do;
    %put ****;
    %put NOTE: Registering &_thisStandard &_thisStandardVersion  V&_thisProductRevision to the global library;
    %put ****;


    %if (&_stdVersionIsRegistered=1) %then %do;
      * Unregister a previously existing standard from the global library;
      %cst_unregisterStandard(
        _cstStandard=&_thisStandard
        ,_cstStandardVersion=&_thisStandardVersion
        );
    %end;

    * Register the standard to the global library;
    %cst_registerStandard(
      _cstRootPath=%nrstr(&_cstGRoot./standards/)&_thisDirWithinStandards,
      _cstControlSubPath=control,
      _cstStdDSName=standards,
      _cstStdSASRefsDSName=standardsasreferences);
  %end;
  %else %do;
    %put ****;
    %put NOTE: Skipping registration of &_thisStandard &_thisStandardVersion V&_thisProductRevision to the global library;
    %put NOTE: The standard was already registered but used a different product revision.;
    %put NOTE: If you want to use the latest, you should unregister the current one and run this program again.;
    %put ****;
  %end;
%mend;

%_registerIfNeeded;
