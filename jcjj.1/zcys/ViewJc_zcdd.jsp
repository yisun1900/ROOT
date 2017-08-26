<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");

String khbh=null;
String clzt=null;
String lrr=null;
String lrsj=null;
String dwbh=null;
String bz=null;

String zcdlbm=null;
String zcxlbm=null;
String ppbm=null;
  
 
double wdzje=0;
double hkze=0;
double htcxhdje=0;
 
double zqclf=0;
double zhclf=0;

double ycf=0;
double qtf=0;

  

String ddbh=null;
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

String fgsbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qye=null;
String kgrq=null;
String jgrq=null;
String dmdwbh=null;
String dwmc=null;
String cxhdbm=null;

String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;
String bzdh="";
String zjdh="";
String sjsdh="";
String dzdh=null;
String ssfgs=null;
String ddlx=null;
String gys=null;
String ppmc=null;
  
 
try {
	conn=cf.getConnection();
	ls_sql="select  jc_zcysd.khbh,fgsbh,zcdlbm,zcxlbm,gys,ppmc,ppbm,DECODE(jc_zcysd.clzt,'00','录入预算单','01','预算单完成','02','转为正式订单') clzt,jc_zcysd.lrr,jc_zcysd.lrsj,jc_zcysd.dwbh,jc_zcysd.bz";
	ls_sql+=" ,wdzje,jc_zcysd.hkze,htcxhdje,zqclf,zhclf,ycf,qtf ";
 	ls_sql+=" from  jc_zcysd";
	ls_sql+=" where jc_zcysd.ddbh='"+ddbh+"'  ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		zcxlbm=cf.fillNull(rs.getString("zcxlbm"));
		zcdlbm=cf.fillNull(rs.getString("zcdlbm"));
 		gys=cf.fillNull(rs.getString("gys"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		ppbm=cf.fillNull(rs.getString("ppbm"));
 
 
 		clzt=cf.fillNull(rs.getString("clzt"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getString("lrsj"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		bz=cf.fillNull(rs.getString("bz"));

 		wdzje=rs.getDouble("wdzje");
		hkze=rs.getDouble("hkze");
		htcxhdje=rs.getDouble("htcxhdje");
		zqclf=rs.getDouble("zqclf");
		zhclf=rs.getDouble("zhclf");
		ycf=rs.getDouble("ycf");
		qtf=rs.getDouble("qtf");
 	}
	rs.close();
	ps.close();

	ls_sql="select khxm,fwdz,lxfs,hth,sjs,qye,kgrq,jgrq,ssfgs,crm_khxx.dwbh,dwmc,cxhdbm,zjxm,sgd,sgbz,qyrq";
	ls_sql+=" from  sq_dwxx,crm_khxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and  (crm_khxx.khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		dmdwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));

		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh from sq_sgd";
	ls_sql+=" where sgd='"+sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dzdh=cf.fillNull(rs.getString("dh"));
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

	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx,sq_dwxx";
	ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and  sq_dwxx.ssfgs='"+ssfgs+"' and yhmc ='"+zjxm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where dwbh='"+dmdwbh+"' and yhmc ='"+sjs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();


	if (yhjs.equals("G0"))
	{
		qye="&nbsp;";
		sjs="&nbsp;";
		sjsdh="&nbsp;";
	}

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" +ls_sql);
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
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">
<div align="center">主材预算单（订单编号：<%=ddbh%>） 
</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right" bgcolor="#CCCCFF"> 
      客户编号    </td>
    <td width="30%" bgcolor="#CCCCFF"> <%=khbh%> </td>
    <td width="290" align="right" bgcolor="#CCCCFF"> 
      合同号    </td>
    <td width="29%" bgcolor="#CCCCFF"><%=hth%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right">客户姓名</td>
    <td width="30%"><%=khxm%>（ 
      <input type="button" value="查看电话" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')" name="button4" >
      ）</td>
    <td width="290" align="right">质检</td>
    <td width="29%"><%=zjxm%>（<%=zjdh%>） </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right">房屋地址</td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
  <tr> 
    <td width="20%" bgcolor="#CCCCFF" align="right">签约店面</td>
    <td width="30%" bgcolor="#CCCCFF"><%=dwmc%></td>
    <td width="290" bgcolor="#CCCCFF" align="right">家装设计师</td>
    <td width="29%" bgcolor="#CCCCFF"><%=sjs%>（<%=sjsdh%>）</td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right"> 
      施工队    </td>
    <td width="30%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>（<%=dzdh%>） </td>
    <td width="290" align="right"> 
      班长    </td>
    <td width="29%"><%=sgbz%>（<%=bzdh%>） </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right"> 
      家装签约日期    </td>
    <td width="30%"> <%=qyrq%> </td>
    <td width="290" align="right">&nbsp;</td>
    <td width="29%">&nbsp;</td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right" bgcolor="#CCCCFF">合同开工日期</td>
    <td width="30%"><%=kgrq%></td>
    <td width="290" align="right">合同竣工日期</td>
    <td width="29%"><%=jgrq%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right" bgcolor="#CCFFCC">参加促销活动</td>
    <td colspan="3"> <%=cxhdbm%> </td>
  </tr>
  <tr align="right" bgcolor="#FFFFFF"> 
    <td colspan="4" bgcolor="#FFFFFF" height="24">&nbsp;</td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right" bgcolor="#CCFFCC"><strong> 
      处理状态    </strong></td>
    <td width="30%"> <strong>
      <%
	cf.selectItem(out,"select clzt,clztmc from jdm_zcddzt where clzt='"+clzt+"'",clzt,true);
%> 
    </strong></td>
    <td width="290" align="right">&nbsp;</td>
    <td width="29%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" bgcolor="#FFFFFF" align="right">主材大类</td>
    <td width="30%"> <%=zcdlbm%> </td>
    <td width="290" align="right">主材小类</td>
    <td width="29%"><%=zcxlbm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right">品牌供应商</td>
    <td width="30%"><%=ppbm%></td>
    <td width="290" align="right">&nbsp;</td>
    <td width="29%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right">品牌</td>
    <td width="30%"><%=ppmc%></td>
    <td width="290" align="right">供应商</td>
    <td width="29%"><%=gys%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right"><strong>折前－材料费</strong></td>
    <td><%=zqclf%></td>
    <td align="right"><strong>折后－材料费</strong></td>
    <td><%=zhclf%></td>
  </tr>
  
  <tr bgcolor="#FFFFCC">
    <td align="right"><strong>远程费</strong></td>
    <td><%=ycf%></td>
    <td align="right"><strong>其它费</strong></td>
    <td><%=qtf%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right"><b>折前－总额</b></td>
    <td><%=wdzje%></td>
    <td align="right"><b>折后－总额</b></td>
    <td><%=hkze%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="20%" align="right"><b>计入促销活动金额</b></td>
    <td width="30%"><%=htcxhdje%></td>
    <td width="290" align="right">&nbsp;</td>
    <td width="29%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right" bgcolor="#FFFFFF"> 
      录入人    </td>
    <td width="30%" bgcolor="#FFFFFF"><%=lrr%></td>
    <td width="290" align="right"> 
      录入时间    </td>
    <td width="29%" bgcolor="#FFFFFF"><%=lrsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right" bgcolor="#FFFFFF"> 
      录入部门    </td>
    <td width="30%" bgcolor="#FFFFFF"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
    <td width="290" align="right">    </td>
    <td width="29%" bgcolor="#FFFFFF">&nbsp; </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right">备注</td>
    <td colspan="3" bgcolor="#FFFFFF"><%=bz%></td>
  </tr>
</table>
<center>
  <b>订单明细</b> 
</center>
<table border="1" width="270%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="80px">手写标志</td>
	<td  width="110px">主材编码</td>
	<td  width="280px" bgcolor="#CCCCCC">主材名称</td>
	<td  width="280px">型号</td>
	<td  width="280px">规格</td>
	<td  width="110px" >最小起订量</td>
	<td  width="140px" bgcolor="#CC99FF">铺装位置</td>
	<td  width="140px" bgcolor="#CC99FF">颜色</td>
	<td  width="90px">折前实销单价</td>
	<td  width="90px">折扣</td>
	<td  width="90px">折后实销单价</td>
	<td  width="110px">单位</td>
	<td  width="80px" bgcolor="#CC99FF">计入活动比率</td>
	<td  width="110px">数量</td>
	<td  width="130px">折前材料费</td>
	<td  width="130px">折后材料费</td>
	<td  width="130px">远程费</td>
	<td  width="130px">其它费用</td>
	<td  width="130px">其它费金额</td>
	<td  width="130px" bgcolor="#CCCCCC"><font color="#0000CC"><strong>折前小计</strong></font></td>
	<td  width="130px" bgcolor="#CCCCCC"><font color="#0000CC"><strong>折后小计</strong></font></td>
	<td  width="130px">计入促销活动金额</td>

	<td  width="130px">市场标价</td>
	<td  width="130px">销售限价</td>
	<td  width="120px">标准计入活动比例</td>
	<td  width="90px">有促销</td>
	<td  width="170px">促销开始时间</td>
	<td  width="170px">促销结束时间</td>
	<td  width="130px">促销价</td>
	<td  width="130px">促销计入活动比例</td>
	<td  width="130px">配件数</td>
	<td  width="380px">系列</td>
	<td  width="130px" bgcolor="#CC99FF">选择价格</td>
	<td  width="130px">是否参加促销活动</td>
	<td  width="200px">手写合同原因</td>
	<td  width="480px">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	ls_sql ="SELECT DECODE(jc_zcysdmx.sxbz,'1','否','2','手写') sxbz,jc_zcysdmx.zcbm,zcmc,jc_zcysdmx.xinghao,jc_zcysdmx.gg,TO_CHAR(jc_zcysdmx.zxqdl),zcpzwzbm,jc_zcysdmx.zcysbm";
	ls_sql+=" ,TO_CHAR(jc_zcysdmx.zqdj) zqdj,TO_CHAR(jc_zcysdmx.dpzk) dpzk,TO_CHAR(jc_zcysdmx.dj) dj,jldwbm,cxhdbl||'%' cxhdbl,jc_zcysdmx.sl";
	ls_sql+=" ,jc_zcysdmx.zqje,jc_zcysdmx.je,ycf,DECODE(qtfy,'1','安装费','2','加工费','3','其它收费'),qtfyje,zqje+ycf+qtfyje zqhtxj,je+ycf+qtfyje zhhtxj,cxhdje";
	ls_sql+=" ,TO_CHAR(jc_zcysdmx.lsj),TO_CHAR(jc_zcysdmx.yhj),bzcxhdbl||'%',DECODE(sfycx,'N','无','Y','<font color=\"#FF0000\">有</font>'),cxkssj,cxjzsj,cxj,lscxhdbl||'%'";
	ls_sql+=" ,jc_zcysdmx.pjts*jc_zcysdmx.zjhsl pjzs,zclbbm";
	ls_sql+=" ,DECODE(xzjg,'0','手写','1','销售价','3','市场标价','2','<font color=\"#FF0000\">促销价</font>') xzjg,decode(cxhdbz,'Y','参加','N','不参加')";
	ls_sql+=" ,jc_zcysdmx.sxhtyy,jc_zcysdmx.bz";
	ls_sql+=" FROM jc_zcysdmx";
    ls_sql+=" where jc_zcysdmx.ddbh='"+ddbh+"' ";
    ls_sql+=" order by jc_zcysdmx.lx,jc_zcysdmx.xinghao";
	
	pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>
</body>
</html>
