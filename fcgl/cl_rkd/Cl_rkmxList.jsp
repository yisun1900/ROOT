<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<html>
<head>
</head>
<%
String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String bg1="E8E8FF";
String bg2="FFFFFF";
int i=0;
int row=0;
String whererkph=request.getParameter("rkph");
String clbm=null;
String clmc=null;
String clgg=null;
String fgsdj=null;
String rksl=null;
String rkdj=null;
String rkje=null;
String cldlmc=null;
if (whererkph.equals(""))
{
	return;
}
try {
	conn=cf.getConnection();
	ls_sql="SELECT cl_rkd.rkph,cl_rkmx.clbm clbm,cl_rkmx.clmc,cl_rkmx.clgg,fgsdj,rkdj,rksl,rkje,cl_rkmx.cldlmc ";
	ls_sql+=" FROM cl_rkd,cl_rkmx,cl_jgmx,cl_clbm ";
	ls_sql+=" where cl_rkd.rkph=cl_rkmx.rkph and cl_rkd.dwbh=cl_jgmx.dwbh and cl_rkmx.clbm=cl_clbm.clbm ";
	ls_sql+=" and cl_rkmx.clbm=cl_jgmx.clbm and cl_rkd.rkph='"+whererkph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�޸���ⵥ��ϸ(�������:<%=whererkph%>)</font></B>
</CENTER>
<form method="POST" name="listform" action="">
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 15px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;<input type="hidden" name="rkph" value="<%=whererkph%>"></td>
	<td  width="5%">���</td>
	<td  width="14%">��������</td>
	<td  width="14%">���Ϲ��</td>
	<td  width="14%">���ϴ���</td>
	<td  width="10%">���ϵ���</td>
	<td  width="15%">��ⵥ��</td>
	<td  width="15%">�������</td>
</tr>
<%
	while (rs.next())
	{
		i++;
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		clgg=cf.fillNull(rs.getString("clgg"));
		fgsdj=cf.fillNull(rs.getString("fgsdj"));
		rkdj=cf.fillNull(rs.getString("rkdj"));
		rksl=cf.fillNull(rs.getString("rksl"));
		rkje=cf.fillNull(rs.getString("rkje"));
		cldlmc=cf.fillNull(rs.getString("cldlmc"));
%>
		<tr bgcolor="<%if (i%2==0){out.print(bg1);}else {out.print(bg2);}%>">
		<td align="center">
        <input name="xhbox" type="checkbox" value=<%=clbm%>>
		</td>
		<td> 
			<div align="center"><%=i%>&nbsp;
			<input type="hidden" name="clbm" value="<%=clbm%>">
			</div>
		</td>
		<td> 
			<div align="center"><%=clmc%>&nbsp;<input type="hidden" name="clmc" value="<%=clmc%>"></div>
		</td>
		<td> 
			<div align="center"><%=clgg%>&nbsp;</div>
		</td>
		<td> 
			<div align="center"><%=cldlmc%>&nbsp;</div>
		</td>
		<td> 
			<div align="center"><%=fgsdj%>&nbsp;</div>
		</td>
		<td> 
			<input type="text" name="rkdj" size="10" maxlength="50" value=<%=rkdj%> style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(rkdj[<%=(row+1)%>])" >
		</td>
		<td> 
			<input type="text" name="rksl" size="10" maxlength="50" value=<%=rksl%> style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(rksl[<%=(row+1)%>])">
		</td>
		</tr>
<%
	row++;
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<tr bgcolor="#FFFFFF"> 
      <td colspan="8" > 
	  <input type=button value='ȫѡ' onClick="cf_checkAll(listform)" >
	  <input type=button value='ɾ����ѡ����' onClick="cf_delete(listform)" >
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input type=button value=' �� �� ' onClick="cf_submit(listform)" name="sl">
      <input type="reset" value=' �� �� ' name="reset" >      </td>
    </tr>
</table>
</form>
</body>

</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--

var mark=1;
function cf_checkAll(FormName)//ת���ַ���
{
	var i = 0;
	if (<%=row%>==1){
		if (mark==0)
		{
			FormName.xhbox.checked =false
		}
		else{
			FormName.xhbox.checked =true
		}
	}
	else if (<%=row%> >1){ 
		for (i=0;i< <%=row%>;i++ ){
			if (mark==0)
			{
				FormName.xhbox[i].checked =false
			}
			else{
				FormName.xhbox[i].checked =true
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
function cf_delete(FormName)
{
	var choo=0;
	if ( confirm("ע�⣡ɾ���󲻿ɻָ���ȷʵҪɾ��������?") )	{
		var i = 0;
		if (<%=row%>==1){
			if( FormName.xhbox.checked ){
				choo=1;
			}
		} 
		else if (<%=row%>>1){ 
			for (i=0;i< <%=row%>;i++ ){
				if( FormName.xhbox[i].checked ){
					choo=1;
				}
			} 
		} 
		if (choo == 0){
			alert("��ѡ����Ҫ����������");
			return false;
		}
		else{
			FormName.target="_back";
			FormName.action="deleteclrkmx.jsp";
			FormName.submit();
			return true;
		}
	}
} 
function cf_submit(FormName)
{
	var len=<%=i%>-0;
	var m=0,val;
	if (len<=1)
	{
		valsl=FormName.rksl.value-0;
		valdj=FormName.rkdj.value-0;
//		alert(FormName.rksl.value+">>>>"+m+">>>>>"+len);
		if(	javaTrim(FormName.rksl)=="") {
			alert("���ϡ�"+FormName.clmc.value+"��"+"�����������Ϊ��!!!");
			FormName.rksl.focus();
			return false;
		}
		if (!(isFloat(FormName.rksl,"���ϡ�"+FormName.clmc.value+"��"))){
			FormName.rksl.focus();     
			return      
		   }
		if (valsl<=0)
		{
			alert("���ϡ�"+FormName.clmc.value+"��"+"�����������С�ڻ��ߵ�����!!!");
			FormName.rksl.focus(); 
			return false;
		}
		if(	javaTrim(FormName.rkdj)=="") {
			alert("���ϡ�"+FormName.clmc.value+"��"+"��ⵥ�۲���Ϊ��!!!");
			FormName.rkdj.focus();
			return false;
		}
		if (!(isFloat(FormName.rkdj,"���ϡ�"+FormName.clmc.value+"��"))){
			FormName.rkdj.focus();     
			return      
		   }
		if (valdj<=0)
		{
			alert("���ϡ�"+FormName.clmc.value+"��"+"��ⵥ�۲���С�ڻ��ߵ�����!!!");
			FormName.rkdj.focus(); 
			return false;
		}
	}
	else//���ֻ��һ����¼����ͨ���������ʽ����
	{
		for (m=0;m<len ;m++ )
		{
			valsl=FormName.rksl[m].value-0;
			valdj=FormName.rkdj[m].value-0;
	//		alert(FormName.rksl[m].value+">>>>"+m+">>>>>"+len);
			if(	javaTrim(FormName.rksl[m])=="") {
				alert("���ϡ�"+FormName.clmc[m].value+"��"+"�����������Ϊ��!!!");
				FormName.rksl[m].focus();
				return false;
			}
			if (!(isFloat(FormName.rksl[m],"��"+FormName.clmc[m].value+"��"))){
				FormName.rksl[m].focus();     
				return      
			   }
			if (valsl<=0)
			{
				alert("���ϡ�"+FormName.clmc[m].value+"��"+"�����������С�ڻ��ߵ�����!!!");
				FormName.rksl[m].focus(); 
				return false;
			}
			if(	javaTrim(FormName.rkdj[m])=="") {
				alert("���ϡ�"+FormName.clmc[m].value+"��"+"��ⵥ�۲���Ϊ��!!!");
				FormName.rkdj[m].focus();
				return false;
			}
			if (!(isFloat(FormName.rkdj[m],"��"+FormName.clmc[m].value+"��"))){
				FormName.rkdj[m].focus();     
				return      
			   }
			if (valdj<=0)
			{
				alert("���ϡ�"+FormName.clmc[m].value+"��"+"��ⵥ�۲���С�ڻ��ߵ�����!!!");
				FormName.rkdj[m].focus(); 
				return false;
			}
		}
	}
	FormName.action="updateclrkmx.jsp";
	FormName.submit();
	return true;
} 

//-->
</script>

