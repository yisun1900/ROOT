<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {
	color: #0000FF;
	font-weight: bold;
}
.STYLE3 {color: #0000CC}
.STYLE4 {
	color: #990000;
	font-weight: bold;
}
-->
</style>
</head>

<%
String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
String jmfl=cf.GB2Uni(cf.getParameter(request,"jmfl"));
%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveZcjmFl.jsp" name="insertform">
<div align="center">���ļ��⣨���������:<%=zjxxh%>���������:<%=jmfl%>��</div>



<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">�ṹλ��</td>
	<td  width="12%">��Ʒ���</td>
	<td  width="13%">�ײ���������</td>
	<td  width="7%">���ۼ���</td>
	<td  width="8%">�Ƿ���������</td>
	<td  width="7%">��׼����</td>
	<td  width="6%">ʵ������</td>
	<td  width="6%">�Ƿ�ɼ���</td>
	<td  width="6%">���������λ</td>
	<td  width="7%">���ⵥ��</td>
	<td  width="7%">��������������</td>
	<td  width="19%"><span class="STYLE1">*</span><span class="STYLE4">ʵ�ʼ�������</span></td>
</tr>


<%
String bjjbbm=null;
String bjjbmc=null;
String jgwzbm=null;
String tcsjflbm=null;
String tcsjflmc=null;
String tccplbbm=null;
String clxlmc=null;

String sfxzsl="";
String sfxzslStr="";
String sfkjm="";//�Ƿ�ɼ���  1�����ƣ�3��������
String sfkjmStr="";
double yxjmzdsl=0;//��������������
double jmdj=0;//���ⵥ��
double sjjmsl=0;//ʵ�ʼ�������
double sjjmje=0;//ʵ�ʼ�����
double sjsl=0;//ʵ������
double bzsl=0;//��׼����
String txxx="";
String sjjmslStr="";
String jmjldw="";


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
int row=0;
try {
	conn=cf.getConnection();



	ls_sql="select bj_khzcxmxjh.jmjldw,bj_khzcxmxjh.sjsl,bj_khzcxmxjh.bjjbbm,bjjbmc,jgwzbm,bj_khzcxmxjh.tccplbbm,jxc_clxlbm.clxlmc,bj_khzcxmxjh.tcsjflbm,tcsjflmc,bj_khzcxmxjh.sfxzsl,DECODE(bj_khzcxmxjh.sfxzsl,'1','������Ӽ�','2','���ɳ���','3','����������') sfxzslStr,bj_khzcxmxjh.sfkjm,DECODE(bj_khzcxmxjh.sfkjm,'1','���ɼ���','2','�ɼ���') sfkjmStr,bj_khzcxmxjh.yxjmzdsl,bj_khzcxmxjh.jmdj,bj_khzcxmxjh.sjjmsl,bj_khzcxmxjh.sjjmje,bj_khzcxmxjh.sjsl,bj_khzcxmxjh.bzsl";
	ls_sql+=" FROM bj_khzcxmxjh,jxc_clxlbm,bj_tcsjflbm,bdm_bjjbbm";
	ls_sql+=" where bj_khzcxmxjh.zjxxh='"+zjxxh+"' and bj_khzcxmxjh.jmfl='"+jmfl+"' and bj_khzcxmxjh.sfkjm='2'";
	ls_sql+=" and bj_khzcxmxjh.tcsjflbm=bj_tcsjflbm.tcsjflbm(+) ";
	ls_sql+=" and bj_khzcxmxjh.tccplbbm=jxc_clxlbm.clxlbm(+) ";
	ls_sql+=" and bj_khzcxmxjh.bjjbbm=bdm_bjjbbm.bjjbbm(+) ";
	ls_sql+=" order by bj_khzcxmxjh.jgwzbm,bj_khzcxmxjh.tcsjflbm,bj_khzcxmxjh.tccplbbm ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		jmjldw=cf.fillHtml(rs.getString("jmjldw"));
		sjsl=rs.getDouble("sjsl");
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));
		jgwzbm=cf.fillNull(rs.getString("jgwzbm"));
		tccplbbm=cf.fillNull(rs.getString("tccplbbm"));
		clxlmc=cf.fillNull(rs.getString("clxlmc"));
		tcsjflbm=cf.fillNull(rs.getString("tcsjflbm"));
		tcsjflmc=cf.fillNull(rs.getString("tcsjflmc"));
		sfxzslStr=cf.fillNull(rs.getString("sfxzslStr"));
		sfkjm=cf.fillNull(rs.getString("sfkjm"));
		sfkjmStr=cf.fillNull(rs.getString("sfkjmStr"));
		yxjmzdsl=rs.getDouble("yxjmzdsl");
		jmdj=rs.getDouble("jmdj");
		sjjmsl=rs.getDouble("sjjmsl");
		sjjmje=rs.getDouble("sjjmje");
		bzsl=rs.getDouble("bzsl");

		row++;

		if (sjsl>0)
		{
			out.println("����"+jgwzbm+":"+clxlmc+":��ѡ����������:"+sjsl+"�����ɼ��⣬����ɾ������");
			return;
		}

		if (sjjmsl==0)
		{
			sjjmslStr="";
		}
		else{
			sjjmslStr=""+sjjmsl;
		}



		%>
		<tr bgcolor="#FFFFF"  align="center">
			<td><%=jgwzbm%></td>
			<td><%=clxlmc%></td>
			<td><%=tcsjflmc%></td>
			<td><%=bjjbmc%></td>
			<td><%=sfxzslStr%></td>
			<td><%=bzsl%></td>
			<td><%=sjsl%></td>
			<td><%=sfkjmStr%></td>
			<td><%=jmjldw%></td>
			<td><%=jmdj%></td>
			<td><%=yxjmzdsl%></td>
			<td>
				<input name="jgwzbm" type="hidden" value="<%=jgwzbm%>">
				<input name="yxjmzdsl" type="hidden" value="<%=yxjmzdsl%>">
				<input name="tccplbbm" type="hidden" value="<%=tccplbbm%>">
				<input type="text" name="sjjmsl" size="12" value="<%=sjjmslStr%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			
			</td>
		</tr>
		<%
	}
	rs.close();
	ps.close();


}
catch (Exception e) {
	out.print("<BR>����:" + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>



<tr bgcolor="#CCCCCC"  align="center">
      <td colspan="12"> 
		<input name="zjxxh" type="hidden" value="<%=zjxxh%>">
		<input name="jmfl" type="hidden" value="<%=jmfl%>">
	<input type="button"  value="����" onClick="f_do(insertform)">
	 </td>
    </tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_do(FormName)//����FormName:Form������
{
	if (<%=row%>==1)
	{
		if(	javaTrim(FormName.sjjmsl)=="") {
			alert("������[��������]��");
			FormName.sjjmsl.focus();
			return false;
		}
		if(!(isFloat(FormName.sjjmsl, "��������"))) {
			return false;
		}
		if (parseFloat(FormName.sjjmsl.value)>parseFloat(FormName.yxjmzdsl.value))
		{
			alert("����[��������]�����������ֵ:"+FormName.yxjmzdsl.value);
			FormName.sjjmsl.select();
			return false;
		}
		if (parseFloat(FormName.sjjmsl.value)<0)
		{
			alert("����[��������]����С��0");
			FormName.sjjmsl.select();
			return false;
		}
	}
	else{
		for (var i=0;i<<%=row%> ;i++ )
		{
			if(	javaTrim(FormName.sjjmsl[i])=="") {
				alert("������[��������]��");
				FormName.sjjmsl[i].focus();
				return false;
			}
			if(!(isFloat(FormName.sjjmsl[i], "��������"))) {
				return false;
			}
			if (parseFloat(FormName.sjjmsl[i].value)>parseFloat(FormName.yxjmzdsl[i].value))
			{
				alert("����[��������]�����������ֵ:"+FormName.yxjmzdsl[i].value);
				FormName.sjjmsl[i].select();
				return false;
			}
			if (parseFloat(FormName.sjjmsl[i].value)<0)
			{
				alert("����[��������]����С��0");
				FormName.sjjmsl[i].select();
				return false;
			}
		}
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
