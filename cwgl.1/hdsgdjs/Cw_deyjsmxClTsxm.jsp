<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<%
String khbh=request.getParameter("khbh");
String gdjsjlh=request.getParameter("gdjsjlh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String dqbm=null;
String xmbh=null;
String xmmc=null;

String jgwzmc=null;
String oldjgwzmc="";
String jldwbm=null;
String jldwmc=null;
String gycl=null;

String khxm=null;
String lxfs=null;
String fwdz=null;
//String hth=null;
String sjs=null;
String kgrq=null;
String jyjdrq=null;
String jgrq=null;
String czmc=null;
String ysmc=null;
String bjjb=null;
String bjlx=null;
String bjlxmc=null;

double bzclfbfb=0;//���ӱ������޹��Ϸ�����Ĭ�ϲ��ϷѰٷֱ�
double bzjsblxs=0;
double clfbfb=0;
double jsblxs=0;
String xsclfbfb="";//���ӱ������޹��Ϸ�����Ĭ�ϲ��ϷѰٷֱ�
double zjqye=0;


double xjdwbjje=0;


double allcbje=0;

try {
	conn=cf.getConnection();

	//ȡ�ͻ���Ϣ
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb,dqbm";
	ls_sql+=" FROM crm_khxx,bdm_bjjbbm,sq_dwxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+) and crm_khxx.fgsbh=sq_dwxx.dwbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjb=cf.fillHtml(rs.getString("bjjb"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	//ȡ���Զ�����Ŀ�ĳɱ�Ϊ���ⱨ�۵İٷֱ�
	ls_sql="SELECT csz";
	ls_sql+=" FROM sq_xtcsb";
    ls_sql+=" where csbm='cbbfb'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzclfbfb=rs.getDouble("csz");
	}
	else{
		out.println("�����ڱ�sq_xtcsb����[�Զ�����Ŀ�ɱ��ٷֱ�]"+bzclfbfb);
		return;
	}
	rs.close();
	ps.close();


	//ɾ���޹�������Ŀ
	ls_sql="delete from bj_bjxmmx";
	ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"' and xmbh not in(  ";
	ls_sql+=" select xmbh ";
	ls_sql+=" FROM bj_gclmx";
	ls_sql+=" where bj_gclmx.khbh='"+khbh+"')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	int count=0;
	String wglfxXmbh=null;
	ls_sql="SELECT xmbh";
	ls_sql+=" FROM bj_bjxmmx  ";
	ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"' and bj_bjxmmx.bjlx='1'";//1:��׼��Ŀ;2:�Զ�����Ŀ
	ls_sql+=" and xmbh not in(  ";
	ls_sql+=" select xmbh ";
	ls_sql+=" FROM bj_khglfxb";
	ls_sql+=" where bj_khglfxb.khbh='"+khbh+"')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		wglfxXmbh=rs.getString(1);
		count++;

		out.println("<BR>���󣡱�׼��Ŀ["+wglfxXmbh+"]�޹��Ϸ���");
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		return;
	}

	String wlbm=null;
	String glmc=null;
	count=0;
	ls_sql=" select distinct wlbm,glmc";
	ls_sql+=" FROM bj_khglfxb  ";
	ls_sql+=" where bj_khglfxb.khbh='"+khbh+"'";
	ls_sql+=" and bj_khglfxb.glflbm='1' and bj_khglfxb.wlllbz='Y' ";

	ls_sql+=" and wlbm not in(  ";
	ls_sql+=" select jswlbm ";
	ls_sql+=" FROM bj_jzcljgb";
	ls_sql+=" where dqbm='"+dqbm+"' and jswlbm is not null)";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		wlbm=rs.getString(1);
		glmc=rs.getString(2);
		count++;

		out.println("<BR>���󣡹��Ϸ������ϡ����룺"+wlbm+"�����ƣ�"+glmc+"�����������޶�Ӧ����");
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		return;
	}
	
	
	//��ȡ������ܼ�
	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	zjqye=dzbj.getBjje(conn,khbh,"hd");


	//�й��Ϸ���
	ls_sql="SELECT sum(bj_gclmx.sl*bj_khglfxb.xhl*bj_khglfxb.dj) je";
	ls_sql+=" FROM bj_khglfxb,bj_gclmx  ";
	ls_sql+=" where bj_gclmx.khbh='"+khbh+"'";
	ls_sql+=" and bj_khglfxb.khbh=bj_gclmx.khbh and bj_khglfxb.dqbm=bj_gclmx.dqbm and bj_khglfxb.xmbh=bj_gclmx.xmbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allcbje=rs.getDouble("je");
	}
	rs.close();
	ps.close();

	//�޹��Ϸ���
	ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.dj) je";
	ls_sql+=" FROM bj_bjxmmx,bj_gclmx  ";
	ls_sql+=" where bj_gclmx.khbh='"+khbh+"'";
	ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
	ls_sql+=" and bj_gclmx.xmbh not in(select xmbh from bj_khglfxb where bj_khglfxb.khbh='"+khbh+"')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allcbje+=rs.getDouble("je")*bzclfbfb/100;
	}
	rs.close();
	ps.close();


	//Ĭ�Ͻ������
	ls_sql="select jsbl";
	ls_sql+=" from  cw_dejsglfl";
	ls_sql+=" where dqbm='"+dqbm+"' and  qsz<="+allcbje+" and "+allcbje+"<jzz";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzjsblxs=rs.getDouble("jsbl");
	}
	rs.close();
	ps.close();


%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<div align="center"> <b>ʩ����Ԥ����-->�������Ϸ���</b> 
  <hr>
</div>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr> 
    <td>�ͻ�������<%=khxm%></td>
    <td>��ϵ��ʽ��<%=lxfs%> </td>
    <td>����ܼƣ�<%=cf.formatDouble(zjqye,"#########.##")%>Ԫ</td>
  </tr>
  <tr> 
    <td>���̵ص㣺<%=fwdz%></td>
    <td>�� �� ʦ��<%=sjs%></td>
    <td>���̵ȼ���<%=bjjb%></td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td  width="4%" >���</td>
    <td  width="5%" >����</td>
    <td  width="5%" >����</td>
    <td  width="5%" >����</td>
    <td  width="11%" >��Ŀ���</td>
    <td  width="34%" >��Ŀ����</td>
    <td  width="8%" >������λ</td>
    <td  width="9%" >������</td>
    <td  width="9%" >���ⵥ��</td>
    <td  width="10%" >������</td>
  </tr>

<%
	int i=0;

	double dj=0;
	double sl=0;
	double dwbjje=0;

	//ɾ��
	ls_sql="delete from cw_deyjsmx ";
	ls_sql+=" where khbh='"+khbh+"' and xclbz!='Y'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	
	//���ɱ����������ϸ��cw_dejsmx��

	//��ȡ��Ŀ��ϸ
	String xclbz="";

	int row=1;
	ls_sql="SELECT bj_bjxmmx.xmpx,bj_bjxmmx.dqbm,bj_bjxmmx.xmbh,bj_bjxmmx.bjlx,bj_bjxmmx.xmmc,bj_bjxmmx.jldwbm,jldwmc,bj_bjxmmx.dj,sum(bj_gclmx.sl) sl,sum(bj_gclmx.sl*bj_bjxmmx.dj) as je";
	ls_sql+=" FROM bj_bjxmmx,jdm_jldwbm,bj_gclmx  ";
	ls_sql+=" where bj_bjxmmx.jldwbm=jdm_jldwbm.jldwbm ";
	ls_sql+=" and bj_bjxmmx.khbh='"+khbh+"' and bj_gclmx.sl*bj_bjxmmx.dj>0";
	ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
	ls_sql+=" and bj_bjxmmx.xmbh not in(select xmbh from cw_deyjsmx where khbh='"+khbh+"')";
	ls_sql+=" group by bj_bjxmmx.xmpx,bj_bjxmmx.dqbm,bj_bjxmmx.xmbh,bj_bjxmmx.bjlx,bj_bjxmmx.xmmc,bj_bjxmmx.jldwbm,jldwmc,bj_bjxmmx.dj";
	ls_sql+=" order by bj_bjxmmx.bjlx,bj_bjxmmx.xmpx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		dqbm=rs.getString("dqbm");
		xmbh=rs.getString("xmbh");
		xmmc=rs.getString("xmmc");
		bjlx=rs.getString("bjlx");
		jldwbm=rs.getString("jldwbm");
		jldwmc=cf.fillHtml(rs.getString("jldwmc"));
		dj=rs.getDouble("dj");//���ⵥ��
		sl=rs.getDouble("sl");//������
		dwbjje=rs.getDouble("je");//������

		if (bjlx.equals("1"))//1:��׼��Ŀ;2:�Զ�����Ŀ;
		{
			xclbz="";
		}
		else if (bjlx.equals("2"))
		{
			xclbz="N";
		}



		jsblxs=bzjsblxs;
		clfbfb=bzclfbfb;

		//��������������ϸ��cw_dejsmx��
		ls_sql="insert into cw_deyjsmx (khbh,xh,xmbh,xmmc,jldwbm,sl,dwbjdj,dwbjje,cbdj,cbje,mll,mle,jsblxs,nbjsdj,nbjsje,gsmll,gsmlr,clfbfb,bjlx,xclbz,mark)";
		ls_sql+=" values('"+khbh+"',"+row+",'"+xmbh+"','"+xmmc+"','"+jldwbm+"',"+sl+","+dj+","+dwbjje+",0,0,0,0,"+jsblxs+",0,0,0,0,"+clfbfb+",'"+bjlx+"','"+xclbz+"','1') ";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		row++;
	}
	rs.close();
	ps.close();


	//��ʾ����
	row=1;
	ls_sql="SELECT DECODE(bjlx,'1','��׼','2','�Զ���') bjlxmc,xmbh,xmmc,cw_deyjsmx.jldwbm,jldwmc,sl,dwbjdj,dwbjje,clfbfb,DECODE(xclbz,'N','δ����','Y','�Ѵ���') xclbz";
	ls_sql+=" FROM cw_deyjsmx,jdm_jldwbm";
	ls_sql+=" where cw_deyjsmx.jldwbm=jdm_jldwbm.jldwbm and khbh='"+khbh+"'";
	ls_sql+=" order by bjlx desc,xmbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		bjlxmc=rs.getString("bjlxmc");
		xmbh=rs.getString("xmbh");
		xmmc=rs.getString("xmmc");
		jldwbm=rs.getString("jldwbm");
		jldwmc=cf.fillHtml(rs.getString("jldwmc"));
		sl=rs.getDouble("sl");//������
		dj=rs.getDouble("dwbjdj");//���ⵥ��
		dwbjje=rs.getDouble("dwbjje");//������
		clfbfb=rs.getDouble("clfbfb");
		xclbz=cf.fillNull(rs.getString("xclbz"));

		//����[С��]
		xjdwbjje+=dwbjje;//������

		String clstr="";
		if (xclbz.equals(""))
		{
			clstr="&nbsp;";
			xclbz="&nbsp;";
		}
		else{
			clstr="<A HREF='InsertYjsBj_jzglfxb.jsp?khbh="+khbh+"&gdjsjlh="+gdjsjlh+"&xmbh="+xmbh+"' target='_blank'>�޸�</A>";
		}

	
		//���ÿ������
		%> 
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td ><%=row%></td>
			<td ><%=bjlxmc%></td>
			<td ><%=xclbz%></td>
			<td ><%=clstr%></td>
			<td ><A HREF="ViewCw_glfx_xm.jsp?khbh=<%=khbh%>&xmbh=<%=xmbh%>" target="_blank"><%=xmbh%></A></td>
			<td ><%=xmmc%></td>
			<td ><%=jldwmc%></td>
			<td ><%=sl%></td>
			<td ><%=dj%></td>
			<td ><%=dwbjje%></td>
		  </tr>
		<%
		row++;

	}
	rs.close();
	ps.close();


%>	
  <tr bgcolor="#FFFFFF" align="center"> 
	<td colspan="4">�ϼ�</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td ><%=xjdwbjje%></td>
    </tr>
  </tr>
</table>


</body>
</html>

<%
}
catch (Exception e) {
	out.print("��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
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
%>

