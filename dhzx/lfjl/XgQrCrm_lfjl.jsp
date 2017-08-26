<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>维护数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE2 {color: #0000CC}
.STYLE1 {
	font-size: 16px;
	font-weight: bold;
	font-family: "宋体";
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String zwbm=(String)session.getAttribute("zwbm");
String dwbh=(String)session.getAttribute("dwbh");

String khxm=null;
String fwdz=null;
String sjs=null;
String khbh=null;

String lfjlh=request.getParameter("lfjlh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

String ls_sql=null;
String lflxbm=null;
String smmb=null;
java.util.Date jhsmsj=null;
String jhsmry=null;
String xfxqr=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bzsm=null;
String qrjg=null;
String qrsm=null;
try {
	conn=cf.getConnection();

	int xh=0;
	ls_sql="select lfjlh,crm_lfjl.khbh,lflxbm,smmb,jhsmsj,jhsmry,xfxqr,lrr,lrsj,lrbm,bzsm,qrjg,qrsm";
	ls_sql+=" from  crm_lfjl ";
	ls_sql+=" where lfjlh='"+lfjlh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lflxbm=rs.getString("lflxbm");
		smmb=rs.getString("smmb");
		jhsmsj=rs.getDate("jhsmsj");
		jhsmry=rs.getString("jhsmry");
		khbh=rs.getString("khbh");
		xfxqr=rs.getString("xfxqr");
		lrr=rs.getString("lrr");
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=rs.getString("lrbm");
		bzsm=cf.fillNull(rs.getString("bzsm"));
		qrjg=cf.fillNull(rs.getString("qrjg"));
		qrsm=cf.fillNull(rs.getString("qrsm"));
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,fwdz,sjs";
	ls_sql+=" from  crm_zxkhxx ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		sjs=rs.getString("sjs");
	}
	rs.close();
	ps.close();
%>


<body>
<form name="form1" action="SaveXgQrCrm_lfjl.jsp" method="post">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="2" bgcolor="#CCCCCC" style="FONT-SIZE:12">
  <tr>
    <td colspan="4" bgcolor="#cccccc"><div align="center" class="STYLE1">量房计划确认－修改</div></td>
  </tr>
  <tr height="21">
    <td align="right" bgcolor="#FFFFCC" ><span class="STYLE2">客户编号</span></td>
    <td width="30%" bgcolor="#FFFFCC"><%=khbh%></td>
    <td align="right" bgcolor="#FFFFCC"><span class="STYLE2">客户姓名</span> </td>
    <td bgcolor="#FFFFCC"><%=khxm%></td>
  </tr>
  <tr height="21">
    <td align="right" bgcolor="#FFFFCC"><span class="STYLE2">房屋地址</span></td>
    <td bgcolor="#FFFFCC"><%=fwdz%></td>
    <td align="right" bgcolor="#FFFFCC"><span class="STYLE2">设计师</span></td>
    <td bgcolor="#FFFFCC"><%=sjs%></td>
  </tr>
  <tr height="21">
    <td align="right" bgcolor="#FFFFCC"><span class="STYLE2">计划上门时间</span></td>
    <td bgcolor="#FFFFCC"><%=jhsmsj%></td>
    <td width="19%" align="right" bgcolor="#FFFFCC"><span class="STYLE2">量房类型       </span></td>
    <td width="32%" bgcolor="#FFFFCC">  
	<option></option>
	  <%
		cf.selectItem(out,"select lflxbm,lflxmc from dm_lflxbm ",lflxbm,true);
	  %>    </td>
   </tr>
  <tr height="21">
    <td align="right" bgcolor="#FFFFCC"><span class="STYLE2">计划上门人员</span></td>
    <td colspan="3" bgcolor="#FFFFCC" ><%=jhsmry%></td>
    </tr>
 
  <tr height="21">
	 <td width="19%" align="right" bgcolor="#FFFFCC"><span class="STYLE2">上门目标</span></td>
    <td bgcolor="#FFFFCC" colspan=3><%=smmb%></td>
  </tr>
  <tr bgcolor="#FFFFFF" height="21">
    <td align="right" bgcolor="#FFFFCC"><span class="STYLE2">是否需相关人员确认</span></td>
    <td bgcolor="#FFFFCC"><%
					cf.radioToken(out,"Y+需确认&N+不需确认",xfxqr,true);
			  %></td>
    <td align="right" bgcolor="#FFFFCC">&nbsp;</td>
    <td bgcolor="#FFFFCC">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF" height="21">
    <td align="right" bgcolor="#FFFFCC"><span class="STYLE2 STYLE2">录入人</span></td>
    <td bgcolor="#FFFFCC"><%=lrr%></td>
    <td align="right" bgcolor="#FFFFCC"><span class="STYLE2">录入时间</span></td>
    <td bgcolor="#FFFFCC"><%=lrsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF" height="21">
    <td align="right" bgcolor="#FFFFCC"><span class="STYLE2 STYLE2">录入部门</span></td>
    <td bgcolor="#FFFFCC">
      <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm,true);
%>     </td>
    <td align="right" bgcolor="#FFFFCC">&nbsp;</td>
    <td bgcolor="#FFFFCC">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF" height="21">
    <td align="right" bgcolor="#FFFFCC"><span class="STYLE2">备注</span></td>
    <td colspan="3" bgcolor="#FFFFCC"><%=bzsm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0033">*</font>相关人员确认结果</td>
    <td><%
					cf.radioToken(out, "qrjg","Y+同意&N+不同意",qrjg);
			  %></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0033">*</font><span class="STYLE2">确认人</span></td>
    <td><input type="text" name="qrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
    <td align="right"><font color="#FF0033">*</font><span class="STYLE2">确认时间</span></td>
    <td><input type="text" name="qrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
  </tr>
  <tr>
    <td align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>确认说明</td>
    <td bgcolor="#FFFFFF" colspan=3><textarea name="qrsm" cols="70" rows="6"><%=qrsm%></textarea></td>
  </tr>
<tr>	
    <td colspan="4" align="center"> 
        <input type="button" name="Submit" value="存盘" onClick="f_do(form1)"/>
		 <input type="reset" name="Submit2" value="重置">
		 <input type="hidden" name="lfjlh" value="<%=lfjlh%>" />      </td>
</tr>
</table>
</form>
</body>
</html>
<%
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >

function f_do(FormName)//参数FormName:Form的名称
{
	if(	!radioChecked(FormName.qrjg)) {
		alert("请选择[相关人员确认结果]！");
		FormName.qrjg[0].focus();
		return false;
	}
	
	if(	javaTrim(FormName.qrr)=="") {
		alert("请输入[确认人]！");
		FormName.qrr.focus();
		return false;
	}
	if(	javaTrim(FormName.qrsj)=="") {
		alert("请输入[确认时间]！");
		FormName.qrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qrsj, "确认时间"))) {
		return false;
	}
	if(	javaTrim(FormName.qrsm)=="") {
		alert("请选择[确认说明]！");
		FormName.qrsm.focus();
		return false;
	}
	
	FormName.submit();
	return true;
	
}

</SCRIPT>
