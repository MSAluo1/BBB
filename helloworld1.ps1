#导入IIS管理模块
Import-Module WebAdministration
#新建应用程序池
New-Item iis:\AppPools\api.helloworld.com
#新建站点并绑定
#New-Item iis:\Sites\api.helloworld.com -bindings @{protocol="http";bindingInformation=":80:api.helloworld.com"} -physicalPath d:\helloworld
#更改应用程序池为api.helloworld.com
#Set-ItemProperty IIS:\Sites\api.helloworld.com -name applicationgPool -value api.helloworld.com
