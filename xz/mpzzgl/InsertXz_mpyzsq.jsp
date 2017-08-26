<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String dwbh=null;
String zw=null;
String dh=null;
String bgdh=null;
String yjdz=null;
String xm=null;
String ssfgs=null;
String ygbh=null;
ygbh=cf.GB2Uni(request.getParameter("ygbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

int count=0;

try {
	conn=cf.getConnection();
	ls_sql="select sq_yhxx.ssfgs,sq_dwxx.dwbh as dwbh,dm_zwbm.zwmc as zwmc,sq_yhxx.dh as dh,sq_yhxx.bgdh,sq_yhxx.email as email,sq_yhxx.yhmc as yhmc";
	ls_sql+=" from sq_yhxx,sq_dwxx,dm_zwbm  ";
    ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh  and sq_yhxx.zwbm=dm_zwbm.zwbm(+)";
	ls_sql+=" and sq_yhxx.ygbh='"+ygbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		zw=cf.fillNull(rs.getString("zwmc"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dh=cf.fillNull(rs.getString("dh"));
		bgdh=cf.fillNull(rs.getString("bgdh"));
		yjdz=cf.fillNull(rs.getString("email"));
		xm=cf.fillNull(rs.getString("yhmc"));
	}
	rs.close();
	ps.close();

	ls_sql="select count(*)";
	ls_sql+=" from xz_mpyzsq";
    ls_sql+=" where ygbh='"+ygbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
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
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<%
if (count>0)
{
	%>
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
}
%> 
</table>
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">名片印制申请</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertXz_mpyzsq.jsp" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">申请部门</div>
              </td>
              <td width="31%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>
              </td>
              <td width="20%"> 
                <div align="right">姓名</div>
              </td>
              <td width="30%"> 
                <input type="text" name="xm" value="<%=xm%>" size="20" maxlength="20" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">职务</div>
              </td>
              <td width="31%"> 
                <input type="text" name="zw" value="<%=zw%>" size="20" maxlength="20" >
              </td>
              <td width="20%"> 
                <div align="right">邮箱</div>
              </td>
              <td width="30%"> 
                <input type="text" name="yx" value="<%=yjdz%>" size="20" maxlength="30" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">手机</div>
              </td>
              <td width="31%"> 
                <input type="text" name="dh" value="<%=dh%>" size="20" maxlength="50" >
              </td>
              <td width="20%"> 
                <div align="right">办公电话</div>
              </td>
              <td width="30%">
                <input type="text" name="bgdh" value="<%=bgdh%>" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">传真</td>
              <td width="31%"> 
                <input type="text" name="cz" size="20" maxlength="30" >
              </td>
              <td width="20%" align="right">名片版本</td>
              <td width="30%"> 
                <select name="mpbb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mpbb c1,mpbb c2 from xz_mpbb ","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">申请日期</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sqrq" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
              <td width="20%"> 
                <div align="right">申请录入人</div>
              </td>
              <td width="30%"> 
                <input type="text" name="sqlrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">要求数量（盒）</div>
              </td>
              <td width="31%"> 
                <input type="text" name="yqsl" value="" size="20" maxlength="15" >
              </td>
              <td width="20%"> 
                <div align="right">要求交付日期</div>
              </td>
              <td width="30%"> 
                <input type="text" name="yqjfrq" value="<%=cf.addDay(7)%>"  size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">备注</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="67" rows="3"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="ygbh" value="<%=ygbh%>">
                <input type="hidden" name="ssfgs" value="<%=ssfgs%>">
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
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
	if(	javaTrim(FormName.zw)=="") {
		alert("请输入[职务]！");
		FormName.zw.focus();
		return false;
	}
	if(	javaTrim(FormName.dh)=="") {
		alert("请输入[电话]！");
		FormName.dh.focus();
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
 	if(	javaTrim(FormName.yx)=="") {
		alert("请输入[邮箱]！");
		FormName.yx.focus();
		return false;
	}
   if(!(isEmail(FormName.yx, "邮箱"))) {
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


