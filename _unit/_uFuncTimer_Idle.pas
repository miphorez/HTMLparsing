unit _uFuncTimer_Idle;
interface
uses
    Forms, mshtml, Registry, SysUtils, Windows, MMSystem, SHDocVw;

procedure CaseTimerIdle;
//----------------------
procedure OpenSite;
procedure ControlNumberQ(iStr: String);
procedure DelFromMemoUnwantedStrings;
function LiveOnleNumberQ: string;

implementation
uses
   frmHTMLparsing, uHTMLp, TmImport;

procedure CaseTimerIdle;
begin
WITH frm_HTMLparsing do BEGIN
m_HTML.Clear;
m_HTML.Lines.Add('¬рем€ проверки: '+ DateTimeToStr(Now));
OpenSite;
tmSetTimerInterval(timerIdle, TIME_CONTROL);
tmStartTimer(timerIdle);
END;
end;

procedure OpenSite;
var
   Doc: IHTMLDocument2;
   iStrHTML: string;
begin
WITH frm_HTMLparsing do BEGIN
DocLoaded:= false;
wb_Site.Navigate(SiteAdr);
while DocLoaded=false do Forms.Application.ProcessMessages;
Doc:= wb_Site.Document as IHTMLDocument2;
iStrHTML:= Doc.body.innerHTML;
m_HTML.Text:= iStrHTML;
//убрать из мемо все лишние строки
DelFromMemoUnwantedStrings;
//оставить только номера вопросов
ControlNumberQ(LiveOnleNumberQ);
//Doc.Clear;
//wb_Site.Navigate('about:Blank');
//wb_Site.Refresh;
END;
end;

function LiveOnleNumberQ: string;
const
     SIGN = '<H1><A href="/answers/';
var
   i,cntLines: integer;
   iStr: string;
begin
WITH frm_HTMLparsing do BEGIN
  ListNumber.Clear;
  i:=0;
  cntLines:= m_HTML.Lines.Count;
  while i < cntLines do begin
      iStr:= m_HTML.Lines[i];
      delete(iStr, 1, length(SIGN));
      delete(iStr, 5, Length(iStr)-4);
      ListNumber.Add(iStr);
      inc(i);
  end;
  ListNumber.Sorted:= true;
  ListNumber.Sort;
//  i:=0;
//  while i < ListNumber.Count-1 do begin
//      m_HTML.Lines.Add(ListNumber.Strings[i]);
//      inc(i);
//  end;
  result:= ListNumber.Strings[ListNumber.Count-1];
END;
end;

procedure DelFromMemoUnwantedStrings;
const
     SIGN = '<H1><A href="/answers/';
var
   i: integer;
   iStr: string;
begin
WITH frm_HTMLparsing do BEGIN
  i:=0;
  while i < m_HTML.Lines.Count do begin
      iStr:= m_HTML.Lines[i];
      if pos(SIGN, iStr)=0 then begin
         m_HTML.Lines.Delete(i);
         continue;
      end;
      inc(i);
  end;
END;
end;

procedure ControlNumberQ(iStr: String);
const
     SIGN = '<H1><A href="/answers/';
var
  Reg: TRegistry;
  sReg: string;
  iReg, iLast: integer;
  yes: boolean;
begin
WITH frm_HTMLparsing do BEGIN
m_HTML.Clear;
m_HTML.Lines.Add('¬рем€ проверки: '+ DateTimeToStr(Now));
  //вз€ть из реестра последний номер
   Reg:= TRegistry.Create;
   Reg.RootKey:= HKEY_LOCAL_MACHINE;
   Reg.OpenKey(REGKEY_HTMLP,true);
   sReg:=   Reg.ReadString(REGVAL_NUMLASTQ);
   Reg.CloseKey;
   Reg.Free;
  //последний номер с сайта
  m_HTML.Lines.Add('ѕоследний вопрос на сайте  - '+iStr);
  m_HTML.Lines.Add('ќбработанный номер вопроса - '+sReg);
  yes:= true; iLast:=0; iReg:=0;
  try
    iLast:= StrToInt(iStr);
    iReg:= StrToInt(sReg);
  except yes:= false; end;

  //сравнить номера
  if yes then
  if iLast>iReg then begin
   m_HTML.Lines.Add('¬нимание! ≈сть новый вопрос!');
  //запомнить номер последнего вопроса
   Reg:= TRegistry.Create;
   Reg.RootKey:= HKEY_LOCAL_MACHINE;
   Reg.OpenKey(REGKEY_HTMLP,true);
   Reg.WriteString(REGVAL_NUMLASTQ,iStr);
   Reg.CloseKey;
   Reg.Free;
   sndPlaySound(sound_OK,SND_MEMORY or SND_ASYNC);
   ti_HTMLp.IconIndex:=1;
   ti_HTMLp.Refresh;
  end;
HideCaret(m_HTML.Handle);
END;
end;

end.
