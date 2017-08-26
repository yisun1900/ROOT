<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String jsjlh=null;
String khbh=null;
String sgd=null;
String sgbz=null;
String jsrq=null;
double htje=0;
double suijin=0;
double glf=0;
double gczxzq=0;
double gcjxzq=0;
double gcjse=0;
double jsbl=0;
double jsje=0;

double kzbjbl=0;
double kzb=0;
double gcglfk=0;
double gcqtfk=0;
double jsyfje=0;

double clfk=0;//材料评审处罚
double llje=0;//库房领料金额
double yfgck=0;//已付工程款
double ykgccf=0;
double qtkk=0;
double xcyxfy=0;//现场营销费用
double clyf=0;//材料运费
double gcsfje=0;//工程实付金额


String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;


double gcze=0;

	String khxm=null;
	String sjkgrq=null;
	String sjjgrq=null;

String wherejsjlh=cf.GB2Uni(request.getParameter("jsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String gdjsjd=null;
try {
	conn=cf.getConnection();
	ls_sql="select jsjlh,khbh,sgdmc,sgbz,jsrq,htje,suijin,glf,gczxzq,gcjxzq,gcjse,jsbl,jsje   ,kzbjbl,kzb,gcglfk,gcqtfk,jsyfje   ,clfk,llje,yfgck,ykgccf,qtkk,xcyxfy,clyf,gcsfje   ,cw_sgdwgjsjlkb.lrr,cw_sgdwgjsjlkb.lrsj,cw_sgdwgjsjlkb.lrbm,cw_sgdwgjsjlkb.bz ";
	ls_sql+=" from  cw_sgdwgjsjlkb,sq_sgd";
	ls_sql+=" where  jsjlh='"+wherejsjlh+"' and cw_sgdwgjsjlkb.sgd=sq_sgd.sgd(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clfk=rs.getDouble("clfk");
		llje=rs.getDouble("llje");
		yfgck=rs.getDouble("yfgck");
		ykgccf=rs.getDouble("ykgccf");
		qtkk=rs.getDouble("qtkk");
		xcyxfy=rs.getDouble("xcyxfy");
		clyf=rs.getDouble("clyf");
		gcsfje=rs.getDouble("gcsfje");

		jsjlh=cf.fillNull(rs.getString("jsjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		sgd=cf.fillNull(rs.getString("sgdmc"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		jsrq=cf.fillNull(rs.getDate("jsrq"));

		htje=rs.getDouble("htje");
		suijin=rs.getDouble("suijin");
		glf=rs.getDouble("glf");
		gczxzq=rs.getDouble("gczxzq");
		gcjxzq=rs.getDouble("gcjxzq");
		gcjse=rs.getDouble("gcjse");
		jsbl=rs.getDouble("jsbl");
		jsje=rs.getDouble("jsje");

		kzbjbl=rs.getDouble("kzbjbl");
		kzb=rs.getDouble("kzb");
		gcglfk=rs.getDouble("gcglfk");
		gcqtfk=rs.getDouble("gcqtfk");
		jsyfje=rs.getDouble("jsyfje");

		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillHtml(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	gcze=htje-suijin-glf;
	gcze=cf.round(gcze,2);

	ls_sql="select gdjsjd,khxm,sjkgrq,sjjgrq";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		khxm=cf.fillNull(rs.getString("khxm"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("<BR>出错:" + e);
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
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {
	font-family: "楷体_GB2312";
	font-weight: bold;
	font-size: 24px;
}
-->
</style>
</head>

<body style="FONT-SIZE:14">
 <div align="center" class="STYLE1">工程承包结算单</div>
<table width="100%" border="0" style="FONT-SIZE:14">
 <tr>
   <td width="50%">客户：<%=khxm%></td>
   <td width="50%" align="right">工长：<%=sgd%></td>
 </tr>
</table>
<table width="100%" border="1" style="FONT-SIZE:13"   cellpadding="1" cellspacing="0">
  <tr>
    <td colspan="3" >开工日期：<%=sjkgrq%></td>
    <td colspan="3" >竣工日期：<%=sjjgrq%></td>
    <td colspan="3" >结算日期：<%=jsrq%></td>
  </tr>
  <tr align="center">
    <td width="13%" >合同金额</td>
    <td width="10%" >税金</td>
    <td width="10%" >管理费</td>
    <td width="11%" >工程额</td>
    <td width="11%" >增项金额</td>
    <td width="11%" >减项金额</td>
    <td width="11%" >工程结算额</td>
    <td width="11%" >承包结算比例</td>
    <td width="12%" ><span class="STYLE5">结算总额</span></td>
  </tr>
  <tr align="center">
    <td ><%=htje%></td>
    <td ><%=suijin%></td>
    <td ><%=glf%></td>
    <td ><%=gcze%></td>
    <td ><%=gczxzq%></td>
    <td ><%=gcjxzq%></td>
    <td ><%=gcjse%></td>
    <td ><%=jsbl%> %</td>
    <td ><%=jsje%></td>
  </tr>
  <tr align="center">
    <td align="center" >应扣质保金比例</td>
    <td colspan="3" align="left" ><%=kzbjbl%> %</td>
    <td colspan="5" rowspan="5" align="left" valign="bottom" >制表人：<%=lrr%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商务处审核：</td>
  </tr>
  <tr align="center">
    <td align="center" >扣质保金</td>
    <td colspan="3" align="left" ><%=kzb%></td>
  </tr>
  <tr align="center">
    <td align="center" >工程管理处罚</td>
    <td colspan="3" align="left" ><%=gcglfk%></td>
  </tr>
  <tr align="center">
    <td align="center" >工程其它处罚</td>
    <td colspan="3" align="left" ><%=gcqtfk%></td>
  </tr>
  <tr align="center">
    <td align="center" >结算应付金额</td>
    <td colspan="3" align="left" ><%=jsyfje%></td>
  </tr>
  <tr align="center">
    <td align="center" >材料评审处罚</td>
    <td colspan="3" align="left" ><%=clfk%></td>
    <td colspan="5" align="left" >材料部签字：</td>
  </tr>
  <tr align="center">
    <td align="center" >库房领料金额</td>
    <td colspan="3" align="left" ><%=llje%></td>
    <td colspan="5" rowspan="3" align="left" valign="bottom" >财务审核人签字：</td>
  </tr>
  <tr align="center">
    <td align="center" >已付工程款</td>
    <td colspan="3" align="left" ><%=yfgck%></td>
  </tr>
  <tr align="center">
    <td align="center" >已扣工程处罚</td>
    <td colspan="3" align="left" ><%=ykgccf%></td>
  </tr>
  <tr align="center">
    <td align="center" >其它扣款</td>
    <td colspan="3" align="left" ><%=qtkk%></td>
    <td colspan="5" align="left" ><%=bz%></td>
  </tr>
  <tr align="center">
    <td align="center" >现场营销费用</td>
    <td colspan="3" align="left" ><%=xcyxfy%></td>
    <td colspan="5" align="left" >&nbsp;</td>
  </tr>
  <tr align="center">
    <td align="center" >材料运费</td>
    <td colspan="3" align="left" ><%=clyf%></td>
    <td colspan="5" align="left" >&nbsp;</td>
  </tr>
  <tr align="center">
    <td align="center" >工程实付金额</td>
    <td colspan="3" align="left" ><%=gcsfje%></td>
    <td colspan="5" align="left" >工长签字：</td>
  </tr>
</table>
<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
 <div align="center" class="STYLE1">工程承包结算单</div>
<table width="100%" border="0" style="FONT-SIZE:14">
 <tr>
   <td width="50%">客户：<%=khxm%></td>
   <td width="50%" align="right">工长：<%=sgd%></td>
 </tr>
</table>
<table width="100%" border="1"  style="FONT-SIZE:13"   cellpadding="1" cellspacing="0">
  <tr>
    <td colspan="3" >开工日期：<%=sjkgrq%></td>
    <td colspan="3" >竣工日期：<%=sjjgrq%></td>
    <td colspan="3" >结算日期：<%=jsrq%></td>
  </tr>
  <tr align="center">
    <td width="13%" >合同金额</td>
    <td width="10%" >税金</td>
    <td width="10%" >管理费</td>
    <td width="11%" >工程额</td>
    <td width="11%" >增项金额</td>
    <td width="11%" >减项金额</td>
    <td width="11%" >工程结算额</td>
    <td width="11%" >承包结算比例</td>
    <td width="12%" ><span class="STYLE5">结算总额</span></td>
  </tr>
  <tr align="center">
    <td ><%=htje%></td>
    <td ><%=suijin%></td>
    <td ><%=glf%></td>
    <td ><%=gcze%></td>
    <td ><%=gczxzq%></td>
    <td ><%=gcjxzq%></td>
    <td ><%=gcjse%></td>
    <td ><%=jsbl%> %</td>
    <td ><%=jsje%></td>
  </tr>
  <tr align="center">
    <td align="center" >应扣质保金比例</td>
    <td colspan="3" align="left" ><%=kzbjbl%> %</td>
    <td colspan="5" rowspan="5" align="left" valign="bottom" >制表人：<%=lrr%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商务处审核：</td>
  </tr>
  <tr align="center">
    <td align="center" >扣质保金</td>
    <td colspan="3" align="left" ><%=kzb%></td>
  </tr>
  <tr align="center">
    <td align="center" >工程管理处罚</td>
    <td colspan="3" align="left" ><%=gcglfk%></td>
  </tr>
  <tr align="center">
    <td align="center" >工程其它处罚</td>
    <td colspan="3" align="left" ><%=gcqtfk%></td>
  </tr>
  <tr align="center">
    <td align="center" >结算应付金额</td>
    <td colspan="3" align="left" ><%=jsyfje%></td>
  </tr>
  <tr align="center">
    <td align="center" >材料评审处罚</td>
    <td colspan="3" align="left" ><%=clfk%></td>
    <td colspan="5" align="left" >材料部签字：</td>
  </tr>
  <tr align="center">
    <td align="center" >库房领料金额</td>
    <td colspan="3" align="left" ><%=llje%></td>
    <td colspan="5" rowspan="3" align="left" valign="bottom" >财务审核人签字：</td>
  </tr>
  <tr align="center">
    <td align="center" >已付工程款</td>
    <td colspan="3" align="left" ><%=yfgck%></td>
  </tr>
  <tr align="center">
    <td align="center" >已扣工程处罚</td>
    <td colspan="3" align="left" ><%=ykgccf%></td>
  </tr>
  <tr align="center">
    <td align="center" >其它扣款</td>
    <td colspan="3" align="left" ><%=qtkk%></td>
    <td colspan="5" align="left" ><%=bz%></td>
  </tr>
  <tr align="center">
    <td align="center" >现场营销费用</td>
    <td colspan="3" align="left" ><%=xcyxfy%></td>
    <td colspan="5" align="left" >&nbsp;</td>
  </tr>
  <tr align="center">
    <td align="center" >材料运费</td>
    <td colspan="3" align="left" ><%=clyf%></td>
    <td colspan="5" align="left" >&nbsp;</td>
  </tr>
  <tr align="center">
    <td align="center" >工程实付金额</td>
    <td colspan="3" align="left" ><%=gcsfje%></td>
    <td colspan="5" align="left" >工长签字：</td>
  </tr>
</table>

</form>
</body>
</html>
