<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sqxh=null;
String xm=null;
String zw=null;
String sqlrr=null;
String dh=null;
String yx=null;
String bz=null;
String dwbh=null;
String sqrq=null;
String yqjfrq=null;
String yqsl=null;
String sfywc=null;
String cz=null;
String ygbh=null;
String mpbb=null;
String wheresqxh=cf.GB2Uni(request.getParameter("sqxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select sqxh,xm,zw,sqlrr,dh,yx,bz,dwbh,sqrq ,yqjfrq,yqsl,sfywc,cz,ygbh,mpbb";
	ls_sql+=" from  xz_mpyzsq";
	ls_sql+=" where  (sqxh='"+wheresqxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sqxh=cf.fillNull(rs.getString("sqxh"));
		xm=cf.fillNull(rs.getString("xm"));
		zw=cf.fillNull(rs.getString("zw"));
		sqlrr=cf.fillNull(rs.getString("sqlrr"));
		dh=cf.fillNull(rs.getString("dh"));
		yx=cf.fillNull(rs.getString("yx"));
		bz=cf.fillNull(rs.getString("bz"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		yqsl=cf.fillNull(rs.getString("yqsl"));
		sfywc=cf.fillNull(rs.getString("sfywc"));
		cz=cf.fillNull(rs.getString("cz"));
		ygbh=cf.fillNull(rs.getString("ygbh"));
		mpbb=cf.fillNull(rs.getString("mpbb"));

		yqjfrq=cf.fillNull(rs.getDate("yqjfrq"));
		sqrq=cf.fillNull(rs.getDate("sqrq"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" >
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">申请序号</td>
	<td  width="7%">是否完成</td>
	<td  width="7%">姓名</td>
	<td  width="7%">名片版本</td>
	<td  width="7%">要求数量</td>
	<td  width="10%">要求交付日期</td>
	<td  width="7%">完成数量</td>
	<td  width="8%">完成时间</td>
	<td  width="10%">申请日期</td>
	<td  width="7%">录入人</td>
	<td  width="21%">备注</td>
</tr>
	<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT sqxh,DECODE(xz_mpyzsq.sfywc,'Y','是','N','否') as sfywc,xm,mpbb,yqsl,yqjfrq,wcsl,wcsj,sqrq,sqlrr,bz    ";
	ls_sql+=" FROM xz_mpyzsq  ";
    ls_sql+=" where ygbh='"+ygbh+"'";
	ls_sql+=" order by  xz_mpyzsq.yqjfrq ";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
	pageObj.alignStr[9]="align='left'";

	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%> 
</table>
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请修改名片印制申请（申请序号：<%=wheresqxh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditXz_mpyzsq.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000FF">申请部门</font></td>
              <td width="33%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh);
%> 
                </select>
              </td>
              <td width="18%" align="right"><font color="#0000FF">姓名</font></td>
              <td width="32%"> 
                <input type="text" name="xm" size="20" maxlength="20"  value="<%=xm%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000FF">职务</font></div>
              </td>
              <td width="33%"> 
                <input type="text" name="zw" size="20" maxlength="20"  value="<%=zw%>" readonly>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0000FF">电话</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="dh" size="20" maxlength="30"  value="<%=dh%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000FF">申请日期</font></td>
              <td width="33%"> 
                <input type="text" name="sqrq" size="20" maxlength="10"  value="<%=sqrq%>" readonly>
              </td>
              <td width="18%" align="right"><font color="#0000FF">申请录入人</font></td>
              <td width="32%"> 
                <input type="text" name="sqlrr" size="20" maxlength="30"  value="<%=sqlrr%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">传真</td>
              <td width="33%"> 
                <input type="text" name="cz" size="20" maxlength="30" value="<%=cz%>" >
              </td>
              <td width="18%" align="right">邮箱</td>
              <td width="32%"> 
                <input type="text" name="yx" size="20" maxlength="30"  value="<%=yx%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">名片版本</td>
              <td width="33%"> 
                <select name="mpbb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mpbb c1,mpbb c2 from xz_mpbb ",mpbb);
%> 
                </select>
              </td>
              <td width="18%">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">要求数量</div>
              </td>
              <td width="33%"> 
                <input type="text" name="yqsl" size="20" maxlength="10"  value="<%=yqsl%>" >
              </td>
              <td width="18%"> 
                <div align="right">要求交付日期</div>
              </td>
              <td width="32%"> 
                <input type="text" name="yqjfrq" value="<%=yqjfrq%>"  size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">备注</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="67" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4" > 
                <input type="hidden" name="wheresqxh"  value="<%=wheresqxh%>" >
                <input type="button"  value="保存" onClick="f_do(editform)">
                <input type="reset"  value="重输">
              </td>
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
	if(	javaTrim(FormName.xm)=="") {
		alert("请输入[姓名]！");
		FormName.xm.focus();
		return false;
	}
 	if(	javaTrim(FormName.yx)=="") {
		alert("请输入[邮箱]！");
		FormName.yx.focus();
		return false;
	}
	if(!(isEmail(FormName.yx, "邮箱"))) {
		return false;
	}

	if(	javaTrim(FormName.zw)=="") {
		alert("请输入[职务]！");
		FormName.zw.focus();
		return false;
	}
	if(	javaTrim(FormName.sqlrr)=="") {
		alert("请输入[手机]！");
		FormName.sqlrr.focus();
		return false;
	}
	if(	javaTrim(FormName.cz)=="") {
		alert("请输入[传真]！");
		FormName.cz.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[申请部门]！");
		FormName.dwbh.focus();
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
	if(!(isDatetime(FormName.yqjfrq, "要求交付日期"))) {
		return false;
	}
	if(	javaTrim(FormName.yqsl)=="") {
		alert("请选择[要求数量]！");
		FormName.yqsl.focus();
		return false;
	}
	if(!(isInt(FormName.yqsl, "要求数量"))) {
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>


