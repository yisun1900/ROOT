<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />


<html>
<head>
<title>工程服务评价表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE3 {font-family: "隶书"}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");

String hth=null;
String khxm="";
String fwdz="";
String lxfs=null;
String sjs=null;
String zjxm=null;
String sgd=null;
String sgdmc=null;
String sgbz=null;
String dwbh=null;
String dwmc=null;
String fgsbh=null;
String qyrq=null;

String khbh=cf.GB2Uni(request.getParameter("khbh"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

int xmsl=0;
int wtsl=0;
try {
	conn=cf.getConnection();

	ls_sql="select khxm,fwdz,lxfs,crm_khxx.dwbh,dwmc,sjs,crm_khxx.sgd,sgdmc,zjxm,hth,sgbz,fgsbh,qyrq";
	ls_sql+=" from  crm_khxx,sq_dwxx,sq_sgd";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
	}
	rs.close();
	ps.close();


	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  cmp_khpjb";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
//		out.println("错误！[客户评价表]已录入，请到维护中修改");
//		return;
	}
%>


<body   onselectstart="return false;"   onclick="dj()" onmousedown="mstate='down'" onmouseup="mstate='up'">



    <form method="post" action="SaveInsertCmp_khpjbRg.jsp" name="insertform" >

    <table width="100%" border="0" style="FONT-SIZE:28"  cellpadding="0" cellspacing="0"  background="11.jpg">
      <tr  height="130">
        <td align="right">&nbsp;</td>
        <td><span class="STYLE3">&nbsp;</span></td>
        <td>&nbsp;</td>
      </tr>
      <tr  height="28">
        <td align="right">&nbsp;</td>
        <td><span class="STYLE3">尊敬的<U><%=khxm%></U>（<%=fwdz%>）：</span></td>
        <td>&nbsp;</td>
      </tr>
      <tr  height="28">
        <td align="right">&nbsp;</td>
        <td><span class="STYLE3">&nbsp;&nbsp;&nbsp;&nbsp;您好！衷心感谢您的信任，选择松下亿达家装设计中心为您提供家居装</span></td>
        <td>&nbsp;</td>
      </tr>
      <tr  height="28">
        <td align="right" width="8%">&nbsp;</td>
        <td width="89%"><span class="STYLE3">饰装修服务，施工中给您带来的不便，敬请谅解！诚恳地希望您对我们</span></td>
        <td width="3%">&nbsp;</td>
      </tr>
      <tr  height="28">
        <td align="right" width="8%">&nbsp;</td>
        <td width="89%"><span class="STYLE3">的工作和管理做出评价，提出您的宝贵意见或建议，感谢您的支持！</span></td>
        <td width="3%">&nbsp;</td>
      </tr>
    </table>
  

<BR>
  <table width="100%" border="1" style="FONT-SIZE:28"  cellpadding="1" cellspacing="0" >
    <tr  align="center" height="30"> 
      <td width="13%" class="STYLE3"><strong>方面</strong></td>
      <td width="45%" class="STYLE3"><strong>内容事项</strong></td>
      <td colspan="3" class="STYLE3"><strong>客户总户评价</strong></td>
</tr>
    <%
	
	
	String xmflbm=null;
	String xmfl=null;

	ls_sql="select  xmflbm,xmfl";
	ls_sql+=" from  cmp_xmflbm";
	ls_sql+=" order by xmflbm ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xmflbm=cf.fillNull(rs.getString("xmflbm"));
		xmfl=cf.fillNull(rs.getString("xmfl"));

		int rowcount=0;
		ls_sql="select  count(*)";
		ls_sql+=" from  cmp_pjxmbm";
		ls_sql+=" where xmflbm='"+xmflbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			rowcount=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();



		String pjxmbm=null;
		String pjxm=null;
		int xh=0;
		ls_sql="select pjxmbm,pjxm";
		ls_sql+=" from  cmp_pjxmbm";
		ls_sql+=" where xmflbm='"+xmflbm+"'";
		ls_sql+=" order by xh ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			pjxmbm=cf.fillNull(rs1.getString("pjxmbm"));
			pjxm=cf.fillNull(rs1.getString("pjxm"));

			xmsl++;
			xh++;

			%>
			<tr  align="center" height="37" > 
			  <td rowspan="<%=rowcount%>" class="STYLE3"><%=xmfl%></td>
			  <td align="left" class="STYLE3"><%=xmsl%>:<%=pjxm%>
				<input type="hidden" name="pjxmbm"  value="<%=pjxmbm%>" >			  
				<input type="hidden" name="pjxm"  value="<%=pjxm%>" >			  
			  </td>
			  <td width="12%" align="center" class="STYLE3">
				<INPUT type="radio" name="pjxmbm<%=xmsl%>" style="display:none" value="1" id="xg<%=xmsl%>1" >
				
				<img src="1.jpg"  id="img<%=xmsl%>0" onclick="pjxmbm<%=xmsl%>[0].checked=true;document.getElementById('img<%=xmsl%>0').border='2';document.getElementById('img<%=xmsl%>1').border='0';document.getElementById('img<%=xmsl%>2').border='0'">
			  </td>
			  <td width="12%" align="center" class="STYLE3">
				<INPUT type="radio" name="pjxmbm<%=xmsl%>" style="display:none" value="2" id="xg<%=xmsl%>2" >
					
				<img src="2.jpg" id="img<%=xmsl%>1" onclick="pjxmbm<%=xmsl%>[1].checked=true;document.getElementById('img<%=xmsl%>1').border='2';document.getElementById('img<%=xmsl%>0').border='0';document.getElementById('img<%=xmsl%>2').border='0'">
			  </td>
			  <td width="12%" align="center" class="STYLE3">
				<INPUT type="radio" name="pjxmbm<%=xmsl%>" style="display:none" value="3" id="xg<%=xmsl%>3" >
					
				<img src="3.jpg" id="img<%=xmsl%>2" onclick="pjxmbm<%=xmsl%>[2].checked=true;document.getElementById('img<%=xmsl%>2').border='2';document.getElementById('img<%=xmsl%>0').border='0';document.getElementById('img<%=xmsl%>1').border='0'">
			  </td>
			</tr>
			<%
		}

		while (rs1.next())
		{
			pjxmbm=cf.fillNull(rs1.getString("pjxmbm"));
			pjxm=cf.fillNull(rs1.getString("pjxm"));

			xmsl++;
			xh++;

			%>
			<tr  align="center" height="37" > 
			  <td align="left" class="STYLE3"><%=xmsl%>:<%=pjxm%>
				<input type="hidden" name="pjxmbm"  value="<%=pjxmbm%>" >			  
				<input type="hidden" name="pjxm"  value="<%=pjxm%>" >			  
			  </td>
			  <td align="center" class="STYLE3">
				<INPUT type="radio" name="pjxmbm<%=xmsl%>" style="display:none" value="1" id="xg<%=xmsl%>1" >
				
				<img src="1.jpg"  id="img<%=xmsl%>0" onclick="pjxmbm<%=xmsl%>[0].checked=true;document.getElementById('img<%=xmsl%>0').border='2';document.getElementById('img<%=xmsl%>1').border='0';document.getElementById('img<%=xmsl%>2').border='0'">
			  </td>
			  <td align="center" class="STYLE3">
				<INPUT type="radio" name="pjxmbm<%=xmsl%>" style="display:none" value="2" id="xg<%=xmsl%>2" >
					
				<img src="2.jpg" id="img<%=xmsl%>1" onclick="pjxmbm<%=xmsl%>[1].checked=true;document.getElementById('img<%=xmsl%>1').border='2';document.getElementById('img<%=xmsl%>0').border='0';document.getElementById('img<%=xmsl%>2').border='0'">
			  </td>
			  <td align="center" class="STYLE3">
				<INPUT type="radio" name="pjxmbm<%=xmsl%>" style="display:none" value="3" id="xg<%=xmsl%>3" >
					
				<img src="3.jpg" id="img<%=xmsl%>2" onclick="pjxmbm<%=xmsl%>[2].checked=true;document.getElementById('img<%=xmsl%>2').border='2';document.getElementById('img<%=xmsl%>0').border='0';document.getElementById('img<%=xmsl%>1').border='0'">
			  </td>
			</tr>
			<%
		}
		rs1.close();
		ps1.close();

	}
	rs.close();
	ps.close();
	
%> 
</table>
  <table width="100%" border="0" style="FONT-SIZE:12" cellpadding="2" cellspacing="2">
	<tr > 
	  <td width="2%">&nbsp</td>
	  <td>
<%
	String wtbh=null;
	String wtmc=null;
	String sfkdx=null;
	String yxbz=null;
	String fbsj=null;
	ls_sql="select wtbh,wtmc,sfkdx,yxbz,fbsj ";
	ls_sql+=" from  cmp_dcwt";
	ls_sql+=" where  yxbz='Y'";
	ls_sql+=" order by wtbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		wtbh=cf.fillNull(rs.getString("wtbh"));
		wtmc=cf.fillNull(rs.getString("wtmc"));
		sfkdx=cf.fillNull(rs.getString("sfkdx"));//是否可多选 ,1：多选；2：单选；3：写说明
		yxbz=cf.fillNull(rs.getString("yxbz"));
		fbsj=cf.fillNull(rs.getDate("fbsj"));

		wtsl++;

		%>
		<P><B><%=wtsl%>：<%=wtmc%></B>
		<input type="hidden" name="wtbh"  value="<%=wtbh%>" >			  
		<input type="hidden" name="wtmc"  value="<%=wtmc%>" >			  
		<%

		String dabh=null;
		String damc=null;
		ls_sql="select dabh,damc";
		ls_sql+=" from  cmp_dcwtda";
		ls_sql+=" where  wtbh="+wtbh;
		ls_sql+=" order by dabh";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			dabh=cf.fillNull(rs1.getString("dabh"));
			damc=cf.fillNull(rs1.getString("damc"));
			
			if (sfkdx.equals("1"))//1：多选；2：单选
			{
				%>
				<BR>&nbsp;&nbsp;&nbsp;&nbsp;<%=dabh%>：
				<input type="checkbox" name="wtbh<%=wtsl%>" value="<%=dabh%>">
				<%=damc%>
				<%

			}
			else if (sfkdx.equals("2"))
			{
				%>
				<BR>&nbsp;&nbsp;&nbsp;&nbsp;<%=dabh%>：
				<input type="radio" name="wtbh<%=wtsl%>" value="<%=dabh%>">
				<%=damc%>
				<%
			}
		}
		rs1.close();
		ps1.close();

	}
	rs.close();
	ps.close();
%>
  
	</td>
	</tr>
  </table>

    <table width="100%" border="0" style="FONT-SIZE:28"  cellpadding="0" cellspacing="0"  height="440" background="13.jpg" onClick="f_do(insertform)">
	<tr align="center"> 
      <td  > 
      <input type="hidden" name="khbh"  value="<%=khbh%>" ></td>
    </tr>
  </table>
</form>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2 != null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

var mstate="";

var oldx=0;
var oldy=0;

 
function dj()
{
//	alert(event.clientX+","+event.clientY+"、"+window.screenLeft+","+window.screenTop+"、"+window.screen.width+","+window.screen.height);
}


function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("错误！没有客户");
		FormName.khbh.focus();
		return false;
	}

	for (var i=1;i<= <%=xmsl%> ;i++ )
	{
		if(	!radioChecked( eval("FormName.pjxmbm"+i) )) 
		{
			alert("完成失败！第"+i+"项【"+FormName.pjxm[i-1].value+"】未选择");
			eval("FormName.pjxmbm"+i+"[0]").focus();

			eval("FormName.pjxmbm"+i+"[0].style.background='#00FFFF'");
			eval("FormName.pjxmbm"+i+"[1].style.background='#00FFFF'");
			eval("FormName.pjxmbm"+i+"[2].style.background='#00FFFF'");

			return false;
		}
	}

	for (var i=1;i<= <%=wtsl%> ;i++ )
	{
		if(	!radioChecked( eval("FormName.wtbh"+i) )) 
		{
			alert("完成失败！第"+i+"个问题【"+FormName.wtmc[i-1].value+"】未选择");
			eval("FormName.wtbh"+i+"[0]").focus();

			eval("FormName.wtbh"+i+"[0].style.background='#00FFFF'");

			return false;
		}
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>

