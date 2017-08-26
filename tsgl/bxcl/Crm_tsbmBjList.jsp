<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>报修报警</B> 
</CENTER>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面


String wheresql="";


String clzt=null;
clzt=request.getParameter("clzt");
if (clzt!=null)
{
	clzt=cf.GB2Uni(clzt);
	if (!(clzt.equals("")))	wheresql+=" and  (crm_tsjl.clzt='"+clzt+"')";
}

String sfja=null;
sfja=request.getParameter("sfja");
if (sfja!=null)
{
	sfja=cf.GB2Uni(sfja);
	if (sfja.equals("Y"))
	{
		wheresql+=" and  (crm_tsjl.clzt in('3'))";
	}
	else if (sfja.equals("N"))
	{
		wheresql+=" and  (crm_tsjl.clzt in('1','4','5','6','7','2'))";
	}
}


String zrbmclzt=null;
zrbmclzt=request.getParameter("zrbmclzt");
if (zrbmclzt!=null)
{
	zrbmclzt=cf.GB2Uni(zrbmclzt);
	if (!(zrbmclzt.equals("")))	wheresql+=" and  (crm_tsbm.clzt='"+zrbmclzt+"')";
}


String sfjj=null;
sfjj=request.getParameter("sfjj");
if (sfjj!=null)
{
	sfjj=cf.GB2Uni(sfjj);
	if (sfjj.equals("Y"))
	{
		wheresql+=" and  (crm_tsbm.clzt in('3','5'))";
	}
	else if (sfjj.equals("N"))
	{
		wheresql+=" and  (crm_tsbm.clzt in('1','2','4','6','7','8','9','A','B','C'))";
	}
}

String khbh=null;
khbh=request.getParameter("khbh");
if (khbh!=null)
{
	if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
}
String hth=null;
hth=request.getParameter("hth");
if (hth!=null)
{
	if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
}
String sjs=null;
sjs=request.getParameter("sjs");
if (sjs!=null)
{
	sjs=cf.GB2Uni(sjs);
	if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
}
String zjxm=null;
zjxm=request.getParameter("zjxm");
if (zjxm!=null)
{
	zjxm=cf.GB2Uni(zjxm);
	if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm+"')";
}
String sgd=null;
sgd=request.getParameter("sgd");
if (sgd!=null)
{
	sgd=cf.GB2Uni(sgd);
	if (!(sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+sgd+"')";
}
String sgbz=null;
sgbz=request.getParameter("sgbz");
if (sgbz!=null)
{
	sgbz=cf.GB2Uni(sgbz);
	if (!(sgbz.equals("")))	wheresql+=" and  (crm_khxx.sgbz='"+sgbz+"')";
}

String khxm=null;
khxm=request.getParameter("khxm");
if (khxm!=null)
{
	khxm=cf.GB2Uni(khxm);
	if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
}
String khxm2=null;
khxm2=request.getParameter("khxm2");
if (khxm2!=null)
{
	khxm2=cf.GB2Uni(khxm2);
	if (!(khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm2+"%')";
}

String fwdz=null;
fwdz=request.getParameter("fwdz");
if (fwdz!=null)
{
	fwdz=cf.GB2Uni(fwdz);
	if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+fwdz+"')";
}
String fwdz2=null;
fwdz2=request.getParameter("fwdz2");
if (fwdz2!=null)
{
	fwdz2=cf.GB2Uni(fwdz2);
	if (!(fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz2+"%')";
}

String lxfs=null;
lxfs=request.getParameter("lxfs");
if (lxfs!=null)
{
	lxfs=cf.GB2Uni(lxfs);
	if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+lxfs+"')";
}

String lxfs2=null;
lxfs2=request.getParameter("lxfs2");
if (lxfs2!=null)
{
	lxfs2=cf.GB2Uni(lxfs2);
	if (!(lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs2+"%')";
}


String crm_tsbm_tsxlbm=null;
String crm_tsbm_tslxbm=null;
crm_tsbm_tslxbm=request.getParameter("crm_tsbm_tslxbm");
if (crm_tsbm_tslxbm!=null)
{
	crm_tsbm_tslxbm=cf.GB2Uni(crm_tsbm_tslxbm);
	if (!(crm_tsbm_tslxbm.equals("")))	wheresql+=" and  (crm_tsbm.tslxbm='"+crm_tsbm_tslxbm+"')";
}
crm_tsbm_tsxlbm=request.getParameter("crm_tsbm_tsxlbm");
if (crm_tsbm_tsxlbm!=null)
{
	crm_tsbm_tsxlbm=cf.GB2Uni(crm_tsbm_tsxlbm);
	if (!(crm_tsbm_tsxlbm.equals("")))	wheresql+=" and  (crm_tsbm.tsxlbm='"+crm_tsbm_tsxlbm+"')";
}


String crm_tsbm_tspp=null;
crm_tsbm_tspp=request.getParameter("crm_tsbm_tspp");
if (crm_tsbm_tspp!=null)
{
	crm_tsbm_tspp=cf.GB2Uni(crm_tsbm_tspp);
	if (!(crm_tsbm_tspp.equals("")))	wheresql+=" and  (crm_tsbm.tspp='"+crm_tsbm_tspp+"')";
}

String crm_tsbm_tspp2=null;
crm_tsbm_tspp2=request.getParameter("crm_tsbm_tspp2");
if (crm_tsbm_tspp2!=null)
{
	crm_tsbm_tspp2=cf.GB2Uni(crm_tsbm_tspp2);
	if (!(crm_tsbm_tspp2.equals("")))	wheresql+=" and  (crm_tsbm.tspp like '%"+crm_tsbm_tspp2+"%')";
}

String slsj=null;
String slsj2=null;
slsj=request.getParameter("slsj");
if (slsj!=null)
{
	if (!(slsj.equals("")))	wheresql+="  and (crm_tsjl.slsj>=TO_DATE('"+slsj+"','YYYY/MM/DD'))";
}
slsj2=request.getParameter("slsj2");
if (slsj2!=null)
{
	if (!(slsj2.equals("")))	wheresql+="  and (crm_tsjl.slsj<=TO_DATE('"+slsj2+"','YYYY/MM/DD'))";
}
String lrsj=null;
lrsj=request.getParameter("lrsj");
if (lrsj!=null)
{
	if (!(lrsj.equals("")))	wheresql+="  and (crm_tsjl.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
}
lrsj=request.getParameter("lrsj2");
if (lrsj!=null)
{
	if (!(lrsj.equals("")))	wheresql+="  and (crm_tsjl.lrsj<=TO_DATE('"+lrsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
}



String fgs=request.getParameter("fgs");
if (fgs!=null)
{
	if (!fgs.equals(""))
	{
		wheresql+=" and  (crm_tsbm.ssfgs='"+fgs+"')";
	}
}

String dwbh=request.getParameter("dwbh");
if (dwbh!=null)
{
	if (!dwbh.equals(""))
	{
		wheresql+=" and  (crm_tsbm.dwbh='"+dwbh+"')";
	}
}

String sjcfasj=null;
sjcfasj=request.getParameter("sjcfasj");
if (sjcfasj!=null)
{
	sjcfasj=cf.GB2Uni(sjcfasj);
	if (!(sjcfasj.equals("")))	wheresql+="  and (crm_tsbm.sjcfasj>=TO_DATE('"+sjcfasj+"','YYYY/MM/DD'))";
}
sjcfasj=request.getParameter("sjcfasj2");
if (sjcfasj!=null)
{
	sjcfasj=cf.GB2Uni(sjcfasj);
	if (!(sjcfasj.equals("")))	wheresql+="  and (crm_tsbm.sjcfasj<=TO_DATE('"+sjcfasj+"','YYYY/MM/DD'))";
}

String jhjjsj=null;
jhjjsj=request.getParameter("jhjjsj");
if (jhjjsj!=null)
{
	jhjjsj=cf.GB2Uni(jhjjsj);
	if (!(jhjjsj.equals("")))	wheresql+="  and (crm_tsbm.jhjjsj>=TO_DATE('"+jhjjsj+"','YYYY/MM/DD'))";
}
jhjjsj=request.getParameter("jhjjsj2");
if (jhjjsj!=null)
{
	jhjjsj=cf.GB2Uni(jhjjsj);
	if (!(jhjjsj.equals("")))	wheresql+="  and (crm_tsbm.jhjjsj<=TO_DATE('"+jhjjsj+"','YYYY/MM/DD'))";
}

String clsj=null;
clsj=request.getParameter("clsj");
if (clsj!=null)
{
	clsj=cf.GB2Uni(clsj);
	if (!(clsj.equals("")))	wheresql+="  and (crm_tsbm.clsj>=TO_DATE('"+clsj+"','YYYY/MM/DD'))";
}
clsj=request.getParameter("clsj2");
if (clsj!=null)
{
	clsj=cf.GB2Uni(clsj);
	if (!(clsj.equals("")))	wheresql+="  and (crm_tsbm.clsj<=TO_DATE('"+clsj+"','YYYY/MM/DD'))";
}

String tsjlh=null;
tsjlh=request.getParameter("tsjlh");
if (tsjlh!=null)
{
	tsjlh=cf.GB2Uni(tsjlh);
	if (!(tsjlh.equals("")))	wheresql+="  and (crm_tsbm.tsjlh='"+tsjlh+"')";
}
	
%>


<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	
	//未及时接收
	int wjssl=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_tsjl,crm_khxx,crm_tsbm ";
    ls_sql+=" where crm_tsbm.tsjlh=crm_tsjl.tsjlh(+)";
    ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and crm_tsjl.lx='2'";//1：报修；2：报修
	ls_sql+=wheresql;
	ls_sql+=" and crm_tsbm.clzt='1'";//1：未接收
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wjssl=rs.getInt(1);
	}
	rs.close();
	ps.close();
	
	//未按计划出现场
	int wajhcxcsl=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_tsjl,crm_khxx,crm_tsbm ";
    ls_sql+=" where crm_tsbm.tsjlh=crm_tsjl.tsjlh(+)";
    ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and crm_tsjl.lx='2'";//1：报修；2：报修
	ls_sql+=wheresql;
	ls_sql+=" and crm_tsbm.clzt='4'";//4：已接收等待出现场
	ls_sql+=" and crm_tsbm.jhcxcsj<SYSDATE";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wajhcxcsl=rs.getInt(1);
	}
	rs.close();
	ps.close();
	
	//未按计划出方案
	int wajhcfasl=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_tsjl,crm_khxx,crm_tsbm ";
    ls_sql+=" where crm_tsbm.tsjlh=crm_tsjl.tsjlh(+)";
    ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and crm_tsjl.lx='2'";//1：报修；2：报修
	ls_sql+=wheresql;
	ls_sql+=" and crm_tsbm.clzt in('2','6')";//2：已接收等待出方案;6：已出现场等待方案
	ls_sql+=" and crm_tsbm.jhcfasj<SYSDATE";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wajhcfasl=rs.getInt(1);
	}
	rs.close();
	ps.close();
	
	//未按计划解决
	int wajhjjsl=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_tsjl,crm_khxx,crm_tsbm ";
    ls_sql+=" where crm_tsbm.tsjlh=crm_tsjl.tsjlh(+)";
    ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and crm_tsjl.lx='2'";//1：报修；2：报修
	ls_sql+=wheresql;
	ls_sql+=" and crm_tsbm.clzt in('1','2','4','6','7','8','9','A','B','C')";
	ls_sql+=" and crm_tsbm.jhjjsj<SYSDATE";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wajhjjsl=rs.getInt(1);
	}
	rs.close();
	ps.close();
	
	//未解决
	int wjj=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_tsjl,crm_khxx,crm_tsbm ";
    ls_sql+=" where crm_tsbm.tsjlh=crm_tsjl.tsjlh(+)";
    ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and crm_tsjl.lx='2'";//1：报修；2：报修
	ls_sql+=wheresql;
	ls_sql+=" and crm_tsbm.clzt in('1','2','4','6','7','8','9','A','B','C')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wjj=rs.getInt(1);
	}
	rs.close();
	ps.close();
	
	//未结案
	int wja=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_tsjl,crm_khxx,crm_tsbm ";
    ls_sql+=" where crm_tsbm.tsjlh=crm_tsjl.tsjlh(+)";
    ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and crm_tsjl.lx='2'";//1：报修；2：报修
	ls_sql+=wheresql;
	ls_sql+=" and crm_tsbm.clzt!='5'";//5：结案
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wja=rs.getInt(1);
	}
	rs.close();
	ps.close();



	%>
	<center>
	<table border="1" width="60%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 16px'>
		<tr  align="center" bgcolor="#9999FF" height="36">
		  <td width="58%" ><strong>报警状态</strong></td>
		  <td width="42%"><strong>数量</strong></td>
		</tr>
		<tr bgcolor="#FFFFFF"  align="center" height="36">
		  <td>未及时接收</td>
			<td><A HREF="Crm_tsbmWjsList.jsp?wheresql=<%=wheresql%>" target="_blank"><%=wjssl%></A></td>
		</tr>
		<tr bgcolor="#FFFFFF"  align="center" height="36">
			<td >未按计划出现场</td>
			<td><A HREF="Crm_tsbmWcxcList.jsp?wheresql=<%=wheresql%>" target="_blank"><%=wajhcxcsl%></A></td>
		  </tr>
		<tr bgcolor="#FFFFFF"  align="center" height="36">
			<td>未按计划出方案</td>
			<td><A HREF="Crm_tsbmWcfaList.jsp?wheresql=<%=wheresql%>" target="_blank"><%=wajhcfasl%></A></td>
		  </tr>
		<tr bgcolor="#FFFFFF"  align="center" height="36">
			<td>未按计划解决</td>
			<td><A HREF="Crm_tsbmWajhjjList.jsp?wheresql=<%=wheresql%>" target="_blank"><%=wajhjjsl%></A></td>
		  </tr>
		<tr bgcolor="#FFFFFF"  align="center" height="36">
			<td>未解决</td>
			<td><A HREF="Crm_tsbmWjjList.jsp?wheresql=<%=wheresql%>" target="_blank"><%=wjj%></A></td>
		  </tr>
		<tr bgcolor="#FFFFFF"  align="center" height="36">
			<td>未结案</td>
			<td><A HREF="Crm_tsbmWjaList.jsp?wheresql=<%=wheresql%>" target="_blank"><%=wja%></A></td>
		</tr>
	</table>
	</center>
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



</body>
</html>
