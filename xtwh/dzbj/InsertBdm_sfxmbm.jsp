<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 录入－其它收费项目</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertBdm_sfxmbm.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>地区</td>
              <td width="30%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
				<%
					if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dm_dqbm.dqbm,dm_dqbm.dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dm_dqbm.dqbm","");
					}
					else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dm_dqbm.dqbm,dm_dqbm.dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dm_dqbm.dqbm","");
					}
					else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
					{
						cf.selectItem(out,"select dm_dqbm.dqbm,dm_dqbm.dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwbh='"+ssfgs+"'",ssfgs);
					}
					else{
						out.println("错误！未进行客户资料授权，请联系系统管理员");
						return;
					}
				%> 
                </select>              </td>
              <td colspan="2">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>收费项目编码（2位）</td>
              <td width="30%"> 
                <input type="text" name="sfxmbm" value="" size="20" maxlength="2" ></td>
              <td colspan="2">注意：<font color="#CC0000"><b>不同地区可用相同项目编码，最好同一项目用相同编码</b></font></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>收费项目名称</td>
              <td colspan="3"><input type="text" name="sfxmmc" value="" size="73" maxlength="100" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>收费项目打印名称</td>
              <td colspan="3"><input type="text" name="dysfxmmc" value="" size="73" maxlength="100" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>收费项目类型</td>
              <td valign="top">
			    <input type="radio" name="sfxmlx"  value="1">
				1：间接工程费<br>
				<input type="radio" name="sfxmlx"  value="2">
				2：工程相关费<br>
				<input type="radio" name="sfxmlx"  value="3">
				3：设计费 <br>
				<input type="radio" name="sfxmlx"  value="5">
				5：工程管理费 <br>
				<input type="radio" name="sfxmlx"  value="6">
				6：工程税金 <br><br>
				<input type="radio" name="sfxmlx"  value="7">
				7：公司购主材管理费 <br>
				<input type="radio" name="sfxmlx"  value="8">
				8：公司购主材税金 <br>
				<input type="radio" name="sfxmlx"  value="4">
				4：公司购主材间接费 <br><br>
				<input type="radio" name="sfxmlx"  value="A">
				A：自购主材管理费<br>
				<input type="radio" name="sfxmlx"  value="B">
				B：自购主材税金<br>
				<input type="radio" name="sfxmlx"  value="C">
				C：自购主材间接费 <br><br>
				<input type="radio" name="sfxmlx"  value="D">
				D：水电路 <br>
				<input type="radio" name="sfxmlx"  value="E">
				E：水电路预收 <br><br>
				<input type="radio" name="sfxmlx"  value="9">
				9：其它			  </td>
              <td align="right"><font color="#FF0000">*</font>收费计算方式</td>
              <td valign="top">
			        <input type="radio" name="sflx"  value="1">
					1：工程直接费百分比<font color="#FF0000"><b>（不可改）</b></font><br>
			        <input type="radio" name="sflx"  value="A">
					A：工程直接费百分比（可改）<br><br>
					<input type="radio" name="sflx"  value="3">
					3：税金（折后合同额×税率）<br>
					<input type="radio" name="sflx"  value="8">
					8：税金（折前税金×税金折扣）<br>
					<br>
					<input type="radio" name="sflx"  value="5">
					5：管理费<br>
					<br>
					<input type="radio" name="sflx"  value="2">
					2：固定金额(设计师可改)<br>
					<input type="radio" name="sflx"  value="4">
					
					4：固定金额<font color="#FF0000"><b>（设计师不可改）</b></font> <br><br>
					<input type="radio" name="sflx"  value="6">
					6：公司购主材百分比(不可改)<br>
					<input type="radio" name="sflx"  value="F">
					F：公司购主材百分比(可改)<br><BR>
					<input type="radio" name="sflx"  value="7">
					7：自购主材百分比(不可改)<br>
					<input type="radio" name="sflx"  value="G">
					G：自购主材百分比(可改)<br><br>
					<input type="radio" name="sflx"  value="9">
					9：按百分比收设计费			  
					<br>
					<br>
					<input type="radio" name="sflx"  value="B">
					B：精装工程管理费<br>
					<input type="radio" name="sflx"  value="C">
					C：精装主材管理费<br>
					<input type="radio" name="sflx"  value="D">
					D：精装工程费百分比<br>
					<input type="radio" name="sflx"  value="E">
					E：精装主材费百分比<br>					</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>计量单位</td>
              <td><input type="text" name="jldw" value="项" size="10" maxlength="20" ></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">固定金额</td>
              <td colspan="3"> 
                <input type="text" name="gdje" size="10" maxlength="12"  value="" >
                针对：『固定金额(设计师可改)、固定金额<font color="#FF0000"><b>（设计师不可改）</b></font>』两类</td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>是否参与施工队结算</td>
              <td><input type="radio" name="sfcysgdjs" value="Y">
					是
					  <input type="radio" name="sfcysgdjs" value="N">
					否 </td>
              <td align="right"><font color="#FF0000">*</font>成本百分比</td>
              <td><input type="text" name="cbjbfb" size="10" maxlength="8"  value="100" >
%</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>施工成本价百分比</td>
              <td><input type="text" name="sgcbjbfb" size="10" maxlength="8"  value="100" >
%</td>
              <td align="right"><font color="#FF0000">*</font>工程基础报价百分比</td>
              <td><input type="text" name="gcjcbjbfb" size="10" maxlength="8"  value="100" >
%</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>是否必选项</td>
              <td width="30%"> 
                <input type="radio" name="sfbxx" value="1">
                必选 
                <input type="radio" name="sfbxx" value="2">
                非必选 </td>
              <td width="19%" align="right"><font color="#FF0000">*</font>是否记入业绩</td>
              <td width="31%"><%
	cf.radioToken(out, "sfjrqye","1+是&2+否","");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>是否收取税金</td>
              <td width="30%"><%
	cf.radioToken(out, "jrsjbz","1+收取&2+不收取","");
%></td>
              <td width="19%" align="right"><font color="#FF0000">*</font>是否收取管理费</td>
              <td width="31%"><%
	cf.radioToken(out, "jrglfbz","1+收取&2+不收取","");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>是否收取设计费</td>
              <td><%
	cf.radioToken(out, "sfssjf","1+收取&2+不收取","2");
%></td>
              <td align="right"><font color="#FF0000">*</font>设计师是否需授权使用</td>
              <td>
				  <input name="sfxsq" type="radio" value="1" checked>不需授权
				  <input type="radio" name="sfxsq" value="2">需授权使用
				  <input type="radio" name="sfxsq" value="3">停用			  </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>是否可打折</td>
              <td width="30%"> 
                <input type="radio" name="sfkdz" value="N">
                不可打折 
                <input type="radio" name="sfkdz" value="Y">
                可打折 </td>
              <td width="19%" align="right">最低折扣</td>
              <td width="31%"> 
                <input type="text" name="zdzk" size="10" maxlength="8"  value="" >
                <b><font color="#0000FF">（>=0且<=10）</font></b> </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>是否分期收款</td>
              <td><input type="radio" name="sffqsk" value="1">
                是
                  <input type="radio" name="sffqsk" value="2">
              否 </td>
              <td align="right"><font color="#FF0000">*</font>是否记入合同净值毛利</td>
              <td><input type="radio" name="sfjrhtjz" value="Y">
记入
  <input type="radio" name="sfjrhtjz" value="N">
否 </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>成本价计算方式</td>
              <td><input type="radio" name="cbjjsfs" value="1">
折前
  <input type="radio" name="cbjjsfs" value="2">
折后
<input type="radio" name="cbjjsfs" value="3">
不记入</td>
              <td align="right"><font color="#FF0000">*</font>是否精装收费</td>
              <td><input type="radio" name="sfjzsf" value="Y">
是
  <input name="sfjzsf" type="radio" value="N" checked>
否</td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" rows="4" cols="71"></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">              </td>
            </tr>
          </table>
</form>
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区名称]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.sfxmbm)=="") {
		alert("请输入[收费项目编码]！");
		FormName.sfxmbm.focus();
		return false;
	}

	if(	javaTrim(FormName.sfxmmc)=="") {
		alert("请输入[收费项目名称]！");
		FormName.sfxmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.dysfxmmc)=="") {
		alert("请输入[打印收费项目名称]！");
		FormName.dysfxmmc.focus();
		return false;
	}

	if(	!radioChecked(FormName.sfxmlx)) {
		alert("请选择[收费项目类型]！");
		FormName.sfxmlx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sflx)) {
		alert("请选择[收费计算方式]！");
		FormName.sflx[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.sfcysgdjs)) {
		alert("请选择[是否参与施工队结算]！");
		FormName.sfcysgdjs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.jldw)=="") {
		alert("请输入[计量单位]！");
		FormName.jldw.select();
		return false;
	}

	if(	!radioChecked(FormName.sfbxx)) {
		alert("请选择[是否必选项]！");
		FormName.sfbxx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfjrqye)) {
		alert("请选择[是否记入业绩]！");
		FormName.sfjrqye[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.jrsjbz)) {
		alert("请选择[入税金基数标志]！");
		FormName.jrsjbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.jrglfbz)) {
		alert("请选择[是否收取管理费]！");
		FormName.jrglfbz[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.sfkdz)) {
		alert("请选择[是否可打折]！");
		FormName.sfkdz[0].focus();
		return false;
	}
	if (FormName.sfkdz[1].checked)
	{
		if(	javaTrim(FormName.zdzk)=="") {
			alert("请输入[最低折扣]！");
			FormName.zdzk.select();
			return false;
		}
		if(!(isFloat(FormName.zdzk, "最低折扣"))) {
			return false;
		}
		if (FormName.zdzk.value<0 || FormName.zdzk.value>10)
		{
			alert("错误！[最低折扣]应该在0和10之间！");
			FormName.zdzk.select();
			return false;
		}
	}
	else{
		FormName.zdzk.value=10;
	}
	if(	!radioChecked(FormName.sfxsq)) {
		alert("请选择[设计师是否需授权使用]！");
		FormName.sfxsq[0].focus();
		return false;
	}

	//检查录入是否正确＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	if (FormName.sfxmlx[0].checked || FormName.sfxmlx[1].checked)//收费项目类型：间接工程费、工程相关费
	{
		if (!FormName.sflx[0].checked && !FormName.sflx[1].checked && !FormName.sflx[5].checked && !FormName.sflx[6].checked && !FormName.sflx[14].checked && !FormName.sflx[15].checked)//收费计算方式：工程直接费百分比、固定金额(设计师可改)、固定金额（设计师不可改）
		{
			alert("错误！[收费计算方式]应选择『1：工程直接费百分比（不可改） 或 A：工程直接费百分比（可改） 或 2：固定金额(设计师可改) 或 4：固定金额（设计师不可改）』");
			FormName.sflx[0].focus();
			return false;
		}
	}
	else if (FormName.sfxmlx[2].checked)//收费项目类型：设计费
	{
		if (!FormName.sflx[0].checked && !FormName.sflx[1].checked && !FormName.sflx[5].checked && !FormName.sflx[6].checked && !FormName.sflx[11].checked && !FormName.sflx[14].checked && !FormName.sflx[15].checked)//收费计算方式：工程直接费百分比、固定金额(设计师可改)、固定金额（设计师不可改）、按百分比收设计费
		{
			alert("错误！[收费计算方式]应选择『1：工程直接费百分比（不可改） 或 A：工程直接费百分比（可改） 或 2：固定金额(设计师可改) 或 4：固定金额（设计师不可改）、9：按百分比收设计费 』");
			FormName.sflx[0].focus();
			return false;
		}
	}
	else if (FormName.sfxmlx[3].checked )//收费项目类型：工程管理费
	{
		if ( !FormName.sflx[0].checked  && !FormName.sflx[1].checked  && !FormName.sflx[4].checked  && !FormName.sflx[5].checked && !FormName.sflx[12].checked && !FormName.sflx[13].checked)//收费计算方式：管理费、固定金额(设计师可改)
		{
			alert("错误！[收费计算方式]应选择『5：管理费 或 2：固定金额(设计师可改)』");
			FormName.sflx[3].focus();
			return false;
		}
		if (!FormName.jrglfbz[1].checked)
		{
			alert("错误！[是否收取管理费]应选择『不收取』");
			FormName.jrglfbz[1].focus();
			return false;
		}
	}
	else if ( FormName.sfxmlx[5].checked )//收费项目类型：公司购主材管理费
	{
		if (!FormName.sflx[4].checked  && !FormName.sflx[5].checked && !FormName.sflx[7].checked && !FormName.sflx[8].checked)//收费计算方式：管理费、固定金额(设计师可改)
		{
			alert("错误！[收费计算方式]应选择『5：管理费 或 2：固定金额(设计师可改)』");
			FormName.sflx[3].focus();
			return false;
		}
		if (!FormName.jrglfbz[1].checked)
		{
			alert("错误！[是否收取管理费]应选择『不收取』");
			FormName.jrglfbz[1].focus();
			return false;
		}
	}
	else if ( FormName.sfxmlx[8].checked )//收费项目类型：自购主材管理费
	{
		if (!FormName.sflx[4].checked  && !FormName.sflx[5].checked && !FormName.sflx[9].checked && !FormName.sflx[10].checked)//收费计算方式：管理费、固定金额(设计师可改)
		{
			alert("错误！[收费计算方式]应选择『5：管理费 或 2：固定金额(设计师可改)』』");
			FormName.sflx[3].focus();
			return false;
		}
		if (!FormName.jrglfbz[1].checked)
		{
			alert("错误！[是否收取管理费]应选择『不收取』");
			FormName.jrglfbz[1].focus();
			return false;
		}
	}
	else if (FormName.sfxmlx[4].checked || FormName.sfxmlx[6].checked || FormName.sfxmlx[9].checked)//收费项目类型：工程税金、公司购主材税金、自购主材税金
	{
		if (!FormName.sflx[2].checked && !FormName.sflx[3].checked && !FormName.sflx[5].checked)//收费计算方式：税金（折后按基数计算）、税金（折后按折扣计算）、固定金额(设计师可改)
		{
			alert("错误！[收费计算方式]应选择『3：税金（折后按基数计算） 或 8：税金（折后按折扣计算） 或 2：固定金额(设计师可改)』");
			FormName.sflx[2].focus();
			return false;
		}
		if (!FormName.jrsjbz[1].checked)
		{
			alert("错误！[是否收取税金]应选择『不收取』");
			FormName.jrsjbz[1].focus();
			return false;
		}
		if (!FormName.jrglfbz[1].checked)
		{
			alert("错误！[是否收取管理费]应选择『不收取』");
			FormName.jrglfbz[1].focus();
			return false;
		}
	}
	else if (FormName.sfxmlx[7].checked)//收费项目类型：公司购主材间接费
	{
		if (!FormName.sflx[5].checked && !FormName.sflx[6].checked && !FormName.sflx[7].checked && !FormName.sflx[8].checked)//收费计算方式：固定金额(设计师可改)、固定金额（设计师不可改）、公司购主材百分比
		{
			alert("错误！[收费计算方式]应选择『2：固定金额(设计师可改) 或 4：固定金额（设计师不可改）、6：公司购主材百分比、F：公司购主材百分比(可改)』");
			FormName.sflx[6].focus();
			return false;
		}
	}
	else if (FormName.sfxmlx[10].checked)//收费项目类型：自购主材间接费
	{
		if (!FormName.sflx[5].checked && !FormName.sflx[6].checked && !FormName.sflx[9].checked && !FormName.sflx[10].checked)//收费计算方式：固定金额(设计师可改)、固定金额（设计师不可改）、自购主材百分比
		{
			alert("错误！[收费计算方式]应选择『2：固定金额(设计师可改) 或 4：固定金额（设计师不可改）、7：自购主材百分比、G：自购主材百分比(可改)』");
			FormName.sflx[7].focus();
			return false;
		}
	}
	else{
		if (FormName.sflx[2].checked || FormName.sflx[3].checked || FormName.sflx[4].checked)//收费计算方式：税金（折后按基数计算）、税金（折后按折扣计算）、管理费
		{
			alert("错误！[收费计算方式]不能选择选择『3：税金（折后按基数计算） 或 8：税金（折后按折扣计算）、5：管理费』");
			FormName.sflx[0].focus();
			return false;
		}
	}


	if (FormName.sflx[2].checked)//收费计算方式：税金（折后按基数计算）
	{
		if (!FormName.sfkdz[0].checked)
		{
			alert("错误！应选择『不可打折』");
			FormName.sfkdz[0].focus();
			return false;
		}
	}
	else if (FormName.sflx[3].checked)//收费计算方式：税金（折后按折扣计算）
	{
	}
	else if (FormName.sflx[4].checked)//收费计算方式：管理费
	{
	}
	else if (FormName.sflx[6].checked)//收费计算方式：固定金额（设计师不可改）
	{
		if(	javaTrim(FormName.gdje)=="" || FormName.gdje.value=="0" || FormName.gdje.value=="0.0") {
			alert("请输入[固定金额]！");
			FormName.gdje.select();
			return false;
		}
		if(!(isFloat(FormName.gdje, "固定金额"))) {
			return false;
		}
	}
	//检查录入是否正确＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

	if(	javaTrim(FormName.cbjbfb)=="") {
		alert("请输入[成本价百分比]！");
		FormName.cbjbfb.select();
		return false;
	}
	if(!(isFloat(FormName.cbjbfb, "成本价百分比"))) {
		return false;
	}
	if (FormName.cbjbfb.value<0 || FormName.cbjbfb.value>100)
	{
		alert("错误！[成本价百分比]应该在0和100之间！");
		FormName.cbjbfb.select();
		return false;
	}
	if(	javaTrim(FormName.sgcbjbfb)=="") {
		alert("请输入[施工成本价百分比]！");
		FormName.sgcbjbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.sgcbjbfb, "施工成本价百分比"))) {
		return false;
	}
	if (parseFloat(FormName.sgcbjbfb.value)<0 || parseFloat(FormName.sgcbjbfb.value)>100)
	{
		alert("[施工成本价百分比]应该在0到100之间！");
		FormName.sgcbjbfb.select();
		return false;
	}
	if(	javaTrim(FormName.gcjcbjbfb)=="") {
		alert("请输入[工程基础报价百分比]！");
		FormName.gcjcbjbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.gcjcbjbfb, "工程基础报价百分比"))) {
		return false;
	}
	if (parseFloat(FormName.gcjcbjbfb.value)<0 || parseFloat(FormName.gcjcbjbfb.value)>100)
	{
		alert("[工程基础报价百分比]应该在0到100之间！");
		FormName.gcjcbjbfb.select();
		return false;
	}
	if(	!radioChecked(FormName.sfssjf)) {
		alert("请选择[是否收取设计费]！");
		FormName.sfssjf[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfssjf)) {
		alert("请选择[是否收取设计费]！");
		FormName.sfssjf[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.sffqsk)) {
		alert("请选择[是否分期收款]！");
		FormName.sffqsk[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.cbjjsfs)) {
		alert("请选择[成本价计算方式]！");
		FormName.cbjjsfs[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfjrhtjz)) {
		alert("请选择[是否记入合同净值毛利]！");
		FormName.sfjrhtjz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfjzsf)) {
		alert("请选择[是否精装收费]！");
		FormName.sfjzsf[0].focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
