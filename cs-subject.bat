@echo off
title subject
if exist c:\Users\%USERNAME%\Downloads\subject2 (
	c: 
	cd \Users\%USERNAME%\Downloads
	ren subject2 subject2-%date:~5,2%%date:~8,2%-%RANDOM%
	git clone https://github.com/winofsql/subject2.git
	cd subject2
	rmdir .git /S /Q 
	Code lightbox.code-workspace
) else (
	c: 
	cd \Users\%USERNAME%\Downloads
	git clone https://github.com/winofsql/subject2.git
	cd subject2
	rmdir .git /S /Q 
	Code lightbox.code-workspace
)
