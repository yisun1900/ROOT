<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String rwbm=null;
String rwmc=null;
String rwflbm=null;
String rwdx=null;
String sfsjysxm=null;
String gcysxmbm=null;

String sfsjzcxm=null;
String zcdlbm=null;
String sjzcjd=null;
String sfyxhxgq=null;
String zdjkrw=null;

String bjsj=null;
String bjjbbm=null;

String sqbjnr=null;
String sqbjts=null;
String shbjnr=null;
String shbjts=null;
String rwxh=null;

String bz=null;


String whererwbm=cf.GB2Uni(request.getParameter("rwbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select rwbm,rwmc,rwflbm,zdjkrw,bjsj,sqbjnr,sqbjts,shbjnr,shbjts,sfsjzcxm,zcdlbm,sjzcjd,bz,sfsjysxm,gcysxmbm,rwxh ";
	ls_sql+=" ,rwdx,sfyxhxgq,sfsjzcxm,zcdlbm,bjjbbm ";
	ls_sql+=" from  gdm_rwbm";
	ls_sql+=" where  (rwbm='"+whererwbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		rwdx=cf.fillNull(rs.getString("rwdx"));
		sfyxhxgq=cf.fillNull(rs.getString("sfyxhxgq"));
		sfsjzcxm=cf.fillNull(rs.getString("sfsjzcxm"));
		zcdlbm=cf.fillNull(rs.getString("zcdlbm"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));

		rwbm=cf.fillNull(rs.getString("rwbm"));
		rwmc=cf.fillNull(rs.getString("rwmc"));
		rwflbm=cf.fillNull(rs.getString("rwflbm"));
		zdjkrw=cf.fillNull(rs.getString("zdjkrw"));
		bjsj=cf.fillNull(rs.getString("bjsj"));
		sqbjnr=cf.fillNull(rs.getString("sqbjnr"));
		sqbjts=cf.fillNull(rs.getString("sqbjts"));
		shbjnr=cf.fillNull(rs.getString("shbjnr"));
		shbjts=cf.fillNull(rs.getString("shbjts"));
		sfsjzcxm=cf.fillNull(rs.getString("sfsjzcxm"));
		zcdlbm=cf.fillNull(rs.getString("zcdlbm"));
		sjzcjd=cf.fillNull(rs.getString("sjzcjd"));
		bz=cf.fillNull(rs.getString("bz"));
		sfsjysxm=cf.fillNull(rs.getString("sfsjysxm"));
		gcysxmbm=cf.fillNull(rs.getString("gcysxmbm"));
		rwxh=cf.fillNull(rs.getString("rwxh"));

		if (sqbjts.equals("0"))
		{
			sqbjts="";
		}
		if (shbjts.equals("0"))
		{
			shbjts="";
		}
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

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE2 {color: #FF0000}
.STYLE3 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform" target="_blank">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span><span class="STYLE3">任务编码(4位)</span></td>
  <td><input type="text" name="rwbm" size="20" maxlength="4"  value="<%=rwbm%>" readonly></td>
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE2">*</span>任务分类</td>
  <td><select name="rwflbm" style="FONT-SIZE:12PX;WIDTH:152PX"  >
    <option value=""></option>
    <%
	cf.selectItem(out,"select rwflbm,rwflmc from gdm_rwflbm order by rwflbm",rwflbm);
%>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">*</span>任务名称</td> 
  <td colspan="3"><input type="text" name="rwmc" size="73" maxlength="100"  value="<%=rwmc%>" ></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE2">*</span>任务对象</td>
  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "rwdx","1+客户&2+施工队&3+供应商&4+设计师&5+质检",rwdx);
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>是否涉及验收项</td>
  <td><%
	cf.radioToken(out, "sfsjysxm","Y+是&N+否",sfsjysxm);
%></td>
  <td align="right" bgcolor="#FFFFFF">验收项目</td>
  <td bgcolor="#FFFFFF"><select name="gcysxmbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select gcysxmbm,gcysxmmc from dm_gcysxm where ysxmflbm='05' order by gcysxmbm",gcysxmbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE2">*</span>是否涉及主材项目</td>
  <td bgcolor="#FFFFFF"><%
	cf.radioToken(out, "sfsjzcxm","Y+是&N+否",sfsjzcxm);
%></td>
  <td align="right" bgcolor="#FFFFFF">涉及主材大类</td>
  <td bgcolor="#FFFFFF"><select name="zcdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb='1' order by cldlmc",zcdlbm);
%>
  </select></td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right">涉及主材节点</td>
  <td>
  <select name="sjzcjd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
  <%
	cf.selectToken(out,"03+测量通知&05+已测量& 25+复尺通知&26+复尺&09+合同已完成&11+合同已确认&13+工厂已接收&15+确定送货时间&17+已通知送货&19+送货安装完成 ",sjzcjd);
%>
  </select></td>
  <td align="right" bgcolor="#FFFFFF">报警级别</td>
  <td bgcolor="#FFFFFF"><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from gdm_bjjbbm order by bjjbbm",bjjbbm);
%>
  </select></td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">*</span>报警时间</td> 
  <td colspan="3"> 
<%
	cf.radioToken(out, "bjsj","1+事前报警&2+事后提醒&3+事前事后都提醒&9+不报警",bjsj);
%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">事前报警天数</td> 
  <td width="32%"> 
    <input type="text" name="sqbjts" size="20" maxlength="8"  value="<%=sqbjts%>" >  </td>
  <td align="right" width="18%">事后报警天数</td> 
  <td width="32%"><input type="text" name="shbjts" size="20" maxlength="8"  value="<%=shbjts%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">目事前报警内容</td>
  <td colspan="3"><textarea name="sqbjnr" cols="72" rows="2"><%=sqbjnr%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">事后报警内容</td>
  <td colspan="3"><textarea name="shbjnr" cols="72" rows="2"><%=shbjnr%></textarea></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>是否影响后续工期</td>
  <td><%
	cf.radioToken(out, "sfyxhxgq","Y+是&N+否",sfyxhxgq);
%></td>
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE2">*</span>重点监控任务</td>
  <td bgcolor="#FFFFFF"><%
	cf.radioToken(out, "zdjkrw","Y+重点监控&N+非重点监控",zdjkrw);
%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>任务序号</td>
  <td><input name="rwxh" type="text" value="<%=rwxh%>" size="10" maxlength="8" ></td>
  <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
  <td bgcolor="#FFFFFF">&nbsp;</td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">任务备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="3"><%=bz%></textarea>      </td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="button" onClick="f_do1(editform)"  value="任务逻辑关系" name="ljgx">
	  <input type="reset"  value="重输">
	</div>      </td>
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
	if(	javaTrim(FormName.rwflbm)=="") {
		alert("请选择[任务分类]！");
		FormName.rwflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.rwbm)=="") {
		alert("请输入[任务编码]！");
		FormName.rwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.rwmc)=="") {
		alert("请输入[任务名称]！");
		FormName.rwmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.rwdx)) {
		alert("请选择[任务对象]！");
		FormName.rwdx[0].focus();
		return false;
	}


	if(	!radioChecked(FormName.sfsjysxm)) {
		alert("请选择[是否涉及验收项]！");
		FormName.sfsjysxm[0].focus();
		return false;
	}
	if (FormName.sfsjysxm[0].checked)
	{
		if(	javaTrim(FormName.gcysxmbm)=="") {
			alert("请输入[验收项目]！");
			FormName.gcysxmbm.focus();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.gcysxmbm)!="") {
			alert("不能输入[验收项目]！");
			FormName.gcysxmbm.focus();
			return false;
		}
	}


	if(	!radioChecked(FormName.sfsjzcxm)) {
		alert("请选择[是否涉及主材项目]！");
		FormName.sfsjzcxm[0].focus();
		return false;
	}
	if (FormName.sfsjzcxm[0].checked)
	{
		if(	javaTrim(FormName.zcdlbm)=="") {
			alert("请输入[涉及主材大类]！");
			FormName.zcdlbm.focus();
			return false;
		}
		if(	javaTrim(FormName.sjzcjd)=="") {
			alert("请输入[涉及主材节点]！");
			FormName.sjzcjd.focus();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.zcdlbm)!="") {
			alert("不能输入[涉及主材大类]！");
			FormName.zcdlbm.focus();
			return false;
		}
		if(	javaTrim(FormName.sjzcjd)!="") {
			alert("不能输入[涉及主材节点]！");
			FormName.sjzcjd.focus();
			return false;
		}
	}
	if(	!radioChecked(FormName.bjsj)) {
		alert("请选择[报警时间]！");
		FormName.bjsj[0].focus();
		return false;
	}
	if(!(isNumber(FormName.sqbjts, "事前报警天数"))) {
		return false;
	}
	if(!(isNumber(FormName.shbjts, "事后报警天数"))) {
		return false;
	}
	if (FormName.bjsj[0].checked )
	{
		if(	javaTrim(FormName.sqbjts)=="") {
			alert("请输入[事前报警天数]！");
			FormName.sqbjts.focus();
			return false;
		}
		if(	javaTrim(FormName.sqbjnr)=="") {
			alert("请输入[事前报警内容]！");
			FormName.sqbjnr.focus();
			return false;
		}
		if(	javaTrim(FormName.shbjts)!="") {
			alert("[事后报警天数]应为空！");
			FormName.shbjts.select();
			return false;
		}
		if(	javaTrim(FormName.shbjnr)!="") {
			alert("[事后报警内容]应为空！");
			FormName.shbjnr.select();
			return false;
		}
	}
	else if (FormName.bjsj[1].checked )
	{
		if(	javaTrim(FormName.shbjts)=="") {
			alert("请输入[事后报警天数]！");
			FormName.shbjts.focus();
			return false;
		}
		if(	javaTrim(FormName.shbjnr)=="") {
			alert("请输入[事后报警内容]！");
			FormName.shbjnr.focus();
			return false;
		}
		if(	javaTrim(FormName.sqbjts)!="") {
			alert("[事前报警天数]应为空！");
			FormName.sqbjts.select();
			return false;
		}
		if(	javaTrim(FormName.sqbjnr)!="") {
			alert("[事前报警内容]应为空！");
			FormName.sqbjnr.select();
			return false;
		}
	}
	else if ( FormName.bjsj[2].checked)
	{
		if(	javaTrim(FormName.sqbjts)=="") {
			alert("请输入[事前报警天数]！");
			FormName.sqbjts.focus();
			return false;
		}
		if(	javaTrim(FormName.sqbjnr)=="") {
			alert("请输入[事前报警内容]！");
			FormName.sqbjnr.focus();
			return false;
		}
		if(	javaTrim(FormName.shbjts)=="") {
			alert("请输入[事后报警天数]！");
			FormName.shbjts.focus();
			return false;
		}
		if(	javaTrim(FormName.shbjnr)=="") {
			alert("请输入[事后报警内容]！");
			FormName.shbjnr.focus();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.sqbjts)!="") {
			alert("[事前报警天数]应为空！");
			FormName.sqbjts.select();
			return false;
		}
		if(	javaTrim(FormName.sqbjnr)!="") {
			alert("[事前报警内容]应为空！");
			FormName.sqbjnr.select();
			return false;
		}
		if(	javaTrim(FormName.shbjts)!="") {
			alert("[事后报警天数]应为空！");
			FormName.shbjts.select();
			return false;
		}
		if(	javaTrim(FormName.shbjnr)!="") {
			alert("[事后报警内容]应为空！");
			FormName.shbjnr.select();
			return false;
		}
	}

	if(	!radioChecked(FormName.sfyxhxgq)) {
		alert("请选择[是否影响后续工期]！");
		FormName.sfyxhxgq[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.zdjkrw)) {
		alert("请选择[重点监控任务]！");
		FormName.zdjkrw[0].focus();
		return false;
	}
	if(	javaTrim(FormName.rwxh)=="") {
		alert("请输入[任务序号]！");
		FormName.rwxh.focus();
		return false;
	}
	if(!(isFloat(FormName.rwxh, "任务序号"))) {
		return false;
	}

	FormName.action="SaveEditGdm_rwbm.jsp";
	FormName.submit();
	return true;
}

function f_do1(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.rwbm)=="") {
		alert("请输入[任务编码]！");
		FormName.rwbm.focus();
		return false;
	}

	FormName.action="InsertGdm_rwljgx.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
