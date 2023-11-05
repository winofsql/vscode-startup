@echo off
title subject
if exist c:\Users\%USERNAME%\Downloads\subject3 (
	c: 
	cd \Users\%USERNAME%\Downloads
	ren subject3 subject3-%date:~5,2%%date:~8,2%-%RANDOM%
	git clone https://github.com/winofsql/subject3.git
	cd subject3
	rmdir .git /S /Q 
	Code lightbox.code-workspace
) else (
	c: 
	cd \Users\%USERNAME%\Downloads
	git clone https://github.com/winofsql/subject3.git
	cd subject3
	rmdir .git /S /Q 
	Code lightbox.code-workspace
)
