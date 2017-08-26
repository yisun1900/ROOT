<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String wheresql="";
	String kp_xjgdjl_lrsj=request.getParameter("kp_xjgdjl_lrsj");
	String kp_xjgdjl_lrsj2=request.getParameter("kp_xjgdjl_lrsj2");


	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	if (kp_xjgdjl_lrsj!=null)
	{
		if (!(kp_xjgdjl_lrsj.equals("")))	wheresql+=" and (kp_xjgdjl.lrsj>=TO_DATE('"+kp_xjgdjl_lrsj+"','YYYY/MM/DD'))";
	}
	if (kp_xjgdjl_lrsj2!=null)
	{
		if (!(kp_xjgdjl_lrsj2.equals("")))	wheresql+=" and (kp_xjgdjl.lrsj<=TO_DATE('"+kp_xjgdjl_lrsj2+"','YYYY/MM/DD'))";
	}


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 16px'>
<div align="center">施工队处罚统计表（录入时间：<%=kp_xjgdjl_lrsj%>---<%=kp_xjgdjl_lrsj2%>） </div>
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

String sgd=null;
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
			<td><A HREF="ViewCfxx.jsp?sgd=<%=sgd%>&lrsj=<%=kp_xjgdjl_lrsj%>&lrsj2=<%=kp_xjgdjl_lrsj2%>" target="_blank"><%=sgdmc%></A></td>
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