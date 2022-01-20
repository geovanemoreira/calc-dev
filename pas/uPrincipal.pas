unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, RLReport,
  Vcl.Imaging.pngimage;

type
  Tfrm_principal = class(TForm)
    Label1: TLabel;
    edt_hora_dia: TEdit;
    Label2: TLabel;
    edt_dias: TEdit;
    Label3: TLabel;
    edt_desconto: TEdit;
    Label4: TLabel;
    edt_acrescimo: TEdit;
    gb_resultado: TGroupBox;
    Label5: TLabel;
    lb_total_horas: TLabel;
    bt_calcular: TBitBtn;
    Label7: TLabel;
    lb_valor_hora: TLabel;
    Label9: TLabel;
    lb_valor_servico: TLabel;
    Label11: TLabel;
    lb_desconto: TLabel;
    Label13: TLabel;
    lb_acrescimo: TLabel;
    Label15: TLabel;
    lb_total: TLabel;
    rpDocumento: TRLReport;
    RLBand1: TRLBand;
    RLImage1: TRLImage;
    RLDraw1: TRLDraw;
    RLBand2: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLDraw2: TRLDraw;
    RLBand3: TRLBand;
    procedure edt_hora_diaKeyPress(Sender: TObject; var Key: Char);
    procedure edt_diasKeyPress(Sender: TObject; var Key: Char);
    procedure edt_descontoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_acrescimoKeyPress(Sender: TObject; var Key: Char);
    procedure bt_calcularClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_principal: Tfrm_principal;

implementation

{$R *.dfm}

procedure Tfrm_principal.bt_calcularClick(Sender: TObject);
var
  Salario, Desconto, Acrescimo: Double;
  VlrServico, VlrTotal, VlrHora, TotalHoras: Double;
begin
  Salario := 3000;
  VlrHora := Salario / 168;
  TotalHoras := StrToFloat(edt_hora_dia.Text) * StrToInt(edt_dias.Text);
  VlrServico := TotalHoras * VlrHora;
  Desconto := (StrToFloat(edt_desconto.Text)/100) * VlrServico;
  Acrescimo := (StrToFloat(edt_acrescimo.Text)/100) * VlrServico;
  VlrTotal := VlrServico + Acrescimo - Desconto;

  lb_total_horas.Caption := FloatToStr(TotalHoras);
  lb_valor_hora.Caption := FormatFloat('R$ #,0.00', VlrHora);
  lb_valor_servico.Caption := FormatFloat('R$ #,0.00', VlrServico);
  lb_desconto.Caption := FormatFloat('R$ #,0.00', Desconto);
  lb_acrescimo.Caption := FormatFloat('R$ #,0.00', Acrescimo);
  lb_total.Caption := FormatFloat('R$ #,0.00', VlrTotal);

  //rpDocumento.Preview;

  gb_resultado.SetFocus;
end;

procedure Tfrm_principal.edt_acrescimoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    bt_calcular.Click;
    key := #0;
  end;
end;

procedure Tfrm_principal.edt_descontoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    edt_acrescimo.SetFocus;
    key := #0;
  end;
end;

procedure Tfrm_principal.edt_diasKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    edt_desconto.SetFocus;
    key := #0;
  end;
end;

procedure Tfrm_principal.edt_hora_diaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    edt_dias.SetFocus;
    key := #0;
  end;
end;

procedure Tfrm_principal.FormCreate(Sender: TObject);
begin
  rpDocumento.Left := -5000;
end;

end.
