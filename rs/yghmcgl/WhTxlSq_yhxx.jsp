<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>ͨѶ¼---ά��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<form method="post" action="" name="editform" target="_blank">
<center>ͨѶ¼---ά��</center>
<table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">���</td>
	<td  width="14%">��������</td>
	<td  width="14%">С��</td>
	<td  width="6%">����</td>
	<td  width="8%">ְ��</td>
	<td  width="5%">�������</td>
	<td  width="9%">����</td>
	<td  width="16%">�ֻ�</td>
	<td  width="16%">�칫�绰</td>
	<td  width="13%">�绰�Ƿ񹫲�</td>
</tr>
<%
	String getygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String wheresql="";
	String sq_yhxx_yhmc=null;
	String ssfgs=null;
	String sq_yhxx_dwbh=null;

	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (sq_yhxx.ssfgs='"+ssfgs+"')";

	sq_yhxx_dwbh=request.getParameter("sq_yhxx_dwbh");
	if (sq_yhxx_dwbh!=null)
	{
		sq_yhxx_dwbh=cf.GB2Uni(sq_yhxx_dwbh);
		if (!(sq_yhxx_dwbh.equals("")))	wheresql+=" and  (sq_yhxx.dwbh='"+sq_yhxx_dwbh+"')";
	}
	sq_yhxx_yhmc=request.getParameter("sq_yhxx_yhmc");
	if (sq_yhxx_yhmc!=null)
	{
		sq_yhxx_yhmc=cf.GB2Uni(sq_yhxx_yhmc);
		if (!(sq_yhxx_yhmc.equals("")))	wheresql+=" and  (sq_yhxx.yhmc like '%"+sq_yhxx_yhmc+"%')";
	}



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String dwmc=null;
String xz=null;
String ygbh=null;
String bianhao=null;
String yhmc=null;
String xzzwbm=null;
String xuhao=null;
String dh=null;
String bgdh=null;
String dhsfgb=null;
String olddwmc="";

String bgcolor="";

int rownum=0;

try {
	conn=cf.getConnection();

	int row=0;

	ls_sql="SELECT a.dwmc||'��'||a.dwdh||'��' as dwmc,b.dwmc xz,sq_yhxx.xuhao,sq_yhxx.ygbh,sq_yhxx.bianhao,sq_yhxx.yhmc,xzzwbm,sq_yhxx.dh,sq_yhxx.bgdh,dhsfgb";
	ls_sql+=" FROM sq_yhxx,sq_dwxx a,sq_dwxx b ";
    ls_sql+=" where sq_yhxx.dwbh=a.dwbh  and sq_yhxx.sjsbh=b.dwbh(+)  and sq_yhxx.sfzszg not in('S','T')";
	ls_sql+=" and sq_yhxx.ygbh!=1";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and sq_yhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+getygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_yhxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+getygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order  by a.xuhao,sq_yhxx.ssfgs,a.dwbh,b.dwbh,sq_yhxx.xuhao,sq_yhxx.yhmc";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		rownum++;
		if (rownum>5000)
		{
			out.println("���󣡽�����ܴ���5000��");
			return;
		}

		dwmc=cf.fillNull(rs.getString("dwmc"));
		xz=cf.fillHtml(rs.getString("xz"));
		xuhao=cf.fillNull(rs.getString("xuhao"));
		ygbh=cf.fillNull(rs.getString("ygbh"));
		bianhao=cf.fillHtml(rs.getString("bianhao"));
		yhmc=cf.fillHtml(rs.getString("yhmc"));
		xzzwbm=cf.fillHtml(rs.getString("xzzwbm"));
		dh=cf.fillNull(rs.getString("dh"));
		bgdh=cf.fillNull(rs.getString("bgdh"));
		dhsfgb=cf.fillNull(rs.getString("dhsfgb"));

/*
		if (dwmc.equals(olddwmc))
		{
			dwmc="<font color='#0000FF'>ͬ��</font>";
		}
		else{
			olddwmc=dwmc;
		}
*/
		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%>
		<tr bgcolor="<%=bgcolor%>"  align="center"> 
			<td><%=(row+1)%></td>
			<td><%=dwmc%>
			</td>
			<td><%=xz%>
			</td>
			<td><%=yhmc%>
				<input type="hidden" name="ygbh"  value="<%=ygbh%>" >
			</td>
			<td><%=xzzwbm%></td>
			<td>
				<input type="text" name="xuhao" value="<%=xuhao%>" size="4" maxlength="8" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(bianhao[<%=row%>])">
			</td>
			<td>
				<input type="text" name="bianhao" value="<%=bianhao%>" size="10" maxlength="20" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(dh[<%=row%>])">
			</td>
			<td>
				<input type="text" name="dh" value="<%=dh%>" size="20" maxlength="50" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(bgdh[<%=row%>])">
			</td>
			<td>
				<input type="text" name="bgdh" value="<%=bgdh%>" size="20" maxlength="50" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(bianhao[<%=(row+1)%>])">
			</td>
			<td>
                <select name="dhsfgb" style="FONT-SIZE:12PX;WIDTH:72PX">
<%
	cf.selectToken(out,"1+����˾��&2+������&9+������",dhsfgb);
%>
				</select>
			</td>
		</tr>
		<%

		row++;
	}
	rs.close();
	ps.close();
	

%>
<tr bgcolor="#CCCCCC"> 
  <td colspan="9" > 
	<div align="center"> 
	  <input type="button"  value="����" onClick="f_do(editform)" name="savebutton">
	</div>
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


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{

	FormName.action="SaveWhTxlSq_yhxx.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>


