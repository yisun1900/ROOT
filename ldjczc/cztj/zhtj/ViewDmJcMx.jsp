<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String dwbh=request.getParameter("dwbh");
String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String dwmc=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql =" select dwmc";
	ls_sql+=" from sq_dwxx";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dwmc=rs.getString("dwmc");
	}
	rs.close();
	ps.close();

%>
<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">���漯�ɼҾ�ҵ����<%=dwmc%>��
  <BR>(�տ�ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="180%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
    <td  width="2%">&nbsp;</td>
	<td  width="3%">�ͻ����</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="9%">���ݵ�ַ</td>
	<td  width="3%">��װ���ʦ</td>
	<td  width="3%">�Ҿӹ���</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="3%">ҵ��Ա</td>

   	<td  width="3%">�������</td>
	<td  width="4%">����״̬</td>
	<td  width="3%">��������</td>
	<td  width="5%">��Ʒ��</td>
	<td  width="4%">������</td>
	<td  width="4%">�տ�ʱ��</td>
	<td  width="4%">�������ʱ��</td>


	<td  width="4%">��ͬ��-�ۺ�</td>
	<td  width="4%">��ͬ���Ϸ�-�ۺ�</td>
	<td  width="4%">����Ʒ���Ϸ�</td>
	<td  width="4%">�ؼ�Ʒ���Ϸ�</td>
	<td  width="4%">����Ʒ��ɼ������</td>
	<td  width="4%">�ؼ�Ʒ��ɼ������</td>
	<td  width="4%">��ɼ�����</td>

	<td  width="4%">����ȷ��ʱ��</td>
	<td  width="4%">�˵�ʱ��</td>
	<td  width="4%">¼��ʱ��</td>
	<td  width="4%">����ʱ��</td>
</tr>
<%
	String khbh=null;
	String ddbh=null;


	double allfkje=0;
	double allhkze=0;
	double allzhclf=0;
	double allzcpclf=0;
	double alltjpclf=0;
	double alltcjrje=0;

	int row=0;
	ls_sql =" SELECT distinct cw_khfkjl.khbh,jc_zcdd.ddlx,jc_zcdd.ddqrsj,cw_khfkjl.ddbh";
	ls_sql+=" FROM jc_zcdd,cw_khfkjl";
	ls_sql+=" where cw_khfkjl.ddbh=jc_zcdd.ddbh(+)";

	ls_sql+=" and cw_khfkjl.scbz='N' ";
	ls_sql+=" and cw_khfkjl.fklxbm in('23')";//23:����
	ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
	ls_sql+=" and cw_khfkjl.dwbh='"+dwbh+"'";

	ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

	ls_sql+=" order by jc_zcdd.ddlx,jc_zcdd.ddqrsj,cw_khfkjl.ddbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=rs.getString("khbh");
		ddbh=rs.getString("ddbh");


		double fkje=0;
		String sksj=null;
		String sjsj=null;
		ls_sql =" SELECT sum(cw_khfkjl.fkje) fkje,max(cw_khfkjl.sksj) sksj,max(cw_khfkjl.sjsj) sjsj";
		ls_sql+=" FROM cw_khfkjl";
		ls_sql+=" where cw_khfkjl.scbz='N' ";
		ls_sql+=" and cw_khfkjl.fklxbm in('23')";//23:����
		ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
		ls_sql+=" and cw_khfkjl.dwbh='"+dwbh+"'";

		ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

		ls_sql+=" and cw_khfkjl.ddbh='"+ddbh+"'";

		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			fkje=rs1.getDouble("fkje");
			sksj=cf.fillHtml(rs1.getDate("sksj"));
			sjsj=cf.fillHtml(rs1.getDate("sjsj"));
		}
		rs1.close();
		ps1.close();

		
		
		allfkje+=fkje;
		allfkje=cf.round(allfkje,2);

		row++;

		String khxm=null;
		String fwdz=null;
		String sjs=null;
		String clgw=null;
		String khjl=null;
		String ywy=null;
		ls_sql =" select khxm,fwdz,sjs,clgw,khjl,ywy";
		ls_sql+=" from crm_zxkhxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			khxm=cf.fillHtml(rs1.getString("khxm"));
			fwdz=cf.fillHtml(rs1.getString("fwdz"));
			sjs=cf.fillHtml(rs1.getString("sjs"));
			clgw=cf.fillHtml(rs1.getString("clgw"));
			khjl=cf.fillHtml(rs1.getString("khjl"));
			ywy=cf.fillHtml(rs1.getString("ywy"));
		}
		rs1.close();
		ps1.close();

		String clztmc=null;
		String ddlxmc=null;
		String ppbm=null;
		double hkze=0;
		double zhclf=0;
		double zcpclf=0;
		double tjpclf=0;
		double tcjrbl=0;
		double tjptcjrbl=0;
		double tcjrje=0;
		String ddqrsj=null;
		String tdsj=null;
		String jssj=null;
		String lrsj=null;

		ls_sql =" select clztmc,DECODE(jc_zcdd.ddlx,'1','����Ʒ','3','��¼��ͬ','4','�п�涩��','5','��׼�ײ�','6','�Ҿ߽����ײ�','7','��ů�����ײ�','8','�����ײ�','9','��������','A','��������','B','��������շ�','C','ѡ������','D','�ײ�������','E','ɢ��') ddlxmc,ppbm";
		ls_sql+=" ,zhclf,hkze,zcpclf,tjpclf,tcjrbl,tjptcjrbl,ROUND(zcpclf*tcjrbl/100+tjpclf*tjptcjrbl/100,2) tcjrje";
		ls_sql+=" ,ddqrsj,tdsj,jssj,lrsj";
		ls_sql+=" from jc_zcdd,jdm_zcddzt";
		ls_sql+=" where jc_zcdd.clzt=jdm_zcddzt.clzt";
		ls_sql+=" and jc_zcdd.ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			clztmc=cf.fillHtml(rs1.getString("clztmc"));
			ddlxmc=cf.fillHtml(rs1.getString("ddlxmc"));
			ppbm=cf.fillHtml(rs1.getString("ppbm"));
			zhclf=rs1.getDouble("zhclf");
			hkze=rs1.getDouble("hkze");
			zcpclf=rs1.getDouble("zcpclf");
			tjpclf=rs1.getDouble("tjpclf");
			tcjrbl=rs1.getDouble("tcjrbl");
			tjptcjrbl=rs1.getDouble("tjptcjrbl");
			tcjrje=rs1.getDouble("tcjrje");
			ddqrsj=cf.fillHtml(rs1.getDate("ddqrsj"));
			tdsj=cf.fillHtml(rs1.getDate("tdsj"));
			jssj=cf.fillHtml(rs1.getDate("jssj"));
			lrsj=cf.fillHtml(rs1.getDate("lrsj"));
		}
		rs1.close();
		ps1.close();

		allhkze+=hkze;
		allhkze=cf.round(allhkze,2);
		allzhclf+=zhclf;
		allzhclf=cf.round(allzhclf,2);
		allzcpclf+=zcpclf;
		allzcpclf=cf.round(allzcpclf,2);
		alltjpclf+=tjpclf;
		alltjpclf=cf.round(alltjpclf,2);
		alltcjrje+=tcjrje;
		alltcjrje=cf.round(alltcjrje,2);

		%>
		<tr align="center"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
		  <td><%=row%></td>
		  <td ><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=khbh%></A></td>
		  <td ><%=khxm%></td>
		  <td ><%=fwdz%></td>
		  <td ><%=sjs%></td>
		  <td ><%=clgw%></td>
		  <td ><%=khjl%></td>
		  <td ><%=ywy%></td>

		  <td ><A HREF="/jcjj/zcdd/ViewJc_zcdd.jsp?ddbh=<%=ddbh%>" target="_blank"><%=ddbh%></A></td>
		  <td ><%=clztmc%></td>
		  <td ><%=ddlxmc%></td>
		  <td ><%=ppbm%></td>

		  <td ><%=fkje%></td>
		  <td ><%=sksj%></td>
		  <td ><%=sjsj%></td>
		  <td ><%=hkze%></td>
		  <td ><%=zhclf%></td>
		  <td ><%=zcpclf%></td>
		  <td ><%=tjpclf%></td>
		  <td ><%=tcjrbl%>%</td>
		  <td ><%=tjptcjrbl%>%</td>
		  <td ><%=tcjrje%></td>
		  <td ><%=ddqrsj%></td>
		  <td ><%=tdsj%></td>
		  <td ><%=lrsj%></td>
		  <td ><%=jssj%></td>

		</tr> 
		<%
	}
	rs.close();
	ps.close();
%>

<tr bgcolor="#FFFFFF" align='center'>
  <td colspan="2">С ��</td>
  <td >&nbsp;</td>
  <td >&nbsp;</td>
  <td >&nbsp;</td>
  <td >&nbsp;</td>
  <td >&nbsp;</td>
  <td >&nbsp;</td>

  <td >&nbsp;</td>
  <td >&nbsp;</td>
  <td >&nbsp;</td>
  <td >&nbsp;</td>

  <td ><%=cf.formatDouble(allfkje)%></td>
  <td >&nbsp;</td>
  <td >&nbsp;</td>
  <td ><%=cf.formatDouble(allhkze)%></td>
  <td ><%=cf.formatDouble(allzhclf)%></td>
  <td ><%=cf.formatDouble(allzcpclf)%></td>
  <td ><%=cf.formatDouble(alltjpclf)%></td>
  <td >&nbsp;</td>
  <td >&nbsp;</td>
  <td ><%=cf.formatDouble(alltcjrje)%></td>
  <td >&nbsp;</td>
  <td >&nbsp;</td>
  <td >&nbsp;</td>
  <td >&nbsp;</td>
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