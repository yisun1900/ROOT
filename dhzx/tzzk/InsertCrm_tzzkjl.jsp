<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>
<%
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String bjjb=null;
String ssfgs=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;

String khjl=null;
String dmjl="";
String dmjldh="";

String cxhdbm=null;
String cxhdbmxq=null;
String cxhdbmzh=null;

String zklx="";
double zdzk=10;

double gcfqdzk=10;
double glfzk=10;
double sjzk=10;
double sjfzk=10;
double qtsfxmzk=10;

String zjxzklx="";
String sfybfxmzk="";
String sfybffyzk="";
double gczjxfzk=10;
double gcjxzk=10;
double glfzjxzk=10;
double jxglfzk=10;
double sjzjxzk=10;
double sjfzjxzk=10;

double hdzsjz=0;
double djjje=0;
double djjbfb=10;

double clfzk=10;
double zcfzk=10;
double rgfzk=10;
double ysfzk=10;
double jxfzk=10;
double shfzk=10;
double qtfzk=10;

double zjjmje=0;

String djjzsfs="";
String zsjs="";

String yxbffydz="";//�Ƿ������ַ��ô���  1������9��������

String zdzkDisplay="none";
String dxzkDisplay="none";
String bfzkDisplay="none";
String qtzkDisplay="none";

String tzjlh="";
try {
	conn=cf.getConnection();

	int jls=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_tzzkjl";
	ls_sql+=" where khbh='"+khbh+"' and clzt not in('2','4','5')";//1��δ��ɣ�2��ֱ���޸��ۿ۳ɹ���3����������4������ͨ���Ѹ��ۿۣ�5������δͨ��
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jls=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (jls>0)
	{
		out.println("���󣡵��ۿۼ�¼δ��ɣ�����δ������¼��������¼���¼�¼");
		return;
	}

	String ysshbz="";
	ls_sql="select bjjb,cxhdbm,cxhdbmxq,cxhdbmzh,khjl,crm_zxkhxx.ssfgs,khxm,fwdz,hth,sjs,crm_zxkhxx.zxdm,dwmc,ysshbz,sq_dwxx.yxbffydz";
	ls_sql+=" from  crm_zxkhxx,sq_dwxx";
	ls_sql+=" where  crm_zxkhxx.zxdm=sq_dwxx.dwbh(+) and crm_zxkhxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjb=cf.fillNull(rs.getString("bjjb"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		khjl=cf.fillNull(rs.getString("khjl"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("zxdm"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		ysshbz=cf.fillNull(rs.getString("ysshbz"));//�Ƿ�����Ԥ�����  N��δ���룻B��������ˣ�C���������룻Y�����ͨ����M�����δͨ����S���޸ķ�����Ȩ
		yxbffydz=cf.fillNull(rs.getString("yxbffydz"));
	}
	rs.close();
	ps.close();


	if (!cxhdbm.equals(""))
	{
		int duxzs=0;
		ls_sql="SELECT count(*) ";
		ls_sql+=" FROM jc_hdzsxx  ";
		ls_sql+=" where cxhdmc='"+cxhdbm+"' and fgsbh='"+ssfgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			duxzs=rs.getInt(1);
		}
		rs.close();
		ps.close();

		int dxzs=0;
		ls_sql="SELECT count(*) ";
		ls_sql+=" FROM jc_hddxzsxx  ";
		ls_sql+=" where cxhdmc='"+cxhdbm+"' and fgsbh='"+ssfgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			dxzs=rs.getInt(1);
		}
		rs.close();
		ps.close();


		if ((duxzs+dxzs)>0)
		{
			double xzsjsl=0;
			ls_sql="SELECT sum(sjsl) ";
			ls_sql+=" FROM crm_khzsxx  ";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				xzsjsl=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			if (xzsjsl==0)
			{
				out.println("<B><font color='#FF0000' size='5'>���ѣ�δѡ��������Ŀ</font></B>");
			}
		}
	}


	String sfqyyssh="";
	String bjdysq="";
	ls_sql="SELECT sfqyyssh,bjdysq";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfqyyssh=cf.fillNull(rs.getString("sfqyyssh"));//�Ƿ�����Ԥ�����  Y�����ã�N��������
		bjdysq=cf.fillNull(rs.getString("bjdysq"));//���۴�ӡ�Ƿ�����Ȩ  1��������Ȩ��2��ֻ��һ����Ȩ��3��ÿ�δ�ӡ������Ȩ
	}
	rs.close();
	ps.close();

//	if (sfqyyssh.equals("Y") && ysshbz.equals("Y") )
//	//N��δ���룻B��������ˣ�C���������룻Y�����ͨ����M�����δͨ����S���޸ķ�����Ȩ
//	{
//		out.println("����������[Ԥ�����]�������ٵ��ۿ�"+ysshbz);
//		return;
//	}

	dzbj.Dzbjje dzbjje=new dzbj.Dzbjje();
	double htjz=dzbjje.getHtjz(conn,khbh,"yz");//��ͬ��ֵ���ۺ��ͬ�ܶ������������;�ֵ�����ʹ���ȯ��˰���ۺ�
	double sgcbj=dzbjje.getSgcbj(conn,khbh,"yz");//ʩ���ɱ��ۣ�������ʩ���ɱ��ۣ�������ʩ���ɱ�������������ѡ�˰��

	if (htjz<0)
	{
		out.println("���󣡺�ͬ��ֵΪ��ֵ��"+htjz);
		return;
	}
	double mle=cf.round(htjz-sgcbj,2);//ë����=��ͬ��ֵ��ʩ���ɱ���
	//if (mle<0)
//	{
//		out.println("����ë����Ϊ��ֵ��"+mle);
//		return;
//	}

	hdzsjz=dzbjje.getZsjz(conn,khbh);//���;�ֵ
	djjje=dzbjje.getHtDjj(conn,khbh,"yz");//����ȯ���
	djjbfb=dzbjje.getDjjbfb(conn,khbh,"yz");//����ȯ�ٷֱ�


	ls_sql="select djjzsfs,zsjs";
	ls_sql+=" from  crm_khdjj";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		djjzsfs=cf.fillNull(rs.getString("djjzsfs"));
		zsjs=cf.fillNull(rs.getString("zsjs"));
	}
	rs.close();
	ps.close();


	ls_sql="select zklx,zdzk,gcfqdzk,glfzk,sjzk,sjfzk,qtsfxmzk  ,zjxzklx,zjjmje";
	ls_sql+=" from  crm_khzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zklx=cf.fillNull(rs.getString("zklx"));//�ۿ�����  1���������ۣ�2��������ۣ�3�����ַ��ô���
		zdzk=rs.getDouble("zdzk");
		gcfqdzk=rs.getDouble("gcfqdzk");
		glfzk=rs.getDouble("glfzk");
		sjzk=rs.getDouble("sjzk");
		sjfzk=rs.getDouble("sjfzk");
		qtsfxmzk=rs.getDouble("qtsfxmzk");

		zjxzklx=cf.fillNull(rs.getString("zjxzklx"));//1��ͬ��ͬ��2�������ۿ�
		zjjmje=rs.getDouble("zjjmje");
	}
	rs.close();
	ps.close();

	if (zklx.equals("1"))//1���������ۣ�2��������ۣ�3�����ַ��ô���
	{
		zdzkDisplay="block";
		dxzkDisplay="none";
		bfzkDisplay="none";
		qtzkDisplay="none";
	}
	else if (zklx.equals("2"))//1���������ۣ�2��������ۣ�3�����ַ��ô���
	{
		zdzkDisplay="none";
		dxzkDisplay="block";
		bfzkDisplay="none";
		qtzkDisplay="block";
	}
	else if (zklx.equals("3"))//1���������ۣ�2��������ۣ�3�����ַ��ô���
	{
		zdzkDisplay="none";
		dxzkDisplay="none";
		bfzkDisplay="block";
		qtzkDisplay="block";
	}

	ls_sql="select clfzk,zcfzk,rgfzk,ysfzk,jxfzk,shfzk,qtfzk";
	ls_sql+=" from  crm_khbffyzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clfzk=rs.getDouble("clfzk");
		zcfzk=rs.getDouble("zcfzk");
		rgfzk=rs.getDouble("rgfzk");
		ysfzk=rs.getDouble("ysfzk");
		jxfzk=rs.getDouble("jxfzk");
		shfzk=rs.getDouble("shfzk");
		qtfzk=rs.getDouble("qtfzk");
	}
	rs.close();
	ps.close();

	ls_sql="select gczjxfzk,glfzjxzk,sjzjxzk,sjfzjxzk ";
	ls_sql+=" from  crm_khzjxzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gczjxfzk=rs.getDouble("gczjxfzk");
		glfzjxzk=rs.getDouble("glfzjxzk");
		sjzjxzk=rs.getDouble("sjzjxzk");
		sjfzjxzk=rs.getDouble("sjfzjxzk");
	}
	rs.close();
	ps.close();


	ls_sql="select sjs ";
	ls_sql+=" from  crm_jzsjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sjs+="��"+rs.getString("sjs");
	}
	rs.close();
	ps.close();

	ls_sql="select yhmc,dh";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"' and xzzwbm='���澭��' and sfzszg in('Y','N')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dmjl=rs.getString("yhmc");
		dmjldh=rs.getString("dh");
	}
	rs.close();
	ps.close();

	int sqtszkcs=0;//ÿ�����������ۿ۴���
	ls_sql="select sqtszkcs";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sqtszkcs=rs.getInt("sqtszkcs");
	}
	rs.close();
	ps.close();


	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_tzzkjl";
	ls_sql+=" where lrr='"+yhmc+"' and clzt='2'  and (SYSDATE-lrsj)<31";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (sqtszkcs>0)
	{
		if (count>sqtszkcs)
		{
			out.println("������ÿ�¡����������ۿ۴�����������Ϊ["+sqtszkcs+"]��Ŀǰ�Ѵﵽ��"+count);
			return;
		}
	}


	ls_sql="select NVL(max(substr(tzjlh,8,3)),0)";
	ls_sql+=" from  crm_tzzkjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	tzjlh=khbh+cf.addZero(count+1,3);
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<div align="center">�����ۿ�(������¼��:<%=tzjlh%>)</div>


<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="11%">����״̬</td>
	<td  width="7%">¼��ʱ��</td>
	<td  width="6%">�ۿ�����</td>
	<td  width="6%">�����ۿ�</td>
	<td  width="6%">���̷��ۿ�</td>
	<td  width="6%">������ۿ�</td>
	<td  width="6%">˰���ۿ�</td>
	<td  width="6%">��Ʒ��ۿ�</td>
	<td  width="6%">¼����</td>
	<td  width="46%">����ԭ��</td>
</tr>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT DECODE(crm_tzzkjl.clzt,'1','δ���','2','ֱ���޸��ۿ۳ɹ�','3','������','4','����ͨ���Ѹ��ۿ�','5','����δͨ��'),crm_tzzkjl.lrsj,DECODE(crm_tzzkjl.zklx,'1','��������','2','�������','3','���ַ��ô���'),crm_tzzkjl.zdzk,crm_tzzkjl.gcfqdzk,crm_tzzkjl.glfzk,crm_tzzkjl.sjzk,crm_tzzkjl.sjfzk, crm_tzzkjl.lrr,crm_tzzkjl.tzyy ";
	ls_sql+=" FROM crm_zxkhxx,crm_tzzkjl  ";
    ls_sql+=" where crm_tzzkjl.khbh=crm_zxkhxx.khbh ";
    ls_sql+=" and crm_tzzkjl.khbh='"+khbh+"'";
    ls_sql+=" order by crm_tzzkjl.lrsj";
    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();

%>
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td width="18%" align="right"><font color="#0000FF">�ͻ����</font> </td>
    <td width="32%"><%=khbh%> </td>
    <td width="18%" align="right"><font color="#0000FF">��ͬ��</font> </td>
    <td width="32%"><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">�ͻ�����</font> </td>
    <td><%=khxm%> </td>
    <td align="right"><font color="#0000FF">���ݵ�ַ</font></td>
    <td><%=fwdz%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">���ʦ</font> </td>
    <td><%=sjs%> </td>
    <td align="right"><font color="#0000FF">ǩԼ����</font> </td>
    <td><%=dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">�ͻ�����</span></td>
    <td><%=khjl%></td>
    <td align="right"><span class="STYLE2">�곤���绰</span></td>
    <td><%=dmjl%>��<%=dmjldh%>��</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">�μӹ�˾�</span></td>
    <td colspan="3">
	  <A HREF="/yx/cxhd/ViewMcJc_cxhd.jsp?fgsbh=<%=ssfgs%>&cxhdmc=<%=cxhdbm%>" target="_blank"><%=cxhdbm%></A>	</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">С�������</span></td>
    <td colspan="3">
	  <A HREF="/yx/cxhd/ViewMcJc_cxhd.jsp?fgsbh=<%=ssfgs%>&cxhdmc=<%=cxhdbmxq%>" target="_blank"><%=cxhdbmxq%></A>	</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">չ������</span></td>
    <td colspan="3">
	  <A HREF="/yx/cxhd/ViewMcJc_cxhd.jsp?fgsbh=<%=ssfgs%>&cxhdmc=<%=cxhdbmzh%>" target="_blank"><%=cxhdbmzh%></A>	</td>
    </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="right" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>ֱ�Ӽ�����</td>
  <td colspan="3"><input name="zjjmje" type="text" value="<%=zjjmje%>" size="20" maxlength="16" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�ۿ�����</td>
  <td colspan="3">
  
  <INPUT type="radio" name="zklx" value="1" <%if (zklx.equals("1")) out.println("checked");%>  onClick="zddz.style.display='block';dxdz.style.display='none';bfdz.style.display='none';qtdz.style.display='none'">
    ��������
      <INPUT type="radio" name="zklx" value="2" <%if (zklx.equals("2")) out.println("checked");%> onClick="zddz.style.display='none';dxdz.style.display='block';bfdz.style.display='none';qtdz.style.display='block'">
      �������
<%
	if (yxbffydz.equals("1"))//�Ƿ������ַ��ô���  1������9��������
	{
		%>
		  <input type="radio" name="zklx" value="3" <%if (zklx.equals("3")) out.println("checked");%> onClick="zddz.style.display='none';dxdz.style.display='none';bfdz.style.display='block';qtdz.style.display='block'">���ַ��ô���
		<%
	}
%></td>
  </tr>
</table>


<table width="100%" border="0" style="FONT-SIZE:12;display:<%=zdzkDisplay%>" bgcolor="#999999" cellpadding="2" cellspacing="2"  id="zddz" >
<tr bgcolor="#FFFFCC">
  <td colspan="4" align="center">��������</td>
  </tr>
<tr bgcolor="#FFFFCC">
  <td width="18%" align="right"><font color="#FF0000">*</font>�����ۿ�</td>
  <td width="32%"><input name="zdzk" type="text"  value="<%=zdzk%>" size="8" maxlength="8" >
    <b><font color="#0000FF">��>0��<=10��</font></b></td>
  <td width="18%" align="right">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
</table>


<table width="100%" border="0" style="FONT-SIZE:12;display:<%=bfzkDisplay%>" bgcolor="#999999" cellpadding="2" cellspacing="2"  id="bfdz" >

<tr bgcolor="#FFFFCC">
  <td colspan="4" align="center" bgcolor="#FFFFCC"><p>���̷Ѳ��ִ���</p></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td width="18%" align="right"><font color="#FF0000">*</font>���̣����ķ��ۿ�</td>
  <td width="32%"><input type="text" name="clfzk" size="8" maxlength="9"  value="<%=clfzk%>" >
      <b><font color="#0000FF">��>=0��<=10��</font></b> </td>
  <td width="18%" align="right"><font color="#FF0000">*</font>���̣����ķ��ۿ�</td>
  <td width="32%"><input type="text" name="zcfzk" size="8" maxlength="9"  value="<%=zcfzk%>" >
      <b><font color="#0000FF">��>=0��<=10��</font></b> </td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right"><font color="#FF0000">*</font>���̣��˹����ۿ�</td>
  <td><input type="text" name="rgfzk" size="8" maxlength="9"  value="<%=rgfzk%>" >
      <b><font color="#0000FF">��>=0��<=10��</font></b></td>
  <td align="right"><font color="#FF0000">*</font>���̣�������ۿ�</td>
  <td><input type="text" name="ysfzk" size="8" maxlength="8" value="<%=ysfzk%>">
      <b><font color="#0000FF">��>=0��<=10��</font></b></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right"><font color="#FF0000">*</font>���̣���е���ۿ�</td>
  <td><input type="text" name="jxfzk" size="8" maxlength="8" value="<%=jxfzk%>">
      <b><font color="#0000FF">��>=0��<=10��</font></b></td>
  <td align="right"><font color="#FF0000">*</font>���̣���ķ��ۿ�</td>
  <td><input type="text" name="shfzk" size="8" maxlength="8" value="<%=shfzk%>">
      <b><font color="#0000FF">��>=0��<=10��</font></b></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right"><font color="#FF0000">*</font>���̣��������ۿ�</td>
  <td><input type="text" name="qtfzk" size="8" maxlength="8" value="<%=qtfzk%>">
      <b><font color="#0000FF">��>=0��<=10��</font></b></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
</table>


<table width="100%" border="0" style="FONT-SIZE:12;display:<%=dxzkDisplay%>" bgcolor="#999999" cellpadding="2" cellspacing="2"  id="dxdz" >
<tr bgcolor="#FFFFCC">
  <td colspan="4" align="center"><p>�������</p></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right"><font color="#FF0000">*</font>���̷��ۿ�</td>
  <td><input type="text" name="gcfqdzk" value="<%=gcfqdzk%>" size="8" maxlength="8" >
      <b><font color="#0000FF">��>0��<=10��</font></b> </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFCC">
  <td width="18%" align="right"><font color="#FF0000">*</font>�������ۿ�����</td>
  <td width="32%"><INPUT type="radio" name="zjxzklx" value="1" <%if (zjxzklx.equals("1")) out.println("checked");%> onClick="tzjxzk.disabled=true">
    ͬ��ͬ
    <INPUT type="radio" name="zjxzklx" value="2" <%if (zjxzklx.equals("2")) out.println("checked");%> onClick="tzjxzk.disabled=false">
    �����ۿ� </td>
  <td width="18%" align="right"><font color="#FF0000">*</font>�Ƿ��в�����Ŀ����</td>
  <td width="32%">
  
	<input type="radio" name="bfxmdldz" value="Y"  onClick="tbfxmzk.disabled=false;tdxzk.disabled=false">��
	<input name="bfxmdldz" type="radio" value="N" checked onClick="tbfxmzk.disabled=true;tdxzk.disabled=true">��
	
	</td>
</tr>
<tr bgcolor="#FFFFCC">
  <td colspan="4" align="center">
		<input name="tbfxmzk" type="button" onClick="f_bfdz(insertform)"  value="���ֹ�����Ŀ��������" disabled>
      <input name="tdxzk" type="button" onClick="f_dxdz(insertform)"  value="����������Ŀ��������" disabled>
      <input name="tqtsfzk" type="button" onClick="f_qtdz(insertform)"  value="�����շ���Ŀ��������">
      <input id="tzjxzk" type="button" onClick="f_zjxdz(insertform)"  value="�������������" <% if (zjxzklx.equals("1")) out.println("disabled");%>></td>
</tr>
</table>


<table width="100%" border="0" style="FONT-SIZE:12;display:<%=qtzkDisplay%>" bgcolor="#999999" cellpadding="2" cellspacing="2"  id="qtdz" >
<tr bgcolor="#FFFFCC">
  <td width="18%" align="right"><font color="#FF0000">*</font>������ۿ�</td>
  <td width="32%"><input type="text" name="glfzk" value="<%=glfzk%>" size="8" maxlength="8" >
    <b><font color="#0000FF">��>=0��<=10��</font></b></td>
  <td width="18%" align="right"><font color="#FF0000">*</font>˰���ۿ�</td>
  <td width="32%"><input type="text" name="sjzk" value="<%=sjzk%>" size="8" maxlength="8" >
    <b><font color="#0000FF">��>=0��<=10��</font></b></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right"><font color="#FF0000">*</font>��Ʒ��ۿ�</td>
  <td><input type="text" name="sjfzk" value="<%=sjfzk%>" size="8" maxlength="8" >
    <b><font color="#0000FF">��>=0��<=10��</font></b></td>
  <td align="right"><font color="#FF0000">*</font>�����շ���Ŀ�ۿ�</td>
  <td><input name="qtsfxmzk" type="text" value="<%=qtsfxmzk%>" size="8" maxlength="8" >
    <b><font color="#0000FF">��>=0��<=10��</font></b></td>
</tr>
</table>


<BR>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span>����ԭ��</td>
    <td colspan="3"><textarea name="tzyy" cols="77" rows="4"></textarea>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�´���Э��</td>
    <td colspan="3"><textarea name="xcxxy" cols="77" rows="6" id="xcxxy"></textarea>
    </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">����ȯ���ͷ�ʽ</span></td>
  <td><%
	cf.radioToken(out, "1+�̶����&2+�ٷֱ�",djjzsfs,true);
%></td>
  <td align="right"><span class="STYLE2">���ͻ���</span></td>
  <td><%
	cf.radioToken(out, "1+��ǰ��ͬ��&2+�ۺ��ͬ��&3+��ǰ���̷�&4+�ۺ󹤳̷�&5+������",zsjs,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right"><font color="#FF0000">*</font><span class="STYLE2">����ȯ�ٷֱ�</span></td>
  <td width="32%"><input type="text" name="djjbfb" value="<%=djjbfb%>" size="10" maxlength="16" readonly>
  ��</td>
  <td width="18%" align="right"><font color="#FF0000">*</font><span class="STYLE2">����ȯ���</span></td>
  <td width="32%"><input type="text" name="djjje" value="<%=djjje%>" size="20" maxlength="16" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">���;�ֵ</span></td>
  <td><input type="text" name="hdzsjz" value="<%=hdzsjz%>" size="20" maxlength="16" readonly></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">¼����</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">¼��ʱ��</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><span class="STYLE2">¼�벿��</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select>  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
          <input type="hidden" name="tzjlh" value="<%=tzjlh%>" > 
          <input type="hidden" name="khbh" value="<%=khbh%>" > 
          <input type="hidden" name="ssfgs" value="<%=ssfgs%>" > 
          <input type="hidden" name="cxhdbm" value="<%=cxhdbm%>" > 
          <input type="button"  value="����" onClick="f_do(insertform)">
        
          <input type="reset"  value="����" name="reset">
        <p>
          <input type="button" onClick="window.open('/dhzx/tqwh/xgcxhd/EditCrm_zxkhxx.jsp?khbh=<%=khbh%>')" value="�����" >
          <input type="button" onClick="window.open('/dhzx/tqwh/xgcxhd/InsertCrm_khdjj.jsp?khbh=<%=khbh%>')"  value="��������ȯ">
          <input name="button" type="button" onClick="window.open('/dhzx/sjszxone/ylbj.jsp?khbh=<%=khbh%>')"  value="�鿴����">
          <input name="wc" type="button" onClick="f_wcdz(insertform)"  value="����ۿ��޸�" disabled>
      </td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
 
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.tzjlh)=="") {
		alert("������[������¼��]��");
		FormName.tzjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.tzyy)=="") {
		alert("������[����ԭ��]��");
		FormName.tzyy.focus();
		return false;
	}

	if(	javaTrim(FormName.zjjmje)=="") {
		alert("������[ֱ�Ӽ�����]��");
		FormName.zjjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.zjjmje, "ֱ�Ӽ�����"))) {
		return false;
	}

	if(	!radioChecked(FormName.zklx)) {
		alert("��ѡ��[�ۿ�����]��");
		FormName.zklx[0].focus();
		return false;
	}

	if (FormName.zklx[0].checked)//��������
	{
		if(	javaTrim(FormName.zdzk)=="") {
			alert("������[�����ۿ�]��");
			FormName.zdzk.focus();
			return false;
		}
		if(!(isFloat(FormName.zdzk, "�����ۿ�"))) {
			return false;
		}
		if (FormName.zdzk.value<=0 || FormName.zdzk.value>10)
		{
			alert("����[�����ۿ�]Ӧ����0��10֮�䣡");
			FormName.zdzk.select();
			return false;
		}
	}
	else if (FormName.zklx[1].checked)//�������
	{
		if(	javaTrim(FormName.gcfqdzk)=="") {
			alert("������[���̷��ۿ�]��");
			FormName.gcfqdzk.focus();
			return false;
		}
		if(!(isFloat(FormName.gcfqdzk, "���̷��ۿ�"))) {
			return false;
		}
		if (FormName.gcfqdzk.value<0 || FormName.gcfqdzk.value>10)
		{
			alert("����[���̷��ۿ�]Ӧ����0��10֮�䣡");
			FormName.gcfqdzk.select();
			return false;
		}


		if(	javaTrim(FormName.glfzk)=="") {
			alert("������[������ۿ�]��");
			FormName.glfzk.focus();
			return false;
		}
		if(!(isFloat(FormName.glfzk, "������ۿ�"))) {
			return false;
		}
		if (FormName.glfzk.value<0 || FormName.glfzk.value>10)
		{
			alert("����[������ۿ�]Ӧ����0��10֮�䣡");
			FormName.glfzk.select();
			return false;
		}
		if(	javaTrim(FormName.sjzk)=="") {
			alert("������[˰���ۿ�]��");
			FormName.sjzk.focus();
			return false;
		}
		if(!(isFloat(FormName.sjzk, "˰���ۿ�"))) {
			return false;
		}
		if (FormName.sjzk.value<0 || FormName.sjzk.value>10)
		{
			alert("����[˰���ۿ�]Ӧ����0��10֮�䣡");
			FormName.sjzk.select();
			return false;
		}
		if(	javaTrim(FormName.sjfzk)=="") {
			alert("������[��Ʒ��ۿ�]��");
			FormName.sjfzk.focus();
			return false;
		}
		if(!(isFloat(FormName.sjfzk, "��Ʒ��ۿ�"))) {
			return false;
		}
		if (FormName.sjfzk.value<0 || FormName.sjfzk.value>10)
		{
			alert("����[��Ʒ��ۿ�]Ӧ����0��10֮�䣡");
			FormName.sjfzk.select();
			return false;
		}

		if(	javaTrim(FormName.qtsfxmzk)=="") {
			alert("������[�����շ���Ŀ�ۿ�]��");
			FormName.qtsfxmzk.focus();
			return false;
		}
		if(!(isFloat(FormName.qtsfxmzk, "�����շ���Ŀ�ۿ�"))) {
			return false;
		}
		if (FormName.qtsfxmzk.value<0 || FormName.qtsfxmzk.value>10)
		{
			alert("����[�����շ���Ŀ�ۿ�]Ӧ����0��10֮�䣡");
			FormName.qtsfxmzk.select();
			return false;
		}

		if(	!radioChecked(FormName.zjxzklx)) {
			alert("��ѡ��[�������ۿ�����]��");
			FormName.zjxzklx[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.bfxmdldz)) {
			alert("��ѡ��[�Ƿ��в�����Ŀ����]��");
			FormName.bfxmdldz[0].focus();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.clfzk)=="") {
			alert("������[���ķ��ۿ�]��");
			FormName.clfzk.focus();
			return false;
		}
		if(!(isFloat(FormName.clfzk, "���ķ��ۿ�"))) {
			return false;
		}
		if (FormName.clfzk.value<0 || FormName.clfzk.value>10)
		{
			alert("����[���ķ��ۿ�]Ӧ����0��10֮�䣡");
			FormName.clfzk.select();
			return false;
		}
		if(	javaTrim(FormName.zcfzk)=="") {
			alert("������[���ķ��ۿ�]��");
			FormName.clfzk.focus();
			return false;
		}
		if(!(isFloat(FormName.zcfzk, "���ķ��ۿ�"))) {
			return false;
		}
		if (FormName.zcfzk.value<0 || FormName.zcfzk.value>10)
		{
			alert("����[���ķ��ۿ�]Ӧ����0��10֮�䣡");
			FormName.zcfzk.select();
			return false;
		}
		if(	javaTrim(FormName.rgfzk)=="") {
			alert("������[�˹����ۿ�]��");
			FormName.rgfzk.focus();
			return false;
		}
		if(!(isFloat(FormName.rgfzk, "�˹����ۿ�"))) {
			return false;
		}
		if (FormName.rgfzk.value<0 || FormName.rgfzk.value>10)
		{
			alert("����[�˹����ۿ�]Ӧ����0��10֮�䣡");
			FormName.rgfzk.select();
			return false;
		}
		if(	javaTrim(FormName.ysfzk)=="") {
			alert("������[������ۿ�]��");
			FormName.ysfzk.focus();
			return false;
		}
		if(!(isFloat(FormName.ysfzk, "������ۿ�"))) {
			return false;
		}
		if (FormName.ysfzk.value<0 || FormName.ysfzk.value>10)
		{
			alert("����[������ۿ�]Ӧ����0��10֮�䣡");
			FormName.ysfzk.select();
			return false;
		}
		if(	javaTrim(FormName.jxfzk)=="") {
			alert("������[��е���ۿ�]��");
			FormName.jxfzk.focus();
			return false;
		}
		if(!(isFloat(FormName.jxfzk, "��е���ۿ�"))) {
			return false;
		}
		if (FormName.jxfzk.value<0 || FormName.jxfzk.value>10)
		{
			alert("����[��е���ۿ�]Ӧ����0��10֮�䣡");
			FormName.jxfzk.select();
			return false;
		}
		if(	javaTrim(FormName.shfzk)=="") {
			alert("������[��ķ��ۿ�]��");
			FormName.shfzk.focus();
			return false;
		}
		if(!(isFloat(FormName.shfzk, "��ķ��ۿ�"))) {
			return false;
		}
		if (FormName.shfzk.value<0 || FormName.shfzk.value>10)
		{
			alert("����[��ķ��ۿ�]Ӧ����0��10֮�䣡");
			FormName.shfzk.select();
			return false;
		}
		if(	javaTrim(FormName.qtfzk)=="") {
			alert("������[�������ۿ�]��");
			FormName.qtfzk.focus();
			return false;
		}
		if(!(isFloat(FormName.qtfzk, "�������ۿ�"))) {
			return false;
		}
		if (FormName.qtfzk.value<0 || FormName.qtfzk.value>10)
		{
			alert("����[�������ۿ�]Ӧ����0��10֮�䣡");
			FormName.qtfzk.select();
			return false;
		}

	

		if(	javaTrim(FormName.glfzk)=="") {
			alert("������[������ۿ�]��");
			FormName.glfzk.focus();
			return false;
		}
		if(!(isFloat(FormName.glfzk, "������ۿ�"))) {
			return false;
		}
		if (FormName.glfzk.value<0 || FormName.glfzk.value>10)
		{
			alert("����[������ۿ�]Ӧ����0��10֮�䣡");
			FormName.glfzk.select();
			return false;
		}
		if(	javaTrim(FormName.sjzk)=="") {
			alert("������[˰���ۿ�]��");
			FormName.sjzk.focus();
			return false;
		}
		if(!(isFloat(FormName.sjzk, "˰���ۿ�"))) {
			return false;
		}
		if (FormName.sjzk.value<0 || FormName.sjzk.value>10)
		{
			alert("����[˰���ۿ�]Ӧ����0��10֮�䣡");
			FormName.sjzk.select();
			return false;
		}
		if(	javaTrim(FormName.sjfzk)=="") {
			alert("������[��Ʒ��ۿ�]��");
			FormName.sjfzk.focus();
			return false;
		}
		if(!(isFloat(FormName.sjfzk, "��Ʒ��ۿ�"))) {
			return false;
		}
		if (FormName.sjfzk.value<0 || FormName.sjfzk.value>10)
		{
			alert("����[��Ʒ��ۿ�]Ӧ����0��10֮�䣡");
			FormName.sjfzk.select();
			return false;
		}

		if(	javaTrim(FormName.qtsfxmzk)=="") {
			alert("������[�����շ���Ŀ�ۿ�]��");
			FormName.qtsfxmzk.focus();
			return false;
		}
		if(!(isFloat(FormName.qtsfxmzk, "�����շ���Ŀ�ۿ�"))) {
			return false;
		}
		if (FormName.qtsfxmzk.value<0 || FormName.qtsfxmzk.value>10)
		{
			alert("����[�����շ���Ŀ�ۿ�]Ӧ����0��10֮�䣡");
			FormName.qtsfxmzk.select();
			return false;
		}
	
	}
	
	

	
	if(	javaTrim(FormName.djjbfb)=="") {
		alert("������[����ȯ�ٷֱ�]��");
		FormName.djjbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.djjbfb, "����ȯ�ٷֱ�"))) {
		return false;
	}
	if(	javaTrim(FormName.djjje)=="") {
		alert("������[����ȯ���]��");
		FormName.djjje.focus();
		return false;
	}
	if(!(isFloat(FormName.djjje, "����ȯ���"))) {
		return false;
	}
	
	if(	javaTrim(FormName.hdzsjz)=="") {
		alert("������[���;�ֵ]��");
		FormName.hdzsjz.focus();
		return false;
	}
	if(!(isFloat(FormName.hdzsjz, "���;�ֵ"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("��ѡ��[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}

	FormName.action="SaveInsertCrm_tzzkjl.jsp";
	FormName.submit();
	FormName.wc.disabled=false;
	return true;
}

function f_bfdz(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.tzjlh)=="") {
		alert("������[������¼��]��");
		FormName.tzjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="InsertCrm_bfxmtzk.jsp";
	FormName.submit();
	return true;
}

function f_dxdz(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.tzjlh)=="") {
		alert("������[������¼��]��");
		FormName.tzjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="InsertCrm_gcdxtzk.jsp";
	FormName.submit();
	return true;
}

function f_qtdz(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.tzjlh)=="") {
		alert("������[������¼��]��");
		FormName.tzjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="InsertCrm_qtxmtzk.jsp";
	FormName.submit();
	return true;
}

function f_zjxdz(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.tzjlh)=="") {
		alert("������[������¼��]��");
		FormName.tzjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="InsertCrm_tzzjxzk.jsp";
	FormName.submit();
	return true;
}

function f_wcdz(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.tzjlh)=="") {
		alert("������[������¼��]��");
		FormName.tzjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="wcdz.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
