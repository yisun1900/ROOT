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
<form method="post" action="SaveInsertRs_xxaqcs.jsp" name="insertform" target="_blank">
<div align="center">信息安全测试</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#CCCCCC" align="center">
  <td width="7%" >问题编号</td>
  <td width="70%" >问题</td>
  <td width="23%" >备注</td>
</tr>

<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >1
    <input type="hidden" name="wtbh" value="1"  >  </td>
  <td  >关于部门电脑管理<br>
    请选择日常在事务所中处理电脑时不恰当的选项。
    <input type="hidden" name="wt" value="关于部门电脑管理<br>
    请选择日常在事务所中处理电脑时不恰当的选项。" >	

	<BR>
	<input type="radio" name="da1"  value="1①设定屏保（设定5分钟）">①设定屏保（设定5分钟）<br>
    <input type="radio" name="da1"  value="2②电脑用电脑锁锁好，下班回家时关机">②电脑用电脑锁锁好，下班回家时关机<br>
    <input type="radio" name="da1"  value="3③笔记本电脑使用时用电脑锁锁好，回家时，去掉电脑锁，放入不透明的柜子中上锁">③笔记本电脑使用时用电脑锁锁好，回家时，去掉电脑锁，放入不透明的柜子中上锁<br>
    <input type="radio" name="da1"  value="4④启动时，为了方便登录文件服务器、VA系统（或ORACLE系统等社内系统）等时在便签上写好ID、密码，粘贴到电脑上">④启动时，为了方便登录文件服务器、VA系统（或ORACLE系统等社内系统）等时在便签上写好ID、密码，粘贴到电脑上	</td>
  <td align="center" valign="top">
     <textarea name="bz" cols="20" rows="6"></textarea>  </td>
</tr>

<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >2
    <input type="hidden" name="wtbh" value="2"  >  </td>
  <td  >关于社外电脑管理<BR>带出电脑时，请选择不恰当的处理。
    <input type="hidden" name="wt" value="关于社外电脑管理<BR>带出电脑时，请选择不恰当的处理。" >	

	<BR>
	<input type="radio" name="da2"  value="1①电脑带出社外时，带出安装Safe Boot的PC，得到上司许可">①电脑带出社外时，带出安装Safe Boot的PC，得到上司许可<br>
    <input type="radio" name="da2"  value="2②设置带出电脑管理台账，明确谁在什么时间使用，并定期连接社内网络，更新病毒对策软件">②设置带出电脑管理台账，明确谁在什么时间使用，并定期连接社内网络，更新病毒对策软件<br>
    <input type="radio" name="da2"  value="3③在酒店等场所使用公共WiFi时，务必使用安全可移动连接（通信加密）">③在酒店等场所使用公共WiFi时，务必使用安全可移动连接（通信加密）<br>
    <input type="radio" name="da2"  value="4④带出时，如果预计饮酒，为了避免丢失，放入有拉锁的包里">④带出时，如果预计饮酒，为了避免丢失，放入有拉锁的包里</td>
  <td align="center" valign="top">
     <textarea name="bz" cols="20" rows="6"></textarea>  </td>
</tr>


<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >3
    <input type="hidden" name="wtbh" value="3"  >  </td>
  <td  >关于私人信息设备（电脑、智能手机等）
　 私人手机和数码相机等，带入事务所时需要得到许可。
　 带入时，请选择不恰当的选项。
    <input type="hidden" name="wt" value="关于私人信息设备（电脑、智能手机等）
　 私人手机和数码相机等，带入事务所时需要得到许可。
　 带入时，请选择不恰当的选项。" >	


	<BR>
	<input type="radio" name="da3"  value="1①禁止从社用电脑，向私人电脑发送业务资料等邮件">①禁止从社用电脑，向私人电脑发送业务资料等邮件<br>
    <input type="radio" name="da3"  value="2②不在社内设施内使用私人设备拍摄照片">②不在社内设施内使用私人设备拍摄照片<br>
    <input type="radio" name="da3"  value="3③私人智能设备等不连接到社用PC上（包含充电）">③私人智能设备等不连接到社用PC上（包含充电）<br>
    <input type="radio" name="da3"  value="4④私人信息设备在设备使用时，务必得到上司许可">④私人信息设备在设备使用时，务必得到上司许可</td>
  <td align="center" valign="top">
     <textarea name="bz" cols="20" rows="6"></textarea>  </td>
</tr>
<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >4
    <input type="hidden" name="wtbh" value="4"  >  </td>
  <td  > 关于电子媒体的使用以及管理
　 关于电子记忆媒体（USB存储、SD卡等）的使用以及管理，请选择不恰当的描述
    <input type="hidden" name="wt" value=" 关于电子媒体的使用以及管理
　 关于电子记忆媒体（USB存储、SD卡等）的使用以及管理，请选择不恰当的描述" >	


	<BR>
	<input type="radio" name="da4"  value="1①制作管理台账，明确谁什么时间使用">①制作管理台账，明确谁什么时间使用<br>
    <input type="radio" name="da4"  value="2②分别保存在使用者本人的桌子抽屉中进行个别管理">②分别保存在使用者本人的桌子抽屉中进行个别管理<br>
    <input type="radio" name="da4"  value="3③SD卡不能实施加密，原则上禁止使用，仅可用于数码相机保存用，使用后删除数据">③SD卡不能实施加密，原则上禁止使用，仅可用于数码相机保存用，使用后删除数据<br>
    <input type="radio" name="da4"  value="4④USB存储，仅限使用可加密的">④USB存储，仅限使用可加密的</td>
  <td align="center" valign="top">
     <textarea name="bz" cols="20" rows="6"></textarea>  </td>
</tr>
<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >5
    <input type="hidden" name="wtbh" value="5"  >  </td>
  <td  >向社外发送E-Mail时　
    向社外发送邮件时，作为应该注意的事项，请选择不恰当的描述
    <input type="hidden" name="wt" value="向社外发送E-Mail时　
    向社外发送邮件时，作为应该注意的事项，请选择不恰当的描述" >	

	<BR>
	<input type="radio" name="da5"  value="1①对外发送「秘信息」时，需要加密文件夹，采取即使被窃听到也不至泄露信息的对策">①对外发送「秘信息」时，需要加密文件夹，采取即使被窃听到也不至泄露信息的对策<br>
    <input type="radio" name="da5"  value="2②为了避免误发送邮件，发送邮件时要特别注意">②为了避免误发送邮件，发送邮件时要特别注意<br>
    <input type="radio" name="da5"  value="3③发送容量大的邮件时，不使用社外文件转换服务，使用Gift的社内服务（社内共享平台）">③发送容量大的邮件时，不使用社外文件转换服务，使用Gift的社内服务（社内共享平台）<br>
    <input type="radio" name="da5"  value="4④给社外多数人发送邮件时，为了避免互相看到邮箱地址，不使用To而使用Cc栏填写邮箱地址发送">④给社外多数人发送邮件时，为了避免互相看到邮箱地址，不使用To而使用Cc栏填写邮箱地址发送</td>
  <td align="center" valign="top">
     <textarea name="bz" cols="20" rows="6"></textarea>  </td>
</tr>



<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >6
    <input type="hidden" name="wtbh" value="6"  >  
  </td>
  <td  >
关于秘信息（电子数据）保管
　　关于秘信息（电子数据）保管，请选择不恰当的描述
    <input type="hidden" name="wt" value="关于秘信息（电子数据）保管
　　关于秘信息（电子数据）保管，请选择不恰当的描述" >	


	<BR>
	<input type="radio" name="da6"  value="1①为了让员工认识到「非常重要的信息」，需要填写保密期限，表示为「秘密信息」。（没有期限时设置为「无期限」）">①为了让员工认识到「非常重要的信息」，需要填写保密期限，表示为「秘密信息」。（没有期限时设置为「无期限」）<br>
	<input type="radio" name="da6"  value="2②「秘信息」的表示在封面或、相应页表示。（文件名也可以）">②「秘信息」的表示在封面或、相应页表示。（文件名也可以）<br>
	<input type="radio" name="da6"  value="3③保管场所原则上保存在统合服务器上或Notes上设置访问限制，进行保管">③保管场所原则上保存在统合服务器上或Notes上设置访问限制，进行保管<br>
	<input type="radio" name="da6"  value="4④保存在自己的电脑或者部门管理的服务器上时，因为不必担心其他部门访问，所以不必设置访问限制">④保存在自己的电脑或者部门管理的服务器上时，因为不必担心其他部门访问，所以不必设置访问限制
  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="20" rows="6"></textarea>  
  </td>
</tr>

<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >7
    <input type="hidden" name="wtbh" value="7"  >  
  </td>
  <td  >
关于处理秘信息（纸版）
　  关于处理秘信息（纸版），选择不恰当的描述
    <input type="hidden" name="wt" value="关于处理秘信息（纸版）
　  关于处理秘信息（纸版），选择不恰当的描述" >	


	<BR>
	<input type="radio" name="da7"  value="1①为了让员工认识到「非常重要的信息」，需要填写保密期限，表示为「秘密信息」。（没有期限时设置为「无期限」）">①为了让员工认识到「非常重要的信息」，需要填写保密期限，表示为「秘密信息」。（没有期限时设置为「无期限」）<br>
	<input type="radio" name="da7"  value="2②在C区※以上的场所，放到不透明的文件柜常时上锁保管">②在C区※以上的场所，放到不透明的文件柜常时上锁保管<br>
	<input type="radio" name="da7"  value="3③保管秘信息的文件柜钥匙管理，只有必要的人才能够开锁">③保管秘信息的文件柜钥匙管理，只有必要的人才能够开锁<br>
	<input type="radio" name="da7"  value="4④带出「秘信息」（纸版）时，与电脑相同，也需要得到组织责任者的许可.※C区：公司厂区内、事务所区域外（来客应对区域等）">④带出「秘信息」（纸版）时，与电脑相同，也需要得到组织责任者的许可.※C区：公司厂区内、事务所区域外（来客应对区域等）
  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="20" rows="6"></textarea>  
  </td>
</tr>

<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >8
    <input type="hidden" name="wtbh" value="8"  >  
  </td>
  <td  >
关于桌面、白板（清理桌面?清理白板）
　　信息安全推进中，整理自己的桌面和周围，5S等「清理桌面?清理白板」的概念非常重要。清理桌面?清理白板的观点中，请选择不恰当的描述。
    <input type="hidden" name="wt" value="关于桌面、白板（清理桌面?清理白板）
　　信息安全推进中，整理自己的桌面和周围，5S等「清理桌面?清理白板」的概念非常重要。清理桌面?清理白板的观点中，请选择不恰当的描述。" >	


	<BR>
	<input type="radio" name="da8"  value="1①秘信息不长时间放在桌子上。即便是社内信息，也要迅速处理">①秘信息不长时间放在桌子上。即便是社内信息，也要迅速处理<br>
	<input type="radio" name="da8"  value="2②退社时，出差等时，给自己的抽屉上锁">②退社时，出差等时，给自己的抽屉上锁<br>
	<input type="radio" name="da8"  value="3③白板的使用，为了不泄露给无关人或下一个使用者信息时，迅速清理白板">③白板的使用，为了不泄露给无关人或下一个使用者信息时，迅速清理白板<br>
	<input type="radio" name="da8"  value="4④秘信息、社内信息都不放置在桌面上，放在办公桌下不被发现的地方">④秘信息、社内信息都不放置在桌面上，放在办公桌下不被发现的地方
  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="20" rows="6"></textarea>  
  </td>
</tr>

<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >9
    <input type="hidden" name="wtbh" value="9"  >  
  </td>
  <td  >
关于SNS的使用
　　使用Facebook（或微博、人人网、博客等）或LINE（或微信、易信、QQ等）等SNS时，请选择不恰当的描述
    <input type="hidden" name="wt" value="关于SNS的使用
　　使用Facebook（或微博、人人网、博客等）或LINE（或微信、易信、QQ等）等SNS时，请选择不恰当的描述" >	


	<BR>
	<input type="radio" name="da9"  value="1①不将公司的商标、公司名称、商品名称等用于个人ID或人物描述等">①不将公司的商标、公司名称、商品名称等用于个人ID或人物描述等<br>
	<input type="radio" name="da9"  value="2②严禁将社内信息、或者社内拍摄照片或视频进行上传">②严禁将社内信息、或者社内拍摄照片或视频进行上传<br>
	<input type="radio" name="da9"  value="3③作为联络方式使用时，仅限社内人员">③作为联络方式使用时，仅限社内人员<br>
	<input type="radio" name="da9"  value="4④对于其他人，不发表诽谤中伤性的攻击性评论">④对于其他人，不发表诽谤中伤性的攻击性评论
  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="20" rows="6"></textarea>  
  </td>
</tr>

<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >10
    <input type="hidden" name="wtbh" value="10"  >  
  </td>
  <td  >
关于社内设施和设备、产品等拍摄照片
   关于社内拍摄照片，请选择不恰当的描述
    <input type="hidden" name="wt" value="关于社内设施和设备、产品等拍摄照片
   关于社内拍摄照片，请选择不恰当的描述" >	


	<BR>
	<input type="radio" name="da10"  value="1①离职纪念时，以部门为背景自拍，发表在自己的微博上">①离职纪念时，以部门为背景自拍，发表在自己的微博上<br>
	<input type="radio" name="da10"  value="2②需要刊登新商品企划资料，用公司的数码相机拍摄">②需要刊登新商品企划资料，用公司的数码相机拍摄<br>
	<input type="radio" name="da10"  value="3③为了在会议资料上刊登会议场景，得到许可之后用社用电话进行拍摄">③为了在会议资料上刊登会议场景，得到许可之后用社用电话进行拍摄<br>
	<input type="radio" name="da10"  value="4④在社内无论什么地点进行拍摄，都需要得到责任者和管理部门的许可">④在社内无论什么地点进行拍摄，都需要得到责任者和管理部门的许可
  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="20" rows="6"></textarea>  
  </td>
</tr>

    <tr align="center"> 
      <td colspan="3"> 
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
	for (var i=1;i<=10 ;i++ )
	{
		if(	!radioChecked( eval("FormName.da"+i) )) {
			alert("第"+i+"项未选择[点检结果]！");
			eval("FormName.da"+i+".focus()");
			return false;
		}
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
