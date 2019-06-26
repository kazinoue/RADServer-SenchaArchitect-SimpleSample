unit uBatchMove;

// EMS Resource Module
//
// FDBatchMoveJSONWriter を用いて JSON 生成処理のコードをほとんど書かない実装
//
// 開発時のAPI URL
//   GET http://localhost:8080/BatchMove/
//   GET http://localhost:8080/BatchMove/{CUST_NO}
interface

uses
  System.SysUtils, System.Classes, System.JSON,
  EMS.Services, EMS.ResourceAPI, EMS.ResourceTypes, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.IB, FireDAC.Phys.IBDef, FireDAC.ConsoleUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.BatchMove.JSON, FireDAC.Comp.BatchMove,
  FireDAC.Comp.BatchMove.DataSet, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  [ResourceName('BatchMove')]
  TBatchMoveResource1 = class(TDataModule)
    EmployeeConnection: TFDConnection;
    CustomerTable: TFDQuery;
    FDBatchMove1: TFDBatchMove;
    FDBatchMoveDataSetReader1: TFDBatchMoveDataSetReader;
    FDBatchMoveJSONWriter1: TFDBatchMoveJSONWriter;
  published
    procedure Get(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
    [ResourceSuffix('{item}')]
    procedure GetItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TBatchMoveResource1.Get(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
begin
  FDBatchMoveJSONWriter1.JsonWriter := AResponse.Body.JSONWriter;
  FDBatchMove1.Execute;
end;

procedure TBatchMoveResource1.GetItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  LItem: string;
begin
  LItem := ARequest.Params.Values['item'];

  CustomerTable.MacroByName('USE_WHERE').AsIdentifier := 'defined';
  CustomerTable.ParamByName('CUST_NO').AsString := LItem;

  FDBatchMoveJSONWriter1.JsonWriter := AResponse.Body.JSONWriter;
  FDBatchMove1.Execute;
end;

procedure Register;
begin
  RegisterResource(TypeInfo(TBatchMoveResource1));
end;

initialization
  Register;
end.


