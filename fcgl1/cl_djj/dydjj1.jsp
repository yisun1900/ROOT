<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<html>
<head>
</head>
<%
String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String bg1="E8E8FF";
String bg2="FFFFFF";
int i=0;
int row=0;
String czxh=request.getParameter("czxh");
String ckmc=cf.GB2Uni(cf.getParameter(request,"ckmc"));


String clbm=null;
String clmc=null;
String clgg=null;
String fgsdj=null;
String gdj=null;
String sqlqsl=null;
double sjsl=0;
double sjje=0;
String cldlmc=null;
String jldwmc=null;


String hth=null;
String khxm=null;
String fwdz=null;
String qye=null;
String sgdmc=null;
String lrr=null;
String lrsj=null;
String bz=null;
double allsjje=0;

try {
	conn=cf.getConnection();

	ls_sql="SELECT hth,khxm,fwdz,cl_djj.qye,sgdmc,cl_djj.lrr,cl_djj.lrsj,cl_djj.bz";
	ls_sql+=" FROM cl_djj,crm_khxx,sq_sgd ";
	ls_sql+=" where cl_djj.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+) and czxh='"+czxh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		qye=cf.fillNull(rs.getString("qye"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillHtml(rs.getString("bz"));
	}
	rs.close();
	ps.close();
%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<div align="center"><font size="5"><b>�����ڴ���ϵ�������ȯ��</b></font> 
  <table border="0" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 15px' >
    <tr>
      <td width="36%">No��<%=czxh%></td>
      <td width="40%">�ֿ����ƣ�<%=ckmc%></td>
      <td width="24%"><%=lrsj.substring(0,4)%>��<%=lrsj.substring(5,7)%>��<%=lrsj.substring(8,10)%>��</td>
    </tr>
  </table>
</div>
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 15px' >
  <tr> 
    <td width="11%">��ͬ�ţ�</td>
    <td width="26%"><%=hth%></td>
    <td width="11%">�ͻ�������</td>
    <td width="21%"><%=khxm%></td>
    <td width="13%">��Ŀ����</td>
    <td width="18%"><%=sgdmc%></td>
  </tr>
  <tr> 
    <td width="11%">���ݵ�ַ��</td>
    <td colspan="3"><%=fwdz%></td>
    <td width="13%">����ʩ���</td>
    <td width="18%"><%=qye%></td>
  </tr>
</table>

<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 15px' >
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="9%">���</td>
    <td  width="18%">��������</td>
    <td  width="23%">���Ϲ��</td>
    <td  width="12%">������λ</td>
    <td  width="11%">����</td>
    <td  width="11%">����</td>
    <td  width="16%">���</td>
  </tr>
  <%
	ls_sql="SELECT czxh,clbm clbm,clmc,clgg,gdj,sqlqsl,sjsl,sjje,cldlmc,jldwmc  ";
	ls_sql+=" FROM cl_djjmx ";
	ls_sql+=" where czxh='"+czxh+"' and ckmc='"+ckmc+"'";
	ls_sql+=" order by cldlmc, clbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		i++;
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		clgg=cf.fillNull(rs.getString("clgg"));
		gdj=cf.fillNull(rs.getString("gdj"));
		sqlqsl=cf.fillNull(rs.getString("sqlqsl"));
		sjsl=rs.getDouble("sjsl");
		sjje=rs.getDouble("sjje");
		cldlmc=cf.fillNull(rs.getString("cldlmc"));
		jldwmc=cf.fillNull(rs.getString("jldwmc"));

		allsjje+=sjje;
%> 
  <tr bgcolor="<%if (i%2==0){out.print(bg1);}else {out.print(bg2);}%>"> 
    <td width="9%"> 
      <div align="center"><%=i%></div>
    </td>
    <td width="18%"> 
      <div align="center"><%=clmc%></div>
    </td>
    <td width="23%"> 
      <div align="center"><%=clgg%>&nbsp;</div>
    </td>
    <td width="12%"> 
      <div align="center"><%=jldwmc%>&nbsp;</div>
    </td>
    <td width="11%"> 
      <div align="center"><%=gdj%></div>
    </td>
    <td width="11%"> 
      <div align="center"><%=sjsl%></div>
    </td>
    <td width="16%"> 
      <div align="center"><%=sjje%>&nbsp;</div>
    </td>
  </tr>
  <%
	row++;
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("��������: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%> 
  <tr > 
    <td width="9%"> 
      <div align="center">��ע��</div>
    </td>
    <td colspan="4">��������ȯ��Ч��3���£�<%=bz%></td>
    <td width="11%"> 
      <div align="center">�ܼƣ�</div>
    </td>
    <td width="16%"> 
      <div align="center"><%=cf.formatDouble(allsjje)%></div>
    </td>
  </tr>
</table>
<P>
<table border="0" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 15px' >
  <tr>
    <td>��˾���£�</td>
    <td>��Ʊ�ˣ�<%=lrr%></td>
    <td>�ջ��ˣ�</td>
    <td>�ջ����ڣ�</td>
  </tr>
</table>
</body>

</html>
</script>

