<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String fgsbh=null;
String khxm=null;
String lxfs=null;
String fwdz=null;
String hth=null;
String sjs=null;
String zjxm=null;
String qyrq=null;
String kgrq=null;
String jyjdrq=null;
String jgrq=null;
String czmc=null;
String ysmc=null;
String bjjb=null;
String dwbh=null;
String dwmc=null;
String sgd=null;
String sgdmc=null;
String sgbz=null;
String cxhdbm=null;
String cxhdbmxq=null;
String cxhdbmzh=null;
String xxshyj=null;
double wdzgce=0;
double qye=0;
double suijin=0;
double zkl=0;
double zhzjxje=0;
double zhwgzj=0;
double glf=0;
double glftd=0;
double guanlif=0;


double hddj=0;
double lfdj=0;
double sqk=0;
double zqk=0;
double wqk=0;
double gcjkhj=0;
double fk=0;
double sjf=0;
double gcycf=0;
double jxglf=0;
double gcddf=0;
double hjjk=0;


try {
	conn=cf.getConnection();

	ls_sql="SELECT xxshyj,guanlif,fgsbh,glftd,zhzjxje,zkl,cxhdbm,cxhdbmxq,cxhdbmzh,crm_khxx.sgd,sgdmc,sgbz,crm_khxx.dwbh,dwmc,khxm,lxfs,fwdz,hth,sjs,zjxm,qyrq,kgrq,jyjdrq,jgrq,wdzgce,qye,suijin,DECODE(bjjb,'A','��ͨ','B','��Ʒ','C','�ֻ�÷��') bjjb";
	ls_sql+=" FROM crm_khxx,sq_dwxx,sq_sgd";
    ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xxshyj=cf.fillHtml(rs.getString("xxshyj"));
		guanlif=rs.getDouble("guanlif");
		glftd=rs.getDouble("glftd");
		zhzjxje=rs.getDouble("zhzjxje");
		zkl=rs.getDouble("zkl");
		cxhdbm=cf.fillHtml(rs.getString("cxhdbm"));
		cxhdbmxq=cf.fillHtml(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillHtml(rs.getString("cxhdbmzh"));
		sgd=cf.fillHtml(rs.getString("sgd"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		sgbz=cf.fillHtml(rs.getString("sgbz"));
		dwbh=cf.fillHtml(rs.getString("dwbh"));
		dwmc=cf.fillHtml(rs.getString("dwmc"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		hth=cf.fillHtml(rs.getString("hth"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		qyrq=cf.fillHtml(rs.getDate("qyrq"));
		kgrq=cf.fillHtml(rs.getDate("kgrq"));
		jyjdrq=cf.fillHtml(rs.getDate("jyjdrq"));
		jgrq=cf.fillHtml(rs.getDate("jgrq"));
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		suijin=rs.getDouble("suijin");
		bjjb=cf.fillHtml(rs.getString("bjjb"));
		fgsbh=cf.fillHtml(rs.getString("fgsbh"));
	}
	rs.close();
	ps.close();

	double yjxs1=10;
	if (!cxhdbm.equals("&nbsp;") && !cxhdbm.equals("�޻"))
	{
		ls_sql="select yjxs";
		ls_sql+=" from  jc_cxhdyjxs";
		ls_sql+=" where cxhdmc='"+cxhdbm+"' and fgsbh='"+fgsbh+"' and yjxsbm='11'";//11��ʩ���ӻ�ۿ�
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			yjxs1=rs.getDouble("yjxs");
		}
		else{
			rs.close();
			ps.close();
			out.println("���󣡲μӴ���������ڣ�"+cxhdbm);
			return;
		}
		rs.close();
		ps.close();
	}

	if (yjxs1<=0 || yjxs1>10)
	{
		out.println("���󣡴�����ɱ���������ȷ��"+yjxs1);
		return;
	}

	double yjxs2=10;
	if (!cxhdbmxq.equals("&nbsp;"))
	{
		ls_sql="select yjxs";
		ls_sql+=" from  jc_cxhdyjxs";
		ls_sql+=" where cxhdmc='"+cxhdbmxq+"' and fgsbh='"+fgsbh+"' and yjxsbm='11'";//11��ʩ���ӻ�ۿ�
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			yjxs2=rs.getDouble("yjxs");
		}
		else{
			rs.close();
			ps.close();
			out.println("���󣡲μ�С������������ڣ�"+cxhdbmxq);
			return;
		}
		rs.close();
		ps.close();
	}

	if (yjxs2<=0 || yjxs2>10)
	{
		out.println("���󣡴�����ɱ���������ȷ��"+yjxs2);
		return;
	}

	double yjxs3=10;
	if (!cxhdbmzh.equals("&nbsp;"))
	{
		ls_sql="select yjxs";
		ls_sql+=" from  jc_cxhdyjxs";
		ls_sql+=" where cxhdmc='"+cxhdbmzh+"' and fgsbh='"+fgsbh+"' and yjxsbm='11'";//11��ʩ���ӻ�ۿ�
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			yjxs3=rs.getDouble("yjxs");
		}
		else{
			rs.close();
			ps.close();
			out.println("���󣡲μ�չ�����������ڣ�"+cxhdbmzh);
			return;
		}
		rs.close();
		ps.close();
	}

	if (yjxs3<=0 || yjxs3>10)
	{
		out.println("���󣡴�����ɱ���������ȷ��"+yjxs3);
		return;
	}

	zkl=10-(10-yjxs1)-(10-yjxs2)-(10-yjxs3);

	if (zkl<=0 || zkl>10)
	{
		out.println("�����ۿ���Ӧ��0��10֮��");
		return;
	}

	zhwgzj=cf.doubleTrim(qye+zhzjxje);
	glf=cf.doubleTrim(zhwgzj*glftd/100);

	ls_sql="update crm_khxx set dybz='Y',dysj=SYSDATE ";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();



	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='51' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hddj=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='52' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lfdj=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and fkcs=1 and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sqk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and fkcs=2 and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zqk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and fkcs=3 and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wqk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	gcjkhj=cf.doubleTrim(sqk+zqk+wqk);


	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='90' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='53' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjf=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='71' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gcycf=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='94' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jxglf=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='81' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gcddf=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	hjjk=cf.doubleTrim(hddj+lfdj+sqk+zqk+wqk+fk+sjf+gcycf+jxglf+gcddf);

%>

<html>
<head>
<title>��ͬ��Լ״����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center"><b><font size="5">��ͬ��Լ״����</font></b> </div>
<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 15px'>
  <tr height="29"> 
    <td width="15%" align="center"><b>�ͻ����</b></td>
    <td colspan="2"><%=khbh%></td>
    <td width="15%" align="center"><b>�� ͬ ��</b></td>
    <td colspan="2"><%=hth%></td>
  </tr>
  <tr height="29"> 
    <td width="15%" align="center"><b>�ͻ�����</b></td>
    <td colspan="2"><%=khxm%></td>
    <td width="15%" align="center"><b>���̵���</b></td>
    <td colspan="2"><%=zjxm%></td>
  </tr>
  <tr height="29"> 
    <td width="15%" align="center"><b>���ݵ�ַ</b></td>
    <td colspan="5"><%=fwdz%></td>
  </tr>
  <tr height="29"> 
    <td width="15%" align="center"><b>�� �� ʦ</b></td>
    <td colspan="2"><%=sjs%></td>
    <td width="15%" align="center"><b>ʩ �� ��</b></td>
    <td colspan="2"><%=sgdmc%></td>
  </tr>
  <tr height="29"> 
    <td width="15%" align="center"><b>ǩԼ����</b></td>
    <td colspan="2"><%=qyrq%></td>
    <td width="15%" align="center"><b>��ͬ����</b></td>
    <td colspan="2"><%=kgrq%>---<%=jgrq%></td>
  </tr>
  <tr height="29"> 
    <td width="15%" align="center"><b>��Ϣ������</b></td>
    <td colspan="5"><%=xxshyj%></td>
  </tr>
  <tr height="29"> 
    <td colspan="6" align="center" height="27"><b>�����տ����</b></td>
  </tr>
  <tr height="29"> 
    <td width="15%" align="center"><b>����ԭ����</b></td>
    <td colspan="2"><%=wdzgce%></td>
    <td width="15%" align="center">&nbsp;</td>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td align="center"><b>�μӹ�˾�����</b></td>
    <td colspan="5"><%=cxhdbm%></td>
  </tr>
  <tr height="29"> 
    <td align="center"><b>�μ�С�������</b></td>
    <td colspan="5"><%=cxhdbmxq%></td>
  </tr>
  <tr height="29"> 
    <td align="center"><b>�μ�չ������</b></td>
    <td colspan="5"><%=cxhdbmzh%></td>
  </tr>
  <tr height="29"> 
    <td colspan="2" align="center"><b>����ǩԼ�����˰��</b></td>
    <td width="24%"><%=qye%></td>
    <td width="15%" align="center"><b>˰������</b></td>
    <td><b><%=suijin%></b></td>
    <td><b>��Ŀ�����</b>&nbsp;&nbsp;&nbsp;&nbsp;<%=guanlif%></td>
  </tr>
  <tr height="29"> 
    <td width="15%" align="center"><b>����������</b></td>
    <td colspan="2"><%=zhzjxje%></td>
    <td width="15%" align="center"><b>��������5%</b></td>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td colspan="2" align="center"><b>��װӦ�տ��ܶ�</b></td>
    <td colspan="4"><%=zhwgzj%></td>
  </tr>
  <tr height="29"> 
    <td colspan="6" align="center"><b>ʵ�ʽ����¼����˰��</b></td>
  </tr>
  <tr height="29"> 
    <td width="15%" align="center"><b>�����</b></td>
    <td width="11%"><%=hddj%></td>
    <td width="24%">&nbsp;</td>
    <td width="15%" align="center"><b>��������</b></td>
    <td width="11%"><%=lfdj%></td>
    <td width="24%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td align="center"><b>���ڿ�</b></td>
    <td width="11%"><%=sqk%></td>
    <td width="24%">&nbsp;</td>
    <td width="15%" align="center">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="24%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td align="center"><b>���ڿ�</b></td>
    <td width="11%"><%=zqk%></td>
    <td width="24%">&nbsp;</td>
    <td width="15%" align="center">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="24%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td align="center"><b>β�ڿ�</b></td>
    <td width="11%"><%=wqk%></td>
    <td width="24%">&nbsp;</td>
    <td width="15%" align="center">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="24%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%" align="center"><b>���̽���ϼ�</b></td>
    <td width="11%"><%=gcjkhj%></td>
    <td width="24%">&nbsp;</td>
    <td width="15%" align="center"><b>����</b></td>
    <td width="11%"><%=fk%></td>
    <td width="24%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%" align="center"><b>��Ʒ�</b></td>
    <td width="11%"><%=sjf%></td>
    <td width="24%">&nbsp;</td>
    <td width="15%" align="center"><b>����Զ�̷�</b></td>
    <td width="11%"><%=gcycf%></td>
    <td width="24%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%" align="center"><b>��������</b></td>
    <td width="11%"><%=jxglf%></td>
    <td width="24%">&nbsp;</td>
    <td width="15%" align="center"><b>���̵㵥��</b></td>
    <td width="11%"><%=gcddf%></td>
    <td width="24%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%" align="center"><b>�ϼƽ���</b></td>
    <td colspan="5"><%=hjjk%></td>
  </tr>
  <tr height="29"> 
    <td width="15%" align="center"><b>���ѻ���</b></td>
    <td colspan="5">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%" align="center"><b>�ȡ��</b></td>
    <td colspan="2">&nbsp;</td>
    <td width="15%" align="center"><b>�� �� ��</b></td>
    <td colspan="2"><%=glf%>(<%=glftd%>%)</td>
  </tr>
  <tr height="29"> 
    <td width="15%" align="center"><b>Ӧ������</b></td>
    <td colspan="5">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%" align="center"><b>˰��/����</b></td>
    <td colspan="2">&nbsp;</td>
    <td width="15%" align="center"><b>�� �� ��</b></td>
    <td colspan="2">&nbsp;</td>
  </tr>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 15px'>
<%
	int count=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM cl_ckd";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	String cksj=null;
	double ckzje=0;
	int row=0;
	ls_sql="SELECT cksj,ckzje";
	ls_sql+=" FROM cl_ckd";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		cksj=cf.fillHtml(rs.getDate("cksj"));
		ckzje=rs.getDouble("ckzje");

		row++;

		if (row==1)
		{
			%>
			  <tr height="29"> 
				<td rowspan="3" align="center" width="15%"><b>�졡����</b></td>
				<td width="16%" align="center"><%=cksj%></td>
				<td width="27%"><%=ckzje%></td>
			<%
		}
		else if (row%2==1)
		{
			%>
			  <tr height="29"> 
				<td width="16%" align="center"><%=cksj%></td>
				<td width="27%"><%=ckzje%></td>
			<%
		}
		else if (row%2==0)
		{
			%>
				<td width="16%" align="center"><%=cksj%></td>
				<td width="26%"><%=ckzje%></td>
			  </tr>
			<%
		}

	}
	rs.close();
	ps.close();

	if (row%2==1)
	{
		row++;
		%>
			<td width="16%" align="center">&nbsp;</td>
			<td width="26%">&nbsp;</td>
		  </tr>
		<%
	}

	for (int i=row/2;i<3 ;i++ )
	{
		row++;

		if (row==1)
		{
			%>
			  <tr height="29"> 
				<td rowspan="3" align="center" width="15%"><b>�졡����</b></td>
				<td width="16%" align="center">&nbsp;</td>
				<td width="27%">&nbsp;</td>
				<td width="16%" align="center">&nbsp;</td>
				<td width="26%">&nbsp;</td>
			  </tr>
			<%
		}
		else{
			%>
			  <tr height="29"> 
				<td width="16%" align="center">&nbsp;</td>
				<td width="27%">&nbsp;</td>
				<td width="16%" align="center">&nbsp;</td>
				<td width="26%">&nbsp;</td>
			  </tr>
			<%
		}
	}

%>
  
  
  <tr height="29"> 
    <td rowspan="3" align="center" width="15%"><b>���ѽ���</b></td>
    <td width="16%" align="center">&nbsp;</td>
    <td width="27%">&nbsp;</td>
    <td width="16%" align="center">&nbsp;</td>
    <td width="26%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="16%" align="center">&nbsp;</td>
    <td width="27%">&nbsp;</td>
    <td width="16%" align="center">&nbsp;</td>
    <td width="26%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="16%" align="center">&nbsp;</td>
    <td width="27%">&nbsp;</td>
    <td width="16%" align="center">&nbsp;</td>
    <td width="26%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td rowspan="3" align="center" width="15%"><b>��ó����<BR>
      �տ��¼ </b></td>
    <td width="16%" align="center">&nbsp;</td>
    <td width="27%">&nbsp;</td>
    <td width="16%" align="center">&nbsp;</td>
    <td width="26%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="16%" align="center">&nbsp;</td>
    <td width="27%">&nbsp;</td>
    <td width="16%" align="center">&nbsp;</td>
    <td width="26%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="16%" align="center">&nbsp;</td>
    <td width="27%">&nbsp;</td>
    <td width="16%" align="center">&nbsp;</td>
    <td width="26%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td rowspan="2" align="center" width="15%"><b>���ز�Ʒ<BR>
      �տ��¼ </b></td>
    <td width="16%" align="center">&nbsp;</td>
    <td width="27%">&nbsp;</td>
    <td width="16%" align="center">&nbsp;</td>
    <td width="26%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="16%" align="center">&nbsp;</td>
    <td width="27%">&nbsp;</td>
    <td width="16%" align="center">&nbsp;</td>
    <td width="26%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%" align="center"><b>������Ŀ</b></td>
    <td width="16%" align="center">&nbsp;</td>
    <td width="27%">&nbsp;</td>
    <td width="16%" align="center">&nbsp;</td>
    <td width="26%">&nbsp;</td>
  </tr>
</table>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("��������: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>
