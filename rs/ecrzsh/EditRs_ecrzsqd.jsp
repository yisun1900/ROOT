<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String fgsbh=null;
String ygbh=null;
String yhmc=null;
String xb=null;
String yfgsbh=null;
String ydwbh=null;
String yxzzwbm=null;
String yrzsj=null;
String ylzrq=null;
String ylzyy=null;
String xdwbh=null;
String xxzzwbm=null;
String xrzyy=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String sqrq=null;
String clzt=null;
String wheresqxh=cf.GB2Uni(request.getParameter("sqxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select fgsbh,ygbh,yhmc,xb,yfgsbh,ydwbh,yxzzwbm,yrzsj,ylzrq,ylzyy,xdwbh,xxzzwbm,xrzyy,lrr,lrsj,lrbm,bz,sqrq,clzt ";
	ls_sql+=" from  rs_ecrzsqd";
	ls_sql+=" where  (sqxh='"+wheresqxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		ygbh=cf.fillNull(rs.getString("ygbh"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		xb=cf.fillNull(rs.getString("xb"));
		yfgsbh=cf.fillNull(rs.getString("yfgsbh"));
		ydwbh=cf.fillNull(rs.getString("ydwbh"));
		yxzzwbm=cf.fillNull(rs.getString("yxzzwbm"));
		yrzsj=cf.fillNull(rs.getDate("yrzsj"));
		ylzrq=cf.fillNull(rs.getDate("ylzrq"));
		ylzyy=cf.fillNull(rs.getString("ylzyy"));
		xdwbh=cf.fillNull(rs.getString("xdwbh"));
		xxzzwbm=cf.fillNull(rs.getString("xxzzwbm"));
		xrzyy=cf.fillNull(rs.getString("xrzyy"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
		sqrq=cf.fillNull(rs.getDate("sqrq"));
		clzt=cf.fillNull(rs.getString("clzt"));
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
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditRs_ecrzsqd.jsp" name="editform">
  <div align="center">修改申请（申请序号：<%=wheresqxh%>）</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">申报公司</font></td>
      <td width="32%"> 
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh);
%> 
        </select>
      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">员工序号</font></td>
      <td width="32%"> 
        <input type="text" name="ygbh" size="20" maxlength="8"  value="<%=ygbh%>" readonly>
      </td>
      <td align="right" width="18%"><font color="#0000CC">员工名称</font></td>
      <td width="32%"> 
        <input type="text" name="yhmc" size="20" maxlength="50"  value="<%=yhmc%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">性别</font></td>
      <td width="32%"><%
	cf.radioToken(out, "xb","M+男&W+女",xb,true);
%> </td>
      <td align="right" width="18%"><font color="#0000CC">原分公司</font></td>
      <td width="32%"> 
        <select name="yfgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+yfgsbh+"'",yfgsbh);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">原部门</font></td>
      <td width="32%"> 
        <select name="ydwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ydwbh+"'",ydwbh);
%> 
        </select>
      </td>
      <td align="right" width="18%"><font color="#0000CC">原职位</font></td>
      <td width="32%"> 
        <select name="yxzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm where xzzwmc='"+yxzzwbm+"'","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">上次入职日期</font></td>
      <td width="32%"> 
        <input type="text" name="yrzsj" size="20" maxlength="10"  value="<%=yrzsj%>" readonly>
      </td>
      <td align="right" width="18%"><font color="#0000CC">离职日期</font></td>
      <td width="32%"> 
        <input type="text" name="ylzrq" size="20" maxlength="10"  value="<%=ylzrq%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">离职原因</font></td>
      <td colspan="3"> 
        <textarea name="ylzyy" cols="73" rows="3"><%=ylzyy%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="4" height="23">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%"><font color="#CC0000">*</font>处理状态</td>
      <td width="32%">
        <select name="clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
<%
	cf.selectToken(out,"00+不需审批&01+等待审批",clzt);
%> 
        </select>
      </td>
      <td align="right" rowspan="4"><font color="#CC0000">*</font>选择审批流程</td>
      <td rowspan="4"><%
	cf.mutilCheckedItem(out,"select ztbm,ztmc from rs_ztbm where ztlx='06' and ztbm not in('0698','0699') order by ztbm","ztbm","select rs_ecrzsqsplc.ztbm,ztmc from rs_ztbm,rs_ecrzsqsplc where rs_ztbm.ztbm=rs_ecrzsqsplc.ztbm and rs_ecrzsqsplc.sqxh='"+wheresqxh+"'  order by rs_ecrzsqsplc.ztbm","2");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>申请二次入职部门</td>
      <td width="32%"> 
        <select name="xdwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and cxbz='N' and ssfgs='"+fgsbh+"' order by ssfgs,dwlx,dwbh",xdwbh);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>申请二次入职职位</td>
      <td width="32%"> 
        <select name="xxzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc",xxzzwbm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>申请日期</td>
      <td width="32%"> 
        <input type="text" name="sqrq" size="20" maxlength="10"  value="<%=sqrq%>" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">二次入职原因</td>
      <td colspan="3"> 
        <textarea name="xrzyy" cols="73" rows="3"><%=xrzyy%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">录入人</font></td>
      <td width="32%"> 
        <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>
      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">录入时间</font></td>
      <td width="32%"> 
        <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">录入部门</font></td>
      <td width="32%"> 
        <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm);
%> 
        </select>
      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="73" rows="3"><%=bz%></textarea>
      </td>
    </tr>
    <tr> 
      <td colspan="4" > 
        <div align="center"> 
          <input type="hidden" name="wheresqxh"  value="<%=wheresqxh%>" >
          <input type="button"  value="保存" onClick="f_do(editform)">
          <input type="reset"  value="重输">
        </div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.clzt)=="") {
		alert("请输入[处理状态]！");
		FormName.clzt.focus();
		return false;
	}

	if (FormName.clzt.value=="01")
	{
		if(	!radioChecked(FormName.ztbm)) {
			alert("请选择[审批流程]！");
			FormName.ztbm[0].focus();
			return false;
		}
	}
	else{
		if(	radioChecked(FormName.ztbm)) {
			alert("不需审批，不能选择[审批流程]！");
			FormName.ztbm[0].focus();
			return false;
		}
	}

	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[申报公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(!(isNumber(FormName.ygbh, "员工序号"))) {
		return false;
	}
	if(!(isDatetime(FormName.yrzsj, "上次入职日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.ylzrq, "离职日期"))) {
		return false;
	}
	if(	javaTrim(FormName.xdwbh)=="") {
		alert("请选择[申请二次入职部门]！");
		FormName.xdwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xxzzwbm)=="") {
		alert("请选择[申请二次入职职位]！");
		FormName.xxzzwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xrzyy)=="") {
		alert("请输入[二次入职原因]！");
		FormName.xrzyy.focus();
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
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请选择[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}
	if(	javaTrim(FormName.sqrq)=="") {
		alert("请输入[申请日期]！");
		FormName.sqrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.sqrq, "申请日期"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
