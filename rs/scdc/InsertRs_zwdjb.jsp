<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertRs_zwdjb.jsp" name="insertform" target="_blank">
<div align="center">自我点检表</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#CCCCCC" align="center">
  <td width="8%" >&nbsp;</td>
  <td width="8%" >点检项目编号</td>
  <td width="47%" >点检项目</td>
  <td width="15%" >根据</td>
  <td width="11%" >点检结果</td>
  <td width="19%" >备注</td>
</tr>

<tr align="left" bgcolor="#FFFFFF">
  <td rowspan="4" align="center"  >信息资产管理</td>
  <td align="center"  >A-1
    <input type="hidden" name="djxmbh" value="A-1"  >  </td>
  <td  >
  相当于ConfIDential(秘密)、个人信息绝密(日本以外为ConfIDential-P)及Strictly ConfIDential(绝密)的信息上标注全公司标准机密标志并记载机密期限了吗？<br>
    (注1)职场机密区分表中记载的信息包含如下内容：<br>
    a) 纸质媒介、电子化信息、化体品；<br>
    b) CD、DVD等记忆媒体保管的机密信息。

    <input type="hidden" name="djxm" value="相当于ConfIDential(秘密)、个人信息绝密(日本以外为ConfIDential-P)及Strictly ConfIDential(绝密)的信息上标注全公司标准机密标志并记载机密期限了吗？
(注1)职场机密区分表中记载的信息包含如下内容：
a) 纸质媒介、电子化信息、化体品；
b) CD、DVD等记忆媒体保管的机密信息。" >	</td>
  <td align="left">
      5.1.2-4)<br>5.1.2-5)
      <input type="hidden" name="gj" value="5.1.2-4)<br>5.1.2-5)"  >  </td>

  <td  >
	<input type="radio" name="djjg1"  value="1">是<BR>
	<input type="radio" name="djjg1"  value="2">否<BR>
	<input type="radio" name="djjg1"  value="3">不符合<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>

<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >A-2
    <input type="hidden" name="djxmbh" value="A-2"  >  </td>
  <td  >对于您所管理的机密信息文件或化体品等，当长时间离开座位或下班回家等不使用时，放入能够上锁的办公桌抽屉或文件柜等，并上锁了吗？
另外，包括电脑的设定等，是否符合下述状态(清理桌面、清理屏幕)？
?没有在办公桌上下以及架子上、垃圾箱中、其周边等地方放置机密信息(纸质信息、化体品等)。
?没有在打印机或传真机的出纸处放置文件等。
?在电脑上设置屏幕保护的密码，将启动时限设置为5分钟以下。
?离开座位时手动锁定屏幕，隐藏画面，设定为无法操作状态。
    <input type="hidden" name="djxm" value="对于您所管理的机密信息文件或化体品等，当长时间离开座位或下班回家等不使用时，放入能够上锁的办公桌抽屉或文件柜等，并上锁了吗？
另外，包括电脑的设定等，是否符合下述状态(清理桌面、清理屏幕)？
?没有在办公桌上下以及架子上、垃圾箱中、其周边等地方放置机密信息(纸质信息、化体品等)。
?没有在打印机或传真机的出纸处放置文件等。
?在电脑上设置屏幕保护的密码，将启动时限设置为5分钟以下。
?离开座位时手动锁定屏幕，隐藏画面，设定为无法操作状态。" >  </td><td align="left">
5.1.2-4)
5.1.2-5)
7.4.2
      <input type="hidden" name="gj" value="5.1.2-4)
5.1.2-5)
7.4.2"  >
  </td>

  <td>
	<input type="radio" name="djjg2"  value="1">是<BR>
	<input type="radio" name="djjg2"  value="2">否<BR>
	<input type="radio" name="djjg2"  value="3">不符合<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>

<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >A-3
    <input type="hidden" name="djxmbh" value="A-3"  >  </td>
  <td  >
属于ConfIDential(秘密)化体品(公开前的新产品等)对公司外部公开时，您一定会取得职场责任人审批吗？
    <input type="hidden" name="djxm" value="属于ConfIDential(秘密)化体品(公开前的新产品等)对公司外部公开时，您一定会取得职场责任人审批吗？" >  </td>
  <td align="left">
5.1.2-5)-i)
      <input type="hidden" name="gj" value="5.1.2-5)-i)"  >  </td>

  <td>
	<input type="radio" name="djjg3"  value="1">是<BR>
	<input type="radio" name="djjg3"  value="2">否<BR>
	<input type="radio" name="djjg3"  value="3">不符合<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>

<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >A-4
    <input type="hidden" name="djxmbh" value="A-4"  >  </td>
  <td  >
因客户调查等取得客户个人信息时，是否事前向客户告知使用目的并取得客户同意？
另外，对于所取得的个人信息，不用于告知目的以外？
    <input type="hidden" name="djxm" value="因客户调查等取得客户个人信息时，是否事前向客户告知使用目的并取得客户同意？
另外，对于所取得的个人信息，不用于告知目的以外？" >  </td>
  <td align="left">
(个人信息保护基本规程第15条、17条、18条)
      <input type="hidden" name="gj" value="(个人信息保护基本规程第15条、17条、18条)"  >  </td>

  <td>
	<input type="radio" name="djjg4"  value="1">是<BR>
	<input type="radio" name="djjg4"  value="2">否<BR>
	<input type="radio" name="djjg4"  value="3">不符合<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>



<tr align="left" bgcolor="#FFFFFF">
  <td rowspan="2" align="center"  >物理安全</td>
  <td align="center"  >P-1
    <input type="hidden" name="djxmbh" value="P-1"  >  </td>
  <td  >
您在C区以上的地点，是否常时佩戴胸卡，并携带ID卡？
另外，进入B区以上场所时，是否履行刷ID卡或向保安人员出示等正规程序？　
禁止未履行正规程序，跟随他人进入(所谓的跟随进入)或ID卡的借用。您是否全面遵守了？
    <input type="hidden" name="djxm" value="您在C区以上的地点，是否常时佩戴胸卡，并携带ID卡？
另外，进入B区以上场所时，是否履行刷ID卡或向保安人员出示等正规程序？　
禁止未履行正规程序，跟随他人进入(所谓的跟随进入)或ID卡的借用。您是否全面遵守了？" >  </td>
  <td align="left">
6.3.2-2)-d)-(1)
7.1.2-3)-b)-ⅰ
(仅限日本，物理安全指导基准4-2-1～4各区域访问管理)
      <input type="hidden" name="gj" value="6.3.2-2)-d)-(1)
7.1.2-3)-b)-ⅰ
(仅限日本，物理安全指导基准4-2-1～4各区域访问管理)"  >  </td>

  <td>
	<input type="radio" name="djjg5"  value="1">是<BR>
	<input type="radio" name="djjg5"  value="2">否<BR>
	<input type="radio" name="djjg5"  value="3">不符合<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>

<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >P-2
    <input type="hidden" name="djxmbh" value="P-2"  >  </td>
  <td  >
禁止将个人电脑、个人USB等电子记忆媒体带入公司内，您是否遵守了？
个人手机、智能电话、音响器材、数码相机、平板电脑、游戏机等电子设备带入公司内部时，每半年取得1次以上的职场责任人许可，并遵守下述事项了吗？
(1)不连接公司内部电脑、网络设备。
(2)不保存公司信息。
    <input type="hidden" name="djxm" value="禁止将个人电脑、个人USB等电子记忆媒体带入公司内，您是否遵守了？
个人手机、智能电话、音响器材、数码相机、平板电脑、游戏机等电子设备带入公司内部时，每半年取得1次以上的职场责任人许可，并遵守下述事项了吗？
(1)不连接公司内部电脑、网络设备。
(2)不保存公司信息。" >  </td>
  <td align="left">
7.2.2
      <input type="hidden" name="gj" value="7.2.2"  >  </td>

  <td>
	<input type="radio" name="djjg6"  value="1">是<BR>
	<input type="radio" name="djjg6"  value="2">否<BR>
	<input type="radio" name="djjg6"  value="3">不符合<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>

<tr align="left" bgcolor="#FFFFFF">
  <td rowspan="2" align="center"  >人的安全</td>
  <td align="center"  >H-1
    <input type="hidden" name="djxmbh" value="H-1"  >  </td>
  <td  >
定期参与有关信息安全的e测试了吗？
    <input type="hidden" name="djxm" value="定期参与有关信息安全的e测试了吗？" >  </td>
  <td align="left">
6.1.2
      <input type="hidden" name="gj" value="6.1.2"  >  </td>

  <td>
	<input type="radio" name="djjg7"  value="1">是<BR>
	<input type="radio" name="djjg7"  value="2">否<BR>
	<input type="radio" name="djjg7"  value="3">不符合<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>
<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >H-2
    <input type="hidden" name="djxmbh" value="H-2"  >  </td>
  <td  >
您是否了解作为公司资产的电脑或USB存储器丢失时，或者机密信息、个人信息等丢失时，向职场责任人汇报的流程吗？
    <input type="hidden" name="djxm" value="您是否了解作为公司资产的电脑或USB存储器丢失时，或者机密信息、个人信息等丢失时，向职场责任人汇报的流程吗？" >  </td>
  <td align="left">
10.1.2
      <input type="hidden" name="gj" value="10.1.2"  >  </td>

  <td>
	<input type="radio" name="djjg8"  value="1">是<BR>
	<input type="radio" name="djjg8"  value="2">否<BR>
	<input type="radio" name="djjg8"  value="3">不符合<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>


<tr align="left" bgcolor="#FFFFFF">
  <td rowspan="7" align="center"  >IT安全</td>
  <td align="center"  >IT-1
    <input type="hidden" name="djxmbh" value="IT-1"  >  </td>
  <td  >
您的电脑中是否设置了OS密码？带出用的电脑中是否安装了McAfee　Endpoint Encryption(旧称SafeBoot(HDD加密软件))？另外，不仅仅是上述其他各个密码是否是按照指导基准中规定的方法设定的？
a)密码是英文与数字组合，6位以上。
b)密码定期更新，至少30天变更一次。
c)密码不得告知他人。
d)没有用便签纸等贴在电脑上，不保存在电脑上设置自动登录。
    <input type="hidden" name="djxm" value="您的电脑中是否设置了OS密码？带出用的电脑中是否安装了McAfee　Endpoint Encryption(旧称SafeBoot(HDD加密软件))？另外，不仅仅是上述其他各个密码是否是按照指导基准中规定的方法设定的？
a)密码是英文与数字组合，6位以上。
b)密码定期更新，至少30天变更一次。
c)密码不得告知他人。
d)没有用便签纸等贴在电脑上，不保存在电脑上设置自动登录。" >  </td>
  <td align="left">
5.1.2-5)-b)-信息系统-i)
8.4.2-1)
(电子化信息资产使用?管理指导基准2.(2))
      <input type="hidden" name="gj" value="5.1.2-5)-b)-信息系统-i)
8.4.2-1)
(电子化信息资产使用?管理指导基准2.(2))"  >  </td>

  <td>
	<input type="radio" name="djjg9"  value="1">是<BR>
	<input type="radio" name="djjg9"  value="2">否<BR>
	<input type="radio" name="djjg9"  value="3">不符合<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>

<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >IT-2
    <input type="hidden" name="djxmbh" value="IT-2"  >  </td>
  <td  >
禁止浏览与所负责业务没有直接关系的公司外部网站以及下载／安装数据文件／程序等。您是否遵守了这些规定？
    <input type="hidden" name="djxm" value="禁止浏览与所负责业务没有直接关系的公司外部网站以及下载／安装数据文件／程序等。您是否遵守了这些规定？" >  </td>
  <td align="left">
6.3.2-2)-b)-(7) 
6.3.2-2)-c)-(6)(10)
      <input type="hidden" name="gj" value="6.3.2-2)-b)-(7) 
6.3.2-2)-c)-(6)(10)"  >  </td>

  <td>
	<input type="radio" name="djjg10"  value="1">是<BR>
	<input type="radio" name="djjg10"  value="2">否<BR>
	<input type="radio" name="djjg10"  value="3">不符合<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>
<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >IT-3
    <input type="hidden" name="djxmbh" value="IT-3"  >  </td>
  <td  >
您是否在电脑中安装常时杀毒软件?
另外，您的电脑感染病毒、或运行变慢等发生可疑运行时，是否明白立即切断LAN并且向职场责任人和电脑管理员报告，等待具体指示等的基本处理规程？
    <input type="hidden" name="djxm" value="您是否在电脑中安装常时杀毒软件?
另外，您的电脑感染病毒、或运行变慢等发生可疑运行时，是否明白立即切断LAN并且向职场责任人和电脑管理员报告，等待具体指示等的基本处理规程？" >  </td>
  <td align="left">
5.1.2-5)-b)-信息系统-i)
6.3.2-2)-c)-(5)
8.1.2-1)
      <input type="hidden" name="gj" value="5.1.2-5)-b)-信息系统-i)
6.3.2-2)-c)-(5)
8.1.2-1)"  >  </td>

  <td>
	<input type="radio" name="djjg11"  value="1">是<BR>
	<input type="radio" name="djjg11"  value="2">否<BR>
	<input type="radio" name="djjg11"  value="3">不符合<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>
<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >IT-4
    <input type="hidden" name="djxmbh" value="IT-4"  >  </td>
  <td  >
您的电脑中的文件是否处于非共享状态？
电脑中的文件设置为共享状态时，应作为文件服务器管理，需要采取服务器安全优化指导基准中记载的管理对策。
    <input type="hidden" name="djxm" value="您的电脑中的文件是否处于非共享状态？
电脑中的文件设置为共享状态时，应作为文件服务器管理，需要采取服务器安全优化指导基准中记载的管理对策。" >  </td>
  <td align="left">
(服务器安全优化指导基准)
      <input type="hidden" name="gj" value="(服务器安全优化指导基准)"  >  </td>

  <td>
	<input type="radio" name="djjg12"  value="1">是<BR>
	<input type="radio" name="djjg12"  value="2">否<BR>
	<input type="radio" name="djjg12"  value="3">不符合<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>
<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >IT-5
    <input type="hidden" name="djxmbh" value="IT-5"  >  </td>
  <td  >
您在将电脑或者记忆媒体等及信息带出公司时，是否遵守了以下规定？
?带出电脑和电子记忆媒体(含数码相机、录像机用)时，确认电脑实施HDD加密(McAfee Endpoint Encryption(旧称SafeBoot)，USB存储器具有加密功能，进行带出入申请，取得职场责任人的许可？(不允许自己审批)
此外，是否做到带出时禁止饮酒而且将电脑或者记忆媒体等及信息不离身？
?带出纸质信息、化体品等机密信息时，实施带出入申请并取得职场责任人的审批？(不允许自己审批)
此外，是否做到带出时禁止饮酒而且纸质信息、化体品等机密信息不离身？
?电子记忆媒体、数码相机、录像机进行归还时，是否删除了数据？
?带出时是否常时携带，或是不能携带时是否保存在能够上锁的场所？
    <input type="hidden" name="djxm" value="您在将电脑或者记忆媒体等及信息带出公司时，是否遵守了以下规定？
?带出电脑和电子记忆媒体(含数码相机、录像机用)时，确认电脑实施HDD加密(McAfee Endpoint Encryption(旧称SafeBoot)，USB存储器具有加密功能，进行带出入申请，取得职场责任人的许可？(不允许自己审批)
此外，是否做到带出时禁止饮酒而且将电脑或者记忆媒体等及信息不离身？
?带出纸质信息、化体品等机密信息时，实施带出入申请并取得职场责任人的审批？(不允许自己审批)
此外，是否做到带出时禁止饮酒而且纸质信息、化体品等机密信息不离身？
?电子记忆媒体、数码相机、录像机进行归还时，是否删除了数据？
?带出时是否常时携带，或是不能携带时是否保存在能够上锁的场所？" >  </td>
  <td align="left">
5.1.2-4)-b)
5.1.2-5)-b)-信息系统-ⅰ)-(6)(9)(10)
6.3.2-2)-c)-(1) 6.3.2-2)-d-(4)
(电子化信息资产使用?管理指导基准2.(2))
      <input type="hidden" name="gj" value="5.1.2-4)-b)
5.1.2-5)-b)-信息系统-ⅰ)-(6)(9)(10)
6.3.2-2)-c)-(1) 6.3.2-2)-d-(4)
(电子化信息资产使用?管理指导基准2.(2))"  >  </td>

  <td>
	<input type="radio" name="djjg13"  value="1">是<BR>
	<input type="radio" name="djjg13"  value="2">否<BR>
	<input type="radio" name="djjg13"  value="3">不符合<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>
<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >IT-6
    <input type="hidden" name="djxmbh" value="IT-6"  >  </td>
  <td  >
您在用传真机发送ConfIDential(秘密)信息时，是否事先与收信人取得联络，实施测试发送等确认不会误发送，发送完了之后要求对方通知收信结果呢？
    <input type="hidden" name="djxm" value="您在用传真机发送ConfIDential(秘密)信息时，是否事先与收信人取得联络，实施测试发送等确认不会误发送，发送完了之后要求对方通知收信结果呢？" >  </td>
  <td align="left">
5.4.2-4)-b)-V
      <input type="hidden" name="gj" value="5.4.2-4)-b)-V"  >  </td>

  <td>
	<input type="radio" name="djjg14"  value="1">是<BR>
	<input type="radio" name="djjg14"  value="2">否<BR>
	<input type="radio" name="djjg14"  value="3">不符合<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>
<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >IT-7 
    <input type="hidden" name="djxmbh" value="IT-7 "  >  </td>
  <td  >
? 秘密以上文件通过邮件附件发送时，务必通过McAfee Endpoint Encryption (旧名称SafeBoot)或者SWDTE加密，并将PW用不同邮件发送了吗？
?如果有发信人、收信人都可以访问的文件服务器或Lotus Notes时，不使用邮件附加形式而是将电子化信息保管到文件服务器或Lotus Notes里,采取通知收信人URL、Lotus Notes图标的形式了吗？
?向不应该公开邮箱地址的公司外对象一同发送邮件时，邮箱地址是否使用Bcc？或者是否通过使用同时发送邮件专用软件，以防止邮箱地址泄漏？
    <input type="hidden" name="djxm" value="? 秘密以上文件通过邮件附件发送时，务必通过McAfee Endpoint Encryption (旧名称SafeBoot)或者SWDTE加密，并将PW用不同邮件发送了吗？
?如果有发信人、收信人都可以访问的文件服务器或Lotus Notes时，不使用邮件附加形式而是将电子化信息保管到文件服务器或Lotus Notes里,采取通知收信人URL、Lotus Notes图标的形式了吗？
?向不应该公开邮箱地址的公司外对象一同发送邮件时，邮箱地址是否使用Bcc？或者是否通过使用同时发送邮件专用软件，以防止邮箱地址泄漏？" >  </td>
  <td align="left">
5.1.2-4)-b)-v)
5.1.2-4)-e)-v)
(电子邮件使用指导基准3.AIR)
      <input type="hidden" name="gj" value="5.1.2-4)-b)-v)
5.1.2-4)-e)-v)
(电子邮件使用指导基准3.AIR)"  >  </td>

  <td>
	<input type="radio" name="djjg15"  value="1">是<BR>
	<input type="radio" name="djjg15"  value="2">否<BR>
	<input type="radio" name="djjg15"  value="3">不符合<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>


<tr align="left" bgcolor="#FFFFFF">
  <td rowspan="3" align="center"  >IT安全</td>
  <td align="center"  >ES-1
    <input type="hidden" name="djxmbh" value="ES-1"  >  </td>
  <td  >
归还公共带出电脑时，是否确认了已经删除了不需要的文件，并清空了回收站？
    <input type="hidden" name="djxm" value="归还公共带出电脑时，是否确认了已经删除了不需要的文件，并清空了回收站？" >  </td>
  <td align="left">
ISO27001审核、内部监查、自主精查上的课题事项(上述内容没有包含的项目)
      <input type="hidden" name="gj" value="ISO27001审核、内部监查、自主精查上的课题事项(上述内容没有包含的项目)"  >  </td>

  <td>
	<input type="radio" name="djjg16"  value="1">是<BR>
	<input type="radio" name="djjg16"  value="2">否<BR>
	<input type="radio" name="djjg16"  value="3">不符合<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>
<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >ES-2
    <input type="hidden" name="djxmbh" value="ES-2"  >  </td>
  <td  >
电子化机密信息，是否未保存到电脑上，而保存在了统一文件服务器上(或是同样的合规服务器)？
    <input type="hidden" name="djxm" value="电子化机密信息，是否未保存到电脑上，而保存在了统一文件服务器上(或是同样的合规服务器)？" >  </td>
  <td align="left">
ISO27001审核、内部监查、自主精查上的课题事项(上述内容没有包含的项目)
      <input type="hidden" name="gj" value="ISO27001审核、内部监查、自主精查上的课题事项(上述内容没有包含的项目)"  >  </td>

  <td>
	<input type="radio" name="djjg17"  value="1">是<BR>
	<input type="radio" name="djjg17"  value="2">否<BR>
	<input type="radio" name="djjg17"  value="3">不符合<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>
<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >ES-3
    <input type="hidden" name="djxmbh" value="ES-3"  >  </td>
  <td  >
?台式电脑、笔记本电脑两种都用防盗链锁绑定，防盗链锁没有绑定在桌脚等容易卸掉的地方吧？
?电脑防盗链锁的钥匙，没有放到不上锁的办公桌抽屉等里吧？
?下班回家时笔记本电脑是上锁管理的吗？
    <input type="hidden" name="djxm" value="?台式电脑、笔记本电脑两种都用防盗链锁绑定，防盗链锁没有绑定在桌脚等容易卸掉的地方吧？
?电脑防盗链锁的钥匙，没有放到不上锁的办公桌抽屉等里吧？
?下班回家时笔记本电脑是上锁管理的吗？" >  </td>
  <td align="left">
ISO27001审核、内部监查、自主精查上的课题事项(上述内容没有包含的项目)
      <input type="hidden" name="gj" value="ISO27001审核、内部监查、自主精查上的课题事项(上述内容没有包含的项目)"  >  </td>

  <td>
	<input type="radio" name="djjg18"  value="1">是<BR>
	<input type="radio" name="djjg18"  value="2">否<BR>
	<input type="radio" name="djjg18"  value="3">不符合<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>



<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >化体品</td>
  <td align="center"  >ES-4
    <input type="hidden" name="djxmbh" value="ES-4"  >  </td>
  <td  >
?绝密的化体品在A区域，秘密的化体品在B区域以上，是组织能够把握的环境下实行上锁管理吗？
?由于大型无法上锁管理时，实行用遮盖等使外部无法看到的管理了吗？
?每月实施１次以上盘点，实行台账管理，并取得职场责任人的审批了吗？
?实行出借、返还管理，并取得职场责任人的审批了吗？
?午餐等离开座位时，实行上锁管理了吗？
?废弃处理时，实行物理性破坏，并在台账上留取记录了吗？
    <input type="hidden" name="djxm" value="?绝密的化体品在A区域，秘密的化体品在B区域以上，是组织能够把握的环境下实行上锁管理吗？
?由于大型无法上锁管理时，实行用遮盖等使外部无法看到的管理了吗？
?每月实施１次以上盘点，实行台账管理，并取得职场责任人的审批了吗？
?实行出借、返还管理，并取得职场责任人的审批了吗？
?午餐等离开座位时，实行上锁管理了吗？
?废弃处理时，实行物理性破坏，并在台账上留取记录了吗？" >  </td>
  <td align="left">
ISO27001审核、内部监查、自主精查上的课题事项(上述内容没有包含的项目)
      <input type="hidden" name="gj" value="ISO27001审核、内部监查、自主精查上的课题事项(上述内容没有包含的项目)"  >  </td>

  <td>
	<input type="radio" name="djjg19"  value="1">是<BR>
	<input type="radio" name="djjg19"  value="2">否<BR>
	<input type="radio" name="djjg19"  value="3">不符合<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>
<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >纸质信息处理</td>
  <td align="center"  >ES-5
    <input type="hidden" name="djxmbh" value="ES-5"  >  </td>
  <td  >
?绝密信息、秘密信息、个人信息以及寄存信息，每次都用碎纸机处理吗？
?综合用碎纸机或溶解处理时，临时保管是在B区域以上，并上锁管理了吗？
    <input type="hidden" name="djxm" value="?绝密信息、秘密信息、个人信息以及寄存信息，每次都用碎纸机处理吗？
?综合用碎纸机或溶解处理时，临时保管是在B区域以上，并上锁管理了吗？" >  </td>
  <td align="left">
ISO27001审核、内部监查、自主精查上的课题事项(上述内容没有包含的项目)
      <input type="hidden" name="gj" value="ISO27001审核、内部监查、自主精查上的课题事项(上述内容没有包含的项目)"  >  </td>

  <td>
	<input type="radio" name="djjg20"  value="1">是<BR>
	<input type="radio" name="djjg20"  value="2">否<BR>
	<input type="radio" name="djjg20"  value="3">不符合<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>
<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >ID卡</td>
  <td align="center"  >ES-6
    <input type="hidden" name="djxmbh" value="ES-6"  >  </td>
  <td  >
?员工证ID卡、PAL卡、安全卡等的ID卡是否使用吊带挂住，以防止掉落、遗失？在工厂等时，吊带可能卷入机械中，那么在不能使用吊带时，是否采取了其他防止掉落、遗失的措施？
?下班后，是否实施将ID卡等放入皮包内侧的带拉链的口袋等中、以防止遗失的定置管理？
?在不需要进出公司的周末及休息日等时，不带出ID卡，是否实施防止在家中遗失的定置管理？
    <input type="hidden" name="djxm" value="?员工证ID卡、PAL卡、安全卡等的ID卡是否使用吊带挂住，以防止掉落、遗失？在工厂等时，吊带可能卷入机械中，那么在不能使用吊带时，是否采取了其他防止掉落、遗失的措施？
?下班后，是否实施将ID卡等放入皮包内侧的带拉链的口袋等中、以防止遗失的定置管理？
?在不需要进出公司的周末及休息日等时，不带出ID卡，是否实施防止在家中遗失的定置管理？" >  </td>
  <td align="left">
防止信息安全事故、事件
      <input type="hidden" name="gj" value="防止信息安全事故、事件"  >  </td>

  <td>
	<input type="radio" name="djjg21"  value="1">是<BR>
	<input type="radio" name="djjg21"  value="2">否<BR>
	<input type="radio" name="djjg21"  value="3">不符合<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>
<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >业务用手机</td>
  <td align="center"  >ES-7
    <input type="hidden" name="djxmbh" value="ES-7"  >  </td>
  <td  >
?业务用手机的锁定功能是否保持有效？
?是否使用吊带、做到手机不离身？
?下班时等不需要使用该手机时，是否将其放在桌子的抽屉等中，并实施上锁管理？
?周末、休息日等不需要将业务用手机带出家门时，是否实施防止遗失的定置管理？
    <input type="hidden" name="djxm" value="?业务用手机的锁定功能是否保持有效？
?是否使用吊带、做到手机不离身？
?下班时等不需要使用该手机时，是否将其放在桌子的抽屉等中，并实施上锁管理？
?周末、休息日等不需要将业务用手机带出家门时，是否实施防止遗失的定置管理？" >  </td>
  <td align="left">
防止信息安全事故、事件
      <input type="hidden" name="gj" value="防止信息安全事故、事件"  >  </td>

  <td>
	<input type="radio" name="djjg22"  value="1">是<BR>
	<input type="radio" name="djjg22"  value="2">否<BR>
	<input type="radio" name="djjg22"  value="3">不符合<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>

    <tr align="center"> 
      <td colspan="6"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	for (var i=1;i<=22 ;i++ )
	{
		if(	!radioChecked( eval("FormName.djjg"+i) )) {
			alert("第"+i+"项未选择[点检结果]！");
			eval("FormName.djjg"+i+".focus()");
			return false;
		}
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
