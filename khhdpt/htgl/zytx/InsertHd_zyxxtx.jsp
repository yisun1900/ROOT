<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
	String yhmc=(String)session.getAttribute("yhmc");
	String lrbm=(String)session.getAttribute("dwbh");
%>

<%

String khxm=null;
String fwdz=null;
String lxfs=null;

String dwbh=null;
String zjxm=null;
String sgd=null;
String sjs=null;
String hth=null;
String sgbz=null;
String sjkgrq=null;
String sjjgrq=null;
String fgsbh=null;


String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

String txxh=null;


try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select khxm,fwdz,lxfs,dwbh,sjs,sgd,zjxm,hth,sjkgrq,sjjgrq,sgbz,fgsbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
//	out.println(ls_sql);
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		fgsbh=rs.getString("fgsbh");
	}
	rs.close();

	int count=0;
	ls_sql="select NVL(max(substr(txxh,8,3)),0)";
	ls_sql+=" from  hd_zyxxtx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();

	txxh=khbh+cf.addZero(count+1,3);

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertHd_zyxxtx.jsp" name="insertform" target="_blank">
<div align="center">录入重要提醒（提醒序号：<%=txxh%>）</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="17%"> 
        <div align="right"><font color="#0000CC">客户编号</font></div>
      </td>
      <td width="33%"> <%=khbh%> </td>
      <td width="18%"> 
        <div align="right"><font color="#0000CC">合同号</font></div>
      </td>
      <td width="32%"> <%=hth%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%"> 
        <div align="right"><font color="#0000CC">客户姓名</font></div>
      </td>
      <td width="33%"> <%=khxm%> </td>
      <td width="18%"> 
        <div align="right"><font color="#0000CC">签约店面</font></div>
      </td>
      <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%" align="right"><font color="#0000CC">房屋地址</font></td>
      <td colspan="3"> <%=fwdz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%"> 
        <div align="right"><font color="#0000CC">设计师</font></div>
      </td>
      <td width="33%"> <%=sjs%> </td>
      <td width="18%"> 
        <div align="right"><font color="#0000CC">质检员</font></div>
      </td>
      <td width="32%"> <%=zjxm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%"> 
        <div align="right"><font color="#0000CC">施工队</font></div>
      </td>
      <td width="33%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
      <td width="18%"> 
        <div align="right"><font color="#0000CC">施工班组</font></div>
      </td>
      <td width="32%"> <%=sgbz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font>提醒标题</td>
      <td colspan="3"> 
        <input type="text" name="txbt" value="" size="75" maxlength="200" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font>提醒内容</td>
      <td colspan="3"> 
        <textarea name="txnr" cols="74" rows="7"></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font>提醒分类</td>
      <td width="33%"> 
        <select name="txfl" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <option value="1">交款提醒</option>
          <option value="2">工地验收提醒</option>
          <option value="3">结算提醒</option>
          <option value="4">集成产品提醒</option>
          <option value="9">其它提醒</option>
        </select>
      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font>客户是否可以留言</td>
      <td width="32%"> 
        <input type="radio" name="sfyxkhly"  value="N">
        不可以 
        <input type="radio" name="sfyxkhly"  value="Y">
        可以</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">录入人</font></td>
      <td width="33%"> 
        <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">录入时间</font></td>
      <td width="32%">
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">录入部门</font></td>
      <td width="33%"> 
        <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%> 
        </select>
      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font>提醒等级</td>
      <td width="32%">
        <input type="radio" name="txdj" value="1">一般
        <input type="radio" name="txdj" value="2">重要
        <input type="radio" name="txdj" value="3">特别重要
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="74" rows="3"></textarea>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="hidden" name="txxh" value="<%=txxh%>" >
        <input type="hidden" name="khbh" value="<%=khbh%>" >
        <input type="button"  value="存盘" onClick="f_do(insertform)" name="bc">
        <input type="reset"  value="重输" name="reset">
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
	if(	javaTrim(FormName.txxh)=="") {
		alert("请输入[提醒序号]！");
		FormName.txxh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.txbt)=="") {
		alert("请输入[提醒标题]！");
		FormName.txbt.focus();
		return false;
	}
	if(	javaTrim(FormName.txnr)=="") {
		alert("请输入[提醒内容]！");
		FormName.txnr.focus();
		return false;
	}
	if(	javaTrim(FormName.txfl)=="") {
		alert("请选择[提醒分类]！");
		FormName.txfl.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyxkhly)) {
		alert("请选择[客户是否可以留言]！");
		FormName.sfyxkhly[0].focus();
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
	if(	!radioChecked(FormName.txdj)) {
		alert("请选择[提醒等级]！");
		FormName.txdj[0].focus();
		return false;
	}

	FormName.submit();
	FormName.bc.disabled=true;
	return true;
}
//-->
</SCRIPT>
