# RADServer-SenchaArchitect-SimpleSample

これは Web API と Web Client を Delphi と Sencha Ext JS で作成したサンプルコードです。

Web API は RAD Server 向けのプロジェクトとして作成しており、Delphi 10.3.1 Enterprise / Architect で利用できます。ソースコード一式は PrjRADServerSample にあります。

Ext JS による Web Client は Sencha Architect 4.2.5 向けのプロジェクトとして作成しています。ソースコード一式は RADServerSimpleClient にあります。


Delphi と Sencha Architect が同一の開発機材上にインストールされている前提で実装していますので、それぞれ別の作業環境にインストールされている場合は Sencha Architect のプロジェクトから参照する API のホスト名を適切に変更してください。

また、RAD Server の設定ファイル "C:\Users\Public\Documents\Embarcadero\EMS\emsserver.ini" で Cross-Origin Resource Shareing の設定を変更する必要があります。開発環境の場合は特に制限をつける必要はありませんので、下記のように CrossDomain=* の設定を行ってください。

```ini
[Server.APICrossDomain]
;# Write here the domains allowed to call the API. Used for Cross-Domains
;# Set CrossDomain=* to allow access to any domain.
CrossDomain=*
```

