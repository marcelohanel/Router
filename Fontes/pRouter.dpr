program pRouter;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uModule in 'uModule.pas' {dtmPrincipal: TDataModule},
  uLogin in 'uLogin.pas' {frmLogin},
  uUsuarios in 'uUsuarios.pas' {frmUsuarios},
  uSobre in 'uSobre.pas' {frmSobre},
  uGeraChave in 'uGeraChave.pas' {frmGeraChave},
  uPesquisa in 'uPesquisa.pas' {frmPesquisa},
  uPersonaliza in 'uPersonaliza.pas' {frmPersonaliza},
  uMostra in 'uMostra.pas' {frmMostra},
  uPermissoes in 'uPermissoes.pas' {frmPermissoes},
  uLogs in 'uLogs.pas' {frmLogs},
  uFiltro in 'uFiltro.pas' {frmFiltro},
  uRelatorios in 'uRelatorios.pas' {frmRelatorios},
  uFind in 'uFind.pas' {frmFind},
  uReport in 'uReport.pas' {frmReport},
  uProgramas in 'uProgramas.pas' {frmProgramas},
  uMostraReport in 'uMostraReport.pas' {frmMostraReport},
  uParametros in 'uParametros.pas' {frmParametros},
  uLocais in 'uLocais.pas' {frmLocais},
  uMapa in 'uMapa.pas' {frmMapa},
  uTiposCaminho in 'uTiposCaminho.pas' {frmTiposCaminho},
  uLigacoes in 'uLigacoes.pas' {frmLigacoes},
  uEntregas in 'uEntregas.pas' {frmEntregas},
  uImporta in 'uImporta.pas' {frmImporta},
  uVeiculos in 'uVeiculos.pas' {frmVeiculos},
  uGanhos in 'uGanhos.pas' {frmGanhos},
  uCalcGanhos in 'uCalcGanhos.pas' {frmCalcGanhos},
  uCargas in 'uCargas.pas' {frmCargas},
  uOtimizacoes in 'uOtimizacoes.pas' {frmOtimizacoes},
  uWizardCargas in 'uWizardCargas.pas' {frmWizardCargas},
  uFinalizaCarga in 'uFinalizaCarga.pas' {frmFinalizaCarga},
  uPneus in 'uPneus.pas' {frmPneus};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
