<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='17030304'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'���棡�Ƿ�����[���ʦ����ͳ��]��"+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'����[���ʦ����ͳ��]��"+xtrzyhmc+"') ";
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
String dwbh=cf.fillNull(request.getParameter("dwbh"));
String sjs=cf.GB2Uni(request.getParameter("sjs"));


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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>

<CENTER >
  <B>���ʦ����ͳ��</B><BR>
  <b>(ǩ��ͬʱ�䣺<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table width="120%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="4%" >����</td>
  <td  width="13%" >����</td>
  <td  width="13%" >���ʦ</td>

  <td  width="7%" >�ͻ���</td>
  <td  width="7%" >������</td>
  <td  width="12%" >ʵ�տ�</td>
  <td  width="9%" >ƽ����ֵ</td>
  <td  width="12%" >�ۺ󣭺�ͬ��</td>
  <td  width="11%" >�˵���</td>
  <td  width="12%" >������</td>
  <td  width="810%" >�����ܶ�</td>
  </tr>
<%
	//��ȡ�����
	int zjkhsl=0;
	int zjddsl=0;
	double zjyjje=0;
	double zjwdzgce=0;
	double zjqye=0;
	double zjtde=0;
	double zjzjxze=0;
	double zjxsje=0;

	int row=0;


	
	String getfgsbh=null;
	String fgsmc=null;
	String getdwbh=null;
	String dmmc=null;
	String cxbz="";
	String kdsj="";
	String gdsj="";

	ls_sql =" SELECT sq_dwxx.ssfgs,b.dwmc fgsmc,sq_dwxx.dwbh,sq_dwxx.dwmc,sq_dwxx.kdsj,sq_dwxx.gdsj,sq_dwxx.cxbz ";
	ls_sql+=" FROM sq_dwxx,sq_dwxx b";
	ls_sql+=" where  sq_dwxx.ssfgs=b.dwbh(+) and sq_dwxx.dwlx='F2'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_dwxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	if (!(fgs.equals("")))
	{
		ls_sql+=" and  (sq_dwxx.ssfgs='"+fgs+"')";
	}

	if (!(dwbh.equals("")))
	{
		ls_sql+=" and  sq_dwxx.dwbh='"+dwbh+"'";
	}
	if (!(sjs.equals("")))
	{
		ls_sql+=" and  sq_dwxx.dwbh in(select dwbh from sq_yhxx where ssfgs='"+fgs+"' and yhmc='"+sjs+"' and zwbm in('23','04'))";
	}
	ls_sql+=" and (sq_dwxx.cxbz='N' or sq_dwxx.gdsj+62>TO_DATE('"+sjfw+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
	ls_sql+=" order by sq_dwxx.ssfgs,sq_dwxx.dwbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getfgsbh=rs.getString("ssfgs");
		fgsmc=rs.getString("fgsmc");
		getdwbh=rs.getString("dwbh");
		dmmc=rs.getString("dwmc");
		cxbz=rs.getString("cxbz");
		kdsj=cf.fillNull(rs.getDate("kdsj"));
		gdsj=cf.fillNull(rs.getDate("gdsj"));

		if (cxbz.equals("Y"))//Y���ѳ�����N��δ����
		{
			dmmc="<font color=\"#FF0033\">"+dmmc+"<BR>("+kdsj+"��"+gdsj+")</font>";
		}
		else{
			if (!kdsj.equals(""))
			{
				dmmc=dmmc+"<BR>(����:"+kdsj+")";
			}
		}

		int xjkhsl=0;
		int xjddsl=0;
		double xjyjje=0;
		double xjwdzgce=0;
		double xjqye=0;
		double xjtde=0;
		double xjzjxze=0;
		double xjxsje=0;

		String sqlsjs="";

		String getsjs="";
		String sfzszg="";
		String rzsj="";
		String lzrq="";
		ls_sql =" SELECT yhmc,sfzszg,rzsj,lzrq";
		ls_sql+=" FROM sq_yhxx";
		ls_sql+=" where zwbm in('04','23')";
		ls_sql+=" and dwbh='"+getdwbh+"'";
		if (!(sjs.equals("")))
		{
			ls_sql+=" and yhmc='"+sjs+"'";
		}

		ls_sql+=" and (sfzszg in('Y','N') or lzrq+62>TO_DATE('"+sjfw+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
		ls_sql+=" order by yhmc";
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery();
		while (rs2.next())
		{
			getsjs=rs2.getString("yhmc");
			sfzszg=rs2.getString("sfzszg");
			rzsj=cf.fillNull(rs2.getDate("rzsj"));
			lzrq=cf.fillNull(rs2.getDate("lzrq"));

			sqlsjs+=",'"+getsjs+"'";

			//ʵ�տ�
			int khsl=0;
			int ddsl=0;
			double yjje=0;
			ls_sql =" SELECT count(distinct cw_khfkjl.khbh) khsl,count(cw_khfkjl.ddbh) ddsl,sum(cw_khfkjl.fkje) yjje";
			ls_sql+=" FROM cw_khfkjl";

			ls_sql+=" where cw_khfkjl.scbz='N' ";
			ls_sql+=" and cw_khfkjl.fklxbm in('23')";//23:����
			ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
			ls_sql+=" and cw_khfkjl.dwbh='"+getdwbh+"'";
			ls_sql+=" and cw_khfkjl.sjs='"+getsjs+"'";

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

			zjkhsl+=khsl;
			zjddsl+=ddsl;
			zjyjje+=yjje;


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
			ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"' and jc_zcdd.jzsjs='"+getsjs+"'";
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

			zjwdzgce+=wdzgce;
			zjqye+=qye;


			//�˵�
			double tde=0;
			ls_sql =" SELECT -1*sum(hkze+zjhze) je";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where jc_zcdd.clzt='99'";
			ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"' and jc_zcdd.jzsjs='"+getsjs+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				tde=rs1.getDouble("je");
			}
			rs1.close();
			ps1.close();

			xjtde+=tde;
			zjtde+=tde;

			//������
			double zjxze=0;
			ls_sql =" SELECT sum(zjxze) je";
			ls_sql+=" FROM jc_zczjx";
			ls_sql+=" where jc_zczjx.clzt not in('00')";
			ls_sql+=" and jc_zczjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zczjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zczjx.qddm='"+getdwbh+"' and jc_zczjx.jzsjs='"+getsjs+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zjxze=rs1.getDouble("je");
			}
			rs1.close();
			ps1.close();

			xjzjxze+=zjxze;
			zjzjxze+=zjxze;

			double xsje=qye+tde+zjxze;

			xjxsje+=xsje;
			zjxsje+=xsje;

			if (!sfzszg.equals("Y") && !sfzszg.equals("N"))
			{
				getsjs=getsjs+"<BR>��ְ:"+rzsj+"<BR>��ְ:"+lzrq;
			}

			//���������ݲ���ʾ
			if (   (cxbz.equals("N") && sfzszg.equals("Y")) || (cxbz.equals("N") && sfzszg.equals("N")) || (yjje!=0) || (ddsl!=0)  )
			{
				row++;

				%>
				<tr align="center"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					<td ><%=row%></td>
					<td ><%=dmmc%></td>
					<td ><%=getsjs%></td>

					<td><%=khsl%></td>
					<td><%=ddsl%></td>
					<td>
							<A HREF="ViewSjsYjMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank">
						<%=cf.formatDouble(yjje)%>
						</A>
						
					</td>
					<td><%=cf.formatDouble(pjde)%></td>
					<td>
							<A HREF="ViewSjsZcQdMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&sjs=<%=getsjs%>" target="_blank">
						<%=cf.formatDouble(qye)%>
						</A>
					</td>
					<td>
							<A HREF="ViewSjsZcTdMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&sjs=<%=getsjs%>" target="_blank">
						<%=cf.formatDouble(tde)%>
						</A>
					</td>
					<td>
							<A HREF="ViewSjsZcZjxMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&sjs=<%=getsjs%>" target="_blank">
						<%=cf.formatDouble(zjxze)%>
						</A>
					</td>
					<td><%=cf.formatDouble(xsje)%></td>

				</tr>
				<%	
			}

		}
		rs2.close();
		ps2.close();


		ls_sql =" SELECT distinct jc_zcdd.jzsjs";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where jc_zcdd.clzt>='09' and jc_zcdd.clzt!='98'";
		ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"'";
		if (!sqlsjs.equals(""))
		{
			ls_sql+=" and jc_zcdd.jzsjs not in("+sqlsjs.substring(1)+")";
		}
		ls_sql+=" order by jzsjs";
//		out.println(ls_sql);
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery();
		while (rs2.next())
		{
			getsjs=rs2.getString("jzsjs");

			//ʵ�տ�
			int khsl=0;
			int ddsl=0;
			double yjje=0;
			ls_sql =" SELECT count(distinct cw_khfkjl.khbh) khsl,count(cw_khfkjl.ddbh) ddsl,sum(cw_khfkjl.fkje) yjje";
			ls_sql+=" FROM cw_khfkjl";

			ls_sql+=" where cw_khfkjl.scbz='N' ";
			ls_sql+=" and cw_khfkjl.fklxbm in('23')";//23:����
			ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
			ls_sql+=" and cw_khfkjl.dwbh='"+getdwbh+"'";
			ls_sql+=" and cw_khfkjl.sjs='"+getsjs+"'";

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

			zjkhsl+=khsl;
			zjddsl+=ddsl;
			zjyjje+=yjje;


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
			ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"' and jc_zcdd.jzsjs='"+getsjs+"'";
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

			zjwdzgce+=wdzgce;
			zjqye+=qye;


			//�˵�
			double tde=0;
			ls_sql =" SELECT -1*sum(hkze+zjhze) je";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where jc_zcdd.clzt='99'";
			ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"' and jc_zcdd.jzsjs='"+getsjs+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				tde=rs1.getDouble("je");
			}
			rs1.close();
			ps1.close();

			xjtde+=tde;
			zjtde+=tde;

			//������
			double zjxze=0;
			ls_sql =" SELECT sum(zjxze) je";
			ls_sql+=" FROM jc_zczjx";
			ls_sql+=" where jc_zczjx.clzt not in('00')";
			ls_sql+=" and jc_zczjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zczjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zczjx.qddm='"+getdwbh+"' and jc_zczjx.jzsjs='"+getsjs+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zjxze=rs1.getDouble("je");
			}
			rs1.close();
			ps1.close();

			xjzjxze+=zjxze;
			zjzjxze+=zjxze;

			double xsje=qye+tde+zjxze;

			xjxsje+=xsje;
			zjxsje+=xsje;

			if (!sfzszg.equals("Y") && !sfzszg.equals("N"))
			{
				getsjs=getsjs+"<BR>��ְ:"+rzsj+"<BR>��ְ:"+lzrq;
			}

			//���������ݲ���ʾ
			if (   (cxbz.equals("N") && sfzszg.equals("Y")) || (cxbz.equals("N") && sfzszg.equals("N")) || (yjje!=0) || (ddsl!=0)  )
			{
				row++;

				%>
				<tr align="center"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					<td ><%=row%></td>
					<td ><%=dmmc%></td>
					<td ><%=getsjs%></td>

					<td><%=khsl%></td>
					<td><%=ddsl%></td>
					<td>
							<A HREF="ViewSjsYjMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank">
						<%=cf.formatDouble(yjje)%>
						</A>
						
					</td>
					<td><%=cf.formatDouble(pjde)%></td>
					<td>
							<A HREF="ViewSjsZcQdMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&sjs=<%=getsjs%>" target="_blank">
						<%=cf.formatDouble(qye)%>
						</A>
					</td>
					<td>
							<A HREF="ViewSjsZcTdMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&sjs=<%=getsjs%>" target="_blank">
						<%=cf.formatDouble(tde)%>
						</A>
					</td>
					<td>
							<A HREF="ViewSjsZcZjxMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&sjs=<%=getsjs%>" target="_blank">
						<%=cf.formatDouble(zjxze)%>
						</A>
					</td>
					<td><%=cf.formatDouble(xsje)%></td>

				</tr>
				<%	
			}

		}
		rs2.close();
		ps2.close();

		
		
		
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
			<td colspan="3"><strong><font color="#ff0000">[<%=dmmc%>]С��</strong></td>
			
			<td><%=cf.formatDouble(xjkhsl)%></td>
			<td><%=xjddsl%></td>
			<td><%=cf.formatDouble(xjyjje)%></td>
			<td><%=pjde%></td>
			<td><%=cf.formatDouble(xjqye)%></td>
			<td><%=cf.formatDouble(xjtde)%></td>
			<td><%=cf.formatDouble(xjzjxze)%></td>
			<td><%=cf.formatDouble(xjxsje)%></td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();
	

	int pjde=0;
	if (zjddsl!=0)
	{
		pjde=(int)zjyjje/zjddsl;
	}
	else{
		pjde=0;
	}
%>

<tr align="center"  bgcolor="#E8E8FF"  onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	<td colspan="3"><strong><font color="#ff0000">�ܼ�</strong></td>
	
	<td><%=cf.formatDouble(zjkhsl)%></td>
	<td><%=zjddsl%></td>
	<td><%=cf.formatDouble(zjyjje)%></td>
	<td><%=pjde%></td>
	<td><%=cf.formatDouble(zjqye)%></td>
	<td><%=cf.formatDouble(zjtde)%></td>
	<td><%=cf.formatDouble(zjzjxze)%></td>
	<td><%=cf.formatDouble(zjxsje)%></td>
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