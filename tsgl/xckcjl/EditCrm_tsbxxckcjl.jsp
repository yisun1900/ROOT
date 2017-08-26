<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String tsjlh=null;
String kcjlh=null;
String xcqk=null;
String xcclqk=null;
String kcr=null;
String kcsj=null;
String lrr=null;
String lrsj=null;
String bz=null;
String wherekcjlh=cf.GB2Uni(request.getParameter("kcjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select tsjlh,kcjlh,xcqk,xcclqk,kcr,kcsj,lrr,lrsj,bz ";
	ls_sql+=" from  crm_tsbxxckcjl";
	ls_sql+=" where  (kcjlh='"+wherekcjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		tsjlh=cf.fillNull(rs.getString("tsjlh"));
		kcjlh=cf.fillNull(rs.getString("kcjlh"));
		xcqk=cf.fillNull(rs.getString("xcqk"));
		xcclqk=cf.fillNull(rs.getString("xcclqk"));
		kcr=cf.fillNull(rs.getString("kcr"));
		kcsj=cf.fillNull(rs.getDate("kcsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
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
<form method="post" action="" name="editform" target="_blank">
<div align="center">
    <div align="center">投诉报修现场勘查记录（投诉记录号：<%=tsjlh%>）</div>
  </div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0033CC">投诉报修记录号</font></td>
      <td width="32%"> 
        <input type="text" name="tsjlh" size="20" maxlength="10"  value="<%=tsjlh%>" readonly>
      </td>
      <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0033CC">勘查记录号</font></td>
      <td width="32%"> 
        <input type="text" name="kcjlh" size="20" maxlength="11"  value="<%=kcjlh%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0000">*</font>现场情况</td>
      <td colspan="3"> 
        <textarea name="xcqk" cols="71" rows="5"><%=xcqk%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">现场处理情况</td>
      <td colspan="3"> 
        <textarea name="xcclqk" cols="71" rows="5"><%=xcclqk%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0000">*</font>勘查人</td>
      <td width="32%"> 
        <input type="text" name="kcr" size="20" maxlength="20"  value="<%=kcr%>" >
      </td>
      <td align="right" width="18%"><font color="#FF0000">*</font>勘查时间</td>
      <td width="32%"> 
        <input type="text" name="kcsj" size="20" maxlength="10"  value="<%=kcsj%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0033CC">录入人</font></td>
      <td width="32%"> 
        <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>
      </td>
      <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0033CC">录入时间</font></td>
      <td width="32%"> 
        <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="71" rows="2"><%=bz%></textarea>
      </td>
    </tr>
    <input type="hidden" name="wherekcjlh"  value="<%=wherekcjlh%>" >
    <tr> 
      <td colspan="4" > 
        <div align="center"> 
          <input type="button"  value="保存" onClick="f_do(editform)">
          <input type="button"  value="上传照片" onClick="f_lr(editform)" name="lr" >
          <input type="button"  value="查看照片" onClick="f_ck(editform)" name="ck" >
          <input type="reset"  value="重输">
        </div>
      </td>
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
	if(	javaTrim(FormName.tsjlh)=="") {
		alert("请输入[投诉报修记录号]！");
		FormName.tsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.kcjlh)=="") {
		alert("请输入[勘查记录号]！");
		FormName.kcjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.xcqk)=="") {
		alert("请输入[现场情况]！");
		FormName.xcqk.focus();
		return false;
	}
	if(	javaTrim(FormName.kcr)=="") {
		alert("请输入[勘查人]！");
		FormName.kcr.focus();
		return false;
	}
	if(	javaTrim(FormName.kcsj)=="") {
		alert("请输入[勘查时间]！");
		FormName.kcsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.kcsj, "勘查时间"))) {
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

	FormName.action="SaveEditCrm_tsbxxckcjl.jsp";
	FormName.submit();
	return true;
}

function f_lr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.kcjlh)=="") {
		alert("请输入[勘查记录号]！");
		FormName.kcjlh.focus();
		return false;
	}

	FormName.action="loadPhoto.jsp";
	FormName.submit();
	return true;
}

function f_ck(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.kcjlh)=="") {
		alert("请输入[勘查记录号]！");
		FormName.kcjlh.focus();
		return false;
	}

	FormName.action="viewPhoto.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
