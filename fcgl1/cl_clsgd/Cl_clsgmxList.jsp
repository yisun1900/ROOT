<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String dwbh=request.getParameter("dwbh");
String wheresgph=request.getParameter("sgph");
if (wheresgph.equals(""))
{
	return;
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�޸��깺����ϸ(�깺����:<%=wheresgph%>)</font></B>
</CENTER>
<form method="POST" name="listform" action="">
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 15px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;<input type="hidden" name="sgph" value="<%=wheresgph%>"></td>
	<td  width="5%">���</td>
	<td  width="14%">��������</td>
	<td  width="14%">���Ϲ��</td>
	<td  width="10%">���ϵ���</td>
	<td  width="13%">�������</td>
	<td  width="15%">�깺����</td>
</tr>
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
String clbm=null;
String clmc=null;
String clgg=null;
String fgsdj=null;
String sgsl=null;

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

	ls_sql="SELECT cl_clsgd.sgph,cl_clsgmx.clbm clbm,clmc,clgg,fgsdj,sgsl  ";
	ls_sql+=" FROM cl_clsgd,cl_clsgmx";
	ls_sql+=" where cl_clsgd.sgph=cl_clsgmx.sgph ";
	ls_sql+=" and cl_clsgd.sgph='"+wheresgph+"'";
	ls_sql+=" order by cl_clsgmx.clbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		i++;
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		clgg=cf.fillNull(rs.getString("clgg"));
		fgsdj=cf.fillNull(rs.getString("fgsdj"));
		sgsl=cf.fillNull(rs.getString("sgsl"));


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
			</div>
		</td>
		<td> 
			<div align="center"><%=clmc%>&nbsp;<input type="hidden" name="clmc" value="<%=clmc%>"></div>
		</td>
		<td> 
			<div align="center"><%=clgg%>&nbsp;</div>
		</td>
		<td> 
			<div align="center"><%=fgsdj%>&nbsp;</div>
		</td>
		<td> 
			<div align="center"><%=kcsl%></div>
		</td>
		<td> 
			<input type="text" name="sgsl" size="14" maxlength="14" value=<%=sgsl%> style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(sgsl[<%=(row+1)%>])" >
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
      <td colspan="6" > 
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
			formName.action="deleteclsgmx.jsp";
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
		val=FormName.sgsl.value-0;
//		alert(FormName.sgsl.value+">>>>"+m+">>>>>"+len);
		if(	javaTrim(FormName.sgsl)=="") {
			alert("���ϡ�"+FormName.clmc.value+"��"+"�깺��������Ϊ��!!!");
			FormName.sgsl.focus();
			return false;
		}
		if (!(isFloat(FormName.sgsl,"���ϡ�"+FormName.clmc.value+"��"))){
			FormName.sgsl.focus();     
			return      
		   }
		if (val<=0)
		{
			alert("���ϡ�"+FormName.clmc.value+"��"+"�깺��������С�ڻ��ߵ�����!!!");
			FormName.sgsl.focus(); 
			return false;
		}
	}
	else//���ֻ��һ����¼����ͨ���������ʽ����
	{
		for (m=0;m<len ;m++ )
		{
			val=FormName.sgsl[m].value-0;
	//		alert(FormName.sgsl[m].value+">>>>"+m+">>>>>"+len);
			if(	javaTrim(FormName.sgsl[m])=="") {
				alert("���ϡ�"+FormName.clmc[m].value+"��"+"�깺��������Ϊ��!!!");
				FormName.sgsl[m].focus();
				return false;
			}
			if (!(isFloat(FormName.sgsl[m],"��"+FormName.clmc[m].value+"��"))){
				FormName.sgsl[m].focus();     
				return      
			   }
			if (val<=0)
			{
				alert("���ϡ�"+FormName.clmc[m].value+"��"+"�깺��������С�ڻ��ߵ�����!!!");
				FormName.sgsl[m].focus(); 
				return false;
			}	
		}
	}
	FormName.action="updateclsgmx.jsp";
	FormName.submit();
	return true;
} 

//-->
</script>

