unit frmHTMLparsing;

interface

uses
  Windows, Forms, Messages, SysUtils, Variants, Classes, Graphics, Controls, 
  Dialogs, ExtCtrls, OleCtrls, SHDocVw, _frEditSave,  Registry,
  mshtml, MMSystem, TmImport, ShellApi,
  uHTMLp, StdCtrls, ImgList, Menus, _uFuncTimer_Idle;

type
  Tfrm_HTMLparsing = class(TForm)
    wb_Site: TWebBrowser;
    p_main: TPanel;
    fr_eSite: Tfr_EditSave;
    m_HTML: TMemo;
    p_memo: TPanel;
    spl_memo: TSplitter;
    p_site: TPanel;
    ti_HTMLp: TTrayIcon;
    IconOne: TImageList;
    MainMenu: TMainMenu;
    mi_Exit: TMenuItem;
    p_edit: TPanel;
    btn_GoSite: TButton;
    N1: TMenuItem;
    mi_autostart: TMenuItem;
    procedure WMDataFromEditSave(var msg: TMessage); message WM_EDITSAVE;
    procedure WMHide(var MSg : TMessage); message WM_HIDE;
    procedure WMAsyncNotify(var MSg : TMessage); message WM_ASYNCNOTIFY;
    procedure FormShow(Sender: TObject);
    procedure wb_SiteDocumentComplete(ASender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
    procedure ti_HTMLpDblClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure mi_ExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure btn_GoSiteClick(Sender: TObject);
    procedure m_HTMLClick(Sender: TObject);
    procedure mi_autostartClick(Sender: TObject);
  private
    procedure FormMinimize(Sender: TObject);
    procedure ShowTimer(Num: integer);
    procedure TimerNotifyEvent(Sender: TObject; Msg, UserParam: dword);
    { Private declarations }
  public
    { Public declarations }
    DocLoaded: boolean;
    SiteAdr: string;
    timerIdle : THandle;
    ListNumber: TStringList;
    FalseClick: boolean;
  end;

var
  frm_HTMLparsing: Tfrm_HTMLparsing;
  sound_OK, sound_ERR: pointer;

implementation

{$R *.dfm}
{$R HTMLp.res}

{ Tfrm_HTMLparsing }
var
  flExit: boolean;             //флаг разрешения закрытия программы
  flHide: boolean;             //флаг скрытия агента в трее

procedure Tfrm_HTMLparsing.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if not flExit then begin
   CanClose:=false;
   Hide;
end else begin
   ti_HTMLp.Visible:= false;
   CanClose:=true;
end;
end;

procedure Tfrm_HTMLparsing.FormCreate(Sender: TObject);
begin
flHide:= false;
ListNumber:= TStringList.Create;
//создание фонового таймера
timerIdle:= tmCreateIntervalTimer(TimerNotifyEvent, TIME_CONTROL, tmStartStop,
            false, dword(pchar('')), 1);
end;

procedure Tfrm_HTMLparsing.TimerNotifyEvent(Sender : TObject; Msg,UserParam : dword);
begin
  PostMessage(Handle, WM_ASYNCNOTIFY, UserParam, 0);
end;

procedure Tfrm_HTMLparsing.FormDestroy(Sender: TObject);
begin
ListNumber.Free;
tmCloseTimer(timerIdle);
end;

procedure Tfrm_HTMLparsing.ShowTimer(Num: integer);
begin
Case num of
     //обработка таймеров
     1:try CaseTimerIdle; except end;
End;
end;

procedure Tfrm_HTMLparsing.FormShow(Sender: TObject);
var
   Yes: boolean;
   Reg: TRegistry;
begin
//подключить первоначальную иконку
ti_HTMLp.Icons:=IconOne;
ti_HTMLp.IconIndex:=0;
HideCaret(m_HTML.Handle);
if flHide then begin
   flHide:= false;
   Exit;
end;

fr_eSite.SetBtn(70,'Адрес сайта:',false,Handle,m_HTML,'','');
fr_eSite.btn_save.Hint:= 'Выбрать сайт для парсинга';
fr_eSite.SetSaveOpenMode(true,false);
fr_eSite.SetEdit(teSiteName, 0);
//загрузка сайта, если есть адрес
SiteAdr:= fr_eSite.GetStr;
tmSetTimerInterval(timerIdle, TIME_CONTROL);
Yes:= true;
if SiteAdr<>'' then  begin
   tmStartTimer(timerIdle);
   CaseTimerIdle;
end else begin
  m_HTML.Lines.Add('Адрес сайта не введен!');
  Yes:= false;
end;
if Yes then begin
   Forms.Application.OnMinimize := FormMinimize;
   PostMessage(Handle, WM_HIDE, 0, 0);
end;
flExit:= false;
FalseClick:= true;
   Reg:= TRegistry.Create;
   Reg.RootKey:= HKEY_LOCAL_MACHINE;
   Reg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Run',true);
   if Reg.ValueExists(SIGNATURE_HTMLP) then
      mi_autostart.Checked:= true else mi_autostart.Checked:= false;
   Reg.Free;
FalseClick:= false;
HideCaret(m_HTML.Handle);
end;

procedure Tfrm_HTMLparsing.FormHide(Sender: TObject);
begin
flHide:= true;
end;

procedure Tfrm_HTMLparsing.mi_autostartClick(Sender: TObject);
var
   Reg: TRegistry;
begin
if FalseClick then Exit;
   Reg:= TRegistry.Create;
   Reg.RootKey:= HKEY_LOCAL_MACHINE;
   Reg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Run',true);
   FalseClick:= true;
   if not mi_autostart.Checked then begin
      mi_autostart.Checked:= true;
      Reg.WriteString(SIGNATURE_HTMLP, ParamStr(0));
   end else begin
      mi_autostart.Checked:= false;
      Reg.DeleteValue(SIGNATURE_HTMLP);
   end;
   Reg.Free;
   FalseClick:= false;
end;

procedure Tfrm_HTMLparsing.mi_ExitClick(Sender: TObject);
begin
flExit:= true;
Close;
end;

procedure Tfrm_HTMLparsing.m_HTMLClick(Sender: TObject);
begin
HideCaret(m_HTML.Handle);
end;

procedure Tfrm_HTMLparsing.FormMinimize(Sender: TObject);
begin
Close;
end;

procedure Tfrm_HTMLparsing.btn_GoSiteClick(Sender: TObject);
var
   Reg: TRegistry;
   sNum: string;
begin
  //взять из реестра последний номер
   Reg:= TRegistry.Create;
   Reg.RootKey:= HKEY_LOCAL_MACHINE;
   Reg.OpenKey(REGKEY_HTMLP,true);
   sNum:=   Reg.ReadString(REGVAL_NUMLASTQ);
   Reg.CloseKey;
   Reg.Free;
ShellExecute( Handle, 'open', PChar(SiteAdr+'/'+sNum), nil, nil, SW_NORMAL );
end;

procedure Tfrm_HTMLparsing.ti_HTMLpDblClick(Sender: TObject);
begin
//раскрыть окно по двойному клику на иконке в трее
  WindowState:= wsNormal;
  Show;
  Forms.Application.Restore;
  Forms.Application.BringToFront;
  ti_HTMLp.IconIndex:=0;
  ti_HTMLp.Refresh;
end;

procedure Tfrm_HTMLparsing.wb_SiteDocumentComplete(ASender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
DocLoaded:= true;
end;

procedure Tfrm_HTMLparsing.WMAsyncNotify(var MSg: TMessage);
begin
  ShowTimer(MSg.WParam);
end;

procedure Tfrm_HTMLparsing.WMDataFromEditSave(var msg: TMessage);
var
  lp: PChar;
  iStr: string;
  Reg: TRegistry;
begin
case msg.WParam of

WM_EDITSAVE_SITEADR: begin  //ввод названия сайта
   lp := PChar(msg.lParam);
   iStr:= string(lp);
   Reg:= TRegistry.Create;
   Reg.RootKey:= HKEY_LOCAL_MACHINE;
   Reg.OpenKey(REGKEY_HTMLP,true);
   Reg.WriteString(REGVAL_SITEADR,iStr);
   Reg.Free;
   tmSetTimerInterval(timerIdle, TIME_CONTROL);
   tmStartTimer(timerIdle);
   CaseTimerIdle;
end;
end;

end;

procedure Tfrm_HTMLparsing.WMHide(var MSg: TMessage);
begin
  Hide;
end;

initialization
  sound_OK:= LockResource(LoadResource(hInstance,
  (FindResource(hInstance, 'sound_OK', 'WAVE'))));
//  nconvert.exe -quiet -multi -o "%O.ico" -out ico -l %L

end.
