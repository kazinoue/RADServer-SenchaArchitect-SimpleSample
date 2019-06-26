object BatchMoveResource1: TBatchMoveResource1
  OldCreateOrder = False
  Height = 405
  Width = 460
  object EmployeeConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=EMPLOYEE')
    Connected = True
    LoginPrompt = False
    Left = 89
    Top = 43
  end
  object CustomerTable: TFDQuery
    Connection = EmployeeConnection
    SQL.Strings = (
      'SELECT * FROM CUSTOMER'
      '{IF !USE_WHERE}'
      '  WHERE CUST_NO=:CUST_NO'
      '{FI}')
    Left = 89
    Top = 91
    MacroData = <
      item
        Value = ''
        Name = 'USE_WHERE'
      end>
  end
  object FDBatchMove1: TFDBatchMove
    Reader = FDBatchMoveDataSetReader1
    Writer = FDBatchMoveJSONWriter1
    Mappings = <>
    LogFileName = 'Data.log'
    Left = 88
    Top = 224
  end
  object FDBatchMoveDataSetReader1: TFDBatchMoveDataSetReader
    DataSet = CustomerTable
    Left = 88
    Top = 168
  end
  object FDBatchMoveJSONWriter1: TFDBatchMoveJSONWriter
    DataDef.Fields = <>
    Left = 88
    Top = 288
  end
end
