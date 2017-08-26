<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权
	String zwbm=(String)session.getAttribute("zwbm");
	String sjsbh=(String)session.getAttribute("sjsbh");

	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String wheresql="";
	if (zwbm.equals("31"))//监理主管，只能看本小组工地
	{
		wheresql+=" and crm_khxx.zjxm in(select yhmc from sq_yhxx where sjsbh='"+sjsbh+"' and zwbm in('05','31') and sfzszg in('Y','N'))";
	}


	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
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







	String kp_xjgdjl_xjjlh=null;
	String kp_xjgdjl_khbh=null;
	String kp_xjgdjl_xjr=null;
	String kp_xjgdjl_xjsj=null;
	String xjlxbm=null;
	String kp_xjgdjl_lrr=null;
	String kp_xjgdjl_lrsj=null;



	String xjjgbm=null;
	xjjgbm=request.getParameter("xjjgbm");
	if (xjjgbm!=null)
	{
		if (!(xjjgbm.equals("")))	wheresql+=" and  (kp_xjgdjl.xjjgbm='"+xjjgbm+"')";
	}

	String lrdw=null;
	lrdw=request.getParameter("lrdw");
	if (lrdw!=null)
	{
		if (!(lrdw.equals("")))	wheresql+=" and  (kp_xjgdjl.lrdw='"+lrdw+"')";
	}

	String cfspbz=null;
	cfspbz=request.getParameter("cfspbz");
	if (cfspbz!=null)
	{
		if (!(cfspbz.equals("")))	wheresql+=" and  (kp_xjgdjl.cfspbz='"+cfspbz+"')";
	}

	String wtclbz=null;
	wtclbz=request.getParameter("wtclbz");
	if (wtclbz!=null)
	{
		if (!(wtclbz.equals("")))	wheresql+=" and  (kp_xjgdjl.wtclbz='"+wtclbz+"')";
	}
	
	
	kp_xjgdjl_xjjlh=request.getParameter("kp_xjgdjl_xjjlh");
	if (kp_xjgdjl_xjjlh!=null)
	{
		kp_xjgdjl_xjjlh=cf.GB2Uni(kp_xjgdjl_xjjlh);
		if (!(kp_xjgdjl_xjjlh.equals("")))	wheresql+=" and  (kp_xjgdjl.xjjlh='"+kp_xjgdjl_xjjlh+"')";
	}
	kp_xjgdjl_khbh=request.getParameter("kp_xjgdjl_khbh");
	if (kp_xjgdjl_khbh!=null)
	{
		kp_xjgdjl_khbh=cf.GB2Uni(kp_xjgdjl_khbh);
		if (!(kp_xjgdjl_khbh.equals("")))	wheresql+=" and  (kp_xjgdjl.khbh='"+kp_xjgdjl_khbh+"')";
	}
	kp_xjgdjl_xjr=request.getParameter("kp_xjgdjl_xjr");
	if (kp_xjgdjl_xjr!=null)
	{
		kp_xjgdjl_xjr=cf.GB2Uni(kp_xjgdjl_xjr);
		if (!(kp_xjgdjl_xjr.equals("")))	wheresql+=" and  (kp_xjgdjl.xjr='"+kp_xjgdjl_xjr+"')";
	}
	kp_xjgdjl_xjsj=request.getParameter("kp_xjgdjl_xjsj");
	if (kp_xjgdjl_xjsj!=null)
	{
		kp_xjgdjl_xjsj=kp_xjgdjl_xjsj.trim();
		if (!(kp_xjgdjl_xjsj.equals("")))	wheresql+="  and (kp_xjgdjl.xjsj>=TO_DATE('"+kp_xjgdjl_xjsj+"','YYYY/MM/DD'))";
	}
	kp_xjgdjl_xjsj=request.getParameter("kp_xjgdjl_xjsj2");
	if (kp_xjgdjl_xjsj!=null)
	{
		kp_xjgdjl_xjsj=kp_xjgdjl_xjsj.trim();
		if (!(kp_xjgdjl_xjsj.equals("")))	wheresql+="  and (kp_xjgdjl.xjsj<=TO_DATE('"+kp_xjgdjl_xjsj+"','YYYY/MM/DD'))";
	}
	xjlxbm=request.getParameter("xjlxbm");
	if (xjlxbm!=null)
	{
		xjlxbm=cf.GB2Uni(xjlxbm);
		if (!(xjlxbm.equals("")))	wheresql+=" and  (kp_xjgdjl.xjlxbm='"+xjlxbm+"')";
	}
	kp_xjgdjl_lrr=request.getParameter("kp_xjgdjl_lrr");
	if (kp_xjgdjl_lrr!=null)
	{
		kp_xjgdjl_lrr=cf.GB2Uni(kp_xjgdjl_lrr);
		if (!(kp_xjgdjl_lrr.equals("")))	wheresql+=" and  (kp_xjgdjl.lrr='"+kp_xjgdjl_lrr+"')";
	}
	kp_xjgdjl_lrsj=request.getParameter("kp_xjgdjl_lrsj");
	if (kp_xjgdjl_lrsj!=null)
	{
		kp_xjgdjl_lrsj=kp_xjgdjl_lrsj.trim();
		if (!(kp_xjgdjl_lrsj.equals("")))	wheresql+="  and (kp_xjgdjl.lrsj>=TO_DATE('"+kp_xjgdjl_lrsj+"','YYYY/MM/DD'))";
	}
	kp_xjgdjl_lrsj=request.getParameter("kp_xjgdjl_lrsj2");
	if (kp_xjgdjl_lrsj!=null)
	{
		kp_xjgdjl_lrsj=kp_xjgdjl_lrsj.trim();
		if (!(kp_xjgdjl_lrsj.equals("")))	wheresql+="  and (kp_xjgdjl.lrsj<=TO_DATE('"+kp_xjgdjl_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}

	String kpbz=null;
	kpbz=request.getParameter("kpbz");
	if (kpbz!=null)
	{
		if (!(kpbz.equals("")))	wheresql+=" and  (kp_xjgdjl.kpbz='"+kpbz+"')";
	}
	String kpjlh=null;
	kpjlh=request.getParameter("kpjlh");
	if (kpjlh!=null)
	{
		if (!(kpjlh.equals("")))	wheresql+=" and  (kp_xjgdjl.kpjlh='"+kpjlh+"')";
	}
	String jsbz=null;
	jsbz=request.getParameter("jsbz");
	if (jsbz!=null)
	{
		if (!(jsbz.equals("")))	wheresql+=" and  (kp_xjgdjl.jsbz='"+jsbz+"')";
	}
	String jsjlh=null;
	jsjlh=request.getParameter("jsjlh");
	if (jsjlh!=null)
	{
		if (!(jsjlh.equals("")))	wheresql+=" and  (kp_xjgdjl.jsjlh='"+jsjlh+"')";
	}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 16px'>
<div align="center">施工队处罚统计表</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 14px'>
  <tr> 
    <td rowspan="3" width="6%"> 
      <div align="center">排名</div>
    </td>
    <td rowspan="3" width="10%"> 
      <div align="center">施工队</div>
    </td>
    <td rowspan="3" width="10%"> 
      <div align="center">扣分</div>
    </td>
    <td rowspan="3" width="12%"> 
      <div align="center">罚款</div>
    </td>
    <td colspan="8"> 
      <div align="center">说明</div>
    </td>
  </tr>
  <tr> 
    <td colspan="2"> 
      <div align="center">工程部</div>
    </td>
    <td colspan="2"> 
      <div align="center">客服部</div>
    </td>
    <td colspan="2"> 
      <div align="center">财务部</div>
    </td>
    <td colspan="2"> 
      <div align="center">其它</div>
    </td>
  </tr>
  <tr> 
    <td width="8%"> 
      <div align="center">扣分</div>
    </td>
    <td width="8%"> 
      <div align="center">罚款</div>
    </td>
    <td width="8%"> 
      <div align="center">扣分</div>
    </td>
    <td width="9%"> 
      <div align="center">罚款</div>
    </td>
    <td width="7%"> 
      <div align="center">扣分</div>
    </td>
    <td width="7%"> 
      <div align="center">罚款</div>
    </td>
    <td width="7%"> 
      <div align="center">扣分</div>
    </td>
    <td width="8%"> 
      <div align="center">罚款</div>
    </td>
  </tr>
<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

sgd=null;
String sgdmc=null;
int kfs=0;
int sgdfk=0;
int allkfs=0;
int allsgdfk=0;

int gcbkfs=0;
int gcbsgdfk=0;
int allgcbkfs=0;
int allgcbsgdfk=0;

int kfkfs=0;
int kfsgdfk=0;
int allkfkfs=0;
int allkfsgdfk=0;

int cwkfs=0;
int cwsgdfk=0;
int allcwkfs=0;
int allcwsgdfk=0;

int qtkfs=0;
int qtsgdfk=0;
int allqtkfs=0;
int allqtsgdfk=0;
try {
	conn=cf.getConnection();

	int row=0;


	ls_sql=" SELECT sgd,sgdmc,sum(kfzs) kfs,sum(fkze) sgdfk";
	ls_sql+=" from ( ";

	ls_sql+=" SELECT kp_xjgdjl.sgd,sgdmc,kfzs,fkze";
	ls_sql+=" FROM kp_xjgdjl,crm_khxx,sq_sgd  ";
    ls_sql+=" where kp_xjgdjl.khbh=crm_khxx.khbh and kp_xjgdjl.sgd=sq_sgd.sgd ";
    ls_sql+=wheresql;

	ls_sql+=" UNION ";

	ls_sql+=" SELECT sgd,sgdmc,0 kfzs,0 fkze";
	ls_sql+=" FROM sq_sgd  ";
	ls_sql+=" where  cxbz='N'";

	if (!(fgs.equals(""))){
		ls_sql+=" and  ssfgs='"+fgs+"'";
	}
	ls_sql+=" ) ";

	ls_sql+=" group by sgd,sgdmc";
	ls_sql+=" order by kfs desc,sgdmc";

//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sgd=rs.getString("sgd");
		sgdmc=rs.getString("sgdmc");
		kfs=rs.getInt("kfs");
		sgdfk=rs.getInt("sgdfk");

		allkfs+=kfs;
		allsgdfk+=sgdfk;

		row++;

		gcbkfs=0;
		gcbsgdfk=0;

		kfkfs=0;
		kfsgdfk=0;

		cwkfs=0;
		cwsgdfk=0;

		qtkfs=0;
		qtsgdfk=0;

		if (sgdfk>0 || kfs>0)
		{
			ls_sql=" SELECT sum(kfzs) kfs,sum(fkze) sgdfk";
			ls_sql+=" FROM kp_xjgdjl,crm_khxx,sq_sgd  ";
			ls_sql+=" where kp_xjgdjl.khbh=crm_khxx.khbh ";
			ls_sql+=" and kp_xjgdjl.sgd=sq_sgd.sgd ";
			ls_sql+=wheresql;
			ls_sql+=" and kp_xjgdjl.sgd='"+sgd+"' and kp_xjgdjl.lrdw='FBJ12'";//FBJ12:工程部
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				gcbkfs=rs1.getInt("kfs");
				gcbsgdfk=rs1.getInt("sgdfk");
			}
			rs1.close();
			ps1.close();

			ls_sql=" SELECT sum(kfzs) kfs,sum(fkze) sgdfk";
			ls_sql+=" FROM kp_xjgdjl,crm_khxx,sq_sgd  ";
			ls_sql+=" where kp_xjgdjl.khbh=crm_khxx.khbh ";
			ls_sql+=" and kp_xjgdjl.sgd=sq_sgd.sgd ";
			ls_sql+=wheresql;
			ls_sql+=" and kp_xjgdjl.sgd='"+sgd+"' and kp_xjgdjl.lrdw='FBJ11'";//FBJ11:客户服务中心
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				kfkfs=rs1.getInt("kfs");
				kfsgdfk=rs1.getInt("sgdfk");
			}
			rs1.close();
			ps1.close();

			ls_sql=" SELECT sum(kfzs) kfs,sum(fkze) sgdfk";
			ls_sql+=" FROM kp_xjgdjl,crm_khxx,sq_sgd  ";
			ls_sql+=" where kp_xjgdjl.khbh=crm_khxx.khbh ";
			ls_sql+=" and kp_xjgdjl.sgd=sq_sgd.sgd ";
			ls_sql+=wheresql;
			ls_sql+=" and kp_xjgdjl.sgd='"+sgd+"' and kp_xjgdjl.lrdw='FBJ16'";//FBJ16:财务
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				cwkfs=rs1.getInt("kfs");
				cwsgdfk=rs1.getInt("sgdfk");
			}
			rs1.close();
			ps1.close();

			ls_sql=" SELECT sum(kfzs) kfs,sum(fkze) sgdfk";
			ls_sql+=" FROM kp_xjgdjl,crm_khxx,sq_sgd  ";
			ls_sql+=" where kp_xjgdjl.khbh=crm_khxx.khbh ";
			ls_sql+=" and kp_xjgdjl.sgd=sq_sgd.sgd ";
			ls_sql+=wheresql;
			ls_sql+=" and kp_xjgdjl.sgd='"+sgd+"' and kp_xjgdjl.lrdw not in('FBJ12','FBJ11','FBJ16')";//其它
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				qtkfs=rs1.getInt("kfs");
				qtsgdfk=rs1.getInt("sgdfk");
			}
			rs1.close();
			ps1.close();
		}
		
		allgcbkfs+=gcbkfs;
		allgcbsgdfk+=gcbsgdfk;
		
		allkfkfs+=kfkfs;
		allkfsgdfk+=kfsgdfk;
		
		allcwkfs+=cwkfs;
		allcwsgdfk+=cwsgdfk;
		
		allqtkfs+=qtkfs;
		allqtsgdfk+=qtsgdfk;
		
		
		%>  
		  <tr align="center"> 
			<td><%=row%></td>
			<td><A HREF="ViewCfxx.jsp?sgd=<%=sgd%>&wheresql=<%=java.net.URLEncoder.encode(wheresql,"UTF-8")%>" target="_blank"><%=sgdmc%></A></td>
			<td><%=kfs%></td>
			<td><%=sgdfk%></td>
			<td><%=gcbkfs%></td>
			<td><%=gcbsgdfk%></td>
			<td><%=kfkfs%></td>
			<td><%=kfsgdfk%></td>
			<td><%=cwkfs%></td>
			<td><%=cwsgdfk%></td>
			<td><%=qtkfs%></td>
			<td><%=qtsgdfk%></td>
		  </tr>
		<%
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
  
  <tr align="center"> 
	<td>合计</td>
	<td>&nbsp;</td>
	<td><%=allkfs%></td>
	<td><%=allsgdfk%></td>
	<td><%=allgcbkfs%></td>
	<td><%=allgcbsgdfk%></td>
	<td><%=allkfkfs%></td>
	<td><%=allkfsgdfk%></td>
	<td><%=allcwkfs%></td>
	<td><%=allcwsgdfk%></td>
	<td><%=allqtkfs%></td>
	<td><%=allqtsgdfk%></td>
  </tr>
</table>
</body>
</html>