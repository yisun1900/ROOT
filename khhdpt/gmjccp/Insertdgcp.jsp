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
double yhj = 0;
double cxj = 0;
String today;
try{
	conn=cf.getConnection();
	ls_sql = " select * from HY_KHHDPT where khbh='"+yhbh+"' and zcbm='"+zcbm+"' and khwjbz='N' ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())                            
		{%>
		<script language="javascript">
		alert("���Ѿ������˴˲�Ʒ��");
//	    return;
		window.close()
		</script>
		<%}
	else{
		try{
			conn=cf.getConnection();
			ls_sql = " select sfyh,jldwbm,yhj,cxj,to_char(sysdate,'yyyy-mm-dd') today ";
			ls_sql += " FROM jc_zcjgb ";
			ls_sql += " where zcbm='"+zcbm+"' ";
//			out.println(sql);
			ps= conn.prepareStatement(ls_sql);
			rs=ps.executeQuery();
			if (rs.next())                            
			{
				sfyh=cf.fillNull(rs.getString("sfyh"));
				jldwbm=cf.fillNull(rs.getString("jldwbm"));
				yhj=rs.getDouble("yhj");
				cxj=rs.getDouble("cxj");
				today=cf.fillNull(rs.getString("today"));
				if (sfyh.equals("Y"))
				{
					if (cxj !=0)
						yhj = cxj;
					%>
					<form name="form1" method="post" action="savaInsertdgcp.jsp">
					<center>
					<font size="+2" color="red"><b>��ӭʹ�������ڴ�����<br>
					</b></font>
					<font size="-1">˵����������Ҫ�������������س����ߵ�������϶�����������ɶ�����</font>
					</center>
					<table width="100%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="FONT-SIZE: 12px;border-collapse:collapse">
						<tr>
							<td>
								��&nbsp;&nbsp;&nbsp;&nbsp;�ۣ� 
								<input name="dj" value="<%=yhj%>/<%=jldwbm%>" size="10" style="border-color: #FFFFFF #FFFFFF #000000 ;border-style:solid" readonly>
								|| �������ڣ�
								<input name="dgrq" value="<%=today%>" size="10" style="border-color: #FFFFFF #FFFFFF #000000 ;border-style:solid" readonly>
							</td>
						</tr>
						<tr>
							<td>
								����������
								<input name="sl" value="" size="10" onKeyup="ss(form1);" style="border-color: #FFFFFF #FFFFFF #000000 ;border-style:solid">
								|| ��&nbsp;��&nbsp;�
								<input name="zje" value="" size="10" style="border-color: #FFFFFF #FFFFFF #000000 ;border-style:solid" readonly>��Ԫ��
								<input name="yhj" type="hidden" value="<%=yhj%>" size="5">
								<input name="zcbm" type="hidden" value="<%=zcbm%>" size="5">
							</td>
						</tr>
						<tr> 
							<td colspan="4"> 
								<center>
								<input type="button" name="Submit" value="���϶���" onClick="return isValid(form1)">
								<input type="button" name="Submit2" value="һ����˵" onClick="window.close()">
								</center>
							</td>
						</tr>
					</table>
					</form>
				<%}
				else {out.print("��Ǹ��ʱû����");}
			}
			else {out.print("��Ʒ�����ڣ�����");}
			rs.close();
			ps.close();
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
					if (conn != null) cf.close(conn); 
				}
				catch (Exception e){
					if (conn != null) cf.close(conn); 
				}
			}
	}
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
		%>
<script language="javascript" src="/js/validate.js"></script>
<script language="javascript">
function isValid(form)
{
	if(	javaTrim(form.sl)=="") {
		alert("�����롾��������");
		form.sl.focus();
		return false;
	}
	if (javaTrim(form.sl)=="0")
		{
		alert("������������Ϊ�㣡");
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
//	if (!(isFloat(form.sl,"��������"))){
//		form.zje.value="";
//		form.sl.value="";
//		 form.sl.select();     
//		 return      
//	   } 
//	 if (event.keyCode==48)	
//	{
//		 if (form.sl.value<1)
//		 {
//		alert("������������Ϊ���С����");
//		form.zje.value="";
//		form.sl.value="";
//		form.sl.focus();
//		return false;
//		}
//	}    
//	form.zje.value=parseInt(form.sl.value*form.yhj.value*100+0.5)/100;
    form.zje.value=formatDouble(form.sl.value*form.yhj.value,2);
	if (!(isFloat(form.zje,"��������"))){
		form.zje.value="";
		form.sl.value="";
		form.sl.select();     
		return      
	   } 
	if (event.keyCode==13)	
	{
		if(	javaTrim(form.sl)=="") {
		alert("�����롾��������");
		form.sl.focus();
		return false;
		}
		if (javaTrim(form.sl)=="0")
		{
		alert("������������Ϊ�㣡");
		form.zje.value="";
		form.sl.value="";
		form.sl.focus();
		return false;
		}
		form.submit();
		return true;
	}        
}
// <img src=../images/ann.gif> 
</script>
</body>