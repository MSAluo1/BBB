#task: 1.create an AppPools 2.reate website 3.binding  4.the website use the AppPools
#环境：windows powershell(/ISE) IIS(需要安装，并且powershell以Administration运行)

#加载WebAdministration模块//Provides access to IIS configuration and run-time data
Import-Module WebAdministration
$iisAppPoolName="HelloApp"   #应用程序池名
$iisAppPoolDotNetVersion="v4.0"          
$iisSiteName="my-test-app.test"#站点名
$directoryPath="D:\powershell\myscript1"#站点的路径？？
$Port="80"#端口

#navigate to the app pools root
cd IIS:\AppPools\

#chexk if the app pool exists
if(!(Test-Path $iisAppPoolName -PathType Container) )#-PathType Container:指定被测参数的类型为容器
#Test-Path返回true or false
{
    $appPool = New-Item $iisAppPoolName
    $appPool | Set-ItemProperty -Name "managedRuntimeVersion" -Value $iisAppPoolDotNetVersion
}

#navigate to the IIS:Sites\
cd IIS:Sites\

#check if the site existes
if(Test-Path $iisSiteName -PathType Container)
{
    return
}

#create the site and binding
$iisApp = New-Item $iisSiteName -bindings @{protocol="http";bindingInformation=$Port+$iisSiteName} -physicalPath $directoryPath
#新建站点iisSiteName,并绑定协议：http,端口：$Port（80）
$iisApp | Set-ItemProperty -Name "applicationPool" -Value $iisAppPoolName
