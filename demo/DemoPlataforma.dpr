program DemoPlataforma;

uses
  Vcl.Forms,
  frmPrincipal in 'frmPrincipal.pas' {uPrincipal},
  FrmLiberacao_F in 'FrmLiberacao_F.pas' {FrmLiberacao};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TuPrincipal, uPrincipal);
  Application.CreateForm(TFrmLiberacao, FrmLiberacao);
  Application.Run;
end.
