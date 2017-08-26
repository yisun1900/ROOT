<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String kpxh=null;
String kpr=null;
String kpsj=null;
String kplx=null;
String bz=null;
String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;

String khxm=null;
String fwdz=null;
String lxfs=null;
String sjkgrq=null;
String sjs=null;
String qye=null;
String sgd=null;
String zjxm=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select khxm,fwdz,lxfs,sjkgrq,sjs,qye,sgd,zjxm";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		lxfs=rs.getString("lxfs");
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();


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

<html>
<head>
<title>工程考评信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<div align="center">工程考评信息</div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFFF"> 
    <td width="15%"> 
      <div align="right"><font color="#000099">客户编号</font></div>
    </td>
    <td width="35%"><%=khbh%> </td>
    <td width="15%"> 
      <div align="right"><font color="#000099">实开工日期</font></div>
    </td>
    <td width="35%"><%=sjkgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" align="right"><font color="#000099">客户姓名</font></td>
    <td width="35%"><%=khxm%></td>
    <td width="15%" align="right"><font color="#000099">联系方式</font></td>
    <td width="35%"><%=lxfs%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" align="right"><font color="#000099">房屋地址</font></td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" align="right"><font color="#000099">设计师</font></td>
    <td width="35%"><%=sjs%></td>
    <td width="15%" align="right"><font color="#000099">质检姓名</font></td>
    <td width="35%"><%=zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" align="right"><font color="#000099">施工队</font></td>
    <td width="35%"><%
	cf.selectItem(out,"select dwbh,dwmc||'('||dwdh||')' from sq_dwxx where dwbh='"+sgd+"'",sgd,true);
%></td>
    <td width="15%" align="right"><font color="#000099">签约额</font></td>
    <td width="35%"><%=qye%></td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">考评序号</td>
	<td  width="6%">考评人</td>
	<td  width="10%">考评时间</td>
	<td  width="7%">考评类型</td>
	<td  width="14%">备注</td>
	<td  width="17%">考评大类</td>
	<td  width="16%">考评项目</td>
	<td  width="8%">考评结果</td>
	<td  width="14%">考评处罚</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	ls_sql="SELECT kp_gczljcb.kpxh,kpr,kpsj,DECODE(kplx,1,'质检员',2,'巡检员',3,'公司抽查') as kplx,bz,kp_kpdlbm.kpdlmc,kp_gckpxm.kpxmmc, DECODE(kp_jcmxb.kpjg,'1','轻微违章','2','严重违章','3','特别严重') as kpjgmc,kp_kpcfbm.kpcfmc as kp_kpcfbm_kpcfmc  ";
	ls_sql+=" FROM kp_kpcfbm,kp_kpdlbm,kp_gckpxm,kp_jcmxb,kp_gczljcb  ";
    ls_sql+=" where kp_jcmxb.kpcfbm=kp_kpcfbm.kpcfbm and kp_gckpxm.kpdlbm=kp_kpdlbm.kpdlbm and kp_jcmxb.kpxmbm=kp_gckpxm.kpxmbm and kp_jcmxb.kpjg=kp_gckpxm.kpjg";
    ls_sql+=" and kp_gczljcb.kpxh=kp_jcmxb.kpxh(+) and kp_gczljcb.khbh='"+khbh+"'";
    ls_sql+=" order by kp_gczljcb.kpxh,kp_gckpxm.kpdlbm,kp_jcmxb.kpxmbm,kp_jcmxb.kpjg,kp_jcmxb.kpcfbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数


//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("kpxh","1");//列参数对象加入Hash表
	spanColHash.put("kpr","1");//列参数对象加入Hash表
	spanColHash.put("kpsj","1");//列参数对象加入Hash表
	spanColHash.put("kplx","1");//列参数对象加入Hash表
	spanColHash.put("bz","1");//列参数对象加入Hash表
	spanColHash.put("kpdlmc","1");//列参数对象加入Hash表
	spanColHash.put("kpxmmc","1");//列参数对象加入Hash表
	spanColHash.put("kpjgmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>


</body>
</html>
