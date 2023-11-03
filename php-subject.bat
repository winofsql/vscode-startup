@echo off
title subject
if exist c:\Users\%USERNAME%\Downloads\subject (
	c: 
	cd \Users\%USERNAME%\Downloads
	ren subject subject-%date:~5,2%%date:~8,2%-%RANDOM%
	git clone https://github.com/winofsql/subject.git
	cd subject
	rmdir .git /S /Q 
	Code lightbox.code-workspace
) else (
	c: 
	cd \Users\%USERNAME%\Downloads
	git clone https://github.com/winofsql/subject.git
	cd subject
	rmdir .git /S /Q 
	Code lightbox.code-workspace
)

