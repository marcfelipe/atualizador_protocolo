program Projeto_protocolo;

uses
  Forms,
  Protocolo_adiciona in 'Protocolo_adiciona.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
