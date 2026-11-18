program FileManager;

{$mode objfpc}{$H+}

{
  shae-delphi-file-manager — Desktop file manager in Free Pascal / Delphi.

  A console-based file manager that:
    - browses directory contents
    - navigates up / into folders
    - shows file name, size, type
    - selects and opens files (enters directories or prints text files)

  Requires Free Pascal Compiler (fpc) or Lazarus/Delphi. Not available for
  compile-testing in this environment; see README.md and scripts/install.sh.

  Build (Free Pascal):
    fpc filemanager.pas
    ./filemanager
}

uses
  SysUtils, Classes, StrUtils;

const
  APP_NAME   = 'SHAE File Manager';
  APP_VERSION = 'v0.1.0';

var
  CurrentDir: String;

{ -------------------------------------------------------------------------- }
{  Output helpers                                                            }
{ -------------------------------------------------------------------------- }

procedure PrintHeader;
begin
  WriteLn('========================================');
  WriteLn(APP_NAME, ' ', APP_VERSION);
  WriteLn('========================================');
  WriteLn('');
end;

procedure PrintHelp;
begin
  WriteLn('Commands:');
  WriteLn('  ls            List current directory contents');
  WriteLn('  cd <dir>      Change into <dir>');
  WriteLn('  up            Go up one directory level');
  WriteLn('  open <file>   Open a file or enter a directory');
  WriteLn('  pwd           Print the current working directory');
  WriteLn('  help          Show this help');
  WriteLn('  quit          Exit the file manager');
  WriteLn('');
end;

{ -------------------------------------------------------------------------- }
{  Directory listing                                                         }
{ -------------------------------------------------------------------------- }

procedure ListDirectory(const Path: String);
var
  Search: TSearchRec;
begin
  WriteLn('');
  WriteLn('Directory: ', Path);
  WriteLn('----------------------------------------');
  WriteLn(PadRight('NAME', 40), PadRight('SIZE', 12), 'TYPE');
  WriteLn('----------------------------------------');

  if FindFirst(Path + PathDelim + '*', faAnyFile, Search) = 0 then
  begin
    repeat
      if (Search.Name <> '.') and (Search.Name <> '..') then
      begin
        if (Search.Attr and faDirectory) <> 0 then
          WriteLn(PadRight(Search.Name, 40), PadRight('<DIR>', 12), 'Directory')
        else
          WriteLn(PadRight(Search.Name, 40), PadRight(IntToStr(Search.Size), 12), 'File');
      end;
    until FindNext(Search) <> 0;
    FindClose(Search);
  end;
  WriteLn('');
end;

{ -------------------------------------------------------------------------- }
{  Navigation                                                                }
{ -------------------------------------------------------------------------- }

procedure ChangeDir(const NewDir: String);
begin
  if ChDir(NewDir) = 0 then
    CurrentDir := GetCurrentDir
  else
    WriteLn('Error: cannot enter directory ', NewDir);
end;

{ -------------------------------------------------------------------------- }
{  Open file / directory                                                     }
{ -------------------------------------------------------------------------- }

procedure OpenFile(const FileName: String);
var
  F: TextFile;
  Line: String;
begin
  if DirectoryExists(FileName) then
  begin
    ChangeDir(FileName);
    Exit;
  end;

  if not FileExists(FileName) then
  begin
    WriteLn('Error: not found: ', FileName);
    Exit;
  end;

  AssignFile(F, FileName);
  {$I-}
  Reset(F);
  {$I+}
  if IOResult <> 0 then
  begin
    WriteLn('Error: cannot open ', FileName);
    Exit;
  end;

  WriteLn('--- ', FileName, ' ---');
  while not Eof(F) do
  begin
    ReadLn(F, Line);
    WriteLn(Line);
  end;
  CloseFile(F);
  WriteLn('--- end ---');
end;

{ -------------------------------------------------------------------------- }
{  Main                                                                      }
{ -------------------------------------------------------------------------- }

var
  Input: String;
  Cmd: String;
  Arg: String;
begin
  CurrentDir := GetCurrentDir;
  PrintHeader;
  PrintHelp;

  repeat
    Write(CurrentDir, '> ');
    ReadLn(Input);
    Input := Trim(Input);

    if Input = '' then
      Continue;

    Cmd := LowerCase(Word(Input, 1));
    Arg := Trim(Copy(Input, Length(Cmd) + 2, MaxInt));

    if Cmd = 'help' then
      PrintHelp
    else if Cmd = 'ls' then
      ListDirectory(CurrentDir)
    else if Cmd = 'pwd' then
      WriteLn(CurrentDir)
    else if Cmd = 'cd' then
    begin
      if Arg = '' then
        WriteLn('Usage: cd <dir>')
      else
        ChangeDir(IncludeTrailingPathDelimiter(CurrentDir) + Arg);
    end
    else if Cmd = 'up' then
      ChangeDir('..')
    else if Cmd = 'open' then
    begin
      if Arg = '' then
        WriteLn('Usage: open <file>')
      else
        OpenFile(IncludeTrailingPathDelimiter(CurrentDir) + Arg);
    end
    else if Cmd = 'quit' then
      WriteLn('Goodbye.')
    else
      WriteLn('Unknown command: ', Cmd, '. Type "help".');
  until Cmd = 'quit';
end.
