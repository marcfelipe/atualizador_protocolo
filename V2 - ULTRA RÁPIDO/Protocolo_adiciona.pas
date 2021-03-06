unit Protocolo_adiciona;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, DB, IBDatabase, IBCustomDataSet,
  IBQuery, Buttons, DBClient, Provider, ComCtrls;

type
  TForm1 = class(TForm)
    IBDatabase1: TIBDatabase;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    DataSource1: TDataSource;
    Button1: TButton;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    IBQuery2: TIBQuery;
    IBTransaction2: TIBTransaction;
    Button2: TButton;
    IBQuery1TRNSEQ: TIBStringField;
    IBQuery1CXANUM: TIBStringField;
    IBQuery1TRNDAT: TDateTimeField;
    IBQuery1TRNNFCECHVNFE: TIBStringField;
    IBQuery1TRNNFCENUMPROT: TIBStringField;
    btnConectar: TBitBtn;
    edBancoNome: TEdit;
    edProtocoloNome: TEdit;
    btnDesconectar: TBitBtn;
    Label1: TLabel;
    Button3: TButton;
    OpenDialog1: TOpenDialog;
    Button5: TButton;
    odProtocolo: TOpenDialog;
    edProtocoloOrigem: TEdit;
    Button6: TButton;
    Memo1: TMemo;
    edNomeServidor: TEdit;
    dtpInicial: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    dtpFinal: TDateTimePicker;
    lbRecordsCount: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnConectarClick(Sender: TObject);
    procedure btnDesconectarClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  arq: TextFile;
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  IBQuery1.Close;
  IBQuery1.ParamByName('dtInicial').AsDate:=dtpInicial.Date;
  IBQuery1.ParamByName('dtFinal').AsDate:=dtpFinal.Date;
  IBQuery1.Open;
  IBQuery1.FetchAll;
  lbRecordsCount.Caption:='Total de Registros: '+IntToStr(IBQuery1.RecordCount);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
sep: string;
i: integer;
begin
  sep :=';';
  IBQuery1.First;
  i:=0;
  while not IBQuery1.Eof do
  begin

    Memo1.Lines.Add(IBQuery1TRNSEQ.AsString+sep+IBQuery1CXANUM.AsString+sep+
      IBQuery1TRNDAT.AsString+sep+IBQuery1TRNNFCECHVNFE.AsString+sep+
      IBQuery1TRNNFCENUMPROT.AsString);
    i:=i+1;
    IBQuery1.Next;
//    Memo1.Lines.SaveToFile('protocolo.txt');
  end;
  showMessage('Exportados '+IntToStr(i)+' registros');
  Memo1.Lines.SaveToFile(edProtocoloNome.Text);
end;

procedure TForm1.btnConectarClick(Sender: TObject);
begin
  IBDatabase1.Close;
  IBDatabase1.DatabaseName:=edNomeServidor.Text+':'+edBancoNome.Text;
  IBDatabase1.Connected:=true;
  btnConectar.Enabled:=false;
  btnDesconectar.Enabled:=true;
end;

procedure TForm1.btnDesconectarClick(Sender: TObject);
begin
  IBDatabase1.Connected:=false;
  btnConectar.Enabled:=true;
  btnDesconectar.Enabled:=false;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    edBancoNome.Text:=OpenDialog1.FileName;

  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
Memo1.Lines.SaveToFile('protocolo.txt');
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  AssignFile(arq, edProtocoloOrigem.Text);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
nreg,i,j: integer;  //lm = linha memo
linha,trnseq,trndat,cxanum,prot: string;
begin
  CopyFile(PChar(edProtocoloOrigem.Text),'protocolo_bkp.txt',true);
  reset(arq);
  i:=0; nreg:=0;
  Memo1.SelStart:=0;
  while (not Eof(arq)) do
  begin
    Readln(arq,linha);
    i := pos(';', linha);
    trnseq:=copy(linha,1,i-1);
    delete(linha, 1, i);
    i := pos(';', linha);
    cxanum:=copy(linha,1,i-1);
    delete(linha, 1, i);
    i := pos(';', linha);
    trndat:=copy(linha,1,i-1);
    delete(linha, 1, i);
    i := pos(';', linha);
    delete(linha, 1, i);
    //i := pos(';', linha);
    prot:= copy(linha,1,length(linha));
//    showMessage('trnseq: '+trnseq+#13#10+'cxanum:'+cxanum+#13#10+'trndat:'+trndat+#13#10+'protocolo:'+prot);  //debug message
    IBQuery2.ParamByName('trnseq').AsString:=trnseq;
    IBQuery2.ParamByName('cxanum').AsString:=cxanum;
    IBQuery2.ParamByName('trndat').AsString:=trndat;
    IBQuery2.ParamByName('prot').AsString:=prot;
    IBQuery2.ExecSQL;
    IBTransaction2.CommitRetaining;
    nreg:=nreg+1;
    
  end;
  showMessage('Atualizados '+IntToStr(nreg));
  CloseFile(arq);
  Append(arq);
end;

end.
