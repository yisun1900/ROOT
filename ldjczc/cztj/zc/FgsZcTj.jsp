<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
	cf.ckxxrz(request,session,"17030302",1);
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
  <B>�ֹ�˾����ͳ��</B><BR>
  <b>(ͳ��ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table width="120%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="3%" >���</td>
  <td  width="13%" >�ֹ�˾</td>
  <td  width="6%" >ʵ�տ�ͻ���</td>
  <td  width="6%" >ʵ�տ����</td>
  <td  width="11%" >ʵ�տ�</td>
  <td  width="8%" >ʵ�տ�ƽ����ֵ</td>

  <td  width="6%" >�¶����ͻ���</td>
  <td  width="6%" >�¶�����</td>
  <td  width="11%" >�¶����ۺ��ͬ��</td>
  <td  width="9%" >�˵���</td>
  <td  width="10%" >������</td>
  <td  width="11%" >�����ܶ�</td>
  </tr>
<%
	//��ȡ�����
	
	int xjsskhsl=0;
	int xjssddsl=0;
	double xjsskje=0;

	int xjkhsl=0;
	int xjddsl=0;
	double xjwdzgce=0;
	double xjqye=0;
	double xjtde=0;
	double xjzjxze=0;
	double xjxsje=0;

	int row=0;


	
	String fgsmc=null;
	String getfgsbh=null;
	String cxbz="";
	String kdsj="";
	String gdsj="";

	ls_sql =" SELECT sq_dwxx.dwbh,sq_dwxx.dwmc,sq_dwxx.kdsj,sq_dwxx.gdsj,sq_dwxx.cxbz ";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwlx='F0'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and sq_dwxx.dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_dwxx.dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	if (!(fgs.equals("")))
	{
		ls_sql+=" and  (sq_dwxx.ssfgs='"+fgs+"')";
	}
	ls_sql+=" and (sq_dwxx.cxbz='N' or sq_dwxx.gdsj+62>TO_DATE('"+sjfw+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
	ls_sql+=" order by sq_dwxx.dwbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getfgsbh=rs.getString("dwbh");
		fgsmc=rs.getString("dwmc");

		cxbz=rs.getString("cxbz");
		kdsj=cf.fillNull(rs.getDate("kdsj"));
		gdsj=cf.fillNull(rs.getDate("gdsj"));


		//ʵ�տ�
		int sskhsl=0;
		int ssddsl=0;
		double sskje=0;
		ls_sql =" SELECT count(distinct cw_khfkjl.khbh) khsl,count(distinct cw_khfkjl.ddbh) ddsl,sum(cw_khfkjl.fkje) sskje";
		ls_sql+=" FROM cw_khfkjl";

		ls_sql+=" where cw_khfkjl.scbz='N' ";
		ls_sql+=" and cw_khfkjl.fklxbm in('23')";//23:����
		ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
		ls_sql+=" and cw_khfkjl.fgsbh='"+getfgsbh+"'";

		ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
				sskhsl=rs1.getInt("khsl");
				ssddsl=rs1.getInt("ddsl");
				sskje=rs1.getDouble("sskje");
		}
		rs1.close();
		ps1.close();

		xjsskhsl+=sskhsl;
		xjssddsl+=ssddsl;
		xjsskje+=sskje;

		int pjde=0;
		if (sskhsl!=0)
		{
			pjde=(int)sskje/sskhsl;
		}
		else{
			pjde=0;
		}

		//ǩ��
		int khsl=0;
		int ddsl=0;
		double wdzgce=0;
		double qye=0;
		ls_sql =" SELECT count(distinct jc_zcdd.khbh) khsl,count(jc_zcdd.ddbh) ddsl,sum(wdzje) wdzje,sum(hkze) qye";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where jc_zcdd.clzt>='09' and jc_zcdd.clzt!='98'";
		ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.fgsbh='"+getfgsbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			khsl=rs1.getInt("khsl");
			ddsl=rs1.getInt("ddsl");
			wdzgce=rs1.getDouble("wdzje");
			qye=rs1.getDouble("qye");
		}
		rs1.close();
		ps1.close();

		xjkhsl+=khsl;
		xjddsl+=ddsl;

		xjwdzgce+=wdzgce;
		xjqye+=qye;


		//�˵�
		double tde=0;
		ls_sql =" SELECT -1*sum(hkze+zjhze) je";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where jc_zcdd.clzt='99'";
		ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.fgsbh='"+getfgsbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			tde=rs1.getDouble("je");
		}
		rs1.close();
		ps1.close();

		xjtde+=tde;

		//������
		double zjxze=0;
		ls_sql =" SELECT sum(zjxze) je";
		ls_sql+=" FROM jc_zczjx";
		ls_sql+=" where jc_zczjx.clzt not in('00')";
		ls_sql+=" and jc_zczjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zczjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zczjx.fgsbh='"+getfgsbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zjxze=rs1.getDouble("je");
		}
		rs1.close();
		ps1.close();

		xjzjxze+=zjxze;

		double xsje=qye+tde+zjxze;

		xjxsje+=xsje;

		row++;

		%>
		<tr align="center"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			<td ><%=row%></td>
			<td ><%=fgsmc%></td>

			<td><%=sskhsl%></td>
			<td><%=ssddsl%></td>
			<td><%=cf.formatDouble(sskje)%></td>
			<td><%=cf.formatDouble(pjde)%></td>

			<td><%=khsl%></td>
			<td><%=ddsl%></td>
			<td>
				<%=cf.formatDouble(qye)%>
			</td>
			<td>
				<%=cf.formatDouble(tde)%>
			</td>
			<td>
				<%=cf.formatDouble(zjxze)%>
			</td>
			<td><%=cf.formatDouble(xsje)%></td>

		</tr>
		<%	
	}
	rs.close();
	ps.close();
	

	int pjde=0;
	if (xjssddsl!=0)
	{
		pjde=(int)xjsskje/xjssddsl;
	}
	else{
		pjde=0;
	}
%>

<tr align="center"  bgcolor="#E8E8FF"  onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	<td colspan="2"><font color="#ff0000">�ܼ�</td>
	
	<td><%=cf.formatDouble(xjsskhsl)%></td>
	<td><%=xjssddsl%></td>
	<td><%=cf.formatDouble(xjsskje)%></td>
	<td><%=pjde%></td>
	<td><%=cf.formatDouble(xjkhsl)%></td>
	<td><%=xjddsl%></td>
	<td><%=cf.formatDouble(xjqye)%></td>
	<td><%=cf.formatDouble(xjtde)%></td>
	<td><%=cf.formatDouble(xjzjxze)%></td>
	<td><%=cf.formatDouble(xjxsje)%></td>

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