<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='17030302'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'���棡�Ƿ�����[�ֹ�˾����ͳ��]��"+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'����[�ֹ�˾����ͳ��]��"+xtrzyhmc+"') ";
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
String ls_sql=null;
try {
	conn=cf.getConnection();

%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>

<CENTER >
  <B>�ֹ�˾����ͳ��</B><BR>
  <b>(ͳ��ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table width="120%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="4%" >���</td>
  <td  width="13%" >�ֹ�˾</td>
  <td  width="6%" >�ͻ���</td>
  <td  width="6%" >������</td>
  <td  width="11%" >ʵ�տ�</td>
  <td  width="9%" >ƽ����ֵ</td>
  <td  width="10%" >�ۺ󣭺�ͬ��</td>
  <td  width="8%" >�˵���</td>
  <td  width="9%" >������</td>
  <td  width="10%" >�����ܶ�</td>

  </tr>
<%
	//��ȡ�����
	
	int xjkhsl=0;
	int xjddsl=0;
	double xjyjje=0;
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

		if (cxbz.equals("Y"))//Y���ѳ�����N��δ����
		{
			fgsmc="<font color=\"#FF0033\">"+fgsmc+"<BR>("+kdsj+"��"+gdsj+")</font>";
		}
		else{
			if (!kdsj.equals(""))
			{
				fgsmc=fgsmc+"<BR>(����:"+kdsj+")";
			}
		}

		//ʵ�տ�
		int khsl=0;
		int ddsl=0;
		double yjje=0;
		ls_sql =" SELECT count(distinct cw_khfkjl.khbh) khsl,count(cw_khfkjl.ddbh) ddsl,sum(cw_khfkjl.fkje) yjje";
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
			khsl=rs1.getInt("khsl");
			ddsl=rs1.getInt("ddsl");
			yjje=rs1.getDouble("yjje");
		}
		rs1.close();
		ps1.close();

		xjkhsl+=khsl;
		xjddsl+=ddsl;
		xjyjje+=yjje;


		int pjde=0;
		if (ddsl!=0)
		{
			pjde=(int)yjje/ddsl;
		}
		else{
			pjde=0;
		}

		//ǩ��
		double wdzgce=0;
		double qye=0;
		ls_sql =" SELECT sum(wdzje) wdzje,sum(hkze) qye";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where jc_zcdd.clzt>='09' and jc_zcdd.clzt!='98'";
		ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.fgsbh='"+getfgsbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			wdzgce=rs1.getDouble("wdzje");
			qye=rs1.getDouble("qye");
		}
		rs1.close();
		ps1.close();

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

			<td><%=khsl%></td>
			<td><%=ddsl%></td>
			<td><%=cf.formatDouble(yjje)%></td>
			<td><%=cf.formatDouble(pjde)%></td>
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
	if (xjddsl!=0)
	{
		pjde=(int)xjyjje/xjddsl;
	}
	else{
		pjde=0;
	}
%>

<tr align="center"  bgcolor="#E8E8FF"  onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	<td colspan="2"><font color="#ff0000">�ܼ�</td>
	
	<td><%=cf.formatDouble(xjkhsl)%></td>
	<td><%=xjddsl%></td>
	<td><%=cf.formatDouble(xjyjje)%></td>
	<td><%=pjde%></td>
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