<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>


<body bgcolor="#FFFFFF">

<%
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>

<form method="post" action="Sq_dwxxTxszList.jsp" name="selectform">
<div align="center">设置－提醒回访条件</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right"> 
		单位编号              </td>
	  <td width="32%"> 
	  <input type="text" name="sq_dwxx_dwbh" size="20" maxlength="5" >              </td>
	  <td width="18%" align="right"> 
		单位类型              </td>
	  <td width="32%"> 
		<select name="sq_dwxx_dwlx" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <option value="F0">分公司</option>
	  </select>              </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right"> 
		单位简称              </td>
	  <td width="32%"> 
	  <input type="text" name="sq_dwxx_dwjc" size="20" maxlength="10" >              </td>
	  <td width="18%" align="right"> 
		单位名称              </td>
	  <td width="32%"> 
	  <input type="text" name="sq_dwxx_dwmc" size="20" maxlength="100" >              </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right">单位分类</td>
	  <td width="32%"> 
		<select name="dwflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <option value=""></option>
		  <%
cf.selectItem(out,"select dwflbm,dwflmc from dm_dwflbm order by dwflbm","");
%> 
	  </select>              </td>
	  <td width="18%" align="right">所属大区</td>
	  <td width="32%"> 
		<select name="ssdqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <option value=""></option>
		  <%
cf.selectItem(out,"select ssdqbm,ssdqmc from sq_ssdqbm order by ssdqbm","");
%> 
	  </select>              </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right">所属地区</td>
	  <td width="32%"> 
		<select name="sq_dwxx_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <option value=""></option>
		  <%
cf.selectItem(out,"select dqbm,dqmc from dm_dqbm  order by dqbm","");
%> 
	  </select>              </td>
	  <td width="18%" align="right">公司类型</td>
	  <td width="32%"> 
		<select name="sfjms" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <option value=""></option>
		  <option value="N">直营公司</option>
		  <option value="Y">加盟公司</option>
		  <option value="Q">其它公司</option>
	  </select>              </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right">所属分公司</td>
	  <td width="32%"> 
		<select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
		<%
			if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
			{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
			}
			else{
				out.println("错误！未进行客户资料授权，请联系系统管理员");
				return;
			}
		%> 
	  </select>              </td>
	  <td width="18%" align="right">上级单位</td>
	  <td width="32%"> 
		<select name="sq_dwxx_ssdw" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <option value=""></option>
		  <%
cf.selectItem(out,"select dwbh,dwmc||'('||ssfgs||')' from sq_dwxx where dwlx in('A0','F0','F1','F2') and cxbz='N' order by ssfgs,dwlx,dwbh","");
%> 
	  </select>              </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right">合同号前缀</td>
	  <td width="32%"> 
	  <input type="text" name="hthqz" value="" size="20" maxlength="5" >              </td>
	  <td width="18%" align="right">撤店标志</td>
	  <td width="32%"> 
		<select name="cxbz" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <option value="N">未撤销</option>
		  <option value="Y">已撤销</option>
	  </select>              </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right">所属方位</td>
	  <td width="32%"> 
		<select name="ssfw" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <option value=""></option>
		  <%
cf.selectItem(out,"select ssfw,ssfwmc from dm_ssfw order by ssfw","");
%> 
	  </select>              </td>
	  <td width="18%" align="right">单位级别</td>
	  <td width="32%"> 
		<select name="dwjb" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <option value=""></option>
		  <%
cf.selectItem(out,"select dwjb,dwjbmc from dm_dwjb order by dwjb","");
%> 
	  </select>              </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right">单位地址</td>
	  <td width="32%"> 
	  <input type="text" name="sq_dwxx_dwdz" size="20" maxlength="100" >              </td>
	  <td width="18%" align="right">项目专员</td>
	  <td width="32%"> 
		<select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <option value=""></option>
		  <%
cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='10' order by yhmc","");
%> 
	  </select>              </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right"> 
		单位负责人              </td>
	  <td width="32%"> 
	  <input type="text" name="sq_dwxx_dwfzr" size="20" maxlength="20" >              </td>
	  <td width="18%" align="right"> 
		单位电话              </td>
	  <td width="32%"> 
	  <input type="text" name="sq_dwxx_dwdh" size="20" maxlength="30" >              </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right"> 
		单位传真              </td>
	  <td width="32%" bgcolor="#FFFFFF"> 
	  <input type="text" name="sq_dwxx_dwcz" size="20" maxlength="50" >              </td>
	  <td width="18%" align="right">店面形式</td>
	  <td width="32%"> 
		<select name="dmxs" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <option value=""></option>
		  <%
cf.selectItem(out,"select dmxs,dmxsmc from dm_dmxs order by dmxs","");
%> 
	  </select>              </td>
	</tr>
	
	<tr align="center"> 
	  <td colspan="4"> 
		<input type="button"  value="查询" onClick="f_do(selectform)">
		<input type="reset"  value="重输">              </td>
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
