unit uWaitCursor;

// FDGUIxWaitCursor �̓R�[�h���łP���������z�u����΂悢�̂ŁA���̂��߂̃��j�b�g��p�ӂ��Ă݂܂���

interface

uses
  System.SysUtils, System.Classes, FireDAC.UI.Intf, FireDAC.ConsoleUI.Wait,
  FireDAC.Stan.Intf, FireDAC.Comp.UI;

type
  TDataModule1 = class(TDataModule)
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
  private
    { Private �錾 }
  public
    { Public �錾 }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

end.
