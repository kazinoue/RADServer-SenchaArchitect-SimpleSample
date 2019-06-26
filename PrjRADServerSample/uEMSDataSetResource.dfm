object SimpleAPIResource1: TSimpleAPIResource1
  OldCreateOrder = False
  Height = 289
  Width = 379
  object EMSDataSetResource1: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = CustomerTable
    ValueFields = 
      'ADDRESS_LINE1;ADDRESS_LINE2;CITY;CONTACT_FIRST;CONTACT_LAST;COUN' +
      'TRY;CUST_NO;CUSTOMER;ON_HOLD;PHONE_NO;POSTAL_CODE;STATE_PROVINCE'
    PageSize = 25
    Left = 48
    Top = 152
  end
  object FDSchemaAdapter1: TFDSchemaAdapter
    Left = 176
    Top = 88
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 176
    Top = 152
  end
  object EmployeeConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=EMPLOYEE')
    LoginPrompt = False
    Left = 51
    Top = 33
  end
  object CustomerTable: TFDQuery
    Connection = EmployeeConnection
    SchemaAdapter = FDSchemaAdapter1
    SQL.Strings = (
      'SELECT * FROM CUSTOMER'
      '{IF &SORT} order by &SORT {FI}')
    Left = 51
    Top = 89
    MacroData = <
      item
        Value = Null
        Name = 'SORT'
        DataType = mdIdentifier
      end>
  end
end
