<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
</head>
<%
String psph=request.getParameter("psph");
String khbh=request.getParameter("khbh");
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));


String clbm=null;
String nbbm=null;
String clmc=null;
String xh=null;
String gg=null;
String ppmc=null;
String fgsdj=null;
double dj=0;
double sqpssl=0;
double pssl=0;
String cldlmc=null;
String jldwbm=null;

String bgcolor="";

int row=0;

String fgsbh=null;
String hth=null;
String khxm=null;
String fwdz=null;
String sgdmc=null;
double qye=0;


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
  <B><font size="3">��˲��ϵ���ϸ(���ϵ���:<%=psph%>)</font></B>
</CENTER>
<form method="POST" name="listform" action="">
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
<table border="1" cellspacing="0" cellpadding="1" width="120%" style='FONT-SIZE: 12px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">С��</td>
	<td  width="6%">С�࣭��׼���ö�</td>
	<td  width="6%">С�����ã����޶�</td>
	<td  width="6%">С�����ã����޶�</td>
	<td  width="6%">�ڲ�����</td>
	<td  width="10%">��������</td>
	<td  width="9%">���</td>
	<td  width="5%">������λ</td>
	<td  width="6%">���ϵ���</td>
	<td  width="6%">�ɶ�����</td>
	<td  width="5%">��С����</td>
	<td  width="5%">ԭ����</td>
	<td  width="7%">�������</td>
	<td  width="10%">��Ʒ��</td>
	<td  width="6%">���۷�ʽ</td>
</tr>
<%
	String clxlbm=null;
	ls_sql="SELECT distinct clxlbm ";
	ls_sql+=" FROM jxc_clpsmx  ";
    ls_sql+=" where psph='"+psph+"'";
    ls_sql+=" order by clxlbm";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		clxlbm=cf.fillNull(rs2.getString("clxlbm"));

		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM jxc_clpsmx,jxc_clbm ";
		ls_sql+=" where jxc_clpsmx.clbm=jxc_clbm.clbm and jxc_clpsmx.psph='"+psph+"' and jxc_clbm.clxlbm='"+clxlbm+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();


	
		ls_sql="SELECT jxc_clpsmx.psph,jxc_clpsmx.clbm,jxc_clpsmx.nbbm,jxc_clpsmx.clmc,jxc_clpsmx.xh,jxc_clpsmx.gg,jxc_clpsmx.ppmc,jxc_clpsmx.jldwbm,jxc_clpsmx.dj,jxc_clpsmx.pssl,jxc_clpsmx.sqpssl";
		ls_sql+=" FROM jxc_clpsmx,jxc_clbm ";
		ls_sql+=" where jxc_clpsmx.clbm=jxc_clbm.clbm and jxc_clpsmx.psph='"+psph+"' and jxc_clbm.clxlbm='"+clxlbm+"' ";
		ls_sql+=" order by jxc_clpsmx.psxh ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			row++;

			clbm=cf.fillNull(rs.getString("clbm"));
			nbbm=cf.fillHtml(rs.getString("nbbm"));
			clmc=cf.fillHtml(rs.getString("clmc"));
			xh=cf.fillHtml(rs.getString("xh"));
			gg=cf.fillHtml(rs.getString("gg"));
			ppmc=cf.fillHtml(rs.getString("ppmc"));
			jldwbm=cf.fillHtml(rs.getString("jldwbm"));
			dj=rs.getDouble("dj");
			pssl=rs.getDouble("pssl");
			sqpssl=rs.getDouble("sqpssl");

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

			String xsfsmc=null;
			String xsfs=null;
			double zxqdl=0;
			double zcpzsl=0;
			double ccpzsl=0;
			double bfpzsl=0;
			double dhsl=0;
			double ycgsl=0;
			double kdhsl=0;//�ɶ�����

			ls_sql="select DECODE(xsfs,'1','����Ʒ','2','�ֻ�','3','�ڻ�����','4','�������') xsfsmc,xsfs,zxqdl,zcpzsl,ccpzsl,bfpzsl,dhsl,zcpzsl-dhsl kdhsl,ycgsl ";
			ls_sql+=" from  jxc_cljgb";
			ls_sql+=" where jxc_cljgb.clbm='"+clbm+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				xsfsmc=cf.fillNull(rs1.getString("xsfsmc"));
				xsfs=cf.fillNull(rs1.getString("xsfs"));
				zxqdl=rs1.getDouble("zxqdl");
				zcpzsl=rs1.getDouble("zcpzsl");
				ccpzsl=rs1.getDouble("ccpzsl");
				bfpzsl=rs1.getDouble("bfpzsl");
				dhsl=rs1.getDouble("dhsl");
				kdhsl=rs1.getDouble("kdhsl");
				ycgsl=rs1.getDouble("ycgsl");
			}
			rs1.close();
			ps1.close();

			
			if (row%2==0)
			{
				bgcolor="E8E8FF";
			}
			else{
				bgcolor="FFFFFF";
			}
	%>
			<tr bgcolor="<%=bgcolor%>" align="center">
			<td rowspan="<%=count%>"><%=clxlbm%></td>
			<td rowspan="<%=count%>"><%=bzlyje%></td>
			<td rowspan="<%=count%>"><%=lyxxje%></td>
			<td rowspan="<%=count%>"><%=lysxje%></td>
			<td><%=nbbm%>
				<input type="hidden" name="clbm" value="<%=clbm%>">
			</td>
			<td><%=clmc%></td>
			<td><%=gg%></td>
			<td><%=jldwbm%></td>
			<td><%=dj%></td>
			<td><%=kdhsl%>
				<input type="hidden" name="kdhsl" value="<%=kdhsl%>">
			</td>
			<td><%=zxqdl%>
				<input type="hidden" name="zxqdl" value="<%=zxqdl%>">
			</td>
			<td><%=sqpssl%></td>
			<td> 
				<input type="text" name="pssl" size="8" maxlength="10" value=<%=pssl%> style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
			<td><%=ppmc%></td>
			<td><%=xsfsmc%>
				<input type="hidden" name="xsfs" value="<%=xsfs%>">
			</td>
			</tr>
	<%
		}

	
		while (rs.next())
		{
			row++;

			clbm=cf.fillNull(rs.getString("clbm"));
			nbbm=cf.fillHtml(rs.getString("nbbm"));
			clmc=cf.fillHtml(rs.getString("clmc"));
			xh=cf.fillHtml(rs.getString("xh"));
			gg=cf.fillHtml(rs.getString("gg"));
			ppmc=cf.fillHtml(rs.getString("ppmc"));
			jldwbm=cf.fillHtml(rs.getString("jldwbm"));
			dj=rs.getDouble("dj");
			pssl=rs.getDouble("pssl");
			sqpssl=rs.getDouble("sqpssl");


			String xsfsmc=null;
			String xsfs=null;
			double zxqdl=0;
			double zcpzsl=0;
			double ccpzsl=0;
			double bfpzsl=0;
			double dhsl=0;
			double ycgsl=0;
			double kdhsl=0;//�ɶ�����

			ls_sql="select DECODE(xsfs,'1','����Ʒ','2','�ֻ�','3','�ڻ�����','4','�������') xsfsmc,xsfs,zxqdl,zcpzsl,ccpzsl,bfpzsl,dhsl,zcpzsl-dhsl kdhsl,ycgsl ";
			ls_sql+=" from  jxc_cljgb";
			ls_sql+=" where jxc_cljgb.clbm='"+clbm+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				xsfsmc=cf.fillNull(rs1.getString("xsfsmc"));
				xsfs=cf.fillNull(rs1.getString("xsfs"));
				zxqdl=rs1.getDouble("zxqdl");
				zcpzsl=rs1.getDouble("zcpzsl");
				ccpzsl=rs1.getDouble("ccpzsl");
				bfpzsl=rs1.getDouble("bfpzsl");
				dhsl=rs1.getDouble("dhsl");
				kdhsl=rs1.getDouble("kdhsl");
				ycgsl=rs1.getDouble("ycgsl");
			}
			rs1.close();
			ps1.close();

			
			if (row%2==0)
			{
				bgcolor="E8E8FF";
			}
			else{
				bgcolor="FFFFFF";
			}
	%>
			<tr bgcolor="<%=bgcolor%>" align="center">
			<td><%=nbbm%>
				<input type="hidden" name="clbm" value="<%=clbm%>">
			</td>
			<td><%=clmc%></td>
			<td><%=gg%></td>
			<td><%=jldwbm%></td>
			<td><%=dj%></td>
			<td><%=kdhsl%>
				<input type="hidden" name="kdhsl" value="<%=kdhsl%>">
			</td>
			<td><%=zxqdl%>
				<input type="hidden" name="zxqdl" value="<%=zxqdl%>">
			</td>
			<td><%=sqpssl%></td>
			<td> 
				<input type="text" name="pssl" size="8" maxlength="10" value=<%=pssl%> style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
			<td><%=ppmc%></td>
			<td><%=xsfsmc%>
				<input type="hidden" name="xsfs" value="<%=xsfs%>">
			</td>
			</tr>
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
      <td colspan="13" > 
		<input type="hidden" name="dqbm" value="<%=dqbm%>">
		<input type="hidden" name="khbh" value="<%=khbh%>">
		<input type="hidden" name="psph" value="<%=psph%>">
		<input type=button value=' �� �� ' onClick="f_do(listform)" name="sl">
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset" value='����' name="reset" >      
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
		if(	javaTrim(FormName.pssl)=="") {
			alert("������[��������]��");
			FormName.pssl.select();
			return false;
		}
		if(!(isFloat(FormName.pssl, "��������"))) {
			return false;
		}

		if (parseFloat(FormName.pssl.value)<0)
		{
			alert("����������������С���㣡����");
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
			if(	javaTrim(FormName.pssl[i])=="") {
				alert("������[��������]��");
				FormName.pssl[i].select();
				return false;
			}
			if(!(isFloat(FormName.pssl[i], "��������"))) {
				return false;
			}

			if (parseFloat(FormName.pssl[i].value)<0)
			{
				alert("����������������С���㣡����");
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

	FormName.action="SaveShAllJxc_clpsmx.jsp";
	FormName.submit();
	return true;
} 


//-->
</script>

