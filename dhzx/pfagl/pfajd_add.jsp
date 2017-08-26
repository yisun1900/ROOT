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
String zwbm=(String)session.getAttribute("zwbm");
String lrbm=(String)session.getAttribute("dwbh");

String pfajlh=request.getParameter("pfajlh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps2=null;
//ResultSet rs=null;
String ls_sql=null;
String pfalxmc=null;
String pfanr=null;
java.util.Date jhsj=null;
String jhry=null;
String khxm=null;
String khbh=null;
try {
	conn=cf.getConnection();

	int xh=0;
	ls_sql="select crm_pfagcgl.khbh,khxm,pfajlh,pfalxmc,pfanr,jhsj,jhry";
	ls_sql+=" from  crm_pfagcgl,dm_pfalxbm,crm_zxkhxx ";
	ls_sql+=" where pfajlh='"+pfajlh+"' ";
	ls_sql+=" and crm_pfagcgl.pfalxbm=dm_pfalxbm.pfalxbm ";
	ls_sql+=" and  crm_pfagcgl.khbh=crm_zxkhxx.khbh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		pfalxmc=rs.getString("pfalxmc");
		pfanr=rs.getString("pfanr");
		jhsj=rs.getDate("jhsj");
		jhry=rs.getString("jhry");
		khxm=rs.getString("khxm");
		khbh=rs.getString("khbh");
	}
	ps.close();
	rs.close();

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
<form name="form1" action="pfajd_save.jsp" method="post">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="2" bgcolor="#CCCCCC" style="FONT-SIZE:12">
  <tr>
    <td colspan="4" bgcolor="#cccccc"><div align="center" class="STYLE1">碰方案计划录入</div></td>
  </tr>
  <tr>
   
    <td bgcolor="#FFFFFF" height=25><div align="right">客户编号</div></td>
    <td bgcolor="#FFFFFF"><%=khbh%></td>

	 <td width="30%" bgcolor="#FFFFFF"><div align="right">客户姓名       </div></td>
    <td width="30%" bgcolor="#FFFFFF"><%=khxm%></td>
   </tr>
  <tr>
    <td height="20" width="20%" bgcolor="#FFFFFF"><div align="right">碰方案类型       </div></td>
    <td height="20" width="30%" bgcolor="#FFFFFF"> <%=pfalxmc%></td>
   
  
 
    <td height="20" bgcolor="#FFFFFF"><div align="right">计划碰方案时间</div></td>
    <td height="20" bgcolor="#FFFFFF"><%=jhsj%></td>
   </tr>
   <tr>
    <td height="20" bgcolor="#FFFFFF"><div align="right">计划参加人员</div></td>
    <td height="20" bgcolor="#FFFFFF" colspan=3><%=jhry%></td>
  </tr>
 
  <tr>
	 <td height="20" width="20%" bgcolor="#FFFFFF"><div align="right">碰方案内容</div></td>
    <td width="30%" bgcolor="#FFFFFF" colspan=3> <%=pfanr%></td> 
	</tr>
  <tr>
    <td height="20" bgcolor="#FFFFFF"><div align="right"><font color="#FF0033">*</font>实际参加人员</div></td>
    <td bgcolor="#FFFFFF"><input type="text" name="sjry"></td>
    <td bgcolor="#FFFFFF"><div align="right"><font color="#FF0033">*</font>实际碰方案时间</div></td>
    <td bgcolor="#FFFFFF"><input type="text" name="sjsj" onDblClick="JSCalendar(this)"></td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>碰方案结果</td>
    <td colspan=3 bgcolor="#FFFFFF"><input type="radio" name="radiobutton" value="radiobutton">
      方案通过
        <input type="radio" name="radiobutton" value="radiobutton">
        局部修改
        <input type="radio" name="radiobutton" value="radiobutton">
全面修改
<input type="radio" name="radiobutton" value="radiobutton">
客户不满</td>
    </tr>
  
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">满意点</td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
    <td bgcolor="#FFFFFF">不满意点</td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">后期工作计划</td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
    <td bgcolor="#FFFFFF">下次预约时间</td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">客户评价</td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">措施与应对</td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
    <td bgcolor="#FFFFFF">通过后下一步</td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">处理时限报警</td>
    <td colspan=3 bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">设计取向描述</td>
    <td colspan=3 bgcolor="#FFFFFF"><textarea name="textarea" cols="71" rows="3" style="width:70%" ></textarea></td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">客户消费能力详述</td>
    <td colspan=3 bgcolor="#FFFFFF"><textarea name="textarea2" cols="71" rows="3" style="width:70%" ></textarea></td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">设计关注点描述</td>
    <td colspan=3 bgcolor="#FFFFFF"><textarea name="textarea3" cols="71" rows="3" style="width:70%" ></textarea></td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">不同房间设计、功能描述</td>
    <td colspan=3 bgcolor="#FFFFFF"><textarea name="textarea4" cols="71" rows="3" style="width:70%" ></textarea></td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">意向主材品牌</td>
    <td colspan=3 bgcolor="#FFFFFF"><textarea name="textarea5" cols="71" rows="3" style="width:70%" ></textarea></td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">客户对户型是否满意</td>
    <td colspan=3 bgcolor="#FFFFFF"><input type="radio" name="radiobutton" value="radiobutton">
满意
  <input type="radio" name="radiobutton" value="radiobutton">
  不满意</td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">不满意描述</td>
    <td colspan=3 bgcolor="#FFFFFF"><textarea name="textarea6" cols="71" rows="3" style="width:70%" ></textarea></td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">备注</td>
    <td colspan=3 bgcolor="#FFFFFF"><textarea name="gc" cols="71" rows="2" style="width:70%" ></textarea></td>
  </tr>
	
    <td height="20" colspan="4" bgcolor="#FFFFFF">      <div align="center">
        <input type="button" name="Submit" value="存盘" onClick="f_do(form1)"/>
		 <input type="hidden" name="pfajlh" value="<%=pfajlh%>" />
      </div></td></tr>
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
	
	if(javaTrim(FormName.sjry)=="")
	{
	alert("实际参加人员不能为空");
	return flase();
	}
	if(javaTrim(FormName.sjsj)=="")
	{
	alert("实际碰方案时间不能为空");
	return flase();
	}

	if(javaTrim(FormName.jd)=="")
	{
	alert("进度不能为空");
	return flase();
	}
	if(javaTrim(FormName.gc)=="")
	{
	alert("碰方案内容不能为空");
	return flase();
	}
	
	
	if(!(isDatetime(FormName.sjsj, "录入时间"))) {
		return false;
	}
	
	FormName.submit();
	return true;
	
}

</SCRIPT>
