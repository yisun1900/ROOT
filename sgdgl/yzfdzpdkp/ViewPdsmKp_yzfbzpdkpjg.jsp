<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�೤�ɵ�������¼�����򣺰೤��ֵ���ӳ���ֵ���೤�ͻ�����ȡ��ӳ��ͻ�����ȡ��೤���𡢶ӳ�����</font></B>
</CENTER>
<table border="1" width="220%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">����</td>
	<td  width="4%">����ʱ��</td>
	<td  width="4%">�����ֹ�˾</td>
	<td  width="3%">ʩ����</td>
	<td  width="2%">�ӳ�����</td>
	<td  width="2%">�ӳ��ܷ�</td>
	<td  width="2%">�ӳ������</td>
	<td  width="13%">�ɵ�˵��</td>
	<td  width="3%">�೤</td>
	<td  width="2%">�೤����</td>
	<td  width="2%">�೤�ܷ�</td>
	<td  width="2%">�೤�����</td>
	<td  width="2%">ͣ��</td>
	<td  width="2%">�ʱ�����</td>
	<td  width="2%">��������</td>
	<td  width="2%">���ù�������</td>
	<td  width="2%">���ù�������</td>

	<td  width="2%">�ɽӵ�����Сֵ</td>
	<td  width="2%">�ɽӵ������ֵ</td>
	<td  width="2%">��С��ʩ������</td>
	<td  width="2%">�����ʩ������</td>
	<td  width="2%">�೤��ʩ������</td>
	<td  width="2%"><strong><font color="#0000FF">����ʩ�������ӷ�</font></strong></td>

	<td  width="3%"><strong><font color="#0000FF">�೤����ӷ�</font></strong></td>
	<td  width="3%"><strong><font color="#0000FF">�೤�ɵ�����</font></strong></td>
	<td  width="3%"><strong><font color="#0000FF">�೤�깤�ӷ�</font></strong></td>

	<td  width="2%">Ѳ�칤��ƽ���۷�</td>
	<td  width="2%"><strong><font color="#0000FF">Ѳ�칤�ؼ���</font></strong></td>
	<td  width="2%">��������ƽ���۷�</td>
	<td  width="2%"><font color="#0000FF"><strong>�������ռ���</strong></font></td>
	<td  width="2%">Σ��Ͷ�ߴ���</td>
	<td  width="2%">����Ͷ�ߴ���</td>
	<td  width="2%">һ��Ͷ�ߴ���</td>
	<td  width="2%">��΢Ͷ�ߴ���</td>
	<td  width="2%"><strong><font color="#0000FF">Ͷ�߼���</font></strong></td>
	<td  width="2%">���ڹ�����</td>
	<td  width="2%"><strong><font color="#0000FF">���ڹ��ؼ���</font></strong></td>
	<td  width="2%">��ȫ�¹ʹ�������</td>
	<td  width="2%">��ȫ�¹ʹ�������</td>
	<td  width="2%"><strong><font color="#0000FF">��ȫ�¹ʼ���</font></strong></td>
</tr>
<%
String khbh=request.getParameter("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String ssfgs=null;
	double qye=0;
	double guanlif=0;
	double suijin=0;
	String cqbm=null;
	String xqbm=null;
	ls_sql="select fgsbh,qye,guanlif,suijin,cqbm,xqbm";
	ls_sql+=" from  crm_khxx ";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		qye=rs.getDouble("qye");
		guanlif=rs.getDouble("guanlif");
		suijin=rs.getDouble("suijin");
		cqbm=cf.fillNull(rs.getString("cqbm"));
		xqbm=cf.fillNull(rs.getString("xqbm"));
	}
	rs.close();
	ps.close();

	double qyeall=qye+guanlif+suijin;
	
	String kpsj=null;
	String dwmc=null;
	String sgd=null;
	String sgdmc=null;
	String dzjb=null;
	int dzzf=0;
	int dzkhmyd=0;
	String bzmc=null;
	String bzjb=null;
	int bzzf=0;
	int bzkhmyd=0;
	String bztdbz=null;

	String zbjsfdb=null;
	int grsl=0;
	int yygrsl=0;
	int kygrsl=0;
	int kjdzxz=0;
	int kjdzdz=0;
	int zxzsgds=0;
	int zdzsgds=0;
	int mqzsgds=0;

	int xzjf=0;//����ʩ�������ӷ�
	int bzjbjf=0;
	int bzpdjf=0;
	int bzwgjf=0;
	int xjgdpjkf=0;
	int xjgdjf=0;
	int gdyspjkf=0;
	int gdysjf=0;
	int wxtss=0;
	int yztss=0;
	int ybtss=0;
	int qwtss=0;
	int tsjf=0;
	int yqgds=0;
	int yqgdjf=0;
	int aqsggsrs=0;
	int aqsggwrs=0;
	int aqsgjf=0;

	String sgdtdbz=null;
	int sgdtdsj=0;

	int row=0;

	ls_sql="SELECT kpsj,dwmc,kp_yzfbzpdkpjg.sgd,sgdmc,a.sgdjbmc dzjb ";
	ls_sql+=" ,(NVL(-1*sq_sgd.sgdpdjf,0)+NVL(sq_sgd.sgdwgjf,0)+NVL(sq_sgd.pdkpf,0)+(NVL(sq_sgd.zdzsgds,0)-NVL(sq_sgd.mqzsgds,0))) dzzf ";
	ls_sql+=" ,sq_sgd.khmyd dzkhmyd,kp_yzfbzpdkpjg.bzmc,b.sgdjbmc bzjb ";
	ls_sql+=" ,(NVL(-1*sq_bzxx.bzpdjf,0)+NVL(sq_bzxx.bzwgjf,0)+NVL(sq_bzxx.pdkpf,0)+(NVL(sq_bzxx.zdzsgds,0)-NVL(sq_bzxx.mqzsgds,0))) bzzf ";
	ls_sql+=" ,sq_bzxx.khmyd bzkhmyd,DECODE(sq_bzxx.tdbz,'Y','ͣ��','N','����','K','����','L','��ְ') bztdbz ";

	ls_sql+=" ,DECODE(kp_yzfbzpdkpjg.zbjsfdb,'Y','���','N','��') zbjsfdb,sq_bzxx.grsl,sq_bzxx.yygrsl ";
	ls_sql+=" ,sq_bzxx.kygrsl,sq_bzxx.kjdzxz,sq_bzxx.kjdzdz,NVL(sq_bzxx.zxzsgds,0) zxzsgds,NVL(sq_bzxx.zdzsgds,0) zdzsgds,NVL(sq_bzxx.mqzsgds,0) mqzsgds";
	
	ls_sql+=" ,(NVL(sq_bzxx.zdzsgds,0)-NVL(sq_bzxx.mqzsgds,0)) xzjf,bzjbjf,NVL(-1*sq_bzxx.bzpdjf,0) bzpdjf,NVL(sq_bzxx.bzwgjf,0) bzwgjf";
	ls_sql+=" ,xjgdpjkf,-1*xjgdjf xjgdjf,gdyspjkf,-1*gdysjf gdysjf,wxtss,yztss,ybtss,qwtss,-1*tsjf tsjf,yqgds,-1*yqgdjf yqgdjf,aqsggsrs,aqsggwrs,-1*aqsgjf aqsgjf";
	
	ls_sql+=" ,sq_sgd.tdbz sgdtdbz,SYSDATE-sq_sgd.tdzzsj sgdtdsj";
	
	ls_sql+=" FROM kp_yzfbzpdkpjg,sq_sgd,sq_bzxx,sq_sgdjbbm a,sq_sgdjbbm b,sq_dwxx  ";
    ls_sql+=" where kp_yzfbzpdkpjg.sgd=sq_sgd.sgd and sq_sgd.sgdjbbm=a.sgdjbbm and kp_yzfbzpdkpjg.bzjbbm=b.sgdjbbm";
    ls_sql+=" and kp_yzfbzpdkpjg.ssfgs=sq_dwxx.dwbh";
    ls_sql+=" and kp_yzfbzpdkpjg.sgd=sq_bzxx.sgd and kp_yzfbzpdkpjg.bzmc =sq_bzxx.bzmc ";
    ls_sql+=" and  kp_yzfbzpdkpjg.ssfgs='"+ssfgs+"'";
    ls_sql+=" order by kp_yzfbzpdkpjg.ssfgs,sq_bzxx.tdbz,kp_yzfbzpdkpjg.zbjsfdb desc,bzzf desc,dzzf desc,sq_bzxx.khmyd desc,sq_sgd.khmyd desc,sq_bzxx.sgdjbbm,sq_sgd.sgdjbbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		kpsj=cf.fillNull(rs.getDate("kpsj"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		dzjb=cf.fillNull(rs.getString("dzjb"));
		dzzf=rs.getInt("dzzf");
		dzkhmyd=rs.getInt("dzkhmyd");
		bzmc=cf.fillNull(rs.getString("bzmc"));
		bzjb=cf.fillNull(rs.getString("bzjb"));
		bzzf=rs.getInt("bzzf");
		bzkhmyd=rs.getInt("bzkhmyd");
		bztdbz=cf.fillNull(rs.getString("bztdbz"));

		zbjsfdb=cf.fillNull(rs.getString("zbjsfdb"));
		grsl=rs.getInt("grsl");
		yygrsl=rs.getInt("yygrsl");
		kygrsl=rs.getInt("kygrsl");
		kjdzxz=rs.getInt("kjdzxz");
		kjdzdz=rs.getInt("kjdzdz");
		zxzsgds=rs.getInt("zxzsgds");
		zdzsgds=rs.getInt("zdzsgds");
		mqzsgds=rs.getInt("mqzsgds");

		xzjf=rs.getInt("xzjf");
		bzjbjf=rs.getInt("bzjbjf");
		bzpdjf=rs.getInt("bzpdjf");
		bzwgjf=rs.getInt("bzwgjf");
		xjgdpjkf=rs.getInt("xjgdpjkf");
		xjgdjf=rs.getInt("xjgdjf");
		gdyspjkf=rs.getInt("gdyspjkf");
		gdysjf=rs.getInt("gdysjf");
		wxtss=rs.getInt("wxtss");
		yztss=rs.getInt("yztss");
		ybtss=rs.getInt("ybtss");
		qwtss=rs.getInt("qwtss");
		tsjf=rs.getInt("tsjf");
		yqgds=rs.getInt("yqgds");
		yqgdjf=rs.getInt("yqgdjf");
		aqsggsrs=rs.getInt("aqsggsrs");
		aqsggwrs=rs.getInt("aqsggwrs");
		aqsgjf=rs.getInt("aqsgjf");

		sgdtdbz=cf.fillNull(rs.getString("sgdtdbz"));
		sgdtdsj=rs.getInt("sgdtdsj");

		String pdsm="";

		if (zbjsfdb.equals("��"))
		{
			pdsm+="<font color=\"#0000FF\">�ʱ��𲻴�ꣻ</font>";
		}
		if (!bztdbz.equals("����"))//״̬, Y��ͣ����N��������K��������L����ְ
		{
			pdsm+="<font color=\"#FF00FF\">�೤"+bztdbz+"��</font>";
		}
		if (sgdtdbz.equals("Y") && sgdtdsj>0)
		{
			pdsm+="<font color=\"#FF00FF\">ʩ����ͣ����</font>";
		}

	
		
		if (dzkhmyd<80)//�ͻ�����ȵ���80%����Ŀ�������ɵ�
		{
			pdsm+="<font color=\"#FF0000\">ʩ���ӿͻ�����ȵ���80%��</font>";
		}
		if (bzkhmyd<80)//�ͻ�����ȵ���80%�İ೤�����ɵ�
		{
			pdsm+="<font color=\"#FF0000\">�೤�ͻ�����ȵ���80%��</font>";
		}
		if (kygrsl<2)//���ù�������
		{
			pdsm+="<font color=\"#990066\">���ù�������С��2��</font>";
		}
		if (mqzsgds>=zdzsgds)//Ŀǰ��ʩ������ < ���������ʩ������ 
		{
			pdsm+="<font color=\"#990066\">����Ŀǰ��ʩ������>=�����ʩ��������</font>";
		}
		if (kjdzdz<qyeall)//���� <= �ɽӵ������ֵ
		{
			pdsm+="<font color=\"#000099\">�ɽӵ������ֵ�����㣻</font>";
		}

		if (mqzsgds>=zxzsgds && kjdzxz > qyeall)
		{
			pdsm+="<font color=\"#000099\">�ɽӵ�����Сֵ�����㣻</font>";
		}

		ls_sql+=" and ( OR (sq_bzxx.mqzsgds<sq_bzxx.zxzsgds))";//���� < �ɽӵ���Сֵ

		String xsbzmc=bzmc;
		if (pdsm.equals(""))
		{
			pdsm="���ɵ�";

			int count=0;
			ls_sql="select count(*)";
			ls_sql+=" from  crm_khxx ";
			ls_sql+=" where gcjdbm not in('4','5') and crm_khxx.zt='2' and fgsbh='"+ssfgs+"'";
			ls_sql+=" and crm_khxx.sgd='"+sgd+"'";
			ls_sql+=" and crm_khxx.sgbz='"+bzmc+"'";
			ls_sql+=" and crm_khxx.xqbm='"+xqbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				count=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			if (count>0)
			{
				pdsm="���ɵ�(<font color=\"#FF0000\">С�����й���</font>)";
			}
			else{
				ls_sql="select count(*)";
				ls_sql+=" from  crm_khxx ";
				ls_sql+=" where gcjdbm not in('4','5') and crm_khxx.zt='2' and fgsbh='"+ssfgs+"'";
				ls_sql+=" and crm_khxx.sgd='"+sgd+"'";
				ls_sql+=" and crm_khxx.sgbz='"+bzmc+"'";
				ls_sql+=" and crm_khxx.cqbm='"+cqbm+"'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					count=rs1.getInt(1);
				}
				rs1.close();
				ps1.close();


				if (count>0)
				{
					pdsm="���ɵ�(ͬ�����й���)";
				}
			}

			xsbzmc="<font color=\"#FF0000\">"+bzmc+"</font>";
		
		}

			
			row++;

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td><%=row%></td>
			<td><%=kpsj%></td>
			<td><%=dwmc%></td>
			<td><%=sgdmc%></td>
			<td><%=dzjb%></td>
			<td><A HREF="ViewDzzf.jsp?sgd=<%=sgd%>" target="_blank"><%=dzzf%></A></td>
			<td><%=dzkhmyd%>%</td>
			<td align="left"><%=pdsm%></font></td>
			<td><%=xsbzmc%></td>
			<td><%=bzjb%></td>
			<td><A HREF="ViewBzzf.jsp?sgd=<%=sgd%>&bzmc=<%=bzmc%>" target="_blank"><%=bzzf%></A></td>
			<td><%=bzkhmyd%>%</td>
			<td><%=bztdbz%></td>

			<td><%=zbjsfdb%></td>
			<td><%=grsl%></td>
			<td><%=yygrsl%></td>
			<td><%=kygrsl%></td>
			<td><%=kjdzxz%></td>
			<td><%=kjdzdz%></td>
			<td><%=zxzsgds%></td>
			<td><%=zdzsgds%></td>
			<td><%=mqzsgds%></td>

			<td><%=xzjf%></td>
			<td><%=bzjbjf%></td>
			<td><%=bzpdjf%></td>
			<td><%=bzwgjf%></td>
			<td><%=xjgdpjkf%></td>
			<td><%=xjgdjf%></td>
			<td><%=gdyspjkf%></td>
			<td><%=gdysjf%></td>
			<td><%=wxtss%></td>
			<td><%=yztss%></td>
			<td><%=ybtss%></td>
			<td><%=qwtss%></td>
			<td><%=tsjf%></td>
			<td><%=yqgds%></td>
			<td><%=yqgdjf%></td>
			<td><%=aqsggsrs%></td>
			<td><%=aqsggwrs%></td>
			<td><%=aqsgjf%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
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