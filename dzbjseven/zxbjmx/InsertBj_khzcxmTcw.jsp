<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>

<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
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
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String tccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));
String tccpdlbm=cf.GB2Uni(request.getParameter("tccpdlbm"));
String jgwzbm=cf.GB2Uni(cf.getParameter(request,"jgwzbm"));


String bjjbbm=null;
String ssfgs=null;
String dqbm=null;
String clxlmc=null;

double sjjmsl=0;//ʵ�ʼ�������
double sjsl=0;//ʵ������
String txxx="";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select bjjb,ssfgs";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjbbm=cf.fillNull(rs.getString("bjjb"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();
	ps.close();

	ls_sql="SELECT dqbm";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
	}
	rs.close();
	ps.close();

	ls_sql="select clxlmc";
	ls_sql+=" from  jxc_clxlbm";
	ls_sql+=" where clxlbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clxlmc=cf.fillNull(rs.getString("clxlmc"));
	}
	rs.close();
	ps.close();


	ls_sql="select sjjmsl,sjsl";
	ls_sql+=" FROM tc_csrjkhczjmj";
	ls_sql+=" where khbh='"+khbh+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
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

%>


<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">

<div align="center">¼��ͻ�������Ŀ������<%=jgwzbm%>����ש</div>

<table border="1" width="110%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="2%">���</td>
	<td  width="3%"><span class="STYLE2">����</span></td>
	<td  width="3%"><span class="STYLE2">����</span></td>
	<td  width="5%"><span class="STYLE2">�ṹλ��</span></td>
	<td  width="15%"><span class="STYLE2">����˵��</span></td>
	<td  width="4%">��������</td>
	<td  width="10%">��Ʒ����</td>
	<td  width="6%">Ʒ��</td>
	<td  width="8%">�ͺ�</td>
	<td  width="8%">���</td>
	<td  width="4%">������λ</td>
	<td  width="5%">��Ʒ���</td>
	<td  width="4%">���ۼ���</td>
</tr>
<%
	String sxh=null;
	String bjjbmc=null;
	String sl=null;
	String ptcpsm=null;

	String bzmc=null;
	String cpmc=null;
	String cpbm=null;
	String nbbm=null;
	String xh=null;
	String gg=null;
	String jldw=null;
	String ppmc=null;
	String dj=null;

	ls_sql="SELECT tc_csrjkhzcqd.dj,tc_csrjkhzcqd.sxh,bjjbmc,tc_csrjkhzcqd.sl,tc_csrjkhzcqd.ptcpsm,tc_csrjkhzcqd.bzmc,tc_csrjkhzcqd.cpbm,tc_csrjkhzcqd.cpmc,tc_csrjkhzcqd.ppmc,tc_csrjkhzcqd.xh,tc_csrjkhzcqd.gg,tc_csrjkhzcqd.jldw,tc_csrjkhzcqd.tccplbbm  ";
	ls_sql+=" FROM bdm_bjjbbm,tc_csrjkhzcqd  ";
    ls_sql+=" where tc_csrjkhzcqd.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tc_csrjkhzcqd.khbh='"+khbh+"' and tc_csrjkhzcqd.tccplbbm='"+clxlmc+"' and tc_csrjkhzcqd.jgwzbm='"+jgwzbm+"'";
    ls_sql+=" order by tc_csrjkhzcqd.ppmc,tc_csrjkhzcqd.cpbm,tc_csrjkhzcqd.sxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		dj=cf.fillNull(rs.getString("dj"));
		sxh=cf.fillNull(rs.getString("sxh"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));
		sl=cf.fillNull(rs.getString("sl"));
		ptcpsm=cf.fillHtml(rs.getString("ptcpsm"));
		bzmc=cf.fillHtml(rs.getString("bzmc"));
		cpbm=cf.fillHtml(rs.getString("cpbm"));
		cpmc=cf.fillHtml(rs.getString("cpmc"));
		xh=cf.fillHtml(rs.getString("xh"));
		gg=cf.fillHtml(rs.getString("gg"));
		jldw=cf.fillHtml(rs.getString("jldw"));
		ppmc=cf.fillHtml(rs.getString("ppmc"));
		tccplbbm=cf.fillHtml(rs.getString("tccplbbm"));

		%>
		<tr bgcolor="#FFFFFF" align='center'>
		  <td>
			<A HREF="DeleteBj_khzcxmCz.jsp?khbh=<%=khbh%>&sxh=<%=sxh%>" target="_blank">ɾ��</A>
			<A HREF="EditBj_khzcxmCz.jsp?khbh=<%=khbh%>&sxh=<%=sxh%>" target="_blank">�޸�</A>
		  </td>
		  <td><%=sxh%></td>
		  <td><%=sl%></td>
		  <td><%=dj%></td>
		  <td><%=jgwzbm%></td>
		  <td><%=ptcpsm%></td>
		  <td><%=bzmc%></td>
		  <td><%=cpmc%></td>
		  <td><%=ppmc%></td>
		  <td><%=xh%></td>
		  <td><%=gg%></td>
		  <td><%=jldw%></td>
		  <td><%=tccplbbm%></td>
		  <td><%=bjjbmc%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%>
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE3">�ͻ����</span></td> 
  <td width="32%"> 
    <input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE3">���ۼ���</span></td> 
  <td width="32%">
	<select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjbbm+"'",bjjbbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE3">��Ʒ����</span></td>
  <td><select name="tccpdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select cldlbm,clxlmc from jxc_cldlbm where cldlbm='"+tccpdlbm+"' order by clxlmc","");
%>
  </select></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE3">����</span></td>
  <td><select name="select" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select jgwzbm c1,jgwzbm c2 from bj_fjxx where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"'","");
%>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">ʵ������</span></td>
  <td><%=sjsl%></td>
  <td align="right"><span class="STYLE4">ʵ�ʼ�������</span></td>
  <td><%=sjjmsl%></td>
</tr>


    <tr align="center"> 
      <td colspan="4">&nbsp;</td>
    </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="7%">��������</td>
	<td  width="9%">�ڲ�����</td>
	<td  width="10%">Ʒ��</td>
	<td  width="12%">��Ʒ����</td>
	<td  width="14%">�ͺ�</td>
	<td  width="13%">���</td>
	<td  width="6%">��λ</td>
	<td  width="7%">����</td>
	<td  width="7%">�շ�</td>
	<td  width="141%">��Ƭ</td>
</tr>

<%
//	String bzmc=null;

//	String cpmc=null;
//	String cpbm=null;
//	String nbbm=null;
//	String xh=null;
//	String gg=null;
//	String jldw=null;
//	String ppmc=null;
	String zcbjjbbm=null;
	String zcbjjbmc=null;


	ls_sql="SELECT distinct bzmc ";
	ls_sql+=" FROM tc_csrjzck";
    ls_sql+=" where tccplbbm='"+clxlmc+"' and  dqbm='"+dqbm+"' ";
    ls_sql+=" and ((sfyx='1') OR (sfyx='3' and yxkssj<=TRUNC(SYSDATE) and yxjzsj>=TRUNC(SYSDATE)) )";
    ls_sql+=" and cpbm not in(select cpbm from tc_csrjkhzcqd where khbh='"+khbh+"')";
    ls_sql+=" order by bzmc ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		bzmc=cf.fillNull(rs1.getString("bzmc"));

		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM tc_csrjzck";
		ls_sql+=" where tccplbbm='"+clxlmc+"' and  dqbm='"+dqbm+"'";
		ls_sql+=" and  bzmc='"+bzmc+"' ";
		ls_sql+=" and ((sfyx='1') OR (sfyx='3' and yxkssj<=TRUNC(SYSDATE) and yxjzsj>=TRUNC(SYSDATE)) )";
		ls_sql+=" and cpbm not in(select cpbm from tc_csrjkhzcqd where khbh='"+khbh+"')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		ls_sql="SELECT cpmc,cpbm,nbbm,xh,gg,jldw,ppmc,tc_csrjzck.bjjbbm,bjjbmc";
		ls_sql+=" FROM tc_csrjzck,bdm_bjjbbm";
		ls_sql+=" where tc_csrjzck.bjjbbm=bdm_bjjbbm.bjjbbm(+) ";
		ls_sql+=" and tccplbbm='"+clxlmc+"' and  dqbm='"+dqbm+"'";
		ls_sql+=" and bzmc='"+bzmc+"' ";
		ls_sql+=" and ((sfyx='1') OR (sfyx='3' and yxkssj<=TRUNC(SYSDATE) and yxjzsj>=TRUNC(SYSDATE)) )";
		ls_sql+=" and cpbm not in(select cpbm from tc_csrjkhzcqd where khbh='"+khbh+"')";
		ls_sql+=" order by bzmc,ppmc,cpmc,xh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			cpmc=cf.fillNull(rs.getString("cpmc"));
			cpbm=cf.fillNull(rs.getString("cpbm"));
			nbbm=cf.fillHtml(rs.getString("nbbm"));
			xh=cf.fillHtml(rs.getString("xh"));
			gg=cf.fillHtml(rs.getString("gg"));
			jldw=cf.fillNull(rs.getString("jldw"));
			ppmc=cf.fillNull(rs.getString("ppmc"));
			zcbjjbbm=cf.fillNull(rs.getString("bjjbbm"));
			zcbjjbmc=cf.fillNull(rs.getString("bjjbmc"));

			if (zcbjjbbm.equals(bjjbbm))
			{
				zcbjjbmc="����";
			}


			double sjsfj=0;
			String sfdz="";
			String dzkssj="";
			String dzjzsj="";
			double dzsjsfj=0;
			ls_sql="SELECT sjsfj,sfdz,dzkssj,dzjzsj,dzsjsfj";
			ls_sql+=" FROM tc_csrjzcsjcjb";
			ls_sql+=" where cpbm='"+cpbm+"' and  bjjbbm='"+bjjbbm+"' ";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				sjsfj=rs2.getDouble("sjsfj");
				sfdz=cf.fillNull(rs2.getString("sfdz"));
				dzkssj=cf.fillNull(rs2.getDate("dzkssj"));
				dzjzsj=cf.fillNull(rs2.getDate("dzjzsj"));
				dzsjsfj=rs2.getDouble("dzsjsfj");
			}
			rs2.close();
			ps2.close();

			String sjsfjStr="&nbsp;";
			if (sfdz.equals("2") && dzkssj.compareTo(cf.today())<=0 && dzjzsj.compareTo(cf.today())>=0)//1�����ۿۣ�2������
			{
				if (dzsjsfj!=0)
				{
					sjsfjStr=dzsjsfj+"<BR>ԭ��"+sjsfj;
				}
			}
			else{
				if (sjsfj!=0)
				{
					sjsfjStr=sjsfj+"";
				}
			}
			
			
			
			String zp="&nbsp;";
			if (!nbbm.equals("&nbsp;"))
			{
//				zp="<img src=\"\\tc\\csrjtc\\zck\\images\\"+nbbm+".JPG\" width=\"100\">";
			}

			%>
			<tr bgcolor="#FFFFFF"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			  <td rowspan="<%=count%>">
				<A HREF="SaveInsertBj_khzcxmDb.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&bzmc=<%=bzmc%>&jgwzbm=<%=jgwzbm%>">ѡ��</A>
			  </td>
			  <td rowspan="<%=count%>"><%=bzmc%></td>
			  <td><%=nbbm%></td>
			  <td><%=ppmc%></td>
			  <td><%=cpmc%></td>
			  <td><%=xh%></td>
			  <td><%=gg%></td>
			  <td><%=jldw%></td>
			  <td><%=zcbjjbmc%></td>
			  <td><%=sjsfjStr%></td>
			  <td><%=zp%></td>
			</tr>
			<%
		}

		while (rs.next())
		{
			cpmc=cf.fillNull(rs.getString("cpmc"));
			cpbm=cf.fillNull(rs.getString("cpbm"));
			nbbm=cf.fillHtml(rs.getString("nbbm"));
			xh=cf.fillHtml(rs.getString("xh"));
			gg=cf.fillHtml(rs.getString("gg"));
			jldw=cf.fillNull(rs.getString("jldw"));
			ppmc=cf.fillNull(rs.getString("ppmc"));
			zcbjjbbm=cf.fillNull(rs.getString("bjjbbm"));
			zcbjjbmc=cf.fillNull(rs.getString("bjjbmc"));

			if (zcbjjbbm.equals(bjjbbm))
			{
				zcbjjbmc="����";
			}

			double sjsfj=0;
			String sfdz="";
			String dzkssj="";
			String dzjzsj="";
			double dzsjsfj=0;
			ls_sql="SELECT sjsfj,sfdz,dzkssj,dzjzsj,dzsjsfj";
			ls_sql+=" FROM tc_csrjzcsjcjb";
			ls_sql+=" where cpbm='"+cpbm+"' and  bjjbbm='"+bjjbbm+"' ";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				sjsfj=rs2.getDouble("sjsfj");
				sfdz=cf.fillNull(rs2.getString("sfdz"));
				dzkssj=cf.fillNull(rs2.getDate("dzkssj"));
				dzjzsj=cf.fillNull(rs2.getDate("dzjzsj"));
				dzsjsfj=rs2.getDouble("dzsjsfj");
			}
			rs2.close();
			ps2.close();

			String sjsfjStr="&nbsp;";
			if (sfdz.equals("2") && dzkssj.compareTo(cf.today())<=0 && dzjzsj.compareTo(cf.today())>=0)//1�����ۿۣ�2������
			{
				if (dzsjsfj!=0)
				{
					sjsfjStr=dzsjsfj+"<BR>ԭ��"+sjsfj;
				}
			}
			else{
				if (sjsfj!=0)
				{
					sjsfjStr=sjsfj+"";
				}
			}

			String zp="&nbsp;";
			if (!nbbm.equals("&nbsp;"))
			{
//				zp="<img src=\"\\tc\\csrjtc\\zck\\images\\"+nbbm+".JPG\" width=\"100\">";
			}

			%>
			<tr bgcolor="#FFFFFF"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			  <td><%=nbbm%></td>
			  <td><%=ppmc%></td>
			  <td><%=cpmc%></td>
			  <td><%=xh%></td>
			  <td><%=gg%></td>
			  <td><%=jldw%></td>
			  <td><%=zcbjjbmc%></td>
			  <td><%=sjsfjStr%></td>
			  <td><%=zp%></td>
			</tr>
			<%
		}
		rs.close();
		ps.close();
	}
	rs1.close();
	ps1.close();

	ls_sql="SELECT cpmc,cpbm,nbbm,xh,gg,jldw,ppmc,tc_csrjzck.bjjbbm,bjjbmc";
	ls_sql+=" FROM tc_csrjzck,bdm_bjjbbm";
	ls_sql+=" where tc_csrjzck.bjjbbm=bdm_bjjbbm.bjjbbm(+) ";
	ls_sql+=" and tccplbbm='"+clxlmc+"' and  dqbm='"+dqbm+"'";
	ls_sql+=" and  bzmc is null";
	ls_sql+=" and ((sfyx='1') OR (sfyx='3' and yxkssj<=TRUNC(SYSDATE) and yxjzsj>=TRUNC(SYSDATE)) )";
	ls_sql+=" and cpbm not in(select cpbm from tc_csrjkhzcqd where khbh='"+khbh+"')";
	ls_sql+=" order by bzmc,ppmc,cpmc,xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		cpmc=cf.fillNull(rs.getString("cpmc"));
		cpbm=cf.fillNull(rs.getString("cpbm"));
		nbbm=cf.fillHtml(rs.getString("nbbm"));
		xh=cf.fillHtml(rs.getString("xh"));
		gg=cf.fillHtml(rs.getString("gg"));
		jldw=cf.fillNull(rs.getString("jldw"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		zcbjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		zcbjjbmc=cf.fillNull(rs.getString("bjjbmc"));

		if (zcbjjbbm.equals(bjjbbm))
		{
			zcbjjbmc="����";
		}

		double sjsfj=0;
		String sfdz="";
		String dzkssj="";
		String dzjzsj="";
		double dzsjsfj=0;
		ls_sql="SELECT sjsfj,sfdz,dzkssj,dzjzsj,dzsjsfj";
		ls_sql+=" FROM tc_csrjzcsjcjb";
		ls_sql+=" where cpbm='"+cpbm+"' and  bjjbbm='"+bjjbbm+"' ";
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery();
		if (rs2.next())
		{
			sjsfj=rs2.getDouble("sjsfj");
			sfdz=cf.fillNull(rs2.getString("sfdz"));
			dzkssj=cf.fillNull(rs2.getDate("dzkssj"));
			dzjzsj=cf.fillNull(rs2.getDate("dzjzsj"));
			dzsjsfj=rs2.getDouble("dzsjsfj");
		}
		rs2.close();
		ps2.close();

		String sjsfjStr="&nbsp;";
		if (sfdz.equals("2") && dzkssj.compareTo(cf.today())<=0 && dzjzsj.compareTo(cf.today())>=0)//1�����ۿۣ�2������
		{
			if (dzsjsfj!=0)
			{
				sjsfjStr=dzsjsfj+"<BR>ԭ��"+sjsfj;
			}
		}
		else{
			if (sjsfj!=0)
			{
				sjsfjStr=sjsfj+"";
			}
		}


		String zp="&nbsp;";
		if (!nbbm.equals("&nbsp;"))
		{
//			zp="<img src=\"\\tc\\csrjtc\\zck\\images\\"+nbbm+".JPG\" width=\"100\">";
		}

		%>
		<tr bgcolor="#FFFFFF"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
		  <td>
			<A  HREF="SaveInsertBj_khzcxmDb.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&cpbm=<%=cpbm%>&jgwzbm=<%=jgwzbm%>">ѡ��</A>
		  </td>
		  <td>&nbsp;</td>
		  <td><%=nbbm%></td>
		  <td><%=ppmc%></td>
		  <td><%=cpmc%></td>
		  <td><%=xh%></td>
		  <td><%=gg%></td>
		  <td><%=jldw%></td>
		  <td><%=zcbjjbmc%></td>
		  <td><%=sjsfjStr%></td>
		  <td><%=zp%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
	
	
%>
</table>

<%
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
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (rs2 != null) rs2.close(); 
		if (ps2 != null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
</form>

</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--


function onclickTr(obj)
{
	if (obj.style.background=='#ff33ff')
	{
		obj.style.background='#FFFFFF';
	}
	else
	{
		obj.style.background='#FF33FF';
	}
}
function inTr(obj)
{
	if (obj.style.background!='#ff33ff')
	{
		obj.style.background='#FFFF33';
	}
}
function outTr(obj)
{
	if (obj.style.background=='#ffff33')
	{
		obj.style.background='#FFFFFF';
	}
}

function KeyDown()
{ 
	if ((event.ctrlKey))
	{ //���� Ctrl+n
		event.returnValue=false;
		alert('��ֹ����') ;
	}

	if ((event.ctrlKey)&&(event.keyCode==78))
	{ //���� Ctrl+n
		event.returnValue=false;
	}
	if ((event.shiftKey)&&(event.keyCode==121))
	{ //���� shift+F10
		event.returnValue=false;
	}
}


 
//-->
</SCRIPT>

