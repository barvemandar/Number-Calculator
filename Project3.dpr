program Project3;

uses
  Vcl.Forms,
  frmCalculator_u in 'frmCalculator_u.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
