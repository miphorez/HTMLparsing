unit uHTMLp;
interface
uses
  Messages;

const
  REGKEY_HTMLP = 'Software\Microsoft\Windows\CurrentVersion\Uninstall\HTMLparsing';
  REGVAL_SITEADR = 'SiteAddress';
  REGVAL_NUMLASTQ = 'NumLastQ';
  SIGNATURE_HTMLP = 'HTMLparsing';

  TIME_CONTROL = 300000; //5 �����

  WM_CLOSEPROG = WM_USER + 1; //������� ���������
  WM_TWOEXEC   = WM_USER + 2; //������ ������ �����
  WM_HIDE      = WM_USER + 3;
  WM_ASYNCNOTIFY = WM_USER+4;
  //������� �� �������
  WM_EDITSAVE = WM_USER + 1001;
     WM_EDITSAVE_SITEADR = 1;


type
  TLimitType = (
  ltNone,
  ltOnlyCyr,
  ltOnlyDigit
  );


function DelLeftRightSpace(ItemStr:string): string;

implementation

{������� ������� ����� � ������}
function DelLeftRightSpace(ItemStr:string): string;
var len:integer;
begin
if Length(ItemStr)>0 then
   while (Length(ItemStr)>0) do
         if (ItemStr[1]=' ') then Delete(ItemStr,1,1) else break;
if Length(ItemStr)>0 then
   while 1=1 do begin
    len:= Length(ItemStr);
    if ItemStr[len]=' ' then Delete(ItemStr,len,1) else break;
   end;
Result:= ItemStr;
end;

end.
