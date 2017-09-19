unit uReport;

interface

uses
  IniFiles, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, StdCtrls,
  ppRptExp, ppProd, ppClass, ppReport, ppDsgnDB, ppEndUsr, ppBands,
  ppModule, daDatMod, daDatMan, daDBBDE, ppCTDsgn, raIDE, myChkBox,
  daQuery, daQClass, daIBExpress, daDB, daDataVw, daADO, ExtCtrls, TeeProcs,
  TeEngine, Chart, ppPrnabl, ppCtrls, ppDBBDE, ADODB, ppTxPipe;

type
  TfrmReport = class(TForm)
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDesigner1: TppDesigner;
    ppDataDictionary1: TppDataDictionary;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReport: TfrmReport;

implementation

uses uPrincipal, uModule;

{$R *.dfm}

procedure TfrmReport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    frmPrincipal.GeraLogs(Self.Name,'Fechar','S',0);
    Action := caFree;
end;

end.
