<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String[] sjs=request.getParameterValues("sjs");
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
  <B><font size="3">���ʦǩ����ϸ
  <BR>(ǩԼʱ�䣺<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="360%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="2%">���ʦ</td>
	<td  width="3%">��ͬ��</td>
	<td  width="3%">����</td>
	<td  width="6%">���ݵ�ַ</td>
	<td  width="2%">��װ��־</td>
	<td  width="4%">��˾�����</td>
	<td  width="4%">С�������</td>
	<td  width="4%">չ������</td>
	<td  width="3%">����ԭ����</td>
	<td  width="2%">�ۿ���</td>
	<td  width="3%">����ǩԼ��</td>
	<td  width="2%">˰��</td>
	<td  width="3%">˰��</td>
	<td  width="3%">��Ŀ�����</td>
	<td  width="3%">������</td>
	<td  width="3%">�������ܶ� </td>
	<td  width="3%">��Ʒ�</td>
	<td  width="3%">ʵ�տ�</td>
	<td  width="3%">���ʦҵ��</td>
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


String lssjs=null;
String lsdwbh=null;

String getsjs=null;
String hth=null;
String khxm=null;
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

double sjskhyj=0;



double allwdzgce=0;
double allqye=0;
double allsuijin=0;
double allguanlif=0;
double allzjxje=0;
double allsjf=0;
double allsfke=0;
double allfjje=0;
double allgsfje=0;
double allsjskhyj=0;


try {
	conn=cf.getConnection();
	
	int row=0;
	for (int i=0;i<sjs.length ;i++ )
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
		double xjsjskhyj=0;
		double xjsjstcyj=0;

		sjs[i]=cf.GB2Uni(sjs[i]);
		int pos=sjs[i].indexOf("+");
		lssjs=sjs[i].substring(0,pos);
		lsdwbh=sjs[i].substring(pos+1);

		ls_sql="SELECT crm_khxx.fgsbh,crm_khxx.cxhdbm,crm_khxx.cxhdbmxq,crm_khxx.cxhdbmzh,crm_khxx.sjs,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,sgdmc,zjxm,DECODE(crm_khxx.jzbz,'1','��װ','2','��װ') jzbz";
		ls_sql+=" ,wdzgce,zkl,qye,suijinbfb,suijin,guanlif,zjxje,NVL(zjxje,0)+qye,crm_khxx.sjf,sfke";
		ls_sql+=" ,DECODE(crm_khxx.sffj,'Y','����','N','��') sffj,crm_khxx.fjje,crm_khxx.gsfje";
		ls_sql+=" ,DECODE(crm_khxx.sfyrz,'Y','��֤','N','��') sfyrz,b.dwmc rzsc,a.dwmc qydm,crm_khxx.lrsj";
		ls_sql+=" ,crm_khxx.qyrq,DECODE(TO_CHAR(crm_khxx.lrsj,'MM')-TO_CHAR(crm_khxx.qyrq,'MM'),0,'��','<font color=\"#FF0000\">����</font>') dylr";
		ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b,sq_sgd";
		ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.rzsc=b.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
		ls_sql+=" and crm_khxx.sjs='"+lssjs+"' and crm_khxx.dwbh='"+lsdwbh+"'";
		ls_sql+=" and crm_khxx.zt in('2','5')";
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
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
			getsjs=cf.fillHtml(rs.getString("sjs"));
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

			double yjxs12=10;//04����װ���ʦҵ��ϵ��

			if (!cxhdmc.equals(""))//��˾�
			{
				ls_sql=" select yjxs";
				ls_sql+=" from jc_cxhdyjxs";
				ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='04'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					yjxs12=rs1.getDouble("yjxs");
				}
				else{
					out.println("�����Ҳ����������"+ls_sql);
					return;
				}
				rs1.close();
				ps1.close();
			}

			double yjxs22=10;
			if (!cxhdbmxq.equals(""))
			{
				ls_sql=" select yjxs";
				ls_sql+=" from jc_cxhdyjxs";
				ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='04'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					yjxs22=rs1.getDouble("yjxs");
				}
				else{
					out.println("�����Ҳ����������"+ls_sql);
					return;
				}
				rs1.close();
				ps1.close();
			}

			double yjxs32=10;
			if (!cxhdbmzh.equals(""))
			{
				ls_sql=" select yjxs";
				ls_sql+=" from jc_cxhdyjxs";
				ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='04'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					yjxs32=rs1.getDouble("yjxs");
				}
				else{
					out.println("�����Ҳ����������"+ls_sql);
					return;
				}
				rs1.close();
				ps1.close();
			}

			double yjxs2=10;//04����װ���ʦҵ��ϵ��

			yjxs2=10-(10-yjxs12)-(10-yjxs22)-(10-yjxs32);

			if ( cxhdmc!=null || cxhdbmxq!=null || cxhdbmzh!=null )
			{
				sjskhyj=qye*yjxs2/10+guanlif;
			}
			else{
				sjskhyj=qye+guanlif;
			}


			sjskhyj=cf.round(sjskhyj,2);

			xjwdzgce+=wdzgce;
			xjqye+=qye;
			xjsuijin+=suijin;
			xjguanlif+=guanlif;
			xjzjxje+=zjxje;
			xjsjf+=sjf;
			xjsfke+=sfke;
			xjfjje+=fjje;
			xjgsfje+=gsfje;
			xjsjskhyj+=sjskhyj;

			
			allwdzgce+=wdzgce;
			allqye+=qye;
			allsuijin+=suijin;
			allguanlif+=guanlif;
			allzjxje+=zjxje;
			allsjf+=sjf;
			allsfke+=sfke;
			allfjje+=fjje;
			allgsfje+=gsfje;
			allsjskhyj+=sjskhyj;

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
				<td><%=getsjs%></td>
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

				<td><%=zjxje%></td>
				<td><%=cf.formatDouble(zjxje+qye)%></td>
				<td><%=sjf%></td>
				<td><%=sfke%></td>

				<td><%=sjskhyj%></td>

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
			<td colspan="2">[<%=lssjs%>]С ��</td>
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

			<td><%=cf.formatDouble(xjzjxje)%></td>
			<td><%=cf.formatDouble(xjzjxje+xjqye)%></td>
			<td><%=cf.formatDouble(xjsjf)%></td>
			<td><%=cf.formatDouble(xjsfke)%></td>

			<td><%=cf.formatDouble(xjsjskhyj)%></td>

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

	<td><%=cf.formatDouble(allwdzgce)%></td>
	<td><%=zkl%></td>
	<td><%=cf.formatDouble(allqye)%></td>
	<td>&nbsp;</td>
	<td><%=cf.formatDouble(allsuijin)%></td>
	<td><%=cf.formatDouble(allguanlif)%></td>

	<td><%=cf.formatDouble(allzjxje)%></td>
	<td><%=cf.formatDouble(allzjxje+allqye)%></td>
	<td><%=cf.formatDouble(allsjf)%></td>
	<td><%=cf.formatDouble(allsfke)%></td>

	<td><%=cf.formatDouble(allsjskhyj)%></td>

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



