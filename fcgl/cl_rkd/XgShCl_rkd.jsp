<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp"%>

<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=null;
String gysmc=null;
String rkr=null;
String rksj=null;
String lrr=null;
String lrsj=null;
String bz=null;
String sgph=null;
String shr=null;
String shsj=null;
String shyj=null;
String rklx=null;
String sgdmc=null;

String rkph=request.getParameter("rkph");
String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
int count=0;
int cpsl=0;
try { 
	conn=cf.getConnection();

	ls_sql=" select dwbh,gysmc,rkr,rksj,lrr,lrsj,cl_rkd.bz,sgph,shr,shsj,shyj,DECODE(rklx,'1','�»�','2','�˻�') rklx,sgdmc";
	ls_sql+=" from cl_rkd,sq_sgd ";
	ls_sql+=" where cl_rkd.sgd=sq_sgd.sgd(+) and rkph='"+rkph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		dwbh = cf.fillNull(rs.getString("dwbh"));
		gysmc = cf.fillNull(rs.getString("gysmc"));
		rkr = cf.fillNull(rs.getString("rkr"));
		rksj = cf.fillNull(rs.getDate("rksj"));
		lrr = cf.fillNull(rs.getString("lrr"));
		lrsj = cf.fillNull(rs.getDate("lrsj"));
		bz = cf.fillNull(rs.getString("bz"));
		sgph = cf.fillNull(rs.getString("sgph"));
		shr = cf.fillNull(rs.getString("shr"));
		shsj = cf.fillNull(rs.getDate("shsj"));
		shyj = cf.fillNull(rs.getString("shyj"));
		rklx = cf.fillNull(rs.getString("rklx"));
		sgdmc = cf.fillNull(rs.getString("sgdmc"));
	}
	rs.close();
	ps.close();

%>
<html>
<head>
<title>������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">


<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 15px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">���</td>
	<td  width="14%">��������</td>
	<td  width="14%">���Ϲ��</td>
	<td  width="14%">���ϴ���</td>
	<td  width="15%">��ⵥ��</td>
	<td  width="15%">�������</td>
	<td  width="15%">�����</td>
</tr>
<%
	String clbm=null;
	String clmc=null;
	String clgg=null;
	String fgsdj=null;
	String rkdj=null;
	double rksl=0;
	double rkje=0;
	String jldwmc=null;
	String cldlmc=null;
	int row=0;
	String bgcolor="E8E8FF";

	double allrkje=0;
	double allrksl=0;

	ls_sql="SELECT cl_rkmx.clbm clbm,cl_rkmx.clmc clmc,cl_rkmx.clgg clgg,jldwmc,rkdj,rksl,rkje,cldlmc ";
	ls_sql+=" FROM cl_rkmx ";
	ls_sql+=" where rkph='"+rkph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		row++;
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		clgg=cf.fillNull(rs.getString("clgg"));
		rkdj=cf.fillNull(rs.getString("rkdj"));
		rksl=rs.getDouble("rksl");
		rkje=rs.getDouble("rkje");
		jldwmc=cf.fillNull(rs.getString("jldwmc"));
		cldlmc=cf.fillNull(rs.getString("cldlmc"));

		allrkje+=rkje;
		allrksl+=rksl;

		if (row%2==0)
		{
			bgcolor="E8E8FF";
		}
		else 
		{
			bgcolor="FFFFFF";
		}

%>
		<tr align="center" bgcolor="<%=bgcolor%>">
		<td> <%=row%>
		</td>
		<td> <%=clmc%>
		</td>
		<td> <%=clgg%>
		</td>
		<td> <%=cldlmc%>
		</td>
		<td> <%=rkdj%>
		</td>
		<td> <%=rksl%> <%=jldwmc%></td>
		<td> <%=rkje%></td>
		</tr>
<%
	}
	rs.close();
	ps.close();
%>

	<tr align="center">
	<td colspan="3">�� ��</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td> <%=allrksl%></td>
	<td> <%=allrkje%></td>
	</tr>

</table>


<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">�޸����(�������:<%=rkph%>)</div> 
    </td>
  </tr>
  <tr>
	<td width="100%" > 
	<div align="center">
		<form method="post" action="" name="insertform">
			
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td width="15%" align="right">�������</td>
              <td><%=rklx%></td>
              <td width="15%" align="right"><font color="#000099">��ⵥλ</font></td>
              <td><%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��Ӧ��</div>
              </td>
              <td> <%=gysmc%> </td>
              <td width="15%"> 
                <div align="right">�˻�ʩ����</div>
              </td>
              <td><%=sgdmc%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�����</div>
              </td>
              <td> <%=rkr%> </td>
              <td width="15%"> 
                <div align="right">���ʱ��</div>
              </td>
              <td> <%=rksj%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#000099">¼����</font></div>
              </td>
              <td> <%=lrr%> </td>
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#000099">¼��ʱ��</font></div>
              </td>
              <td> <%=lrsj%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">�깺����</td>
              <td> <%=sgph%> </td>
              <td width="15%" bgcolor="#FFFFFF">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��ע</div>
              </td>
              <td colspan="3"> <%=bz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#990000">*</font><font color="#000099">�����</font></div>
              </td>
              <td> 
                <input type="text" name="shr" size="20" maxlength="13" value="<%=shr%>" readonly>
              </td>
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#990000">*</font><font color="#000099">���ʱ��</font></div>
              </td>
              <td> 
                <input type="text" name="shsj" size="20" maxlength="10" value="<%=shsj%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">������</div>
              </td>
              <td colspan="3"> 
                <textarea name="shyj" cols="71" rows="3"><%=shyj%></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="rkph" value="<%=rkph%>">
                <input type="button" name="cp" value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">
                &nbsp; </td>
            </tr>
          </table>
		</form>
	</div>
    </td>
  </tr>
</table>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	out.print("SQL=" + ls_sql);
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
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%>



<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.shr)=="") {
		alert("������[�����]��");
		FormName.shr.focus();
		return false;
	}
	if(	javaTrim(FormName.shsj)=="") {
		alert("������[���ʱ��]��");
		FormName.shsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.shsj, "���ʱ��"))) {
		return false;
	}

	FormName.action="SaveXgShCl_rkd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
