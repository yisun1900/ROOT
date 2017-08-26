<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<link rel="StyleSheet" href="/nblt/fwlt/editor/base.css">
<script type="text/javascript" src="/nblt/fwlt/editor/editor.js"></script>
<style>
A:link,A:visited ,A:active {TEXT-DECORATION: none}
A:hover {text-decoration : none; position : relative; top : 1px; left : 1px}
#div0{padding:0px;margin:0px;border:1px solid #BBE9FF;background:#9FC8DF}
#div1{padding:10px;margin:0px;border:1px solid #BBE9FF;background:#F5FBFF}
#div222{padding:5px;margin:0px;border:1px solid #BBE9FF;background:#FFFFFF;}onmouseout=function(){this.style.backgroundColor=#9FC8DF;}
#div2{width:20px;height:22px;padding:0px;margin:0px;border:1px solid #BBE9FF;background:#FFFFFF;star:expression(onmouseover=function(){this.style.backgroundColor="#F5FBFF"; onmouseout=function(){this.style.backgroundColor="#FFFFFF";}})}
#div3{padding:3px;margin:0px;border:0px solid #BBE9FF;background:#FFFFFF}
#div10{padding:10px;margin:0px;border:1px solid #BBE9FF;background:#9FC8DF}
#div4{padding:30px;margin:0px;border:0px solid #BBE9FF;background:#FFFFFF}
#table1{border:1px solid #BBE9FF;background:#FFFFFF }
#div110{padding:1px;margin:0px;border:0px solid #BBE9FF;background:#9FC8DF}

</style>
<%
String yhdlm=(String)session.getAttribute("yhdlm");
String ygbh=(String)session.getAttribute("ygbh");
String dlygbh=ygbh;
String ltid="";
String ltnc="";
String lttx="";
int ftsl=0;
int htsl=0;
String grsm="";


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ltid,ltnc,lttx,ftsl,htsl,grsm ";
	ls_sql+=" from  nblt_grzl";
	ls_sql+=" where  (ltid='"+dlygbh+"') ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ltid=cf.fillNull(rs.getString("ltid"));
		ltnc=cf.fillNull(rs.getString("ltnc"));
		lttx=cf.fillNull(rs.getString("lttx"));
//		ftsl=rs.getInt("ftsl");
//		htsl=rs.getInt("htsl");
		grsm=cf.fillNull(rs.getString("grsm"));
	}
	rs.close();
	ps.close();
	//��ѯ��������
	ls_sql="select count(*) ftsl ";
	ls_sql+=" from  nblt_ftgl";
	ls_sql+=" where  (ftr="+dlygbh+") ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ftsl=rs.getInt("ftsl");
	}
	rs.close();
	ps.close();
	//��ѯ��������
	ls_sql="select count(*) htsl ";
	ls_sql+=" from  nblt_hfgl";
	ls_sql+=" where  (hfr="+dlygbh+") ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		htsl=rs.getInt("htsl");
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
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
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<center><div><span style="FONT-SIZE:14">&nbsp;</span></DIV></center>
<center><div><span style="FONT-SIZE:14">�༭��������</span></DIV></center>
<center><div><span style="FONT-SIZE:14">&nbsp;</span></DIV></center>

<body bgcolor="#FFFFFF">
<form method="post" action="saveeditgrzl.jsp" name="insertform">
<center>
<div><span style="FONT-SIZE:4">&nbsp;</span></DIV>
<table width="80%" id="table2" border=0 cellpadding=0 cellspacing=1 bgcolor="#BBE9FF">
  <tr bgcolor="#F5FBFF">
    <td width="48%"><DIV id="div1"><B>��̳ID:&nbsp;&nbsp;</B>&nbsp;<input type="txt" value="<%=dlygbh%>" name="ltid"  size="20" class=inpt readonly></td>
    <td width="52%" rowspan="5">
	<div align="center"> 
          <center>
            <iframe width="100%" height="100%" src="xstx.jsp" name="centerframe" marginwidth="0" marginheight="0" scrolling="NO" FrameBorder="0"> 
            <p>��Ʒ��Ϣ��ѯ 
            </iframe> 
          </center>
        </div>
	</td>
  </tr>
  <tr bgcolor="#F5FBFF">
    <td><DIV id="div1"><B>��̳�ǳƣ�<input type="txt" value="<%=ltnc%>" name="ltnc"  size="25" class=inpt></B></div></td>
  </tr>
  <tr bgcolor="#F5FBFF">
    <td><DIV id="div1"><B>��̳ͷ��<select name="lttx" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="f_bq(insertform)">
	<option value=""></option>
	<%
	String tpmcs=null;
	String sfytx="N";
	for (int i=1;i<37;i++)
	{
		tpmcs=String.valueOf(i);
		tpmcs=cf.addZero(tpmcs,3);
		if (lttx.equals(tpmcs))
		{
		out.print("<option value=\""+tpmcs+"\" selected>"+tpmcs+"</option>");
		sfytx="Y";
		}
		else
		{
		out.print("<option value=\""+tpmcs+"\">"+tpmcs+"</option>");
		}
	}
	if (sfytx.equals("N") && lttx!=null && !(lttx.equals("")))
		{
			out.print("<option value=\""+lttx+"\" selected>"+lttx+"</option>");
		}
	%>
  </select></B>
	</td>
  </tr>
  <tr bgcolor="#F5FBFF">
    <td><DIV id="div1"><B>����������<input type="txt" value="<%=ftsl%>" name="ftsl"  size="20" class=inpt readonly></B></td>
  </tr>
  <tr bgcolor="#F5FBFF">
    <td><DIV id="div1"><B>����������<input type="txt" value="<%=htsl%>" name="htsl"  size="20" class=inpt readonly></B></td>
  </tr>
  <tr bgcolor="#F5FBFF">
    <td colspan="2" ><DIV id="div1"><b>&nbsp;&nbsp;����˵����<BR>&nbsp;&nbsp;<textarea name="grsm" cols="80" rows="5" id="Description" ><%=grsm%></textarea></td>
  </tr>
  <tr bgcolor="#F5FBFF">
    <td colspan="2" align="center"><input type="button" name="tttr" value=" �� �� " onClick="f_ph(insertform)"  class=butt title="�޸�"></td>
  </tr>
</center>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_ph(FormName)//����FormName:Form������
{
	insertform.target="";
	FormName.action="saveeditgrzl.jsp?yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>";
	FormName.submit();
	return true;
}
function f_pz(FormName)//����FormName:Form������
{
	insertform.target="";
	FormName.action="saveeditgrzlpz.jsp?yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>";
	FormName.submit();
	return true;
}
function f_bq(FormName)//����FormName:Form������
{
insertform.target="centerframe";
insertform.action="xstx.jsp?yhdlm=<%=yhdlm%>";
insertform.submit();
}
//-->
</SCRIPT>
