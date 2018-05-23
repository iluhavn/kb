unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, mysql51conn, mysql56conn, sqldb, db, FileUtil, Forms,
  Controls, Graphics, Dialogs, StdCtrls, DBGrids, ExtCtrls, DbCtrls, Variants, unit2;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Image1: TImage;
    Label1: TLabel;
    MySQL56Connection1: TMySQL56Connection;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure DBGrid1SelectEditor(Sender: TObject; Column: TColumn;
      var Editor: TWinControl);
    procedure FormCreate(Sender: TObject);
    procedure Image1Resize(Sender: TObject);
    procedure Image1StartDrag(Sender: TObject; var DragObject: TDragObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  try
    MySQL56Connection1.Connected:=true;
  except
    ShowMessage(' Не могу подключиться к базе данных');
  exit;
  end;
  try
    SQLTransaction1.Active:=true;
  except
    ShowMessage(' Не могу создать транзакцию');
  exit;
  end;
  try
    SQLQuery1.Active:=false;
    SQLQuery1.SQL.Clear;
    SQLQuery1.SQL.add('SELECT * from  komer4banki;');
    SQLQuery1.Open;
  except
    ShowMessage(' Ошибка при выполнении SQL запроса.');
  exit;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   SQLQuery1.Active:=false;
    SQLQuery1.SQL.Clear;
    SQLQuery1.SQL.add('SELECT * from  komer4banki ORDER BY `Вклад на год` DESC;');
    SQLQuery1.Open;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
   SQLQuery1.Active:=false;
    SQLQuery1.SQL.Clear;
    SQLQuery1.SQL.add('SELECT * from  komer4banki ORDER BY `Вклад на год` ASC;');
    SQLQuery1.Open;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
 Form3.ShowModal;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
     SQLQuery1.Close;
end;

procedure TForm1.DBGrid1SelectEditor(Sender: TObject; Column: TColumn;
  var Editor: TWinControl);
var f: string;
begin
  DBGrid1.Columns.Items[5].Visible:=false;
  DBGrid1.Columns.Items[0].width:=20;
  DBGrid1.Columns.Items[1].width:=100;
  DBGrid1.Columns.Items[2].width:=450;
  DBGrid1.Columns.Items[3].width:=80;
  DBGrid1.Columns.Items[4].width:=100;
  DBGrid1.Columns.Items[3].DisplayFormat:='0.00%';
     f := VarToStr(DBGrid1.Columns.Items[5].Field.Value);
     if f <> '' then
        Image1.Picture.LoadFromFile('img\' + f)
     else
         Image1.Picture.Clear;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Image1Resize(Sender: TObject);
begin

end;

procedure TForm1.Image1StartDrag(Sender: TObject; var DragObject: TDragObject);
begin

end;

end.

