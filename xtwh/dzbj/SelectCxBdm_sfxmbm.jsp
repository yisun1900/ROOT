<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
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
      <div align="center">其它收费项目编码－查询</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Bdm_sfxmbmCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">地区</td>
              <td width="32%"> 
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
              <td width="20%">&nbsp;</td>
              <td width="30%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">收费项目编码 </td>
              <td width="32%"> 
                <input type="text" name="sfxmbm" size="20" maxlength="2" ></td>
              <td width="20%" align="right">收费项目名称 </td>
              <td width="30%"> 
                <input type="text" name="sfxmmc" size="20" maxlength="50" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">收费项目类型</td>
              <td>
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
				E：水电路预收<br><br>
				<input type="radio" name="sfxmlx"  value="9">
				9：其它			  </td>
              <td align="right">收费计算方式</td>
              <td valign="top">
			        <input type="radio" name="sflx"  value="1">
					1：工程直接费百分比<font color="#FF0000"><b>（不可改）</b></font><br>
			        <input type="radio" name="sflx"  value="A">
					A：工程直接费百分比（可改）<br><br>
					<input type="radio" name="sflx"  value="3">
					3：税金（折后合同额×税率）<br>
					<input type="radio" name="sflx"  value="8">
					8：税金（折前税金×税金折扣）<br><br>
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
              <td width="18%" align="right">是否必选项</td>
              <td width="32%"> 
                <input type="radio" name="sfbxx" value="1">
                必选 
                <input type="radio" name="sfbxx" value="2">
                非必选 </td>
              <td width="20%" align="right">是否记入业绩</td>
              <td width="30%"> 
                <input type="radio" name="sfjrqye" value="1">
                是 
                <input type="radio" name="sfjrqye" value="2">
                否 </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">是否参与施工队结算</td>
              <td><input type="radio" name="sfcysgdjs" value="Y">
是
  <input type="radio" name="sfcysgdjs" value="N">
否 </td>
              <td align="right">是否可打折</td>
              <td><input type="radio" name="sfkdz" value="N">
不可打折
  <input type="radio" name="sfkdz" value="Y">
可打折</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">是否收取税金</td>
              <td width="32%"><%
	cf.radioToken(out, "jrsjbz","1+收取&2+不收取","");
%></td>
              <td width="20%" align="right">是否收取管理费</td>
              <td width="30%"><%
	cf.radioToken(out, "jrglfbz","1+收取&2+不收取","");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">设计师是否需授权使用</td>
              <td>
				  <input name="sfxsq" type="radio" value="1">不需授权
				  <input type="radio" name="sfxsq" value="2">需授权使用
				  <input type="radio" name="sfxsq" value="3">停用				</td>
              <td align="right">是否记入合同净值毛利</td>
              <td><input type="radio" name="sfjrhtjz" value="Y">
记入
  <input type="radio" name="sfjrhtjz" value="N">
否 </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">是否分期收款</td>
              <td><input type="radio" name="sffqsk" value="1">
                是
                <input type="radio" name="sffqsk" value="2">
                否 </td>
              <td align="right">成本价计算方式</td>
              <td><input type="radio" name="cbjjsfs" value="1">
折前
  <input type="radio" name="cbjjsfs" value="2">
折后
<input type="radio" name="cbjjsfs" value="3">
不记入</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">是否精装收费</td>
              <td><input type="radio" name="sfjzsf" value="Y">
                是
                <input name="sfjzsf" type="radio" value="N">
                否</td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="reset"  value="重输">              </td>
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
