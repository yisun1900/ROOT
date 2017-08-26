<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertTc_csrjzck.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">地区</td>
  <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
  </select></td>
  <td align="right">报价级别</td>
  <td><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">产品编码</font></td> 
  <td width="32%"> 
    <input type="text" name="cpbm" value="0" size="20" maxlength="13" readonly>  </td>
  <td align="right" width="18%">内部编码</td> 
  <td width="32%"><input type="text" name="nbbm" value="" size="20" maxlength="20" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">产品大类</td> 
  <td width="32%"> 
    <select name="tccpdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select cldlbm c1,cldlmc c2 from jxc_cldlbm where cldllb in('1','3') order by cldlmc","");
%>
    </select>  </td>
  <td align="right" width="18%">产品小类</td> 
  <td width="32%"> 
    <select name="tccplbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select clxlbm c1,clxlmc c2 from jxc_clxlbm order by clxlmc","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">编组名称</td>
  <td><input type="text" name="bzmc" value="" size="20" maxlength="50" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">产品名称</td> 
  <td width="32%"> 
    <input type="text" name="cpmc" value="" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">型号</td> 
  <td width="32%"> 
    <input type="text" name="xh" value="" size="20" maxlength="100" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">规格</td> 
  <td width="32%"> 
    <input type="text" name="gg" value="" size="20" maxlength="100" >  </td>
  <td align="right" width="18%">品牌</td> 
  <td width="32%"> 
    <select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select ppmc c1,ppmc c2 from jxc_ppxx where pplb in('1','3') order by ppmc","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">供应商</td> 
  <td width="32%"> 
    <select name="gysmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gysmc c1,gysmc c2 from jxc_gysxx where cllx in('1','3') order by gysmc","");
%>
    </select>  </td>
  <td align="right" width="18%">计量单位</td> 
  <td width="32%"> 
    <select name="jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">下单计量单位</td> 
  <td width="32%"> 
    <select name="xdjldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%>
    </select>  </td>
  <td align="right" width="18%">下单比</td> 
  <td width="32%"> 
    <input type="text" name="xdb" value="" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">损耗</td> 
  <td width="32%"> 
    <input type="text" name="sh" value="" size="10" maxlength="9" >
    %  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">是否需处理小数</td>
  <td colspan="3"><input type="radio" name="sfxclxs"  value="1">
    向上取整
      <input type="radio" name="sfxclxs"  value="2">
      向下取整
      <input type="radio" name="sfxclxs"  value="3">
      4舍5入
      <input type="radio" name="sfxclxs"  value="4">
      不处理</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><strong>原结算价</strong></td> 
  <td width="32%"> 
    <input type="text" name="yjsj" value="" size="20" maxlength="17" >  </td>
  <td width="18%" align="right"><font color="#0000CC">结算价</font></td>
  <td width="32%"><input type="text" name="jsj" value="" size="20" maxlength="17" >  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><strong>原客户销售单价</strong></td>
  <td><input type="text" name="ykhxsdj" value="" size="20" maxlength="17" ></td>
  <td align="right"><font color="#0000CC">客户销售单价</font></td>
  <td><input type="text" name="khxsdj" value="" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><strong>原施工队单价</strong></td> 
  <td width="32%"> 
    <input type="text" name="ysgddj" value="" size="20" maxlength="17" >  </td>
  <td width="18%" align="right"><font color="#0000CC">施工队单价</font></td>
  <td width="32%"><input type="text" name="sgddj" value="" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">类型</td>
  <td><input type="radio" name="lx"  value="1">
    标准套餐项
      <input type="radio" name="lx"  value="2">
      套餐外</td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">是否有效</td>
  <td><input type="radio" name="sfyx"  value="1">
    永远有效
    <input type="radio" name="sfyx"  value="2">
    无效
    <input type="radio" name="sfyx"  value="3">
    阶段有效 </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">有效开始时间</td>
  <td><input type="text" name="yxkssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">有效结束时间</td>
  <td><input type="text" name="yxjzsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">录入人</font></td>
  <td><input type="text" name="lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>  </td>
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">录入时间</font></td>
  <td><input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="3"></textarea>  </td>
  </tr>
</table>


<BR>
<div align="center">
<table width="80%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td height="27" colspan="7" align="center" bgcolor="#CCCCCC"><strong>主材升级差价</strong></td>
  </tr>
<tr align="center" bgcolor="#FFFFFF">
  <td width="15%" height="27" bgcolor="#CCCCCC"><strong>报价级别</strong></td>
  <td width="17%" bgcolor="#CCCCCC"><strong>原升级收费价</strong></td>
  <td width="17%" bgcolor="#CCCCCC"><strong>升级收费价</strong></td>
  <td width="17%" bgcolor="#CCCCCC"><strong>是否打折</strong></td>
  <td width="17%" bgcolor="#CCCCCC"><strong>打折开始时间</strong></td>
  <td width="17%" bgcolor="#CCCCCC"><strong>打折结束时间</strong></td>
  <td width="17%" bgcolor="#CCCCCC"><strong>打折升级收费价</strong></td>
</tr>
<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String getbjjbbm=null;
	String getbjjbmc=null;

	ls_sql="select bjjbbm,bjjbmc";
	ls_sql+=" from  bdm_bjjbbm";
	ls_sql+=" where lx='2'";
	ls_sql+=" order by yxj";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getbjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		getbjjbmc=cf.fillNull(rs.getString("bjjbmc"));

		%>
		<tr bgcolor="#FFFFFF">
		  <td align="right"><input type="hidden" name="getbjjbbm" size="10" maxlength="10"  value="<%=getbjjbbm%>" >
			<%=getbjjbmc%>		  </td>
		  <td><input type="text" name="ysjsfj" size="10" maxlength="10"  value="" ></td>
		  <td><input type="text" name="sjsfj" size="10" maxlength="10"  value="" ></td>
		  <td><select name="sfdz" style="FONT-SIZE:12PX;WIDTH:82PX">
              <%
	cf.selectToken(out,"1+无折扣&2+打折","");
%>
            </select></td>
		  <td><input type="text" name="dzkssj" size="10" maxlength="10"  value="" onDblClick="JSCalendar(this)"></td>
		  <td><input type="text" name="dzjzsj" size="10" maxlength="10"  value="" onDblClick="JSCalendar(this)"></td>
		  <td><input type="text" name="dzsjsfj" size="10" maxlength="10"  value="" ></td>
	  </tr>
		<%
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

    <tr align="center"> 
      <td colspan="7"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset" onClick="bc.disabled=false">    
	<input type="button" onClick="f_dr(insertform)"  value="导入报价">
	<input type="button" onClick="f_dc(insertform)"  value="导出报价">
	<P>
	<A HREF="CSH21-套餐主材主材.xls"><B>点击右键另存为，下载Excel报价模板</B></A> </td>
    </tr>
</table>
</div>
</form>
</body>
</html>


<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.cpbm)=="") {
		alert("请输入[产品编码]！");
		FormName.cpbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("请选择[报价级别]！");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tccpdlbm)=="") {
		alert("请选择[产品大类]！");
		FormName.tccpdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tccplbbm)=="") {
		alert("请选择[产品小类]！");
		FormName.tccplbbm.focus();
		return false;
	}

	if(	javaTrim(FormName.cpmc)=="") {
		alert("请输入[产品名称]！");
		FormName.cpmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("请选择[品牌]！");
		FormName.ppmc.focus();
		return false;
	}
	if(	javaTrim(FormName.gysmc)=="") {
		alert("请选择[供应商]！");
		FormName.gysmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jldw)=="") {
		alert("请选择[计量单位]！");
		FormName.jldw.focus();
		return false;
	}
	if(	javaTrim(FormName.xdjldw)=="") {
		alert("请选择[下单计量单位]！");
		FormName.xdjldw.focus();
		return false;
	}
	if(	javaTrim(FormName.xdb)=="") {
		alert("请输入[下单比]！");
		FormName.xdb.focus();
		return false;
	}
	if(!(isFloat(FormName.xdb, "下单比"))) {
		return false;
	}
	if(	javaTrim(FormName.sh)=="") {
		alert("请输入[损耗]！");
		FormName.sh.focus();
		return false;
	}
	if(!(isFloat(FormName.sh, "损耗"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfxclxs)) {
		alert("请选择[是否需处理小数]！");
		FormName.sfxclxs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.yjsj)=="") {
		alert("请输入[原结算价]！");
		FormName.yjsj.focus();
		return false;
	}
	if(!(isFloat(FormName.yjsj, "原结算价"))) {
		return false;
	}
	if(	javaTrim(FormName.ykhxsdj)=="") {
		alert("请输入[原客户销售单价]！");
		FormName.ykhxsdj.focus();
		return false;
	}
	if(!(isFloat(FormName.ykhxsdj, "原客户销售单价"))) {
		return false;
	}
	if(	javaTrim(FormName.ysgddj)=="") {
		alert("请输入[原施工队单价]！");
		FormName.ysgddj.focus();
		return false;
	}
	if(!(isFloat(FormName.ysgddj, "原施工队单价"))) {
		return false;
	}
	if(	javaTrim(FormName.jsj)=="") {
		alert("请输入[结算价]！");
		FormName.jsj.focus();
		return false;
	}
	if(!(isFloat(FormName.jsj, "结算价"))) {
		return false;
	}
	if(	javaTrim(FormName.khxsdj)=="") {
		alert("请输入[客户销售单价]！");
		FormName.khxsdj.focus();
		return false;
	}
	if(!(isFloat(FormName.khxsdj, "客户销售单价"))) {
		return false;
	}
	if(	javaTrim(FormName.sgddj)=="") {
		alert("请输入[施工队单价]！");
		FormName.sgddj.focus();
		return false;
	}
	if(!(isFloat(FormName.sgddj, "施工队单价"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("请选择[类型]！");
		FormName.lx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyx)) {
		alert("请选择[是否有效]！");
		FormName.sfyx[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.yxkssj, "有效开始时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yxjzsj, "有效结束时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}

function f_dr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}

	FormName.action="LoadData.jsp";
	FormName.submit();
	return true;
}

function f_dc(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}

	FormName.action="ExpBj_tczcbj.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
