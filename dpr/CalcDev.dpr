program CalcDev;

uses
  Vcl.Forms,
  uPrincipal in '..\pas\uPrincipal.pas' {frm_principal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_principal, frm_principal);
  Application.Run;
end.
