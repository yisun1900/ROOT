<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE2 {color: #0000CC}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=request.getParameter("khbh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

String ls_sql=null;
String khxm=null;
String fwdz=null;
String sjs=null;

String lfjlh=null;

try {
	conn=cf.getConnection();

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

	int count=0;
	ls_sql="select NVL(max(substr(lfjlh,8,2)),0)";
	ls_sql+=" from  crm_lfjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	lfjlh=khbh+cf.addZero(count+1,2);
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>

<style type="text/css">
<!--
.STYLE1 {
	font-size: 16px;
	font-weight: bold;
	font-family: "宋体";
}
-->
</style>
<body>
<form name="form1" action="SaveInsertCrm_lfjl.jsp" method="post">


<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">量房记录号</td>
	<td  width="4%">状态</td>
	<td  width="4%">是否需确认</td>
	<td  width="4%">确认结果</td>
	<td  width="4%">量房结果</td>
	<td  width="7%">量房类型</td>
	<td  width="26%">上门目标</td>
	<td  width="5%">计划上门时间</td>
	<td  width="9%">计划上门人员</td>
	<td  width="5%">确认人</td>
	<td  width="5%">确认时间</td>
	<td  width="5%">实际上门时间</td>
	<td  width="9%">实际上门人员</td>
	<td  width="4%">录入人</td>
	<td  width="5%">录入时间</td>
</tr>
</tr>
	<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT crm_lfjl.lfjlh, DECODE(crm_lfjl.zt,'1','录入计划','2','计划确认','3','计划取消','4','上门量房'), DECODE(crm_lfjl.xfxqr,'Y','需确认','N','不需确认'), DECODE(crm_lfjl.qrjg,'Y','同意','N','不同意'), DECODE(crm_lfjl.lfjg,'Y','完成','N','未完成') ";
	ls_sql+=" ,lflxmc,crm_lfjl.smmb,crm_lfjl.jhsmsj,crm_lfjl.jhsmry,crm_lfjl.qrr,crm_lfjl.qrsj,crm_lfjl.sjsmsj,crm_lfjl.sjsmry,crm_lfjl.lrr,crm_lfjl.lrsj";
	ls_sql+=" FROM crm_zxkhxx,crm_lfjl,dm_lflxbm";
    ls_sql+=" where crm_lfjl.khbh=crm_zxkhxx.khbh(+) and crm_lfjl.lflxbm=dm_lflxbm.lflxbm(+) ";
	ls_sql+=" and crm_lfjl.khbh='"+khbh+"'  ";
	ls_sql+=" order by crm_lfjl.lfjlh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
	pageObj.alignStr[6]="align='left'";


	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();

%> 
</table>


<table width="100%" border="0" align="center" cellpadding="0" cellspacing="2" bgcolor="#CCCCCC" style="FONT-SIZE:12">
  <tr>
    <td colspan="4" bgcolor="#cccccc"><div align="center" class="STYLE1">量房计划录入（量房记录号：<%=lfjlh%>）</div></td>
  </tr>
   <tr>
   
 
    <td height="25" align="right" bgcolor="#FFFFFF" ><span class="STYLE2">客户编号</span></td>
    <td width="31%" bgcolor="#FFFFFF"><%=khbh%></td>

	 <td width="19%" align="right" bgcolor="#FFFFFF"><span class="STYLE2">客户姓名</span> </td>
    <td width="31%" bgcolor="#FFFFFF"><%=khxm%></td>
   </tr>
   <tr>
     <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE2">房屋地址</span></td>
     <td bgcolor="#FFFFFF"><%=fwdz%></td>
     <td align="right" bgcolor="#FFFFFF"><span class="STYLE2">设计师</span></td>
     <td bgcolor="#FFFFFF"><%=sjs%></td>
   </tr>
   <tr>
   
   
  
 
    <td align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>计划上门时间</td>
    <td bgcolor="#FFFFFF"><input name="jhsmsj" type="text" onDblClick="JSCalendar(this)" size="20" maxlength="10"></td>

	 <td width="19%" align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>量房类型       </td>
    <td width="31%" bgcolor="#FFFFFF">      <select name="lflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
	<option></option>
	  <%
		cf.selectItem(out,"select lflxbm,lflxmc from dm_lflxbm order by lflxbm","");
	%> 
    </select></td>
   </tr>
   <tr>
    <td align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>计划上门人员</td>
    <td bgcolor="#FFFFFF" colspan=3><input name="jhsmry" type="text" value="" size="71" maxlength="50"></td>
  </tr>
 
  <tr>
	 <td width="19%" align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>上门目标</td>
    <td bgcolor="#FFFFFF" colspan=3> <textarea name="smmb" cols="70" rows="6" ></textarea></td> 
	</tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0033">*</font>是否需相关人员确认</td>
    <td><%
					cf.radioToken(out, "xfxqr","Y+需确认&N+不需确认","");
			  %></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0033">*</font><span class="STYLE2">录入人</span></td>
    <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
    <td align="right"><font color="#FF0033">*</font><span class="STYLE2">录入时间</span></td>
    <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font><span class="STYLE2">录入部门</span></td>
    <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
      </select>    </td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">备注</td>
    <td colspan="3"><textarea name="bzsm" cols="75" rows="2"></textarea>    </td>
  </tr>
	
    <td colspan="4" align="center">
        <input type="button" name="Submit" value="存盘" onClick="f_do(form1)">
	  <input type="hidden" name="khbh" value="<%=khbh%>" >
	  <input type="hidden" name="lfjlh" value="<%=lfjlh%>" >
	  </td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >

function f_do(FormName)//参数FormName:Form的名称
{
	if(javaTrim(FormName.lflxbm)=="")
	{
		alert("量房类型不能为空");
		FormName.lflxbm.focus();
		return flase();
	}
	if(javaTrim(FormName.jhsmry)=="")
	{
		alert("计划上门人员不能为空");
		FormName.jhsmry.focus();
		return flase();
	}
	
	if(javaTrim(FormName.smmb)=="")
	{
		alert("上门目标不能为空");
		FormName.smmb.focus();
		return flase();
	}
	
	if(javaTrim(FormName.jhsmsj)=="")
	{
		alert("计划上门时间不能为空");
		FormName.jhsmsj.focus();
		return flase();
	}

	if(	!radioChecked(FormName.xfxqr)) {
		alert("请选择[是否需相关人员确认]！");
		FormName.xfxqr[0].focus();
		return false;
	}
	
	if(!(isDatetime(FormName.jhsmsj, "录入时间"))) {
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
	FormName.submit();
	return true;
	
}

</SCRIPT>
