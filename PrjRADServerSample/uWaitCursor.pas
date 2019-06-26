unit uWaitCursor;

// FDGUIxWaitCursor はコード内で１か所だけ配置すればよいので、そのためのユニットを用意してみました

interface

uses
  System.SysUtils, System.Classes, FireDAC.UI.Intf, FireDAC.ConsoleUI.Wait,
  FireDAC.Stan.Intf, FireDAC.Comp.UI;

type
  TDataModule1 = class(TDataModule)
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
  private
    { Private 宣言 }
  public
    { Public 宣言 }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

end.
