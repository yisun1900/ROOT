<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<form method="post" action="" name="selectform" target="_blank">

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();


String sjfw=null;
String sjfw2=null;

sjfw=request.getParameter("sjfw");
sjfw2=request.getParameter("sjfw2");


String wheresql="";

String lrfgs=request.getParameter("fgs");
if (!(lrfgs.equals("")))	wheresql+=" and  (crm_zxkhxx.ssfgs='"+lrfgs+"')";

String lrdwbh=request.getParameter("dwbh");
if (lrdwbh!=null)
{
	if (!(lrdwbh.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm='"+lrdwbh+"')";
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;



int yxxxsl=0;
int fjkqsl=0;
int fjkql=0;
int mjkqsl=0;
int mjkql=0;
int hxkqsl=0;
int hxkql=0;
int yjzxsjkqsl=0;
int yjzxsjkql=0;
int ysrkqsl=0;
int ysrkql=0;
int nlkqsl=0;
int nlkql=0;
int zxfgkqsl=0;
int zxfgkql=0;
int zykqsl=0;
int zykql=0;
int yskqsl=0;
int yskql=0;
int fwlxkqsl=0;
int fwlxkql=0;

try {
	conn=cf.getConnection();

%>
<CENTER >
  <b>(ͳ��ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</b>
</CENTER>


<CENTER >
  <B>�ͻ�������������ϸ����</B>
<table border="1" width="60%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="30%">��ע��Ŀ</td>
  <td  width="20%">��ȱ����</td>
  <td  width="20%">��ȱ��</td>
  <td  width="20%">��ȱ��ϸ��ѯ</td>
</tr>
	<input type="hidden" name=sjfw value="<%=sjfw%>">
	<input type="hidden" name=sjfw2 value="<%=sjfw2%>">
	<input type="hidden" name=ssfgs value="<%=lrfgs%>">
	<input type="hidden" name=zxdm value="<%=lrdwbh%>">
<%
	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yxxxsl=rs.getInt(1);//��Ч��Ϣ�����ܼ�
	}
	rs.close();
	ps.close();

	
	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";
	ls_sql+=wheresql;

	ls_sql+=" and (fj=0 OR fj is null)";	

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fjkqsl=rs.getInt(1);//����
	}
	rs.close();
	ps.close();

	if (yxxxsl!=0)
	{
		fjkql=fjkqsl*100/yxxxsl;
	}

	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";
	ls_sql+=wheresql;

	ls_sql+=" and (fwmj=0 OR fwmj is null)";	
 
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		mjkqsl=rs.getInt(1);//���
	}
	rs.close();
	ps.close();
	if (yxxxsl!=0)
	{
		mjkql=mjkqsl*100/yxxxsl;
	}

	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";
	ls_sql+=wheresql;

	ls_sql+=" and hxbm is null";	
 
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hxkqsl=rs.getInt(1);//����
	}
	rs.close();
	ps.close();
	if (yxxxsl!=0)
	{
		hxkql=hxkqsl*100/yxxxsl;
	}

	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";
	ls_sql+=wheresql;

	ls_sql+=" and yjzxsj is null";	
 
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yjzxsjkqsl=rs.getInt(1);//Ԥ��װ��ʱ��
	}
	rs.close();
	ps.close();
	if (yxxxsl!=0)
	{
		yjzxsjkql=yjzxsjkqsl*100/yxxxsl;
	}

	
	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";
	ls_sql+=wheresql;

	ls_sql+=" and ysrbm is null";	
 
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ysrkqsl=rs.getInt(1);//������
	}
	rs.close();
	ps.close();
	if (yxxxsl!=0)
	{
		ysrkql=ysrkqsl*100/yxxxsl;
	}

	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";
	ls_sql+=wheresql;

	ls_sql+=" and nlqjbm is null";	
 
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		nlkqsl=rs.getInt(1);//��������
	}
	rs.close();
	ps.close();
	if (yxxxsl!=0)
	{
		nlkql=nlkqsl*100/yxxxsl;
	}


	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";
	ls_sql+=wheresql;

	ls_sql+=" and fgyqbm is null";	
 
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
		{
			zxfgkqsl=rs.getInt(1);//װ�޷��
		}
	rs.close();
	ps.close();
	if (yxxxsl!=0)
	{
		zxfgkql=zxfgkqsl*100/yxxxsl;
	}

	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";
	ls_sql+=wheresql;

	ls_sql+=" and zybm is null";	
 
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
		{
			zykqsl=rs.getInt(1);//����ְҵ
		}
	rs.close();
	ps.close();
	if (yxxxsl!=0)
	{
		zykql=zykqsl*100/yxxxsl;
	}

	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";
	ls_sql+=wheresql;

	ls_sql+=" and zxysbm is null";	
 
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yskqsl=rs.getInt(1);//װ��Ԥ��
	}
	rs.close();
	ps.close();
	if (yxxxsl!=0)
	{
		yskql=yskqsl*100/yxxxsl;
	}

	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";
	ls_sql+=wheresql;

	ls_sql+=" and fwlxbm is null";	
 
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fwlxkqsl=rs.getInt(1);//��������
	}
	rs.close();
	ps.close();
	if (yxxxsl!=0)
	{
		fwlxkql=fwlxkqsl*100/yxxxsl;
	}



	%>
		<tr  align="center">
		  <td>����</td>
		  <td><%=fjkqsl%></td>
		  <td><%=fjkql%>%</td>
		  <td><input type="button" name="fj" value="��ȱ��ϸ�嵥" onClick="f_do(selectform,'fj')"></td>
		</tr>
		<tr  align="center">
		  <td>���</td>
		  <td><%=mjkqsl%></td>
		  <td><%=mjkql%>%</td>
		  <td><input type="button" name="mj" value="��ȱ��ϸ�嵥" onClick="f_do(selectform,'mj')"></td>
		</tr>
		<tr  align="center">
		  <td>����</td>
		  <td><%=hxkqsl%></td>
		  <td><%=hxkql%>%</td>
		  <td><input type="button" name="hx" value="��ȱ��ϸ�嵥" onClick="f_do(selectform,'hx')"></td>
		</tr>
		<tr  align="center">
		  <td>Ԥ��װ��ʱ��</td>
		  <td><%=yjzxsjkqsl%></td>
		  <td><%=yjzxsjkql%>%</td>
		  <td><input type="button" name="yjzxsj" value="��ȱ��ϸ�嵥" onClick="f_do(selectform,'yjzxsj')"></td>
		</tr>
		<tr  align="center">
		  <td>������</td>
		  <td><%=ysrkqsl%></td>
		  <td><%=ysrkql%>%</td>
		  <td><input type="button" name="ysr" value="��ȱ��ϸ�嵥" onClick="f_do(selectform,'ysr')"></td>
		</tr>
		<tr  align="center">
		  <td>��������</td>
		  <td><%=nlkqsl%></td>
		  <td><%=nlkql%>%</td>
		  <td><input type="button" name="nl" value="��ȱ��ϸ�嵥" onClick="f_do(selectform,'nl')"></td>
		</tr>
		<tr  align="center">
		  <td>װ�޷��</td>
		  <td><%=zxfgkqsl%></td>
		  <td><%=zxfgkql%>%</td>
		  <td><input type="button" name="zxfg" value="��ȱ��ϸ�嵥" onClick="f_do(selectform,'zxfg')"></td>
		</tr>
		<tr  align="center">
		  <td>����ְҵ</td>
		  <td><%=zykqsl%></td>
		  <td><%=zykql%>%</td>
		  <td><input type="button" name="zy" value="��ȱ��ϸ�嵥" onClick="f_do(selectform,'zy')"></td>
		</tr>
		<tr  align="center">
		  <td>װ��Ԥ��</td>
		  <td><%=yskqsl%></td>
		  <td><%=yskql%>%</td>
		  <td><input type="button" name="zxys" value="��ȱ��ϸ�嵥" onClick="f_do(selectform,'zxys')"></td>
		</tr>
		<tr  align="center">
		  <td>��������</td>
		  <td><%=fwlxkqsl%></td>
		  <td><%=fwlxkql%>%</td>
		  <td><input type="button" name="fwlx" value="��ȱ��ϸ�嵥" onClick="f_do(selectform,'fwlx')"></td>
		</tr>
		<tr  align="center">
		  <td colspan="4">��Ч��Ϣ�����ܼƣ�<%=yxxxsl%></td>
		</tr>




</table>
</CENTER>


<%

}
catch (Exception e) {
	out.print("Exception: " + e);
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


</body>
</form>
</html>
<SCRIPT language=javascript >
<!--
function f_do(FormName,lx)//����FormName:Form������
{
	if (lx=='fj')
	{
		FormName.action="Crm_zxkhxxCxList_fj.jsp";
	}
	else if (lx=='mj')
	{
		FormName.action="Crm_zxkhxxCxList_mj.jsp";
	}
	else if (lx=='hx')
	{
		FormName.action="Crm_zxkhxxCxList_hx.jsp";
	}
	else if (lx=='yjzxsj')
	{
		FormName.action="Crm_zxkhxxCxList_yjzxsj.jsp";
	}
	else if (lx=='ysr')
	{
		FormName.action="Crm_zxkhxxCxList_ysr.jsp";
	}
	else if (lx=='nl')
	{
		FormName.action="Crm_zxkhxxCxList_nl.jsp";
	}
	else if (lx=='zxfg')
	{
		FormName.action="Crm_zxkhxxCxList_zxfg.jsp";
	}
	else if (lx=='zy')
	{
		FormName.action="Crm_zxkhxxCxList_zy.jsp";
	}
	else if (lx=='zxys')
	{
		FormName.action="Crm_zxkhxxCxList_zxys.jsp";
	}
	else if (lx=='fwlx')
	{
		FormName.action="Crm_zxkhxxCxList_fwlx.jsp";
	}


	FormName.submit();
	return true;
}


//-->
</SCRIPT>