<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='17030312'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'���棡�Ƿ�����[Ʒ�ƽ���ͳ��]��"+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'����[Ʒ�ƽ���ͳ��]��"+xtrzyhmc+"') ";
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

String fgs=request.getParameter("fgs");
String ppbm=cf.GB2Uni(request.getParameter("ppbm"));


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
  <B>Ʒ�ƽ���ͳ��</B><BR>
  <b>(ǩ��ͬʱ�䣺<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table width="130%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="3%" >����</td>
  <td  width="6%" >���Ĵ���</td>
  <td  width="6%" >Ʒ��</td>

  <td  width="7%" bgcolor="#66FFFF" ><strong>�ɱ���С��<BR>(ǩ��-�˵�+������)</strong></td>
  <td  width="5%" bgcolor="#66FFFF" ><strong>ƽ���ɱ�</strong></td>
  <td  width="5%" bgcolor="#66FFFF" ><strong>ƽ���������</strong></td>
  <td  width="7%" bgcolor="#66FFFF" ><strong>ǩ���ɱ�</strong></td>
  <td  width="7%" bgcolor="#66FFFF" ><strong>�˵��ɱ�</strong></td>
  <td  width="7%" bgcolor="#66FFFF" ><strong>������ɱ�</strong></td>

  <td  width="7%" >����С��<BR>(ǩ��-�˵�+������)</td>
  <td  width="4%" >�ͻ���</td>
  <td  width="4%" >������</td>
  <td  width="7%" >��ǰ����ͬ��</td>
  <td  width="7%" >�ۺ󣭺�ͬ��</td>
  <td  width="5%" >ƽ����ֵ</td>
  <td  width="7%" >�˵���</td>
  <td  width="7%" >������</td>

  </tr>
<%
	//��ȡ�����
	String getfgsbh=null;
	String getppbm=null;
	String getzcdlbm=null;
	double xsje=0;
	double cbje=0;

	
	int xjkhsl=0;
	int xjddsl=0;
	double xjwdzgce=0;
	double xjqye=0;
	double xjxsje=0;
	double xjtde=0;
	double xjzjxze=0;

	double xjcbje=0;
	double xjcbze=0;
	double xjtdcbze=0;
	double xjzjxcbze=0;

	int row=0;


	
	ls_sql =" SELECT fgsbh,ppbm,zcdlbm,sum(cbje) cbje,sum(xsje) xsje";
	ls_sql+=" FROM (";

	//ǩ��
	ls_sql+=" SELECT fgsbh,ppbm,zcdlbm,sum(cbze) cbje,sum(hkze) xsje";
	ls_sql+=" FROM jc_zcdd";
	ls_sql+=" where jc_zcdd.clzt>='09' and jc_zcdd.clzt!='98'";
	ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and jc_zcdd.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and jc_zcdd.fgsbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	if (!(fgs.equals("")))
	{
		ls_sql+=" and  (jc_zcdd.fgsbh='"+fgs+"')";
	}

	if (!(ppbm.equals("")))
	{
		ls_sql+=" and  jc_zcdd.ppbm='"+ppbm+"'";
	}
	ls_sql+=" group by fgsbh,ppbm,zcdlbm";


	ls_sql+=" UNION ALL ";
	
	//�˵�
	ls_sql+=" SELECT fgsbh,ppbm,zcdlbm,-1*sum(cbze+zjxcbze) cbje,-1*sum(hkze+zjhze) xsje";
	ls_sql+=" FROM jc_zcdd";
	ls_sql+=" where jc_zcdd.clzt='99'";
	ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and jc_zcdd.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and jc_zcdd.fgsbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	if (!(fgs.equals("")))
	{
		ls_sql+=" and  (jc_zcdd.fgsbh='"+fgs+"')";
	}

	if (!(ppbm.equals("")))
	{
		ls_sql+=" and  jc_zcdd.ppbm='"+ppbm+"'";
	}
	ls_sql+=" group by fgsbh,ppbm,zcdlbm";

	ls_sql+=" UNION ALL ";

	//������
	ls_sql+=" SELECT fgsbh,ppbm,zcdlbm,sum(zjxcbze) cbje,sum(zjxze) xsje";
	ls_sql+=" FROM jc_zczjx";
	ls_sql+=" where jc_zczjx.clzt not in('00')";
	ls_sql+=" and jc_zczjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zczjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and jc_zczjx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and jc_zczjx.fgsbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	if (!(fgs.equals("")))
	{
		ls_sql+=" and  (jc_zczjx.fgsbh='"+fgs+"')";
	}

	if (!(ppbm.equals("")))
	{
		ls_sql+=" and  jc_zczjx.ppbm='"+ppbm+"'";
	}
	ls_sql+=" group by fgsbh,ppbm,zcdlbm";


	ls_sql+=" )";

	ls_sql+=" group by fgsbh,ppbm,zcdlbm";
	ls_sql+=" order by cbje desc";

//	out.println(ls_sql);
	
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getfgsbh=rs.getString("fgsbh");
		getppbm=rs.getString("ppbm");
		getzcdlbm=rs.getString("zcdlbm");
		cbje=rs.getDouble("cbje");
		xsje=rs.getDouble("xsje");

		xjcbje+=cbje;
		xjxsje+=xsje;
		
		String fgsmc=null;
		ls_sql=" SELECT dwmc";
		ls_sql+=" FROM sq_dwxx";
		ls_sql+=" where dwbh='"+getfgsbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			fgsmc=rs1.getString("dwmc");
		}
		rs1.close();
		ps1.close();

		//ǩ��
		int khsl=0;
		int ddsl=0;
		double wdzgce=0;
		double qye=0;
		double cbze=0;
		ls_sql =" SELECT count(distinct khbh) khsl,count(ddbh) ddsl,sum(wdzje) wdzje,sum(hkze) qye,sum(cbze) cbze";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where jc_zcdd.clzt>='09' and jc_zcdd.clzt!='98'";
		ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_zcdd.ppbm='"+getppbm+"'";
		ls_sql+=" and jc_zcdd.zcdlbm='"+getzcdlbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			khsl=rs1.getInt("khsl");
			ddsl=rs1.getInt("ddsl");
			wdzgce=rs1.getDouble("wdzje");
			qye=rs1.getDouble("qye");
			cbze=rs1.getDouble("cbze");
		}
		rs1.close();
		ps1.close();

		xjkhsl+=khsl;
		xjddsl+=ddsl;
		xjwdzgce+=wdzgce;
		xjqye+=qye;
		xjcbze+=cbze;


		//�˵�
		double tde=0;
		double tdcbze=0;
		ls_sql =" SELECT -1*sum(hkze+zjhze) tde,-1*sum(cbze+zjxcbze) tdcbze";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where jc_zcdd.clzt='99'";
		ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_zcdd.ppbm='"+getppbm+"'";
		ls_sql+=" and jc_zcdd.zcdlbm='"+getzcdlbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			tde=rs1.getDouble("tde");
			tdcbze=rs1.getDouble("tdcbze");
		}
		rs1.close();
		ps1.close();

		xjtde+=tde;
		xjtdcbze+=tdcbze;

		//������
		double zjxze=0;
		double zjxcbze=0;
		ls_sql =" SELECT sum(zjxze) xsje,sum(zjxcbze) zjxcbze";
		ls_sql+=" FROM jc_zczjx";
		ls_sql+=" where jc_zczjx.clzt not in('00')";
		ls_sql+=" and jc_zczjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zczjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zczjx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_zczjx.ppbm='"+getppbm+"'";
		ls_sql+=" and jc_zczjx.zcdlbm='"+getzcdlbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zjxze=rs1.getDouble("xsje");
			zjxcbze=rs1.getDouble("zjxcbze");
		}
		rs1.close();
		ps1.close();

		xjzjxze+=zjxze;
		xjzjxcbze+=zjxcbze;

		double zkl=0;
		int xspjde=0;
		if (ddsl!=0)
		{
			xspjde=(int)qye/ddsl;
		}
		else{
			xspjde=0;
		}

		int jspjde=0;
		if (ddsl!=0)
		{
			jspjde=(int)cbje/ddsl;
		}
		else{
			jspjde=0;
		}

		double pjjsbl=0;
		if (xsje!=0)
		{
			pjjsbl=cf.round(cbje*100/xsje,2);
		}
		else{
			pjjsbl=0;
		}

		row++;

		%>
		<tr align="center"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			<td ><%=row%></td>
			<td ><%=getzcdlbm%></td>
			<td ><%=getppbm%></td>


			<td><%=cf.formatDouble((long)cbje)%></td>
			<td><%=cf.formatDouble(jspjde)%></td>
			<td><%=cf.formatDouble(pjjsbl)%>%</td>
			<td>
				<A HREF="ViewPpQdMxJs.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&ppbm=<%=getppbm%>&zcdlbm=<%=getzcdlbm%>&fgsbh=<%=getfgsbh%>" target="_blank">
				<%=cf.formatDouble((long)cbze)%></A></td>
			<td>
				<A HREF="ViewPpTdMxJs.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&ppbm=<%=getppbm%>&zcdlbm=<%=getzcdlbm%>&fgsbh=<%=getfgsbh%>" target="_blank">
				<%=cf.formatDouble((long)tdcbze)%></A></td>
			<td>
				<A HREF="ViewPpZjxMxJs.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&ppbm=<%=getppbm%>&zcdlbm=<%=getzcdlbm%>&fgsbh=<%=getfgsbh%>" target="_blank">
				<%=cf.formatDouble((long)zjxcbze)%></A></td>



			<td><%=cf.formatDouble((long)xsje)%></td>

			<td><%=khsl%></td>
			<td><%=ddsl%></td>
			<td><%=cf.formatDouble((long)wdzgce)%></td>
			<td>
				<%=cf.formatDouble((long)qye)%>
			</td>
			<td><%=cf.formatDouble(xspjde)%></td>
			<td>
				<%=cf.formatDouble((long)tde)%>
			</td>
			<td>
				<%=cf.formatDouble((long)zjxze)%>
			</td>

		</tr>
		<%	
	}
	rs.close();
	ps.close();
	


	int xspjde=0;
	if (xjddsl!=0)
	{
		xspjde=(int)xjxsje/xjddsl;
	}
	else{
		xspjde=0;
	}

	int jspjde=0;
	if (xjddsl!=0)
	{
		jspjde=(int)xjcbje/xjddsl;
	}
	else{
		jspjde=0;
	}

	double pjjsbl=0;
	if (xjxsje!=0)
	{
		pjjsbl=cf.round(xjcbje*100/xjxsje,2);
	}
	else{
		pjjsbl=0;
	}
%>

<tr align="center"  bgcolor="#E8E8FF"  onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	<td colspan="3"><font color="#ff0000">�ܼ�</td>

	<td  bgcolor="#E8E8FF"><strong><%=cf.formatDouble((long)xjcbze)%></strong></td>
	<td  bgcolor="#E8E8FF"><strong><%=jspjde%></strong></td>
	<td  bgcolor="#E8E8FF"><strong><%=pjjsbl%>%</strong></td>
	<td  bgcolor="#E8E8FF"><strong><%=cf.formatDouble((long)xjcbze)%></strong></td>
	<td  bgcolor="#E8E8FF"><strong><%=cf.formatDouble((long)xjtdcbze)%></strong></td>
	<td  bgcolor="#E8E8FF"><strong><%=cf.formatDouble((long)xjzjxcbze)%></strong></td>
	
	<td><%=cf.formatDouble((long)xjxsje)%></td>
	<td><%=xjkhsl%></td>
	<td><%=xjddsl%></td>
	<td><%=cf.formatDouble((long)xjwdzgce)%></td>
	<td><%=cf.formatDouble((long)xjqye)%></td>
	<td><%=xspjde%></td>
	<td><%=cf.formatDouble((long)xjtde)%></td>
	<td><%=cf.formatDouble((long)xjzjxze)%></td>

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