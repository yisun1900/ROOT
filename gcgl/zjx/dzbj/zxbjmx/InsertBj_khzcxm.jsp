<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {
	color: #0000FF;
	font-weight: bold;
}
.STYLE3 {color: #0000CC}
.STYLE4 {
	color: #990000;
	font-weight: bold;
}
-->
</style>
</head>

<%
String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
String tccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));
String jgwzbm=cf.GB2Uni(cf.getParameter(request,"jgwzbm"));


String dqbm=null;
String bjjbbm=null;
String tccpdlbm=null;

String sfxzsl="";//�Ƿ���������  1�����ƣ�3��������
String sfxzslStr="";
double bzsl=0;//��׼����
double sjjmsl=0;//ʵ�ʼ�������
double sjsl=0;//ʵ������
String tcsjflbm="";
String txxx="";
String bjjldw="";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select dqbm ";
	ls_sql+=" from  crm_zjxdj,crm_khxx,sq_dwxx";
	ls_sql+=" where crm_zjxdj.khbh=crm_khxx.khbh";
	ls_sql+=" and crm_khxx.fgsbh=sq_dwxx.dwbh";
	ls_sql+=" and crm_zjxdj.zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	ls_sql="select jxc_cldlbm.cldlbm";
	ls_sql+=" from  jxc_clxlbm,jxc_cldlbm";
	ls_sql+=" where jxc_clxlbm.cldlmc=jxc_cldlbm.cldlmc and jxc_clxlbm.clxlbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tccpdlbm=cf.fillNull(rs.getString("cldlbm"));
	}
	rs.close();
	ps.close();

	ls_sql="select bjjbbm";
	ls_sql+=" from  bj_khzcxmxjh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
	}
	rs.close();
	ps.close();

	double tcwsjsl=0;//�ײ���ʵ������
	ls_sql="select sum(sl)";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='3'";//1���ײ��ڣ�2���ײ����շѣ�3�����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcwsjsl=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (tcwsjsl>0)
	{
		out.println("������ѡ�������ģ�������ѡ���ײ�����");
		return;
	}

	ls_sql="select jldw,sfxzsl,DECODE(sfxzsl,'1','������Ӽ�','2','���ɳ���','3','����������') sfxzslStr,bzsl,sjjmsl,sjsl,tcsjflbm";
	ls_sql+=" FROM bj_khzcxmxjh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjldw=cf.fillNull(rs.getString("jldw"));
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
		sfxzslStr=cf.fillNull(rs.getString("sfxzslStr"));
		tcsjflbm=cf.fillNull(rs.getString("tcsjflbm"));
		bzsl=rs.getDouble("bzsl");
		sjjmsl=rs.getDouble("sjjmsl");
		sjsl=rs.getDouble("sjsl");
	}
	rs.close();
	ps.close();

	if (sjjmsl>0)
	{
		out.println("�Ѽ��ⲻ����ѡ�񣬼�������:"+sjjmsl);
		return;
	}

	if (sfxzsl.equals("1"))//1:������Ӽ�;2:���ɳ���;3:����������
	{
		txxx="<span class=\"STYLE1\"><B>���ѣ�����������������׼����:"+bzsl+"��ʵ������:"+sjsl+"��������׼�������շ�</B></span>";
	}
	else if (sfxzsl.equals("2"))//1:������Ӽ�;2:���ɳ���;3:����������
	{
		if (sjsl>bzsl)
		{
			txxx="<span class=\"STYLE1\"><B>���ѣ������������������ɳ�������׼����:"+bzsl+"��ʵ������:"+sjsl+"��������¼��</B></span>";
		}
	}
	else{
		txxx="";
	}


%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertBj_khzcxm.jsp" name="insertform">
<div align="center">¼��ͻ�������Ŀ</div>

<table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="4%">����</td>
	<td  width="4%">���ۼ���</td>
	<td  width="4%">������λ</td>
	<td  width="4%">����</td>
	<td  width="4%">�µ�����</td>
	<td  width="4%">����</td>
	<td  width="6%">�շ�</td>
	<td  width="10%">���ײ�Ʒ˵��</td>
	<td  width="7%">��Ʒ����</td>
	<td  width="8%">��Ʒ����</td>
	<td  width="7%">Ʒ��</td>
	<td  width="9%">�ͺ�</td>
	<td  width="8%">���</td>
	<td  width="4%">�µ���</td>
	<td  width="4%">���</td>
	<td  width="5%">�������</td>
	<td  width="5%">���������������</td>
</tr>
<%

	String lx=null;
	String lxmc=null;
	String sxh=null;
	String bjjbmc=null;
	double sl=0;
	double xdsl=0;
	double dj=0;
	double je=0;
	String ptcpsm=null;
	String cpbm=null;
	String cpmc=null;
	String ppmc=null;
	String xh=null;
	String gg=null;
	String jldw=null;
	double xdb=0;
	double sh=0;
	String oldsxh=null;
	String getnewzjxxh=null;

	ls_sql="SELECT newzjxxh,bj_khzcxmh.oldsxh,bj_khzcxmh.xdb,bj_khzcxmh.sh,bj_khzcxmh.lx,DECODE(bj_khzcxmh.lx,'1','ԭ��Ŀ','2','����','3','����','4','������') lxmc,bj_khzcxmh.sxh,bjjbmc,bj_khzcxmh.sl,bj_khzcxmh.xdsl,bj_khzcxmh.dj,ROUND(bj_khzcxmh.sl*bj_khzcxmh.dj,2) je,bj_khzcxmh.ptcpsm,bj_khzcxmh.cpbm,bj_khzcxmh.cpmc,bj_khzcxmh.ppmc,bj_khzcxmh.xh,bj_khzcxmh.gg,bj_khzcxmh.jldw";
	ls_sql+=" FROM bdm_bjjbbm,bj_khzcxmh  ";
    ls_sql+=" where bj_khzcxmh.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and bj_khzcxmh.zjxxh='"+zjxxh+"' and bj_khzcxmh.jgwzbm='"+jgwzbm+"' and bj_khzcxmh.tccplbbm='"+tccplbbm+"'";
    ls_sql+=" and bj_khzcxmh.zclx in('1','2')";//��������  1���ײ��ڣ�2���ײ����շѣ�3�����
    ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//���޶���������־ Y����������N������Ϊ0
    ls_sql+=" order by bj_khzcxmh.cpbm,bj_khzcxmh.sxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();

	while (rs.next())
	{
		getnewzjxxh=cf.fillHtml(rs.getString("newzjxxh"));
		oldsxh=cf.fillHtml(rs.getString("oldsxh"));
		xdb=rs.getDouble("xdb");
		sh=rs.getDouble("sh");
		lx=cf.fillNull(rs.getString("lx"));
		lxmc=cf.fillNull(rs.getString("lxmc"));
		sxh=cf.fillNull(rs.getString("sxh"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));
		sl=rs.getDouble("sl");
		xdsl=rs.getDouble("xdsl");
		dj=rs.getDouble("dj");
		je=rs.getDouble("je");
		ptcpsm=cf.fillHtml(rs.getString("ptcpsm"));
		cpbm=cf.fillHtml(rs.getString("cpbm"));
		cpmc=cf.fillHtml(rs.getString("cpmc"));
		ppmc=cf.fillHtml(rs.getString("ppmc"));
		xh=cf.fillHtml(rs.getString("xh"));
		gg=cf.fillHtml(rs.getString("gg"));
		jldw=cf.fillHtml(rs.getString("jldw"));

		if (lx.equals("4"))//1��ԭ��Ŀ��2�����3�����4��������
		{
			%>
			<tr bgcolor="#FFFFF"  align="center">
				<td>
					<A HREF="EditNewBj_khzcxm.jsp?zjxxh=<%=zjxxh%>&sxh=<%=sxh%>&jgwzbm=<%=jgwzbm%>" target="_blank">�޸�</A>  
					<A HREF="DeleteBj_khzcxm.jsp?zjxxh=<%=zjxxh%>&sxh=<%=sxh%>&jgwzbm=<%=jgwzbm%>" target="_blank">ɾ��</A>
				</td>
				<td><%=lxmc%></td>
				<td><%=bjjbmc%></td>
				<td><%=jldw%></td>
				<td><%=sl%></td>
				<td><%=xdsl%></td>
				<td><%=dj%></td>
				<td><%=je%></td>
				<td><%=ptcpsm%></td>
				<td><%=cpbm%></td>
				<td><%=cpmc%></td>
				<td><%=ppmc%></td>
				<td><%=xh%></td>
				<td><%=gg%></td>
				<td><%=xdb%></td>
				<td><%=sh%>%</td>
				<td><%=oldsxh%></td>
				<td><%=getnewzjxxh%></td>
			</tr>
			<%
		}
		else if (lx.equals("1"))//1��ԭ��Ŀ��2�����3�����4��������
		{
			%>
			<tr bgcolor="#FFFFF"  align="center">
				<td>
					<A HREF="EditXgBjBj_khzcxm.jsp?zjxxh=<%=zjxxh%>&sxh=<%=sxh%>&jgwzbm=<%=jgwzbm%>" target="_blank">�޸�</A>  
				</td>
				<td><%=lxmc%></td>
				<td><%=bjjbmc%></td>
				<td><%=jldw%></td>
				<td><%=sl%></td>
				<td><%=xdsl%></td>
				<td><%=dj%></td>
				<td><%=je%></td>
				<td><%=ptcpsm%></td>
				<td><%=cpbm%></td>
				<td><%=cpmc%></td>
				<td><%=ppmc%></td>
				<td><%=xh%></td>
				<td><%=gg%></td>
				<td><%=xdb%></td>
				<td><%=sh%>%</td>
				<td><%=oldsxh%></td>
				<td><%=getnewzjxxh%></td>
			</tr>
			<%
		}
		else{
			%>
			<tr bgcolor="#FFFFF"  align="center">
				<td>
					<A HREF="DeleteZjxBj_khzcxm.jsp?zjxxh=<%=zjxxh%>&sxh=<%=sxh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">ɾ��</A>
				</td>
				<td><%=lxmc%></td>
				<td><%=bjjbmc%></td>
				<td><%=jldw%></td>
				<td><%=sl%></td>
				<td><%=xdsl%></td>
				<td><%=dj%></td>
				<td><%=je%></td>
				<td><%=ptcpsm%></td>
				<td><%=cpbm%></td>
				<td><%=cpmc%></td>
				<td><%=ppmc%></td>
				<td><%=xh%></td>
				<td><%=gg%></td>
				<td><%=xdb%></td>
				<td><%=sh%>%</td>
				<td><%=oldsxh%></td>
				<td><%=getnewzjxxh%></td>
			</tr>
			<%
		}
	}
	rs.close();
	ps.close();


	ls_sql="SELECT newzjxxh,bj_khzcxmh.oldsxh,bj_khzcxmh.xdb,bj_khzcxmh.sh,bj_khzcxmh.lx,'���˻�' lxmc,bj_khzcxmh.sxh,bjjbmc,bj_khzcxmh.sl,bj_khzcxmh.xdsl,bj_khzcxmh.dj,ROUND(bj_khzcxmh.sl*bj_khzcxmh.dj,2) je,bj_khzcxmh.ptcpsm,bj_khzcxmh.cpbm,bj_khzcxmh.cpmc,bj_khzcxmh.ppmc,bj_khzcxmh.xh,bj_khzcxmh.gg,bj_khzcxmh.jldw";
	ls_sql+=" FROM bdm_bjjbbm,bj_khzcxmh  ";
    ls_sql+=" where bj_khzcxmh.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and bj_khzcxmh.zjxxh='"+zjxxh+"' and bj_khzcxmh.jgwzbm='"+jgwzbm+"' and bj_khzcxmh.tccplbbm='"+tccplbbm+"'";
    ls_sql+=" and bj_khzcxmh.zclx in('1','2')";//��������  1���ײ��ڣ�2���ײ����շѣ�3�����
    ls_sql+=" and bj_khzcxmh.ywdhslbz='N'";//���޶���������־ Y����������N������Ϊ0
    ls_sql+=" order by bj_khzcxmh.cpbm,bj_khzcxmh.sxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();

	while (rs.next())
	{
		getnewzjxxh=cf.fillHtml(rs.getString("newzjxxh"));
		oldsxh=cf.fillNull(rs.getString("oldsxh"));
		xdb=rs.getDouble("xdb");
		sh=rs.getDouble("sh");
		lx=cf.fillNull(rs.getString("lx"));
		lxmc=cf.fillNull(rs.getString("lxmc"));
		sxh=cf.fillNull(rs.getString("sxh"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));
		sl=rs.getDouble("sl");
		xdsl=rs.getDouble("xdsl");
		dj=rs.getDouble("dj");
		je=rs.getDouble("je");
		ptcpsm=cf.fillHtml(rs.getString("ptcpsm"));
		cpbm=cf.fillHtml(rs.getString("cpbm"));
		cpmc=cf.fillHtml(rs.getString("cpmc"));
		ppmc=cf.fillHtml(rs.getString("ppmc"));
		xh=cf.fillHtml(rs.getString("xh"));
		gg=cf.fillHtml(rs.getString("gg"));
		jldw=cf.fillHtml(rs.getString("jldw"));

		if (lx.equals("1"))//1��ԭ��Ŀ��2�����3�����4��������
		{
			if (sl>0)
			{
				%>
				<tr bgcolor="#FFFFF"  align="center">
					<td>
						<A HREF="SaveEditHyBjBj_khzcxm.jsp?zjxxh=<%=zjxxh%>&sxh=<%=sxh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>" >ȡ���˻�</A>  
					</td>
					<td><%=lxmc%></td>
					<td><%=bjjbmc%></td>
					<td><%=jldw%></td>
					<td><%=sl%></td>
					<td><%=xdsl%></td>
					<td><%=dj%></td>
					<td><%=je%></td>
					<td><%=ptcpsm%></td>
					<td><%=cpbm%></td>
					<td><%=cpmc%></td>
					<td><%=ppmc%></td>
					<td><%=xh%></td>
					<td><%=gg%></td>
					<td><%=xdb%></td>
					<td><%=sh%>%</td>
					<td><%=oldsxh%></td>
					<td><%=getnewzjxxh%></td>
				</tr>
				<%
			}
			else{
				%>
				<tr bgcolor="#FFFFF"  align="center">
					<td>&nbsp;</td>
					<td><%=lxmc%></td>
					<td><%=bjjbmc%></td>
					<td><%=jldw%></td>
					<td><%=sl%></td>
					<td><%=xdsl%></td>
					<td><%=dj%></td>
					<td><%=je%></td>
					<td><%=ptcpsm%></td>
					<td><%=cpbm%></td>
					<td><%=cpmc%></td>
					<td><%=ppmc%></td>
					<td><%=xh%></td>
					<td><%=gg%></td>
					<td><%=xdb%></td>
					<td><%=sh%>%</td>
					<td><%=oldsxh%></td>
					<td><%=getnewzjxxh%></td>
				</tr>
				<%
			}
		}
		else{
			%>
			<tr bgcolor="#FFFFF"  align="center">
				<td>&nbsp;</td>
				<td><%=lxmc%></td>
				<td><%=bjjbmc%></td>
				<td><%=jldw%></td>
				<td><%=sl%></td>
				<td><%=xdsl%></td>
				<td><%=dj%></td>
				<td><%=je%></td>
				<td><%=ptcpsm%></td>
				<td><%=cpbm%></td>
				<td><%=cpmc%></td>
				<td><%=ppmc%></td>
				<td><%=xh%></td>
				<td><%=gg%></td>
				<td><%=xdb%></td>
				<td><%=sh%>%</td>
				<td><%=oldsxh%></td>
				<td><%=getnewzjxxh%></td>
			</tr>
			<%
		}
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR><BR>SQL=" + ls_sql);
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
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE3">���������</span></td> 
  <td width="32%"> 
    <input type="text" name="zjxxh" value="<%=zjxxh%>" size="20" maxlength="20" readonly>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE3">��Ʒ����</span></td>
  <td><select name="tccpdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select cldlbm,cldlmc from jxc_cldlbm where cldlbm='"+tccpdlbm+"' order by cldlmc","");
%>
  </select></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE3">��Ʒ���</span></td>
  <td><select name="tccplbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm where clxlbm='"+tccplbbm+"' order by clxlmc","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE3">�ṹλ��</span></td>
  <td><select name="jgwzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
		<OPTION SELECTED value="<%=jgwzbm%>"><%=jgwzbm%></OPTION>
  </select></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE3">���ۼ���</span></td>
  <td><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjbbm+"'",bjjbbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">�Ƿ���������</span></td>
  <td><%=sfxzslStr%></td>
  <td align="right"><span class="STYLE4">��׼����</span></td>
  <td><%=bzsl%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">ʵ�ʼ�������</span></td>
  <td><%=sjjmsl%></td>
  <td align="right"><span class="STYLE4">ʵ������</span></td>
  <td><%=sjsl%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">&nbsp;</td>
  <td colspan="3"><%=txxx%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>Ʒ��</td>
  <td><select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changePp(insertform)">
    <option value=""></option>
    <%
	String sql="";
	sql="select distinct  ppmc c1,ppmc c2 from bj_tczcbj where tccplbbm='"+tccplbbm+"' and  bjjbbm='"+bjjbbm+"' and  dqbm='"+dqbm+"'   and sfyx in('1') order by ppmc";
	cf.selectItem(out,sql,"");
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>��Ʒ</td> 
  <td colspan="3"> 
  <select name="cpbm" style="FONT-SIZE:12PX;WIDTH:512PX" onChange="changeCpbm(insertform)">
    <option value=""></option>
    <option value="0">����ѡ��Ʒ��</option>
  </select>	</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><strong>������λ</strong></td>
  <td><%=bjjldw%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>����</td>
  <td><input type="text" name="sl" value="" size="20" maxlength="17" ></td>
  <td align="right"><span class="STYLE1">*</span>ʵ�ʵ���</td>
  <td><input type="text" name="dj" value="" size="20" maxlength="17"> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><%if (tccplbbm.equals("36")) out.println("�����ͺ�");if (tccplbbm.equals("50")) out.println("�Ӿ�");%></td> 
  <td colspan="3"> 
    <input type="text" name="ptcpsm" value="" size="73" maxlength="200" <%if (!tccplbbm.equals("36") && !tccplbbm.equals("50") ) out.println("disabled");%>>  </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">      </td>
    </tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	//����Ajax
	cf.ajax(out);
%>

var mark="";
function changePp(FormName)
{
	FormName.cpbm.length=1;

	if (FormName.ppmc.value=="")
	{
		return;
	}

	mark="pp";

	var sql;
	sql="select cpbm,cpmc||'��'||xh||'����'||gg||'��'||'��'||jldw||'��' from bj_tczcbj where ppmc='"+FormName.ppmc.value+"'  and  dqbm='<%=dqbm%>' and  tccplbbm='"+FormName.tccplbbm.value+"' and  bjjbbm='"+FormName.bjjbbm.value+"'   and  (sfyx='1')  order by cpmc,xh ";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function changeCpbm(FormName)
{
	if (FormName.cpbm.value=="")
	{
		return;
	}

	mark="cpbm";

	var sql;
	sql="select sfkgdj from bj_tczcbj where cpbm='"+FormName.cpbm.value+"'";

	var actionStr="/ajax/getValue.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	if (mark=="pp")
	{
		strToSelect(insertform.cpbm,ajaxRetStr);
	}
	else if (mark=="cpbm")
	{
		ajaxRetStr=ajaxRetStr.substring(10,ajaxRetStr.length-4);

		if (ajaxRetStr=="Y")
		{
			insertform.dj.readOnly=false;
			insertform.dj.value="";
		}
		else {
			insertform.dj.readOnly=true;
			insertform.dj.value="0";
		}
	}
}

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("������[���������]��");
		FormName.zjxxh.focus();
		return false;
	}
	if(	javaTrim(FormName.jgwzbm)=="") {
		alert("��ѡ��[�ṹλ��]��");
		FormName.jgwzbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cpbm)=="") {
		alert("��ѡ��[��Ʒ]��");
		FormName.cpbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tccpdlbm)=="") {
		alert("��ѡ��[��Ʒ����]��");
		FormName.tccpdlbm.focus();
		return false;
	}

	if(	javaTrim(FormName.sl)=="") {
		alert("������[����]��");
		FormName.sl.focus();
		return false;
	}
	if(!(isFloat(FormName.sl, "����"))) {
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("������[ʵ�ʵ���]��");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "ʵ�ʵ���"))) {
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("��ѡ��[���ۼ���]��");
		FormName.bjjbbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}

 
//-->
</SCRIPT>


