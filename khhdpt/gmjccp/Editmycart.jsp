<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>
<title>
��ӭʹ�������ڴ�����
</title>
<script language="javascript">
	function SearchFocus() 
	{
		form1.sl.focus();
	}          
</script>
<body onload="SearchFocus()">
<%
String yhbh=(String)session.getAttribute("khbh");//�û����
String lrr=(String)session.getAttribute("yhdlm");//�û���¼ʱ������
String zcbm=request.getParameter("zcbm");
Connection conn  = null;
PreparedStatement ps = null;
ResultSet rs = null;
String ls_sql = "";
String sfyh = null;
String jldwbm = null;
double gmsl = 0;
double gmje = 0;
double yhj = 0;
double cxj = 0;
try
{
	conn=cf.getConnection();
	ls_sql = " select sfyh,jldwbm,yhj,cxj,gmsl,gmje ";
	ls_sql += " FROM jc_zcjgb,HY_KHHDPT ";
	ls_sql += " where jc_zcjgb.zcbm=HY_KHHDPT.zcbm and HY_KHHDPT.zcbm='"+zcbm+"' and HY_KHHDPT.khbh='"+yhbh+"' ";
	//	out.println(sql);
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())                            
	{
		sfyh=cf.fillNull(rs.getString("sfyh"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		yhj=rs.getDouble("yhj");
		cxj=rs.getDouble("cxj");
		gmsl=rs.getDouble("gmsl");
		gmje=rs.getDouble("gmje");
		%>
		<form name="form1" method="post" action="savaEditmycart.jsp">
		<center>
		<font size="+2" color="red"><b>��ӭʹ�������ڴ�����<br></b></font>
		<font size="-1">˵�����޸����������������س����ߵ������ �ġ���������޸ģ�</font>
		</center>
		<table width="100%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="FONT-SIZE: 12px;border-collapse:collapse">
			<tr>
				<td>
					���ۣ�<%=yhj%>/<%=jldwbm%>
				</td>
			</tr>
			<tr>
				<td>
					�������Ʒ������
					<input name="sl" value="<%=gmsl%>" size="10" onKeyup="ss(form1);" style="border-color: #FFFFFF #FFFFFF #000000 ;border-style:solid"  onfocus="this.select()">
					�ܽ�
					<input name="zje" value="<%=gmje%>" size="10" style="border-color: #FFFFFF #FFFFFF #000000 ;border-style:solid" readonly>��Ԫ��
					<input name="yhj" type="hidden" value="<%=yhj%>" size="5">
					<input name="zcbm" type="hidden" value="<%=zcbm%>" size="5">
				</td>
			</tr>
			<tr> 
				<td colspan="4"> 
					<center>
					<input type="button" name="Submit" value="�� ��" onClick="return isValid(form1)">
					<input type="button" name="Submit2" value="�� ��" onClick="window.open('mycart.jsp'); window.close()">
					</center>
				</td>
			</tr>
		</table>
		</form>
		<%		
	}
	else {out.print("��Ʒ�����ڣ�����");}
	rs.close();
	ps.close();
}
catch (Exception e) 
{
	out.print("Exception: " + e);
	return;
}
finally 
{
	try
	{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e)
	{
		if (conn != null) cf.close(conn); 
	}
}

%>
<script language="javascript" src="/js/validate.js"></script>
<script language="javascript">
	function isValid(form)
	{
		if(	javaTrim(form.sl)=="") 
		{
		alert("�����롾��������");
		form.sl.focus();
		return false;
		}
		if (javaTrim(form.sl)=="0")
		{
			alert("������������Ϊ�㣡��������˶���������ѡ��ɾ������");
			form.zje.value="";
			form.sl.value="";
			form.sl.focus();
			return false;
		}
		form.submit();
		return true;
		}
		<!--

		//��������ѡ��Ʒ��������б�               
		function ss(form)
		{
//		alert(escape(FormName.yhdlm.value));
//		if (!(isNumber(form.sl,"��������"))){
//			form.zje.value="";
//			form.sl.value="";
//			 form.sl.select();     
//			 return      
//		   } 
//		 if (event.keyCode==48)	
//		{
//			 if (form.sl.value<1)
//			 {
//			alert("������������Ϊ���С����");
//			form.zje.value="";
//			form.sl.value="";
//			form.sl.focus();
//			return false;
//			}
//		} 
//		form.zje.value=form.sl.value*form.yhj.value;
		form.zje.value=formatDouble(form.sl.value*form.yhj.value,2);
		if (!(isFloat(form.zje,"��������")))
		{
			form.zje.value="";
			form.sl.value="";
			form.sl.select();     
			return      
		} 
		if (event.keyCode==13)	
		{
			if(	javaTrim(form.sl)=="") 
			{
				alert("�����롾��������");
				form.sl.focus();
				return false;
			}
			if (javaTrim(form.sl)=="0")
			{
				alert("������������Ϊ�㣡��������˶���������ѡ��ɾ������");
				form.zje.value="";
				form.sl.value="";
				form.sl.focus();
				return false;
			}
			form.submit();
			return true;
		}        
	}
</script>
</body>