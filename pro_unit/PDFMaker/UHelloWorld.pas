unit UHelloWorld;
{*
 *  HelloWorld 最も単純なプログラム
 *
 *  Copyright(c) 1999 Takezou
 *
 *}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  THelloWorldForm = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private 宣言 }
  public
    { Public 宣言 }
  end;

var
  HelloWorldForm: THelloWorldForm;

implementation

uses PDFMaker, PMFonts;

{$R *.DFM}

procedure THelloWorldForm.Button1Click(Sender: TObject);
begin
  with TPDFMaker.Create do
  begin
    BeginDoc(TFileStream.Create('HelloWorld.pdf', fmCreate));

    Canvas.FontSize := 20;
    Canvas.TextOut(200, 500, 'Hello World');

    EndDoc(true);
    Free;
  end;
  ShowMessage('HelloWorld.pdfを作成しました');
  Close;
end;

end.
