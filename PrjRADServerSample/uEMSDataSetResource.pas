unit uEMSDataSetResource;

// EMS Resource Module
//
// EMSDataSetResource によるノーコーディングの実装
//
//   GET http://localhost:8080/SimpleAPI/
//   GET http://localhost:8080/SimpleAPI/{CUST_NO}

interface

uses
  System.SysUtils, System.Classes, System.JSON,
  EMS.Services, EMS.ResourceAPI, EMS.ResourceTypes, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.IB, FireDAC.Phys.IBDef, FireDAC.ConsoleUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  EMS.DataSetResource, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.StorageJSON;

type
  [ResourceName('EMSDataSetResource')]
  TSimpleAPIResource1 = class(TDataModule)
    [ResourceSuffix('list',   '/')]
    [ResourceSuffix('get',    '/{CUST_NO}')]
    [ResourceSuffix('post',   '/')]
    [ResourceSuffix('put',    '/{CUST_NO}')]
    [ResourceSuffix('delete', '/{CUST_NO}')]
    EMSDataSetResource1: TEMSDataSetResource;
    FDSchemaAdapter1: TFDSchemaAdapter;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    EmployeeConnection: TFDConnection;
    CustomerTable: TFDQuery;
  published
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure Register;
begin
  RegisterResource(TypeInfo(TSimpleAPIResource1));
end;

initialization
  Register;
end.


