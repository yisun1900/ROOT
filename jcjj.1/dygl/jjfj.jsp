<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();

String ddbh=request.getParameter("ddbh");
String khxm="";;

String sgd="";
String bzdh="";
String sgbz="";
String sjs="";
String dwmc="";;
String hth="";
String jc_mmydd_jhazsj="";
String qhtsj="";
String lxfs="";
String fwdz="";
String sgdmc="";
String sgddh="";
String cxhdbm="";
String fgsbh=null;
String xmzy=null;
String xmzydh=null;
String htbz=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
double htze=0;
double jjje=0;
double xcmje=0;
try {
	conn=cf.getConnection();
	ls_sql="select jc_jjdd.htbz,crm_khxx.fgsbh,jc_jjdd.xmzy,khxm,htze,cxhdbm,jjje,xcmje,sjs,dwmc,crm_khxx.sgd,fwdz,qhtsj,sgdmc,sq_sgd.dh,fwdz,sgbz,lxfs,crm_khxx.hth,jc_jjdd.kazsj,qhtsj";
	ls_sql+=" from  jc_jjdd,crm_khxx,sq_sgd,sq_dwxx";
	ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+) and jc_jjdd.ddbh='"+ddbh+"'";
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		htbz=cf.fillHtml(rs.getString("htbz"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		xmzy=cf.fillHtml(rs.getString("xmzy"));
		khxm=cf.fillNull(rs.getString("khxm"));
		htze=rs.getDouble("htze");
		jjje=rs.getDouble("jjje");
		xcmje=rs.getDouble("xcmje");
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		sgddh=cf.fillNull(rs.getString("dh"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		jc_mmydd_jhazsj=cf.fillNull(rs.getDate("kazsj"));
		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
		hth=cf.fillNull(rs.getString("hth"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwmc=cf.fillNull(rs.getString("dwmc"));

	}
	rs.close();
	ps.close();

	 ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select bgdh from sq_yhxx";
	ls_sql+=" where yhmc='"+xmzy+"' and ssfgs ='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xmzydh=cf.fillHtml(rs.getString("bgdh"));
	}
	rs.close();
	ps.close();

%>

<html>
<head>
<title>松下亿达家具附件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0" style='FONT-SIZE: 16px'>
  <tr> 
    <td colspan="4" height="25" align="right"> 
      <div align="center"><strong>家具合同附件－－板式家具部分</strong></div>
    </td>
  </tr>
  <tr> 
    <td width="1%" height="2" align="right"> 
      <div align="left"></div>
    </td>
    <td width="36%" height="2" align="right"> 
      <div align="left">客户姓名： <%=khxm%></div>
    </td>
    <td width="30%" height="2" align="right"> 
      <div align="left"></div>
      <div align="left">合同号：<%=hth%></div>
    </td>
    <td width="33%" height="2" align="right"> 
      <div align="left">合同送货安装日期：<%=jc_mmydd_jhazsj%></div>
    </td>
  </tr>
  <tr> 
    <td height="6" align="right"> 
      <div align="left"></div>
    </td>
    <td height="6" align="right"> 
      <div align="left">联系方式：<%=lxfs%></div>
    </td>
    <td height="6" align="right"> 
      <div align="left">现场班长/电话：<%=sgbz%>/<%=bzdh%></div>
    </td>
    <td height="6" align="right"> 
      <div align="left">签约店面/家装设计师：<%=dwmc%>/<%=sjs%></div>
    </td>
  </tr>
  <tr> 
    <td width="1%" height="2" align="right"> 
      <div align="left"> </div>
    </td>
    <td height="2" align="right"> 
      <div align="left">地址：<%=fwdz%> </div>
    </td>
    <td height="2" align="right"> 
      <div align="left">订单号：<%=ddbh%></div>
    </td>
    <td height="2" align="right"> 
      <div align="left">参加促销活动：<%=cxhdbm%></div>
    </td>
  </tr>
  <tr> 
    <td width="1%" height="2" align="right">&nbsp;</td>
    <td height="2">项目专员：<%=xmzy%></td>
    <td height="2">项目专员电话：<%=xmzydh%></td>
    <td height="2" align="right">&nbsp;</td>
  </tr>
</table>
<%
	String gtxh=null;
	String gtmc=null;
	String guige=null;
	String bcpp=null;
	String bcys=null;
	double zj=0;
	double bcbfje=0;
	double pjbfje=0;

	ls_sql="SELECT gtxh,gtmc,guige,bcpp,bcys,zj,bcbfje,pjbfje  ";
	ls_sql+=" FROM jc_jjgtmx";
    ls_sql+=" where jc_jjgtmx.ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		gtxh=cf.fillNull(rs.getString("gtxh"));
		gtmc=cf.fillNull(rs.getString("gtmc"));
		guige=cf.fillNull(rs.getString("guige"));
		bcpp=cf.fillNull(rs.getString("bcpp"));
		bcys=cf.fillNull(rs.getString("bcys"));
		zj=rs.getDouble("zj");
		bcbfje=rs.getDouble("bcbfje");
		pjbfje=rs.getDouble("pjbfje");

%>
<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 14px'>
  <tr> 
    <td colspan="9">柜体名称：<%=gtmc%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;规格：<%=guige%> 
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 板材颜色：<%=bcpp%>（<%=bcys%>）</td>
  </tr>
  <tr> 
    <td colspan="9">板件统计</td>
  </tr>
  <tr> 
    <td rowspan="2" width="7%"> 
      <div align="center">序号</div>
    </td>
    <td rowspan="2" width="15%"> 
      <div align="center">板件名称</div>
    </td>
    <td colspan="2"> 
      <div align="center">规格（mm）</div>
    </td>
    <td rowspan="2" width="7%"> 
      <div align="center">数量</div>
    </td>
    <td rowspan="2" width="11%"> 
      <div align="center">面积（平米）</div>
    </td>
    <td rowspan="2" width="8%"> 
      <div align="center">单价</div>
    </td>
    <td rowspan="2" width="13%"> 
      <div align="center">金额</div>
    </td>
    <td rowspan="2" width="19%"> 
      <div align="center">备注</div>
    </td>
  </tr>
  <tr> 
    <td width="11%"> 
      <div align="center">长</div>
    </td>
    <td width="9%"> 
      <div align="center">宽</div>
    </td>
  </tr>
  <%
	String bjmc=null;
	int cd=0;
	int kd=0;
	int sl=0;
	double khdj=0;
	double je=0;
	double mj=0;
	double allmj=0;
	String bz=null;

	int row=0;
	ls_sql="SELECT bjmc,cd,kd,sl,khdj,je,bz,ROUND(cd/1000*kd/1000*sl,2) mj ";
	ls_sql+=" FROM jc_gtbjmx";
    ls_sql+=" where gtxh='"+gtxh+"'";
	ls_sql+=" order by pxxh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		bjmc=cf.fillNull(rs1.getString("bjmc"));
		cd=rs1.getInt("cd");
		kd=rs1.getInt("kd");
		sl=rs1.getInt("sl");
		khdj=rs1.getDouble("khdj");
		je=rs1.getDouble("je");
		mj=rs1.getDouble("mj");
		bz=cf.fillHtml(rs1.getString("bz"));

		allmj+=mj;

		row++;
		%> 
  <tr align="center"> 
    <td width="7%"><%=row%></td>
    <td width="15%"><%=bjmc%></td>
    <td width="11%"><%=cd%></td>
    <td width="9%"><%=kd%></td>
    <td width="7%"><%=sl%></td>
    <td width="11%"><%=mj%></td>
    <td width="8%"><%=khdj%></td>
    <td width="13%"><%=je%></td>
    <td width="19%"><%=bz%></td>
  </tr>
  <%

	}
	rs1.close();
	ps1.close();

%> 
  <tr> 
    <td colspan="5" align="center" bgcolor="#CCCCCC">合计：</td>
    <td width="11%" bgcolor="#CCCCCC"> 
      <div align="center"><%=cf.doubleTrim(allmj)%></div>
    </td>
    <td width="8%">&nbsp;</td>
    <td width="13%" bgcolor="#CCCCCC"> 
      <div align="center"><%=bcbfje%></div>
    </td>
    <td width="19%">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="9">配件统计</td>
  </tr>
  <tr> 
    <td width="7%"> 
      <div align="center">序号</div>
    </td>
    <td width="15%"> 
      <div align="center">配件名称</div>
    </td>
    <td width="11%"> 
      <div align="center">规格（mm）</div>
    </td>
    <td width="9%"> 
      <div align="center">计量单位</div>
    </td>
    <td width="7%"> 
      <div align="center">数量</div>
    </td>
    <td width="11%"> 
      <div align="center">型号</div>
    </td>
    <td width="8%"> 
      <div align="center">单价</div>
    </td>
    <td width="13%"> 
      <div align="center">金额</div>
    </td>
    <td width="19%"> 
      <div align="center">备注</div>
    </td>
  </tr>
  <%
	row=0;
	String gtpjmc=null;
	String xinghao=null;
	String jldwmc=null;
	double pjsl=0;

	ls_sql="SELECT gtpjmc,guige,xinghao,jldwmc,sl,khdj,je,bz";
	ls_sql+=" FROM jc_gtpjmx,jdm_jldwbm";
    ls_sql+=" where jc_gtpjmx.jldwbm=jdm_jldwbm.jldwbm and gtxh='"+gtxh+"'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		gtpjmc=cf.fillNull(rs1.getString("gtpjmc"));
		guige=cf.fillHtml(rs1.getString("guige"));
		xinghao=cf.fillHtml(rs1.getString("xinghao"));
		jldwmc=cf.fillHtml(rs1.getString("jldwmc"));
		pjsl=rs1.getDouble("sl");
		khdj=rs1.getDouble("khdj");
		je=rs1.getDouble("je");
		bz=cf.fillHtml(rs1.getString("bz"));

		row++;
		%> 
  <tr align="center"> 
    <td width="7%"><%=row%></td>
    <td width="15%"><%=gtpjmc%></td>
    <td width="11%"><%=guige%></td>
    <td width="9%"><%=jldwmc%></td>
    <td width="7%"><%=cf.formatDouble(pjsl)%></td>
    <td width="11%"><%=xinghao%></td>
    <td width="8%"><%=khdj%></td>
    <td width="13%"><%=je%></td>
    <td width="19%"><%=bz%></td>
  </tr>
  <%

	}
	rs1.close();
	ps1.close();
%> 
  <tr> 
    <td colspan="5" bgcolor="#CCCCCC"> 
      <div align="center">合计</div>
    </td>
    <td width="11%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="13%" bgcolor="#CCCCCC"> 
      <div align="center"><%=pjbfje%></div>
    </td>
    <td width="19%">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="5" bgcolor="#CCCCCC"> 
      <div align="center">（<%=gtmc%>）柜总价</div>
    </td>
    <td width="11%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="13%" bgcolor="#CCCCCC"> 
      <div align="center"><%=zj%></div>
    </td>
    <td width="19%">&nbsp;</td>
  </tr>
</table>
<P> <%
	}
	rs.close();
	ps.close();
%>

<table width="100%" border="0" style='FONT-SIZE: 16px'>
  <tr> 
    <td width="34%" height="2">累计金额（小写）：<%=cf.doubleTrim(jjje)%>元</td>
    <td width="37%" height="2">实交款额：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;元（小写）</td>
    <td width="29%" height="2">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="3">累计金额（大写）：<%=cf.NumToRMBStr(cf.doubleTrim(jjje))%></td>
  </tr>
  <tr> 
    <td colspan="3">备注：<%=htbz%></td>
  </tr>
  <tr> 
    <td colspan="3"> 
      <p>&nbsp;</p>
    </td>
  </tr>
  <tr> 
    <td colspan="3"> 
      <table width="100%" border="0" style='FONT-SIZE: 16px'>
        <tr> 
          <td colspan="2">客户签字：</td>
          <td width="630">经办人：</td>
        </tr>
        <tr> 
          <td colspan="2">签合日期：<%=qhtsj%></td>
          <td width="630">签合日期：<%=qhtsj%></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<P>&nbsp; 
</body>
</html>
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
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


