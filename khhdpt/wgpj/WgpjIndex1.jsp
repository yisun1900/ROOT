<%@ page contentType="text/html;charset=GBK" %>
<% request.setCharacterEncoding("gb2312"); %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/khhdpt/checklogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>


<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<%
session.setAttribute("flag","N");
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");
String hfbm=(String)session.getAttribute("dwbh");
String gethth=(String)session.getAttribute("hth");
String khxm=null;
String hth=null;
String fwdz=null;
String lxfs=null;
String kgrq=null;
String sjkgrq=null;
String jgrq=null;
String sgbz=null;
String sgd=null;
String sgdmc=null;
String sjs=null;
String zjxm=null;
String bz=null;

String hflxbm=null;
String gcjdbm=null;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
String hfjlh=null;
String qye=null;
String zkl=null;
String yhyy=null;
String khlxmc=null;
String dwbh=null;
String dwmc=null;
String sjjgrq=null;
String sjwjrq=null;
double sfke=0;
int hfsl=0;
int cpsl=0;
String ssdw=null;
String khbh=null;
String sjsdh=null;
String zjdh=null;
String dzdh=null;
String bzdh=null;

int tssl=0;


try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	int count=0;
	//判断该客户是否完工或完结
	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where gcjdbm in ('4','5') and (hth='"+gethth+"')  ";
	rs =stmt.executeQuery(ls_sql);	
	//out.print(ls_sql);
	if (rs.next())
	{
		
		count=rs.getInt(1);
		
	}
	rs.close();

	if(count==0)
	{	
		%>

	<br>
<table width="100%" style="FONT-SIZE: 12px;border-collapse:collapse" >
	<TR><TD WIDTH="253"></TD><TD WIDTH="385"><form method="post" action="../khxx/zhuanym.jsp" name="editform" >
          
        <table width="96%" height="100" border="1" cellpadding="0" cellspacing="1" bordercolor="#999999"  style="FONT-SIZE: 12px;border-collapse:collapse" >
          <TR>
            <TD width="100%" height="27" bgcolor="#CCCCCC"><font size="2"><strong>【系统提示】</strong></font></TD>
          </TR>
		  <TR>
            <TD width="100%" height="51"><div align="center">对不起，您的工程还没有完工，不能进行此操作！</div></TD>
          </TR>
		  <TR>
            <TD width="100%" height="16" bgcolor="#CCCCCC">
<div align="center"> 
                <input type="submit"  value="确定">
                <input type="button"  value="返回" onClick="window.history.back()">
              </div></TD>
          </TR>
		  </TABLE>
		  </FORM></TD><TD WIDTH="339"></TD>
		  <TR>
</TABLE>


		<%
			return;

	}


	

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
<table width="100%"  style="FONT-SIZE: 12px;border-collapse:collapse" border="1" cellpadding="0" cellspacing="1" bordercolor="#999999" >
  <tr  bgcolor="#CCCCCC"> 
    <td height="22" colspan="4" align="right"> 
      <div align="left"><strong>【客户评价表】</strong></div></td>
  </tr>
  <form method="post" action="SaveInsertCRM_khxxPJ.jsp" name="insertform" >
    <tr bgcolor="#FFFFFF"> 
      <td width="12%" height="85" align="right" bgcolor="#EEEEEE">【设计师】</td>
      <td width="37%">设计方案： 
        <%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","sjfa","");
%>
        <br><br>
        后期服务： 
        <%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","hqfw","");
%>
        <br><br>
        交底清楚： 
        <%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","jdqk","");
%>
      </td>
      <td width="15%" align="right">设计师评价内容</td>
      <td width="36%"> <textarea name="sjshfnr" rows="3" cols="33" style="BORDER-RIGHT: #ffffff 1px groove; BORDER-TOP: #ffffff 1px groove; FONT-WEIGHT: normal; FONT-SIZE: 12px; BORDER-LEFT: #ffffff 1px groove; WIDTH: 260px; COLOR: #000000; BORDER-BOTTOM: #ffffff 1px groove; FONT-STYLE: normal; FONT-FAMILY: Verdana, Geneva, sans-serif; HEIGHT: 80px; BACKGROUND-COLOR: #ececec; FONT-VARIANT: normal"></textarea> 
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="12%" height="81" align="right" bgcolor="#EEEEEE">【质检员】</td>
      <td width="37%">服务： 
        <%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","zjyfw","");
%>
        <br><br>
        到位： 
        <%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","zjydw","");
%>
        <br><br>
        尽责： 
        <%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","zjyjz","");
%>
      </td>
      <td width="15%" align="right">质检员评价内容</td>
      <td width="36%"> <textarea name="zjyhfnr" rows="3" cols="33" style="BORDER-RIGHT: #ffffff 1px groove; BORDER-TOP: #ffffff 1px groove; FONT-WEIGHT: normal; FONT-SIZE: 12px; BORDER-LEFT: #ffffff 1px groove; WIDTH: 260px; COLOR: #000000; BORDER-BOTTOM: #ffffff 1px groove; FONT-STYLE: normal; FONT-FAMILY: Verdana, Geneva, sans-serif; HEIGHT: 80px; BACKGROUND-COLOR: #ececec; FONT-VARIANT: normal"></textarea> 
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="12%" height="80" align="right" bgcolor="#EEEEEE">【施工队】</td>
      <td width="37%">服务素质： 
        <%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","fwsz","");
%>
        <br><br>
        施工质量： 
        <%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","sgzl","");
%>
        <br><br>
        工人素质： 
        <%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","grsz","");
%>
      </td>
      <td width="15%" align="right">施工队评价内容</td>
      <td width="36%"> <textarea name="sgdhfnr" rows="3" cols="33" style="BORDER-RIGHT: #ffffff 1px groove; BORDER-TOP: #ffffff 1px groove; FONT-WEIGHT: normal; FONT-SIZE: 12px; BORDER-LEFT: #ffffff 1px groove; WIDTH: 260px; COLOR: #000000; BORDER-BOTTOM: #ffffff 1px groove; FONT-STYLE: normal; FONT-FAMILY: Verdana, Geneva, sans-serif; HEIGHT: 80px; BACKGROUND-COLOR: #ececec; FONT-VARIANT: normal"></textarea> 
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="12%" height="112" align="right" bgcolor="#EEEEEE">【集成家居】</td>
      <td width="37%"> 家居设计师 
        <%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","jcjjsjs","");
%>
        <br><br>
        家居顾问： 
        <%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","jsjjgw","");
%>
        <br><br>
        项目专员： 
        <%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","jcxmzy","");
%>
        <br><br>
        送货安装： 
        <%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","jcshaz","");
%>
        <br><br>
        产品质量： 
        <%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","jccpzl","");
%>
      </td>
      <td width="15%" align="right">集成家居评价内容</td>
      <td width="36%"> <textarea name="jchfnr" rows="3" cols="33" style="BORDER-RIGHT: #ffffff 1px groove; BORDER-TOP: #ffffff 1px groove; FONT-WEIGHT: normal; FONT-SIZE: 12px; BORDER-LEFT: #ffffff 1px groove; WIDTH: 260px; COLOR: #000000; BORDER-BOTTOM: #ffffff 1px groove; FONT-STYLE: normal; FONT-FAMILY: Verdana, Geneva, sans-serif; HEIGHT: 80px; BACKGROUND-COLOR: #ececec; FONT-VARIANT: normal"></textarea> 
      </td>
    </tr>
    <tr> 
      
     
    </tr>
    <tr> 
      <td width="12%" height="67" align="right" bgcolor="#EEEEEE">【总评】</td>
      <td colspan="3" bgcolor="#FFFFFF"> <textarea name="bz" rows="3" cols="80" style="BORDER-RIGHT: #ffffff 1px groove; BORDER-TOP: #ffffff 1px groove; FONT-WEIGHT: normal; FONT-SIZE: 12px; BORDER-LEFT: #ffffff 1px groove; WIDTH: 500px; COLOR: #000000; BORDER-BOTTOM: #ffffff 1px groove; FONT-STYLE: normal; FONT-FAMILY: Verdana, Geneva, sans-serif; HEIGHT: 80px; BACKGROUND-COLOR: #ececec; FONT-VARIANT: normal"></textarea></td>
    </tr>
    <tr> 
      <td colspan="4" align="center">
        <input type="hidden" name="khbh" value="<%=khbh%>" size="20" maxlength="20" >   
		<input type="hidden" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="20" > 
        <input type="button"  value="确认" onClick="f_do(insertform)" name="button"> 
        <input type="reset"  value="取消" name="reset"> </td>
  </form></tr>
</table>
      

</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{

	
	if(	javaTrim(FormName.bz)=="") {
		alert("请输入相关意见！");
		FormName.bz.focus();
		return false;
	}
	FormName.submit();
	return true;
}

function f_do1(FormName)//参数FormName:Form的名称
{

	FormName.action="../khxx/zhuanym.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>

