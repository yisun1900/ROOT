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
String dqbm=(String)session.getAttribute("dqbm");


String clbm=null;
String nbbm=null;
String clmc=null;
String xh=null;
String gg=null;
String ppmc=null;
String fgsdj=null;
double dj=0;
String pssl=null;
String cldlmc=null;
String jldwbm=null;

String bgcolor="";

int row=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�޸����͵���ϸ(���͵���:<%=psph%>)</font></B>
</CENTER>
<form method="POST" name="listform" action="">
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="4%">���</td>
	<td  width="8%">�ڲ�����</td>
	<td  width="14%">��������</td>
	<td  width="8%">�ͺ�</td>
	<td  width="8%">���</td>
	<td  width="16%">��Ʒ��</td>
	<td  width="6%">������λ</td>
	<td  width="7%">���͵���</td>
	<td  width="6%">���۷�ʽ</td>
	<td  width="6%">�ɶ�����</td>
	<td  width="6%">��С����</td>
	<td  width="8%">��������</td>
</tr>
<%
	ls_sql="SELECT psph,jxc_clpsmx.clbm,nbbm,jxc_clpsmx.clmc,xh,jxc_clpsmx.gg,ppmc,jldwbm,dj,pssl";
	ls_sql+=" FROM jxc_clpsmx ";
	ls_sql+=" where psph='"+psph+"' ";
	ls_sql+=" order by psxh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
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
		pssl=cf.fillNull(rs.getString("pssl"));

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
		<td align="center">
			<input name="chitem" type="checkbox" value="<%=clbm%>">
		</td>
		<td><%=row%>
			<input type="hidden" name="clbm" value="<%=clbm%>">
		</td>
		<td><%=nbbm%></td>
		<td><%=clmc%></td>
		<td><%=xh%></td>
		<td><%=gg%></td>
		<td><%=ppmc%></td>
		<td><%=jldwbm%></td>
		<td><%=dj%></td>
		<td><%=xsfsmc%>
			<input type="hidden" name="xsfs" value="<%=xsfs%>">
		</td>
		<td><%=kdhsl%>
			<input type="hidden" name="kdhsl" value="<%=kdhsl%>">
		</td>
		<td><%=zxqdl%>
			<input type="hidden" name="zxqdl" value="<%=zxqdl%>">
		</td>
		<td> 
			<input type="text" name="pssl" size="8" maxlength="10" value=<%=pssl%> style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
		</td>
		</tr>
<%
	}
	rs.close();
	ps.close();
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type=button value='ȫѡɾ����' onclick="selectAll(listform)">
		&nbsp;&nbsp;
		<input type=button value='ɾ��' onClick="f_delete(listform)">
		&nbsp;&nbsp;
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
			if(	javaTrim(FormName.pssl[i])=="") {
				alert("������[��������]��");
				FormName.pssl[i].select();
				return false;
			}
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

	FormName.action="SaveEditAllJxc_clpsmx.jsp";
	FormName.submit();
	return true;
} 

var mark=1;
function selectAll(FormName)//ת���ַ���
{
	var i = 0;
	if (<%=row%>==1)
	{
		if (mark==0)
		{
			FormName.chitem.checked =false
		}
		else{
			FormName.chitem.checked =true
		}
	}
	else
	{ 
		for (i=0;i <<%=row%> ;i++ )
		{
			if (mark==0)
			{
				FormName.chitem[i].checked =false
			}
			else{
				FormName.chitem[i].checked =true
			}
		}
	}
	if (mark==0)
	{
		mark=1;
	}
	else{
		mark=0;
	}
}

function f_delete(FormName)
{
	if (!confirm("ȷʵҪɾ����") )	
	{
		return false;
	}

	var choo=0;
	var i = 0;
	if (<%=row%>==1)
	{
		if( FormName.chitem.checked )
		{
			choo=1;
		}
	} 
	else
	{ 
		for (i=0;i <<%=row%> ;i++ )
		{
			if( FormName.chitem[i].checked )
			{
				choo=1;
			}
		} 
	} 
	if (choo == 0)
	{
		alert("��ѡ����Ҫɾ������Ŀ");
		return false;
	}

	FormName.action="DeleteJxc_clpsmx.jsp";
	FormName.submit();
	return true;

}

//-->
</script>

