<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<html>
<head>
<title>重要提醒</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="/khhdpt/images/stype.css" rel=stylesheet type=text/css>
</head>
<%
String khbh=(String)session.getAttribute("khbh");
String khxm=null;
String lxfs=null;
String fwdz=null;
String hth=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select khxm,lxfs,fwdz,hth";
	ls_sql+=" from  crm_khxx,dm_gcjdbm,sq_dwxx,dm_gcyszxmbm a,dm_gcyszxmbm b";
	ls_sql+=" where crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) and crm_khxx.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and crm_khxx.ybysxmbm=a.gcyszxmbm(+) and crm_khxx.zqysxmbm=b.gcyszxmbm(+)  ";
	ls_sql+=" and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		hth=cf.fillHtml(rs.getString("hth"));
	}
	rs.close();
	ps.close();

%>
<body bgcolor="#FFFFFF"  style='FONT-SIZE: 13px'>
<table width="100%" border="0" height="834" style='FONT-SIZE: 13px'>
  <tr>
 
    <td width="100%" valign="top"> 
      <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="FONT-SIZE: 12px;border-collapse:collapse">
        <tr> 
          <td width="19%" height="24" align="right" bgcolor="#E4E4E4" >姓名</td>
          <td width="31%" ><%=khxm%></td>
          <td width="19%" align="right" bgcolor="#E4E4E4" >合同号</td>
          <td width="31%" ><%=hth%></td>
        </tr>
        <tr> 
          <td width="19%" height="24" align="right" bgcolor="#E4E4E4">房屋地址</td>
          <td colspan="3"><%=fwdz%></td>
        </tr>
      </table>
	  <BR>
      <table  border=0 cellspacing=0 cellpadding=0 width="100%" style='FONT-SIZE: 13px;width:100.0%;background:#F6F6F6'>
        <tr align="center"> 
          <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#DBDBDB;padding:3.75pt 2.25pt 2.25pt 3.75pt' width="11%"><b> 
            提醒等级</b></td>
          <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#DBDBDB;padding:3.75pt 2.25pt 2.25pt 3.75pt' width="10%"><b> 
            ？？</b></td>
          <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#DBDBDB;padding:3.75pt 2.25pt 2.25pt 3.75pt' width="11%"><b>
		  留言</b></td>
          <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#DBDBDB;padding:3.75pt 2.25pt 2.25pt 3.75pt' width="16%"> 
            <b>提醒分类</b></td>
          <td width="52%" style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#DBDBDB;padding:3.75pt 2.25pt 2.25pt 3.75pt'> 
            <b>主题</b></td>
        </tr>
<%
	String txxh=null;
	String txbt=null;
	String txnr=null;
	String txfl=null;
	String sfyxkhly=null;
	String khsfyck=null;
	String dwmc=null;
	String lrsj=null;
	String lrr=null;
	int txdj=0;


	int row=0;
	ls_sql="select txxh,txbt,txnr,txdj,khsfyck,DECODE(hd_zyxxtx.txfl,'1','交款提醒','2','工地验收提醒','3','结算提醒','4','集成产品提醒','9','其它提醒') txfl,sfyxkhly,lrr,lrsj,dwmc";
	ls_sql+=" from  hd_zyxxtx,sq_dwxx";
	ls_sql+=" where hd_zyxxtx.lrbm=sq_dwxx.dwbh and hd_zyxxtx.khbh='"+khbh+"'";
	ls_sql+="  order by hd_zyxxtx.lrsj ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		row++;
		txxh=cf.fillHtml(rs.getString("txxh"));
		txbt=cf.fillHtml(rs.getString("txbt"));
		txnr=cf.fillHtml(rs.getString("txnr"));
		txdj=rs.getInt("txdj");
		khsfyck=rs.getString("khsfyck");
		txfl=cf.fillHtml(rs.getString("txfl"));
		sfyxkhly=cf.fillHtml(rs.getString("sfyxkhly"));
		lrr=cf.fillHtml(rs.getString("lrr"));
		lrsj=cf.fillHtml(rs.getDate("lrsj"));
		dwmc=cf.fillHtml(rs.getString("dwmc"));


		int lysl=0;
		ls_sql="select count(*)";
		ls_sql+=" from  hd_zyxxtxly";
		ls_sql+=" where txxh='"+txxh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			lysl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		int lyhfsl=0;
		ls_sql="select count(*)";
		ls_sql+=" from  hd_zyxxtxly";
		ls_sql+=" where txxh='"+txxh+"' and lyhfnr is not null";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			lyhfsl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();



		String ckzp="";
		String lysm="";
		if (khsfyck.equals("Y"))//N：未查看；Y：已查看
		{
			ckzp="<A HREF='ViewHd_zyxxtx.jsp?txxh="+txxh+"' target='_blank'>已阅读</A>";
			lysm="留言："+lysl+"条<BR>回复："+lyhfsl+"条";
			txbt="<img src='../tubiao/iconOpenedMail.gif' border ='0'>"+txbt;
		}
		else{
			ckzp="<A HREF='ViewHd_zyxxtx.jsp?txxh="+txxh+"' target='_blank'>查看</A>";
			txbt="<img src='../tubiao/iconMailBlue_16x16.gif' border ='0'>"+txbt;
		}

		//提醒等级
		String txdjzp="";
		for (int i=0;i<txdj ;i++ )
		{
			txdjzp+="<img src='../tubiao/iconFdbkBlu_16x16.gif'>";
		}

		if (row%2==1)
		{
			%> 
        <tr align="center"> 
          <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#ECECEC;padding:3.75pt 2.25pt 2.25pt 3.75pt' width="11%"> 
            <%=txdjzp%> </td>
          <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#ECECEC;padding:3.75pt 2.25pt 2.25pt 3.75pt' width="10%"> 
            <%=ckzp%> </td>
          <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#ECECEC;padding:3.75pt 2.25pt 2.25pt 3.75pt' width="11%"> 
            <%=lysm%></td>
          <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#ECECEC;padding:3.75pt 2.25pt 2.25pt 3.75pt' width="16%"> 
            <%=txfl%></td>
          <td align="left" style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#ECECEC;padding:3.75pt 2.25pt 2.25pt 3.75pt' width="52%"> 
            （<%=dwmc%>） <%=lrr%> 提醒于：<%=lrsj%> 
            <HR>
            <marquee onmouseover='this.stop()' onmouseout='this.start()' scrollDelay=100 > 
            <font color='#FF0000' class='3dfont' size='3' face='楷体_GB2312'><B><A HREF='ViewHd_zyxxtx.jsp?txxh=<%=txxh%>' target='_blank'><%=txbt%></A></b></font> 
            </marquee> </td>
        </tr>
        <%
		}
		else{
			%> 
        <tr align="center"> 
          <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;padding:3.75pt 2.25pt 2.25pt 3.75pt' width="11%"> 
            <%=txdjzp%> </td>
          <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;padding:3.75pt 2.25pt 2.25pt 3.75pt' width="10%"> 
            <%=ckzp%> </td>
          <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;padding:3.75pt 2.25pt 2.25pt 3.75pt' width="11%">&nbsp;</td>
          <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;padding:3.75pt 2.25pt 2.25pt 3.75pt' width="16%"> 
            <%=txfl%></td>
          <td align="left" style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;padding:3.75pt 2.25pt 2.25pt 3.75pt' width="52%"> 
            （<%=dwmc%>） <%=lrr%> 提醒于：<%=lrsj%> 
            <HR>
            <marquee onmouseover='this.stop()' onmouseout='this.start()' scrollDelay=100 > 
            <font color='#FF0000' class='3dfont' size='4' face='楷体_GB2312'><B><A HREF='ViewHd_zyxxtx.jsp?txxh=<%=txxh%>' target='_blank'><%=txbt%></A></b></font> 
            </marquee> </td>
        </tr>
        <%
		}

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
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%> 
      </table>
    </td>
  </tr>
</table>
</body>
</html>
