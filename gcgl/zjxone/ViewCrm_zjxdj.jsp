<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String crm_zjxdj_zjxxh=null;
String khbh=null;
String dm_zjxfsjd_zjxfsjdmc=null;
String crm_zjxdj_zjxyysm=null;
double zjje=0;
String crm_zjxdj_lrr=null;
String crm_zjxdj_lrsj=null;
String crm_zjxdj_fssj=null;
String crm_zjxdj_lrdw=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_lxfs=null;
String crm_khxx_hth=null;
String crm_khxx_sjs=null;
String crm_khxx_qye=null;
String crm_khxx_qyrq=null;
String crm_khxx_dwbh=null;
String crm_khxx_sgd=null;
String crm_khxx_zjxm=null;
String jzjje=null;
String kglf=null;
String kqtk=null;
double zhzjxje=0;
double zjxje=0;
double yqgcze=0;
double zjxsuijin=0;
double zqguanlif=0;
double zhguanlif=0;
double glfbfb=0;
double suijin=0;
double suijinbfb=0;

double zjxjme=0;
double glfjmje=0;
double sjjmje=0;
double zjxzkl=0;
double cxhdzjxzkl=0;
double glfzkl=0;
double cxhdglfzkl=0;


String zjxyymc=null;
String zjxwcbz=null;
String wdzgce=null;
String qye=null;
String zkl=null;
String jzbz=null;

String zklx="";
String lx=null;

String zjxxh=null;
zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select crm_zjxdj.lx,crm_zjxdj.zjxsuijin,crm_zjxdj.zqguanlif,crm_zjxdj.zhguanlif,crm_khxx.glfbfb,crm_khxx.suijin,crm_khxx.suijinbfb,crm_khxx.zhzjxje,crm_zjxdj.yqgcze,crm_khxx.jzbz,crm_khxx.wdzgce,crm_khxx.zkl,crm_khxx.zjxje,DECODE(crm_zjxdj.zjxwcbz,'1','未完成','2','已完成') zjxwcbz,crm_zjxdj.kqtk,jzjje,crm_zjxdj.kglf,crm_zjxdj.zjxxh as crm_zjxdj_zjxxh,crm_zjxdj.khbh as khbh,dm_zjxfsjd.zjxfsjdmc as dm_zjxfsjd_zjxfsjdmc,crm_zjxdj.zjxyysm as crm_zjxdj_zjxyysm,crm_zjxdj.zjje as zjje,crm_zjxdj.lrr as crm_zjxdj_lrr,crm_zjxdj.lrsj as crm_zjxdj_lrsj,crm_zjxdj.fssj as crm_zjxdj_fssj,crm_zjxdj.lrdw as crm_zjxdj_lrdw,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.lxfs as crm_khxx_lxfs,crm_khxx.hth as crm_khxx_hth,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.qye as crm_khxx_qye,crm_khxx.qyrq as crm_khxx_qyrq,crm_khxx.dwbh as crm_khxx_dwbh,crm_khxx.sgd as crm_khxx_sgd,crm_khxx.zjxm as crm_khxx_zjxm ";
	ls_sql+=" ,crm_zjxdj.zjxjme,crm_zjxdj.glfjmje,crm_zjxdj.sjjmje,crm_zjxdj.zjxzkl,crm_zjxdj.cxhdzjxzkl,crm_zjxdj.glfzkl,crm_zjxdj.cxhdglfzkl";
	ls_sql+=" from  crm_zjxdj,dm_zjxfsjd,crm_khxx";
	ls_sql+=" where crm_zjxdj.zjxfsjd=dm_zjxfsjd.zjxfsjd(+) and crm_zjxdj.khbh=crm_khxx.khbh(+) and  (crm_zjxdj.zjxxh='"+zjxxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjxjme=rs.getDouble("zjxjme");
		glfjmje=rs.getDouble("glfjmje");
		sjjmje=rs.getDouble("sjjmje");
		zjxzkl=rs.getDouble("zjxzkl");
		cxhdzjxzkl=rs.getDouble("cxhdzjxzkl");
		glfzkl=rs.getDouble("glfzkl");
		cxhdglfzkl=rs.getDouble("cxhdglfzkl");

		
		lx=cf.fillNull(rs.getString("lx"));
		zjxsuijin=rs.getDouble("zjxsuijin");
		zqguanlif=rs.getDouble("zqguanlif");
		zhguanlif=rs.getDouble("zhguanlif");
		glfbfb=rs.getDouble("glfbfb");
		suijin=rs.getDouble("suijin");
		suijinbfb=rs.getDouble("suijinbfb");
		zhzjxje=rs.getDouble("zhzjxje");
		zjxje=rs.getDouble("zjxje");
		yqgcze=rs.getDouble("yqgcze");
		jzbz=cf.fillNull(rs.getString("jzbz"));
		wdzgce=cf.fillNull(rs.getString("wdzgce"));
		zkl=cf.fillNull(rs.getString("zkl"));
		zjxwcbz=cf.fillNull(rs.getString("zjxwcbz"));
		kqtk=cf.fillNull(rs.getString("kqtk"));
		jzjje=cf.fillNull(rs.getString("jzjje"));
		kglf=cf.fillNull(rs.getString("kglf"));
		crm_zjxdj_zjxxh=cf.fillNull(rs.getString("crm_zjxdj_zjxxh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		dm_zjxfsjd_zjxfsjdmc=cf.fillNull(rs.getString("dm_zjxfsjd_zjxfsjdmc"));
		crm_zjxdj_zjxyysm=cf.fillNull(rs.getString("crm_zjxdj_zjxyysm"));
		zjje=rs.getDouble("zjje");
		crm_zjxdj_lrr=cf.fillNull(rs.getString("crm_zjxdj_lrr"));
		crm_zjxdj_lrsj=cf.fillNull(rs.getDate("crm_zjxdj_lrsj"));
		crm_zjxdj_fssj=cf.fillNull(rs.getDate("crm_zjxdj_fssj"));
		crm_zjxdj_lrdw=cf.fillNull(rs.getString("crm_zjxdj_lrdw"));
		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		crm_khxx_lxfs=cf.fillNull(rs.getString("crm_khxx_lxfs"));
		crm_khxx_hth=cf.fillNull(rs.getString("crm_khxx_hth"));
		crm_khxx_sjs=cf.fillNull(rs.getString("crm_khxx_sjs"));
		crm_khxx_qye=cf.fillNull(rs.getString("crm_khxx_qye"));
		crm_khxx_qyrq=cf.fillNull(rs.getDate("crm_khxx_qyrq"));
		crm_khxx_dwbh=cf.fillNull(rs.getString("crm_khxx_dwbh"));
		crm_khxx_sgd=cf.fillNull(rs.getString("crm_khxx_sgd"));
		crm_khxx_zjxm=cf.fillNull(rs.getString("crm_khxx_zjxm"));
	}
	else{
		rs.close();
		ps.close();

		return;
	}
	rs.close();
	ps.close();

	ls_sql="select zklx";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zklx=cf.fillNull(rs.getString("zklx"));
	}
	rs.close();
	ps.close();

	zjxyymc="";
	int row=0;
	ls_sql="select zjxyymc";
	ls_sql+=" from  dm_zjxyybm,crm_zjxyydj";
	ls_sql+=" where dm_zjxyybm.zjxyybm=crm_zjxyydj.zjxyybm and crm_zjxyydj.zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		row++;
		zjxyymc+=row+"、"+rs.getString("zjxyymc")+"；";
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

<body bgcolor="#000033">
<div align="center"><font color="#FFFF99">增减项登记（增减项序号：<%=crm_zjxdj_zjxxh%>）</font></div> 
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      客户编号    </td>
    <td width="32%"><%=khbh%> </td>
    <td width="20%" align="right"> 
      合同号    </td>
    <td width="30%"><%=crm_khxx_hth%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%">客户姓名</td>
    <td width="32%"><%=crm_khxx_khxm%>（<%=crm_khxx_lxfs%>）</td>
    <td align="right" width="20%">签约日期</td>
    <td width="30%"><%=crm_khxx_qyrq%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      房屋地址    </td>
    <td colspan="3"> <%=crm_khxx_fwdz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      签约店面    </td>
    <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+crm_khxx_dwbh+"'",crm_khxx_dwbh,true);
%></td>
    <td width="20%" align="right"> 
      设计师    </td>
    <td width="30%"> <%=crm_khxx_sjs%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      工程担当    </td>
    <td width="32%"><%=crm_khxx_zjxm%></td>
    <td width="20%" align="right"> 
      施工队    </td>
    <td width="30%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+crm_khxx_sgd+"'",crm_khxx_sgd,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"><font color="#0000CC"><b>合同折扣</b></font></td>
    <td width="32%"><font color="#0000CC"><b><%=zkl%></b></font></td>
    <td width="20%" align="right"><font color="#0000CC"><b>折扣类型</b></font></td>
    <td width="30%"><font color="#0000CC"><b><%
	cf.radioToken(out,"1+全额折扣&2+单项折扣",zklx,true);
%></b></font></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      工程原报价    </td>
    <td width="32%"><%=wdzgce%> </td>
    <td width="20%" align="right"> 
      工程签约额    </td>
    <td width="30%"><%=crm_khxx_qye%> </td>
  </tr>
  <tr bgcolor="#CCCCFF" align="center"> 
    <td colspan="4">本期增减情况</td>
  </tr>
</table>

<BR>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td colspan="2" align="center" bgcolor="#E8E8FF"><STRONG>工程费</STRONG></td>
    <td width="2%" rowspan="7" align="right" bgcolor="#000033">&nbsp;</td>
    <td colspan="2" align="center" bgcolor="#E8E8FF"><STRONG>管理费</STRONG></td>
    <td width="2%" rowspan="7" align="right" bgcolor="#000033">&nbsp;</td>
    <td colspan="2" align="center" bgcolor="#E8E8FF"><STRONG>税金</STRONG></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="2" align="center" bgcolor="#FFFFFF"><p><font color="#CC0066">增项为正，减项为负</font></p></td>
    <td align="right">管理费百分比</td>
    <td bgcolor="#FFFFFF"><%=glfbfb%>％</td>
    <td align="right" bgcolor="#FFFFFF">税金百分比</td>
    <td bgcolor="#FFFFFF"><%=suijinbfb%>％</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="14%">增减额-折前</td>
    <td width="18%" bgcolor="#FFFFFF"><%=zjje%></td>
    <td align="right" width="17%">增减额-折前</td>
    <td width="17%" bgcolor="#FFFFFF"><%=zqguanlif%></td>
    <td width="14%" align="right" bgcolor="#FFFFFF">增减额</td>
    <td width="16%" bgcolor="#FFFFFF"><%=zjxsuijin%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">折扣</td>
    <td bgcolor="#FFFFFF"><%=zjxzkl%></td>
    <td align="right">折扣</td>
    <td bgcolor="#FFFFFF"><%=glfzkl%></td>
    <td align="right" bgcolor="#FFFFFF">减免额</td>
    <td bgcolor="#FFFFFF"><%=sjjmje%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="14%">活动折扣</td>
    <td width="18%" bgcolor="#FFFFFF"><%=cxhdzjxzkl%></td>
    <td align="right" width="17%">活动折扣</td>
    <td width="17%" bgcolor="#FFFFFF"><%=cxhdglfzkl%></td>
    <td colspan="2" align="center"><STRONG>其它款项</STRONG></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="14%">增减额-折后</td>
    <td width="18%" bgcolor="#FFFFFF"><%=jzjje%></td>
    <td align="right" width="17%">增减额-折后</td>
    <td width="17%" bgcolor="#FFFFFF"><%=zhguanlif%></td>
    <td align="right" width="14%">减项扣管理费</td>
    <td width="16%" bgcolor="#FFFFFF"><%=kglf%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="14%">减免额</td>
    <td width="18%" bgcolor="#FFFFFF"><%=zjxjme%></td>
    <td align="right" width="17%">减免额</td>
    <td width="17%" bgcolor="#FFFFFF"><%=glfjmje%></td>
    <td align="right" width="14%">扣其它款</td>
    <td width="16%" bgcolor="#FFFFFF"><%=kqtk%></td>
  </tr>
</table>
<BR>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#0000CC"><b>增减前工程总额</b></font></td>
    <td width="32%"><font color="#0000CC"><b><%=cf.formatDouble(yqgcze)%></b></font></td>
    <td width="20%" align="right" bgcolor="#FFFFFF"><b><font color="#0000CC">增减后工程总额</font></b></td>
    <td width="30%" bgcolor="#FFFFFF"><font color="#0000CC"><b><%=cf.formatDouble(yqgcze+zjje)%></b></font></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right" height="19">增减项完成标志</td>
    <td width="32%" height="19"><%=zjxwcbz%></td>
    <td width="20%" align="right" height="19">&nbsp;</td>
    <td width="30%" height="19"></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      增减项发生阶段    </td>
    <td width="32%"> <%=dm_zjxfsjd_zjxfsjdmc%> </td>
    <td width="20%" align="right"> 
      增减项发生时间    </td>
    <td width="30%"><%=crm_zjxdj_fssj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%">增减项原因</td>
    <td colspan="3"><%=zjxyymc%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%">增减项说明</td>
    <td colspan="3"><%=crm_zjxdj_zjxyysm%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">录入单位</td>
    <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+crm_zjxdj_lrdw+"'",crm_zjxdj_lrdw,true);
%></td>
    <td width="20%" align="right"><b>类型</b></td>
    <td width="30%"><font color="#0000CC"><b><%
	cf.radioToken(out,"1+有明细&2+无明细",lx,true);
%></b></font></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      录入时间    </td>
    <td width="32%"> <%=crm_zjxdj_lrsj%> </td>
    <td width="20%" align="right"> 
      录入人    </td>
    <td width="30%"><%=crm_zjxdj_lrr%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF" align="center"> 
    <td colspan="4">  

      <input type="button" name="Submit2" value="工程原报价" onClick="window.open('/dzbj/zxbjmx/Bj_khbjmxDyList.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>')">
      <input type="button" name="Button2" value="增减前情况" onClick="window.open('/gcgl/zjx/dzbj/zxbjmx/Bj_khbjmxQList.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>')">
      <input type="button" name="Button" value="增减后情况" onClick="window.open('/gcgl/zjx/dzbj/zxbjmx/Bj_khbjmxHList.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>')">
      <input type="button" name="Button3" value="增减前后对比" onClick="window.open('/gcgl/zjx/dzbj/zxbjmx/Bj_khbjmxQHList.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>')">
      <input type="button" name="Button3" value="电子报价变更明细" onClick="window.open('/gcgl/zjx/dzbj/zxbjmx/Bj_khbjmxBgdList.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>')">
		<input type="button" name="Button32" value="变更单" onClick="window.open('/gcgl/zjx/ViewCrm_zjxbgd.jsp?zjxxh=<%=zjxxh%>')"></td>
  </tr>
</table>




</body>
</html>
