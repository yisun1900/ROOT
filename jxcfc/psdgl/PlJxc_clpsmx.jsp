<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<html>
<head>
</head>
<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

String bgcolor="";

int row=0;

String psph=cf.GB2Uni(request.getParameter("psph"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));

String fgsbh=null;
String hth=null;
String khxm=null;
String fwdz=null;
String sgdmc=null;
double qye=0;

try {
	conn=cf.getConnection();


	ls_sql=" select sgdmc,hth,khxm,fwdz,fgsbh,NVL(guanlif,0)+NVL(suijin,0)+qye qye";
    ls_sql+=" from crm_khxx,sq_sgd";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		hth=rs.getString("hth");
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		fgsbh=rs.getString("fgsbh");
		qye=rs.getDouble("qye");
		fgsbh=rs.getString("fgsbh");
	}
	rs.close();
	ps.close();



    double sgcbj=0;
    double zxsgcbj=0;
	ls_sql=" select sgcbj,zxsgcbj";
    ls_sql+=" from crm_khqye";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgcbj=rs.getDouble("sgcbj");
		zxsgcbj=rs.getDouble("zxsgcbj");
	}
	rs.close();
	ps.close();
%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">����¼����ϵ�(���ϵ���:<%=psph%>)</font></B>
</CENTER>
<form method="POST" name="listform" action="" target="_blank">
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td width="18%" align="right"><font color="#0000CC">�ͻ����</font> </td>
      <td width="16%"><%=khbh%> </td>
      <td width="16%"><font color="#0000CC">ʩ���ӣ�</font><%=sgdmc%></td>
      <td width="18%" align="right"><font color="#0000CC">��ͬ��</font> </td>
      <td width="32%"><%=hth%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">�ͻ�����</font> </td>
      <td colspan="2"><%=khxm%> </td>
      <td align="right"><font color="#0000CC">���ݵ�ַ</font></td>
      <td><%=fwdz%></td>
    </tr>
</table>

<table border="1" cellspacing="0" cellpadding="1" width="110%" style='FONT-SIZE: 12px' >
<tr bgcolor="#FFFFFF"> 
	<td colspan="14" > 
		<input type=button value=' �� �� ' onClick="f_do(listform)" >
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset" value=' �� �� ' name="reset" >
	</td>
</tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">С��</td>
	<td  width="7%">�ڲ�����</td>
	<td  width="11%">��������</td>
	<td  width="8%">���</td>
	<td  width="6%">������λ</td>
	<td  width="6%">���ϵ���</td>
	<td  width="6%">�ɶ�����</td>
	<td  width="5%">��С����</td>
	<td  width="7%">��������</td>
	<td  width="6%">С���׼���ö�</td>
	<td  width="6%">С���������޶�</td>
	<td  width="6%">С���������޶�</td>
	<td  width="12%">��Ʒ��</td>
	<td  width="6%">���۷�ʽ</td>
</tr>
<%
	String clbm=null;
	String clxlbm=null;
	String nbbm=null;
	String clmc=null;
	String xh=null;
	String gg=null;
	String ppmc=null;
	String jldwbm=null;

	double dgzjg=0;
	double dfgsjg=0;
	double zxqdl=0;
	double zcpzsl=0;
	double dhsl=0;
	String xsfs=null;
	String xsfsmc=null;


	ls_sql="SELECT distinct jxc_clbm.clxlbm ";
	ls_sql+=" FROM jxc_clbm,jxc_cljgb  ";
    ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm(+)";
    ls_sql+=" and jxc_clbm.cllb='1'";//0�����ģ�1������
	ls_sql+=" and jxc_cljgb.dqbm='"+dqbm+"' and jxc_cljgb.sfcy='Y' ";//N����Y����
    ls_sql+=" order by jxc_clbm.clxlbm";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		clxlbm=cf.fillNull(rs2.getString("clxlbm"));


		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM jxc_clbm,jxc_cljgb  ";
		ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm(+)";
		ls_sql+=" and jxc_clbm.cllb='1'";//0�����ģ�1������
		ls_sql+=" and jxc_cljgb.dqbm='"+dqbm+"' and jxc_cljgb.sfcy='Y' ";//N����Y����
		ls_sql+=" and jxc_clbm.clxlbm='"+clxlbm+"'";
		ls_sql+=" order by jxc_clbm.cldlbm,jxc_clbm.clxlbm,jxc_clbm.clmc";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();


		ls_sql="SELECT jxc_clbm.clbm,jxc_clbm.clxlbm,jxc_clbm.nbbm,jxc_clbm.clmc,jxc_clbm.xh,jxc_clbm.gg,jxc_clbm.ppmc,jxc_clbm.jldwbm ";
		ls_sql+=" ,jxc_cljgb.dgzjg,jxc_cljgb.dfgsjg,jxc_cljgb.zcpzsl,jxc_cljgb.dhsl,jxc_cljgb.zxqdl,jxc_cljgb.xsfs,DECODE(jxc_cljgb.xsfs,'1','����Ʒ','2','�ֻ�','3','�ڻ�����','4','�������') xsfsmc";
		ls_sql+=" FROM jxc_clbm,jxc_cljgb  ";
		ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm(+)";
		ls_sql+=" and jxc_clbm.cllb='1'";//0�����ģ�1������
		ls_sql+=" and jxc_cljgb.dqbm='"+dqbm+"' and jxc_cljgb.sfcy='Y' ";//N����Y����
		ls_sql+=" and jxc_clbm.clxlbm='"+clxlbm+"'";
		ls_sql+=" order by jxc_clbm.cldlbm,jxc_clbm.clxlbm,jxc_clbm.clmc";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			row++;

			clbm=cf.fillNull(rs.getString("clbm"));
			clxlbm=cf.fillNull(rs.getString("clxlbm"));
			nbbm=cf.fillHtml(rs.getString("nbbm"));
			clmc=cf.fillHtml(rs.getString("clmc"));
			xh=cf.fillHtml(rs.getString("xh"));
			gg=cf.fillHtml(rs.getString("gg"));
			ppmc=cf.fillHtml(rs.getString("ppmc"));
			jldwbm=cf.fillHtml(rs.getString("jldwbm"));

			dgzjg=rs.getDouble("dgzjg");
			dfgsjg=rs.getDouble("dfgsjg");
			zcpzsl=rs.getDouble("zcpzsl");
			dhsl=rs.getDouble("dhsl");
			zxqdl=rs.getDouble("zxqdl");
			xsfs=cf.fillNull(rs.getString("xsfs"));
			xsfsmc=cf.fillNull(rs.getString("xsfsmc"));

			double pssl=0;
			String psslstr=null;
			double psje=0;
			ls_sql="SELECT jxc_clpsmx.pssl,jxc_clpsmx.psje ";
			ls_sql+=" FROM jxc_clpsmx  ";
			ls_sql+=" where jxc_clpsmx.psph='"+psph+"' and jxc_clpsmx.clbm='"+clbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				pssl=rs1.getDouble("pssl");
				psje=rs1.getDouble("psje");
			}
			rs1.close();
			ps1.close();


			double bzlyje=0;
			double lyxxje=0;
			double lysxje=0;
			ls_sql=" select ROUND(bzlybl/100*"+zxsgcbj+",2),ROUND(lyblxx/100*"+zxsgcbj+",2),ROUND(lyblsx/100*"+zxsgcbj+",2)";
			ls_sql+=" from jxc_fclybl";
			ls_sql+=" where dwbh='"+fgsbh+"' and clxlmc='"+clxlbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				bzlyje=rs1.getDouble(1);
				lyxxje=rs1.getDouble(2);
				lysxje=rs1.getDouble(3);
			}
			rs1.close();
			ps1.close();

			if (pssl==0)
			{
				psslstr="";
			}
			else{
				psslstr=""+pssl;
			}

			if (row%2==0)
			{
				bgcolor="E8E8FF";
			}
			else{
				bgcolor="FFFFFF";
			}

			if (!psslstr.equals(""))
			{
				bgcolor="#FFFF99";
			}

			%>
			<tr bgcolor="<%=bgcolor%>" align="center">
			<td rowspan="<%=count%>"><%=clxlbm%></td>
			<td><%=nbbm%>
				<input type="hidden" name="clbm" value="<%=clbm%>">
			</td>
			<td><%=clmc%></td>
			<td><%=gg%></td>
			<td><%=jldwbm%></td>
			<td><%=dgzjg%></td>
			<td><%=(zcpzsl-dhsl)%>
				<input type="hidden" name="kdhsl" value="<%=(zcpzsl-dhsl)%>">
			</td>
			<td><%=zxqdl%>
				<input type="hidden" name="zxqdl" value="<%=zxqdl%>">
			</td>
			<td>
				<input type="text" name="pssl" value="<%=psslstr%>" size="8" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
			<td rowspan="<%=count%>"><%=bzlyje%></td>
			<td rowspan="<%=count%>"><%=lyxxje%></td>
			<td rowspan="<%=count%>"><%=lysxje%></td>
			<td><%=ppmc%></td>
			<td><%=xsfsmc%>
				<input type="hidden" name="xsfs" value="<%=xsfs%>">
			</td>
			<%	
		}


		while (rs.next())
		{
			row++;

			clbm=cf.fillNull(rs.getString("clbm"));
			clxlbm=cf.fillNull(rs.getString("clxlbm"));
			nbbm=cf.fillHtml(rs.getString("nbbm"));
			clmc=cf.fillHtml(rs.getString("clmc"));
			xh=cf.fillHtml(rs.getString("xh"));
			gg=cf.fillHtml(rs.getString("gg"));
			ppmc=cf.fillHtml(rs.getString("ppmc"));
			jldwbm=cf.fillHtml(rs.getString("jldwbm"));

			dgzjg=rs.getDouble("dgzjg");
			dfgsjg=rs.getDouble("dfgsjg");
			zcpzsl=rs.getDouble("zcpzsl");
			dhsl=rs.getDouble("dhsl");
			zxqdl=rs.getDouble("zxqdl");
			xsfs=cf.fillNull(rs.getString("xsfs"));
			xsfsmc=cf.fillNull(rs.getString("xsfsmc"));

			double pssl=0;
			String psslstr=null;
			double psje=0;
			ls_sql="SELECT jxc_clpsmx.pssl,jxc_clpsmx.psje ";
			ls_sql+=" FROM jxc_clpsmx  ";
			ls_sql+=" where jxc_clpsmx.psph='"+psph+"' and jxc_clpsmx.clbm='"+clbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				pssl=rs1.getDouble("pssl");
				psje=rs1.getDouble("psje");
			}
			rs1.close();
			ps1.close();

			if (pssl==0)
			{
				psslstr="";
			}
			else{
				psslstr=""+pssl;
			}

			if (row%2==0)
			{
				bgcolor="E8E8FF";
			}
			else{
				bgcolor="FFFFFF";
			}

			if (!psslstr.equals(""))
			{
				bgcolor="#FFFF99";
			}

			%>
			<tr bgcolor="<%=bgcolor%>" align="center">
			<td><%=nbbm%>
				<input type="hidden" name="clbm" value="<%=clbm%>">
			</td>
			<td><%=clmc%></td>
			<td><%=gg%></td>
			<td><%=jldwbm%></td>
			<td><%=dgzjg%></td>
			<td><%=(zcpzsl-dhsl)%>
				<input type="hidden" name="kdhsl" value="<%=(zcpzsl-dhsl)%>">
			</td>
			<td><%=zxqdl%>
				<input type="hidden" name="zxqdl" value="<%=zxqdl%>">
			</td>
			<td>
				<input type="text" name="pssl" value="<%=psslstr%>" size="8" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
			<td><%=ppmc%></td>
			<td><%=xsfsmc%>
				<input type="hidden" name="xsfs" value="<%=xsfs%>">
			</td>
			<%	
		}
		rs.close();
		ps.close();
	
	
	}
	rs2.close();
	ps2.close();




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
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<tr bgcolor="#FFFFFF"> 
	<td colspan="14" > 
		<input type="hidden" name="psph" value="<%=psph%>">
		<input type="hidden" name="khbh" value="<%=khbh%>">
		<input type="hidden" name="dqbm" value="<%=dqbm%>">
		<input type=button value=' �� �� ' onClick="f_do(listform)" name="sl">
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset" value=' �� �� ' name="reset" >
	</td>
</tr>
</table>
</form>
</body>

</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--

function f_do(FormName)
{
	if (<%=row%><=1)
	{
		if(!(isFloat(FormName.pssl, "��������"))) {
			return false;
		}

		if (parseFloat(FormName.pssl.value)<=0)
		{
			alert("��������������������㣡����");
			FormName.pssl.select();
			return false;
		}
		if (parseFloat(FormName.pssl.value) < parseFloat(FormName.zxqdl.value))
		{
			alert("������������������ڡ���С����"+FormName.zxqdl.value+"��������");
			FormName.pssl.select();
			return false;
		}

		if (FormName.xsfs.value=="2")//1������Ʒ��2���ֻ����ۣ�3���ڻ�����
		{
			if (parseFloat(FormName.pssl.value) > parseFloat(FormName.kdhsl.value))
			{
				alert("�����ֻ����ۣ����������������ܴ��ڡ��ɶ�������"+FormName.kdhsl.value+"�����ɶ�������������Ʒ��棭����");
				FormName.pssl.select();
				return false;
			}
		}
	}
	else//���ֻ��һ����¼����ͨ���������ʽ����
	{
		for (i=0;i<<%=row%> ;i++ )
		{
			if(!(isFloat(FormName.pssl[i], "��������"))) {
				return false;
			}

			if (parseFloat(FormName.pssl[i].value)<=0)
			{
				alert("��������������������㣡����");
				FormName.pssl[i].select();
				return false;
			}
			if (parseFloat(FormName.pssl[i].value) < parseFloat(FormName.zxqdl[i].value))
			{
				alert("������������������ڡ���С����"+FormName.zxqdl[i].value+"��������");
				FormName.pssl[i].select();
				return false;
			}

			if (FormName.xsfs[i].value=="2")//1������Ʒ��2���ֻ����ۣ�3���ڻ�����
			{
				if (parseFloat(FormName.pssl[i].value) > parseFloat(FormName.kdhsl[i].value))
				{
					alert("�����ֻ����ۣ����������������ܴ��ڡ��ɶ�������"+FormName.kdhsl[i].value+"�����ɶ�������������Ʒ��棭����");
					FormName.pssl[i].select();
					return false;
				}
			}
		}
	}

	FormName.action="SavePlJxc_clpsmx.jsp";
	FormName.submit();
	return true;
} 

//-->
</script>

