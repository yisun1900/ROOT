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
PreparedStatement ps1=null;
ResultSet rs1=null;
String bg1="E8E8FF";
String bg2="FFFFFF";
int i=0;
int row=0;
String czxh=request.getParameter("czxh");
String khbh=request.getParameter("khbh");
String dwbh=request.getParameter("dwbh");
String clbm=null;
String clmc=null;
String clgg=null;
String fgsdj=null;
String gdj=null;
String sqlqsl=null;
String cldlmc=null;
String jldwmc=null;

try {
	conn=cf.getConnection();

	//��ѯ�����ڽ�ת���ڡ����ڿ������
	java.sql.Date sqjzrq=null;
	ls_sql="select max(jzrq)";
	ls_sql+=" from cl_ydjz ";
	ls_sql+=" where dwbh='"+dwbh+"' ";
	ps=conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	if (rs.next())
	{
		sqjzrq=rs.getDate(1);
	} 
	rs.close();
	ps.close();

	String sqjzph=null;
	ls_sql="select jzph";
	ls_sql+=" from cl_ydjz ";
	ls_sql+=" where dwbh='"+dwbh+"' and jzrq=?";
	ps=conn.prepareStatement(ls_sql);  
	ps.setDate(1,sqjzrq);
	rs=ps.executeQuery();
	if (rs.next())
	{
		sqjzph=rs.getString(1);
	} 
	rs.close();
	ps.close();

%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�޸Ĵ���ȯ��ϸ(�������:<%=czxh%>)</font></B>
</CENTER>
<form method="POST" name="listform" action="">
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 15px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;
	<input type="hidden" name="czxh" value="<%=czxh%>">
	<input type="hidden" name="khbh" value="<%=khbh%>"></td>
	<td  width="3%">���</td>
	<td  width="12%">��������</td>
	<td  width="12%">���Ϲ��</td>
	<td  width="12%">���ϴ���</td>
	<td  width="8%">������λ</td>
	<td  width="8%">���Ӽ�</td>
	<td  width="8%">�������</td>
	<td  width="8%">������ȡ����</td>
</tr>
<%
	ls_sql="SELECT czxh,clbm clbm,clmc,clgg,gdj,sqlqsl,cldlmc,jldwmc  ";
	ls_sql+=" FROM cl_djjmx ";
	ls_sql+=" where czxh='"+czxh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		i++;
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		clgg=cf.fillNull(rs.getString("clgg"));
		gdj=cf.fillNull(rs.getString("gdj"));
		sqlqsl=cf.fillNull(rs.getString("sqlqsl"));
		cldlmc=cf.fillNull(rs.getString("cldlmc"));
		jldwmc=cf.fillNull(rs.getString("jldwmc"));


		double sumrk=0;
		double sumck=0;
		double kcsl=0;
		double sqkcsl=0;
		ls_sql="select cl_ydjzmx.kcsl ";
		ls_sql+=" from cl_ydjzmx,cl_ydjz ";
		ls_sql+=" where cl_ydjzmx.jzph=cl_ydjz.jzph and cl_ydjz.dwbh='"+dwbh+"' and cl_ydjzmx.jzph='"+sqjzph+"' and cl_ydjzmx.clbm='"+clbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sqkcsl=rs1.getDouble("kcsl");
		}
		rs1.close();
		ps1.close();

		
		ls_sql="select nvl(sum(rksl),0)  ";
		ls_sql+=" from cl_rkmx,cl_rkd  ";
		ls_sql+=" where cl_rkd.rkph=cl_rkmx.rkph  ";
		ls_sql+=" and cl_rkd.dwbh='"+dwbh+"'  ";
		ls_sql+=" and clbm='"+clbm+"' ";
		ls_sql+=" and cl_rkd.rkzt='2' and rksj>?";//ע����㲻��������
		ps1= conn.prepareStatement(ls_sql);
		ps1.setDate(1,sqjzrq);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sumrk=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		ls_sql="select nvl(sum(cksl),0)  ";
		ls_sql+=" from cl_ckmx,cl_ckd  ";
		ls_sql+=" where cl_ckd.ckph=cl_ckmx.ckph  ";
		ls_sql+=" and cl_ckd.dwbh='"+dwbh+"' ";
		ls_sql+=" and cl_ckmx.clbm='"+clbm+"' and cl_ckmx.leixing='1' ";
		ls_sql+=" and cl_ckd.ckzt='2' and cksj>?";//ע����㲻��������
		ps1= conn.prepareStatement(ls_sql);
		ps1.setDate(1,sqjzrq);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sumck=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		kcsl=cf.doubleTrim(sqkcsl+sumrk-sumck);

%>
		<tr bgcolor="<%if (i%2==0){out.print(bg1);}else {out.print(bg2);}%>">
		<td align="center">
        <input name="xhbox" type="checkbox" value=<%=clbm%>>
		</td>
		<td> 
			<div align="center"><%=i%>&nbsp;
			<input type="hidden" name="clbm" value="<%=clbm%>">
			<input type="hidden" name="cldlmc" value="<%=cldlmc%>">
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
			<div align="center"><%=jldwmc%>&nbsp;</div>
		</td>
		<td> 
			<input type="text" name="gdj" size="8" maxlength="10" value=<%=gdj%> readonly style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(gdj[<%=(row+1)%>])" >
		</td>
		<td> <%=kcsl%></td>
		<td> 
			<input type="text" name="sqlqsl" size="8" maxlength="10" value=<%=sqlqsl%> style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(sqlqsl[<%=(row+1)%>])" >
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
      <td colspan="9" > 
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
function cf_checkAll(formName)//ת���ַ���
{
	var i = 0;
	if (<%=row%>==1){
		if (mark==0)
		{
			formName.xhbox.checked =false
		}
		else{
			formName.xhbox.checked =true
		}
	}
	else if (<%=row%> >1){ 
		for (i=0;i< <%=row%>;i++ ){
			if (mark==0)
			{
				formName.xhbox[i].checked =false
			}
			else{
				formName.xhbox[i].checked =true
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
function cf_delete(formName)
{
	var choo=0;
	if ( confirm("ע�⣡ɾ���󲻿ɻָ���ȷʵҪɾ��������?") )	{
		var i = 0;
		if (<%=row%>==1){
			if( formName.xhbox.checked ){
				choo=1;
			}
		} 
		else if (<%=row%>>1){ 
			for (i=0;i< <%=row%>;i++ ){
				if( formName.xhbox[i].checked ){
					choo=1;
				}
			} 
		} 
		if (choo == 0){
			alert("��ѡ����Ҫ����������");
			return false;
		}
		else{
			formName.action="DeleteCl_djjmx.jsp";
			formName.submit();
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
		val=FormName.gdj.value-0;
//		alert(FormName.gdj.value+">>>>"+m+">>>>>"+len);
		if(	javaTrim(FormName.gdj)=="") {
			alert("���ϡ�"+FormName.clmc.value+"��"+"���Ӽ۲���Ϊ��!!!");
			FormName.gdj.focus();
			return false;
		}
		if (!(isFloat(FormName.gdj,"���ϡ�"+FormName.clmc.value+"��"))){
			FormName.gdj.focus();     
			return      
		   }
		if (val<=0)
		{
			alert("���ϡ�"+FormName.clmc.value+"��"+"���Ӽ۲���С�ڻ��ߵ�����!!!");
			FormName.gdj.focus(); 
			return false;
		}
		val=FormName.sqlqsl.value-0;
//		alert(FormName.sqlqsl.value+">>>>"+m+">>>>>"+len);
		if(	javaTrim(FormName.sqlqsl)=="") {
			alert("���ϡ�"+FormName.clmc.value+"��"+"������ȡ��������Ϊ��!!!");
			FormName.sqlqsl.focus();
			return false;
		}
		if (!(isFloat(FormName.sqlqsl,"���ϡ�"+FormName.clmc.value+"��"))){
			FormName.sqlqsl.focus();     
			return      
		   }
		if (val<=0)
		{
			alert("���ϡ�"+FormName.clmc.value+"��"+"������ȡ��������С�ڻ��ߵ�����!!!");
			FormName.sqlqsl.focus(); 
			return false;
		}
	}
	else//���ֻ��һ����¼����ͨ���������ʽ����
	{
		for (m=0;m<len ;m++ )
		{
			val=FormName.gdj[m].value-0;
	//		alert(FormName.gdj[m].value+">>>>"+m+">>>>>"+len);
			if(	javaTrim(FormName.gdj[m])=="") {
				alert("���ϡ�"+FormName.clmc[m].value+"��"+"���Ӽ۲���Ϊ��!!!");
				FormName.gdj[m].focus();
				return false;
			}
			if (!(isFloat(FormName.gdj[m],"��"+FormName.clmc[m].value+"��"))){
				FormName.gdj[m].focus();     
				return      
			   }
			if (val<=0)
			{
				alert("���ϡ�"+FormName.clmc[m].value+"��"+"���Ӽ۲���С�ڻ��ߵ�����!!!");
				FormName.gdj[m].focus(); 
				return false;
			}
			val=FormName.sqlqsl[m].value-0;
	//		alert(FormName.sqlqsl[m].value+">>>>"+m+">>>>>"+len);
			if(	javaTrim(FormName.sqlqsl[m])=="") {
				alert("���ϡ�"+FormName.clmc[m].value+"��"+"������ȡ��������Ϊ��!!!");
				FormName.sqlqsl[m].focus();
				return false;
			}
			if (!(isFloat(FormName.sqlqsl[m],"��"+FormName.clmc[m].value+"��"))){
				FormName.sqlqsl[m].focus();     
				return      
			   }
			if (val<=0)
			{
				alert("���ϡ�"+FormName.clmc[m].value+"��"+"������ȡ��������С�ڻ��ߵ�����!!!");
				FormName.sqlqsl[m].focus(); 
				return false;
			}	
		}
	}
	FormName.action="SaveAllCl_djjmx.jsp";
	FormName.submit();
	return true;
} 

//-->
</script>

