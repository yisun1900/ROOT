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

double hdzsjz=0;
double djjje=0;
double djjbfb=10;

double zjjmje=0;

double bzjgzk=10;
double mjzjzk=10;
double zcsjzk=10;
double zcclzk=10;
double zcsfzk=10;
double zcjmzk=10;
double ddzccjzk=10;
double ddzcclzk=10;
double tcwgczk=10;
double tcgcclzk=10;

String djjzsfs="";
String zsjs="";

String yxbffydz="";//�Ƿ������ַ��ô���  1������9��������


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
	ls_sql+=" where  crm_zxkhxx.ssfgs=sq_dwxx.dwbh and crm_zxkhxx.khbh='"+khbh+"'  ";
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

	if (sfqyyssh.equals("Y") && ysshbz.equals("Y") )
	//N��δ���룻B��������ˣ�C���������룻Y�����ͨ����M�����δͨ����S���޸ķ�����Ȩ
	{
		out.println("����������[Ԥ�����]�������ٵ��ۿ�"+ysshbz);
		return;
	}

	dzbj.Dzbjje dzbjje=new dzbj.Dzbjje();
	double htjz=dzbjje.getHtjz(conn,khbh,"yz");//��ͬ��ֵ���ۺ��ͬ�ܶ������������;�ֵ�����ʹ���ȯ��˰���ۺ�
	double sgcbj=dzbjje.getSgcbj(conn,khbh,"yz");//ʩ���ɱ��ۣ�������ʩ���ɱ��ۣ�������ʩ���ɱ�������������ѡ�˰��

	if (htjz<0)
	{
//		out.println("���󣡺�ͬ��ֵΪ��ֵ��"+htjz);
//		return;
	}
	double mle=cf.round(htjz-sgcbj,2);//ë����=��ͬ��ֵ��ʩ���ɱ���
	if (mle<0)
	{
//		out.println("����ë����Ϊ��ֵ��"+mle);
//		return;
	}

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


	ls_sql="select zklx,zdzk,gcfqdzk,glfzk,sjzk,sjfzk,qtsfxmzk  ,zjxzklx";
	ls_sql+=" ,bzjgzk,mjzjzk,zcsjzk,zcclzk,zcsfzk,zcjmzk,ddzccjzk,ddzcclzk,tcwgczk,tcgcclzk,zjjmje ";
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

		bzjgzk=rs.getDouble("bzjgzk");
		mjzjzk=rs.getDouble("mjzjzk");
		zcsjzk=rs.getDouble("zcsjzk");
		zcclzk=rs.getDouble("zcclzk");
		zcsfzk=rs.getDouble("zcsfzk");
		zcjmzk=rs.getDouble("zcjmzk");
		ddzccjzk=rs.getDouble("ddzccjzk");
		ddzcclzk=rs.getDouble("ddzcclzk");
		tcwgczk=rs.getDouble("tcwgczk");
		tcgcclzk=rs.getDouble("tcgcclzk");
		zjjmje=rs.getDouble("zjjmje");
	}
	rs.close();
	ps.close();

	if (zklx.equals("1"))
	{
		glfzk=zdzk;
		sjzk=zdzk;
		sjfzk=zdzk;
		qtsfxmzk=zdzk;
	}


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
	ls_sql+=" where dwbh='"+dwbh+"' and xzzwbm='���澭��' ";
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
    <td align="right"><font color="#0000FF">�ͻ����</font> </td>
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
    <td colspan="3"><input name="zjjmje" type="text"  value="<%=zjjmje%>" size="20" maxlength="16" ></td>
  </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�ۿ�����</td>
  <td colspan="3">
      <INPUT type="radio" name="zklx" value="2" checked>�������</td>
  </tr>
     <tr bgcolor="#FFFFCC">
       <td height="24" colspan="4" align="center">��װ�ͻ��ۿ�</td>
     </tr>
     <tr bgcolor="#FFFFFF">
      <td width="18%" align="right"><font color="#FF0000">*</font>��װ��׼�۸��ۿ�</td>
      <td width="32%"><input type="text" name="bzjgzk" size="8" maxlength="9"  value="<%=bzjgzk%>" >
      <b><font color="#0000FF">��>=0��<=10��</font></b> </td>
      <td width="18%" align="right">&nbsp;</td>
      <td width="32%"><input type="hidden" name="zcsfzk" size="8" maxlength="8" value="<%=zcsfzk%>">
        <b><font color="#0000FF">
        <input type="hidden" name="ddzccjzk" size="8" maxlength="8" value="<%=ddzccjzk%>">
        <input type="hidden" name="ddzcclzk" size="8" maxlength="8" value="<%=ddzcclzk%>">
        <input type="hidden" name="tcgcclzk" size="8" maxlength="8" value="<%=tcgcclzk%>">
       </font></b></td>
    </tr>
     <tr bgcolor="#FFFFFF">
       <td align="right"><font color="#FF0000">*</font>�����ۿ�</td>
       <td><input type="text" name="mjzjzk" size="8" maxlength="9"  value="<%=mjzjzk%>" >
         <b><font color="#0000FF">��>=0��<=10��</font></b></td>
       <td align="right"><font color="#FF0000">*</font>�������ۿ�</td>
       <td><input type="text" name="zcclzk" size="8" maxlength="8" value="<%=zcclzk%>">
         <b><font color="#0000FF">��>=0��<=10��</font></b></td>
     </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>���������ۿ�</td>
      <td><input type="text" name="zcsjzk" size="8" maxlength="9"  value="<%=zcsjzk%>" >
          <b><font color="#0000FF">��>=0��<=10��</font></b></td>
      <td align="right"><font color="#FF0000">*</font>���ļ����ۿ�</td>
      <td><input type="text" name="zcjmzk" size="8" maxlength="8" value="<%=zcjmzk%>">
        <b><font color="#0000FF">��>=0��<=10��</font></b></td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>��װ��ʩ�����ۿ�</td>
      <td><input type="text" name="tcwgczk" size="8" maxlength="8" value="<%=tcwgczk%>">
        <b><font color="#0000FF">��>=0��<=10��</font></b></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
 <tr bgcolor="#FFFFCC">
  <td width="18%" align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font>������ۿ�</td>
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
          <input name="button" type="button" onClick="window.open('/dhzx/tqwh/xgcxhd/EditCrm_zxkhxx.jsp?khbh=<%=khbh%>')" value="�����" >
          <input name="button2" type="button" onClick="window.open('/dhzx/tqwh/xgcxhd/InsertCrm_khdjj.jsp?khbh=<%=khbh%>')"  value="��������ȯ">
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

	if(	javaTrim(FormName.bzjgzk)=="") {
		alert("������[��װ��׼�۸��ۿ�]��");
		FormName.bzjgzk.focus();
		return false;
	}
	if(!(isFloat(FormName.bzjgzk, "��װ��׼�۸��ۿ�"))) {
		return false;
	}
	if (FormName.bzjgzk.value<0 || FormName.bzjgzk.value>10)
	{
		alert("����[��װ��׼�۸��ۿ�]Ӧ����0��10֮�䣡");
		FormName.bzjgzk.select();
		return false;
	}
	if(	javaTrim(FormName.mjzjzk)=="") {
		alert("������[�����ۿ�]��");
		FormName.bzjgzk.focus();
		return false;
	}
	if(!(isFloat(FormName.mjzjzk, "�����ۿ�"))) {
		return false;
	}
	if (FormName.mjzjzk.value<0 || FormName.mjzjzk.value>10)
	{
		alert("����[�����ۿ�]Ӧ����0��10֮�䣡");
		FormName.mjzjzk.select();
		return false;
	}
	if(	javaTrim(FormName.zcsjzk)=="") {
		alert("������[������������ۿ�]��");
		FormName.zcsjzk.focus();
		return false;
	}
	if(!(isFloat(FormName.zcsjzk, "������������ۿ�"))) {
		return false;
	}
	if (FormName.zcsjzk.value<0 || FormName.zcsjzk.value>10)
	{
		alert("����[������������ۿ�]Ӧ����0��10֮�䣡");
		FormName.zcsjzk.select();
		return false;
	}
	if(	javaTrim(FormName.zcclzk)=="") {
		alert("������[�������ۿ�]��");
		FormName.zcclzk.focus();
		return false;
	}
	if(!(isFloat(FormName.zcclzk, "�������ۿ�"))) {
		return false;
	}
	if (FormName.zcclzk.value<0 || FormName.zcclzk.value>10)
	{
		alert("����[�������ۿ�]Ӧ����0��10֮�䣡");
		FormName.zcclzk.select();
		return false;
	}
	if(	javaTrim(FormName.zcsfzk)=="") {
		alert("������[��װ������]��");
		FormName.zcsfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.zcsfzk, "��װ������"))) {
		return false;
	}
	if (FormName.zcsfzk.value<0 || FormName.zcsfzk.value>10)
	{
		alert("����[��װ������]Ӧ����0��10֮�䣡");
		FormName.zcsfzk.select();
		return false;
	}
	if(	javaTrim(FormName.zcjmzk)=="") {
		alert("������[���ļ����ۿ�]��");
		FormName.zcjmzk.focus();
		return false;
	}
	if(!(isFloat(FormName.zcjmzk, "���ļ����ۿ�"))) {
		return false;
	}
	if (FormName.zcjmzk.value<0 || FormName.zcjmzk.value>10)
	{
		alert("����[���ļ����ۿ�]Ӧ����0��10֮�䣡");
		FormName.zcjmzk.select();
		return false;
	}
	if(	javaTrim(FormName.ddzccjzk)=="") {
		alert("������[���������ۿ�]��");
		FormName.ddzccjzk.focus();
		return false;
	}
	if(!(isFloat(FormName.ddzccjzk, "���������ۿ�"))) {
		return false;
	}
	if (FormName.ddzccjzk.value<0 || FormName.ddzccjzk.value>10)
	{
		alert("����[���������ۿ�]Ӧ����0��10֮�䣡");
		FormName.ddzccjzk.select();
		return false;
	}
	
	if(	javaTrim(FormName.ddzcclzk)=="") {
		alert("������[ѡ�������ۿ�]��");
		FormName.ddzcclzk.focus();
		return false;
	}
	if(!(isFloat(FormName.ddzcclzk, "ѡ�������ۿ�"))) {
		return false;
	}
	if (FormName.ddzcclzk.value<0 || FormName.ddzcclzk.value>10)
	{
		alert("����[ѡ�������ۿ�]Ӧ����0��10֮�䣡");
		FormName.ddzcclzk.select();
		return false;
	}

	if(	javaTrim(FormName.tcwgczk)=="") {
		alert("������[��װ��ʩ�����ۿ�]��");
		FormName.tcwgczk.focus();
		return false;
	}
	if(!(isFloat(FormName.tcwgczk, "��װ��ʩ�����ۿ�"))) {
		return false;
	}
	if (FormName.tcwgczk.value<0 || FormName.tcwgczk.value>10)
	{
		alert("����[��װ��ʩ�����ۿ�]Ӧ����0��10֮�䣡");
		FormName.tcwgczk.select();
		return false;
	}

	if(	javaTrim(FormName.tcgcclzk)=="") {
		alert("������[���̳����Ӽ��ۿ�]��");
		FormName.tcgcclzk.focus();
		return false;
	}
	if(!(isFloat(FormName.tcgcclzk, "���̳����Ӽ��ۿ�"))) {
		return false;
	}
	if (FormName.tcgcclzk.value<0 || FormName.tcgcclzk.value>10)
	{
		alert("����[���̳����Ӽ��ۿ�]Ӧ����0��10֮�䣡");
		FormName.tcgcclzk.select();
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

	FormName.action="SaveInsertCrm_tzzkjlTc.jsp";
	FormName.submit();
	FormName.wc.disabled=false;
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
