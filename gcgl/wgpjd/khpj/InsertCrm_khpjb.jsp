<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");

String hth=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
String zjxm=null;
String sgd=null;
String sgdmc=null;
String sgbz=null;
String dwbh=null;
String dwmc=null;
String fgsbh=null;
String qyrq=null;

String khbh=cf.GB2Uni(request.getParameter("khbh"));

String yjdz="";
String yb="";
String sjr="";
String dh="";
String bz="";
String lrr="";
String lrsj="";

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

	ls_sql="select khxm,fwdz,lxfs,crm_khxx.dwbh,dwmc,sjs,crm_khxx.sgd,sgdmc,zjxm,hth,sgbz,fgsbh,qyrq";
	ls_sql+=" from  crm_khxx,sq_dwxx,sq_sgd";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
	}
	rs.close();
	ps.close();

	ls_sql="select yjdz,yb,sjr,dh,bz,lrr,lrsj ";
	ls_sql+=" from  crm_bdxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yjdz=cf.fillNull(rs.getString("yjdz"));
		yb=cf.fillNull(rs.getString("yb"));
		sjr=cf.fillNull(rs.getString("sjr"));
		dh=cf.fillNull(rs.getString("dh"));
		bz=cf.fillNull(rs.getString("bz"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
	}
	rs.close();
	ps.close();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_khpjb";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("����[�ͻ����۱�]��¼�룬�뵽ά�����޸�");
		return;
	}
%>


<body bgcolor="#FFFFFF">
  <div align="center">�ͻ�����</div>

<form method="post" action="SaveInsertCrm_khpjb.jsp" name="insertform" target="_blank">
  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#000099">�ͻ����</font></td>
      <td width="33%"><%=khbh%></td>
      <td align="right" width="17%"><font color="#000099">��ͬ��</font></td>
      <td width="33%"><%=hth%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#000099">�ͻ�����</font></td>
      <td width="33%"><%=khxm%></td>
      <td align="right" width="17%"><font color="#000099">���ݵ�ַ</font></td>
      <td width="33%"><%=fwdz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#000099">���ʦ</font></td>
      <td width="33%"><%=sjs%></td>
      <td align="right" width="17%"><font color="#000099">���̵���</font></td>
      <td width="33%"><%=zjxm%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#000099">ʩ����</font></td>
      <td width="33%"><%=sgdmc%></td>
      <td align="right" width="17%"><font color="#000099">ʩ������</font></td>
      <td width="33%"><%=sgbz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#000099">ǩԼ����</font></td>
      <td width="33%"><%=qyrq%></td>
      <td align="right" width="17%"><font color="#000099">ǩԼ����</font></td>
      <td width="33%"><%=dwmc%></td>
    </tr>
    <tr bgcolor="#FFFFFF" align="center"> 
      <td height="30" colspan="4"><b>�����ʼĵ�ַ</b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">�ʼĵ�ַ</td>
      <td colspan="3"> 
        <input type="text" name="yjdz" size="73" maxlength="50"  value="<%=yjdz%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">�ʱ�</td>
      <td width="33%"> 
        <input type="text" name="yb" size="20" maxlength="10"  value="<%=yb%>" >
      </td>
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">�ռ���</td>
      <td width="33%"> 
        <input type="text" name="sjr" size="20" maxlength="20"  value="<%=sjr%>" >
      </td>
      <td align="right" width="17%">�绰</td>
      <td width="33%"> 
        <input type="text" name="dh" size="20" maxlength="20"  value="<%=dh%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="72" rows="3"><%=bz%></textarea>
      </td>
    </tr>
  </table>

  <P><center><B>--����-��-��-��-����--</B></center>

<%
	int allxskd=0;
	ls_sql="select sum(xskd)";
	ls_sql+=" from  crm_xmflbm";
	ls_sql+=" order by xmflbm ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		allxskd=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();

	allxskd+=120*4+50;
%>
  <table width="<%=allxskd%>px" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF" align="center"> 
      <td width="50px">&nbsp;</td>
      <%

	String xmflbm=null;
	String xmfl=null;
	int xskd=0;
	ls_sql="select xmflbm,xmfl,xskd,xskd";
	ls_sql+=" from  crm_xmflbm";
	ls_sql+=" order by xmflbm ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		xmfl=cf.fillNull(rs1.getString("xmfl"));
		xskd=rs1.getInt("xskd");

		%> 
      <td width="<%=(xskd+120)%>px"><%=xmfl%></td>
      <%
	}
	rs1.close();
	ps1.close();

	%> </tr>
    <%
	
	
	String spjrybm=null;
	String spjry=null;
	ls_sql="select spjrybm,spjry";
	ls_sql+=" from  crm_spjrybm";
	ls_sql+=" order by spjrybm ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		spjrybm=cf.fillNull(rs.getString("spjrybm"));
		spjry=cf.fillNull(rs.getString("spjry"));

		int rowcount=0;
		ls_sql="select  max(count(*))";
		ls_sql+=" from  crm_pjxmbm";
		ls_sql+=" where spjrybm='"+spjrybm+"'";
		ls_sql+=" group by xmflbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			rowcount=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		%> 
    <tr bgcolor="#FFFFFF" align="center"> 
      <td ><%=spjry%></td>
      <%

		ls_sql="select  xmflbm,xmfl,xskd";
		ls_sql+=" from  crm_xmflbm";
		ls_sql+=" order by xmflbm ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			xmflbm=cf.fillNull(rs1.getString("xmflbm"));
			xmfl=cf.fillNull(rs1.getString("xmfl"));
			xskd=rs1.getInt("xskd");

			%> 
      <td valign="top"> 
		  <table width="100%" border="0" style="FONT-SIZE:12" cellpadding="0" cellspacing="0">
			<%

			String pjxmbm=null;
			String pjxm=null;
			String xsfs=null;
			int xh=0;
			ls_sql="select pjxmbm,pjxm,xsfs,xh";
			ls_sql+=" from  crm_pjxmbm";
			ls_sql+=" where spjrybm='"+spjrybm+"' and xmflbm='"+xmflbm+"' ";
			ls_sql+=" order by xh ";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			while (rs2.next())
			{
				pjxmbm=cf.fillNull(rs2.getString("pjxmbm"));
				pjxm=cf.fillNull(rs2.getString("pjxm"));
				xsfs=cf.fillNull(rs2.getString("xsfs"));
				xh=rs2.getInt("xh");

				if (xsfs.equals("1"))//1����Ŀ�����ѡ��2����Ŀ���൥ѡ
				{
					%>
					<tr > 
					  <td width="<%=xskd%>px"><%=pjxm%></td>
					  <td width="120px"><B><%cf.radioToken(out, "pjxmbm"+pjxmbm,"1+��&2+��&9+��","1");%></B></td>
					</tr>
					<%
				}
				else{
					%>
					<tr > 
					  <td width="<%=(xskd+120)%>px">
						<INPUT type="radio" name="xmflbm<%=spjrybm+xmflbm%>" value="<%=pjxmbm%>"><%=pjxm%>
					  </td>
					</tr>
					<%
				}

			}
			rs2.close();
			ps2.close();

			%> 
		  </table>
		</td>
      <%
		
		
		}
		rs1.close();
		ps1.close();

		%> </tr>
    <%

	
	
	}
	rs.close();
	ps.close();
	
%> 
  </table>

  <P><center><B>--����-��-��-�顷--</B></center>
  <table width="100%" border="0" style="FONT-SIZE:12" cellpadding="2" cellspacing="2">
	<tr bgcolor="#FFFFFF"> 
	  <td width="2%">&nbsp</td>
	  <td>
<%
	String wtbh=null;
	String wtmc=null;
	String sfkdx=null;
	String yxbz=null;
	String fbsj=null;
	ls_sql="select wtbh,wtmc,sfkdx,yxbz,fbsj ";
	ls_sql+=" from  crm_khdcwt";
	ls_sql+=" where  yxbz='Y'";
	ls_sql+=" order by wtbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		wtbh=cf.fillNull(rs.getString("wtbh"));
		wtmc=cf.fillNull(rs.getString("wtmc"));
		sfkdx=cf.fillNull(rs.getString("sfkdx"));//�Ƿ�ɶ�ѡ ,1����ѡ��2����ѡ��3��д˵��
		yxbz=cf.fillNull(rs.getString("yxbz"));
		fbsj=cf.fillNull(rs.getDate("fbsj"));

		%>
		<P><B><%=wtbh%>��<%=wtmc%></B>
		<%

		String dabh=null;
		String damc=null;
		String sfyxsm=null;
		ls_sql="select dabh,damc,sfyxsm";
		ls_sql+=" from  crm_khdcwtda";
		ls_sql+=" where  wtbh="+wtbh;
		ls_sql+=" order by dabh";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			dabh=cf.fillNull(rs1.getString("dabh"));
			damc=cf.fillNull(rs1.getString("damc"));
			sfyxsm=cf.fillNull(rs1.getString("sfyxsm"));//Y��������N��������
			
			if (sfkdx.equals("1"))//1����ѡ��2����ѡ��3��д˵��
			{
				%>
				<BR>&nbsp;&nbsp;&nbsp;&nbsp;<%=dabh%>��
				<input type="checkbox" name="wtbh<%=wtbh%>" value="<%=dabh%>">
				<%=damc%>
				<%

				if (sfyxsm.equals("Y"))
				{
					%>
					<input type="text" name="w<%=wtbh%>d<%=dabh%>" size="70" maxlength="100" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
					<%
				}
			}
			else if (sfkdx.equals("2"))
			{
				%>
				<BR>&nbsp;&nbsp;&nbsp;&nbsp;<%=dabh%>��
				<input type="radio" name="wtbh<%=wtbh%>" value="<%=dabh%>">
				<%=damc%>
				<%
				if (sfyxsm.equals("Y"))
				{
					%>
					<input type="text" name="w<%=wtbh%>d<%=dabh%>" size="70" maxlength="100" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
					<%
				}
			}
			else
			{
				%>
				<BR>&nbsp;&nbsp;&nbsp;&nbsp;<%=dabh%>��<%=damc%>
				<input type="text" name="w<%=wtbh%>d<%=dabh%>" size="70" maxlength="100" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
				<%
			}
		}
		rs1.close();
		ps1.close();

	}
	rs.close();
	ps.close();
%>
  
	</td>
	</tr>
  </table>

  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr align="center"> 
      <td colspan="14"> 
        <input type="hidden" name="khbh"  value="<%=khbh%>" >
        <input type="button"  value="����" onClick="f_do(insertform)">
        <input type="reset"  value="����" name="reset">
      </td>
    </tr>
  </table>
</form>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2 != null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
/*
	if(	javaTrim(FormName.yjdz)=="") {
		alert("������[�ʼĵ�ַ]��");
		FormName.yjdz.focus();
		return false;
	}
	if(	javaTrim(FormName.yb)=="") {
		alert("������[�ʱ�]��");
		FormName.yb.focus();
		return false;
	}
	if(	javaTrim(FormName.sjr)=="") {
		alert("������[�ռ���]��");
		FormName.sjr.focus();
		return false;
	}
	if(	javaTrim(FormName.dh)=="") {
		alert("������[�绰]��");
		FormName.dh.focus();
		return false;
	}
	if(	!radioChecked(FormName.pjxm)) {
		alert("��ѡ��[������Ŀ]��");
		FormName.pjxm[0].focus();
		return false;
	}
*/

	FormName.submit();
	return true;
}
//-->
</SCRIPT>