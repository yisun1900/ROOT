<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String khbh=request.getParameter("khbh");
	String khxm=cf.executeQuery("select khxm from crm_khxx where khbh='"+khbh+"'");
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>


<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String bjxx="";
try {
	conn=cf.getConnection();

	String ddbhstr="";

	String c1="";
	String c2="";

	ls_sql=" SELECT ddbh,ppbm";
	ls_sql+=" FROM jc_zcdd";
	ls_sql+=" where jc_zcdd.clzt='30' ";
    ls_sql+=" and jc_zcdd.khbh='"+khbh+"' and jc_zcdd.ddbh not in(select ddbh from jc_zcddmx where khbh='"+khbh+"') ";
    ls_sql+=" and (jc_zcdd.hkze!=0 OR jc_zcdd.zjhze!=0) ";
    ls_sql+=" order by ppbm ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		c1=rs.getString("ddbh");
		c2=rs.getString("ppbm");
		ddbhstr+=c1+"<"+c2+">"+"��";
	}
	rs.close();
	ps.close();

	if (!ddbhstr.equals(""))
	{
		ddbhstr="���棡������"+ddbhstr+"��δ¼��ϸ����©��";

		%>
		<SCRIPT language=javascript >
		<!--
		alert("<%=ddbhstr%>");
		//-->
		</SCRIPT>
		<%
	}


	String ddstr="";
	double zczkl=0;
	double wdzje=0;
	double hkze=0;
	double zqzjhze=0;
	double zjhze=0;
	double htcxhdje=0;
	double zjxcxhdje=0;
	ls_sql=" SELECT ddbh,ppbm,zczkl,wdzje,hkze,zqzjhze,zjhze,htcxhdje,zjxcxhdje";
	ls_sql+=" FROM jc_zcdd";
	ls_sql+=" where jc_zcdd.clzt='30' ";
    ls_sql+=" and jc_zcdd.khbh='"+khbh+"' and jc_zcdd.ddbh in(select ddbh from jc_zcddmx where khbh='"+khbh+"') ";
    ls_sql+=" order by ppbm ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		c1=rs1.getString("ddbh");
		c2=rs1.getString("ppbm");
		zczkl=rs1.getDouble("zczkl");
		wdzje=rs1.getDouble("wdzje");
		hkze=rs1.getDouble("hkze");
		zqzjhze=rs1.getDouble("zqzjhze");
		zjhze=rs1.getDouble("zjhze");
		htcxhdje=rs1.getDouble("htcxhdje");
		zjxcxhdje=rs1.getDouble("zjxcxhdje");

		double ddhtmxje=0;
		double ddhthdje=0;
		ls_sql =" SELECT ROUND(sum(NVL(jc_zcddmx.je,0)+NVL(jc_zcddmx.ycf,0)+NVL(jc_zcddmx.qtfyje,0)),0),ROUND(sum(NVL(jc_zcddmx.je,0)*cxhdbl/100),2)";
		ls_sql+=" FROM jc_zcddmx";
		ls_sql+=" where jc_zcddmx.ddbh='"+c1+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ddhtmxje=rs.getDouble(1);
			ddhthdje=rs.getDouble(2);
		}
		rs.close();
		ps.close();

		double ddzjxmxje=0;
		double ddzjxhdje=0;
		ls_sql=" SELECT ROUND(sum(NVL(jc_zczjxmx.zjje,0)+NVL(jc_zczjxmx.zjycf,0)+NVL(jc_zczjxmx.zjqtfy,0)),0),ROUND(sum(NVL(jc_zczjxmx.zjje,0)*cxhdbl/100),2)";
		ls_sql+=" FROM jc_zcddmx,jc_zczjxmx";
		ls_sql+=" where jc_zcddmx.xh=jc_zczjxmx.xh" ;
		ls_sql+=" and jc_zcddmx.ddbh='"+c1+"' and jc_zczjxmx.ddbh='"+c1+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ddzjxmxje=rs.getDouble(1);
			ddzjxhdje=rs.getDouble(2);
		}
		rs.close();
		ps.close();


		if (hkze!=ddhtmxje ||  zjhze!=ddzjxmxje || htcxhdje!=ddhthdje)
		{
			ddstr="���棡\\r\\n����["+c1+"<"+c2+">]����������ϸ��һ��,\\r\\n����<��ͬ"+hkze+"��������"+zjhze+"�������"+htcxhdje+">\\r\\n��ϸ<��ͬ"+ddhtmxje+"��������"+ddzjxmxje+"�������"+ddhthdje+">";

			%>
			<SCRIPT language=javascript >
			<!--
			alert("<%=ddstr%>");
			//-->
			</SCRIPT>
			<%
		}

	}
	rs1.close();
	ps1.close();

	if (!ddstr.equals("") || !ddbhstr.equals(""))
	{
		bjxx="<font color=\"#FF0000\">�����棡���ֱ�����Ϣ��</font>";
	}


%>

<CENTER >
  <B><font size="3">���Ķ�����ϸ��<%=khxm%>��<%=bjxx%></font></B>
</CENTER>


<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="3%">���</td>
    <td  width="6%">������</td>
    <td  width="4%">����</td>
    <td  width="6%">��װλ��</td>
    <td  width="10%">��������</td>
    <td  width="8%">���</td>
    <td  width="8%">�ͺ�</td>
    <td  width="4%">��λ</td>
    <td  width="5%">����</td>
    <td  width="7%">����(����)</td>
    <td  width="7%">���Ϸ�</td>
    <td  width="5%">Զ�̷�</td>
    <td  width="5%">��������</td>
    <td  width="4%">�������</td>
    <td  width="7%">�������</td>
    <td  width="11%">��ע</td>
  </tr>
  <%

	String ppbm=null;
	int row=0;
	double zjsl=0;
	double zjje=0;
	double zjycf=0;
	double zjqtfy=0;
	double zjcxhdje=0;
	ls_sql=" SELECT distinct ppbm";
	ls_sql+=" FROM jc_zcdd";
	ls_sql+=" where jc_zcdd.khbh='"+khbh+"' ";
    ls_sql+=" order by ppbm ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		ppbm=rs1.getString("ppbm");


		String dwbh=null;
		String ddbh=null;
		String lx=null;
		String zcpzwzbm=null;
		String zcmc=null;
		String gg=null;
		String xinghao=null;
		String jldwbm=null;
		double sl=0;
		String dj=null;
		double je=0;
		double ycf=0;
		double qtfy=0;
		String cxhdbl=null;
		double cxhdje=0;
		String bz=null;

		double xjsl=0;
		double xjje=0;
		double xjycf=0;
		double xjqtfy=0;
		double xjcxhdje=0;


		ls_sql=" SELECT dwbh,ddbh,lx,zcpzwzbm,zcmc,gg,xinghao,jldwbm,sl,dj,je,ycf,qtfy,cxhdbl,cxhdje,bz";
		ls_sql+=" FROM ( ";
		
		ls_sql+=" SELECT '��ͬ' lx,jc_zcdd.ddbh,jc_zcddmx.zcpzwzbm,jc_zcddmx.zcmc,jc_zcddmx.dwbh,jc_zcddmx.gg,jc_zcddmx.xinghao,jc_zcddmx.jldwbm,jc_zcddmx.sl,jc_zcddmx.dj||DECODE(jc_zcddmx.xzjg,'1','','2','(��)') dj,NVL(jc_zcddmx.je,0) je,NVL(jc_zcddmx.ycf,0) ycf,NVL(jc_zcddmx.qtfyje,0) qtfy,cxhdbl||'%' cxhdbl,ROUND(NVL(jc_zcddmx.je,0)*cxhdbl/100,2) cxhdje,jc_zcddmx.bz";
		ls_sql+=" FROM jc_zcddmx,jc_zcdd";
		ls_sql+=" where jc_zcddmx.ddbh=jc_zcdd.ddbh" ;
//		ls_sql+=" AND jc_zcdd.clzt='30' ";
		ls_sql+=" and jc_zcdd.khbh='"+khbh+"' and jc_zcdd.ppbm='"+ppbm+"' ";

		ls_sql+=" UNION ALL ";

		ls_sql+=" SELECT '����' lx,jc_zcdd.ddbh,jc_zcddmx.zcpzwzbm,jc_zcddmx.zcmc,jc_zcddmx.dwbh,jc_zcddmx.gg,jc_zcddmx.xinghao,jc_zcddmx.jldwbm,jc_zczjxmx.zjsl sl,jc_zcddmx.dj||DECODE(jc_zcddmx.xzjg,'1','','2','(��)') dj,NVL(jc_zczjxmx.zjje,0) je,NVL(jc_zczjxmx.zjycf,0) ycf,NVL(jc_zczjxmx.zjqtfy,0) qtfy,cxhdbl||'%' cxhdbl,ROUND(NVL(jc_zczjxmx.zjje,0)*cxhdbl/100,2) cxhdje,jc_zcddmx.bz";
		ls_sql+=" FROM jc_zcddmx,jc_zcdd,jc_zczjxmx";
		ls_sql+=" where jc_zcddmx.ddbh=jc_zcdd.ddbh and jc_zcdd.ddbh=jc_zczjxmx.ddbh and jc_zcddmx.xh=jc_zczjxmx.xh" ;
//		ls_sql+=" AND jc_zcdd.clzt='30' ";
		ls_sql+=" and jc_zcdd.khbh='"+khbh+"' and jc_zcdd.ppbm='"+ppbm+"' ";
		ls_sql+=" ) ";

		ls_sql+=" order by dwbh,xinghao,lx";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			dwbh=cf.fillHtml(rs.getString("dwbh"));
			ddbh=cf.fillHtml(rs.getString("ddbh"));
			lx=cf.fillHtml(rs.getString("lx"));
			zcpzwzbm=cf.fillHtml(rs.getString("zcpzwzbm"));
			zcmc=cf.fillHtml(rs.getString("zcmc"));
			gg=cf.fillHtml(rs.getString("gg"));
			xinghao=cf.fillHtml(rs.getString("xinghao"));
			jldwbm=cf.fillHtml(rs.getString("jldwbm"));
			sl=rs.getDouble("sl");
			dj=cf.fillHtml(rs.getString("dj"));
			je=rs.getDouble("je");
			ycf=rs.getDouble("ycf");
			qtfy=rs.getDouble("qtfy");
			cxhdbl=cf.fillHtml(rs.getString("cxhdbl"));
			cxhdje=rs.getDouble("cxhdje");
			bz=cf.fillHtml(rs.getString("bz"));

			xjsl+=sl;
			xjje+=je;
			xjycf+=ycf;
			xjqtfy+=qtfy;
			xjcxhdje+=cxhdje;

			row++;

			%> 
			  <tr bgcolor="#FFFFFF"  align="center"> 
				<td ><%=row%></td>
				<td ><%=ddbh%></td>
				<td ><%=lx%></td>
				<td ><%=zcpzwzbm%></td>
				<td ><%=zcmc%></td>
				<td ><%=gg%></td>
				<td ><%=xinghao%></td>
				<td ><%=jldwbm%></td>
				<td ><%=sl%></td>
				<td ><%=dj%></td>
				<td ><%=je%></td>
				<td ><%=ycf%></td>
				<td ><%=qtfy%></td>
				<td ><%=cxhdbl%></td>
				<td ><%=cxhdje%></td>
				<td ><%=bz%></td>
			  </tr>
			  <%
		}
		rs.close();
		ps.close();


		zjsl+=xjsl;
		zjje+=xjje;
		zjycf+=xjycf;
		zjqtfy+=xjqtfy;
		zjcxhdje+=xjcxhdje;
		
		
		%> 
		  <tr bgcolor="#E8E8FF"  align="center" height="22"> 
			<td colspan="5"><font size="2"><b>[<%=ppbm%>]С��</b></font></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(xjsl)%></td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(xjje)%></td>
			<td><%=cf.formatDouble(xjycf)%></td>
			<td><%=cf.formatDouble(xjqtfy)%></td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(xjcxhdje)%></td>
			<td>&nbsp;</td>
		  </tr>
		  <%
	}
	rs1.close();
	ps1.close();

	
	%> 
	  <tr bgcolor="#E8E8FF"  align="center" height="32"> 
		<td colspan="7"><font size="3"><b>�ܼ�</b></font></td>
		<td>&nbsp;</td>
		<td><%=cf.formatDouble(zjsl)%></td>
		<td>&nbsp;</td>
		<td><%=cf.formatDouble(zjje)%></td>
		<td><%=cf.formatDouble(zjycf)%></td>
		<td><%=cf.formatDouble(zjqtfy)%></td>
		<td>&nbsp;</td>
		<td><%=cf.formatDouble(zjcxhdje)%></td>
		<td>&nbsp;</td>
	  </tr>
	  <%

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
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%> 
</table>

<CENTER >
  <B><font size="3">ľ�Ŷ�����ϸ��<%=khxm%>��</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">���</td>
	<td  width="5%">����</td>
	<td  width="8%">�������</td>
	<td  width="8%">����״̬</td>
	<td  width="12%">����/Ʒ��</td>
	<td  width="5%">��ĿרԱ</td>
	<td  width="5%">פ��Ҿӹ���</td>
	<td  width="5%">չ���Ҿӹ���</td>
	<td  width="5%">ľ�Ų�����ʦ</td>
	<td  width="9%">ľ�ŷ�����</td>
	<td  width="9%">�������</td>
	<td  width="9%">����������</td>
	<td  width="9%">�����ܽ��</td>
	<td  width="7%">����ʱ��</td>
</tr>
<%
	ls_sql=" SELECT '',lx,yddbh,clztmc,pdgcmc,xmzy,clgw,ztjjgw,mmcljs,mmhtje,wjhtje,blhtje,htje,htrq";
    ls_sql+=" FROM ( ";
	ls_sql+=" SELECT '','��ͬ' lx,jc_mmydd.yddbh,clztmc,pdgcmc,jc_mmydd.xmzy,clgw,ztjjgw,mmcljs,mmhtje,wjhtje,blhtje,htje,htrq";
	ls_sql+=" FROM jc_mmydd,jdm_mmyddzt";
	ls_sql+=" where jc_mmydd.clzt=jdm_mmyddzt.clzt";
    ls_sql+=" and jc_mmydd.khbh='"+khbh+"' ";
    ls_sql+=" and jc_mmydd.clzt='20' ";

	ls_sql+=" UNION ALL ";

	ls_sql+=" SELECT '','����' lx,jc_mmzjx.yddbh||'+'||zjxxh yddbh,DECODE(jc_mmzjx.clzt,'00','¼��δ���','01','¼�����','02','������ȷ��','03','�����','04','��װ���','99','�˵�') clztmc,jc_mmzjx.pdgcmc,jc_mmzjx.xmzy,jc_mmzjx.clgw,jc_mmzjx.ztjjgw,jc_mmzjx.mmcljs,mmzjxje mmhtje,wjzjxje wjhtje,blzjxje blhtje,zjxze htje,zjxfssj htrq";
	ls_sql+=" FROM jc_mmzjx,jc_mmydd";
	ls_sql+=" where jc_mmzjx.yddbh=jc_mmydd.yddbh and jc_mmzjx.khbh='"+khbh+"' ";
    ls_sql+=" and jc_mmydd.clzt='20' ";

    ls_sql+=" ) ";

    ls_sql+=" order by pdgcmc,yddbh,htrq";

//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��

	
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum(true);
%> 
</table>


<CENTER >
  <B><font size="3">���񶩵���ϸ��<%=khxm%>��</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">���</td>
	<td  width="5%">����</td>
	<td  width="8%">�������</td>
	<td  width="7%">����״̬</td>
	<td  width="9%">����/Ʒ��</td>
	<td  width="5%">��ĿרԱ</td>
	<td  width="5%">פ��Ҿӹ���</td>
	<td  width="5%">չ���Ҿӹ���</td>
	<td  width="5%">�������ʦ</td>
	<td  width="8%">���巢����</td>
	<td  width="8%">̨�淢����</td>
	<td  width="8%">�������</td>
	<td  width="8%">����������</td>
	<td  width="8%">�����ܽ��</td>
	<td  width="7%">����ʱ��</td>
</tr>
<%
	ls_sql=" SELECT '',lx,ddbh,clztmc,pdgcmc,xmzy,clgw,ztjjgw,cgsjs,gtbfje,tmbfje,wjhtze,dqhtze,htze,qhtsj";
    ls_sql+=" FROM ( ";
	ls_sql+=" SELECT '','��ͬ' lx,jc_cgdd.ddbh,clztmc,pdgcmc,jc_cgdd.xmzy,clgw,ztjjgw,cgsjs,gtbfje,tmbfje,wjhtze,dqhtze,htze,qhtsj";
	ls_sql+=" FROM jc_cgdd,jdm_cgddzt";
	ls_sql+=" where jc_cgdd.clzt=jdm_cgddzt.clzt";
    ls_sql+=" and jc_cgdd.khbh='"+khbh+"' ";
    ls_sql+=" and jc_cgdd.clzt='35' ";

	ls_sql+=" UNION ALL ";

	ls_sql+=" SELECT '','����' lx,jc_cgzjx.ddbh||'+'||zjxxh ddbh,DECODE(jc_cgzjx.clzt,'00','¼��δ���','01','¼�����','02','������ȷ��','04','��װ���','99','�˵�') clztmc,jc_cgzjx.pdgcmc,jc_cgzjx.xmzy,jc_cgzjx.clgw,jc_cgzjx.ztjjgw,jc_cgzjx.cgsjs,gtzjxje gtbfje,tmzjxje tmbfje,wjzjxje wjhtze,dqzjxje dqhtze,zjxze htze,zjxfssj qhtsj";
	ls_sql+=" FROM jc_cgzjx,jc_cgdd";
	ls_sql+=" where jc_cgzjx.ddbh=jc_cgdd.ddbh and jc_cgzjx.khbh='"+khbh+"' ";
    ls_sql+=" and jc_cgdd.clzt='35' ";

    ls_sql+=" ) ";

    ls_sql+=" order by pdgcmc,ddbh,qhtsj";

//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��

	
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum(true);
%> 
</table>


<CENTER >
  <B><font size="3">�Ҿ߶�����ϸ��<%=khxm%>��</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">���</td>
	<td  width="5%">����</td>
	<td  width="8%">�������</td>
	<td  width="7%">����״̬</td>
	<td  width="11%">�Ҿ߹���</td>
	<td  width="11%">�Ͳ��Ź���</td>
	<td  width="5%">��ĿרԱ</td>
	<td  width="5%">פ��Ҿӹ���</td>
	<td  width="5%">չ���Ҿӹ���</td>
	<td  width="5%">�������ʦ</td>
	<td  width="9%">�Ҿ߷�����</td>
	<td  width="9%">�Ͳ��ŷ�����</td>
	<td  width="9%">�����ܽ��</td>
	<td  width="7%">����ʱ��</td>
</tr>
<%
	ls_sql=" SELECT '',lx,ddbh,clztmc,pdgcmc,xcmgcmc,xmzy,clgw,ztjjgw,jjsjs,jjje,xcmje,htze,qhtsj";
    ls_sql+=" FROM ( ";
	ls_sql+=" SELECT '','��ͬ' lx,jc_jjdd.ddbh,clztmc,pdgcmc,xcmgcmc,jc_jjdd.xmzy,clgw,ztjjgw,jjsjs,jjje,xcmje,htze,qhtsj";
	ls_sql+=" FROM jc_jjdd,jdm_jjddzt";
	ls_sql+=" where jc_jjdd.clzt=jdm_jjddzt.clzt";
    ls_sql+=" and jc_jjdd.khbh='"+khbh+"' ";
    ls_sql+=" and jc_jjdd.clzt='35' ";

	ls_sql+=" UNION ALL ";

	ls_sql+=" SELECT '','����' lx,zjxxh ddbh,DECODE(jc_jjzjx.clzt,'00','¼��δ���','01','¼�����','02','������ȷ��','04','��װ���','99','�˵�') clztmc,jc_jjzjx.pdgcmc,jc_jjzjx.xcmgcmc,jc_jjzjx.xmzy,jc_jjzjx.clgw,jc_jjzjx.ztjjgw,jc_jjzjx.jjsjs,jjzjxje jjje,xcmzjxje xcmje,zjxze htze,zjxfssj qhtsj";
	ls_sql+=" FROM jc_jjzjx,jc_jjdd";
	ls_sql+=" where jc_jjzjx.ddbh=jc_jjdd.ddbh and jc_jjzjx.khbh='"+khbh+"' ";
    ls_sql+=" and jc_jjdd.clzt='35' ";

    ls_sql+=" ) ";

    ls_sql+=" order by pdgcmc,ddbh,qhtsj";

//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��

	
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum(true);
%> 
</table>

</body>
</html>