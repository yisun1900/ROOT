<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<%
String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String bg1="E8E8FF";
String bg2="FFFFFF";
int i=0;
int row=0;
String czxh=request.getParameter("czxh");

String khbh=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_lxfs=null;
String crm_khxx_hth=null;
String crm_khxx_sjs=null;
String crm_khxx_qye=null;
String crm_khxx_qyrq=null;
String crm_khxx_sgd=null;
String crm_khxx_sgbz=null;
String crm_khxx_zjxm=null;
String crm_khxx_dwbh=null;
String cl_djj_czxh=null;
String cl_djj_qye=null;
String cl_djj_sqlqsl=null;
String cl_djj_sqlqje=null;
String cl_djj_sjsl=null;
String cl_djj_sjje=null;
String cl_djj_sfjm=null;
String cl_djj_shzt=null;
String cl_djj_shr=null;
String cl_djj_shsj=null;
String cl_djj_lrr=null;
String cl_djj_lrsj=null;
String cl_djj_czzt=null;
String cl_djj_bz=null;
String sq_dwxx_dwmc=null;
String cl_djj_ylqze=null;
String cl_djj_shyj=null;
String cl_djj_ejshr=null;
String cl_djj_ejshsj=null;
String cl_djj_ejshyj=null;
String dyr=null;
String dysj=null;
String shjl=null;
String ejshjl=null;


String clbm=null;
String clmc=null;
String clgg=null;
double fgsdj=0;
double gdj=0;
double sqlqsl=0;
double sjsl=0;
double sqlqje=0;
double sjje=0;
double xjsqlqsl=0;
double xjsjsl=0;
double xjsqlqje=0;
double xjsjje=0;
String cldlmc=null;
String jldwmc=null;


double allsjje=0;

try {
	conn=cf.getConnection();

	ls_sql="select DECODE(shjl,'1','同意','2','不同意') shjl,DECODE(ejshjl,'1','同意','2','不同意') ejshjl,dysj,dyr,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.lxfs as crm_khxx_lxfs,crm_khxx.hth as crm_khxx_hth,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.qye as crm_khxx_qye,crm_khxx.qyrq as crm_khxx_qyrq,crm_khxx.sgd as crm_khxx_sgd,crm_khxx.sgbz as crm_khxx_sgbz,crm_khxx.zjxm as crm_khxx_zjxm,crm_khxx.dwbh as crm_khxx_dwbh,cl_djj.czxh as cl_djj_czxh,cl_djj.khbh as khbh,cl_djj.qye as cl_djj_qye,cl_djj.sqlqsl as cl_djj_sqlqsl,cl_djj.sqlqje as cl_djj_sqlqje,cl_djj.sjsl as cl_djj_sjsl,cl_djj.sjje as cl_djj_sjje,cl_djj.sfjm as cl_djj_sfjm,cl_djj.shzt as cl_djj_shzt,cl_djj.shr as cl_djj_shr,cl_djj.shsj as cl_djj_shsj,cl_djj.lrr as cl_djj_lrr,cl_djj.lrsj as cl_djj_lrsj,cl_djj.czzt as cl_djj_czzt,cl_djj.bz as cl_djj_bz,sq_dwxx.dwmc as sq_dwxx_dwmc,cl_djj.ylqze as cl_djj_ylqze,cl_djj.shyj as cl_djj_shyj,cl_djj.ejshr as cl_djj_ejshr,cl_djj.ejshsj as cl_djj_ejshsj,cl_djj.ejshyj as cl_djj_ejshyj ";
	ls_sql+=" from  cl_djj,crm_khxx,sq_dwxx";
	ls_sql+=" where cl_djj.dwbh=sq_dwxx.dwbh and cl_djj.khbh=crm_khxx.khbh and  (cl_djj.czxh='"+czxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		shjl=cf.fillHtml(rs.getString("shjl"));
		ejshjl=cf.fillHtml(rs.getString("ejshjl"));
		dysj=cf.fillHtml(rs.getDate("dysj"));
		dyr=cf.fillHtml(rs.getString("dyr"));
		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		crm_khxx_lxfs=cf.fillNull(rs.getString("crm_khxx_lxfs"));
		crm_khxx_hth=cf.fillNull(rs.getString("crm_khxx_hth"));
		crm_khxx_sjs=cf.fillNull(rs.getString("crm_khxx_sjs"));
		crm_khxx_qye=cf.fillNull(rs.getString("crm_khxx_qye"));
		crm_khxx_qyrq=cf.fillNull(rs.getDate("crm_khxx_qyrq"));
		crm_khxx_sgd=cf.fillNull(rs.getString("crm_khxx_sgd"));
		crm_khxx_sgbz=cf.fillHtml(rs.getString("crm_khxx_sgbz"));
		crm_khxx_zjxm=cf.fillNull(rs.getString("crm_khxx_zjxm"));
		crm_khxx_dwbh=cf.fillNull(rs.getString("crm_khxx_dwbh"));
		cl_djj_czxh=cf.fillNull(rs.getString("cl_djj_czxh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		cl_djj_qye=cf.fillNull(rs.getString("cl_djj_qye"));
		cl_djj_sqlqsl=cf.fillNull(rs.getString("cl_djj_sqlqsl"));
		cl_djj_sqlqje=cf.fillNull(rs.getString("cl_djj_sqlqje"));
		cl_djj_sjsl=cf.fillNull(rs.getString("cl_djj_sjsl"));
		cl_djj_sjje=cf.fillNull(rs.getString("cl_djj_sjje"));
		cl_djj_sfjm=cf.fillNull(rs.getString("cl_djj_sfjm"));
		cl_djj_shzt=cf.fillNull(rs.getString("cl_djj_shzt"));
		cl_djj_shr=cf.fillHtml(rs.getString("cl_djj_shr"));
		cl_djj_shsj=cf.fillHtml(rs.getDate("cl_djj_shsj"));
		cl_djj_lrr=cf.fillNull(rs.getString("cl_djj_lrr"));
		cl_djj_lrsj=cf.fillNull(rs.getDate("cl_djj_lrsj"));
		cl_djj_czzt=cf.fillNull(rs.getString("cl_djj_czzt"));
		cl_djj_bz=cf.fillHtml(rs.getString("cl_djj_bz"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		cl_djj_ylqze=cf.fillNull(rs.getString("cl_djj_ylqze"));
		cl_djj_shyj=cf.fillHtml(rs.getString("cl_djj_shyj"));
		cl_djj_ejshr=cf.fillHtml(rs.getString("cl_djj_ejshr"));
		cl_djj_ejshsj=cf.fillHtml(rs.getDate("cl_djj_ejshsj"));
		cl_djj_ejshyj=cf.fillHtml(rs.getString("cl_djj_ejshyj"));
	}
	rs.close();
	ps.close();

	
%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">代金券(操作序号:<%=czxh%>)</font></B>
</CENTER>

  
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 14px' >
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="17%"> 客户姓名 </td>
    <td width="33%"> <%=crm_khxx_khxm%>（<%=crm_khxx_lxfs%>）</td>
    <td align="right" width="17%"> 房屋地址 </td>
    <td width="33%"> <%=crm_khxx_fwdz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="17%">合同号 </td>
    <td width="33%"><%=crm_khxx_hth%> </td>
    <td align="right" width="17%">质检 </td>
    <td width="33%"><%=crm_khxx_zjxm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="17%">签约店面</td>
    <td width="33%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where  dwbh='"+crm_khxx_dwbh+"'",crm_khxx_dwbh,true);
%></td>
    <td align="right" width="17%">设计师</td>
    <td width="33%"><%=crm_khxx_sjs%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="17%">家装签约额 </td>
    <td width="33%"><%=crm_khxx_qye%> </td>
    <td align="right" width="17%">签约日期 </td>
    <td width="33%"><%=crm_khxx_qyrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="17%">施工队 </td>
    <td width="33%"><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+crm_khxx_sgd+"'",crm_khxx_sgd,true);
%> </td>
    <td align="right" width="17%">班长 </td>
    <td width="33%"><%=crm_khxx_sgbz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="17%">工程施工额</td>
    <td width="33%"><%=cl_djj_qye%></td>
    <td align="right" width="17%">应领取总额</td>
    <td width="33%"><%=cl_djj_ylqze%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="17%"> 申请领取数量 </td>
    <td width="33%"> <%=cl_djj_sqlqsl%> </td>
    <td align="right" width="17%"> 申请领取金额 </td>
    <td width="33%"> <%=cl_djj_sqlqje%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="17%"> 实际数量 </td>
    <td width="33%"> <%=cl_djj_sjsl%> </td>
    <td align="right" width="17%"> 实际金额 </td>
    <td width="33%"> <%=cl_djj_sjje%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="17%"> 是否申请减免 </td>
    <td width="33%"> <%
	cf.radioToken(out, "1+不申请&2+申请减免",cl_djj_sfjm,true);
%> </td>
    <td align="right" width="17%"> 减免是否审核 </td>
    <td width="33%"> <%
	cf.radioToken(out, "1+未审核&2+一级审核&3+二级审核",cl_djj_shzt,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="17%">一级审核结论</td>
    <td width="33%"><%=shjl%></td>
    <td align="right" width="17%">&nbsp;</td>
    <td width="33%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="17%"> 一级审核人 </td>
    <td width="33%"> <%=cl_djj_shr%> </td>
    <td align="right" width="17%"> 一级审核时间 </td>
    <td width="33%"> <%=cl_djj_shsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="17%">一级审核意见</td>
    <td colspan="3"><%=cl_djj_shyj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" width="17%">二级审核结论</td>
    <td width="33%"><%=ejshjl%></td>
    <td align="right" width="17%">&nbsp;</td>
    <td width="33%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="17%">二级审核人 </td>
    <td width="33%"><%=cl_djj_ejshr%> </td>
    <td align="right" width="17%">二级审核时间 </td>
    <td width="33%"><%=cl_djj_ejshsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="17%">二级审核意见 </td>
    <td colspan="3"> <%=cl_djj_ejshyj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="17%"> 录入人 </td>
    <td width="33%"> <%=cl_djj_lrr%> </td>
    <td align="right" width="17%"> 录入时间 </td>
    <td width="33%"> <%=cl_djj_lrsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="17%"> 打印人 </td>
    <td width="33%"> <%=dyr%> </td>
    <td align="right" width="17%"> 打印时间 </td>
    <td width="33%"> <%=dysj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="17%"> 操作状态 </td>
    <td width="33%"> <%
	cf.selectToken(out,"1+未提交&2+已提交&3+已打印",cl_djj_czzt,true);
%> </td>
    <td align="right" width="17%">分公司 </td>
    <td width="33%"><%=sq_dwxx_dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="17%"> 备注 </td>
    <td colspan="3"> <%=cl_djj_bz%> </td>
  </tr>
</table>

  <table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 14px' >
    <tr  align="center"> 
      <td  width="12%" bgcolor="#CCCCCC">材料大类</td>
      <td  width="8%" bgcolor="#CCCCCC">签约百分比</td>
      <td  width="10%" bgcolor="#CCCCCC">应领取金额</td>
      <td  width="10%" bgcolor="#CCCCCC">累计申领金额</td>
      <td  width="10%" bgcolor="#CCCCCC">差额</td>
      <td  width="10%" bgcolor="#CCCCCC">累计申领比例</td>
      <td  width="30%" bgcolor="#CCCCCC">减免原因</td>
    </tr>
    <%
	
	
	double qybfb=0;
	double ylqje=0;
	String ce=null;
	String jmyy=null;
	double xjylqje=0;
	xjsjje=0;
	ls_sql="SELECT cl_djjflmx.cldlmc,cl_djjflmx.qybfb,cl_djjflmx.ylqje,cl_djjflmx.sjje,cl_djjflmx.jmyy ";
	ls_sql+=" FROM cl_djjflmx ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ls_sql+=" order by cldlmc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		cldlmc=cf.fillNull(rs.getString("cldlmc"));
		qybfb=rs.getDouble("qybfb");
		jmyy=cf.fillHtml(rs.getString("jmyy"));
		ylqje=rs.getDouble("ylqje");
		sjje=rs.getDouble("sjje");

		xjylqje+=ylqje;
		xjsjje+=sjje;

		row++;


%> 
    <tr bgcolor="<%if (row%2==0){out.print(bg1);}else {out.print(bg2);}%>"> 
      <td > 
        <div align="center"><%=cldlmc%></div>
      </td>
      <td > 
        <div align="center"><%=qybfb%>%</div>
      </td>
      <td > 
        <div align="center"><%=ylqje%>&nbsp;</div>
      </td>
      <td > 
        <div align="center"><%=sjje%>&nbsp;</div>
      </td>
      <td > 
        <div align="center"><%=cf.formatDouble(ylqje-sjje)%></div>
      </td>
      <td > 
        <div align="center"><%=cf.formatDouble(sjje*100.0/ylqje)%>％</div>
      </td>
      <td > <%=jmyy%>
      </td>
    </tr>
    <%
	}
	rs.close();
	ps.close();
%> 
     <tr align="center"> 
      <td colspan="2">小 计</td>
      <td><%=cf.formatDouble(xjylqje)%></td>
      <td><%=cf.formatDouble(xjsjje)%></td>
      <td><%=cf.formatDouble(xjylqje-xjsjje)%></td>
      <td><%=cf.formatDouble(xjsjje*100.0/xjylqje)%>％</td>
      <td>&nbsp;</td>
    </tr>
  </table>


<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 15px' >
  <tr bgcolor="#CCCCCC"> 
    <td  width="4%" align="center">序号</td>
    <td  width="12%" align="center">材料名称</td>
    <td  width="12%" align="center">材料规格</td>
    <td  width="12%" align="center">材料大类</td>
    <td  width="8%" align="center">计量单位</td>
    <td  width="8%" align="center">工队价</td>
    <td  width="8%" align="center">申请数量</td>
    <td  width="10%" align="center">申请金额</td>
    <td  width="8%" align="center">审核数量</td>
    <td  width="10%" align="center">审核金额</td>
  </tr>
  <%
	xjsqlqsl=0;
	xjsjsl=0;
	xjsqlqje=0;
	xjsjje=0;

	ls_sql="SELECT czxh,clbm clbm,clmc,clgg,gdj,sqlqsl,sjsl,cldlmc,jldwmc  ";
	ls_sql+=" FROM cl_djjmx ";
	ls_sql+=" where czxh='"+czxh+"' ";
	ls_sql+=" order by cldlmc, clbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		i++;
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		clgg=cf.fillNull(rs.getString("clgg"));
		gdj=rs.getDouble("gdj");
		sqlqsl=rs.getDouble("sqlqsl");
		sjsl=rs.getDouble("sjsl");
		cldlmc=cf.fillNull(rs.getString("cldlmc"));
		jldwmc=cf.fillNull(rs.getString("jldwmc"));


		sqlqje=cf.doubleTrim(sqlqsl*gdj);
		sjje=cf.doubleTrim(sjsl*gdj);

		xjsqlqsl+=sqlqsl;
		xjsjsl+=sjsl;
		xjsqlqje+=sqlqje;
		xjsjje+=sjje;
%> 
  <tr bgcolor="<%if (i%2==0){out.print(bg1);}else {out.print(bg2);}%>" align="center"> 
    <td><%=i%></td>
    <td><%=clmc%></td>
    <td><%=clgg%></td>
    <td><%=cldlmc%></td>
    <td><%=jldwmc%></td>
    <td><%=gdj%></td>
    <td><%=sqlqsl%></td>
    <td><%=sqlqje%></td>
    <td><%=sjsl%></td>
    <td><%=sjje%></td>
  </tr>
  <%
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

xjsqlqsl=cf.doubleTrim(xjsqlqsl);
xjsjsl=cf.doubleTrim(xjsjsl);
xjsqlqje=cf.doubleTrim(xjsqlqje);

xjsjje=cf.doubleTrim(xjsjje);

%> 
  <tr align="center"> 
    <td colspan="4">合计</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><%=xjsqlqsl%></td>
    <td><%=xjsqlqje%></td>
    <td><%=xjsjsl%></td>
    <td><%=xjsjje%></td>
  </tr>
</table>
</body>

</html>
