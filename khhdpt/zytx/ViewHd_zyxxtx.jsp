<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String txxh=null;
String khbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
String hth=null;
String qyrq=null;
String sgd=null;
String zjxm=null;
String dwbh=null;
String txbt=null;
String txnr=null;
String txfl=null;
String sfyxkhly=null;
String khsfyck=null;
String khckr=null;
String khcksj=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
int txdj=0;

//提醒等级
String txdjzp="";


String wheretxxh=null;
wheretxxh=cf.GB2Uni(request.getParameter("txxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();


	ls_sql="select txdj,hd_zyxxtx.txxh as txxh,hd_zyxxtx.khbh as khbh,crm_khxx.khxm as khxm,crm_khxx.fwdz as fwdz,crm_khxx.lxfs as lxfs,crm_khxx.sjs as sjs,crm_khxx.hth as hth,crm_khxx.qyrq as qyrq,crm_khxx.sgd as sgd,crm_khxx.zjxm as zjxm,crm_khxx.dwbh as dwbh,hd_zyxxtx.txbt as txbt,hd_zyxxtx.txnr as txnr,hd_zyxxtx.txfl as txfl,hd_zyxxtx.sfyxkhly as sfyxkhly,hd_zyxxtx.khsfyck as khsfyck,hd_zyxxtx.khckr as khckr,hd_zyxxtx.khcksj as khcksj,hd_zyxxtx.lrr as lrr,hd_zyxxtx.lrsj as lrsj,sq_dwxx.dwmc as lrbm,hd_zyxxtx.bz as bz ";
	ls_sql+=" from  crm_khxx,hd_zyxxtx,sq_dwxx";
	ls_sql+=" where hd_zyxxtx.lrbm=sq_dwxx.dwbh and hd_zyxxtx.khbh=crm_khxx.khbh and  (hd_zyxxtx.txxh='"+wheretxxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		txdj=rs.getInt("txdj");
		txxh=cf.fillNull(rs.getString("txxh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		txbt=cf.fillNull(rs.getString("txbt"));
		txnr=cf.fillNull(rs.getString("txnr"));
		txfl=cf.fillNull(rs.getString("txfl"));
		sfyxkhly=cf.fillNull(rs.getString("sfyxkhly"));
		khsfyck=cf.fillNull(rs.getString("khsfyck"));
		khckr=cf.fillNull(rs.getString("khckr"));
		khcksj=cf.fillNull(rs.getString("khcksj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	ls_sql="update hd_zyxxtx set khsfyck='Y',khcksj=SYSDATE,khckr='"+yhmc+"'";
	ls_sql+=" where  (txxh='"+wheretxxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<txdj ;i++ )
	{
		txdjzp+="<img src='../tubiao/iconFdbkBlu_16x16.gif'>";
	}

%>

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center"> 重要信息提醒</div>
<form method="post" action="SaveInsertHd_zyxxtxly.jsp" name="insertform" >
  <table  border=0 cellspacing=0 cellpadding=0 width="100%" style='FONT-SIZE: 14px;width:100.0%;background:#F6F6F6'>
    <tr bgcolor="#FFFFFF"> 
      <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#DBDBDB;padding:3.75pt 2.25pt 2.25pt 3.75pt' align="right" height="32" width="19%"> 
        <font color="#000099"><b>客户姓名</b></font></td>
      <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#ECECEC;padding:3.75pt 2.25pt 2.25pt 3.75pt' height="34" width="81%"> 
        <%=khxm%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#DBDBDB;padding:3.75pt 2.25pt 2.25pt 3.75pt' align="right" height="32" width="19%"> 
        <font color="#000099"><b>房屋地址</b></font></td>
      <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#ECECEC;padding:3.75pt 2.25pt 2.25pt 3.75pt' height="32" width="81%"> 
        <%=fwdz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#DBDBDB;padding:3.75pt 2.25pt 2.25pt 3.75pt' align="right" height="32" width="19%"><font color="#000099"><b> 
        提醒等级</b></font></td>
      <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#ECECEC;padding:3.75pt 2.25pt 2.25pt 3.75pt' height="32" width="81%"> 
        <%=txdjzp%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#DBDBDB;padding:3.75pt 2.25pt 2.25pt 3.75pt' align="right" height="32" width="19%"><font color="#000099"><b> 
        提醒分类</b></font></td>
      <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#ECECEC;padding:3.75pt 2.25pt 2.25pt 3.75pt' height="32" width="81%"> 
        <%
	cf.selectToken(out,"1+交款提醒&2+工地验收提醒&3+结算提醒&4+集成产品提醒&9+其它提醒",txfl,true);
%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#DBDBDB;padding:3.75pt 2.25pt 2.25pt 3.75pt' align="right" height="32" width="19%"><font color="#000099"><b> 
        主题</b></font></td>
      <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#ECECEC;padding:3.75pt 2.25pt 2.25pt 3.75pt' height="32" width="81%"> 
        <%=txbt%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#DBDBDB;padding:3.75pt 2.25pt 2.25pt 3.75pt' align="right" height="32" width="19%"><font color="#000099"><b> 
        提醒人</b></font></td>
      <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#ECECEC;padding:3.75pt 2.25pt 2.25pt 3.75pt' height="32" width="81%"> 
        <%=lrr%>（<%=lrbm%>）</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#DBDBDB;padding:3.75pt 2.25pt 2.25pt 3.75pt' align="right" height="32" width="19%"><font color="#000099"><b> 
        提醒时间</b></font></td>
      <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#ECECEC;padding:3.75pt 2.25pt 2.25pt 3.75pt' height="32" width="81%"> 
        <%=lrsj%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#DBDBDB;padding:3.75pt 2.25pt 2.25pt 3.75pt' align="right" height="32" width="19%"><font color="#000099"><b> 
        提醒内容</b></font></td>
      <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#ECECEC;padding:3.75pt 2.25pt 2.25pt 3.75pt' height="32" width="81%"> 
        <%=txnr%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#DBDBDB;padding:3.75pt 2.25pt 2.25pt 3.75pt' align="right" height="32" width="19%"> 
        <b><font color="#000099">最近查看时间</font></b></td>
      <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#ECECEC;padding:3.75pt 2.25pt 2.25pt 3.75pt' height="32" width="81%"> 
        <%=khcksj%>
        <input type="hidden" name="txxh" value="<%=wheretxxh%>" >
        <input type="hidden" name="khbh" value="<%=khbh%>" >
		</td>
    </tr>
    <%
  if (sfyxkhly.equals("Y"))//N：不需要；Y：需要
  {
	  %> 
    <tr bgcolor="#FFFFFF"> 
      <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#DBDBDB;padding:3.75pt 2.25pt 2.25pt 3.75pt' align="right" height="32" width="19%"> 
        请 您 留 言 <BR>
        <BR>
        <input type="button" name="Button" value="提交留言" onclick="f_do(insertform)">
      </td>
      <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#ECECEC;padding:3.75pt 2.25pt 2.25pt 3.75pt' height="32" width="81%"> 
        <textarea name="lynr" rows="7" cols="71"></textarea>
      </td>
    </tr>
    <%
  }
  %> 
  </table>
</form>


 
<%
	String lysj=null;
	String lynr=null;
	String lysfyck=null;
	String lyckr=null;
	String lycksj=null;
	String lyhfnr=null;

	int row =0;
	ls_sql="select lysj,lynr,lysfyck,lyckr,lycksj,lyhfnr";
	ls_sql+=" from  hd_zyxxtxly";
	ls_sql+=" where txxh='"+wheretxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		row++;
		lysj=cf.fillNull(rs.getDate("lysj"));
		lynr=cf.fillNull(rs.getString("lynr"));
		lysfyck=cf.fillNull(rs.getString("lysfyck"));
		lyckr=cf.fillNull(rs.getString("lyckr"));
		lycksj=cf.fillNull(rs.getDate("lycksj"));
		lyhfnr=cf.fillNull(rs.getString("lyhfnr"));

		%>
		<table  border=0 cellspacing=0 cellpadding=0 width="100%" style='FONT-SIZE: 14px;width:100.0%;background:#F6F6F6'>
		  <tr bgcolor="#FFFFFF"> 
			<td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#DBDBDB;padding:3.75pt 2.25pt 2.25pt 3.75pt' height="32" width="19%">
			<%=row%>：<%=lysj%>留言：<%=lynr%>
			</td>
		  </tr>
		  <tr bgcolor="#FFFFFF"> 
			<td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#ECECEC;padding:3.75pt 2.25pt 2.25pt 3.75pt' height="32" width="81%">
			<%
			if (lysfyck.equals("Y"))//N：未查看；Y：已查看
			{
				out.println("&nbsp;&nbsp;&nbsp;&nbsp;<img src='../tubiao/iconOpenedMail.gif'>"+lyckr+" 于 "+lycksj+" 回复："+lyhfnr);
			}
			else{
				out.println("&nbsp;&nbsp;&nbsp;&nbsp;<img src='../tubiao/iconMailBlue_16x16.gif'>留言未回复");
			}
			%>
			</td>
		  </tr>
		</table>
		<%
	}
	rs.close();
	ps.close();

%>

</body>
</html>

<%
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


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.lynr)=="" || FormName.lynr.value=="输入留言") {
		alert("请输入[留言]！");
		FormName.lynr.value="输入留言";
		FormName.lynr.select();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
