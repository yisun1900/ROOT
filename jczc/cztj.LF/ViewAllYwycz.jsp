<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String[] ywy=request.getParameterValues("ywy");
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");
	String lrjzbz=request.getParameter("jzbz");

	String wheresql="";

	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	if (!lrjzbz.equals("0"))
	{
		wheresql+=" and  crm_khxx.jzbz='"+lrjzbz+"'";
	}


%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ҵ��Աǩ����ϸ
  <BR>(ǩԼʱ�䣺<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="360%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="2%">ҵ��Ա</td>
	<td  width="2%">���ʦ</td>
	<td  width="3%">��ͬ��</td>
	<td  width="3%">����</td>
	<td  width="6%">���ݵ�ַ</td>
	<td  width="2%">��װ��־</td>
	<td  width="4%">��˾�����</td>
	<td  width="3%">С�������</td>
	<td  width="3%">չ������</td>
	<td  width="3%">����ԭ����</td>
	<td  width="2%">�ۿ���</td>
	<td  width="3%">����ǩԼ��</td>
	<td  width="2%">˰��</td>
	<td  width="3%">˰��</td>
	<td  width="3%">��Ŀ�����</td>
	<td  width="3%">���۶�</td>
	<td  width="3%">������</td>
	<td  width="3%">�������ܶ� </td>
	<td  width="3%">��Ʒ�</td>
	<td  width="3%">ʵ�տ�</td>
	<td  width="3%">ҵ��Աҵ��</td>
	<td  width="2%">�Ƿ����г���ȯ</td>
	<td  width="3%">�г���ȯ�ܽ��</td>
	<td  width="3%">��˾�е��г���ȯ��</td>
	<td  width="2%">�Ƿ���֤</td>
	<td  width="3%">��֤�г�</td>
	<td  width="3%">ǩԼ����</td>
	<td  width="4%">¼��ʱ��</td>
	<td  width="2%">ǩԼ����</td>
	<td  width="2%">����¼��</td>
	<td  width="2%">ʩ����</td>
	<td  width="2%">�ʼ�Ա</td>
</tr>
<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;


String lsywy=null;
String lsdwbh=null;

String getywy=null;
String hth=null;
String khxm=null;
String sjs=null;
String fwdz=null;
String sgdmc=null;
String zjxm=null;
String jzbz=null;
String fgsbh=null;
String cxhdmc=null;
String cxhdbmxq=null;
String cxhdbmzh=null;

double wdzgce=0;
double zkl=0;
double qye=0;
double suijinbfb=0;
double suijin=0;
double guanlif=0;
double zjxje=0;
double sjf=0;
double sfke=0;
double ze=0;

String sffj=null;
double fjje=0;
double gsfje=0;
String sfyrz=null;
String rzsc=null;
String qydm=null;
String lrsj=null;
String qyrq=null;
String dylr=null;

double ywyqye=0;



double allwdzgce=0;
double allqye=0;
double allsuijin=0;
double allguanlif=0;
double allzjxje=0;
double allsjf=0;
double allsfke=0;
double allfjje=0;
double allgsfje=0;
double allywyqye=0;


try {
	conn=cf.getConnection();
	
	int row=0;
	for (int i=0;i<ywy.length ;i++ )
	{
		double xjwdzgce=0;
		double xjqye=0;
		double xjsuijin=0;
		double xjguanlif=0;
		double xjzjxje=0;
		double xjsjf=0;
		double xjsfke=0;
		double xjfjje=0;
		double xjgsfje=0;
		double xjywyqye=0;
		double xjywytcyj=0;

		ywy[i]=cf.GB2Uni(ywy[i]);
		int pos=ywy[i].indexOf("+");
		lsywy=ywy[i].substring(0,pos);
		lsdwbh=ywy[i].substring(pos+1);

		ls_sql="SELECT fgsbh,cxhdbm,cxhdbmxq,cxhdbmzh,ywy,sjs,hth,khxm,fwdz,sgdmc,zjxm,DECODE(crm_khxx.jzbz,'1','��װ','2','��װ') jzbz";
		ls_sql+=" ,wdzgce,zkl,qye,suijinbfb,suijin,guanlif,qye+suijin+guanlif,zjxje,NVL(zjxje,0)+qye,sjf,sfke";
		ls_sql+=" ,DECODE(crm_khxx.sffj,'Y','����','N','��') sffj,crm_khxx.fjje,crm_khxx.gsfje";
		ls_sql+=" ,DECODE(crm_khxx.sfyrz,'Y','��֤','N','��') sfyrz,b.dwmc rzsc,a.dwmc qydm,lrsj";
		ls_sql+=" ,qyrq,DECODE(TO_CHAR(lrsj,'MM')-TO_CHAR(qyrq,'MM'),0,'��','<font color=\"#FF0000\">����</font>') dylr";
		ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b,sq_sgd";
		ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.rzsc=b.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
		ls_sql+=" and crm_khxx.ywy='"+lsywy+"' and crm_khxx.fgsbh='"+lsdwbh+"'";
		ls_sql+=" and crm_khxx.zt in('2','5')";
		ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;
		ls_sql+=" order by qyrq";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			fgsbh=cf.fillNull(rs.getString("fgsbh"));
			cxhdmc=cf.fillNull(rs.getString("cxhdbm"));
			cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
			cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
			getywy=cf.fillHtml(rs.getString("ywy"));
			sjs=cf.fillHtml(rs.getString("sjs"));
			hth=cf.fillHtml(rs.getString("hth"));
			khxm=cf.fillHtml(rs.getString("khxm"));
			fwdz=cf.fillHtml(rs.getString("fwdz"));
			sgdmc=cf.fillHtml(rs.getString("sgdmc"));
			zjxm=cf.fillHtml(rs.getString("zjxm"));
			jzbz=cf.fillHtml(rs.getString("jzbz"));


			wdzgce=rs.getDouble("wdzgce");
			zkl=rs.getDouble("zkl");
			qye=rs.getDouble("qye");
			suijinbfb=rs.getDouble("suijinbfb");
			suijin=rs.getDouble("suijin");
			guanlif=rs.getDouble("guanlif");
			zjxje=rs.getDouble("zjxje");
			sjf=rs.getDouble("sjf");
			sfke=rs.getDouble("sfke");

			sffj=cf.fillHtml(rs.getString("sffj"));
			fjje=rs.getDouble("fjje");
			gsfje=rs.getDouble("gsfje");
			sfyrz=cf.fillHtml(rs.getString("sfyrz"));
			rzsc=cf.fillHtml(rs.getString("rzsc"));
			qydm=cf.fillHtml(rs.getString("qydm"));
			lrsj=cf.fillHtml(rs.getString("lrsj"));
			qyrq=cf.fillHtml(rs.getDate("qyrq"));
			dylr=cf.fillHtml(rs.getString("dylr"));


			ze=wdzgce;
			
			
			row++;

			String hdlx1="";
			double yjxs11=10;
			if (!cxhdmc.equals(""))
			{
				ls_sql=" select hdlx";
				ls_sql+=" from jc_cxhd";
				ls_sql+=" where fgsbh='"+fgsbh+"' and cxhdmc='"+cxhdmc+"'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					hdlx1=rs1.getString("hdlx");
				}
				else{
					out.println("�����Ҳ����������"+cxhdmc);
					return;
				}
				rs1.close();
				ps1.close();

				ls_sql=" select yjxs";
				ls_sql+=" from jc_cxhdyjxs";
				ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='06'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					yjxs11=rs1.getDouble("yjxs");
				}
				else{
					out.println("�����Ҳ����������"+cxhdmc);
					return;
				}
				rs1.close();
				ps1.close();

			}

			String hdlx2="";
			double yjxs21=10;
			if (!cxhdbmxq.equals(""))
			{
				ls_sql=" select hdlx";
				ls_sql+=" from jc_cxhd";
				ls_sql+=" where fgsbh='"+fgsbh+"' and cxhdmc='"+cxhdbmxq+"'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					hdlx2=rs1.getString("hdlx");
				}
				else{
					out.println("�����Ҳ����������"+cxhdbmxq);
					return;
				}
				rs1.close();
				ps1.close();

				ls_sql=" select yjxs";
				ls_sql+=" from jc_cxhdyjxs";
				ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='06'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					yjxs21=rs1.getDouble("yjxs");
				}
				else{
					out.println("�����Ҳ����������"+cxhdbmxq);
					return;
				}
				rs1.close();
				ps1.close();
			}

			String hdlx3="";
			double yjxs31=10;
			if (!cxhdbmzh.equals(""))
			{
				ls_sql=" select hdlx";
				ls_sql+=" from jc_cxhd";
				ls_sql+=" where fgsbh='"+fgsbh+"' and cxhdmc='"+cxhdbmzh+"'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					hdlx3=rs1.getString("hdlx");
				}
				else{
					out.println("�����Ҳ����������"+cxhdbmzh);
					return;
				}
				rs1.close();
				ps1.close();

				ls_sql=" select yjxs";
				ls_sql+=" from jc_cxhdyjxs";
				ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='06'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					yjxs31=rs1.getDouble("yjxs");
				}
				else{
					out.println("�����Ҳ����������"+cxhdbmzh);
					return;
				}
				rs1.close();
				ps1.close();
			}

			if ( (cxhdmc!=null && !hdlx1.equals("1")) || cxhdbmxq!=null || cxhdbmzh!=null )
			{
				ywyqye=ze-ze*(10-yjxs11)/10-ze*(10-yjxs21)/10-ze*(10-yjxs31)/10;
			}
			else{
				ywyqye=qye-gsfje;
			}


			ywyqye=cf.round(ywyqye,2);

			xjwdzgce+=wdzgce;
			xjqye+=qye;
			xjsuijin+=suijin;
			xjguanlif+=guanlif;
			xjzjxje+=zjxje;
			xjsjf+=sjf;
			xjsfke+=sfke;
			xjfjje+=fjje;
			xjgsfje+=gsfje;
			xjywyqye+=ywyqye;

			
			allwdzgce+=wdzgce;
			allqye+=qye;
			allsuijin+=suijin;
			allguanlif+=guanlif;
			allzjxje+=zjxje;
			allsjf+=sjf;
			allsfke+=sfke;
			allfjje+=fjje;
			allgsfje+=gsfje;
			allywyqye+=ywyqye;

			if (cxhdmc.equals(""))
			{
				cxhdmc="&nbsp;";
			}
			if (cxhdbmxq.equals(""))
			{
				cxhdbmxq="&nbsp;";
			}
			if (cxhdbmzh.equals(""))
			{
				cxhdbmzh="&nbsp;";
			}

			%>
			<tr bgcolor="#FFFFFF"  align="center">
				<td><%=row%></td>
				<td><%=getywy%></td>
				<td><%=sjs%></td>
				<td><%=hth%></td>
				<td><%=khxm%></td>
				<td><%=fwdz%></td>
				<td><%=jzbz%></td>
				<td><%=cxhdmc%></td>
				<td><%=cxhdbmxq%></td>
				<td><%=cxhdbmzh%></td>

				<td><%=wdzgce%></td>
				<td><%=zkl%></td>
				<td><%=qye%></td>
				<td><%=suijinbfb%></td>
				<td><%=suijin%></td>
				<td><%=guanlif%></td>
				<td><%=cf.formatDouble(qye+suijin+guanlif)%></td>

				<td><%=zjxje%></td>
				<td><%=cf.formatDouble(zjxje+qye)%></td>
				<td><%=sjf%></td>
				<td><%=sfke%></td>

				<td><%=ywyqye%></td>

				<td><%=sffj%></td>
				<td><%=fjje%></td>
				<td><%=gsfje%></td>

				<td><%=sfyrz%></td>
				<td><%=rzsc%></td>
				<td><%=qydm%></td>
				<td><%=lrsj%></td>
				<td><%=qyrq%></td>
				<td><%=dylr%></td>
				<td><%=sgdmc%></td>
				<td><%=zjxm%></td>
			</tr>
			<%
		
		
		
		}
		rs.close();
		ps.close();

		if (xjwdzgce==0)
		{
			zkl=0;
		}
		else{
			zkl=cf.round(xjqye*10/xjwdzgce,1);
		}

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td colspan="2">[<%=lsywy%>]С ��</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>

			<td><%=cf.formatDouble(xjwdzgce)%></td>
			<td><%=zkl%></td>
			<td><%=cf.formatDouble(xjqye)%></td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(xjsuijin)%></td>
			<td><%=cf.formatDouble(xjguanlif)%></td>
			<td><%=cf.formatDouble(xjqye+xjsuijin+xjguanlif)%></td>

			<td><%=cf.formatDouble(xjzjxje)%></td>
			<td><%=cf.formatDouble(xjzjxje+xjqye)%></td>
			<td><%=cf.formatDouble(xjsjf)%></td>
			<td><%=cf.formatDouble(xjsfke)%></td>

			<td><%=cf.formatDouble(xjywyqye)%></td>

			<td>&nbsp;</td>
			<td><%=cf.formatDouble(xjfjje)%></td>
			<td><%=cf.formatDouble(xjgsfje)%></td>

			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<%
	}

	if (allwdzgce==0)
	{
		zkl=0;
	}
	else{
		zkl=cf.round(allqye*10/allwdzgce,1);
	}



%>
<tr bgcolor="#FFFFFF"  align="center">
	<td colspan="2">�� ��</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>

	<td><%=cf.formatDouble(allwdzgce)%></td>
	<td><%=zkl%></td>
	<td><%=cf.formatDouble(allqye)%></td>
	<td>&nbsp;</td>
	<td><%=cf.formatDouble(allsuijin)%></td>
	<td><%=cf.formatDouble(allguanlif)%></td>
	<td><%=cf.formatDouble(allqye+allsuijin+allguanlif)%></td>

	<td><%=cf.formatDouble(allzjxje)%></td>
	<td><%=cf.formatDouble(allzjxje+allqye)%></td>
	<td><%=cf.formatDouble(allsjf)%></td>
	<td><%=cf.formatDouble(allsfke)%></td>

	<td><%=cf.formatDouble(allywyqye)%></td>

	<td>&nbsp;</td>
	<td><%=cf.formatDouble(allfjje)%></td>
	<td><%=cf.formatDouble(allgsfje)%></td>

	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
</tr>

</table>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
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



