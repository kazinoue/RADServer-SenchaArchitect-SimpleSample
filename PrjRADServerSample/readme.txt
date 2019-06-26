RAD Server でシンプルなJSONを返す実装のサンプルです。
Delphi 10.3.1 以降で利用できます。

開発環境で Ext JS などの JavaScript アプリケーションと組み合わせる場合は emsserver.ini で CORS (Cross-Origin Resource Shareing) を許可する必要があります。

設定ファイルは　"C:\Users\Public\Documents\Embarcadero\EMS\emsserver.ini" にあります。
設定箇所は下記の通りです。

[Server.APICrossDomain]
;# Write here the domains allowed to call the API. Used for Cross-Domains
;# Set CrossDomain=* to allow access to any domain.
CrossDomain=*

