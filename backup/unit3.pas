unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation
Uses unit1, unit2;

{$R *.lfm}

{ TForm2 }

procedure TForm2.Button1Click(Sender: TObject);
begin
 Form1.SQLQuery1.Active:=false;
    Form1.SQLQuery1.SQL.Clear;
    Form1.SQLQuery1.SQL.add('SELECT * from  komer4banki WHERE `Вклад на год` BETWEEN ' + Form3.Edit1.Text + ' AND ' + Edit1.Text + ';');
    Form1.SQLQuery1.Open;
    Form3.Edit1.clear;
    Form2.Close;
end;

end.

