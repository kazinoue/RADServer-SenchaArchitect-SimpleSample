# RADServer-SenchaArchitect-SimpleSample

これは Web API と Web Client を Delphi と Sencha Ext JS で作成したサンプルコードです。

## 利用上の注意

Delphi と Sencha Architect が同一の開発機材上にインストールされている前提で実装しています。

それぞれ別の作業環境にインストールされている場合は Sencha Architect のプロジェクトから参照する API のホスト名を適切に変更してください。

また、RAD Server の設定ファイル "C:\Users\Public\Documents\Embarcadero\EMS\emsserver.ini" で Cross-Origin Resource Shareing の設定を変更する必要があります。開発環境の場合は特に制限をつける必要はありませんので、下記のように CrossDomain=* の設定を行ってください。

```ini
[Server.APICrossDomain]
;# Write here the domains allowed to call the API. Used for Cross-Domains
;# Set CrossDomain=* to allow access to any domain.
CrossDomain=*
```

## Web API 側の実装

Web API は RAD Server 向けのプロジェクトとして作成しています。
Delphi 10.3.1 Enterprise / Architect で利用できます。
ソースコード一式は PrjRADServerSample にあります。


### EMSDataSetResource による実装

下記２つのAPIを実装しています。
実装の詳細は uEMSDataSetResource.pas を参照してください。

GET http://localhost:8080/EMSDataSetResource/
InterBase の EMPLOYEE.GDB データベースより CUSTOMER テーブルの一覧をJSON配列で返します。

GET http://localhost:8080/EMSDataSetResource/{CUST_NO}
InterBase の EMPLOYEE.GDB データベースより CUSTOMER テーブルから指定された CUST_NO のレコードをJSONで返します。

### FDBatchMoveJSONWriter による実装

下記２つのAPIを実装しています。
実装の詳細は uBatchMove.pas を参照してください。

GET http://localhost:8080/BatchMove/
InterBase の EMPLOYEE.GDB データベースより CUSTOMER テーブルの一覧をJSON配列で返します。

GET http://localhost:8080/BatchMove/{CUST_NO}
InterBase の EMPLOYEE.GDB データベースより CUSTOMER テーブルから指定された CUST_NO のレコードをJSON配列で返します。

## Web Client 側の実装

Ext JS による Web Client は Sencha Architect 4.2.5 向けのプロジェクトとして作成しています。ソースコード一式は RADServerSimpleClient にあります。

### 利用方法

Sencha Architect で RADServerSimpleClient.xds ファイルを開いたのち、一度セーブすると利用できるようになります。セーブするのはプロジェクトのディレクトリに Ext JS フレームワークを追加するためです。（Ext JS フレームワーク自体は .gitignore によりリポジトリの管理対象から外しています）

### 実装内容のサマリ

CustomerModel でデータ構造を定義しています。

CustomerStore で API から受け取るデータを処理します

```javascript
            // データを API から自動的に読み込む
            autoLoad: true,

            // この Store が使用する Model を指定
            model: 'MyApp.model.CustomerModel',
            proxy: {
                // Web API 参照に REST Proxy を使用
                type: 'rest',
                // 参照するAPIの設定
                url: 'http://localhost:8080/EMSDataSetResource/',
                // API からの応答は JSON で受け取る
                reader: {
                    type: 'json'
                }
            }
```            


データは MyPanel 内の Grid で表示させています。
Grid が参照する Store を設定し、それぞれの Column では dataIndex により参照するフィールドを指定しています。
