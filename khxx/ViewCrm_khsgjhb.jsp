<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>



<html>
<head>
<title>ʩ���ƻ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>
<%
String khbh=request.getParameter("khbh");

String khxm=null;
String fwdz=null;
String sjs=null;
String mbmc=null;
String sjkgrq=null;

String rwbm=null;
String rwmc=null;
String rwdx=null;
String rwxh=null;
String rwsfsj=null;
String rwts=null;
String yjhkssj=null;
String yjhjssj=null;
String yjhgzr=null;
String zxjhkssj=null;
String zxjhjssj=null;
String zxjhgzr=null;
String rwsfwc=null;
String rwsfwcmc=null;
String sjkssj=null;
String sjjssj=null;
String sjgzr=null;
String sfyq=null;
String sfyqmc=null;
String yqts=null;
String jddf=null;
String lrr=null;
String lrsj=null;
String bz=null;
String ysjg=null;
String ysjlh=null;
String ddbh=null;
String clztmc=null;

String sfsjysxm=null;
String gcysxmbm=null;
String sfsjzcxm=null;
String zcdlbm=null;
String sjzcjd=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select khxm,fwdz,sjs,mbmc,sjkgrq";
	ls_sql+=" from  crm_khxx,gdm_sgjdmb";
	ls_sql+=" where  crm_khxx.mbbm=gdm_sgjdmb.mbbm(+)";
	ls_sql+=" and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		mbmc=cf.fillNull(rs.getString("mbmc"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
	}
	rs.close();
	ps.close();
%>
<body bgcolor="#FFFFFF">
<div align="center">ʩ���ƻ���(<%=mbmc%>)</div>
<BR>
<table width="100%" border="0" style="FONT-SIZE:16" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#FFFFFF">
	<td width="24%" >�ͻ�������<%=khxm%></td>
	<td width="20%" >���ʦ��<%=sjs%></td>
	<td width="36%"  >���ݵ�ַ��<%=fwdz%></td>
    <td width="20%"  >ʵ�ʿ�����<%=sjkgrq%></td>
</tr>
</table>

<table width="240%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">���</td>
	<td  width="2%">�������</td>
	<td  width="8%">��������</td>
	<td  width="2%">������ʱ��</td>
	<td  width="2%">��׼��������</td>
	<td  width="3%">���¼ƻ���ʼʱ��</td>
	<td  width="3%">���¼ƻ�����ʱ��</td>
	<td  width="2%">���¼ƻ�������</td>
	<td  width="2%">�����Ƿ����</td>
	<td  width="3%">ʵ�ʿ�ʼʱ��</td>
	<td  width="3%">ʵ�ʽ���ʱ��</td>
	<td  width="2%">ʵ�ʹ�����</td>
	<td  width="2%">�Ƿ�����</td>
	<td  width="2%">��������</td>
	<td  width="2%">����÷�</td>
	<td  width="3%">���ս��</td>
	<td  width="3%">���ռ�¼��</td>
	<td  width="3%">�������</td>
	<td  width="3%">��������״̬</td>
	<td  width="2%">�Ƿ��漰������Ŀ</td>
	<td  width="8%">������Ŀ</td>
	<td  width="2%">�Ƿ��漰������Ŀ</td>
	<td  width="3%">�漰���Ĵ���</td>
	<td  width="3%">�漰���Ľڵ�</td>
	<td  width="2%">�ƻ�������</td>
	<td  width="3%">�ƻ�����ʱ��</td>
	<td  width="18%">��ע</td>
	<td  width="3%">ԭ�ƻ���ʼʱ��</td>
	<td  width="3%">ԭ�ƻ�����ʱ��</td>
	<td  width="2%">ԭ�ƻ�������</td>
	<td  width="2%">�������</td>
</tr>


<%
	ls_sql="select rwbm,rwmc,DECODE(rwdx,'1','�ͻ�','2','ʩ����','3','��Ӧ��','4','���ʦ','5','�ʼ�') rwdx ";
	ls_sql+=" ,rwxh,rwsfsj,rwts,yjhkssj,yjhjssj,yjhgzr,zxjhkssj,zxjhjssj,zxjhgzr,rwsfwc,DECODE(rwsfwc,'Y','���','N','��') rwsfwcmc";
	ls_sql+=" ,sjkssj,sjjssj,sjgzr";
	ls_sql+=" ,sfyq,DECODE(sfyq,'Y','����','N','��') sfyqmc,yqts,jddf,crm_khsgjhb.lrr,crm_khsgjhb.lrsj,crm_khsgjhb.bz ";
	ls_sql+=" ,DECODE(ysjg,'0','û����','1','����δ����','2','����','3','�Ѵ���','4','�ѽ��','5','����ͨ��','6','����δͨ��') ysjg,ysjlh ";
	ls_sql+=" ,ddbh,a.clztmc";
	ls_sql+=" ,DECODE(sfsjysxm,'Y','��','N','��') sfsjysxm,gcysxmmc,DECODE(sfsjzcxm,'Y','��','N','��') sfsjzcxm,zcdlbm,b.clztmc sjzcjd";
	ls_sql+=" from  crm_khsgjhb,jdm_zcddzt a,jdm_zcddzt b,dm_gcysxm";
	ls_sql+=" where  crm_khsgjhb.clzt=a.clzt(+)";
	ls_sql+=" and  crm_khsgjhb.sjzcjd=b.clzt(+)";
	ls_sql+=" and  crm_khsgjhb.gcysxmbm=dm_gcysxm.gcysxmbm(+)";
	ls_sql+=" and khbh='"+khbh+"'";
	ls_sql+=" order by rwxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		rwbm=cf.fillNull(rs.getString("rwbm"));
		rwmc=cf.fillNull(rs.getString("rwmc"));
		rwdx=cf.fillNull(rs.getString("rwdx"));
		rwxh=cf.fillNull(rs.getString("rwxh"));
		rwsfsj=cf.fillNull(rs.getString("rwsfsj"));
		rwts=cf.fillNull(rs.getString("rwts"));
		yjhkssj=cf.fillNull(rs.getDate("yjhkssj"));
		yjhjssj=cf.fillNull(rs.getDate("yjhjssj"));
		yjhgzr=cf.fillNull(rs.getString("yjhgzr"));
		zxjhkssj=cf.fillNull(rs.getDate("zxjhkssj"));
		zxjhjssj=cf.fillNull(rs.getDate("zxjhjssj"));
		zxjhgzr=cf.fillNull(rs.getString("zxjhgzr"));

		rwsfwc=cf.fillNull(rs.getString("rwsfwc"));
		rwsfwcmc=cf.fillNull(rs.getString("rwsfwcmc"));
		sjkssj=cf.fillHtml(rs.getDate("sjkssj"));
		sjjssj=cf.fillHtml(rs.getDate("sjjssj"));
		sjgzr=cf.fillHtml(rs.getString("sjgzr"));
		sfyq=cf.fillNull(rs.getString("sfyq"));
		sfyqmc=cf.fillNull(rs.getString("sfyqmc"));
		yqts=cf.fillNull(rs.getString("yqts"));
		jddf=cf.fillNull(rs.getString("jddf"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));

		ysjg=cf.fillHtml(rs.getString("ysjg"));
		ysjlh=cf.fillHtml(rs.getString("ysjlh"));
		ddbh=cf.fillHtml(rs.getString("ddbh"));
		clztmc=cf.fillHtml(rs.getString("clztmc"));
		sfsjysxm=cf.fillNull(rs.getString("sfsjysxm"));
		gcysxmbm=cf.fillHtml(rs.getString("gcysxmmc"));
		sfsjzcxm=cf.fillNull(rs.getString("sfsjzcxm"));
		zcdlbm=cf.fillHtml(rs.getString("zcdlbm"));
		sjzcjd=cf.fillHtml(rs.getString("sjzcjd"));

		if (zxjhjssj.compareTo(cf.today())<0 && rwsfwc.equals("N"))
		{
			sfyqmc="<span class='STYLE1'>����</span>";
		}


		bz=cf.fillHtml(rs.getString("bz"));

		%>
		<tr bgcolor="#FFFFF"  align="center">
			<td><%=rwxh%></td>
			<td><%=rwdx%></td>
			<td><%=rwmc%></td>
			<td><%=rwsfsj%></td>
			<td><%=rwts%></td>
			<td><%=zxjhkssj%></td>
			<td><%=zxjhjssj%></td>
			<td><%=zxjhgzr%></td>
			<td><%=rwsfwcmc%></td>
			<td><%=sjkssj%></td>
			<td><%=sjjssj%></td>
			<td><%=sjgzr%></td>
			<td><%=sfyqmc%></td>
			<td><%=yqts%></td>
			<td><%=jddf%></td>
			<td><%=ysjg%></td>
			<td><%=ysjlh%></td>
			<td><%=ddbh%></td>
			<td><%=clztmc%></td>

			<td><%=sfsjysxm%></td>
			<td><%=gcysxmbm%></td>
			<td><%=sfsjzcxm%></td>
			<td><%=zcdlbm%></td>
			<td><%=sjzcjd%></td>

			<td><%=lrr%></td>
			<td><%=lrsj%></td>
			<td><%=bz%></td>
			<td><%=yjhkssj%></td>
			<td><%=yjhjssj%></td>
			<td><%=yjhgzr%></td>
			<td><%=rwbm%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
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
</body>
</html>
