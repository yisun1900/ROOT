<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='170106'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzxqmc=(String)session.getAttribute("xqmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzxqmc+"',SYSDATE,'���棡�Ƿ�����[С������ͳ��]��"+xtrzxqmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzxqmc=(String)session.getAttribute("xqmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzxqmc+"',SYSDATE,'����[С������ͳ��]��"+xtrzxqmc+"') ";
		cf.executeUpdate(sql);
	}
%>


<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String fgs=cf.fillNull(request.getParameter("fgs"));


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

%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>

<CENTER >
  <B>С��ͳ��</B><BR>
  <b>(ʱ�䷶Χ��<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table width="150%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="2%"  >���</td>
  <td  width="8%"  >С��</td>

  <td  width="4%" >����</td>
  <td  width="4%" >������</td>
  <td  width="5%" >����ʱ��</td>
  <td  width="4%" >������</td>
  <td  width="4%" >����ѯ��</td>
  <td  width="4%" >������</td>
  <td  width="4%" >ǩ����</td>
  <td  width="4%" >�ѷɵ�</td>
  <td  width="4%" >�ڲ�����</td>
  <td  width="4%" >���ֹ�����</td>
  <td  width="4%" >��˾ռ����</td>
  <td  width="4%" >��ʩ������</td>
  <td  width="4%" >���깤</td>
  <td  width="4%" >δ����</td>

  </tr>
<%

int row=0;

//�¿ͻ���
int newkhs_zj=0;
//������
int newlfkhs_zj=0;
//������
int newdjkhs_zj=0;
//�ɵ���
int newfdkhs_zj=0;
//ǩ����
int newqdkhs_zj=0;
//�ڲ�����
int ljkhs_zj=0;
//��ʩ������
int zsgds_zj=0;
//δ����
int wkgds_zj=0;
//���깤
int wggds_zj=0;



String fgsmc=null;
String getdwbh=null;
String dwmc="";
String xqmc=null;
String cqbm=null;

ls_sql =" SELECT distinct cqbm,xqbm";
ls_sql+=" from  crm_zxkhxx";
ls_sql+=" where crm_zxkhxx.ssfgs='"+fgs+"'";
ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y����Ч��Ϣ��N����Ч��Ϣ
//ls_sql+=" and crm_zxkhxx.zxzt not in('2','3','4','6')";//0��δ������棻1: ������棻2: ���ʦ�ύ�ɵ���3����ǩԼ��4���ɵ���5���ɵ����δͨ����6��ɢ��
ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
ls_sql+=" order by cqbm,xqbm";
ps= conn.prepareStatement(ls_sql);
rs =ps.executeQuery();
while (rs.next())
{
	xqmc=rs.getString("xqbm");
	cqbm=rs.getString("cqbm");

	String fyssj="";
	String jfhs="";
	String zlhx="";

	ls_sql="select fyssj,jfhs,zlhx";
	ls_sql+=" from  yx_lsdcb";
	ls_sql+=" where cqbm='"+cqbm+"'";
	ls_sql+=" and xqmc='"+xqmc+"'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		fyssj=cf.fillNull(rs1.getDate("fyssj"));
		jfhs=cf.fillNull(rs1.getDate("jfhs"));
		zlhx=cf.fillNull(rs1.getDate("zlhx"));
	}
	rs1.close();
	ps1.close();

	//�¿ͻ���
	int newkhs=0;
	ls_sql="select count(*) ";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.ssfgs='"+fgs+"'";
	ls_sql+=" and crm_zxkhxx.xqbm='"+xqmc+"'";
	ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y����Ч��Ϣ��N����Ч��Ϣ
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		newkhs=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();


	//������
	int newlfkhs=0;
	ls_sql =" SELECT count(*)";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.ssfgs='"+fgs+"'";
	ls_sql+=" and crm_zxkhxx.xqbm='"+xqmc+"'";
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y����Ч��Ϣ��N����Ч��Ϣ
	ls_sql+=" and crm_zxkhxx.zxzt not in('2','3','4')";//0��δ������棻1: ������棻2: ���ʦ�ύ�ɵ���3����ǩԼ��4���ɵ���5���ɵ����δͨ����6��ɢ��

	ls_sql+=" and crm_zxkhxx.lfbz='Y'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		newlfkhs=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();

	//������
	int newdjkhs=0;
	ls_sql =" SELECT count(*)";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.ssfgs='"+fgs+"'";
	ls_sql+=" and crm_zxkhxx.xqbm='"+xqmc+"'";
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y����Ч��Ϣ��N����Ч��Ϣ
	ls_sql+=" and crm_zxkhxx.zxzt not in('2','3','4')";//0��δ������棻1: ������棻2: ���ʦ�ύ�ɵ���3����ǩԼ��4���ɵ���5���ɵ����δͨ����6��ɢ��

	ls_sql+=" and ( crm_zxkhxx.lfdj>0 OR crm_zxkhxx.hddj>0)";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		newdjkhs=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();


	//�ɵ���
	int newfdkhs=0;
	ls_sql =" SELECT count(*)";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.ssfgs='"+fgs+"'";
	ls_sql+=" and crm_zxkhxx.xqbm='"+xqmc+"'";
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y����Ч��Ϣ��N����Ч��Ϣ

	ls_sql+=" and crm_zxkhxx.zxzt in('2','4')";//0��δ������棻1: ������棻2: ���ʦ�ύ�ɵ���3����ǩԼ��4���ɵ���5���ɵ����δͨ����6��ɢ��
	ls_sql+=" and crm_zxkhxx.sbsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.sbsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		newfdkhs=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();

	//ǩ����
	int newqdkhs=0;
	ls_sql =" SELECT count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where crm_khxx.fgsbh='"+fgs+"'";
	ls_sql+=" and crm_khxx.xqbm='"+xqmc+"'";

	ls_sql+=" and crm_khxx.zt='2'";//2����װ�ͻ���3���˵��ͻ���4�����ɿͻ���5����ƿͻ���6��ɢ��
	
	ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_khxx.sfke>0";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		newqdkhs=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();


	//�ڲ�����
	int ljkhs=0;
	ls_sql =" SELECT count(*)";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.ssfgs='"+fgs+"'";
	ls_sql+=" and crm_zxkhxx.xqbm='"+xqmc+"'";
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y����Ч��Ϣ��N����Ч��Ϣ
	ls_sql+=" and crm_zxkhxx.zxzt not in('2','3','4')";//0��δ������棻1: ������棻2: ���ʦ�ύ�ɵ���3����ǩԼ��4���ɵ���5���ɵ����δͨ����6��ɢ��
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		ljkhs=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();

	//��ʩ������
	int zsgds=0;
	ls_sql =" SELECT count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where crm_khxx.fgsbh='"+fgs+"'";
	ls_sql+=" and crm_khxx.xqbm='"+xqmc+"'";

	ls_sql+=" and crm_khxx.zt='2'";//2����װ�ͻ���3���˵��ͻ���4�����ɿͻ���5����ƿͻ���6��ɢ��
	ls_sql+=" and crm_khxx.gcjdbm in('2','6','3')";//1��δ������2�����̿�����6�����ι�����ɣ�3���������գ�4�������깤��5��������᣻7����ͬ�쳣��ֹ
	

	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		zsgds=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();

	//δ����
	int wkgds=0;
	ls_sql =" SELECT count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where crm_khxx.fgsbh='"+fgs+"'";
	ls_sql+=" and crm_khxx.xqbm='"+xqmc+"'";

	ls_sql+=" and crm_khxx.zt='2'";//2����װ�ͻ���3���˵��ͻ���4�����ɿͻ���5����ƿͻ���6��ɢ��
	ls_sql+=" and crm_khxx.gcjdbm in('1')";//1��δ������2�����̿�����6�����ι�����ɣ�3���������գ�4�������깤��5��������᣻7����ͬ�쳣��ֹ
	
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		wkgds=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();

	//���깤
	int wggds=0;
	ls_sql =" SELECT count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where crm_khxx.fgsbh='"+fgs+"'";
	ls_sql+=" and crm_khxx.xqbm='"+xqmc+"'";

	ls_sql+=" and crm_khxx.zt='2'";//2����װ�ͻ���3���˵��ͻ���4�����ɿͻ���5����ƿͻ���6��ɢ��
	ls_sql+=" and crm_khxx.gcjdbm in('1')";//1��δ������2�����̿�����6�����ι�����ɣ�3���������գ�4�������깤��5��������᣻7����ͬ�쳣��ֹ
	
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		wggds=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();


	
	
////////////////////////С��
	//�¿ͻ���
	newkhs_zj+=newkhs;
	//������
	newlfkhs_zj+=newlfkhs;
	//������
	newdjkhs_zj+=newdjkhs;
	//�ɵ���
	newfdkhs_zj+=newfdkhs;
	//ǩ����
	newqdkhs_zj+=newqdkhs;
	//�ڲ�����
	ljkhs_zj+=ljkhs;
	//��ʩ������
	zsgds_zj+=zsgds;
	//δ����
	wkgds_zj+=wkgds;
	//���깤
	wggds_zj+=wggds;


	row++;


	%>
	<tr align="center"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
		<td><%=row%></td>
		<td><%=xqmc%></td>

		<td><%=jfhs%></td>
		<td>&nbsp;</td>
		<td><%=fyssj%></td>
		<td><%=zlhx%></td>
		<td><%=newkhs%></td>
		<td><%=newdjkhs%></td>
		<td><%=newqdkhs%></td>
		<td><%=newfdkhs%></td>

		<td><%=ljkhs%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=zsgds%></td>
		<td><%=wggds%></td>
		<td><%=wkgds%></td>

	</tr>
	<%	

}
rs.close();
ps.close();

	//�ϼƣ�����������������������������ʼ

%>

<tr align="center"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	<td colspan="2"><B>�� ��</B></td>

	<td><B>&nbsp;</B></td>
	<td><B>&nbsp;</B></td>
	<td><B>&nbsp;</B></td>
	<td><B>&nbsp;</B></td>
	<td><B><%=newkhs_zj%></B></td>
	<td><B><%=newdjkhs_zj%></B></td>
	<td><B><%=newqdkhs_zj%></B></td>
	<td><B><%=newfdkhs_zj%></B></td>

	<td><B><%=ljkhs_zj%></B></td>
	<td><B>&nbsp;</B></td>
	<td><B>&nbsp;</B></td>
	<td><B><%=zsgds_zj%></B></td>
	<td><B><%=wggds_zj%></B></td>
	<td><B><%=wkgds_zj%></B></td>


</tr>

</table>


</body>
</html>
<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<script>

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

</script> 