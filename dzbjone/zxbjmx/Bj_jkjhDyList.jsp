<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>

<head>
<style>
@media print{
	INPUT {display:none}
}
.STYLE2 {font-size: 18px}
</style>

</head>


<%
//�����İ�������ʾ����
String qydmbh=null;
String qydm=null;

String khbh=request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int row=0;

String khxm=null;
String qyrq=null;
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
String ssfgs=null;
String clgw=null;
int fwmj=0;

String bjbbh=null;
String dqbm =null;
String hxbm =null;
String bjjbmc  =null;
String bjjbbm  =null;
String ysshr="";
String ysshbz="";

try {
	conn=cf.getConnection();

	
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,crm_zxkhxx.bjjb,bjjbmc,ssfgs,fwmj,bjbbh,hxbm,zxdm,ysshr,DECODE(ysshbz,'N','δ���','Y','ͨ��','M','���δͨ��')ysshbz";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
	   
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjbmc=cf.fillHtml(rs.getString("bjjbmc"));
		bjjbbm=cf.fillHtml(rs.getString("bjjb"));
		ssfgs=rs.getString("ssfgs");
		fwmj=rs.getInt("fwmj");
		bjbbh=cf.fillNull(rs.getString("bjbbh"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		qydmbh=cf.fillNull(rs.getString("zxdm"));
		ysshr=cf.fillNull(rs.getString("ysshr"));
		ysshbz=cf.fillNull(rs.getString("ysshbz"));
		
	}
	rs.close();
	ps.close();
	
	//��ѯǩԼ����
	ls_sql="SELECT qyrq from crm_khxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qyrq=cf.fillNull(rs.getDate("qyrq"));
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
		dqbm=cf.fillHtml(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	
	
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb,ssfgs,fwmj";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjb=cf.fillHtml(rs.getString("bjjb"));
		ssfgs=rs.getString("ssfgs");
		fwmj=rs.getInt("fwmj");
	}
	rs.close();
	ps.close();


%>
<body >

<TABLE border="0" cellspacing="0" cellpadding="0" width="100%" cellspacing="0 style='FONT-SIZE: 14px'">

<THEAD bgcolor="#FFFFFF" style="display:table-header-group;font-weight:bold">
<tr><td>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>

  <tr bgcolor="#FFFFFF"> 
    <td colspan="3" align="center" class="STYLE2" ><p align="center"><b>�����ڴ｡���ײ�ѡ����ͬ</b></p></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="50%" >�˿�������<%=khxm%></td>
    <td width="35%" >�˿͵绰��<%=lxfs%></td>
    <td width="28%" >ǩԼ����:<%=qyrq%></td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
    <td width="50%" >�ͻ���ַ��<%=fwdz%></td>
	<td width="35%" ></td>
	<td width="28%" >�ͻ�����:</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="3" ><br><br>&nbsp;&nbsp;&nbsp;&nbsp;<font size="2">Ϊ����˿���ȷѡ��Ҿ��ײͲ�Ʒ�����پ��ס�ά�����ĺϷ�Ȩ�棬��ԼҾ��ײ�ѡ�������д�ұȽϹ�ע�����⣬���������ر�˵����Լ����������ǩ��Э��֮ǰ��ϸ�Ķ��������ݣ�<br><b>1.�������⡣</b>���ڼҾߵ�������ִ�С�����װ��װ�޲���ľ�Ҿ����к�������������׼�������ڿ�������ִ�С����ڿ���������׼����������׼���ƶ����Ų�ͬ���м���ȱ����Ч���νӣ���˸��ݼҾߵĻ�����׼�����ĺϸ�Ҿ��ڰᵽ���Һ����ڵ���ЧӦ��Ӱ�죬�������ڿ���������׼����⣬�����п����ǿ����������ꡣ�����ڴ��ά�����Ľ����ĽǶȳ�����������һ��Ҫ������ѡ����׼���Ҿߣ����ǵ�λ�����ڰڷŵļҾ�Ҫ���������Ǽ�������������Ҳ��Ҫ���ţ��ڼҾ��ͻ�����֮��180���ڿ����˻���<br>
	<b>2. ɫ�����⡣</b>�Ҿߵ�ʵľ��������ɫ������������һ�㲻�����������⣻ʯ������Ȼ�������ϣ���Ȼɫ���ͬ��������������ƴ���ǲ��ɱ���ģ�һ�㲻�����������⣻Ƥ��Ƥ����Ʒ�Ȳ�ͬ���εĲ�Ʒ����ɫ��Ҳ����������һ�㲻�����������⡣<br>
	<b>3. ��������</b>�˿ͱ������ͻ�֮ǰ����ȫ�������ط��ã����������ڴ���Ȩ�ܾ��ͻ����ɴ���ɵ����������ɹ˿ͳе����ͻ�ʱ���˿����ֳ����ǩ�գ�ǩ�պ������Ʒ�������ٻ���������⣬�����ڴＰ�Ҿ߳��Ҳ��ٳе��κ����Ρ�<br><b>4. ���������⻻���˻���</b><br>&nbsp;&nbsp;&nbsp;&nbsp;4.1����Ʒ���պ�һ�����ڣ�����Ʒ���κ��𻵡���Ӱ��������۵�����£��˿�����ϲ�õ�ԭ�����仯������Ҫ�󻻻��˻���������Ʒ��ר��Ϊ�׷������Ľ��ڲ�Ʒ���⣩��<br>&nbsp;&nbsp;&nbsp;&nbsp;4.2 �Ҿ��ײͲ����˵�Ʒ�������˻����������˻����˻�����ͨ�������ڴֱ���˸������޷��˻����<br>&nbsp;&nbsp;&nbsp;&nbsp;4.3 �����������˻����������İ�װ���á�����������ú����°�װ�ķ����ɹ˿ͳе������У��˷Ѳ��ձ��а�ҹ�˾�ķ��ñ�׼����߲�����________Ԫ����װ�Ѱ������3%���㣬��߲�����_________Ԫ��<br><b>5. �Ҿߡ��������涨��������Ʒ���⣩��</b><br>&nbsp;&nbsp;&nbsp;&nbsp;5.1 �Ҿ�������Ч��Ϊһ�ꡣ��90���ڳ��������������⣬�׷�����ѡ����������������˻���180���ڳ��������������⣬�׷�����ѡ���������򻻻���������Ч�����µ�ʱ���ڳ����������⣬�ҷ������������<br>&nbsp;&nbsp;&nbsp;&nbsp;5.2 ���ƼҾߵı�׼������֣����չ��һ���ҵ���������涨ִ�У��Ǳ�׼������ֳ����������⣬ԭ����ֻ������������˻���ֻ������������޷��ָ���������������²������˻���<br><b>6. ΥԼ���Ρ�</b><br>&nbsp;&nbsp;&nbsp;&nbsp;6.1�ڹ˿Ͱ�����ͬԼ��֧�������ط��ú󣬼Ҿ߳���δ�����ͻ�����ɰ�װ��ÿ�ӳ�һ�찴�Ѹ������6����˿�֧��ΥԼ�𣻳���15�죬�˿���Ȩ��ֹ����ͬ�������ڴ�������˿��Ѹ������⣬���밴��Э���Ѹ������30%�⳥�˿�ΥԼ��<br>&nbsp;&nbsp;&nbsp;&nbsp;6.2��Э�����漰������Ʒ�����������εģ��Ա�Э��Լ��Ϊ׼�������ڴﲻ���ա���ͥ����װ��װ�޹���ʩ����ͬ��Լ�����������ν����⸶��<br>&nbsp;&nbsp;&nbsp;&nbsp;6.3δ��˿�Э��һ�£������ڴﵥ��������Э��ģ������ڴ��ȫ����˿��Ѹ������⣬���밴�Ѹ������50%֧��ΥԼ��<br>&nbsp;&nbsp;&nbsp;&nbsp;6.4������Э���4������������һ�����������˻������ޣ�������Ʒ�����������⣬ԭ���ϲ����Ի����˻������׷���ֻ����˻�����˿�Ҫ�⳥�����ڴ��ɴ˲�������ʧ�����⸶�Ľ��ܵ��ڻ������10%���˿ͳ���Э��Լ�����ͻ�ʱ��6���¶�δ����򲻸������ڴ��ṩ�ͻ������ģ������ڴ���Ȩ��������ֹЭ�飬�˿��밴�������10%�е�ΥԼ��<br><b>7. ���׽������.</b>��Ʒ����������������⣬�����ڴ�����Э��������˿Ͷ������ڴ�Ĵ�����������⣬�����������ڴ����ڵ�����Ժ�������ϻ��ٲû��������ٲã������ڴｫ���ݷ�Ժ�о�������ٲû������ٲ������׷������⸶��<br>&nbsp;&nbsp;&nbsp;&nbsp;ѡ���Ҿ��ײ���ϸ���£��˺�ͬ�������ڴ���¡��˿�ǩ�ֺ���Ч���˿Ͱ���ͬ����ȫ��������ڴﰲ�żҾ��ͻ�����װ��</font><br>
	</td>
	</tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF" align="center"> 
    <td  width="15%" >�ײ�����</td>
    <td  width="8%" >�۸�</td>
    <td  width="15%" >��Ʒ����</td>
    <td  width="15%" >Ʒ��</td>
    <td  width="20%" >�ͺ�</td>
	<td  width="15%" >���</td>
    <td  width="6%" >��λ</td>
    <td  width="6%" >����</td>
  </tr>

	
<%
	int i=0;
	String tcbm=null;
	String tcmc=null;
	double yj=0;
	double tcj=0;
	double alltcj=0;
	String bz=null;
	ls_sql="SELECT tcbm,tcmc,yj,tcj,bz";
	ls_sql+=" FROM bj_khzctcmc ";
    ls_sql+=" where khbh='"+khbh+"' ";
    ls_sql+=" and lx='2' ";//1���Ҿ��ײͣ�2�������ƻ�
	ls_sql+=" order by tcbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		tcbm=rs.getString("tcbm");
		tcmc=rs.getString("tcmc");
		yj=rs.getDouble("yj");
		tcj=rs.getDouble("tcj");
		bz=cf.fillHtml(rs.getString("bz"));

		alltcj+=tcj;

		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_khzctcmx";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and tcbm='"+tcbm+"'";
		ls_sql+=" order by cpbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (count==0)
		{
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td ><%=tcmc%></td>
				<td ><%=tcj%></td>
				<td colspan="6" align="left"><B>δѡ������</B></td>
			  </tr>
			<%
			continue;
		}

		String cpbm=null;
		String cpmc=null;
		String ppmc=null;
		String xh=null;
		String gg=null;
		String jldw=null;
		double sl=0;
		ls_sql="SELECT cpbm,cpmc,ppmc,xh,gg,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,lrr,lrsj,bz";
		ls_sql+=" FROM bj_khzctcmx";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and tcbm='"+tcbm+"'";
		ls_sql+=" order by cpbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			cpbm=rs1.getString("cpbm");
			cpmc=rs1.getString("cpmc");
			ppmc=rs1.getString("ppmc");
			xh=cf.fillNull(rs1.getString("xh"));
			gg=cf.fillHtml(rs1.getString("gg"));
			jldw=rs1.getString("jldw");
			sl=rs1.getDouble("sl");

			if (sl==0)
			{
				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td rowspan="<%=count%>"><%=tcmc%></td>
					<td rowspan="<%=count%>"><%=tcj%></td>
					<td><%=cpmc%></td>
					<td colspan="5" align="left"><B>δѡ������</B></td>
				  </tr>
				<%
			}
			else{
				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td rowspan="<%=count%>"><%=tcmc%></td>
					<td rowspan="<%=count%>"><%=tcj%></td>
					<td><%=cpmc%></td>
					<td><%=ppmc%></td>
					<td><%=xh%></td>
					<td><%=gg%></td>
					<td><%=jldw%></td>
					<td><%=cf.formatDouble(sl)%></td>
				  </tr>
				<%
			}


		}

		while (rs1.next())
		{
			cpbm=rs1.getString("cpbm");
			cpmc=rs1.getString("cpmc");
			ppmc=rs1.getString("ppmc");
			xh=cf.fillNull(rs1.getString("xh"));
			gg=cf.fillHtml(rs1.getString("gg"));
			jldw=rs1.getString("jldw");
			sl=rs1.getDouble("sl");

			if (sl==0)
			{
				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td><%=cpmc%></td>
					<td colspan="5" align="left"><B>δѡ������</B></td>
				  </tr>
				<%
			}
			else{
				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td><%=cpmc%></td>
					<td><%=ppmc%></td>
					<td><%=xh%></td>
					<td><%=gg%></td>
					<td><%=jldw%></td>
					<td><%=cf.formatDouble(sl)%></td>
				  </tr>
				<%
			}

		}
		rs1.close();
		ps1.close();
	}
	rs.close();
	ps.close();
%> 
  		
  <tr bgcolor="#FFFFFF" align="center"> 
	<td><B>С ��</B></td>
	<td><B><%=alltcj%></B></td>
	<td><B>�� д</B></td>
	<td colspan="5"><b><font size="2"><%=cf.NumToRMBStr(alltcj)%>;<font></b></td>
	</tr>
</table>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF">
    <td colspan="3" height="42"><strong><font size="3">ע������ͬһʽ���ݣ��˿�ִһ�ݣ������ڴ�ִ���ݡ�</font></strong></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
    <td width="50%"><strong><font size="3">�˿�ǩ�֣�<font></strong></td>
    <td width="50%"><strong><font size="3">�����ڴ���£��� <font></strong><br>
    <strong><font size="3">�����ڴ�ί�д����ˣ� <font></strong><br>
    <strong><font size="3">���ʦǩ�֣� <font></strong></td>
    </tr>
</table>

</td></tr>
</TBODY>

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






